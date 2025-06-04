Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C73ACE3D6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 19:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005790.1385164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9D-0005uu-GK; Wed, 04 Jun 2025 17:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005790.1385164; Wed, 04 Jun 2025 17:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9D-0005sL-De; Wed, 04 Jun 2025 17:43:31 +0000
Received: by outflank-mailman (input) for mailman id 1005790;
 Wed, 04 Jun 2025 17:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eifV=YT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMs9C-0005sE-OT
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 17:43:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c25ba31-416b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 19:43:29 +0200 (CEST)
Received: from MN0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::6)
 by SA3PR12MB9090.namprd12.prod.outlook.com (2603:10b6:806:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 17:43:25 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::49) by MN0P220CA0014.outlook.office365.com
 (2603:10b6:208:52e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Wed,
 4 Jun 2025 17:43:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 17:43:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:24 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Jun 2025 12:43:23 -0500
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
X-Inumbo-ID: 6c25ba31-416b-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAurE/NfrFDnUoj9yQt7MLEN0l7XDyAqIcjxt6WLVuOmvuQCOAYrbVU53NzC/bEsNpmRDHECBMhS+X0UzxNuUXVLDeM5v2gc5vUbOglE8uyJgF0DT3jS/CuZQeSjmHbp8yw0MGu84Vpkn5l7Fbdo1TzvnY5WoXRcYsI0En1ETj2Gmk/8UIB+N4nlh6iL1kgJswAhbmYJu2QmLa2IuBEse8OleunlhCLWvZfY1CE3+l2TxhVxQZv5y9gDH00Rw998oMQ+zmJeXVqV6OzgNFgJ4hDpKvjgPLmfrofZTd6e1SB+hxJHOCi7LjF5JNIE/krofeih46Vgdmt80VS81IIdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8XJKa5ucdD1VpelyUTvJ+5t2YHb/OgWCnHOLZ/1bxc=;
 b=f2414hx5RDKOSj49qJHOfwj1l2WRegu9KsyV2L2HXwRq81KNaNE8/Gl99jkbPrmb3TGE1SmiW8CXyN/T0GUZ1cQHYqMoz+cqBC6Dmpwt01IXuTusHHqcfaL6Dvh77LQOlzWwslsSq1iWhKuA9/+qvFL4YO0HL+KXeOa6XEZvOGpeRnqxU+DLRH9UOAhG0OjVr2O44dh5WWzqr+eeHD7ehhJlQ0UMKAN+6qij8jAyWHQGA1CO8mCsaXra49cD1AMjvxoINWBhyh3C5dACR8cuPQCpW8xZ2VtVmK/f5QxPq7kUDo6htfXxgO0tfGWE5s20/5zI+acWH++s3jZ2FEfTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8XJKa5ucdD1VpelyUTvJ+5t2YHb/OgWCnHOLZ/1bxc=;
 b=y8NNwkFr+PDpZqzRbVdoTEZW7o85eRUiGn/WeWHEWcQxdOCpDwE63jZV4AlubICAXTTebtJPxkDaOoaxs6kOYAFfttD7yONnuG2jACGUlHuGBM4XNKaGm292IAI8raVyQR3wLGiU1tlP82bKArE4CJBgPs+/HATRlHSUocW5z58=
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
Subject: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Date: Wed, 4 Jun 2025 18:43:09 +0100
Message-ID: <20250604174311.754899-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SA3PR12MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a750a83-388f-4582-ca85-08dda38f4eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NWZyFpugRLQ/eSaJH9AIsvwQ3Eap2W2+4fYU1MW/cRqPMwpaXSRZAwCFWHHu?=
 =?us-ascii?Q?1Aj+4FUfMGNBFGzCfpiSg541XkIXFYD7DwevGvjC98mNRGyiuq3OSLn+TfwD?=
 =?us-ascii?Q?X0xGKgaGHHN0U7DIxUXUlFn2FN4hxMbZjHqetJBLcurjCWnviAPN0vxLDl0G?=
 =?us-ascii?Q?Hjq4/ubInz3MaA9L0TN+MPWngIWglw7ADWyvA7oH/mrXcVt41tajbiAD0nPI?=
 =?us-ascii?Q?gRf+Kjih4ANFdQvLSCYtdPzno8oD432IX7hCeF3wrPMqiSb673In1ZDb237o?=
 =?us-ascii?Q?s3YA3sseNJaRMeuWKavpFywvyGVOPxb5pxo/pg1teDEWp7wtxuvQB0AHfXPO?=
 =?us-ascii?Q?OWrb0d80npxIf9AZPUdjMGVUchqajkJMC7dNR3YFZkOz5YNPMXQthpfIkLu3?=
 =?us-ascii?Q?10Wxta+tIlpI3/3Fu44VUK4CV5p7j9zuHhXJ7/twQ+oobolxUzP2v3RZt24X?=
 =?us-ascii?Q?kCMtKcbC/w3QXaRCL2OJFzHKxGB70Qe75swp1CPHIoc4+hcNb7m+Fp+L6vsC?=
 =?us-ascii?Q?XkeTftEHNxl4xeGvUQ8iAdk+1zdxdfk40GssWU+XWwmUQbcaY2GYmbPURQaA?=
 =?us-ascii?Q?FhIqmTgIxBJeKUtJ28TfMe12ekyl32CxqdPU6cMytPxKLhc2rDa8Tniwduix?=
 =?us-ascii?Q?huZ+oHwPLi0nf7iJCZN5KxU8NNqiTtjHFYRrNmmlS8evhzbOEJ5r5qLNSRDU?=
 =?us-ascii?Q?BFb0s2MTHAaL8hkpOvCHAXwBEeEafg4mSCtm5P8hE5J7hWg2BHk0rwkrRQi6?=
 =?us-ascii?Q?Xw1NDBiXsbawdLa58/vlHRnlgcSwctXbylCYfTplHFj9Tz5p6WowANIr4cp8?=
 =?us-ascii?Q?0ozFDslF7N+kI8UaftV5ldHQerSf1dVmTD7zSOhbftwQfVSF/+x1q6UL6ehX?=
 =?us-ascii?Q?n8FhGMfZEAjNQQx/g2yDf5mGDbNPa5gnvyzZj/Taydpmoik8Er8yP3pYdtWD?=
 =?us-ascii?Q?zJS4ii6wd1BweymlFtKlS38msK521dbaRIqQha87X6+s8xge/yMbXDLQv+XS?=
 =?us-ascii?Q?KV2tMHMitkify2xkCzJfMv6ig892kbrGpPG4DR1eCVd08kqAzAcswQ6Rzosh?=
 =?us-ascii?Q?+zVx54Te35L57pTTbkI8Gwi5Sm1jYDJIvNWxUjBgwdwZ8ejazK48IomljNlf?=
 =?us-ascii?Q?SR3LhuCYXIpgFGaNjpZpCie+ZOkRbfkXxPEhLyGDdsWwN1ZjrcAH7FPLiJ43?=
 =?us-ascii?Q?Ov1mHFy3sl+sAsT33UNlrzJ+7R1o4559fXqvrMqrE2UTaOfw4iV4nzUhyDUn?=
 =?us-ascii?Q?QFgErqb8RurOKDrqK1OC9ZveNBns7afFwNvK62VyPU61nDEgUzQXU6vMZ5W4?=
 =?us-ascii?Q?UCqb8cFmoieKAtldL6noftA0vYhmQjo1YVLj+z2ZMYpekhkiZUHgsIXUdUec?=
 =?us-ascii?Q?f+u84jLQ/jH6PuCpOQXoWn74ZLCEC9WKueuF9XSwQkwoisWxHZeBLjxpY1Z/?=
 =?us-ascii?Q?uavaJgD5MO+JycnWyaDp6ncE6WVC6ufs5BP7W+6wHyDNHQ1qGJ3DpCojiQBx?=
 =?us-ascii?Q?2nrnzDafEumhg+v2Qj/LnL+WvO46BPU46zn2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:43:25.2104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a750a83-388f-4582-ca85-08dda38f4eb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9090

Introduce pr_t typedef which is a structure having the prbar and prlar members,
each being structured as the registers of the AArch32 Armv8-R architecture.

Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
BASE or LIMIT bitfields in prbar or prlar respectively.

Move pr_t definition to common code.
Also, enclose xn_0 within ARM64 as it is not present for ARM32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
 xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
 xen/arch/arm/include/asm/mpu.h       |  6 ++++++
 xen/arch/arm/mpu/mm.c                |  2 ++
 4 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index f0d4d4055c..ae3b661fde 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -5,11 +5,31 @@
 
 #ifndef __ASSEMBLY__
 
-/* MPU Protection Region */
-typedef struct {
-    uint32_t prbar;
-    uint32_t prlar;
-} pr_t;
+#define MPU_REGION_RES0       0x0
+
+/* Hypervisor Protection Region Base Address Register */
+typedef union {
+    struct {
+        unsigned int xn:1;       /* Execute-Never */
+        unsigned int ap_0:1;     /* Acess Permission */
+        unsigned long ro:1;      /* Access Permission AP[1] */
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
+        unsigned int res0:2;   /* Reserved 0 by hardware */
+        unsigned int limit:26; /* Limit Address */
+    } reg;
+    uint32_t bits;
+} prlar_t;
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index f0ce344e78..df46774dcb 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -34,12 +34,6 @@ typedef union {
     uint64_t bits;
 } prlar_t;
 
-/* MPU Protection Region */
-typedef struct {
-    prbar_t prbar;
-    prlar_t prlar;
-} pr_t;
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* ARM_ARM64_MPU_H */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 8f06ddac0f..c8573a5980 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -25,6 +25,12 @@
 
 #ifndef __ASSEMBLY__
 
+/* MPU Protection Region */
+typedef struct {
+    prbar_t prbar;
+    prlar_t prlar;
+} pr_t;
+
 #ifdef CONFIG_ARM_64
 /*
  * Set base address of MPU protection region.
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


