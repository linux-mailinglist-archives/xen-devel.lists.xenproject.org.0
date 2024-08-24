Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160195DAB6
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2024 04:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782803.1192301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shgjo-0006Y5-72; Sat, 24 Aug 2024 02:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782803.1192301; Sat, 24 Aug 2024 02:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shgjo-0006VZ-3K; Sat, 24 Aug 2024 02:42:48 +0000
Received: by outflank-mailman (input) for mailman id 782803;
 Sat, 24 Aug 2024 02:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yu32=PX=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1shgjm-0006VS-Dh
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2024 02:42:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2417::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a13bbb3-61c2-11ef-a50a-bb4a2ccca743;
 Sat, 24 Aug 2024 04:42:44 +0200 (CEST)
Received: from CY5P221CA0161.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::15)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 02:42:38 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:6a:cafe::73) by CY5P221CA0161.outlook.office365.com
 (2603:10b6:930:6a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.22 via Frontend
 Transport; Sat, 24 Aug 2024 02:42:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Sat, 24 Aug 2024 02:42:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 21:42:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 21:42:28 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 21:42:28 -0500
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
X-Inumbo-ID: 8a13bbb3-61c2-11ef-a50a-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgNsg3KeLpDjG4WXfXehliq4ua7QBFab9NSFkRH2zJhXOWRk3fYNqsYbIM4aoDS0Jkrle91bDdas75EcjqOL1WsinlkQjBIfwkn2xCT3slkjsq6ji00WXZPyp2EJ2/IfT+yHc08lbFzGzGG+6iOjKlDGe++O4kMKrtZH+5Z3UB2ypykN4lNXAa31iU2UhWvNhSkqvhRf04VBUrrBHQJzKekgMuPx8AaJsFvdokO2I1aJdB1PscqcR7k8EKwFl+ueqCJt43Yidm7gDZULdooRM6JlrN0YEVRMn7iBqF0tTxdDX8y2hlaLIRYJ/sP9XX4pCsxuxIrYsZOSwp1jaQyTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvukApYh2cNAgH3afRlUJ4g2tf9O96IyWGdH6wEQuVI=;
 b=LtZ/TGftf1OldBhGmxX4WNZX95WLZBKUOVwNsLmp7PJEFJ51vo2NhIKbJl7vhfYVaDlH974H8hBWK2spoK7M66doSeGHxEW6ZX9vVhZwrklOMeeedJJW/rikgWv9vhUa7zMVFIXRTGv+Hz4hkU9dQMoKKVNeyyotzz9MyjpArTtuTxHbjLe372cDvGeCmMtXOW9uAlZ+4myahyPtMS/Ujdy0YFFPyJU/5pisiK74L2tpmBTrUnh+Ez3P1McnKXVQ5cgCRqlGD6tXSDIg18A3tr2gNXoieT5AckuUagpTvQDHigo+FTyCFIBDTgkyDsULWI0rJ1Oqt7okXrl2nqkSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvukApYh2cNAgH3afRlUJ4g2tf9O96IyWGdH6wEQuVI=;
 b=08egJhvNA681mvp1GF+hlmQ/5jnWE29lkDX38hBsRyWVXS47Utgz/poOgrybmqHGaaOb5VDxP/JGJxJOjdQFUVHsKxCkNh/+o74QZb8hWLeE5MxUVUYx8wsnFKZ38CWHpg7DcSpd/in9B/viOrv8sL9ZPVdA21ZFYHr7YGKgQIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v1] automation: fix xilinx test timeout length
