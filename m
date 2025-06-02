Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073AACAB24
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002944.1382387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16I-00006Q-Fr; Mon, 02 Jun 2025 09:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002944.1382387; Mon, 02 Jun 2025 09:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16I-0008Ud-7X; Mon, 02 Jun 2025 09:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1002944;
 Mon, 02 Jun 2025 09:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16G-00081k-OJ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:04:56 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a73e7c91-3f90-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:04:56 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55324e35f49so4990016e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:04:56 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:54 -0700 (PDT)
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
X-Inumbo-ID: a73e7c91-3f90-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855095; x=1749459895; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf3vC/bMLxsK+qQIEq63MqPOkecni+X3pTICciqQJuw=;
        b=JsMjDz/WcVkQycjqVs9dX9i37frKDZThoti3L77TXgIhdUhhOv4iFzfeYhO4mghaSi
         XPdRFh7kEoExwUV8VC3iKOXE1nL6mKDiCOTGaFQJsQmtq/OzxbMVBAyBIncH5vmPttT+
         mQsuok/isvvTJohfqoqkZpvliBg/JNKtuMqnFKxPKGEyXRoVCS6y2MhjfMhL2UrfeeeQ
         aKafARywnwZMch5KPJ1kiI4YAOfWnB0JmDYNx/WooyFhxQ/ZFpEeX4g9JhqPfjCnvJDe
         umWujBteDkEGTNMt0e4P8pqroBTQ3E6/KW/L8V5sMHgmRX8egHT1mzAmTjHhsDaBol88
         gZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855095; x=1749459895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf3vC/bMLxsK+qQIEq63MqPOkecni+X3pTICciqQJuw=;
        b=pJ25wImjuYFzDH97JQDArTAgV/ae83/oEsZYFaLWJaEsjpEwJoky88lFrM4Xnmgv4B
         x1h3IOEp8TOonvjkcNIxil/TvKmI4u/uTo1UUaPqanKXbtUl20QsmRs9+1+INSzkoaTE
         Qtco3qzrCtj3vs7j7IkxCRAiojonUA50OJbWlIPmGF6JpAwer95YDguU1m39PTyuLTVP
         sZJ7225qFUkXjFyjnj1tF9+1m6p0MHxcATlCcqlRoMEo9psMCNa1jAYG05wQsnfpgBki
         7cpZTxXWTmgPrvsCXaSm8PLGZRJRt+WWuf8V+4M9gS2x7M4o2GQz0VV29qFLNwHnt7L0
         U4Zw==
X-Gm-Message-State: AOJu0YzunoFa8HOLmdwiJrHIFQuBitnJzyYnn55cbim8SaZw24dFswRB
	499g7T94BT0bth146cAr3JM3nABaUbQd+ByMNmySipJorKsTAD/8L+qqy4zy0PsO
X-Gm-Gg: ASbGncsUbqN2oZ0mQfcSzszc2orshWIrxF1sg+rayu4pbmKT5eIvS6Xqdv8VNyS76UX
	HGl/bgtbC2NWGqDiEiH5mDsbdEUjf0nn8ZMo+Fcr/JUsbF1kE+GIT+3InL2o3viQik05HI9RFdK
	T5Fspd/GHQFHlF5QlY0wRYFBKPB0fkzWylu2uS1ads4sifZUaclMBB/k7PAar9WojooWH6kgqr4
	TbZ2fCrjFacJJ7LTCBLV9AcoKGCZ6xEdAP8FRkOBsKxmaAFkWAAFOEi5bX+sTQSPo09ia0tZbg4
	bZ5sPYJF5ULHUFUIg0FF6JFamAdKveu3+TlcxVEYq2gUrYS50A/aojBh8ie0NT8DILWMeeE90HJ
	rhKIFyy4fqj3ae/025Y2udGPsVw==
X-Google-Smtp-Source: AGHT+IHzhIcJPLhYeyY8gRjIbAaAby/DEUcUcJeunz8LbzATZzYj/HE4uNg6xTTusSuHPyQMGBDzRw==
X-Received: by 2002:a05:6512:2313:b0:553:202e:a41b with SMTP id 2adb3069b0e04-5533b8f3e6emr3760415e87.15.1748855095180;
        Mon, 02 Jun 2025 02:04:55 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 03/10] xen/arm: Implement GIC suspend/resume functions (gicv2 only)
Date: Mon,  2 Jun 2025 12:04:14 +0300
Message-ID: <af9d3c966c4b637559650fd8a8ac53eb36c1a3f6.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
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


