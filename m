Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDCB216C1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077945.1438968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRu-000677-G6; Mon, 11 Aug 2025 20:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077945.1438968; Mon, 11 Aug 2025 20:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRu-00065P-DC; Mon, 11 Aug 2025 20:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1077945;
 Mon, 11 Aug 2025 20:48:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRt-00063z-8g
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:53 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fa957c-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:48:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af66f444488so681718366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:51 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:49 -0700 (PDT)
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
X-Inumbo-ID: 95fa957c-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945330; x=1755550130; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf3vC/bMLxsK+qQIEq63MqPOkecni+X3pTICciqQJuw=;
        b=OlN1c0VwLF7hxXz4fD6XS4+JI+erNwONBy1g1LW22l7j4/87QIS+XlCDbjla1rVvKh
         Y7iqkxgXrTkvwKNGjFeVOTjmtyBPn56+d18/yYYEDA/7R/r2LE6J+LsiYpNvOt27t1A1
         +0mjuVYO22aOju+KscwFgAzcYmSnc99EljxyOuK7xSCq5mHyiVQg0bKFTBMbX9pkM1QU
         ULzQrWqqQsDpO3fg+VhSm6TRL19lCX7ECDTMZ8TuTinzjX6DSM6zpzXtHhVDuqznvIUf
         o0DurDNnCtkRdC+2vcpl1kx23EVeXqef5kyQQBYnq2hTkVrwWSpWtrVO32wY9PK5V1ie
         J3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945330; x=1755550130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf3vC/bMLxsK+qQIEq63MqPOkecni+X3pTICciqQJuw=;
        b=kDn+byP24nuv5IQHaGffR+TWubMbuudds9ZhM+p5nSCLHxMuZYssUp2W5yBKiyFWLv
         FcX2dD9ady9TRq4a3zpZeu/d/D0gH94SLoCXaa+VxGXEjXTnaZWYMJhv3XR0i9Ft1lqJ
         LJstCaamroOgwOC4jODlWdXbkHvNvP4hmeosNrKA+w9rdmtEXU2Qwz2cDPD7Tv56o2Gc
         9Hqm3jJZQmkpKowzVvfnzzOXT9wxpf97zRTpoBzCBFy3+iS1sQF9nR8gs5h9KegnC5Gb
         WRF5ypK788C2ph9nmkFwZX5OIaXITjfOxhMjrpLubBVuLWrw1ul3GEcl+dOzAZn1p2oO
         0J6Q==
X-Gm-Message-State: AOJu0YxhQpNPk6pFEca3yFRtC+SLR0THyHIPFybdl23iTyLRLcWWrW0K
	LguHCJ5uFkFVm2+QBjKyFYC62xQu547+S4xpfPqhKFYOvy5n/IxyW9L36ikkHQ==
X-Gm-Gg: ASbGncsUOZdk5s++PDxftvmCbgRgGov9T2w3IFZPYuDoFS3l1FlJnh8nsJ8d+W+JsvK
	kIRgdRJmj+2UQ5IKcNaJF3BRt3H43wa4StTU5bWPmNHtbhEy9zDWyXqqhW8TFHiFSGOIWFEFKcm
	SF93j15TCfHpC0dlPEumN0ADy0GKcS5QrgEVT0rKlj/3wt2A15/Qovv8+UXp8mNoQT3xB53YIVJ
	M8PcO4qeyq/Ky4y3YA9pJk1kMnXn04HwN2YKPZy5M+i59fFNp5/OAc5zi5CavPWtp+azW1sjBs6
	nvRBzt94ZQOJInV0DEf3q2vTIs9RBZMZYJtCTyRLwyvoES8uPOBCrvRg94sctcn8UqsJR5YEkB8
	35qMfSbGvWCF5U/qMK5flN8OijCBKx6pFY6getDKJRDhxqqTfVY0aXSF91NrCz7Vr1aBsgyJY+v
	xm0g==
X-Google-Smtp-Source: AGHT+IFBO8GBEBI4lp8QB14504qUcSt99Pg0isBR7NzLTnjZPSQSGyh0nQRdh+b79bbwVdR8Na+iXw==
X-Received: by 2002:a17:906:fb05:b0:af9:e505:f620 with SMTP id a640c23a62f3a-af9e505fb9bmr705198266b.57.1754945330021;
        Mon, 11 Aug 2025 13:48:50 -0700 (PDT)
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
Subject: [PATCH v5 02/12] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Mon, 11 Aug 2025 23:47:58 +0300
Message-ID: <db677462d1b5b698db417182c05c3a6c3a17c0d0.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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
Changes in v4:
  - Add error logging for allocation failures

Changes in v3:
  - Drop asserts and return error codes instead.
  - Wrap code with CONFIG_SYSTEM_SUSPEND.

Changes in v2:
  - Minor fixes after review.
---
 xen/arch/arm/gic-v2.c          | 154 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++++
 xen/arch/arm/include/asm/gic.h |  12 +++
 3 files changed, 195 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d0..dce8f5e924 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1098,6 +1098,151 @@ static int gicv2_iomem_deny_access(struct domain *d)
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
+    {
+        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not allocated!\n",
+            __func__, __LINE__);
+        return -ENOMEM;
+    }
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
+    {
+        dprintk(XENLOG_WARNING, "%s:%d: GICv2 suspend context not allocated!\n",
+            __func__, __LINE__);
+        return;
+    }
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
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
+    dprintk(XENLOG_ERR,
+            "%s:%d: failed to allocate memory for GICv2 suspend context\n",
+            __func__, __LINE__);
+
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
@@ -1302,6 +1447,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context(&gicv2_context);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1345,6 +1495,10 @@ static const struct gic_hw_operations gicv2_ops = {
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
index e80fe0ca24..a018bd7715 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -425,6 +425,35 @@ int gic_iomem_deny_access(struct domain *d)
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
2.48.1


