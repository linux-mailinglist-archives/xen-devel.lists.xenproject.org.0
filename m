Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F388A47EA57
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 02:32:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251201.432502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ZRS-0003wl-UX; Fri, 24 Dec 2021 01:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251201.432502; Fri, 24 Dec 2021 01:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ZRS-0003um-QK; Fri, 24 Dec 2021 01:32:18 +0000
Received: by outflank-mailman (input) for mailman id 251201;
 Fri, 24 Dec 2021 01:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0ZRQ-0003ug-V4
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 01:32:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51fad479-6459-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 02:32:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A254C61F9F;
 Fri, 24 Dec 2021 01:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5DCC36AE5;
 Fri, 24 Dec 2021 01:32:11 +0000 (UTC)
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
X-Inumbo-ID: 51fad479-6459-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640309531;
	bh=LPshgZ3zjboQ5EJzVyDW/BQmBB7iaDhLVaPrAzACgww=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IAtDxYENSt4l+ipbneOt0QkAmsfwUzjATkYZIMHH8+AOWRGV/C7hQwpwMpCOWdcYg
	 I0IGDUYD53oA+K4XIDF//h0n7jCMKXDf4Ys4GEPxE3okm5r+lsz3e/yWrSODqtZ8Vo
	 VBQn/750qduQdTbVXZQKkapcN7dNOJhaHjFeKUn6p1hnfHehlMvcYKyeuUq2bQgzWH
	 yHZkFAj10N2rLD9cEmje9svEQ780rJxIkAXo19MMXcpaZKH2tcxFzmr5ODf3u7cVfi
	 svGOKrc3ikWodtfqpOFqUeY+CoUKgxRMKOlSlots9jHAEAiu/r+GGaEpkghE3W+jUD
	 KUSgBID2WPkfA==
Date: Thu, 23 Dec 2021 17:32:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Subject: Re: [XEN PATCH 1/1] xen/arm: introduce dummy iommu node for dom0
In-Reply-To: <20211222131847.2476835-2-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2112231724570.2060010@ubuntu-linux-20-04-desktop>
References: <20211222131847.2476835-1-Sergiy_Kibrik@epam.com> <20211222131847.2476835-2-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Sergiy Kibrik wrote:
> Currently no IOMMU properties are exposed to dom0, thus kernel by default
> assumes no protection and enables swiotlb-xen, which leads to costly and
> unnecessary buffers bouncing.
> 
> To let kernel know which device is behing IOMMU and hence needs no swiotlb
> services we introduce dummy xen-iommu node in FDT and link protected device
> nodes to it, using here device tree iommu bindings.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Hi Sergiy,

Thanks for the patch, I like how simple it is. FYI the patch doesn't
apply cleanly to staging any longer, you might need to rebase it.


> ---
>  xen/arch/arm/domain_build.c           | 44 +++++++++++++++++++++++++++
>  xen/include/asm-arm/kernel.h          |  3 ++
>  xen/include/public/device_tree_defs.h |  1 +
>  3 files changed, 48 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6cfc772e66..951ca0a0cb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -623,6 +623,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>          }
>      }
>  
> +    if ( iommu_node && kinfo->phandle_iommu && dt_device_is_protected(node) )
> +    {
> +        res = fdt_property_cell(kinfo->fdt, "iommus", kinfo->phandle_iommu);
> +        if ( res )
> +            return res;
> +    }
>      return 0;
>  }
>  
> @@ -948,6 +954,38 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>      return res;
>  }
>  
> +static int __init make_iommu_node(const struct domain *d,
> +                                  const struct kernel_info *kinfo)
> +{
> +    const char compat[] = "xen,iommu-el2-v1";
> +    int res;
> +
> +    if ( !kinfo->phandle_iommu )
> +        return 0;
> +
> +    dt_dprintk("Create iommu node\n");
> +
> +    res = fdt_begin_node(kinfo->fdt, "xen-iommu");
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(kinfo->fdt, "compatible", compat, sizeof(compat));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(kinfo->fdt, "#iommu-cells", 0);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(kinfo->fdt, "phandle", kinfo->phandle_iommu);
> +
> +    res = fdt_end_node(kinfo->fdt);
> +    if ( res )
> +        return res;
> +
> +    return res;
> +}
> +
>  static int __init make_gic_node(const struct domain *d, void *fdt,
>                                  const struct dt_device_node *node)
>  {
> @@ -1584,6 +1622,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          if ( res )
>              return res;
>  
> +        res = make_iommu_node(d, kinfo);
> +        if ( res )
> +            return res;
> +
>          res = make_memory_node(d, kinfo->fdt, addrcells, sizecells, &kinfo->mem);
>          if ( res )
>              return res;
> @@ -2177,6 +2219,8 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
>      ASSERT(dt_host && (dt_host->sibling == NULL));
>  
>      kinfo->phandle_gic = dt_interrupt_controller->phandle;
> +    if ( is_iommu_enabled(d) )
> +        kinfo->phandle_iommu = GUEST_PHANDLE_IOMMU;

It doesn't look like we need to save GUEST_PHANDLE_IOMMU under kinfo.
GUEST_PHANDLE_IOMMU is static. Instead we can just:

if ( !is_iommu_enabled(d) )
    return 0;

at the beginning of make_iommu_node. Same for write_properties, we can
just skip the kinfo->phandle_iommu check and use GUEST_PHANDLE_IOMMU in
fdt_property_cell.





>      fdt = device_tree_flattened;
>  
>      new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
> diff --git a/xen/include/asm-arm/kernel.h b/xen/include/asm-arm/kernel.h
> index 874aa108a7..efe09cd1e0 100644
> --- a/xen/include/asm-arm/kernel.h
> +++ b/xen/include/asm-arm/kernel.h
> @@ -39,6 +39,9 @@ struct kernel_info {
>      /* GIC phandle */
>      uint32_t phandle_gic;
>  
> +    /* dummy iommu phandle */
> +    uint32_t phandle_iommu;
> +
>      /* loader to use for this kernel */
>      void (*load)(struct kernel_info *info);
>      /* loader specific state */
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
> index 209d43de3f..df58944bd0 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -7,6 +7,7 @@
>   * onwards. Reserve a high value for the GIC phandle.
>   */
>  #define GUEST_PHANDLE_GIC (65000)
> +#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
>  
>  #define GUEST_ROOT_ADDRESS_CELLS 2
>  #define GUEST_ROOT_SIZE_CELLS 2
> -- 
> 2.25.1
> 
> 

