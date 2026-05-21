Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEdbN4RFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E825AA8F5
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315651.1585372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VM-0001P2-Eo; Thu, 21 May 2026 17:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315651.1585372; Thu, 21 May 2026 17:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VM-0001M8-8x; Thu, 21 May 2026 17:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1315651;
 Thu, 21 May 2026 17:48:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VK-00017d-Jq
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VK-003wjj-0Q
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f455d-e002-0a2a0a5209dd-0a2a4507b53c-2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:17 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4561-229c-0a2a45070019-d155802be131-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:17 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso63009745e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:17 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385697; x=1779990497; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJhOSVjOo3e4ttnIxYNTbaGwn5HUF03ETdQ3xyz7eZQ=;
        b=DLCQSlV7sth1ZFQoBDU2Htmzxb9j5N3RobZTnwTdortmqySURauDKbE6RyedDshiXE
         ExP1yHJJhrwHs1blqCVRaKpaFC1PdxXjzt9KMIaIXNuWu+OXkRvhwdHpUHxmf9L3QA2E
         S287CD1ljmr9eJWCkUIc+OguDnes+ZeVj0UcyntZmPfbsdpezTOk5pcm+qWV2Ubf3w9c
         xYfnIdcOGhRmNfYGkNyBepOSacwResgcaR+MpmsFej7BETrRC887KBHZ0wiXrwg3ux/1
         u2ATMOHAAihEUE0P5GtMeKUeMduWfxK5wfRWcOWBTsteDg+exb6Sv3DB7glC83F4lQQN
         bsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385697; x=1779990497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJhOSVjOo3e4ttnIxYNTbaGwn5HUF03ETdQ3xyz7eZQ=;
        b=d8ChgT0FcW9CbsVHafmz61xCTIPVinJpl6gCq7S6o8wDQnzgWGSNkuB/8jSE2NHjSX
         9caL6vjgnJ1PkS0MZQQzRq2u6HLkmVmq4lXmpEmRh9UrMTPcEjJKm/cY7xBIfzDrrf/F
         hUH7LjiAEyg9CKI0vckofB12kjOMc/aESh7h0dzvaSF0MRd2RbTavnQKjoJyZuR882sx
         Isv6qrQKsrIfy68JnNAhiTUP9LgJePI9+J4MXvnd9NmrcY5gw7OsFLO+zjdTr/ez59j4
         A7tYtfgW0KaWOSr5IkApSU8PpNNavWzBLO4qe5pResR2YB70xpZ/ZOIQBl4OpwCwX/hF
         P6CQ==
X-Gm-Message-State: AOJu0Yyl5A+rSalqTkX1ZpA9gK810jzNu/iounWWKpHw7ePJzLrms4kZ
	M8pfn4mOtaGNZnKgKXZAjJ5Fnj29fDtw+v7rrWoVQWiSYPLPQU8dWtS3dFcmLA3H
X-Gm-Gg: Acq92OHNV4UZ4c2EfE931cxOmebsHVonwsYAVOBX6KFzndtuLFl8bpOdifIzSbCcSax
	HcKWzNpKXspKWf9sS15ayh02EcV7zPBgmdRT8mBB91oKm615NIm1DP/W2LNmUHmSurOp9/yqsjC
	EPC6i3uwa/zgW0nZkbA+gZqS6EslY55wS2IxKe9V4/YYp5SJdb0uJfNsQmx94PMWE6uSk5Cz/qE
	dXC06EA8hOZF76UMJ3e7XfP59R+s4FC/FydNlS33vQSn8EbcF+xwGXVq/f7jLTMFCeCrj2pF/QO
	9UZei91/A+ZeMPfnAbUUn789H2SLyUQQWe1I9DVGiOvCMOn26RPEeKMH6/Yq3EiryUB1+w0wuOV
	A/twgPppy7CBd65Dlz/iDD9+99w9+u0ub5S1xoKTOuPesKBoRWdQqcpTzC8RSKDO0gtkyAecZ/u
	dl9u972gwbHolfkMF+PlKlW+eBw/aJrOUhc4pI
X-Received: by 2002:a05:600c:4690:b0:490:402f:324d with SMTP id 5b1f17b1804b1-490402f34b6mr10884925e9.29.1779385697115;
        Thu, 21 May 2026 10:48:17 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Thu, 21 May 2026 20:45:20 +0300
Message-ID: <ae553923955259dae7d680d427fca36824657ecf.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779385697-22573C48-1E81D96B/0/0
X-purgate-type: clean
X-purgate-size: 13521
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xilinx.com:email];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 93E825AA8F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
is intentionally excluded. CPU-interface active-priority state is also
not restored across suspend/resume. Xen reaches the final suspend path
at a quiescent point, so there is no active-priority execution context
to replay after resume. Enforce this with a runtime check after
disabling the CPU interface: if any implemented GICC_APRn word is still
non-zero, restore GICC_CTLR and abort suspend with -EBUSY.

