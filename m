Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BA562682
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 01:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358736.588067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o73IA-00026k-FR; Thu, 30 Jun 2022 23:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358736.588067; Thu, 30 Jun 2022 23:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o73IA-00023j-CI; Thu, 30 Jun 2022 23:09:46 +0000
Received: by outflank-mailman (input) for mailman id 358736;
 Thu, 30 Jun 2022 23:09:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o73I9-00023N-1R
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 23:09:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o73I8-0007GC-PL; Thu, 30 Jun 2022 23:09:44 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o73I8-0005iM-Ju; Thu, 30 Jun 2022 23:09:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Sa4s+uNznVEw+rdyxP8ELatB26V7a3kZnd7VQ97RpNY=; b=HpifP0sgPr4COVFnGgbkZBpfXp
	4XbuJBQL75t3+WntrXRUkuYkpSzffv9KG8WJTz1KZfqGh06UyRkZfBsUxFQZ55quZr+lbR54j+f9e
	gdmqqYUzsAxLaOWU7KI80Jo8z1nhmdQCmnlGgd7ObN40z8xd6y8PnnQOD6z4q9u9TjKw=;
Message-ID: <d76ea85c-cb3b-ab03-ac8f-f146722389f1@xen.org>
Date: Fri, 1 Jul 2022 00:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-6-julien@xen.org>
 <c05cb05f-0344-19d2-4f8f-caa904c374dc@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 5/7] xen/arm32: mm: Consolidate the domheap mappings
 initialization
In-Reply-To: <c05cb05f-0344-19d2-4f8f-caa904c374dc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/06/2022 08:24, Michal Orzel wrote:
> On 24.06.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the domheap mappings initialization is done separately for
>> the boot CPU and secondary CPUs. The main difference is for the former
>> the pages are part of Xen binary whilst for the latter they are
>> dynamically allocated.
>>
>> It would be good to have a single helper so it is easier to rework
>> on the domheap is initialized.
>>
>> For CPU0, we still need to use pre-allocated pages because the
>> allocators may use domain_map_page(), so we need to have the domheap
>> area ready first. But we can still delay the initialization to setup_mm().
>>
>> Introduce a new helper domheap_mapping_init() that will be called
> FWICS the function name is init_domheap_mappings.

I will udpate it.

> 
>> from setup_mm() for the boot CPU and from init_secondary_pagetables()
>> for secondary CPUs.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/include/asm/arm32/mm.h |  2 +
>>   xen/arch/arm/mm.c                   | 92 +++++++++++++++++++----------
>>   xen/arch/arm/setup.c                |  8 +++
>>   3 files changed, 71 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
>> index 6b039d9ceaa2..575373aeb985 100644
>> --- a/xen/arch/arm/include/asm/arm32/mm.h
>> +++ b/xen/arch/arm/include/asm/arm32/mm.h
>> @@ -10,6 +10,8 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>       return false;
>>   }
>>   
>> +bool init_domheap_mappings(unsigned int cpu);
>> +
>>   #endif /* __ARM_ARM32_MM_H__ */
>>   
>>   /*
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 20733afebce4..995aa1e4480e 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -372,6 +372,58 @@ void clear_fixmap(unsigned map)
>>   }
>>   
>>   #ifdef CONFIG_DOMAIN_PAGE
>> +/*
>> + * Prepare the area that will be used to map domheap pages. They are
>> + * mapped in 2MB chunks, so we need to allocate the page-tables up to
>> + * the 2nd level.
>> + *
>> + * The caller should make sure the root page-table for @cpu has been
>> + * been allocated.
> Second 'been' not needed.

I will drop it.

> 
>> + */
>> +bool init_domheap_mappings(unsigned int cpu)
>> +{
>> +    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
>> +    lpae_t *root = per_cpu(xen_pgtable, cpu);
>> +    unsigned int i, first_idx;
>> +    lpae_t *domheap;
>> +    mfn_t mfn;
>> +
>> +    ASSERT(root);
>> +    ASSERT(!per_cpu(xen_dommap, cpu));
>> +
>> +    /*
>> +     * The domheap for cpu0 is before the heap is initialized. So we
>> +     * need to use pre-allocated pages.
>> +     */
>> +    if ( !cpu )
>> +        domheap = cpu0_dommap;
>> +    else
>> +        domheap = alloc_xenheap_pages(order, 0);
>> +
>> +    if ( !domheap )
>> +        return false;
>> +
>> +    /* Ensure the domheap has no stray mappings */
>> +    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
>> +
>> +    /*
>> +     * Update the first level mapping to reference the local CPUs
>> +     * domheap mapping pages.
>> +     */
>> +    mfn = virt_to_mfn(domheap);
>> +    first_idx = first_table_offset(DOMHEAP_VIRT_START);
>> +    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
>> +    {
>> +        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
> I might have missed sth but shouldn't 'i' be multiplied by XEN_PT_LPAE_ENTRIES?
Each table is taking one page. As we are dealing with MFN, we only need 
to increment by 1 every time.

The reason the previous code was multiplying by XEN_PT_LPAE_ENTRIES was 
because it was using a virtual address with the type was lpae_t and then 
call virt_to_mfn().

But this is pointless as the domheap pages tables are so far both 
virtual and physically contiguous.

Cheers,

-- 
Julien Grall

