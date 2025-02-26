Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B781A46C13
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 21:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897222.1305927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj5-0007PT-Qg; Wed, 26 Feb 2025 20:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897222.1305927; Wed, 26 Feb 2025 20:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj5-0007ND-Ng; Wed, 26 Feb 2025 20:09:51 +0000
Received: by outflank-mailman (input) for mailman id 897222;
 Wed, 26 Feb 2025 20:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drmc=VR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnNj4-0007Mt-Am
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 20:09:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1530160-f47d-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 21:09:48 +0100 (CET)
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 20:09:42 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::4) by DS7PR03CA0145.outlook.office365.com
 (2603:10b6:5:3b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 20:09:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 20:09:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 14:09:40 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 26 Feb 2025 14:09:39 -0600
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
X-Inumbo-ID: a1530160-f47d-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEaOJYnisk3aletBPf67F3aJfel2COEnTGEJHSdKZ3EPAkyFL0WaDb0TpGA7RVpfR+gb/hGhUiy8zMQMybj91v+tPCxEt62cCIbWjN/ikPhKzH06TrIAg7BrFnXw8zJcwhE9CjAZRB/amV6qcqa+tMdJggArRDeWqEGW+AbebpvaPIB+fMsvIDiss2eKCV/eENJ7ZxN9ybgZ2QRwjWfqJaM5zfSCTfSt/9dGOAdbSvM5ph9NvR+hppg/zW5HTQO04ZFZUNnGuV/4G+x9WNMwpOANFw2qgUaaBE01XmwD2G0Yhkl0CnkR3nWVa6rrHYrVQ3IrkdqDycl6OlV37OxHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWI6g7VeI7vpzwTnmsQlwO7mfOONemLSplUfp0+w1ik=;
 b=F9cXGjtH/Zdb7e7v4j5mPx3Npi/alN+dfR6fX9njYXPwbHlbSuNbLQHj2YLLj5WHw8aqcyeiQB6rzsHRYf9T4LI+q/0X53llT5aNOQdmlcF9yNBa+fFztbUXnHWqn+BQAXFD4J5Ny3KM/PmWuFiHYdAlHdX0ljiZ5glbfu1HyWCoHtW9oi8L2I6Ioa2XqsEFq/mmRKkISo5XtA+xJLGlVEEJhyEPq+xOhWXYURA7xVsTWQcrsKb47Ntu967q3JvQoEXT7DUHW0j/TYs34NX2M3ERM3MsEkl93JetqmnKsr/Qy4OA4eBHdiFhMinGW/l/TpuIUNUEZkTkQxsPuq3vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWI6g7VeI7vpzwTnmsQlwO7mfOONemLSplUfp0+w1ik=;
 b=plv4IjHSiASNIw+aNBVd99BhA+qOBeFbkVyUJDfFy+RxwJK4l/kQe2LUuDQE2isYkHhSIJd+e7ffl9MM2wb2RBpplz+lW+Wv6noEjlNXjrm5B6CCA9WojFk3ZMcQV+AX9BE1Gz3NuIZqq8xVUTJGU5SXc7yYXucvhUIGaAZvHu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] tools: Fix PVH dom0 passthrough with legacy irq
