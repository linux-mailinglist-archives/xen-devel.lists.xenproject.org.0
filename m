Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3A8568EB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681904.1060910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeHe-00042l-6V; Thu, 15 Feb 2024 16:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681904.1060910; Thu, 15 Feb 2024 16:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeHe-0003zf-35; Thu, 15 Feb 2024 16:08:22 +0000
Received: by outflank-mailman (input) for mailman id 681904;
 Thu, 15 Feb 2024 16:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raeHd-0003YH-4U
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:08:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ffe75e7-cc1c-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 17:08:20 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5128d914604so361252e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:08:20 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac87f4b000000b0042c7f378ed0sm670419qtk.63.2024.02.15.08.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 08:08:19 -0800 (PST)
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
X-Inumbo-ID: 6ffe75e7-cc1c-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708013300; x=1708618100; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TG+wZCK2zcpJnQyGb0Dsyl/46ykMFXe9qhKtUhuqKw4=;
        b=B96oNeFPShRQL5/cmU9kt6Fo+CQatdalzMiLPnFB6P5o3VCALQ11XGycsQ3jeafPwF
         1qAWmpUq1u2cDHLPqbQe316IPrVjL2IE+efvYRDSGawt5PcEWNSSip2PUv7Mxl8S/IvF
         W1n9UIanwXXWgzdMLXimLD82MWdFc6MZp9FJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013300; x=1708618100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TG+wZCK2zcpJnQyGb0Dsyl/46ykMFXe9qhKtUhuqKw4=;
        b=Ov3Uo1NdqvovDVoluREEzLMDmCamOke3lMSCnJRjI9SJ5BDWa3B02kQyU3JnBRB4Ii
         kLzXRrJbtnm79Na4REwU6PuZWx08HEvhIHxWmczqqNuN3VALhAPuuWkhLdQVmay8fegg
         MjxDZ2Q5gI4H1pdjgfpAsfNzUZ7/HAC7lfOVmHaA4muqKcx+FSpwK/Z/afatXdRGu7Yo
         NTUkyVbWgA+6UhYuKECYAyXkvA+lOFQ0lE4qGx2VCMd4MY6ABqWoh5KIv+UfQ5GfJ9cR
         9CmbtOC0CRtXi1YIEx82eO7oZb6rM5YaMJGftkZQL8QS4/kcBVNmePA1L8OQC0p3W7zx
         Z04g==
X-Forwarded-Encrypted: i=1; AJvYcCXnPj38JZgoHAcQgnacs0lbAmoUOi2ZGH+NhBd6z50mTKhkx4PwVj0UQeAKxKkVZp54t4qYGHAnzozAUP/6+uJSCcuQ5osYhyxi5oM9NAo=
X-Gm-Message-State: AOJu0Yw6ZFl0q022xd9dE2wIk2fYc+Ud7YLeOM9aifw0q+jbcuPh6A3K
	XnVSRKih9prMTR5E9C7FbRT64bAqG/uFixhfMVKE/bplH2oLSHMdw2sni9RC708=
X-Google-Smtp-Source: AGHT+IEIwcFcuIPyyRn6BDl+F45km4t8tUrxrzYocXtVy6fFEFePO7K4LZ6os0kmg+NoKDX0lbboKA==
X-Received: by 2002:ac2:483c:0:b0:511:a40b:e5d0 with SMTP id 28-20020ac2483c000000b00511a40be5d0mr1612694lft.11.1708013300007;
        Thu, 15 Feb 2024 08:08:20 -0800 (PST)
Date: Thu, 15 Feb 2024 17:08:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc428VMDoYnPw1zo@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
 <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>
 <Zc3v20RKMssbaDsl@macbook>
 <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com>

On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
> On 15.02.2024 12:04, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 11:43:02AM +0100, Jan Beulich wrote:
> >> On 15.02.2024 11:28, Roger Pau Monné wrote:
> >>> On Thu, Feb 15, 2024 at 10:49:31AM +0100, Jan Beulich wrote:
> >>>> On 15.02.2024 10:30, Roger Pau Monne wrote:
> >>>>> --- a/xen/Makefile
> >>>>> +++ b/xen/Makefile
> >>>>> @@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
> >>>>>  else # !config-build
> >>>>>  
> >>>>>  ifeq ($(need-config),y)
> >>>>> --include include/config/auto.conf
> >>>>>  # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
> >>>>>  # changes are detected.
> >>>>>  -include include/config/auto.conf.cmd
> >>>>> +include include/config/auto.conf
> >>>>
> >>>> With the - dropped, ...
> >>>>
> >>>>> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
> >>>>>  # This exploits the 'multi-target pattern rule' trick.
> >>>>>  # The syncconfig should be executed only once to make all the targets.
> >>>>>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> >>>>> +	rm -rf include/config/$*.conf
> >>>>>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
> >>>>
> >>>> ... is this really necessary? The error status from the sub-make is ignored
> >>>> only because of the -, isn't it?
> >>>
> >>> Without the `rm` the include/config/auto.conf is not removed by
> >>> Kconfig on error, so the include will still succeed but use the stale
> >>> auto.conf file.
> >>>
> >>> Keep in mind on rebuilds include/config/auto.conf is already present,
> >>> so the rule is only executed for the include/config/auto.conf.cmd
> >>> target.
> >>
> >> But the sub-make ought to return failure, which ought to then stop the
> >> build process?
> > 
> > For some reason it doesn't, not at least with GNU Make 4.3.
> > 
> > It stops the build if the '-' is dropped from the include of
> > include/config/auto.conf.cmd.  But that will always fail as
> > include/config/auto.conf.cmd is never created.
> > 
> > Maybe there's something weird with our makefile, I certainly don't
> > know that much, but as noted in the commit message,
> > include/config/auto.conf.cmd failing doesn't cause the build to
> > stop.
> 
> How about the below as an alternative? I'm not overly happy with the
> double ifneq, but I also don't see a good other option.

Hm, yes, having the checks against specific paths is IMO not ideal.

> This way the missing auto.conf is detected slightly later, but this
> may well be good enough. Then again I might be overlooking yet
> something else that this breaks ...
> 
> Jan
> 
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> +	$(Q)rm -f include/config/$*.conf
>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
>  
>  ifeq ($(CONFIG_DEBUG),y)
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
>  PHONY := __build
>  __build:
>  
> --include $(objtree)/include/config/auto.conf
> +ifneq ($(obj),tools)
> +ifneq ($(obj),tools/kconfig)
> +include $(objtree)/include/config/auto.conf
> +endif
> +endif

Trying to understand this, I assume it's to avoid an infinite
dependency loop that generating include/config/auto.conf requires some
tools that are build using xen/Rules.mk?

Thanks, Roger.

