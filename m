Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274433B87E8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 19:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148221.273916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeHm-0001Si-Bc; Wed, 30 Jun 2021 17:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148221.273916; Wed, 30 Jun 2021 17:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeHm-0001QA-8O; Wed, 30 Jun 2021 17:46:06 +0000
Received: by outflank-mailman (input) for mailman id 148221;
 Wed, 30 Jun 2021 17:46:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyeHl-0001Pw-8d
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 17:46:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeHl-0002Us-3A; Wed, 30 Jun 2021 17:46:05 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeHk-0005AX-Tc; Wed, 30 Jun 2021 17:46:05 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MMCmuWbYY1Iy80Nrq3l4pQcHIg2D0GPcfF2MBFVe11U=; b=khkMxgxBKEa5l9lOoDoVCpP6Xb
	L2zIrcjyrxoAAiYmq5g+53K7EDAUqK1GijqrCnHp5oIvPbTzX8kzu26nmlcOxmyhXc7b5GaRTwocH
	LtvNJWIilDgP0URMNURjyOMDSvGRlL6IfHA8cCofmDT4VuAM+boCfmD7ItOKn+47kh5o=;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
Date: Wed, 30 Jun 2021 18:46:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 10/06/2021 10:35, Jan Beulich wrote:
> On 07.06.2021 04:43, Penny Zheng wrote:
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -611,6 +611,30 @@ static void __init init_pdx(void)
>>       }
>>   }
>>   
>> +/* Static memory initialization */
>> +static void __init init_staticmem_pages(void)
>> +{
>> +    int bank;
> 
> While I'm not a maintainer of this code, I'd still like to point out
> that wherever possible we prefer "unsigned int" when dealing with
> only non-negative values, and even more so when using them as array
> indexes.

+1.

> 
>> +    /*
>> +     * TODO: Considering NUMA-support scenario.
>> +     */
> 
> Nit: Comment style.
> 
>> @@ -872,6 +896,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>>       cmdline_parse(cmdline);
>>   
>>       setup_mm();
>> +    /* If exists, Static Memory Initialization. */
>> +    if ( bootinfo.static_mem.nr_banks > 0 )
>> +        init_staticmem_pages();
> 
> I don't think the conditional is really needed here?
> 
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1376,6 +1376,37 @@ bool scrub_free_pages(void)
>>       return node_to_scrub(false) != NUMA_NO_NODE;
>>   }
>>   
>> +static void free_page(struct page_info *pg, bool need_scrub)
>> +{
>> +    mfn_t mfn = page_to_mfn(pg);
> 
> With pdx compression this is a non-trivial conversion. The function
> being an internal helper and the caller already holding the MFN, I
> think it would be preferable if the MFN was passed in here. If done
> this way, you may want to consider adding an ASSERT() to double
> check both passed in arguments match up.
> 
>> +    /* If a page has no owner it will need no safety TLB flush. */
>> +    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
>> +    if ( pg->u.free.need_tlbflush )
>> +        page_set_tlbflush_timestamp(pg);
>> +
>> +    /* This page is not a guest frame any more. */
>> +    page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
>> +    set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
>> +
>> +#ifdef CONFIG_ARM
> 
> If avoidable there should be no arch-specific code added to this
> file. Assuming another arch gained PGC_reserved, what's wrong with
> enabling this code right away for them as well? I.e. use
> PGC_reserved here instead of CONFIG_ARM? Alternatively this may
> want to be CONFIG_STATIC_ALLOCATION, assuming we consider
> PGC_reserved tied to it.
> 
>> +    if ( pg->count_info & PGC_reserved )
>> +    {
>> +        /* TODO: asynchronous scrubbing. */
>> +        if ( need_scrub )
>> +            scrub_one_page(pg);
>> +        return;
>> +    }
>> +#endif
>> +    if ( need_scrub )
> 
> Nit: Please have a blank line between these last two.
> 
>> +    {
>> +        pg->count_info |= PGC_need_scrub;
>> +        poison_one_page(pg);
>> +    }
>> +
>> +    return;
> 
> Please omit return statements at the end of functions returning void.
> 
>> +}
> 
> On the whole, bike shedding or not, I'm afraid the function's name
> doesn't match what it does: There's no freeing of a page here. What
> gets done is marking of a page as free. Hence maybe mark_page_free()
> or mark_free_page() or some such?
> 
>> @@ -1512,6 +1530,38 @@ static void free_heap_pages(
>>       spin_unlock(&heap_lock);
>>   }
>>   
>> +#ifdef CONFIG_STATIC_ALLOCATION
>> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
>> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>> +                                 bool need_scrub)
>> +{
>> +    mfn_t mfn = page_to_mfn(pg);
>> +    unsigned long i;
>> +
>> +    for ( i = 0; i < nr_mfns; i++ )
>> +    {
>> +        switch ( pg[i].count_info & PGC_state )
>> +        {
>> +        case PGC_state_inuse:
>> +            BUG_ON(pg[i].count_info & PGC_broken);
>> +            /* Mark it free and reserved. */
>> +            pg[i].count_info = PGC_state_free | PGC_reserved;
>> +            break;
>> +
>> +        default:
>> +            printk(XENLOG_ERR
>> +                   "Page state shall be only in PGC_state_inuse. "
> 
> Why? A page (static or not) can become broken while in use. IOW I
> don't think you can avoid handling PGC_state_offlining here. At which
> point this code will match free_heap_pages()'es, and hence likely
> will want folding as well.
> 
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>>   } while ( false )
>>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>>   
>> +#ifdef CONFIG_ARM
> 
> ITYM CONFIG_STATIC_ALLOCATION here?
> 
> Jan
> 

-- 
Julien Grall