This does not apply to distributor active state. With GICv2 EOImode==1,
EOIR only drops the interrupt priority; final deactivation is a separate
step. For guest-routed interrupts, Xen can have already EOIed the physical
IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
GICD_ISACTIVER is preserved as architectural in-flight interrupt state.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Limit GICC_APR<n> active-priority checks to APR bits visible from
  the Xen CPU-interface view.
- Avoid touching reserved GICD_IPRIORITYR/GICD_ITARGETSR words when the
  last implemented interrupt block is partial.
- Restore distributor configuration before restoring interrupt enable
  state, so GICD_ICFGR is written while the corresponding interrupts are
  disabled.

Changes in V9:
- Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
  registers hold no state (read-only on MP, RAZ/WI on UP).
- Add a runtime GICC_APRn quiescence check after disabling the CPU
  interface, and restore GICC_CTLR before returning -EBUSY.

Changes in V8:
- disable cpu interface + distributor before suspend
- change 0xffffffff to GENMASK;
- cosmetic changes;

Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU
  interface; it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure,
  since suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 226 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++
 xen/arch/arm/include/asm/gic.h |  12 ++
 3 files changed, 267 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..a0ef6ffc7f 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1108,6 +1108,223 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr - 1);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        /* Includes banked SGI/PPI state for the boot CPU. */
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+#define GICV2_NR_APRS          4
+#define GICV2_APR_BITS_PER_REG 32U
+
+static int gicv2_check_active_priorities(uint32_t bpr)
+{
+    unsigned int i, apr_bits, nr_aprs;
+
+    /*
+     * Xen writes GICC_BPR to 0 during CPU init and does not change it. Per
+     * IHI0048B.b, a write below the implementation minimum reads back as the
+     * minimum supported BPR value. Table 4-47 maps that Xen-visible BPR value
+     * to the visible GICC_APR<n> bits. Avoid reading APR registers outside
+     * that visible range.
+     *
+     * This covers both GICv2 with and without Security Extensions.
+     */
+    apr_bits = 1U << (7 - (bpr & 0x7));
+    nr_aprs = DIV_ROUND_UP(apr_bits, GICV2_APR_BITS_PER_REG);
+
+    ASSERT(nr_aprs <= GICV2_NR_APRS);
+
+    for ( i = 0; i < nr_aprs; i++ )
+    {
+        unsigned int bits = min(GICV2_APR_BITS_PER_REG,
+                                apr_bits - i * GICV2_APR_BITS_PER_REG);
+        uint32_t mask = GENMASK(bits - 1, 0);
+        uint32_t apr = readl_gicc(GICC_APR + i * 4) & mask;
+
+        if ( !apr )
+            continue;
+
+        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=%#08x\n",
+               i, apr);
+        return -EBUSY;
+    }
+
+    return 0;
+}
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+    int ret;
+
+    /* Save GICC_CTLR configuration. */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+
+    /* Quiesce the GIC CPU interface before suspend. */
+    gicv2_cpu_disable();
+
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    /*
+     * Check the active-priority state for the group Xen drives through the
+     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityExtn and
+     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both cases
+     * the relevant state is visible through GICC_APRn. The APR layout is
+     * implementation-defined, so only test the bits visible from Xen's CPU
+     * interface view instead of reading every possible APR register.
+     */
+    ret = gicv2_check_active_priorities(gic_ctx.cpu.bpr);
+    if ( ret )
+    {
+        writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+        return ret;
+    }
+
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+
+    /* Save GICD configuration */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+
+        /*
+         * Save distributor active state as part of the hypervisor-owned
+         * physical interrupt state. In GICv2 EOImode==1, EOIR only drops the
+         * priority; final deactivation is separate. For guest-routed
+         * interrupts, Xen may have EOIed the physical IRQ while the guest/vGIC
+         * side still owns the deactivate step. Therefore GICD_ISACTIVER can
+         * legitimately remain set even though transient SGI pending state and
+         * CPU-interface active-priority state are expected to be quiesced here.
+         */
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->isenabler);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+    }
+
+    /* Restore distributor control state. */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1312,6 +1529,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1355,6 +1577,10 @@ static const struct gic_hw_operations gicv2_ops = {
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
index ee75258fc3..7727ffed5a 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -432,6 +432,35 @@ int gic_iomem_deny_access(struct domain *d)
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
index ff22dea40d..fbf0d69edd 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,12 @@ extern int gicv_setup(struct domain *d);
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
@@ -444,6 +450,12 @@ struct gic_hw_operations {
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


