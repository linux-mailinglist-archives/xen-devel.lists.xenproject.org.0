Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEEB45CC11
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230513.398484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwyj-00079J-6F; Wed, 24 Nov 2021 18:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230513.398484; Wed, 24 Nov 2021 18:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwyj-00076e-2z; Wed, 24 Nov 2021 18:26:45 +0000
Received: by outflank-mailman (input) for mailman id 230513;
 Wed, 24 Nov 2021 18:26:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpwyh-00076Y-Hi
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:26:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwyh-0004qJ-C9; Wed, 24 Nov 2021 18:26:43 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwyh-0000E8-6O; Wed, 24 Nov 2021 18:26:43 +0000
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
	bh=B9giwXTpsZpG+XAw5GreksZ8Hk5Jl9wvpMD9sgxnD5o=; b=pH8iD9N49Qy7sYCs1Z1PVNXN1l
	XX6fkSYECCg5+qSz5NgkLVaGi2DHfqYz+Xj8NmuQDXtDzwBYuR0GwW92cmO8OC0PuuBYA1GaX5Dlh
	WCZDkzJLi4Ecn95EeXG4aj+U8QUtNDLC2POfY+SfQ6EwQfHwFOMM6x1ExD9nVZJV3J58=;
Message-ID: <4ba84598-0c67-9b73-ba15-a93ee1dafa5d@xen.org>
Date: Wed, 24 Nov 2021 18:26:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 08/10] xen/arm: if direct-map domain use native
 addresses for GICv3
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-9-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv3 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domain which is using the host memory layout
> 
> Considering that DOM0 may not always be directly mapped in the future,
> this patch introduces a new helper "domain_use_host_layout()" that
> wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
> for more flexible usage.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Same remark as another patch about the order of the signed-off-by.

> ---
> v2 changes:
> - remove redistributor accessor
> - introduce new helper "is_domain_use_host_layout()"
> - comment fix
> ---
> v3 changes:
> - the comment on top of 'buf' to explain how 38 was found
> - fix res getting overwritten
> - drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
> - free 'reg' right way
> - fix comment
> - rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
> ---
>   xen/arch/arm/domain_build.c  | 37 +++++++++++++++++++++++++++---------
>   xen/arch/arm/vgic-v3.c       | 29 ++++++++++++++++------------
>   xen/include/asm-arm/domain.h |  7 +++++++
>   3 files changed, 52 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 24f3edf069..61fd374c5d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2284,10 +2284,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   {
>       void *fdt = kinfo->fdt;
>       int res = 0;
> -    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
> -    __be32 *cells;
> +    __be32 *reg;
> +    const struct domain *d = kinfo->d;
> +    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> +    char buf[38];
> +    unsigned int i, len = 0;
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -2307,13 +2313,26 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       if ( res )
>           return res;
>   
> -    cells = &reg[0];
> -    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
> -    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
> +    /* reg specifies all re-distributors and Distributor. */
> +    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
> +    reg = xmalloc_bytes(len);
> +    if ( reg == NULL )
> +        return -ENOMEM;
>   
> -    res = fdt_property(fdt, "reg", reg, sizeof(reg));
> +    dt_child_set_range(&reg, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
> +
> +    for ( i = 0; i < d->arch.vgic.nr_regions; i++)
> +    {
> +        dt_child_set_range(&reg,
> +                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                           d->arch.vgic.rdist_regions[i].base,
> +                           d->arch.vgic.rdist_regions[i].size);
> +    }
> +
> +    res = fdt_property(fdt, "reg", reg, len);
> +    xfree(reg);
>       if (res)
>           return res;
>   
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 65bb7991a6..181b66513d 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
>        * Normally there is only one GICv3 redistributor region.
>        * The GICv3 DT binding provisions for multiple regions, since there are
>        * platforms out there which need those (multi-socket systems).
> -     * For Dom0 we have to live with the MMIO layout the hardware provides,
> -     * so we have to copy the multiple regions - as the first region may not
> -     * provide enough space to hold all redistributors we need.
> +     * For domain using the host memory layout, we have to live with the MMIO
> +     * layout the hardware provides, so we have to copy the multiple regions
> +     * - as the first region may not provide enough space to hold all
> +     * redistributors we need.
>        * However DomU get a constructed memory map, so we can go with
>        * the architected single redistributor region.
>        */
> -    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
> -               GUEST_GICV3_RDIST_REGIONS;
> +    return domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
> +                                       GUEST_GICV3_RDIST_REGIONS;
>   }
>   
>   static int vgic_v3_domain_init(struct domain *d)
> @@ -1669,10 +1670,14 @@ static int vgic_v3_domain_init(struct domain *d)
>       radix_tree_init(&d->arch.vgic.pend_lpi_tree);
>   
>       /*
> -     * Domain 0 gets the hardware address.
> -     * Guests get the virtual platform layout.
> +     * Since we map the whole GICv3 register memory map(64KB) for
> +     * all domain, DOM0 and direct-map domain could be treated the
> +     * same way here.

I find this confusing because it is not clear what you refer to with the 
"register memory map" here (I think you mean the Distributor). That 
said, I would drop this paragraph as what matters is we are using the 
same layout as the host.

> +     * For domain using the host memory layout, it gets the hardware
> +     * address.
> +     * Other domains get the virtual platform layout.
>        */
> -    if ( is_hardware_domain(d) )
> +    if ( domain_use_host_layout(d) )
>       {
>           unsigned int first_cpu = 0;
>   
> @@ -1695,10 +1700,10 @@ static int vgic_v3_domain_init(struct domain *d)
>           }
>   
>           /*
> -         * The hardware domain may not use all the re-distributors
> -         * regions (e.g when the number of vCPUs does not match the
> -         * number of pCPUs). Update the number of regions to avoid
> -         * exposing unused region as they will not get emulated.
> +         * For domain using the host memory layout, it may not use all
> +         * the re-distributors regions (e.g when the number of vCPUs does
> +         * not match the number of pCPUs). Update the number of regions to
> +         * avoid exposing unused region as they will not get emulated.
>            */
>           d->arch.vgic.nr_regions = i + 1;
>   
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 4f2c3f09d4..0eff93197e 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -32,6 +32,13 @@ enum domain_type {
>   #define is_domain_direct_mapped(d) \
>           (d->options & XEN_DOMCTL_CDF_INTERNAL_directmap)
>   
> +/*
> + * For domain using the host memory layout, we have to live with the MMIO
> + * layout the hardware provides.
> + */

How about:

/*
  * Is the domain using the host memory layout?
  *
  * Direct-mapped domain will always have the RAM mapped with GFN == 
MFN.
  * To avoid any trouble finding space, it is easier to force using the
  * host memory layout.
  *
  * The hardware domain will use the host layout regardless of
  * direct-mapped because some OS may rely on a specific address ranges
  * for the devices.
  */

> +#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> +                                   is_hardware_domain(d))
> +
>   struct vtimer {
>       struct vcpu *v;
>       int irq;
> 

Cheers,

-- 
Julien Grall

