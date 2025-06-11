Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D23AD5910
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011849.1390389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMdL-0003Gk-0Z; Wed, 11 Jun 2025 14:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011849.1390389; Wed, 11 Jun 2025 14:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMdK-0003Ea-Tj; Wed, 11 Jun 2025 14:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1011849;
 Wed, 11 Jun 2025 14:40:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMaH-0007IS-Er
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:37:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ec5eb0-46d1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 16:37:44 +0200 (CEST)
Received: from BLAPR03CA0062.namprd03.prod.outlook.com (2603:10b6:208:329::7)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 14:37:40 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::83) by BLAPR03CA0062.outlook.office365.com
 (2603:10b6:208:329::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 14:37:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:37:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:37:39 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:37:38 -0500
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
X-Inumbo-ID: a2ec5eb0-46d1-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSYCkHVA/gsKDulAZT6P7LFdk0Gdq+IFCB11Ec/ehIb4LxlA/ZNXHUqigrGgedWvvm9t9tp3dPHKPey+viaYH11OI8FRvKUR8xmPqRojywEYcVsTgc0C8Szq8ABfrKnb24jmfW16DKM1NfHXEaFBP6U1C+Z8r8ucfRcpix0E9Ptbu/fNRYUAHvC916p1DLJTS/e9tdaPwoXelKzkepzD6o0srdfBmW5E0Lb5Ne0LOLw5cNHGQQm+GECJJDH/5tjy7x/vf6SCuGBW8qTIciYrPgqO0r+MHhH/dDqpBDzELenimG4IrMNsGCYv2JYsxmPslwznA1bUjyCT+Axo2gXtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkhD6xpo2oK6wFkchaV4WlEipg9dIFDq1WyttTCY6NM=;
 b=v3HJxcY7m4GoNlew+qZ45BB8u3xTJG9M5nlBdhkYYXe+V8PoNvJreZxEWe3rFZd6yQDmLAbELd5VAECvEHx/B/QOlwvjPsUbhIc2D+TRFwctbnZ+lfRmbPSqxb4Ov9Kavb3p2xwddu93hMHwN6ZBH/2B8C7EFKE5+H9HzrjDJUd8Oarbm9HLUnte76ZSE5FH1y/ByuMkC4M71IUDWn6ntGPf/3bKOnnatNU3J/mu4yCL1PmOGVwUsxJ/uMtPprlSo8qjLpHG7Dw3dABv2TMU4HkQEXb79yD8alhy5rUkZfT9ChyclPh8+ADwcMI021sqzrtRRSghFenqGrOQimEUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkhD6xpo2oK6wFkchaV4WlEipg9dIFDq1WyttTCY6NM=;
 b=pL9PaGIuBzwMuU00u5UQyJ+imde5qDK+zPFqbY4S2Ka6NtTGUTFcX+J829iJOJAMDaCfDgfGY6N1RbveSGtw5+uFP1nBtG+F7kzTyYQLDUQZQwHRnYfq5MH09bRx/CAZld7Fbcb+yLXS1G05azrqgJUUwQiT3hOrtlMXWOLajJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions for arm32
Date: Wed, 11 Jun 2025 15:35:44 +0100
Message-ID: <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6177f9-7aac-4d43-e6ee-08dda8f5843b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6CN7CztbbdlSM2L735S7sTftYhuc4dae9J2Z5I5TvIOYUfbEJick1iA4QJ7R?=
 =?us-ascii?Q?HMxccF3m4zGb9XbxKuIc2//9ENLLYDJb5Pqg9ISKTmfpspc+elM3y2BXJNBv?=
 =?us-ascii?Q?R0oMIu5pg0j+hRcmaZzsoEgdD2WgqVzE8jD4sH0Ex+PQEj6x1QRsi2cL0a7U?=
 =?us-ascii?Q?qzibxl39rd1xOv8rFo8YLNtEhq1y2+hBRH0S6Xa5u67VNE2EQLARqw8l+lLu?=
 =?us-ascii?Q?GeHliWkGqck2asOGuDOkfkDStMMZAi3kMqLH1XaM639L6e7rsp3rt1lH+Iew?=
 =?us-ascii?Q?9fdRjq+xDkke9GZ1Vw++RmaD2GOUQKIitCB1S6wkuWMS4goYl7rNfhWdcDAV?=
 =?us-ascii?Q?73P2wA+B2sMTwnXc/yedVA5l4YZVU/eFJfG0soNl1z7qIPscx8gmU3Fxlzk/?=
 =?us-ascii?Q?i6Yrse4eoT9Vk3K7QAIUwl+iOy91X4oyGVEFKXHMuzT10DPN9nMSLUdgPfIa?=
 =?us-ascii?Q?cy4DsopitmGAzCNA81HYVvYPj+OUzwc/3Qr7g0GfKIkQSE35ik8MTNIbcxg8?=
 =?us-ascii?Q?TnvsGRBgxiLrkPCZlmmJHR4nNO9xRuSYEggX8Ax12nuLe5dp9v0akzIrOCuB?=
 =?us-ascii?Q?LDyBRvOZw8KfboCsqNgeL3txL6lflvqKcC53Xv1bZVGeeFqtsbKLvc2Jf3Cq?=
 =?us-ascii?Q?3oX7IfjAfEPIn1p2vUA5gMFe1l5lI0MY4SlyhChLBQ975O1e+2+LN81Oy8Xr?=
 =?us-ascii?Q?5AIi3wg6Sp85guyu9zyAibyfx0pHG9SADMa9azWzS1U2O0rUlcpYa2DrIzRk?=
 =?us-ascii?Q?2l42ltmLoyZcNvB5Ht3KFtIcyVtWbJH5Ll+2fFWLJJgHAJOqDfjkPWNFZkwU?=
 =?us-ascii?Q?92/rgxq5X2KCOIbFge4dbyn71qTSAXyE6q5MCbvbMBMCciMvqw34IYbz/X1j?=
 =?us-ascii?Q?p4W00EUrzZEETAnL+rIby2oaydHZY+aSPuQAVf1S6NKNesXfqUiheN5WSUxh?=
 =?us-ascii?Q?H5LKpQfmAikFkngJEReR0yaO/zEyBfEdCsE8GyOzmrHD7VaY85fLOjms1XtG?=
 =?us-ascii?Q?3lwpvJ/1vs++F8w+drSiUC7ki5J6hS5jifWD2tSEGff/eeLIW8HU102TXt1S?=
 =?us-ascii?Q?v6Hx6FEl2Yi/r0wC+lIqiT8AfURtkWq81GNHizvmltpsOkxZxtLaXTwoh2f+?=
 =?us-ascii?Q?RWF5oQU0UIv6uTCy2cBoClgF87pEiR/MMOFCNWugb27TWlUwYpGX7dtcjsZf?=
 =?us-ascii?Q?6N0gAHaGypocYR0NysZJDaa3k76zz07vtu1UGRbQhJ5jcOPET9A21GJ9GOWR?=
 =?us-ascii?Q?KwMGKZfpBElVIdtYN5AVZP3m1jyY/TyS2uh4ZO5xwBz1aMGAcEA+siWQrqbK?=
 =?us-ascii?Q?59tVWljFhyXwSiaqr2cAoC+oJYX18sYlNAVNBqvLT+pftz6RwabVwDvxPUSt?=
 =?us-ascii?Q?rgbIcWWrOl0k/Y4NaP4WrPkdIp7NCOw6eoSXWkw7QJ531m0W9UJCjsY9U4oa?=
 =?us-ascii?Q?SckRmugm05n4jjN4Ei87Gvm/2nAUuaNZ44YFsLF+Tse2hrYi5lq0r8Wwi/jm?=
 =?us-ascii?Q?nZBK37nlrYljuCFi92rjiq+EQmL/SztGswtm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:37:39.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6177f9-7aac-4d43-e6ee-08dda8f5843b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448

Define prepare_selector(), read_protection_region() and
write_protection_region() for arm32. Also, define
GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.

Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
Enable pr_of_addr() for arm32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Enable write_protection_region() for aarch32.

v2 - 1. Enable access to protection regions from 0 - 255.

 xen/arch/arm/include/asm/mpu.h  |   2 -
 xen/arch/arm/mpu/arm32/Makefile |   1 +
 xen/arch/arm/mpu/arm32/mm.c     | 165 ++++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c           |   2 -
 4 files changed, 166 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/mpu/arm32/mm.c

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 8f06ddac0f..63560c613b 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -25,7 +25,6 @@
 
 #ifndef __ASSEMBLY__
 
-#ifdef CONFIG_ARM_64
 /*
  * Set base address of MPU protection region.
  *
@@ -85,7 +84,6 @@ static inline bool region_is_valid(const pr_t *pr)
 {
     return pr->prlar.reg.en;
 }
-#endif /* CONFIG_ARM_64 */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
index e15ce2f7be..3da872322e 100644
--- a/xen/arch/arm/mpu/arm32/Makefile
+++ b/xen/arch/arm/mpu/arm32/Makefile
@@ -1 +1,2 @@
 obj-y += domain-page.o
+obj-y += mm.o
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
new file mode 100644
index 0000000000..5d3cb6dff7
--- /dev/null
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/types.h>
+#include <asm/mpu.h>
+#include <asm/sysregs.h>
+#include <asm/system.h>
+
+#define PRBAR_EL2_(n)   HPRBAR##n
+#define PRLAR_EL2_(n)   HPRLAR##n
+
+#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
+        break;                                                              \
+    }
+
+#define GENERATE_WRITE_PR_REG_OTHERS(num, pr)                               \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, HPRBAR);            \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, HPRLAR);            \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_CASE(num, pr)                                  \
+    case num:                                                               \
+    {                                                                       \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));                      \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));                      \
+        break;                                                              \
+    }
+
+#define GENERATE_READ_PR_REG_OTHERS(num, pr)                                \
+    case num:                                                               \
+    {                                                                       \
+        pr->prbar.bits = READ_SYSREG(HPRBAR);                               \
+        pr->prlar.bits = READ_SYSREG(HPRLAR);                               \
+        break;                                                              \
+    }
+
+/*
+ * Armv8-R supports direct access and indirect access to the MPU regions through
+ * registers:
+ *  - indirect access involves changing the MPU region selector, issuing an isb
+ *    barrier and accessing the selected region through specific registers
+ *  - direct access involves accessing specific registers that point to
+ *    specific MPU regions, without changing the selector, avoiding the use of
+ *    a barrier.
+ * For Arm32 the PR{B,L}AR<n>_ELx (for n=0..31) are used for direct access to the
+ * first 32 MPU regions.
+ * For MPU region numbered 32..255, one need to set the region number in PRSELR_ELx,
+ * followed by configuring PR{B,L}AR_ELx.
+ */
+inline void prepare_selector(uint8_t *sel)
+{
+    uint8_t cur_sel = *sel;
+
+    if ( cur_sel > 0x1FU )
+    {
+        WRITE_SYSREG(cur_sel, PRSELR_EL2);
+        isb();
+    }
+}
+
+void read_protection_region(pr_t *pr_read, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_READ_PR_REG_CASE(0, pr_read);
+        GENERATE_READ_PR_REG_CASE(1, pr_read);
+        GENERATE_READ_PR_REG_CASE(2, pr_read);
+        GENERATE_READ_PR_REG_CASE(3, pr_read);
+        GENERATE_READ_PR_REG_CASE(4, pr_read);
+        GENERATE_READ_PR_REG_CASE(5, pr_read);
+        GENERATE_READ_PR_REG_CASE(6, pr_read);
+        GENERATE_READ_PR_REG_CASE(7, pr_read);
+        GENERATE_READ_PR_REG_CASE(8, pr_read);
+        GENERATE_READ_PR_REG_CASE(9, pr_read);
+        GENERATE_READ_PR_REG_CASE(10, pr_read);
+        GENERATE_READ_PR_REG_CASE(11, pr_read);
+        GENERATE_READ_PR_REG_CASE(12, pr_read);
+        GENERATE_READ_PR_REG_CASE(13, pr_read);
+        GENERATE_READ_PR_REG_CASE(14, pr_read);
+        GENERATE_READ_PR_REG_CASE(15, pr_read);
+        GENERATE_READ_PR_REG_CASE(16, pr_read);
+        GENERATE_READ_PR_REG_CASE(17, pr_read);
+        GENERATE_READ_PR_REG_CASE(18, pr_read);
+        GENERATE_READ_PR_REG_CASE(19, pr_read);
+        GENERATE_READ_PR_REG_CASE(20, pr_read);
+        GENERATE_READ_PR_REG_CASE(21, pr_read);
+        GENERATE_READ_PR_REG_CASE(22, pr_read);
+        GENERATE_READ_PR_REG_CASE(23, pr_read);
+        GENERATE_READ_PR_REG_CASE(24, pr_read);
+        GENERATE_READ_PR_REG_CASE(25, pr_read);
+        GENERATE_READ_PR_REG_CASE(26, pr_read);
+        GENERATE_READ_PR_REG_CASE(27, pr_read);
+        GENERATE_READ_PR_REG_CASE(28, pr_read);
+        GENERATE_READ_PR_REG_CASE(29, pr_read);
+        GENERATE_READ_PR_REG_CASE(30, pr_read);
+        GENERATE_READ_PR_REG_CASE(31, pr_read);
+        GENERATE_READ_PR_REG_OTHERS(32 ... 255, pr_read);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+void write_protection_region(const pr_t *pr_write, uint8_t sel)
+{
+    prepare_selector(&sel);
+
+    switch ( sel )
+    {
+        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
+        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
+        GENERATE_WRITE_PR_REG_OTHERS(32 ... 255, pr_write);
+    default:
+        BUG(); /* Can't happen */
+        break;
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 7ab68fc8c7..ccfb37a67b 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -39,7 +39,6 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
-#ifdef CONFIG_ARM_64
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 {
     unsigned int attr_idx = PAGE_AI_MASK(flags);
@@ -110,7 +109,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 
     return region;
 }
-#endif /* CONFIG_ARM_64 */
 
 void __init setup_mm(void)
 {
-- 
2.25.1


