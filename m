Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIf7JHY35mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44B42D08C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286092.1567252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZJ-0005kX-Ts; Mon, 20 Apr 2026 14:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286092.1567252; Mon, 20 Apr 2026 14:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZJ-0005iF-Lh; Mon, 20 Apr 2026 14:25:45 +0000
Received: by outflank-mailman (input) for mailman id 1286092;
 Mon, 20 Apr 2026 14:25:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZH-0005QG-Bq
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZG-007oXE-P0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63758-5cb7-0a2a0a5109dd-0a2a450cba0e-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:42 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63765-62f1-0a2a450c0019-d98c6eacb948-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:42 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8F921516;
 Mon, 20 Apr 2026 07:25:35 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E6D3F7B4;
 Mon, 20 Apr 2026 07:25:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776695141; bh=Al7AOCud4lNxulX4r/nJBRzdtBBDHwwUvlyzIFQQIKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X9UfO1TxDU5WDQ4XOfEZVuqUA7Cxo97hg/3n6y2wcT9I8yPJMNwz+5dgCMK66TUJZ
	 rkc2y93ONuRunueaVzcWPnz0v1koP+p3ws8Dlg86Oe79Nld4MwWdwHx0SLcvf1121n
	 yBzfkKc94C+c3O/uRbURDIbCVDXr65wqAelBMRSo=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 6/8] xen/arm: dump debug message in MPU system
Date: Mon, 20 Apr 2026 15:25:22 +0100
Message-Id: <20260420142524.1804073-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1776695142-F4C07CF5-F184B584/0/0
X-purgate-type: clean
X-purgate-size: 4208
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4D44B42D08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

A set of helpers dump_xxx and show_registers are responsible for
dumping memory mapping info and register info when debugging.
In this commit, we implement them all in MPU system too.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/mpu/mm.c  | 12 +++++++++++-
 xen/arch/arm/mpu/p2m.c | 40 +++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/traps.c   |  8 ++++++++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 5ed77355a5f9..459fb952d125 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -554,7 +554,17 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
 void dump_hyp_walk(vaddr_t addr)
 {
-    BUG_ON("unimplemented");
+    uint8_t i = 0;
+    pr_t region;
+
+    for ( i = 0; i < max_mpu_regions; i++ )
+    {
+        read_protection_region(&region, i);
+        if ( region_is_valid(&region) )
+            printk(XENLOG_INFO
+                   "Walking hypervisor MPU memory region [%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+                   i, pr_get_base(&region), pr_get_limit(&region));
+    }
 }
 
 /* Release all __init and __initdata ranges to be reused */
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index bf87c65c106c..06c92a3ef41b 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -215,9 +215,47 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
 }
 
+static void dump_mpu_walk(pr_t *table, uint8_t nr_regions)
+{
+    uint8_t i = 0;
+
+    for ( ; i < nr_regions; i++ )
+    {
+        paddr_t base, limit;
+
+        if ( region_is_valid(&table[i]) )
+        {
+            base = pr_get_base(&table[i]);
+            limit = pr_get_limit(&table[i]);
+
+            printk(XENLOG_INFO
+                   "Walking MPU memory mapping table: Region[%u]: 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+                   i, base, limit);
+        }
+    }
+}
+
+void dump_p2m_lookup(struct domain *d, paddr_t addr)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    printk("dom%d IPA 0x%"PRIpaddr"\n", d->domain_id, addr);
+
+    printk("P2M @ %p mfn:%#"PRI_mfn"\n",
+           p2m->root, mfn_x(page_to_mfn(p2m->root)));
+
+    dump_mpu_walk((pr_t *)page_to_virt(p2m->root), p2m->nr_regions);
+}
+
 void p2m_dump_info(struct domain *d)
 {
-    BUG_ON("unimplemented");
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m_read_lock(p2m);
+    printk("p2m mappings for domain %d (vmid %d):\n",
+           d->domain_id, p2m->vmid);
+    printk("  Number of P2M Memory Region: %u \n", p2m->nr_regions);
+    p2m_read_unlock(p2m);
 }
 
 static int p2m_alloc_table(struct domain *d)
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 081bd2e51979..fba7d6c00e37 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -718,6 +718,8 @@ struct reg_ctxt {
 #ifdef CONFIG_MMU
     /* Hypervisor-side state */
     uint64_t vttbr_el2;
+#else
+    uint64_t vsctlr_el2;
 #endif
 };
 
@@ -918,6 +920,8 @@ static void _show_registers(const struct cpu_user_regs *regs,
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
 #ifdef CONFIG_MMU
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+#else
+    printk(" VSCTLR_EL2: %016"PRIx64"\n", ctxt->vsctlr_el2);
 #endif
     printk("\n");
 
@@ -959,6 +963,8 @@ void show_registers(const struct cpu_user_regs *regs)
 #endif
 #ifdef CONFIG_MMU
     ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#else
+    ctxt.vsctlr_el2 = READ_SYSREG(VSCTLR_EL2);
 #endif
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
@@ -985,6 +991,8 @@ void vcpu_show_registers(struct vcpu *v)
 
 #ifdef CONFIG_MMU
     ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+#else
+    ctxt.vsctlr_el2 = v->domain->arch.p2m.vsctlr;
 #endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
-- 
2.34.1


