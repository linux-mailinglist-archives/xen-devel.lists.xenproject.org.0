Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPzUCGo35mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB78C42D042
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286086.1567206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZC-0004Sx-5G; Mon, 20 Apr 2026 14:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286086.1567206; Mon, 20 Apr 2026 14:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZC-0004RD-2W; Mon, 20 Apr 2026 14:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1286086;
 Mon, 20 Apr 2026 14:25:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZ9-0004DT-V4
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZ9-00DjKj-BW
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63750-bab6-0a2a0a5309dd-0a2a450a9acc-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:35 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e6375e-56b3-0a2a450a0019-d98c6eaccd08-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:35 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7A316F2;
 Mon, 20 Apr 2026 07:25:28 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 769003F7B4;
 Mon, 20 Apr 2026 07:25:32 -0700 (PDT)
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
	t=1776695133; bh=J3CyMkSY0KMV9Fw732pi6w6qLPzHaJTo8ZwxErzPiWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9xVvGHL8pn8PbTX3/4XMRA1Ddaaa52XlXWInaCUNZoMlcG0PmKjboXUKjXZsIevC
	 ktjQHQGMMSq7GJgB5qJXYwJN0p+niIbVJn8mqTLdQM2aa5NLKSekU6SmyqZY3f0fXQ
	 bGDcDjkoQtI2ahVJuxUKu1KR2fvLaAYUgAlQ0Ni4=
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
Subject: [PATCH 1/8] xen/arm: Implement p2m_set_entry for MPU systems
Date: Mon, 20 Apr 2026 15:25:17 +0100
Message-Id: <20260420142524.1804073-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1776695135-CE36B8B7-645A68D7/0/0
X-purgate-type: clean
X-purgate-size: 12640
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB78C42D042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

Implement the function `p2m_set_entry`, which is responsible for
inserting a new entry into the p2m tables, for MPU systems.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/include/asm/arm32/mpu.h |   3 +-
 xen/arch/arm/include/asm/arm64/mpu.h |   3 +-
 xen/arch/arm/include/asm/mpu/mm.h    |   3 +-
 xen/arch/arm/include/asm/mpu/p2m.h   |  10 +++
 xen/arch/arm/include/asm/p2m.h       |   3 +
 xen/arch/arm/mpu/mm.c                |  43 ++++++----
 xen/arch/arm/mpu/p2m.c               | 123 ++++++++++++++++++++++++++-
 7 files changed, 167 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index d565230f84ee..ab58df079920 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -42,7 +42,8 @@ typedef struct {
     prbar_t prbar;
     prlar_t prlar;
     uint8_t refcount;
-    uint8_t pad[7];     /* Pad structure to 16 Bytes */
+    uint8_t p2m_type;
+    uint8_t pad[6];     /* Pad structure to 16 Bytes */
 } pr_t;
 
 #endif /* __ASSEMBLER__ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 8b86a03fee44..c82624f0f2cf 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -41,7 +41,8 @@ typedef struct {
     prbar_t prbar;
     prlar_t prlar;
     uint8_t refcount;
-    uint8_t pad[15];    /* Pad structure to 32 Bytes */
+    uint8_t p2m_type;
+    uint8_t pad[14];    /* Pad structure to 32 Bytes */
 } pr_t;
 
 #endif /* __ASSEMBLER__ */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 1b5ffa5b644d..24bffdee4fb6 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -75,9 +75,10 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
  * @param base      Base address of the range to map (inclusive).
  * @param limit     Limit address of the range to map (exclusive).
  * @param flags     Flags for the memory range to map.
+ * @param p2m       True for a stage 2 mapping, otherwise False.
  * @return          0 on success, negative on error.
  */
-int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m);
 
 /*
  * Creates a pr_t structure describing a protection region.
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index 39fc0c944916..b9c7be2d9dcc 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -21,6 +21,16 @@ static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
 
 static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
 
+static inline void region_set_p2m(pr_t *pr, p2m_type_t p2m_type)
+{
+    pr->p2m_type = p2m_type;
+}
+
+static inline p2m_type_t region_get_p2m(pr_t *pr)
+{
+    return pr->p2m_type;
+}
+
 #endif /* __ARM_MPU_P2M_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index ed1b6dd40f40..43b383885da0 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -54,6 +54,9 @@ struct p2m_domain {
 #else
     /* Current Virtualization System Control Register for the p2m */
     register_t vsctlr;
