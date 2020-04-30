Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B181C04B3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 20:28:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUDum-00087V-9p; Thu, 30 Apr 2020 18:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUDul-00087E-7O
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 18:28:03 +0000
X-Inumbo-ID: 536d1106-8b10-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 536d1106-8b10-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XvMGg1AExOn2bF5PuPdSQImcZvoL9DZRVrvMKU0kpuM=; b=EZcoJz8LKPU/p03Ab6zQZEVGGx
 bn++xbouDs8agSMF4/8GITAMQ/irK3TpF4ArGqlUafMVMVibnI+MuwLrwhdWNttTsLt+muVOYeNQb
 skAEywUJzxItKe8mkY8j2sIrftxujBxZPmRLTYigBYebqLRIlghtdFYIGoKq3e9a6XAc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUDug-0001jk-I8; Thu, 30 Apr 2020 18:27:58 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUDug-0002p7-43; Thu, 30 Apr 2020 18:27:58 +0000
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
 <alpine.DEB.2.21.2004300928240.28941@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <86e8fa89-c6f5-6c9e-4f3e-7f98e8e12c6a@xen.org>
Date: Thu, 30 Apr 2020 19:27:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004300928240.28941@sstabellini-ThinkPad-T480s>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 30/04/2020 18:00, Stefano Stabellini wrote:
> On Thu, 30 Apr 2020, Julien Grall wrote:
>>>>> +    pg = maddr_to_page(start);
>>>>> +    node = phys_to_nid(start);
>>>>> +    zone = page_to_zone(pg);
>>>>> +    page_list_del(pg, &heap(node, zone, order));
>>>>> +
>>>>> +    __alloc_heap_pages(pg, order, memflags, d);
>>>>
>>>> I agree with Julien in not seeing how this can be safe / correct.
>>>
>>> I haven't seen any issues so far in my testing -- I imagine it is
>>> because there aren't many memory allocations after setup_mm() and before
>>> create_domUs()  (which on ARM is called just before
>>> domain_unpause_by_systemcontroller at the end of start_xen.)
>>
>> I am not sure why you exclude setup_mm(). Any memory allocated (boot
>> allocator, xenheap) can clash with your regions. The main memory allocations
>> are for the frametable and dom0. I would say you were lucky to not hit them.
> 
> Maybe it is because Xen typically allocates memory top-down? So if I
> chose a high range then I would see a failure? But I have been mostly
> testing with ranges close to the begin of RAM (as opposed to
> ranges close to the end of RAM.)

I haven't looked at the details of the implementation, but you can try 
to specify dom0 addresses for your domU. You should see a failure.

> 
>   
>>> I gave a quick look at David's series. Is the idea that I should add a
>>> patch to do the following:
>>>
>>> - avoiding adding these ranges to xenheap in setup_mm, wait for later
>>>     (a bit like reserved_mem regions)
>>
>> I guess by xenheap, you mean domheap? But the problem is not only for domheap,
>> it is also for any memory allocated via the boot allocator. So you need to
>> exclude those regions from any possible allocations.
> 
> OK, I think we are saying the same thing but let me check.
> 
> By boot allocator you mean alloc_boot_pages, right? That boot allocator
> operates on ranges given to it by init_boot_pages calls.

That's correct.

> init_boot_pages is called from setup_mm. I didn't write it clearly but
> I also meant not calling init_boot_pages on them from setup_mm.
> 
> Are we saying the same thing?

Yes.

> 
> 
>>> - in construct_domU, add the range to xenheap and reserve it with
>>> reserve_heap_pages
>>
>> I am afraid you can't give the regions to the allocator and then allocate
>> them. The allocator is free to use any page for its own purpose or exclude
>> them.
>>
>> AFAICT, the allocator doesn't have a list of page in use. It only keeps track
>> of free pages. So we can make the content of struct page_info to look like it
>> was allocated by the allocator.
>>
>> We would need to be careful when giving a page back to allocator as the page
>> would need to be initialized (see [1]). This may not be a concern for Dom0less
>> as the domain may never be destroyed but will be for correctness PoV.
>>
>> For LiveUpdate, the original Xen will carve out space to use by the boot
>> allocator in the new Xen. But I think this is not necessary in your context.
>>
>> It should be sufficient to exclude the page from the boot allocators (as we do
>> for other modules).
>>
>> One potential issue that can arise is there is no easy way today to
>> differentiate between pages allocated and pages not yet initialized. To make
>> the code robust, we need to prevent a page to be used in two places. So for
>> LiveUpdate we are marking them with a special value, this is used afterwards
>> to check we are effictively using a reserved page.
>>
>> I hope this helps.
> 
> Thanks for writing all of this down but I haven't understood some of it.
> 
> For the sake of this discussion let's say that we managed to "reserve"
> the range early enough like we do for other modules, as you wrote.
> 
> At the point where we want to call reserve_heap_pages() we would call
> init_heap_pages() just before it. We are still relatively early at boot
> so there aren't any concurrent memory operations. Why this doesn't work?

Because init_heap_pages() may exclude some pages (for instance MFN 0 is 
carved out) or use pages for its internal structure (see 
init_node_heap()). So you can't expect to be able to allocate the exact 
same region by reserve_heap_pages().

> 
> If it doesn't work, I am not following what is your alternative
> suggestion about making "the content of struct page_info to look like it
> was allocated by the allocator."

If you look at alloc_heap_pages(), it will allocate pages, the allocator 
will initialize some fields in struct page_info before returning the 
page. We basically need to do the same thing, so the struct page_info 
looks exactly the same whether we call alloc_heap_pages() or use memory 
that was carved out from the allocator.

David has spent more time than me on this problem, so I may be missing 
some bits. Based on what we did in the LU PoC, my suggestion would be to:
    1) Carve out the memory from any allocator (and before any memory is 
allocated).
    2) Make sure a struct page_info is allocated for those regions in 
the boot allocator
    3) Mark the regions as reserved in the frametable so we can 
differentiate from the others pages.
    4) Allocate the region when necessary

When it is necessary to allocate the region. For each page:
    1) Check if it is a valid page
    2) Check if the page is reserved
    3) Do the necessary preparation on struct page_info

At the moment, in the LU PoC, we are using count_info = PGC_allocated to 
mark the reserved page. I don't particularly like it and not sure of the 
consequence. So I am open to a different way to mark them.

The last part we need to take care is how to hand over the pages to the 
allocator. This may happen if your domain die or ballooning (although 
not in the direct map case). Even without this series, this is actually 
already a problem today because boot allocator pages may be freed 
afterwards (I think this can only happen on x86 so far). But we are 
getting away because in most of the cases you never carve out a full 
NUMA node. This is where David's patch should help.

Cheers,

-- 
Julien Grall

