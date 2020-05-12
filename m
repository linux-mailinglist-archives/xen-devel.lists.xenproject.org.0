Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB41CEFDD
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 10:59:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYQja-00069J-4A; Tue, 12 May 2020 08:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WwR0=62=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jYQjY-00069E-Ke
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 08:57:52 +0000
X-Inumbo-ID: a76d6b9f-942e-11ea-a280-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a76d6b9f-942e-11ea-a280-12813bfff9fa;
 Tue, 12 May 2020 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4xokOh/D/iyUg0ldO5myuFkrr6clNuIMI+vqJeHaZ8=; b=nr8Fp5yjIR7Uxb46BD0QYwZMCr
 as+DGMzAF24VHViJkFW4xYh8E/Yt4WRabF1K1g7QU6kgmqzf2r8bkSnyztIhJwKlvv8EJsfAnMqIc
 ic+gkTuU6kfaMoxLO9xDzpPQgYh5wN5yTTRRviuOZXHkv+RRc3Dpwk5paMqO34UjqJGo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jYQjS-0001Vz-7Q; Tue, 12 May 2020 08:57:46 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jYQjR-0006aX-RC; Tue, 12 May 2020 08:57:46 +0000
Subject: Re: [PATCH 05/12] xen: introduce reserve_heap_pages
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-5-sstabellini@kernel.org>
 <3129ab49-5898-9d2e-8fbb-d1fcaf6cdec7@suse.com>
 <alpine.DEB.2.21.2004291510270.28941@sstabellini-ThinkPad-T480s>
 <a316ed70-da35-8be0-a092-d992e56563d2@xen.org>
 <alpine.DEB.2.21.2004300928240.28941@sstabellini-ThinkPad-T480s>
 <86e8fa89-c6f5-6c9e-4f3e-7f98e8e12c6a@xen.org>
 <alpine.DEB.2.21.2005111750240.26167@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <99681366-3439-8974-e699-b5550e5a0e9e@xen.org>
Date: Tue, 12 May 2020 09:57:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005111750240.26167@sstabellini-ThinkPad-T480s>
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

On 12/05/2020 02:10, Stefano Stabellini wrote:
> On Thu, 30 Apr 2020, Julien Grall wrote:
>> On 30/04/2020 18:00, Stefano Stabellini wrote:
>>> On Thu, 30 Apr 2020, Julien Grall wrote:
>>>>>>> +    pg = maddr_to_page(start);
>>>>>>> +    node = phys_to_nid(start);
>>>>>>> +    zone = page_to_zone(pg);
>>>>>>> +    page_list_del(pg, &heap(node, zone, order));
>>>>>>> +
>>>>>>> +    __alloc_heap_pages(pg, order, memflags, d);
>>>>>>
>>>>>> I agree with Julien in not seeing how this can be safe / correct.
>>>>>
>>>>> I haven't seen any issues so far in my testing -- I imagine it is
>>>>> because there aren't many memory allocations after setup_mm() and before
>>>>> create_domUs()  (which on ARM is called just before
>>>>> domain_unpause_by_systemcontroller at the end of start_xen.)
>>>>
>>>> I am not sure why you exclude setup_mm(). Any memory allocated (boot
>>>> allocator, xenheap) can clash with your regions. The main memory
>>>> allocations
>>>> are for the frametable and dom0. I would say you were lucky to not hit
>>>> them.
>>>
>>> Maybe it is because Xen typically allocates memory top-down? So if I
>>> chose a high range then I would see a failure? But I have been mostly
>>> testing with ranges close to the begin of RAM (as opposed to
>>> ranges close to the end of RAM.)
>>
>> I haven't looked at the details of the implementation, but you can try to
>> specify dom0 addresses for your domU. You should see a failure.
> 
> I managed to reproduce a failure by choosing the top address range. On
> Xilinx ZynqMP the memory is:
> 
>    reg = <0x0 0x0 0x0 0x7ff00000 0x8 0x0 0x0 0x80000000>;
> 
> And I chose:
> 
>    fdt set /chosen/domU0 direct-map <0x0 0x10000000 0x10000000 0x8 0x70000000 0x10000000>
> 
> Resulting in:
> 
> (XEN) *** LOADING DOMU cpus=1 memory=80000KB ***
> (XEN) Loading d1 kernel from boot module @ 0000000007200000
> (XEN) Loading ramdisk from boot module @ 0000000008200000
> (XEN) direct_map start=0x00000010000000 size=0x00000010000000
> (XEN) direct_map start=0x00000870000000 size=0x00000010000000
> (XEN) Data Abort Trap. Syndrome=0x5
> (XEN) Walking Hypervisor VA 0x2403480018 on CPU0 via TTBR 0x0000000000f05000
> (XEN) 0TH[0x0] = 0x0000000000f08f7f
> (XEN) 1ST[0x90] = 0x0000000000000000
> (XEN) CPU0: Unexpected Trap: Data Abort
> 
> [...]
> 
> (XEN) Xen call trace:
> (XEN)    [<000000000021a65c>] page_alloc.c#alloc_pages_from_buddy+0x15c/0x5d0 (PC)
> (XEN)    [<000000000021b43c>] reserve_domheap_pages+0xc4/0x148 (LR)

