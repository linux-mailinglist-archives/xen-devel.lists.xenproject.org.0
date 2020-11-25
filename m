Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CD2C4734
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37942.70532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khz8d-0000NN-HP; Wed, 25 Nov 2020 18:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37942.70532; Wed, 25 Nov 2020 18:03:31 +0000
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
	id 1khz8d-0000N0-E4; Wed, 25 Nov 2020 18:03:31 +0000
Received: by outflank-mailman (input) for mailman id 37942;
 Wed, 25 Nov 2020 18:03:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khz8b-0000Mv-Es
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:03:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khz8Z-0005nH-Px; Wed, 25 Nov 2020 18:03:27 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khz8Z-0001Ga-EX; Wed, 25 Nov 2020 18:03:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khz8b-0000Mv-Es
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=KuPd5JEX9cu2UuOX3LVhygD/IpKEybGAsFruRkY/ju4=; b=vDIAUBY1VDD4A1gCwF4dEw0oUQ
	9Mh8QokwbxawytLUORdQGVJ9sTKw7NKr3EfGn4ztUnVJc/a/6HqPsV/kClvzURyu3pXdh/0TBC/vI
	xi93fl5QFurVJkvscGxkX+6D5XHIFwgRB4FErFxXJV6bMhLbd590Oo/fmarzfXvQawjE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khz8Z-0005nH-Px; Wed, 25 Nov 2020 18:03:27 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khz8Z-0001Ga-EX; Wed, 25 Nov 2020 18:03:27 +0000
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Julien Grall <Julien.Grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
 <9F95F565-8D59-400B-9F15-9ABA0B1FB7FC@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3f6df00c-f287-8abc-ed15-9a6e6180b13c@xen.org>
Date: Wed, 25 Nov 2020 18:03:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9F95F565-8D59-400B-9F15-9ABA0B1FB7FC@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 24/11/2020 18:13, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 19 Nov 2020, at 19:07, Julien Grall <julien@xen.org> wrote:
>>
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
>>     - Replacing a table with a mapping. This may happen if region was
>>     first mapped with 4KB mapping and then later on replaced with a 2MB
>>     (or 1GB mapping)
>>     - Removing/modify a table. This may happen if a caller try to remove a
>>     region with _PAGE_BLOCK set when it was created without it
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
>>
> 
> First I did test the serie on Arm and so far it was working properly.

Thanks for the testing and...

> 
> I only have some remarks because even if the code is right, I think
> some parts of the code are not easy to read...

... I am always open for suggestion :).

