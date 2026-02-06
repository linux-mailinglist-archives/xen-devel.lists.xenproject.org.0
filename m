Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCmXNSSuhWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B0FBC46
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222985.1530661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHjF-0007OL-AP; Fri, 06 Feb 2026 09:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222985.1530661; Fri, 06 Feb 2026 09:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHjF-0007ML-6j; Fri, 06 Feb 2026 09:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1222985;
 Fri, 06 Feb 2026 09:02:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaI+=AK=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1voHjD-0006qi-RA
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:02:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 87e09567-033a-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:02:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089881516;
 Fri,  6 Feb 2026 01:02:08 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 770163F778;
 Fri,  6 Feb 2026 01:02:13 -0800 (PST)
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
X-Inumbo-ID: 87e09567-033a-11f1-b161-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] arm/mpu: Implement p2m tables
Date: Fri,  6 Feb 2026 09:01:55 +0000
Message-ID: <20260206090155.68466-4-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206090155.68466-1-harry.ramsey@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 542B0FBC46
X-Rspamd-Action: no action

Implement `p2m_alloc_table`, `p2m_init` and `p2m_final_teardown` for MPU
systems. Additionally implement a helper function `generate_vsctlr` for
p2m initalization.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/include/asm/arm32/mpu.h |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h |  2 +
 xen/arch/arm/include/asm/mpu.h       |  5 ++
 xen/arch/arm/mpu/p2m.c               | 71 ++++++++++++++++++++++++++--
 4 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 2cf0f8cbac..d565230f84 100644
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
index 4f694190a8..8b86a03fee 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -7,6 +7,8 @@
 
 #define MPU_REGION_RES0        (0xFFFFULL << 48)
 
+#define VSCTLR_VMID_SHIFT      48
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 72fa5b00b8..4ae583a7e9 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -87,6 +87,11 @@ static inline bool region_is_valid(const pr_t *pr)
     return pr->prlar.reg.en;
 }
 
+static inline register_t generate_vsctlr(uint16_t vmid)
+{
+    return ((register_t)vmid << VSCTLR_VMID_SHIFT);
+}
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* __ARM_MPU_H__ */
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6a..1598f9ab64 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -28,10 +28,62 @@ void p2m_dump_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+static int __init p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    pr_t* p2m_map;
+
+    p2m_map = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
+    if ( !p2m_map )
+    {
+        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU mapping table\n", d);
+        return -ENOMEM;
+    }
+    clear_page(p2m_map);
+
+    p2m->root = virt_to_page((const void *)p2m_map);
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
+
+    for_each_possible_cpu(cpu)
+       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
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
+    p2m->vsctlr = generate_vsctlr(p2m->vmid);
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return rc;
 }
 
 void p2m_save_state(struct vcpu *p)
@@ -46,7 +98,20 @@ void p2m_restore_state(struct vcpu *n)
 
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
+        free_xenheap_pages(p2m->root, P2M_ROOT_ORDER);
+
+    p2m->root = NULL;
+
+    p2m_free_vmid(d);
+
+    p2m->domain = NULL;
 }
 
 bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
-- 
2.43.0


