Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8474306AFB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 03:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76527.138135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4wtx-0000PN-0e; Thu, 28 Jan 2021 02:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76527.138135; Thu, 28 Jan 2021 02:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4wtw-0000Oy-Th; Thu, 28 Jan 2021 02:19:16 +0000
Received: by outflank-mailman (input) for mailman id 76527;
 Thu, 28 Jan 2021 02:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IsKK=G7=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l4wtw-0000Ot-6h
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 02:19:16 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74be655e-29de-4de9-bd5d-977981123c08;
 Thu, 28 Jan 2021 02:19:14 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id a7so3938957qkb.13
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 18:19:14 -0800 (PST)
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
X-Inumbo-ID: 74be655e-29de-4de9-bd5d-977981123c08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYSAugB6rrJOLSRT6ew3DqYgA9ChCBmh3NvOJqcLi/M=;
        b=kfuPpazbh8fN4LkvXVUu3mFwt3dWljRcjZWFWa/f9bRjWtPOQS2kKPQq/o3nIWRDnA
         TrsK3plM/RPU05LhDEwqKVyCYyiMRQmA5kkPV3DRQvksQoNVOfinH7dPIGZPMIUsIVUn
         2fr8OiFDY9bgAwfoliBCjkhFL0QptGFHlSAV/EvZaTswPjuz9N7rErVV2zZm017IRkxO
         febbvmoJACHHo2B5wl1BaEVLEY6TRO6Mynl//sVmWhTb+j6dgbKgRFTBK1AsImp1raVk
         2cDGqYIKrQCUX/7JuuBOZua70N44QRxlISAdGQPBYgxQQ0PUIwuWu8NMN8t7ChoOBAmp
         xbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYSAugB6rrJOLSRT6ew3DqYgA9ChCBmh3NvOJqcLi/M=;
        b=jUr7A1pm9RjRt9iFQCAuk5uYNyLWPyQjWw8o3ejW2kBFxWirfpepkzYkfGFz2n0wLe
         g4etLE/auC0t6YAMWwQ0FRS/YnJHNk6LWWmQs9lCwRuUY7A5qv12ktFwRcXQaUZgQjVG
         YiGq/M/jjqdR92Wpju8yTnFXktfi1ZBT6U7qEmBoR21sZyMYUrqy6BNEY24sD7nJfzyz
         eTjScTvxXkXdbkNum/oqSCXdrJJUHzgCb6zI4GsnlSQqD7ZJCkbgILRkOtD+DsWDrEQk
         7m0SBEXhHGe2UGhsubbwYuDpbVOYaoU6qaDI07MyhxpcDsUlu2OTIPIdACv4tmEhEtz5
         3YcA==
X-Gm-Message-State: AOAM533yiXkWuxs4Ool6TDj5CS3pID3eZzy5lwV9pcdRD0TItDzX6owe
	27cYu1YziJj12cRXj/TYMoPt/z/dsGtkBlOUFsOz5g==
X-Google-Smtp-Source: ABdhPJwMfX8Wu6umHF5mdpTQk68A3JZVn1c8pyoFhhGMozY/Pu2UDMZIlXoLiifqEBjkUCe91OLo/foMraoE/UJJ97Y=
X-Received: by 2002:a05:620a:152b:: with SMTP id n11mr12620558qkk.267.1611800354580;
 Wed, 27 Jan 2021 18:19:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com> <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 27 Jan 2021 18:19:03 -0800
