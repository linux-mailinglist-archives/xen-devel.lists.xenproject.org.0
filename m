Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC8433DA8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 19:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213421.371621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mct59-0001Zo-4K; Tue, 19 Oct 2021 17:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213421.371621; Tue, 19 Oct 2021 17:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mct59-0001X6-18; Tue, 19 Oct 2021 17:39:23 +0000
Received: by outflank-mailman (input) for mailman id 213421;
 Tue, 19 Oct 2021 17:39:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mct57-0001X0-13
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 17:39:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mct56-00075P-St; Tue, 19 Oct 2021 17:39:20 +0000
Received: from [54.239.6.189] (helo=[192.168.0.120])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mct56-0001g7-Ms; Tue, 19 Oct 2021 17:39:20 +0000
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
	bh=KBRlEoBodyxAPc8kv1KGXcMMFIB/yfe3/zgqF6WWHRE=; b=MIQnmD0zejofTKcI7AwbulWuem
	eLTa3oACQQ906ZjBPjgfw98D7Tsm6c5o0wTyD+yaDsHsgm2JwMSOMkRgkax/W88M4PCAeAOZfZqyR
	WI9qNy6CRfWo0JYNqh+6qZ/q7XG79z4R+EyUmplMlgzQn3M3ZR17Yx25TSbYJUS+EOqg=;
Message-ID: <1ec81b01-a843-9735-be4e-4a6f0af1b670@xen.org>
Date: Tue, 19 Oct 2021 18:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/6] xen/arm: if direct-map domain use native addresses
 for GICv2
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Wei.Chen@arm.com, Bertrand.Marquis@arm.com
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211015030945.2082898-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/10/2021 04:09, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv2 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domains that are direct-map memory map.

I would simply say: "all domains that are direct-mapped" or "all domains 
that have the memory direct-mapped".

> 
> NEW VGIC has different naming schemes, like referring distributor base
> address as vgic_dist_base, other than the dbase. So this patch also introduces
> vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
> address/cpu interface base address on varied scenarios,
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c    | 10 +++++++---
>   xen/arch/arm/vgic-v2.c         | 26 +++++++++++++++++++++-----
>   xen/arch/arm/vgic/vgic-v2.c    | 27 ++++++++++++++++++++++-----
>   xen/include/asm-arm/new_vgic.h | 10 ++++++++++
>   xen/include/asm-arm/vgic.h     | 12 +++++++++++-
>   5 files changed, 71 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d9118e5bc1..6cd03e4d0f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2207,8 +2207,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[38];

Please add a comment explaining how the 38 was found. For an example, 
please look at the comment on top of buf in make_memory_node().

