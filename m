Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806A2D46CD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48539.85877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qh-0007JE-EG; Wed, 09 Dec 2020 16:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48539.85877; Wed, 09 Dec 2020 16:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Qh-0007IU-Ak; Wed, 09 Dec 2020 16:35:03 +0000
Received: by outflank-mailman (input) for mailman id 48539;
 Wed, 09 Dec 2020 16:35:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn2Qf-0007Ej-Oe
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:35:01 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ac6edc1e-1ffb-419b-90c9-721a0d2890e0;
 Wed, 09 Dec 2020 16:34:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3F241042;
 Wed,  9 Dec 2020 08:34:56 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F046C3F68F;
 Wed,  9 Dec 2020 08:34:55 -0800 (PST)
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
X-Inumbo-ID: ac6edc1e-1ffb-419b-90c9-721a0d2890e0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/7] xen/arm: Add arm64 ID registers definitions
Date: Wed,  9 Dec 2020 16:30:55 +0000
Message-Id: <96a970e5e5d2f1b1bd0e50327857de6a8c8441f7.1607524536.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1607524536.git.bertrand.marquis@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>

Add coprocessor registers definitions for all ID registers trapped
through the TID3 bit of HSR.
Those are the one that will be emulated in Xen to only publish to guests
the features that are supported by Xen and that are accessible to
guests.
Also define a case to catch all reserved registers that should be
handled as RAZ.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3:
  Add case definition for reserved registers.

---
 xen/include/asm-arm/arm64/hsr.h | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/asm-arm/arm64/hsr.h
index ca931dd2fe..ffe0f0007e 100644
--- a/xen/include/asm-arm/arm64/hsr.h
+++ b/xen/include/asm-arm/arm64/hsr.h
@@ -110,6 +110,72 @@
 #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
 #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
 
+/* Those registers are used when HCR_EL2.TID3 is set */
+#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
+#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
+#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
+#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
+#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
+#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
+#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
+#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
+#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
+#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
+#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
+#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
+#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
+#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
+#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
+#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
+#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
+#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
+#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
+#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
+#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
+#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
+
+#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
+#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
+#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
+#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
+#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
+#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
+#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
+#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
+#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
+#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
+#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
+#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
+
+/*
+ * Those cases are catching all Reserved registers trapped by TID3 which
+ * currently have no assignment.
+ * HCR.TID3 is trapping all registers in the group 3:
+ * Op0 == 3, op1 == 0, CRn == c0,CRm == {c1-c7}, op2 == {0-7}.
+ */
+#define HSR_SYSREG_TID3_RESERVED_CASE  case HSR_SYSREG(3,0,c0,c3,3): \
+                                       case HSR_SYSREG(3,0,c0,c3,7): \
+                                       case HSR_SYSREG(3,0,c0,c4,2): \
+                                       case HSR_SYSREG(3,0,c0,c4,3): \
+                                       case HSR_SYSREG(3,0,c0,c4,5): \
+                                       case HSR_SYSREG(3,0,c0,c4,6): \
+                                       case HSR_SYSREG(3,0,c0,c4,7): \
+                                       case HSR_SYSREG(3,0,c0,c5,2): \
+                                       case HSR_SYSREG(3,0,c0,c5,3): \
+                                       case HSR_SYSREG(3,0,c0,c5,6): \
+                                       case HSR_SYSREG(3,0,c0,c5,7): \
+                                       case HSR_SYSREG(3,0,c0,c6,2): \
+                                       case HSR_SYSREG(3,0,c0,c6,3): \
+                                       case HSR_SYSREG(3,0,c0,c6,4): \
+                                       case HSR_SYSREG(3,0,c0,c6,5): \
+                                       case HSR_SYSREG(3,0,c0,c6,6): \
+                                       case HSR_SYSREG(3,0,c0,c6,7): \
+                                       case HSR_SYSREG(3,0,c0,c7,3): \
+                                       case HSR_SYSREG(3,0,c0,c7,4): \
+                                       case HSR_SYSREG(3,0,c0,c7,5): \
+                                       case HSR_SYSREG(3,0,c0,c7,6): \
+                                       case HSR_SYSREG(3,0,c0,c7,7)
+
 #endif /* __ASM_ARM_ARM64_HSR_H */
 
 /*
-- 
2.17.1


