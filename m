Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F08536F6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680092.1057941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwMC-00019P-Un; Tue, 13 Feb 2024 17:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680092.1057941; Tue, 13 Feb 2024 17:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwMC-00016s-RX; Tue, 13 Feb 2024 17:14:08 +0000
Received: by outflank-mailman (input) for mailman id 680092;
 Tue, 13 Feb 2024 17:14:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZwMB-00016m-3m
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:14:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwM9-00046Z-N8; Tue, 13 Feb 2024 17:14:05 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZwM9-0000NK-Gy; Tue, 13 Feb 2024 17:14:05 +0000
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
	bh=UIP48nUwwMrqsuxoJDDTPWHrQufev/aB3TJXws/WLhw=; b=t5e/1vumrpBF3zeRcfuIHHFMr1
	hSd1KW8KKmGfb22yk6MPe66LlTS/F7N7FZQq5Pu3BB8wg15DubAJht1humSNOxIrc64y+BEAzkG0V
	8a4BNAcH7eYzrn4z+VtQQWHZJ50f3wXjPAzxfOPVJHTf6i9mD0we4QMjM/EzkBXSMZUU=;
Message-ID: <9eb25d90-9f10-44e5-b9aa-32e3f898389a@xen.org>
Date: Tue, 13 Feb 2024 17:14:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
 <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
 <02446758-a5a9-4a8a-8ce6-15abdc9ede65@suse.com>
 <99faac70440a68824a17fcaaea55ef48@bugseng.com>
 <09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org>
 <c0b8f2ec-a3bb-45a6-b748-052d55a6fd5c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c0b8f2ec-a3bb-45a6-b748-052d55a6fd5c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/02/2024 07:13, Jan Beulich wrote:
> On 12.02.2024 19:38, Julien Grall wrote:
>> An alternative would be to introduced arch_grant_cache_flush() and move
>> the if/else logic there. Something like:
>>
>> diff --git a/xen/arch/arm/include/asm/page.h
>> b/xen/arch/arm/include/asm/page.h
>> index 69f817d1e68a..4a3de49762a1 100644
>> --- a/xen/arch/arm/include/asm/page.h
>> +++ b/xen/arch/arm/include/asm/page.h
>> @@ -281,6 +281,19 @@ static inline void write_pte(lpae_t *p, lpae_t pte)
>>        dsb(sy);
>>    }
>>
>> +static inline arch_grant_cache_flush(unsigned int op, const void *p,
>> unsigned long size)
>> +{
>> +    unsigned int order = get_order_from_bytes(size);
>> +
>> +    if ( (cflush->op & GNTTAB_CACHE_INVAL) && (cflush->op &
>> GNTTAB_CACHE_CLEAN) )
>> +        clean_and_invalidate_dcache_va_range(v, cflush->length);
>> +    else if ( cflush->op & GNTTAB_CACHE_INVAL )
>> +        invalidate_dcache_va_range(v, cflush->length);
>> +    else if ( cflush->op & GNTTAB_CACHE_CLEAN )
>> +        clean_dcache_va_range(v, cflush->length);
>> +
>> +    return 0;
>> +}
>>
>>    /* Flush the dcache for an entire page. */
>>    void flush_page_to_ram(unsigned long mfn, bool sync_icache);
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 424744ad5e1a..647e1522466d 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -735,8 +735,7 @@ void asmlinkage __init start_xen(unsigned long
>> boot_phys_offset,
>>                  fdt_paddr);
>>
>>        /* Register Xen's load address as a boot module. */
>> -    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
>> -                             virt_to_maddr(_start),
>> +    xen_bootmodule = add_boot_module(BOOTMOD_XEN, virt_to_maddr(_start),
>>                                 (paddr_t)(uintptr_t)(_end - _start), false);
>>        BUG_ON(!xen_bootmodule);
>>
>> diff --git a/xen/arch/x86/include/asm/flushtlb.h
>> b/xen/arch/x86/include/asm/flushtlb.h
>> index bb0ad58db49b..dfe51cddde90 100644
>> --- a/xen/arch/x86/include/asm/flushtlb.h
>> +++ b/xen/arch/x86/include/asm/flushtlb.h
>> @@ -182,23 +182,22 @@ void flush_area_mask(const cpumask_t *mask, const
>> void *va,
>>    }
>>
>>    static inline void flush_page_to_ram(unsigned long mfn, bool
>> sync_icache) {}
>> -static inline int invalidate_dcache_va_range(const void *p,
>> -                                             unsigned long size)
>> -{ return -EOPNOTSUPP; }
>> -static inline int clean_and_invalidate_dcache_va_range(const void *p,
>> -                                                       unsigned long size)
>> +
>> +unsigned int guest_flush_tlb_flags(const struct domain *d);
>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
>> +
>> +static inline arch_grant_cache_flush(unsigned int op, const void *p,
>> unsigned long size)
>>    {
>> -    unsigned int order = get_order_from_bytes(size);
>> +    unsigned int order;
>> +
>> +    if ( !(cflush->op & GNTTAB_CACHE_CLEAN) )
>> +        return -EOPNOTSUPP;
>> +
>> +    order = get_order_from_bytes(size);
>>        /* sub-page granularity support needs to be added if necessary */
>>        flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
>> +
>>        return 0;
>>    }
>> -static inline int clean_dcache_va_range(const void *p, unsigned long size)
>> -{
>> -    return clean_and_invalidate_dcache_va_range(p, size);
>> -}
>> -
>> -unsigned int guest_flush_tlb_flags(const struct domain *d);
>> -void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
>>
>>    #endif /* __FLUSHTLB_H__ */
>>
>> I have a slight preference for the latter. I would like to hear the
>> opinion of the others.
> 
> I would prefer this 2nd form, too, assuming the setup.c change wasn't
> really meant to be there. 

Indeed. I had another previous change I didn't and forgot to remove it.

> The one thing that doesn't become clear: In
> the sketch above arch_grant_cache_flush() has no return type, yet has
> "return 0". This raises a question towards the one that's at the root
> of this thread: Do you mean the function to have a return value, and
> if so will it be (sensibly) used?

Sorry I should have double checked the code before sending it. 
arch_grant_cache_flush() should return a value. So each arch can decide 
if they handle a given operation.

Cheers,

-- 
Julien Grall

