Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3814AA45C
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 00:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265848.459407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG81X-0004TX-Op; Fri, 04 Feb 2022 23:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265848.459407; Fri, 04 Feb 2022 23:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG81X-0004QA-Kl; Fri, 04 Feb 2022 23:29:51 +0000
Received: by outflank-mailman (input) for mailman id 265848;
 Fri, 04 Feb 2022 23:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Jar=ST=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1nG81W-0004Q4-4b
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 23:29:50 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57989bb6-8612-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 00:29:48 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id f17so14028013wrx.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Feb 2022 15:29:48 -0800 (PST)
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
X-Inumbo-ID: 57989bb6-8612-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fhBu9ZA0oxZTBNNS6i+4wooMfskOYkVOkdHvMUQFW34=;
        b=YOpk0LUa9TnhR9Po0IHOtQGOJNtLuzLRj+zalJyTRDSKhTJy3efDeiRUP6qaVY1deB
         EFrBLUshRFnVvDP0fHyHVfkQygHr/ZTEFZHcKZOVmWzF3Lu6Y0SrGhIHV3H7xWTslgtJ
         UVmXEZJ7cLqWkwgaClsrQgm4xl++c8sD0xiCMnER57Qdnw2TtOBewsGo76CcWzKDbo9C
         pU+Mjfze35TTKpFcHLI4zZpyqfxaU+S/CfDloL5IOJ7eS2wleOaWfR5WOdQqvaSdJW4k
         Mkn1UF27PsDaYQ/7bZk6JmX7ZImn4VoRqu3KsssmlBKfwXs0IznL9653S8MsoWV3Pj3v
         P1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fhBu9ZA0oxZTBNNS6i+4wooMfskOYkVOkdHvMUQFW34=;
        b=VaY3I3Nu0MmOGSuyinlgxYJ1MEjNCARwg/3g888SH2kQdVrJXQs+WUa6p99sawPUPx
         UIjyTNVTP4l72Msh2qC//ZtDbaUzTgiyFT7Fcn94r4G8HAg2V2Y8r+mv7HxKsG2amfTE
         CK/y/yNy/YGENYlm5BIL9aeMSpGK0P3Zf5rwDDHclbj+0q80W9qfc86qoQ2fTFHSy6Mp
         1RFiOWNOU7StWbcXbNK/tsepP48qfBcqxprhxWtF2G+ipLUZpRNbSYvKGVBRSYun5fSB
         um0977OHwqgi0PcWqtqSTmP2KdrljcEt8/xvfJv8chyPYPxGzsADmy5TXtgQ/8rPpysG
         k8aQ==
X-Gm-Message-State: AOAM530B4aogrHdIiwkct0v+r2iT57l3Bj+4iy29Z4rRc1Pep9O4QfJR
	lzpWnn6US7EmgbVr2irAUny08dSE/ZY+kL5VIAM=
X-Google-Smtp-Source: ABdhPJwUYSjOtreQ6af6zZEi9QXx+6VHXqT6SYrV+VzTvPfuPSQ2rkDLuDOQDnXwyZQs/IY0cxUCyNxIm+1ZFVJ3Q4g=
X-Received: by 2002:adf:9169:: with SMTP id j96mr947909wrj.710.1644017386460;
 Fri, 04 Feb 2022 15:29:46 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
 <20220204135814.1033356-1-michael@walle.cc> <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
 <faa7864d4df6d9373a3c6b489d3e4469@walle.cc>
In-Reply-To: <faa7864d4df6d9373a3c6b489d3e4469@walle.cc>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 4 Feb 2022 23:29:34 +0000
Message-ID: <CAJ=z9a0GX31E-yQRO3BpOujOCX09yOeeROkC57PzAUTUm3HV6g@mail.gmail.com>
Subject: Re: Xen data from meta-virtualization layer
To: Michael Walle <michael@walle.cc>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Zhiqiang.Hou@nxp.com, brucea@xilinx.com, 
	cornelia.bruelhart@zal.aero, leo.krueger@zal.aero, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Peng Fan <peng.fan@nxp.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Fri, 4 Feb 2022 at 22:42, Michael Walle <michael@walle.cc> wrote:
