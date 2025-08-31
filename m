Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD057B3D344
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 14:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103715.1455132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ushNr-0001ri-Kj; Sun, 31 Aug 2025 12:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103715.1455132; Sun, 31 Aug 2025 12:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ushNr-0001oc-GR; Sun, 31 Aug 2025 12:42:11 +0000
Received: by outflank-mailman (input) for mailman id 1103715;
 Sun, 31 Aug 2025 12:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8SH=3L=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ushNp-0001oT-NQ
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 12:42:09 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7c5625f-8667-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 14:42:07 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f72452a8eso1000503e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 31 Aug 2025 05:42:07 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f6771b24fsm2196576e87.48.2025.08.31.05.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Aug 2025 05:42:04 -0700 (PDT)
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
X-Inumbo-ID: e7c5625f-8667-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756644127; x=1757248927; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ehfFUyFCAajawnrjTOP6oqFrle2TfuBF1tn2KbIV28=;
        b=m/RJ4fa599kbyFFPCUbeVc3sffU7AXbiDUoXfsts1qXvHc51zcyRu343QjN14h57lw
         EY+6VoTy/6hcX1tl+9tn3IPThYpbSCJDQ/FtcNVVyxE8BgR6vx1HvI2cLzO8TtpCzZuZ
         gLVZnTmlM2+AlKOu1Xz0NOBdkx8WLRdUEaQoFAXIf0sLIv4HoHuTx5+D5jnYN1awhzIv
         45eKMltaQmIjTUERiXiKrGvkrLib+19/BzZccV7QziUKWrgljK8k8KPxC1Ra4GFJB0Kc
         V+dUz7TFcopUu+Rm+3OxhIanbSTHNpTeje3EqUuHpcpb+XnjDtmB47CH/WB9bGx3goEZ
         wv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756644127; x=1757248927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ehfFUyFCAajawnrjTOP6oqFrle2TfuBF1tn2KbIV28=;
        b=buRnV/Te0/sk6pzYur8Q9EVn3MKFxkWDfwabUuWA/uAZYp7CF6E8OLYESVfN/ejgeH
         IVxp7r4ICqymFlOVB2kaXK+UBOyGKIzwY5ZZJI7MmgHVpUrjasRFUpJAikymGmeQpOvI
         7c2jKNWKXjMwsccgcGt+HxQ3ZZ0wfpS/3RYzj7zwEjqALJHYFVjuhkUZGVIvsRk6loZS
         qbifIU4YHnpNFLA8ApZkcgwV6TIiFoitydaR2qjKWrkwA6v+fxtiNXr7oKg2g8H9jtvf
         6JbbXraBnXFJE0TlIwqpAmucXz5n5j8WyQtKXHG5po/HVSeHy9w8gYIzlmN7XSThbebU
         JJvA==
X-Forwarded-Encrypted: i=1; AJvYcCVq+68vxfJgyKElIbcbhmp7PwEwc/b2MnlbxVmGXPpI2UYovx3+nXMnJSRQIFrhNTygMPC7tarUc+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzefzU9e0kFUIKv9rPIQMjXwyWx6yKVq7HtcS4IUXI4rqDRdfaD
	jOoCdWS5xSV7FK7gIG5Lj1qvN15fQ9WXeY75onovr0JK/Wvj0Vq5GKQk
X-Gm-Gg: ASbGnct64alzW9pzmUOPKt2eoNtrIMdl1jKdtB4oWSiNAauey0/6db47psbYRYhBu3E
	kqoeJekF5n47AcJV5uDP27ufhBJ3i7sEYpoIzJPMhf6Sjav1QLitkOlEN/1mcjBbslpTNbEJiIG
	qC4kBOmyiAqlnkHu3v8Mj8JngqqarSyXfGxVMRHO8HlvVB45DoZ2l43AqR0A9/mcga6+WfAc6aX
	kMo8yS6hslHs7VZ69fxawVNGfR2Ud8NJb3ZNdwh4M2nfYdHgAOmFKl6mLZLQm2ez6k5+tTBIzBM
	vzZxf6Uv/tGiX9dTNh4PvkaIKeOMWL+gI/egKxtgpLd0ffh8S3qGBr6tWTqZHXQUQEkhsqg+246
	/YsYXahwyoSyg8S6EhzwfzxXFYg==
