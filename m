Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65492DD465
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55984.97725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQT-0004VR-Qm; Thu, 17 Dec 2020 15:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55984.97725; Thu, 17 Dec 2020 15:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQT-0004Tf-KY; Thu, 17 Dec 2020 15:42:45 +0000
Received: by outflank-mailman (input) for mailman id 55984;
 Thu, 17 Dec 2020 15:42:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQR-0004GE-W0
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 77e24c80-ff18-473d-97fa-bf8feda5e0f4;
 Thu, 17 Dec 2020 15:42:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0380330E;
 Thu, 17 Dec 2020 07:42:37 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F943F66B;
 Thu, 17 Dec 2020 07:42:36 -0800 (PST)
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
X-Inumbo-ID: 77e24c80-ff18-473d-97fa-bf8feda5e0f4
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 6/8] xen/arm: Add handler for cp15 ID registers
Date: Thu, 17 Dec 2020 15:38:06 +0000
Message-Id: <c1c68e89683913dbf71a8f370dc6fd896a9e8cce.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Add support for emulation of cp15 based ID registers (on arm32 or when
running a 32bit guest on arm64).
The handlers are returning the values stored in the guest_cpuinfo
structure for known registers and RAZ for all reserved registers.
In the current status the MVFR registers are no supported.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Add case definition for reserved registers
  Add handling of reserved registers as RAZ.
  Fix code style in GENERATE_TID3_INFO declaration
Changes in V4:
  Fix comment for missing t (no to not)
  Put cases for reserved registers directly in the code instead of using
  a define in the cpregs.h header.

---
 xen/arch/arm/vcpreg.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index cdc91cdf5b..1fe07fe02a 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -155,6 +155,24 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
         break;                                                      \
     }
 
+/* Macro to generate easily case for ID co-processor emulation */
+#define GENERATE_TID3_INFO(reg, field, offset)                      \
+    case HSR_CPREG32(reg):                                          \
+    {                                                               \
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
+                          1, guest_cpuinfo.field.bits[offset]);     \
+    }
+
+/* helper to define cases for all registers for one CRm value */
+#define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
+                                        case HSR_CPREG32(p15,0,c0,REG,1): \
+                                        case HSR_CPREG32(p15,0,c0,REG,2): \
+                                        case HSR_CPREG32(p15,0,c0,REG,3): \
+                                        case HSR_CPREG32(p15,0,c0,REG,4): \
+                                        case HSR_CPREG32(p15,0,c0,REG,5): \
+                                        case HSR_CPREG32(p15,0,c0,REG,6): \
+                                        case HSR_CPREG32(p15,0,c0,REG,7)
+
 void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
 {
     const struct hsr_cp32 cp32 = hsr.cp32;
@@ -286,6 +304,53 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
+    /*
+     * HCR_EL2.TID3
+     *
+     * This is trapping most Identification registers used by a guest
+     * to identify the processor features
+     */
+    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
+    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
+    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
+    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
+    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
+    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
+    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
+    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
+    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
+    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
+    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
+    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
+    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
+    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
+    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
+    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
+    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
+    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
+    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
+    /* MVFR registers are in cp10 not cp15 */
+
+    /*
+     * Those cases are catching all Reserved registers trapped by TID3 which
+     * currently have no assignment.
+     * HCR.TID3 is trapping all registers in the group 3:
+     * coproc == p15, opc1 == 0, CRn == c0, CRm == {c2-c7}, opc2 == {0-7}.
+     * Those registers are defined as being RO in the Arm Architecture
+     * Reference manual Armv8 (Chapter D12.3.2 of issue F.c) so handle them
+     * as Read-only read as zero.
+     */
+    case HSR_CPREG32(p15,0,c0,c3,0):
+    case HSR_CPREG32(p15,0,c0,c3,1):
+    case HSR_CPREG32(p15,0,c0,c3,2):
+    case HSR_CPREG32(p15,0,c0,c3,3):
+    case HSR_CPREG32(p15,0,c0,c3,7):
+    HSR_CPREG32_TID3_CASES(c4):
+    HSR_CPREG32_TID3_CASES(c5):
+    HSR_CPREG32_TID3_CASES(c6):
+    HSR_CPREG32_TID3_CASES(c7):
+        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
+
     /*
      * HCR_EL2.TIDCP
      *
-- 
2.17.1


