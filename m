Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8D3095DA
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 15:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78904.143654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5r54-0007gR-KW; Sat, 30 Jan 2021 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78904.143654; Sat, 30 Jan 2021 14:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5r54-0007g5-HR; Sat, 30 Jan 2021 14:18:30 +0000
Received: by outflank-mailman (input) for mailman id 78904;
 Sat, 30 Jan 2021 14:18:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5r53-0007g0-7O
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 14:18:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5r52-0000Kq-86; Sat, 30 Jan 2021 14:18:28 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5r51-0006wn-RT; Sat, 30 Jan 2021 14:18:28 +0000
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
	bh=LnbFlPWgLYaTqP5VfC47KtpWNfFw47tJbt7PtfwB7ak=; b=BuP07VcW3xSsmMsj1WQ03iTfbt
	7Il/kDo/F/0yECNyRKEdSykjiVGetmDpZ8O/+qc0x5q22Llu3DHynVs2vXEhu/dnachoIoZcFKnca
	CQxocdFoX5zYXp4+d/JIoVs+6TMuLLay4lOTkrO9dZeo9/zm1IMv9qdI0eQFcYNzuFKw=;
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
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c44d45ed-f03e-e901-4a46-0ce57504703f@xen.org>
Date: Sat, 30 Jan 2021 14:18:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jukka,

On 30/01/2021 13:53, Jukka Kaartinen wrote:
> 
> 
> On 29.1.2021 20.50, Julien Grall wrote:
>> Hi,
>>
>> @Jukka, would it be possible to at least configure your client to 
>> quote with '>'? This would make easier to understand who wrote what 
>> (tabulation is not great for that).
>>
>> If you are using gmail, then configuring it to send it as plain text 
>> should do the job.
> Sorry about that. May it's now better. Yes it is gmail. Maybe 
> Thunderbird works better.

It should be possible to do it with the gmail web interface. Although, I 
know it has a few quirks when dealing with plain text.

Anyway, your reply is quoting with > now. Thank you for that!

