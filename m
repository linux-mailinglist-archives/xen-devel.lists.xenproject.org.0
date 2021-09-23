Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A240415C2F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193664.344974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMG6-0005tH-Ht; Thu, 23 Sep 2021 10:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193664.344974; Thu, 23 Sep 2021 10:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMG6-0005q7-Dr; Thu, 23 Sep 2021 10:47:18 +0000
Received: by outflank-mailman (input) for mailman id 193664;
 Thu, 23 Sep 2021 10:47:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMG5-0005q1-33
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:47:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMG4-0005i8-TU; Thu, 23 Sep 2021 10:47:16 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMG4-0001HB-I1; Thu, 23 Sep 2021 10:47:16 +0000
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
	bh=n5w3XaparN2cwLfd1PJuST3kkmtv9IuXlkEHjqY5efs=; b=Kv1WCwSzjD0QzsM8/ZybBU7iXC
	fDmW9kxytsf4z7CkNey5zXmqqVM7cE43qbVyIbyCouIjBF8DHvOnVwEKKX7l2ty2vnLKafmr1HHLm
	DibH4dhYbyVH7i6dAVKLwhhn9pXMAfiysX1/rEOMXew+a7obAWcE74VLFqSX0XREuJrM=;
Subject: Re: [PATCH 05/11] xen/arm: vgic: introduce vgic.cbase
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <71709a54-6bb1-1981-d661-61c54d26f888@xen.org>
Date: Thu, 23 Sep 2021 15:47:12 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add a field in struct vgic_dist to store the cpu interface base address,
> similar to the existing dbase field.
> 
> Use the field in vgic_v2_domain_init, instead of original local variable.

Please explain in the commit message why this is necessary.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/vgic-v2.c     | 10 +++++-----
>   xen/include/asm-arm/vgic.h |  1 +
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index b2da886adc..b34ec88106 100644
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
> @@ -669,7 +669,7 @@ static int vgic_v2_domain_init(struct domain *d)
>            * Note that we assume the size of the CPU interface is always
>            * aligned to PAGE_SIZE.
>            */
> -        cbase = vgic_v2_hw.cbase;
> +        d->arch.vgic.cbase = vgic_v2_hw.cbase;
>           csize = vgic_v2_hw.csize;
>           vbase = vgic_v2_hw.vbase;
>       }
> @@ -683,7 +683,7 @@ static int vgic_v2_domain_init(struct domain *d)
>            * region.
>            */
>           BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
> -        cbase = GUEST_GICC_BASE;
> +        d->arch.vgic.cbase = GUEST_GICC_BASE;
>           csize = GUEST_GICC_SIZE;

Shouldn't we also stash d->arch.vgic.csize?

>           vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
>       }
> @@ -692,8 +692,8 @@ static int vgic_v2_domain_init(struct domain *d)
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
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index e1bc5113da..d5ad1f387b 100644
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
> 

Cheers,

-- 
Julien Grall

