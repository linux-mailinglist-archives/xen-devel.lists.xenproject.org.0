Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7F30B530
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 03:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80285.146744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lLE-0002qd-UW; Tue, 02 Feb 2021 02:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80285.146744; Tue, 02 Feb 2021 02:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lLE-0002qE-RI; Tue, 02 Feb 2021 02:22:56 +0000
Received: by outflank-mailman (input) for mailman id 80285;
 Tue, 02 Feb 2021 02:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wa+X=HE=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l6lLD-0002q9-L2
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 02:22:55 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae7bdef8-1278-45af-bd3a-cc458dac47cd;
 Tue, 02 Feb 2021 02:22:54 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t14so13923078qto.8
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 18:22:54 -0800 (PST)
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
X-Inumbo-ID: ae7bdef8-1278-45af-bd3a-cc458dac47cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+OKJAguCpfNQDJWPH186SyUiA9w+kRtBMsZ1drKwIgA=;
        b=YsLJ0rLn3w7TgEWcM5IIZ22nrtyWkUcPZfJ4uqFfe1QoyMOG//7wJ204xkMih3Qo0r
         mYq88f2x8DD0GVqp9CZFKyXeSBLt/ft7IeWzlcCdWIp46/T1ijDQA7VfBAbtffj08cVn
         68wu6AiYBZ8p7v2WReQhknLVaM6jgbWkk9rUyGTdmMVu7f3FOCR6dpvCjsdh48edVjqS
         12GaaNfLAcKYB2AJT93eaBaPzn++3jo04Mxkmc+rWqqhbQNLh2B5djpHEBanGGR/NKpI
         cqWFnzHN7rE6r+aP+qGJxwwb5zQqrvIHt75Ri/qzBRx+FyZuXerlotOA+SnTWpTFSVL/
         Z70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OKJAguCpfNQDJWPH186SyUiA9w+kRtBMsZ1drKwIgA=;
        b=qoYkkjb+2M6a0luTSYq4NYvrQ3qRtzH0qU0YA4XfZtpLdYP3W0ZUccekXXPb30lYsE
         63xZ930GOC4VSedblrinxV9/R2Acx80mOCsMev75Josq3m8TZmfd2Pmc3Nqv019V7d9O
         jJzXNKt/DPmS6J9qzS+1RvsN8SJ0Bb4VQYxqvsi1jt85Alrqn4s311MJmm8NunqjQN/A
         GTNuni9sHTa1rYzib35uBal7ZeQzJOgnnKZnAqJVUiNmeehN6x/hsOH2hBKdkmEebSz7
         2IJkoTAptRQiPeZhbhPwc6pH08dj8I7p8kTUncved+FN+zF8EYpKw6PNKVa4JqQAzmy6
         mZ2g==
X-Gm-Message-State: AOAM532xRYmG1XriOJMWeVZDiJL14qBQ7x+jH7dLX4OGOH/vPdWnO9gR
	4n8k5Oe/b8YZghkY2rxnlP6gUD2XL6pSqLqDzY3DUg==
X-Google-Smtp-Source: ABdhPJwoVyn182H4cK2krOHz3RcxkvPdl2fNkeXjDsWrGaHwZ6S8ImDEDD8INbhWnLuC/RJSOJZMnxMg20AUvOmiBa8=
X-Received: by 2002:ac8:4f52:: with SMTP id i18mr17346821qtw.113.1612232574090;
 Mon, 01 Feb 2021 18:22:54 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org> <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
