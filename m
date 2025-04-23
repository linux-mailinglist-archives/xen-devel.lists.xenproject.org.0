Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797DA99AA5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965459.1356013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hYG-0005TG-7U; Wed, 23 Apr 2025 21:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965459.1356013; Wed, 23 Apr 2025 21:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hYG-0005RU-3X; Wed, 23 Apr 2025 21:22:40 +0000
Received: by outflank-mailman (input) for mailman id 965459;
 Wed, 23 Apr 2025 21:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7hYE-0005RM-Tk
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:22:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139a546f-2089-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:22:37 +0200 (CEST)
Received: from DM5PR08CA0026.namprd08.prod.outlook.com (2603:10b6:4:60::15) by
 SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:22:32 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::3d) by DM5PR08CA0026.outlook.office365.com
 (2603:10b6:4:60::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 21:22:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 21:22:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:22:31 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 16:22:31 -0500
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
X-Inumbo-ID: 139a546f-2089-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGMCT6FUAtkxHmdGQuiViPce4ZMRQFVOgH8K16S5xHo++kCXuz7Sgl7ZQ2QGqLY/D+dIinsqhXJVu2xhZVbSrY2aoEy6ir/SQVEMoxW9mKkK6uwMhDiC7JR8ZDEzLz84b6k1sMFtgw8N4IR/6uzDb24WC5hL0Et2mRY2vfA7RvImwVidlXbK/1RJswfB9XwvvJ5OhDxFRDBAcQwggDlcYGX5yQDSjAZsz4GKnyXOH3W7aA9XfvGqM/Ls5SXW36R9F0phsL9WlvaliGPXzSM0aGwq01O/pNPhZx5HYIZi9WEfAyLm9A5Ymf03zT0xP1e1SjfgunGDLs2Cd4fg1IrRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0mETdvua0/gBYEuaqJbC0NYkduvDuduIB31o03LE/c=;
 b=iphJGNclefDEpjamjzWMCOiPzLrXtluETSw9jhp944KHuudb+OARrroW1K7lua/TjiFkmNqTjGIii+32LLA4rNx6+nCI32u5ITByeXc1WStbSStMrgAD2W2H4Zj4n/qmkD5nD0bKEaYl1t3+1wdgLIaKHHc5qVXMGYVuTguPenQD2WMIGc/psuJ6u0/bwnnqSADioJnDGrmwzcKaK5IX3J0Jj5oN587uIemB8zRL4G2FK8nZJ7pqL2RqOyzFdYC2b4CvI/Haz6ZG7gfJeTe4lscGVJaHhl5RB/k7uYKGPSQNsBFolhqcb9YG6s+ueNiHgqemv+vHKaXswC7oOSQbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0mETdvua0/gBYEuaqJbC0NYkduvDuduIB31o03LE/c=;
 b=DnzykFCHl6cULp2GsjVvw6SpsBVwA5BU5If3PyUFIqSoUHYvewhIGSZkHevZWxhWguiPaF8/a5I0H+LUPPqi/1dy/h0OFmE/7CHZmUkNxc1Q3HO2kjWGvUVVhrUiDTIdeyrz9Bo59PqerXSf/Emp5OTTYMP7OBAUeWSTlhc2Jy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/vpci: Fix msix existing mapping printk
Date: Wed, 23 Apr 2025 17:22:29 -0400
Message-ID: <20250423212229.32721-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9d72ee-7ae3-401d-5b8f-08dd82acf55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HE1zndZrcHrBq0PuKx73p2Fv4pMDwwzuyj6FEPddhZR8D1Gn095/6WkutNsV?=
 =?us-ascii?Q?p2YDnop3t8hq3qw6q/BIDWT9JT9UmiE47Op79sXRLglnIOy51NtNEb1PHUC3?=
 =?us-ascii?Q?/2T4PMEBxBGhTnKqfpAw/PvlM3cijUCLW2C5A/Lrq5SYA+WgPaBGMNLaQtKH?=
 =?us-ascii?Q?PqibC0Un9ujvXlbEmK+NkWZUxwSWwNiB/95P6/IBNIgK09+DwDM/UR16Xqxq?=
 =?us-ascii?Q?sUip5naTaClmZIOU3m4lzWLLiVbXidxFRX7KoG/kWds8iYbNBjEyEdH+Rohd?=
 =?us-ascii?Q?Qbwit++Nr8vaHBJAdOmlx6Oe2KQf6hAmVmTFmTUdKTtBRHwy972JBM5Hxjbv?=
 =?us-ascii?Q?dqjkZicssM+RX4EkdDpx0/YZkNDwAkl1XKnVXKXwp6exZr+FGEr+LeLboWbm?=
 =?us-ascii?Q?rnTO4sUzVhi/zSaqYXhm7tvKVC23ckIdA2GLsD/UaC0vsJDITG7L1ND7Wkqh?=
 =?us-ascii?Q?5REhbZx9RF21KRIQIgoHtG9BGsLzIFvQ/2LBZ6GoZLTqUvx6V1q5OJr30sKS?=
 =?us-ascii?Q?R00obM2fTPw0s8hZERE98cOfNswuimsKS543/ydYSohB1GfjHob/wEATGBH4?=
 =?us-ascii?Q?enzOU4+KdTXba5L/D+Ywvz6QJ0AFt6CmDzgt9k0sBAK69MUv8fHXl8V4Pftz?=
 =?us-ascii?Q?Lt+vRr4k5CkmfzD2qcoU7IaoWl72vrygZgy61ZJ0i/86oyo2MHXmAbAqpFvF?=
 =?us-ascii?Q?pXmFb5jNDtzkPsUrzb8IA0NqBan5T4Gjuwm+t0qJ1teWoJVa5pUPZzaOIDnZ?=
 =?us-ascii?Q?3+tHZolUjDLiahvhDA0idIfF8lsc7TYYUOPhYbpo9vpopsJQaLe+JVp8JsRc?=
 =?us-ascii?Q?3PIbt5OuuhHFs+qWKKJJzJ5Gepp6k6letBFbwjI8E1MFXndgwTr5tFlXych/?=
 =?us-ascii?Q?nKtjQznTNZDUmXXTj4RcKUhPdIJsPAV7oTSPD5pjttHb9Ux+cS86Kqrv/8zz?=
 =?us-ascii?Q?nXLc16MPRTmJ2cLo3wuk0biYaAmO0FBARQ1qPf+eAf2TNQImiIS8YUpc+16i?=
 =?us-ascii?Q?0O5v8LalQznUCk2kJ4EDij46O8akwRKDjTTlW4u0a4ynFAFcE7gdq3vPK7To?=
 =?us-ascii?Q?+DC3VSXyHMvFAbtl5BQgEj/1ylBxdbRrNNqhx9HxoFCIsF19zFjlyfMcr+la?=
 =?us-ascii?Q?XemQGu4SuNN8ZlCZrHc9nrMfCUgI4CzPx4ELq4ONF2oj+2CIVz2R5xLfpGnk?=
 =?us-ascii?Q?KxwSTpLTBj8fmzhvINuqM1qg8WnwCuUb4b+c65zX+geGlEZGPLQkMem2nSA6?=
 =?us-ascii?Q?mTBacicHahOw35Lpg6Ghr13wiOW/SW/85ts/+EeiiDMHYtJlF5YxVcYJDT0U?=
 =?us-ascii?Q?Z68SM97nObUS67vsPupr4lGv6Gvs/VRW9cPfvTJN8YxaaTfx7aR4QKuS+Mpw?=
 =?us-ascii?Q?hivV70pq92RVEPgc7DJ1Ybt0D3NWY/MKdaf829KGADA7K6/Vp9j7mkF5bswm?=
 =?us-ascii?Q?IJze4IZSU+CFOm+LLLxDZCbLGFeruC/Q5K5e0qZNRBOcatg83mvySzxi1VWr?=
 =?us-ascii?Q?RFM5mShetipcIxgU5rQMaOdBAAf0/SsHLSeh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:22:31.7438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9d72ee-7ae3-401d-5b8f-08dd82acf55d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105

The format string lacks a space, so mfn and type run together:
(XEN) d0v0 0000:06:00.7: existing mapping (mfn: 753037type: 0) at 0x1 clobbers MSIX MMIO area

Add a space.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/drivers/vpci/msix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index f3804ce047..499810b238 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -666,7 +666,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
                 put_gfn(d, start);
                 gprintk(XENLOG_WARNING,
                         "%pp: existing mapping (mfn: %" PRI_mfn
-                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
+                        " type: %d) at %#lx clobbers MSIX MMIO area\n",
                         &pdev->sbdf, mfn_x(mfn), t, start);
                 return -EEXIST;
             }
-- 
2.49.0


