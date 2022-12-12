Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845E649D7D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459494.717241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gtV-0003M9-S8; Mon, 12 Dec 2022 11:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459494.717241; Mon, 12 Dec 2022 11:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4gtV-0003JH-Ow; Mon, 12 Dec 2022 11:22:49 +0000
Received: by outflank-mailman (input) for mailman id 459494;
 Mon, 12 Dec 2022 11:22:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4gtU-0003JB-3H
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:22:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4gtT-0003jH-6x; Mon, 12 Dec 2022 11:22:47 +0000
Received: from [54.239.6.188] (helo=[192.168.19.227])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4gtT-00069V-1G; Mon, 12 Dec 2022 11:22:47 +0000
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
	bh=GmIeuXXIH8XA5d4Eia4OzV+CjuzbMm1wW9QEHcvv5Tg=; b=F5IpilW/7prv0KIvcs4TbsraF7
	6Jf/T327NlYtSymStLRIxWAooDNtk7ORs0MxZs2LFXbNQK7t+XJGWOtlSqaxWYGeNdwrA0B7wMCO/
	CIa9OFbYirxLrQU3GpowBEwhGYWs9AkVgmqyGE6BuBcFAeJxSomD68bXJn1rW2w2DxHE=;
Message-ID: <65819ff9-1a1a-dfc3-f700-289dd8c340dc@xen.org>
Date: Mon, 12 Dec 2022 11:22:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/arm: Reduce redundant clear root pages when teardown
 p2m
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212064119.2632626-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221212064119.2632626-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 12/12/2022 06:41, Henry Wang wrote:
> Currently, p2m for a domain will be teardown from two paths:
> (1) The normal path when a domain is destroyed.
> (2) The arch_domain_destroy() in the failure path of domain creation.
> 
> When tearing down p2m from (1), the part to clear and clean the root
> is only needed to do once rather than for every call of p2m_teardown().
> If the p2m teardown is from (2), the clear and clean of the root
> is unnecessary because the domain is not scheduled.
> 
> Therefore, this patch introduces a helper `p2m_clear_root_pages()` to
> do the clear and clean of the root, and move this logic outside of
> p2m_teardown(). With this movement, the `page_list_empty(&p2m->pages)`
> check can be dropped.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   xen/arch/arm/domain.c          |  5 +++++
>   xen/arch/arm/include/asm/p2m.h |  1 +
>   xen/arch/arm/p2m.c             | 23 ++++++++++++-----------
>   3 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 99577adb6c..29c189aab4 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1022,6 +1022,11 @@ int domain_relinquish_resources(struct domain *d)
>               return ret;
>   
>       PROGRESS(p2m):
> +        /*
> +         * We are about to free the intermediate page-tables, so clear the
> +         * root to prevent any walk to use them.
> +         */
> +        p2m_clear_root_pages(&d->arch.p2m);

The commit message suggests this should only be called once. However, 
you will still end up to call p2m_clear_root_pages() multiple time if 
p2m_teardown() is preempted.

>           ret = p2m_teardown(d, true);
>           if ( ret )
>               return ret;
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 91df922e1c..bf5183e53a 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -281,6 +281,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
>   
>   bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn);
>   
> +void p2m_clear_root_pages(struct p2m_domain *p2m);
>   void p2m_invalidate_root(struct p2m_domain *p2m);
>   
>   /*
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d84..0c942c5923 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1314,6 +1314,18 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
>       p2m->need_flush = true;
>   }
>   
> +void p2m_clear_root_pages(struct p2m_domain *p2m)
> +{
> +    unsigned int i;
> +
> +    p2m_write_lock(p2m);
> +
> +    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
> +        clear_and_clean_page(p2m->root + i);
> +
> +    p2m_write_unlock(p2m);
> +}
> +
>   /*
>    * Invalidate all entries in the root page-tables. This is
>    * useful to get fault on entry and do an action.
> @@ -1698,21 +1710,10 @@ int p2m_teardown(struct domain *d, bool allow_preemption)
>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>       unsigned long count = 0;
>       struct page_info *pg;
> -    unsigned int i;
>       int rc = 0;
>   
> -    if ( page_list_empty(&p2m->pages) )
> -        return 0;
> -
>       p2m_write_lock(p2m);
>   
> -    /*
> -     * We are about to free the intermediate page-tables, so clear the
> -     * root to prevent any walk to use them.
> -     */
> -    for ( i = 0; i < P2M_ROOT_PAGES; i++ )
> -        clear_and_clean_page(p2m->root + i);
> -
>       /*
>        * The domain will not be scheduled anymore, so in theory we should
>        * not need to flush the TLBs. Do it for safety purpose.

This flush needs to be moved in p2m_clear_root_pages().

Cheers,

-- 
Julien Grall

