Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C748430ECBF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 07:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81163.149433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Yas-0006RV-NN; Thu, 04 Feb 2021 06:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81163.149433; Thu, 04 Feb 2021 06:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Yas-0006R6-Ji; Thu, 04 Feb 2021 06:58:22 +0000
Received: by outflank-mailman (input) for mailman id 81163;
 Thu, 04 Feb 2021 06:58:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKvr=HG=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l7Yar-0006Qv-AH
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 06:58:21 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce5bbfcb-b232-40d2-aca6-6330c848ba0a;
 Thu, 04 Feb 2021 06:58:19 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p21so2916881lfu.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 22:58:19 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id c123sm486652lfd.95.2021.02.03.22.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 22:58:16 -0800 (PST)
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
X-Inumbo-ID: ce5bbfcb-b232-40d2-aca6-6330c848ba0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o2J4PvJuU5zTwoRlljd91RCboBAigDUhGuZu9n0nTWQ=;
        b=szCHrWWN2DVvWNV+8WDAQk4Ik2w5pkTzM2vL0WFaPcPSnMe/GY4AV3jS+Km3MvTsZ8
         Dk/OiyA4P2cLeyv9OMGIGaJyFqEZtpaHR7SpZmA5Jl6aTm1/fc6noOZsfbrp341P6+sA
         mIg4nNhEYXtf7Kk5ZTioPQf7f57/PNh/HsjMOtbjebWFPAmYeWW3EBADiUXmTLuLooRk
         x8s4OnSQCKvGVICNBajyQLXijYjwNqG03xPyh6RJ/3yOm2XRBAMFa/TPpEi06YwBqwxO
         HO3A9j0q7geapmIRGX4yQoOy5PoNnUxNHprdNWobUqX+TWUUgJfqqoValGmfQSZ8BS5e
         AUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o2J4PvJuU5zTwoRlljd91RCboBAigDUhGuZu9n0nTWQ=;
        b=asnYbI1tNtnRQOxAVAZ0PEbIxeD5KA1BNA7s4y7gIfFGbvuX8wm6zntZcqFNzIFxKo
         3lCUTpPbZt57hnboXD2+LZrBi5dFciIg7Vs6M9vm/U9YOQrrINHJSi0/0maxiI7MUqLV
         CQ9VA2wR44and+trCj8UPro0fJ/b22dtU1AH5350Z70HA75w3NRgTQuXBdDof9u230TB
         YTQLtqMTvl9wXeDqd7u5FEB8dFmu8n1HUW3oeO4AJON4ZNIDXMJzv80O8yrF2+4gUeJF
         zTXd8lTK/K0LM7pDGhlhKy2zOqk7ZDu7SrerLLNLR7hc1aSNPmX+IknAtz4DtG0EvAul
         Bl5Q==
X-Gm-Message-State: AOAM533tTIMdtjXSvGTecrXEi3VoRuZN4ann+vyvgU7Pc9wTxHksDXBl
	IskqJDs3a5Ir+sYaZaN4IT/+vQ==
X-Google-Smtp-Source: ABdhPJyQWfNeG4Q0a5X70VUTRT+Z+CppYArMzJgKifbyDXk70HmzwQmSjeldnmKt2uZbMIgIB9+htQ==
X-Received: by 2002:a19:7f4d:: with SMTP id a74mr3899374lfd.618.1612421898141;
        Wed, 03 Feb 2021 22:58:18 -0800 (PST)
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
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
 <c44d45ed-f03e-e901-4a46-0ce57504703f@xen.org>
 <alpine.DEB.2.21.2102011055080.29047@sstabellini-ThinkPad-T480s>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <6a0dab88-aede-f048-fb86-b2a786ac3674@unikie.com>
