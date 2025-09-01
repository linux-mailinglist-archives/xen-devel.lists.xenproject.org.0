Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA1B3F0DB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105399.1456341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjN-0005bJ-Jr; Mon, 01 Sep 2025 22:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105399.1456341; Mon, 01 Sep 2025 22:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjN-0005Yj-GJ; Mon, 01 Sep 2025 22:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1105399;
 Mon, 01 Sep 2025 22:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjL-00055o-KS
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:27 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7647d278-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:25 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f6186cc17so3747152e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:25 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:24 -0700 (PDT)
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
X-Inumbo-ID: 7647d278-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764625; x=1757369425; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL9EWkohjo8a/Dn92rOcdmsDJxHtlTsb7OJVk0QSUJM=;
        b=DuO4koIctpb21IVOdjzP5KU4+SUc96C9z7oZb+Yd6UASzoYMx38LPEb6LGRmO9Rc+r
         qtRxihrKEthqPb1Z+gHeFN4TGv0xKsqVcBHTPOjKge9LAn49BEl7HQBmfXHf+8L7fIWb
         LT7vtUIJl4R0c/POeFxMIFamgohmyuL4UJLjH2c+pndAJbfM3OAtTAlUaTgI+18pnSZQ
         VYxhhCcRVuhM3rSvqYNsATa7WKg1es8Jwqa82jvGlw5YsLXvakZw153TRRDdZosD9nEl
         VTQ8/0rQHBrj54rOU+gqM0uUZkIlUtyUAceVrH/KAhImhXfa22FAGyTD640pRHhqJ7xL
         P8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764625; x=1757369425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GL9EWkohjo8a/Dn92rOcdmsDJxHtlTsb7OJVk0QSUJM=;
        b=aD4YICYeLw2AzxsdloPLu0USEFit6vhd2XkVV/J5mRThHJqKfRFpD61Rziwz5CA8GW
         3dycvD/gd485I/hvKciO+qQWHDYb8HTC1AJPFjOdb2UBiw01OlK6gwYXxwZ/xTb2GaYC
         Gzr++xialMPFXy1FC+zcCp4wyy2AIGxtXkGmeO1SaACPMG6gMlYh6rXw/xiPCHHt4hLb
         UTouSqDfErWVGnyhvifdCU7sEEJK+oWxvP9+SuJgrZ8sa4WiNMz6hwT/E2MqbAGPcTYe
         WiyIRBNqE0NZctQzOFFihh6Ovp0ml/XsLDDwMTdIda13odjvc9m0wMdd1noZFkqJSKyo
         IHIg==
X-Gm-Message-State: AOJu0YwfU8H1Z5YxHVrxNvAXv5gJxs06zyypp7M9wtKC/yZPXUn+/g/o
	C0JWH/JmZTvnr2F+4ThFuIhNHtvwSmhRgNRUWdUMn+FRJniKBVybAGHlkuYjqsP8
X-Gm-Gg: ASbGncsPEIXA6oKR75+8PM0bPqL1jHtjuHDexZbFdTsIeHezKPeuydGZoBovoGVURfb
	fAhN77Ru7ZBB0bBhlTpiSzrgdXRoueiWqB8gpToczsc40pO0JNTf3PbjGVtW++ayiTj84x8gHbI
	U8UJma2ZroFnm5a2ftWs20jXsyKrABgM0cgb3a8QGBWzzEyC63Gt926oIJz4UdiLWpd2VUUylJ3
	ollMI+EDFbxwpBbGzWTnpaTuGXoJfbZRUwp5tkrqv1GJx0/+MWCblb4O/PdeT2/32aT1XCY2MEw
	8aIuhW2Cefw8d6UyeFpJIgHdoneXnTZL0xuxfOJCuNgW1pHmn3OadXTzbp+U8ObAPuVmaoKp2DZ
	zMJS5F++kYm9S3u7G3Q/Yy+RWH4tpd85IIiTJq4AvvVBNAwIxU70aFTKlG6mEKMFTTgqkcbKu
X-Google-Smtp-Source: AGHT+IGHO6vPuMNSviLACKBC72hu/IH8PKVE6FIUQK3U79KxMfeWob9GsNWWKppkqNO3yp5F/sT2uA==
X-Received: by 2002:a05:6512:4608:b0:55f:3996:4f82 with SMTP id 2adb3069b0e04-55f708a2cb5mr2329558e87.1.1756764624937;
        Mon, 01 Sep 2025 15:10:24 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 03/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Tue,  2 Sep 2025 01:10:07 +0300
Message-ID: <dc98a547ac7f746b21b47e826edf58fe9003c576.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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
Changes in V6:
- Drop gicv3_save/restore_state since it is already handled during vCPU
  context switch.
- The comment about systems without SPIs is clarified for readability.
- Error and warning messages related to suspend context allocation are unified
  and now use printk() with XENLOG_ERR for consistency.
- The check for suspend context allocation in gicv3_resume() is removed,
  as it is handled earlier in the suspend path.
