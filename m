Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DBEA4F99D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901878.1309885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknU-0000lT-5m; Wed, 05 Mar 2025 09:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901878.1309885; Wed, 05 Mar 2025 09:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknT-0000cg-OL; Wed, 05 Mar 2025 09:12:11 +0000
Received: by outflank-mailman (input) for mailman id 901878;
 Wed, 05 Mar 2025 09:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknR-0006ev-0q
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:09 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea07c654-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:08 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5496bc2e261so3041218e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:08 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:06 -0800 (PST)
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
X-Inumbo-ID: ea07c654-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165928; x=1741770728; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/8kyy/e+kyBcwvFFlXXM+fJPKdq7qtfTXyKQk0fSJ8=;
        b=WunxoxaipK6FYHudkuN7MbHOUXK6wlUt5o6uDuT7FFSJLOUc5JgDrJTkaebMyCgNGS
         f0nOMEqfab5RQrZYco9iryeHABzqJ2LFkUDIjPE69ihKgE6cb1ja2Z56WwXxE0jyiOCz
         G3o+WKKsIbQI2jXtwsbpSoGLXWe1FvYW8PN/+/4DNyONQV5JGNuotJvd9TpovW8fvcKF
         zbeLBHOfPv0gLuJH+H0xRdo4JKNUrx5m0mpc+7gjedNOt1LUqshlbDnBVKCBPYDT0FhQ
         sWLS9kakWX7D12/gqYGA6+flP4fgNxnP/P+hMWiuFxno3f2PfHJlHl5RP2r1d/HetYTq
         5XoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165928; x=1741770728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/8kyy/e+kyBcwvFFlXXM+fJPKdq7qtfTXyKQk0fSJ8=;
        b=imo+zg6bIYWKPewl9mp2miXO3QLY3QOV7F2sC8Keqy4/FJFZRQ98VFB3JTXtd9NqHL
         lxd/4kVhCCjGEj7AA7synb7dl+D0RimcyCQcXoFSQof02JD2CLaVtbch0dzxydIic37U
         J5Ql+4AosHYKCDcCG39xHbjCCt6qj9fwoIcn+tBUHyOAkrUsu1ijavjj0KLxTfC8aeoq
         w+ZemMi2nwnsIEmJGGS6yx7uZ0kssZg0pvqHYB/MVBzLQNS+/dOTfZuU8Lp0gYheCvBD
         zWwo61kgslWa6/RSu4QXl6K6PSKS3lxeW9apm0IWVGXUybtS2CMwfmtNFvT/ETFNl3Tb
         vscw==
X-Gm-Message-State: AOJu0YykOebJKau0OxbVWuKvXwbi95QyTP50v7TYKX3R2jCyWf70NEom
	FG3GJqHOQWVWNcpktgTTJ6rZCc/iUPxNzL2Ng2eyV5tqwLat1Vk1/ybBFI7E
X-Gm-Gg: ASbGncvYD8rhZtTQyJ0dzikWRQV52xes5yi3nr0rGZnnHHOOe+9emG+9lSupwGYMGf1
	wmcLKTJ1jWTB1empylWUcIVkg462Mf7+5C2mIR60AN/xQl/2RB9lXxd7qGqMDqU4pzPykU0fV26
	DhJKZQZ2bZxiXl3TeWHU5Xw5V7j6m2JrdxBpuoAjU4X1WIIX1Pl46TBQcsb/evbllQHYKGpPq5n
	6X6goKKXzEo19+dbn/DVicXC9shcq3Br09xmDi2qSIyylq4pessB3FfADy1yfju6WclHXFsUxH+
	OscfWwZZZJOh3IF/EyJHIVUt+KdNxqAetTajk7Zp6YjEs9WgkA==
X-Google-Smtp-Source: AGHT+IFW+lziWbHd1pIz+0JjTnkeWoKJRDeU1VuvnilEd64flrtnOsLy0B3LNUJx4k/lQIaKCBhqMQ==
X-Received: by 2002:a05:6512:1596:b0:549:74a7:12d6 with SMTP id 2adb3069b0e04-5497d357da3mr752284e87.26.1741165927466;
        Wed, 05 Mar 2025 01:12:07 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 10/16] xen/arm: Implement GIC suspend/resume functions (gicv2 only)
