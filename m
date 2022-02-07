Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637234AC652
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267274.461003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH79L-0006gW-Br; Mon, 07 Feb 2022 16:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267274.461003; Mon, 07 Feb 2022 16:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH79L-0006eO-90; Mon, 07 Feb 2022 16:45:59 +0000
Received: by outflank-mailman (input) for mailman id 267274;
 Mon, 07 Feb 2022 16:45:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH79J-0006eG-Rb
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:45:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH79J-0007r7-JM; Mon, 07 Feb 2022 16:45:57 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH79J-0004Jf-Dh; Mon, 07 Feb 2022 16:45:57 +0000
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
	bh=fAkTXZjB6ApF7OPcL97clowM//E+N4IUnr9AhGn2Hp4=; b=cxfsI6c1qR4c6o7JvDhvNdFNgN
	RO85FbTL3QhZHjoplAzqighIZB4OjvTBmlQ4iLuuezY52uXMdDRIrsERhiNWMIAjdTz6t71kd9qGt
	8se+GUHpXex7D6tmoOVoo8BOYC/xsGVLkbiza0IX5kY9mcXu5t3SCc8YdZGE2zUC7DPw=;
Message-ID: <5da1b0da-0e9d-1f10-0667-39ce8dd04c39@xen.org>
Date: Mon, 7 Feb 2022 16:45:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v3] xen/arm: introduce dummy iommu node for dom0
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>
References: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220111112611.90508-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/01/2022 11:26, Sergiy Kibrik wrote:
> Currently no IOMMU properties are exposed to dom0, thus kernel by default
> assumes no protection and enables swiotlb-xen, which leads to costly and
> unnecessary buffers bouncing.
> 
> To let kernel know which device is behing IOMMU and hence needs no swiotlb
> services we introduce dummy xen-iommu node in FDT and link protected device
> nodes to it, using here device tree iommu bindings.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
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
>   xen/arch/arm/domain_build.c           | 42 +++++++++++++++++++++++++++
>   xen/include/public/device_tree_defs.h |  1 +
>   2 files changed, 43 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..b82ba72fac 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -845,6 +845,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>           }
>       }
>   
> +    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(node) )

I think it should be sufficient to check dt_device_is_protected() 
because it is set it means that device behind an IOMMU known by Xen. So 
iommu_node will always be valid.

Furthermore, you can't assign to dom0 a device that was protected with 
enabling the IOMMU for the domain.

> +    {
> +        res = fdt_property_cell(kinfo->fdt, "iommus", GUEST_PHANDLE_IOMMU);
> +        if ( res )
> +            return res;
> +    }
>       return 0;
>   }
>   
> @@ -1479,6 +1485,38 @@ static int __init make_cpus_node(const struct domain *d, void *fdt)
>       return res;
>   }
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

Please don't hardocode the phandle for the IOMMU. Instead we should use 
one for an IOMMU that is used by Xen.

This will reduce the risk to use a phandle that could be possibly used 
in the host Device-Tree.

Cheers,

-- 
Julien Grall

