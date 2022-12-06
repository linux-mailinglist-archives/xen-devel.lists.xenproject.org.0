Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004AA644DD9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455558.713060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fKf-0002rC-JW; Tue, 06 Dec 2022 21:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455558.713060; Tue, 06 Dec 2022 21:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fKf-0002oY-G8; Tue, 06 Dec 2022 21:18:29 +0000
Received: by outflank-mailman (input) for mailman id 455558;
 Tue, 06 Dec 2022 21:18:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2fKd-0002oO-O7
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:18:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fKd-0002iI-33; Tue, 06 Dec 2022 21:18:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fKc-0002PS-Sh; Tue, 06 Dec 2022 21:18:26 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=RxCEfGIeF8njfvjtcwmA81V/s7qbcjJvJOOevnk4Qsc=; b=ZTFy+233vrczlq5uSEQEzFRMGr
	iL9+lrqfiBmZp4uomM11PKOpg2qTj0/N2QkwFZFiGcjbzFsTJg79e7AjhN0Fdi1uHPCxpfGI6OprP
	TeLKPAhrZAYb86Xoq6h+aPYp7OEm50oSPYDpeTODtfxi6FfRGYHyaiuILRylWZxvKeCI=;
Message-ID: <7b686c56-b90d-5acd-2622-08aed2d28173@xen.org>
Date: Tue, 6 Dec 2022 21:18:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <0f1bebffe29c96c5b66c83b62b0c67752114c53a.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/19] xen/arm: Implement GIC suspend/resume functions
 (gicv2 only)
In-Reply-To: <0f1bebffe29c96c5b66c83b62b0c67752114c53a.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
> Tested on Xilinx Ultrascale+ MPSoC with (and without) powering down
> the GIC.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>

Your signed-off-by is missing.

> ---
>   xen/arch/arm/gic-v2.c     | 138 +++++++++++++++++++++++++++++++++++++-
>   xen/arch/arm/gic.c        |  27 ++++++++
>   xen/include/asm-arm/gic.h |   8 +++
>   3 files changed, 172 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b2adc8ec9a..b077b66d92 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -123,6 +123,23 @@ static DEFINE_PER_CPU(u8, gic_cpu_id);
>   /* Maximum cpu interface per GIC */
>   #define NR_GIC_CPU_IF 8
>   
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
> +    uint32_t gicc_ctlr;
> +    uint32_t gicc_pmr;
> +    uint32_t gicc_bpr;
> +    /* GICD context */
> +    uint32_t gicd_ctlr;
> +    uint32_t *gicd_isenabler;
> +    uint32_t *gicd_isactiver;
> +    uint32_t *gicd_ipriorityr;
> +    uint32_t *gicd_itargetsr;
> +    uint32_t *gicd_icfgr;
> +};
> +
> +static struct gicv2_context gicv2_context;
> +
>   static inline void writeb_gicd(uint8_t val, unsigned int offset)
>   {
>       writeb_relaxed(val, gicv2.map_dbase + offset);
> @@ -1251,6 +1268,40 @@ static void __init gicv2_acpi_init(void)
>   static void __init gicv2_acpi_init(void) { }
>   #endif
>   
> +static int gicv2_alloc_context(struct gicv2_context *gc)
> +{
> +    uint32_t n = gicv2_info.nr_lines;
> +
> +    gc->gicd_isenabler = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isenabler )
> +        goto err_free;
> +
> +    gc->gicd_isactiver = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
> +    if ( !gc->gicd_isactiver )
> +        goto err_free;
> +
> +    gc->gicd_itargetsr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_itargetsr )
> +        goto err_free;
> +
> +    gc->gicd_ipriorityr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
> +    if ( !gc->gicd_ipriorityr )
> +        goto err_free;
> +
> +    gc->gicd_icfgr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
> +    if ( !gc->gicd_icfgr )
> +        goto err_free;
> +
> +    return 0;
> +err_free:
> +    xfree(gc->gicd_icfgr);
> +    xfree(gc->gicd_ipriorityr);
> +    xfree(gc->gicd_itargetsr);
> +    xfree(gc->gicd_isactiver);
> +    xfree(gc->gicd_isenabler);

Please add a newline.

