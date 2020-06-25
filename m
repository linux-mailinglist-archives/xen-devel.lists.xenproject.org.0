Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728F2099BF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 08:16:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joLAL-0008Oa-6c; Thu, 25 Jun 2020 06:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzsX=AG=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1joLAJ-0008OV-54
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 06:15:15 +0000
X-Inumbo-ID: 3b7e9b8e-b6ab-11ea-8496-bc764e2007e4
Received: from mail-ot1-x341.google.com (unknown [2607:f8b0:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b7e9b8e-b6ab-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 06:15:14 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 72so4241823otc.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 23:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L3nkNUv0AI8kinjFbObpy88tHlaSp8Q2pJ4IM2vuMno=;
 b=KixfC0RsXhSGUC0PgQR55XcqRvpZ1UbEXp1nNAZxcLSjwxStUuZWz5+7AuJsvXcGZc
 vpTIE7yCi6/2tl01hn67G3ThAXFfAxRx+4YreGPCM/2FRJcYjVZZ5Vd26phn6tkd5rq6
 2urxxkRKYIhe7yHopQwN1EGwYn4DfTltIsNyBGGDCc72Ep5Zq773Pp6gQ4YQQtTq+ki5
 4at2y7KtY9AInSRLAJPiwxce2ov8Wv52dyKbuTJWAKUw2PPSYdBs9gaBdLYK746ae09E
 zWVkMCmDiYJNIq3EVmI4xuxKQ+yRfUlk8wpiq92DR5bCtwv9C5rN6VepLvWbnZqEv+TG
 ErcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3nkNUv0AI8kinjFbObpy88tHlaSp8Q2pJ4IM2vuMno=;
 b=CFWrVJ2C2/uY4BGg3+aepufTH4Bejz05CZp+CLYmZhMCChpt8gRqWHr2LtjEUKgJ/2
 uGP2XWhkf1oqd2tGiTnfoKXxjlPikCYWgDNU1Lj+Vhms1lIY2Ug9wOOpfMdbH1tUQ8a1
 eTyniLXfOn2YsWpnF86mcpadT3hcH0bEZziROE++fT/uIJmelG9PljJ6bdyh+2ALCVHr
 5QE21KeoGbQwoaKutlW6X7DuCJ5l4MpY8mtIBltBXoB0+pBp5EBXGTeM5WjdjjWdBWGo
 /EseXFtA1NY/SqzM310KFNIgzYdTYO2bZnnCvkxelV2yw5/pW3OPpqxGIvCiQdQ0A6gK
 hMuA==
X-Gm-Message-State: AOAM5335Jekm0yEGBQ2kz4ELGORsd/smA9Zp4gDk1kiJMEaxvobWIaEs
 asVkPD+NaPKbWJ9v7IpfI2xiwy8ioUUEqWLY6bk=
X-Google-Smtp-Source: ABdhPJywri45Jqh9e3FSTIJRfKhHxBuoPZK66FF2fhz/9DoXhp7JOUEUyuQExTlFGeTy9jumu5WhitmB/ocxqkM6jQU=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr26009100ots.192.1593065713823; 
 Wed, 24 Jun 2020 23:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
 <alpine.DEB.2.21.2006151710280.9074@sstabellini-ThinkPad-T480s>
 <20200616010252.GC3113@minyard.net>
 <CAMmSBy_=tYFH+HtSnGdY90bkL9XPxQ6iJ20RVP3nQU0P0bHBpA@mail.gmail.com>
 <20200616014513.GD3113@minyard.net>
 <CAMmSBy9AU-iCgvBRGmY12gWODKuWiCDiBERc1rGRjM5OyN11EQ@mail.gmail.com>
In-Reply-To: <CAMmSBy9AU-iCgvBRGmY12gWODKuWiCDiBERc1rGRjM5OyN11EQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 24 Jun 2020 23:15:02 -0700
Message-ID: <CACMJ4GZ2rTDGtm33Bx-wjpK+sQ4z7kQMEM8Z5VnYyFwXLU6U-g@mail.gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
To: Roman Shaposhnik <roman@zededa.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 tamas@tklengyel.com, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 6:49 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> On Mon, Jun 15, 2020 at 6:45 PM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > On Mon, Jun 15, 2020 at 06:05:57PM -0700, Roman Shaposhnik wrote:
> > > On Mon, Jun 15, 2020 at 6:02 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > >
> > > > On Mon, Jun 15, 2020 at 05:14:21PM -0700, Stefano Stabellini wrote:
> > > > > On Mon, 15 Jun 2020, Christopher Clark wrote:
> > > > > > On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > > > > > > >
> > > > > > > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > > > > > > existing sd cards, and this was working fine.  I finally got to a full
> > > > > > > > yocto build of the system, and it didn't boot.
> > > > > > > >
> > > > > > > > In fact, Xen didn't print anything at all, and nothing happens that
> > > > > > > > might suggest it's booting without any console output.
> > > > > >
> > > > > > I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> > > > > > works fine, whereas I see no console output from the kernel once Xen
> > > > > > tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
> > > > > >
> > > > > > > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > > > > > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > > > > > > version does not work.  It also didn't work if I completely removed the
> > > > > > > > overlay.  The base device trees are the same between the two kernels.
> > > > > > > >
> > > > > > > > Looking at the overlay changes between the versions and Xen source, I
> > > > > > > > can't trace down anything that would cause an issue.  Has anyone seen
> > > > > > > > this issue of have any ideas?
> > > > > >
> > > > > > Seen it: yes, but no progress on resolving it to report at this point.
> > > > > >
> > > > > > > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> > > > > > >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> > > > > > >
> > > > > > > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
> > > > > >
> > > > > > Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> > > > > > you guys have working ok?
> > > > > > It looks like the bcm2711_defconfig file wasn't included in the kernel
> > > > > > source tree of that branch at the point the kernel version was bumped
> > > > > > up to 5.6.14, so is there somewhere else to look for a matching kernel
> > > > > > config?
> > > > >
> > > > > I don't know if that is the issue but beware that some device trees
> > > > > invert serial0 with serial1. Make sure to use /soc/serial@7e215040. You
> > > > > can do that by passing dtuart=/soc/serial@7e215040 to the Xen command
> > > > > line.
> > > >
> > > > I already have that set as part of the boot process, but it still
> > > > doesn't print anything out once Xen is started.
> > > >
> > > > I tried the 5.6 device tree, and no help there, eithers.  I'm wondering
> > > > if everyone is still running with the 4.19 device trees.
> > >
> > > As I pointed out in the EVE link above -- we're very happily running
> > > with 5.6 device trees. They are, of course, taken from RPI kernel
> > > tree.
> >
> > Ok, what version of Xen are you running?  I'm using 4.13 with the Pi
> > patches, but I have not tried the master branch.
>
> We're running 4.14 + additional patches (not sure which ones will make
> it into 4.14 proper yet):
>     https://github.com/lf-edge/eve/tree/master/pkg/xen/arch/aarch64
>
> FWIW: the first patch is basically the delta between 4.13 and 4.14

Corey: try adding these to your u-boot script:

# Define the size and address cells
fdt set /chosen '#size-cells' <1>
fdt set /chosen '#address-cells' <1>

It looks like the 4.19 kernel device tree has those nodes set by the
time the u-boot script picks up after the GPU's work on the device
tree, but the more recent 5.4 and 5.6 kernels do not. Adding those in
within the u-boot script, I've been able to successfully boot the
Linux 5.4 and 5.6 kernels from meta-raspberrypi as well as a local
build of the Eve 5.6 kernel.

Stefano has a patch to do something similar in the Eve series here:
https://github.com/lf-edge/eve/blob/master/pkg/new-kernel/patches-5.6.x/0013-adding-stdout-path-overlay.patch

I've just posted an updated series to meta-virt to enable Xen on Rpi4
with Linux 5.4 (the current Yocto kernel version) here:
https://lists.yoctoproject.org/g/meta-virtualization/message/5449

Christopher