Date: Wed,  5 Mar 2025 11:11:18 +0200
Message-ID: <c9f441e6668c8ee25cdcce5ba705b39637a2f791.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.
Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.
Tested on Xilinx Ultrascale+ MPSoC with (and without) powering down
the GIC.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
changes in v3:
- drop asserts, return error code instead
- cover the code with CONFIG_SYSTEM_SUSPEND

changes in v2:
- minor fixes after review
---
 xen/arch/arm/gic-v2.c          | 142 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++++
 xen/arch/arm/include/asm/gic.h |  12 +++
 3 files changed, 183 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 02043c0d4b..868e1a5026 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1098,6 +1098,139 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    uint32_t gicc_ctlr;
+    uint32_t gicc_pmr;
+    uint32_t gicc_bpr;
+    /* GICD context */
+    uint32_t gicd_ctlr;
+    uint32_t *gicd_isenabler;
+    uint32_t *gicd_isactiver;
+    uint32_t *gicd_ipriorityr;
+    uint32_t *gicd_itargetsr;
+    uint32_t *gicd_icfgr;
+};
+
+static struct gicv2_context gicv2_context;
+
+static int gicv2_suspend(void)
+{
+    unsigned int i;
+
+    if ( !gicv2_context.gicd_isenabler )
+        return -ENOMEM;
+
+    /* Save GICC configuration */
+    gicv2_context.gicc_ctlr = readl_gicc(GICC_CTLR);
+    gicv2_context.gicc_pmr = readl_gicc(GICC_PMR);
+    gicv2_context.gicc_bpr = readl_gicc(GICC_BPR);
+
+    /* Save GICD configuration */
+    gicv2_context.gicd_ctlr = readl_gicd(GICD_CTLR);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
+        gicv2_context.gicd_isenabler[i] = readl_gicd(GICD_ISENABLER + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
+        gicv2_context.gicd_isactiver[i] = readl_gicd(GICD_ISACTIVER + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        gicv2_context.gicd_ipriorityr[i] = readl_gicd(GICD_IPRIORITYR + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        gicv2_context.gicd_itargetsr[i] = readl_gicd(GICD_ITARGETSR + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
+        gicv2_context.gicd_icfgr[i] = readl_gicd(GICD_ICFGR + i * 4);
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i;
+
+    if ( !gicv2_context.gicd_isenabler )
+        return;
+
+    /* Disable CPU interface and distributor */
+    writel_gicc(0, GICC_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    /* Restore GICD configuration */
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
+        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
+        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i * 4);
+    }
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ ) {
+        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
+        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i * 4);
+    }
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i * 4);
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 16); i++ )
+        writel_gicd(gicv2_context.gicd_icfgr[i], GICD_ICFGR + i * 4);
+
+    /* Make sure all registers are restored and enable distributor */
+    writel_gicd(gicv2_context.gicd_ctlr | GICD_CTL_ENABLE, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gicv2_context.gicc_pmr, GICC_PMR);
+    writel_gicc(gicv2_context.gicc_bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gicv2_context.gicc_ctlr | GICC_CTL_ENABLE | GICC_CTL_EOI,
+                GICC_CTLR);
+}
+
+static void gicv2_alloc_context(struct gicv2_context *gc)
+{
+    uint32_t n = gicv2_info.nr_lines;
+
+    gc->gicd_isenabler = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
+    if ( !gc->gicd_isenabler )
+        goto err_free;
+
+    gc->gicd_isactiver = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 32));
+    if ( !gc->gicd_isactiver )
+        goto err_free;
+
+    gc->gicd_itargetsr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
+    if ( !gc->gicd_itargetsr )
+        goto err_free;
+
+    gc->gicd_ipriorityr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 4));
+    if ( !gc->gicd_ipriorityr )
+        goto err_free;
+
+    gc->gicd_icfgr = xzalloc_array(uint32_t, DIV_ROUND_UP(n, 16));
+    if ( !gc->gicd_icfgr )
+        goto err_free;
+
+    return;
+
+ err_free:
+    xfree(gc->gicd_icfgr);
+    xfree(gc->gicd_ipriorityr);
+    xfree(gc->gicd_itargetsr);
+    xfree(gc->gicd_isactiver);
+    xfree(gc->gicd_isenabler);
+
+    memset(gc, 0, sizeof(*gc));
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1302,6 +1435,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context(&gicv2_context);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1345,6 +1483,10 @@ const static struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index acf61a4de3..1c974cf0f5 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -422,6 +422,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 541f0eeb80..a706303008 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -280,6 +280,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -395,6 +401,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.43.0


