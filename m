Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79EB3F0DA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105405.1456397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjT-0006zA-CG; Mon, 01 Sep 2025 22:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105405.1456397; Mon, 01 Sep 2025 22:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjT-0006w4-0c; Mon, 01 Sep 2025 22:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1105405;
 Mon, 01 Sep 2025 22:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjR-0005XP-G1
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:33 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75835772-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:24 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-55f78f32580so1211819e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:24 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:23 -0700 (PDT)
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
X-Inumbo-ID: 75835772-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764624; x=1757369424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knhQ+S9mPkiwhWSXwrIQ0d+Hly1TQbR8zGjL18AowhY=;
        b=H+krl55qPWvuR2EzNnszNP6eR9gGVNB5M8OlNOFjTSHP3a96Nn8NB7izJdS3zhwguU
         4tR9PmkYV2i7kuFhX4jwTnfGPSYnBPh7mc2iCz57lpMFAgydbaN9/kYEhO6G0CwhRhED
         jbRFDJh6AXCPvCQVfs7/1AvzKPljBoTUzop1Bo+qWtIJOiSvBxRCs8HzDcVnLfPRE0OP
         V8etXfmU6kFJElUsF6ez5/R5YeNFaNiUcjuwX8siEi84uWJqRgVnM7gGMWvozabHvadr
         mNSZ1ImqsgZb8Jt17Slf/eVeTb8FquH0f0NGs7x868S6gHIwYGRICIvlTn+ukJR1CDzR
         606A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764624; x=1757369424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knhQ+S9mPkiwhWSXwrIQ0d+Hly1TQbR8zGjL18AowhY=;
        b=RpLfgxOzHvSOLS+r7wOaby5+KFoB0iCpY2foJVJZpdXSjIM7XqWxkknpYIx7rmQMPW
         JHlefRpdU9/R5gWcBVsRLM7EE3S5J1wT2ek32mTHuBUt41fI/zEbOrZS1n8sSe2SSOz5
         QJ03Q7ZC+qgM/JCC1/cEn4XugFQjod2Fy3KZB15d33MBEqNdNBGG1l0x7SRZxaok8sO4
         0nY7v8UPMmWBSpBr75Pl3zOwJKwc8KH9CjbT9sl2zIIsZ9J1sGgkmw0cf92tZV9lwqYE
         iJHSgHbQDv5oqYVA1C5KbZ6+FiWajeACM/WZtuC7oZVuJuJwERCqOZ+c3ANfiHVvALBz
         2a2w==
X-Gm-Message-State: AOJu0Yxag8P1u1W80z7PL+xqf9UdlFzHhHUPApg8bf8bY4sJwSXZIosv
	GeBIxuZRT5uRYsMsNfVrMmgRf9+eO+JeWNOIoNsFITrO185IWRW5Jw0WAxhO2HYj
X-Gm-Gg: ASbGncun9mSjhdDZMYGxA/HoIvlChtvayWwpPo5xqyi7EtSwUG2s8brq+a2AdiwU4ea
	1SevuhNYnOMbcStP3mIKz6YuTh5QtSfH3bQL9iJ1NAmfrtaqPd9238o7A7hzXWqWuMIXDSKyvBK
	povstVeDgAS/N2Z6I5haoOMueAHbuQD2CKRKBC5WajL00ezofRU2gzUSIMcsDuKZmdSV8zHq+Ap
	Ne7usEPA/WBv9NULclJWsyjhkDucTm9cW0eUnvJp/eiEKy8qKmY2p5m3M9B1FayQk9BRtbYbwSd
	UueG/8nqx3eRf8X9zXbGANt2bFzYLlLdm/2yro1AX6iV/enyzYJjQjl5rAioXVjfYLjE1k+Cyht
	yB9sl6rojQ5Ty90PduZw4ClTkLRIAS8o8IQNOjzC6Owgzgcc8ShBB5uH4+AnBqv0n7iORDTfK8T
	L5gtWtnB4=
X-Google-Smtp-Source: AGHT+IHx4s/XpnhU0YN9P6FuM23tHmNqjatW0aU1ecFV2aj3TF6onudCp4HF51qNc/4vWPZYRopttQ==
X-Received: by 2002:a05:6512:4608:b0:55f:7050:9550 with SMTP id 2adb3069b0e04-55f70924a63mr2181909e87.38.1756764623544;
        Mon, 01 Sep 2025 15:10:23 -0700 (PDT)
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
Subject: [PATCH v6 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Tue,  2 Sep 2025 01:10:06 +0300
Message-ID: <c1744d379d7f04fa832b3283cb95bb3cbf5a9e79.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- drop extra func/line printing from dprintk
- drop checking context allocation from resume handler
- merge some loops where it is possible

Changes in v4:
  - Add error logging for allocation failures

Changes in v3:
  - Drop asserts and return error codes instead.
  - Wrap code with CONFIG_SYSTEM_SUSPEND.

Changes in v2:
  - Minor fixes after review.
---
 xen/arch/arm/gic-v2.c          | 143 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++++
 xen/arch/arm/include/asm/gic.h |  12 +++
 3 files changed, 184 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d0..6373599e69 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1098,6 +1098,140 @@ static int gicv2_iomem_deny_access(struct domain *d)
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
+        dprintk(XENLOG_WARNING, "GICv2 suspend context not allocated!\n");
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
+    {
+        gicv2_context.gicd_isenabler[i] = readl_gicd(GICD_ISENABLER + i * 4);
+        gicv2_context.gicd_isactiver[i] = readl_gicd(GICD_ISACTIVER + i * 4);
+    }
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+    {
+        gicv2_context.gicd_ipriorityr[i] = readl_gicd(GICD_IPRIORITYR + i * 4);
+        gicv2_context.gicd_itargetsr[i] = readl_gicd(GICD_ITARGETSR + i * 4);
+    }
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
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    /* Restore GICD configuration */
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 32); i++ )
+    {
+        writel_gicd(0xffffffff, GICD_ICENABLER + i * 4);
+        writel_gicd(gicv2_context.gicd_isenabler[i], GICD_ISENABLER + i * 4);
+
+        writel_gicd(0xffffffff, GICD_ICACTIVER + i * 4);
+        writel_gicd(gicv2_context.gicd_isactiver[i], GICD_ISACTIVER + i * 4);
+    }
+
+    for ( i = 0; i < DIV_ROUND_UP(gicv2_info.nr_lines, 4); i++ )
+    {
+        writel_gicd(gicv2_context.gicd_ipriorityr[i], GICD_IPRIORITYR + i * 4);
+        writel_gicd(gicv2_context.gicd_itargetsr[i], GICD_ITARGETSR + i * 4);
+    }
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
+    printk(XENLOG_ERR "Failed to allocate memory for GICv2 suspend context\n");
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
@@ -1302,6 +1436,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context(&gicv2_context);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1345,6 +1484,10 @@ static const struct gic_hw_operations gicv2_ops = {
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