> Am 2022-02-04 22:11, schrieb Stefano Stabellini:
> > On Fri, 4 Feb 2022, Michael Walle wrote:
> >> > In regards to the reserved-memory regions, maybe we are not seeing them
> >> > because Leo posted the host device tree, not the one passed at runtime
> >> > from u-boot to Linux?
> >> >
> >> > If so, Leo, could you please boot Linux on native (no Xen) and get the
> >> > device tree from there at runtime using dtc -I fs -O dts
> >> > /proc/device-tree ?
> >> >
> >> >
> >> > However, the name of the reserved-memory region created by u-boot seems
> >> > to be "lpi_rd_table". I cannot find any mentions of lpi_rd_table in the
> >> > Linux kernel tree either.
> >> >
> >> > Zhiqiang, Leo is trying to boot Xen on sAL28. Linux booting on Xen
> >> > throws errors in regards to GIC/ITS initialization. On other hardware
> >> > Xen can use and virtualize GICv3 and ITS just fine. Could you please
> >> > explain what is different about sAL28 and how Xen/Linux is expected to
> >> > use the lpi_rd_table reserved-memory region?
> >>
> >> I actually stumbled across this thread after trying out Xen myself.
> >> I'm
> >> using lastest vanilla u-boot (with pending PSCI patches), vanilla
> >> kernel
> >> and vanilla Xen.
> >>
> >> So far I've discovered, that xen complains that it cannot route IRQ64
> >> to
> >> dom0. That is because on the LS1028A there is a dual UART (two 16550
> >> with one shared interrupt) and xen takes the first UART and then tries
> >> to map the interrupt of the second UART to linux. For now, I don't
> >> know
> >> how this is solved correctly. As a quick hack, I removed the second
> >> uart
> >> node from the device tree.
> >
> > This is an interesting problem. Removing the second UART is a good
> > workaround for now as there is no obvious solution I think.
>
> But not a very user friendly one, though. I guess the first UART
> is disabled/removed by Xen? I haven't looked at how it is handled.
>
> Can't we search for other uarts with the same interrupt and disable
> these, too? Maybe conditionally by the SoC compatible?

The problem sounds quite similar to the one we had on sunxi. Although
the UART was on the same page rather than sharing interrupts.

Xen has per-platform hook to prevent a device been assigned
to dom0. For an example, you could look at:

https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/platforms/sunxi.c

> >> This is the first developer experience with Xen, so please bear with
> >> me
> >> :) It seems that Xen doesn't add the master to the IOMMU. To me it
> >> seems
> >> that only devices with a 'iommus' dt property are added. But in case
> >> of
> >> PCI devices the parent only has a iommu-map property.
> >>
> >> And it makes me wonder why Leo has an almost working setup. Maybe I'm
> >> missing some patches though.
> >
> > Xen 4.16 is able to parse StreamID in the "iommus" property and also
> > "mmu-masters" property. But It is not able to parse the "iommu-map"
> > property yet. So if 0x42a is described in device tree using "iommu-map"
> > then the error makes sense.
> >
> > A simple solution is to replace iommu-map with iommus in device tree.
>
> I'm not sure this is so easy, because they are dynamically assigned
> by the bootloader. Sure for now I could do that I guess, but iommu=0
> works as well ;)
>
> I now got Xen and Linux booting and see the same problems with the
> GIC ITS, that is that the enetc interrupts aren't delivered to the
> dom0 linux. I've also applied the patch in this thread and I'm
> seeing the same as Leo. Full boot log is here [1].
>
> I noticed the following.
> [    0.168544] pci 0000:00:00.0: Failed to add - passthrough or
> MSI/MSI-X might fail!

This message is harmless. This is printed because Xen on Arm
doesn't hypercall the hypercall to add a PCI device. On Arm,
we don't need it yet (it might be necessary for PCI passthrough) and
MSI/MSI-X are handled/registered the same way as on bare-metal
(for your case through the ITS)

>
> Not sure if it should work nonetheless.

I looked through the log and couldn't spot anything obvious. However,
skimming through Linux, I noticed there are some changes in the
ITS for freescale (now NXP) such as:

drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

Is it something that might be used on the board you are using?

If the answer is yes, then my suggestion would be to look
how this is meant to interact with the ITS. It might be possible
that we are missing some pieces in Xen to properly support it.

>
> > It is possible that someone in CC to this email might already have a
> > patch to introduce parsing of iommu-map in Xen.

Pass. I don't have any and couldn't find any submission on the ML.


>
> I guess they've used the old mmu-masters property.
>
> Btw. I don't know if it matters, but the SMARC-sAL28 normally doesn't
> use TF-A and runs without it. Nonetheless, I've booted the board with
> the bl31 from NXP and it doesn't help either. There is still a
> difference between the NXP bootflow which uses bl1/bl2/bl31/u-boot
> and this board which uses u-boot-spl/u-boot or u-boot-spl/bl31/u-boot.
>
> I just found GIC setup code in the bl31. I'll also have a look there.
>
> -michael
>
> [1] https://pastebin.com/raw/XMjE3BvG

