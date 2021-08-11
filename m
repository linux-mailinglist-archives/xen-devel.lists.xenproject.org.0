Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4693E9473
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 17:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166130.303391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDq2B-0001zs-NS; Wed, 11 Aug 2021 15:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166130.303391; Wed, 11 Aug 2021 15:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDq2B-0001y5-Jp; Wed, 11 Aug 2021 15:20:47 +0000
Received: by outflank-mailman (input) for mailman id 166130;
 Wed, 11 Aug 2021 15:20:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDq2A-0001xz-6w
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 15:20:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDq29-00009u-AM; Wed, 11 Aug 2021 15:20:45 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDq29-00075y-2U; Wed, 11 Aug 2021 15:20:45 +0000
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
	bh=h6pvGcwmLzOojSISgrl3LkHzXQIhFp6MwiStpQlWDHM=; b=Xhr7IqTorDZiCAZ4Ysw0z50j9Z
	gBG2Y0qWWKkJRgR8C9chbmCqRZfbrFIxIJpxqWYxmnVF8cACLhyDNCnQSv3Oau/OMQ8JWpFtt0H6i
	dn5Y794an8gcZOXFghkqVhPYTfuR3NEQDlSeaMbjxzGC2uMog7677t82E+8oi9g7cxrg=;
Subject: Re: Disable swiotlb for Dom0
To: Roman Skakun <Roman_Skakun@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roman Skakun <rm.skakun@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
 <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <691e31db-c79b-9196-53e1-cbbdc9bd3a54@xen.org>
Date: Wed, 11 Aug 2021 16:20:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 11/08/2021 15:13, Roman Skakun wrote:
>> > Also, I added the log in xen_swiotlb_detect() and can see that swiotlb
>> > still used (other devices within dom0 used too), when dom0 is direct 
> mapped:
>> >
>> > [    1.870363] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> > [    1.878352] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> > [    1.886309] xen_swiotlb_detect() dev: rcar-fcp,
>> > XENFEAT_direct_mapped, use swiotlb
>> >
>>> This means, that all  devices are using swiotlb-xen DMA fops.
>> > By the way, before applying this patches, dom0 always used swiotlb-xen
>> > fops for initial domain by design.
> 
>> >This is expected because your domain is direct mapped.
> 
> May be, I don't understand right, Stefano reported the same issue when 
> dom0 is not direct mapped,
> but I have direct mapped dom0 and problem still exists.

I am not entirely sure why you think this is the same problem as 
Stefano. He asked to bypass the swiotlb, but AFAIK, this is not because 
the buffer get bounced.

Instead, it is because swiotlb-xen on Arm has been relying on its RAM to 
be direct-mapped (GFN == MFN). With cache coloring, the memory will not 
be direct-mapped, hence it will be broken.

> 
>>Ok. Would you be able to provide more information on where the dom0
>>memory is allocated  and the list of host RAM?
> 
> Host memory:
> DRAM:  7.9 GiB
> Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
> Bank #1: 0x500000000 - 0x57fffffff, 2 GiB
> Bank #2: 0x600000000 - 0x67fffffff, 2 GiB
> Bank #3: 0x700000000 - 0x77fffffff, 2 GiB
> 
> dom0 memory map:
> (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
> (XEN) BANK[0] 0x00000048000000-0x00000050000000 (128MB)
> (XEN) BANK[1] 0x00000058000000-0x000000c0000000 (1664MB)
> (XEN) BANK[2] 0x00000510000000-0x00000520000000 (256MB)

Thanks! So you have some memory assigned above 4GB to dom0 as well.

>>> We retrieved dev_addr(64b1d0000)  + size > 32bit mask, but fcp driver
>>> wants to use only  32 bit boundary address, but that's consequence.
>>>
>> Ok. So your device is only capable to do a 32-bit DMA. Is that correct?
> 
> Yes.
> 
>> > I think, the main reason of using bounce buffer is MFN address, not DMA
>> > phys address.
>> >
>>I don't understand this sentence. Can you clarify it?
> 
> This address looks like theMFN because I'm using mapped grant tables 
> from domU.
> 
> I've added the log and see the following:
> with swiotlb:
> [   78.620386] dma_map_sg_attrs() dev: rcar-du swiotlb, sg_page: 
> fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma: 64b1d0000
> 
> without swiotlb (worked fine):
> [   74.456426] dma_map_sg_attrs() dev: rcar-du direct map, sg_page: 
> fffffe0001b80000, page_to_phy: b6000000, xen_phys_to_dma:b6000000
> 
> I guess, need to figure out why we got a normal dom0 DMA address 
> (b6000000) and why 64b1d0000 when using swiotlb.

So 0xb6000000 is most likely the GFN used to mapped the grant from the domU.

swiotlb-xen on Arm will convert it to the MFN because it is not aware 
whether the device is behind an IOMMU.

As the address is too high to be handled by the device, swiotlb will try 
to bounce it. I think it is correct to bounce the page but I am not sure 
why it can't. What the size of the DMA transaction?

However, even if you disable xen-swiotlb, you are likely going to face 
the same issue sooner or later because the grant can be mapped anywhere 
in the memory of dom0 (the balloon code doesn't look to restrict where 
the memory can be allocated). So it is possible for the grant to be 
mapped in the dom0 memory above 4GB.

Oleksandr is also looking to provide a safe range which would be outside 
of the existing RAM. So, I believe, you will have to bounce the DMA 
buffer unless we always force the grant/foreign mapping to be mapped 
below 4GB.

Cheers,

-- 
Julien Grall

