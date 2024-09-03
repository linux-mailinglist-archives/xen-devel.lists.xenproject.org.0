Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D158B969D4A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789060.1198587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slST3-0001Ty-76; Tue, 03 Sep 2024 12:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789060.1198587; Tue, 03 Sep 2024 12:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slST3-0001RN-3t; Tue, 03 Sep 2024 12:17:05 +0000
Received: by outflank-mailman (input) for mailman id 789060;
 Tue, 03 Sep 2024 12:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slST1-0001RG-K9
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:17:03 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6baacb66-69ee-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 14:17:02 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42bb9d719d4so38816855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 05:17:00 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c8823aa20sm32250895e9.45.2024.09.03.05.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:16:58 -0700 (PDT)
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
X-Inumbo-ID: 6baacb66-69ee-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725365820; x=1725970620; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+kUBl3o+B7TsxmcqWNioWFSRDgcqqckV2pO488Q9PK0=;
        b=Zx2UMtwnDMIagthy3XbvVl7MTOqMzzynbr2LowCTMb4+pOFPzHj4Ve7QuYHoYox80z
         R8XcB8ez7hB7KR8flgAR0/qJFZTJHCrKQVre/AyjyFnDBjI3S1UYtXMsDMHJk+5ivDUX
         rUBkETk04eh/tCPVrjzwEUaI9ty7Gy2D+ZlQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725365820; x=1725970620;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kUBl3o+B7TsxmcqWNioWFSRDgcqqckV2pO488Q9PK0=;
        b=xCMqrmHnXESzQZhuFW238kHjb00uuqF+4titOfydRkqmz45fZOElp5BMZeYAL0x9Y/
         Q6jAVz5csnMqU4GpYkpwIgOWfbZC4sDazh7h88zyalIW4aOcRAM4A5tGpZkEbsO/LSUx
         Gnn2d7hCI3mwGOwuNeG0L7ne6u/hNBS0LMS8KYhWhxG5snTg2Q4zQRf0E91kHY3ZkSd7
         DJj3a6Dn+sFSNbB6/3vsb7v3iifrAzhiMt0sJrFdYI1YWLOGeKpftjPZTr7uNyeyL3ZW
         8cxwkHsJ9TD2Mi9wZ0gfOzf25O4xmnVEIKqCN4OcNHzaq9kQYYK2vB4qGid/373JhGkN
         9g1Q==
X-Gm-Message-State: AOJu0YyyYrbOJbJwSeXNBvIMZoO94TCK/osNgp6Nn/uOuGUGu7PUSZU5
	Gn7eMLRhyDWmO8dTFaQVdOR14gHGiK/22KygdtPBQyBi3OHQGhDPOxOJM7c+pjs=
X-Google-Smtp-Source: AGHT+IHi5rIFA7JxkBpX6qAogDfWrJxYGEPPYTTfFNWmL6Umlp7/c8sbcsD2lVOCJPiMZwdVY3xajg==
X-Received: by 2002:a05:600c:5125:b0:426:5269:983a with SMTP id 5b1f17b1804b1-42c880ec22cmr25192355e9.8.1725365819194;
        Tue, 03 Sep 2024 05:16:59 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:16:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
Message-ID: <Ztb-OrqBfXv5sX-m@macbook.local>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <ZtbrAnF97EXZvr8t@macbook.local>
 <756335cc-f4e3-4664-82ea-cde0301b1784@citrix.com>
 <773ec15f-dd90-4b44-9c42-fc1609f25c44@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <773ec15f-dd90-4b44-9c42-fc1609f25c44@citrix.com>

On Tue, Sep 03, 2024 at 12:16:33PM +0100, Andrew Cooper wrote:
> On 03/09/2024 12:08 pm, Andrew Cooper wrote:
> > On 03/09/2024 11:54 am, Roger Pau Monné wrote:
> >> On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
> >>> Most of Xen is build using -nostdinc and a fully specified include path.
> >>> However, the makefile line:
> >>>
> >>>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> >>>
> >>> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> >>>
> >>> Reinstate -nostdinc, and add the arch include path to the command line.  This
> >>> is a latent bug for now, but it breaks properly with subsequent include
> >>> changes.
> >>>
> >>> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> ---
> >>> CC: Jan Beulich <JBeulich@suse.com>
> >>> CC: Roger Pau Monné <roger.pau@citrix.com>
> >>> CC: Anthony PERARD <anthony.perard@vates.tech>
> >>> ---
> >>>  xen/arch/x86/boot/Makefile | 6 +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> >>> index 03d8ce3a9e48..19eec01e176e 100644
> >>> --- a/xen/arch/x86/boot/Makefile
> >>> +++ b/xen/arch/x86/boot/Makefile
> >>> @@ -13,11 +13,11 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
> >>>  
> >>>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
> >>>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> >>> -CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> >>> +CFLAGS_x86_32 += -Werror -nostdinc -fno-builtin -g0 -msoft-float
> >>>  ifneq ($(abs_objtree),$(abs_srctree))
> >>> -CFLAGS_x86_32 += -I$(objtree)/include
> >>> +CFLAGS_x86_32 += -I$(objtree)/include -I$(objtree)/arch/$(SRCARCH)/include
> >>>  endif
> >>> -CFLAGS_x86_32 += -I$(srctree)/include
> >>> +CFLAGS_x86_32 += -I$(srctree)/include -I$(srctree)/arch/$(SRCARCH)/include
> >> I think it might be best to just filter out the include paths from
> >> XEN_CFLAGS, iow:
> >>
> >> CFLAGS_x86_32 += $(filter -I%,$(XEN_CFLAGS))
> >>
> >> Instead of having to open-code the paths for the include search paths
> >> here again.  Using the filter leads to the following CC command line:
> >>
> >> clang -MMD -MP -MF arch/x86/boot/.cmdline.o.d -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -fno-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -Werror -fno-builtin -g0 -msoft-float -mregparm=3 -I./include -I./arch/x86/include -I./arch/x86/include/generated -I./arch/x86/include/asm/mach-generic -I./arch/x86/include/asm/mach-default -fpic '-D__OBJECT_LABEL__=arch/x86/boot/cmdline.o'    -c arch/x86/boot/cmdline.c -o arch/x86/boot/.cmdline.o.tmp -MQ arch/x86/boot/cmdline.o
> > FWIW, https://cirrus-ci.com/build/5930269490806784 shows a good build on
> > FreeBSD with this patch in place.
> >
> > I'd be happy with that approach.  It's probably less fragile, although
> > I'll probably go with:
> >
> > CFLAGS_x86_32 += -nostdinc $(filter -I%,$(XEN_CFLAGS))
> >
> > to handle all the include changes together.  Lemme spin a v2.
> 
> Actually, it's not quite that easy.  From a regular Xen object file, we
> have:
> 
>  * -Wa,-I,./include (twice, for some reason).

There's a comment next to where this is added:

# Set up the assembler include path properly for older toolchains.

But won't we also need extra -Wa,-I for the other include paths that
are passed on the command line? (./arch/x86/include for example)

>  * -include ./include/xen/config.h

Hm, we could manually add that include option.

> 
> The former can be added to the filter reasonably easily, but the latter
> cannot.  I guess we've gone this long without it...

I've been also thinking, another approach we could take is filtering
out what we don't want, but I think that might end up being more
fragile.

Thanks, Roger.

