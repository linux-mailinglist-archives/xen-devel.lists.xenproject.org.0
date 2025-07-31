Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E1B16D27
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064964.1430303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIK-0004YA-Jb; Thu, 31 Jul 2025 08:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064964.1430303; Thu, 31 Jul 2025 08:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIK-0004W2-Fr; Thu, 31 Jul 2025 08:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1064964;
 Thu, 31 Jul 2025 08:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAjF=2M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uhOIJ-0004IO-9j
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:05:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2781d94f-6de5-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:05:42 +0200 (CEST)
Received: from MW4PR02CA0016.namprd02.prod.outlook.com (2603:10b6:303:16d::22)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 08:05:38 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::3f) by MW4PR02CA0016.outlook.office365.com
 (2603:10b6:303:16d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Thu,
 31 Jul 2025 08:05:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 08:05:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 03:05:36 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 31 Jul 2025 03:05:35 -0500
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
X-Inumbo-ID: 2781d94f-6de5-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8pDPmyNhAIP/kKeGKv25Q5UTzKKagA9d0NtjomPKswDqHouZc2ReO4i62lzy9XpKomP45M0+n2kvACikDfo2fMjP6KEOq6ijfKVZVlz14fTRuunh9AT0FxS2IZF/1G2IoMwOrOwC4pawjDypqwGa9VRUcBLmWyZIPbbMgBJyZQ/AyCcPuh/wAPnGV4GbZlL7Q5lU1q9SsXfHL2IO5bfdWC87PrbMK/ZGfdC89zNOSA47Axrm/oG1QOfuDhIWve79nDINYjyvtlw2e0z8Mam/1C5nUk+f8v1HG88O2D5gMEzmUEjnwEaPvwYs7yaw5XnlmzRtuF2ANRJh1edTPlrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j5eiGkUE9g6Ioj2F2uIjLrx9oE8JCZn+k+OU4mETck=;
 b=i62BgzcL3w93bcLdIZWGIHONTvYX9Ph7O7EERN0DOAY8kmOiLdov4qFHuwziLhMXZV8hgekl61VilkfjMDms3E1ZkYZajL8OmU6nptkCFdFb/RNGDN0I4hHCcQvnsiGMShzZWjOX+QkGdWHCwnKO75XoIR0wZfnA3/7B2CaTxRiRjDR7d4FqpTMKBvKLTu2aRSg5mzneHytSEzbM9mAdLrVQ3RZYiCgsQ8GWJm+jr6jTE7m1lE0r3iTy8crhMeZrGFPNwe1PjWdEua2letdP2KKLUWi64dbwMDGhMn7K/pU6rFZVHeN0TIIWMigHX0+5T4WgVTjKurlwk1qrL9+L0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j5eiGkUE9g6Ioj2F2uIjLrx9oE8JCZn+k+OU4mETck=;
 b=PyNexyGXBPuA2JOP62PyxJRf8WiHVxtrRMttm9HrC7oCeJUbhn+IuO3/0GPLY8UOppa8D1ERv79ua4IQeZB65tnIhUkb3BCM92EfOBwVqGGQe9pW9ySxhTcUFeCCKBQ20naK3uLZhrv3CaXEPDEQKCsaPyyNw0i7nQsTZOyMiTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: Fix HAS_PASSTHROUGH selection
Date: Thu, 31 Jul 2025 10:05:21 +0200
Message-ID: <20250731080522.810468-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731080522.810468-1-michal.orzel@amd.com>
References: <20250731080522.810468-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f786108-83f2-4d9a-1ee1-08ddd00908a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0G8k1U74fdSryZsXCF28kfRclsGfCxqsGuWqmH7MpkEEPb7HGqUjcgXQg4TW?=
 =?us-ascii?Q?9jiI8Q8LODV5LaEiJmw75uAqqKrpACDULDykZC+9W8lf9kkjb/bEOVsMJJS8?=
 =?us-ascii?Q?GXFXt1WlDOQ0iTPiy9TpglH9D5wprfFWxc35adG/rqOA8+zc7fOJWKJbxIHd?=
 =?us-ascii?Q?OeIkBI+qHkqg+6GBOLI1XZH7+RIIou/UioHrVenqzA+wXPUJxXy9ByGGILBO?=
 =?us-ascii?Q?qbrwy9WcbXRAuZEOJnRA/Pr4W64y9awuOQ/nId5NOmnu1zuJ/w/OuYE5ZfP1?=
 =?us-ascii?Q?1519nMBUMs5ylXvzS45zeDc6Dc5dLWql7XL2QTEUAJJDgQ8c4qnfAMoVtrx8?=
 =?us-ascii?Q?9Nt/clDIfG4WiX9GdfXYR5XMRqUFvCCNBDRXKKHjVuIA+vB5VWEq+VhcDmxo?=
 =?us-ascii?Q?WVWIWmlButC6ChlGXH1OZ8LPDOnnVLR6lm8t+rU1GtIPLDHFHzrtpQ/pg/00?=
 =?us-ascii?Q?JJZ3fZCk2X9wphgYmQ9f84DvV6kKyLAVH7m2o+8HANJhTa6mzXwv3Lx7W2qx?=
 =?us-ascii?Q?E6QCgbrjLmoy5YPrJuOzq6mpWdJwqmgvnA8fHYV4gObBjKoVUnzkK5zssy/G?=
 =?us-ascii?Q?zzEWW/ELrF8kfZTrxyRHjFW5iTtTn7RFbks8PSPMLCAYfTythkwT1eN2ygpT?=
 =?us-ascii?Q?wIpYV9deDVrNsE7I7xieIgVv5IINEi0uQSJ7y+1g0W9pYbJhEMcAcXphh2AR?=
 =?us-ascii?Q?DkeaZXtKaqo9J99xtY29ce5kiijY1CbvdAgtS7rOIEU/vYlLv8ctEiCT7GcI?=
 =?us-ascii?Q?PJdaQZutHGgmFCO7CBRf3c63AjsXcfbDvu9DJ9ZBcDx2O1l8TAh9cdRAKGC9?=
 =?us-ascii?Q?fEWa21U4oDCkt88AYszkboQYOuKgUPXeD0pltcqAi55AFT6oAmttGU7Qgkv4?=
 =?us-ascii?Q?ry098MLYs6olUsuANdIC983qdXg8/Y8I86/VDPPt9vjHAV6NvgR5NRWdleqa?=
 =?us-ascii?Q?kZS4H6JiiJnbhl+he2X11gQcAm+oxafxndfJodnFPNOc+D6vvD7cf0QvuzXL?=
 =?us-ascii?Q?sLl4IiB1IYdMoekFojg3kL2xS7HUl0hAX6+Ew6LI6avdywPu5Sxz3kb3wBNW?=
 =?us-ascii?Q?ZY/Z5PCUAJxALQe1GoR4VjlGxw54mFMsH3OgxFv9/5AcagoaON4WI4PSYZCc?=
 =?us-ascii?Q?dSufEdWeRgmCzCJaV/K7n2Oy4aAdTIwM33VyR+kRs6KGeak88GBJkjzB6PTo?=
 =?us-ascii?Q?svQRV7CrQ2Ru0LjztUEPE5i+LXpZJwwNhi2rdq1b8dmQzzfYAAB2zYBFsFph?=
 =?us-ascii?Q?X7Y4w4DUUyClGsKFm/AkBfYCAlQfkd+iiKC1II83lCYlQ0LD7Sx6loANMzJN?=
 =?us-ascii?Q?d17Q0vmFUe9nbe3T15eNiZgsQCNYhlH/C8h03iuVI9I4rTHu/XQIAbYuFLIf?=
 =?us-ascii?Q?JxHOfUdkDAAfBxub6sAzAZtLzbjji6RP/ijdrcRiqpOBLEHwJ/4HqEq3m3+4?=
 =?us-ascii?Q?rDgcGNyyc2TTs65UBotbJQK3tCvc7niK3IKib6CVFoxljhOqtkpkle8asfEf?=
 =?us-ascii?Q?BeZ2jhPmFhZnJGuEL5Aw0fWcndT+kfnUR1dA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 08:05:37.3452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f786108-83f2-4d9a-1ee1-08ddd00908a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

HAS_PASSTHROUGH should only be selected on MMU systems. It's been like
that until commit 163c6b589879 added possibility to select HAS_PASSTHROUGH
if PCI_PASSTHROUGH is enabled on Arm64. This is incorrect as it may result
in enabling passthrough/ build on MPU systems. PCI_PASSTHROUGH should
depend on HAS_PASSTHROUGH instead.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 17df147b2555..a0c816047427 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,7 +9,6 @@ config ARM_64
 	select 64BIT
 	select HAS_FAST_MULTIPLY
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
-	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
 
 config ARM
 	def_bool y
@@ -263,7 +262,7 @@ source "arch/arm/firmware/Kconfig"
 
 config PCI_PASSTHROUGH
 	bool "PCI passthrough" if EXPERT
-	depends on ARM_64
+	depends on ARM_64 && HAS_PASSTHROUGH
 	help
 	  This option enables PCI device passthrough
 
-- 
2.43.0


