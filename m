Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166A92C8692
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 15:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41181.74349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk56-0002Dm-5V; Mon, 30 Nov 2020 14:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41181.74349; Mon, 30 Nov 2020 14:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk56-0002Cl-0p; Mon, 30 Nov 2020 14:23:08 +0000
Received: by outflank-mailman (input) for mailman id 41181;
 Mon, 30 Nov 2020 14:23:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjk54-00022w-Gt
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:23:06 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5998b097-c1a0-4e3e-89d9-09df240bb616;
 Mon, 30 Nov 2020 14:23:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 643A2D6E;
 Mon, 30 Nov 2020 06:23:02 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4EEC3F71F;
 Mon, 30 Nov 2020 06:23:01 -0800 (PST)
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
X-Inumbo-ID: 5998b097-c1a0-4e3e-89d9-09df240bb616
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Date: Mon, 30 Nov 2020 14:21:40 +0000
Message-Id: <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>

Add vsysreg emulation for registers trapped when TID3 bit is activated
in HSR.
The emulation is returning the value stored in cpuinfo_guest structure
for most values and the hardware value for registers not stored in the
structure (those are mostly registers existing only as a provision for
feature use but who have no definition right now).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: rebase
---
 xen/arch/arm/arm64/vsysreg.c | 49 ++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 8a85507d9d..970ef51603 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
         break;                                                          \
     }
 
+/* Macro to generate easily case for ID co-processor emulation */
+#define GENERATE_TID3_INFO(reg,field,offset)                            \
+    case HSR_SYSREG_##reg:                                              \
+    {                                                                   \
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
+                          1, guest_cpuinfo.field.bits[offset]);         \
+    }
+
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr)
 {
@@ -259,6 +267,47 @@ void do_sysreg(struct cpu_user_regs *regs,
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
     /*
      * HCR_EL2.TIDCP
      *
-- 
2.17.1


