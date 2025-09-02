Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E02B40A25
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 18:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107038.1457600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTYw-0000Ur-Pq; Tue, 02 Sep 2025 16:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107038.1457600; Tue, 02 Sep 2025 16:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTYw-0000SQ-Mx; Tue, 02 Sep 2025 16:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1107038;
 Tue, 02 Sep 2025 16:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cv9L=3N=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utTYu-0000SK-Lg
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 16:08:48 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ac103a5-8817-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 18:08:46 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b8b02dd14so15715125e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 09:08:46 -0700 (PDT)
Received: from [10.17.76.214] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c22sm288788585e9.13.2025.09.02.09.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 09:08:44 -0700 (PDT)
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
X-Inumbo-ID: 1ac103a5-8817-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829326; x=1757434126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBE0Vkk4sDZznE4o41DGgJzs1KLfClxgmngsyUAfs0A=;
        b=nkwpVK/1lgQ5smlc4xbBdNpn/ef2Saurt6RxsNrsSqzwjajG74gHGtCDSfN/kVeSNz
         08Kcz4LpbSn0cWPeKR8rErCtYxgRNv9xBY3MSc9W23rfxgNvjFA4rc3fW5j0B5NcABD1
         sXKzRWboFDrohcsgdZFprYbRziZmVg/mM0C3IG2hV46jLhrrgZmwLXKI5o1bqXB8Zgif
         Cx/BhlST6cZx4b3RrAlTh4kReC8Svy6mrs1Z9Bp3rasBFqtCExO7iZhVsFyRsTiAjoOc
         +qTme4A5opOmLYwwgShKkGCUtD/yTFg2SzR8/17gpDByg/DONCDtZEmJVELLyrowEyGI
         rDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829326; x=1757434126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBE0Vkk4sDZznE4o41DGgJzs1KLfClxgmngsyUAfs0A=;
        b=Mwl6WglYbv3Jkk/MzlECJk4r+f+ca22G5QinBmZpNsZFPNZ5miPlkZ9b0lyOxLH9nX
         6aGcnXCbZ85O5smFn6855qOcp2214joFBnQ1s/YvUBJABYrRlLXb9ZP9pUsNoUmKMndl
         jOvPMrDf9+1dvHTSbX9ZIlgeLqlOdnph51aXJOKeg0KGvQxsP31PYN/T/xdVAQHfZdu3
         +A/VJZv/e2Rm69ddt7bFbqU3x45AXp6AHXmvplJJowRfWTTHPM8Wy7s1X05hWbJl7vC5
         iqkM1yVjKiXXGrz13+q6bAgWtSazLuLLKlqdGvMg9EVkC3qoxy3ADyau3LXsulhBM+Z7
         oXig==
X-Forwarded-Encrypted: i=1; AJvYcCWIN+TjOUTVgQywppLDhvxhTNxkzTgSeiOkXpidTpeVKfL2ayAVwSjUrL7Q1F6wFj3ogIgeoQUWh8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9LLmXnGSMhQPToYDgl/GYl12FAoqlkCiekP6qDRk3kiPI10SW
	yL6hRaE4Uw0AnkRDR7mtgQGbpcaxUxj2SLKEJ25NcGTO0I4s38CoL+8s
X-Gm-Gg: ASbGncvjuTgCsaHxCqOQtJh0AZMoH4nAfC/ImXF0ETmMpG1nL/WLr3N0PNjcLofnd7f
	NjU08pg/Eh1GRVRw/tyOQ+7Mdmh2DScgx+QWEv0gOMCKxOyxSscGkjQIoaMxpfh18aUsCZa7sMM
	oDHqvPgA+/SE60kI17GEsFbTSXGbwyfwu3LJ/z75weG7lyEy7A7Um+LIWYLPP7DvN/Pf0+Ch7OS
	eVMY4IbxAsQVBaVGljY69tDYt2RKxJ6bgveGBl6zZIL4f0vR3nbRQc5HohjlgpRQrH9Pb7mF6tW
	SYS2Xdtn6qlqMNViLUdVqqbL8xbVfI8w1jMWprcbxeAbU4bdemCOnMAE5VHXUgRSOqDQDeLEipm
	iygrOwkmvYHuMwu7TZA1eFMXWNeRO3ClaACtK3MaxXg5c3/SVWao3X3A=
