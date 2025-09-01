Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF05B3F0E3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105417.1456451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjc-0000cl-Fy; Mon, 01 Sep 2025 22:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105417.1456451; Mon, 01 Sep 2025 22:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjc-0000Vb-5G; Mon, 01 Sep 2025 22:10:44 +0000
Received: by outflank-mailman (input) for mailman id 1105417;
 Mon, 01 Sep 2025 22:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjZ-00055o-Tq
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:41 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddf5df5-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:38 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55f687fd3bdso4496391e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:38 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:37 -0700 (PDT)
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
X-Inumbo-ID: 7ddf5df5-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764638; x=1757369438; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjizghnjyTk2+1djq5Y5MywqYNIMRO2uUzS6ohxl4Eg=;
        b=iMnv7d1krAOipiWYOMc5/CdfPYAp+xruycgxo6Z5turoVv+X/bUoVJIWVqqbz5r2MQ
         YfQyIYzY1Rl0/sszIviPZcFJcrAC7OGzDFnfsUaTft4iwi7iis5F1HRT2wd19cyEbH6i
         oIXwSMuTY7SF3EbSiN2nOhVX6zJdlSX9cw1OYoKBf5rxvvzy17fwAxaKmJNADvuHVaF4
         M636tMvq4Qayln8HU5aNVQPFqBFy6a6cL837OLOpTK6Pwl3EAzslH3JELnnk6E9ZOMCp
         bmTUKJmuu5lIvwRxqBmKaUSrWIAo5G+dynzmPIjgGPfc/UCm6itQl5jmNT6E5ZRSSTop
         wegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764638; x=1757369438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjizghnjyTk2+1djq5Y5MywqYNIMRO2uUzS6ohxl4Eg=;
        b=XEyVF/3UMcWRFni44Mh81eM3xlSIVA3AKZyLVZPq5G0SWhb6bss9aIxcppuUCIa6cC
         NVoRZV9XA+Uwcr+hKezaV/nkWx/kDMX8Stnztz3JSFooCQGt95Sus8ADegMstQ0SWncB
         EItTwiZtNr/ouNLa42MctZqLLb3+rQKaR4uMvSn3ytKUf1fOufYVYPnHabSvLHOaEmmh
         wf3I4NOmGM5kozKgkNOydpqMSBJzxJ8aAvdhutVI86BeAX2hXje4H6p7QZDke+UJpcJv
         5ivV06Z5lSTOMLY72YwVHNQRRraZKsZ6EUFn9m81Fv1jxvyNTspc2g0tpH+MvS9PO3c5
         /6Sg==
X-Gm-Message-State: AOJu0YxMHrmcfuWNUsg0Hi8iEUp//1fgY/h0n9sjJy6f3mYrjoPGQX1+
	v8tQyb8GK06XCDmn8zYLJj21pgM2OckYfBmZDJRHcpVw/IY3lu8he2xcEM3dE6nU
X-Gm-Gg: ASbGncvxONl76xFllWIjApp9rBvonkZK+TvkMxoOnrlvNYPSMV8Qqlx0iThIJcifI3V
	FMyNPTvos0sEUrmTuLitdq6bfFLZxm5DGKC1ZYGAmqt2rRhgAUCFTshj/qnyM48OzkyCqa6tN8u
	qaHs43LLRqT+yMx2HqPoS8cLyCrZR34t0g/1ahVYV4CR0VUKHuZzkIvBtAb+byqL3hZ6hU2xvXo
	UxLKM1672aTdRQGzDwwGEt1gUAmVAhqzC/Fb/0DZ6D+r6dZFX/dbpyTreMATPXPI8/VHpQT/ksZ
	JCux90fO8hvM3qfR0StG/RCN0A3q7qQR2qmtn7+XZ2xnR8Y5lQzn44RqOKB45uQpVCl3eFvWg6z
	Pv22SE1Tf07DlvmWnNQ5/0pu5d9fffPhz4Hhg8nktmsxzOVmuIt4m2VMSyXiuLw==
X-Google-Smtp-Source: AGHT+IEn9+xcjXygXejhEa0wyNG2hkVDUF3pRbujhPECoHvmyQVKBSuBe7768CCtbszL4fNE5HZPEA==
X-Received: by 2002:a05:6512:3ca4:b0:55f:501e:7bf7 with SMTP id 2adb3069b0e04-55f709bdaa0mr2975906e87.57.1756764637835;
        Mon, 01 Sep 2025 15:10:37 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 13/13] xen/arm: gic-v3: Add suspend/resume support for eSPI registers
Date: Tue,  2 Sep 2025 01:10:17 +0300
Message-ID: <cabe6a50fbb963eb4503580c479eca34819a215d.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add suspend/resume handling for GICv3 eSPI registers.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Note: The main eSPI patch series is still under review.

