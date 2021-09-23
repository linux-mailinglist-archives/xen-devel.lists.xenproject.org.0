Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF19415C62
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193692.345029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMS6-0001qt-V8; Thu, 23 Sep 2021 10:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193692.345029; Thu, 23 Sep 2021 10:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMS6-0001nh-S6; Thu, 23 Sep 2021 10:59:42 +0000
Received: by outflank-mailman (input) for mailman id 193692;
 Thu, 23 Sep 2021 10:59:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMS4-0001nb-W1
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:59:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMS4-0005wS-Pn; Thu, 23 Sep 2021 10:59:40 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMS4-0002Vj-Fo; Thu, 23 Sep 2021 10:59:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xQRgn9oeecq7YDlbjVCHlp9AqlPzYJ0NNSTWpfkmSHs=; b=CLKQ74khakJNGPdHnh/h7kxl0g
	/QRxGXgxDZcrIL7VyOLTKMwWZC7n8hvf+tG6Zg3g8ws+LYkSmEwhMm0rMaq6Gz84NU967ThonKbdx
	BmtXleJ6Rj6cCPHgcm7jETNlJnTspH6fPc+JZiAw9lgTO4Jc0JlmTqbtSkX7Yfo/ZQuI=;
Subject: Re: [PATCH 08/11] xen/arm: if 1:1 direct-map domain use native
 addresses for GICv3
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-9-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3efa0620-0a55-bce7-1e2c-66f3449af7cc@xen.org>
Date: Thu, 23 Sep 2021 15:59:35 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv3 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domains that are 1:1 direct-map(including Dom0).
> 
> Update the rdist accessor to use the struct vgic variables to provide
> the updated addresses.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 32 ++++++++++++++++++++++++--------
>   xen/arch/arm/vgic-v3.c      | 10 +++++-----
>   xen/include/asm-arm/vgic.h  |  6 +++---
>   3 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d5f201f73e..120f1ae575 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1854,10 +1854,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   {
>       void *fdt = kinfo->fdt;
>       int res = 0;
> -    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
> +    __be32 *reg;
>       __be32 *cells;
>       struct domain *d = kinfo->d;
>       char buf[38];
> +    unsigned int i, len = 0;
>   
>       snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
>                vgic_dist_base(&d->arch.vgic));
> @@ -1881,27 +1882,42 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       if ( res )
>           return res;
>   
> +    /* reg specifies all re-distributors and Distributor. */
> +    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +          (vgic_rdist_nr(&d->arch.vgic) + 1) * sizeof(__be32);
> +    reg = xmalloc_bytes(len);
> +    if ( reg == NULL )
> +        return -ENOMEM;
> +
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>                          vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
> -    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       vgic_rdist_base(&d->arch.vgic, 0),
> -                       vgic_rdist_size(&d->arch.vgic, 0));
> +    for ( i = 0;
> +          i < vgic_rdist_nr(&d->arch.vgic);
> +          i++, cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) )
> +    {
> +        dt_child_set_range(&cells,
> +                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                           vgic_rdist_base(&d->arch.vgic, i),
> +                           vgic_rdist_size(&d->arch.vgic, i));
> +    }
>   
> -    res = fdt_property(fdt, "reg", reg, sizeof(reg));
> +    res = fdt_property(fdt, "reg", reg, len);
>       if (res)
> -        return res;
> +        goto out;
>   
>       res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
>       if (res)
> -        return res;
> +        goto out;
>   
>       res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
>       if (res)
> -        return res;
> +        goto out;
>   
>       res = fdt_end_node(fdt);
>   
> + out:
> +    xfree(reg);
>       return res;
>   }
>   
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..83f996b46c 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1647,8 +1647,8 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
>        * However DomU get a constructed memory map, so we can go with
>        * the architected single redistributor region.
>        */

The comment needs to be updated.

> -    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
> -               GUEST_GICV3_RDIST_REGIONS;
> +    return is_domain_direct_mapped(d) ? vgic_v3_hw.nr_rdist_regions :
> +                                        GUEST_GICV3_RDIST_REGIONS;

Let's avoid to make the assumption that dom0 is always direct mapped. So 
this should be "is_domain_direct_mapped(d) || is_hardware_domain(d)".

I would actually suggest to introduce a new helper 
"is_domain_use_host_layout()" (or similar) that wraps the two check. 
This would make the code a bit more flexible.

>   }
>   
>   static int vgic_v3_domain_init(struct domain *d)
> @@ -1670,10 +1670,10 @@ static int vgic_v3_domain_init(struct domain *d)
>       radix_tree_init(&d->arch.vgic.pend_lpi_tree);
>   
>       /*
> -     * Domain 0 gets the hardware address.
> -     * Guests get the virtual platform layout.
> +     * 1:1 direct-map domain (including Dom0) gets the hardware address.
> +     * Other guests get the virtual platform layout.
>        */
> -    if ( is_hardware_domain(d) )
> +    if ( is_domain_direct_mapped(d) )

Same here.

>       {
>           unsigned int first_cpu = 0;
>   
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index 92f6a2d15d..0f7cb32c58 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -291,17 +291,17 @@ static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
>   #ifdef CONFIG_GICV3
>   static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
>   {
> -    return GUEST_GICV3_RDIST_REGIONS;
> +    return vgic->nr_regions;
>   }
>   
>   static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
>   {
> -    return GUEST_GICV3_GICR0_BASE;
> +    return vgic->rdist_regions[i].base;
>   }
>   
>   static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
>   {
> -    return GUEST_GICV3_GICR0_SIZE;
> +    return vgic->rdist_regions[i].size;
>   }

I think this change in vgic.h should have belong to the patch 
introducing the helpers (if we still plan to use them).

>   #else
>   static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
> 

Cheers,

-- 
Julien Grall

