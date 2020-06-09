Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E21F3E41
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 16:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifJU-0006P4-HR; Tue, 09 Jun 2020 14:33:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTuU=7W=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jifJT-0006Oz-OG
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:33:15 +0000
X-Inumbo-ID: 26c0d832-aa5e-11ea-8496-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26c0d832-aa5e-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 14:33:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g1so16546509edv.6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GhFdTY087BssM0LHrrXn5Gs8DdReJyWC1sjLIGZq3vs=;
 b=s1g4iZ++6YO96Ozj+KcN70U7zSSJHxijWXfmKe/JSYYvlp7slAg08YOStY9ZsVLv50
 1lDKSfghsJ1ZyYzqT5hgceHVU8LDEaoOqvY70XvBW7L5vaEiC2P7A4FcpMwGaY27izAc
 u5AUTclqWZTM3xX5TlDmFy51riHmzGpRcpG5x05Ejys9cwIneLdhqB8++gDrrh39iulC
 CAm0uXd24rs1iwPYEMbrXc73udIKcz0pBRqqcR2/WhVrg27/aEUAAA2nKgfIC1s0oKN+
 DLzZ1NqbHyz1C5Fn1ep+SqSSqyZDbzpB8UgrYp9bJARTzOKBAOBVBVKzc4PVufmcP6et
 8VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhFdTY087BssM0LHrrXn5Gs8DdReJyWC1sjLIGZq3vs=;
 b=oOdACNKM9XlHbONL8UBoT3I8w6Zp43iHrjw4rNAmLSHdmG5rkWbeUfy5Z8gd7vh0qI
 hZeigyPXl4oWVVDUXU6ppGMFAiWzfebKcrB/ZigVpUySIKpfCWrIO3/443bczjdt3gTA
 cJADDPRqg6AIiQKLxA2bg0mqa3IjifguNdn7abW9cMrss1BhPV/KllB27zqS2Z3nme0m
 8lb0E6s3c6TlY8bRu5ft+0RzcZiauNrj1xpO4cxJqZ6oTx+29G+plglFXFkWkOZes78A
 V4sj0ASUERUGKkEl064eb/lvSD/6LtZmQTT+QhiZPxXSWda6EN8VcJ8SBj+O0ltmo+tr
 jMHQ==
X-Gm-Message-State: AOAM531UjK7eofJtMZnznYpd7x1ZSrRIJIOrilGw0i6Cp7fGQNN1odHs
 xWCujCMntsdUyYZbtxYfeDtuGFM2YhUfS/vQowWDNvGk
X-Google-Smtp-Source: ABdhPJzr7xCCxok/50s3Tfchst0CvihW4+SHAkGVpYPBt5PJC4kzJCMkXGpdSLr7coNvzdl7KFgy4x5DKKPqWgMGr78=
X-Received: by 2002:a50:b2e1:: with SMTP id p88mr27363767edd.198.1591713193842; 
 Tue, 09 Jun 2020 07:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Tue, 9 Jun 2020 10:33:00 -0400
Message-ID: <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
Subject: Re: Keystone Issue
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There does appear to be a secondary (CIC) controller that can forward
events to the GIC-400 and EDMA controllers for the keystone 2 family.
Admittedly, i'm not sure how it is being used with regards to the
peripherals.  I only see mention of the GIC-400 parent for the devices
in the device tree.  Maybe Bertrand has a better idea on whether any
peripherals go through the CIC first?  I see that gic_interrupt ()
fires once in Xen, which calls doIRQ to push out the virtual interrupt
to the dom0 kernel.  The dom0 kernel then handles the interrupt and
returns, but gic_interrupt() never fires again in Xen.

