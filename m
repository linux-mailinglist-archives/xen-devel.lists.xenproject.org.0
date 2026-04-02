Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAKNKWBJzmlRmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21B387DE9
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271523.1559664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaG-0004jp-FW; Thu, 02 Apr 2026 10:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271523.1559664; Thu, 02 Apr 2026 10:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaG-0004e6-9y; Thu, 02 Apr 2026 10:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1271523;
 Thu, 02 Apr 2026 10:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaE-0004Wm-Mn
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaE-00Ej0u-35
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4935-2eae-0a2a0a5409dd-0a2a4508a782-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:30 +0200
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4941-fab6-0a2a45080019-d155da35c9f8-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:30 +0200
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b9c3a9fe80fso90505966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:29 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775126849; x=1775731649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDTHUo0iRavupmsXxpHOoWQVA9mce1asVaUpgFiaZZQ=;
        b=b+ZECLIghcIgTlcgPUDvEZaEmp7ruge7IOSO7wchuTMmQKKmmoyM2zEDQt38PVqmi3
         pfCUXXaqSSXYmFdPPltiuxLETvrAw71fDG7kV01HgHKuUQJUyN+YbFIVHicmRx9Xsklu
         Ac17lKFolu7/vjOeteXykKm9M+5linLu91nZVampW6Q8rMh32WBvVKY5IlBX6A+H1cB4
         bPXZbVA1Z2yuNXpiRg4u4eI6+60z9CQdOISEwyr9k8KZaAVpDiYNHMKoJ8zDxzSqNYBv
         CavfFoZZOa81yYRvLIguyR5QPTWA5vqLxxO/Jv9j1mFIqWMHbj+cpxjt70GyuPYWTCO/
         ujQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126849; x=1775731649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDTHUo0iRavupmsXxpHOoWQVA9mce1asVaUpgFiaZZQ=;
        b=q+Zv3eLgDusNY097ZmspCbHQ2mfoDqhHI2KRU+6qrCavDrY9aPKuOUCETumxLV1OIA
         u1Fi0M0MK6U0PTdOYRNornFWQags3OHS2poyo6JRaGYM6KSoDMAVjOVS4kk4/izMMJmB
         CJoLFZk1EOeSlJW5mIuo62xb8EeunK/vtNpgePdd62WfGcvx3hxiOZGEzCsPRBTNNkrW
         AsRK2hFrB9LhePH6EU+8NgbKiDBU42ocbAYfsslWD3OxQqz9M4oPM3Wm1zG5QzTB2DOM
         H8XcfKvBtOQDAAsbTtzrSwD1M+1PLrfWZi36PbjSKz7Zt/ui5b4FM6q1OaTGMca85/Yp
         7WLw==
X-Gm-Message-State: AOJu0YxoPLhabGP8oG1o8l1wQKUsww1pgLHx1xIMreINKy52JjkD0ZYp
	pVBkqzRMOpapKEah+b/tZ4qRanGZh+Sw01R4TSdbUqGOAp4f4e5rfkiGuFEaKP+x
X-Gm-Gg: ATEYQzym8GXRk8UFptAL8aH1rUBEMVRaHHRWs1L2gCtB19F+2lZd5WSvkOabNx6K0+B
	9Uz366xzxgS8SyeU3XxWKIq/rNri4S5X7nfv5buk9d+44/KxeCIvUoBFZE2QCIKtoh/CXB/JoI/
	iKs4ns266TPgA0xPxctBhfUcVZFK/uyHNciXNjyxTDt31/aywZvOFeC0Wz+4FXXctqiR6Ff8N6n
	boWkIeqoIG32uWgqR57Dr5fk5mIKQnULBE8d/cjam2+KB/+aXORNbMitWRW6MKtbVc38IjdoToi
	i3iKPL8WJBPRP1EXWcubbnNTrI2NtZ7sJ135t49wWekA75bA+SHDAz+voeB5dF3PR0UAU4mxVWq
	k99+abtRCbInVBp8gYOw1H/uE2xAo+eoISicoDDkaNZ6DzXZthSkA/HKIKZ8l9mjB6UbPeyGLUw
	RsgD4Z+5lJCjJZ30YraWOl1l8d2Q==
X-Received: by 2002:a17:907:c789:b0:b9c:ed9:50c8 with SMTP id a640c23a62f3a-b9c13b2c4e2mr463323366b.26.1775126848495;
        Thu, 02 Apr 2026 03:47:28 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Thu,  2 Apr 2026 13:45:05 +0300
Message-ID: <d3398c62b8604bb869c204e3786f0b0246de7375.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775126850-7495D497-CD7F2EA0/0/0
X-purgate-type: clean
X-purgate-size: 14084
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5A21B387DE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/gic-v3.c                  | 321 ++++++++++++++++++++++++-
 xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
 3 files changed, 322 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 125f51e61b..01120aeed9 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -466,6 +466,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
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
index 34fb065afc..d182a71478 100644
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
@@ -1920,6 +1920,313 @@ static bool gic_dist_supports_lpis(void)
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
@@ -1994,6 +2301,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2033,6 +2344,10 @@ static const struct gic_hw_operations gicv3_ops = {
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


