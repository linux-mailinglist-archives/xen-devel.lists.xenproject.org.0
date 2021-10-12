Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8DB429F89
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206863.362547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCv3-0000eO-U3; Tue, 12 Oct 2021 08:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206863.362547; Tue, 12 Oct 2021 08:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCv3-0000cL-Pm; Tue, 12 Oct 2021 08:13:53 +0000
Received: by outflank-mailman (input) for mailman id 206863;
 Tue, 12 Oct 2021 08:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lNhP=PA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1maCv1-0008RX-V9
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:13:51 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6dd81224-02b3-4a37-93d3-3039d4c0fd52;
 Tue, 12 Oct 2021 08:13:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A3861063;
 Tue, 12 Oct 2021 01:13:46 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.99])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0EBC3F694;
 Tue, 12 Oct 2021 01:13:44 -0700 (PDT)
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
X-Inumbo-ID: 6dd81224-02b3-4a37-93d3-3039d4c0fd52
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v5 2/3] xen/arm: Check for PMU platform support
Date: Tue, 12 Oct 2021 10:13:22 +0200
Message-Id: <20211012081323.14141-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211012081323.14141-1-michal.orzel@arm.com>
References: <20211012081323.14141-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ID_AA64DFR0_EL1/ID_DFR0_EL1 registers provide
information about PMU support. Replace structure
dbg64/dbg32 with a union and fill in all the
register fields according to document:
ARM Architecture Registers(DDI 0595, 2021-06).

Add macros boot_dbg_feature64/boot_dbg_feature32
to check for a debug feature. Add macro
cpu_has_pmu to check for PMU support.
Any value higher than 0 and less than 15 means
that PMU is supported (we do not care about its
version for now).

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v4:
-improve checks for PMU
Changes since v3:
-none
Changes since v2:
-none
Changes since v1:
-new in v2
---
 xen/include/asm-arm/cpufeature.h | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 5ca09b0bff..0ddf38858a 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -4,6 +4,7 @@
 #ifdef CONFIG_ARM_64
 #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
 #define boot_cpu_feature64(feat)       (system_cpuinfo.pfr64.feat)
+#define boot_dbg_feature64(feat)       (system_cpuinfo.dbg64.feat)
 
 #define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
 
@@ -22,6 +23,7 @@
 
 #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
 #define boot_cpu_feature32(feat)       (system_cpuinfo.pfr32.feat)
+#define boot_dbg_feature32(feat)       (system_cpuinfo.dbg32.feat)
 
 #define cpu_has_arm       (boot_cpu_feature32(arm) == 1)
 #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
@@ -32,8 +34,12 @@
 
 #ifdef CONFIG_ARM_32
 #define cpu_has_gentimer  (boot_cpu_feature32(gentimer) == 1)
+#define cpu_has_pmu       ((boot_dbg_feature32(perfmon) >= 1) && \
+                           (boot_dbg_feature32(perfmon) < 15))
 #else
 #define cpu_has_gentimer  (1)
+#define cpu_has_pmu       ((boot_dbg_feature64(pmu_ver) >= 1) && \
+                           (boot_dbg_feature64(pmu_ver) < 15))
 #endif
 #define cpu_has_security  (boot_cpu_feature32(security) > 0)
 
@@ -181,8 +187,28 @@ struct cpuinfo_arm {
         };
     } pfr64;
 
-    struct {
+    union {
         register_t bits[2];
+        struct {
+            /* DFR0 */
+            unsigned long debug_ver:4;
+            unsigned long trace_ver:4;
+            unsigned long pmu_ver:4;
+            unsigned long brps:4;
+            unsigned long __res0:4;
+            unsigned long wrps:4;
+            unsigned long __res1:4;
+            unsigned long ctx_cmps:4;
+            unsigned long pms_ver:4;
+            unsigned long double_lock:4;
+            unsigned long trace_filt:4;
+            unsigned long __res2:4;
+            unsigned long mtpmu:4;
+            unsigned long __res3:12;
+
+            /* DFR1 */
+            unsigned long __res4:64;
+        };
     } dbg64;
 
     struct {
@@ -321,8 +347,29 @@ struct cpuinfo_arm {
         };
     } pfr32;
 
-    struct {
+    union {
         register_t bits[2];
+        struct {
+            /* DFR0 */
+            unsigned long copdbg:4;
+            unsigned long copsdbg:4;
+            unsigned long mmapdbg:4;
+            unsigned long coptrc:4;
+            unsigned long mmaptrc:4;
+            unsigned long mprofdbg:4;
+            unsigned long perfmon:4;
+            unsigned long tracefilt:4;
+#ifdef CONFIG_ARM_64
+            unsigned long __res0:32;
+#endif
+
+            /* DFR1 */
+            unsigned long mtpmu:4;
+            unsigned long __res1:28;
+#ifdef CONFIG_ARM_64
+            unsigned long __res2:32;
+#endif
+        };
     } dbg32;
 
     struct {
-- 
2.29.0


