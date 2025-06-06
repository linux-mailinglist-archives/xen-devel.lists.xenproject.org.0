Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA6AD0702
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 18:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008674.1387921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFy-0005fw-C7; Fri, 06 Jun 2025 16:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008674.1387921; Fri, 06 Jun 2025 16:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFy-0005bP-4k; Fri, 06 Jun 2025 16:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1008674;
 Fri, 06 Jun 2025 16:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNaFw-00050H-AL
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 16:49:24 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2417::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 323fc10f-42f6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 18:49:23 +0200 (CEST)
Received: from CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37)
 by PH7PR12MB6610.namprd12.prod.outlook.com (2603:10b6:510:212::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 16:49:20 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::c6) by CH2PR14CA0057.outlook.office365.com
 (2603:10b6:610:56::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 6 Jun 2025 16:49:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 16:49:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:19 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 6 Jun 2025 11:49:18 -0500
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
X-Inumbo-ID: 323fc10f-42f6-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PorDi+nDR9+eJyTvu0mx6wr6nbkmzW64RFl0gU0mSZlDoxZbv6yz8mg29Om8QIafCtVyiR/7ea1iB2XX49ng6SjOtfEJ8OMyiMrZPU3SihnpHusPbhn+S3PJUAKCFsYQzSekt5ZaaC2/92sXt5WOmgREoaeZV2FGBEl0v7TZaXFrD6m2LltjvAY79HqeefCMw2ZAd2AXNqUlZkz1k7gfjfHCVhtTvVUANdH1o1wmE22C82xudh8HQlRgO/jGZ2b3KmVLW+LlWr2TkgBQfAJibLlCCnlEFgc/FhvYdvMfwHJ6JgYt4hiQxhCv7lAp1bcxWz8+HOWPr1ggD5ND1n4aJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQcBHCwDQIPOHrssJVI2Ikm6vmDVkzGZdiJ1UJXecoo=;
 b=iicc764N758FN+yVm1uJgKbRm/0IzZpSqUsvq7BPTgsVtrpfYJjiXHHx+Gh41Y4kLa6gDobWJYAKtcxl6N4Ka9jWeMD6OM35jYdrqi4DRq3AFmNs4UMkZZL/G6JIsYgFvU17e6GOto2geZDkxpLPcVfFLoMF8XN7KcyUfvm029yjGObTUde2dzkB5ZfVuuyRzDdgSMEcs1o2tZh8DEABjMr6fN/KtM0swSqRFvEZKxqkuxiw5Pg0Ch1Y0UVt5uPm17geG7v0Seh8FZqramJQnSQCYVKCglz6rkUZQrAdjRiE/EqW7vMT0mRi/rGg9Tkhebq2XU4IzWF8djnK5DG9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQcBHCwDQIPOHrssJVI2Ikm6vmDVkzGZdiJ1UJXecoo=;
 b=fG/b0iO1Zv3CI2xu0yoksV9cxTdm62y4bAeThlNTL1PUEg7SreONlLRzh/RQH/kfKAmsHBtyIBhw1nbnjD1raZYA0vjIWn71NdLhgRDf8j7LNBDM4bJWwsUedi5O3Uxw3v8+HRCowO7P41JNm2oeszNkKKXqw5/AWKG81SQlSZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from the C code
Date: Fri, 6 Jun 2025 17:48:54 +0100
Message-ID: <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|PH7PR12MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb33d62-20c4-4337-877d-08dda51a151e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ar43zj/9YmJ0qRM/AkxBKPuhkKisdK02xoPsICxyvU9XyoSpfupeBKPi3oEU?=
 =?us-ascii?Q?8Bb7b1focE7oT+J1MRV3LoE5uH7+9MaoONQpqOEA7YFtlOjgy7J6+mIQ5dsI?=
 =?us-ascii?Q?dV6J0X5Pn95e49nZBRwfPD51HI9zIL7jqWzY68auPlHUbgpghv5p5nYKfRYn?=
 =?us-ascii?Q?YUgiR9qOE56PTAnRXEmN/lDjqP/uq9O4mn6fDl5Ne8adxpL43B1e4/T0OxPc?=
 =?us-ascii?Q?SZ8bOfecDX/G3g3Xp+BSkt6hHRqfHcATimPsCGcjWbAavdML4n3sIBrR67W5?=
 =?us-ascii?Q?y6KpyNwzX4E8Rym+Fb9ftyYx94/onBl/Bi1Dlyh/81wySrcdzqT/USRq8azJ?=
 =?us-ascii?Q?gyUv2udrU0D2Hlc5zOwY+qKRkVMKyG+QvzN0n6m7Ykk8PlfOjdd8WvH5eDja?=
 =?us-ascii?Q?twxjlsCPVLTLVRu1zk/4x6nKF9zgE2HdF/maW7Fm2Hwgx509/7V5RXeYZIcy?=
 =?us-ascii?Q?xU3FSJD3clOwKE17NC2EpnLuYYWEMhVV530fjs0R4RU/ns1GVYvvKEm7O+0D?=
 =?us-ascii?Q?GNRUwiYcVC4GVu1ZoCA/Oh+mLlJpN0I0z3d0It1FAwjxgttZIqH8kIb4FiMj?=
 =?us-ascii?Q?BLq3jPCoYJOzKYFqfaEIkZoI4o6WN0Ogis1VAd8hioII8nbNHmtrsEua9qtz?=
 =?us-ascii?Q?eFHrn1BDH98lSHG0ofQMi33sVWQxTBnRS6nvX+VLZxKdr2yxm73SMA+cnFt9?=
 =?us-ascii?Q?FWz65KHJAPfuGeLUGxDmEJtTw65C/g8pEqyJes91W8fcK2QfGnYy2aodLS62?=
 =?us-ascii?Q?QL0+4vJs5dOzoFdHEmp9VImuPnRCXQGGu3NDD4Uza9S4IysoalMkHCOw/Fm2?=
 =?us-ascii?Q?JiT8X6L7BRPnEOlXfx3GTy35VEEw9R56P5rdQR4nuBKTXCcoRGrq5TS6EfQz?=
 =?us-ascii?Q?C34HRPn8ogqSPfAc2mFxISpN7NbElxtD+9/fauUj8nT1xO0fw/pE9XZ/4K+1?=
 =?us-ascii?Q?I61zELyn55R7oH8qiX0YdIiPIhUHWLm1XkJ8gPpQsFaaW+DdBO9A76knUR22?=
 =?us-ascii?Q?rUnTGZgmpQXNYF1QmEbKUsac55G+RHkhGDafaegUhQv0qk/gZ2KD5UgCGAVJ?=
 =?us-ascii?Q?PZJ7s2yTjoZqtu/+/vEfRZsf6GRAy27gUpBEnOCVnUt+J5gwT6TP1R9Cop7k?=
 =?us-ascii?Q?+DMKv2knICigonP4/jtbLEdjpjBBs8bDKibfP1awMxiznuZeUF2OHOLIIWaG?=
 =?us-ascii?Q?AkQa5GkIUyqTsn3DDH51nOKSv/TkCzAQzcEw1zcShzoVwDloQ3W+ve1viNag?=
 =?us-ascii?Q?1NzaL4ipSNaVjHHtQ5p3aJtqbgrAXRMyrjksJZ+4yB718Wu+hUNdhiemJ7XN?=
 =?us-ascii?Q?wJBxWeTif4BFPEoLefWeTcvNXM24ta+LlTzFm0JibFRvl4t0KeRhPWYmlMAs?=
 =?us-ascii?Q?VjnsSGM4RmTEATIRDDqDpFo8GjLZhLnI6aTxnQx9UJmyPqc2sF6PhGZi/V4G?=
 =?us-ascii?Q?S2pb4tbVynPGfPdKCZWza5h/2BQuMmI9HnvCRnNADHG1Zl2i9slnNF41JJ6w?=
 =?us-ascii?Q?2wi9hg5xW5nGl4epfdOeQ+t+6fj1r8JhZAHI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:49:19.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb33d62-20c4-4337-877d-08dda51a151e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6610

Enable the helper functions defined in mpu/mm.c and asm/mpu.h for ARM32.
Define the register definitions for HPRBAR{0..31} and HPRLAR{0..31}.
One can directly access the first 32 MPU regions using the above registers
without the use of PRSELR.

Also fix the register definition for HPRLAR.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Change from :-

v1 - 1. Enable write_protection_region() for aarch32.

 xen/arch/arm/include/asm/mpu.h        |  2 -
 xen/arch/arm/include/asm/mpu/cpregs.h | 72 ++++++++++++++++++++++++++-
 xen/arch/arm/mpu/mm.c                 | 49 ++++++++++++++++--
 3 files changed, 116 insertions(+), 7 deletions(-)

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
 
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..9f3b32acd7 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,16 +6,86 @@
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
 
+/* CP15 CR6: Protection Region Enable Register */
+#define HPRENR          p15,4,c6,c1,1
+
 /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
-#define HPRLAR          p15,4,c6,c8,1
+#define HPRLAR          p15,4,c6,c3,1
+
+/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
+#define HPRBAR0         p15,4,c6,c8,0
+#define HPRLAR0         p15,4,c6,c8,1
+#define HPRBAR1         p15,4,c6,c8,4
+#define HPRLAR1         p15,4,c6,c8,5
+#define HPRBAR2         p15,4,c6,c9,0
+#define HPRLAR2         p15,4,c6,c9,1
+#define HPRBAR3         p15,4,c6,c9,4
+#define HPRLAR3         p15,4,c6,c9,5
+#define HPRBAR4         p15,4,c6,c10,0
+#define HPRLAR4         p15,4,c6,c10,1
+#define HPRBAR5         p15,4,c6,c10,4
+#define HPRLAR5         p15,4,c6,c10,5
+#define HPRBAR6         p15,4,c6,c11,0
+#define HPRLAR6         p15,4,c6,c11,1
+#define HPRBAR7         p15,4,c6,c11,4
+#define HPRLAR7         p15,4,c6,c11,5
+#define HPRBAR8         p15,4,c6,c12,0
+#define HPRLAR8         p15,4,c6,c12,1
+#define HPRBAR9         p15,4,c6,c12,4
+#define HPRLAR9         p15,4,c6,c12,5
+#define HPRBAR10        p15,4,c6,c13,0
+#define HPRLAR10        p15,4,c6,c13,1
+#define HPRBAR11        p15,4,c6,c13,4
+#define HPRLAR11        p15,4,c6,c13,5
+#define HPRBAR12        p15,4,c6,c14,0
+#define HPRLAR12        p15,4,c6,c14,1
+#define HPRBAR13        p15,4,c6,c14,4
+#define HPRLAR13        p15,4,c6,c14,5
+#define HPRBAR14        p15,4,c6,c15,0
+#define HPRLAR14        p15,4,c6,c15,1
+#define HPRBAR15        p15,4,c6,c15,4
+#define HPRLAR15        p15,4,c6,c15,5
+#define HPRBAR16        p15,5,c6,c8,0
+#define HPRLAR16        p15,5,c6,c8,1
+#define HPRBAR17        p15,5,c6,c8,4
+#define HPRLAR17        p15,5,c6,c8,5
+#define HPRBAR18        p15,5,c6,c9,0
+#define HPRLAR18        p15,5,c6,c9,1
+#define HPRBAR19        p15,5,c6,c9,4
+#define HPRLAR19        p15,5,c6,c9,5
+#define HPRBAR20        p15,5,c6,c10,0
+#define HPRLAR20        p15,5,c6,c10,1
+#define HPRBAR21        p15,5,c6,c10,4
+#define HPRLAR21        p15,5,c6,c10,5
+#define HPRBAR22        p15,5,c6,c11,0
+#define HPRLAR22        p15,5,c6,c11,1
+#define HPRBAR23        p15,5,c6,c11,4
+#define HPRLAR23        p15,5,c6,c11,5
+#define HPRBAR24        p15,5,c6,c12,0
+#define HPRLAR24        p15,5,c6,c12,1
+#define HPRBAR25        p15,5,c6,c12,4
+#define HPRLAR25        p15,5,c6,c12,5
+#define HPRBAR26        p15,5,c6,c13,0
+#define HPRLAR26        p15,5,c6,c13,1
+#define HPRBAR27        p15,5,c6,c13,4
+#define HPRLAR27        p15,5,c6,c13,5
+#define HPRBAR28        p15,5,c6,c14,0
+#define HPRLAR28        p15,5,c6,c14,1
+#define HPRBAR29        p15,5,c6,c14,4
+#define HPRLAR29        p15,5,c6,c14,5
+#define HPRBAR30        p15,5,c6,c15,0
+#define HPRLAR30        p15,5,c6,c15,1
+#define HPRBAR31        p15,5,c6,c15,4
+#define HPRLAR31        p15,5,c6,c15,5
 
 /* Aliases of AArch64 names for use in common code */
 #ifdef CONFIG_ARM_32
 /* Alphabetically... */
 #define MPUIR_EL2       HMPUIR
 #define PRBAR_EL2       HPRBAR
+#define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
 #define PRSELR_EL2      HPRSELR
 #endif /* CONFIG_ARM_32 */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 2fb6b822c6..74e96ca571 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -40,7 +40,10 @@ pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 #define PRBAR_EL2_(n)   PRBAR##n##_EL2
 #define PRLAR_EL2_(n)   PRLAR##n##_EL2
 
-#endif /* CONFIG_ARM_64 */
+#else  /* CONFIG_ARM_64 */
+#define PRBAR_EL2_(n)   HPRBAR##n
+#define PRLAR_EL2_(n)   HPRLAR##n
+#endif /* !CONFIG_ARM_64 */
 
 #define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
     case num:                                                               \
@@ -68,7 +71,6 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
-#ifdef CONFIG_ARM_64
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
@@ -85,6 +87,7 @@ static void __init __maybe_unused build_assertions(void)
  */
 static void prepare_selector(uint8_t *sel)
 {
+#ifdef CONFIG_ARM_64
     uint8_t cur_sel = *sel;
 
     /*
@@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
         WRITE_SYSREG(cur_sel, PRSELR_EL2);
         isb();
     }
-    *sel &= 0xFU;
+    *sel = *sel & 0xFU;
+#endif
 }
 
 void read_protection_region(pr_t *pr_read, uint8_t sel)
@@ -123,6 +127,24 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
         GENERATE_READ_PR_REG_CASE(13, pr_read);
         GENERATE_READ_PR_REG_CASE(14, pr_read);
         GENERATE_READ_PR_REG_CASE(15, pr_read);
+#ifdef CONFIG_ARM_32
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
+#endif
     default:
         BUG(); /* Can't happen */
         break;
@@ -151,6 +173,24 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
         GENERATE_WRITE_PR_REG_CASE(13, pr_write);
         GENERATE_WRITE_PR_REG_CASE(14, pr_write);
         GENERATE_WRITE_PR_REG_CASE(15, pr_write);
+#ifdef CONFIG_ARM_32
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
+#endif
     default:
         BUG(); /* Can't happen */
         break;
@@ -208,7 +248,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     /* Build up value for PRLAR_EL2. */
     prlar = (prlar_t) {
         .reg = {
+#ifdef CONFIG_ARM_64
             .ns = 0,        /* Hyp mode is in secure world */
+#endif
             .ai = attr_idx,
             .en = 1,        /* Region enabled */
         }};
@@ -225,7 +267,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 
     return region;
 }
-#endif /* CONFIG_ARM_64 */
 
 void __init setup_mm(void)
 {
-- 
2.25.1


