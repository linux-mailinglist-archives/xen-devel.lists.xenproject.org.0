Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F21DEEFA
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 20:12:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcC8T-0000jQ-5Z; Fri, 22 May 2020 18:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZMCQ=7E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jcC8R-0000jL-Iy
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 18:11:07 +0000
X-Inumbo-ID: 9993c367-9c57-11ea-ac04-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9993c367-9c57-11ea-ac04-12813bfff9fa;
 Fri, 22 May 2020 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5VJHe7bH8hAm6eUuJu27AVIfqO1GywinPUVd6f11dDs=; b=DWY+wdnfmcr/84yBeVywBch+ZK
 fTpXAobGMc4xRDwXBwl6sZrqstYLh9PhmX7hH6BpImIMbDqxH0KwBngIa7FzJ54wfi8+uWb/5s0Lc
 2zUFol+D+MKCo9/SWg2AWsCLCz2nUacA9ebfwE5fJvSq2hL3jqNbwIifqKzMYPf+uifE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jcC8O-0001Aw-A6; Fri, 22 May 2020 18:11:04 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jcC8O-00043H-2H; Fri, 22 May 2020 18:11:04 +0000
Subject: Re: [PATCH 01/10] swiotlb-xen: use vmalloc_to_page on vmalloc virt
 addresses
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-1-sstabellini@kernel.org>
 <23e5b6d8-c5d9-b43f-41cd-9d02d8ec0a7f@xen.org>
 <alpine.DEB.2.21.2005211235590.27502@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <a7f1d5c1-1ee1-61e3-22be-1db4dced08eb@xen.org>
Date: Fri, 22 May 2020 19:11:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005211235590.27502@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: jgross@suse.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 22/05/2020 04:54, Stefano Stabellini wrote:
> On Thu, 21 May 2020, Julien Grall wrote:
>> Hi,
>>
>> On 21/05/2020 00:45, Stefano Stabellini wrote:
>>> From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>>
>>> Don't just assume that virt_to_page works on all virtual addresses.
>>> Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
>>> virt addresses.
>>
>> Can you provide an example where swiotlb is used with vmalloc()?
> 
> The issue was reported here happening on the Rasperry Pi 4:
> https://marc.info/?l=xen-devel&m=158862573216800

Thanks, it would be good if the commit message contains a bit more details.

> 
> If you are asking where in the Linux codebase the vmalloc is happening
> specifically, I don't know for sure, my information is limited to the
> stack trace that you see in the link (I don't have a Rasperry Pi 4 yet
> but I shall have one soon.)

Looking at the code there is a comment in xen_swiotlb_alloc_coherent() 
suggesting that xen_alloc_coherent_pages() may return an ioremap'ped 
region on Arm. So it feels to me that commit 
b877ac9815a8fe7e5f6d7fdde3dc34652408840a "xen/swiotlb: remember having 
called xen_create_contiguous_region()" has always been broken on Arm.

As an aside, your commit message also suggests this is an issue for 
every virtual address used in swiotlb. But only the virt_to_page() call 
in xen_swiotlb_free_coherent() is modified. Is it intended? If yes, I 
think you want to update your commit message.

> 
> 
>>> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> ---
>>>    drivers/xen/swiotlb-xen.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
>>> index b6d27762c6f8..a42129cba36e 100644
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -335,6 +335,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t
>>> size, void *vaddr,
>>>    	int order = get_order(size);
>>>    	phys_addr_t phys;
>>>    	u64 dma_mask = DMA_BIT_MASK(32);
>>> +	struct page *pg;
>>>      	if (hwdev && hwdev->coherent_dma_mask)
>>>    		dma_mask = hwdev->coherent_dma_mask;
>>> @@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t
>>> size, void *vaddr,
>>>    	/* Convert the size to actually allocated. */
>>>    	size = 1UL << (order + XEN_PAGE_SHIFT);
>>>    +	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
>>> +				      virt_to_page(vaddr);
>>
>> Common DMA code seems to protect this check with CONFIG_DMA_REMAP. Is it
>> something we want to do it here as well? Or is there any other condition where
>> vmalloc can happen?
> 
> I can see it in dma_direct_free_pages:
> 
> 	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr))
> 		vunmap(cpu_addr);
> 
> I wonder why the common DMA code does that. is_vmalloc_addr should work
> regardless of CONFIG_DMA_REMAP. Maybe just for efficiency?
is_vmalloc_addr() doesn't looks very expensive (although it is not an 
inline function). So I am not sure the reason behind it. It might be 
worth asking the author of the config.

Cheers,

-- 
Julien Grall

