Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EA3875EE
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129014.242177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwY6-00030V-I0; Tue, 18 May 2021 10:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129014.242177; Tue, 18 May 2021 10:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwY6-0002xK-EY; Tue, 18 May 2021 10:02:02 +0000
Received: by outflank-mailman (input) for mailman id 129014;
 Tue, 18 May 2021 10:02:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwY5-0002xE-8F
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:02:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwY5-0008Lq-59; Tue, 18 May 2021 10:02:01 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwY4-0007qe-Vm; Tue, 18 May 2021 10:02:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=AWeXZwlo24QjDn/2E3cEo2cH1U2LwQhlkCAKy875CzU=; b=KLuWPjNnEK1A3ZKqqOaGwsliUa
	/5KxIFQUH8dycqFMvkzC0ExcMsU4yTuwnKLDYsxujtETCT+8wXuRDPDLHiPxTO3oZjt1QoBVe2rnp
	CAGWERM6SBjEaiekRSemM9nQVURsIMxWhTeuNBUaPXbDVSB3tVZ/kC/ySlsK77Us5wC4=;
Subject: Re: [PATCH 04/10] xen/arm: static memory initialization
From: Julien Grall <julien@xen.org>
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
 <d492ca1a-b9d6-6250-750c-7f511b183735@xen.org>
Message-ID: <f28b6b77-3891-d5ab-7a4a-a8dbac643be1@xen.org>
Date: Tue, 18 May 2021 11:01:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d492ca1a-b9d6-6250-750c-7f511b183735@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 18/05/2021 11:00, Julien Grall wrote:
> Hi Penny,
> 
> On 18/05/2021 06:21, Penny Zheng wrote:
>> This patch introduces static memory initialization, during system RAM 
>> boot up.
>>
>> New func init_staticmem_pages is the equivalent of init_heap_pages, 
>> responsible
>> for static memory initialization.
>>
>> Helper func free_staticmem_pages is the equivalent of free_heap_pages, 
>> to free
>> nr_pfns pages of static memory.
>> For each page, it includes the following steps:
>> 1. change page state from in-use(also initialization state) to free 
>> state and
>> grant PGC_reserved.
>> 2. set its owner NULL and make sure this page is not a guest frame any 
>> more
>> 3. follow the same cache coherency policy in free_heap_pages
>> 4. scrub the page in need
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>>   xen/arch/arm/setup.c    |  2 ++
>>   xen/common/page_alloc.c | 70 +++++++++++++++++++++++++++++++++++++++++
>>   xen/include/xen/mm.h    |  3 ++
>>   3 files changed, 75 insertions(+)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 444dbbd676..f80162c478 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -818,6 +818,8 @@ static void __init setup_mm(void)
>>       setup_frametable_mappings(ram_start, ram_end);
>>       max_page = PFN_DOWN(ram_end);
>> +
>> +    init_staticmem_pages();
>>   }
>>   #endif
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index ace6333c18..58b53c6ac2 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -150,6 +150,9 @@
>>   #define p2m_pod_offline_or_broken_hit(pg) 0
>>   #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>>   #endif
>> +#ifdef CONFIG_ARM_64
>> +#include <asm/setup.h>
>> +#endif
>>   /*
>>    * Comma-separated list of hexadecimal page numbers containing bad 
>> bytes.
>> @@ -1512,6 +1515,49 @@ static void free_heap_pages(
>>       spin_unlock(&heap_lock);
>>   }
>> +/* Equivalent of free_heap_pages to free nr_pfns pages of static 
>> memory. */
>> +static void free_staticmem_pages(struct page_info *pg, unsigned long 
>> nr_pfns,
> 
> This function is dealing with MFNs, so the second parameter should be 
> called nr_mfns.
> 
>> +                                 bool need_scrub)
>> +{
>> +    mfn_t mfn = page_to_mfn(pg);
>> +    int i;
>> +
>> +    for ( i = 0; i < nr_pfns; i++ )
>> +    {
>> +        switch ( pg[i].count_info & PGC_state )
>> +        {
>> +        case PGC_state_inuse:
>> +            BUG_ON(pg[i].count_info & PGC_broken);
>> +            /* Make it free and reserved. */
>> +            pg[i].count_info = PGC_state_free | PGC_reserved;
>> +            break;
>> +
>> +        default:
>> +            printk(XENLOG_ERR
>> +                   "Page state shall be only in PGC_state_inuse. "
>> +                   "pg[%u] MFN %"PRI_mfn" count_info=%#lx 
>> tlbflush_timestamp=%#x.\n",
>> +                   i, mfn_x(mfn) + i,
>> +                   pg[i].count_info,
>> +                   pg[i].tlbflush_timestamp);
>> +            BUG();
>> +        }
>> +
>> +        /*
>> +         * Follow the same cache coherence scheme in free_heap_pages.
>> +         * If a page has no owner it will need no safety TLB flush.
>> +         */
>> +        pg[i].u.free.need_tlbflush = (page_get_owner(&pg[i]) != NULL);
>> +        if ( pg[i].u.free.need_tlbflush )
>> +            page_set_tlbflush_timestamp(&pg[i]);
>> +
>> +        /* This page is not a guest frame any more. */
>> +        page_set_owner(&pg[i], NULL);
>> +        set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> 
> The code looks quite similar to free_heap_pages(). Could we possibly 
> create an helper which can be called from both?
> 
>> +
>> +        if ( need_scrub )
>> +            scrub_one_page(&pg[i]);
> 
> So the scrubbing will be synchronous. Is it what we want?
> 
> You also seem to miss the flush the call to flush_page_to_ram().

Hmmmm... Sorry I looked at the wrong function. This is not necessary for 
the free part.

> 
>> +    }
>> +}
>>   /*
>>    * Following rules applied for page offline:
>> @@ -1828,6 +1874,30 @@ static void init_heap_pages(
>>       }
>>   }
>> +/* Equivalent of init_heap_pages to do static memory initialization */
>> +void __init init_staticmem_pages(void)
>> +{
>> +    int bank;
>> +
>> +    /*
>> +     * TODO: Considering NUMA-support scenario.
>> +     */
>> +    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
> 
> bootinfo is arm specific, so this code should live in arch/arm rather 
> than common/.
> 
>> +    {
>> +        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
>> +        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
>> +        paddr_t bank_end = bank_start + bank_size;
>> +
>> +        bank_start = round_pgup(bank_start);
>> +        bank_end = round_pgdown(bank_end);
>> +        if ( bank_end <= bank_start )
>> +            return;
>> +
>> +        free_staticmem_pages(maddr_to_page(bank_start),
>> +                            (bank_end - bank_start) >> PAGE_SHIFT, 
>> false);
>> +    }
>> +}
>> +
>>   static unsigned long avail_heap_pages(
>>       unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
>>   {
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 667f9dac83..8b1a2207b2 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -85,6 +85,9 @@ bool scrub_free_pages(void);
>>   } while ( false )
>>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>> +/* Static Memory */
>> +void init_staticmem_pages(void);
>> +
>>   /* Map machine page range in Xen virtual address space. */
>>   int map_pages_to_xen(
>>       unsigned long virt,
>>
> 
> Cheers,
> 

-- 
Julien Grall

