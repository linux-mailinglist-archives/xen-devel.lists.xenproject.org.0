Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D2ACC3E6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004147.1383796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUi-0002R6-CY; Tue, 03 Jun 2025 10:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004147.1383796; Tue, 03 Jun 2025 10:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMOUi-0002PK-9g; Tue, 03 Jun 2025 10:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1004147;
 Tue, 03 Jun 2025 10:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMOUg-0002Ov-Rc
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:03:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065ec602-4062-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 12:03:40 +0200 (CEST)
Received: from CH5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:610:1f1::9)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 10:03:37 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::ae) by CH5PR03CA0012.outlook.office365.com
 (2603:10b6:610:1f1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Tue,
 3 Jun 2025 10:03:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Tue, 3 Jun 2025 10:03:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 05:03:36 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Jun 2025 05:03:33 -0500
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
X-Inumbo-ID: 065ec602-4062-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bahHtE0Y8X/mtZdqSztrQ3wvBwlTd+i6HSWW7nfNCV1rN8HTegYCyWtdS/3Kz31Qn6ffQIOL9+hOonq1tAU6G19vq/B7D73CGk+BpdDSo/5p+CblYPisNlmkkS/LZEPGwOWe+7vvxQNlmUDIGy4OWL88+f4rBcltLv/FNjT6toLzuN1hA7r8PBXNxuYWyy8eTVHt0qamV2Mj3holRIqRO+o/fhzbl5UqBYehcokfAOkFqJ3EO7eoDidcCFuVTfHxOQFj0Pb2wafmZ2XKKqntblPZLmWrTQMmVMRv7Kyjr8NUC1/NEl6KBy2Koe3cWQodtKlC411FDEFEyyfRRCWL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8qdZJEv4A/W7uOFdxgJhQkSnCawOYPpWmKB9kccw0o=;
 b=iAuFCDpMy4zC3e8hnr0XaXAGg8/ZtY/UpFblB6xTzEe0C/TXDVSSPEarVU9anevMbQSYg7SlWHQEmBL2VX+OT9geTi6lbQyUovDXyvyZFgJ5VQwKIaO4ZKPpT7GCg3PDTEdIGGN61Yh4vlVsH6bLSRX1g4URF2pue9DKiN3jTEQI9anoOkkIdskq+7ywuVzMlOV3WeIMGB8SSZTlVHvk0GHebYE/9ugOIytwYHEMfLhEy9qR/tWG3WbNdhn+cxttqzpEnBdX1XAWxJpLid3eE2H1kY8w4GYyjyg84AAx5bg3PTHWjfAG5hkd2AeAmOPjIGprZ8BgzL00GdZaJBel4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8qdZJEv4A/W7uOFdxgJhQkSnCawOYPpWmKB9kccw0o=;
 b=a95f0m3n2Gpwx02Oek53eJ/HBG9jN2+FGJ21cpm8QOi2CkYT6VabFNbKE3pFYkyRTjVCRZs+oWiy5YNInm4+FFyeJKK46zqYI8A9Yz+Kao1tLw7yRpuvTnYwCBDhdiqsd7PaFyEMzDI5qE5W3XW1p0Pr5pYn0IzX5G2UsEbKO7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/4] device-tree: Move static features to common