Date: Thu, 4 Feb 2021 08:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102011055080.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1.2.2021 21.25, Stefano Stabellini wrote:
> On Sat, 30 Jan 2021, Julien Grall wrote:
>>>> On 27/01/2021 11:47, Jukka Kaartinen wrote:
>>>>>
>>>>>
>>>>> On Tue, Jan 26, 2021 at 10:22 PM Stefano Stabellini
>>>>> <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>>>
>>>>>      On Tue, 26 Jan 2021, Jukka Kaartinen wrote:
>>>>>       > On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini
>>>>>      <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>>>       >       On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
>>>>>       >       > Thanks for the response!
>>>>>       >       >
>>>>>       >       > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini
>>>>>      <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>>>>>       >       >       + xen-devel, Roman,
>>>>>       >       >
>>>>>       >       >
>>>>>       >       >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>>>>>       >       >       > Hi Stefano,
>>>>>       >       >       > I'm Jukka Kaartinen a SW developer working on
>>>>>      enabling hypervisors on mobile platforms. One of our HW that we use
>>>>> on
>>>>>       >       >       development is
>>>>>       >       >       > Raspberry Pi 4B. I wonder if you could help me a
>>>>>      bit :).
>>>>>       >       >       >
>>>>>       >       >       > I'm trying to enable the GPU with Xen + Raspberry
>>>>>      Pi for
>>>>>       >       >       dom0.
>>>>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>>>>> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605>
>>>>>       >       >       >
>>>>>       >       >       > I got so far that GPU drivers are loaded (v3d &
>>>>>      vc4) without errors. But now Xen returns error when X is starting:
>>>>>       >       >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045
>>>>>      pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
>>>>>       >       >       >  I tried to debug what causes this and looks
>>>>>      like find_mmio_handler cannot find handler.
>>>>>       >       >       > (See more here:
>>>>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
>>>>> <https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691>
>>>>>      )
>>>>>       >       >       >
>>>>>       >       >       > Any ideas why the handler is not found?
>>>>>       >       >
>>>>>       >       >
>>>>>       >       >       Hi Jukka,
>>>>>       >       >
>>>>>       >       >       I am glad to hear that you are interested in Xen on
>>>>>      RaspberryPi :-)  I
>>>>>       >       >       haven't tried the GPU yet, I have been using the
>>>>>      serial only.
>>>>>       >       >       Roman, did you ever get the GPU working?
>>>>>       >       >
>>>>>       >       >
>>>>>       >       >       The error is a data abort error: Linux is trying to
>>>>>      access an address
>>>>>       >       >       which is not mapped to dom0. The address seems to
>>>>>      be 0x401315d000. It is
>>>>>       >       >       a pretty high address; I looked in device tree but
>>>>>      couldn't spot it.
>>>>>       >       >
>>>>>       >       >       >From the HSR (the syndrom register) it looks like
>>>>>      it is a translation
>>>>>       >       >       fault at EL1 on stage1. As if the Linux address
>>>>>      mapping was wrong.
>>>>>       >       >       Anyone has any ideas how this could happen? Maybe a
>>>>>      reserved-memory
>>>>>       >       >       misconfiguration?
>>>>>       >       >
>>>>>       >       > I had issues with loading the driver in the first place.
>>>>>      Apparently swiotlb is used, maybe it can cause this. I also tried to
>>>>>       >       enable CMA.
>>>>>       >       > config.txt:
>>>>>       >       > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
>>>>>       >       > gpu_mem=128
>>>>>       >
>>>>>       >       Also looking at your other reply and the implementation of
>>>>>       >       vc4_bo_create, it looks like this is a CMA problem.
>>>>>       >
>>>>>       >       It would be good to run a test with the swiotlb-xen
>>>>> disabled:
>>>>>       >
>>>>>       >       diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>>>>>       >       index 467fa225c3d0..2bdd12785d14 100644
>>>>>       >       --- a/arch/arm/xen/mm.c
>>>>>       >       +++ b/arch/arm/xen/mm.c
>>>>>       >       @@ -138,8 +138,7 @@ void
>>>>>      xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int
>>>>> order)
>>>>>       >        static int __init xen_mm_init(void)
>>>>>       >        {
>>>>>       >               struct gnttab_cache_flush cflush;
>>>>>       >       -       if (!xen_initial_domain())
>>>>>       >       -               return 0;
>>>>>       >       +       return 0;
>>>>>       >               xen_swiotlb_init(1, false);
>>>>>       >
>>>>>       >               cflush.op = 0;
>>>>>       >
>>>>>       > With this change the kernel is not booting up. (btw. I'm using
>>>>>      USB SSD for my OS.)
>>>>>       > [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
>>>>>       > [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
>>>>>       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
>>>>>       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>>>>>       > [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or
>>>>>      MSI/MSI-X might fail!
>>>>>       > (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
>>>>>       > [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or
>>>>>      MSI/MSI-X might fail!
>>>>>       > [    1.212820] usb 1-1: device descriptor read/64, error 18
>>>>>       > [    1.452815] usb 1-1: device descriptor read/64, error 18
>>>>>       > [    1.820813] usb 1-1: device descriptor read/64, error 18
>>>>>       > [    2.060815] usb 1-1: device descriptor read/64, error 18
>>>>>       > [    2.845548] usb 1-1: device descriptor read/8, error -61
>>>>>       > [    2.977603] usb 1-1: device descriptor read/8, error -61
>>>>>       > [    3.237530] usb 1-1: device descriptor read/8, error -61
>>>>>       > [    3.369585] usb 1-1: device descriptor read/8, error -61
>>>>>       > [    3.480765] usb usb1-port1: unable to enumerate USB device
>>>>>       >
>>>>>       > Traces stop here. I could try with a memory card. Maybe it makes
>>>>>      a difference.
>>>>>
>>>>>      This is very surprising. Disabling swiotlb-xen should make things
>>>>> better
>>>>>      not worse. The only reason I can think of why it could make things
>>>>> worse
>>>>>      is if Linux runs out of low memory. Julien's patch
>>>>>      437b0aa06a014ce174e24c0d3530b3e9ab19b18b for Xen should have
>>>>> addressed
>>>>>      that issue though. Julien, any ideas?
>>>>
>>>> I think, Stefano's small patch is not enough to disable the swiotlb as we
>>>> will still override the DMA ops. You also likely want:
>>>>
>>>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>>>> index 8a8949174b1c..aa43e249ecdd 100644
>>>> --- a/arch/arm/mm/dma-mapping.c
>>>> +++ b/arch/arm/mm/dma-mapping.c
>>>> @@ -2279,7 +2279,7 @@ void arch_setup_dma_ops(struct device *dev, u64
>>>> dma_base, u64 size,
>>>>           set_dma_ops(dev, dma_ops);
>>>>
>>>>    #ifdef CONFIG_XEN
>>>> -       if (xen_initial_domain())
>>>> +       if (0 || xen_initial_domain())
>>>>                   dev->dma_ops = &xen_swiotlb_dma_ops;
>>>>    #endif
>>>>           dev->archdata.dma_ops_setup = true;
>>>>
>>>> Otherwise, you would still use the swiotlb DMA ops that would not be
>>>> functional as we disabled the swiotlb.
>>>>
>>>> This would explain the following error because it will check whether the
>>>> mask is valid using the callback dma_supported():
>>>>
>>>> [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
>>>>
>>> Good catch.
>>> GPU works now and I can start X! Thanks! I was also able to create domU that
>>> runs Raspian OS.
>>
>> Glad to hear it works! IIRC, the swiotlb may become necessary when running
>> guest if the guest memory ends up to be used for DMA transaction.
> 
> It is necessary if you are using PV network or PV disk: memory shared by
> another domU could end up being used in a DMA transaction. For that, you
> need swiotlb-xen.
> 
>   
>>> Now that swiotlb is disabled what does it mean?
>>
>> I can see two reasons:
>>    1) You have limited memory below the 30 bits mark. So Swiotlb and CMA may
>> try to fight for the low memory.
>>    2) We found a few conversion bugs in the swiotlb on RPI4 last year (IIRC the
>> DMA and physical address may be different). I looked at the Linux branch you
>> are using and they seem to all be there. So there might be another bug.
>>
>> I am not sure how to figure out where is the problem. Stefano, do you have a
>> suggestion where to start?
> 
> Both 1) and 2) are possible. It is also possible that another driver,
> probably something related to CMA or DRM, has some special dma_ops
> handling that doesn't work well together with swiotlb-xen.
> 
> Given that the original error seemed to be related to vc4_bo_create,
> which calls dma_alloc_wc, I would add a couple of printks to
> xen_swiotlb_alloc_coherent to help us figure it out:
> 
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2b385c1b4a99..cac8b09af603 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -295,6 +295,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>   	/* Convert the size to actually allocated. */
>   	size = 1UL << (order + XEN_PAGE_SHIFT);
>   
> +	printk("DEBUG %s %d size=%lu flags=%lx attr=%lx\n",__func__,__LINE__,size,flags,attrs);
>   	/* On ARM this function returns an ioremap'ped virtual address for
>   	 * which virt_to_phys doesn't return the corresponding physical
>   	 * address. In fact on ARM virt_to_phys only works for kernel direct
> @@ -315,16 +316,20 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>   	phys = dma_to_phys(hwdev, *dma_handle);
>   	dev_addr = xen_phys_to_dma(hwdev, phys);
>   	if (((dev_addr + size - 1 <= dma_mask)) &&
> -	    !range_straddles_page_boundary(phys, size))
> +	    !range_straddles_page_boundary(phys, size)) {
>   		*dma_handle = dev_addr;
> -	else {
> +		printk("DEBUG %s %d phys=%lx dma=%lx\n",__func__,__LINE__,phys,dev_addr);
> +	} else {
>   		if (xen_create_contiguous_region(phys, order,
>   						 fls64(dma_mask), dma_handle) != 0) {
> +			printk("DEBUG %s %d\n",__func__,__LINE__);
>   			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
>   			return NULL;
>   		}
>   		*dma_handle = phys_to_dma(hwdev, *dma_handle);
>   		SetPageXenRemapped(virt_to_page(ret));
> +		printk("DEBUG %s %d dma_mask=%d page_boundary=%d phys=%lx dma=%lx\n",__func__,__LINE__,
> +			((dev_addr + size - 1 <= dma_mask)),range_straddles_page_boundary(phys, size),phys,*dma_handle);
>   	}
>   	memset(ret, 0, size);
>   	return ret;
> 
> 
> 
> 
>>> And also can I pass the GPU to domU? Raspberry Pi 4 is limited HW and
>>> doesn't have IOMMU. I'm trying to create similar OS like QubesOS where GPU,
>>> Network, keyboard/mouse, ... are isolated to their own VMs.
>>
>> Without an IOMMU or any other HW mechamisns (e.g. MPU), it would not be safe
>> to assign a DMA-capable device to a non-trusted VM.
>>
>> If you trust the VM where you assigned a device, then a possible approach
>> would be to have the VM direct mapped (e.g. guest physical address == host
>> physical address). Although, I can foreese some issues if you have multiple
>> VMs requires memory below 30 bits (there seem to be limited amount)>
>>
>> If you don't trust the VM where you assigned a device, then your best option
>> will be to expose a PV interface of the device and have your backend
>> sanitizing the request and issuing it on behalf of the guest.
> 
> FYI you could do that with the existing PVFB drivers that only support 2D
> graphics.
> 

We really need direct HW access so PVFB is not really an option. And at 
this point. We can trust the VMs.


Any idea what am I missing something here is this the way to give domu 
access to the memory?

# from dom0: cat /proc/iomem
# fe104000-fe104027 : fe104000.rng rng@7e104000

# to hide the above rng from the dom0 I added these to device-tree and 
above line from /proc/iomem dissapiered.
boot2.scr:
fdt set /soc/rng@7e104000 xen,passthrough <0x1>
fdt set /soc/rng@7e104000 status disabled


domu.cfg:
iomem = [ 'fe104,1' ]

domu start but I cannot see that address in the domu iomem range.
Also the device-tree from the domu is quite empty.

Do I need something like:
device_tree = "rng.dtb"

like here:
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg02618.html


I tried to add
dtdev = [ "/soc/rng@7e104000" ]
but this gives be error:
"libxl: error: libxl_create.c:1107:libxl__domain_config_setdefault: 
passthrough not supported on this platform"

Will this happen if generate the rng.dtb?

