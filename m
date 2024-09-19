Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE897C82E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800599.1210552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfE-0004KI-Nx; Thu, 19 Sep 2024 10:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800599.1210552; Thu, 19 Sep 2024 10:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfE-0004HM-KT; Thu, 19 Sep 2024 10:45:32 +0000
Received: by outflank-mailman (input) for mailman id 800599;
 Thu, 19 Sep 2024 10:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9goU=QR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1srEfC-00043V-Sf
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:45:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48ee939a-7674-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 12:45:28 +0200 (CEST)
Received: from MW4PR03CA0345.namprd03.prod.outlook.com (2603:10b6:303:dc::20)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 10:45:23 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::ea) by MW4PR03CA0345.outlook.office365.com
 (2603:10b6:303:dc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 19 Sep 2024 10:45:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 10:45:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:22 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 05:45:21 -0500
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
X-Inumbo-ID: 48ee939a-7674-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVKZMbu0d4kxDPoLiPDirlr79T+vjcV8r8GWaHR0S0WczbBejICVB8TT4VGXBG3svNM9wcfUNpTitp2Kn9yo3tH+WMoDrP8VtAfu/RuWS8I4CmdfjWBInF98bBAM7Nl6ypHzzB17fuIWzjcoN1yWNn5+01c3Zt2Dj6G4hwHqFHtiipz/jyxNbl4Is23bGOCOKnfCzKjYDuhzd0BjOE2n3o3xPhmxBUEKWH0e3VqDgBdo1GneV5fhOf7QmUPwx9/A29pzps0b494v2OXi3BwaHP2/Y5YCMrmPQREiLGiyyo1PPnQ/jloWe8Kd6rd8N/K2xLxjfyq0H0jLRJ+7BPQyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a8d8Dmwmijg24rkMyGYaLxqRaF0Hxcf7ag2CMKmCKk=;
 b=Uer9SpeXdmutUf2Wo9TwEx0opDpxSOJoKWL/nSoWQP4pZu/oHYLwQ5bfdMx0OFKBVst5Zj5yt7DpfJMDji2k6H74seZSZK5YlPAo9bANDwxHZ8qNXMSFXf0770pESYzo6tUuOrgE7vplXbaZ1tHCGr0Fz/6A/cb29u9Rhs9GOqmZQA3/7Yj5cXxHYsDIU9wClGep+J+Wpj3SCYVukpLfKwWlka4WZwO7bk/3U4IebdCtvbRsCPLNpD0pSwYWpR8TgH9PbJnlWUH3mJ9HBGjIep0+fIGeApAPAAWTQO+W3L0H+wKzTQLhbruqFCmSdLz01So6EKSOVCSTG2JB14WMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5a8d8Dmwmijg24rkMyGYaLxqRaF0Hxcf7ag2CMKmCKk=;
 b=mCLRoTMOXs7b/8TvNgJ9UP4BdB6GXSCBlCn7OL+1nAf+maq0SSYo0/962661oWMCXp89PZRw4adtQ/0J6A2WNAIYEVwTqlog4LWx9PZGWr/MTP76vU+iHdE6JOn7nOFmxnLZkpjBNFVsVbi8DKxdX0i36DH+mhmg9S3ZTTFjVXg=
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
Subject: [PATCH 2/4] device-tree: Remove __init from unflatten_dt_alloc()
Date: Thu, 19 Sep 2024 12:42:36 +0200
Message-ID: <20240919104238.232704-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.37.6
In-Reply-To: <20240919104238.232704-1-michal.orzel@amd.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d06a8f-ba17-4984-4760-08dcd8982a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aDgpht7bjY6vIERjxIgsV5GedP5BOMFbMM4eKxqm1LoSbMNi4faVG4ya08Bn?=
 =?us-ascii?Q?ZtF8cUsTbuIM0mnTne2hRoXDkDV1sXYJqA8+LhFNQvv4nDFN7AJGdV6y/t+Z?=
 =?us-ascii?Q?Xr/VXFeoBL13ce0EUSkIfS2zoq/b/ZFk/2DRGllaWROqtO7kLDrLPQY56750?=
 =?us-ascii?Q?gE9cDty2Cyzf8bk3mHKpKLYvzpDiHFqzj5SRAOO2nLSZS8AUoBIXgUYf0+d9?=
 =?us-ascii?Q?033m6Yk3Q11cqj0SVivPhM+uSakzMHcfDH129iKhQKxbwLgcCWVeDv0WhM4p?=
 =?us-ascii?Q?vldSIfCeh9Er0812FXDhdMyNLIu1vO8//EPMAv28jsiMpgLzl3Q5bC2gDd9f?=
 =?us-ascii?Q?9SGYrpWO4UPPtrAWUjOmjrG02WmxlVnmewcPmcU6FAFHQnjL7OOIxhIAGPQb?=
 =?us-ascii?Q?URoUbLgB466ijyJMoOC06H7xnxIn07pskiHjAFdsMJMPbrdU/z6hUADPBxpJ?=
 =?us-ascii?Q?Fk6OuS7eq1Cy5Xt8l7GRhqrshaXrF9zN2XB3tvHGrOvfvu/KabekaysSv9tW?=
 =?us-ascii?Q?XC4QKVQ9T+TrsIYOPx2mThuEUBV23EHEvSt+vVjlKyI91sb1ZYImzUcVecHf?=
 =?us-ascii?Q?a2W4PDcyZlPLf6vcx152umFqe7XIPBCXGLR6Oged1XjzQd1Ncxj3J+rwogJr?=
 =?us-ascii?Q?mT2q9GQLaeCj837OQBRky2GwlG3XWNNSuWRxjlJ/XSa8dw4qoiVa4yJMaAip?=
 =?us-ascii?Q?UozwDUw0KvUuuUInLTNT1E4kET//8ufzhi4FBlWBsuJXkjxxSMCBQH8ht/q+?=
 =?us-ascii?Q?W8KVW4S2NXWwFNewFuhnNwAaB0DL9fTlS0CxmKc4Z2Zeq3Mwb33bUrPKVrX4?=
 =?us-ascii?Q?Hl2YQDds4HtweEy8TnurwtnZkxMc95Wv7Ir7RSJ/hbQfM7DR6bBXfLRom1qx?=
 =?us-ascii?Q?o2evVgMm8i0+oiVEsdTdVQvcOf6wsXvEBgydWtaYVr1cebJ+RowY/+nBrEmF?=
 =?us-ascii?Q?b5or95tEBltGMwXz4fso7Q9h3WJ6XxSIEXesK0Gwqba49dJ6K8bLO0JnFFz5?=
 =?us-ascii?Q?kvI4Mgha0RMQ80R9M8Mftg91su8bEquDi15RzHsT58c1ut4M0zF/jh2L0Sgy?=
 =?us-ascii?Q?Zol7BC0krdGsrt7RpIjCbhCv84JviLvO8y5ATB7NpZjcGCqID9xu2o4oG7i3?=
 =?us-ascii?Q?tmCEZeWEm0A0ayJPO/4ycf1SI3UojRNwXgfFi1eHy61Z9l5UQFz9C4kQ9CQK?=
 =?us-ascii?Q?rmzEt9dyZaWoy/b1Bj4wabZGCIbLdwtY+StbDaMPqP49/7OtjB04RIqTfDE/?=
 =?us-ascii?Q?b7CrSPIWEE7Slsg2mTm/lMZSyCdDkkeqsLqRbKFRwRyzkCJ4fJhTPgm0r1wO?=
 =?us-ascii?Q?cyyXdAwYpFwSrw6nG78CeBJcDWJapqqTE/MT54K4xkkxoWQjI8modh5m7FvT?=
 =?us-ascii?Q?1vjxWUBAswTu6Luk4DTeMRHR6leyL2BvJ5utwWLG28CH2bGzVE1b3k9vAXGf?=
 =?us-ascii?Q?6aByYN07K9TPKkXAVdCGnlLlPPCl7V85?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:45:23.2509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d06a8f-ba17-4984-4760-08dcd8982a2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877

With CONFIG_OVERLAY_DTB=y, unflatten_dt_alloc() is used as part of
unflatten_dt_node() used during runtime. In case of a binary compiled
such as unflatten_dt_alloc() does not get inlined (e.g. using -Og),
attempt to add an overlay to Xen (xl dt-overlay add) results in a crash.

(XEN) Instruction Abort Trap. Syndrome=0x7
(XEN) Walking Hypervisor VA 0xa00002c8cc0 on CPU2 via TTBR 0x0000000040340000
(XEN) 0TH[0x014] = 0x4033ff7f
(XEN) 1ST[0x000] = 0x4033ef7f
(XEN) 2ND[0x001] = 0x4000004033af7f
(XEN) 3RD[0x0c8] = 0x0
(XEN) CPU2: Unexpected Trap: Instruction Abort
(XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<00000a00002c8cc0>] 00000a00002c8cc0 (PC)
(XEN)    [<00000a0000202410>] device-tree.c#unflatten_dt_node+0xd0/0x504 (LR)
(XEN)    [<00000a0000204484>] unflatten_device_tree+0x54/0x1a0
(XEN)    [<00000a000020800c>] dt-overlay.c#handle_add_overlay_nodes+0x290/0x3d4
(XEN)    [<00000a0000208360>] dt_overlay_sysctl+0x8c/0x110
(XEN)    [<00000a000027714c>] arch_do_sysctl+0x1c/0x2c

Fixes: 9e9d2c079dc4 ("xen/arm/device: Remove __init from function type")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/device-tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 8d1017a49d80..d0528c582565 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -120,8 +120,8 @@ void dt_child_set_range(__be32 **cellp, int addrcells, int sizecells,
     dt_set_cell(cellp, sizecells, size);
 }
 
-static void __init *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
-                                       unsigned long align)
+static void *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
+                                unsigned long align)
 {
     void *res;
 
-- 
2.37.6


