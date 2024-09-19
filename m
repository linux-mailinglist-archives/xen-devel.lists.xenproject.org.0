Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE397C82D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 12:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800598.1210539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfC-0003vg-En; Thu, 19 Sep 2024 10:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800598.1210539; Thu, 19 Sep 2024 10:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srEfC-0003q6-Aw; Thu, 19 Sep 2024 10:45:30 +0000
Received: by outflank-mailman (input) for mailman id 800598;
 Thu, 19 Sep 2024 10:45:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9goU=QR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1srEfB-0003mj-72
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 10:45:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2417::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47174829-7674-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 12:45:27 +0200 (CEST)
Received: from MW4PR03CA0340.namprd03.prod.outlook.com (2603:10b6:303:dc::15)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 10:45:22 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::1e) by MW4PR03CA0340.outlook.office365.com
 (2603:10b6:303:dc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Thu, 19 Sep 2024 10:45:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 10:45:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 05:45:20 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 19 Sep 2024 05:45:19 -0500
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
X-Inumbo-ID: 47174829-7674-11ef-a0b8-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mA/8UfRpvJfEq9R7JuJDSanIX8RPEfSButTdJdmnfnwDRUd+yageOSM8fvfrX4pu+4Va6d5tsEUCHtTUioqywogJfl4hxxlSIXJDdo3mCCXb5wW++vm13S+vX7dMCnwP7olhqx65EWn20QCc/NHx0JmZM50sKJW9+8oplIs5bzP0D48isxuE0WJLUlju6H7p5MMtxFDw9QQLKNEGr4IhRjemoJ1mUeD4ag4wc77Na2StUo0zPtvJ/58x5mWOo5iFWDYIIfPnm6mTdalFiz9vN3UnTMdGIjjdB7RLwlfB29KHly84hEjXJOe88xOBdn5kSJioZO+KqBvA8jb42dnv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG9/qkw06hz698vVlrpLqB28KmGhGXJBzIpoErUxTEs=;
 b=rvNvMq5GNERdeyUjLcl5k0ATVX8vnoT7J/ubBpIVlNdjKzO55RP+IrteTTdPyAmc6CrlRMs+LH+myDR5LXPFYcedz2484UnZL9YK89M5rpBVAdX/7Og3ccv7NIBkz2VGRFpw1Zf4J/uCMC5nK8ZuoovIh+4oVbr9PA0sG66MF2Vcr2ydww97Tat9PjmnbsxDM9ndIdQ578tJToyZYeR2+eHXGP6p1pCKqm+afw4y3wBA87zwDaqdZFNglrDSJyyHZSat2sTMrceshJOWRa7CgoGaRJQ8604+5GdO3rJjKmJATv8uR93qq1wj6oUd/vyCtBxQwwatGYRnb1Ad0FZDzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG9/qkw06hz698vVlrpLqB28KmGhGXJBzIpoErUxTEs=;
 b=2Jrp15IZY01T5u7O1sYBsKWaKvvu94AHNw+JGNMZcxn7Eu2VYDYv9CDt9UUHnOCGsWfLlVagOo7Drk94lx26gM9ECiOoyMfeyjCLyBCzttvCSiq/poYuTvuqtUPm3f7ExBnXFtLmTlkejaquMEZkMJ0ey70Rk0MEQnq1GRTjbGw=
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
Subject: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
Date: Thu, 19 Sep 2024 12:42:35 +0200
Message-ID: <20240919104238.232704-2-michal.orzel@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bf68ea-8048-46c0-fd96-08dcd89829c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Df9YzRg1mcLliC7ppPEdo1Fm233dNCqyeF8qAf9evuJhVVsC89tAmb7akcF8?=
 =?us-ascii?Q?Fszo/zXSBmKQ/OiGAhtarnB7CA+meySgD60p2+S8PzioBMgF5p5w7sfZOGhy?=
 =?us-ascii?Q?/2WzwNRxqLqxuseDTHmdK6rDxr1as6CL8K6/YVrj8+W+RAsyfZv2BvLiQB+o?=
 =?us-ascii?Q?7DOBm/RK7IpuhsNB/OOlMjq+z7xyL8kpWwMrHMTD088fokW/bhlLh77AntC0?=
 =?us-ascii?Q?pU7WU819nMP6NPfOGy6fpCqHNov8mLtWkC9V8YJPGm1ypAxwd5kavfv+UxYl?=
 =?us-ascii?Q?i+qvuAUQrO9epqBeQYjKVqKhf5I33e5L93UD5XSDNuoHbzdg7xZZTDWEir5b?=
 =?us-ascii?Q?4eUTvszMAFTLcnJf/qqF1mgNyuF0i2OqlaEzJht+rppGTnXmZkU6cLEBRl1L?=
 =?us-ascii?Q?CMxAA5+BFamMEtaWEoKGvdSezfg7E6ZDtmzYQh7teN4dHFIeBjXOFgKnTkU+?=
 =?us-ascii?Q?Muds9DcxoR30zHyy14oBLjnFScWW5tCxjFCpYyXHWAVry5/GLGVmpaSJ5lsu?=
 =?us-ascii?Q?XlkWvIyFZZaVa3JopPxIpOjfw78xt33qH8eVY6WwJZyXqgrWoeYAvoyFRLgF?=
 =?us-ascii?Q?5TOqMuRtWgoms6rEMgQ7Yr7TWbjAHLSy0Ov4JjXNWpUI9JcBztlNKBXzcFkF?=
 =?us-ascii?Q?45IwFDF9GUqUX0ROk+plhP/rqEjws3p7PE/2NQTD1QgroJ1S/CcdUltN1U1/?=
 =?us-ascii?Q?kQKCMUxgBTjb8NTNknETQ62wH8r/YZe7tLWGDot+ksmYplYXwCOQw5lOorAl?=
 =?us-ascii?Q?L26akQPvz2LKcjrAfPvqnhSYjwb7vbeiGbk+b20BWpooWf+5oEWas1v922rj?=
 =?us-ascii?Q?ecfgSPlpiNB4XQiO7S98jNq2TliHKVhsXvZ6Nv+yQXruV/0P/Q3j3UQbmChQ?=
 =?us-ascii?Q?PygS95uxydRDqkgPdQlZhWgoHvUlks7d4kQgzxfWGPe02x3IvpgDLK7DoZv/?=
 =?us-ascii?Q?qDbFnoPwplRHpRtig/b/zkxj5qD5k/T/oC0tV9JrUuYs9DNB6qgtFAxpZa0w?=
 =?us-ascii?Q?thYsK+8cQfyPKlurWm9UOzWlkEJMpg3ig7qDPaZVPVPt2wk+9KAspf5BgRfb?=
 =?us-ascii?Q?ztzjFDJQiL3y2oLDeYOVR1UuFimCrjeAD03wT4muUMabAwl/ExzA9Mx3kudZ?=
 =?us-ascii?Q?uULlYLskj0hDzpmtzhG2rymdj2kXHyf2WkGhLVyaesDPaU1LvRFq2jpVdW2L?=
 =?us-ascii?Q?B+jkv+/BSauBdWMGUW4HQpuTb3BOnqQ6MHfHvdnhx1Q9aYRt1o/0crCfNNR+?=
 =?us-ascii?Q?9NAhHjaBCtoRbokfR+ejWCLRGKtK1x2XNvAALeUEENXpyG6NEGT2VQu423oY?=
 =?us-ascii?Q?FxUT5n6bkID6h+hhJ5rDyj15x2Fgrm5Pt4Moh0IkJSRI89FAkxkNOtBv2w34?=
 =?us-ascii?Q?bUFIcpc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 10:45:22.4697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bf68ea-8048-46c0-fd96-08dcd89829c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353

Attempt to attach an overlay (xl dt-overlay attach) to a domain without
first adding this overlay to Xen (xl dt-overlay add) results in an
overlay track entry being NULL in handle_attach_overlay_nodes(). This
leads to NULL pointer dereference and the following data abort crash:

(XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
(XEN) Data Abort Trap. Syndrome=0x5
(XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
(XEN) 0TH[0x000] = 0x46940f7f
(XEN) 1ST[0x000] = 0x0
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
...
(XEN) Xen call trace:
(XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
(XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
(XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328

Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/dt-overlay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index d53b4706cd2f..8606b14d1e8e 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
  out:
     spin_unlock(&overlay_lock);
 
-    rangeset_destroy(entry->irq_ranges);
-    rangeset_destroy(entry->iomem_ranges);
+    if ( entry )
+    {
+        rangeset_destroy(entry->irq_ranges);
+        rangeset_destroy(entry->iomem_ranges);
+    }
 
     return rc;
 }
-- 
2.37.6


