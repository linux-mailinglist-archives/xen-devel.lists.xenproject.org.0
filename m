Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D013F5FEC94
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422697.668906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHyS-0005Gi-IG; Fri, 14 Oct 2022 10:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422697.668906; Fri, 14 Oct 2022 10:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHyS-0005Do-Eo; Fri, 14 Oct 2022 10:31:28 +0000
Received: by outflank-mailman (input) for mailman id 422697;
 Fri, 14 Oct 2022 10:31:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojHyQ-0005DW-EP
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:31:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojHyQ-0006dF-4B; Fri, 14 Oct 2022 10:31:26 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojHyP-0005Ok-UV; Fri, 14 Oct 2022 10:31:26 +0000
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
	bh=7BeKFaTkbHyH46PIG8dWbxa+e15SOWdJco5+qrwqVmo=; b=vWN1Ul6hUY4WHRLdlc9+dN740M
	ndF+EcSUmoU56Lssq5Y6Yu9rpbRqCTwvKaFrJ7sPGwvUI+zKHV690A5hAu3WPa6bKuXDyVH/1fpKk
	uYEadnzQaJXx6hDC787VXsQxZ2bkT5RkX53ax4SwN/dlIZHdjcIoT5g8RMsuo889jVV4=;
Message-ID: <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
Date: Fri, 14 Oct 2022 11:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221014080917.14980-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/10/2022 09:09, Henry Wang wrote:
> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> when the domain is created. Considering the worst case of page tables
> which requires 6 P2M pages as the two pages will be consecutive but not
> necessarily in the same L3 page table and keep a buffer, populate 16
> pages as the default value to the P2M pages pool in arch_domain_create()
> at the domain creation stage to satisfy the GICv2 requirement. For
> GICv3, the above-mentioned P2M mapping is not necessary, but since the
> allocated 16 pages here would not be lost, hence populate these pages
> unconditionally.
> 
> With the default 16 P2M pages populated, there would be a case that
> failures would happen in the domain creation with P2M pages already in
> use. To properly free the P2M for this case, firstly support the
> optionally preemption of p2m_teardown(), then call p2m_teardown() and
> p2m_set_allocation(d, 0, NULL) in p2m_final_teardown() if needed.
> 
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> This should also be backported to 4.13, 4.14, 4.15 and 4.16.
> v2 changes:
> - Move the p2m_set_allocation(d, 0, NULL); to p2m_final_teardown().
> - Support optionally preemption of p2m_teardown(), and make the calling of
>    p2m_teardown() preemptively when relinquish the resources, non-preemptively
>    in p2m_final_teardown().
> - Refactor the error handling to make the code use less spin_unlock.
> - Explain the worst case of page tables and the unconditional population
>    of pages in commit message.
> - Mention the unconditional population of pages in in-code comment.
> ---
>   xen/arch/arm/domain.c          | 16 +++++++++++++++-
>   xen/arch/arm/include/asm/p2m.h | 11 +++++++----
>   xen/arch/arm/p2m.c             | 15 +++++++++++++--
>   3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2c84e6dbbb..831e248ad7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -740,6 +740,20 @@ int arch_domain_create(struct domain *d,
>           BUG();
>       }
>   
> +    /*
> +     * Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
> +     * when the domain is created. Considering the worst case for page
> +     * tables and keep a buffer, populate 16 pages to the P2M pages pool here.
> +     * For GICv3, the above-mentioned P2M mapping is not necessary, but since
> +     * the allocated 16 pages here would not be lost, hence populate these
> +     * pages unconditionally.
> +     */
> +    spin_lock(&d->arch.paging.lock);
> +    rc = p2m_set_allocation(d, 16, NULL);
> +    spin_unlock(&d->arch.paging.lock);
> +    if ( rc != 0 )
> +        goto fail;
> +
>       if ( (rc = domain_vgic_register(d, &count)) != 0 )
>           goto fail;
>   
> @@ -1064,7 +1078,7 @@ int domain_relinquish_resources(struct domain *d)
>               return ret;
>   
>       PROGRESS(p2m):
> -        ret = p2m_teardown(d);
> +        ret = p2m_teardown(d, true);
>           if ( ret )
>               return ret;
>   
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 42bfd548c4..480d65e95e 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -194,14 +194,17 @@ int p2m_init(struct domain *d);
>   
>   /*
>    * The P2M resources are freed in two parts:
> - *  - p2m_teardown() will be called when relinquish the resources. It
> - *    will free large resources (e.g. intermediate page-tables) that
> - *    requires preemption.
> + *  - p2m_teardown() will be called preemptively when relinquish the
> + *    resources, in which case it will free large resources (e.g. intermediate
> + *    page-tables) that requires preemption.
>    *  - p2m_final_teardown() will be called when domain struct is been
>    *    freed. This *cannot* be preempted and therefore one small
>    *    resources should be freed here.
> + *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
> + *  free the P2M when failures happen in the domain creation with P2M pages
> + *  already in use. In this case p2m_teardown() is called non-preemptively.
>    */
> -int p2m_teardown(struct domain *d);
> +int p2m_teardown(struct domain *d, bool allow_preemption);
>   void p2m_final_teardown(struct domain *d);
>   
>   /*
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index f17500ddf3..707bd3e2e3 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1685,7 +1685,7 @@ static void p2m_free_vmid(struct domain *d)
>       spin_unlock(&vmid_alloc_lock);
>   }
>   
> -int p2m_teardown(struct domain *d)
> +int p2m_teardown(struct domain *d, bool allow_preemption)
>   {
I think the part to clean & invalidate the root should not be necessary 
if the domain is not scheduled. Similarly, I think we might only need to 
do once by domain (rather than for every call). So I would consider to 
move the logic outside of the function.

That's not for 4.17 thought.

>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>       unsigned long count = 0;
> @@ -1716,7 +1716,7 @@ int p2m_teardown(struct domain *d)
>           p2m_free_page(p2m->domain, pg);
>           count++;
>           /* Arbitrarily preempt every 512 iterations */
> -        if ( !(count % 512) && hypercall_preempt_check() )
> +        if ( allow_preemption && !(count % 512) && hypercall_preempt_check() )
>           {
>               rc = -ERESTART;
>               break;
> @@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
>       if ( !p2m->domain )
>           return;
>   
> +    if ( !page_list_empty(&p2m->pages) )

Did you add this check to avoid the clean & invalidate if the list is empty?

> +        p2m_teardown(d, false);

Today, it should be fine to ignore p2m_teardown(). But I would prefer if 
we add an ASSERT()/BUG_ON() (or else) to make confirm this is the case.

This also wants to be documented on top of p2m_teardown() as it would be 
easier to know that the function should always return 0 when 
!allow_preemption is not set.

I also noticed that relinquish_p2m_mapping() is not called. This should 
be fine for us because arch_domain_create() should never create a 
mapping that requires p2m_put_l3_page() to be called.

I think it would be good to check it in __p2m_set_entry(). So we don't 
end up to add such mappings by mistake.

I would have suggested to add a comment only for version and send a 
follow-up patch. But I don't exactly know where to put it.

> +
> +    if ( d->arch.paging.p2m_total_pages != 0 )
> +    {
> +        spin_lock(&d->arch.paging.lock);
> +        p2m_set_allocation(d, 0, NULL);
> +        spin_unlock(&d->arch.paging.lock);
> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
> +    }
> +
>       ASSERT(page_list_empty(&p2m->pages));

I would move this assert between the two ifs you added.

>       ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
>   

Cheers,

-- 
Julien Grall

