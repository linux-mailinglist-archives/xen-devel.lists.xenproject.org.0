Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJTLE2035mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6642D051
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286089.1567233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZG-0005CU-46; Mon, 20 Apr 2026 14:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286089.1567233; Mon, 20 Apr 2026 14:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZG-0005AN-0o; Mon, 20 Apr 2026 14:25:42 +0000
Received: by outflank-mailman (input) for mailman id 1286089;
 Mon, 20 Apr 2026 14:25:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZE-00050r-Ee
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZD-00DjKj-RW
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375d-bab6-0a2a0a5309dd-0a2a45039354-22
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:39 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63762-672d-0a2a45030019-d98c6eacb926-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:39 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7721758;
 Mon, 20 Apr 2026 07:25:32 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C8DB3F7B4;
 Mon, 20 Apr 2026 07:25:37 -0700 (PDT)
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
	t=1776695138; bh=qbZ9gSgQc0geGpYjPZJQGW1qcpmolTJxT0noQsC0zDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1kcUv112S14tZVWxdUhhSO4oRu3GAcs+kbCy1eOQNVfFvzWDYuiJ8OsPJHqMoWTY
	 Qo+c22nZFCkqQ1EuoRA2VDf2weuePmyPvw1Z/Cee4sYHMbfqN1i1L+fM+Uk2JVgmjZ
	 2txr7iS7VplQUEYS5PD2NC86sqk6OIbs41R6HeOQ=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Hari Limaye <hari.limaye@arm.com>,
	Harry Ramsey <harry.ramsey@arm.com>
Subject: [PATCH 4/8] arm/mpu: Support vCPU context switch on MPU systems
Date: Mon, 20 Apr 2026 15:25:20 +0100
Message-Id: <20260420142524.1804073-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1776695139-29D7B938-47532FEC/0/0
X-purgate-type: clean
X-purgate-size: 4660
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,arm.com:dkim,arm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03A6642D051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

Implement the functions p2m_save_state and p2m_restore_state for MPU
systems. Unlike on MMU systems, where we simply update VTTBR_EL2 with
the incoming guest's p2m table on context switch, we have to disable the
outgoing guest's p2m memory regions and enable the incoming guest's p2m
memory regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/include/asm/mpu/cpregs.h |  4 +++
 xen/arch/arm/mpu/mm.c                 | 11 +++++--
 xen/arch/arm/mpu/p2m.c                | 47 +++++++++++++++++++++++++--
 3 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index 9f3b32acd79f..5a3d92cf5389 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,6 +6,9 @@
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
 
+/* CP15 CR2: Virtualization System Control register */
+#define VSCTLR          p15,4,c2,c0,1
+
 /* CP15 CR6: Protection Region Enable Register */
 #define HPRENR          p15,4,c6,c1,1
 
@@ -88,6 +91,7 @@
 #define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
 #define PRSELR_EL2      HPRSELR
+#define VSCTLR_EL2      VSCTLR
 #endif /* CONFIG_ARM_32 */
 
 #endif /* __ARM_MPU_CPREGS_H */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 4ee58ded5ad6..5ed77355a5f9 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -421,9 +421,14 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     return 0;
 }
 
-int check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
+static bool check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags,
+                              bool p2m)
 {
-    if ( flags_has_rwx(flags) )
+    /*
+     * Mappings should not be both Writeable and Executable, unless
+     * it is for guest P2M mapping.
+     */
+    if ( flags_has_rwx(flags) && !p2m )
     {
         printk("Mappings should not be both Writeable and Executable\n");
         return false;
@@ -450,7 +455,7 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m)
 {
     int rc;
 
-    if ( !check_mpu_mapping(base, limit, flags) )
+    if ( !check_mpu_mapping(base, limit, flags, p2m) )
         return -EINVAL;
 
     spin_lock(&xen_mpumap_lock);
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f2482237412b..bf87c65c106c 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -285,14 +285,57 @@ int p2m_init(struct domain *d)
     return 0;
 }
 
+static int p2m_xenmpu_update(struct p2m_domain *p2m, bool online)
+{
+    pr_t *p2m_table;
+    unsigned int flags = online ? _PAGE_PRESENT : 0;
+
+    p2m_table = (pr_t *)page_to_virt(p2m->root);
+    if ( !p2m_table )
+        return -EINVAL;
+
+    for ( unsigned int i = 0; i < p2m->nr_regions; i++ )
+    {
+        paddr_t base = pr_get_base(&p2m_table[i]);
+        paddr_t limit = pr_get_limit(&p2m_table[i]) + 1;
+        unsigned int region_flags;
+
+        region_flags = build_p2m_flags(region_get_p2m(&p2m_table[i])) | flags;
+        if ( xen_mpumap_update(base, limit, region_flags, true) )
+        {
+            printk(XENLOG_G_ERR "Unable to update MPU memory mapping with P2M region %#"PRIpaddr"-%#"PRIpaddr"\n",
+                   base, limit);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
+/* p2m_save_state and p2m_restore_state work in pair. */
 void p2m_save_state(struct vcpu *p)
 {
-    BUG_ON("unimplemented");
+    struct p2m_domain *p2m = p2m_get_hostp2m(p->domain);
+
+    p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
+
+    if ( p2m_xenmpu_update(p2m, false) )
+        panic("Failed to offline P2M MPU memory mapping\n");
 }
 
 void p2m_restore_state(struct vcpu *n)
 {
-    BUG_ON("unimplemented");
+    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
+    uint8_t *last_vcpu_ran = &p2m->last_vcpu_ran[smp_processor_id()];
+
+    WRITE_SYSREG(n->arch.sctlr, SCTLR_EL1);
+    WRITE_SYSREG(n->arch.hcr_el2, HCR_EL2);
+
+    WRITE_SYSREG(p2m->vsctlr, VSCTLR_EL2);
+    if ( p2m_xenmpu_update(p2m, true) )
+        panic("Failed to online P2M MPU memory mapping\n");
+
+    *last_vcpu_ran = n->vcpu_id;
 }
 
 void p2m_final_teardown(struct domain *d)
-- 
2.34.1


