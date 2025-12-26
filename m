Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827CCDEB2B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Dec 2025 13:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193427.1512178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZ6wL-0007I2-EG; Fri, 26 Dec 2025 12:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193427.1512178; Fri, 26 Dec 2025 12:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vZ6wL-0007FX-8X; Fri, 26 Dec 2025 12:29:05 +0000
Received: by outflank-mailman (input) for mailman id 1193427;
 Fri, 26 Dec 2025 12:29:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vZ6wJ-0007Ex-DH
 for xen-devel@lists.xenproject.org; Fri, 26 Dec 2025 12:29:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vZ6wI-00Ayyb-25;
 Fri, 26 Dec 2025 12:29:02 +0000
Received: from [2a02:8012:3a1:0:7185:a579:c:f908]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vZ6wI-0030Dg-1l;
 Fri, 26 Dec 2025 12:29:02 +0000
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
	bh=laBISD0gn0VadDmoSAo/SlXqMGTwtJSauOuaZFWthqo=; b=alBI0+UgKZu0969ZD3uYLJqp5W
	LCfRNG/z9jaBqn8jua0jDyEwIEyMtY0uHzb8s9jyB7seW5L0176GmdgLapLvnOEG1S/QgTOz7eOzS
	PKBnlz34n3LuOo5u4LIW888vBjM2XMRipi+H7RA3aK5qIgPyyy0N5NKIZIVj3oWNbofI=;
Message-ID: <75823cb4-c14c-4a4a-b523-e131c820a4d3@xen.org>
Date: Fri, 26 Dec 2025 12:29:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/12] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <fe8b4d92a8dfd7b4c40429d10233637a339ae8e6.1765472890.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fe8b4d92a8dfd7b4c40429d10233637a339ae8e6.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 11/12/2025 18:43, Mykola Kvach wrote:
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..0b2f7b3862 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1098,6 +1098,123 @@ static int gicv2_iomem_deny_access(struct domain *d)
>       return iomem_deny_access(d, mfn, mfn + nr);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* This struct represent block of 32 IRQs */
> +struct irq_block {
> +    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
> +    uint32_t ipriorityr[8];
> +    uint32_t isenabler;
> +    uint32_t isactiver;
> +    uint32_t itargetsr[8];
> +};
> +
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
 > +    struct cpu_ctx {> +        uint32_t ctlr;
> +        uint32_t pmr;
> +        uint32_t bpr;
> +    } cpu;
> +
> +    /* GICD context */
> +    struct dist_ctx {
> +        uint32_t ctlr;
> +        struct irq_block *irqs;

To confirm my understanding, this will also include the PPIs, SGIs for 
the boot CPU, am I correct? If so, I would suggest to add a comment.

> +    } dist;
> +};
> +
> +static struct gicv2_context gic_ctx;
> +
> +static int gicv2_suspend(void)
> +{
> +    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> +
> +    /* Save GICC configuration */
> +    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
> +    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
> +    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
> +
> +    /* Save GICD configuration */
> +    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);

Do we want to disable the GIC distributor and CPU interface on suspend?

> +
> +    for ( i = 0; i < blocks; i++ )
> +    {
> +        struct irq_block *irqs = gic_ctx.dist.irqs + i;
> +        size_t j, off = i * sizeof(irqs->isenabler);
> +
> +        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
> +        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
> +
> +        off = i * sizeof(irqs->ipriorityr);
> +        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
> +        {
> +            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
> +            irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
> +        }
> +
> +        off = i * sizeof(irqs->icfgr);
> +        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
> +            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
> +    }
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
> +
> +    gicv2_cpu_disable();
 > +    /* Disable distributor */> +    writel_gicd(0, GICD_CTLR);
 > +> +    for ( i = 0; i < blocks; i++ )
> +    {
> +        struct irq_block *irqs = gic_ctx.dist.irqs + i;
> +        size_t j, off = i * sizeof(irqs->isenabler);
> +
> +        writel_gicd(0xffffffffU, GICD_ICENABLER + off);

NIT: Can we use GENMASK? This will make easier to confirm we have the 
correct number of bits.

[...]

Cheers,

-- 
Julien Grall


