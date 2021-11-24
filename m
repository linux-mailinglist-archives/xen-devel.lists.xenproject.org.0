Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D345CBC9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230497.398452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwe8-0003dO-0o; Wed, 24 Nov 2021 18:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230497.398452; Wed, 24 Nov 2021 18:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwe7-0003af-TM; Wed, 24 Nov 2021 18:05:27 +0000
Received: by outflank-mailman (input) for mailman id 230497;
 Wed, 24 Nov 2021 18:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpwe6-0003aZ-32
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:05:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwe5-0004Ub-PX; Wed, 24 Nov 2021 18:05:25 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwe5-0006qu-Jm; Wed, 24 Nov 2021 18:05:25 +0000
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
	bh=KjfbGpMH6E9Y16w/GUQKjffVNbgT8z4N3SlIRGaXSLc=; b=27S8hLPKUMdz7VsyNzw+z/d1T0
	gC7eX4Jssgn6bardffU66TyRcbFtC+sIhLzvhG+/s5kTQbf/ogNrueSbwi2J2+VBlEfA8S3W1tZPb
	HDD9H+qJMb1kL0RsWdEKDahN2qyksVraSIon8ws/k9PZy375r+NRomuAO1Pq2OqiAjVY=;
Message-ID: <7b43ba9c-6741-c0de-a898-af3f7bc4a7ae@xen.org>
Date: Wed, 24 Nov 2021 18:05:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 06/10] xen/arm: if direct-map domain use native
 addresses for GICv2
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-7-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/11/2021 06:31, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv2 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domains that are direct-mapped.
> 
> NEW VGIC has different naming schemes, like referring distributor base
> address as vgic_dist_base, other than the dbase. So this patch also introduces
> vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
> address/cpu interface base address on varied scenarios,
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

I think it is more common to have the Signed-off-by of the Author first. 
Assuming the main author is Stefano, then this should be switched around.

> ---
> v2 changes
> - combine all changes in patch 4-6 here
> ---
> v3 changes
> - refine comment message
> - add a comment explaining how the 38 was found of "char buf[38]"
> - simply map the CPU interface at the GPA vgic_v2_hw.cbase
> - remove a spurious change
> ---
>   xen/arch/arm/domain_build.c    | 11 ++++++++---
>   xen/arch/arm/vgic-v2.c         | 31 ++++++++++++++++++++++---------
>   xen/arch/arm/vgic/vgic-v2.c    | 31 ++++++++++++++++++++++---------
>   xen/include/asm-arm/new_vgic.h | 10 ++++++++++
>   xen/include/asm-arm/vgic.h     | 11 +++++++++++
>   5 files changed, 73 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b6fde74d74..c419a4b2cc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2230,8 +2230,13 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    const struct domain *d = kinfo->d;
> +    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> +    char buf[38];
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -2253,9 +2258,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
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
> index 589c033eda..6f5492e30e 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -654,13 +654,10 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
>   static int vgic_v2_domain_init(struct domain *d)
>   {
>       int ret;
> -    paddr_t cbase, csize;
> +    paddr_t csize;
>       paddr_t vbase;
>   
> -    /*
> -     * The hardware domain gets the hardware address.
> -     * Guests get the virtual platform layout.
> -     */
> +    /* The hardware domain gets the hardware address. */

I would prefer if this comment is a summary of the if/else if/else. This 
would be easier to understand we need a different path for the hwdom
and direct-mapped domain.

"
The hardware domain and direct-mapped domains get the hardware address. 
We have to handle them separately because the hwdom is re-using the same 
Device-Tree as the host (see more details below).

Other domais get the virtual platform layout.
"

>       if ( is_hardware_domain(d) )
>       {
>           d->arch.vgic.dbase = vgic_v2_hw.dbase;
> @@ -671,10 +668,26 @@ static int vgic_v2_domain_init(struct domain *d)
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
> +         * For all the direct-mapped domain other than the hardware domain,
> +         * we only map a 8kB CPU interface but we make sure it is at a
> +         * location occupied by the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */
> +        d->arch.vgic.dbase = vgic_v2_hw.dbase;
> +        d->arch.vgic.cbase = vgic_v2_hw.cbase;
> +        csize = GUEST_GICC_SIZE;
> +        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.dbase = GUEST_GICD_BASE;
> @@ -685,7 +698,7 @@ static int vgic_v2_domain_init(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.cbase = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
>       }
> @@ -694,8 +707,8 @@ static int vgic_v2_domain_init(struct domain *d)
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
> index b5ba4ace87..63d0f03688 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -258,14 +258,11 @@ void vgic_v2_enable(struct vcpu *vcpu)
>   int vgic_v2_map_resources(struct domain *d)
>   {
>       struct vgic_dist *dist = &d->arch.vgic;
> -    paddr_t cbase, csize;
> +    paddr_t csize;
>       paddr_t vbase;
>       int ret;
>   
> -    /*
> -     * The hardware domain gets the hardware address.
> -     * Guests get the virtual platform layout.
> -     */
> +    /* The hardware domain gets the hardware address. */

Same as above. You could simply copy/paste the comment.

>       if ( is_hardware_domain(d) )
>       {
>           d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
> @@ -276,10 +273,26 @@ int vgic_v2_map_resources(struct domain *d)
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
> +         * For all the direct-mapped domain other than the hardware domain,
> +         * we only map a 8kB CPU interface but we make sure it is at a location
> +         * occupied by the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */
> +        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
> +        csize = GUEST_GICC_SIZE;
> +        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
> @@ -290,7 +303,7 @@ int vgic_v2_map_resources(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;
>           vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
>       }
> @@ -308,8 +321,8 @@ int vgic_v2_map_resources(struct domain *d)
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
> index 97d622bff6..ab57fcd91d 100644
> --- a/xen/include/asm-arm/new_vgic.h
> +++ b/xen/include/asm-arm/new_vgic.h
> @@ -186,6 +186,16 @@ struct vgic_cpu {
>       uint32_t num_id_bits;
>   };
>   
> +static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
> +{
> +    return vgic->vgic_cpu_base;
> +}
> +
> +static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
> +{
> +    return vgic->vgic_dist_base;
> +}
> +
>   #endif /* __ASM_ARM_NEW_VGIC_H */
>   
>   /*
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index e69a59063a..a81a06c711 100644
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
> @@ -271,6 +272,16 @@ static inline int REG_RANK_NR(int b, uint32_t n)
>   
>   enum gic_sgi_mode;
>   
> +static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
> +{
> +    return vgic->cbase;
> +}
> +
> +static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
> +{
> +    return vgic->dbase;
> +}
> +
>   /*
>    * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
>    * <b>-bits-per-interrupt.
> 

Cheers,

-- 
Julien Grall

