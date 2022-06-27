Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D3F55B82D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356276.584403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5j7K-00060p-Iq; Mon, 27 Jun 2022 07:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356276.584403; Mon, 27 Jun 2022 07:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5j7K-0005xM-Er; Mon, 27 Jun 2022 07:25:06 +0000
Received: by outflank-mailman (input) for mailman id 356276;
 Mon, 27 Jun 2022 07:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5j7J-0005xG-GP
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:25:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 429a85af-f5ea-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 09:25:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA91D1758;
 Mon, 27 Jun 2022 00:25:02 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51EDC3F5A1;
 Mon, 27 Jun 2022 00:25:01 -0700 (PDT)
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
X-Inumbo-ID: 429a85af-f5ea-11ec-bd2d-47488cf2e6aa
Message-ID: <c05cb05f-0344-19d2-4f8f-caa904c374dc@arm.com>
Date: Mon, 27 Jun 2022 09:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/7] xen/arm32: mm: Consolidate the domheap mappings
 initialization
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-6-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-6-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the domheap mappings initialization is done separately for
> the boot CPU and secondary CPUs. The main difference is for the former
> the pages are part of Xen binary whilst for the latter they are
> dynamically allocated.
> 
> It would be good to have a single helper so it is easier to rework
> on the domheap is initialized.
> 
> For CPU0, we still need to use pre-allocated pages because the
> allocators may use domain_map_page(), so we need to have the domheap
> area ready first. But we can still delay the initialization to setup_mm().
> 
> Introduce a new helper domheap_mapping_init() that will be called
FWICS the function name is init_domheap_mappings.

> from setup_mm() for the boot CPU and from init_secondary_pagetables()
> for secondary CPUs.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/include/asm/arm32/mm.h |  2 +
>  xen/arch/arm/mm.c                   | 92 +++++++++++++++++++----------
>  xen/arch/arm/setup.c                |  8 +++
>  3 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
> index 6b039d9ceaa2..575373aeb985 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -10,6 +10,8 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return false;
>  }
>  
> +bool init_domheap_mappings(unsigned int cpu);
> +
>  #endif /* __ARM_ARM32_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 20733afebce4..995aa1e4480e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -372,6 +372,58 @@ void clear_fixmap(unsigned map)
>  }
>  
>  #ifdef CONFIG_DOMAIN_PAGE
> +/*
> + * Prepare the area that will be used to map domheap pages. They are
> + * mapped in 2MB chunks, so we need to allocate the page-tables up to
> + * the 2nd level.
> + *
> + * The caller should make sure the root page-table for @cpu has been
> + * been allocated.
Second 'been' not needed.

> + */
> +bool init_domheap_mappings(unsigned int cpu)
> +{
> +    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
> +    lpae_t *root = per_cpu(xen_pgtable, cpu);
> +    unsigned int i, first_idx;
> +    lpae_t *domheap;
> +    mfn_t mfn;
> +
> +    ASSERT(root);
> +    ASSERT(!per_cpu(xen_dommap, cpu));
> +
> +    /*
> +     * The domheap for cpu0 is before the heap is initialized. So we
> +     * need to use pre-allocated pages.
> +     */
> +    if ( !cpu )
> +        domheap = cpu0_dommap;
> +    else
> +        domheap = alloc_xenheap_pages(order, 0);
> +
> +    if ( !domheap )
> +        return false;
> +
> +    /* Ensure the domheap has no stray mappings */
> +    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
> +
> +    /*
> +     * Update the first level mapping to reference the local CPUs
> +     * domheap mapping pages.
> +     */
> +    mfn = virt_to_mfn(domheap);
> +    first_idx = first_table_offset(DOMHEAP_VIRT_START);
> +    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
> +    {
> +        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
I might have missed sth but shouldn't 'i' be multiplied by XEN_PT_LPAE_ENTRIES?

Cheers,
Michal

