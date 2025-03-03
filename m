Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A173A4BA04
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 09:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899956.1307917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1br-0004Jp-Ey; Mon, 03 Mar 2025 08:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899956.1307917; Mon, 03 Mar 2025 08:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1br-0004GM-BK; Mon, 03 Mar 2025 08:57:11 +0000
Received: by outflank-mailman (input) for mailman id 899956;
 Mon, 03 Mar 2025 08:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp1bq-0003Dc-AV
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 08:57:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2412::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77cfd9d9-f80d-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 09:57:01 +0100 (CET)
Received: from BL0PR0102CA0004.prod.exchangelabs.com (2603:10b6:207:18::17) by
 DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.23; Mon, 3 Mar 2025 08:56:56 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:207:18:cafe::92) by BL0PR0102CA0004.outlook.office365.com
 (2603:10b6:207:18::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.24 via Frontend Transport; Mon,
 3 Mar 2025 08:56:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Mon, 3 Mar 2025 08:56:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Mar
 2025 02:56:56 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 3 Mar 2025 02:56:55 -0600
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
X-Inumbo-ID: 77cfd9d9-f80d-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFcLwWoBsGkHznhuNS592/YvGst0L8lQYXGjQkf79yHfk/W77blGRcgZ6cZgGPOAdIroIXSnJTPGWOypNjIPnhGb8zfozj6szve/K/qXYoRCxc8+iOtjyBz6skRNai6O/4GYMRQouZmA8hiXu6TAiben+m9XpLG53SZidL0i8EOcDICmI2+FjCMyRxI/QZyGoeWZRcvSufxCesktUdeSI2VXDQ5gVE0UeBLJqUDa1oTg4IwnMRxRw2P2T3DEnhM+gmeQjPIJpO6UTe4TxLRqxWzJy7J7R16JHuU9+D7xo8rYRgd+sUEtReizJYFyDoBzzn/y1OPJGqYBi8AKdfiWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OufWKULnetNUAK9GTpERGyY8WgmttM8kb3z75tr7XYs=;
 b=tuCTZJpt2z4NZqj2j7Xv8ioAIww+4hLRMjtCjt2SxoPOfYpolyA66GyGkHRqW1smqv7e3PC+I+GgO6CZ5gwdDYSAlOW+jzrJJ1plf9j4E7/RndBLON+fMtX68bbCLU/jK+xR/S9UeiyY1Qc75dDZ+VRl3qgoe4sM608RNsErptye22YK0DAnXqw/frYcDbMWoL7xoVienumViR760ThPMkE/74KrVbuA9vMYlZAcmeXr82DVPGDp/ylCytcoyTGzgBWfX4E3qc4gsxqNWxIOo09l3GJD2lADYIrjUI+axYHQeVQ5mSqNUdm+W+H5I9tMRycTOQETw/SqvYR4REsgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OufWKULnetNUAK9GTpERGyY8WgmttM8kb3z75tr7XYs=;
 b=psLWLcBTkvCAXM+zq1fxlLKwsqLVbFgeiUvzq62DYWf6LXpWsyiPtL6ceMR+tYzkqDUOGmtIZbhrorVeXIwrDe9c3WfTHuNe3rGvIHF3oWwg+EyCAz0iAK3XkGSXGocLczlt8YgSKCdRjtcH1D2aqJ6PL54k+h+2YAAOj8h7j2g=
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
Subject: [PATCH 2/4] xen/arm: Check return code from fdt_finish_reservemap()
Date: Mon, 3 Mar 2025 09:56:48 +0100
Message-ID: <20250303085650.74098-3-michal.orzel@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e14ef30-ca63-4f2d-81fb-08dd5a315a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UiS0ef3HGig3nCEWAVNCNgzPIFn8lzoQXbHedXjtnuYAYTJUHQ8TCohHiLgT?=
 =?us-ascii?Q?XqSaIIXOkUHxxHqn8IYlaPdswyqD3ejeNM7ywglVXy4r9WHvC57zEMuy1XH5?=
 =?us-ascii?Q?UePlqsqkDoRk0LrzuEp3bOLClmRDGjgv+vxAbYgrL5RHfj92ZbwyIJoMCWO/?=
 =?us-ascii?Q?9xErRBeVzVpBwmPT3MUoKzQKBwgQzAhmg0Oah9PdEk4Lg09scKgHhU/tMJyt?=
 =?us-ascii?Q?vxonSEX8MFCM8jyexpxFuyM5SuPcF7gpKHAWfu5HizzdozV/W2z/gPk6dLvK?=
 =?us-ascii?Q?10cIlGLa1f2jFFdJMVrFPU7M4CrNVVOdZx7ViZ1pswYu0AuUbjLUzux+XIJ3?=
 =?us-ascii?Q?5Cys3R/j4DqZtdY/da1R3RiL8dViU900vBs1sBMbFlCbK/nYVRFPr5+3wMIB?=
 =?us-ascii?Q?KdniKt9UL+yOJyQM7e8odWIUB9Lw0Jo9d+7i9hK5yGEOXkqqnhduyjqSzUNq?=
 =?us-ascii?Q?mhJgdPGI6DWOWSRdVy0NGg8gs/saZUtqH2dxaKQaL2BNMuaWt2iqsZQwW3bB?=
 =?us-ascii?Q?mhSSs6aExfqa5qrr/zBQE1wRJ3Qa2UBaTepC3p7mzxQ025YJMQJJFfID6/j2?=
 =?us-ascii?Q?6CTGK8iTP6Xf/MpPHMvid9f0Ebct9vVXW2IpLXxOHGPbBtHHQ/3lY5nV6aYZ?=
 =?us-ascii?Q?+8H0QDkO2ELeFUdKIgEKUJsHWk3+vsnrUgJDJgYVE0c0moRz42h/rdCSgIAT?=
 =?us-ascii?Q?nftdVXWEj0++3hw/nu/tsyEGvx3Q5enIwycz/+Zifk49jaNLULf7/U/ktHC4?=
 =?us-ascii?Q?xxBA9yttgrBIEdh1UOT+Ff8MvibGy0thvIiQnM05mnZHP1HsxtNTBJ2PTOHt?=
 =?us-ascii?Q?EKFG38hpN77VZ7jvrBQM3BYJn2HJZgjZHT3Xwzrre2GrcgpaoQYA9bwGSQmy?=
 =?us-ascii?Q?dzTqfPWEoycRmWk97FBYdouKC/Yb0tsUL0FaAmlZ+u2WxbdCKZnn5qh92w6+?=
 =?us-ascii?Q?EAAfgqqbrcj5x5pdfqvycsgqYR7PqLQz/ZkCC7Lhx2ivDy3lneWMuIzePZaU?=
 =?us-ascii?Q?FtRoRUYSbbEJ6Zymi8rNkfUkqrfcBDvBHr1zLfM6bK8Tpd8cc7EGHfsdiCri?=
 =?us-ascii?Q?ygKg8QE0Y3Ac2q/UrQM0FWdgZI2jbHljegMmjwU3UbG7+S+pyG6S0lnUBoUD?=
 =?us-ascii?Q?oKy4ZEtZGD80jvbiVM6WDWQwEERpJ5TSWWEpEaoHNgdZbgF9/jpMaSOw4msR?=
 =?us-ascii?Q?mVdW8NChBEJoKrPj5wC7ndtn5F5Y41irq52JdMUECbfNg/PpLhOf0AgUcOkW?=
 =?us-ascii?Q?6N2XwF2CCPE8+6ehMRpX/mQ+ybZ7udQqWIKggGtxzKJSaS6vt6NFrIWHpIwu?=
 =?us-ascii?Q?IfSPQkfz5pgUaHG1ltUFPekeGEBZLpMMuSP+ewUWdh/yDKIfzEYHbbSmT02f?=
 =?us-ascii?Q?e1gklYdYE9pIo6nQQU8uzVRuIiVVAkQM5GbjWpXSeAd3ni3IZg4uNGvipgZt?=
 =?us-ascii?Q?7uv5q7vgJPrCPmhLDbuiVo662oII1+F6uJ61F8gpkJpXjAV8SD+fDxqETFKl?=
 =?us-ascii?Q?e9T/6XaDpSXSaQg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:56:56.6479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e14ef30-ca63-4f2d-81fb-08dd5a315a09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

fdt_finish_reservemap() may fail (with -FDT_ERR_NOSPACE) in which case
further DTB creation (in prepare_dtb_hwdom()) makes no sense. Fix it.

Fixes: 13bb63b754e4 ("device tree,arm: supply a flat device tree to dom0")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7b47abade196..fe05cf6d855f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2033,7 +2033,9 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
     if ( ret < 0 )
         goto err;
 
-    fdt_finish_reservemap(kinfo->fdt);
+    ret = fdt_finish_reservemap(kinfo->fdt);
+    if ( ret )
+        goto err;
 
     ret = handle_node(d, kinfo, dt_host, default_p2mt);
     if ( ret )
-- 
2.25.1


