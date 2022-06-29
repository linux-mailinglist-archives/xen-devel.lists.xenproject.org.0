Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521455FDB9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357808.586627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VG8-0007cS-Jj; Wed, 29 Jun 2022 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357808.586627; Wed, 29 Jun 2022 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VG8-0007Zg-Gm; Wed, 29 Jun 2022 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 357808;
 Wed, 29 Jun 2022 10:49:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6VG6-0007ZI-F5
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:49:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6VG2-0000Ta-Kv; Wed, 29 Jun 2022 10:49:18 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6VG2-0004n1-EH; Wed, 29 Jun 2022 10:49:18 +0000
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
	bh=XwTHFAoYDeCCa3r+hwh3qwwzGindoFtN6Pb11qN4SJg=; b=FZbp0QBQleoSQqN+dIg4nCmmcu
	lZ8+QfcSzs0I159Le36qSuOqm5nTP6zRExMLAThkRU8KzgNX4KjZSdmEXHiRrk9sPsfmgFuJnYtPe
	mILYHylEAE3ne5Xcmfe2nbEobMMhIG25c76GjjMSAFPfFB0xU1HKONOY6O5UbIc0NvQc=;
Message-ID: <6c7e87df-7633-6cba-8ff2-2adc3059f698@xen.org>
Date: Wed, 29 Jun 2022 11:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
 <DU2PR08MB732507EFB0CC4FEAA4872B3AF7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6cfca3ce-219e-f9e4-e30c-40d7a74ea523@suse.com>
 <DU2PR08MB7325B9C7AC3441780E7AEB78F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <7d7aa075-faa0-732f-44ad-3984dcb86e08@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7d7aa075-faa0-732f-44ad-3984dcb86e08@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/06/2022 07:19, Jan Beulich wrote:
> On 29.06.2022 08:08, Penny Zheng wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Wednesday, June 29, 2022 1:56 PM
>>>
>>> On 29.06.2022 05:12, Penny Zheng wrote:
>>>>> From: Julien Grall <julien@xen.org>
>>>>> Sent: Monday, June 27, 2022 6:19 PM
>>>>>
>>>>> On 27/06/2022 11:03, Penny Zheng wrote:
>>>>>>> -----Original Message-----
>>>>>> put_static_pages, that is, adding pages to the reserved list, is
>>>>>> only for freeing static pages on runtime. In static page
>>>>>> initialization stage, I also use free_statimem_pages, and in which
>>>>>> stage, I think the domain has not been constructed at all. So I
>>>>>> prefer the freeing of staticmem pages is split into two parts:
>>>>>> free_staticmem_pages and put_static_pages
>>>>>
>>>>> AFAIU, all the pages would have to be allocated via
>>>>> acquire_domstatic_pages(). This call requires the domain to be
>>>>> allocated and setup for handling memory.
>>>>>
>>>>> Therefore, I think the split is unnecessary. This would also have the
>>>>> advantage to remove one loop. Admittly, this is not important when
>>>>> the order 0, but it would become a problem for larger order (you may
>>>>> have to pull the struct page_info multiple time in the cache).
>>>>>
>>>>
>>>> How about this:
>>>> I create a new func free_domstatic_page, and it will be like:
>>>> "
>>>> static void free_domstatic_page(struct domain *d, struct page_info
>>>> *page) {
>>>>      unsigned int i;
>>>>      bool need_scrub;
>>>>
>>>>      /* NB. May recursively lock from relinquish_memory(). */
>>>>      spin_lock_recursive(&d->page_alloc_lock);
>>>>
>>>>      arch_free_heap_page(d, page);
>>>>
>>>>      /*
>>>>       * Normally we expect a domain to clear pages before freeing them,
>>>>       * if it cares about the secrecy of their contents. However, after
>>>>       * a domain has died we assume responsibility for erasure. We do
>>>>       * scrub regardless if option scrub_domheap is set.
>>>>       */
>>>>      need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
>>>>
>>>>      free_staticmem_pages(page, 1, need_scrub);
>>>>
>>>>      /* Add page on the resv_page_list *after* it has been freed. */
>>>>      put_static_page(d, page);
>>>>
>>>>      drop_dom_ref = !domain_adjust_tot_pages(d, -1);
>>>>
>>>>      spin_unlock_recursive(&d->page_alloc_lock);
>>>>
>>>>      if ( drop_dom_ref )
>>>>          put_domain(d);
>>>> }
>>>> "
>>>>
>>>> In free_domheap_pages, we just call free_domstatic_page:
>>>>
>>>> "
>>>> @@ -2430,6 +2430,9 @@ void free_domheap_pages(struct page_info *pg,
>>>> unsigned int order)
>>>>
>>>>       ASSERT_ALLOC_CONTEXT();
>>>>
>>>> +    if ( unlikely(pg->count_info & PGC_static) )
>>>> +        return free_domstatic_page(d, pg);
>>>> +
>>>>       if ( unlikely(is_xen_heap_page(pg)) )
>>>>       {
>>>>           /* NB. May recursively lock from relinquish_memory(). */ @@
>>>> -2673,6 +2676,38 @@ void free_staticmem_pages(struct page_info *pg,
>>>> unsigned long nr_mfns, "
>>>>
>>>> Then the split could be avoided and we could save the loop as much as
>>> possible.
>>>> Any suggestion?
>>>
>>> Looks reasonable at the first glance (will need to see it in proper context for a
>>> final opinion), provided e.g. Xen heap pages can never be static.
>>
>> If you don't prefer let free_domheap_pages to call free_domstatic_page, then, maybe
>> the if-array should happen at put_page
>> "
>> @@ -1622,6 +1622,8 @@ void put_page(struct page_info *page)
>>
>>       if ( unlikely((nx & PGC_count_mask) == 0) )
>>       {
>> +        if ( unlikely(page->count_info & PGC_static) )

At a first glance, this would likely need to be tested against 'nx'.

>> +            free_domstatic_page(page);
>>           free_domheap_page(page);
>>       }
>>   }
>> "
>> Wdyt now?
> 
> Personally I'd prefer this variant, but we'll have to see what Julien or
> the other Arm maintainers think.

I think this is fine so long we are not expecting more places where 
free_domheap_page() may need to be replaced with free_domstatic_page().

I can't think of any at the moment, but I would like Penny to confirm 
what Arm plans to do with static memory.

Cheers,

-- 
Julien Grall