In-Reply-To: <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 1 Feb 2021 18:22:43 -0800
Message-ID: <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 30, 2021 at 5:53 AM Jukka Kaartinen
<jukka.kaartinen@unikie.com> wrote:
> > On 27/01/2021 11:47, Jukka Kaartinen wrote:
> >>
> >>
> >> On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini
> >> <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >>
> >>     On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
> >>      > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini
> >>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >>      >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
> >>      >       > Thanks for the response!
> >>      >       >
> >>      >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini
> >>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >>      >       >       + xen-devel, Roman,
> >>      >       >
> >>      >       >
> >>      >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> >>      >       >       > Hi Stefano,
> >>      >       >       > I'm Jukka Kaartinen a SW developer working on
> >>     enabling hypervisors on mobile platforms. One of our HW that we
> >> use on
> >>      >       >       development is
> >>      >       >       > Raspberry Pi 4B. I wonder if you could help me a
> >>     bit :).
> >>      >       >       >
> >>      >       >       > I'm trying to enable the GPU with Xen + Raspberry
> >>     Pi for
> >>      >       >       dom0.
> >>
> >> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >>
> >> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605>
> >>      >       >       >
> >>      >       >       > I got so far that GPU drivers are loaded (v3d &
> >>     vc4) without errors. But now Xen returns error when X is starting:
> >>      >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
> >>     pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >>      >       >       >  I tried to debug what causes this and looks
> >>     like find_mmio_handler cannot find handler.
> >>      >       >       > (See more here:
> >>
> >> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
> >>
> >>
> >> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691>
> >>
> >>     )
> >>      >       >       >
> >>      >       >       > Any ideas why the handler is not found?
> >>      >       >
> >>      >       >
> >>      >       >       Hi Jukka,
> >>      >       >
> >>      >       >       I am glad to hear that you are interested in Xen on
> >>     RaspberryPi :-)  I
> >>      >       >       haven't tried the GPU yet, I have been using the
> >>     serial only.
> >>      >       >       Roman, did you ever get the GPU working?
> >>      >       >
> >>      >       >
> >>      >       >       The error is a data abort error: Linux is trying to
> >>     access an address
> >>      >       >       which is not mapped to dom0. The address seems to
> >>     be 0x401315d000. It is
> >>      >       >       a pretty high address; I looked in device tree but
> >>     couldn't spot it.
> >>      >       >
> >>      >       >       >From the HSR (the syndrom register) it looks like
> >>     it is a translation
> >>      >       >       fault at EL1 on stage1. As if the Linux address
> >>     mapping was wrong.
> >>      >       >       Anyone has any ideas how this could happen? Maybe a
> >>     reserved-memory
> >>      >       >       misconfiguration?
> >>      >       >
> >>      >       > I had issues with loading the driver in the first place.
> >>     Apparently swiotlb is used, maybe it can cause this. I also tried to
> >>      >       enable CMA.
> >>      >       > config.txt:
> >>      >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
> >>      >       > gpu_mem=128
> >>      >
> >>      >       Also looking at your other reply and the implementation of
> >>      >       vc4_bo_create, it looks like this is a CMA problem.
> >>      >
> >>      >       It would be good to run a test with the swiotlb-xen
> >> disabled:
> >>      >
> >>      >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >>      >       index 467fa225c3d0..2bdd12785d14 100644
> >>      >       --- a/arch/arm/xen/mm.c
> >>      >       +++ b/arch/arm/xen/mm.c
> >>      >       @@ -138,8 +138,7 @@ void
> >>     xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
> >>      >        static int __init xen_mm_init(void)
> >>      >        {
> >>      >               struct gnttab_cache_flush cflush;
> >>      >       -       if (!xen_initial_domain())
> >>      >       -               return 0;
> >>      >       +       return 0;
> >>      >               xen_swiotlb_init(1, false);
> >>      >
> >>      >               cflush.op = 0;
> >>      >
> >>      > With this change the kernel is not booting up. (btw. I'm using
> >>     USB SSD for my OS.)
> >>      > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> >>      > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> >>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> >>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >>      > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
> >>     MSI/MSI-X might fail!
> >>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >>      > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
> >>     MSI/MSI-X might fail!
> >>      > [    1.212820] usb 1-1: device descriptor read/64, error 18
> >>      > [    1.452815] usb 1-1: device descriptor read/64, error 18
> >>      > [    1.820813] usb 1-1: device descriptor read/64, error 18
> >>      > [    2.060815] usb 1-1: device descriptor read/64, error 18
> >>      > [    2.845548] usb 1-1: device descriptor read/8, error -61
> >>      > [    2.977603] usb 1-1: device descriptor read/8, error -61
> >>      > [    3.237530] usb 1-1: device descriptor read/8, error -61
> >>      > [    3.369585] usb 1-1: device descriptor read/8, error -61
> >>      > [    3.480765] usb usb1-port1: unable to enumerate USB device
> >>      >
> >>      > Traces stop here. I could try with a memory card. Maybe it makes
> >>     a difference.
> >>
> >>     This is very surprising. Disabling swiotlb-xen should make things
> >> better
> >>     not worse. The only reason I can think of why it could make things
> >> worse
> >>     is if Linux runs out of low memory. Julien's patch
> >>     437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have
> >> addressed
> >>     that issue though. Julien, any ideas?
> >
> > I think, Stefano's small patch is not enough to disable the swiotlb as
> > we will still override the DMA ops. You also likely want:
> >
> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> > index 8a8949174b1c..aa43e249ecdd 100644
> > --- a/arch/arm/mm/dma-mapping.c
> > +++ b/arch/arm/mm/dma-mapping.c
> > @@ -2279,7 +2279,7 @@ void arch_setup_dma_ops(struct device *dev, u64
> > dma_base, u64 size,
> >          set_dma_ops(dev, dma_ops);
> >
> >   #ifdef CONFIG_XEN
> > -       if (xen_initial_domain())
> > +       if (0 || xen_initial_domain())
> >                  dev->dma_ops = &xen_swiotlb_dma_ops;
> >   #endif
> >          dev->archdata.dma_ops_setup = true;
> >
> > Otherwise, you would still use the swiotlb DMA ops that would not be
> > functional as we disabled the swiotlb.
> >
> > This would explain the following error because it will check whether the
> > mask is valid using the callback dma_supported():
> >
> > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> >
> Good catch.
> GPU works now and I can start X! Thanks! I was also able to create domU
> that runs Raspian OS.

This is very interesting that you were able to achieve that - congrats!

Now, sorry to be a bit dense -- but since this thread went into all
sorts of interesting
directions all at once -- I just have a very particular question: what is exact
combination of versions of Xen, Linux kernel and a set of patches that went
on top that allowed you to do that? I'd love to obviously see it
productized in Xen
upstream, but for now -- I'd love to make available to Project EVE/Xen community
since there seems to be a few folks interested in EVE/Xen combo being able to
do that.

Thanks,
Roman.

