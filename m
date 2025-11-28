Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB1C918D1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174647.1499604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHt-0000Yr-KK; Fri, 28 Nov 2025 10:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174647.1499604; Fri, 28 Nov 2025 10:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHt-0000X4-F4; Fri, 28 Nov 2025 10:01:13 +0000
Received: by outflank-mailman (input) for mailman id 1174647;
 Fri, 28 Nov 2025 10:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kA0B=6E=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vOvHs-0000F3-AJ
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 10:01:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ec8084b1-cc40-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 11:00:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDB211A25;
 Fri, 28 Nov 2025 01:59:18 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 512303F73B;
 Fri, 28 Nov 2025 01:59:23 -0800 (PST)
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
X-Inumbo-ID: ec8084b1-cc40-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 5/6] arm: Use secure hypervisor timer in MPU system
Date: Fri, 28 Nov 2025 09:58:58 +0000
Message-ID: <20251128095859.11264-6-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128095859.11264-1-harry.ramsey@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

As MPU systems only have one secure state, we have to use secure EL2
hypervisor timer for Xen in secure EL2.

In this patch, we introduce a new Kconfig option ARM_SECURE_STATE
and a set of secure hypervisor timer registers CNTHPS_*_EL2.
We alias CNTHP_*_EL2 to CNTHPS_*_EL2 to keep the timer code
flow unchanged.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/Kconfig                     |  5 +++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..a5c111e08e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -91,6 +91,7 @@ config MMU
 
 config MPU
 	bool "MPU" if UNSUPPORTED
+	select ARM_SECURE_STATE if ARM_64
 	select STATIC_MEMORY
 	help
 	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
@@ -223,6 +224,10 @@ config HARDEN_BRANCH_PREDICTOR
 
 	  If unsure, say Y.
 
+config ARM_SECURE_STATE
+	bool "Xen will run in Arm Secure State"
+	default n
+
 config ARM64_PTR_AUTH
 	def_bool n
 	depends on ARM_64
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 7440d495e4..29caad7155 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,18 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+#ifdef CONFIG_ARM_SECURE_STATE
+/*
+ * The Armv8-R AArch64 architecture always executes code in Secure
+ * state with EL2 as the highest Exception.
+ *
+ * Hypervisor timer registers for Secure EL2.
+ */
+#define CNTHP_TVAL_EL2  CNTHPS_TVAL_EL2
+#define CNTHP_CTL_EL2   CNTHPS_CTL_EL2
+#define CNTHP_CVAL_EL2  CNTHPS_CVAL_EL2
+#endif
+
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
-- 
2.43.0


