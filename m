Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046959EB64C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852857.1266530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL33m-0007WZ-9S; Tue, 10 Dec 2024 16:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852857.1266530; Tue, 10 Dec 2024 16:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL33m-0007Tb-69; Tue, 10 Dec 2024 16:26:06 +0000
Received: by outflank-mailman (input) for mailman id 852857;
 Tue, 10 Dec 2024 16:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcGJ=TD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tL33k-0007TV-Kc
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:26:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f2123ec-b713-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 17:25:58 +0100 (CET)
Received: from DM6PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:100::38)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Tue, 10 Dec
 2024 16:25:53 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::8e) by DM6PR03CA0061.outlook.office365.com
 (2603:10b6:5:100::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.21 via Frontend Transport; Tue,
 10 Dec 2024 16:25:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 16:25:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 10:25:51 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Dec 2024 10:25:50 -0600
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
X-Inumbo-ID: 6f2123ec-b713-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpg8UA8H54lDTM5Kvk8Sp/AVG+uxiWqjIafLNnyQXCrAdaboVNU7hC9+ZZ5yij8ZSOBambIE+mWQhnwJvpPfIUtUVQZKwufPz6273DikiCFNfxoha5yBeLpnEOqh3Gyd7+d1D424ThfPPmcxliy2gO6P851gJrEQaEhqEVgzlgjA4kqfgnlTNv2BDw9KuMYmfgcy1S2CkPIsZyK6ow+r9v8+1YFpcDhNegnTR7N5GX58mYuPn9pY8JFh+gRmJbB4db9r+WpG9IV6S+lzzuGjmh9N8ZowNLH4I3TiDWTUSw97Zoag7+C5S/IU6NjSebHnv7IirO7czjAUJKQ+NRJkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kONbcCgZKsO4TiqNQq87LzjeGcYkS85qkaJxmB0oPi0=;
 b=b2QPZFhqg0fFu44c2hn0zXPiXh9uQ8/5bEMKwKygdx1TvjkB7GYRj9Cjakau53vzOcZlLhL8xttIYh6e3TiYx4vWyCBcvVkqyrM/DyPvucTTt7L2L906gt5GWL0FtgmWq6jpIO67vFK6HvSsBf5BCJOk/erzhSyXNsf2IekI21DgbAV6bnI/+wz6s0YMruKxcYDCNpPOML1yW5CYGH4dzuPERXUxMe2EOyzuxFVRZ5oHGWhQs/2ug1vFottsL4E4b/mt6aVN25k8L5kCneGpF75MTkwSRz/LQtQAP8y5NlK686ptuHZLrEwIa34/d2ePCkwOKNpcIyhmSwZZ3y3LJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kONbcCgZKsO4TiqNQq87LzjeGcYkS85qkaJxmB0oPi0=;
 b=5obwKfiV5CT81J4dxepM94w1TQMWJxCPUweGLht5rzuFkKrsZJ3U1oE2aWxM8Y9beKUdt3za+llfnIydyDx9XubRC47v/WQIszRFdh+8Dqnb6cH374jaWEkthz/E68YX0onsoLYAFs/WPI7A/xlB+VfcOnmnWBogNRtXurzXgxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/vpci: fix memory type in guest_mem_bar_read()
Date: Tue, 10 Dec 2024 11:25:44 -0500
Message-ID: <20241210162546.403882-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5fcdc2-dd1b-49cb-d6fd-08dd193750ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W0S1nDz+Nudm3xlEH4rT1yVfPHkTgCiwDREjkJtWga6NhFCPHL83JHlPahJt?=
 =?us-ascii?Q?DIn+bcP7vjcGzPpEi3SWO66ybuKx0sVPrT4fOI58iA89SoR030v/KYbjf8RA?=
 =?us-ascii?Q?x4UneeF6vUQJqxZNQCmLe+5cBCffJBx67UtUVEpV6Nym26ujD7bUqPWLdASn?=
 =?us-ascii?Q?y8r5/Lai2f06sIqaBbPSStk9YB7A7zAgTHJ9vqc5CbAiE0R4MHou1rzey7xf?=
 =?us-ascii?Q?eDAHh2gjiYCBT8EU8npzFtzCk67qiOlSMWo8XxJKoZkwJVD9RcawWQ1Dzdm9?=
 =?us-ascii?Q?ywHCkvYfkgJcAEe+eHH5BaXmJ74EBu7vobLQkglXklKpuY0psULPToVb7Dmj?=
 =?us-ascii?Q?Bp535FiZwhudZqAeXzF0A/hkkPzLWwQmKEpBu2E3I0fBURxgyvUPIsQTZo1i?=
 =?us-ascii?Q?MHSSxhaF5p6Lk6rihXRVRvTAyHtRKt0v5oX4Z5SdyBwNQh1gzxcwGgP2Of4K?=
 =?us-ascii?Q?VnZGN09Ovz1DBPlj5IZTKSgH+2LO1DmmCtoQYltuLlflvzBb566QaaLuFl+G?=
 =?us-ascii?Q?8fUpWjNETLb/L4unzSsRYjJLZBsFx1fiSPIz1i1Jy4bM9V/G91C4hd6hqMmk?=
 =?us-ascii?Q?m3t83LbaxVO7EbexOYQyrdojSGlyzpgUVXVLwd1mYp8v6fLIx/eHeerVRz1y?=
 =?us-ascii?Q?FA/WGKZDul/ZOuY82aFs2JNNAcPUmr8QuF0OcVZjihMBpIwi+/WV4bQPlipa?=
 =?us-ascii?Q?GdZnWvTIdyMkJCyM3SKPtme8fleTH/jbPEtk8Mcm3+yyq9gxJfklcViY4TcF?=
 =?us-ascii?Q?jWPCi8PMa/mXc9pOy1v+q4dNCP2D517QmKDlJ6gFId+YAD6+Ir7btuVLnenZ?=
 =?us-ascii?Q?IJuE/CpNbU2fSwn1zFoofuI1bquIT3GeGfxLgaqEWupFcnpq7/hTVUPJd5e0?=
 =?us-ascii?Q?ntRBuRk+CWmFNINWktMIqf50MryEYALKAflF5+fAZ0GLkKPCbNBK0FUXBnPY?=
 =?us-ascii?Q?SsgXKMCs56E+hfhXzdgX2U4rTkUzwUM+VMTNJbrIRfBUVl2G1jx6XCEb4Mz1?=
 =?us-ascii?Q?xC+oyfmqh/x7SuNzT23IMKco51ZDx3dKCJbWvKmlDumX4najVUrSIAoVqJ09?=
 =?us-ascii?Q?Q3s63j04CjvUQpwao9w5/8y76/o+nglT7kWFn316bCrv5q9ltvt36q49d5Aa?=
 =?us-ascii?Q?GKkp92zd4QQIuu9tKQ0nlui68jEy6NrMFDZV82RZDqbjIf6aM19aYLQS4tYA?=
 =?us-ascii?Q?c1bCvVkFqv75wyXJ5LkMK7XZEnmdChpLm7WOojRygCkEnZMkUg342Vv4IM4P?=
 =?us-ascii?Q?wQcm6qmEiV6HBuOuMgmrABBiujFnl9s5zUm2+fqyAl3EJIabtvMvOPqhrRDY?=
 =?us-ascii?Q?K9eJmaeUTskjq18YluxfIMm7EnscoWoN7ow/LyZOw3Bc6pYrABF7a8sFP6BJ?=
 =?us-ascii?Q?pnKlExYBfI0xTb4O/k/CS7FyKS4yZvW6G5eaHiW4AxJLV4HalNsHlwmkHJqG?=
 =?us-ascii?Q?Xr5Ie28ZYRI5iK5NZyZuFgrV1HwwDYod?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 16:25:52.2290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5fcdc2-dd1b-49cb-d6fd-08dd193750ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134

Currently, if bar->type is anything other than VPCI_BAR_MEM32, the
memory type bits get set to PCI_BASE_ADDRESS_MEM_TYPE_64 in the returned
value. This leads to the wrong memory type for, e.g. VPCI_BAR_EMPTY.
Only set PCI_BASE_ADDRESS_MEM_TYPE_64 when the bar type is
VPCI_BAR_MEM64_LO.

Fixes: 8c5bca70742c ("vpci/header: implement guest BAR register handlers")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..493ca5de032d 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -668,8 +668,10 @@ static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
     }
 
     reg_val = bar->guest_addr;
-    reg_val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32 :
-                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
+    if ( bar->type == VPCI_BAR_MEM32 )
+        reg_val |= PCI_BASE_ADDRESS_MEM_TYPE_32;
+    else if ( bar->type == VPCI_BAR_MEM64_LO )
+        reg_val |= PCI_BASE_ADDRESS_MEM_TYPE_64;
     reg_val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
 
     return reg_val;

base-commit: 1645bb7997cb1eccb45235ab350872733c74b305
-- 
2.47.1


