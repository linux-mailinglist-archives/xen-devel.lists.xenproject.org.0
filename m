Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CFAD0701
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 18:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008671.1387905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFp-0005H4-Ng; Fri, 06 Jun 2025 16:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008671.1387905; Fri, 06 Jun 2025 16:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNaFp-0005E1-KN; Fri, 06 Jun 2025 16:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1008671;
 Fri, 06 Jun 2025 16:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=La23=YV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNaFo-00050H-RO
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 16:49:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2417::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e9aa7b4-42f6-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 18:49:16 +0200 (CEST)
Received: from CH0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:610:77::31)
 by DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 16:49:11 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::4c) by CH0PR04CA0056.outlook.office365.com
 (2603:10b6:610:77::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 6 Jun 2025 16:49:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 16:49:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 11:49:10 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 6 Jun 2025 11:49:09 -0500
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
X-Inumbo-ID: 2e9aa7b4-42f6-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VglBKkGaI9rDsaZDcVZL2kGtzvOIFRQgquXkHA7ZUm9PI0FdVNL9qmEodRnGnsTXdN1CsRZHzDISTLWWrXEIwG9pmAYRy/Wdepf1baDgpStfyGsmlOWFXvtv4MG8OwYB9xzSklLPVuoTCOkuTdK0/w9oR73yzIJ+5eXi9s1LvDJfwelA4UQcv+geab+sZKgKOBNjt8jWgxKh2rkxP2E9eZ7yGZ3nzVLvKg4lly7EXFY77ff+AwSL/v2zKiRpj8eLkNk6rAm4q6DAg0YJeOVuAUnV2HY+fKyci2L8pD2WL1n95eg2GbRn3birSqMC1kN33MYMb4UxDG6ZAsS9pQB++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vqF429rt6MRA2T2jT5QlPFZoAnquuWxtF2jQiOBgAU=;
 b=OHS4+VHMQXpPdfi73ceQ0x2YmW/EPgF7QlyY/hvw5Y4a47PtzN/JG5gVBUlX5ebuRtteQJuR8w1xlp1UC1kkGq0HibhRvleTk31G5PYJwjqacT5YKieUW5CE/zDkp4t2HilM7xRXY+IqrjvissIJpjHs6YkaXUVwr57YpMZrfw/DFlJYl3ukzxL0Tik0Rvr3z21O9504xgtIymJRWxE8kMm3U5yPw7hEFMJ9FEQoKY15pSI8S0I9jhBl0eLezXiNDoXoEgl9IDtXwUctXP294Q/OyKkgLWslm9pwjhniytp75XUNXmDnJIsZ44dogSrIB+aQ8vfJx70hy1ysk0bxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vqF429rt6MRA2T2jT5QlPFZoAnquuWxtF2jQiOBgAU=;
 b=IgX5ZmmX7JV/qz7vpcY4mKozwNFBt9sa2sqU5nUX4y4tmDCjowOWNZdla4CzQ3snuDDLMlp1mLSv0sSabxFpk8/GPEDEmCnuBp/YjIDvFgH4OKqW007hC/rgpEz/vce2fmEcW1lm1WlmpSXglp9t5IZxqGAhOI11zJC4dZp8UEE=
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
Subject: [PATCH v2 1/3] arm/mpu: Introduce MPU memory region map structure
Date: Fri, 6 Jun 2025 17:48:52 +0100
Message-ID: <20250606164854.1551148-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 269d8a5c-974d-4ca6-b7af-08dda51a100c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZHiYc5GdmEdplGeHlnWSXRVQotcbjhivhF6s363c6PsASqrOJA3frsdNjmUY?=
 =?us-ascii?Q?Htv3qhCECOHuSHph58l4N73exK9yOanwEO0r2V7zK0AOqWwCklvvjilwIpm7?=
 =?us-ascii?Q?9JADs0uvMLpURWe75XJVKz2ZzlRvF4tdlMmJnVH6rtQ9In9YyhkZgzUliLva?=
 =?us-ascii?Q?fNIgK0/gThwSTsYK99+6t0KMjRC95QmQ81qjOE4+25fxvvcjgM/uoAIu8dmu?=
 =?us-ascii?Q?1LcTrWZwLULAj8OGC9YudeXrZgewZNYhWuNdHtFevd+jRP9rJPGU8KxO9JUf?=
 =?us-ascii?Q?mkIsGEkDwxpmU6ogsLidm36SzrgleQxmFRTX3F4qXUBio1+yEHJw6bWV5q+0?=
 =?us-ascii?Q?vVr2lStZo0GW9EPQxzFzClQUco95dP01uO/O5SdM6oVIjYLMFGBX6F9jmHtv?=
 =?us-ascii?Q?XmIeFXdRd6Hbkjx8VVIBTFMVPJyT7uvKOKi2sa9WgH0P+UuX4VG2ri7afr9C?=
 =?us-ascii?Q?LZ4TvqUzqJjCyfwrJd6C86phMpjt4T++NNsEWYfcHi9r74XVI/Yk2ctxBkLn?=
 =?us-ascii?Q?gNyCLNHhGOE72kOHHqWXxfgi/ToG9DiMwM0KqvV9AALMWnXRewNqcloU2zgl?=
 =?us-ascii?Q?+hMs3py0D/cqQunSQt39GD2yR7WxgGGh7zzsLQbUgVrFW1nUWPy4mcmpXaFK?=
 =?us-ascii?Q?/BXIDC/fHeaok4PyyJwxHheeRQCzjPh83deQBNihzdSkm2jag5IeIaNBo67X?=
 =?us-ascii?Q?Ps/DnEKnEnUM4bkQHJcIKt8aBM4R8fZR4APEoSEETTutfsK2S1W/I9K//fr9?=
 =?us-ascii?Q?NDg6vmz5pOQ/fIp+uNPZ6pi3DrnmqCoZ4PnuvskQNIb3kzbNjsXgz1I+v6mR?=
 =?us-ascii?Q?7cb8UKHVv2eBH/86nU2l0XS2OUzwSwPe6p10m1hui5SaLkTKpfXSogrcyIeC?=
 =?us-ascii?Q?/pyhpDfd4ryGBuX1mAAm5PVrIaEdkHEOyYY5be6sdpm+YdaTCudyMTivuQFZ?=
 =?us-ascii?Q?HNszhGhDiY3q5dSuXAUTVNq0ZjTxXus56bGP0ErMgOcXXJ93Oo4WJa82vqe8?=
 =?us-ascii?Q?mCMGdQP7FF/D1qos8V2s8JpiXUw6HXcLXhhXz6VW699xp+qjtSVR3vdVTWYg?=
 =?us-ascii?Q?9Rru2Z5ISIgUOEd4bORNNMJQLC90IX+BrrAjzF3nQIgabOVY9LPDH3x+ipsy?=
 =?us-ascii?Q?S0ZbwXt0IcVgsCaSC3piUP3KP+GEioy9KQwnljPowii06hGKI8Tdw3ItCAMo?=
 =?us-ascii?Q?amiwVtmo598o2jFOWHNJAEloe3S0ARIW3oOxyX0TUq48v5zQYgMs9j2CElRf?=
 =?us-ascii?Q?zbX/orkmS7mS7uLZdof1mqsDPLcsN2yIX/fv4/cAs5BLBRIZiKo0ytP+IFqz?=
 =?us-ascii?Q?AgEQBITe5LEbZvp7rgkqMammi63rh4385byH3pgIMcSj9NP41V5zbVm0e8+d?=
 =?us-ascii?Q?icNmyxNoIvlG247pAWvXjroVdH7bek9PTvxxExXB7J4e0f/lSRJ4Ehq0mEfZ?=
 =?us-ascii?Q?EohvBYkSs8iirMEWT6E6Agtxqw5lI7N5rQTVKxWT3nA7XJd0LacufNdxAEM+?=
 =?us-ascii?Q?X2G2DevyxBGNK8jdYIziH4ADTJG6Y++TT31/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 16:49:11.2942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269d8a5c-974d-4ca6-b7af-08dda51a100c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

Introduce pr_t typedef which is a structure having the prbar and prlar members,
each being structured as the registers of the AArch32 Armv8-R architecture.

Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
BASE or LIMIT bitfields in prbar or prlar respectively.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. Preserve pr_t typedef in arch specific files.

2. Fix typo.

 xen/arch/arm/include/asm/arm32/mpu.h | 34 ++++++++++++++++++++++++++--
 xen/arch/arm/mpu/mm.c                |  2 ++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index f0d4d4055c..fe139a2abe 100644
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
+        unsigned long ro:1;      /* Access Permission AP[1] */
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
index 86fbe105af..2fb6b822c6 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -167,7 +167,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     /* Build up value for PRBAR_EL2. */
     prbar = (prbar_t) {
         .reg = {
+#ifdef CONFIG_ARM64
             .xn_0 = 0,
+#endif
             .xn = PAGE_XN_MASK(flags),
             .ap_0 = 0,
             .ro = PAGE_RO_MASK(flags)
-- 
2.25.1


