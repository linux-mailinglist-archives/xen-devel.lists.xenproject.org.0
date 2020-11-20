Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119B62BAF9A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 17:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32506.63549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8yG-0006qA-LH; Fri, 20 Nov 2020 16:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32506.63549; Fri, 20 Nov 2020 16:09:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg8yG-0006pl-I6; Fri, 20 Nov 2020 16:09:12 +0000
Received: by outflank-mailman (input) for mailman id 32506;
 Fri, 20 Nov 2020 16:09:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kg8yF-0006pg-9y
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:09:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kg8yE-0002nV-6f; Fri, 20 Nov 2020 16:09:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kg8yD-0006L8-S6; Fri, 20 Nov 2020 16:09:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kg8yF-0006pg-9y
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iT8QI1tbSBs5VikmYuAPyr3fJ3V67U4xYEXHCEdjmrw=; b=c5LiGrkhJo71vqVHLuD97zvQL+
	E5HT9x+OmnVuR0DYSVgaQPTPZVH/9YmgBvHjXCT++9el5FeD+wEiO1pRtQShZiFNM/dDYkHsfNts/
	AQDmniwsHitWVqhTZibnFAAWNsMrnxKqfzUaiKUC2o7+lAchC7lWBnBhbrwMRMWE4vgY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kg8yE-0002nV-6f; Fri, 20 Nov 2020 16:09:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kg8yD-0006L8-S6; Fri, 20 Nov 2020 16:09:10 +0000
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
 <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
Date: Fri, 20 Nov 2020 16:09:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 20/11/2020 01:46, Stefano Stabellini wrote:
> On Thu, 19 Nov 2020, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> At the moment, xen_pt_update_entry() only supports mapping at level 3
>> (i.e 4KB mapping). While this is fine for most of the runtime helper,
>> the boot code will require to use superpage mapping.
>>
>> We don't want to allow superpage mapping by default as some of the
>> callers may expect small mappings (i.e populate_pt_range()) or even
>> expect to unmap only a part of a superpage.
>>
>> To keep the code simple, a new flag _PAGE_BLOCK is introduced to
>> allow the caller to enable superpage mapping.
>>
>> As the code doesn't support all the combinations, xen_pt_check_entry()
>> is extended to take into account the cases we don't support when
>> using block mapping:
>>      - Replacing a table with a mapping. This may happen if region was
>>      first mapped with 4KB mapping and then later on replaced with a 2MB
>>      (or 1GB mapping)
>>      - Removing/modify a table. This may happen if a caller try to remove a
>>      region with _PAGE_BLOCK set when it was created without it
>>
>> Note that the current restriction mean that the caller must ensure that
>> _PAGE_BLOCK is consistently set/cleared across all the updates on a
>> given virtual region. This ought to be fine with the expected use-cases.
>>
>> More rework will be necessary if we wanted to remove the restrictions.
>>
>> Note that nr_mfns is now marked const as it is used for flushing the
>> TLBs and we don't want it to be modified.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> Thanks for the patch, you might want to update the Signed-off-by (even
> if you haven't changed the patch)

Yes, I realized it afterwards. I will update it in the next version.

>>   static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>> -                               mfn_t mfn, unsigned int flags)
>> +                               mfn_t mfn, unsigned int page_order,
>> +                               unsigned int flags)
>>   {
>>       int rc;
>>       unsigned int level;
>> -    /* We only support 4KB mapping (i.e level 3) for now */
>> -    unsigned int target = 3;
>> +    unsigned int target = 3 - (page_order / LPAE_SHIFT);
> 
> Given that page_order is not used for anything else in this function,
> wouldn't it be easier to just pass the target level to
> xen_pt_update_entry? Calculating target from page_order, when page_order
> is otherwise unused, it doesn't look like the most straightforward way
> to do it.

FWIW, this is the same way we use in __p2m_set_entry() 
(xen_pt_update_entry() is derived from it).

Anyway, in the caller, we need to know the size of the mapping. I would 
rather avoid to have to keep two variables when one can "easily" infer 
the second one.

One possibility would be to introduce a static array level_orders 
(already exist in the p2m) that would allow us to easily convert from a 
level to an order.

Let me see if that's fit with my next plan (I am looking to add suport 
for the contiguous bit as well).

> 
> 
>>       lpae_t *table;
>>       /*
>>        * The intermediate page tables are read-only when the MFN is not valid
>> @@ -1186,7 +1204,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>>       entry = table + offsets[level];
>>   
>>       rc = -EINVAL;
>> -    if ( !xen_pt_check_entry(*entry, mfn, flags) )
>> +    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
>>           goto out;
>>   
>>       /* If we are only populating page-table, then we are done. */
>> @@ -1204,8 +1222,11 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>>           {
>>               pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
>>   
>> -            /* Third level entries set pte.pt.table = 1 */
>> -            pte.pt.table = 1;
>> +            /*
>> +             * First and second level pages set pte.pt.table = 0, but
>> +             * third level entries set pte.pt.table = 1.
>> +             */
>> +            pte.pt.table = (level == 3);
>>           }
>>           else /* We are updating the permission => Copy the current pte. */
>>               pte = *entry;
>> @@ -1229,11 +1250,12 @@ static DEFINE_SPINLOCK(xen_pt_lock);
>>   
>>   static int xen_pt_update(unsigned long virt,
>>                            mfn_t mfn,
>> -                         unsigned long nr_mfns,
>> +                         const unsigned long nr_mfns,
>>                            unsigned int flags)
>>   {
>>       int rc = 0;
>> -    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
>> +    unsigned long vfn = paddr_to_pfn(virt);
>> +    unsigned long left = nr_mfns;
> 
> Given that paddr_to_pfn is meant for physical addresses, I would rather
> opencode paddr_to_pfn using PAGE_SHIFT here. Again, just a suggestion.
paddr_to_pfn() is poorly named. This is meant to take any address and 
return the frame.

There are wrapper for machine address and guest address but there is no 
concept for the virtual yet.

Long term,, I would like to kill paddr_to_pfn() use on Arm in favor of 
the typesafe version. So I should probably not introduce a new one :).

I will open-code the shift.

> 
>>       /*
>>        * For arm32, page-tables are different on each CPUs. Yet, they share
>> @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
>>   
>>       spin_lock(&xen_pt_lock);
>>   
>> -    for ( ; addr < addr_end; addr += PAGE_SIZE )
>> +    while ( left )
>>       {
>> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
>> +        unsigned int order;
>> +        unsigned long mask;
>> +
>> +        /*
>> +         * Don't take into account the MFN when removing mapping (i.e
>> +         * MFN_INVALID) to calculate the correct target order.
>> +         *
>> +         * XXX: Support superpage mappings if nr is not aligned to a
>> +         * superpage size.
> 
> It would be good to add another sentence to explain that the checks
> below are simply based on masks and rely on the mfn, vfn, and also
> nr_mfn to be superpage aligned. (It took me some time to figure it out.)

I am not sure to understand what you wrote here. Could you suggest a 
sentence?

Regarding the TODO itself, we have the exact same one in the P2M code. I 
couldn't find a clever way to deal with it yet. Any idea how this could 
be solved?

Cheers,

-- 
Julien Grall

