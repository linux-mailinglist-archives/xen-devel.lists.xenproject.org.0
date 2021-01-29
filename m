Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F380308CC1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 19:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78409.142665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Yr9-00005H-IR; Fri, 29 Jan 2021 18:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78409.142665; Fri, 29 Jan 2021 18:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Yr9-0008WR-EJ; Fri, 29 Jan 2021 18:50:55 +0000
Received: by outflank-mailman (input) for mailman id 78409;
 Fri, 29 Jan 2021 18:50:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5Yr7-0008WM-UW
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 18:50:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Yr7-00048U-0Q; Fri, 29 Jan 2021 18:50:53 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Yr6-00021T-G7; Fri, 29 Jan 2021 18:50:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=HF3ZwZEA8VkcyJ+bnmm44PCHbASL6TbGzQbL1AS3eQc=; b=UiCaNrc8ecpwwb/AN+shQw/ry2
	Lwmh+bZ6g4E/OvSg9QjcoHmp6eKXAIBgAst0ai9cX4j1GrtmiK8Cw3kylZKa5ozy1gKUh9+GEFlta
	eDLmMCcf48BM/WshGSAjxwBRaSyss4MMky6EzohzYxByd1pZUneeA4pPIYI5xehGdqwk=;
Subject: Re: Question about xen and Rasp 4B
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
Date: Fri, 29 Jan 2021 18:50:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

@Jukka, would it be possible to at least configure your client to quote 
with '>'? This would make easier to understand who wrote what 
(tabulation is not great for that).

If you are using gmail, then configuring it to send it as plain text 
should do the job.

