Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2FA7ECE1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941030.1340606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1s7S-0003OV-1g; Mon, 07 Apr 2025 19:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941030.1340606; Mon, 07 Apr 2025 19:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1s7R-0003NF-VB; Mon, 07 Apr 2025 19:26:53 +0000
Received: by outflank-mailman (input) for mailman id 941030;
 Mon, 07 Apr 2025 19:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1s7Q-0003MO-Ie
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:26:52 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2407::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 402594ce-13e6-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:26:49 +0200 (CEST)
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by SJ5PPF01781787B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::986) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:26:46 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::e) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 19:26:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:26:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:26:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:26:44 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:26:43 -0500
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
X-Inumbo-ID: 402594ce-13e6-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd4JHOipIFqCUCJrpbacXwzc4Krg5a/mBJ+e4hYHWEaDzx12uw9PnwIpKNuY32C3Cv4N0XO/GTHs4MKZmI24POT7iF9cpl8y0Ir99ONOsBZ9d4lRRUWSRzkX9ms46aFkPI8TzoFU+5EcDdOxEWCdqxR0IJFaOLjCdmpBUKWDyg7/Cl9U17HUcIXbTzSyx/rNdnCgs0/n2r186ttMKrFtMnO29x3s+DN2ar+ITf4dr06dlAgu42O7YlA2lu2Xa67jRafVVJUVioj/s0BIbILTjz5lQtcUuemge3QUYEDedS+3AfiMMRfyLNFHwuRp0GzUXT5W8Zlo3xoWDUw2TGS/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCKz0lPWiKqv7wZcTdrkgrcxezT+4JYBMlY1rOyPxAQ=;
 b=tIAEdccxbtL0P8geGXPSR7QKk1DtAs6r+n5hfzgEsqar1Xu6KEmp91QGonwF6dw8eHgaCPpjwjotBvltZB0Oq2s4qTKmKpDenbwdnhhjWLQXcNWC2YRQYpt2vpSuMVwHY6+t2YAvEAL5gU11JcjnBFFj6yBu8220jUYJ/6sl4MgZO+JShKwAeXnKFy0piA56z74v98KuiicaN1vg1DzrW1zmlnb2OAOvuLHVEAD52fKZaR4fd3g2pUf5oQh6a2b8iPtHNiQkP1I2xi/jAzTuCdco5LTX92pIhG3Xkp4XWhQR/qFeCfIvcAd/IGrITXQgfUv0MBT2l7yYOQObgszIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCKz0lPWiKqv7wZcTdrkgrcxezT+4JYBMlY1rOyPxAQ=;
 b=ChWCduPq5+r/2qwv3OpZq7QN4NlyuFNG7aib2sQpuryqr/6oKdGDgTX12InXIpURilYlE79K5uZikwIAPn9i/5hNGA+CocIKiqaSnQBWwUotJJUfi4S4AELf1alxaDNyPHgWHTHpS//NTTXjYwPlZh79jTV4TI0SQB/zwdY3+XE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: Skip invalid IRQs
