Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJOzFIFe1mmNEggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:56:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D853D3BD3E8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:56:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276215.1561784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNp-0002Cq-Ky; Wed, 08 Apr 2026 13:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276215.1561784; Wed, 08 Apr 2026 13:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNp-0002AI-HW; Wed, 08 Apr 2026 13:55:53 +0000
Received: by outflank-mailman (input) for mailman id 1276215;
 Wed, 08 Apr 2026 13:55:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wATNn-0001w4-C5
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:55:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wATNm-00AFz6-OB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:55:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e54-e002-0a2a0a5209dd-0a2a4502d0da-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:50 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.0)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e65-42fa-0a2a45020019-d98c6eacbcc8-1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:50 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE14A2D95;
 Wed,  8 Apr 2026 06:55:43 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 538EB3F641;
 Wed,  8 Apr 2026 06:55:48 -0700 (PDT)
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
	t=1775656549; bh=MZfKdfd+Fjj1nByHopUcpOrzmuP31AXPE7A1SX/KVCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kece+ckOVuHEDt+c/9tCpgkrxKngvpG1tEBgmcyidiwZ3p1OHEQHQUAHP7pPUU3A2
	 gxKcYy1aY2+wxvShLu/vmmgvoENvxwEt87duuVzn1GeC6DZWaByS+0awZahbr9/+V4
	 50lnYBTq18dbPms5Uro++lahgvoc/jiRQBeU3zHM=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Harry Ramsey <harry.ramsey@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/3] arm/mpu: Implement p2m tables
Date: Wed,  8 Apr 2026 14:55:31 +0100
Message-Id: <20260408135531.1744388-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408135531.1744388-1-luca.fancellu@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775656550-ACB37CD1-35573629/0/0
X-purgate-type: clean
X-purgate-size: 5725
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D853D3BD3E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Harry Ramsey <harry.ramsey@arm.com>

Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
systems.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3:
- Check for alloc_xenheap_pages allocation
- Clear additional page allocated for ARM64
- Add check for INVALID_VCPU_ID
- Remove unnecessary function generate_vsctlr
- Code formatting fixes
---
 xen/arch/arm/include/asm/arm32/mpu.h |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h |  2 +
 xen/arch/arm/include/asm/mpu/p2m.h   | 12 +++++
 xen/arch/arm/include/asm/p2m.h       |  5 ++
 xen/arch/arm/mpu/p2m.c               | 78 ++++++++++++++++++++++++++--
 5 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 2cf0f8cbacae..d565230f84ee 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -11,6 +11,8 @@
  */
 #define MPU_REGION_RES0       0x0
 
+#define VSCTLR_VMID_SHIFT     16
+
 /* Hypervisor Protection Region Base Address Register */
 typedef union {
     struct {
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 4f694190a8a3..8b86a03fee44 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -7,6 +7,8 @@
 
 #define MPU_REGION_RES0        (0xFFFFULL << 48)
 
+#define VSCTLR_VMID_SHIFT      48
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index e46d9e757a1d..39fc0c944916 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -3,8 +3,20 @@
 #ifndef __ARM_MPU_P2M_H__
 #define __ARM_MPU_P2M_H__
 
+#include <xen/bitops.h>
+#include <xen/macros.h>
+#include <xen/page-size.h>
+
 struct p2m_domain;
 
+/*
+ * The architecture allows at most 255 EL2 MPU memory regions. The size of the
+ * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
+ * and 16 bytes on AArch32 (requiring one 4KB page).
+ */
+#define P2M_ROOT_PAGES DIV_ROUND_UP(255 * sizeof(pr_t), PAGE_SIZE)
+#define P2M_ROOT_ORDER get_count_order(P2M_ROOT_PAGES)
+
 static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
 
 static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..ed1b6dd40f40 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -48,8 +48,13 @@ struct p2m_domain {
     /* Current VMID in use */
     uint16_t vmid;
 
+#ifdef CONFIG_MMU
     /* Current Translation Table Base Register for the p2m */
     uint64_t vttbr;
+#else
+    /* Current Virtualization System Control Register for the p2m */
+    register_t vsctlr;
+#endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
     gfn_t max_mapped_gfn;
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6aa8..ec8f630acd90 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -28,10 +28,69 @@ void p2m_dump_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+static int p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    void *table = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
+
+    if ( !table )
+    {
+        printk(XENLOG_G_ERR "%pd: p2m: unable to allocate P2M MPU mapping table\n",
+               d);
+        return -ENOMEM;
+    }
+
+    p2m->root = virt_to_page(table);
+
+    for (int i = 0; i < P2M_ROOT_PAGES; i++)
+        clear_page(page_to_virt(p2m->root + i));
+
+    return 0;
+}
+
 int p2m_init(struct domain *d)
 {
-    BUG_ON("unimplemented");
-    return -EINVAL;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc = 0;
+    unsigned int cpu;
+
+    rwlock_init(&p2m->lock);
+
+    p2m->vmid = INVALID_VMID;
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
+    p2m->default_access = p2m_access_rwx;
+    /* mem_access is NOT supported in MPU system. */
+    p2m->mem_access_enabled = false;
+
+    /* Ensure that the type chosen is large enough for MAX_VIRT_CPUS. */
+    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
+    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < INVALID_VCPU_ID);
+
+    for_each_possible_cpu(cpu)
+        p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
+
+    /*
+     * "Trivial" initialization is now complete. Set the backpointer so that
+     * p2m_teardown() and related functions know to do something.
+     */
+    p2m->domain = d;
+
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+
+    p2m->vsctlr = ((register_t)p2m->vmid << VSCTLR_VMID_SHIFT);
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+    {
+        p2m_free_vmid(d);
+        return rc;
+    }
+
+    return 0;
 }
 
 void p2m_save_state(struct vcpu *p)
@@ -46,7 +105,20 @@ void p2m_restore_state(struct vcpu *n)
 
 void p2m_final_teardown(struct domain *d)
 {
-    BUG_ON("unimplemented");
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    /* p2m not actually initialized */
+    if ( !p2m->domain )
+        return;
+
+    if ( p2m->root )
+        free_xenheap_pages(page_to_virt(p2m->root), P2M_ROOT_ORDER);
+
+    p2m->root = NULL;
+
+    p2m_free_vmid(d);
+
+    p2m->domain = NULL;
 }
 
 bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
-- 
2.34.1


