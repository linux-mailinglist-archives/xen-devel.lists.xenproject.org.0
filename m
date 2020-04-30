Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7211BFF3A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:52:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAXT-0005OV-7e; Thu, 30 Apr 2020 14:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUAXR-0005OP-T6
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:51:45 +0000
X-Inumbo-ID: 1c3ec5d0-8af2-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c3ec5d0-8af2-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2VrajmXIqltPk4moElm/vF5U3FDPVMpqrn4J/I2nD7U=; b=ziEksKE4bBDdNkyDhm66UPnecO
 kEL3yYDmggIyhZP/6TSX2vjyKPU0jSvNtbmrfHJqbJQxxxBBk6xxd35fXeUsilOyPLFJcQ71t+G/V
 sGb5HF965tNNbXFHCYFYmWtKm5RQKYcsKvXz+LDn3PrHzN4xHERSvok064TyBSkrb6Bs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUAXO-0005LP-JS; Thu, 30 Apr 2020 14:51:42 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUAXO-0001uW-6b; Thu, 30 Apr 2020 14:51:42 +0000
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
Date: Thu, 30 Apr 2020 15:51:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
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
Cc: Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/04/2020 23:46, Stefano Stabellini wrote:
> On Fri, 17 Apr 2020, Jan Beulich wrote:
>> On 15.04.2020 03:02, Stefano Stabellini wrote:
>>> Introduce a function named reserve_heap_pages (similar to
>>> alloc_heap_pages) that allocates a requested memory range. Call
>>> __alloc_heap_pages for the implementation.
>>>
>>> Change __alloc_heap_pages so that the original page doesn't get
>>> modified, giving back unneeded memory top to bottom rather than bottom
>>> to top.
>>
>> While it may be less of a problem within a zone, doing so is
>> against our general "return high pages first" policy.
> 
> Is this something you'd be OK with anyway?
> 
> If not, do you have a suggestion on how to do it better? I couldn't find
> a nice way to do it without code duplication, or a big nasty 'if' in the
> middle of the function.
> 
> 
>>> @@ -1073,7 +1073,42 @@ static struct page_info *alloc_heap_pages(
>>>           return NULL;
>>>       }
>>>   
>>> -    __alloc_heap_pages(&pg, order, memflags, d);
>>> +    __alloc_heap_pages(pg, order, memflags, d);
>>> +    return pg;
>>> +}
>>> +
>>> +static struct page_info *reserve_heap_pages(struct domain *d,
>>> +                                            paddr_t start,
>>> +                                            unsigned int order,
>>> +                                            unsigned int memflags)
>>> +{
>>> +    nodeid_t node;
>>> +    unsigned int zone;
>>> +    struct page_info *pg;
>>> +
>>> +    if ( unlikely(order > MAX_ORDER) )
>>> +        return NULL;
>>> +
>>> +    spin_lock(&heap_lock);
>>> +
>>> +    /*
>>> +     * Claimed memory is considered unavailable unless the request
>>> +     * is made by a domain with sufficient unclaimed pages.
>>> +     */
>>> +    if ( (outstanding_claims + (1UL << order) > total_avail_pages) &&
>>> +          ((memflags & MEMF_no_refcount) ||
>>> +           !d || d->outstanding_pages < (1UL << order)) )
>>> +    {
>>> +        spin_unlock(&heap_lock);
>>> +        return NULL;
>>> +    }
>>
>> Where would such a claim come from? Given the purpose I'd assume
>> the function (as well as reserve_domheap_pages()) can actually be
>> __init. With that I'd then also be okay with them getting built
>> unconditionally, i.e. even on x86.
> 
> Yes, you are right, I'll make the function __init and also remove this
> check on claimed memory.
> 
> 
>>> +    pg = maddr_to_page(start);
>>> +    node = phys_to_nid(start);
>>> +    zone = page_to_zone(pg);
>>> +    page_list_del(pg, &heap(node, zone, order));
>>> +
>>> +    __alloc_heap_pages(pg, order, memflags, d);
>>
>> I agree with Julien in not seeing how this can be safe / correct.
> 
> I haven't seen any issues so far in my testing -- I imagine it is
> because there aren't many memory allocations after setup_mm() and before
> create_domUs()  (which on ARM is called just before
> domain_unpause_by_systemcontroller at the end of start_xen.)

I am not sure why you exclude setup_mm(). Any memory allocated (boot 
allocator, xenheap) can clash with your regions. The main memory 
allocations are for the frametable and dom0. I would say you were lucky 
to not hit them.

> 
> 
> I gave a quick look at David's series. Is the idea that I should add a
> patch to do the following:
> 
> - avoiding adding these ranges to xenheap in setup_mm, wait for later
>    (a bit like reserved_mem regions)

I guess by xenheap, you mean domheap? But the problem is not only for 
domheap, it is also for any memory allocated via the boot allocator. So 
you need to exclude those regions from any possible allocations.

> 
> - in construct_domU, add the range to xenheap and reserve it with reserve_heap_pages

I am afraid you can't give the regions to the allocator and then 
allocate them. The allocator is free to use any page for its own purpose 
or exclude them.

AFAICT, the allocator doesn't have a list of page in use. It only keeps 
track of free pages. So we can make the content of struct page_info to 
look like it was allocated by the allocator.

We would need to be careful when giving a page back to allocator as the 
page would need to be initialized (see [1]). This may not be a concern 
for Dom0less as the domain may never be destroyed but will be for 
correctness PoV.

For LiveUpdate, the original Xen will carve out space to use by the boot 
allocator in the new Xen. But I think this is not necessary in your context.

It should be sufficient to exclude the page from the boot allocators (as 
we do for other modules).

One potential issue that can arise is there is no easy way today to 
differentiate between pages allocated and pages not yet initialized. To 
make the code robust, we need to prevent a page to be used in two 
places. So for LiveUpdate we are marking them with a special value, this 
is used afterwards to check we are effictively using a reserved page.

I hope this helps.

Cheers,

[1] <20200319212150.2651419-2-dwmw2@infradead.org>

-- 
Julien Grall