X-Google-Smtp-Source: AGHT+IHnKLe1GLP7APeYsinjv55qlet2jLDchuhFMEfTsu+Tomd8p3wALoAf+WsrLZweqMkoEEQPhg==
X-Received: by 2002:a05:6512:eaa:b0:55f:42a0:a1d9 with SMTP id 2adb3069b0e04-55f708bbd71mr1143555e87.24.1756644126821;
        Sun, 31 Aug 2025 05:42:06 -0700 (PDT)
Message-ID: <5b4de10b-a69b-47bc-8ab7-d9e3ce514027@gmail.com>
Date: Sun, 31 Aug 2025 15:42:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] xen/arm: gicv3: refactor obtaining GIC addresses
 for common operations
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <7da58b5a27d61f75eaebb749a7ab4c72655a12cb.1756481577.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <7da58b5a27d61f75eaebb749a7ab4c72655a12cb.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29.08.25 19:06, Leonid Komarianskyi wrote:

Hello Leonid


> Currently, many common functions perform the same operations to calculate
> GIC register addresses. This patch consolidates the similar code into
> a separate helper function to improve maintainability and reduce duplication.
> This refactoring also simplifies the implementation of eSPI support in future
> changes.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

with one NIT ...

> 
> ---
> Changes in V5:
> - fixed a minor nit: changed %d to %u in the warning message because the
>    IRQ number cannot be less than zero
> - added acked-by from Julien Grall
> 
> Changes in V4:
> - no changes
> 
> Changes in V3:
> - changed panic() in get_addr_by_offset() to printing warning and
>    ASSERT_UNREACHABLE()
> - added verification of return pointer from get_addr_by_offset() in the
>    callers
> - moved invocation of get_addr_by_offset() from spinlock guards, since
>    it is not necessarry
> - added RB from Volodymyr Babchuk
> 
> Changes in V2:
> - no changes
> ---
>   xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
>   xen/arch/arm/include/asm/irq.h |   1 +
>   2 files changed, 81 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..29b7f68cba 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
>       }
>   }
>   
> +static void __iomem *get_addr_by_offset(struct irq_desc *irqd, u32 offset)

  ... please use uint32_t for new code

(could probably updated on commit)


