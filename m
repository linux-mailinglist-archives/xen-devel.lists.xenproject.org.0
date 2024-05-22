Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739158CC7D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 22:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727876.1132557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ssO-0008UT-Ss; Wed, 22 May 2024 20:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727876.1132557; Wed, 22 May 2024 20:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ssO-0008SP-Po; Wed, 22 May 2024 20:47:56 +0000
Received: by outflank-mailman (input) for mailman id 727876;
 Wed, 22 May 2024 20:47:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s9ssO-0008SJ-1p
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 20:47:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9ssN-0005H8-Ou; Wed, 22 May 2024 20:47:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9ssN-00057a-Hm; Wed, 22 May 2024 20:47:55 +0000
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
	bh=BdR/yNSjH2i6t85xzLFAfqntVHQKlvGxk2BDo3UY0rc=; b=oejDbQYmJ0SXcu4nmGtTyX4CVp
	yRlUCrMg6oEYshVTs/EFkk9ON5LGfcaKoVrJSQEk4rGnkSZB7dBr+FtmhZK/dfcwCU/CN/3/yUCi9
	waMGjUcjSf057MvTWooGAkVTj6ZrvNlbykWXum4PVMUK/IgaK3ap3TFF1rKnTIByBjdg=;
Message-ID: <774cdc8a-d815-4330-a17a-558e3c0a49b5@xen.org>
Date: Wed, 22 May 2024 21:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] xen/p2m: put reference for level 2 superpage
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-4-luca.fancellu@arm.com>
 <c10b2513-b0f1-4042-a538-2115e92408d1@xen.org>
 <CD6149B6-EC9C-4313-AA21-F0F0156A9E1C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CD6149B6-EC9C-4313-AA21-F0F0156A9E1C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/05/2024 14:47, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

>> On 22 May 2024, at 14:25, Julien Grall <julien@xen.org> wrote:
>>
>>> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
>>> index 41fcca011cf4..b496266deef6 100644
>>> --- a/xen/arch/arm/mmu/p2m.c
>>> +++ b/xen/arch/arm/mmu/p2m.c
>>> @@ -753,17 +753,9 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
>>>       return rc;
>>>   }
>>>   -/*
>>> - * Put any references on the single 4K page referenced by pte.
>>> - * TODO: Handle superpages, for now we only take special references for leaf
>>> - * pages (specifically foreign ones, which can't be super mapped today).
>>> - */
>>> -static void p2m_put_l3_page(const lpae_t pte)
>>> +/* Put any references on the single 4K page referenced by mfn. */
>>> +static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
>>>   {
>>> -    mfn_t mfn = lpae_get_mfn(pte);
>>> -
>>> -    ASSERT(p2m_is_valid(pte));
>>> -
>>>       /*
>>>        * TODO: Handle other p2m types
>>>        *
>>> @@ -771,16 +763,43 @@ static void p2m_put_l3_page(const lpae_t pte)
>>>        * flush the TLBs if the page is reallocated before the end of
>>>        * this loop.
>>>        */
>>> -    if ( p2m_is_foreign(pte.p2m.type) )
>>> +    if ( p2m_is_foreign(type) )
>>>       {
>>>           ASSERT(mfn_valid(mfn));
>>>           put_page(mfn_to_page(mfn));
>>>       }
>>>       /* Detect the xenheap page and mark the stored GFN as invalid. */
>>> -    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
>>> +    else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
>>>           page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
>>>   }
>>
>> All the pages within a 2MB mapping should be the same type. So...
>>
>>>   +/* Put any references on the superpage referenced by mfn. */
>>> +static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>>> +    {
>>> +        p2m_put_l3_page(mfn, type);
>>> +
>>> +        mfn = mfn_add(mfn, 1);
>>> +    }
>>
>> ... this solution is a bit wasteful as we will now call p2m_put_l3_page() 512 times even though there is nothing to do.
>>
>> So instead can we move the checks outside to optimize the path a bit?
> 
> You mean this?
> 
> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> index b496266deef6..d40cddda48f3 100644
> --- a/xen/arch/arm/mmu/p2m.c
> +++ b/xen/arch/arm/mmu/p2m.c
> @@ -794,7 +794,8 @@ static void p2m_put_page(const lpae_t pte, unsigned int level)
>       ASSERT(p2m_is_valid(pte));
>   
>       /* We have a second level 2M superpage */
> -    if ( p2m_is_superpage(pte, level) && (level == 2) )
> +    if ( p2m_is_superpage(pte, level) && (level == 2) &&
> +         p2m_is_foreign(pte.p2m.type) )
>           return p2m_put_l2_superpage(mfn, pte.p2m.type);
>       else if ( level == 3 )
>           return p2m_put_l3_page(mfn, pte.p2m.type);

I meant something like below. This is untested and to apply on top of 
this patch:

diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index b496266deef6..60c4d680b417 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -753,20 +753,27 @@ static int p2m_mem_access_radix_set(struct 
p2m_domain *p2m, gfn_t gfn,
      return rc;
  }

+static void p2m_put_foreign_page(struct page_info *pg)
+{
+    /*
+     * It's safe to do the put_page here because page_alloc will
+     * flush the TLBs if the page is reallocated before the end of
+     * this loop.
+     */
+    put_page(pg)
+}
+
  /* Put any references on the single 4K page referenced by mfn. */
  static void p2m_put_l3_page(mfn_t mfn, p2m_type_t type)
  {
      /*
       * TODO: Handle other p2m types
       *
-     * It's safe to do the put_page here because page_alloc will
-     * flush the TLBs if the page is reallocated before the end of
-     * this loop.
       */
      if ( p2m_is_foreign(type) )
      {
          ASSERT(mfn_valid(mfn));
-        put_page(mfn_to_page(mfn));
+        p2m_put_foreign_page(mfn_to_page(mfn));
      }
      /* Detect the xenheap page and mark the stored GFN as invalid. */
      else if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
@@ -777,13 +784,18 @@ static void p2m_put_l3_page(mfn_t mfn, p2m_type_t 
type)
  static void p2m_put_l2_superpage(mfn_t mfn, p2m_type_t type)
  {
      unsigned int i;
+    struct page_info *pg;

-    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
-    {
-        p2m_put_l3_page(mfn, type);
+    /* TODO: Handle other p2m types */
+    if ( p2m_is_foreign(type) )
+        return;

-        mfn = mfn_add(mfn, 1);
-    }
+    ASSERT(mfn_valid(mfn));
+
+    pg = mfn_to_page(mfn);
+
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++, pg++ )
+        p2m_put_foreign_page(pg);
  }

  /* Put any references on the page referenced by pte. */

The type check only happens once. Also, I moved mfn_to_page(...) outside 
of the loop because the operation is expensive. Yet, if the MFNs are 
contiguous, then the page_info structures will be too.
	
> 
> 
>> Otherwise...
>>
>>> +}
>>> +
>>> +/* Put any references on the page referenced by pte. */
>>> +static void p2m_put_page(const lpae_t pte, unsigned int level)
>>> +{
>>> +    mfn_t mfn = lpae_get_mfn(pte);
>>> +
>>> +    ASSERT(p2m_is_valid(pte));
>>> +
>>> +    /* We have a second level 2M superpage */
>>> +    if ( p2m_is_superpage(pte, level) && (level == 2) )
>>> +        return p2m_put_l2_superpage(mfn, pte.p2m.type);
>>> +    else if ( level == 3 )
>>> +        return p2m_put_l3_page(mfn, pte.p2m.type);
>>> +}
>>> +
>>>   /* Free lpae sub-tree behind an entry */
>>>   static void p2m_free_entry(struct p2m_domain *p2m,
>>>                              lpae_t entry, unsigned int level)
>>> @@ -809,9 +828,16 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>>   #endif
>>>             p2m->stats.mappings[level]--;
>>> -        /* Nothing to do if the entry is a super-page. */
>>> -        if ( level == 3 )
>>> -            p2m_put_l3_page(entry);
>>> +        /*
>>> +         * TODO: Currently we don't handle 1GB super-page, Xen is not
>>> +         * preemptible and therefore some work is needed to handle such
>>> +         * superpages, for which at some point Xen might end up freeing memory
>>> +         * and therefore for such a big mapping it could end up in a very long
>>> +         * operation.
>>> +         */
>>> +        if ( level >= 2 )
>>> +            p2m_put_page(entry, level);
>>> +
>>>           return;
>>>       }
>>>   @@ -1558,9 +1584,12 @@ int relinquish_p2m_mapping(struct domain *d)
>>>             count++;
>>>           /*
>>> -         * Arbitrarily preempt every 512 iterations.
>>> +         * Arbitrarily preempt every 512 iterations or when type is foreign
>>> +         * mapping and the order is above 9 (2MB).
>>>            */
>>> -        if ( !(count % 512) && hypercall_preempt_check() )
>>> +        if ( (!(count % 512) ||
>>> +              (p2m_is_foreign(t) && (order > XEN_PT_LEVEL_ORDER(2)))) &&
>>
>> ... we would need to preempt for every 2MB rather than just for the p2m_is_foreign().
> 
> Ok otherwise you are suggesting that if we don’t go for the solution above we drop p2m_is_foreign(t) from
> the condition here, am I right?

That's correct.

> 
>>
>> BTW, p2m_put_l3_page() has also another case. Should we consider to handle preemption for it too?
> 
> You mean checking for 512 iterations, or foreign mapping when order is > 9, or
> p2m_is_ram(type) && is_xen_heap_mfn(mfn) ?

Looking at your proposal, your intent is to only handle foreign mapping 
for superpage. Is that right? If so, I think "(p2m_is_foreign(t) && 
(order > XEN_PT_LEVEL_ORDER(2))))" is ok. But I would suggest to 
document in p2m_put_l2_superpage() that any change in handling would 
also require to update the relinquish code.

Cheers,

-- 
Julien Grall

