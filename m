Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C094349DC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 13:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213847.372200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9V4-00031a-98; Wed, 20 Oct 2021 11:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213847.372200; Wed, 20 Oct 2021 11:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9V4-0002zg-3t; Wed, 20 Oct 2021 11:11:14 +0000
Received: by outflank-mailman (input) for mailman id 213847;
 Wed, 20 Oct 2021 11:11:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1md9V2-0002za-MS
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 11:11:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1md9V2-0003Vv-9b; Wed, 20 Oct 2021 11:11:12 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1md9V2-0005uP-3I; Wed, 20 Oct 2021 11:11:12 +0000
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
	bh=4ygHepWUQ/jRTw7dl3mvhqvxKxefrRVShyiE9aHH9mw=; b=kt+39eFNQjuTwUczXr+VQKKb+n
	2Wlt1sVqymf3H6VdKJ+FIHCb4Qs5d5groXnBhr2scMAOrRu3GjTsc7vFmWpmYGA5eJchNWS1ovt/X
	yK9QGVh4N20v+Ir9dWozZ/vPDHpd12X6FvIv6t4Z5ilaChepktvO04+oJO8Fd5r3KdoA=;
Message-ID: <5319596d-c2e4-de6c-237e-62f14a7695ec@xen.org>
Date: Wed, 20 Oct 2021 12:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/6] xen/arm: if direct-map domain use native addresses
 for GICv3
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Wei.Chen@arm.com, Bertrand.Marquis@arm.com
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-5-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211015030945.2082898-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/10/2021 04:09, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv3 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all direct-map domains(including Dom0).
> 
> Considering that dom0 may not always be directly mapped in the future,
> this patch introduces a new helper "is_domain_use_host_layout()" that
> wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
> for more flexible useage.

Typo: s/useage/usage/

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c  | 46 +++++++++++++++++++++++++++---------
>   xen/arch/arm/vgic-v3.c       | 20 +++++++++-------
>   xen/include/asm-arm/domain.h |  3 +++
>   3 files changed, 50 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6cd03e4d0f..7e0ee07e06 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2255,16 +2255,20 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       return res;
>   }
>   
> +#ifdef CONFIG_ARM_64

The code below is specific to the GICv3 (and not 64-bit). So this should 
be gated with CONFIG_GICV3.

Personally, I would have gated the code in a separate patch. But I am 
fine if this is added in this patch so long this is mentionned in the 
commit message.

>   static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   {
>       void *fdt = kinfo->fdt;
>       int res = 0;
> -    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
> +    __be32 *reg;
>       __be32 *cells;
> +    struct domain *d = kinfo->d;

AFAICT, 'd' is not going to be modified. So please add const.

> +    char buf[38];

Please explain how 38 was found. For an example, see the comment on top 
of 'buf' in make_memory_node().

> +    unsigned int i, len = 0;
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
> -    if ( res )
> -        return res;
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +    res = fdt_begin_node(fdt, buf);

You set res but it gets overwritten just below. Were you meant to check 
the return value?

>   
>       res = fdt_property_cell(fdt, "#address-cells", 0);
>       if ( res )
> @@ -2282,35 +2286,55 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       if ( res )
>           return res;
>   
> +    /* reg specifies all re-distributors and Distributor. */
> +    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
> +    reg = xmalloc_bytes(len);
> +    if ( reg == NULL )
> +        return -ENOMEM;
> +
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
> -    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
> +                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
>   
> -    res = fdt_property(fdt, "reg", reg, sizeof(reg));
> +    for ( i = 0;
> +          i < d->arch.vgic.nr_regions;
> +          i++, cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) )

dt_child_set_range() will already update cells to the next ones. So this 
needs to be dropped.

I was expecting this to be caugt during test. So did you test this 
series with GICv3? How about the new vGIC?

> +    {
> +        dt_child_set_range(&cells,
> +                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                           d->arch.vgic.rdist_regions[i].base,
> +                           d->arch.vgic.rdist_regions[i].size);
> +    }
> +
> +    res = fdt_property(fdt, "reg", reg, len);

I would suggest to free 'reg' right here as you don't need it 
afterwards. This will also remove the requirement to add a 'out' label 
and the addition of 'goto'.

>       if (res)
> -        return res;
> +        goto out;
>   >       res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
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
> +#endif
>   
>   static int __init make_gic_domU_node(struct kernel_info *kinfo)
>   {
>       switch ( kinfo->d->arch.vgic.version )
>       {
> +#ifdef CONFIG_ARM_64
>       case GIC_V3:
>           return make_gicv3_domU_node(kinfo);
> +#endif
>       case GIC_V2:
>           return make_gicv2_domU_node(kinfo);
>       default:
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index cb5a70c42e..70168ca1ac 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1641,14 +1641,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
>        * Normally there is only one GICv3 redistributor region.
>        * The GICv3 DT binding provisions for multiple regions, since there are
>        * platforms out there which need those (multi-socket systems).
> -     * For Dom0 we have to live with the MMIO layout the hardware provides,
> -     * so we have to copy the multiple regions - as the first region may not
> -     * provide enough space to hold all redistributors we need.
> +     * For direct-map domain(including dom0), we have to live with the MMIO

I find the sentence somewhat misleading because it implies that dom0 is 
is a direct-map domain (this is true today, but this merely an 
implementation details).

However, with the change below, I think it would be better to write "For 
domain using the host memory layout..." and not going into details and 
what sort of domain we refer to here. Instead...

> +     * layout the hardware provides, so we have to copy the multiple regions
> +     * - as the first region may not provide enough space to hold all
> +     * redistributors we need.
>        * However DomU get a constructed memory map, so we can go with
>        * the architected single redistributor region.
>        */
> -    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
> -               GUEST_GICV3_RDIST_REGIONS;
> +    return is_domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
> +                                          GUEST_GICV3_RDIST_REGIONS;
>   }
>   
>   static int vgic_v3_domain_init(struct domain *d)
> @@ -1670,10 +1671,13 @@ static int vgic_v3_domain_init(struct domain *d)
>       radix_tree_init(&d->arch.vgic.pend_lpi_tree);
>   
>       /*
> -     * Domain 0 gets the hardware address.
> -     * Guests get the virtual platform layout.
> +     * Since we map the whole GICv3 register memory map(64KB) for
> +     * all guests(including DOM0), DOM0 and direct-map guests could be
> +     * treated the same way here.
> +     * direct-map domain (including Dom0) gets the hardware address.
> +     * Other guests get the virtual platform layout.
>        */
> -    if ( is_hardware_domain(d) )
> +    if ( is_domain_use_host_layout(d) )
>       {
>           unsigned int first_cpu = 0;
>   
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index fc42c6a310..e8ce3ac8d2 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -32,6 +32,9 @@ enum domain_type {
>   /* Check if domain is direct-map memory map. */
>   #define is_domain_direct_mapped(d) (d->options & XEN_DOMCTL_CDF_directmap)
>   
> +#define is_domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
> +                                      is_hardware_domain(d))

... the details should be on top of this comment. The advantage is there 
is less chance for a comment to rot.

Regarding the name, I would either drop the 'is_' or s/use/using/. My 
preference goes for the former as it makes the name sightly shorter.

Cheers,

-- 
Julien Grall

