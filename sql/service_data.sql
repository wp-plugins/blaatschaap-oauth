SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `wp_bs_oauth_services_known`;
CREATE TABLE IF NOT EXISTS `wp_bs_oauth_services_known` (
  `service_known_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` text,
  `oauth_version` enum('1.0','1.0a','2.0') DEFAULT '2.0',
  `request_token_url` text,
  `dialog_url` text NOT NULL,
  `access_token_url` text NOT NULL,
  `userinfo_url` text NOT NULL,
  `signup_for_app_url` text NOT NULL,
  `url_parameters` tinyint(1) DEFAULT '0',
  `authorization_header` tinyint(1) DEFAULT '1',
  `append_state_to_redirect_uri` text,
  `pin_dialog_url` text,
  `offline_dialog_url` text,
  `default_icon` text,
  `variant` text,
  `userinfo_api_known_id` int(11) NOT NULL,
  PRIMARY KEY (`service_known_id`),
  KEY `service_name` (`service_name`(255))
);

INSERT INTO `wp_bs_oauth_services_known` (`service_known_id`, `service_name`, `oauth_version`, `request_token_url`, `dialog_url`, `access_token_url`, `userinfo_url`, `signup_for_app_url`, `url_parameters`, `authorization_header`, `append_state_to_redirect_uri`, `pin_dialog_url`, `offline_dialog_url`, `default_icon`, `variant`, `userinfo_api_known_id`) VALUES
(1, 'Google', '2.0', NULL, 'https://accounts.google.com/o/oauth2/auth?response_type=code&client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}&scope={SCOPE}&state={STATE}', 'https://accounts.google.com/o/oauth2/token', 'https://www.googleapis.com/oauth2/v3/userinfo', 'http://code.google.com/apis/console', 0, 1, NULL, NULL, 'https://accounts.google.com/o/oauth2/auth?response_type=code&client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}&scope={SCOPE}&state={STATE}&access_type=offline&approval_prompt=force', 'google.png', NULL, 1),
(2, 'Facebook', '2.0', NULL, 'https://www.facebook.com/dialog/oauth?client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}&scope={SCOPE}&state={STATE}', 'https://graph.facebook.com/oauth/access_token', 'https://graph.facebook.com/me', 'https://developers.facebook.com/apps', 0, 1, NULL, NULL, NULL, 'facebook.png', NULL, 2),
(3, 'Twitter', '1.0a', 'https://api.twitter.com/oauth/request_token', 'https://api.twitter.com/oauth/authenticate', 'https://api.twitter.com/oauth/access_token', 'https://api.twitter.com/1.1/account/verify_credentials.json', 'https://dev.twitter.com/apps/new', 0, 1, NULL, NULL, NULL, 'twitter.png', NULL, 3),
(4, 'Microsoft', '2.0', NULL, 'https://login.live.com/oauth20_authorize.srf?client_id={CLIENT_ID}&scope={SCOPE}&response_type=code&redirect_uri={REDIRECT_URI}&state={STATE}', 'https://login.live.com/oauth20_token.srf', 'https://apis.live.net/v5.0/me', 'https://manage.dev.live.com/AddApplication.aspx', 0, 1, NULL, NULL, NULL, 'microsoft.png', NULL, 4),
(5, 'github', '2.0', NULL, 'https://github.com/login/oauth/authorize?client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}&scope={SCOPE}&state={STATE}', 'https://github.com/login/oauth/access_token', 'https://api.github.com/user', 'https://github.com/settings/applications/new', 0, 1, NULL, NULL, NULL, 'github.png', NULL, 5),
(6, 'LinkedIn', '1.0a', 'https://api.linkedin.com/uas/oauth/requestToken?scope={SCOPE}', 'https://api.linkedin.com/uas/oauth/authenticate', 'https://api.linkedin.com/uas/oauth/accessToken', 'https://api.linkedin.com/v1/people/~', 'https://www.linkedin.com/secure/developer?newapp=', 1, 1, NULL, NULL, NULL, 'linkedin.png', 'OAuth 1.0a', 6);

DROP TABLE IF EXISTS `wp_bs_oauth_userinfo_api_known`;
CREATE TABLE IF NOT EXISTS `wp_bs_oauth_userinfo_api_known` (
  `userinfo_api_known_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` text,
  `data_format` enum('FORM','JSON','XML') DEFAULT 'JSON',
  `first_name` text,
  `last_name` text,
  `user_email` text,
  `user_url` text,
  `user_nicename` text,
  `user_login` text,
  `request_method` enum('GET','POST') DEFAULT 'GET',
  `external_id` text,
  `scope` text,
  `email_verified` text,
  PRIMARY KEY (`userinfo_api_known_id`)
);

INSERT INTO `wp_bs_oauth_userinfo_api_known` (`userinfo_api_known_id`, `api_name`, `data_format`, `first_name`, `last_name`, `user_email`, `user_url`, `user_nicename`, `user_login`, `request_method`, `external_id`, `scope`, `email_verified`) VALUES
(1, 'OpenID Connect userinfo endpoint', 'JSON', 'given_name', 'family_name', 'email', 'profile', 'name', 'preferred_username', 'POST', 'sub', 'openid profile email', 'email_verified'),
(2, 'Facebook Graph /me eindpoint', 'JSON', 'first_name', 'last_name', 'email', 'link', 'name', NULL, 'GET', 'id', 'public_profile,email', NULL),
(3, 'Twitter account/verify_credentials', 'JSON', NULL, NULL, NULL, 'url', 'name', 'screen_name', 'GET', 'id', NULL, NULL),
(4, 'Microsoft Live Connect', 'JSON', 'first_name', 'last_name', NULL, NULL, 'name', NULL, 'GET', 'id', 'wl.basic wl.emails  wl.signin', NULL),
(5, 'Github API v3', 'JSON', NULL, NULL, 'email', 'url', 'name', 'login', 'GET', 'id', NULL, NULL),
(6, 'LinkedIn API', 'JSON', 'firstName', 'lastName', NULL, NULL, NULL, NULL, 'GET', 'id', NULL, NULL);
