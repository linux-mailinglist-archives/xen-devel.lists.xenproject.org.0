Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05E82C48B1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 20:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38031.70633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki0jb-0001kj-Il; Wed, 25 Nov 2020 19:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38031.70633; Wed, 25 Nov 2020 19:45:47 +0000
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
	id 1ki0jb-0001kK-Fi; Wed, 25 Nov 2020 19:45:47 +0000
Received: by outflank-mailman (input) for mailman id 38031;
 Wed, 25 Nov 2020 19:45:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ki0jZ-0001kF-Ax
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 19:45:45 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 606e9579-c401-44e0-8626-482e6a1946a7;
 Wed, 25 Nov 2020 19:45:44 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id e60so2477676qtd.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:45:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=al8A=E7=zededa.com=roman@srs-us1.protection.inumbo.net>)
	id 1ki0jZ-0001kF-Ax
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 19:45:45 +0000
X-Inumbo-ID: 606e9579-c401-44e0-8626-482e6a1946a7
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 606e9579-c401-44e0-8626-482e6a1946a7;
	Wed, 25 Nov 2020 19:45:44 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id e60so2477676qtd.3
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 11:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gPw0ACzyIzb+IpR0WmBECb1QTi2xMI8wSnaLcjiD4tE=;
        b=ViRZdOxP5o5CqYvuoj2SyWAl4LFqhODv/ovuIALUUnpS1NoIusfd0bTodE35sS7ptT
         hVSMYZaJuUIfQmH/FQbUJr53SMuOuIxZi/QMbkb0XwJHqDJYdPYyh9jUPYxkAciQ/BEH
         wvP1DPa7LSjEyDjmkFz9D9q7IsoBIlZgXmvkjpKRX+q8+bezn9Rg6YLS09wcRXm8UZ/3
         Ju6pe+TEir8qJrg122ha3skQeHItytAa5+3jcNy6GB/Vwhij1W69pVp0HfcjiEyuAW+b
         r6TANJldEgqfFlm8QWqXS9WvpdyED/S7AMGd9zB4oRjOLEQYuYPE5XySDAzOCFYhyvuX
         XU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gPw0ACzyIzb+IpR0WmBECb1QTi2xMI8wSnaLcjiD4tE=;
        b=YHjb5ueFb12CP8sU5sRPCFEHIXr83JJPhwROyOySL+Hx97XNPunyUzFkgOc2YnuS3s
         bP2Vg9cykJur6glLwiSDREGZtC0mkD17dAk62Gt1fTfC9+8Bl2ByHM3TEjOfHKnroOdT
         FXZMgw/a/77owf1gYIwKCiPKtkQ3wu6Tc/Xdtun9m53NWQFarpruIXggfQ/tSmUxKPhx
         DyrHLHb2Pzui0B3BSSKX+eJlE7Mdyiq/RsQOf03Lytkc27oYhldzSq/XMeAucs6Z6d5M
         hIeLPUjRFrfi38yYB8jedgijDTF3qGsPW55SimXriXsGuJC5u5P+W2dF/mpLgMAf73o7
         bnpw==
X-Gm-Message-State: AOAM530yZJv15lh1KptT4YxB2jbSRHXYYSCOA/syDbmHGl7q5oVWTG2l
	t0gIAuh5LHpOUUCQ0+0+/WGcbOBf9SQDlRskLVHLkg==
X-Google-Smtp-Source: ABdhPJySNUFhgcgvyA+OvIfe1tjVjuNGPil4H0fB1F8AfloXcwGTbG1TPAqwdh9EKb6zy3Ixj9Jnfgu7KectkipJkOg=
X-Received: by 2002:aed:2e67:: with SMTP id j94mr455786qtd.113.1606333543991;
 Wed, 25 Nov 2020 11:45:43 -0800 (PST)
MIME-Version: 1.0
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com> <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com> <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
 <X73owDP0UXx+lvJd@mattapan.m5p.com>