Date: Fri, 23 Aug 2024 19:42:21 -0700
Message-ID: <579230973e3ed60679c003ea2a708ddc6f00c1cc.1724467123.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9af1a0-8bfd-4cfe-2f2d-08dcc3e66ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l/hITl+s3y3P+VCS9rEVyPA/Y3ucmW9k0tWqXCLqU4PQo067N1lZhddS1inu?=
 =?us-ascii?Q?KatH68gD5OOYqwYTUs1JywSc9G6fFj2AWPLkeHV92hclHgiclaWjoTMpqGnd?=
 =?us-ascii?Q?cvsWVCkHdOORvCm+Pwl3OudGCNLp7zzs9cVOGj8yIIXmUXKSianLYi55R2Ec?=
 =?us-ascii?Q?GWOe+b0AP3+fO0FDa7m0JBUDezlP4FC2kc64aJGYZmBmeb6Dy6h6jYcM+4Au?=
 =?us-ascii?Q?tcspaYwqNQ4BsUXWwwEOfbW66TXXEOW0POh5q3oLQ2xWSgbqoG/KB/WIpTb+?=
 =?us-ascii?Q?ZEdVtNTBUmEK8dq9TZgpeCZul1vqcDeV931ZvcjlRIWcWa+97x+yl1zLLStS?=
 =?us-ascii?Q?oe0wzxKf+MjNwYEvNGpa//BSLjUZZVX3/pT14UNED9tkU5ansmIANLEuxToV?=
 =?us-ascii?Q?0I6+FS/SKfiE1pXp4CTyFa13ONZAdb/t1FkjPo25il5xm1KyR46ai7xUUBef?=
 =?us-ascii?Q?WU8DjaUIlFuDi5CueTW2G794yYVAoMEdVMulaSMnfawda/xHPc3vVXGs/8HI?=
 =?us-ascii?Q?NjqDgReFDYl9Bjqg2qpHElw6wLiG1zzaMXf2NF4FeGdDdUAG0lLf5+C9UQo/?=
 =?us-ascii?Q?aoRhhfUJSJJ++7tDIquQpMvpjFmQbLOqKFlSupNC5rqEnh4SfpUINOjTZMNa?=
 =?us-ascii?Q?DoQG8MKuELfBOQZtT/v+5MrN1Le85KqfwKcKJCZMB/dtZbsZw/lhGkJAYjzO?=
 =?us-ascii?Q?A41tNQxA+Id4wxL+nOPRgv9AsGNOR66zZai3PNd7gVxjDQIoSF5E1As0Ebql?=
 =?us-ascii?Q?RUjCV/unfgW8JslJD5DM0BWDrrS4mRNYMeg+xQkCoK36Zd5fvrE0nYt49JH4?=
 =?us-ascii?Q?ZuXhPfFbPmMTSPJcmVZhWM3NMKFly1abB6WrbtvKv+T6KIG3HJUz86NSzIQe?=
 =?us-ascii?Q?YC9/668Oy/2eZvTMVqhuZnxEMF8pLP03Qop6sQmlvU4tsvV6yMRI4O1KSDJD?=
 =?us-ascii?Q?yP44XEnlOdaucrGT2LycmPx2ryYrJmr0hL/VUcRw91NNhmnDRKvBBGT75v3k?=
 =?us-ascii?Q?7v0X1xJhrgTamdLdaCJOpSDVeRVlVjvEWTIaZwTvc4gyHRO9p3d1DrRwDJCN?=
 =?us-ascii?Q?2Nr7PlJ44x0SQ/DLruo60m1gCWGp0LNGT/A2rTBp3BYLf9TnF0RguyWJPjb3?=
 =?us-ascii?Q?J9WvNOx9Aq7qxNAIcBHbjt0XCoz6f9TQEYVqGSssP50/eoQRGtp4s9pYTQea?=
 =?us-ascii?Q?ChMjonpctJQiA6D0SDou6w9zTS8SkZSlwBKBbk9LiV3euXiKjIH9G/CR6iE0?=
 =?us-ascii?Q?AjQh+UUQHGJk4I3TCbkTPyIct5nc+f7yU4Jrr/4Q/BfxkcaypMv5O1plyqSn?=
 =?us-ascii?Q?RkYTnezPIJRwo5mNs/DZvVaYi8vksxCkJZxRJCLD89GUiGyqN2SRoDkAp5mK?=
 =?us-ascii?Q?8eXEGjyyJGtyvUq6faAdx6YtXtwk3WiArl3fpHJa1WqnweQxofLgjlbIFgmT?=
 =?us-ascii?Q?zr+gXojqx9JEX9X9MFrFKLr3l4QY/Rmc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 02:42:37.9916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9af1a0-8bfd-4cfe-2f2d-08dcc3e66ac8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904

From: Victor Lira <victorm.lira@amd.com>

The timout is too short which causes the test to sometimes fail.

---
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 4559e2b9ee..2b4d5f6af8 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -27,7 +27,7 @@ memory = 512
 vif = [ "bridge=xenbr0", ]
 disk = [ ]
 '
-TIMEOUT_SECONDS=200
+TIMEOUT_SECONDS=300

 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
--
2.37.6


