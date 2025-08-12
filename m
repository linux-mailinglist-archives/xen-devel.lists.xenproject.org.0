Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48B3B22B85
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078816.1439848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqlA-0008GU-7r; Tue, 12 Aug 2025 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078816.1439848; Tue, 12 Aug 2025 15:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqlA-0008En-4t; Tue, 12 Aug 2025 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1078816;
 Tue, 12 Aug 2025 15:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJP5=2Y=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ulql8-0008Eh-DJ
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:17:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ddf024-778f-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 17:17:51 +0200 (CEST)
Received: from BL1PR13CA0426.namprd13.prod.outlook.com (2603:10b6:208:2c3::11)
 by SA5PPFE494AA682.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 12 Aug
 2025 15:17:47 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::9c) by BL1PR13CA0426.outlook.office365.com
 (2603:10b6:208:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 15:17:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 15:17:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 10:17:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 10:17:46 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Aug 2025 10:17:45 -0500
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
X-Inumbo-ID: 82ddf024-778f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhgeJ3ckbxU2OCZbcYhSV1hpYtXR/lpEgKJTnwwr3UYAM82+1+KgvEF2YzP+4BVzuNCkUc88FAdsERJLGZVZwmZiXF6XFXbuA9iTOIzU1+0LZEx08xf4ylHWuOo4Wl8cL1+1Vc6wVk/dTQAC8dQ4E3IuHPUbipTXGZIuuXtUOJSJ7JxQbqz64y9F2ykLJbxCLysxvtNYJzP6FpVOwrlC2FFGlOQ3nnDB+FOJjMR/oeVtlyPhKjNuvucjBsMT5dD/co1ox4YcAqfTizfslFPGofA6neHx1LNgQ30VjfBa9yKVmpbcBRKLiJr8gvaPV2yLLWH5/UUeZHPdakjhLb04jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIvbQ47y4UfUXUSyDirAujuj6G/Pn2yQMXJlyF+3Vbo=;
 b=t1z8prrMyFcZiiBG38ZieotgwlM5SnrjAYp9IfSh3Omz+HId4L4inCIjS90vUdxONC8J/la4M7mIIrpL5qEXBOm74PIqg3BAvqqJu1jh3vvkCWxVZxJWC+9n1KTYDklDPkrMH/0YmZv2C/0MxD/Af+oY7m6I2dLVNXOF+GI2qLcEj0u8KlYi0MtxLNLc5smzDEP999rkMzhmILwkXAHfr1w6PbJ842vVwrS4fYYKEmYdLfahal7I690TKUFB1F2qz4sQ6jh3xCAcMHA/6elxU/V/tFHYjwz2vP5FxF5ZKw85gaZBfouYvQIe4lCNgsWQvblr8fZnPqA4Hpzbn9NK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIvbQ47y4UfUXUSyDirAujuj6G/Pn2yQMXJlyF+3Vbo=;
 b=vyCNYuZcn6Kjmp56EyNCCOL5hQtL2aqfqCd1cYcPGmo3qvrc5xZSYDHOhSNKLKl9Kopv83aycbYqkX5AVkvNpubyAdisl+lxe7Ttqe1IPpKUFKJktyr78kc7UUxwKSBUU/+RErBNhbSG4kfoq7pdmn2ezO1EfnNGBkHvP316yUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [PATCH] vpci/msix: conditionally invoke vpci_make_msix_hole
Date: Tue, 12 Aug 2025 11:17:42 -0400
Message-ID: <20250812151744.460953-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SA5PPFE494AA682:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f198d33-8cd3-4ba5-785d-08ddd9b364e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hxMwWivJxPxOyer9rPbjsVjKPgYpDCTc74Sb23YL2YIKoZvLXlhI8FAcSPUi?=
 =?us-ascii?Q?nc/nWeLNQTWD7WlULSbqg85i+AIGdb8QkvyowS09qlhjymGXVJeQtePmrC/q?=
 =?us-ascii?Q?pajfcUfeZClomAZF7GaTp8bZCjDl2D5Q8FT+BzGUTG5kMh0J6nDEbSYdVJiq?=
 =?us-ascii?Q?951cUhSh15dYbYnh432WCKDWSDBgqJpjE5PCsGVtvQO5GQgVFNyoLdlrMQ6Y?=
 =?us-ascii?Q?7+JyEPSo16sDLoj/GrDTuS+GxnXPDaw3a0J/T1kBmhOcbhphvVTIDo8xLd+5?=
 =?us-ascii?Q?9RxCGIgX4D1wAsXBL5qopy+JCZ6/GKwO2RIaT3pZMDezNEW/GQGUaJQ3QZ2r?=
 =?us-ascii?Q?9jpNskdWnXVyVxAunGL7+ssLrVytN+hsqSYpsYbEQ8nVYM7/KFbnIPi1WrzN?=
 =?us-ascii?Q?3Ra+VUylDaHc3F7WMXAZDOkQrOYvOF2STo2PEkRQDbfG32KW6hsnCU/nt//u?=
 =?us-ascii?Q?6SqZw/vCcAMm/qWUFhKBRUlmg4/c7ieS1XN3Y18yK9ywDTq3ufbg9jj+bkrH?=
 =?us-ascii?Q?/FHwHy3rLCuWi8A9ZvpZhak8zA+jbIvzg+wHAB+7J3TVkLtnW64HaTJ1iBeX?=
 =?us-ascii?Q?vJdqnENyMQQ8Exl8xgMm7iJMLVMtzgNGMF144nqGUuuFqoJNrMWIzV2SqSnt?=
 =?us-ascii?Q?rgVYvYtobzwdbLl0Bgm/PkAbgX6Kv+lbHp1YYFMVOAEOv6YDNILA1LeJ06I/?=
 =?us-ascii?Q?Pr1FQUAel4i5m5VyhQqxoXcoog++NZc4u39oup+LJfmyqhXhX72ZCZt9YZKU?=
 =?us-ascii?Q?OqDoeXjQiiS+PSDemW9F6YqqmhYGncJzSaOvvKzwn9pXT20h9bjz/XqIeueU?=
 =?us-ascii?Q?Px4a/mSSE7ZSGjkGL2E3mGH3YWNNRaRsN6ZuwKvDjLTZuEZNZjsiCft67EL+?=
 =?us-ascii?Q?GFCH0h9kkgJ4+/vCnbA7QVITZq1YXykv7D6TjArlm0GeMHEv/t16BK4iKat9?=
 =?us-ascii?Q?9e9/SQK4/2tqDu9ZyIRaWVO2imKZHbxR/0307I+IFoOPy02OQZ94UtSJ/H/C?=
 =?us-ascii?Q?YFu88O2TiQGUbegz8AtfaO84uzptifByvpWsZrRAAB/QAxImI0aHfhLkJE3I?=
 =?us-ascii?Q?3IbcXsHdZkYbi+oqoKCFCHNjGAGqOVbble2K9Pc7bnaDbTOHpZXoHJLZ8yEI?=
 =?us-ascii?Q?/D02a6mvmGRQtybBVGifD9AWMnt/ZIbgRBqXnxjE3+fe3RLmKlneFcI6IwOo?=
 =?us-ascii?Q?ysTyTortQxlduFxmUCGgjNCspW/Jq7iXIfU1Al0nyXCBOFzPUD2+RnwZZb6g?=
 =?us-ascii?Q?jUM0RYCUZzgahUqzlc1G6TzK/TpHwqk53xsBxImY26ZzIVnyjm8uEJRRxTrK?=
 =?us-ascii?Q?K+QAu/xfsE80cr0qGo6fvaiO907gFd4MPdVN50wpXyI0+sxvl9c1v2QDmJRc?=
 =?us-ascii?Q?G8jiraJ1i0GZm6u+bZQEzT6FfQqlAr49Yz+sXqc+bGfX6AucKQGW3CpF3AP4?=
 =?us-ascii?Q?BVGIfuNFC+3pVCW+M74/S1DDbaOdIGE/KO9igz8vWn/3iH7iG6CUThJ5b0o+?=
 =?us-ascii?Q?490Peh56cORRK+U1zroFIxWO9Eipy3JLnwXG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 15:17:47.1191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f198d33-8cd3-4ba5-785d-08ddd9b364e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE494AA682

A hotplugged PCI device may be added uninitialized. In particular,
memory decoding may be disabled and the BARs may be zeroed. In this
case, the BARs will not be mapped in p2m. However, currently
vpci_make_msix_hole is called unconditionally in init_msix, and the
initialization fails in this case:

(XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
(XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it

vpci_make_msix_hole should only be called if the BARs containing the
MSI-X/PBA tables are mapped in p2m.

Take the opportunity to fix a typo in the preceding comment.

Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/msix.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 54a5070733aa..39d1c45bd296 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -705,10 +705,16 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     /*
      * vPCI header initialization will have mapped the whole BAR into the
-     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
+     * p2m, as MSI-X capability was not yet initialized.  Carve a hole for
      * the MSI-X table here, so that Xen can trap accesses.
      */
-    return vpci_make_msix_hole(pdev);
+    if ( pdev->vpci->header.bars[
+             msix->tables[VPCI_MSIX_TABLE] & PCI_MSIX_BIRMASK].enabled ||
+         pdev->vpci->header.bars[
+             msix->tables[VPCI_MSIX_PBA] & PCI_MSIX_BIRMASK].enabled )
+        return vpci_make_msix_hole(pdev);
+
+    return 0;
 }
 REGISTER_VPCI_CAP(MSIX, init_msix, NULL);
 

base-commit: 4cde4a552ed35f3cc74df877d5a7cfbbfced8fb3
-- 
2.50.1


