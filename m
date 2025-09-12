Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0FB55A2D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 01:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122797.1466292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxDDq-00014J-TF; Fri, 12 Sep 2025 23:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122797.1466292; Fri, 12 Sep 2025 23:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxDDq-00011B-PI; Fri, 12 Sep 2025 23:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1122797;
 Fri, 12 Sep 2025 23:30:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxDDp-000115-B5
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 23:30:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxDDo-006gHx-1t;
 Fri, 12 Sep 2025 23:30:28 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxDDo-006HDj-2C;
 Fri, 12 Sep 2025 23:30:28 +0000
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
	bh=mx/IgOPXrMzMO910AY8EMCxcgVjkUkGwXy0BjCfWsN8=; b=O8GhyecqpC1He5HfRJrMXmGINi
	zi+kVxlpU41Xt5E7kKs6Uc4q47etdXOFu8XyqslBX2stmRcdH1oRcng27rj4btH+WzNjY5XOxqjGX
	dXGtlWOh7gxv2nOJELERSU93B+xgDlRLD2Vwo3jqlaWX+9iDZdhcBhPl30PttewY0V8Q=;
Message-ID: <a3bf4862-b32b-4918-a924-b437f0f015cd@xen.org>
Date: Sat, 13 Sep 2025 00:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 01/09/2025 23:10, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> System suspend may lead to a state where GIC would be powered down.
> Therefore, Xen should save/restore the context of GIC on suspend/resume.
> 
> Note that the context consists of states of registers which are
> controlled by the hypervisor. Other GIC registers which are accessible
> by guests are saved/restored on context switch.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v6:
> - drop extra func/line printing from dprintk
> - drop checking context allocation from resume handler
> - merge some loops where it is possible
> 
> Changes in v4:
>    - Add error logging for allocation failures
> 
> Changes in v3:
>    - Drop asserts and return error codes instead.
>    - Wrap code with CONFIG_SYSTEM_SUSPEND.
> 
> Changes in v2:
>    - Minor fixes after review.
> ---
>   xen/arch/arm/gic-v2.c          | 143 +++++++++++++++++++++++++++++++++
>   xen/arch/arm/gic.c             |  29 +++++++
>   xen/arch/arm/include/asm/gic.h |  12 +++
>   3 files changed, 184 insertions(+)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d0..6373599e69 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1098,6 +1098,140 @@ static int gicv2_iomem_deny_access(struct domain *d)
>       return iomem_deny_access(d, mfn, mfn + nr);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +/* GICv2 registers to be saved/restored on system suspend/resume */
> +struct gicv2_context {
> +    /* GICC context */
> +    uint32_t gicc_ctlr;
> +    uint32_t gicc_pmr;
> +    uint32_t gicc_bpr;
> +    /* GICD context */
> +    uint32_t gicd_ctlr;

I don't quite follow why all the registers above needs to be 
saved/restored. Is it just convenience because it is too complicated to 
recreate the value?

> +    uint32_t *gicd_isenabler;
> +    uint32_t *gicd_isactiver;
> +    uint32_t *gicd_ipriorityr;
> +    uint32_t *gicd_itargetsr;
> +    uint32_t *gicd_icfgr;
> +};> +
> +static struct gicv2_context gicv2_context;
> +
> +static int gicv2_suspend(void)
> +{
> +    unsigned int i;
> +
> +    if ( !gicv2_context.gicd_isenabler )
> +    {
> +        dprintk(XENLOG_WARNING, "GICv2 suspend context not allocated!\n");
> +        return -ENOMEM;
> +    }
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
> +    {
> +        gicv2_context.gicd_isenabler[i] = readl_gicd(GICD_ISENABLER + i * 4);
> +        gicv2_context.gicd_isactiver[i] = readl_gicd(GICD_ISACTIVER + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +    {
> +        gicv2_context.gicd_ipriorityr[i] = readl_gicd(GICD_IPRIORITYR + i * 4);
> +        gicv2_context.gicd_itargetsr[i] = readl_gicd(GICD_ITARGETSR + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        gicv2_context.gicd_icfgr[i] = readl_gicd(GICD_ICFGR + i * 4);
> +
> +    return 0;
> +}
> +
> +static void gicv2_resume(void)
> +{
> +    unsigned int i;
> +
 > +    gicv2_cpu_disable();> +    /* Disable distributor */
> +    writel_gicd(0, GICD_CTLR);
> +
> +    /* Restore GICD configuration */
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
> +    {
> +        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i * 4);
> +
> +        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
> +        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
> +    {
> +        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + i * 4);
> +        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i * 4);
> +    }
> +
> +    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
> +        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
> +
> +    /* Make sure all registers are restored and enable distributor */
> +    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);

Why are we forcing CTL_ENABLE? Surely it should have been set and if 
not, then why is it fine to override it?

> +
> +    /* Restore GIC CPU interface configuration */
> +    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
> +    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
> +
> +    /* Enable GIC CPU interface */
> +    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI,
> +                GICC_CTLR);

Same question here for both ENABLE and EOI.

> +}
> +
> +static void gicv2_alloc_context(struct gicv2_context *gc)

