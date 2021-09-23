Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B27415C4F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193683.345007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMKm-0000J6-Td; Thu, 23 Sep 2021 10:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193683.345007; Thu, 23 Sep 2021 10:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMKm-0000Fz-Q1; Thu, 23 Sep 2021 10:52:08 +0000
Received: by outflank-mailman (input) for mailman id 193683;
 Thu, 23 Sep 2021 10:52:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMKl-0000Ft-DP
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:52:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMKl-0005oC-5s; Thu, 23 Sep 2021 10:52:07 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMKk-0001dh-RS; Thu, 23 Sep 2021 10:52:07 +0000
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
	bh=Q6dwjDIOEVQxb8x7Gyad+iCjguS1FstWTow7Js2xGwI=; b=c4ZWhFBRTo7XMXx5V11NRCxVnT
	SvAZPfQny4IkOgHQvdkIP3UUipmZGjjn4J7+W3NWV8VdmY/vth6c8X6TSZB9EY/rict2zt33S4EDB
	QtBUUxMcqy2xNJYBngBRkQT2wm2lAqxBR36m8ZJVg/w17XYHfSxBZtKmS3huzCV8TJyg=;
Subject: Re: [PATCH 07/11] xen/arm: if 1:1 direct-map domain use native
 addresses for GICv2
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-8-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ac986e10-0ecf-3a2a-65a7-4cfe6567c64f@xen.org>
Date: Thu, 23 Sep 2021 15:52:00 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Today we use native addresses to map the GICv2 for Dom0 and fixed
> addresses for DomUs.
> 
> This patch changes the behavior so that native addresses are used for
> all domains that are 1:1 direct-map(including Dom0).
> 
> Update the accessors to use the struct vgic variables to provide the
> updated addresses.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/vgic-v2.c         | 16 ++++++++++++++++
>   xen/arch/arm/vgic/vgic-v2.c    | 17 +++++++++++++++++
>   xen/include/asm-arm/new_vgic.h |  4 ++--
>   xen/include/asm-arm/vgic.h     |  4 ++--
>   4 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b34ec88106..a8cf8173d0 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -673,6 +673,22 @@ static int vgic_v2_domain_init(struct domain *d)
>           csize = vgic_v2_hw.csize;
>           vbase = vgic_v2_hw.vbase;
>       }
> +    else if ( is_domain_direct_mapped(d) )
> +    {
> +        /*
> +         * For non-dom0 direct_mapped guests we only map a 8kB CPU
> +         * interface but we make sure it is at a location occupied by
> +         * the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */

So I agree that we need to differentiate between dom0 and other direct 
mapped domains. However, I think it would be good to explainm why given 
that in other places you treat dom0 and direct mapped domain the same way.

> +        d->arch.vgic.dbase = vgic_v2_hw.dbase;
> +        d->arch.vgic.cbase = vgic_v2_hw.cbase + vgic_v2_hw.aliased_offset;
> +        csize = GUEST_GICC_SIZE;
> +        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.dbase = GUEST_GICD_BASE;
> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> index fd452fcb5a..ce1f6e4373 100644
> --- a/xen/arch/arm/vgic/vgic-v2.c
> +++ b/xen/arch/arm/vgic/vgic-v2.c
> @@ -280,6 +280,23 @@ int vgic_v2_map_resources(struct domain *d)
>           csize = gic_v2_hw_data.csize;
>           vbase = gic_v2_hw_data.vbase;
>       }
> +    else if ( is_domain_direct_mapped(d) )
> +    {
> +        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
> +        /*
> +         * For non-dom0 direct_mapped guests we only map a 8kB CPU
> +         * interface but we make sure it is at a location occupied by
> +         * the physical GIC in the host device tree.
> +         *
> +         * We need to add an offset to the virtual CPU interface base
> +         * address when the GIC is aliased to get a 8kB contiguous
> +         * region.
> +         */
> +        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase +
> +                                     gic_v2_hw_data.aliased_offset;
> +        csize = GUEST_GICC_SIZE;
> +        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
> +    }
>       else
>       {
>           d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
> diff --git a/xen/include/asm-arm/new_vgic.h b/xen/include/asm-arm/new_vgic.h
> index 9097522b27..0d16f878eb 100644
> --- a/xen/include/asm-arm/new_vgic.h
> +++ b/xen/include/asm-arm/new_vgic.h
> @@ -188,12 +188,12 @@ struct vgic_cpu {
>   
>   static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
>   {
> -    return GUEST_GICC_BASE;
> +    return vgic->vgic_cpu_base;
>   }
>   
>   static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
>   {
> -    return GUEST_GICD_BASE;
> +    return vgic->vgic_dist_base;
>   }
>   
>   static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index d5ad1f387b..92f6a2d15d 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -280,12 +280,12 @@ enum gic_sgi_mode;
>   
>   static inline paddr_t vgic_cpu_base(struct vgic_dist *vgic)
>   {
> -    return GUEST_GICC_BASE;
> +    return vgic->cbase;
>   }
>   
>   static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
>   {
> -    return GUEST_GICD_BASE;
> +    return vgic->dbase;
>   }
>   
>   #ifdef CONFIG_GICV3 >

Cheers,

-- 
Julien Grall

