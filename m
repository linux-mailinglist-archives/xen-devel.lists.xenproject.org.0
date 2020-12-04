Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6222CEC84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 11:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44402.79535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8iH-0005CR-RT; Fri, 04 Dec 2020 10:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44402.79535; Fri, 04 Dec 2020 10:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8iH-0005C6-OO; Fri, 04 Dec 2020 10:53:21 +0000
Received: by outflank-mailman (input) for mailman id 44402;
 Fri, 04 Dec 2020 10:53:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl8iF-0005C1-Vu
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 10:53:20 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 958110ef-801b-4468-9d9e-f79f041726f2;
 Fri, 04 Dec 2020 10:53:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t4so4844130wrr.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 02:53:18 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r13sm3030550wrs.6.2020.12.04.02.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:53:17 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 958110ef-801b-4468-9d9e-f79f041726f2
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uQVdkYfHNmtLMlE+KpMivvufuNn5EMB4OSxsZFd4cMA=;
        b=WulgdPABbI6GNTSWmlZf9bAiWJ89Zl2f0l3t0wfeMEz9krAa2S+wZkzAJi1VHWSIDF
         hDhC3yEfiiQ6toC5uLCSL7DHXoc9AMO6dSOURw4Wtb4cn0FAgZ0T5m5wJ/kxoFqdU8+m
         m211p7LeO/dztVhXZgWaxYA8VGrKXWCGz86HWsd0jQ+IwbXo9xQkkbpvtWN+d9/NTETT
         2pNu1APkPa9LuzQDRuoWtVEqjQg+O7Ts++1R1R/1wXBjGj6bqyqjWXN8JHCuxvkGxFSk
         85/WQqfWBJ+Y1MLF7a2rtLo2zGKnhtU2u3iAgPdedt97QA1aIsOwSqbWgu7pbd7RzcVp
         udOQ==
X-Gm-Message-State: AOAM532eGRJtoDdsbLeD0vqJI+FCwn0wlPdWgIw4LmUjv5DaNDNlaeeP
	YpDYbsnZf5yFFsmoNOehooT0PkTiaws=
X-Google-Smtp-Source: ABdhPJxqVxeVy9f+z5qTImPPfxnJ1XkmFGTO6UgolkCnxdeBr/4sbys6x96TUUYCI4+jr8D6JM5fmQ==
X-Received: by 2002:adf:f84b:: with SMTP id d11mr4263796wrq.216.1607079197879;
        Fri, 04 Dec 2020 02:53:17 -0800 (PST)
Date: Fri, 4 Dec 2020 10:53:15 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd arguments
Message-ID: <20201204105315.avponbzbotrabf4c@liuwe-devbox-debian-v2>
References: <20201203063436.4503-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203063436.4503-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 07:34:36AM +0100, Olaf Hering wrote:
> Currently the arguments for xenwatchdogd are hardcoded with 15s
> keep-alive interval and 30s timeout.
> 
> It is not possible to tweak these values via
> /etc/systemd/system/xen-watchdog.service.d/*.conf because ExecStart
> can not be replaced. The only option would be a private copy
> /etc/systemd/system/xen-watchdog.service, which may get out of sync
> with the Xen provided xen-watchdog.service.
> 
> Adjust the service file to recognize XENWATCHDOGD_ARGS= in a
> private unit configuration file.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
> 
> v2: fix "test -n" in init.d
> 
>  tools/hotplug/Linux/init.d/xen-watchdog.in          | 7 ++++++-
>  tools/hotplug/Linux/systemd/xen-watchdog.service.in | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/hotplug/Linux/init.d/xen-watchdog.in b/tools/hotplug/Linux/init.d/xen-watchdog.in
> index c05f1f6b6a..b36a94bd8e 100644
> --- a/tools/hotplug/Linux/init.d/xen-watchdog.in
> +++ b/tools/hotplug/Linux/init.d/xen-watchdog.in
> @@ -19,6 +19,11 @@
>  
>  . @XEN_SCRIPT_DIR@/hotplugpath.sh
>  
> +xencommons_config=@CONFIG_DIR@/@CONFIG_LEAF_DIR@
> +
> +test -f $xencommons_config/xencommons && . $xencommons_config/xencommons
> +
> +test -n "$XENWATCHDOGD_ARGS" || XENWATCHDOGD_ARGS='15 30'
>  DAEMON=${sbindir}/xenwatchdogd
>  base=$(basename $DAEMON)
>  
> @@ -46,7 +51,7 @@ start() {
>  	local r
>  	echo -n $"Starting domain watchdog daemon: "
>  
> -	$DAEMON 30 15
> +	$DAEMON $XENWATCHDOGD_ARGS

Did you accidentally swap 15 and 30 in XENWATCHDOGD_ARGS above? I see no
reasoning in the commit message for this change.

No need to resend.  I can fix it for you. But please confirm if that's a
mistake.

Wei.

>  	r=$?
>  	[ "$r" -eq 0 ] && success $"$base startup" || failure $"$base startup"
>  	echo
> diff --git a/tools/hotplug/Linux/systemd/xen-watchdog.service.in b/tools/hotplug/Linux/systemd/xen-watchdog.service.in
> index 1eecd2a616..637ab7fd7f 100644
> --- a/tools/hotplug/Linux/systemd/xen-watchdog.service.in
> +++ b/tools/hotplug/Linux/systemd/xen-watchdog.service.in
> @@ -6,7 +6,9 @@ ConditionPathExists=/proc/xen/capabilities
>  
>  [Service]
>  Type=forking
> -ExecStart=@sbindir@/xenwatchdogd 30 15
> +Environment="XENWATCHDOGD_ARGS=30 15"
> +EnvironmentFile=-@CONFIG_DIR@/@CONFIG_LEAF_DIR@/xencommons
> +ExecStart=@sbindir@/xenwatchdogd $XENWATCHDOGD_ARGS
>  KillSignal=USR1
>  
>  [Install]

