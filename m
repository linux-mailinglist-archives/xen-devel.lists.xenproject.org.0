Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0CA4BA05
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899952.1307883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bk-0003Iw-M2; Mon, 03 Mar 2025 08:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899952.1307883; Mon, 03 Mar 2025 08:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1bk-0003GS-HY; Mon, 03 Mar 2025 08:57:04 +0000
Received: by outflank-mailman (input) for mailman id 899952;
 Mon, 03 Mar 2025 08:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp1bi-0003Dc-NB
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:57:02 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 777991d9-f80d-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 09:57:01 +0100 (CET)
Received: from BL0PR0102CA0025.prod.exchangelabs.com (2603:10b6:207:18::38) by
 SJ0PR12MB6759.namprd12.prod.outlook.com (2603:10b6:a03:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 08:56:56 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::b5) by BL0PR0102CA0025.outlook.office365.com
 (2603:10b6:207:18::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Mon,
 3 Mar 2025 08:56:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 08:56:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 02:56:54 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 3 Mar 2025 02:56:53 -0600
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
X-Inumbo-ID: 777991d9-f80d-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEYjS1c+JWtBfF765rbGRaNCNN7onW5C78ja+aJgZfEhyWXzZ3Puz5LAGJuwPBrEzssT1rJfTkgmcBC/wHxiykw+KARlqNgA4Ke5A8mkydoU1sq3Yw9cUAEqh97NNSVgnd2UCIsusWkoGiALPm6UHOT81KPiorQGEN9a6+tSXQr08th98ERgQoXlVNMTPjtnHzVxcneWbhJD9pPXMtwt+uWZorczExwdcGRnpwDlbaS4WxpwYaE4fGMyXVE318YZdSAnzr17i8GloHteo/har2NeKpDalKpDRHROVDtQsnPmfvl/lSQJJJ+IUoJcG4Axwu5FqITOUC68c979dd02rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNJtj4GaA/ZHBC8mq/llWZAHZbNtifMc8lhwMOPIjDA=;
 b=LAitw6zphPQyLjqY1LTSF47Zpw9Ja9EhJDjDipFeLWJmhOkNzlw5M1sdLF/Gtxvpy7cIKCl6mx43Gxf7grvgtkKadH6nsF2iv1/H0nMo79ocVylXX6WNLYsImDEh7X/1kY3Be51fTGRqzO2pTAQYtZhbhi+KgTuqyDNT7fsZL5v4Qod+7v2AncUIiFv5h3WXdESRlCE8HHt1nlrDYv9owTdpaje6udHIiPhZ81xE/PgEylcbDzudWf5T5tAmQsHIPT0k7vU6/h/i8Kyd45T5A899Bx2syq524Jp020hyTBsKhQJvxmJhaNCkVM9Wnt7xkahsgn9IxJ6yqYvq9ibXWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNJtj4GaA/ZHBC8mq/llWZAHZbNtifMc8lhwMOPIjDA=;
 b=Ct75Kiq2lj5xjqljnVLQCCVRUiqCQ+kGqnxCZlb4FYzg7FWoWkisI4LQeLzv5a3b9g0GWbu4sZyJ5JTUg/jbhWU41wRDKJ6DJuwRag9sPX5bX79S0zh3VDMsPoBtu5G2CURgILwcCiJlBjww/JrZOnLSt4JN5VbOYNopv/qrn5E=
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
Subject: [PATCH 1/4] xen/arm: dm: Bail out if padding != 0 for XEN_DMOP_set_irq_level
Date: Mon, 3 Mar 2025 09:56:47 +0100
Message-ID: <20250303085650.74098-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250303085650.74098-1-michal.orzel@amd.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SJ0PR12MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: eafa3283-0eea-4c06-b2a0-08dd5a315937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LZ3V5Mu62SEglpJqaxZzBKB7VbTR6rm2Yo/4NKdNeKV1GpwAUiSRZVEdJAbg?=
 =?us-ascii?Q?rPELB7MTpFaTjrNmkPB7p9KaL2hINJO3Rmb9xnwQVJsSJFYNFzPD8ebQrJpj?=
 =?us-ascii?Q?uKXBCOXwjLud2W5ilqh10VoNnP+wSkfwv6h22+BPUap+5tHStrgRfGPpm3cU?=
 =?us-ascii?Q?FBcFKWCGscbmNq2/AzZIS/wCaXUjej0KYwvz9qx+kKfR6Qp1yrgIa30fSzUh?=
 =?us-ascii?Q?VZs4HSyFhMIkdHclNtg3oIMvKapc6buxHyvM1UGMuXO3+aFhevjN8EeKx8W5?=
 =?us-ascii?Q?QHC0oErKYTvmzVnvyfdJntstoxb06cFCk02WpdxB68QG8OCO6bN/ZudCwn7o?=
 =?us-ascii?Q?QB5LnINlRRrw46v9768vJEp++SnBmGqwRVfG0oB5gfa2orWu5jlzR5VuaPzT?=
 =?us-ascii?Q?WhmNl1sBtm6Rlt7crsWg2EB+uo8BOmmkdKO28CQKp8NCq+cFnooc0RQxwH98?=
 =?us-ascii?Q?44eiiTPebc2V6rfuYqmXMnrmOm294wmXrMOfal15NYhAPiUOwFFJdiWD/vxh?=
 =?us-ascii?Q?27fbi+UJvQ6plyfTyXjtcVLO0oYFFUwYRo+wTNrhGYmnMi2yG75kroSZf5y6?=
 =?us-ascii?Q?WlX+PKezteetgNR1FAdjcIO9e9GQvodxu3Sa7LjoPAFlQKXPTX4tGcnMFH2O?=
 =?us-ascii?Q?1s6gBWuDqyZLzfwmZGaPa7W2tj/Cdfee3NiIC/NEvhy0zuxpT9h3l4v9EtT9?=
 =?us-ascii?Q?yunXfeBPtHHXzIvCPQcv0RzeFeLmDxaCtE9+gmwqWyMrnH428uPc/Dfvf4Wi?=
 =?us-ascii?Q?aJiERPqEu6D5eH8ZXIXJNEC97cI0AexzrlZ4nhh7CICMNkpKRWchTfLUEcXw?=
 =?us-ascii?Q?CXTWxsnuAP082yhGWaD/2byrLfNCJ2jQyVqD4VN1a/p2W62tLij/tAO0bRdm?=
 =?us-ascii?Q?m4mZObhXl7nIdqpa4A8ZkSpg/8aKtB3swPJdrrjSuqEvIMHiAxe3MDQOkUbm?=
 =?us-ascii?Q?yOZTuGKU6LAso41A8yZbeEpj147cBGo5UqL6BINGgOnisZwOr8DZxXj3Wynq?=
 =?us-ascii?Q?Gcjc8/1grSNXoXqUm/IzFWGSaSjqXbcyllF1myytQ4lFSxQIcurN/USikHPU?=
 =?us-ascii?Q?2WWgwd9+0iVooII9zLyC02X0Kt0hbC5R4MuhSNlUJlkMkDFYtNNLglhBSUmF?=
 =?us-ascii?Q?QKOo2nGyJ53MEgdNyRThdGh29ky2cKx5sTsdQexv0lDHpa3nk/bF1GtVTG9w?=
 =?us-ascii?Q?8LIt259br5mrup3IyfW9iGdDgUUOtlZbyNMlBprfHPVFUTqIeLPs+I0Fnz4D?=
 =?us-ascii?Q?b+xZk3pvIIgL95g4+iwosnlZJpeMsm4jleJJZHtEr1pBe22Yxex0ltoBTgEo?=
 =?us-ascii?Q?o7i/355xTeLY5JhncYGu75SculAKo8iPN/6p/s+KaU860QZy6OIwt5AczyD8?=
 =?us-ascii?Q?x1oAstZUzT0VKwkNf/wsRffFO+vPVJ4wksCYRgSBcndWFhcj5h8UPaZoJZ+R?=
 =?us-ascii?Q?lhdFy9XSTH+ss9yzuZ7+K0Pahhe2MzuxQAdUOkPlhsJUmgJhS3WsFxySdVAw?=
 =?us-ascii?Q?S5Uqc3SDp3BUEmg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:56:55.2729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafa3283-0eea-4c06-b2a0-08dd5a315937
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6759

XEN_DMOP_set_irq_level operation requires elements of pad array (being
member of xen_dm_op_set_irq_level structure) to be 0. While handling the
hypercall we validate this. If one of the elements is not zero, we set
rc to -EINVAL. At this point we should stop further DM handling and bail
out propagating the error to the caller. However, instead of goto the
code uses break which has basically no meaningful effect. The rc value
is never read and the code continues with the hypercall processing ending
up (possibly) with the interrupt injection. Fix it.

Fixes: 5d752df85f2c ("xen/dm: Introduce xendevicemodel_set_irq_level DM op")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index 773a0a259272..fdb3d967ec98 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -93,7 +93,7 @@ int dm_op(const struct dmop_args *op_args)
             if ( data->pad[i] )
             {
                 rc = -EINVAL;
-                break;
+                goto out;
             }
         }
 
-- 
2.25.1