This commit is intended to be applied after the main eSPI series:
[PATCH v5 00/12] Introduce eSPI support
https://patchew.org/Xen/cover.1756481577.git.leonid._5Fkomarianskyi@epam.com/
---
 xen/arch/arm/gic-v3.c | 141 +++++++++++++++++++++++++++++-------------
 1 file changed, 97 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 9f1be7e905..57403c82a8 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1782,17 +1782,14 @@ static bool gic_dist_supports_lpis(void)
 struct gicv3_ctx {
     struct dist_ctx {
         uint32_t ctlr;
-        /*
-         * This struct represent block of 32 IRQs
-         * TODO: store extended SPI configuration (GICv3.1+)
-         */
+        /* This struct represent block of 32 IRQs */
         struct irq_regs {
             uint32_t icfgr[2];
             uint32_t ipriorityr[8];
             uint64_t irouter[32];
             uint32_t isactiver;
             uint32_t isenabler;
-        } *irqs;
+        } *irqs, *espi_irqs;
     } dist;
 
     /* have only one rdist structure for last running CPU during suspend */
@@ -1831,8 +1828,26 @@ static void __init gicv3_alloc_context(void)
         gicv3_ctx.dist.irqs = xzalloc_array(typeof(*gicv3_ctx.dist.irqs),
                                             blocks - 1);
         if ( !gicv3_ctx.dist.irqs )
+        {
             printk(XENLOG_ERR "Failed to allocate memory for GICv3 suspend context\n");
+            return;
+        }
     }
+
+#ifdef CONFIG_GICV3_ESPI
+    if ( !gicv3_info.nr_espi )
+        return;
+
+    gicv3_ctx.dist.espi_irqs = xzalloc_array(typeof(*gicv3_ctx.dist.espi_irqs),
+                                             gicv3_info.nr_espi / 32);
+    if ( !gicv3_ctx.dist.espi_irqs )
+    {
+        xfree(gicv3_ctx.dist.irqs);
+        gicv3_ctx.dist.irqs = NULL;
+
+        printk(XENLOG_ERR "Failed to allocate memory for GICv3 eSPI suspend context\n");
+    }
+#endif
 }
 
 static void gicv3_disable_redist(void)
@@ -1852,6 +1867,65 @@ static void gicv3_disable_redist(void)
     while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 );
 }
 
+#define GET_SPI_REG_OFFSET(name, is_espi) \
+    ((is_espi) ? GICD_##name##nE : GICD_##name)
+
+static void gicv3_store_spi_irq_block(typeof(gicv3_ctx.dist.irqs) irqs,
+                                      unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + 8 * i;
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi) + 32 * i;
+    for ( irq = 0; irq < 8; irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi) + 32 * i;
+    for ( irq = 0; irq < 32; irq++ )
+        irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi) + 4 * i;
+    irqs->isactiver = readl_relaxed(base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi) + 4 * i;
+    irqs->isenabler = readl_relaxed(base);
+}
+
+static void gicv3_restore_spi_irq_block(typeof(gicv3_ctx.dist.irqs) irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + 8 * i;
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi) + 32 * i;
+    for ( irq = 0; irq < 8; irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi) + 32 * i;
+    for ( irq = 0; irq < 32; irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi) + i * 4;
+    writel_relaxed(irqs->isenabler, base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi) + i * 4;
+    writel_relaxed(irqs->isactiver, base);
+}
+
 static int gicv3_suspend(void)
 {
     unsigned int i;
@@ -1871,6 +1945,14 @@ static int gicv3_suspend(void)
         return -ENOMEM;
     }
 
+#ifdef CONFIG_GICV3_ESPI
+    if ( gicv3_info.nr_espi && !gicv3_ctx.dist.espi_irqs )
+    {
+        printk(XENLOG_ERR "GICv3: eSPI suspend context is not allocated!\n");
+        return -ENOMEM;
+    }
+#endif
+
     /* Save GICC configuration */
     gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
     gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
@@ -1903,25 +1985,12 @@ static int gicv3_suspend(void)
     gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
 
     for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
-    {
-        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
-        unsigned int irq;
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, false);
 
-        base = GICD + GICD_ICFGR + 8 * i;
-        irqs->icfgr[0] = readl_relaxed(base);
-        irqs->icfgr[1] = readl_relaxed(base + 4);
-
-        base = GICD + GICD_IPRIORITYR + 32 * i;
-        for ( irq = 0; irq < 8; irq++ )
-            irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
-
-        base = GICD + GICD_IROUTER + 32 * i;
-        for ( irq = 0; irq < 32; irq++ )
-            irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
-
-        irqs->isactiver = readl_relaxed(GICD + GICD_ISACTIVER + 4 * i);
-        irqs->isenabler = readl_relaxed(GICD + GICD_ISENABLER + 4 * i);
-    }
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gicv3_info.nr_espi / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
 
     return 0;
 }
@@ -1938,28 +2007,12 @@ static void gicv3_resume(void)
         writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
 
     for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
-    {
-        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
-        unsigned int irq;
+        gicv3_restore_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, false);
 
-        base = GICD + GICD_ICFGR + 8 * i;
-        writel_relaxed(irqs->icfgr[0], base);
-        writel_relaxed(irqs->icfgr[1], base + 4);
-
-        base = GICD + GICD_IPRIORITYR + 32 * i;
-        for ( irq = 0; irq < 8; irq++ )
-            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
-
-        base = GICD + GICD_IROUTER + 32 * i;
-        for ( irq = 0; irq < 32; irq++ )
-            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
-
-        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLER + i * 4);
-        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4);
-
-        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICACTIVER + i * 4);
-        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4);
-    }
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gicv3_info.nr_espi / 32; i++ )
+        gicv3_restore_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
 
     writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
     gicv3_dist_wait_for_rwp();
-- 
2.48.1


