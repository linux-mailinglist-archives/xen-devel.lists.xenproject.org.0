Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2B1BA4C5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3qp-0002vk-KJ; Mon, 27 Apr 2020 13:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UCaW=6L=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jT3qo-0002vZ-L1
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:31:10 +0000
X-Inumbo-ID: 5795514e-888b-11ea-ae69-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5795514e-888b-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 13:31:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id g4so17600294ljl.2;
 Mon, 27 Apr 2020 06:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=BXSutSaL3U/QnQdOrk5RMz1W2afQvWJhycyk5uFYBlM=;
 b=cvTxq3G4KceguELJwbfuu230la5pvZXWBu0Gv/apJ2gdqILROr6K9DZp0zfXNeAXa2
 JEtmNvVyiG06eOnPrR6brRKzW9cWhejvFJnYzjVwB8xBHuUm2t7LpTCLOifTI5GeXkhO
 P00N2RS+YFJBF7UrP68MqPb4QOX2HiRG7yYBE3+LeDNCbBAEKUtUFgEe0bHWv68vJvlu
 EKMa5zoG2w4JVARl8o9ratVthIix2U4M1m22ySNCp5s4nbMNj2Oy01uMaNEEemFF2iVS
 L7mfYDlHXaUX9pk5kaHMchDRmZM+y4QZy9sQqY0ZWCm5fW28fy56d8xaYI2tkaH8jTz5
 Ii8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=BXSutSaL3U/QnQdOrk5RMz1W2afQvWJhycyk5uFYBlM=;
 b=nx3zayfSoeMlMKnk20VrMONA2u7AJgagDVra19H+QxbU8AMixzIMuCzuqp583RuhhV
 /rMY5WKqnJAmnVzb5j+Q8OVNOvZklx4qpbZH2sRwjG5YxwxUXtT4RnidWMKLeRsLvjxO
 GspfSr8bIZW7v+X9PUCDKpG/peMbqf7wZLQsxkmCKxlXv9bhKrVbFQfTBWos0eN7MJjO
 mwcTnN9UH/C5x0c4XNrRz6Kj2VigQ1V94ioOog80l3zskw5X4klWpvXbFh5laitaaFM4
 /xtrl2CRn3eOxQggpH2ecxe7/HN5iAJjl6zy59/dr6SePkrdoH4AtZW+UNAjkgEL37PL
 qNyQ==
X-Gm-Message-State: AGi0Pua0Msr+hhyojxArl0Httch+5HrtF+cXjkwtfGHcryuLOSr/K0do
 lQSdZnT84oVesGkyGCSkWh3nZEsfb5juryy9nFk=
X-Google-Smtp-Source: APiQypIG26yA+2Qnkf7imCJP1+eUS2LoVzIzaMi4JkV0OYpff/hgrOAP+MlEppppFo3QPXwTCgb+m2V+IuRVz8yqE5k=
X-Received: by 2002:a05:651c:1055:: with SMTP id
 x21mr11562351ljm.210.1587994263334; 
 Mon, 27 Apr 2020 06:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200427034019.6251-1-jandryuk@gmail.com>
 <20200427075429.mshevnm2ype7tq32@function>
In-Reply-To: <20200427075429.mshevnm2ype7tq32@function>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 27 Apr 2020 09:30:50 -0400
Message-ID: <CAKf6xpuh3v0H-22=7y83ioYsm2GnKOs+FO8nN2s3djXanUL9BQ@mail.gmail.com>
Subject: Re: [PATCH] mini-os: Avoid segfaults in tc{g,s}etattr
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Andryuk <jandryuk@gmail.com>, 
 minios-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 3:54 AM Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> Jason Andryuk, le dim. 26 avril 2020 23:40:19 -0400, a ecrit:
> > Commit c96c22f1d94 "mini-os: minimal implementations of some termios
> > functions" introduced implementations of tcgetattr and tcsetattr.
> > However, they do not check if files[fildes].cons.dev is non-NULL before
> > dereferencing.  This is not a problem for FDs allocated through
> > alloc_fd, but the files array pre-allocates FDs 0-2 for stdio.  Those
> > entries have a NULL .dev, so tc{g,s}etattr on them segfault.
> >
> > ioemu-stubdom segfaults when term_init() calls tcgetattr on FD 0.
> >
> > Restore tcgetattr and tcsetattr behavior when .dev is NULL equivalent to
> > unsupported_function as it was before c96c22f1d94.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
> Thanks!

Thank you!

> > ---
> > I can't get ioemu-stubdom to start without this.  With this, the guest
> > just reboots immediately, but it does that with a non-stubdom
> > device_model_version="qemu-xen-traditional" .  The same guest disk image
> > (cirros 0.5.1) boots with a linux stubdom or non-stubdom Ubuntu
> > qemu-system-x86_64.

Ubuntu gcc-9 adds -fcf-protection by default.  Somehow that flag
caused rombios (I think) to restart.  Setting -fcf-protection=none
like below (probably just the EMBEDDED_EXTRA_CFLAGS part) lets rombios
start properly.  The hypervisor needs it as well via
EXTRA_CFLAGS_XEN_CORE=-fcf-protection=none and maybe also added to
xen/arch/x86/boot/build32.mk .

diff --git a/Config.mk b/Config.mk
index 0f303c79b2..efb3d42bc4 100644
--- a/Config.mk
+++ b/Config.mk
@@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))

 EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions
+EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none

 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 26bbddccd4..0d33514d53 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -17,3 +17,4 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))

 # Extra CFLAGS suitable for an embedded type of environment.
 CFLAGS += -fno-builtin -msoft-float
+CFLAGS += -fcf-protection=none

