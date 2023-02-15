Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13949698274
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 18:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496176.766778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLnI-00013E-Ig; Wed, 15 Feb 2023 17:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496176.766778; Wed, 15 Feb 2023 17:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLnI-00010Y-Fj; Wed, 15 Feb 2023 17:42:12 +0000
Received: by outflank-mailman (input) for mailman id 496176;
 Wed, 15 Feb 2023 17:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSLnH-00010S-Cq
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 17:42:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 117fbb23-ad58-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 18:42:10 +0100 (CET)
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
X-Inumbo-ID: 117fbb23-ad58-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676482929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tddX/P7bh4gBa81Pab3djQYtgs+vkML5E48bQMNIgo4=;
  b=KPRhHgPwJKxvZEUXF12ZYcZuQ6jJXjWu3fSVGt9A1MdNdwDlrYdrttT2
   I2DOkb9hc+S9i91jvLoLWmpGyL5+B5ZepRe5mZ4zpA4C6wfpexKOaOf5b
   vFxbcZrn+SC7ToMCN1o32I7JGdHwhzeqDg+1dvh1iuP32Lre1o1rzEDUD
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97189269
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:d2v3LaomwkzNuZiy9vW2D4zfMTteBmLfZRIvgKrLsJaIsI4StFCzt
 garIBmPOv3eN2Shf9wlYI+08E0OvJTVmNFhT1A++yBjHn8U95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADBTLQyJqvuu/LC+Q/Npj/o/MdLSEIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOZpjSoWE9LXDCZ4QGn8y2Mu8TUpnviU70JV6ed9b1b3VLGkwT/DzVJDADm8JFVkHWWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNU+udU/XzACy
 l6DlNSvDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/6XlvkzNriu0mprMRxQw7zvLQ3mcwgwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y/DZg4jfIUOPCdkTNrGgk0PSZ8OEiz+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkEr8gOvAPi/PGe1t3L6yggYRtvvsTOL9q
 Ys3Cid3408HDL2Wjtf/r+b/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6epJRmCRpIwMzr2g1
 ijkCidlJK/X2SWvxfOiNioyN9sCnP9X8RoGAMDbFQzwgClzPNb/vft3mlleVeBPydGPBMVcF
 5EtE/hsyNwWItgb01zxtaXAkbE=
IronPort-HdrOrdr: A9a23:HuCMBaE4JoEA+vtGpLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="97189269"
Date: Wed, 15 Feb 2023 17:41:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Message-ID: <Y+0ZZb9VYOsyeaUj@l14>
References: <20230215152111.51218-1-anthony.perard@citrix.com>
 <b105cc38-315a-f3f5-0f8e-f3501d31a76c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b105cc38-315a-f3f5-0f8e-f3501d31a76c@suse.com>

On Wed, Feb 15, 2023 at 04:30:43PM +0100, Jan Beulich wrote:
> On 15.02.2023 16:21, Anthony PERARD wrote:
> > @@ -13,6 +14,10 @@ MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
> >  endif
> >  MINOR ?= 0
> >  
> > +ifeq ($(origin version-script), undefined)
> > +version-script := libxen$(LIBNAME).map.tmp
> > +endif
> 
> Such a use of $(origin ...) is pretty fragile. Maybe better use ?= ?

I'm not sure why I used $(origin), I've written that more than 6 month
ago, but this way of using it is actually described in the manual, when
documenting ?= but with a = instead of := .
So, maybe I wanted to have ?= but with immediate evaluation rather than
deferred. Maybe I had issue with $(version-script) evaluating to
different values.

If that ok, I'd like to keep using these runes, since ?:= doesn't exist.

> > @@ -72,6 +77,10 @@ headers.lst: FORCE
> >  	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
> >  	@$(call move-if-changed,$@.tmp,$@)
> >  
> > +libxen$(LIBNAME).map.tmp: FORCE
> > +	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >.$@.tmp
> > +	$(call move-if-changed,.$@.tmp,$@)
> 
> Isn't this going to get in the way of your "build everything from root"
> effort, where $@ will include a path? Also do we really need .tmp.tmp
> files?

Good call, I'll replace that with $(@D)/.$(@F), that will be one
less thing to deal with, Also, I guess just adding a dot to the filename
would be enough, and we would have `mv .libxen.map.tmp libxen.map.tmp`,
and no more .tmp.tmp files.

> >  lib$(LIB_FILE_NAME).a: $(OBJS-y)
> 
> Seeing this right adjacent in context - any reason you use libxen$(LIBNAME)
> and not the same lib$(LIB_FILE_NAME) for the base file name?

That was the name used before, I guess it would be fine to rename. I
just need to set $(version-script) later as $(LIB_FILE_NAME) would not
be defined yet.

> > @@ -120,7 +129,7 @@ TAGS:
> >  clean::
> >  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
> >  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
> > -	rm -f headers.chk headers.lst
> > +	rm -f headers.chk headers.lst libxen*.map.tmp
> 
> If I hadn't checked, I'd have assumed that *.tmp are removed without
> being named explicitly. So yes, I see the need for the addition, but then
> I wonder why you don't also remove the .*.tmp.tmp file, which may be left
> around if the build is interrupted at exactly the "right" time.

I forgot because $(move-if-changed) remove the temporary file. I'll
clean the .*.tmp file.

Thanks,

-- 
Anthony PERARD

