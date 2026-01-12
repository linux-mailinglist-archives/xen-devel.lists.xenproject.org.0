Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B8D1369F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200488.1516385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJRy-0001nC-Fw; Mon, 12 Jan 2026 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200488.1516385; Mon, 12 Jan 2026 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJRy-0001lh-DE; Mon, 12 Jan 2026 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1200488;
 Mon, 12 Jan 2026 15:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfJRw-0001lb-QZ
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:03:20 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2e0a50a-efc7-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 16:03:17 +0100 (CET)
Received: from MN0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::10)
 by DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:03:13 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:52e:cafe::4b) by MN0P220CA0017.outlook.office365.com
 (2603:10b6:208:52e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 15:03:03 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 15:03:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 09:03:12 -0600
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 07:03:10 -0800
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
X-Inumbo-ID: d2e0a50a-efc7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR7o0qQ7viZhiNwNAQlNrtdE96pTeBrKOqUktVOp8Nj6u7xc8syKYMZP/TB//J2E0iN4CMsPgmbDsvv/AdKYlVPh7gxp3eOyMO8AQpRBrqGtHrZGVZd7ESjvSQPgViMAOr3mUYblc+erWdDJgBdg0t2VHWVWX3QCF6sn7imOqtxMWHa/4lB3tpJwilbWHvELy5XPjHIrV3djJHxIrZMJSSzPhOK3cSN5B9FETKhpBZpcLngTqcQeLBlxA42Ak8/8672/xoUuXSUFfpJAQRuTKKB0ugDGj9dMfD6e4pw/o9edesFPwSJlhlka7iSGcHfPf7GupNxwQ7WEQETunLZAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pLOSTgowp564qhw/IuxOEayZcT2eLsgWW+FjWEzN18=;
 b=nEp5YKjHEJkASbNs4QH2OAaOCFpPPCfcaYZ4elVcqjZQf9ZHCLfMsclIqAq2ZGQGJgms9BmAQZ8Io48th5yFaroi9DmOQHBVr/IXiP9pNThnunVPRFQZxVyPsqv2sFfQ7ldfWBpjNYPZKNftNgBTBrwa/URb49OkNvHVtiMkyov38weaV2+XwFCFKnMDmS2IsPtYPdgLFWlyvNRnSATg3KJY3Op+7u5qhkG8Q0SAI4M/2+MmM9Ht6k502kOyYqUvBEsy+0O7/QwHNR84uz2KbKtJe4jLFwfRvIInbXiWCq5mSQNmsx97zf0rA60k20ircY/QRQ6PKnl/XCbJMh5TFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pLOSTgowp564qhw/IuxOEayZcT2eLsgWW+FjWEzN18=;
 b=28SUYLr5zSL0DU5irah7LxkCqXBBrhWrQ7o4fRlbzJx78YFlXKy3+F1STWvRcJzN2eCWLFqC3gcdJ9vlxA81yl78dr55GVcVidFmtGZla+PwAMml4YUJ1UW4+NkLrlsGQ7dCgcMqe7KNewTV8jmInXQf6sZ3X9ZVNQHu8peF4Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v2 0/2] Add Kconfig option to remove microcode loading support
