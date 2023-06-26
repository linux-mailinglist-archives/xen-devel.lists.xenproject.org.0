Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DE73D682
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555074.866784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5V-0007pM-Qm; Mon, 26 Jun 2023 03:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555074.866784; Mon, 26 Jun 2023 03:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5U-0007Wt-Mf; Mon, 26 Jun 2023 03:40:24 +0000
Received: by outflank-mailman (input) for mailman id 555074;
 Mon, 26 Jun 2023 03:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2Z-0007ej-Ve
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c2f443a7-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C57022F4;
 Sun, 25 Jun 2023 20:38:06 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 29A203F64C;
 Sun, 25 Jun 2023 20:37:19 -0700 (PDT)
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
X-Inumbo-ID: c2f443a7-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 43/52] xen/mpu: configure VSTCR_EL2 in MPU system
Date: Mon, 26 Jun 2023 11:34:34 +0800
Message-Id: <20230626033443.2943270-44-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

VSTCR_EL2, Virtualization Secure Translation Control Register，is
the control register for stage 2 of the Secure EL1&0 translation regime.

VSTCR_EL2.SA defines secure stage 2 translation output address space.
To make sure that all stage 2 translations for the Secure PA space
access the Secure PA space, we keep SA bit as 0.
VSTCR_EL2.SC is NS check enable bit.
To make sure that Stage 2 NS configuration is checked against stage 1
NS configuration in EL1&0 translation regime for the given address, and
generates a fault if they are different, we set SC bit 1.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/arm64/sysregs.h |  6 ++++++
 xen/arch/arm/mpu/p2m.c                   | 17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index ab0e6a97d3..35d7da411d 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -512,6 +512,12 @@
 /* MPU Protection Region Enable Register encode */
 #define PRENR_EL2   S3_4_C6_C1_1
 
+/* Virtualization Secure Translation Control Register */
+#define VSTCR_EL2            S3_4_C2_C6_2
+#define VSTCR_EL2_RES1_SHIFT 31
+#define VSTCR_EL2_SA         ~(_AC(0x1,UL)<<30)
+#define VSTCR_EL2_SC         (_AC(0x1,UL)<<20)
+
 #endif
 
 #ifdef CONFIG_ARM_SECURE_STATE
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 04c44825cb..a7a3912a9a 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -10,7 +10,7 @@
 
 void __init setup_virt_paging(void)
 {
-    uint64_t val = 0;
+    uint64_t val = 0, val2 = 0;
     bool p2m_vmsa = true;
 
     /* PA size */
@@ -76,6 +76,21 @@ void __init setup_virt_paging(void)
 
     WRITE_SYSREG(val, VTCR_EL2);
 
+    /*
+     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
+     * To make sure that all stage 2 translations for the Secure PA space
+     * access the Secure PA space, we keep SA bit as 0.
+     *
+     * VSTCR_EL2.SC is NS check enable bit.
+     * To make sure that Stage 2 NS configuration is checked against stage 1
+     * NS configuration in EL1&0 translation regime for the given address, and
+     * generates a fault if they are different, we set SC bit 1.
+     */
+    val2 = 1 << VSTCR_EL2_RES1_SHIFT;
+    val2 &= VSTCR_EL2_SA;
+    val2 |= VSTCR_EL2_SC;
+    WRITE_SYSREG(val2, VSTCR_EL2);
+
     return;
 
 fault:
-- 
2.25.1


