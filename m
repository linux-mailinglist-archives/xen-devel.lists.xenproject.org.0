Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB302DD464
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55983.97716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQT-0004Tb-9c; Thu, 17 Dec 2020 15:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55983.97716; Thu, 17 Dec 2020 15:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQT-0004Ss-21; Thu, 17 Dec 2020 15:42:45 +0000
Received: by outflank-mailman (input) for mailman id 55983;
 Thu, 17 Dec 2020 15:42:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQQ-0004G9-SH
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:42 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e99d0a0f-ebf0-460c-b3a9-5ba4df1b471f;
 Thu, 17 Dec 2020 15:42:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08A19101E;
 Thu, 17 Dec 2020 07:42:36 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46A263F66B;
 Thu, 17 Dec 2020 07:42:35 -0800 (PST)
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
X-Inumbo-ID: e99d0a0f-ebf0-460c-b3a9-5ba4df1b471f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 5/8] xen/arm: Add handler for ID registers on arm64
Date: Thu, 17 Dec 2020 15:38:05 +0000
Message-Id: <46c4c7e8ec64a48ecefd894d436c116bab5d4a86.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Add vsysreg emulation for registers trapped when TID3 bit is activated
in HSR.
The emulation is returning the value stored in cpuinfo_guest structure
for know registers and is handling reserved registers as RAZ.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Fix commit message
  Fix code style for GENERATE_TID3_INFO declaration
  Add handling of reserved registers as RAZ.
Changes in V4:
  Fix indentation in GENERATE_TID3_INFO macro
  Add explicit case code for reserved registers

---
 xen/arch/arm/arm64/vsysreg.c | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 8a85507d9d..41f18612c6 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
         break;                                                          \
     }
 
+/* Macro to generate easily case for ID co-processor emulation */
+#define GENERATE_TID3_INFO(reg, field, offset)                          \
+    case HSR_SYSREG_##reg:                                              \
+    {                                                                   \
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
+                                  1, guest_cpuinfo.field.bits[offset]); \
+    }
+
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr)
 {
@@ -259,6 +267,80 @@ void do_sysreg(struct cpu_user_regs *regs,
          */
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
 
+    /*
+     * HCR_EL2.TID3
+     *
+     * This is trapping most Identification registers used by a guest
+     * to identify the processor features
+     */
+    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
+    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
+    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
+    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
+    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
+    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
+    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
+    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
+    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
+    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
+    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
+    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
+    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
+    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
+    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
+    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
+    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
+    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
+    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
+    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
+    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
+    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
+    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
+    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
+    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
+    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
+    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
+    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
+    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
+    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
+    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
+    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
+    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
+    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
+
+    /*
+     * Those cases are catching all Reserved registers trapped by TID3 which
+     * currently have no assignment.
+     * HCR.TID3 is trapping all registers in the group 3:
+     * Op0 == 3, op1 == 0, CRn == c0,CRm == {c1-c7}, op2 == {0-7}.
+     * Those registers are defined as being RO in the Arm Architecture
+     * Reference manual Armv8 (Chapter D12.3.2 of issue F.c) so handle them
+     * as Read-only read as zero.
+     */
+    case HSR_SYSREG(3,0,c0,c3,3):
+    case HSR_SYSREG(3,0,c0,c3,7):
+    case HSR_SYSREG(3,0,c0,c4,2):
+    case HSR_SYSREG(3,0,c0,c4,3):
+    case HSR_SYSREG(3,0,c0,c4,5):
+    case HSR_SYSREG(3,0,c0,c4,6):
+    case HSR_SYSREG(3,0,c0,c4,7):
+    case HSR_SYSREG(3,0,c0,c5,2):
+    case HSR_SYSREG(3,0,c0,c5,3):
+    case HSR_SYSREG(3,0,c0,c5,6):
+    case HSR_SYSREG(3,0,c0,c5,7):
+    case HSR_SYSREG(3,0,c0,c6,2):
+    case HSR_SYSREG(3,0,c0,c6,3):
+    case HSR_SYSREG(3,0,c0,c6,4):
+    case HSR_SYSREG(3,0,c0,c6,5):
+    case HSR_SYSREG(3,0,c0,c6,6):
+    case HSR_SYSREG(3,0,c0,c6,7):
+    case HSR_SYSREG(3,0,c0,c7,3):
+    case HSR_SYSREG(3,0,c0,c7,4):
+    case HSR_SYSREG(3,0,c0,c7,5):
+    case HSR_SYSREG(3,0,c0,c7,6):
+    case HSR_SYSREG(3,0,c0,c7,7):
+        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 1);
+
     /*
      * HCR_EL2.TIDCP
      *
-- 
2.17.1


