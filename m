Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584E3AAFB30
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979384.1366019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Ba-0005vr-NA; Thu, 08 May 2025 13:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979384.1366019; Thu, 08 May 2025 13:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Ba-0005uN-K5; Thu, 08 May 2025 13:21:14 +0000
Received: by outflank-mailman (input) for mailman id 979384;
 Thu, 08 May 2025 13:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1BZ-0005gg-7F
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 494e5ffc-2c0f-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 15:21:03 +0200 (CEST)
Received: from DM6PR14CA0059.namprd14.prod.outlook.com (2603:10b6:5:18f::36)
 by MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Thu, 8 May
 2025 13:20:52 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::4d) by DM6PR14CA0059.outlook.office365.com
 (2603:10b6:5:18f::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Thu,
 8 May 2025 13:20:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:20:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:20:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:20:50 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:20:48 -0500
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
X-Inumbo-ID: 494e5ffc-2c0f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX0ev1GOEQhqFgOqJ2VoWhni9IQLpcuMqhX4nyGVw041PI0M0xz1+cI8V1WZO82RIAixvB9B0+Tgsv70HCLoLTyngEVYOjqnjjNjFCjmjLCPFXlxs6TNjhKhc4F1K3l6mdF9rfbZ7BJvM38fh1l57MnPSfU55jD//R2efU3AHv1OC3pQXWXHrlsV52sXD2PlLPJBcROde6E2hFWdcNjhuMywUQw62R9xDqEnem6vX64dajSW8TMrh3e8zaDkTzLDp1+x5rON8zD4BeXH7LcTLJQXvnQ/UaUNy1DZ+sAtsrUp9AjdJXoNenKx3Bk9uOrqNGFf8l88k5nSzTm16mFYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2LhpbDNYFys0x5LXtoAlj+1uW+UqGZLvwi+0rSZyiE=;
 b=k/lZrJ+04vX4z3EQJvf1zcZKgZvysLrLjtHg2NecJkUAuCsKOFb6osMgIU99eOCGFK8+ffRqLZdqtA8DvvCSpi+kGIRh0wiTU2wU+tz4392pQM93KPPLdyFVQj2GKH8afMiw7R96Ghd/Lov6MsXe2nfFFWBCuFuJYi3Tse6NRcDFFLid/0j4QEU/QGKVLAGKxOJW7PKH1bkQHxj/LUEKokx3OUlWNd9/kRRLLngRTk8vNpbLpRyT54Cv5aWc6yAfNwM5ZHHLnPpkpFNSqlKZgS2ZayshAxGFphilUE72azJIQcAOylC89hMGRan0D5pdVQi/i8gRtIiUCqltvUEnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2LhpbDNYFys0x5LXtoAlj+1uW+UqGZLvwi+0rSZyiE=;
 b=jRZ5vp91xj5aWfPB3yOeXsDg3uC4mPfq02C7iu6Mjnd1O+KiV3PEN7tK8GHswcFw4kAiMK02BnOfoYs2EuqnXfLSlZrZzqolsTr/SKO/mTb2VpJvE8qqQ8H+WM0usoBU6TubGb3kWoZam7o0AIASEqx2nv7Agz335JAsEl2uzFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: [PATCH v2 0/6] arm: extended regions fixes
Date: Thu, 8 May 2025 09:20:29 -0400
Message-ID: <20250508132040.532898-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be7dd49-b4b6-42da-1117-08dd8e3327ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0JcyCKs7Iru8WtgP4WytWRoRsQnNrnnJBbQP7aYcXdcTxBUAuHtrA2lLA4Vm?=
 =?us-ascii?Q?OOmIL5V3wS2V0+2iKVWxOlFb3xgC1fAD5CuYu5k6NJNFGGcdxIVCP/OBCtAQ?=
 =?us-ascii?Q?NZWT0SZHAjhAg45l5mKLisl8ZF5p7QNhToOeOjme1aXdBxJn7R+5eA4UpOty?=
 =?us-ascii?Q?UEdUycFATup0BC0bOQ5VrLEBnpakV9mtuTh7Mz/rtQrtMgrk0rfeuOe7i/Li?=
 =?us-ascii?Q?frFu6+yKGmOcLnapELieM/WgcdUXvl90ilX/lKJWZC9t5yWB5r9ydBGwRpfn?=
 =?us-ascii?Q?/i0W+34ZzEuiNI5402H+MZLFMhhyQIJwb0lpd5lwSzDIyrySNTZjOr3QY8sb?=
 =?us-ascii?Q?+DKxbIK5hMMUB2nwJopeQApr78vDi9J1cHg8161Hf7UBaohs7NiepPetSxaU?=
 =?us-ascii?Q?crlrFKZE8D/dJU3Lf60JvukGzMQgld3v9WJnYEnu/URYfrMqyqsAUAQHVOf7?=
 =?us-ascii?Q?+4kVYTbnEcZygIkTfeZqNndtU5NGKVLGMMzICU843U7LAy1lnxBTM8WR+UdB?=
 =?us-ascii?Q?9HN3/mzrulHfptjiVbJrK+yuy7Qb/qVN8BURonXvxmIWVpDq4v654oxT6jEE?=
 =?us-ascii?Q?IoXYJA+68YGu+2Oe9IvVi4lddyoQinwO0eCW6UAECLN4h97nG4fBILPXvZj5?=
 =?us-ascii?Q?0p46ikNeTHJIgZ/1z6yGsAmrXlAHnbs4ZcGMF1x2LaKa+MWMOuVkHqPciaIv?=
 =?us-ascii?Q?ztjECjHpP0+80TnBmstbROg84PyaqiV6Z+hcON2YjIpuflbvEVpRGCbDglXt?=
 =?us-ascii?Q?/HK5PaCCWi1Ik7qX/YYlSXxV2AH113XybI5cCXxGpbvAx7xPmzgtd0Y+oOzw?=
 =?us-ascii?Q?wGly0RAB/wKJeWrgsuSZW/xlrXMQ4xM5Aa9W1fMB2KdKC7vYEJ11J9hAK4dZ?=
 =?us-ascii?Q?AGfLn3U9DzZvTN+Pj93cC9rccjlHELCPZIGiTYCfV3LjOydJe2GNdxkdDNU7?=
 =?us-ascii?Q?Cvw33KAEhXO4qAUH2163klIuyksXCgDfvxM4Q6ta8qNDj35r2XbJdSU8VTZV?=
 =?us-ascii?Q?pKcTGoQqQVWZz5rtpJa7sYFmPAibW1kSXagbv+MFRzSyWYrtC0HGWTgfhFWn?=
 =?us-ascii?Q?OngKlsybNT3Wra2eKSjlSdpvm7nR2rhKtKaRc/yyi+y9lp3YBNlDGW9DjvPL?=
 =?us-ascii?Q?w9Tumn/chFO7bVmmAC766GEs6Ji+7bu7BWfZQ1g5lC1ViR46mevKTQ8D5ABN?=
 =?us-ascii?Q?MerFlcTIq6cJ4rd3GkzOXZBaWaE/KSEsck5Z2MvnOm04hhF10zKIKILq7czy?=
 =?us-ascii?Q?d4vLYnX29GOhif0MjG8EsnF95XX4xM8YQeVIUjke5UXnSEYcFE/5+rxibm8J?=
 =?us-ascii?Q?nGr+XEVtxRqlscrQkfymACtxjpabfeD0PV2ye7UNO8HuldzcYhQBbwJ4xO2x?=
 =?us-ascii?Q?g+FcsNhsy4EPHL5jL9iV6W3qL5ylPzLbAlB+HnVlte0LbIekqIwQ/9+wLRru?=
 =?us-ascii?Q?QIB+iuH/BFN6TYFyiPqYBaEATO3AqdlwcfF6bPO/qPbU6IQj9fTV/09XvwEg?=
 =?us-ascii?Q?QvKYrB0M6molHjNgB609c11NvIAAkKMBJNCQcyvdsAXDV0DNWHJ89Y0fFQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:20:51.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be7dd49-b4b6-42da-1117-08dd8e3327ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296

v2 pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/1807189300

v1->v2:
* rebase
* address feedback

Stewart Hildebrand (6):
  xen/arm: fix math in add_ext_regions
  xen/arm: fix math in add_hwdom_free_regions
  xen/arm: switch find_domU_holes to rangesets
  rangeset: introduce rangeset_subtract
  xen/arm: exclude xen,reg from domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c            | 118 ++++++++++++++++++++----
 xen/arch/arm/domain_build.c             |  55 ++++++++---
 xen/arch/arm/include/asm/static-shmem.h |   9 --
 xen/arch/arm/static-shmem.c             |  65 -------------
 xen/common/device-tree/dom0less-build.c |  19 +++-
 xen/common/device-tree/domain-build.c   |   2 +-
 xen/common/rangeset.c                   |  12 +++
 xen/include/xen/fdt-kernel.h            |   1 +
 xen/include/xen/rangeset.h              |   3 +
 9 files changed, 177 insertions(+), 107 deletions(-)


base-commit: ed9488a0d155562cc4f1c9a1c38031579a347cf4
-- 
2.49.0


