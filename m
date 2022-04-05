Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DE4F41D1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299312.509942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqqQ-0001VW-3p; Tue, 05 Apr 2022 21:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299312.509942; Tue, 05 Apr 2022 21:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqqP-0001TF-VV; Tue, 05 Apr 2022 21:36:09 +0000
Received: by outflank-mailman (input) for mailman id 299312;
 Tue, 05 Apr 2022 21:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbqqO-0001T9-9x
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:36:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6659cb40-b528-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 23:36:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF579615E4;
 Tue,  5 Apr 2022 21:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03B0C385A0;
 Tue,  5 Apr 2022 21:36:04 +0000 (UTC)
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
X-Inumbo-ID: 6659cb40-b528-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649194565;
	bh=A1Svenx4PsK0pc30u81MC9+wbZyh2+W/pfbmLBwA5T8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C1YnO4Nbztc7CakuTaTEBcF0qQy9cWpy7mptOPOyoA6NtzXph0pBhLmNtMGEjEdL0
	 +d+80GBqegFJ5FonDJ+75wEo5jw2UJtAw7S0aN7j5OlfFSyQpD984/gp0utVgkY4oR
	 8oc493te3piGcHq6MoZ4WHe1RLiYlBqLyE3zt7/NzR2sQh/wZSP51CF17daO98XhE3
	 5O1Fg/6n3avGSHUHDOmmrqBYUkB8phwj+LOALH9xeJ188B7RjFBbqAd/3Jy/TzZqFP
	 f6EBtrvw9h/YftcDa44fZYkLsIHXNtySCh19dgQMEuIePbx6stMPIzGc5RwwEJUkOS
	 5SI4m3mJlOpoA==
Date: Tue, 5 Apr 2022 14:36:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 16/19] xen/arm: mm: Use the PMAP helpers in
 xen_{,un}map_table()
In-Reply-To: <20220221102218.33785-17-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051435370.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-17-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> During early boot, it is not possible to use xen_{,un}map_table()
> if the page tables are not residing the Xen binary.
> 
> This is a blocker to switch some of the helpers to use xen_pt_update()
> as we may need to allocate extra page tables and access them before
> the domheap has been initialized (see setup_xenheap_mappings()).
> 
> xen_{,un}map_table() are now updated to use the PMAP helpers for early
> boot map/unmap. Note that the special case for page-tables residing
> in Xen binary has been dropped because it is "complex" and was
> only added as a workaround in 8d4f1b8878e0 ("xen/arm: mm: Allow
> generic xen page-tables helpers to be called early").
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 33 +++++++++------------------------
>  1 file changed, 9 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 659bdf25e0ff..11b6b60a2bc1 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -25,6 +25,7 @@
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/mm.h>
>  #include <xen/pfn.h>
> +#include <xen/pmap.h>
>  #include <xen/sched.h>
>  #include <xen/sizes.h>
>  #include <xen/types.h>
> @@ -964,27 +965,11 @@ void *ioremap(paddr_t pa, size_t len)
>  static lpae_t *xen_map_table(mfn_t mfn)
>  {
>      /*
> -     * We may require to map the page table before map_domain_page() is
> -     * useable. The requirements here is it must be useable as soon as
> -     * page-tables are allocated dynamically via alloc_boot_pages().
> -     *
> -     * We need to do the check on physical address rather than virtual
> -     * address to avoid truncation on Arm32. Therefore is_kernel() cannot
> -     * be used.
> +     * During early boot, map_domain_page() may be unusable. Use the
> +     * PMAP to map temporarily a page-table.
>       */
>      if ( system_state == SYS_STATE_early_boot )
> -    {
> -        if ( is_xen_fixed_mfn(mfn) )
> -        {
> -            /*
> -             * It is fine to demote the type because the size of Xen
> -             * will always fit in vaddr_t.
> -             */
> -            vaddr_t offset = mfn_to_maddr(mfn) - virt_to_maddr(&_start);
> -
> -            return (lpae_t *)(XEN_VIRT_START + offset);
> -        }
> -    }
> +        return pmap_map(mfn);
>  
>      return map_domain_page(mfn);
>  }
> @@ -993,12 +978,12 @@ static void xen_unmap_table(const lpae_t *table)
>  {
>      /*
>       * During early boot, xen_map_table() will not use map_domain_page()
> -     * for page-tables residing in Xen binary. So skip the unmap part.
> +     * but the PMAP.
>       */
> -    if ( system_state == SYS_STATE_early_boot && is_kernel(table) )
> -        return;
> -
> -    unmap_domain_page(table);
> +    if ( system_state == SYS_STATE_early_boot )
> +        pmap_unmap(table);
> +    else
> +        unmap_domain_page(table);
>  }
>  
>  static int create_xen_table(lpae_t *entry)
> -- 
> 2.32.0
> 

