Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DD7415C2A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193659.344963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMEH-0005Cq-6i; Thu, 23 Sep 2021 10:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193659.344963; Thu, 23 Sep 2021 10:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMEH-0005BQ-2K; Thu, 23 Sep 2021 10:45:25 +0000
Received: by outflank-mailman (input) for mailman id 193659;
 Thu, 23 Sep 2021 10:45:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMEF-0005BK-OJ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:45:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMEF-0005gV-Fy; Thu, 23 Sep 2021 10:45:23 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMEF-00017L-5O; Thu, 23 Sep 2021 10:45:23 +0000
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
	bh=uTIOvtDFhgTQagOCLz/7ETcHasUNW8MPG5ftpDFLmmo=; b=s6ufslsD7cdXAjLoyofnn7uihe
	F7vgyybdDFcWYwq0c6TATwCCd8UQtVAN85uE7WufSrdIorKi7Lu0XeRGP11HPWdzfbFNOWtx/Evjj
	MEFZKVRW0cMY5dr2lOQQlL6HRuiSz022zHbeba6PJgODfw2BASuUrOcGcOEgCXygWPLI=;
Subject: Re: [PATCH 04/11] xen/arm: introduce accessors for vgic dist, cpu,
 and rdist base addresses
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-5-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cebb55da-7a24-fd51-1fdc-b40f2ed437d7@xen.org>
Date: Thu, 23 Sep 2021 15:45:19 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Introduce accessors for vgic dist, cpu, and rdist base addresses, on
> all gic types.
> 
> Use the accessors when making gic node for device tree of domU.

Please explain in the commit message why you need them.

however, I am not entirely convined of the usefulness of the helpers. It 
will call to bits that are already directly accessible and you could 
simply #ifdef make_gicv3_domU_node.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c    | 21 ++++++++++++-----
>   xen/include/asm-arm/new_vgic.h | 24 ++++++++++++++++++++
>   xen/include/asm-arm/vgic.h     | 41 ++++++++++++++++++++++++++++++++++
>   3 files changed, 80 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 213ad017dc..d5f201f73e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1802,8 +1802,12 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[38];
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -1825,9 +1829,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
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
> @@ -1852,8 +1856,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>       int res = 0;
>       __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[38];
>   
> -    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +             vgic_dist_base(&d->arch.vgic));
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -1875,9 +1883,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
> +                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
> +                       vgic_rdist_base(&d->arch.vgic, 0),
> +                       vgic_rdist_size(&d->arch.vgic, 0));
>   
>       res = fdt_property(fdt, "reg", reg, sizeof(reg));
>       if (res)
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index 62c2ae538d..e1bc5113da 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -277,6 +277,47 @@ enum gic_sgi_mode;
>    */
>   #define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
>   
> +static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)

The names of the helpers suggest that if we pass any domain (including 
dom0), then we would return the correct address. However, here this is 
only going to return the address for the guests.

This looks like to be solved by the follow-up patches (in particular 
patch #7, #8). So I think it would be best to first introduced all the 
fields and then use it directly here.

> +{
> +    return GUEST_GICC_BASE;
> +}
> +
> +static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
> +{
> +    return GUEST_GICD_BASE;
> +}
> +
> +#ifdef CONFIG_GICV3
> +static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
> +{
> +    return GUEST_GICV3_RDIST_REGIONS;
> +}
> +
> +static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
> +{
> +    return GUEST_GICV3_GICR0_BASE;
> +}
> +
> +static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
> +{
> +    return GUEST_GICV3_GICR0_SIZE;
> +}
> +#else
> +static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
> +{
> +    return 0;
> +}
> +
> +static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
> +{
> +    return INVALID_PADDR;
> +}
> +
> +static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
> +{
> +    return INVALID_PADDR;
> +}
> +#endif
>   
>   extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int virq);
>   extern void vgic_remove_irq_from_queues(struct vcpu *v, struct pending_irq *p);
> 

-- 
Julien Grall