I am a bit surprised this is not returning an error? Why is it ok to 
ignore the error and continue? At least for now, if someone enable 
CONFIG_SYSTEM_SUSPEND, they would likely want the feature. So it would 
be better to crash early.

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

I am wondering if we are really saving that much by allocating each 
array separately? It would simply the code if we fix the array to 
support up to 1024 interrupts so we allocate a single structure.

 > +> +    return;
> +
> + err_free:
> +    printk(XENLOG_ERR "Failed to allocate memory for GICv2 suspend context\n");
> +> +    xfree(gc->gicd_icfgr);
> +    xfree(gc->gicd_ipriorityr);
> +    xfree(gc->gicd_itargetsr);
> +    xfree(gc->gicd_isactiver);
> +    xfree(gc->gicd_isenabler);

NIT: If you use XFREE(), then you don't need the memset below.

> +
> +    memset(gc, 0, sizeof(*gc));
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   #ifdef CONFIG_ACPI
>   static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
>   {
> @@ -1302,6 +1436,11 @@ static int __init gicv2_init(void)
>   
>       spin_unlock(&gicv2.lock);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Allocate memory to be used for saving GIC context during the suspend */
> +    gicv2_alloc_context(&gicv2_context);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>       return 0;
>   }
>   
> @@ -1345,6 +1484,10 @@ static const struct gic_hw_operations gicv2_ops = {
>       .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
>       .iomem_deny_access   = gicv2_iomem_deny_access,
>       .do_LPI              = gicv2_do_LPI,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend             = gicv2_suspend,
> +    .resume              = gicv2_resume,
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>   };
>   
>   /* Set up the GIC */
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index e80fe0ca24..a018bd7715 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -425,6 +425,35 @@ int gic_iomem_deny_access(struct domain *d)
>       return gic_hw_ops->iomem_deny_access(d);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +int gic_suspend(void)
> +{
> +    /* Must be called by boot CPU#0 with interrupts disabled */

What would prevent us to suspend from another CPU?

> +    ASSERT(!local_irq_is_enabled());
> +    ASSERT(!smp_processor_id());
> +
> +    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
> +        return -ENOSYS;
> +
> +    return gic_hw_ops->suspend();
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
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   static int cpu_gic_callback(struct notifier_block *nfb,
>                               unsigned long action,
>                               void *hcpu)
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index 541f0eeb80..a706303008 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -280,6 +280,12 @@ extern int gicv_setup(struct domain *d);
>   extern void gic_save_state(struct vcpu *v);
>   extern void gic_restore_state(struct vcpu *v);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/* Suspend/resume */
> +extern int gic_suspend(void);
> +extern void gic_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   /* SGI (AKA IPIs) */
>   enum gic_sgi {
>       GIC_SGI_EVENT_CHECK,
> @@ -395,6 +401,12 @@ struct gic_hw_operations {
>       int (*iomem_deny_access)(struct domain *d);
>       /* Handle LPIs, which require special handling */
>       void (*do_LPI)(unsigned int lpi);
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    /* Save GIC configuration due to the system suspend */
> +    int (*suspend)(void);
> +    /* Restore GIC configuration due to the system resume */
> +    void (*resume)(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
>   };
>   
>   extern const struct gic_hw_operations *gic_hw_ops;

Cheers,

-- 
Julien Grall