Date: Tue, 3 Jun 2025 12:03:25 +0200
Message-ID: <20250603100329.149851-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 683f97f2-c00d-4177-dab6-08dda285e88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1E5CI8InPD3rj3xEu71bFu4KfQKPnZQFoXL6EBqWMdVzJMetXr+AjaQcO0qb?=
 =?us-ascii?Q?KO0BY8g5adwQqXCOCUkMhsv5Nz1x7GqCYqqIVNVMAXILiS97Q3sZDCBpG9nh?=
 =?us-ascii?Q?FWCrA5XCxtw30UotTqNjLMDSMzU6T7E+MfEBWJwOEbo494rFF1Ltr7J2JTWM?=
 =?us-ascii?Q?ucMo+T3QNgG3I+I980mifRMEO7vOzThmx0KA6WXgZbH0AuMTUyjPwBNRS4Dy?=
 =?us-ascii?Q?f/fNjbCAOWvAzOfAl3JWdt2AoWbmJnF+3iJ748uoF99Y71aBEYNcFkntgj4C?=
 =?us-ascii?Q?T5fQSMajgocj2gfXMBhi/B09snJcFvS6PN1paryxsw4ZSI/wYKhxACk2DibX?=
 =?us-ascii?Q?Yd8ZHfx1SzNWsoG+jvCaEr9NsCB1ePqTk0rtw715B0V9XhJMrQ1h82uwr4WT?=
 =?us-ascii?Q?l2m7rpmNea4gRyApdZRxgc2Br+WdQ2nSbgfpTotRAuWLW43dnEj2Jpj0HqAp?=
 =?us-ascii?Q?sRxq61oYmwon5dMnMjotUwwkao85pLdBY04hmDnqeuTw3HWwsPMqNvqHCj0i?=
 =?us-ascii?Q?msWAwkOZWy37eX+WhdqJZhaZ2FtHnNKajyJaezjyLGb8LcfnPG74Y2BL7ODW?=
 =?us-ascii?Q?zDDXPrce0ZW1RUsdDuxnERdGXTNlcezB1BBaMcYrMXQu7ejq6OQsVW28+6Nh?=
 =?us-ascii?Q?tMWZZO8HT4jyx0UiJNisijdGCNdWZSIY7ytLfZ4zO7KDpLUMxOpJVy66gWsM?=
 =?us-ascii?Q?bo51Ee7nnYvPNXR2vPTMqv4cE9UNFn4tMfYE4i63t16dvvSXLFtYZpDi3HLl?=
 =?us-ascii?Q?hQ8jp8Ep3XQWZrsKvRCNwnkeJaMSZWHICHgKQMJKqnnsS3bmayuSG0kSRS3P?=
 =?us-ascii?Q?GhuKSnwHvadknF/aYQctJIjkXvUenjg1gn1iT07b3m7YAbBXU5Lf+C4zqbCI?=
 =?us-ascii?Q?k8TWv0zuTDRCEgoAbO9xcZhvZLoYNrZZY5/NT8mBRxj2ATVowTgrXli5XIxZ?=
 =?us-ascii?Q?BiDl0IEZhZ8NhmvXnpSS0f5EJaBglvloMOkw5kNjIHe8eHE4FhmDPQ9zxr37?=
 =?us-ascii?Q?kEYC01pzdqH8u/+kEWZRQvqmQ1fEtL+rgXhs8hCKhBV7vSa7bwkOKo2bDExe?=
 =?us-ascii?Q?AIJO4c7scw6wE98zsOa8Bl3KgKBZeaiOJ24ftTr1ZAsFV737FjVf9b5/uDfl?=
 =?us-ascii?Q?9oR8K1gOdl3RceOpppyTB5jk97DcDzeqo3UCiaE4QchYcvHRtmuE6EmJw1MQ?=
 =?us-ascii?Q?LeaeN4D9TB8nhXX/tUt5bP/oO2l6D5OgDr2QPZyOtDde/VzSMXHVW2x1Znxv?=
 =?us-ascii?Q?4va+OjsWPXEr2PSxbJv2YYblwKQiQXRTrPkBoCK/wZw7ZlQaSrMWHA7cl4LG?=
 =?us-ascii?Q?RD1ug7whz/j4SuzApZB0p3dAPvA8Cbwt3VrbLfZQN7yyrGZvQP7sbppwAEpE?=
 =?us-ascii?Q?v1k8GYcimK4DxTVgR56DbhR1CrkUpKwFkQNVxMO3mOLBLy0QFcBlc2OjdK6t?=
 =?us-ascii?Q?kN8jUMMpnp0KcKc466b682/b+C8BsVqcsdmbZ/KiSGHhO82KY93yrm4nyqM9?=
 =?us-ascii?Q?EKwYgl8Guh+KZH97JaQqdqH0bEdgbpXQxDJ6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:03:37.1840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683f97f2-c00d-4177-dab6-08dda285e88c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

Finish the work to move static features that are arch agnostic to common.

Michal Orzel (4):
  common: Drop unneeded Arm dependency for static-evtchn
  device-tree: Move domain_fdt_begin_node() to common
  device-tree: Move Arm's static-memory feature to common
  device-tree: Move Arm's static-shmem feature to common

 xen/arch/arm/Kconfig                          |  6 ----
 xen/arch/arm/Makefile                         |  2 --
 xen/arch/arm/arm32/mmu/mm.c                   |  4 +--
 xen/arch/arm/arm64/mmu/mm.c                   |  4 +--
 xen/arch/arm/dom0less-build.c                 |  4 +--
 xen/arch/arm/domain_build.c                   | 34 +-----------------
 xen/arch/arm/include/asm/domain_build.h       |  1 -
 xen/common/Kconfig                            |  8 ++++-
 xen/common/device-tree/Makefile               |  2 ++
 xen/common/device-tree/bootfdt.c              | 36 +++++++++++++++++--
 xen/common/device-tree/dom0less-build.c       | 15 ++------
 .../device-tree}/static-memory.c              |  2 +-
 .../arm => common/device-tree}/static-shmem.c |  5 ++-
 xen/include/xen/bootfdt.h                     |  1 +
 .../asm => include/xen}/static-memory.h       |  9 ++---
 .../asm => include/xen}/static-shmem.h        |  6 ++--
 16 files changed, 63 insertions(+), 76 deletions(-)
 rename xen/{arch/arm => common/device-tree}/static-memory.c (99%)
 rename xen/{arch/arm => common/device-tree}/static-shmem.c (99%)
 rename xen/{arch/arm/include/asm => include/xen}/static-memory.h (93%)
 rename xen/{arch/arm/include/asm => include/xen}/static-shmem.h (96%)

-- 
2.25.1


