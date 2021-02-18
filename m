Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1F31ED77
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 18:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86716.163003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCnJ5-0003vg-AI; Thu, 18 Feb 2021 17:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86716.163003; Thu, 18 Feb 2021 17:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCnJ5-0003vL-7H; Thu, 18 Feb 2021 17:41:39 +0000
Received: by outflank-mailman (input) for mailman id 86716;
 Thu, 18 Feb 2021 17:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCnJ4-0003vG-76
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 17:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCnJ3-0002kd-0O; Thu, 18 Feb 2021 17:41:37 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCnJ2-0000hr-J5; Thu, 18 Feb 2021 17:41:36 +0000
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
	bh=quajQGjmwB5BnZPmECJw4fmBHD5TtmnbeXjlQMd/HrU=; b=RluOuw40NpTjfgQImBRz+RvrSg
	vkhS2gYRefOwf4lNKsaoYzUStzxRX7JiRjgAe8jW+QWh6cg8d2n9RIu8msYPmfxJPsmAAaI7oqrjq
	pz8b3akt1ug+ut2IzAh44II4QDkLE8qDrQxfQ69d43QrUlQAyKpP85dDP2fSPjFy4bhM=;
Subject: Re: [for-4.15][PATCH v3 3/3] xen/iommu: x86: Harden the IOMMU
 page-table allocator
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-4-julien@xen.org>
 <cf303aee-3d89-5608-f358-6bef5c32d706@suse.com>
 <51618338-daff-5b9a-5214-e0788d95992b@xen.org>
 <ee3d628e-a369-fddc-4824-e860ebabe8af@suse.com>
 <96971bbb-05ec-7df0-a8d7-931cc0b41a77@xen.org>
 <141ea545-3725-5305-d352-057ff7c70c4f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6e467ed0-34f1-498d-a9ce-7e0f2e606033@xen.org>
Date: Thu, 18 Feb 2021 17:41:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <141ea545-3725-5305-d352-057ff7c70c4f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 18/02/2021 17:04, Jan Beulich wrote:
> On 18.02.2021 14:19, Julien Grall wrote:
>>
>>
>> On 18/02/2021 13:10, Jan Beulich wrote:
>>> On 17.02.2021 17:29, Julien Grall wrote:
>>>> On 17/02/2021 15:13, Jan Beulich wrote:
>>>>> On 17.02.2021 15:24, Julien Grall wrote:> --- a/xen/drivers/passthrough/x86/iommu.c> +++ b/xen/drivers/passthrough/x86/iommu.c> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)>  >  void arch_iommu_domain_destroy(struct domain *d)>  {> +    /*> +     * There should be not page-tables left allocated by the time the
>>>>> Nit: s/not/no/ ?
>>>>>
>>>>>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>>>>>> +     * called unconditionally, so pgtables may be unitialized.
>>>>>> +     */
>>>>>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
>>>>>> +           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
>>>>>>     }
>>>>>>     
>>>>>>     static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>>>>>> @@ -279,6 +286,9 @@ int iommu_free_pgtables(struct domain *d)
>>>>>>          */
>>>>>>         hd->platform_ops->clear_root_pgtable(d);
>>>>>>     
>>>>>> +    /* After this barrier no new page allocations can occur. */
>>>>>> +    spin_barrier(&hd->arch.pgtables.lock);
>>>>>
>>>>> Didn't patch 2 utilize the call to ->clear_root_pgtable() itself as
>>>>> the barrier? Why introduce another one (with a similar comment)
>>>>> explicitly now?
>>>> The barriers act differently, one will get against any IOMMU page-tables
>>>> modification. The other one will gate against allocation.
>>>>
>>>> There is no guarantee that the former will prevent the latter.
>>>
>>> Oh, right - different locks. I got confused here because in both
>>> cases the goal is to prevent allocations.
>>>
>>>>>> @@ -315,9 +326,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>>>>>         unmap_domain_page(p);
>>>>>>     
>>>>>>         spin_lock(&hd->arch.pgtables.lock);
>>>>>> -    page_list_add(pg, &hd->arch.pgtables.list);
>>>>>> +    /*
>>>>>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>>>>>> +     * nothing prevent allocation to happen afterwards. There is no valid
>>>>>> +     * reasons to continue to update the IOMMU page-tables while the
>>>>>> +     * domain is dying.
>>>>>> +     *
>>>>>> +     * So prevent page-table allocation when the domain is dying.
>>>>>> +     *
>>>>>> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
>>>>>> +     */
>>>>>> +    if ( likely(!d->is_dying) )
>>>>>> +    {
>>>>>> +        alive = true;
>>>>>> +        page_list_add(pg, &hd->arch.pgtables.list);
>>>>>> +    }
>>>>>>         spin_unlock(&hd->arch.pgtables.lock);
>>>>>>     
>>>>>> +    if ( unlikely(!alive) )
>>>>>> +    {
>>>>>> +        free_domheap_page(pg);
>>>>>> +        pg = NULL;
>>>>>> +    }
>>>>>> +
>>>>>>         return pg;
>>>>>>     }
>>>>>
>>>>> As before I'm concerned of this forcing error paths to be taken
>>>>> elsewhere, in case an allocation still happens (e.g. from unmap
>>>>> once super page mappings are supported). Considering some of the
>>>>> error handling in the IOMMU code is to invoke domain_crash(), it
>>>>> would be quite unfortunate if we ended up crashing a domain
>>>>> while it is being cleaned up after.
>>>>
>>>> It is unfortunate, but I think this is better than having to leak page
>>>> tables.
>>>>
>>>>>
>>>>> Additionally, the (at present still hypothetical) unmap case, if
>>>>> failing because of the change here, would then again chance to
>>>>> leave mappings in place while the underlying pages get freed. As
>>>>> this would likely require an XSA, the change doesn't feel like
>>>>> "hardening" to me.
>>>>
>>>> I would agree with this if memory allocations could never fail. That's
>>>> not that case and will become worse as we use IOMMU pool.
>>>>
>>>> Do you have callers in mind that doesn't check the returns of iommu_unmap()?
>>>
>>> The function is marked __must_check, so there won't be any direct
>>> callers ignoring errors (albeit I may be wrong here - we used to
>>> have cases where we simply suppressed the resulting compiler
>>> diagnostic, without really handling errors; not sure if all of
>>> these are gone by now). Risks might be elsewhere.
>>
>> But this is not a new risk. So I don't understand why you think my patch
>> is the one that may lead to an XSA in the future.
> 
> I didn't mean to imply it would _lead_ to an XSA (you're
> right that the problem was there already before), but the term
> "harden" suggests to me that the patch aims at eliminating
> possible conditions.

It elimitates the risk that someone inadvertently call 
iommu_alloc_pgtable() when the domain is dying. If this is happening 
after the page tables have been freed, then we would end up to leak memory.

> IOW the result here looks to me as if it
> would yield a false sense of safety.

So you are concerned about the wording rather than the code itself. Is 
that correct?

If so, how about "xen/iommu: Make the IOMMU page-table allocator 
slightly firmer"?

Cheers,

-- 
Julien Grall

