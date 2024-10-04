Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29809902DE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810340.1223031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKU-0006BJ-PC; Fri, 04 Oct 2024 12:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810340.1223031; Fri, 04 Oct 2024 12:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKU-00069L-JW; Fri, 04 Oct 2024 12:22:42 +0000
Received: by outflank-mailman (input) for mailman id 810340;
 Fri, 04 Oct 2024 12:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKS-00068r-Ol
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57873b07-824b-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 14:22:38 +0200 (CEST)
Received: from BYAPR02CA0069.namprd02.prod.outlook.com (2603:10b6:a03:54::46)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 12:22:33 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::81) by BYAPR02CA0069.outlook.office365.com
 (2603:10b6:a03:54::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 12:22:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:31 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:30 -0500
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
X-Inumbo-ID: 57873b07-824b-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESM/LCG1VZAqsN8asJu9yydd/nyGBVpU/1Yt2+Fkpv7v+x9Kvmts9RgxRDrwLyWTXznOAZB10RPCbgh9sZokVgSVJ5FgRZfJDC/ejp6CRPh20mvwNGgmeYdHLbL4xcs60nYB2CgNvqX+AD0Uq9PR7katoZu29th0awKdVroZD83zYpk7TRsP5T8Ht3siTJNS0R4NMLs39C3QWl6SGxdhem25C0lSTR0BJGBYcYXxyV+0kM9eLH1W1KERJQGIsctGLfIG7E6iZZ7yLXX5/DpxhglwYRZG6h5AzZfpxdbrog3yvDjTqg9rX8nQogjMiJhV1rDfOxolXDoBj+yDxOC4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yxzb8QUee8LL/UwpSrq/bczqcgMTL0/++EpgLvvFVQ=;
 b=t/RKvrz1KoLaks/J/RfhK0I9bkyJWyYUJexVDs/UHo+LFlYhBIl62my35tn7GjHrAGpegEvSZR7ZZhgL9xiiC+XDyq+yz7tcht0T5mrB+3fuMDj3sJ9ZlPixyy56QTrOoKDqah78EfGphnsKOsWOXAroMMiN94fuD+9RGk1AWj/gPGulFvFI7LXXXoDn1vGB+uzaoLIUWm/Wlid1JXYxzurajPVAzCz262J2lohalFIY+uUhZQ2wJueSBH2COMDmv2LZrxqbxRnQvxKct755bb7z6WW1y6n8ErdbHZfcqOG0f0B52SnD+4yVT9WdlKBXP7A/eAxL90eWMqEV1W2q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yxzb8QUee8LL/UwpSrq/bczqcgMTL0/++EpgLvvFVQ=;
 b=Jq642LNZhyCw/mz/0KadPhLuS49zrQpepT33gzmBtxhLtRN6sMfbCdKlKKyZ0asy7xvnXP0KdSNytH/98GthyRBNlh9lE2NrTr5Fq7ElxA7lZBYVOTiLxfxmSPKK0KFg46TnRm1AT4jcIpsK9S3qjHfiLdNtKHivf1YTyTQNB74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 2/6] device-tree: Remove __init from unflatten_dt_alloc()
Date: Fri, 4 Oct 2024 14:22:16 +0200
Message-ID: <20241004122220.234817-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|CH2PR12MB4261:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9c3f55-3d46-44c7-9ce2-08dce46f395f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ISqzX7YezNUIGeoauTHyZTrIPy5+wvGB6PnRoiwbddtSXoQUi2ECBnKqlLwL?=
 =?us-ascii?Q?IAMXvYntld0yo7NAQEBoyH8rfhdYnsNZlqRtA6hTOXsp4Bj8lE8FwI9AQLyo?=
 =?us-ascii?Q?Q3Mj5Bb+bR2Tt6aww1RbM6VqoQ5rAGLxErWiGa07cBxo1Di3omlp74Kh124z?=
 =?us-ascii?Q?aIKo8cxYhuJHMDgvTxI3EpWwTuNzYun1u8IuZkVggsNRwLy6eeBSC2mBqpda?=
 =?us-ascii?Q?nXQdBiZp3Dc7IBwF0O3LpBU4jjA0HbaDqRRVyzKdPPWaYC3TCKInjYXU+vAn?=
 =?us-ascii?Q?ZITMatFHbeoQFdEd57s37gkayXmLwHG4Na588efEEAorOG7zFOY0xhSMfEwh?=
 =?us-ascii?Q?qBikRjDpGIweO23FLDgkd2B+Y15o28hX8Oxzx1iaZ2yyDzF/8KG2JomBr7vJ?=
 =?us-ascii?Q?b9ZkTS5nUJhvk7yYuauOE2hKWmb5XBjkwKHqmkWy4VbGVmp8jxtwHvDAUvnO?=
 =?us-ascii?Q?p+wkpgcz3J1Q1hEVE+Hd3xoVxNksmDUfEu0haui/7c4/mhvF/cJgy9qEb2SA?=
 =?us-ascii?Q?foamR2zCnAwMj42wsv2OQSVk8BgPUEX2R+SQYX2IQY6LfupulgZGZOkYnwy+?=
 =?us-ascii?Q?6a1TKl+UOD/yR7XtZVkjVYtItkpH9b25mzwNBeFuQTjoLtRI1QTD/YuUJXZa?=
 =?us-ascii?Q?Jfp9pk8KAlRHFAGK9w1G2845qQw7KZWDEeFV4EtLg9kHlWc7E+3FrDlkMb1+?=
 =?us-ascii?Q?JrPS6+/11ff7bPKzLPYnNucSFQR964dHJYsfk5UaWBAjcm01zEBL3BkrZ9Bo?=
 =?us-ascii?Q?qwG/PgXXAdJ6X/3t7PQ0XllE488JGiytPtiGup/Q6vJhiqhF7SQewxCiT6bb?=
 =?us-ascii?Q?ycnwFUi2DqktVv6yiQZTN+uLuQ57tKhmILtlqYWW9K8Af8P4RJLOgkZmVTCv?=
 =?us-ascii?Q?PlsxrIgRfiKLI5NAKz8A/8z+PuFbVn0Vd97U8uI/u0qjbe/DRAxZSiVTnAap?=
 =?us-ascii?Q?dlhE7jbCF3UXv549eu82kFInwpXD7O7IGN0tzT2zrQ/9A7jEO2uNNv7YQS9v?=
 =?us-ascii?Q?acLZYi24xXy3R37ieLUCAucRBlMeXbhicxo2QQSBbAR81Np/4Z/h80uf1sa+?=
 =?us-ascii?Q?OfrxAbJYS1JkV0oEOBgAz2xV2wGOddeC5leL7EtFX9L1yiTiw8pstzMTlBna?=
 =?us-ascii?Q?k15U8rGTwTLnMZJfwFaemtJJnPb5zXw0U8VoFEoHaY37EkvRp7c6vyq5ys6c?=
 =?us-ascii?Q?0KppuSoYo0dSkJOf9JzvTyePPalSsXQUIuAwK7q6wymeJ7c34RrVz5f016DX?=
 =?us-ascii?Q?GGgqDPvj1P0UAbmZ3K8sHyimUPeuMwPE4kR20XANbLMrnahzcc06GZJE0q+f?=
 =?us-ascii?Q?EW+Axmei11r8b+uFWCr0Vh6YXLinkEcv9H91kFkET4z01QxoNmFrbITeL4IE?=
 =?us-ascii?Q?F0LDxjY3q9nWGuGo+dYpNDIjsciC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:33.3431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9c3f55-3d46-44c7-9ce2-08dce46f395f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
 - Add Rb
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
2.25.1


