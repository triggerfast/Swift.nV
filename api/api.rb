require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-timestamps'
require 'dm-migrations'
require 'dm-serializer'
require 'bcrypt'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/api.db")

before do
	headers "Content-Type" => "application/json; charset=utf-8"	
end

# load all libraries
configure do
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| 
    require File.basename(lib, '.*') 
  }
end

DataMapper.auto_upgrade!