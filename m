Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8119902DB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810339.1223020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKQ-0005wa-En; Fri, 04 Oct 2024 12:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810339.1223020; Fri, 04 Oct 2024 12:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKQ-0005uk-Be; Fri, 04 Oct 2024 12:22:38 +0000
Received: by outflank-mailman (input) for mailman id 810339;
 Fri, 04 Oct 2024 12:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKO-0005ue-6x
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55774420-824b-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 14:22:34 +0200 (CEST)
Received: from MN2PR19CA0068.namprd19.prod.outlook.com (2603:10b6:208:19b::45)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 12:22:30 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:208:19b:cafe::7f) by MN2PR19CA0068.outlook.office365.com
 (2603:10b6:208:19b::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.1 via Frontend Transport; Fri, 4 Oct 2024 12:22:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:27 -0500
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
X-Inumbo-ID: 55774420-824b-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwsgvRnZztdVieZtX3Wvh/amd7XBZtTQcSGeQzKc5sr0/7ZWBf4ZMp3XuHlDWNH13izIYn/X0QOg/OhxBp66BCD3RqTrg2iozAPS9T5XslpSblep/QAUqM0Wb3g93ZA6LE8/F17f3vjrxPYE815TJ13/f/HCf/mRvK0gOINdgehRx5FlOkF8EYwP8OzmnZK23XAtNUtfrECxix/rMGbdAtrBoKC5lbij9qJEXxLnNIpLzxwPUg3ezTzDNlTGBfzHw0kH60BpBZ1x+d4riviRuH4BTT4kzvs7g/c5GTYId8B8jnzsiEcGP4iJIlkKyr2EkZzQviYVICRPzFr9zMjW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKf08dK1iokEy71LR4Re1/PbxuHP6KvX8byFJkumCrM=;
 b=Odb+X1U3dAJs6hPPXNJKsPIYVPyf3PwXl3l87lPvOprWWAPXyjHq4hGUm0/2yyxvX6hiH8wjxC7fe8a1wHYfmdFvudi/IjdBzArh2uuhL0SiVUqyYVIDYFjdw6Gp0G2XZ6as7Ai2PDJawHTbA3EGwBhF09SmBVVeja6C0i28TQHdmKIsfAswUFO06IQ5xKX571pJkFvY1UprrQTeX/Si9U6z1y7AbFTbaHbXn73I1EfyAHhcxT+4xNnld3J5exdxneax2ptxAoWvM6fC5HIzffJOX0jctF6VT2gL6J7LllWJsETqowj+YL8VtCbJaJB0IX3x5zon0CkNQDHATK4bVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKf08dK1iokEy71LR4Re1/PbxuHP6KvX8byFJkumCrM=;
 b=DaZ+U8hlBKgeM+5JOXj5e4wHM2QryCK5A3LgjCJsiIGlf0Jn9VS5TzhgBY6jDNJodILr22/AXo9zhRTE7Yc939Dzd6GDopoFUILH2LX6Biy3QTK8w/091+Hp4Et9L6FzZO22jE2tGg312MgtBXJ9Aaez7b3LQW37TrH4RCN9pMA=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 0/6] xen/arm: dt overlay fixes
