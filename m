Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF665B25E9A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081021.1441169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCD-0004of-GO; Thu, 14 Aug 2025 08:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081021.1441169; Thu, 14 Aug 2025 08:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCD-0004l9-CN; Thu, 14 Aug 2025 08:20:25 +0000
Received: by outflank-mailman (input) for mailman id 1081021;
 Thu, 14 Aug 2025 08:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1umTCB-0004Iz-EE
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:20:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8574f6c8-78e7-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:20:22 +0200 (CEST)
Received: from BN9P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::6)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Thu, 14 Aug
 2025 08:20:17 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::89) by BN9P222CA0001.outlook.office365.com
 (2603:10b6:408:10c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 08:20:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 08:20:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:20:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 14 Aug
 2025 01:20:13 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 14 Aug 2025 03:20:13 -0500
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
X-Inumbo-ID: 8574f6c8-78e7-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6fgT4WIDuE9uBDj+D5h+PRQJrCTiIbUmBuiSThhgKl7Giy1CA3pzanbU3VN3DEhdfIZNK+kuiWoti+ModrHw22X7BDbUxVDTUevFsFsGDHmdfEjwSEnjIWfj++bGz9zNAjxCgJg7ClR9Lq9/z8tybjNMGJEtaZeQNIXOuWTWSUtkAgFsvq08SeRhZ6QUm3j6sdZbeM9YabCBWfH+6MId2MHc5lP02FVKSGEGdIY0+S4nymmxKRvrK00fgJ428M7W0xsPvPnVdWjOvOAz9E+A1UjjwgpFkkdqGneyAjq3BBlCRlxjHvpvyjqy/ep53EFkukMjTNjFgGgNpzy1V+4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q6DBjblq4BFQXE8TX3uPDCYaMrDTqhgyOmJlXApn+M=;
 b=h6uD9s8J6LjNvKpRMDcuRsz9hVKX9wkWzqIdLYs+8JIKof+ye5ecojqz/vCjqrdCJAQSTdOJTNGU9ywfEayvmChNEnaX3LvsE0m6C8ESGiQbTfrb+l5KcLz78cmrjqPfoJSqLJiL0Nhbh5NSu5tDW2mdGdBoQjJ7oVuR5Ivp9BfHKnX1OF4cilQZ88zkr27uSA2UtlGwP8ONbKstkTYRpUxU02keDcnTdSSxd3G5Ggji79M4n59tynCXgvGr4PlqMCcpBms0RykOtq4Q8+0wUOFcGtx+SUk3gttPi3vfR9C5Cn5Gl7NFBSX9FmROhe5kvxxJQbxzvTFgkN2UiXF78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q6DBjblq4BFQXE8TX3uPDCYaMrDTqhgyOmJlXApn+M=;
 b=Tlg037N3t3McxYfuKjF+tO6horIt5KDPKlxjghOcY1YwaSVOqUbvlBkFRehKIGzE3TaXVSGritwE8Ki/aYL8z5p2qsa6kNKsAzxnVirpFKeN5JGzGHs3nU1k4lM+5StNRsOnhCUoxo4POSst0L48aOFBvdNiawk3c+Q39zYK47k=
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
Subject: [PATCH v2 2/2] arm/mpu: Disable map_domain_page for MPU
Date: Thu, 14 Aug 2025 09:19:59 +0100
Message-ID: <20250814081959.3504145-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c86cbc-4b5e-465f-f3c3-08dddb0b668c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NcxKh3MwzKG8Uk50SoHxwgBIq/cy39rVWOW2132O3anOO0xFzlKMzMoEQtKu?=
 =?us-ascii?Q?fPbhgGIBEoCf1B2xoLTSR0P83cBiAWdscTtmKvDGTz012M+g/ZVi8K9U3kCm?=
 =?us-ascii?Q?DkzOI8d8Je8zLewtTvUtg8GoQ7XzG3e1caMX5yF0x2mhgGbzsdt246FIZa+F?=
 =?us-ascii?Q?LNVClmiIqe9fEbcI2pFazlFrYeUh+psOeyOTBByxyooWve7V8Mt+/qkLNU6I?=
 =?us-ascii?Q?ZmPzV7HSdenMd2zq84C8zcMVd7VRc+13nbh4MUwwP4ODWlW7aMkLymoEdKHE?=
 =?us-ascii?Q?AC/JvUdjkE6Oe06gAEdr9BVQFm9pLS5PtyeTBO7MDnlXY8QUZpBwh0W3ZjVX?=
 =?us-ascii?Q?E7du7rte5/O3tXbGGDqeddG7yrDGRv5anMepQE1quhRocCQhTUH4V700QmyV?=
 =?us-ascii?Q?Rjl7im98Evhsa1F6R7vUiPtgYj43Vh3kPA8XgZ+H2RRt8eFasFqu2KF/LwDG?=
 =?us-ascii?Q?f/VHUspogtpcHt3XcsW46a/G7jcYlwu9xYGqlNOGcqapCwjIwOyc+cK+EHgd?=
 =?us-ascii?Q?f0pIgEG2ruLR4gDImuz3ZhWaDdOzhsCqxuO4y+CIIqxOuUuLJVgiA2qmuMiW?=
 =?us-ascii?Q?LU5T3M8skP6N+8lugo7C/Z3KkNa/q5d9drH8jS8JSilYTQGq/aswvw7HtiDz?=
 =?us-ascii?Q?eXdUh7uOiJ8Tpfzuxo7aUnT9w4bEMTzYKVe/JwA0ftPSs9xmmFCELY+6q+wz?=
 =?us-ascii?Q?qk2Lm42jwdZHlbX2yp65QBlFqgL3PmXSsqn5c46VmGqRMdg/EOsUYbax4sce?=
 =?us-ascii?Q?fYaoAGpxUfyfj/0FbvqawTt2wdFevIYHBFaZNeXploQtzk9U4/PDEWMe22Oy?=
 =?us-ascii?Q?7OiL1994nC/64blCf9xL7fLO/JN2QQ4ccye10OA1cFEZWsrrdgiq4Vz65hAN?=
 =?us-ascii?Q?saW5K+MpEpYr4lNd4A3fdjpcwys3MDOR2bU+/Ef5qwpLpqjQp/VJ7w8vQe5q?=
 =?us-ascii?Q?bMIqYU+z2LZwCyzCdae1QxO9hzrXnTVfRVB02a+Qe0xyhqcAspmalJnoK6i0?=
 =?us-ascii?Q?O/bRdvdNpEW8KSYf1StbNLrZ/biDKqgheo+JgyN15CPyGQRsWuQVWO3x2/vS?=
 =?us-ascii?Q?bEKIwLGGI8qvO5JSXc6FHfLd1HNfd+n1TYQgTQEXwosO2JWW0Qw4+GkNUW3f?=
 =?us-ascii?Q?FX38xZhxHY91KPQo4jTR1vFgei5qx9bu6JaG8CEAWfzoNBKBDlV/Fu9VoUsb?=
 =?us-ascii?Q?J28/nFElySQnToK8lrG5ss6dU1JuNssepavBSF0wIooj4h9vRXTEqdC9gTyk?=
 =?us-ascii?Q?iAOj5EQhfLkzy3F4sncfyN4APLlBNrN5rvXbF2Y7eNcn1Xaa4Ac7hALK7uCG?=
 =?us-ascii?Q?dtTerXLySoLSS1ImtHZPGHsLSOgYwRpSQx0VmN5gcUGYURSsbG/dE9GLeZNI?=
 =?us-ascii?Q?NaOXnGUfdxEEj9+WcnL3J/U6kRhezy8Lk3OUdoN8GjViTx3CWQOjmMeS7zSf?=
 =?us-ascii?Q?5zMg8Dp3rv+nZee7ScqDTRwNy6t6SmD7wzdh0kmB1hSzIymIQexMdZ1BEsdd?=
 =?us-ascii?Q?cQ7bETQkCf7t9V3rodLwoX1m4mmyGMs0OiEp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:20:16.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c86cbc-4b5e-465f-f3c3-08dddb0b668c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809

There is no domheap for ARM_32. All of the RAM is mapped and VA == PA.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. No changes.

 xen/arch/arm/Kconfig           |  2 +-
 xen/arch/arm/mpu/Makefile      |  1 -
 xen/arch/arm/mpu/domain-page.c | 45 ----------------------------------
 3 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 xen/arch/arm/mpu/domain-page.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a0c8160474..5355534f3d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,7 +1,7 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
-	select ARCH_MAP_DOMAIN_PAGE
+	select ARCH_MAP_DOMAIN_PAGE if MMU
 
 config ARM_64
 	def_bool y
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 50f8fe4326..4963c8b550 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_32) += domain-page.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/domain-page.c
deleted file mode 100644
index df5e06b6db..0000000000
--- a/xen/arch/arm/mpu/domain-page.c
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#include <xen/bug.h>
-#include <xen/domain_page.h>
-#include <xen/mm-frame.h>
-#include <xen/types.h>
-
-void *map_domain_page_global(mfn_t mfn)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
-
-/* Map a page of domheap memory */
-void *map_domain_page(mfn_t mfn)
-{
-    BUG_ON("unimplemented");
-    return NULL;
-}
-
-/* Release a mapping taken with map_domain_page() */
-void unmap_domain_page(const void *ptr)
-{
-    BUG_ON("unimplemented");
-}
-
-mfn_t domain_page_map_to_mfn(const void *ptr)
-{
-    BUG_ON("unimplemented");
-    return INVALID_MFN;
-}
-
-void unmap_domain_page_global(const void *va)
-{
-    BUG_ON("unimplemented");
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.25.1


