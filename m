Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B83CB6EFF
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184548.1506987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfo-00042m-47; Thu, 11 Dec 2025 18:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184548.1506987; Thu, 11 Dec 2025 18:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfn-0003zK-VJ; Thu, 11 Dec 2025 18:45:55 +0000
Received: by outflank-mailman (input) for mailman id 1184548;
 Thu, 11 Dec 2025 18:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfm-0003I9-3B
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e00d190-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:45:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6495c4577adso611014a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:51 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:50 -0800 (PST)
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
X-Inumbo-ID: 9e00d190-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478751; x=1766083551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhE7q8NSEMoDW1qyGPa35+oWlUcqnOapH/rPEjyoD/A=;
        b=nf0yLhwri1OPMOZn9ELvUFlnbFmIMgiunksCSKPETK4r4I94B58PvYoCYozM5mDOw2
         EgWVbsP50653DI03suGDI/RmMtZQrJLA8U8WdrFMpzthnYdNQkAp87Cv69IUYaSx2c1I
         wgGibAp2AS0403dgqdLg/Us+ATzj4ERiJDDncUNn9jyFfN8EHVOre6P9c8kiCgEYHhlZ
         B4mhbKeov254MWKfkGdONwHGwQPQNipr6Pk2PsWcaxK48wQSK7WsaFtLm5CpXTvheWXf
         rql+/4eKOTAEDWpiyrk50PPDMvf3eziWL0QhatF87EvmHaUh1Fq6q5HJ08iizDku3KFH
         fr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478751; x=1766083551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EhE7q8NSEMoDW1qyGPa35+oWlUcqnOapH/rPEjyoD/A=;
        b=F7EcjmRgdTvxdCfqUxJnvV2r27Pv2wtsgIXrPO96r61UYzS+Hsyp9DUduxIzpI1p1m
         aiOhm85M1a8weCA7uZZZNSSfOWhRPwW+3G+MVw2qkz6f+G/1sFQX1tF9qgB+YOUNC3RR
         uM/MPCkYqQ/ARnMGHqz4rIX8tTFkKajUTknyk46HLbCdDr3Wg+Q77Q5AetnEzgntZ1q8
         rLLjQ5bwbgZpbjkENm7X8sPgc9zoFJ8hQPlKkF/aGQneGAv76spcxWvScNpXfA4A6mQQ
         iPCcjOMtqc3mmHaP6V7l6HvjYyCOMmF11R2C3GgC3dDp9R159/O9vm5jlokN/NQU5uZ4
         6Q1Q==
X-Gm-Message-State: AOJu0YyYwpwEbQqYRpYzcg54PWU7DwbWlDlawvk+u3IAD6Q6cUA++2Q2
	AEb+wBi7OMgn38f9hDZCu/+J2+LCKGJJ1qDgSWBRI6wp7zZ+EeqESIMrGkYmKq9I
X-Gm-Gg: AY/fxX50tEYlxEvAJXt4oHTwLN88F0e+AG5QCzlgIKB+KpHCVGQdhO3x8erZWsg8v1T
	Sn8CQcd1h1ACKNGPJmPM8rzqFOn3qhv1HFc5+B2M3WqOTZ4c4YlHEl5aM2IslJanVJWU1hQwfN0
	lsU3ougqua5bZoK6cyOdP170TuOOH6Ndzj63/Ic5jhRxrJg+piw+w8Fh3djtj4Ds935te0T1YrL
	/1HUmLKWnC4auH3RvfVVCRtihYkhhXzvTe4AEeSYJch1yUJo/sKpZf9HbvNW4F+f2A6gOAVpqvF
	Cy2fSeR3e+3bW9M6JPLZscSp08DQoj5l0GrV2mRHcr1scOxuDnWJASUr7iDpsLKb0D0MsSKDZ7p
	HlixeboIMMVSgwF3l2CmOdCbhUvVsD0TOdxcObyshusZvDVaDtIcPdmz22jsFbZo96ji2D17BNg
	PzDnW3pQbAvyQ6cF9YDQDB0PL9SXZzCuO37puP5W/C
X-Google-Smtp-Source: AGHT+IGcxLBqr3Vz1ok6ptsy7e2VcUY46QzsnsOsCXMZoVS/cKgBMR9zbKpr6lkMP6pdgI2BkNLDvA==
X-Received: by 2002:a17:907:97d6:b0:b73:74d6:d360 with SMTP id a640c23a62f3a-b7ce8477b36mr771357466b.40.1765478750723;
        Thu, 11 Dec 2025 10:45:50 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Thu, 11 Dec 2025 20:43:27 +0200
Message-ID: <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V7:
- restore LPI regs on resume
- add timeout during redist disabling
- squash with suspend/resume handling for GICv3 eSPI registers
- drop ITS guard paths so suspend/resume always runs; switch missing ctx
  allocation to panic
- trim TODO comments; narrow redistributor storage to PPI icfgr
- keep distributor context allocation even without ITS; adjust resume
  to use GENMASK(31, 0) for clearing enables
- drop storage of the SGI configuration register, as SGIs are always
  edge-triggered
---
 xen/arch/arm/gic-v3-lpi.c              |   3 +
 xen/arch/arm/gic-v3.c                  | 319 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
 3 files changed, 320 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de5052e5cf..61a6e18303 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = gicv3_lpi_allocate_pendtable(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16..dc5e58066d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1067,12 +1067,12 @@ out:
     return res;
 }
 