> 
>>
>> On 27/01/2021 11:47, Jukka Kaartinen wrote:
>>>
>>>
>>> On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini 
>>> <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>
>>>     On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
>>>      > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini
>>>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>      >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
>>>      >       > Thanks for the response!
>>>      >       >
>>>      >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini
>>>     <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>      >       >       + xen-devel, Roman,
>>>      >       >
>>>      >       >
>>>      >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>>>      >       >       > Hi Stefano,
>>>      >       >       > I'm Jukka Kaartinen a SW developer working on
>>>     enabling hypervisors on mobile platforms. One of our HW that we 
>>> use on
>>>      >       >       development is
>>>      >       >       > Raspberry Pi 4B. I wonder if you could help me a
>>>     bit :).
>>>      >       >       >
>>>      >       >       > I'm trying to enable the GPU with Xen + Raspberry
>>>     Pi for
>>>      >       >       dom0.
>>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>>> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605> 
>>>
>>>      >       >       >
>>>      >       >       > I got so far that GPU drivers are loaded (v3d &
>>>     vc4) without errors. But now Xen returns error when X is starting:
>>>      >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
>>>     pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>>>      >       >       >  I tried to debug what causes this and looks
>>>     like find_mmio_handler cannot find handler.
>>>      >       >       > (See more here:
>>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 
>>>
>>> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691> 
>>>
>>>     )
>>>      >       >       >
>>>      >       >       > Any ideas why the handler is not found?
>>>      >       >
>>>      >       >
>>>      >       >       Hi Jukka,
>>>      >       >
>>>      >       >       I am glad to hear that you are interested in Xen on
>>>     RaspberryPi :-)  I
>>>      >       >       haven't tried the GPU yet, I have been using the
>>>     serial only.
>>>      >       >       Roman, did you ever get the GPU working?
>>>      >       >
>>>      >       >
>>>      >       >       The error is a data abort error: Linux is trying to
>>>     access an address
>>>      >       >       which is not mapped to dom0. The address seems to
>>>     be 0x401315d000. It is
>>>      >       >       a pretty high address; I looked in device tree but
>>>     couldn't spot it.
>>>      >       >
>>>      >       >       >From the HSR (the syndrom register) it looks like
>>>     it is a translation
>>>      >       >       fault at EL1 on stage1. As if the Linux address
>>>     mapping was wrong.
>>>      >       >       Anyone has any ideas how this could happen? Maybe a
>>>     reserved-memory
>>>      >       >       misconfiguration?
>>>      >       >
>>>      >       > I had issues with loading the driver in the first place.
>>>     Apparently swiotlb is used, maybe it can cause this. I also tried to
>>>      >       enable CMA.
>>>      >       > config.txt:
>>>      >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
>>>      >       > gpu_mem=128
>>>      >
>>>      >       Also looking at your other reply and the implementation of
>>>      >       vc4_bo_create, it looks like this is a CMA problem.
>>>      >
>>>      >       It would be good to run a test with the swiotlb-xen 
>>> disabled:
>>>      >
>>>      >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>>>      >       index 467fa225c3d0..2bdd12785d14 100644
>>>      >       --- a/arch/arm/xen/mm.c
>>>      >       +++ b/arch/arm/xen/mm.c
>>>      >       @@ -138,8 +138,7 @@ void
>>>     xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int 
>>> order)
>>>      >        static int __init xen_mm_init(void)
>>>      >        {
>>>      >               struct gnttab_cache_flush cflush;
>>>      >       -       if (!xen_initial_domain())
>>>      >       -               return 0;
>>>      >       +       return 0;
>>>      >               xen_swiotlb_init(1, false);
>>>      >
>>>      >               cflush.op = 0;
>>>      >
>>>      > With this change the kernel is not booting up. (btw. I'm using
>>>     USB SSD for my OS.)
>>>      > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
>>>      > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
>>>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
>>>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>>>      > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
>>>     MSI/MSI-X might fail!
>>>      > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>>>      > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
>>>     MSI/MSI-X might fail!
>>>      > [    1.212820] usb 1-1: device descriptor read/64, error 18
>>>      > [    1.452815] usb 1-1: device descriptor read/64, error 18
>>>      > [    1.820813] usb 1-1: device descriptor read/64, error 18
>>>      > [    2.060815] usb 1-1: device descriptor read/64, error 18
>>>      > [    2.845548] usb 1-1: device descriptor read/8, error -61
>>>      > [    2.977603] usb 1-1: device descriptor read/8, error -61
>>>      > [    3.237530] usb 1-1: device descriptor read/8, error -61
>>>      > [    3.369585] usb 1-1: device descriptor read/8, error -61
>>>      > [    3.480765] usb usb1-port1: unable to enumerate USB device
>>>      >
>>>      > Traces stop here. I could try with a memory card. Maybe it makes
>>>     a difference.
>>>
>>>     This is very surprising. Disabling swiotlb-xen should make things 
>>> better
>>>     not worse. The only reason I can think of why it could make 
>>> things worse
>>>     is if Linux runs out of low memory. Julien's patch
>>>     437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have 
>>> addressed
>>>     that issue though. Julien, any ideas?
>>
>> I think, Stefano's small patch is not enough to disable the swiotlb as 
>> we will still override the DMA ops. You also likely want:
>>
>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index 8a8949174b1c..aa43e249ecdd 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -2279,7 +2279,7 @@ void arch_setup_dma_ops(struct device *dev, u64 
>> dma_base, u64 size,
>>          set_dma_ops(dev, dma_ops);
>>
>>   #ifdef CONFIG_XEN
>> -       if (xen_initial_domain())
>> +       if (0 || xen_initial_domain())
>>                  dev->dma_ops = &xen_swiotlb_dma_ops;
>>   #endif
>>          dev->archdata.dma_ops_setup = true;
>>
>> Otherwise, you would still use the swiotlb DMA ops that would not be 
>> functional as we disabled the swiotlb.
>>
>> This would explain the following error because it will check whether 
>> the mask is valid using the callback dma_supported():
>>
>> [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
>>
> Good catch.
> GPU works now and I can start X! Thanks! I was also able to create domU 
> that runs Raspian OS.

Glad to hear it works! IIRC, the swiotlb may become necessary when 
running guest if the guest memory ends up to be used for DMA transaction.

> 
> Now that swiotlb is disabled what does it mean?

I can see two reasons:
   1) You have limited memory below the 30 bits mark. So Swiotlb and CMA 
may try to fight for the low memory.
   2) We found a few conversion bugs in the swiotlb on RPI4 last year 
(IIRC the DMA and physical address may be different). I looked at the 
Linux branch you are using and they seem to all be there. So there might 
be another bug.

I am not sure how to figure out where is the problem. Stefano, do you 
have a suggestion where to start?

> 
> And also can I pass the GPU to domU? Raspberry Pi 4 is limited HW and 
> doesn't have IOMMU. I'm trying to create similar OS like QubesOS where 
> GPU, Network, keyboard/mouse, ... are isolated to their own VMs.

Without an IOMMU or any other HW mechamisns (e.g. MPU), it would not be 
safe to assign a DMA-capable device to a non-trusted VM.

If you trust the VM where you assigned a device, then a possible 
approach would be to have the VM direct mapped (e.g. guest physical 
address == host physical address). Although, I can foreese some issues 
if you have multiple VMs requires memory below 30 bits (there seem to be 
limited amount)>

If you don't trust the VM where you assigned a device, then your best 
option will be to expose a PV interface of the device and have your 
backend sanitizing the request and issuing it on behalf of the guest.

Cheers,

-- 
Julien Grall

