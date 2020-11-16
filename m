Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D752B4361
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27854.56419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedMP-0000DH-Bl; Mon, 16 Nov 2020 12:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27854.56419; Mon, 16 Nov 2020 12:11:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedMP-0000Cs-8l; Mon, 16 Nov 2020 12:11:53 +0000
Received: by outflank-mailman (input) for mailman id 27854;
 Mon, 16 Nov 2020 12:11:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwWO=EW=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kedMO-0000Cm-27
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:11:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f5bd6069-712d-43bb-944d-c8131c5fd4cf;
 Mon, 16 Nov 2020 12:11:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06344101E;
 Mon, 16 Nov 2020 04:11:50 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.25.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B92993F70D;
 Mon, 16 Nov 2020 04:11:48 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HwWO=EW=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
	id 1kedMO-0000Cm-27
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:11:52 +0000
X-Inumbo-ID: f5bd6069-712d-43bb-944d-c8131c5fd4cf
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id f5bd6069-712d-43bb-944d-c8131c5fd4cf;
	Mon, 16 Nov 2020 12:11:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06344101E;
	Mon, 16 Nov 2020 04:11:50 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.25.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B92993F70D;
	Mon, 16 Nov 2020 04:11:48 -0800 (PST)
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2] xen/arm: Add workaround for Cortex-A76/Neoverse-N1 erratum #1286807
Date: Mon, 16 Nov 2020 13:11:40 +0100
Message-Id: <20201116121140.26763-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0),
if a virtual address for a cacheable mapping of a location is being
accessed by a core while another core is remapping the virtual
address to a new physical page using the recommended break-before-make
sequence, then under very rare circumstances TLBI+DSB completes before
a read using the translation being invalidated has been observed by
other observers. The workaround repeats the TLBI+DSB operation
for all the TLB flush operations on purpose.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 docs/misc/arm/silicon-errata.txt     |  2 ++
 xen/arch/arm/Kconfig                 | 23 +++++++++++++++++++++
 xen/arch/arm/cpuerrata.c             | 14 +++++++++++++
 xen/include/asm-arm/arm64/flushtlb.h | 30 +++++++++++++++++++---------
 xen/include/asm-arm/cpufeature.h     |  3 ++-
 5 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 552c4151d3..d183ba543f 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -53,5 +53,7 @@ stable hypervisors.
 | ARM            | Cortex-A72      | #853709         | N/A                     |
 | ARM            | Cortex-A73      | #858921         | ARM_ERRATUM_858921      |
 | ARM            | Cortex-A76      | #1165522        | N/A                     |
+| ARM            | Cortex-A76      | #1286807        | ARM64_ERRATUM_1286807   |
 | ARM            | Neoverse-N1     | #1165522        | N/A
+| ARM            | Neoverse-N1     | #1286807        | ARM64_ERRATUM_1286807   |
 | ARM            | MMU-500         | #842869         | N/A                     |
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index f938dd21bd..8171b8d04a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -244,6 +244,29 @@ config ARM_ERRATUM_858921
 
 	  If unsure, say Y.
 
+config ARM64_WORKAROUND_REPEAT_TLBI
+	bool
+
+config ARM64_ERRATUM_1286807
+	bool "Cortex-A76/Neoverse-N1: 1286807: Modification of the translation table for a virtual address might lead to read-after-read ordering violation"
+	default y
+	select ARM64_WORKAROUND_REPEAT_TLBI
+	depends on ARM_64
+	help
+	  This option adds a workaround for ARM Cortex-A76/Neoverse-N1 erratum 1286807.
+
+	  On the affected Cortex-A76/Neoverse-N1 cores (r0p0 to r3p0), if a virtual
+	  address for a cacheable mapping of a location is being
+	  accessed by a core while another core is remapping the virtual
+	  address to a new physical page using the recommended
+	  break-before-make sequence, then under very rare circumstances
+	  TLBI+DSB completes before a read using the translation being
+	  invalidated has been observed by other observers. The
+	  workaround repeats the TLBI+DSB operation for all the TLB flush
+	  operations on purpose.
+
+	  If unsure, say Y.
+
 endmenu
 
 config ARM64_HARDEN_BRANCH_PREDICTOR
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 567911d380..cb4795beec 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -424,6 +424,20 @@ static const struct arm_cpu_capabilities arm_errata[] = {
                    (1 << MIDR_VARIANT_SHIFT) | 2),
     },
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_1286807
+    {
+        /* Cortex-A76 r0p0 - r3p0 */
+        .desc = "ARM erratum 1286807",
+        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
+        MIDR_RANGE(MIDR_CORTEX_A76, 0, 3 << MIDR_VARIANT_SHIFT),
+    },
+    {
+        /* Neoverse-N1 r0p0 - r3p0 */
+        .desc = "ARM erratum 1286807",
+        .capability = ARM64_WORKAROUND_REPEAT_TLBI,
+        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 3 << MIDR_VARIANT_SHIFT),
+    },
+#endif
 #ifdef CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR
     {
         .capability = ARM_HARDEN_BRANCH_PREDICTOR,
diff --git a/xen/include/asm-arm/arm64/flushtlb.h b/xen/include/asm-arm/arm64/flushtlb.h
index ceec59542e..8f2abfaf1d 100644
--- a/xen/include/asm-arm/arm64/flushtlb.h
+++ b/xen/include/asm-arm/arm64/flushtlb.h
@@ -9,6 +9,12 @@
  * DSB ISH          // Ensure the TLB invalidation has completed
  * ISB              // See explanation below
  *
+ * ARM64_WORKAROUND_REPEAT_TLBI:
+ * Modification of the translation table for a virtual address might lead to
+ * read-after-read ordering violation.
+ * The workaround repeats TLBI+DSB operation for all the TLB flush operations
+ * on purpose.
+ *
  * For Xen page-tables the ISB will discard any instructions fetched
  * from the old mappings.
  *
@@ -16,15 +22,21 @@
  * (and therefore the TLB invalidation) before continuing. So we know
  * the TLBs cannot contain an entry for a mapping we may have removed.
  */
-#define TLB_HELPER(name, tlbop) \
-static inline void name(void)   \
-{                               \
-    asm volatile(               \
-        "dsb  ishst;"           \
-        "tlbi "  # tlbop  ";"   \
-        "dsb  ish;"             \
-        "isb;"                  \
-        : : : "memory");        \
+#define TLB_HELPER(name, tlbop)                  \
+static inline void name(void)                    \
+{                                                \
+    asm volatile(                                \
+        "dsb  ishst;"                            \
+        "tlbi "  # tlbop  ";"                    \
+        ALTERNATIVE(                             \
+            "nop; nop;",                         \
+            "dsb  ish;"                          \
+            "tlbi "  # tlbop  ";",               \
+            ARM64_WORKAROUND_REPEAT_TLBI,        \
+            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
+        "dsb  ish;"                              \
+        "isb;"                                   \
+        : : : "memory");                         \
 }
 
 /* Flush local TLBs, current VMID only. */
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 016a9fe203..c7b5052992 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -46,8 +46,9 @@
 #define ARM_SMCCC_1_1 8
 #define ARM64_WORKAROUND_AT_SPECULATE 9
 #define ARM_WORKAROUND_858921 10
+#define ARM64_WORKAROUND_REPEAT_TLBI 11
 
-#define ARM_NCAPS           11
+#define ARM_NCAPS           12
 
 #ifndef __ASSEMBLY__
 
-- 
2.28.0


