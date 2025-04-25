Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D173A9C964
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967981.1357701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IWj-0003Pq-Ku; Fri, 25 Apr 2025 12:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967981.1357701; Fri, 25 Apr 2025 12:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IWj-0003M7-Fx; Fri, 25 Apr 2025 12:51:33 +0000
Received: by outflank-mailman (input) for mailman id 967981;
 Fri, 25 Apr 2025 12:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m1g=XL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u8IQk-0007M6-9Q
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:45:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2416::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24d37793-21d3-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 14:45:20 +0200 (CEST)
Received: from BL1PR13CA0411.namprd13.prod.outlook.com (2603:10b6:208:2c2::26)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 12:45:11 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::9f) by BL1PR13CA0411.outlook.office365.com
 (2603:10b6:208:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Fri,
 25 Apr 2025 12:45:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 12:45:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:45:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 07:45:09 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 25 Apr 2025 07:45:09 -0500
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
X-Inumbo-ID: 24d37793-21d3-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUXnsAEKolhFhwPfsYYceuO2L5f31H7p+XXAahaxcNluNtcLOuFKmOY7v+ont/xp70YQ6rJ9deV/CGOnC/PPEUnyqpDNMRIq+vZBiC1BUpKiA6rX3aTalXBUSPrpdJnt50tjHAnOjVpw3ekciueq09nvz117aAomF4TppZj9MAJR1WTKA3ZmSuCAqLx67sGCdDzL1di2Bvpeeja9xanN6pnihQ8IkVjIXVqgKDOaSqI9X9UBlT6DAyFk1RLeXuZnCaPI5kaNxr3VqAKOBOZS5OVo1iE5nMGjgzwtcemj1N2zqQjeZmV8mTPZcecFoqpfVh+CZCT6dw2l4jyso2pTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za2qafe4F13w1lRNFAElgMuqv0P9SCzOcBpwKB8HL+s=;
 b=ywQqNuzR74Kr00//VWB2aFiYCKI9T0t/u7XX3ONRSI17OX4hSrQTKACD7wDQI1L2OcaMMEjRVI5p9ZrZo8JnYw8QYhJeFYsEnvT84glP4HYN7gpyjbeK4/KGLir9CJcSsTnZNiZpQORuPe2oWFy9Ma+45obLOuMYucse3aPArZ5BLVQhNpyczoZeVlmujvunR04HJrhnBsnThYnBPTbx9gwR27X3TJCGw5bYAE4hU6k/OKs+xCzO1s2hbsIWw6/cJ2lUCGLgze8cvyuK+IRsOF87jNgXnTmOVZD1QiPjs/MqamuMT5eCSt7KGM9If6JSmMS1bErqA+3sjw9neKXV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za2qafe4F13w1lRNFAElgMuqv0P9SCzOcBpwKB8HL+s=;
 b=dUVmg17b4bFdr0dVnsfyg55bQ7Y/FUBRiDHK+7JDiXoYQmYSlUtKBtBYJwjKGmEJ2gfjTb/zSe+TMNmWWQ4jdvmrw3U32SBLJ0VZLuZN3crJYv29jSJy+wG29458BthGGZb309BtO27yuyIIeDrczi1PS6I7TCBzGK8crCZUUJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Luca Fancellu
	<luca.fancellu@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: AArch32-V8R: Add MPU register definitions
Date: Fri, 25 Apr 2025 13:45:06 +0100
Message-ID: <20250425124506.390458-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f25ebc-c4b3-488f-aa1f-08dd83f7041b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KZLaEW1fDM7RKLoXUJ2wPXoDQETlIXBCxHefqMzlc7McsR2XKo1Dz2DniUbf?=
 =?us-ascii?Q?dLGkShJT2pxiarL3mjP9txG95ntr2WMISV+B88O0+EjAcolQG5/WIYxQk+rR?=
 =?us-ascii?Q?4w75Mr4YcWYYCCxvArt2y1SjK+uC533jnUX30wDWSQd9kWhc9JR2CnXRnPK5?=
 =?us-ascii?Q?TP96APjWAU3BObL6EcXlPNG3flV85qaLVpDq+WRI18jPhP0Qkuh0z9/Yr8W4?=
 =?us-ascii?Q?NUR+6VP8TdMc31yjj2so4nKXdnezxc6dksdEB9oWc74MtWM5a3lTUJwO9L0Q?=
 =?us-ascii?Q?gEmt6+PH0s8kESjIQ/De8qoy/Hb5wlzBpkQ+XsjM8Zq5fq8jAds7KeLENHS+?=
 =?us-ascii?Q?NBB2F/r2rrysMUiHbhIRKSOyyGRQPB8it4IXwW+Id1uMVSk92IN0PichwJQZ?=
 =?us-ascii?Q?oL9SAuNjZLXJLSpTnIENNVClzDyRAKddIR4u2MJaDk+Xja+lE2EV3UotcVG4?=
 =?us-ascii?Q?80N9uKcTKs6WKlK6OdRyMAwPx2NVHM1baxS2Vs5bWrfZdEJTOTY7Jlvaze6s?=
 =?us-ascii?Q?sXr/pDff0kgI/2AYmiIrCmcy5CBjLpP0LHLq+0FnDrEgsva3InzoPec5HKGv?=
 =?us-ascii?Q?oNvCS0Jv0hqou14tooNMZMPCpFr3zmTkOJefXb0TtY0bOcy8SS3JX81xvV1s?=
 =?us-ascii?Q?FV8FqQyFSTGeKB2pOzqVyqthklWlfDXkHCJFso8qWGbeTkGw01rv9CZDQRxP?=
 =?us-ascii?Q?BP2XY9x1YJxERS+0QCzmJm12bAfL/ubXbQWkLa0moWJ2eZn9N0wrpNyi2QqN?=
 =?us-ascii?Q?RYIXN9JbfHroqxX06KwR0F+Y11Pq2scTm4NBHnh8xDrCc0sP4hyxYxi5SSMj?=
 =?us-ascii?Q?GwnI2skxebKIPgTzV7ZP3lpFGT0S2KeUMJUkM/pLTmOQysiStrwvsxX3HYxa?=
 =?us-ascii?Q?VTsMfMmHevMR5LVcbgMtl7+j/1fWXcRpGNTvW6PmCo3N3PUqP+hh4tNnSPBI?=
 =?us-ascii?Q?ZOM/tIxTiplEZgpBRHdCt5r/l5Fysg38RIuq5CkgUhXoBXjmGTHUfRooRDd5?=
 =?us-ascii?Q?SFKumfmi1J9KtVN22wHAIHfGGZqvJHAdSsU22bTYKZp8pUlWwf/swB+vNYF6?=
 =?us-ascii?Q?Up/Qn+tyRy4KtnC0YWbEJnz58OgFGjjWvy4RbGSZ0uX0ZJORy5r5avUgWo3H?=
 =?us-ascii?Q?DhMaiOZqzpe/oU0blv8CblAiMETisH+NENombN9SDsLKQfQ8RiKHNqF3TiOy?=
 =?us-ascii?Q?lpIgn+EipE1B3P4WQDe+2Hveg6JB3A8dxvAZ9gW5p4XHbN7fCDIfTMHBqrKB?=
 =?us-ascii?Q?NSm6Yk6dz0vBK3MbI+gIQAOsqepMszEaYZNDs/t924ia8V2J3jpQaqArgWzl?=
 =?us-ascii?Q?CVCB2EYVDlqFqLtTlwcIpT8YoKpELHW65tnKDpFpv4RcShICMVD0mOSnztob?=
 =?us-ascii?Q?QNReREeX72KFIJKKOkxrTA2KabvBvL0j8FBsBcjnintlUdTx/LHXt1Q66wpp?=
 =?us-ascii?Q?sLt5KosFvUpoEaScoCVrhPFKKCNKudAs13JDkSXXzlhootLl/c4UHLMQO6aH?=
 =?us-ascii?Q?P9fr3yespQTl+S2KdcZHP9vw+pY5UfIN5LGO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:45:10.5092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f25ebc-c4b3-488f-aa1f-08dd83f7041b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 HPRBAR<n>,
E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.

Introduce pr_t typedef which is a structure having the prbar and prlar members,
each being structured as the registers of the AArch32-V8R architecture.
This is the arm32 equivalent of
"arm/mpu: Introduce MPU memory region map structure".

Few differences worth noting:-
1. The XN in HPRBAR is 1 bit in Arm32 (unlike 2 bits in Arm64).
2. PRSELR_EL2 is not used to access HPRBAR<0..31> and HPRLAR<0..31>.

Introduce macros PR{B,L}AR_EL2_(num) to generate alias for the sysregs.

Also, took the opportunity to fix the register definition of HPRLAR.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Introduce macros for PR{B,L}AR_EL2_(num). Similar macros need to be
defined for arm64 as well.
2. Some style fixes

Comments not addressed
1. Renaming of PRBAR_EL2_XN if needed.
2. Using res0 for ns.

This patch should be applied after
"[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to enable
compilation for AArch32 and macros need to be defined for Arm64 as well.

 xen/arch/arm/include/asm/arm32/mpu.h  | 59 +++++++++++++++++++++
 xen/arch/arm/include/asm/mpu.h        |  4 ++
 xen/arch/arm/include/asm/mpu/cpregs.h | 75 ++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/page.h       |  7 ++-
 xen/arch/arm/mpu/mm.c                 | 14 +++--
 5 files changed, 153 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
new file mode 100644
index 0000000000..dc5ef9b3e9
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mpu.h: Arm Memory Protection Unit definitions for aarch64.
+ */
+
+#ifndef __ARM_ARM32_MPU_H
+#define __ARM_ARM32_MPU_H
+
+#define XN_EL2_ENABLED  0x1
+
+#ifndef __ASSEMBLY__
+
+/* Hypervisor Protection Region Base Address Register */
+typedef union {
+    struct {
+        unsigned int xn:1;       /* Execute-Never */
+        unsigned int ap:2;       /* Acess Permission */
+        unsigned int sh:2;       /* Sharebility */
+        unsigned int res0:1;     /* Reserved as 0 */
+        unsigned int base:26;    /* Base Address */
+    } reg;
+    uint32_t bits;
+} prbar_t;
+
+/* Hypervisor Protection Region Limit Address Register */
+typedef union {
+    struct {
+        unsigned int en:1;     /* Region enable */
+        unsigned int ai:3;     /* Memory Attribute Index */
+        /*
+         * There is no actual ns bit in hardware. It is used here for
+         * compatibility with Arm64 code. Thus, we are reusing a res0 bit for ns.
+         */
+        unsigned int ns:1;     /* Reserved 0 by hardware */
+        unsigned int res0:1;   /* Reserved 0 by hardware */
+        unsigned int limit:26; /* Limit Address */
+    } reg;
+    uint32_t bits;
+} prlar_t;
+
+/* Protection Region */
+typedef struct {
+    prbar_t prbar;
+    prlar_t prlar;
+    uint64_t p2m_type;          /* Used to store p2m types. */
+} pr_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_ARM32_MPU_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 77d0566f97..67127149c0 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -8,8 +8,12 @@
 
 #if defined(CONFIG_ARM_64)
 # include <asm/arm64/mpu.h>
+#elif defined(CONFIG_ARM_32)
+# include <asm/arm32/mpu.h>
 #endif
 
+#define PRENR_MASK  GENMASK(31, 0)
+
 #define MPU_REGION_SHIFT  6
 #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
 #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..d051598477 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,18 +6,91 @@
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
+#define PRBAR_EL2_(N)   HPRBAR##N
+#define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
+#define PRLAR_EL2_(N)   HPRLAR##N
 #define PRSELR_EL2      HPRSELR
+
 #endif /* CONFIG_ARM_32 */
 
 #endif /* __ARM_MPU_CPREGS_H */
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 22f7d2c6cb..f4ae8ba6d7 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -96,7 +96,8 @@
 /*
  * Layout of the flags used for updating MPU memory region attributes
  * [0:2] Memory attribute Index
- * [3:4] Execute Never
+ * [3:4] Execute Never // For ARM_64
+ * [3] Execute Never // For ARM_32
  * [5:6] Access Permission
  * [7]   Region Present
  */
@@ -105,7 +106,11 @@
 #define _PAGE_AP_BIT            5
 #define _PAGE_PRESENT_BIT       7
 #define _PAGE_AI                (7U << _PAGE_AI_BIT)
+#ifdef CONFIG_ARM_32
+#define _PAGE_XN                (1U << _PAGE_XN_BIT)
+#else
 #define _PAGE_XN                (2U << _PAGE_XN_BIT)
+#endif
 #define _PAGE_RO                (2U << _PAGE_AP_BIT)
 #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
 #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index e0a40489a7..c177724c45 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -31,16 +31,16 @@ pr_t xen_mpumap[MAX_MPU_REGIONS];
 #define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
     case num:                                                               \
     {                                                                       \
-        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR##num##_EL2);  \
-        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR##num##_EL2);  \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
         break;                                                              \
     }
 
 #define GENERATE_READ_PR_REG_CASE(num, pr)                      \
     case num:                                                   \
     {                                                           \
-        pr->prbar.bits = READ_SYSREG(PRBAR##num##_EL2);         \
-        pr->prlar.bits = READ_SYSREG(PRLAR##num##_EL2);         \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
         break;                                                  \
     }
 
@@ -56,6 +56,11 @@ static void __init __maybe_unused build_assertions(void)
 
 static void prepare_selector(uint8_t *sel)
 {
+    /*
+     * In Arm32, one can access PRBAR<0..31>_EL2 and PRLAR<0..31>_EL2 without
+     * the need to configure PRSELR_EL2.
+     */
+#ifdef CONFIG_ARM_64
     uint8_t cur_sel = *sel;
     /*
      * {read,write}_protection_region works using the direct access to the 0..15
@@ -69,6 +74,7 @@ static void prepare_selector(uint8_t *sel)
         isb();
     }
     *sel = *sel & 0xFU;
+#endif
 }
 
 /*
-- 
2.25.1


