Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290957665E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368426.599698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPRe-0005L1-VU; Fri, 15 Jul 2022 17:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368426.599698; Fri, 15 Jul 2022 17:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPRe-0005J0-Sd; Fri, 15 Jul 2022 17:49:42 +0000
Received: by outflank-mailman (input) for mailman id 368426;
 Fri, 15 Jul 2022 17:49:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCPRd-0005Iu-G5
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:49:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCPRc-00023H-IL; Fri, 15 Jul 2022 17:49:40 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCPRc-0001gp-C7; Fri, 15 Jul 2022 17:49:40 +0000
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
	bh=70EnEEQbRDpt+rARZCqKNQZ8qgUjGJbSgZSJjs7h3bY=; b=BZdZOakWsA8sSFkUVN49QT2Wb2
	cdCkqvhQsiDyKKmgbxfSgN8XQT/7Ko5A5kd6U+EOCHhLbY+IimnJagmyTnsGcFN5FqZkMKR4npsrb
	nohafDgIxb7m4auWpf59L470i9oWAnzO8cjk8M2LRDhna+jDFjdCiLwqWsP5YaiNyalY=;
Message-ID: <dfd7657e-bbb9-3d96-2650-063561a00b9b@xen.org>
Date: Fri, 15 Jul 2022 18:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
 <834ed066-9e5f-f440-f6b5-78746c0d4163@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <834ed066-9e5f-f440-f6b5-78746c0d4163@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 24/06/2022 12:47, Oleksandr wrote:
> 
> On 23.06.22 20:50, Julien Grall wrote:
>> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>> b/xen/arch/arm/include/asm/mm.h
>>> +/*
>>> + * All accesses to the GFN portion of type_info field should always be
>>> + * protected by the P2M lock. In case when it is not feasible to 
>>> satisfy
>>> + * that requirement (risk of deadlock, lock inversion, etc) it is 
>>> important
>>> + * to make sure that all non-protected updates to this field are 
>>> atomic.
>>
>> Here you say the non-protected updates should be atomic but...
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index 7b1f2f4..c94bdaf 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -1400,8 +1400,10 @@ void share_xen_page_with_guest(struct 
>>> page_info *page, struct domain *d,
>>>       spin_lock(&d->page_alloc_lock);
>>>         /* The incremented type count pins as writable or read-only. */
>>> -    page->u.inuse.type_info =
>>> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
>>> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
>>> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
>>> +                                                  : 
>>> PGT_writable_page) |
>>> +                                MASK_INSR(1, PGT_count_mask);
>>
>> ... this is not going to be atomic. So I would suggest to add a 
>> comment explaining why this is fine.
> 
> 
> Yes, I should have added your explanation given in V5 why this is fine.
> 
> So I propose the following text, do you agree with that being added?
> 
> /*
>   * Please note, the update of type_info field here is not atomic as we use
>   * Read-Modify-Write operation on it. But currently it is fine because
>   * the caller of page_set_xenheap_gfn() (which is another place where
>   * type_info is updated) would need to acquire a reference on the page.
>   * This is only possible after the count_info is updated *and* there a 

Missing word: there *is* a.

> barrier
>   * between the type_info and count_info. So there is no immediate need 
> to use
>   * cmpxchg() here.
>   */
> 
> 
>>
>>
>>>         page_set_owner(page, d);
>>>       smp_wmb(); /* install valid domain ptr before updating refcnt. */
>>> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>>>       }
>>>         /* Map at new location. */
>>> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>
>>> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
>>> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
>>
>> I would expand the comment above to explain why you need a different 
>> path for xenheap mapped as RAM. AFAICT, this is because we need to 
>> call page_set_xenheap_gfn().
> 
> 
> agree, I propose the following text, do you agree with that?
> 
> /*
>   * Map at new location. Here we need to map xenheap RAM page differently
>   * because we need to store the valid GFN and make sure that nothing was
>   * mapped before (the stored GFN is invalid).
>   */

So I think the key point here is the p2m_set_xenheap_gfn() needs to 
happen with the P2M lock held.

That said, looking at the code again this is a bit confusing to use 
guest_physmap_add_entry() in one place and p2m_set_entry() in the other.

The only way I can think to avoid the confusion is than open-coding 
guest_physmap_add_entry() (i.e. p2m_write_lock(); p2m_set_entry(); 
p2m_write_unlock()) or try to merge the two paths.

However, I am aware this is already at version 6 and your code should 
work. So I would be OK with a comment explaining that 
guest_physmap_add_entry() is just a wrapper on top of p2m_set_entry().

>>> +    else
>>> +    {
>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +        p2m_write_lock(p2m);
>>> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), 
>>> INVALID_GFN) )
>>
>> Sorry to only notice it now. This check will also change the behavior 
>> for XENMAPSPACE_shared_info. Now, we are only allowed to map the 
>> shared info once.
>>
>> I believe this is fine because AFAICT x86 already prevents it. But 
>> this is probably something that ought to be explained in the already 
>> long commit message.

So I was wrong thinking that x86 would prevent it (see Jan's answer). 
However, I think this is a mistake to allow it because it can result to 
weird issues.

In fact, you mentioned on IRC that there is already an example on how 
this hypercall could be misused in U-boot [1]. At the moment, U-boot 
will steal a RAM page to map the shared info page but not unmap it.

The OS will not be aware where the shared info page is mapped. As this 
is part of the RAM region, the OS may end up to allocate for other 
purpose and corrupt the page.

If Xen were going to unmap it, then we would create a hole and the OS 
will crash when accessing the page. In some way, it is better than 
corruption but still a good user experience (the RAM page may only be 
accessed a long time after boot).

So I think it is much better to return -EBUSY here at least we can catch 
misuse in the firmware code earlier.

In the case of U-boot, as discussed on IRC, the code should:
   1) Unmap the page
   2) Populate the area with memory using XENMEM_populate_physmap

An optimization would be to use the extended regions. But this was only 
recently introduced so U-boot cannot always rely on it.

> 
> 
> agree, I propose the following text, do you agree with that?
> 
> Please note, this patch changes the behavior how the shared_info page
> (which is xenheap RAM page) is mapped in xenmem_add_to_physmap_one().
> Now, we only allow to map the shared_info at once. The subsequent attempts
> to map it will result in -EBUSY, if there is a legitimate use case
> we will be able to relax that behavior.

I would suggest to summarize what I wrote above in the commit message. I 
think this is a strong reason to return -EBUSY and push other projects 
(e.g. U-boot) to fix there code.

Cheers,

[1] 
https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/xen/hypervisor.c

-- 
Julien Grall