X-Google-Smtp-Source: AGHT+IGTowq7ER+TW92EsrtfzwrIp54X5Yg/9nwRUy14eU69NHA4ky0DnWgHFHc9/0Y6iPI7pOT8PQ==
X-Received: by 2002:a05:600c:1551:b0:45b:88b1:373d with SMTP id 5b1f17b1804b1-45b8d3e4062mr68850475e9.30.1756829325430;
        Tue, 02 Sep 2025 09:08:45 -0700 (PDT)
Message-ID: <cf39cf03-9b21-4fbd-a830-44bea7ee7fd1@gmail.com>
Date: Tue, 2 Sep 2025 19:08:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/13] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <dc98a547ac7f746b21b47e826edf58fe9003c576.1756763487.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <dc98a547ac7f746b21b47e826edf58fe9003c576.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02.09.25 01:10, Mykola Kvach wrote:

Hello Mykola


> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
> 
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V6:
> - Drop gicv3_save/restore_state since it is already handled during vCPU
>    context switch.
> - The comment about systems without SPIs is clarified for readability.
> - Error and warning messages related to suspend context allocation are unified
>    and now use printk() with XENLOG_ERR for consistency.
> - The check for suspend context allocation in gicv3_resume() is removed,
>    as it is handled earlier in the suspend path.
> - The loop for saving and restoring PPI/SGI priorities is corrected to use
>    the proper increment.
> - The gicv3_suspend() function now prints an explicit error if ITS suspend
>    support is not implemented, and returns ENOSYS in this case.
> - The GICD_CTLR_DS bit definition is added to gic_v3_defs.h.
> - The comment for GICR_WAKER access is expanded to reference the relevant
>    ARM specification section and clarify the RAZ/WI behavior for Non-secure
>    accesses.
> - Cleanup active and enable registers before restoring.
> ---
>   xen/arch/arm/gic-v3-lpi.c              |   3 +
>   xen/arch/arm/gic-v3.c                  | 235 +++++++++++++++++++++++++
>   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
>   3 files changed, 239 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index de5052e5cf..61a6e18303 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
>       switch ( action )
>       {
>       case CPU_UP_PREPARE:
> +        if ( system_state == SYS_STATE_resume )
> +            break;
> +
>           rc = gicv3_lpi_allocate_pendtable(cpu);
>           if ( rc )
>               printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index cd3e1acf79..9f1be7e905 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1776,6 +1776,233 @@ static bool gic_dist_supports_lpis(void)
>       return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* GICv3 registers to be saved/restored on system suspend/resume */
> +struct gicv3_ctx {
> +    struct dist_ctx {
> +        uint32_t ctlr;
> +        /*
> +         * This struct represent block of 32 IRQs
> +         * TODO: store extended SPI configuration (GICv3.1+)
> +         */
> +        struct irq_regs {
> +            uint32_t icfgr[2];
> +            uint32_t ipriorityr[8];
> +            uint64_t irouter[32];
> +            uint32_t isactiver;
> +            uint32_t isenabler;
> +        } *irqs;
> +    } dist;
> +
> +    /* have only one rdist structure for last running CPU during suspend */
> +    struct redist_ctx {
> +        uint32_t ctlr;
> +        /* TODO: handle case when we have more than 16 PPIs (GICv3.1+) */
> +        uint32_t icfgr[2];
> +        uint32_t igroupr;
> +        uint32_t ipriorityr[8];
> +        uint32_t isactiver;
> +        uint32_t isenabler;
> +    } rdist;
> +
> +    struct cpu_ctx {
> +        uint32_t ctlr;
> +        uint32_t pmr;
> +        uint32_t bpr;
> +        uint32_t sre_el2;
> +        uint32_t grpen;
> +    } cpu;
> +};
> +
> +static struct gicv3_ctx gicv3_ctx;
> +
> +static void __init gicv3_alloc_context(void)
> +{
> +    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
> +
> +    /* We don't have ITS support for suspend */
> +    if ( gicv3_its_host_has_its() )
> +        return;
> +
> +    /* The spec allows for systems without any SPIs */
> +    if ( blocks > 1 )
> +    {
> +        gicv3_ctx.dist.irqs = xzalloc_array(typeof(*gicv3_ctx.dist.irqs),
> +                                            blocks - 1);
> +        if ( !gicv3_ctx.dist.irqs )
> +            printk(XENLOG_ERR "Failed to allocate memory for GICv3 suspend context\n");
> +    }
> +}
> +
> +static void gicv3_disable_redist(void)
> +{
> +    void __iomem* waker = GICD_RDIST_BASE + GICR_WAKER;
> +
> +    /*
> +     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
> +     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
> +     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
> +     *     register are RAZ/WI.
> +     */
> +    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
> +        return;
> +
> +    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
> +    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 );
> +}
> +
> +static int gicv3_suspend(void)
> +{
> +    unsigned int i;
> +    void __iomem *base;
> +    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
> +
> +    /* TODO: implement support for ITS */
> +    if ( gicv3_its_host_has_its() )
> +    {
> +        printk(XENLOG_ERR "GICv3: ITS suspend support is not implemented\n");
> +        return -ENOSYS;
> +    }
> +
> +    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS )
> +    {
> +        printk(XENLOG_ERR "GICv3: suspend context is not allocated!\n");
> +        return -ENOMEM;
> +    }
> +
> +    /* Save GICC configuration */
> +    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
> +    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
> +    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
> +    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
> +    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
> +
> +    gicv3_disable_interface();
> +    gicv3_disable_redist();
> +
> +    /* Save GICR configuration */
> +    gicv3_redist_wait_for_rwp();
> +
> +    base = GICD_RDIST_SGI_BASE;
> +
> +    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
> +
> +    /* Save priority on PPI and SGI interrupts */
> +    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> +        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
> +
> +    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
> +    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
> +    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
> +    rdist->icfgr[0]  = readl_relaxed(base + GICR_ICFGR0);

