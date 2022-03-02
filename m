Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26944CA0FF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 10:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282133.480722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLTU-0000UM-QZ; Wed, 02 Mar 2022 09:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282133.480722; Wed, 02 Mar 2022 09:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPLTU-0000RW-NS; Wed, 02 Mar 2022 09:40:48 +0000
Received: by outflank-mailman (input) for mailman id 282133;
 Wed, 02 Mar 2022 09:40:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPLTT-0000RQ-3Z
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 09:40:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPLTS-0001oO-Q3; Wed, 02 Mar 2022 09:40:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.10.166]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPLTS-0006xZ-JJ; Wed, 02 Mar 2022 09:40:46 +0000
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
	bh=DworUVLnm+WsZhrtNGRNQBJu4kjIywM//Yy1Ai7wovs=; b=rnsLdRfCzpB0irb1GZ+hIGGzIv
	+u3u+uC5CJ+1i1R7B/odSzkaYFeeFwKnNC5aNMwMrKoX0CuS4+sHiSjQNMRLLLdb1Re6c4p5+RcMP
	CRSRNMnX1UEBnwPVEC/GhGQZ7zwngBHnQsIw0++kZ/o73hdVtPruecKTdBWVu9AnfwnY=;
Message-ID: <2243c7f9-b0c7-83be-9ac0-5538436e4d6c@xen.org>
Date: Wed, 2 Mar 2022 09:40:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: gic: Introduce GIC_PRI_{IRQ/IPI}_ALL
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220302090212.115922-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220302090212.115922-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 02/03/2022 09:02, Michal Orzel wrote:
> Introduce macros GIC_PRI_IRQ_ALL and GIC_PRI_IPI_ALL to be used in all
> the places where we want to set default priority for all the offsets
> in interrupt priority register. This will improve readability and
> allow to get rid of introducing variables just to store this value.
> 
> Take the opportunity to mark GIC_PRI_{IRQ/IPI} as unsigned values
> to suppress static analyzer warnings as they are used in expressions
> exceeding integer range (shifting into signed bit). Modify also other
> priority related macros to be coherent.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/gic-v2.c          | 12 +++---------
>   xen/arch/arm/gic-v3.c          | 16 +++-------------
>   xen/arch/arm/include/asm/gic.h | 12 ++++++++----
>   3 files changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b2adc8ec9a..2cc2f6bc18 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -373,9 +373,7 @@ static void __init gicv2_dist_init(void)
>   
>       /* Default priority for global interrupts */
>       for ( i = 32; i < nr_lines; i += 4 )
> -        writel_gicd(GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ,
> -                    GICD_IPRIORITYR + (i / 4) * 4);
> +        writel_gicd(GIC_PRI_IRQ_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>   
>       /* Disable all global interrupts */
>       for ( i = 32; i < nr_lines; i += 32 )
> @@ -403,15 +401,11 @@ static void gicv2_cpu_init(void)
>   
>       /* Set SGI priorities */
>       for ( i = 0; i < 16; i += 4 )
> -        writel_gicd(GIC_PRI_IPI << 24 | GIC_PRI_IPI << 16 |
> -                    GIC_PRI_IPI << 8 | GIC_PRI_IPI,
> -                    GICD_IPRIORITYR + (i / 4) * 4);
> +        writel_gicd(GIC_PRI_IPI_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>   
>       /* Set PPI priorities */
>       for ( i = 16; i < 32; i += 4 )
> -        writel_gicd(GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ,
> -                    GICD_IPRIORITYR + (i / 4) * 4);
> +        writel_gicd(GIC_PRI_IRQ_ALL, GICD_IPRIORITYR + (i / 4) * 4);
>   
>       /* Local settings: interface controller */
>       /* Don't mask by priority */
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 9a3a175ad7..3c472ed768 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -594,7 +594,6 @@ static void gicv3_set_irq_priority(struct irq_desc *desc,
>   static void __init gicv3_dist_init(void)
>   {
>       uint32_t type;
> -    uint32_t priority;
>       uint64_t affinity;
>       unsigned int nr_lines;
>       int i;
> @@ -621,11 +620,7 @@ static void __init gicv3_dist_init(void)
>   
>       /* Default priority for global interrupts */
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 4 )
> -    {
> -        priority = (GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 |
> -                    GIC_PRI_IRQ << 8 | GIC_PRI_IRQ);
> -        writel_relaxed(priority, GICD + GICD_IPRIORITYR + (i / 4) * 4);
> -    }
> +        writel_relaxed(GIC_PRI_IRQ_ALL, GICD + GICD_IPRIORITYR + (i / 4) * 4);
>   
>       /* Disable/deactivate all global interrupts */
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i += 32 )
> @@ -806,7 +801,6 @@ static int __init gicv3_populate_rdist(void)
>   static int gicv3_cpu_init(void)
>   {
>       int i, ret;
> -    uint32_t priority;
>   
>       /* Register ourselves with the rest of the world */
>       if ( gicv3_populate_rdist() )
> @@ -826,16 +820,12 @@ static int gicv3_cpu_init(void)
>       }
>   
>       /* Set priority on PPI and SGI interrupts */
> -    priority = (GIC_PRI_IPI << 24 | GIC_PRI_IPI << 16 | GIC_PRI_IPI << 8 |
> -                GIC_PRI_IPI);
>       for (i = 0; i < NR_GIC_SGI; i += 4)
> -        writel_relaxed(priority,
> +        writel_relaxed(GIC_PRI_IPI_ALL,
>                   GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + (i / 4) * 4);
>   
> -    priority = (GIC_PRI_IRQ << 24 | GIC_PRI_IRQ << 16 | GIC_PRI_IRQ << 8 |
> -                GIC_PRI_IRQ);
>       for (i = NR_GIC_SGI; i < NR_GIC_LOCAL_IRQS; i += 4)
> -        writel_relaxed(priority,
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
>                   GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + (i / 4) * 4);
>   
>       /*
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index c7f0c343d1..69ceac36b1 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -143,10 +143,14 @@
>    *
>    * A GIC must support a mimimum of 16 priority levels.
>    */
> -#define GIC_PRI_LOWEST     0xf0
> -#define GIC_PRI_IRQ        0xa0
> -#define GIC_PRI_IPI        0x90 /* IPIs must preempt normal interrupts */
> -#define GIC_PRI_HIGHEST    0x80 /* Higher priorities belong to Secure-World */
> +#define GIC_PRI_LOWEST     0xf0U
> +#define GIC_PRI_IRQ        0xa0U
> +#define GIC_PRI_IRQ_ALL    ((GIC_PRI_IRQ << 24) | (GIC_PRI_IRQ << 16) |\
> +                            (GIC_PRI_IRQ << 8) | GIC_PRI_IRQ)
> +#define GIC_PRI_IPI        0x90U /* IPIs must preempt normal interrupts */
> +#define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
> +                            (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
This is matter of taste. I think it would read better to keep 
GIC_PRI_{LOWEST, IRQ, IPI, HIGHEST} defined together and then define 
*_ALL separately.

> +#define GIC_PRI_HIGHEST    0x80U /* Higher priorities belong to Secure-World */

NIT: While you are there, I would suggest to add a newline here. So we 
separate priority definitions from handy helpers.

>   #define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR only support
>                                               5 bits for guest irq priority */

Other than that. The patch itself looks good to me. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

