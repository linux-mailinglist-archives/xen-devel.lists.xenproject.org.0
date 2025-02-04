Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9CA27B19
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881797.1291982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX0-0005KN-JP; Tue, 04 Feb 2025 19:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881797.1291982; Tue, 04 Feb 2025 19:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOX0-0005HL-EG; Tue, 04 Feb 2025 19:24:22 +0000
Received: by outflank-mailman (input) for mailman id 881797;
 Tue, 04 Feb 2025 19:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZU+7=U3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tfOWz-0004nP-F0
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:24:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2418::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12ee7db-e32d-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 20:24:19 +0100 (CET)
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Tue, 4 Feb
 2025 19:24:15 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::88) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Tue,
 4 Feb 2025 19:24:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 19:24:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:14 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 13:24:14 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Feb 2025 13:24:13 -0600
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
X-Inumbo-ID: a12ee7db-e32d-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FR8O5W0HqihgRki0cgG+k7jj/qvaHwCnJgq2D0exTldrwbZcUbaH6OTjUfJuvH1YZvJQcfrBo9zdSY+I3uBLADGdkT3HqJGRrfsNbuTzxjzbiR1Uxa2Qdf/a0D1ergn3vpXdLa7tMfg9cqdk9R0xKUHIwFKGIrYr4wttra6b32SudPTz6AnyqYw/yDTc0XfOIbdgR8MQJWOM5HSTZoNyNfSzMUcDp6m4Wo4hg5+97UC6mqShiLKddGaqJihNuVHtHxv3X5yeQgrg4mLAb+shBwQPi+DXWhPQpdXZtSWo9pJkQFV5YQxVaIOSTwqCKPbpz0aSK4dl3h7RBqbJhpIytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaDj9A1dHrYS2o7s2ZFeD6vHr6ZkJxFrI1AZiL0c6gs=;
 b=n2us8eId2FNCDQfHRYxBaSqb+PPSI+rVfGdaCp2H2XNMDHgZK5UxldYQjlElEZMMht/hYjwAwxggSL+eARDsDknhrwc4ePd7yP3HGAAvY7YSfXc3w9rmbbws67SF/EJpkB9Wn1iSAbnGQz6Tpl5y0CPg0Vu1XQXqfks2D6cFaZIPSIaBpCY2aCNApvsV/p8zCB2A5HWWT1iAxyNhU4ed/PoYK6WNa0DXskN8Ql1HKuD5cIIsWfCWEvrAUjco6xmPv//DXJVgcF/1gRmDfQ+x7l1SKr/1dVGTfWjMI8ywX9DMeBVmAoxVyuNZpH8p+fchJfgWSk/65dmUW7sK8CKlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaDj9A1dHrYS2o7s2ZFeD6vHr6ZkJxFrI1AZiL0c6gs=;
 b=lMP+12Iuh95I3H/hVCF6HK8d6dCVpMbf4GxKdEhfYVO0e+vUpw/u3bgVvnS3Jf2LOZSnguP8gg+V0zaep2dLpsk30jq/xJQjhGNsvzGdaBE5sUbZI8YTXX2p5KP6919qNg0R+T+nEmvyulb42Gx8Hivn/8or7TTMGsvHhCMopnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] xen/arm: mpu: Enclose access to MMU specific registers under CONFIG_MMU (arm32)