In-Reply-To: <X73owDP0UXx+lvJd@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 25 Nov 2020 11:45:32 -0800
Message-ID: <CAMmSBy90-bwKa+Cm007k793CEM5RSZRHpZimkO=5eyWAm+bKUQ@mail.gmail.com>
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 9:17 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Tue, Nov 24, 2020 at 08:45:32PM -0800, Roman Shaposhnik wrote:
> > On Tue, Nov 24, 2020 at 8:41 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > >
> > > On Tue, Nov 24, 2020 at 08:01:32PM -0800, Roman Shaposhnik wrote:
> > > > On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > > Presently I'm using a 5.8 kernel with your patches and haven't seen
> > > > > graphical output under Xen with either boot stack.  I've confirmed fully
> > > > > operational graphics without Xen on Tianocore, I've confirmed operational
> > > > > virtual terminals with U-Boot and not Xen.
> > > > >
> > > > > I had been planning to wait a bit before moving to 5.9, but if that is
> > > > > the crucial ingredient I'll move early.
> > > >
> > > > We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.
> > > >
> > > > I can bet $10 whatever it is -- it is DT related ;-)
> > >
> > > Given how many of the pieces I'm assembling are alpha or beta level, I
> > > estimate a 50:50 chance on that.  Good odds it is device-tree, but good
> > > odds I grabbed a bad version of $something.
> > >
> > > I mostly wanted to know whether I was in completely uncharted territory
> > > and needed to wait for others to catch up, versus merely working in a
> > > situation where support is funky and I'm at an unknown location in
> > > charted territory.
> > >
> > > I'll be keeping the Tianocore setup available since Xen on ARM really
> > > /should/ allow ACPI...
> >
> > I don't think you're in the uncharted -- so perhaps a bit of debugging left.
> >
> > And, of course, alway feel free to compare what we do -- the image is
> > docker pull away.
>
> Actually, since device-tree is very much on my list of concerns, what is
> your Xen boot process setup like?
>
> Presently as previously mentioned I'm trying for
> U-Boot -> GRUB/EFI -> Xen.

Exactly the same. Here's what we put on a vfat partition:
     https://github.com/lf-edge/eve/tree/master/pkg/u-boot/rpi
and here's how u-boot is built:
     https://github.com/lf-edge/eve/blob/master/pkg/u-boot/Dockerfile

> According to the information I currently have
> the device-trees are often tied pretty closely to the kernel.  I'm also
> using GRUB 2.04 since that has proper support for loading Xen on ARM.

Yes. Our DT here:
    https://github.com/lf-edge/eve/blob/master/pkg/u-boot/rpi/bcm2711-rpi-4-b.dtb
came from an honest build of our kernel (our build is still in flux -- hence
a quick hack of keeping a blob):
    https://github.com/lf-edge/eve/blob/master/pkg/kernel/Dockerfile#L154

> The section of grub.cfg for Linux is roughly:
>     linux /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
>     devicetree /boot/dtb-5.8.10-2rp4-6.1.7
>     initrd /boot/initrd.img-5.8.10-2rp4-6.1.7
>
> My testing section for Xen is:
>     xen_hypervisor /boot/xen-4.14-arm64.efi
>     xen_module /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
>     devicetree /boot/dtb-5.8.10-2rp4-6.1.7
>     xen_module --nounzip /boot/initrd.img-5.8.10-2rp4-6.1.7

Roughly the same -- but see Stefano's comment. More here:
    https://github.com/lf-edge/eve/blob/master/pkg/grub/rootfs.cfg

> I've frankly got no idea how to ensure the correct device-tree is passed
> to Xen.  Is GRUB's `devicetree` command correct when loading Xen?  Is a
> device-tree matched to the Linux kernel appropriate for Xen?
>
> (I'm guessing the second is "yes", but the first I don't have a clue)

While you can use `devicetree`  in GRUB. E.g.:
    https://github.com/lf-edge/eve/blob/master/pkg/grub/rootfs.cfg#L207
on EVE side we've only ever used it as an emergency override.

The happy path boot sequence preserves the DT that RPi bootloader
makes available to u-boot and it gets passed down the chain without
anybody doing anything.

Hope this helps.

Thanks,
Roman.