> +{
> +    switch ( irqd->irq )
> +    {
> +    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD_RDIST_SGI_BASE + offset);
> +        case GICD_ICFGR:
> +            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
> +        case GICD_IPRIORITYR:
> +            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
> +        default:
> +            break;
> +        }
> +    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
> +        switch ( offset )
> +        {
> +        case GICD_ISENABLER:
> +        case GICD_ICENABLER:
> +        case GICD_ISPENDR:
> +        case GICD_ICPENDR:
> +        case GICD_ISACTIVER:
> +        case GICD_ICACTIVER:
> +            return (GICD + offset + (irqd->irq / 32) * 4);
> +        case GICD_ICFGR:
> +            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
> +        case GICD_IROUTER:
> +            return (GICD + GICD_IROUTER + irqd->irq * 8);
> +        case GICD_IPRIORITYR:
> +            return (GICD + GICD_IPRIORITYR + irqd->irq);
> +        default:
> +            break;
> +        }
> +    default:
> +        break;
> +    }
> +
> +    /* Something went wrong, we shouldn't be able to reach here */
> +    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%u",
> +           offset, irqd->irq);
> +    ASSERT_UNREACHABLE();
> +
> +    return NULL;
> +}
> +
>   static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_for_rwp)
>   {
>       u32 mask = 1U << (irqd->irq % 32);
> -    void __iomem *base;
> +    void __iomem *addr = get_addr_by_offset(irqd, offset);
>   
> -    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
> -        base = GICD_RDIST_SGI_BASE;
> -    else
> -        base = GICD;
> +    if ( addr == NULL )
> +        return;
>   
> -    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
> +    writel_relaxed(mask, addr);
>   
>       if ( wait_for_rwp )
>           gicv3_wait_for_rwp(irqd->irq);
> @@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_for_rwp)
>   
>   static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
>   {
> -    void __iomem *base;
> -    unsigned int irq = irqd->irq;
> +    void __iomem *addr = get_addr_by_offset(irqd, offset);
>   
> -    if ( irq >= NR_GIC_LOCAL_IRQS)
> -        base = GICD + (irq / 32) * 4;
> -    else
> -        base = GICD_RDIST_SGI_BASE;
> +    if ( addr == NULL )
> +        return false;
>   
> -    return !!(readl(base + offset) & (1U << (irq % 32)));
> +    return !!(readl(addr) & (1U << (irqd->irq % 32)));
>   }
>   
>   static void gicv3_unmask_irq(struct irq_desc *irqd)
> @@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cpu)
>   static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
>   {
>       uint32_t cfg, actual, edgebit;
> -    void __iomem *base;
> -    unsigned int irq = desc->irq;
> +    void __iomem *addr;
>   
>       /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
> -    ASSERT(irq >= NR_GIC_SGI);
> +    ASSERT(desc->irq >= NR_GIC_SGI);
>   
> -    spin_lock(&gicv3.lock);
> +    addr = get_addr_by_offset(desc, GICD_ICFGR);
> +    if ( addr == NULL )
> +        return;
>   
> -    if ( irq >= NR_GIC_LOCAL_IRQS)
> -        base = GICD + GICD_ICFGR + (irq / 16) * 4;
> -    else
> -        base = GICD_RDIST_SGI_BASE + GICR_ICFGR1;
> +    spin_lock(&gicv3.lock);
>   
> -    cfg = readl_relaxed(base);
> +    cfg = readl_relaxed(addr);
>   
> -    edgebit = 2u << (2 * (irq % 16));
> +    edgebit = 2u << (2 * (desc->irq % 16));
>       if ( type & IRQ_TYPE_LEVEL_MASK )
>           cfg &= ~edgebit;
>       else if ( type & IRQ_TYPE_EDGE_BOTH )
>           cfg |= edgebit;
>   
> -    writel_relaxed(cfg, base);
> +    writel_relaxed(cfg, addr);
>   
> -    actual = readl_relaxed(base);
> +    actual = readl_relaxed(addr);
>       if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
>       {
>           printk(XENLOG_WARNING "GICv3: WARNING: "
> @@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
>   static void gicv3_set_irq_priority(struct irq_desc *desc,
>                                      unsigned int priority)
>   {
> -    unsigned int irq = desc->irq;
> +    void __iomem *addr = get_addr_by_offset(desc, GICD_IPRIORITYR);
>   
> -    spin_lock(&gicv3.lock);
> -
> -    /* Set priority */
> -    if ( irq < NR_GIC_LOCAL_IRQS )
> -        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irq);
> -    else
> -        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
> +    if ( addr == NULL )
> +        return;
>   
> +    spin_lock(&gicv3.lock);
> +    writeb_relaxed(priority, addr);
>       spin_unlock(&gicv3.lock);
>   }
>   
> @@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>   {
>       unsigned int cpu;
>       uint64_t affinity;
> +    void __iomem *addr = get_addr_by_offset(desc, GICD_IROUTER);
> +
> +    if ( addr == NULL )
> +        return;
>   
>       ASSERT(!cpumask_empty(mask));
>   
> @@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>   
>       if ( desc->irq >= NR_GIC_LOCAL_IRQS )
> -        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
> +        writeq_relaxed_non_atomic(affinity, addr);
>   
>       spin_unlock(&gicv3.lock);
>   }
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index fce7e42a33..5bc6475eb4 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -29,6 +29,7 @@ struct arch_irq_desc {
>    */
>   #define NR_IRQS		1024
>   
> +#define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */


