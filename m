Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FF1BBC43
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:17:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOEN-0003EG-IP; Tue, 28 Apr 2020 11:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v0V7=6M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTOEL-0003EB-R3
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:16:49 +0000
X-Inumbo-ID: c03122bc-8941-11ea-984c-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c03122bc-8941-11ea-984c-12813bfff9fa;
 Tue, 28 Apr 2020 11:16:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k13so24203800wrw.7;
 Tue, 28 Apr 2020 04:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3axJ3aVDA0BwPqLJzXtdYrDrS24VN47nr3PXqYGqeqY=;
 b=UOOzMuZqy3GCOAJgFgiTclT8d+tULYqM9tK0xeZgzyvCbxkDMP+RQWlBAh/QXG8BG1
 40vBkG3bekB38+K0wBqqbcsfQSQE2WhZGsWR/xHa+cD774QDMp3guuK0XXI7YYAK1p5B
 KWAtufMVmIZlTjrxpKDj5E2XPqxZW83RDFMPU5hXnHXqgdAORtDJqDoQuTMZ7eNJsAxq
 +BsVqRyQFznT9N95ObyWZmcNuWrws0kr0ZVSydQZubd+4hJzFgG6dSH5C1M6FIvSty7P
 vXSqGDx4sfgXuAPTuy6IoDQ+nN3TxJh+6i40AwDa487U+Xy0a7h4D5HP6cohwAwfGGwc
 9iFA==
X-Gm-Message-State: AGi0PuYsGCHz9tH7HA2V4Huv78rn7nb0DLu8Xxqru1MJN4lRIFEw/Vf+
 quVrBxZmH0KivdDBqY+s9Sw=
X-Google-Smtp-Source: APiQypJ0jQhlL0xNOmLCng7VZBTA6DCBnlDn7QwYj0GOyf2dHr3Q6qBy399GNpj9a4s8d6eboDeYCA==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr32802147wrx.356.1588072607486; 
 Tue, 28 Apr 2020 04:16:47 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e13sm15605383wrp.15.2020.04.28.04.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 04:16:46 -0700 (PDT)
Date: Tue, 28 Apr 2020 11:16:45 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
Message-ID: <20200428111645.pa6xfs6t6rifu6fu@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200427034019.6251-1-jandryuk@gmail.com>
 <20200427075429.mshevnm2ype7tq32@function>
 <CAKf6xpuh3v0H-22=7y83ioYsm2GnKOs+FO8nN2s3djXanUL9BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xpuh3v0H-22=7y83ioYsm2GnKOs+FO8nN2s3djXanUL9BQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 minios-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 09:30:50AM -0400, Jason Andryuk wrote:
> On Mon, Apr 27, 2020 at 3:54 AM Samuel Thibault
> <samuel.thibault@ens-lyon.org> wrote:
> >
> > Jason Andryuk, le dim. 26 avril 2020 23:40:19 -0400, a ecrit:
> > > Commit c96c22f1d94 "mini-os: minimal implementations of some termios
> > > functions" introduced implementations of tcgetattr and tcsetattr.
> > > However, they do not check if files[fildes].cons.dev is non-NULL before
> > > dereferencing.  This is not a problem for FDs allocated through
> > > alloc_fd, but the files array pre-allocates FDs 0-2 for stdio.  Those
> > > entries have a NULL .dev, so tc{g,s}etattr on them segfault.
> > >
> > > ioemu-stubdom segfaults when term_init() calls tcgetattr on FD 0.
> > >
> > > Restore tcgetattr and tcsetattr behavior when .dev is NULL equivalent to
> > > unsupported_function as it was before c96c22f1d94.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> >
> > Thanks!
> 
> Thank you!
> 
> > > ---
> > > I can't get ioemu-stubdom to start without this.  With this, the guest
> > > just reboots immediately, but it does that with a non-stubdom
> > > device_model_version="qemu-xen-traditional" .  The same guest disk image
> > > (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
> > > qemu-system-x86_64.
> 
> Ubuntu gcc-9 adds -fcf-protection by default.  Somehow that flag
> caused rombios (I think) to restart.  Setting -fcf-protection=none
> like below (probably just the EMBEDDED_EXTRA_CFLAGS part) lets rombios
> start properly.  The hypervisor needs it as well via
> EXTRA_CFLAGS_XEN_CORE=-fcf-protection=none and maybe also added to
> xen/arch/x86/boot/build32.mk .

Are you able to turn this into a proper patch? I suspect you will need
to test the availability of this new (?) flag.

Also Cc Jan and Andrew because it affects hypervisor build too.

> 
> diff --git a/Config.mk b/Config.mk
> index 0f303c79b2..efb3d42bc4 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
> 
>  EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions
> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
> 
>  XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
>  # All the files at that location were downloaded from elsewhere on
> diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
> index 26bbddccd4..0d33514d53 100644
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -17,3 +17,4 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> 
>  # Extra CFLAGS suitable for an embedded type of environment.
>  CFLAGS += -fno-builtin -msoft-float
> +CFLAGS += -fcf-protection=none
> 

