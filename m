Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447547D1C0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 13:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250811.431947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00oh-0000LQ-M5; Wed, 22 Dec 2021 12:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250811.431947; Wed, 22 Dec 2021 12:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n00oh-0000JK-I6; Wed, 22 Dec 2021 12:33:59 +0000
Received: by outflank-mailman (input) for mailman id 250811;
 Wed, 22 Dec 2021 12:33:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n00of-0000JE-JD
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 12:33:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n00oZ-0003pY-Fj; Wed, 22 Dec 2021 12:33:51 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n00oZ-00036O-5i; Wed, 22 Dec 2021 12:33:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=pDuodeardkQpgNDwC8w8FujoGgQZpXVIYLJEVzcBo+E=; b=r3I9OgAhaEW/uXTmoXXXxbTONw
	6F+0a7oofbJU1wEtrtqWV7LmmyeTr8pq6/BU8rr2s7ylv8n7NEIFuBFBuxJmThgVI7TN1gcrN3MKp
	uXN8pV7kRRzpbIqGC1veFcsJsLZMNxGGKOhFJ/ZiF2Si1+X2lNgA+KE9zRcUux0QKjzg=;
Message-ID: <74a0ca4a-b091-77e6-ddb4-490d2a0a0f4b@xen.org>
Date: Wed, 22 Dec 2021 13:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH V4] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1638563610-4419-1-git-send-email-olekstysh@gmail.com>
 <ebfaf88c-38a8-638c-298e-a92e5827baf1@suse.com>
 <6f4813ce-5d23-2192-fabc-e933241cf30e@gmail.com>
 <c1c043b1-bffd-f758-f7b0-fd08539550a5@suse.com>
 <f8ac8922-0695-7666-8585-92a089164e44@xen.org>
 <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <57616176-938b-2125-fe34-4fadf2b4f816@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/12/2021 13:05, Jan Beulich wrote:
> On 22.12.2021 11:01, Julien Grall wrote:
>> On 14/12/2021 17:45, Jan Beulich wrote:
>>> On 14.12.2021 17:26, Oleksandr wrote:
>>>> On 14.12.21 15:37, Jan Beulich wrote:
>>>>> On 03.12.2021 21:33, Oleksandr Tyshchenko wrote:
>>>>>> @@ -2177,14 +2181,22 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>>>>>     
>>>>>>     void free_xenheap_pages(void *v, unsigned int order)
>>>>>>     {
>>>>>> +    struct page_info *pg;
>>>>>> +    unsigned int i;
>>>>>> +
>>>>>>         ASSERT(!in_irq());
>>>>>>     
>>>>>>         if ( v == NULL )
>>>>>>             return;
>>>>>>     
>>>>>> +    pg = virt_to_page(v);
>>>>>> +
>>>>>>         memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
>>>>> ... this really want to (logically) move into the new arch hooks.
>>>>> That'll effectively mean to simply drop the Arm stubs afaict (and I
>>>>> notice there's some dead code there on x86, which I guess I'll make
>>>>> a patch to clean up). But first of all this suggests that you want
>>>>> to call the hooks with base page and order, putting the loops there.
>>>>
>>>> I see your point and agree ... However I see the on-list patches that
>>>> remove common memguard_* invocations and x86 bits.
>>>> So I assume, this request is not actual anymore, or I still need to pass
>>>> an order to new arch hooks? Please clarify.
>>>
>>> Well, that patch (really just the Arm one) effectively takes care of
>>> part of what I did say above. Irrespective I continue to think that
>>> the hook should take a (page,order) tuple instead of getting invoked
>>> once for every order-0 page. And the hook invocations should be placed
>>> such that they could fulfill the (being removed) memguard function
>>> (iirc that was already the case, at least mostly).
>>
>> IIUC your suggestion, with your approach, alloc_xenheap_pages() would
>> look like:
>>
>>        for ( i = 0; i < (1u << order); i++ )
>>            pg[i].count_info |= PGC_xen_heap;
>>
>>        arch_alloc_xenheap_pages(pg, 1U << order);
> 
> Like Oleksandr said, the 2nd argument would be just "order".
> 
>> The Arm implementation for arch_alloc_xenheap_pages() would also contain
>> a loop.
>>
>> This could turn out to be quite expensive with large allocation (1GB
>> allocation would require 16MB of cache) because the cache may not have
>> enough space contain all the pages of that range. So you would have to
>> pull twice the page_info in the cache.
> 
> Hmm, that's a fair point. I assume you realize that a similar issue of
> higher overhead would occur when using your approach, and when some
> memguard-like thing was to reappear: Such mapping operations typically
> are more efficient when done on a larger range.

Yes, I was aware of that when I wrote my message. However, they are not 
necessary at the moment. So I think we can defer the discussion.

>  Since that's only a
> hypothetical use at this point, I'm willing to accept your preference.
> I'd like us to consider one more aspect though: All you need on Arm is
> the setting of the exact same bits to the exact same pattern for every
> struct page_info involved. Can't we simply have an arch hook returning
> that pattern, for generic code to then OR it in alongside PGC_xen_heap?

arch_alloc_xenheap_pages() will modify inuse.type_info so we can't or 
the value to PGC_xen_heap.

Cheers,

-- 
Julien Grall

