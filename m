Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D201D64ACC8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:07:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460030.717823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tky-00029A-W8; Tue, 13 Dec 2022 01:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460030.717823; Tue, 13 Dec 2022 01:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tky-00026J-SQ; Tue, 13 Dec 2022 01:06:52 +0000
Received: by outflank-mailman (input) for mailman id 460030;
 Tue, 13 Dec 2022 01:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4tkw-00026D-RN
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:06:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bad0c7d-7a82-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 02:06:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F998B80B7C;
 Tue, 13 Dec 2022 01:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114B6C433D2;
 Tue, 13 Dec 2022 01:06:45 +0000 (UTC)
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
X-Inumbo-ID: 6bad0c7d-7a82-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670893607;
	bh=lQRHCfDoGdVEq41gPQJnRTWknRkmQPwGDfVK3xolQ5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E2UZpry8AdDtDqrxyyIPx2fpKsFm4+S1dIohfjOxk4v1icw0XPkyp05aqi2vCMx40
	 aS5K9sij3Y3ipCkJh7ehbA9AO+yu4EBJMW4oLU3BNUsN8Vfl4CXpWeE05fQdcBEFEg
	 MkxAmculUoOQ3sBT1zW6UCX1I4TBQqw2NxRT1Cyy4vsPnIIWLmhVNuJbZRpaqbzBOu
	 1pGRsoEURpOiWLLioje+tzKkbeJ+S5P0JQLEGWmBEl9A572flZxsFn8FoLkoLRTr0m
	 crjt1Q+4UhZ8DqlkizKiKxs4dW7XFTlhfeFOsFMznyO5ArWQ/u6/vdm2QaV491ceKM
	 qSW6hR2QSkUuA==
Date: Mon, 12 Dec 2022 17:06:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 11/18] xen/arm: Enable use of dump_pt_walk() early
 during boot
In-Reply-To: <20221212095523.52683-12-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121706340.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-12-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, dump_pt_walk() is using map_domain_page() to map
> the page tables.
> 
> map_domain_page() is only usuable after init_domheap_mappings() is called
> (arm32) or the xenheap has been initialized (arm64).
> 
> This means it can be hard to diagnose incorrect page-tables during
> early boot. So update dump_pt_walk() to xen_{, un}map_table() instead.
> 
> Note that the two helpers are moved earlier to avoid forward declaring
> them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/mm.c | 56 +++++++++++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 1315a2c87db7..d0b1cf55f550 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -191,6 +191,30 @@ static void __init __maybe_unused build_assertions(void)
>  #undef CHECK_DIFFERENT_SLOT
>  }
>  
> +static lpae_t *xen_map_table(mfn_t mfn)
> +{
> +    /*
> +     * During early boot, map_domain_page() may be unusable. Use the
> +     * PMAP to map temporarily a page-table.
> +     */
> +    if ( system_state == SYS_STATE_early_boot )
> +        return pmap_map(mfn);
> +
> +    return map_domain_page(mfn);
> +}
> +
> +static void xen_unmap_table(const lpae_t *table)
> +{
> +    /*
> +     * During early boot, xen_map_table() will not use map_domain_page()
> +     * but the PMAP.
> +     */
> +    if ( system_state == SYS_STATE_early_boot )
> +        pmap_unmap(table);
> +    else
> +        unmap_domain_page(table);
> +}
> +
>  void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>                    unsigned int root_level,
>                    unsigned int nr_root_tables)
> @@ -230,7 +254,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>      else
>          root_table = 0;
>  
> -    mapping = map_domain_page(mfn_add(root_mfn, root_table));
> +    mapping = xen_map_table(mfn_add(root_mfn, root_table));
>  
>      for ( level = root_level; ; level++ )
>      {
> @@ -246,11 +270,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>              break;
>  
>          /* For next iteration */
> -        unmap_domain_page(mapping);
> -        mapping = map_domain_page(lpae_get_mfn(pte));
> +        xen_unmap_table(mapping);
> +        mapping = xen_map_table(lpae_get_mfn(pte));
>      }
>  
> -    unmap_domain_page(mapping);
> +    xen_unmap_table(mapping);
>  }
>  
>  void dump_hyp_walk(vaddr_t addr)
> @@ -713,30 +737,6 @@ void *ioremap(paddr_t pa, size_t len)
>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>  }
>  
> -static lpae_t *xen_map_table(mfn_t mfn)
> -{
> -    /*
> -     * During early boot, map_domain_page() may be unusable. Use the
> -     * PMAP to map temporarily a page-table.
> -     */
> -    if ( system_state == SYS_STATE_early_boot )
> -        return pmap_map(mfn);
> -
> -    return map_domain_page(mfn);
> -}
> -
> -static void xen_unmap_table(const lpae_t *table)
> -{
> -    /*
> -     * During early boot, xen_map_table() will not use map_domain_page()
> -     * but the PMAP.
> -     */
> -    if ( system_state == SYS_STATE_early_boot )
> -        pmap_unmap(table);
> -    else
> -        unmap_domain_page(table);
> -}
> -
>  static int create_xen_table(lpae_t *entry)
>  {
>      mfn_t mfn;
> -- 
> 2.38.1
> 

