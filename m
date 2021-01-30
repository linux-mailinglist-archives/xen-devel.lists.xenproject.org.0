Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145CC30914B
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 02:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78605.143060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fCo-0008My-80; Sat, 30 Jan 2021 01:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78605.143060; Sat, 30 Jan 2021 01:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fCo-0008MW-1r; Sat, 30 Jan 2021 01:37:42 +0000
Received: by outflank-mailman (input) for mailman id 78605;
 Sat, 30 Jan 2021 01:37:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybww=HB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l5fCm-0008MR-54
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 01:37:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1db98cd-7bf0-43be-b8f9-00e15378ca7b;
 Sat, 30 Jan 2021 01:37:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EC1D64E04;
 Sat, 30 Jan 2021 01:37:38 +0000 (UTC)
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
X-Inumbo-ID: a1db98cd-7bf0-43be-b8f9-00e15378ca7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611970658;
	bh=8ViLtPGQh2hYhtyovKkk6YbGj1EZk5lSevRHdmKyzg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D0CPi8y88x4STPO5TD0WJ0hXBzjt54frZ9S1eLZ+tgpdpvvHioyPt65Q1ze/bBoGx
	 o+tBb6hrJIMQNzcPI54rjK9fYffo1A/Wq1Eq6FrrdnI0AbahJMgqHgmDqtF3Re6Hlf
	 MpwdjXg5RBmNjGjNqroue7Jdu5Gnuz8mQhFdENzwE/XVBpOQh4UZ223sNeDSNgMwvt
	 R+qnWp/4jqnhY3dJ44NjRmyJpy21FS3VOd5TsnTq1Ici16WmW6ZGwTxd5Mm67SMV3j
	 ivhEPyVnB/4mWG6JbS2C/tFDcMKEvRB3nRrqAdr83kV2jmrlnAO6iJ68+a50RbfGoi
	 mcVdxrn1GWFvQ==
