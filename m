Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7686CA1E4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515169.797808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka2-0008Lr-SO; Mon, 27 Mar 2023 11:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515169.797808; Mon, 27 Mar 2023 11:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka2-0008EX-KM; Mon, 27 Mar 2023 11:00:02 +0000
Received: by outflank-mailman (input) for mailman id 515169;
 Mon, 27 Mar 2023 11:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pgka1-0007lM-DY
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:00:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8413bccd-cc8e-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:59:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0509D1042;
 Mon, 27 Mar 2023 04:00:43 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C683F663;
 Mon, 27 Mar 2023 03:59:57 -0700 (PDT)
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
X-Inumbo-ID: 8413bccd-cc8e-11ed-b464-930f4c7d94ae
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 03/12] xen/arm: Expose SVE feature to the guest
Date: Mon, 27 Mar 2023 11:59:35 +0100
Message-Id: <20230327105944.1360856-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327105944.1360856-1-luca.fancellu@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a guest is allowed to use SVE, expose the SVE features through
the identification registers.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v3:
 - no changes
Changes from v2:
 - no changes
Changes from v1:
 - No changes
Changes from RFC:
 - No changes
---
 xen/arch/arm/arm64/vsysreg.c | 39 ++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 758750983c11..10048bb4d221 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -18,6 +18,7 @@
 
 #include <xen/sched.h>
 
+#include <asm/arm64/cpufeature.h>
 #include <asm/current.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
@@ -295,7 +296,28 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
     GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
     GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
-    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
+
+    case HSR_SYSREG_ID_AA64PFR0_EL1:
+    {
+        register_t guest_reg_value = guest_cpuinfo.pfr64.bits[0];
+
+        if ( is_sve_domain(v->domain) )
+        {
+            /* 4 is the SVE field width in id_aa64pfr0_el1 */
+            uint64_t mask = GENMASK(ID_AA64PFR0_SVE_SHIFT + 4 - 1,
+                                    ID_AA64PFR0_SVE_SHIFT);
+            /* sysval is the sve field on the system */
+            uint64_t sysval = cpuid_feature_extract_unsigned_field_width(
+                                system_cpuinfo.pfr64.bits[0],
+                                ID_AA64PFR0_SVE_SHIFT, 4);
+            guest_reg_value &= ~mask;
+            guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
+
     GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
     GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
     GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
@@ -306,7 +328,20 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
     GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
     GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
-    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
+
+    case HSR_SYSREG_ID_AA64ZFR0_EL1:
+    {
+        /*
+         * When the guest has the SVE feature enabled, the whole id_aa64zfr0_el1
+         * needs to be exposed.
+         */
+        register_t guest_reg_value = guest_cpuinfo.zfr64.bits[0];
+        if ( is_sve_domain(v->domain) )
+            guest_reg_value = system_cpuinfo.zfr64.bits[0];
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
 
     /*
      * Those cases are catching all Reserved registers trapped by TID3 which
-- 
2.34.1