Date: Mon, 12 Jan 2026 16:02:54 +0100
Message-ID: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9eae4b-f8ac-4d58-3521-08de51ebb53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yCZmC8z36KxVTQC4VVE8SYZhmKoUdAuc86aton6Ri6qYlUhJZHpN2GRhXqH4?=
 =?us-ascii?Q?4C0Ng5PKddfpI3Y9xD70ZOYGiDMMkUWW7L432l9CRCEYtWod02Y5cZqDnwLU?=
 =?us-ascii?Q?WlfKh5YoCr1bg5C7uqKBwM3McGS4W7DBo7IeIa7l4NDsBACTcap3Dh9z8QXC?=
 =?us-ascii?Q?zSOv0cFE8tKHJQ3eqGIjyylyYWV40hQbQ8neXiN+i2ermJsuz1tmH/4jxG4m?=
 =?us-ascii?Q?d8NNYlOTprukMkmMZFb2COfhOHc1aJIbFbsrjcYO5qSdZLpb/Uq3u4l4XuAk?=
 =?us-ascii?Q?/G72b+WKLQtzLuJ1YFWK0zTbLXzNtzQUpzbBS8wpQII8wZbXEDJ2UvA3NTht?=
 =?us-ascii?Q?DnMhnIDlv5KBFe9menhzj7scm6WtVFDeEG1wt4OXd6OmhXE8BpS/nr6VZZWp?=
 =?us-ascii?Q?BvExdP/OpPXrp88HeTknQjrjxOn/yS+chvizXLxBPnLgqYjcun241Nowf9ea?=
 =?us-ascii?Q?Qtq2C3Nb91SyqTMI6GQa+qbuqwCTuHBaCtKglYUFKKQDq4ZldJh12vEbruoa?=
 =?us-ascii?Q?QcYeJFdmAWRMeUlzc7HXEziRKxnerJtXplF7LnBHCFHcI0jE6bsHUq2SuqYF?=
 =?us-ascii?Q?Wf817jAXtepwzDZfNbFbjMCNaUC2TfD5dPB0te+4vQyvd0BtdN0HKYIdPnED?=
 =?us-ascii?Q?cxFtogEcZ+jSdY1OK1VuMsClxgzUCjmYZccgFpGxBIFOSJJKVQAFRE7uNQ9J?=
 =?us-ascii?Q?6GjgbN9VocfelvcoHhlevhG7OWinMr4oxVq8Fa4S3upZDmkYvJckO6qhXTur?=
 =?us-ascii?Q?P8ZAhRjCutRpjidT3ZnZBDx1o47cNQbVVdxs8QZF+t3EpQHLXHBBLvUIik7P?=
 =?us-ascii?Q?4jdauOCQJc0aesXtxIoZOzMqVDhj9m1MBK5s1hip/GiLhNNJgQOgC9cIqc2N?=
 =?us-ascii?Q?2APcPBCooeF8zPx4Ks0frwAysVi5xQ3AcusNDOx/el0neyOtvCdwWV/MxOTU?=
 =?us-ascii?Q?6MJVcjrdSRoxiXoXs53+Pvqc7v/lBpnvwfP42gNkQRCtPWIGxfOsh/Qiekb5?=
 =?us-ascii?Q?OZMi5YuBXBLxkVn6xFi1S/jfW7d59OW82ednTZs83CHWkwL7ZoTTCaDCzn0f?=
 =?us-ascii?Q?iXLqNkIgi0JSJcb4b8/8IppuyRlSNzwN5JSvje7ASnsz1swki5Q+gMlZYe1N?=
 =?us-ascii?Q?vxNHfJoOmyA4ROhGGZrCx81BVRFuUL9oP969NnZxrNkGplFSc9mRnmlyusTg?=
 =?us-ascii?Q?BT3Le9aUmle1OHa2U9kFyLMdZM/7xt55NfZc1bxu1cW8k9IDMLjQoUmdlB32?=
 =?us-ascii?Q?WVcUt7OpkQ//C1B48dvOG5/xEMDLJgb4nZAIdcmsd7F9cQeXVNy9ttLYu8Lr?=
 =?us-ascii?Q?ejzLYD+P0RAVOUUd7wJkz6JBWsRGT4csU5OkafVN1ELfeb90Zly50jt3lmxo?=
 =?us-ascii?Q?4qHqVl6YjHI60LRv8WqqVDorZ7W/jKENSotOVhZ50qxzrw6VKY5xUALsq//f?=
 =?us-ascii?Q?q9ek7oTjZE/a2TJCaEwrt/SQxdfhp/6y0m8yCvxDoYZM9LIKwujhe6sYFpgx?=
 =?us-ascii?Q?1F4pIzUXfWOKkMMNwMOmJ92o9B2965KRmFuZfPhZkTBP7CRK+H/C+EC+4o07?=
 =?us-ascii?Q?MS3IeSJt50ilyHkc1ZI5XrPTGhwYVnowx77yIsMd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:03:13.2531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9eae4b-f8ac-4d58-3521-08de51ebb53c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060

Hi,

This is v2 of the series I sent back in November, now condensed in a single
patch with heavier use of DCE, and with earlycpio removed too. 

While doing this I spotted a typo, thus the new patch1. Patch 2 has all the
meat, fat and bone of the old series at a fraction of the diffstat.

v1: https://lore.kernel.org/xen-devel/20251112162219.226075-1-alejandro.garciavallejo@amd.com/
pipeline (still running at time of send):
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2258163170

Cheers,
Alejandro

Alejandro Vallejo (2):
  x86/ucode: Fix typo s/mitigiated/mitigated/
  x86/ucode: Add Kconfig option to remove microcode loading

 automation/gitlab-ci/build.yaml    |  2 +-
 docs/misc/efi.pandoc               |  2 ++
 docs/misc/xen-command-line.pandoc  |  4 ++--
 xen/arch/x86/Kconfig               | 14 +++++++++++++-
 xen/arch/x86/cpu/microcode/amd.c   | 28 ++++++++++++++++------------
 xen/arch/x86/cpu/microcode/core.c  | 25 ++++++++++++++++++-------
 xen/arch/x86/cpu/microcode/intel.c | 16 +++++++++-------
 xen/arch/x86/efi/efi-boot.h        |  3 ++-
 xen/arch/x86/platform_hypercall.c  |  2 ++
 xen/common/Makefile                |  3 ++-
 10 files changed, 67 insertions(+), 32 deletions(-)


base-commit: a2a34d76643e49ccc949296c9a45888034e50b55
-- 
2.43.0