This isn't what I was expecting. If there is any failure, I would expect 
an error message not a data abort. However...

> 
> Anything other than the very top of memory works.

... I am very confused by this. Are you suggesting that with your series 
you can allocate the same range for Dom0 and a DomU without any trouble?

> 
>>>>> - in construct_domU, add the range to xenheap and reserve it with
>>>>> reserve_heap_pages
>>>>
>>>> I am afraid you can't give the regions to the allocator and then allocate
>>>> them. The allocator is free to use any page for its own purpose or exclude
>>>> them.
>>>>
>>>> AFAICT, the allocator doesn't have a list of page in use. It only keeps
>>>> track
>>>> of free pages. So we can make the content of struct page_info to look like
>>>> it
>>>> was allocated by the allocator.
>>>>
>>>> We would need to be careful when giving a page back to allocator as the
>>>> page
>>>> would need to be initialized (see [1]). This may not be a concern for
>>>> Dom0less
>>>> as the domain may never be destroyed but will be for correctness PoV.
>>>>
>>>> For LiveUpdate, the original Xen will carve out space to use by the boot
>>>> allocator in the new Xen. But I think this is not necessary in your
>>>> context.
>>>>
>>>> It should be sufficient to exclude the page from the boot allocators (as
>>>> we do
>>>> for other modules).
>>>>
>>>> One potential issue that can arise is there is no easy way today to
>>>> differentiate between pages allocated and pages not yet initialized. To
>>>> make
>>>> the code robust, we need to prevent a page to be used in two places. So
>>>> for
>>>> LiveUpdate we are marking them with a special value, this is used
>>>> afterwards
>>>> to check we are effictively using a reserved page.
>>>>
>>>> I hope this helps.
>>>
>>> Thanks for writing all of this down but I haven't understood some of it.
>>>
>>> For the sake of this discussion let's say that we managed to "reserve"
>>> the range early enough like we do for other modules, as you wrote.
>>>
>>> At the point where we want to call reserve_heap_pages() we would call
>>> init_heap_pages() just before it. We are still relatively early at boot
>>> so there aren't any concurrent memory operations. Why this doesn't work?
>>
>> Because init_heap_pages() may exclude some pages (for instance MFN 0 is carved
>> out) or use pages for its internal structure (see init_node_heap()). So you
>> can't expect to be able to allocate the exact same region by
>> reserve_heap_pages().
> 
> But it can't possibly use of any of pages it is trying to add to the
> heap, right?
Yes it can, there are already multiple examples in the buddy allocator.

> 
> We have reserved a certain range, we tell init_heap_pages to add the
> range to the heap, init_node_heap gets called and it ends up calling
> xmalloc. There is no way xmalloc can use any memory from that
> particular range because it is not in the heap yet. That should be safe.

If you look carefully at the code, you will notice:

     else if ( *use_tail && nr >= needed &&
               arch_mfn_in_directmap(mfn + nr) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
         _heap[node] = mfn_to_virt(mfn + nr - needed);
         avail[node] = mfn_to_virt(mfn + nr - 1) +
                       PAGE_SIZE - sizeof(**avail) * NR_ZONES;
     }

This is one of the condition where the allocator will use a few pages 
from the region for itself.

> The init_node_heap code is a bit hard to follow but I went through it
> and couldn't spot anything that could cause any issues (MFN 0 aside
> which is a bit special). Am I missing something?
Aside what I wrote above, as soon as you give a page to an allocator, 
you waive a right to decide what the page is used for. The allocator is 
free to use the page for bookeeping or even carve out the page because 
it can't deal with it.

So I don't really see how giving a region to the allocator and then 
expecting the same region a call after is ever going to be safe.

Cheers,

-- 
Julien Grall