> +    return -ENOMEM;
> +}
> +
>   static int __init gicv2_init(void)
>   {
>       uint32_t aliased_offset = 0;
> @@ -1318,7 +1369,8 @@ static int __init gicv2_init(void)
>   
>       spin_unlock(&gicv2.lock);
>   
> -    return 0;
> +    /* Allocate memory to be used for saving GIC context during the suspend */
> +    return gicv2_alloc_context(&gicv2_context);
As I pointed out in the previous version, suspend/resume is not going to 
be widely used. So I don't think we should prevent booting if we can't 
allocate the memory.

In addition to that, I think we should consider to have:
   * a command line option to avoid wasting memory if the feature is not 
going to be used
   * ifdef the suspend/resume code to allow an integrator to compile out 
any related code.

>   }
>   
>   static void gicv2_do_LPI(unsigned int lpi)
> @@ -1327,6 +1379,88 @@ static void gicv2_do_LPI(unsigned int lpi)
>       BUG();
>   }
>   
> +static int gicv2_suspend(void)
> +{
> +    int i;

This should be unsigned int.

> +
> +    ASSERT(gicv2_context.gicd_isenabler);
> +    ASSERT(gicv2_context.gicd_isactiver);
> +    ASSERT(gicv2_context.gicd_ipriorityr);
> +    ASSERT(gicv2_context.gicd_itargetsr);
> +    ASSERT(gicv2_context.gicd_icfgr);
> +
> +    /* Save GICC configuration */
> +    gicv2_context.gicc_ctlr = readl_gicc(GICC_CTLR);
> +    gicv2_context.gicc_pmr = readl_gicc(GICC_PMR);
> +    gicv2_context.gicc_bpr = readl_gicc(GICC_BPR);
> +
> +    /* Save GICD configuration */
> +    gicv2_context.gicd_ctlr = readl_gicd(GICD_CTLR);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +        gicv2_context.gicd_isenabler[i] = readl_gicd(GICD_ISENABLER + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +        gicv2_context.gicd_isactiver[i] = readl_gicd(GICD_ISACTIVER + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        gicv2_context.gicd_ipriorityr[i] = readl_gicd(GICD_IPRIORITYR + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        gicv2_context.gicd_itargetsr[i] = readl_gicd(GICD_ITARGETSR + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        gicv2_context.gicd_icfgr[i] = readl_gicd(GICD_ICFGR + i * 4);
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    int i;

Ditto.

> +
> +    ASSERT(gicv2_context.gicd_isenabler);
> +    ASSERT(gicv2_context.gicd_isactiver);
> +    ASSERT(gicv2_context.gicd_ipriorityr);
> +    ASSERT(gicv2_context.gicd_itargetsr);
> +    ASSERT(gicv2_context.gicd_icfgr);
> +
> +    /* Disable CPU interface and distributor */
> +    writel_gicc(0, GICC_CTLR);
> +    writel_gicd(0, GICD_CTLR);

We don't need those two lines during boot. So why do you need them 
during resume?

> +
> +    /* Restore GICD configuration */
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
> +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i * 4);
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> +
> +    /* Make sure all registers are restored and enable distributor */

The first part reads like there is a missing barrier.

> +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
> +
> +    /* Restore GIC CPU interface configuration */
> +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> +
> +    /* Enable GIC CPU interface */
> +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI,
> +                GICC_CTLR);
> +}
> +
>   const static struct gic_hw_operations gicv2_ops = {
>       .info                = &gicv2_info,
>       .init                = gicv2_init,
> @@ -1361,6 +1495,8 @@ const static struct gic_hw_operations gicv2_ops = {
>       .map_hwdom_extra_mappings = gicv2_map_hwdown_extra_mappings,
>       .iomem_deny_access   = gicv2_iomem_deny_access,
>       .do_LPI              = gicv2_do_LPI,
> +    .suspend             = gicv2_suspend,
> +    .resume              = gicv2_resume,
>   };
>   
>   /* Set up the GIC */
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 3b0331b538..e9feb1fd3b 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -467,6 +467,33 @@ int gic_iomem_deny_access(const struct domain *d)
>       return gic_hw_ops->iomem_deny_access(d);
>   }
>   
> +int gic_suspend(void)
> +{
> +    /* Must be called by boot CPU#0 with interrupts disabled */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +
> +    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
> +        return -ENOSYS;
> +
> +    gic_hw_ops->suspend();
> +
> +    return 0;
> +}
> +
> +void gic_resume(void)
> +{
> +    /*
> +     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
> +     * has returned successfully.
> +     */
> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +    ASSERT(gic_hw_ops->resume);
> +
> +    gic_hw_ops->resume();
> +}
> +
>   static int cpu_gic_callback(struct notifier_block *nfb,
>                               unsigned long action,
>                               void *hcpu)
> diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
> index c7f0c343d1..113e39460d 100644
> --- a/xen/include/asm-arm/gic.h
> +++ b/xen/include/asm-arm/gic.h
> @@ -275,6 +275,10 @@ extern int gicv_setup(struct domain *d);
>   extern void gic_save_state(struct vcpu *v);
>   extern void gic_restore_state(struct vcpu *v);
>   
> +/* Suspend/resume */
> +extern int gic_suspend(void);
> +extern void gic_resume(void);
> +
>   /* SGI (AKA IPIs) */
>   enum gic_sgi {
>       GIC_SGI_EVENT_CHECK,
> @@ -390,6 +394,10 @@ struct gic_hw_operations {
>       int (*iomem_deny_access)(const struct domain *d);
>       /* Handle LPIs, which require special handling */
>       void (*do_LPI)(unsigned int lpi);
> +    /* Save GIC configuration due to the system suspend */
> +    int (*suspend)(void);
> +    /* Restore GIC configuration due to the system resume */
> +    void (*resume)(void);
>   };
>   
>   extern const struct gic_hw_operations *gic_hw_ops;

Cheers,

-- 
Julien Grall

