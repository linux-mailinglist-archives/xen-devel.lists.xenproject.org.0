Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056CF544745
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 11:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344805.570418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzEMG-0000BE-Fk; Thu, 09 Jun 2022 09:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344805.570418; Thu, 09 Jun 2022 09:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzEMG-00007g-Bg; Thu, 09 Jun 2022 09:21:40 +0000
Received: by outflank-mailman (input) for mailman id 344805;
 Thu, 09 Jun 2022 09:21:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzEMF-00007a-1u
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 09:21:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzEME-0003JB-LJ; Thu, 09 Jun 2022 09:21:38 +0000
Received: from [54.239.6.190] (helo=[10.85.101.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzEME-0004w1-DE; Thu, 09 Jun 2022 09:21:38 +0000
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
	bh=KFWx10asrx386DYKVQ1NOzEXPolvDb3zs5yGeLHwxV8=; b=hYuKDtosi4VnOEtd1gqbV3wRao
	zLUdJdsQ0NC8xFL5R1s+2SN+lTbB8dPp54ghbUZ+Oi1wtHuYuVHTIN6Ao1WHznOp2Rwu4dT/yXbNH
	/D0IWNCmjkZe9PkIAhsJ69ZDd52gTtelsd6V00GwDk9ibJc1jGbROwkMtQdSTPeUhYps=;
Message-ID: <dd9f8a18-23ce-d5f6-45ff-82376aaefaba@xen.org>
Date: Thu, 9 Jun 2022 10:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v6 2/9] xen: do not free reserved memory into heap
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-3-Penny.Zheng@arm.com>
 <d43d2dbd-6b0e-fb0c-5e0a-d409db4e18e9@xen.org>
 <DU2PR08MB7325B2A677FCF2FBF905D588F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325B2A677FCF2FBF905D588F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/06/2022 06:54, Penny Zheng wrote:
> 
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, June 7, 2022 5:13 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Jan Beulich <jbeulich@suse.com>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH v6 2/9] xen: do not free reserved memory into heap
>>
>> Hi Penny,
>>
> 
> Hi Julien
> 
>> On 07/06/2022 08:30, Penny Zheng wrote:
>>> Pages used as guest RAM for static domain, shall be reserved to this
>>> domain only.
>>> So in case reserved pages being used for other purpose, users shall
>>> not free them back to heap, even when last ref gets dropped.
>>>
>>> free_staticmem_pages will be called by free_heap_pages in runtime for
>>> static domain freeing memory resource, so let's drop the __init flag.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v6 changes:
>>> - adapt to PGC_static
>>> - remove #ifdef aroud function declaration
>>> ---
>>> v5 changes:
>>> - In order to avoid stub functions, we #define PGC_staticmem to
>>> non-zero only when CONFIG_STATIC_MEMORY
>>> - use "unlikely()" around pg->count_info & PGC_staticmem
>>> - remove pointless "if", since mark_page_free() is going to set
>>> count_info to PGC_state_free and by consequence clear PGC_staticmem
>>> - move #define PGC_staticmem 0 to mm.h
>>> ---
>>> v4 changes:
>>> - no changes
>>> ---
>>> v3 changes:
>>> - fix possible racy issue in free_staticmem_pages()
>>> - introduce a stub free_staticmem_pages() for the
>>> !CONFIG_STATIC_MEMORY case
>>> - move the change to free_heap_pages() to cover other potential call
>>> sites
>>> - fix the indentation
>>> ---
>>> v2 changes:
>>> - new commit
>>> ---
>>>    xen/arch/arm/include/asm/mm.h |  4 +++-
>>>    xen/common/page_alloc.c       | 12 +++++++++---
>>>    xen/include/xen/mm.h          |  2 --
>>>    3 files changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mm.h
>>> b/xen/arch/arm/include/asm/mm.h index fbff11c468..7442893e77 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -108,9 +108,11 @@ struct page_info
>>>      /* Page is Xen heap? */
>>>    #define _PGC_xen_heap     PG_shift(2)
>>>    #define PGC_xen_heap      PG_mask(1, 2)
>>> -  /* Page is static memory */
>>
>> NITpicking: You added this comment in patch #1 and now removing the space.
>> Any reason to drop the space?
>>
>>> +#ifdef CONFIG_STATIC_MEMORY
>>
>> I think this change ought to be explained in the commit message. AFAIU, this is
>> necessary to allow the compiler to remove code and avoid linking issues. Is
>> that correct?
>>
>>> +/* Page is static memory */
>>>    #define _PGC_static    PG_shift(3)
>>>    #define PGC_static     PG_mask(1, 3)
>>> +#endif
>>>    /* ... */
>>>    /* Page is broken? */
>>>    #define _PGC_broken       PG_shift(7)
>>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c index
>>> 9e5c757847..6876869fa6 100644
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1443,6 +1443,13 @@ static void free_heap_pages(
>>>
>>>        ASSERT(order <= MAX_ORDER);
>>>
>>> +    if ( unlikely(pg->count_info & PGC_static) )
>>> +    {
>>> +        /* Pages of static memory shall not go back to the heap. */
>>> +        free_staticmem_pages(pg, 1UL << order, need_scrub);
>> I can't remember whether I asked this before (I couldn't find a thread).
>>
>> free_staticmem_pages() doesn't seem to be protected by any lock. So how do
>> you prevent the concurrent access to the page info with the acquire part?
> 
> True, last time you suggested that rsv_page_list needs to be protected with a
> spinlock (mostly like d->page_alloc_lock). I haven't thought it thoroughly, sorry
> about that.
> So for freeing part, I shall get the lock at arch_free_heap_page(), where we insert
> the page to the rsv_page_list, and release the lock at the end of the free_staticmem_page.

In general, a lock is better to be lock/unlock in the same function 
because it is easier to verify. However, I am not sure that extending 
the locking from d->page_alloc_lock up after free_heap_pages() is right.

The first reason being that they are other callers of free_heap_pages(). 
So now all the callers of the helpers would need to know whether they 
need to help d->page_alloc_lock.

Secondly, free_staticmem_pages() is meant to be the reverse of 
prepare_staticmem_pages(). We should prevent both of them to be called 
concurrently. It sounds strange to use the d->page_alloc_lock to protect 
it (a page is technically not belonging to a domain at this point).

To me it looks like we want to add the pages on the rsv_page_list 
*after* the pages have been freed. So we know that all the pages on that 
list have been marked as freed (i.e. free_staticmem_pages() completed).

In addition to that, we would need the code in free_staticmem_pages() to 
be protected by the heap_lock (at least so it is match 
prepare_staticmem_pages()).

Any thoughts?

Cheers,

-- 
Julien Grall

