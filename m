Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EvtFfleA2r45QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FAB5257EA
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 19:10:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307277.1579019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc9-0006XI-9F; Tue, 12 May 2026 17:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307277.1579019; Tue, 12 May 2026 17:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMqc9-0006U6-5k; Tue, 12 May 2026 17:09:49 +0000
Received: by outflank-mailman (input) for mailman id 1307277;
 Tue, 12 May 2026 17:09:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wMqc7-0006Dp-FW
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:09:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMqc6-007RzZ-Sm
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 19:09:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035ec9-2eae-0a2a0a5409dd-0a2a4501afae-14
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:46 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a035eda-c1f2-0a2a45010019-d155802edcc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 19:09:46 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso59331895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 10:09:46 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8cccf90sm10838845e9.0.2026.05.12.10.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 10:09:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778605786; x=1779210586; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8t5jxqUnUpYd4m0eBF1jttpmfOSXj9O/o10a7IBFAI=;
        b=hrwrbB0Zb98YYjYphgzOt8hsQLzcmzoxySgsE4lAMA6OBIrpfSeFwA+rkYQLrrK9Wk
         KgLVO9HjR1cZSIsu0kVLj9Q++rkHuOpj5/qmGMLxo1footvzhzhn+94NxcAcHa87ykxL
         afs+zPwWZ/925dq0oTIlh+BMmDPXibxmH0iTwPI1U+FKiA/DJXPrpHMdywc9l0Bfc6B2
         NW/BQssgSq8gmvJNXitGka+RAQaFFemc2xoQn/qF2VTuc1byCzJn2Vl+PggoAPCl6OXu
         YCGMt6b37SOtTddw8ofM/xwFbBOxJzZUlfB3Z4ZcmJihbqPgjTzIfBqCKZUjtbfPp9d1
         b/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778605786; x=1779210586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l8t5jxqUnUpYd4m0eBF1jttpmfOSXj9O/o10a7IBFAI=;
        b=TCz4dqP4GDKlVkA3IWatnUg+qPku1Z7dkGsHvGIXp+o0S6PLAXdgtKKvhZ8IEb/0pe
         6hQlBq5ztxhgEvyYdcNTeUKwA2SHlMmUbaeUZv34Qc1oOPskBwZ1vWYHnCTgTibeRGDQ
         YBnt0GVGRglUfbgITK6tiBZf03k/QTmgrDNhNxAnn9q/BU2knfherAYbu2gecu5hpDhl
         3LxSSzVKPS1+oJnBstYXETOrGtmCQW97c6gdbtXt9uHbYmCV5CBxwIGF4iTI/f3nto47
         SzAQF39/CNIMxYaY/CarjeSwWuf5ZhJx2IzSTTupyWUarsWNVg/+4970dkrYZdpx9mdN
         AXDQ==
X-Gm-Message-State: AOJu0Yy0woTdzCjbXnk+FzfbBuBKQ/ZIPO6d6qDNFgEhHrCghieOFOct
	EA9T1VQTo7s558/JncI1ky4eXbPjOGta9KgRi6OIq3sG4yfRLW/O4i7TyFquSQ==
X-Gm-Gg: Acq92OG8w732IG70gerqNlLBNZoXzbE2MTWv8BXjorW0s9T9Ebu0cpebM00GhYoJDCA
	ltlYBFFe02/KXNy2WMgNwBWUDve/pNGRhojfygaiYMB9YL8usJRCmdAG9B4mEs0gE2pDS8toZXR
	Y365rWk1pBriGhmoFl20UpOK1aJmQsJorFQMai6iHr4whtoacT1DgfYMc07Lo/OjE2r/vOKUSSM
	3ty3BC+FRstMxZknyjQxRm23KxNqev84f3FB6krXrXmSLYgRyjdZAzn2rX7Hy9+wiPPug8nONKG
	QG9VFXaQiElL/pEs+b2S0RL9TYSsiS/Ec5Vj3iCgD9B0b/s62GnZBiRmbzMApgcg5nIe1VbQWBP
	38JG6QswLjbMco9t2hSVGf5HypmnvUEJDiCSpf/g7/qjECX9Vt8+RDx1AN09KXbGstYWBENHKvN
	ipVW67iWJbNJvIqbu/tpZWvptnZg==
X-Received: by 2002:a05:600c:46d2:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48e51f32c65mr459278545e9.14.1778605785937;
        Tue, 12 May 2026 10:09:45 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Tue, 12 May 2026 20:07:11 +0300
Message-ID: <8973fc6bf69d8b20cebb61289c1b8596b1a09900.1778605274.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778605274.git.mykola_kvach@epam.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778605786-B675CFF4-4A0A0646/0/0
X-purgate-type: clean
X-purgate-size: 15807
X-Rspamd-Queue-Id: E4FAB5257EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Mykola Kvach <mykola_kvach@epam.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V9:
- fix the suspend-context comment typo and split dist_ctx declarations;
- restore ICC_IGRPEN1_EL1 on the suspend error path;
- re-initialize GICD_IGROUPRnE during resume;
- restore GICD_IROUTER only after re-enabling ARE_NS during resume.

Changes in V8:
- use right rdist base for prop/pend baser and ctrl

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
 xen/arch/arm/gic-v3.c                  | 362 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
 3 files changed, 363 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 36bb45738e..b0289ee4dc 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -467,6 +467,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
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
index cc0569a157..6fc4354e2e 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1072,12 +1072,12 @@ out:
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
@@ -1184,7 +1184,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1920,6 +1920,354 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents a block of 32 IRQs */
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
+        struct dist_irq_block *irqs;
+        struct dist_irq_block *espi_irqs;
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
+    void __iomem *waker = GICD_RDIST_BASE + GICR_WAKER;
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
+static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
+                                         unsigned int i, bool is_espi)
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
+}
+
+static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
+                                          unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < ARRAY_SIZE(irqs->irouter); irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+}
+
+static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
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
+        goto out_enable_iface;
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    rdist->propbase = readq_relaxed(base + GICR_PROPBASER);
+    rdist->pendbase = readq_relaxed(base + GICR_PENDBASER);
+
+    base = GICD_RDIST_SGI_BASE;
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
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    return ret;
+}
+
+static void gicv3_resume(void)
+{
+    int ret;
+    unsigned int i;
+    uint32_t dist_ctlr;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    writel_relaxed(0, GICD + GICD_CTLR);
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, true);
+    }
+#endif
+
+    dist_ctlr = gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
+    if ( dist_ctlr )
+    {
+        writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
+        gicv3_dist_wait_for_rwp();
+
+        for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i,
+                                          false);
+
+#ifdef CONFIG_GICV3_ESPI
+        for ( i = 0; i < gic_number_espis() / 32; i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, i,
+                                          true);
+#endif
+    }
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, true);
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
+            panic("GICv3: LPIs already enabled with unexpected PROPBASER/PENDBASER during resume\n");
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
@@ -1994,6 +2342,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2033,6 +2385,10 @@ static const struct gic_hw_operations gicv3_ops = {
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


