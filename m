Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB1855F27
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681558.1060386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYz5-0000hD-I3; Thu, 15 Feb 2024 10:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681558.1060386; Thu, 15 Feb 2024 10:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYz5-0000fG-Em; Thu, 15 Feb 2024 10:28:51 +0000
Received: by outflank-mailman (input) for mailman id 681558;
 Thu, 15 Feb 2024 10:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raYz3-0000ep-Ul
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:28:49 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0185dcb0-cbed-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:28:48 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5116ec49081so791126e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:28:48 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t12-20020ac865cc000000b0042daffe1891sm441068qto.65.2024.02.15.02.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 02:28:48 -0800 (PST)
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
X-Inumbo-ID: 0185dcb0-cbed-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707992928; x=1708597728; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nK1ys8njevLp372pDNOR9Z5Y0d+20KDJN8o8tshql0=;
        b=K8WjvPl4qCVy0SheKigAsryCBR3Z28y60vNJ0OuK+vcr0iFvJhqHoEt1OmYz0HHwQ7
         rPY4AjckCln5SUrEZm+pE42C9tVZfpeDXSFyr9SIOEmPHpcB3Vs9PJfNMXdvYyKOGgun
         qhKQAyOFAMtEXBSWx9m5zGE3WYieui5VaA7Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992928; x=1708597728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nK1ys8njevLp372pDNOR9Z5Y0d+20KDJN8o8tshql0=;
        b=ehQxGu4X1Rjmc7hSFE9JKZLukYZ6Omvd+iVy4hjmZvQr2EBBttpO0B2DNSE5pClOMW
         W9SggMzxdON/GtnVo6pVKDMY4nzZCxaCSqOn2Kx5cjBnqeWRwfYmVtZkF4Sj3Loom0iH
         UpcgBDVV48pUYx3n5vh3IRfarwWAw5N1LGIcmWz6H+uNhKuNcLiXD4YEPK+EvRhZx3PO
         04mC3/NPeiiev74mj2BltGFNhOzktzfoSpxbis7lv5kDgBMyXkM2ZBJnLxd/uegzvo6C
         ASpgdrCOIMML6PwgVVWuIuPoM6c8np9XRFYu8W4Txw/sOObw2FpXrx/zrlXydey+ocmY
         q25g==
X-Forwarded-Encrypted: i=1; AJvYcCVScO6aenn8J+Jl9eRKDe+YuLywx2TqcFxZezsCM+aMYF7qESezQ8spHOrbNfew835ZBReohDW0y6UfkPr9SuIcBXBMZJSNaJ/FoRz4Sp4=
X-Gm-Message-State: AOJu0Yx6qnWve3a1MmwEnXr8SedvtXz41WmuujS66YAd6K8sYaiD3mQ7
	EzHZSC1NqOWPIHKjR1ttUoUgCLiVEfTXT+Fi/mJSRDlKXUu5OmSgtS+153g76gEBcoi8W0jBs0o
	K
X-Google-Smtp-Source: AGHT+IEVYKXD4oOBA5TSTmb48XtQsRPvlYPkKyzuQtJq42Ay4/IRnxQmGTFQyUlSc4cdlpRxZpkt4A==
X-Received: by 2002:a05:6512:1024:b0:512:8881:8f6b with SMTP id r4-20020a056512102400b0051288818f6bmr928428lfr.36.1707992928418;
        Thu, 15 Feb 2024 02:28:48 -0800 (PST)
Date: Thu, 15 Feb 2024 11:28:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc3nXpUOlnIHEfsl@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>

On Thu, Feb 15, 2024 at 10:49:31AM +0100, Jan Beulich wrote:
> On 15.02.2024 10:30, Roger Pau Monne wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
> >  else # !config-build
> >  
> >  ifeq ($(need-config),y)
> > --include include/config/auto.conf
> >  # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
> >  # changes are detected.
> >  -include include/config/auto.conf.cmd
> > +include include/config/auto.conf
> 
> With the - dropped, ...
> 
> > @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
> >  # This exploits the 'multi-target pattern rule' trick.
> >  # The syncconfig should be executed only once to make all the targets.
> >  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> > +	rm -rf include/config/$*.conf
> >  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
> 
> ... is this really necessary? The error status from the sub-make is ignored
> only because of the -, isn't it?

Without the `rm` the include/config/auto.conf is not removed by
Kconfig on error, so the include will still succeed but use the stale
auto.conf file.

Keep in mind on rebuilds include/config/auto.conf is already present,
so the rule is only executed for the include/config/auto.conf.cmd
target.

> 
> I also don't really follow the need to re-order the include-s above. Their
> ordering ought to be benign, as per make's doc stating "If an included
> makefile cannot be found in any of these directories it is not an
> immediately fatal error; processing of the makefile containing the include
> continues." While the description talks about this, I'm afraid I don't
> really understand "... the .cmd target is executed before including ...":
> What .cmd target are you talking about there?

Without the reordering the include of include/config/auto.conf will
always succeed on rebuilds, because the include is done before
executing the include/config/%.conf.cmd target that does the `rm`.

With the current order the include of include/config/%.conf.cmd that
triggers the re-build of auto.conf happens after having included the
file already.

Thanks, Roger.