>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -2230,9 +2234,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>   
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
> +                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
> +                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
>   
>       res = fdt_property(fdt, "reg", reg, sizeof(reg));
>       if (res)
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..a8cf8173d0 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -652,7 +652,7 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
>   static int vgic_v2_domain_init(struct domain *d)
>   {
>       int ret;
> -    paddr_t cbase, csize;
> +    paddr_t csize;
>       paddr_t vbase;
>   
>       /*
> @@ -669,10 +669,26 @@ static int vgic_v2_domain_init(struct domain *d)

The comment on top of the "if ( is_hardware_domain(d) )" needs to be 
updated because, after this patch, guests will not always use the 
virtual platform layout.

>            * Note that we assume the size of the CPU interface is always
>            * aligned to PAGE_SIZE.
>            */
> -        cbase = vgic_v2_hw.cbase;
> +        d->arch.vgic.cbase = vgic_v2_hw.cbase;
>           csize = vgic_v2_hw.csize;
>           vbase = vgic_v2_hw.vbase;
>       }
> +    else if ( is_domain_direct_mapped(d) )
> +    {
> +        /*
> +         * For non-dom0 direct_mapped guests we only map a 8kB CPU
Technically, is_hardware_domain() is not equivalent to dom0 (although, 
it is so far the case on Arm). So please avoid using "dom0" and instead 
use "hardware domain".

Also, the wording used is confusing because, from my understanding, dom0 
is not a guest (although it is a domain).

So how about:

"For all the direct-mapped domain other than the hardware domain, ...".

> +         * interface but we make sure it is at a location occupied by
> +         * the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */
> +        d->arch.vgic.dbase = vgic_v2_hw.dbase;
> +        d->arch.vgic.cbase = vgic_v2_hw.cbase + vgic_v2_hw.aliased_offset;
Couldn't we simply map the CPU interface at the GPA vgic_v2_hw.cbase?

> +        csize = GUEST_GICC_SIZE;
> +        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.dbase = GUEST_GICD_BASE;
> @@ -683,7 +699,7 @@ static int vgic_v2_domain_init(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.cbase = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
>       }
> @@ -692,8 +708,8 @@ static int vgic_v2_domain_init(struct domain *d)
>        * Map the gic virtual cpu interface in the gic cpu interface
>        * region of the guest.
>        */
> -    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
> -                           maddr_to_mfn(vbase));
> +    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
> +                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
>       if ( ret )
>           return ret;
>   
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index b5ba4ace87..ce1f6e4373 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -258,7 +258,7 @@ void vgic_v2_enable(struct vcpu *vcpu)
>   int vgic_v2_map_resources(struct domain *d)
>   {
>       struct vgic_dist *dist = &d->arch.vgic;
> -    paddr_t cbase, csize;
> +    paddr_t csize;
>       paddr_t vbase;
>       int ret;
>   
> @@ -276,10 +276,27 @@ int vgic_v2_map_resources(struct domain *d)

Same remark about the comment on top of the 'if ( is_hardware_domain(d) )'.

>            * Note that we assume the size of the CPU interface is always
>            * aligned to PAGE_SIZE.
>            */
> -        cbase = gic_v2_hw_data.cbase;
> +        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
>           csize = gic_v2_hw_data.csize;
>           vbase = gic_v2_hw_data.vbase;
>       }
> +    else if ( is_domain_direct_mapped(d) )
> +    {
> +        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
> +        /*
> +         * For non-dom0 direct_mapped guests we only map a 8kB CPU

Same remark here for the non-dom0 part.

> +         * interface but we make sure it is at a location occupied by
> +         * the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */
> +        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase +
> +                                     gic_v2_hw_data.aliased_offset;

Same question here.

> +        csize = GUEST_GICC_SIZE;
> +        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
> @@ -290,7 +307,7 @@ int vgic_v2_map_resources(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
>       }
> @@ -308,8 +325,8 @@ int vgic_v2_map_resources(struct domain *d)
>        * Map the gic virtual cpu interface in the gic cpu interface
>        * region of the guest.
>        */
> -    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
> -                           maddr_to_mfn(vbase));
> +    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
> +                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
>       if ( ret )
>       {
>           gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
> diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
> index 97d622bff6..28b0882798 100644
> --- a/xen/include/asm-arm/new_vgic.h
> +++ b/xen/include/asm-arm/new_vgic.h
> @@ -186,6 +186,16 @@ struct vgic_cpu {
>       uint32_t num_id_bits;
>   };
>   
> +static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
> +{
> +    return vgic->vgic_cpu_base;
> +}
> +
> +static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
> +{
> +    return vgic->vgic_dist_base;
> +}
> +
>   #endif /* __ASM_ARM_NEW_VGIC_H */
>   
>   /*
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index 62c2ae538d..3167bbb68b 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -152,6 +152,7 @@ struct vgic_dist {
>       struct pending_irq *pending_irqs;
>       /* Base address for guest GIC */
>       paddr_t dbase; /* Distributor base address */
> +    paddr_t cbase; /* CPU interface base address */
>   #ifdef CONFIG_GICV3
>       /* GIC V3 addressing */
>       /* List of contiguous occupied by the redistributors */
> @@ -271,13 +272,22 @@ static inline int REG_RANK_NR(int b, uint32_t n)
>   
>   enum gic_sgi_mode;
>   
> +static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
> +{
> +    return vgic->cbase;
> +}
> +
> +static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
> +{
> +    return vgic->dbase;
> +}
> +
>   /*
>    * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
>    * <b>-bits-per-interrupt.
>    */
>   #define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
>   
> -

This looks like a spurious change.

>   extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq);
>   extern void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq *p);
>   extern void gic_remove_from_lr_pending(struct vcpu *v, struct pending_irq *p);
> 

Cheers,

-- 
Julien Grall