On Mon, Jun 8, 2020 at 12:13 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
>
>
> On Mon, 8 Jun 2020, CodeWiz2280 wrote:
> > It actually shows only 1 interrupt for any of the devices in that list
> > (e.g. spi, ttyS0, ethernet) so you're probably right on the money with
> > it being an interrupt acknowledge issue.  Any help you can provide is
> > greatly appreciated.
> >
> > On Mon, Jun 8, 2020 at 4:40 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> > >
> > >
> > >
> > > > On 5 Jun 2020, at 20:12, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > > >
> > > > On Fri, Jun 5, 2020 at 11:05 AM CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > > >>
> > > >> On Fri, Jun 5, 2020 at 8:47 AM Bertrand Marquis
> > > >> <Bertrand.Marquis@arm.com> wrote:
> > > >>>
> > > >>>
> > > >>>
> > > >>>> On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > > >>>>
> > > >>>> On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
> > > >>>>>
> > > >>>>> Hi,
> > > >>>>>
> > > >>>>> On 05/06/2020 13:25, CodeWiz2280 wrote:
> > > >>>>>> The Keystone uses the netcp driver, which has interrupts from 40-79
> > > >>>>>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
> > > >>>>>> I'm using the same device tree between my non-xen standalone kernel
> > > >>>>>> and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
> > > >>>>>> the ethernet works fine, but I don't see any of its interrupts in the
> > > >>>>>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
> > > >>>>>> running dom0 under Xen either.  When booting with Xen I get this
> > > >>>>>> behavior where the ifconfig output shows 1 RX message and 1 TX
> > > >>>>>> message, and then nothing else.
> > > >>>>>
> > > >>>>> I am not sure whether this is a typo in the e-mail. /proc/iomem is
> > > >>>>> listing the list of the MMIO regions. You want to use /proc/interrupts.
> > > >>>>>
> > > >>>>> Can you confirm which path you are dumping?
> > > >>>> Yes, that was a typo.  Sorry about that.  I meant that I am dumping
> > > >>>> /proc/interrupts and do not
> > > >>>> see them under the non-xen kernel or xen booted dom0.
> > > >>>
> > > >>> Could you post both /proc/interrupts content ?
> > > >>
> > > >> Standalone non-xen kernel (Ethernet works)
> > > >> # cat /proc/interrupts
> > > >>           CPU0       CPU1       CPU2       CPU3
> > > >> 17:          0          0          0          0     GICv2  29 Level
> > > >>  arch_timer
> > > >> 18:       9856       1202        457        650     GICv2  30 Level
> > > >>  arch_timer
> > > >> 21:          0          0          0          0     GICv2 142 Edge
> > > >>  timer-keystone
> > > >> 22:          0          0          0          0     GICv2  52 Edge      arm-pmu
> > > >> 23:          0          0          0          0     GICv2  53 Edge      arm-pmu
> > > >> 24:          0          0          0          0     GICv2  54 Edge      arm-pmu
> > > >> 25:          0          0          0          0     GICv2  55 Edge      arm-pmu
> > > >> 26:          0          0          0          0     GICv2  36 Edge
> > > >>  26202a0.keystone_irq
> > > >> 27:       1435          0          0          0     GICv2 309 Edge      ttyS0
> > > >> 29:          0          0          0          0     GICv2 315 Edge
> > > >>  2530000.i2c
> > > >> 30:          1          0          0          0     GICv2 318 Edge
> > > >>  2530400.i2c
> > > >> 31:          0          0          0          0     GICv2 321 Edge
> > > >>  2530800.i2c
> > > >> 32:         69          0          0          0     GICv2 324 Edge
> > > >>  21000400.spi
> > > >> 33:          0          0          0          0     GICv2 328 Edge
> > > >>  21000600.spi
> > > >> 34:          0          0          0          0     GICv2 332 Edge
> > > >>  21000800.spi
> > > >> 70:          0          0          0          0     GICv2 417 Edge
> > > >>  ks-pcie-error-irq
> > > >> 79:          0          0          0          0   PCI-MSI   0 Edge
> > > >>  PCIe PME, aerdrv
> > > >> 88:         57          0          0          0     GICv2  80 Level
> > > >>  hwqueue-528
> > > >> 89:         57          0          0          0     GICv2  81 Level
> > > >>  hwqueue-529
> > > >> 90:         47          0          0          0     GICv2  82 Level
> > > >>  hwqueue-530
> > > >> 91:         41          0          0          0     GICv2  83 Level
> > > >>  hwqueue-531
> > > >> IPI0:          0          0          0          0  CPU wakeup interrupts
> > > >> IPI1:          0          0          0          0  Timer broadcast interrupts
> > > >> IPI2:        730        988       1058        937  Rescheduling interrupts
> > > >> IPI3:          2          3          4          6  Function call interrupts
> > > >> IPI4:          0          0          0          0  CPU stop interrupts
> > > >> IPI5:          0          0          0          0  IRQ work interrupts
> > > >> IPI6:          0          0          0          0  completion interrupts
> > > >>
> > > >> Xen dom0 (Ethernet stops)
> > > >> # cat /proc/interrupts
> > > >>           CPU0
> > > >> 18:      10380     GIC-0  27 Level     arch_timer
> > > >> 19:          0     GIC-0 142 Edge      timer-keystone
> > > >> 20:         88     GIC-0  16 Level     events
> > > >> 21:          0   xen-dyn     Edge    -event     xenbus
> > > >> 22:          0     GIC-0  36 Edge      26202a0.keystone_irq
> > > >> 23:          1     GIC-0 312 Edge      ttyS0
> > > >> 25:          1     GIC-0 318 Edge
> > > >> 27:          1     GIC-0 324 Edge      21000400.spi
> > > >> 28:          0     GIC-0 328 Edge      21000600.spi
> > > >> 29:          0     GIC-0 332 Edge      21000800.spi
> > > >> 65:          0     GIC-0 417 Edge      ks-pcie-error-irq
> > > >> 74:          0   PCI-MSI   0 Edge      PCIe PME, aerdrv
> > > >> 83:          1     GIC-0  80 Level     hwqueue-528
> > > >> 84:          1     GIC-0  81 Level     hwqueue-529
> > > >> 85:          1     GIC-0  82 Level     hwqueue-530
> > > >> 86:          1     GIC-0  83 Level     hwqueue-531
> > > >> 115:         87   xen-dyn     Edge    -virq      hvc_console
> > > >> IPI0:          0  CPU wakeup interrupts
> > > >> IPI1:          0  Timer broadcast interrupts
> > > >> IPI2:          0  Rescheduling interrupts
> > > >> IPI3:          0  Function call interrupts
> > > >> IPI4:          0  CPU stop interrupts
> > > >> IPI5:          0  IRQ work interrupts
> > > >> IPI6:          0  completion interrupts
> > > >> Err:          0
> > > > After getting a chance to look at this a little more, I believe the
> > > > TX/RX interrupts for the ethernets map like this:
> > > >
> > > > eth0 Rx  - hwqueue-528
> > > > eth1 Rx - hwqueue-529
> > > > eth0 Tx  - hwqueue-530
> > > > eth1 Tx - hwqueue-531
> > > >>
> > > > The interrupt counts in the standlone working kernel seem to roughly
> > > > correspond to the counts of Tx/Rx messages in ifconfig.  Going on
> > > > that, its clear that only 1 interrupt has been received for Tx and 1
> > > > for Rx in the Xen Dom0 equivalent.  Any thoughts on this?
> > >
> > > This definitely look like an interrupt acknowledgement issue.
> > > This could be caused by 2 things I remember of:
> > > - front vs level interrupts
> > > - a problem with forwarded interrupt acknowledgement.
> > > I think there was something related to that where the vcpu ack was not properly
> > > handled on a keystone and I had to change the way the interrupt was acked for
> > > forwarded hardware interrupts.
>
> Is there maybe some sort of secondary interrupt controller (secondary in
> addition to the GIC) or interrupt "concentrator" on KeyStone?
>
> Or is it just a small deviation from normal GIC behavior?

