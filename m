Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471B2C463C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 18:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37933.70515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khyDV-0003OZ-M8; Wed, 25 Nov 2020 17:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37933.70515; Wed, 25 Nov 2020 17:04:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khyDV-0003O8-G1; Wed, 25 Nov 2020 17:04:29 +0000
Received: by outflank-mailman (input) for mailman id 37933;
 Wed, 25 Nov 2020 17:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FqDi=E7=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1khyDT-0003O3-R8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 17:04:27 +0000
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7527f5a-be48-49be-8110-936b8ddd67bc;
 Wed, 25 Nov 2020 17:04:26 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id 2so374711ybc.12
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 09:04:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FqDi=E7=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1khyDT-0003O3-R8
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 17:04:27 +0000
X-Inumbo-ID: f7527f5a-be48-49be-8110-936b8ddd67bc
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7527f5a-be48-49be-8110-936b8ddd67bc;
	Wed, 25 Nov 2020 17:04:26 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id 2so374711ybc.12
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7yONu+GErpj3wVA3mUEvd1gZrZu1iMtuB4J5cc4iYs=;
        b=bn+pL/HmrYW2tlvsO08UsmlB+e0sDsIo/gBe6lZBPy5Ml0r7IepVRmwL3Z1msCDTmB
         4Fj8yYJnSSwKpycrMD6jc9mJYcLEOxyjBt+mj/swgeJwfcTqBWFSYbINT99XJh8MBLLG
         BhdJX4URpdAlU1PS41QCV8cX0uycEbKi5uankHMmLYXfRheyb1dBSnJ2lYbkM9jPzYRg
         +YL1Fiv4xli6A/G5oR00+c/fqffNKJdLOgNLmafCTxGe8sUqpvTjraMjrzXLQkd2Vyg7
         6NJIAQ3gm8Ro9XvzXTxxo6aHXEqSB5bdv5UB5bHkEX37ZUG4NR8CwSl4aaovOFcf7q/J
         MTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7yONu+GErpj3wVA3mUEvd1gZrZu1iMtuB4J5cc4iYs=;
        b=YGmuF9b+ZQJbgrsiwfcLyjqu68z6jNRxmsaOtUjJ8jRvd7wNz6Bdq0keLc3i7ZtlAy
         +XbS35Z/L1sk4djFlMPofwJ1apngqpZyJI1RSWot2Hm3EedKgCdA9naHqH00WCCm0R6h
         xYZkO9PRD2BpOjHOOhDWNb096jjqA5BeoQdQA5VdCpe58wShELcwXPCGNVoaaSI8DPw9
         U5VpYIAzAyMpDjuo2FtVqiRpOUOI8Py7temHElod6z3uO7U5g90+O29A3Z+oPamFJxRp
         XG9v8cGZKEtxdIizosk1GSHF1tPaVA9IurtJ48yAZz+7M2fFzd5VmloPNIuXAZzU0U5I
         Dj9Q==
X-Gm-Message-State: AOAM533RUWF7fVHq4CbvHcpYOf7uTrTuYGj/HeC98OmmVKOXvc0HtbWO
	VZwGVneZ9BMOzEmyyeSyTEPv0qFHLmSkZlYjuPY=
X-Google-Smtp-Source: ABdhPJwRDTWwRnnt/vVfXeVU3lUNCXdaAf9CCrzUJdkBRbFdtXrCpJBbeymEiGhAam+E5oqqQjDTbAdkVQMGwErIDPw=
X-Received: by 2002:a25:aac5:: with SMTP id t63mr6307293ybi.22.1606323866493;
 Wed, 25 Nov 2020 09:04:26 -0800 (PST)
MIME-Version: 1.0
References: <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor> <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook> <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
 <CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com> <20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201125082405.1d8c23dc@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 18:04:15 +0100
Message-ID: <CANiq72=RuekXf1O6Fxrz2Eend0GtS6=E72P4T2=48SDqVcTChA@mail.gmail.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for Clang
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Joe Perches <joe@perches.com>, alsa-devel@alsa-project.org, 
	linux-atm-general@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, 
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org, 
	linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com, 
	wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org, 
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, 
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org, 
	linux-security-module@vger.kernel.org, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-stm32@st-md-mailman.stormreply.com, 
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org, coreteam@netfilter.org, 
	intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org, 
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>, 
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	=?UTF-8?Q?open_list=3AHARDWARE_RANDOM_NUMBER_GENERATOR_CORE_=3Clinux=2Dcrypt?=
	=?UTF-8?Q?o=40vger=2Ekernel=2Eorg=3E=2C_patches=40opensource=2Ecirrus=2Ecom=2C_linux=2Dint?=
	=?UTF-8?Q?egrity=40vger=2Ekernel=2Eorg=2C_target=2Ddevel=40vger=2Ekernel=2Eorg=2C_linux=2D?=
	=?UTF-8?Q?hardening=40vger=2Ekernel=2Eorg=2C_Jonathan_Cameron_=3CJonathan=2ECamero?=
	=?UTF-8?Q?n=40huawei=2Ecom=3E=2C_Greg_KH?= <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 5:24 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> And just to spell it out,
>
> case ENUM_VALUE1:
>         bla();
>         break;
> case ENUM_VALUE2:
>         bla();
> default:
>         break;
>
> is a fairly idiomatic way of indicating that not all values of the enum
> are expected to be handled by the switch statement.

It looks like a benign typo to me -- `ENUM_VALUE2` does not follow the
same pattern like `ENUM_VALUE1`. To me, the presence of the `default`
is what indicates (explicitly) that not everything is handled.

> Applying a real patch set and then getting a few follow ups the next day
> for trivial coding things like fallthrough missing or static missing,
> just because I didn't have the full range of compilers to check with
> before applying makes me feel pretty shitty, like I'm not doing a good
> job. YMMV.

The number of compilers, checkers, static analyzers, tests, etc. we
use keeps going up. That, indeed, means maintainers will miss more
things (unless maintainers do more work than before). But catching
bugs before they happen is *not* a bad thing.

Perhaps we could encourage more rebasing in -next (while still giving
credit to bots and testers) to avoid having many fixing commits
afterwards, but that is orthogonal.

I really don't think we should encourage the feeling that a maintainer
is doing a bad job if they don't catch everything on their reviews.
Any review is worth it. Maintainers, in the end, are just the
"guaranteed" reviewers that decide when the code looks reasonable
enough. They should definitely not feel pressured to be perfect.

Cheers,
Miguel

