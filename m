Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8BE94BD02
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773966.1184492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xv-0001kH-4X; Thu, 08 Aug 2024 12:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773966.1184492; Thu, 08 Aug 2024 12:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc1xv-0001gq-0C; Thu, 08 Aug 2024 12:09:59 +0000
Received: by outflank-mailman (input) for mailman id 773966;
 Thu, 08 Aug 2024 12:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc1xt-0001Bl-3D
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 12:09:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f0f21f8-557f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 14:09:55 +0200 (CEST)
Received: from BL1PR13CA0282.namprd13.prod.outlook.com (2603:10b6:208:2bc::17)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 8 Aug
 2024 12:09:48 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::1) by BL1PR13CA0282.outlook.office365.com
 (2603:10b6:208:2bc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Thu, 8 Aug 2024 12:09:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 12:09:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Aug
 2024 07:09:47 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 8 Aug 2024 07:09:46 -0500
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
X-Inumbo-ID: 1f0f21f8-557f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZZRdCi4muUTZhwkG2es7OnvTAAHLJND9rynbE7D4ZYBYWQqRZ1hVUpekEkIi3tRQXaYuGEqv9SY2U7ycffzMuf/2VOiSkqn7HOlNLoKkRjuV9dnTwr4SxoDKNDUavr1fAinwp048Y4bdBuarEIm64q2seCzMVTGuqsn6KtGSiShakDNoUthUPFBNrUe1fDCw8Z75J+p1c0LN9SNIAf8ckFdv2tJGclHfk5s9wPDv/qWfht9VRfdmM2Xe+bXIw+vl54cGEjzO207Dq6JWVgREG3pdajMEMh8ZXDc18aXietdzChOsJm0WJ0i581NdTBNbNXWyWLbtov+yjx4/QBkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oonAN7b47urGvxo0xGpm8NNdDhrVQquVh/ZJyCDFHG4=;
 b=xTzpZtqAzool9+1kC7xASqEM0PuY2R3FK/UaV3RmzZV8mk4h9l8mJe/coygDYD3qQ/uVDjJf2SnuMqS3j1KcJ2UeRdaKJmj8Dq2dWT7ek4pPj02ak+gRPsLEoe8OWbvoLxBkadmBZt+N1vnMgbE5++btRKkmUMsr9tNRTycQmqw7guzIbgae2j0coqzQXaWhxJOg6qRFvdV2I8Jfm2VzsdOpBu2i3xjpaLFhQalQ16AiREE5g3BUW60vMaPjRQZpxQPsdTvDUUUfzbgGwFjaqSdkDkd0rx0NxPIMK6jg+8sjF7xP2kl/oe8bGbNcgpT1EWCNs0NuKNS6ByAVcqneeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oonAN7b47urGvxo0xGpm8NNdDhrVQquVh/ZJyCDFHG4=;
 b=SKm0f1uYVz5X373p+QXIw48wt7xY3DwXIlce8npf0goODYqJCavwa78yKo4/Z1GlZSH+mcTuFXVYTOJr4drwrnPP5yNze1bLLeMBmG1gJVXBj7iT5qF2JN8SJUNSSqOe+1AH1eI1gXMlsmfFim0CmXVu2a3x7AbJnI9vqhhpkKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/4] xen: arm: Moved domain_page.c to MMU specific
