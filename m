Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2D959BB7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781071.1190638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOw-0004iu-3a; Wed, 21 Aug 2024 12:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781071.1190638; Wed, 21 Aug 2024 12:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkOv-0004g8-W9; Wed, 21 Aug 2024 12:25:21 +0000
Received: by outflank-mailman (input) for mailman id 781071;
 Wed, 21 Aug 2024 12:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rYNs=PU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgkOu-0004Qc-1a
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:25:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2409::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d47ffbb-5fb8-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 14:25:19 +0200 (CEST)
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 12:25:15 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::b1) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Wed, 21 Aug 2024 12:25:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 12:25:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 07:25:13 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 21 Aug 2024 07:25:12 -0500
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
X-Inumbo-ID: 6d47ffbb-5fb8-11ef-a508-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqKt6jXiTxIlQ7ixJmJXsYskGvy2oJjfaPWy58Df7QbPSoSivlH6P2mdTAjBlLQfqtR7/1jPK1Yd3i8WRoDK74jnLlxEqfgGzS9kWOEAAS0oVWCR5Xungus/Yt+7id3fvgpYGy5//qctO+LtYyqq+7UlbgZ3Pc7IwF/IiiTzGFYWBg864lFGEGaGqGB4DnumqltJ+tHLIGRjNGoc1ZHXK1sdM1sdI95Po8lf2Ok2k6lsMXe2Iq59WWpR24mrpr8wnCTg/GZ7QlC9zYGsjIJFXw4zgfsaUgNl7iowQ+IgReyzOaQ5oq8Q8RVpjRGggq+ZJdyvetmEfbbVv16nDv4OXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97wKeZFQuE5riInUagI/wzwtAQEo7E7/3Y6sQDssmUU=;
 b=DHSdDrOP3WTiivExCiuK2mwTKop3iiZ7Gn1q/8bdVnCqFR9WEERA7qJww6KO25NuMNdB+ZJ22eqr8FEr+61FgrJUbzOHjGgOTbL5982WqSgwkRWVvv7rqRt2FdO/gdE3Mw5HVkc583zc3vquz+PhevP11w2RDWQhGoPR0ggF8Ll6C0ZLJFqXMXE+TBgl2heT38burrd47JS1LIItE2G3EDfCVnN4hFXxIlvFtK1XDP2BdK3ChXJSTnIkHwxaM3hZLQTpYWH4ZPctG6TO1tEY8BIsNrcfMTftZTebiK+kYc0d70EIZHgv5HfVVAvNfhP4os6IqravLu+nEi0ODRXgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97wKeZFQuE5riInUagI/wzwtAQEo7E7/3Y6sQDssmUU=;
 b=Ur0NMtSDOXXLmKxvwbgGB4086o2/rGOccrLfcExgDBWv3O33iAErtFolQQxXdBaXBVFr3j8ANRdLVh8iOp/wqoiV2jxfVCD3L9wB1URT3brKxh7c9JNZ+i01i2jTBDICsttHxqVj+6K3F32gc6DXeRaVkKDeZ+4OW4QzY2FAbIs=
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
Subject: [PATCH v4 2/4] xen: arm: Move domain_page.c to MMU specific
Date: Wed, 21 Aug 2024 13:25:01 +0100
Message-ID: <20240821122503.2315844-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|CY8PR12MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2afd5f-f905-4756-27bd-08dcc1dc4f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MaknWIarnv1SVICpgsDYTxAm6f9xss1j/aRQLkC7QfS5liSptOVebCIjPR7G?=
 =?us-ascii?Q?UfEiEbBvw7KnC54z9cNNUtRIbaFQ5K7WyYRZuNKOw0yOAOvJklh4HV6Jv1xv?=
 =?us-ascii?Q?PV8BT5Qy1kjb62jsWhZxhteuhAhWFnEsS9nVBCMBCDBvFKitjK4I+BR9TukL?=
 =?us-ascii?Q?9dvxidlIb7QFA1+6/KIalLtf0nVVAyBMj9pTbXnRKxsWbZ+E0bziuLMuqXTO?=
 =?us-ascii?Q?pmmRQvU2ZC5tSkT+kzVejbk7xq2OXDwHq0ytayz48C2G32HGLVWVwCA45sYC?=
 =?us-ascii?Q?MhPVjM7GKsxCwFUeAe0DpmcyThkm8Gt1wXoKVYioh0sy8K2X3i/PmYe97Htv?=
 =?us-ascii?Q?zBKIeYETq5qi32+Hk80FPfi436dMnqrSMbJLmLLlBXFX4WmpNP99SsDomLZB?=
 =?us-ascii?Q?rxRjvOi9joXB3u1zX102ut5Ezjl0dX41TnW+V2U+SmfuEvym6iEb1aOrYwF+?=
 =?us-ascii?Q?YTDCeyZQe2fjj/oB6Gv1GazIu9E76/YqYPA7QRm9qZBtSN7r33fa2sENqnmd?=
 =?us-ascii?Q?NBud7WKxpn0FymDv7tzZmlVf0xjFrZnrF0dSLIlJw7dYTvoPODbChhEHSzrH?=
 =?us-ascii?Q?8ZYrsNDUg+o4snQEsl0etlIB2LmXzMg8eOg6BDFoSzrZtX7FdtcBH6Vh12xq?=
 =?us-ascii?Q?1m8uQxP4TwB0LZmedtfJRtiD+G+nskUHCirEd/u/MQInkkmo/EeWP53wbULf?=
 =?us-ascii?Q?hs9xFqYmO1/PUNfT3Zl1nFpAhv4tvG68zFhcV5E5QcqNf9gh4q95n1d8QuQn?=
 =?us-ascii?Q?tXeW59n2YTwAFqn3aRxcbIwm+CRJvamxWsXqNWufkp2J4QblPpkiy9/i+xLE?=
 =?us-ascii?Q?XTM1CO3/K7A6Kq2x576CawM0lIp9C8oW4/W6UWgzm28+EZRIYyFwIUtPOuJL?=
 =?us-ascii?Q?gUh1dyk1WZyslyqxxeIssKRicdZ739stUXSJi2QbCgv8Rde27eWxP4ZBxZ31?=
 =?us-ascii?Q?n9Rs3WTCJCXLHu/y6z7yxO8eu6XztEMyy8ojmqifACGzB0yHiM1Wi8LTW3UN?=
 =?us-ascii?Q?lxegV5Gpg67bL8a0s5AqLUgfY/tyVsPQMp3nS89bXK/+uGvOIP89dXC4DZjD?=
 =?us-ascii?Q?hui91oojLl/ketl0rqhV9MwJZ/x7zVSajB6FUe4U1NLYDptPALkLjMI4td0d?=
 =?us-ascii?Q?xvE1bfrVm8i9HGPPxhkpKCGKEGQQdkxk667YNTmJKuH2xRdt5tGxLBdyrw14?=
 =?us-ascii?Q?ZP6bEsGwqBeQPn7xIljyxAzZBy0WaahwO7ER88F1XRGDRAheL/nUaPJJQJxZ?=
 =?us-ascii?Q?mKBNyESJsiIGdmnaSuJEbOsFxSk0veTAKpJb8KLRRuAAcl77ui3vqB3z14j2?=
 =?us-ascii?Q?XsJyRGTun2qIZjinIIbptvKch7aIi8JE7YGZdf+6Yx5XrYhVg2qTo1s21Fj2?=
 =?us-ascii?Q?5/0bNk372Un6HnPQd7fSfu6bI6fdhESZqtspyMH2ZD0TAP09vmjxHs6EQzgS?=
 =?us-ascii?Q?2kqKS8Tzd/xkRC2bdImo66FcPBn/eIkE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 12:25:14.2940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2afd5f-f905-4756-27bd-08dcc1dc4f24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265

domain_page.c is moved to mmu/domain_page.c. The reason
being this file implements MMU specific logic for mapping,
unmapping, etc domain page.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from :-

v1 - Moved domain_page.c to mmu/domain_page.c.

v2 - Updated arm/Makefile.

v3 - 1. Used the same commit message as v2.
2. Added R-b.

 xen/arch/arm/Makefile                | 1 -
 xen/arch/arm/mmu/Makefile            | 1 +
 xen/arch/arm/{ => mmu}/domain_page.c | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index da9c979dc4..7792bff597 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -18,7 +18,6 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
index 67475fcd80..2cb44b857d 100644
--- a/xen/arch/arm/mmu/Makefile
+++ b/xen/arch/arm/mmu/Makefile
@@ -2,3 +2,4 @@ obj-y += p2m.o
 obj-y += pt.o
 obj-y += setup.o
 obj-y += smpboot.o
+obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/mmu/domain_page.c
similarity index 100%
rename from xen/arch/arm/domain_page.c
rename to xen/arch/arm/mmu/domain_page.c
-- 
2.25.1


