Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43E570D578
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 09:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538270.838140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgJ-00046V-Sp; Tue, 23 May 2023 07:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538270.838140; Tue, 23 May 2023 07:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgJ-00043B-PX; Tue, 23 May 2023 07:43:43 +0000
Received: by outflank-mailman (input) for mailman id 538270;
 Tue, 23 May 2023 07:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q1MgI-0003Zx-4U
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 07:43:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 88a57ad9-f93d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 09:43:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 725111516;
 Tue, 23 May 2023 00:44:24 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70AC93F762;
 Tue, 23 May 2023 00:43:38 -0700 (PDT)
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
X-Inumbo-ID: 88a57ad9-f93d-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 03/12] xen/arm: Expose SVE feature to the guest
Date: Tue, 23 May 2023 08:43:17 +0100
Message-Id: <20230523074326.3035745-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523074326.3035745-1-luca.fancellu@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a guest is allowed to use SVE, expose the SVE features through
the identification registers.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from v6:
 - code style fix, add A-by Julien
Changes from v5:
 - given the move of is_sve_domain() in asm/arm64/sve.h, add the
   header to vsysreg.c
 - dropping Bertrand's R-by because of the change
Changes from v4:
 - no changes
Changes from v3:
 - no changes
Changes from v2:
 - no changes
Changes from v1:
 - No changes
Changes from RFC:
 - No changes
---
 xen/arch/arm/arm64/vsysreg.c | 41 ++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 758750983c11..fe31f7b3827f 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -18,6 +18,8 @@
 
 #include <xen/sched.h>
 
+#include <asm/arm64/cpufeature.h>
+#include <asm/arm64/sve.h>
 #include <asm/current.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
@@ -295,7 +297,28 @@ void do_sysreg(struct cpu_user_regs *regs,
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
@@ -306,7 +329,21 @@ void do_sysreg(struct cpu_user_regs *regs,
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
+
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