On 27/01/2021 11:47, Jukka Kaartinen wrote:
> 
> 
> On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini 
> <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> 
>     On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
>      > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini
>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>      >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
>      >       > Thanks for the response!
>      >       >
>      >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini
>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>      >       >       + xen-devel, Roman,
>      >       >
>      >       >
>      >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>      >       >       > Hi Stefano,
>      >       >       > I'm Jukka Kaartinen a SW developer working on
>     enabling hypervisors on mobile platforms. One of our HW that we use on
>      >       >       development is
>      >       >       > Raspberry Pi 4B. I wonder if you could help me a
>     bit :).
>      >       >       >
>      >       >       > I'm trying to enable the GPU with Xen + Raspberry
>     Pi for
>      >       >       dom0.
>     https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>     <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605>
>      >       >       >
>      >       >       > I got so far that GPU drivers are loaded (v3d &
>     vc4) without errors. But now Xen returns error when X is starting:
>      >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
>     pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>      >       >       >  I tried to debug what causes this and looks
>     like find_mmio_handler cannot find handler.
>      >       >       > (See more here:
>     https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
>     <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691>
>     )
>      >       >       >
>      >       >       > Any ideas why the handler is not found?
>      >       >
>      >       >
>      >       >       Hi Jukka,
>      >       >
>      >       >       I am glad to hear that you are interested in Xen on
>     RaspberryPi :-)  I
>      >       >       haven't tried the GPU yet, I have been using the
>     serial only.
>      >       >       Roman, did you ever get the GPU working?
>      >       >
>      >       >
>      >       >       The error is a data abort error: Linux is trying to
>     access an address
>      >       >       which is not mapped to dom0. The address seems to
>     be 0x401315d000. It is
>      >       >       a pretty high address; I looked in device tree but
>     couldn't spot it.
>      >       >
>      >       >       >From the HSR (the syndrom register) it looks like
>     it is a translation
>      >       >       fault at EL1 on stage1. As if the Linux address
>     mapping was wrong.
>      >       >       Anyone has any ideas how this could happen? Maybe a
>     reserved-memory
>      >       >       misconfiguration?
>      >       >
>      >       > I had issues with loading the driver in the first place.
>     Apparently swiotlb is used, maybe it can cause this. I also tried to
>      >       enable CMA.
>      >       > config.txt:
>      >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
>      >       > gpu_mem=128
>      >
>      >       Also looking at your other reply and the implementation of
>      >       vc4_bo_create, it looks like this is a CMA problem.
>      >
>      >       It would be good to run a test with the swiotlb-xen disabled:
>      >
>      >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>      >       index 467fa225c3d0..2bdd12785d14 100644
>      >       --- a/arch/arm/xen/mm.c
>      >       +++ b/arch/arm/xen/mm.c
>      >       @@ -138,8 +138,7 @@ void
>     xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>      >        static int __init xen_mm_init(void)
>      >        {
>      >               struct gnttab_cache_flush cflush;
>      >       -       if (!xen_initial_domain())
>      >       -               return 0;
>      >       +       return 0;
>      >               xen_swiotlb_init(1, false);
>      >
>      >               cflush.op = 0;
>      >
>      > With this change the kernel is not booting up. (btw. I'm using
>     USB SSD for my OS.)
>      > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
>      > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>      > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
>     MSI/MSI-X might fail!
>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>      > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
>     MSI/MSI-X might fail!
>      > [    1.212820] usb 1-1: device descriptor read/64, error 18
>      > [    1.452815] usb 1-1: device descriptor read/64, error 18
>      > [    1.820813] usb 1-1: device descriptor read/64, error 18
>      > [    2.060815] usb 1-1: device descriptor read/64, error 18
>      > [    2.845548] usb 1-1: device descriptor read/8, error -61
>      > [    2.977603] usb 1-1: device descriptor read/8, error -61
>      > [    3.237530] usb 1-1: device descriptor read/8, error -61
>      > [    3.369585] usb 1-1: device descriptor read/8, error -61
>      > [    3.480765] usb usb1-port1: unable to enumerate USB device
>      >
>      > Traces stop here. I could try with a memory card. Maybe it makes
>     a difference.
> 
>     This is very surprising. Disabling swiotlb-xen should make things better
>     not worse. The only reason I can think of why it could make things worse
>     is if Linux runs out of low memory. Julien's patch
>     437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have addressed
>     that issue though. Julien, any ideas?

I think, Stefano's small patch is not enough to disable the swiotlb as 
we will still override the DMA ops. You also likely want:

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 8a8949174b1c..aa43e249ecdd 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -2279,7 +2279,7 @@ void arch_setup_dma_ops(struct device *dev, u64 
dma_base, u64 size,
         set_dma_ops(dev, dma_ops);

  #ifdef CONFIG_XEN
-       if (xen_initial_domain())
+       if (0 || xen_initial_domain())
                 dev->dma_ops = &xen_swiotlb_dma_ops;
  #endif
         dev->archdata.dma_ops_setup = true;

Otherwise, you would still use the swiotlb DMA ops that would not be 
functional as we disabled the swiotlb.

This would explain the following error because it will check whether the 
mask is valid using the callback dma_supported():

[    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask

> 
> I really don't know if this is a problem but in the 
> allocate_memory_11  arch_get_dma_bitsize is called. That should return 
> the platform->dma_bitsize but at the early stage of boot platform is not 
> initialized so default 32 is returned. I tried changing the hard code 
> from 32 -> 30 but it didn't make any difference.
> 
>     static void __init allocate_memory_11(struct domain *d,
>                                            struct kernel_info *kinfo)
>     {
>          const unsigned int min_low_order =
>              get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>          const unsigned int min_order = get_order_from_bytes(MB(4));
>          struct page_info *pg;
>          unsigned int order = get_allocation_size(kinfo->unassigned_mem);
>          int i;
> 
>          bool lowmem = true;
>          unsigned int lowmem_bitsize = min(32U, *arch_get_dma_bitsize*());

Domain memory allocation will always happen after platform_init() is 
called. So the value returned here will be correct.

> 
> also here the place where static dma_bitsize is set is not called for dom0
> 
> 
>     void __init end_boot_allocator(void)
>     {
>     ....
>          if ( !dma_bitsize && (num_online_nodes() > 1) )
>              dma_bitsize = arch_get_dma_bitsize();
> 
> and will lead alloc_domheap_pages not to use dma_bitsize since it is not 
> set.
> struct page_info *alloc_domheap_pages(
>      struct domain *d, unsigned int order, unsigned int memflags)
> {
> 
> uses static: dma_bitsize and currently is not set for raspberry pi.

Right, this is normal because we don't support NUMA on Arm so 
num_online_nodes() would always return 1.

But I don't yet see the problem with the existing code. We will still 
try to allocate at least one bank below 30 bits on RPI.

 From the log you provided:
(XEN) Allocating 1:1 mappings totalling 5120MB for dom0:
(XEN) BANK[0] 0x00000008000000-0x00000028000000 (512MB)
(XEN) BANK[1] 0x00000080000000-0x000000c0000000 (1024MB)
(XEN) BANK[2] 0x00000100000000-0x000001e0000000 (3584MB)

You have 512MB of memory allocated below the 30 bits mark.

Are you expecting more memory to be allocated below the 30-bits?

If you

Cheers,

-- 
Julien Grall

