Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7848560B8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 12:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681590.1060435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZY9-0003ik-8W; Thu, 15 Feb 2024 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681590.1060435; Thu, 15 Feb 2024 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZY9-0003gH-5L; Thu, 15 Feb 2024 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 681590;
 Thu, 15 Feb 2024 11:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raZY7-0003gB-J5
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 11:05:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10407673-cbf2-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 12:05:01 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4122acb7e69so554385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 03:05:01 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 9-20020a05600c228900b004101543e843sm4700250wmf.10.2024.02.15.03.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 03:05:00 -0800 (PST)
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
X-Inumbo-ID: 10407673-cbf2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707995100; x=1708599900; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UddCV46kuNNdWajC1SL/Sy6nZE0RVb+/eMdE9LCfAXE=;
        b=MeDT8cKnzRDPr6vsUTE5ueDpU7eDZd3KSqQnukhlUmCluYfDrn7rEmAQ4nTkmBCb6z
         i780lAa86yu3kwjUj8kWqguhb2S2a0G7FVwH0OXb2KqJL9hdF5J4kF/6RZbc4a+Lw/uF
         lnYbxOYIjrkfb3JiLM9cY4AMAwuQKikNP0Y/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707995100; x=1708599900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UddCV46kuNNdWajC1SL/Sy6nZE0RVb+/eMdE9LCfAXE=;
        b=sdTJa9QXZcYz/1iRZJb48qYbZtRBH9dXM6rA0a0FKhwCR2Mebg/QljMtvh6rtH0GES
         mCl3LuWEpGLTLXjJm9AXJnndiWmz87tBaj6mNmTInfzL5HKhfoUzRxJvRVqGGk/4Aus4
         bFjj+pRAhjRY0BX6K/P5SB36VwjzKNL48EQo/xCoWExM3x2e3+BiRmIZN3/HSdEKHxaY
         YMsOzG6008rMAIRNQv3BWQ+Jm2MIaxlQmCfiTu48nqv/2IzRaRND46b0c3hw1HtlpmzW
         F3sTjzW46JyLAbBX8WmKfwaonN9DQM5iHKHCRFZM+4IdxQEiDhwPKU02uEzk1iBdLtX0
         bY6A==
X-Forwarded-Encrypted: i=1; AJvYcCUZWVzl9F/ViH0o6eZm53YI1rek5TcqyJ4coLqCAYhVxu/glzzoT93j6hXoGL1KHuGrGfezswZJi0u76AxFHMxQBy1+tDKsiwFkYEy1nTw=
X-Gm-Message-State: AOJu0Yy2154fWjvErivPZPBzpUvwaqKPTk7SGCrbpWey2ji9bKdnKlYF
	INw1Wgnc18X7mmYCmDse+wcNeBn2uzz4UO3ZXvx8z2zgkx73HRTc6C0zUYaSsfo=
X-Google-Smtp-Source: AGHT+IEmTJUydTlvGo5b0tFvnER9wyNTG0q9bqfEtFmuRvI0BMnaljMMs2DxCxDM5FOu+59whvODRw==
X-Received: by 2002:a05:600c:a386:b0:411:ee70:ed5c with SMTP id hn6-20020a05600ca38600b00411ee70ed5cmr1086443wmb.12.1707995100543;
        Thu, 15 Feb 2024 03:05:00 -0800 (PST)
Date: Thu, 15 Feb 2024 12:04:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc3v20RKMssbaDsl@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
 <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>

On Thu, Feb 15, 2024 at 11:43:02AM +0100, Jan Beulich wrote:
> On 15.02.2024 11:28, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 10:49:31AM +0100, Jan Beulich wrote:
> >> On 15.02.2024 10:30, Roger Pau Monne wrote:
> >>> --- a/xen/Makefile
> >>> +++ b/xen/Makefile
> >>> @@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
> >>>  else # !config-build
> >>>  
> >>>  ifeq ($(need-config),y)
> >>> --include include/config/auto.conf
> >>>  # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
> >>>  # changes are detected.
> >>>  -include include/config/auto.conf.cmd
> >>> +include include/config/auto.conf
> >>
> >> With the - dropped, ...
> >>
> >>> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
> >>>  # This exploits the 'multi-target pattern rule' trick.
> >>>  # The syncconfig should be executed only once to make all the targets.
> >>>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> >>> +	rm -rf include/config/$*.conf
> >>>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
> >>
> >> ... is this really necessary? The error status from the sub-make is ignored
> >> only because of the -, isn't it?
> > 
> > Without the `rm` the include/config/auto.conf is not removed by
> > Kconfig on error, so the include will still succeed but use the stale
> > auto.conf file.
> > 
> > Keep in mind on rebuilds include/config/auto.conf is already present,
> > so the rule is only executed for the include/config/auto.conf.cmd
> > target.
> 
> But the sub-make ought to return failure, which ought to then stop the
> build process?

For some reason it doesn't, not at least with GNU Make 4.3.

It stops the build if the '-' is dropped from the include of
include/config/auto.conf.cmd.  But that will always fail as
include/config/auto.conf.cmd is never created.

Maybe there's something weird with our makefile, I certainly don't
know that much, but as noted in the commit message,
include/config/auto.conf.cmd failing doesn't cause the build to
stop.

> >> I also don't really follow the need to re-order the include-s above. Their
> >> ordering ought to be benign, as per make's doc stating "If an included
> >> makefile cannot be found in any of these directories it is not an
> >> immediately fatal error; processing of the makefile containing the include
> >> continues." While the description talks about this, I'm afraid I don't
> >> really understand "... the .cmd target is executed before including ...":
> >> What .cmd target are you talking about there?
> > 
> > Without the reordering the include of include/config/auto.conf will
> > always succeed on rebuilds, because the include is done before
> > executing the include/config/%.conf.cmd target that does the `rm`.
> 
> That's a dual target: It also handles include/config/%.conf. I.e.
> because of this ...
> 
> > With the current order the include of include/config/%.conf.cmd that
> > triggers the re-build of auto.conf happens after having included the
> > file already.
> 
> ... either include would trigger this same rule. IOW I'm afraid I'm still
> not seeing what is gained by the re-ordering. I'm also unconvinced that
> "triggers" in the sense you use it is actually applicable. Quoting make
> doc again: "Once it has finished reading makefiles, make will try to
> remake any that are out of date or don’t exist." To me this means that
> first all makefile reading will finish, and then whichever included files
> need re-making will be re-made.

Without the re-ordering the execution is not stopped on failure to
generate include/config/auto.conf:

# gmake -j8 xen clang=y
gmake -C xen install
gmake[1]: Entering directory '/root/src/xen/xen'
rm -rf include/config/auto.conf
tools/kconfig/conf  --syncconfig Kconfig
common/Kconfig:2: syntax error
common/Kconfig:1: invalid statement
gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
gmake[1]: Failed to remake makefile 'include/config/auto.conf'.
  UPD     include/xen/compile.h
 Xen 4.19-unstable
gmake[3]: Nothing to be done for 'all'.
[...]

With the re-ordering:

# gmake -j8 xen clang=y
gmake -C xen install
gmake[1]: Entering directory '/root/src/xen/xen'
rm -rf include/config/auto.conf
tools/kconfig/conf  --syncconfig Kconfig
common/Kconfig:2: syntax error
common/Kconfig:1: invalid statement
gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
gmake[1]: *** [Makefile:379: include/config/auto.conf] Error 2
gmake[1]: Leaving directory '/root/src/xen/xen'
gmake: *** [Makefile:143: install-xen] Error 2
#

So the re-ordering is meaningful.

Thanks, Roger.