>> ---
>>
>> This patch is necessary for upcoming changes in the MM code. I would
>> like to remove most of the open-coding update of the page-tables as they
>> are not easy to properly fix/extend. For instance, always mapping
>> xenheap mapping with 1GB superpage is plain wrong because:
>>     - RAM regions are not always 1GB aligned (such as on RPI 4) and we
>>     may end up to map MMIO with cacheable attributes
>>     - RAM may contain reserved regions should either not be mapped
>> ---
>> xen/arch/arm/mm.c          | 87 ++++++++++++++++++++++++++++++--------
>> xen/include/asm-arm/page.h |  4 ++
>> 2 files changed, 73 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 59f8a3f15fd1..af0f12b6e6d3 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -1060,9 +1060,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>> }
>>
>> /* Sanity check of the entry */
>> -static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>> +static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
>> +                               unsigned int flags)
>> {
>> -    /* Sanity check when modifying a page. */
>> +    /* Sanity check when modifying an entry. */
>>      if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
>>      {
>>          /* We don't allow modifying an invalid entry. */
>> @@ -1072,6 +1073,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>>              return false;
>>          }
>>
>> +        /* We don't allow modifying a table entry */
>> +        if ( !lpae_is_mapping(entry, level) )
>> +        {
>> +            mm_printk("Modifying a table entry is not allowed.\n");
>> +            return false;
>> +        }
>> +
>>          /* We don't allow changing memory attributes. */
>>          if ( entry.pt.ai != PAGE_AI_MASK(flags) )
>>          {
>> @@ -1087,7 +1095,7 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>>              return false;
>>          }
>>      }
>> -    /* Sanity check when inserting a page */
>> +    /* Sanity check when inserting a mapping */
>>      else if ( flags & _PAGE_PRESENT )
>>      {
>>          /* We should be here with a valid MFN. */
>> @@ -1096,18 +1104,28 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>>          /* We don't allow replacing any valid entry. */
>>          if ( lpae_is_valid(entry) )
>>          {
>> -            mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
>> -                      mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
>> +            if ( lpae_is_mapping(entry, level) )
>> +                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
>> +                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
>> +            else
>> +                mm_printk("Trying to replace a table with a mapping.\n");
>>              return false;
>>          }
>>      }
>> -    /* Sanity check when removing a page. */
>> +    /* Sanity check when removing a mapping. */
>>      else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
>>      {
>>          /* We should be here with an invalid MFN. */
>>          ASSERT(mfn_eq(mfn, INVALID_MFN));
>>
>> -        /* We don't allow removing page with contiguous bit set. */
>> +        /* We don't allow removing a table */
>> +        if ( lpae_is_table(entry, level) )
>> +        {
>> +            mm_printk("Removing a table is not allowed.\n");
>> +            return false;
>> +        }
>> +
>> +        /* We don't allow removing a mapping with contiguous bit set. */
>>          if ( entry.pt.contig )
>>          {
>>              mm_printk("Removing entry with contiguous bit set is not allowed.\n");
>> @@ -1126,12 +1144,12 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
>> }
>>
>> static int xen_pt_update_entry(mfn_t root, unsigned long virt,
>> -                               mfn_t mfn, unsigned int flags)
>> +                               mfn_t mfn, unsigned int page_order,
>> +                               unsigned int flags)
>> {
>>      int rc;
>>      unsigned int level;
>> -    /* We only support 4KB mapping (i.e level 3) for now */
>> -    unsigned int target = 3;
>> +    unsigned int target = 3 - (page_order / LPAE_SHIFT);
> 
> This is not really straight forward and it would be good to actually explain the computation here or ...

[...]

>> @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
>>
>>      spin_lock(&xen_pt_lock);
>>
>> -    for ( ; addr < addr_end; addr += PAGE_SIZE )
>> +    while ( left )
>>      {
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
>> +         */
>> +        mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
>> +        mask |= vfn | left;
>> +
>> +        /*
>> +         * Always use level 3 mapping unless the caller request block
>> +         * mapping.
>> +         */
>> +        if ( likely(!(flags & _PAGE_BLOCK)) )
>> +            order = THIRD_ORDER;
>> +        else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) )
>> +            order = FIRST_ORDER;
>> +        else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) )
>> +            order = SECOND_ORDER;
>> +        else
>> +            order = THIRD_ORDER;
>> +
>> +        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, order, flags);
> 
> maybe it would be easier here to pass directly the target instead of the page order.

Stefano suggested the same. For the next version I am planning to 
"hardcoded" the level in the if/else above and then find the order from 
an array similar to level_orders in p2m.c.

> 
>>          if ( rc )
>>              break;
>>
>> +        vfn += 1U << order;
>>          if ( !mfn_eq(mfn, INVALID_MFN) )
>> -            mfn = mfn_add(mfn, 1);
>> +            mfn = mfn_add(mfn, 1U << order);
>> +
>> +        left -= (1U << order);
>>      }
>>
>>      /*
>> diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
>> index 4ea8e97247c8..de096b0968e3 100644
>> --- a/xen/include/asm-arm/page.h
>> +++ b/xen/include/asm-arm/page.h
>> @@ -79,6 +79,7 @@
>>   * [3:4] Permission flags
>>   * [5]   Page present
>>   * [6]   Only populate page tables
>> + * [7]   Use any level mapping only (i.e. superpages is allowed)
> 
> the comment for the bit is not really logic: any level mapping only

My original implementation was using the bit the other way around: the 
flag set meant we should only use level 3.

But it turns out to be more complicated to implement because runtime 
users (e.g. vmap()) should only be mapped using small pages to avoid 
trouble

> Wouldn’t it be more clear to name the bit _PAGE_SUPERPAGE_BIT and
> comment it by saying that superpages are allowed ?

I would prefer to keep the name short as the flag will be used in 
combination of others. _PAGE_BLOCK is short and also match the spec :).

In any case, I will update the description of bit 7 with:

"Superpage mappings is allowed".

Cheers,

-- 
Julien Grall

