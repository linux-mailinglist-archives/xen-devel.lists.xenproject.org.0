Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GtYJoNFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A05AA8D8
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315653.1585393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VP-00021e-2e; Thu, 21 May 2026 17:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315653.1585393; Thu, 21 May 2026 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VO-0001yz-VB; Thu, 21 May 2026 17:48:22 +0000
Received: by outflank-mailman (input) for mailman id 1315653;
 Thu, 21 May 2026 17:48:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VM-0001XX-Qn
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VM-00BluR-6Y
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:20 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f452f-bab6-0a2a0a5309dd-0a2a4508d226-24
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:20 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4563-63b5-0a2a45080019-d155802cc078-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:20 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so3694595e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:20 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385699; x=1779990499; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8X7iUE4miDneD3kr0bugCzpGNvoBSglF6ML/JnN4R8=;
        b=eAThH8jzGH2w2jaFSidw1m0g142gEjQsJYPewxqvtZM67EqPmGIpRCjM8o7mFdDGl+
         Psvc0bWm6An2g53SVi1+xluDhM0KHTiACEiUkkNjoONsppn8af12Q03VWFg8ceuoAZHq
         5wR9bT+9iITlhgVyXWCMyEVdZyfr0em/YJDSkEhdVMu70D4hk1nGChhIar9O/wBnpl/Y
         arSyJzq9SYxIgiOFmUzm+wOOHt+wEkVsJuL5RfcKFwmpscUo+BpamERXUNcLAixuCAYw
         J3rSc/nWFo/8pTVN1RPuXT5A16K837wTBAHYEpaH4UOXV3torqkgCzpMRb6C3kLAyNz4
         MUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385699; x=1779990499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8X7iUE4miDneD3kr0bugCzpGNvoBSglF6ML/JnN4R8=;
        b=DgxCADAajwoTvdCp+HhiJb6H3Jl+qGIuLbIQal0G/XpowlC+wi7oq3p9Fg0kpsWjmn
         nDqQmKoq3sziaX/iEfBz17bmoONlPPH6nHCj8kyheRkKAfjZ0yzj2sdmXpxuWXnDO5oJ
         5qHbS2SOSRXw9B48TcpPXKfI78QOnVik7sAkIi6A2MQqSidMwzIT9hU79x3vrPF4u+/Y
         FJzvE7lqJZ431G2+4CotPuAyC/gtWWNVAVYLkFcEaZaSlBnmjlg0XcKoINC0xwXziAmQ
         3JakRzgIchd1LPUxTtP5uEB91o+9yqAp2rJOCeIS0gf5yw3fEK5SsR/tXfhMdhXf9ewK
         E3ZA==
X-Gm-Message-State: AOJu0YwBzfs6qISZtmqF1wuXB5/VhZ7Gk8nLnArxT4UMtoba0ky7GHwu
	VLti+ASTBhZRRpOzMHFVppbWqew7aQwLJjjK500BCN/UWr71GuNjwyx9zqKx9sPu
X-Gm-Gg: Acq92OEjK3Z2geNphJgzKbINXINv44Zkc5E9HYEnoCUQmCdeDNJTxF1M+BaREmHHdm0
	08CbaB5CRrrueB1hKNYdZ8PKAvi6qbN/Rue8fidWPQuULWst7hWKOW4T4W0BXiFkO7OIqyFi3ks
	/bntj/28Og1tUKkbNXJFTey53eIpy/EZ26KJ6PYSgWRLBxlfKoPqjnYsKD0PLDda9b7ERnuQ0F3
	sFqMur3f9bx5ar8DdsNYSyXQjojGLByiwWy5frTMvD6FYSuVuWc3ZQY17QTId8bXj9SkYOMrAI0
	544ugZpVUpkAFCIpzIlsGIVpcTNryuU5YK6CDh0RW1iXcX1H85zLDPYBhltZrdrJaa2VT95Ynzp
	TZNMIxSq983Au4KDBA+tjKUhZnIguT84WLvwPXHMhbZ9Wov/5SFlGWv/wGnuDd8Q4iDJzEGX+ZB
	BXi0wMsyFBb0KP8Qv3eCU1qNLswg==
X-Received: by 2002:a05:600c:8596:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-4903604ccb3mr48025785e9.3.1779385699432;
        Thu, 21 May 2026 10:48:19 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Thu, 21 May 2026 20:45:22 +0300
