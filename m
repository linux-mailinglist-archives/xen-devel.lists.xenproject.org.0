Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670907B1880
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609479.948585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qloXp-0002Ya-Ug; Thu, 28 Sep 2023 10:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609479.948585; Thu, 28 Sep 2023 10:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qloXp-0002WR-Ry; Thu, 28 Sep 2023 10:46:57 +0000
Received: by outflank-mailman (input) for mailman id 609479;
 Thu, 28 Sep 2023 10:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/RWs=FM=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qloXo-0002WL-RA
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:46:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5736bcbd-5dec-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 12:46:55 +0200 (CEST)
Received: from [192.168.1.15] (host-87-11-204-216.retail.telecomitalia.it
 [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 681204EE0739;
 Thu, 28 Sep 2023 12:46:54 +0200 (CEST)
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
X-Inumbo-ID: 5736bcbd-5dec-11ee-878a-cb3800f73035
Message-ID: <253a11a7-7d90-4e86-97b2-37a483ef5f73@bugseng.com>
Date: Thu, 28 Sep 2023 12:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/domain_page: address violations of MISRA C:2012
 Rule 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <6f3538a91f719611e719066237568163ae90c95e.1695827160.git.federico.serafini@bugseng.com>
 <3727a667-fada-faea-27ec-cde7612c358d@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <3727a667-fada-faea-27ec-cde7612c358d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/23 08:25, Jan Beulich wrote:
> On 27.09.2023 17:09, Federico Serafini wrote:
>> Make function declarations and definitions consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/domain_page.c | 36 ++++++++++++++++++------------------
>>   1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
>> index eac5e3304f..1cfa992a02 100644
>> --- a/xen/arch/x86/domain_page.c
>> +++ b/xen/arch/x86/domain_page.c
>> @@ -173,18 +173,18 @@ void *map_domain_page(mfn_t mfn)
>>       return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
>>   }
>>   
>> -void unmap_domain_page(const void *ptr)
>> +void unmap_domain_page(const void *va)
>>   {
>>       unsigned int idx;
>>       struct vcpu *v;
>>       struct mapcache_domain *dcache;
>> -    unsigned long va = (unsigned long)ptr, mfn, flags;
>> +    unsigned long addr = (unsigned long)va, mfn, flags;
>>       struct vcpu_maphash_entry *hashent;
>>   
>> -    if ( !va || va >= DIRECTMAP_VIRT_START )
>> +    if ( !addr || addr >= DIRECTMAP_VIRT_START )
>>           return;
>>   
>> -    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
>> +    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
>>   
>>       v = mapcache_current_vcpu();
>>       ASSERT(v && is_pv_vcpu(v));
>> @@ -192,7 +192,7 @@ void unmap_domain_page(const void *ptr)
>>       dcache = &v->domain->arch.pv.mapcache;
>>       ASSERT(dcache->inuse);
>>   
>> -    idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
>> +    idx = PFN_DOWN(addr - MAPCACHE_VIRT_START);
>>       mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
>>       hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
>>   
>> @@ -317,30 +317,30 @@ void *map_domain_page_global(mfn_t mfn)
>>       return vmap(&mfn, 1);
>>   }
>>   
>> -void unmap_domain_page_global(const void *ptr)
>> +void unmap_domain_page_global(const void *va)
>>   {
>> -    unsigned long va = (unsigned long)ptr;
>> +    unsigned long addr = (unsigned long)va;
>>   
>> -    if ( va >= DIRECTMAP_VIRT_START )
>> +    if ( addr >= DIRECTMAP_VIRT_START )
>>           return;
>>   
>> -    ASSERT(va >= VMAP_VIRT_START && va < VMAP_VIRT_END);
>> +    ASSERT(addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END);
>>   
>> -    vunmap(ptr);
>> +    vunmap(va);
>>   }
> 
> Up to here a statement in the description is needed why this apparently
> much heavier code churn (compared to changing the declaration) is still
> the (likely) better approach. (It may still be worthwhile to consider
> changing declaration and Arm code, for "ptr" being the imo better name
> for a const void * parameter, and "va" being more specific than just
> "addr" as a local variable.)

I thought keeping "va" would be better because of the comments on the
declaration side, which focus on taking a VA as parameter.
However, I will follow your naming conventions.

> 
>>   /* Translate a map-domain-page'd address to the underlying MFN */
>> -mfn_t domain_page_map_to_mfn(const void *ptr)
>> +mfn_t domain_page_map_to_mfn(const void *va)
>>   {
>> -    unsigned long va = (unsigned long)ptr;
>> +    unsigned long addr = (unsigned long)va;
>>   
>> -    if ( va >= DIRECTMAP_VIRT_START )
>> -        return _mfn(virt_to_mfn(ptr));
>> +    if ( addr >= DIRECTMAP_VIRT_START )
>> +        return _mfn(virt_to_mfn(va));
>>   
>> -    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
>> -        return vmap_to_mfn(va);
>> +    if ( addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END )
>> +        return vmap_to_mfn(addr);
>>   
>> -    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
>> +    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
>>   
>> -    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(va)]);
>> +    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(addr)]);
>>   }
> 
> This change, otoh, moves the violation from x86 to Arm, afaict. IOW
> this likely wants taking care of by changing the declaration. Then,
> for consistency, the consideration above gains one more supporting
> factor.
> 
> Jan
> 

Thanks, I missed this (it is a violation related to Arm 32
that is not under the ECLAIR analysis).

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