+
+    /* Number of MPU memory regions in P2M MPU memory mapping table. */
+    uint8_t nr_regions;
 #endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index aff88bd3a9c1..4ee58ded5ad6 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -317,13 +317,14 @@ static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
  * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
  * given memory range and flags, creating one if none exists.
  *
- * @param base  Base address (inclusive).
- * @param limit Limit address (exclusive).
- * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
+ * @param base      Base address (inclusive).
+ * @param limit     Limit address (exclusive).
+ * @param flags     Region attributes (a combination of PAGE_HYPERVISOR_XXX)
+ * @param p2m       True for a stage 2 mapping, otherwise False.
  * @return      0 on success, otherwise negative on error.
  */
 static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
-                                   unsigned int flags)
+                                   unsigned int flags, bool p2m)
 {
     bool flags_has_page_present;
     uint8_t idx;
@@ -399,6 +400,8 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
             return -ENOENT;
 
         xen_mpumap[idx] = pr_of_addr(base, limit, flags);
+        /* AP[0] always 1 for stage 2 */
+        xen_mpumap[idx].prbar.reg.ap_0 = (p2m ? 1 : 0);
 
         write_protection_region(&xen_mpumap[idx], idx);
     }
@@ -418,33 +421,41 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     return 0;
 }
 
-int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
+int check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
 {
-    int rc;
-
     if ( flags_has_rwx(flags) )
     {
         printk("Mappings should not be both Writeable and Executable\n");
-        return -EINVAL;
+        return false;
     }
 
     if ( base >= limit )
     {
         printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
                base, limit);
-        return -EINVAL;
+        return false;
     }
 
     if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
     {
         printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
                base, limit);
-        return -EINVAL;
+        return false;
     }
 
+    return true;
+}
+
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m)
+{
+    int rc;
+
+    if ( !check_mpu_mapping(base, limit, flags) )
+        return -EINVAL;
+
     spin_lock(&xen_mpumap_lock);
 
-    rc = xen_mpumap_update_entry(base, limit, flags);
+    rc = xen_mpumap_update_entry(base, limit, flags, p2m);
     if ( !rc )
         context_sync_mpu();
 
@@ -459,7 +470,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s < e);
 
-    return xen_mpumap_update(s, e, 0);
+    return xen_mpumap_update(s, e, 0, false);
 }
 
 int destroy_xen_mapping_containing(paddr_t s)
@@ -499,7 +510,7 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
                      unsigned int flags)
 {
     /* MPU systems have no translation, ma == va, so pass virt directly */
-    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
+    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags, false);
 }
 
 /*
@@ -520,7 +531,7 @@ void __init setup_mm_helper(void)
             paddr_t bank_end = bank_start + bank_size;
 
             /* Map static heap with one MPU protection region */
-            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
+            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR, false) )
                 panic("Failed to map static heap\n");
 
             break;
@@ -533,7 +544,7 @@ void __init setup_mm_helper(void)
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
-    return xen_mpumap_update(s, e, nf);
+    return xen_mpumap_update(s, e, nf, false);
 }
 
 void dump_hyp_walk(vaddr_t addr)
@@ -598,7 +609,7 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
     paddr_t start_pg = round_pgdown(start);
     paddr_t end_pg = round_pgup(start + len);
 
-    if ( xen_mpumap_update(start_pg, end_pg, flags) )
+    if ( xen_mpumap_update(start_pg, end_pg, flags, false) )
         return NULL;
 
     /* Mapped or already mapped */
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index ec8f630acd90..4a8595b1b25e 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -8,12 +8,131 @@
 #include <xen/sched.h>
 #include <xen/types.h>
 #include <asm/p2m.h>
