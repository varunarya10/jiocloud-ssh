class ssh::client::config inherits ssh { 
  file { $ssh::params::ssh_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/ssh_config.erb"),
    require => Class['ssh::client::install'],
  }

  # Workaround for http://projects.reductivelabs.com/issues/2014
  file { $ssh::params::ssh_known_hosts:
    mode => '0644',
  }
}
