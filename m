Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247892A0B85
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 17:43:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16061.39329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYXUv-0006QF-S9; Fri, 30 Oct 2020 16:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16061.39329; Fri, 30 Oct 2020 16:43:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYXUv-0006Pq-OX; Fri, 30 Oct 2020 16:43:29 +0000
Received: by outflank-mailman (input) for mailman id 16061;
 Fri, 30 Oct 2020 16:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYXUu-0006Pl-BF
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:43:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8df15e29-fa15-4355-a356-17c001ddae72;
 Fri, 30 Oct 2020 16:43:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A019B8FA;
 Fri, 30 Oct 2020 16:43:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2BB6=EF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYXUu-0006Pl-BF
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 16:43:28 +0000
X-Inumbo-ID: 8df15e29-fa15-4355-a356-17c001ddae72
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8df15e29-fa15-4355-a356-17c001ddae72;
	Fri, 30 Oct 2020 16:43:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604076206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XHbYctlhnOI+j8EwYwcg+4LJQJ2Xt2wV9ITG9UwtcoM=;
	b=jNRlhrywE+vhLbU52w+miGLN2dhFXfyOCtx6k0djPC3Jdj1AyhayEZEyZhSuxR8ex4796K
	0xi86yaCXjtWfvVVt8BwWzOS1KYCgISG6Gdc9P7pFYIFTeMeSFJJIDYJuwgpbNq+bbFEjI
	lIEbJP6U4KiTJyN/q7cnuATi0+N8iAo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8A019B8FA;
	Fri, 30 Oct 2020 16:43:26 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86 / iommu: create a dedicated pool of page-table
 pages
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0729b2b0-cd72-e16c-3ba6-89a86d2db8ac@suse.com>
Date: Fri, 30 Oct 2020 17:43:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.10.2020 11:49, Paul Durrant wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2304,7 +2304,9 @@ int domain_relinquish_resources(struct domain *d)
>  
>      PROGRESS(iommu_pagetables):
>  
> -        ret = iommu_free_pgtables(d);
> +        iommu_free_pgtables(d);
> +
> +        ret = iommu_set_allocation(d, 0);
>          if ( ret )
>              return ret;

There doesn't look to be a need to call iommu_free_pgtables()
more than once - how about you move it immediately ahead of
the (extended) case label?

> +static int set_allocation(struct domain *d, unsigned int nr_pages,
> +                          bool allow_preempt)

Why the allow_preempt parameter when the sole caller passes
"true"?

> +/*
> + * Some IOMMU mappings are set up during domain_create() before the tool-
> + * stack has a chance to calculate and set the appropriate page-table
> + * allocation. A hard-coded initial allocation covers this gap.
> + */
> +#define INITIAL_ALLOCATION 256

How did you arrive at this number? IOW how many pages do we
need in reality, and how much leeway have you added in?

As to the tool stack - why would it "have a chance" to do the
necessary calculations only pretty late? I wonder whether the
intended allocation wouldn't better be part of struct
xen_domctl_createdomain, without the need for a new sub-op.

> @@ -265,38 +350,45 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>          return;
>  }
>  
> -int iommu_free_pgtables(struct domain *d)
> +void iommu_free_pgtables(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> -    struct page_info *pg;
> -    unsigned int done = 0;
>  
> -    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
> -    {
> -        free_domheap_page(pg);
> +    spin_lock(&hd->arch.pgtables.lock);
>  
> -        if ( !(++done & 0xff) && general_preempt_check() )
> -            return -ERESTART;
> -    }
> +    page_list_splice(&hd->arch.pgtables.list, &hd->arch.pgtables.free_list);
> +    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
>  
> -    return 0;
> +    spin_unlock(&hd->arch.pgtables.lock);
>  }
>  
>  struct page_info *iommu_alloc_pgtable(struct domain *d)
>  {
>      struct domain_iommu *hd = dom_iommu(d);
> -    unsigned int memflags = 0;
>      struct page_info *pg;
>      void *p;
>  
> -#ifdef CONFIG_NUMA
> -    if ( hd->node != NUMA_NO_NODE )
> -        memflags = MEMF_node(hd->node);
> -#endif
> +    spin_lock(&hd->arch.pgtables.lock);
>  
> -    pg = alloc_domheap_page(NULL, memflags);
> + again:
> +    pg = page_list_remove_head(&hd->arch.pgtables.free_list);
>      if ( !pg )
> +    {
> +        /*
> +         * The hardware and quarantine domains are not subject to a quota
> +         * so create page-table pages on demand.
> +         */
> +        if ( is_hardware_domain(d) || d == dom_io )
> +        {
> +            int rc = create_pgtable(d);
> +
> +            if ( !rc )
> +                goto again;

This gives the appearance of a potentially infinite loop; it's
not because the lock is being held, but I still wonder whether
the impression this gives couldn't be avoided by a slightly
different code structure.

Also the downside of this is that the amount of pages used by
hwdom will now never shrink anymore.

> @@ -306,7 +398,6 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>  
>      unmap_domain_page(p);
>  
> -    spin_lock(&hd->arch.pgtables.lock);
>      page_list_add(pg, &hd->arch.pgtables.list);
>      spin_unlock(&hd->arch.pgtables.lock);

You want to drop the lock before the map/clear/unmap, and then
re-acquire it. Or, on the assumption that putting it on the
list earlier is fine (which I think it is), move the other two
lines here up as well.

Jan