-static void gicv3_hyp_disable(void)
+static void gicv3_hyp_enable(bool enable)
 {
     register_t hcr;
 
     hcr = READ_SYSREG(ICH_HCR_EL2);
-    hcr &= ~GICH_HCR_EN;
+    hcr = enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
     WRITE_SYSREG(hcr, ICH_HCR_EL2);
     isb();
 }
@@ -1179,7 +1179,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1915,6 +1915,311 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represent block of 32 IRQs */
+struct dist_irq_block {
+    uint32_t icfgr[2];
+    uint32_t ipriorityr[8];
+    uint64_t irouter[32];
+    uint32_t isactiver;
+    uint32_t isenabler;
+};
+
+struct redist_ctx {
+    uint32_t ctlr;
+    uint32_t icfgr; /* only PPIs stored */
+    uint32_t igroupr;
+    uint32_t ipriorityr[8];
+    uint32_t isactiver;
+    uint32_t isenabler;
+
+    uint64_t pendbase;
+    uint64_t propbase;
+};
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        struct dist_irq_block *irqs, *espi_irqs;
+    } dist;
+
+    /* have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx rdist;
+
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+        uint32_t sre_el2;
+        uint32_t grpen;
+    } cpu;
+};
+
+static struct gicv3_ctx gicv3_ctx;
+
+static void __init gicv3_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
+
+    /* The spec allows for systems without any SPIs */
+    if ( blocks > 1 )
+    {
+        gicv3_ctx.dist.irqs = xzalloc_array(struct dist_irq_block, blocks - 1);
+        if ( !gicv3_ctx.dist.irqs )
+            panic("Failed to allocate memory for GICv3 suspend context\n");
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    if ( !gic_number_espis() )
+        return;
+
+    blocks = gic_number_espis() / 32;
+    gicv3_ctx.dist.espi_irqs = xzalloc_array(struct dist_irq_block, blocks);
+    if ( !gicv3_ctx.dist.espi_irqs )
+        panic("Failed to allocate memory for GICv3 eSPI suspend context\n");
+#endif
+}
+
+static int gicv3_disable_redist(void)
+{
+    void __iomem* waker = GICD_RDIST_BASE + GICR_WAKER;
+    s_time_t deadline;
+
+    /*
+     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
+     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
+     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
+     *     register are RAZ/WI.
+     */
+    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
+        return 0;
+
+    deadline = NOW() + MILLISECS(1000);
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 )
+    {
+        if ( NOW() > deadline )
+        {
+            printk("GICv3: Timeout waiting for redistributor to sleep\n");
+            return -ETIMEDOUT;
+        }
+        cpu_relax();
+        udelay(10);
+    }
+
+    return 0;
+}
+
+#define GET_SPI_REG_OFFSET(name, is_espi) \
+    ((is_espi) ? GICD_##name##nE : GICD_##name)
+
+static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
+                                      unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < ARRAY_SIZE(irqs->ipriorityr); irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
+        irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    irqs->isactiver = readl_relaxed(base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    irqs->isenabler = readl_relaxed(base);
+}
+
+static void gicv3_restore_spi_irq_block(struct dist_irq_block *irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < ARRAY_SIZE(irqs->ipriorityr); irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    writel_relaxed(irqs->isenabler, base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    writel_relaxed(irqs->isactiver, base);
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i;
+    void __iomem *base;
+    int ret;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    gicv3_disable_interface();
+
+    ret = gicv3_disable_redist();
+    if ( ret )
+        return out_enable_iface;
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_SGI_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    /* Save priority on PPI and SGI interrupts */
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
+
+    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
+    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
+    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
+    rdist->icfgr     = readl_relaxed(base + GICR_ICFGR1);
+
+    rdist->propbase = readq_relaxed(base + GICR_PROPBASER);
+    rdist->pendbase = readq_relaxed(base + GICR_PENDBASER);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
+
+    return 0;
+
+ out_enable_iface:
+    gicv3_hyp_enable(true);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr, ICC_CTLR_EL1);
+    isb();
+
+    return ret;
+}
+
+static void gicv3_resume(void)
+{
+    int ret;
+    unsigned int i;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    writel_relaxed(0, GICD + GICD_CTLR);
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_restore_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    ret = gicv3_lpi_init_rdist(GICD_RDIST_BASE);
+    /*
+     * If LPIs are already enabled, assume firmware or the still-powered
+     * redistributor has valid PROPBASER/PENDBASER and skip reprogramming.
+     * Return -EBUSY so callers can ignore this case.
+     */
+    if ( ret && ret != -ENODEV && ret != -EBUSY )
+        panic("GICv3: Failed to re-initialize LPIs during resume\n");
+    else if ( ret == -EBUSY ) /* extra checks, just to be sure */
+    {
+        base = GICD_RDIST_BASE;
+        if ( readq_relaxed(base + GICR_PROPBASER) != rdist->propbase ||
+             readq_relaxed(base + GICR_PENDBASER) != rdist->pendbase )
+        {
+            panic("GICv3: LPIs already enabled with unexpected PROPBASER/PENDBASER during resume\n");
+        }
+    }
+
+    /* Restore GICR (Redistributor) configuration */
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor during resume\n");
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
+
+    gicv3_redist_wait_for_rwp();
+
+    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
+    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
+
+    gicv3_redist_wait_for_rwp();
+
+    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
+    isb();
+
+    /* Restore CPU interface (System registers) */
+    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    gicv3_hyp_init();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -1989,6 +2294,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2028,6 +2337,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index c373b94d19..992c8f9c2f 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -94,6 +94,7 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
-- 
2.43.0


