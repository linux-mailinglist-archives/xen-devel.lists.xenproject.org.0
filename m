Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4948E132
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 00:52:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257447.442322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n89sW-00047H-4y; Thu, 13 Jan 2022 23:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257447.442322; Thu, 13 Jan 2022 23:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n89sW-00044m-1v; Thu, 13 Jan 2022 23:51:36 +0000
Received: by outflank-mailman (input) for mailman id 257447;
 Thu, 13 Jan 2022 23:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n89sU-00044g-Sg
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 23:51:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8af248-74cb-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 00:51:32 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0411961CF3;
 Thu, 13 Jan 2022 23:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201C3C36AE3;
 Thu, 13 Jan 2022 23:51:30 +0000 (UTC)
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
X-Inumbo-ID: bb8af248-74cb-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642117890;
	bh=03nCUZi6almZvKdr9eLJQvsbfPMXcdo62pwwI2IBR84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ERWAIAwFcOcekM1hJEG/bcF5T6udvGbQaHCcIIQmJM6deNj8KqAD4yqunvYQIIbt9
	 mJMM8YqlWHEaeEVUOPI7eJouonGUK7pf04kJfQYgT/SnwhUM27v2cYwPrMJgxk85dT
	 OSKK3QPt4S6RYXrq163Ci1WQ3qqfIeCwBsbUUFCeRdBxSSpakmyZW4/V6ECYEwVo9V
	 PQOYZYFd4duxC2gDZArlSufbALRLkjVpWR2Xk6ilEtbTNhea5XGUkhwLfBWkW+wGi/
	 EF0qA9P+6ZV3Nqwh+UaSe7oIvA+2mSs5hhttYojR21hDgvnrkWbyg+x3A7Z7r/UT/m
	 7IBfS/NGn16Rg==
Date: Thu, 13 Jan 2022 15:51:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, 
    Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
In-Reply-To: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2201131544020.19362@ubuntu-linux-20-04-desktop>
References: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Jan 2022, Sergiy Kibrik wrote:
> Currently no IOMMU properties are exposed to dom0, thus kernel by default
> assumes no protection and enables swiotlb-xen, which leads to costly and
> unnecessary buffers bouncing.
> 
> To let kernel know which device is behing IOMMU and hence needs no swiotlb
> services we introduce dummy xen-iommu node in FDT and link protected device
> nodes to it, using here device tree iommu bindings.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

I think the patch looks good. I have no further comments on the code:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Before committing it to the Xen tree, I'd like to wait that the Linux
side, especially the change to
Documentation/devicetree/bindings/arm/xen.txt, is acked.


> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Julien Grall <julien@xen.org>
> Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
> Cc: Andrii Anisov <Andrii_Anisov@epam.com>
> 
> 
> Changelog:
> 
> v3: rebased over staging & remove redundand phandle_iommu attribute, discussion:
> 	https://lists.xenproject.org/archives/html/xen-devel/2021-12/msg01753.html
> 
> v2: re-use common iommu dt bindings to let guests know which devices are protected:
> 	https://lists.xenproject.org/archives/html/xen-devel/2021-10/msg00073.html
> 
>  xen/arch/arm/domain_build.c           | 42 +++++++++++++++++++++++++++
>  xen/include/public/device_tree_defs.h |  1 +
>  2 files changed, 43 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..b82ba72fac 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -845,6 +845,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>          }
>      }
>  
> +    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(node) )
> +    {
> +        res = fdt_property_cell(kinfo->fdt, "iommus", GUEST_PHANDLE_IOMMU);
> +        if ( res )
> +            return res;
> +    }
>      return 0;
>  }
>  
> @@ -1479,6 +1485,38 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>      return res;
>  }
>  
> +static int __init make_iommu_node(const struct domain *d,
> +                                  const struct kernel_info *kinfo)
> +{
> +    const char compat[] = "xen,iommu-el2-v1";
> +    int res;
> +
> +    if ( !is_iommu_enabled(d) )
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
> +    res = fdt_property_cell(kinfo->fdt, "phandle", GUEST_PHANDLE_IOMMU);
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
> @@ -2127,6 +2165,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
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