- The loop for saving and restoring PPI/SGI priorities is corrected to use
  the proper increment.
- The gicv3_suspend() function now prints an explicit error if ITS suspend
  support is not implemented, and returns ENOSYS in this case.
- The GICD_CTLR_DS bit definition is added to gic_v3_defs.h.
- The comment for GICR_WAKER access is expanded to reference the relevant
  ARM specification section and clarify the RAZ/WI behavior for Non-secure
  accesses.
- Cleanup active and enable registers before restoring.
---
 xen/arch/arm/gic-v3-lpi.c              |   3 +
 xen/arch/arm/gic-v3.c                  | 235 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
 3 files changed, 239 insertions(+)

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
index cd3e1acf79..9f1be7e905 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1776,6 +1776,233 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        /*
+         * This struct represent block of 32 IRQs
+         * TODO: store extended SPI configuration (GICv3.1+)
+         */
+        struct irq_regs {
+            uint32_t icfgr[2];
+            uint32_t ipriorityr[8];
+            uint64_t irouter[32];
+            uint32_t isactiver;
+            uint32_t isenabler;
+        } *irqs;
+    } dist;
+
+    /* have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx {
+        uint32_t ctlr;
+        /* TODO: handle case when we have more than 16 PPIs (GICv3.1+) */
+        uint32_t icfgr[2];
+        uint32_t igroupr;
+        uint32_t ipriorityr[8];
+        uint32_t isactiver;
+        uint32_t isenabler;
+    } rdist;
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
+    /* We don't have ITS support for suspend */
+    if ( gicv3_its_host_has_its() )
+        return;
+
+    /* The spec allows for systems without any SPIs */
+    if ( blocks > 1 )
+    {
+        gicv3_ctx.dist.irqs = xzalloc_array(typeof(*gicv3_ctx.dist.irqs),
+                                            blocks - 1);
+        if ( !gicv3_ctx.dist.irqs )
+            printk(XENLOG_ERR "Failed to allocate memory for GICv3 suspend context\n");
+    }
+}
+
+static void gicv3_disable_redist(void)
+{
+    void __iomem* waker = GICD_RDIST_BASE + GICR_WAKER;
+
+    /*
+     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
+     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
+     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
+     *     register are RAZ/WI.
+     */
+    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
+        return;
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 );
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i;
+    void __iomem *base;
+    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
+
+    /* TODO: implement support for ITS */
+    if ( gicv3_its_host_has_its() )
+    {
+        printk(XENLOG_ERR "GICv3: ITS suspend support is not implemented\n");
+        return -ENOSYS;
+    }
+
+    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS )
+    {
+        printk(XENLOG_ERR "GICv3: suspend context is not allocated!\n");
+        return -ENOMEM;
+    }
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    gicv3_disable_interface();
+    gicv3_disable_redist();
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
+    rdist->icfgr[0]  = readl_relaxed(base + GICR_ICFGR0);
+    rdist->icfgr[1]  = readl_relaxed(base + GICR_ICFGR1);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
+        unsigned int irq;
+
+        base = GICD + GICD_ICFGR + 8 * i;
+        irqs->icfgr[0] = readl_relaxed(base);
+        irqs->icfgr[1] = readl_relaxed(base + 4);
+
+        base = GICD + GICD_IPRIORITYR + 32 * i;
+        for ( irq = 0; irq < 8; irq++ )
+            irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+        base = GICD + GICD_IROUTER + 32 * i;
+        for ( irq = 0; irq < 32; irq++ )
+            irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+        irqs->isactiver = readl_relaxed(GICD + GICD_ISACTIVER + 4 * i);
+        irqs->isenabler = readl_relaxed(GICD + GICD_ISENABLER + 4 * i);
+    }
+
+    return 0;
+}
+
+static void gicv3_resume(void)
+{
+    unsigned int i;
+    void __iomem *base;
+    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
+
+    writel_relaxed(0, GICD + GICD_CTLR);
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
+        unsigned int irq;
+
+        base = GICD + GICD_ICFGR + 8 * i;
+        writel_relaxed(irqs->icfgr[0], base);
+        writel_relaxed(irqs->icfgr[1], base + 4);
+
+        base = GICD + GICD_IPRIORITYR + 32 * i;
+        for ( irq = 0; irq < 8; irq++ )
+            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+
+        base = GICD + GICD_IROUTER + 32 * i;
+        for ( irq = 0; irq < 32; irq++ )
+            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLER + i * 4);
+        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4);
+
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVER + i * 4);
+        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4);
+    }
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /* Restore GICR (Redistributor) configuration */
+    gicv3_enable_redist();
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(0xffffffff, base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+
+    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);
+    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
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
@@ -1850,6 +2077,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -1889,6 +2120,10 @@ static const struct gic_hw_operations gicv3_ops = {
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
index 2af093e774..7e86309acb 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -56,6 +56,7 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
-- 
2.48.1