Message-ID: <67f47fe59e2d3f66583c3a7ae82db036d57dc07a.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1779385700-B6169DB1-2BAA46EE/0/0
X-purgate-type: clean
X-purgate-size: 21029
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 324A05AA8D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Before continuing suspend, also verify that the physical CPU interface
has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
read an unimplemented AP1R register.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- abort suspend when the physical Group 1 active-priority state is still
  present, deriving accessible ICC_AP1R<n>_EL1 registers from
  ICC_CTLR_EL1.PRIbits;
- re-enable the redistributor before restoring CPU and virtual interface
  state on the suspend abort path;
- panic if the redistributor cannot be re-enabled on the suspend abort path;
- avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entries
  for a partially populated last SPI block;
- disable Distributor group forwarding while preserving affinity routing
  state before restoring Distributor configuration;
- disable SPI/eSPI forwarding and wait for RWP before restoring
  GICD_ICFGR<n>.Int_config.

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
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 458 ++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 4 files changed, 466 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 847da26ff7..a63c8c4979 100644
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
index a2553e647e..64fd772d65 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1076,12 +1076,12 @@ out:
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
@@ -1188,7 +1188,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1924,6 +1924,450 @@ static bool gic_dist_supports_lpis(void)
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
+                                      unsigned int i, unsigned int nr_irqs,
+                                      bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
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
+                                         unsigned int i, unsigned int nr_irqs,
+                                         bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+}
+
+static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
+                                          unsigned int i, unsigned int nr_irqs,
+                                          bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+}
+
+static void gicv3_disable_spi_irq_block(unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+}
+
+static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
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
+static int gicv3_check_ap1r(unsigned int n, register_t apr)
+{
+    if ( !apr )
+        return 0;
+
+    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=%#"
+           PRIregister"\n", n, apr);
+
+    return -EBUSY;
+}
+
+static int gicv3_check_active_priorities(register_t ctlr)
+{
+    unsigned int pribits = MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK) + 1;
+    int ret;
+
+    /*
+     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1,
+     * so only the physical Group 1 active-priority registers are relevant
+     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, not
+     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_EL1 is
+     * only implemented with at least 6 physical priority bits, and
+     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
+     */
+    switch ( pribits )
+    {
+    case 8:
+    case 7:
+        ret = gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
+        if ( ret )
+            return ret;
+        ret = gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    case 6:
+        ret = gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    default:
+        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
+    }
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i, nr_irqs;
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
+    ret = gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
+    if ( ret )
+        goto out_enable_iface;
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
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                  false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32, true);
+#endif
+
+    return 0;
+
+ out_enable_iface:
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
+
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
+    unsigned int i, nr_irqs;
+    uint32_t dist_ctlr;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    dist_ctlr = gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
+
+    /* Disable group forwarding while preserving affinity routing state. */
+    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /*
+     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
+     * while the interrupt is individually enabled is UNPREDICTABLE.
+     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
+     * as the per-SPI disable mechanism.
+     */
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_disable_spi_irq_block(i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_disable_spi_irq_block(i, true);
+#endif
+
+    gicv3_dist_wait_for_rwp();
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                     false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, 32,
+                                     true);
+    }
+#endif
+
+    if ( dist_ctlr )
+    {
+        for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        {
+            nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i,
+                                          nr_irqs, false);
+        }
+
+#ifdef CONFIG_GICV3_ESPI
+        for ( i = 0; i < gic_number_espis() / 32; i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, i,
+                                          32, true);
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
@@ -1998,6 +2442,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2037,6 +2485,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f3c11d871e..2261620316 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -16,6 +16,11 @@
 #define ICC_SRE_EL1               S3_0_C12_C12_5
 #define ICC_IGRPEN1_EL1           S3_0_C12_C12_7
 
+#define ICC_AP1R0_EL1             S3_0_C12_C9_0
+#define ICC_AP1R1_EL1             S3_0_C12_C9_1
+#define ICC_AP1R2_EL1             S3_0_C12_C9_2
+#define ICC_AP1R3_EL1             S3_0_C12_C9_3
+
 #define ICH_VSEIR_EL2             S3_4_C12_C9_4
 #define ICC_SRE_EL2               S3_4_C12_C9_5
 #define ICH_HCR_EL2               S3_4_C12_C11_0
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 3714cfeb7d..f741587322 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -94,12 +94,15 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
 #define GICD_IROUTER_SPI_MODE_ANY    (1UL << 31)
 
 #define GICC_CTLR_EL1_EOImode_drop   (1U << 1)
+#define ICC_CTLR_EL1_PRIBITS_SHIFT   8
+#define ICC_CTLR_EL1_PRIBITS_MASK    (0x7U << ICC_CTLR_EL1_PRIBITS_SHIFT)
 
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
-- 
2.43.0


