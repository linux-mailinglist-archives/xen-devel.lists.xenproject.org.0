Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796273D670
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555010.866588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4s-0006PP-Qx; Mon, 26 Jun 2023 03:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555010.866588; Mon, 26 Jun 2023 03:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4s-00069s-69; Mon, 26 Jun 2023 03:39:46 +0000
Received: by outflank-mailman (input) for mailman id 555010;
 Mon, 26 Jun 2023 03:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2U-0000HH-Iw
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bf32e1a5-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A1D91FB;
 Sun, 25 Jun 2023 20:38:00 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAB9F3F64C;
 Sun, 25 Jun 2023 20:37:13 -0700 (PDT)
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
X-Inumbo-ID: bf32e1a5-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 41/52] xen/mpu: Use secure hypervisor timer in MPU system
Date: Mon, 26 Jun 2023 11:34:32 +0800
Message-Id: <20230626033443.2943270-42-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As MPU system only has one secure state, we have to use secure EL2 hypervisor
timer for Xen in secure EL2.

In this patch, we introduce a new Kconfig option ARM_SECURE_STATE and
a set of secure hypervisor timer registers CNTHPS_*_EL2.
We alias CNTHP_*_EL2 to CNTHPS_*_EL2 to keep the timer code flow unchanged.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- alias CNTHP_*_EL2 to CNTHPS_*_EL2 to avoid renaming
---
 xen/arch/arm/Kconfig                     |  4 ++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b2710c1c31..3f67aacbbf 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -92,6 +92,10 @@ config ARM_EFI
 	  UEFI firmware. A UEFI stub is provided to allow Xen to
 	  be booted as an EFI application.
 
+config ARM_SECURE_STATE
+	bool "Xen will run in Arm Secure State"
+	default n
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 96c025053b..ab0e6a97d3 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -514,6 +514,21 @@
 
 #endif
 
+#ifdef CONFIG_ARM_SECURE_STATE
+/*
+ * The Armv8-R AArch64 architecture always executes code in Secure
+ * state with EL2 as the highest Exception.
+ *
+ * Hypervisor timer registers for Secure EL2.
+ */
+#define CNTHPS_TVAL_EL2  S3_4_C14_C5_0
+#define CNTHPS_CTL_EL2   S3_4_C14_C5_1
+#define CNTHPS_CVAL_EL2  S3_4_C14_C5_2
+#define CNTHP_TVAL_EL2  CNTHPS_TVAL_EL2
+#define CNTHP_CTL_EL2   CNTHPS_CTL_EL2
+#define CNTHP_CVAL_EL2  CNTHPS_CVAL_EL2
+#endif
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
-- 
2.25.1


