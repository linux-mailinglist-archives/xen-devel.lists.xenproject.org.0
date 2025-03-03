Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3AA4BA01
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:57:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899951.1307878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bk-0003GU-FS; Mon, 03 Mar 2025 08:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899951.1307878; Mon, 03 Mar 2025 08:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bk-0003Dt-Bt; Mon, 03 Mar 2025 08:57:04 +0000
Received: by outflank-mailman (input) for mailman id 899951;
 Mon, 03 Mar 2025 08:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp1bi-0003Dd-PL
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:57:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c21fb9-f80d-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 09:56:57 +0100 (CET)
Received: from BL0PR0102CA0047.prod.exchangelabs.com (2603:10b6:208:25::24) by
 BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 08:56:54 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:25:cafe::b1) by BL0PR0102CA0047.outlook.office365.com
 (2603:10b6:208:25::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 08:56:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 08:56:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 02:56:53 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 3 Mar 2025 02:56:51 -0600
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
X-Inumbo-ID: 75c21fb9-f80d-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FG+R3DVYvG0g4HRAEjw1l/jKBTwqKgMzrYRhHCO3+mXONoc7DecLOvo8o4dcoZtLBhrSzfLhiJvitI96Nf05tWZF3Z6tjylmhdJGj1pTF5/jqJGSB5f+E8RfPlGM0DfC9LZ55q9HoHvGAjEDCDYV4a+QJZcyPvBbdcf9EAFkoaNPjDlaYzJXW03+EI8cB1cmJT8jbWsuahcVrM6oPZNd/PH+dEuTkkZOFEdsZ32t8t3Fxy8qnMxx9nd8dEk/rbmX9BNNdnZLYrHy4qYoBfreUUM2qYCchs+IxuNSbvp9hZLgCeJFnof+yqsYSVxEDvl/3vMr9jwdXphG17BPt906Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egJCmJhxu99LSlaa1eiDPpwpjCInS8hyXWJ2fmuGQGU=;
 b=nqhv7M38MFGf+bNqHOn/F8cnHIpZ8p/fbNzE4wQuU7hAKzNE3uNZ+y6G5cdQxWN5SgG0mDy4wRH48LtsWD1AzeB1Ap5Wb+sOYEQ+vzQycJgByB/1kbs8yFVCKaTigW4TTFYekPgwhnDlr1+3rkdUFcyzknPr6C8q/uDREgaVsIK8rpR39VNkgINNHCDuX4DGQFQRLY1faaDg4Np0LaxvaOtTcvDsiZ0xhP8YH89FF46Fmf485Bq3gcE58Zn8YunKaGc98KkcjZicw/+He81pBptmqTXMcrj9VcDpCtgRBIUTK5L8NpT17kcprn/6YyAqtORO8t2sP+w5s6vEc2ZIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egJCmJhxu99LSlaa1eiDPpwpjCInS8hyXWJ2fmuGQGU=;
 b=48pNeFWU3i80kqdZD1yVZHOYJJektReH9jD0I0bdonGoT4HOaKh8ehPEtdKUPr88jsufubh9mk+BZmHbVYqYopXCEGEgrlp9ehNT7Y/gMQS+4kNj/pgioNCdr10eHL3PLilI0Wl68CfNIxqn2NvEyRidibHwhRtRJgO5gBliUZc=
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
Subject: [PATCH 0/4] xen/arm: misc tiny fixes
Date: Mon, 3 Mar 2025 09:56:46 +0100
Message-ID: <20250303085650.74098-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8fe7a8-2436-43f2-98d4-08dd5a315840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H1MT74qaAVgUxXtoR1IyN3dt/K3Y29pvT9OEwPCv5lFU5WeN07+RJ/R/m6nQ?=
 =?us-ascii?Q?Olt0AMjjTLZiJcD6zbJx+k8oz1wd9iIIJRmoVZndNm2RnytPZ9RSIkv32W7z?=
 =?us-ascii?Q?V+aU8La6kPDJpblPuoTIckcwcDWR/Q08bTdPF+c97R71Nns0rBlfwnDO2WH6?=
 =?us-ascii?Q?TKV78PqQHxaVXbaFL08PDmqrDnqmQ9Fy9OqIRT3bgqOvFTqPFr/GEY0WAAYv?=
 =?us-ascii?Q?Iig0yrUXrWMCtqKSVoaIsh+WCSyIwyz+EjmxozR5kUrjbmZL6vFZTB7D0vrP?=
 =?us-ascii?Q?dMGkDj8bXSrjj043hIGOezxTezZfDN9fGP1aTme5thPh3Z6L2o6NzBsOI6wT?=
 =?us-ascii?Q?GFm3YpBg+tRAsrfWPs3kll5WXDHNLFammkfbZGIY2eZL32Rf9v7SiC6jEDe7?=
 =?us-ascii?Q?tKRnYCijKHQ2GXvRs1+M50WerDn07HPh8p7YbHmsGscv7UWWZQltMlxgZ5/t?=
 =?us-ascii?Q?2fRxLJhiuwjJmYIpT+FUV1cZwqJa9NdUEB+MEp0IyXnmMRLv/2mjCXYtPbaH?=
 =?us-ascii?Q?hAWp3Vspxsl+eGtfqS8k3OCNYuruLKWOtVak2BowN//JOxvDvUG3ZeqOIQJ4?=
 =?us-ascii?Q?BYjs3C8zDxZ28Ck6w3v6BxBn1C8Q3/1T+FzZWnYUMESdGj2B/INH5fjGSJjk?=
 =?us-ascii?Q?ajMFkYOsU29VOsV3xbBafDm1yYPohG3rgCThkQsWYakDVVJJ6+Qt+N4fzGN1?=
 =?us-ascii?Q?20Oeu02G7tVO5KqVhPQIyeRni4EaIJwI7XEFx//T2As3i7gXt71pkJVNaQmA?=
 =?us-ascii?Q?KWJmpS20CdIl3dIQ6jijvup5kmNiG4WnhHp/tFDO9vJP3Hm0fUMY66LRANDW?=
 =?us-ascii?Q?+l8DNbpND7NEFzuc83ijt9hVqjOI+cKhPaPy1kFn2pkD2OLzwWXQwWCDqnZM?=
 =?us-ascii?Q?oAdZXNguYVz58zY2dfe6viDlXxxh/XJKgtCAZrRQcG1vv7S0xKRBfikiEQc+?=
 =?us-ascii?Q?mZsNfbt7N7Aeij5pwQ1aLmgBNIgOY+p7tx7IJHy6F5hs6DAfK74gwEET/zfv?=
 =?us-ascii?Q?UxngdS0v4A5hfoK6WY1evrSAwDMYGBUDxU4RKWJGcdVyOjsS0ksbqMyhBzVa?=
 =?us-ascii?Q?OvAeMqrIsaujLSY1bY7cfOJ0igIBHbzo8YsIA5lnqPPPXRrV6wQfPB94Uroo?=
 =?us-ascii?Q?E+SqkgOIGChwfJIh5gMxRu3d7GEuaDYMDL448inmQXDHnOJ70TVscCFzioOI?=
 =?us-ascii?Q?FVdSUcixWIMNG3TBz2rtpI+jmw9LEtMZ6P2n34EYkchHhCMb+G027a+bhg6A?=
 =?us-ascii?Q?HSyGn1et+boN/qnLFZn7nnmhikU/LlTI03hghPWXNYnRCUm9g3OOLueIVE+W?=
 =?us-ascii?Q?t2NqBVcahavdRIiFwRSYN9WuAqXoIohUmeSC2BPWZ+MLdCl335EP+xh7je4p?=
 =?us-ascii?Q?f52oMsmokFaB0r3LiwXpW8DQmD1NIKxA2IhDhtAGgATq13aEW0x/XcnkyEQO?=
 =?us-ascii?Q?fJWFMpkIc1rxmLi3NWb/jNCQA+pWUUjkwKWxR6GPfOjbz+vWCexM79y8bmez?=
 =?us-ascii?Q?KsLUBYPO+Ibq/LE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:56:53.6691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8fe7a8-2436-43f2-98d4-08dd5a315840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970

Series of unconnected, tiny patches accumulated recently.

Michal Orzel (4):
  xen/arm: dm: Bail out if padding != 0 for XEN_DMOP_set_irq_level
  xen/arm: Check return code from fdt_finish_reservemap()
  xen/arm: static-shmem: Drop unused size_cells
  xen/arm: Don't blindly print hwdom in generic panic messages

 xen/arch/arm/dm.c           | 2 +-
 xen/arch/arm/domain_build.c | 8 +++++---
 xen/arch/arm/kernel.c       | 4 ++--
 xen/arch/arm/static-shmem.c | 3 +--
 4 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.25.1