Message-ID: <CAMmSBy-3_BY0z6jmFi+_GHfhKR6bV7z1RBNDcekqr5Mx8gBRRQ@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 5:10 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 27 Jan 2021, Jukka Kaartinen wrote:
> > On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini <sstabellini@kernel.org> wrote:
> >       On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
> >       > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
> >       >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
> >       >       > Thanks for the response!
> >       >       >
> >       >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <sstabellini@kernel.org> wrote:
> >       >       >       + xen-devel, Roman,
> >       >       >
> >       >       >
> >       >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> >       >       >       > Hi Stefano,
> >       >       >       > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we
> >       use on
> >       >       >       development is
> >       >       >       > Raspberry Pi 4B. I wonder if you could help me a bit :).
> >       >       >       >
> >       >       >       > I'm trying to enable the GPU with Xen + Raspberry Pi for
> >       >       >       dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >       >       >       >
> >       >       >       > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is
> >       starting:
> >       >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >       >       >       >  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
> >       >       >       > (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
> >       >       >       >
> >       >       >       > Any ideas why the handler is not found?
> >       >       >
> >       >       >
> >       >       >       Hi Jukka,
> >       >       >
> >       >       >       I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> >       >       >       haven't tried the GPU yet, I have been using the serial only.
> >       >       >       Roman, did you ever get the GPU working?
> >       >       >
> >       >       >
> >       >       >       The error is a data abort error: Linux is trying to access an address
> >       >       >       which is not mapped to dom0. The address seems to be 0x401315d000. It is
> >       >       >       a pretty high address; I looked in device tree but couldn't spot it.
> >       >       >
> >       >       >       >From the HSR (the syndrom register) it looks like it is a translation
> >       >       >       fault at EL1 on stage1. As if the Linux address mapping was wrong.
> >       >       >       Anyone has any ideas how this could happen? Maybe a reserved-memory
> >       >       >       misconfiguration?
> >       >       >
> >       >       > I had issues with loading the driver in the first place. Apparently swiotlb is used, maybe it can cause this. I also
> >       tried to
> >       >       enable CMA.
> >       >       > config.txt:
> >       >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
> >       >       > gpu_mem=128
> >       >
> >       >       Also looking at your other reply and the implementation of
> >       >       vc4_bo_create, it looks like this is a CMA problem.
> >       >
> >       >       It would be good to run a test with the swiotlb-xen disabled:
> >       >
> >       >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >       >       index 467fa225c3d0..2bdd12785d14 100644
> >       >       --- a/arch/arm/xen/mm.c
> >       >       +++ b/arch/arm/xen/mm.c
> >       >       @@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
> >       >        static int __init xen_mm_init(void)
> >       >        {
> >       >               struct gnttab_cache_flush cflush;
> >       >       -       if (!xen_initial_domain())
> >       >       -               return 0;
> >       >       +       return 0;
> >       >               xen_swiotlb_init(1, false);
> >       >
> >       >               cflush.op = 0;
> >       >
> >       > With this change the kernel is not booting up. (btw. I'm using USB SSD for my OS.)
> >       > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> >       > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> >       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> >       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >       > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> >       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> >       > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
> >       > [    1.212820] usb 1-1: device descriptor read/64, error 18
> >       > [    1.452815] usb 1-1: device descriptor read/64, error 18
> >       > [    1.820813] usb 1-1: device descriptor read/64, error 18
> >       > [    2.060815] usb 1-1: device descriptor read/64, error 18
> >       > [    2.845548] usb 1-1: device descriptor read/8, error -61
> >       > [    2.977603] usb 1-1: device descriptor read/8, error -61
> >       > [    3.237530] usb 1-1: device descriptor read/8, error -61
> >       > [    3.369585] usb 1-1: device descriptor read/8, error -61
> >       > [    3.480765] usb usb1-port1: unable to enumerate USB device
> >       >
> >       > Traces stop here. I could try with a memory card. Maybe it makes a difference.
> >
> >       This is very surprising. Disabling swiotlb-xen should make things better
> >       not worse. The only reason I can think of why it could make things worse
> >       is if Linux runs out of low memory. Julien's patch
> >       437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed
> >       that issue though. Julien, any ideas?
> >
> > I really don't know if this is a problem but in the allocate_memory_11  arch_get_dma_bitsize is called. That should return the
> > platform->dma_bitsize but at the early stage of boot platform is not initialized so default 32 is returned. I tried changing the hard code
> > from 32 -> 30 but it didn't make any difference.
> >       static void __init allocate_memory_11(struct domain *d,
> >                                       struct kernel_info *kinfo)
> > {
> >     const unsigned int min_low_order =
> >         get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
> >     const unsigned int min_order = get_order_from_bytes(MB(4));
> >     struct page_info *pg;
> >     unsigned int order = get_allocation_size(kinfo->unassigned_mem);
> >     int i;
> >
> >     bool lowmem = true;
> >     unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
> >
> > also here the place where static dma_bitsize is set is not called for dom0
> >
> > void __init end_boot_allocator(void)
> > {
> > ....
> >     if ( !dma_bitsize && (num_online_nodes() > 1) )
> >         dma_bitsize = arch_get_dma_bitsize();
> >
> >
> > and will lead alloc_domheap_pages not to use dma_bitsize since it is not set.
> > struct page_info *alloc_domheap_pages(
> >     struct domain *d, unsigned int order, unsigned int memflags)
> > {
> >
> > uses static: dma_bitsize and currently is not set for raspberry pi.
>
> You can easily check from the device tree in dom0 what memory range was
> allocated for it by Xen. The memory node is simply called "memory". We
> might be able to understand if the range is too high from there.
>
> FYI I have just ordered a micro HDMI cable so I might be able to provide
> more useful feedback in the following days.

Speaking of which -- I'm also curious where this leads (esp. given our
use of newer,
non-Rpi specific kernels) so I can run all sorts of experiments with EVE too.

Thanks,
Roman.