Date: Wed, 26 Feb 2025 15:10:20 -0500
Message-ID: <20250226201022.42447-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: abd1a171-a082-4ad6-8eb9-08dd56a180fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JHckVqn52o/8hVaGasXNf8xzrQcMlwGpMXineAN9N0hsfdGtK+XgEQMuVYyP?=
 =?us-ascii?Q?G4W/A60w8O41riRmtstqjgHcrg1NwaQcu2xU2BHNdGTl8jmHZEGpnAIQzbSk?=
 =?us-ascii?Q?gD1sxF2pQQ4a+Zl6eFQDDzCTdjeJzewsUwVmnw0QF7dHauRA541d850BwhRp?=
 =?us-ascii?Q?biAHatmnzvdFn0f97gBptOcGvXuM3m3rC4ceITxg5QXcBQHK3om1GuWTEJsP?=
 =?us-ascii?Q?mqpWrB0hrEKOgqjTd6EUXpczsp/VeYONIhDgncRGJaBXaEvm0NZmDE1xjHkd?=
 =?us-ascii?Q?5EuOHBgxSL/FcFYXY7xkoRja2TtlY0t+QZg0pftTm4VJYaMu2JV2cOfuuUu5?=
 =?us-ascii?Q?8OcGMykg38mdRI2kxWjwgCztaDv5C6bKwxqw6Pst1Tgmlbz3OviRcX6pLC1w?=
 =?us-ascii?Q?T+3djmLZnpPI0hDSmYJL+risMmLYjlcNpJO4xeZZFhBY/wZmhiO2Pa4k1jrM?=
 =?us-ascii?Q?tNr+9F5oup+Bo6/r5R7ChkvuDqDq2NG/4F9cl4qbYLjJNbcVkl3szRa5SM4f?=
 =?us-ascii?Q?ar5Y53jaawfR4imbcyb/0+laTTTWve0DhYeeSh+WVY9eXYc7JOTNKeJG2rgv?=
 =?us-ascii?Q?o90jzvbfw6PeXRiOyJDbKPwWht3yvTC10a1rW9T//sOPjPbmZU6eHJA5rG0z?=
 =?us-ascii?Q?PnrxXoZ2qqpMH25+znzi1hVOc3MG1NUYTgCAVXOKiizie1QZ4ZPsrguGzGNR?=
 =?us-ascii?Q?N8pLsNSYKpJl03mRohdbRv9HhDjOEmCVMuAJsHJo4lvNfNHlflUu4y6+25Gb?=
 =?us-ascii?Q?Cm09hn2mmXLp39VW8o76ZEUoUkCJdu3ne5pr/4/DL9P4eegPD2Jh8AGKYvwt?=
 =?us-ascii?Q?/jV6Ua6rdbrmdhwG+dyMSoTCcm6Z9ysjFicSKQBWExwzElY+AqWSnE7WMbQf?=
 =?us-ascii?Q?qVbV6QeI2xYfotScLtcN7oOLKYWhIwRT3izzW2Hyi1WT2siCTrNSilnoR7Pn?=
 =?us-ascii?Q?76crGPuqomspvwbfMFr3YBfmUIdZ6/STCqvhkbZFIuYsCZvt4jeuQ4UyXE7d?=
 =?us-ascii?Q?p9nWS6d1HoEtrj5oZ4SDBtAs6R8RSO+hvceZx6jncMtjjdZOZ0WAgD3QjADM?=
 =?us-ascii?Q?5/LgcxuX12TC1AYZ7+4cQGgRkaM1y5w3i+BJmO9vifNkzh38WixBqfJrd80g?=
 =?us-ascii?Q?oBHwmcTrYPmy5jBFO20YHYEV+hB5VxMYEzm4mIdVs5h97y2v7I6yZ/1tuWOZ?=
 =?us-ascii?Q?1tMmGjUkJ4kSC3FXfksbWFDAd1O5iDzfphcwSQazWyJoC680HXzkWa5oBUwB?=
 =?us-ascii?Q?K5u7p2dVwq5lP0nnDkIgFXiF+F/ihjL9TifpyMpWBcDjUwWK0lTCuwacf6JO?=
 =?us-ascii?Q?RheJuk6Vk0AaabF0u8DDWNhKlF7PL9/5SFkYpiOMyUGTqAz4ZRAmrRgELQLh?=
 =?us-ascii?Q?u/53vF2UpDiX3dXszJsjrey5GS7sM1XXC2w2M8T9zxKInjBJe+cWM7EwYWx4?=
 =?us-ascii?Q?DnTNMCOGjlWdFOeoWQOzU6JC06lGZA2N?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:09:40.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd1a171-a082-4ad6-8eb9-08dd56a180fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

A PCI device may not have a legacy IRQ assigned.  This series allows
passthrough of such a device to a guest.

It relies on a Linux change to xen-pciback to also handle missing legacy
IRQs:
https://lore.kernel.org/xen-devel/20250226200134.29759-1-jason.andryuk@amd.com/T/#u

Jason Andryuk (2):
  tools/ctrl: Silence missing GSI in xc_pcidev_get_gsi()
  tools/libxl: Skip missing PCI GSIs

 tools/libs/ctrl/xc_linux.c   |  3 ++-
 tools/libs/light/libxl_x86.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.34.1