Date: Thu, 8 Aug 2024 13:09:35 +0100
Message-ID: <20240808120936.3299937-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: c6608c8f-ae3a-4c6e-06ee-08dcb7a2ff9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KXMr/2+dM8ES9zbqQ9Sg8BH2ZuZmJ2XG0cCwQ3zx4Lc2Rhu5PvZz6ivLYRMK?=
 =?us-ascii?Q?x6Z6uu1q2FRBuNTta6bSg45u7vxGrs9l9gzm0c0U3/WeGUnBGH58jr/vEQ0i?=
 =?us-ascii?Q?01QX5DaX6Vq/oLhVd9+TVUoHf0tCPRK6rQzRct27o8Uaboh/HddOjazKItPj?=
 =?us-ascii?Q?HKEmkOPqLcvoGPOfT8LgbmQ7zacSWlk7hS5lbVXGzh6PtHHAyulFUWnpiBYY?=
 =?us-ascii?Q?KOkHFGMsLrRtwbjrUqo0hssq8yiWRQWVDVXzzrdhXG5wpVHQ3r9MxQBJ1Mhz?=
 =?us-ascii?Q?S14wDE2ZeZBk+5EK7zXQjpktWmIxlcniBytgshqoiOU5aIm7MEfLZIQVD31K?=
 =?us-ascii?Q?YkQGAg3hbvqn2v8/21TEvGDBmhuCivHcqBI4S5a/c+XUnVWhiR9YyPj1xPJ9?=
 =?us-ascii?Q?8b7fiMgYNDIT4DCuMzohHWyojqDs53Vfjz6xieRdZgje2mmzzRJLuPuH/GYF?=
 =?us-ascii?Q?5xE1mdDJpsOlvli9DOd2nGIsN049vrlRb4Gx8bdCdHfEQJ8kcfnP6CQX8853?=
 =?us-ascii?Q?nu5Zzs8bU8wwk4vH2gMyeqgkQH2dS5qZ3NGjvoFGRG5xo0kCcGg/L21MxYhS?=
 =?us-ascii?Q?WMWmsnBTVeH9honw8aN1urORIUm+UsBs7lbp6aP5zKJsQ0pBKsBtdWXTENJ5?=
 =?us-ascii?Q?ywpKE5luHRSBFTJ3pDa4uV/NhMtOE0QhywN8b2UyBRn0bHtYZIhJOdZNyt8j?=
 =?us-ascii?Q?CB9X04TNZrTB2ub3T1XC0/WD2tWnqhbpkDl3VRO9EhUowzeFnaK3qiRHJB3I?=
 =?us-ascii?Q?yPn/HXjGOm7TgR6CB2qtQXKHxd+SbsyjKB2EJTShZReRyZNdu8TaxCGWe6AM?=
 =?us-ascii?Q?Xu//y35WYBPc4l7v0qn1zYvQG/6Y9lMgcy36h2I98sNd697gf+yZDg6zXHtr?=
 =?us-ascii?Q?hWLrZKwX9XTbqRDxU4WRhAJDVgom/0IWPLkTK06JKPLu5SgCXS0tClwG+xq5?=
 =?us-ascii?Q?jDqg04YEw8p+JacvhHaXvEJdwP9b2tvL66ZkUEDY3ExEzwD4XfKgSHATn/1R?=
 =?us-ascii?Q?lop+0dOwArUTnfo56xOnoVLnTiWqcMuhQzvne7f7+sB/wwSh3jonBOKhloiy?=
 =?us-ascii?Q?mTHy/kU+/AzpJG5X5k7yC4Jk2rfVmIX4xoS0Da/bPc1h/zgGG9i+IaVNqsqS?=
 =?us-ascii?Q?ddu6bxeYznpzpDCPG13mH6lbWYpeBxCSI0A3jey23J882HvODJXRoqj4mJkr?=
 =?us-ascii?Q?IJ1vy1Gf7W0XE4iKSrfGwpwJQO7HilLDLUA33MVSHU2VGnIwq/61CCDqkAEy?=
 =?us-ascii?Q?bwt1ycaTUmWEnCZub1N0OYh6x1IafwDV0PCMu2OoCKys+5g7amqs50SbeS9s?=
 =?us-ascii?Q?SrTMA8p1K9LjTWbA6mykFMXLI6UsdmvLNAKdI0yoL2OwCSIymv892p+NjOej?=
 =?us-ascii?Q?SR5blKf8JnOAOhCfl0ecmYZzSXqXoe7Jhg9nJoukRVzgk7/+IjNjHso6bRZA?=
 =?us-ascii?Q?xOqckEf/iHbecRkqrlWJxZSqBQgdHkja?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:09:47.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6608c8f-ae3a-4c6e-06ee-08dcb7a2ff9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985

domain_page.c has been moved to mmu/domain_page.c. The reason
being this file implements MMU specific logic for mapping,
unmapping, etc domain page.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/mmu/Makefile            | 1 +
 xen/arch/arm/{ => mmu}/domain_page.c | 0
 2 files changed, 1 insertion(+)
 rename xen/arch/arm/{ => mmu}/domain_page.c (100%)

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


