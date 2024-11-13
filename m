Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C380F9C6A37
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 09:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835072.1250901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8J7-000845-AN; Wed, 13 Nov 2024 08:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835072.1250901; Wed, 13 Nov 2024 08:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB8J7-00081i-6U; Wed, 13 Nov 2024 08:00:57 +0000
Received: by outflank-mailman (input) for mailman id 835072;
 Wed, 13 Nov 2024 08:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMWt=SI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tB8J5-00081c-4C
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 08:00:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:200a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65862662-a195-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 09:00:51 +0100 (CET)
Received: from DS7P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::25) by
 CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.17; Wed, 13 Nov 2024 08:00:46 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::fc) by DS7P222CA0022.outlook.office365.com
 (2603:10b6:8:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Wed, 13 Nov 2024 08:00:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 08:00:45 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 02:00:40 -0600
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
X-Inumbo-ID: 65862662-a195-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjEyIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjY1ODYyNjYyLWExOTUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDg0ODUxLjQ2MzUwNCwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYjRW8xBwtd/YnJJVyE2fdAI/VbRq7mwulujevDzsutOEBQqxp8uRZlOpNkpW+pCbUYvqcyrx3RwoiQyFPF55sgUWkaCHhIAc6gLi3yAk0XluqkUnJERuww9v03/Kf3POzLcHo9HwZD7eRxnhAwTPFK17l1ti2lA9di7z10QmHTx3Sg8awErwVAGgxMGhVHD8+3VFs2eLZET2Et3GnUYyygb4zqOgssKAynmsJkXn2SDQwus05d17xosQVIsOgcF5AZ1lFzEH9mIN8XhWzkYP20isYu8GY82/AVAWbLzRnFs/seiGm4ET0Mig8zk2ffH6NdZ0B4gQJIzMJZ96PB55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgwJac2tMLssnJK13pRahOyl1hepDj7lLpIUFWcLIco=;
 b=lkGKRWobTKpgMgb4/LgZAdWiPj31xVcD7Ka2iRadPlOr+GGHK0/TzCBY5PSuCC/bYHQJYVS0sVWnegPis8ZziNxMADzpEBFvZNweRVxAB55zdeXyoLNd491Bs+dXGgsZh7SmGnZhG2O3fbv0IsBiJG+xRWLZ+j0hyi00Wk4VKa1bSyoeUcYzHT34fXNO0ej+OpnNSStzyqVpYV0wpPVp50aUOgo5AF3VJr5kRpNEtPqS5GprvYr6zTf+bdOuMMaeoUr8pXrQoCP5jzVmJjWnKLaQMoFLA12k9ptw4Vur4MqsUWKwFgX96+oINVZPfOoRB3L9deW7rbMq1flDztmZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgwJac2tMLssnJK13pRahOyl1hepDj7lLpIUFWcLIco=;
 b=GHp+eoo/mnxzn3poZgGSt6EQIl00R94RIIiHwDjqgjchsUZj5dXPUYA98PzJVijgqoE6Io7HZHA0xIfh6GzLoaXydrlrUw5+4Wq1oTzpV0XkvjK89LYA6RKYhOc19TnF7Zu7SgZiDYhyrajwSx88yc2niYyO3UAyXcmvxVF6+Js=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [PATCH] vpci: Add resizable bar support
Date: Wed, 13 Nov 2024 16:00:27 +0800
Message-ID: <20241113080027.244240-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aa07aa-50a0-43f1-d29a-08dd03b94746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TW61qwBAvglZ+e+UXbj12XVDjh117I7rzlwH70jW0fh/2/ptst0/5LsPlDGa?=
 =?us-ascii?Q?KvY4jRbqfHkVKD6zIXtVjUIJBIcDfvVVBWPumEyTBqwI5vge+cmNdoCVKm+t?=
 =?us-ascii?Q?b/0e70RZPHn3ZxZOut4u9Dd7gw6RDnUf6UNG0KBBVk9b+dnc1upNnq7KWFH0?=
 =?us-ascii?Q?vfiM6FF3FrwaOhTCjAzjxEmI2H2TkwkD3JwUNl0dChew3f4gZhfQgm7VuInV?=
 =?us-ascii?Q?6GiN7xb2LwDZWPNWYAFvBkSMiphdY7ymH0LX07ML807kVUa1QfZaGjYi0WFF?=
 =?us-ascii?Q?i52aLGplohqs1Ikcf/Rt0dYaZ2ZG02nUJWj7LqtqhgEkCHovVNOUkGXetS/N?=
 =?us-ascii?Q?KU51iqEGZ6Oyul/P+bx/Bh2DyBTzUtiHS8tmo/6P24dW0yzo1h5+tkK7fR5T?=
 =?us-ascii?Q?lwjHxtZH0vxWLAh39348b3hkuSmdZwLgqTrDkcvMR9B/HBprQK+i601xRE2d?=
 =?us-ascii?Q?mMQ6pnBjDDWZ9XvViiMIBimd282/vg+n96cMvL9fWO77UTIHkMriQnA4PFso?=
 =?us-ascii?Q?jPbrntLTSrv1qJBjh1rfLYtG3vOEp56VKwXC+SUq7MPxSEELAy+ynxjOn9Oh?=
 =?us-ascii?Q?hVLVZhTsZlIVp+tT0rUG8IYRWR2iGHs4XaStnpPx5buGOuOOKU+t/U4AIPkR?=
 =?us-ascii?Q?pPyrIGktNiLE+MafDWb5WRFggJPojBxU+JyWzf/r18NxDZv7cuxJghvr+aTM?=
 =?us-ascii?Q?sLm1asp5Gz3L/tHxY/9J78Z88myvzW8xkoSTlSa2OAq51/kWEWIVP8HwQhhy?=
 =?us-ascii?Q?SQYmmspCgcveSEm+nTG4XcgXMML9o0FXHwKaoDqZWdAEwZF3zHrzxxS++kqJ?=
 =?us-ascii?Q?h3CUsmRKs341lmQ/tW+Yjxa6waxDOt4XfmBANExAIhsAp3TAST9bJQ+/yZgx?=
 =?us-ascii?Q?LCmMv9Eq68tfHYyyuhrwgHfISl2bG2LX9usfg0qa+v3QlAR/oCmFcjQT+ReV?=
 =?us-ascii?Q?hPImZnOqZQ2vX9eIDrFe7V/raco7agw+wmnVNicmX+/r5EbVPAaJJng9IP/r?=
 =?us-ascii?Q?Xo8cTrYE4jwpcBqTN+7FCJgCrx9QrqJM9DrgWsdBKFsOt1KHHYknwrXpDNjD?=
 =?us-ascii?Q?aSZ8XUCGVDOSxaMcZ9KzUIP0wy/rA70+ScpgrwXbTBeaHeC8wfKqv89e4ctS?=
 =?us-ascii?Q?HQIu+CI24QorFhoKqlsEx3vr+PctYOkICJHsoYEaJR90y5hFxLTDQVBBuYn9?=
 =?us-ascii?Q?PqPIR77qbpYLSFrO+/bZRanN0jxyFel/4hC5Ax+3qo/VJtAKeg+ge1dXZFyg?=
 =?us-ascii?Q?T4cjYriJ6dB+QefBL8rPRQM3yF2M8f03Z4s0bCi7WVeZRgRVvNxqRJr2b1Nr?=
 =?us-ascii?Q?C1Io0xH51fhnXBk3qjNYaw53Zc7gwuBoIIwhF5ozmXEUY6CSSL4x2jcet8zT?=
 =?us-ascii?Q?99LqquaWcH1A1dkA4BjJXx3Bi+KOBm5F/+nOgl3Rwq23daAhjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 08:00:45.3635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aa07aa-50a0-43f1-d29a-08dd03b94746
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150

Some devices, like discrete GPU of amd, support resizable bar capability,
but vpci of Xen doesn't support this feature, so they fail to resize bars
and then cause probing failure.

According to PCIe spec, each bar that support resizing has two registers,
PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
corresponding handler into vpci.

PCI_REBAR_CAP is RO, only provide reading.

PCI_REBAR_CTRL only has bar size is RW, so add write function to support
setting the new size.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/drivers/vpci/Makefile  |  2 +-
 xen/drivers/vpci/rebar.c   | 89 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_regs.h | 11 +++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 xen/drivers/vpci/rebar.c

diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 1a1413b93e76..a7c8a30a8956 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1,2 +1,2 @@
-obj-y += vpci.o header.o
+obj-y += vpci.o header.o rebar.o
 obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
new file mode 100644
index 000000000000..84dbd84b0745
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Jiqian Chen <Jiqian.Chen@amd.com>
+ */
+
+#include <xen/hypercall.h>
+#include <xen/vpci.h>
+
+/*
+ * The number value of the BAR Size in PCI_REBAR_CTRL register reprent:
+ * 0    1 MB (2^20 bytes)
+ * 1    2 MB (2^21 bytes)
+ * 2    4 MB (2^22 bytes)
+ *  ...
+ * 43   8 EB (2^63 bytes)
+ */
+#define PCI_REBAR_CTRL_BAR_UNIT (1ULL << 20)
+
+static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
+                                      unsigned int reg,
+                                      uint32_t val,
+                                      void *data)
+{
+    uint32_t ctrl, index;
+    struct vpci_bar *bars = pdev->vpci->header.bars;
+
+    ctrl = pci_conf_read32(pdev->sbdf, reg);
+    if ( ctrl == val )
+        return;
+
+    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
+    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
+        return;
+
+    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
+    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
+                              PCI_REBAR_CTRL_BAR_SHIFT)) *
+                       PCI_REBAR_CTRL_BAR_UNIT;
+
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
+static int cf_check init_rebar(struct pci_dev *pdev)
+{
+    unsigned int rebar_offset;
+    uint32_t ctrl, nbars;
+    int rc = 0;
+
+    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset )
+        return rc;
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
+    nbars = (ctrl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
+
+    for ( int i = 0; i < nbars; i++, rebar_offset += 8 ) {
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, NULL,
+                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
+        if ( rc ) {
+            printk("%s: %pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
+                   __func__, &pdev->sbdf, rc);
+            break;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL, 4, NULL);
+        if ( rc ) {
+            printk("%s: %pp: add register for PCI_REBAR_CTRL failed (rc=%d)\n",
+                   __func__, &pdev->sbdf, rc);
+            break;
+        }
+    }
+
+    return rc;
+}
+REGISTER_VPCI_INIT(init_rebar, VPCI_PRIORITY_LOW);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106dbd3..5d2aa130916e 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21	/* Resizable BAR */
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
@@ -541,6 +542,16 @@
 #define  PCI_VNDR_HEADER_REV(x)	(((x) >> 16) & 0xf)
 #define  PCI_VNDR_HEADER_LEN(x)	(((x) >> 20) & 0xfff)
 
+/* Resizable BARs */
+#define PCI_REBAR_CAP		4	/* capability register */
+#define  PCI_REBAR_CAP_SIZES		0x00FFFFF0  /* supported BAR sizes */
+#define PCI_REBAR_CTRL		8	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX		0x00000007  /* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
+#define  PCI_REBAR_CTRL_NBAR_SHIFT	5	    /* shift for # of BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
+#define  PCI_REBAR_CTRL_BAR_SHIFT	8	    /* shift for BAR size */
+
 /*
  * Hypertransport sub capability types
  *
-- 
2.34.1