Date: Tue, 4 Feb 2025 19:23:54 +0000
Message-ID: <20250204192357.1862264-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 839b41fc-e994-4f18-77c1-08dd45518327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KfpJ3609XT3ml9YvxDCoXhveZm8IkAoSiCVz9xJbW3MZCLWlK6D8YBtWLOUA?=
 =?us-ascii?Q?lVHGO92dlp/7evs4ulsUqsWiPI77X5E3KYuAruq/6Uun4VAW8OaLk/vR72Sq?=
 =?us-ascii?Q?EO98Y9SVEIaX8K9HILTK9shGhFDneU61gfrcoPkA000wAghllN05XvZlTwyk?=
 =?us-ascii?Q?YBj/0WNpdC8zKvilC6j0uA64r/YyqbybTnqcX1KZMjWfuP8zbwNF0ybg1JqS?=
 =?us-ascii?Q?94rejqZueUkrYjIeINKfTRIvAWbv1Iu4queheO9PLzxBpNSaSBbO3tQAKAdw?=
 =?us-ascii?Q?jR+2wzslcQmQm+psuFqGjeuA33rqvLE1dpC7Mhc4j4xi3WNHs+F9RJLHGQTu?=
 =?us-ascii?Q?h1FCt+vxBuzUD5zLjEBXS+/PFvO2kTFxByauAFzMhXWRprLLgHtF4VZIF5Zi?=
 =?us-ascii?Q?HKV29b570XlUvjtYjPz9TLTfP9+eudIis7y8u3JAOyvrscAh0w5lOrLC7+kw?=
 =?us-ascii?Q?7nEAEwDdIRQ9qsnXTCXsdFzl6mGQ2OcQ/XyMwBxxytf/Uh9OTnRcOsjNa/Ic?=
 =?us-ascii?Q?e02zdXRNCUioErXpXBppoTGcO0nt2uPwJlnTdmYO6g9ve5HE6j3etHt1ybOi?=
 =?us-ascii?Q?JiApTcQU529YjtuJAl/CQv3vjBNIL4++YjMAJrqYXCd1JmVo0GTHfLJ85HFL?=
 =?us-ascii?Q?tXDHtI+FbyxOV7gfzW4iLCBNTg+V76QoH/ywqtnSlrnLJ/6t813zL6EWFrhi?=
 =?us-ascii?Q?XBzSlnfFhfeyv+7mmB5l1bqGtFsiLIKqxfC7MGLsvzfPbac3U/nYtP/QHBbg?=
 =?us-ascii?Q?Pm+wuJssjl7aTMbt2aTJu0zcmLctfHJfPCPKeLm0cgo9J612Psrh++zuKJ/g?=
 =?us-ascii?Q?N0DaGZ+FsoUOtmmvfLijBtYfVC6xyhhBPK0q2bM6Up1kPL3xh63dCsUw20eP?=
 =?us-ascii?Q?bug1hx/bdj0drhxU7oUrqIACmrIjW6aadwFAxgi7thul0LSIJKPqN1jPHZUn?=
 =?us-ascii?Q?0M7cMzCd9dHz3lh6sjqmgZcPMbV9LM/Z+bzcV5slcq3+iCIn1CHGgpuvZV2J?=
 =?us-ascii?Q?x5vx6hZTU2YGI/IiwmD33oQ20fT4vwzv60ZetKvcwKC2g7TANZI66NC1JlxR?=
 =?us-ascii?Q?Hyyic9P92ThG0hzdmlfcROGXGg5Yf8tEB6iCrUz65XC/WFUNFXnRtu4WoUuF?=
 =?us-ascii?Q?hsIjKvnZwqy56KNNGGwVN1mhA/TJ23TGKY7GpnXJ7jApVp1QWKNstrIlFjvM?=
 =?us-ascii?Q?IPP+9jp5ogrw0sUUD5rlSZrjH5eI94yGx4cuaI/xwAtRHxQtp263A+5VhlBr?=
 =?us-ascii?Q?kBfF2Ctk04v4EBze63YpMF7hB8/mAxaVg8j7jKRzDj+2SPuzwmGdJHPHCV9d?=
 =?us-ascii?Q?v5qBy2fh8dQfjrzii/BbOi4mwo4jCiuDDl90ZVo2zSrVUHi5/Fy9vSqPnMyq?=
 =?us-ascii?Q?POisfs5ErbPMYmlOBdDEi3Kc5jMnxlqy1I1TsoTQvOqulmAOseDcMqIukm5C?=
 =?us-ascii?Q?TE+2CyRRjSy3X1xdbCaIOGdLt2pdUlTnW19WnXaO2ob8uENd/L2v/ignUWh7?=
 =?us-ascii?Q?gU0zRKgNjWDtJ2g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 19:24:14.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 839b41fc-e994-4f18-77c1-08dd45518327
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812

All the EL2 MMU specific registers in head.S are enclosed within CONFIG_MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 4ff5c220bc..1d0f84b18f 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -224,6 +224,7 @@ cpu_init_done:
         mcr   CP32(r0, HMAIR0)
         mcr   CP32(r1, HMAIR1)
 
+#ifdef CONFIG_MMU
         /*
          * Set up the HTCR:
          * PT walks use Inner-Shareable accesses,
@@ -232,6 +233,7 @@ cpu_init_done:
          */
         mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
         mcr   CP32(r0, HTCR)
+#endif
 
         mov_w r0, HSCTLR_SET
         mcr   CP32(r0, HSCTLR)
-- 
2.25.1