Date: Fri, 29 Jan 2021 17:37:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Roman Shaposhnik <roman@zededa.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
Message-ID: <alpine.DEB.2.21.2101291734320.9684@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com> <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com> <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s> <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com> <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1177540558-1611970658=:9684"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1177540558-1611970658=:9684
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 29 Jan 2021, Julien Grall wrote:
> Hi,
> 
> @Jukka, would it be possible to at least configure your client to quote with
> '>'? This would make easier to understand who wrote what (tabulation is not
> great for that).
> 
> If you are using gmail, then configuring it to send it as plain text should do
> the job.
> 
> On 27/01/2021 11:47, Jukka Kaartinen wrote:
> > 
> > 
> > On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini <sstabellini@kernel.org
> > <mailto:sstabellini@kernel.org>> wrote:
> > 
> >     On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
> >      > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini
> >     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >      >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
> >      >       > Thanks for the response!
> >      >       >
> >      >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini
> >     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> >      >       >       + xen-devel, Roman,
> >      >       >
> >      >       >
> >      >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> >      >       >       > Hi Stefano,
> >      >       >       > I'm Jukka Kaartinen a SW developer working on
> >     enabling hypervisors on mobile platforms. One of our HW that we use on
> >      >       >       development is
> >      >       >       > Raspberry Pi 4B. I wonder if you could help me a
> >     bit :).
> >      >       >       >
> >      >       >       > I'm trying to enable the GPU with Xen + Raspberry
> >     Pi for
> >      >       >       dom0.
> >     https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >     <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605>
> >      >       >       >
> >      >       >       > I got so far that GPU drivers are loaded (v3d &
> >     vc4) without errors. But now Xen returns error when X is starting:
> >      >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
> >     pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >      >       >       >  I tried to debug what causes this and looks
> >     like find_mmio_handler cannot find handler.
> >      >       >       > (See more here:
> >     https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
> >     <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691>
> >     )
> >      >       >       >
> >      >       >       > Any ideas why the handler is not found?
> >      >       >
> >      >       >
> >      >       >       Hi Jukka,
> >      >       >
> >      >       >       I am glad to hear that you are interested in Xen on
> >     RaspberryPi :-)  I
> >      >       >       haven't tried the GPU yet, I have been using the
> >     serial only.
> >      >       >       Roman, did you ever get the GPU working?
> >      >       >
> >      >       >
> >      >       >       The error is a data abort error: Linux is trying to
> >     access an address
> >      >       >       which is not mapped to dom0. The address seems to
> >     be 0x401315d000. It is
> >      >       >       a pretty high address; I looked in device tree but
> >     couldn't spot it.
> >      >       >
> >      >       >       >From the HSR (the syndrom register) it looks like
> >     it is a translation
> >      >       >       fault at EL1 on stage1. As if the Linux address
> >     mapping was wrong.
> >      >       >       Anyone has any ideas how this could happen? Maybe a
> >     reserved-memory
> >      >       >       misconfiguration?
> >      >       >
> >      >       > I had issues with loading the driver in the first place.
> >     Apparently swiotlb is used, maybe it can cause this. I also tried to
> >      >       enable CMA.
> >      >       > config.txt:
> >      >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
> >      >       > gpu_mem=128
> >      >
> >      >       Also looking at your other reply and the implementation of
> >      >       vc4_bo_create, it looks like this is a CMA problem.
> >      >
> >      >       It would be good to run a test with the swiotlb-xen disabled:
> >      >
> >      >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >      >       index 467fa225c3d0..2bdd12785d14 100644
> >      >       --- a/arch/arm/xen/mm.c
> >      >       +++ b/arch/arm/xen/mm.c
> >      >       @@ -138,8 +138,7 @@ void
> >     xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
> >      >        static int __init xen_mm_init(void)
> >      >        {
> >      >               struct gnttab_cache_flush cflush;
> >      >       -       if (!xen_initial_domain())
> >      >       -               return 0;
> >      >       +       return 0;
> >      >               xen_swiotlb_init(1, false);
> >      >
> >      >               cflush.op = 0;
> >      >
> >      > With this change the kernel is not booting up. (btw. I'm using
> >     USB SSD for my OS.)
> >      > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> >      > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> >      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> >      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >      > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
> >     MSI/MSI-X might fail!
> >      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >      > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
> >     MSI/MSI-X might fail!
> >      > [    1.212820] usb 1-1: device descriptor read/64, error 18
> >      > [    1.452815] usb 1-1: device descriptor read/64, error 18
> >      > [    1.820813] usb 1-1: device descriptor read/64, error 18
> >      > [    2.060815] usb 1-1: device descriptor read/64, error 18
> >      > [    2.845548] usb 1-1: device descriptor read/8, error -61
> >      > [    2.977603] usb 1-1: device descriptor read/8, error -61
> >      > [    3.237530] usb 1-1: device descriptor read/8, error -61
> >      > [    3.369585] usb 1-1: device descriptor read/8, error -61
> >      > [    3.480765] usb usb1-port1: unable to enumerate USB device
> >      >
> >      > Traces stop here. I could try with a memory card. Maybe it makes
> >     a difference.
> > 
> >     This is very surprising. Disabling swiotlb-xen should make things better
> >     not worse. The only reason I can think of why it could make things worse
> >     is if Linux runs out of low memory. Julien's patch
> >     437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed
> >     that issue though. Julien, any ideas?
> 
> I think, Stefano's small patch is not enough to disable the swiotlb as we will
> still override the DMA ops. You also likely want:
> 
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index 8a8949174b1c..aa43e249ecdd 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -2279,7 +2279,7 @@ void arch_setup_dma_ops(struct device *dev, u64
> dma_base, u64 size,
>         set_dma_ops(dev, dma_ops);
> 
>  #ifdef CONFIG_XEN
> -       if (xen_initial_domain())
> +       if (0 || xen_initial_domain())
>                 dev->dma_ops = &xen_swiotlb_dma_ops;
>  #endif
>         dev->archdata.dma_ops_setup = true;
> 
> Otherwise, you would still use the swiotlb DMA ops that would not be
> functional as we disabled the swiotlb.
> 
> This would explain the following error because it will check whether the mask
> is valid using the callback dma_supported():
> 
> [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask

Well spotted! On older kernels the change to xen_mm_init was sufficient,
but on more recent kernels it is not enough anymore. Sorry about that!

BTW if (0 || xen_initial_domain()) would still return true so you might
want something like:

diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..f73066bed3ec 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -53,7 +53,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		iommu_setup_dma_ops(dev, dma_base, size);
 
 #ifdef CONFIG_XEN
-	if (xen_initial_domain())
+	if (0)
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
--8323329-1177540558-1611970658=:9684--

