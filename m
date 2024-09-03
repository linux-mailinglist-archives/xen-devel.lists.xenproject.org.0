Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC87969D57
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789080.1198596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSVK-0002fd-J4; Tue, 03 Sep 2024 12:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789080.1198596; Tue, 03 Sep 2024 12:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSVK-0002e3-Fd; Tue, 03 Sep 2024 12:19:26 +0000
Received: by outflank-mailman (input) for mailman id 789080;
 Tue, 03 Sep 2024 12:19:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slSVJ-0002dw-2O
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:19:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c814bc-69ee-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 14:19:23 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42bb9d719d4so38844395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 05:19:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb73e20b7sm170569825e9.14.2024.09.03.05.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:19:21 -0700 (PDT)
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
X-Inumbo-ID: c0c814bc-69ee-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725365962; x=1725970762; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nlm+FZtExd/mOqwzKDm02O5HSmQr46GcWwDqOZMmQOM=;
        b=V8zMgBqbzkOmNhhv1mTJn2WehyWR3a5FE81lV8YQFQoAZ07iXfvId0FbnyfTaHhXGr
         9TzSMMn70EgVF7i6g9H0seiBZPXl//yQglzYRm8HqRdqHaYWTu6Y4TQdBEEBWQcn6Lyk
         SFrkLpRI4/+o1pygzOIcipQ2yik+Yv4yzIR6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725365962; x=1725970762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nlm+FZtExd/mOqwzKDm02O5HSmQr46GcWwDqOZMmQOM=;
        b=w89Nlr5MX+DS1ih7CJTn/THKHRKJLADqyjEvoa34gLnG0+QcHuzfFjnhUjNgzvtmig
         LeoYvVjAjc5EMzYEX5YnSIb1UY5K7/Dp9eRrf8/EFnoyNKx+lh2Ieb6RghUZ9PTnix7p
         NgF8chWAVIG7MxIaPW6t14tnqLNfaknZyT/4xbCSl09RHZ0z2N+Si2DsdYdwgG6WFwqo
         SRWk+w8Yl4KzfD6SPJVdVaT6QjNG9SojKGGv93Ok0eBzrfVFkNVT1oVsUNGFDyDcASqF
         bkjCuz4XjHTvvCKNoi7AlAIdI66O3D70wCUB5e47Y2xOCCeChwY87thTrpyFxpy4gC+x
         CE9A==
X-Forwarded-Encrypted: i=1; AJvYcCUxBithMUWI5X9b8V5d2NxsmVyAw38/rCGgWPQNaJE7C11Fq97+Su7BQaFeP1nIQMyFcTdiCFveeBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHvMLtpPRiAytUBeOOTrB+L63Ai+QcoE5oa617BsuTTeyPCABM
	AhCWm2NNwVRufxGLlqu1f4aZwOi0VHlsfZACL+wHOQgcJd6oAUKpWEMKY4k19auJ3WtPou9wbeP
	Z
X-Google-Smtp-Source: AGHT+IHeTe8/iLwLDF5KcJZNQCqRF7rSBdhK7fY5z0nhRCEHYm6ne5y/ubhgcU2d7W+wLT4tBQGy0g==
X-Received: by 2002:a05:600c:4f46:b0:428:1eff:78ec with SMTP id 5b1f17b1804b1-42c880f3fe2mr27428985e9.18.1725365961939;
        Tue, 03 Sep 2024 05:19:21 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:19:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Reinstate -nostdinc for CFLAGS_x86_32
Message-ID: <Ztb-yNbYa1FfZwd1@macbook.local>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
 <Ztbw/QwIvgQNcmoo@l14>
 <7bd043c7-32b0-44d6-a6c4-f74695a0b355@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bd043c7-32b0-44d6-a6c4-f74695a0b355@citrix.com>

On Tue, Sep 03, 2024 at 12:51:28PM +0100, Andrew Cooper wrote:
> On 03/09/2024 12:20 pm, Anthony PERARD wrote:
> > On Tue, Sep 03, 2024 at 11:49:40AM +0100, Andrew Cooper wrote:
> >> Most of Xen is build using -nostdinc and a fully specified include path.
> >> However, the makefile line:
> >>
> >>   $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> >>
> >> discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.
> >>
> >> Reinstate -nostdinc, and add the arch include path to the command line.  This
> >> is a latent bug for now, but it breaks properly with subsequent include
> >> changes.
> >>
> >> Fixes: d58a509e01c4 ("build,x86: remove the need for build32.mk")
> > I disagree with this. I'm pretty sure I've check that no command line
> > have changed.
> 
> Fine, I'll drop it.
> 
> >
> > Also, this commit shows that CFLAGS was only coming from root's
> > Config.mk:
> >> diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot
> >> deleted file mode 100644
> >> index e90680cd9f..0000000000
> >> --- a/xen/arch/x86/boot/build32.mk
> >> +++ /dev/null
> >> @@ -1,40 +0,0 @@
> >> -override XEN_TARGET_ARCH=x86_32
> >> -CFLAGS =
> >> -include $(XEN_ROOT)/Config.mk
> > So, I'm pretty sure, -nostdinc was never used before. But happy to be
> > told that I've come to the wrong conclusion. (We would need to check by
> > building with an old version without this commit to be sure.)
> 
> -nostdinc was added after the fact.  Which is fine.
> 
> But as a consequence of these being unlike the rest of Xen, somehow (and
> only on FreeBSD it seems), the regular build of Xen is fine, but
> tools/firmware/xen-dir for the shim is subject to -nostdinc in a way
> that breaks cmdline.c

FWIW, it did break for me on a normal build in xen/ on FreeBSD, no
need to run it from tools/firmware/xen-dir.

> > "xen/arch/x86/boot" as it's own sets of CFLAGS, which is annoying and I
> > haven't really tried to change that. This is also why XEN_CFLAGS is been
> > discarded.
> 
> This is necessary.  We're swapping -m64 for -m32 to build these two
> objects, and that invalidates a whole bunch of other CFLAGS.

See my previous reply, I guess figuring out which of those options also
need to be dropped as a result of dropping -m64 is likely too
complicated and fragile as we add new options.

Thanks, Roger.