GICR_ICFGR0 is for SGIs, which are always edge-triggered, so I am not 
sure that we need to save it here ...


> +    rdist->icfgr[1]  = readl_relaxed(base + GICR_ICFGR1);
> +
> +    /* Save GICD configuration */
> +    gicv3_dist_wait_for_rwp();
> +    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
> +
> +    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
> +        unsigned int irq;
> +
> +        base = GICD + GICD_ICFGR + 8 * i;
> +        irqs->icfgr[0] = readl_relaxed(base);
> +        irqs->icfgr[1] = readl_relaxed(base + 4);
> +
> +        base = GICD + GICD_IPRIORITYR + 32 * i;
> +        for ( irq = 0; irq < 8; irq++ )
> +            irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
> +
> +        base = GICD + GICD_IROUTER + 32 * i;
> +        for ( irq = 0; irq < 32; irq++ )
> +            irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
> +
> +        irqs->isactiver = readl_relaxed(GICD + GICD_ISACTIVER + 4 * i);
> +        irqs->isenabler = readl_relaxed(GICD + GICD_ISENABLER + 4 * i);
> +    }
> +
> +    return 0;
> +}
> +
> +static void gicv3_resume(void)
> +{
> +    unsigned int i;
> +    void __iomem *base;
> +    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
> +
> +    writel_relaxed(0, GICD + GICD_CTLR);
> +
> +    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
> +
> +    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
> +    {
> +        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
> +        unsigned int irq;
> +
> +        base = GICD + GICD_ICFGR + 8 * i;
> +        writel_relaxed(irqs->icfgr[0], base);
> +        writel_relaxed(irqs->icfgr[1], base + 4);
> +
> +        base = GICD + GICD_IPRIORITYR + 32 * i;
> +        for ( irq = 0; irq < 8; irq++ )
> +            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
> +
> +        base = GICD + GICD_IROUTER + 32 * i;
> +        for ( irq = 0; irq < 32; irq++ )
> +            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
> +
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLER + i * 4);
> +        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4);
> +
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVER + i * 4);
> +        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4);
> +    }
> +
> +    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
> +    gicv3_dist_wait_for_rwp();
> +
> +    /* Restore GICR (Redistributor) configuration */
> +    gicv3_enable_redist();
> +
> +    base = GICD_RDIST_SGI_BASE;
> +
> +    writel_relaxed(0xffffffff, base + GICR_ICENABLER0);
> +    gicv3_redist_wait_for_rwp();
> +
> +    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
> +        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
> +
> +    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
> +
> +    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
> +    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);

   ... and restore it here.


> +    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
> +

[snip]