Date: Fri, 4 Oct 2024 14:22:14 +0200
Message-ID: <20241004122220.234817-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 1788faab-a8f1-427a-0c8b-08dce46f3715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eng/1Bf/65WkNLWF4Zb32jMFo1k9akU+dDQRxRJkCCfrgyAUh7nZwT5ije+Q?=
 =?us-ascii?Q?xTITj1MnqfJhiyTYoNuF8Krksrsa3XD12d/i5hZCVQOBfUKKxVO+orQgZD0q?=
 =?us-ascii?Q?y6Jp6EFSneMfvrdyk5FhrX/NpKfZzW6ZaD4JMcXJMA85NJww7MFPrOVdzzwH?=
 =?us-ascii?Q?uIZ4LDOkskcAnfhs+M1DdOdR75CKZC6Trmcr46gCSul4vIeO5ZMos378/Ops?=
 =?us-ascii?Q?sus6sIwv61yG4+KJLy4OKm3rzKzxjYSHDUKswPm5oPimddZksISUUPu+OO7W?=
 =?us-ascii?Q?CR/YxarCRo/8dUlpyraLOyrkh/itVuO3VlSx6o0aRR3lfd1UGjKAiB8viFrd?=
 =?us-ascii?Q?dkb0F6DsBXgU8CFX8tl2xlEmAlsI/A6ZGFw0IH7yMNqDvqzWQo2hp4vUhsCo?=
 =?us-ascii?Q?cq4gHzgQqrhakP8GOg8H34dknn/7jWd8rgUqTwpioE+epg7rhgkgWAleUc0y?=
 =?us-ascii?Q?dVoZNA8ERl4J/WfkJw3Cy7aXm85rEFx2PiBFvZ/KcIZo9jLnMh3QjSfesmpD?=
 =?us-ascii?Q?R2guvdr8vlwJL7VwxXwjlYn8xu7F1gV3RX3Mf4WIq8DKYrT5hZQvekYCOpLF?=
 =?us-ascii?Q?Kr6uF2J8szZwwFa+Ast/4iHQNrgR/4nMzIpymnCcBFlGUX4yE6Y5LCiHqnQf?=
 =?us-ascii?Q?Wfav/AGjkLA2YeqknM39ZKtgss93syJXIsPwk4vRATAyw5L8uIbFzaxggbQs?=
 =?us-ascii?Q?0brvkKF9Qx/r+hOAVvqNFa1/0LgXu7w3iW3MBcuWIC91aHq89RK2ESt/SknT?=
 =?us-ascii?Q?yu57F0C7VC6mWWfXqxy4kYuDqS8cR/ljCrKpFQm3JvBmLfAzQjX36vYnNr/o?=
 =?us-ascii?Q?RK3x6hBI7rUZe9EbN6we9GK7Z9M6R/xJPAT2uWKEE4oEu6UvRRJRPRT1k2Fh?=
 =?us-ascii?Q?ZsmIYhWCgmugFbq6/PzphqDTx/IsiGZ/nnAKVWhSlmYJuCsuMWykI3/XaoLJ?=
 =?us-ascii?Q?6Ds/9GKO3PnOwu22FfoVBOqz2EPYt2fcS6Y9cxU1NWNJC3EABcyRHfptDf6y?=
 =?us-ascii?Q?sGoeYN7likC1IwAIgCw+sRMiFr5yw32hrfzBRLE5jp9Fi4Mx1YwXDZ0koxCO?=
 =?us-ascii?Q?WfGrGJ07C7sWlzoMKEP1iLybqD58F+SMn6QkLJmiyouQvcU9CUg+vvkDuPho?=
 =?us-ascii?Q?nUJmVD7ViX1P74/0YOxtc/7VoVN2BUrRftGvqtHJg09Dkc0HtgHL2Oq6/oFk?=
 =?us-ascii?Q?XY7mtXXe2C+UDzln05a615E7I3P9bClKmXPBVG3ZhpX/lE9vz6gd9SbXo7/2?=
 =?us-ascii?Q?a7UPNACg4Ka4/NMelxJd5ks0OSG8rEXU58oxVuxYjDzgmTbZIf/d3J1gIMdk?=
 =?us-ascii?Q?X0lDUNMheRziVn0pzqvwV/WS5dI/9gL15HQ2cDWJucqjmYOaqUoJkBdsc3xb?=
 =?us-ascii?Q?VSMK6dARcm4U4TJDkCqitu7K+Q+U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:29.5771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1788faab-a8f1-427a-0c8b-08dce46f3715
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627

This series contains fixes and improvements after doing some tests with DT
overlay support in Xen. I split the series so that each patch handles a separate
issue.

Michal Orzel (6):
  dt-overlay: Fix NULL pointer dereference
  device-tree: Remove __init from unflatten_dt_alloc()
  dt-overlay: Remove ASSERT_UNREACHABLE from add_nodes()
  dt-overlay: Support target-path being root node
  dt-overlay: Ignore nodes that do not have __overlay__ as their subnode
  dt-overlay: Print overlay I/O memory ranges in hex

 xen/common/device-tree/device-tree.c |  4 +--
 xen/common/dt-overlay.c              | 46 +++++++++++++++-------------
 2 files changed, 26 insertions(+), 24 deletions(-)

-- 
2.25.1


