#encoding : utf-8
Admin.create! do |user|
  user.password = "bitwinadmin"
  user.password_confirmation = "bitwinadmin"
  user.email = "admin@bitwin.co"
  user.skip_captcha = true
  user.confirmed_at = DateTime.now
end

# puts "Created \"admin@localhost.local\" user with password \"password\""

operation = Operation.create
%w{test1@bitwin.co test2@bitwin.co test3@bitwin.co}.each do |email|
	User.create! do |user|
		user.password = "testtest"
		user.password_confirmation = "testtest"
		user.email = email
		user.confirmed_at = DateTime.now
	end
  AccountOperation::CURRENCIES.each do |currency|
    ap = AccountOperation.create({
                  amount: 100000,
                  currency: currency
      })
    ap.account = User.find_by_email(email)
    ap.operation = operation
    if ap.save!
      puts '充值成功！'
    end
  end
end
