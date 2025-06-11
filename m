Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C804AD58E0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011812.1390339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMYq-0007er-AJ; Wed, 11 Jun 2025 14:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011812.1390339; Wed, 11 Jun 2025 14:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMYq-0007dF-6p; Wed, 11 Jun 2025 14:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1011812;
 Wed, 11 Jun 2025 14:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMYo-0007cf-RC
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:36:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2408::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b99f685-46d1-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 16:36:12 +0200 (CEST)
Received: from CH0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:b0::14)
 by SA5PPFD911547FB.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 11 Jun
 2025 14:36:07 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::61) by CH0PR03CA0009.outlook.office365.com
 (2603:10b6:610:b0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 14:36:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:36:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:36:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:36:06 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:36:05 -0500
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
X-Inumbo-ID: 6b99f685-46d1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajtENmQs69FG+RotrkpcuoE7PScI/UEDAILFS3tfLSdgpNr1grgkuZsew6PGZ42ASNIb5AH5zwLTfhab4ZNsLu2cTMW/O93XS9XG59VARN5YBjnxsqEK/CUX2jl23C9O8ToKWYi45fNfFjnHEK/XkI+5911F+1+5XXRdJG8606K5Uqa+stk7F0PIjfQAtZ4BfYJpvpwXwgPLE9T4sikTdGHw0KkD0Fo3bj3tlsCUzhVs4G8Leo5sx9oj1ndY5on3NwxOGf3h1RfYVllxVZDxkBWoa9/nl1ci5d6i1OXilVaIzKX+Dw/pjwmZWLF/o/Vkr+ZuWJvAXhKOUWJ5KMpzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfBXF6h9UdzLnnzbqVw3V7gpYaAlMU83olFhqIogFh8=;
 b=bCBpMmiJ5Zm65WXHVY+oHjxXNtKkc2VyyG6GYXvtnqhypiPK0M0yRIzxeYQon2YGMSUNIMzxAbQcEvXquzLKVDHM+RsupduE+Mb943YOP6xOat8f1JDdJ8QOYOESNbfPMijg/MbcL5nHysnIVvSOmplQSoSSpw0CsxNipjzVCGooONzOCAxbLcfruWmUwJ56Fbirm0pU29jUNkX0DWvq7y93WJHnybCI4LFOvKknFa+7IJvx9l02nsaprw9tsSTTkM19snSsa73zB8Rnjk5ySOEtkCiJeVYr54iFeY73JKumh4jAffqobN+TRNROunoSCDtl3fJJGAW3fVgI//iQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfBXF6h9UdzLnnzbqVw3V7gpYaAlMU83olFhqIogFh8=;
 b=EaJ0CpSg/E+zMhX62r58F9CDp/Int16JMKa0AGW1fY6TBu88V2ZhXeT1VFSgIjpxh9IrwxaNSYA89AuCGJRPz99wsi/zT4+kE7f1Ltn/nndXTSNkePE7N8x2969ivoNon1cQT8/xY1tnfbFerCcd9PJ/oPad5Wf06iez5zcy/U8=
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
Subject: [PATCH v3 1/6] arm/mpu: Introduce MPU memory region map structure
Date: Wed, 11 Jun 2025 15:35:39 +0100
Message-ID: <20250611143544.3453532-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SA5PPFD911547FB:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cef43b-3abd-4458-10ae-08dda8f54d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V7vpSqlwlfGogWefS4DAz5vh5mIyBd4BEeC16iZ4xTbTYo9zuQJCY8L6RTOO?=
 =?us-ascii?Q?lJJ6wfqN2OrL2eDKcAXjiKlN8whRzSMpx7LGLm3leQsR3Jt6UBTHeMFoKkpG?=
 =?us-ascii?Q?ibUXQpFuNbzpg4miwTGs0xv7TueWxYbe6I2br5ifbZQUuMNeSUv3Ytmi2M+t?=
 =?us-ascii?Q?qyxJ3pF2QGC/UaVdb5OQj2hvJfg1SJfo+fm+QD92QxrRrX3sVZjxJZiNqP0x?=
 =?us-ascii?Q?882ywIXALsDh1fMksmhM1FRX2cSWPZnj7MwQz4tfSqbCAgOxjNKkvRKfMshQ?=
 =?us-ascii?Q?tVhlf20BN1V4XAhUhV7/NI4wNoMtG/RqLB1K0HumstR17/kVleITLyP7VY8O?=
 =?us-ascii?Q?y+OaYQRaxYoIUj1IrlUDvEFpNVHOvAVd9mdb7D+YqZg0+wbPaFi+SjBOElW+?=
 =?us-ascii?Q?e4voGxQ/9gNMpC8DI5r53kJi5zsUFBF1lZxljNOKHPEN854u+2dztAvns3v/?=
 =?us-ascii?Q?xjAmo0WSEwvi8m3i6/5d7X2BuQ9YPYY7KLjWVPJLrgJSz3wBXgZobUCkCYyP?=
 =?us-ascii?Q?wQ/xu3WmPCTvRgoBZBgQeV/Jk67DV9X22JNndwBrhNFyox7ePU+eLYdi8xCY?=
 =?us-ascii?Q?hiQSIpC+JqKTN6xR9sf5Y0QTjUHE829VV6Vr0bPSsHIWGjKhLvuN0IGMiIR8?=
 =?us-ascii?Q?n3oh1JdWeLV7kw8ePkxMl4xjXIuxZ1zMatpZrM4igcpx1VMV80pyySCXhqa8?=
 =?us-ascii?Q?5PJlKKgLPxGXm/LhuhaAABTXvpRYzEQcyf3uQQNRVyvtOEFIpPvCfU71u3/w?=
 =?us-ascii?Q?QmMzDWNe6GgTOubO345TXkCXra2HaqoH1Gk1xB4NjXm/jPQk85e91Za2Pmes?=
 =?us-ascii?Q?SC9luRKiXm2Y/a/WIZj2BQA/2QBJDmkYjrq64869g0lrB9fiD4nZjXeSvYca?=
 =?us-ascii?Q?vQ4wj+SiexS3CxTX2c7xOApYTMTfuPVBeMGBSZCVRXBeV2trCsW5OsS5Pout?=
 =?us-ascii?Q?IwYAF6MXH7k2gDcH6jDjIeawCM+3z/2wL7gU+gLaB0kt9kpgYpheGR5cF1z1?=
 =?us-ascii?Q?B9n/SjuU/y4hvGi9DZTiVPkgrXvsuSuRdEphsKaYqmjpuQrLHRGWXuwLQ+Is?=
 =?us-ascii?Q?HIcczlwg5c9f5mcUVscPmse+nUwfecSsqMCy0ESNK2r3K5l+wGU9X3++sshG?=
 =?us-ascii?Q?/Ly37S86Szw+FNAHMv7mK51wHaxYSmoiUJx3D4L0sk2x3lPfZNQxtH1LNo83?=
 =?us-ascii?Q?g4Q7IjJc9u6eY1A8eUOAnEEteAVV7e/d+/8sBI75PkJJiaAgsUVfNa7jzY5+?=
 =?us-ascii?Q?ik5RELilTcMnfqTpAI1j1sBdeuTzVXKIsaF5Ez9YzqNrxU8v1wR8uuN7vezG?=
 =?us-ascii?Q?GV5S5OKYfeMWTvZtZJlMGotokTdUzIjrdtJPjoEVb4wk7dCpj/fBrwM854Kv?=
 =?us-ascii?Q?gBaUjdZrPG2jz29rJXUUgBRICbsDMjB85o+Vl04luAGZiUjbttVWTvzDYR4d?=
 =?us-ascii?Q?CKn2EjBh6979qPi8tv/g13rUqXuFWRRUcSC4o989whgvjJpw1RQfOKiWdeuT?=
 =?us-ascii?Q?htqddCKZDK0UxPhSvZGKYN2K+MOc4APjN/g/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:36:07.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cef43b-3abd-4458-10ae-08dda8f54d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD911547FB

Introduce pr_t typedef which is a structure having the prbar and prlar members,
each being structured as the registers of the AArch32 Armv8-R architecture.

Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
BASE or LIMIT bitfields in prbar or prlar respectively.

In pr_of_addr(), enclose prbar and prlar arm64 specific bitfields with
appropriate macros. So, that this function can be later reused for arm32 as
well.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. Preserve pr_t typedef in arch specific files.

2. Fix typo.

v2 :-

1. Change CONFIG_ARM64 to CONFIG_ARM_64 to enclose arm64 specific bitfields for
prbar and prlar registers in pr_of_addr().

 xen/arch/arm/include/asm/arm32/mpu.h | 34 ++++++++++++++++++++++++++--
 xen/arch/arm/mpu/mm.c                |  4 ++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index f0d4d4055c..0a6930b3a0 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -5,10 +5,40 @@
 
 #ifndef __ASSEMBLY__
 
+/*
+ * Unlike arm64, there are no reserved 0 bits beyond base and limit bitfield in
+ * prbar and prlar registers respectively.
+ */
+#define MPU_REGION_RES0       0x0
+
+/* Hypervisor Protection Region Base Address Register */
+typedef union {
+    struct {
+        unsigned int xn:1;       /* Execute-Never */
+        unsigned int ap_0:1;     /* Access Permission AP[0] */
+        unsigned int ro:1;       /* Access Permission AP[1] */
+        unsigned int sh:2;       /* Shareability */
+        unsigned int res0:1;
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
+        unsigned int res0:2;
+        unsigned int limit:26; /* Limit Address */
+    } reg;
+    uint32_t bits;
+} prlar_t;
+
 /* MPU Protection Region */
 typedef struct {
-    uint32_t prbar;
-    uint32_t prlar;
+    prbar_t prbar;
+    prlar_t prlar;
 } pr_t;
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 86fbe105af..3d37beab57 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -167,7 +167,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     /* Build up value for PRBAR_EL2. */
     prbar = (prbar_t) {
         .reg = {
+#ifdef CONFIG_ARM_64
             .xn_0 = 0,
+#endif
             .xn = PAGE_XN_MASK(flags),
             .ap_0 = 0,
             .ro = PAGE_RO_MASK(flags)
@@ -206,7 +208,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     /* Build up value for PRLAR_EL2. */
     prlar = (prlar_t) {
         .reg = {
+#ifdef CONFIG_ARM_64
             .ns = 0,        /* Hyp mode is in secure world */
+#endif
             .ai = attr_idx,
             .en = 1,        /* Region enabled */
         }};
-- 
2.25.1