Date: Mon, 7 Apr 2025 15:26:41 -0400
Message-ID: <20250407192641.83554-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: eb895834-963d-470e-0843-08dd760a21fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xzpwBrM4sCDc4CCHvE8JizXWy70JZVHXobFWrKK/9RpqGyxFWWi07py5zO/a?=
 =?us-ascii?Q?OWnikAFuqcvDyjteRp6BsDlr3IEiTdMjauiU536n9ITW9r9nJJWOcRwxIaOu?=
 =?us-ascii?Q?OVRJ0bLOGcZ8qV3Cn8zIXncvOirTZkQfduqK58gCQyeNOn8gKQT30O/ITKK2?=
 =?us-ascii?Q?JA6/hcO7u7daixRnTXe254XRi8ZKjrsSMPQrPgJxufIGfRsSa5biI01t6sYF?=
 =?us-ascii?Q?2hpgU8tm5UL+cvTtbIwp0ewuXL6sz2PVQ/PluS7hzxgNV8e+0OHF/OuoB9ui?=
 =?us-ascii?Q?Sg54uFFTA7pJHuFU97TzaxbeaynYTorBFCICE9p7YuTOpQ2UGgD6C+XrE8P0?=
 =?us-ascii?Q?imYrqkAtmZgKbHbq5LDTLay4YbPoha0vg9oDpSHF1dU1TiSfEEwi7VhGaQmo?=
 =?us-ascii?Q?2h6wh/tdi6no+Mli6ZeL0ClDFaSLc2YpFeq6mSPAGsYbOV2dBu2EppDqQW94?=
 =?us-ascii?Q?c2SE10a1/wFvvhXdFTc7FXwqJYwKDzQnPKu+emn+4maA3aXyaTTKxZdbbYCL?=
 =?us-ascii?Q?L1+Bnd99RFIihiW7HQjESqyDGIuW/Ng5VH7QRCI1e8TsBaFrFAkGaOfGADs2?=
 =?us-ascii?Q?JjHrGREa0uvqnZ8jHw5/O3vOWGSqVKRQQylJ9GRtQtafQbt+7+ioBdi/dVMb?=
 =?us-ascii?Q?SvCCAcGrVFcfRduIuvcYf29K2e94FgxYoJYOHzHNz6HMM2Av0EgcsBHpYJ2Y?=
 =?us-ascii?Q?xH4uzTioFT3x7Yl3ACVboKnY0ChmOKSc5TKXOTU7G7Fsmgru6JmyB0Unf1U1?=
 =?us-ascii?Q?XqrAeEm2uZKUA3cc4R98s9KaTezg/ctrt59pjPMnI2UFWmXrQaYJ9j0AD9wq?=
 =?us-ascii?Q?znWRP4WcdAp0JOPxKPFgbDWFTE7TV9RMd/kMQZnVYDxGwcGJf3M4w98diHuN?=
 =?us-ascii?Q?8+w0EtehWs6LTzrpVRWqyC8bY0VrfgZg9oh1ztoeM/qfl4kiHcG5L6s5z9hZ?=
 =?us-ascii?Q?j0SPQH6Qb78N36lebNISSpfZnndyWlzeG5XP7ET/yMkb88SXP52IVYygjGEo?=
 =?us-ascii?Q?jc/RJhfxuvQjfkTG5mefUJYm+Z4Bv1yPhEsHaKb9lEJWZEZ+3qG5R2VL6S5T?=
 =?us-ascii?Q?QDWeRXkhYlveBCd2dJ9j5aeS/RInwPY7AGpX1B6ur+Wu5AdjBr6Gd0BFqsHe?=
 =?us-ascii?Q?iGFdsul5mkZq+kutW3h+YfjhLCPr3Srw+bn/jnHZuzOMfYj1r6C5PjzsJPh5?=
 =?us-ascii?Q?QTJdueMq/7a3Zh6g11MOJD3tlb1JcvekVOBnxdua1U9aTU3cJeg1rkWQ2Sqz?=
 =?us-ascii?Q?CAlRfqNjr/OT/VnujbxGJvNQOmjLSolEeBhGALnJ1lE6s1CZPJyN51cdCsqB?=
 =?us-ascii?Q?ytzaFnlT+q1Y5fzogmB8WTimloKRB3t6QBnUfVtnnaE90OQLBCHnafpBg6aa?=
 =?us-ascii?Q?qxGMnnPXRAsRjkB2glrlVyxxpP2KrLYyeGpIYtiHPoe85br9YrE2COfTuY7T?=
 =?us-ascii?Q?EQKXPZ9sD1TeqTvUagjSq/KsADhecwPf4t2iJS0JJd7MZI4MM3VRfdn8WGTD?=
 =?us-ascii?Q?llSHjr3NcVg54ffEi9TISs40PXaTjc3FM1ik?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:26:44.7860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb895834-963d-470e-0843-08dd760a21fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

A PCI device's irq field is an 8-bit number.  A value of 0xff indicates
that the device is not connected.  Additionally, the Linux ACPI code can
convert these 0xff values to IRQ_NOTCONNECTED(0x80000000) because
"0x80000000 is guaranteed to be outside the available range of
interrupts and easy to distinguish from other possible incorrect
values."  When the hypercall to assign that IRQ fails, device
passthrough as a whole fails.

Add checking for a valid IRQ and skip the IRQ handling for PCI devices
outside that range.  This allows for passthrough of devices without
legacy IRQs.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/light/libxl_pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1647fd6f47..e0c8866792 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -26,6 +26,9 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
+/* PCI Interrupt Line is an 8-bit value, 0xff means disconnected. */
+#define PCI_IRQ_LINE_LIMIT     0xff
+
 static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
@@ -1495,7 +1498,8 @@ static void pci_add_dm_done(libxl__egc *egc,
             LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
             goto out_no_irq;
         }
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        if ((fscanf(f, "%u", &irq) == 1) &&
+            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
             r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
             if (r < 0) {
                 LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
@@ -2257,7 +2261,8 @@ skip_bar:
             goto skip_legacy_irq;
         }
 
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        if ((fscanf(f, "%u", &irq) == 1) &&
+            irq > 0 && irq < PCI_IRQ_LINE_LIMIT) {
             rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
             if (rc < 0) {
                 /*
-- 
2.49.0


