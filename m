Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4901E30B8E4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 08:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80384.147042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qPb-0003vp-2i; Tue, 02 Feb 2021 07:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80384.147042; Tue, 02 Feb 2021 07:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6qPa-0003vQ-VX; Tue, 02 Feb 2021 07:47:46 +0000
Received: by outflank-mailman (input) for mailman id 80384;
 Tue, 02 Feb 2021 07:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IB5w=HE=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l6qPY-0003vL-O4
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 07:47:44 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dacb6bd1-760e-41b4-b31f-d761e7fd7628;
 Tue, 02 Feb 2021 07:47:43 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r14so22883101ljc.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 23:47:43 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id z2sm3178846lfd.142.2021.02.01.23.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 23:47:41 -0800 (PST)
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
X-Inumbo-ID: dacb6bd1-760e-41b4-b31f-d761e7fd7628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MISwNRhozcbsn1vZzO9Kicf25LlHf5cmWJcAyf8y+X0=;
        b=sP9KRokis3IDfBDnbQbbi3N+ppG/Dk/pm4+70EfwkR8RFp3whk6TCEWMrHUKz6vBvx
         +PeKk2U6Y405E61CNZg9x0xZAUOpcWlyWLF6d6JiGxARRZl1Ap8+DP40KqbJlKF2yE34
         EmWyN/xWWBTvsk3SoTd71O0QmKS0f8prcHUR8qUUVpUFj/5Bes8uKmzFQU4CTw20rDfz
         xJA5ywbC2XvU6ezK5qugYTH9owJ+aicNDOOumRiGjRVVjPmhFCxRjMIogq16byC3SIvz
         OxGC/RHpCNjCi7p4b8g1knszUPOGPRGfUbOquT1OqXhq1SL9jG9sdeVQqIw1RuGlkaR/
         2/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MISwNRhozcbsn1vZzO9Kicf25LlHf5cmWJcAyf8y+X0=;
        b=RR7ePJMGlAw7KeQJLeCVxDe6bH++6NvYsE6HRmNWQNuLP3G+Jny6mUnt7jDRemKN5z
         qk+KRSNnPYh3Gxzpfy4B54oScyqM8mtJKYZhSyyddRIxCuvXJCAAw40UeMMiEFh09CIw
         9n5Y3oGVKBRWygUyDQoeOPvppEiHfaHKmmuBTJxBvpz/8Euf1c8zEpw/2L0b8RKlaU0e
         wJfAqPQQ3WCYAa04pElmka3cpMufydzNZFxNk6CRxVWbLbW6dvOXz+ZchytSHUqVWRu6
         Kb80zI2S9Tqt3Ukh+QcQsgm9ZPyySQ8RilTOhFSxwyejEI280ItXpYNGMn/MnUDmHY8Z
         +I9g==
X-Gm-Message-State: AOAM530Ij4MZaRL3QixkF5Ac4uJZLES4E7nFQX8l5S/t2qtf7oXVj/Iu
	oN72yvMNVwWpkkHe0NkxC8ZV2Q==
X-Google-Smtp-Source: ABdhPJwqYKKMQCLLe3ZqxcIQ6ido/lqBX1NWN+cCPEiFR1wvzfou1Pxk7X1ADz0OjKeoZtFnMQIoGw==
X-Received: by 2002:a2e:988d:: with SMTP id b13mr11849823ljj.176.1612252062382;
        Mon, 01 Feb 2021 23:47:42 -0800 (PST)
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
Message-ID: <598633a0-28b7-6bb2-73b7-c0cb320561d6@unikie.com>
Date: Tue, 2 Feb 2021 09:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102011055080.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


>>
>> Glad to hear it works! IIRC, the swiotlb may become necessary when running
>> guest if the guest memory ends up to be used for DMA transaction.
> 
> It is necessary if you are using PV network or PV disk: memory shared by
> another domU could end up being used in a DMA transaction. For that, you
> need swiotlb-xen.

Sounds bad :).


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
Thanks I will try this.

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
> graphics
I'll keep that in my mind, thanks.


