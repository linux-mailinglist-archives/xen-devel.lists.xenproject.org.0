Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0431F606
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 09:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86806.163217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1Qx-0001Ar-AS; Fri, 19 Feb 2021 08:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86806.163217; Fri, 19 Feb 2021 08:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD1Qx-0001AU-6g; Fri, 19 Feb 2021 08:46:43 +0000
Received: by outflank-mailman (input) for mailman id 86806;
 Fri, 19 Feb 2021 08:46:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD1Qv-0001AP-Vx
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 08:46:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be2a6f6e-ec37-43c3-92e6-fb57a8345150;
 Fri, 19 Feb 2021 08:46:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18929ACCF;
 Fri, 19 Feb 2021 08:46:40 +0000 (UTC)
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
X-Inumbo-ID: be2a6f6e-ec37-43c3-92e6-fb57a8345150
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613724400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3RyBAYQCeDYzG/Exeg8ZGxCTU7G67wdtJL3rkXfd9g=;
	b=BPxy0O2Pk5cCHPNBxhDbSu95YAqmx+wnOPtTyDhfvAj81AEA8r9T9b53xx6DiWoKoCUPI1
	fnyeq4O9Ngk0832No9vOxBKgrqoWmj/7W5CxMuCWIp6emOYwpibOeJTarK+zFgu68rNYlt
	VOhrAnVZQ4wTq4M9YZwjoZ5rSBCbmjo=
Subject: Re: [for-4.15][PATCH v3 3/3] xen/iommu: x86: Harden the IOMMU
 page-table allocator
To: Julien Grall <julien@xen.org>
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
 <6e467ed0-34f1-498d-a9ce-7e0f2e606033@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f3697524-3565-2cbc-29f1-8ffaf1c772fb@suse.com>
Date: Fri, 19 Feb 2021 09:46:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6e467ed0-34f1-498d-a9ce-7e0f2e606033@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 18:41, Julien Grall wrote:
> 
> 
> On 18/02/2021 17:04, Jan Beulich wrote:
>> On 18.02.2021 14:19, Julien Grall wrote:
>>>
>>>
>>> On 18/02/2021 13:10, Jan Beulich wrote:
>>>> On 17.02.2021 17:29, Julien Grall wrote:
>>>>> On 17/02/2021 15:13, Jan Beulich wrote:
>>>>>> On 17.02.2021 15:24, Julien Grall wrote:> --- a/xen/drivers/passthrough/x86/iommu.c> +++ b/xen/drivers/passthrough/x86/iommu.c> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)>  >  void arch_iommu_domain_destroy(struct domain *d)>  {> +    /*> +     * There should be not page-tables left allocated by the time the
>>>>>> Nit: s/not/no/ ?
>>>>>>
>>>>>>> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
>>>>>>> +     * called unconditionally, so pgtables may be unitialized.
>>>>>>> +     */
>>>>>>> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
>>>>>>> +           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
>>>>>>>     }
>>>>>>>     
>>>>>>>     static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
>>>>>>> @@ -279,6 +286,9 @@ int iommu_free_pgtables(struct domain *d)
>>>>>>>          */
>>>>>>>         hd->platform_ops->clear_root_pgtable(d);
>>>>>>>     
>>>>>>> +    /* After this barrier no new page allocations can occur. */
>>>>>>> +    spin_barrier(&hd->arch.pgtables.lock);
>>>>>>
>>>>>> Didn't patch 2 utilize the call to ->clear_root_pgtable() itself as
>>>>>> the barrier? Why introduce another one (with a similar comment)
>>>>>> explicitly now?
>>>>> The barriers act differently, one will get against any IOMMU page-tables
>>>>> modification. The other one will gate against allocation.
>>>>>
>>>>> There is no guarantee that the former will prevent the latter.
>>>>
>>>> Oh, right - different locks. I got confused here because in both
>>>> cases the goal is to prevent allocations.
>>>>
>>>>>>> @@ -315,9 +326,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>>>>>>>         unmap_domain_page(p);
>>>>>>>     
>>>>>>>         spin_lock(&hd->arch.pgtables.lock);
>>>>>>> -    page_list_add(pg, &hd->arch.pgtables.list);
>>>>>>> +    /*
>>>>>>> +     * The IOMMU page-tables are freed when relinquishing the domain, but
>>>>>>> +     * nothing prevent allocation to happen afterwards. There is no valid
>>>>>>> +     * reasons to continue to update the IOMMU page-tables while the
>>>>>>> +     * domain is dying.
>>>>>>> +     *
>>>>>>> +     * So prevent page-table allocation when the domain is dying.
>>>>>>> +     *
>>>>>>> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
>>>>>>> +     */
>>>>>>> +    if ( likely(!d->is_dying) )
>>>>>>> +    {
>>>>>>> +        alive = true;
>>>>>>> +        page_list_add(pg, &hd->arch.pgtables.list);
>>>>>>> +    }
>>>>>>>         spin_unlock(&hd->arch.pgtables.lock);
>>>>>>>     
>>>>>>> +    if ( unlikely(!alive) )
>>>>>>> +    {
>>>>>>> +        free_domheap_page(pg);
>>>>>>> +        pg = NULL;
>>>>>>> +    }
>>>>>>> +
>>>>>>>         return pg;
>>>>>>>     }
>>>>>>
>>>>>> As before I'm concerned of this forcing error paths to be taken
>>>>>> elsewhere, in case an allocation still happens (e.g. from unmap
>>>>>> once super page mappings are supported). Considering some of the
>>>>>> error handling in the IOMMU code is to invoke domain_crash(), it
>>>>>> would be quite unfortunate if we ended up crashing a domain
>>>>>> while it is being cleaned up after.
>>>>>
>>>>> It is unfortunate, but I think this is better than having to leak page
>>>>> tables.
>>>>>
>>>>>>
>>>>>> Additionally, the (at present still hypothetical) unmap case, if
>>>>>> failing because of the change here, would then again chance to
>>>>>> leave mappings in place while the underlying pages get freed. As
>>>>>> this would likely require an XSA, the change doesn't feel like
>>>>>> "hardening" to me.
>>>>>
>>>>> I would agree with this if memory allocations could never fail. That's
>>>>> not that case and will become worse as we use IOMMU pool.
>>>>>
>>>>> Do you have callers in mind that doesn't check the returns of iommu_unmap()?
>>>>
>>>> The function is marked __must_check, so there won't be any direct
>>>> callers ignoring errors (albeit I may be wrong here - we used to
>>>> have cases where we simply suppressed the resulting compiler
>>>> diagnostic, without really handling errors; not sure if all of
>>>> these are gone by now). Risks might be elsewhere.
>>>
>>> But this is not a new risk. So I don't understand why you think my patch
>>> is the one that may lead to an XSA in the future.
>>
>> I didn't mean to imply it would _lead_ to an XSA (you're
>> right that the problem was there already before), but the term
>> "harden" suggests to me that the patch aims at eliminating
>> possible conditions.
> 
> It elimitates the risk that someone inadvertently call 
> iommu_alloc_pgtable() when the domain is dying. If this is happening 
> after the page tables have been freed, then we would end up to leak memory.
> 
>> IOW the result here looks to me as if it
>> would yield a false sense of safety.
> 
> So you are concerned about the wording rather than the code itself. Is 
> that correct?

In a way, yes. First of all I'd like us to settle on what to do
with late unmap requests, for 4.15 (and if need be longer term).

Jan

> If so, how about "xen/iommu: Make the IOMMU page-table allocator 
> slightly firmer"?
> 
> Cheers,
> 