+#include <asm/mpu.h>
+
+static inline unsigned int build_p2m_flags(p2m_type_t t)
+{
+    unsigned int flags = 0;
+
+    BUILD_BUG_ON(p2m_max_real_type > (1 << 4));
+
+    switch ( t )
+    {
+    case p2m_ram_rw:
+        /* Nothing to do, XN=0, RO=0 */
+        break;
+
+    case p2m_ram_ro:
+        flags |= _PAGE_RO;
+        break;
+
+    case p2m_invalid:
+        flags |= _PAGE_XN | _PAGE_RO;
+        break;
+
+    case p2m_max_real_type:
+        BUG();
+        break;
+
+    case p2m_mmio_direct_dev:
+    case p2m_mmio_direct_nc:
+    case p2m_mmio_direct_c:
+    case p2m_iommu_map_ro:
+    case p2m_iommu_map_rw:
+    case p2m_map_foreign_ro:
+    case p2m_map_foreign_rw:
+    case p2m_grant_map_ro:
+    case p2m_grant_map_rw:
+        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m permission in MPU system\n");
+        break;
+    }
+
+    flags |= MT_NORMAL;
+
+    return flags;
+}
+
+/*
+ * Check whether guest memory region [`sgfn`, `sgfn` + `nr_gfns`) is mapped in
+ * mpumap `table`.
+ *
+ * If the memory region is mapped, `idx` is set to the index of the associated
+ * MPU memory region and 0 is returned.
+ * If the memory region is not mapped, -ENOENT is returned.
+ */
+static int is_gfns_mapped(pr_t *table, uint8_t nr_regions, gfn_t sgfn,
+                          unsigned long nr_gfns, uint8_t *idx)
+{
+    paddr_t gbase = gfn_to_gaddr(sgfn);
+    paddr_t glimit = gfn_to_gaddr(gfn_add(sgfn, nr_gfns));
+    int rc;
+
+    rc = mpumap_contains_region(table, nr_regions, gbase, glimit, idx);
+    if ( MPUMAP_REGION_OVERLAP == rc )
+        return -EINVAL;
+
+    if ( MPUMAP_REGION_NOTFOUND == rc )
+        return -ENOENT;
+
+    return 0;
+}
+
+static int __p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned int nr,
+                    mfn_t smfn, p2m_type_t t, p2m_access_t a)
+{
+    pr_t *table;
+    mfn_t emfn = mfn_add(smfn, nr);
+    unsigned int flags;
+    uint8_t idx = INVALID_REGION_IDX;
+
+    /*
+     * In all cases other than when removing a mapping (mfn == MFN_INVALID),
+     * gfn == mfn on MPU systems.
+     */
+    if ( !mfn_eq(smfn, INVALID_MFN) && gfn_x(sgfn) != mfn_x(smfn) )
+    {
+        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" at %#"PRI_mfn"\n",
+               mfn_x(smfn), gfn_x(sgfn));
+        return -EINVAL;
+    }
+
+    table = (pr_t *)page_to_virt(p2m->root);
+    if ( !table )
+        return -EINVAL;
+
+    /* Already mapped */
+    if ( is_gfns_mapped(table, p2m->nr_regions, sgfn, nr, &idx) != -ENOENT )
+    {
+        printk(XENLOG_G_ERR "Unable to insert P2M MPU memory region %#"PRIpaddr"-%#"PRIpaddr"\n",
+               gfn_to_gaddr(sgfn), gfn_to_gaddr(gfn_add(sgfn, nr)));
+        return -EINVAL;
+    }
+
+    flags = build_p2m_flags(t);
+    table[p2m->nr_regions] = pr_of_addr(mfn_to_maddr(smfn),
+                                        mfn_to_maddr(mfn_add(smfn, nr)), flags);
+    region_set_p2m(&table[p2m->nr_regions], t);
+    p2m->nr_regions++;
+
+    p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn, _gfn(mfn_x(emfn)));
+    p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, _gfn(mfn_x(smfn)));
+
+    return 0;
+}
 
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
                   mfn_t smfn, p2m_type_t t, p2m_access_t a)
 {
-    BUG_ON("unimplemented");
-    return -EINVAL;
+    /*
+     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
+     * be dropped in relinquish_p2m_mapping(). As the P2M will still
+     * be accessible after, we need to prevent mapping to be added when the
+     * domain is dying.
+     */
+    if ( unlikely(p2m->domain->is_dying) )
+        return -ENOMEM;
+
+    return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
 }
 
 mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
-- 
2.34.1


