Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0189DFA9E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 07:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846253.1261430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHzdn-0006dK-Pn; Mon, 02 Dec 2024 06:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846253.1261430; Mon, 02 Dec 2024 06:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHzdn-0006bs-Jk; Mon, 02 Dec 2024 06:10:39 +0000
Received: by outflank-mailman (input) for mailman id 846253;
 Mon, 02 Dec 2024 06:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqGS=S3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tHzdm-0006bl-4O
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 06:10:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2413::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21198c8d-b074-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 07:10:29 +0100 (CET)
Received: from SJ0PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:33f::15)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 06:10:21 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::a8) by SJ0PR05CA0040.outlook.office365.com
 (2603:10b6:a03:33f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Mon, 2
 Dec 2024 06:10:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 2 Dec 2024 06:10:20 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Dec
 2024 00:10:17 -0600
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
X-Inumbo-ID: 21198c8d-b074-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjA3IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIxMTk4YzhkLWIwNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTE5ODI5LjI0MjU4NCwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li5u9gNCJBAK/9rVv0aKPTFOAEU+miZcmDLJAThxhS8ib3hLVh7GQyDd02uqMglNBkULq87VTKXTiNe4N5CIVHxk5BQTSIaxwbK/7NvqfOEmMh7o9u0QN9KVwpMK1cMKP3zGyWCFlUWmiVP0y7vQnyxCT3/RvPW33mh99bw8GcFgQDn+k1Vw57IU64DWQgC7Jyv5oKkMQ3jZFPMs78T/6eA322JvxdrjY6eel5eehsoOPE+4/UF/6mFV1GXMV05SqQQqBtO3cSDqz6GpnInNxKPvudaMkT//QrkovgeHNQYoRWFiWMglfgE5n4jnzvbjIkGaB6lRL5D3NoNZmvJf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr/xcnCn01iQipf3fHerV2YiaNHwJ6ELh6VWKXooNqM=;
 b=LTaR7l93bsQsNEZAtjs+zkKhFHHtul9pFYN0nRwbEduxwU249imfFPpqWdIN7cnsc1CHY9rrnNr0mCH15kVfw9ikz2l6zqXT9x1KQE0RkLpAhbTTMHEvwG/zqtk9SRtgqm9fA/naMhlPJSLiZ4BfprdU6sl5c96GY3mEoxi76VnyzvDmMmYdt8b/rn5sl6XQbO3+yakg3vOhqdL8QJGdFxJJ//sG4MU/c45KvHDzajr3Q4xOe/dmaqGrcGVOapKZVgnxdMWO9KLFJHEypLtbLHw6eX83cD4iYg4IliU8lbKnSM5aZgwgpf8p1WXNqWiA++LeJROPL+abVRzHefbkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pr/xcnCn01iQipf3fHerV2YiaNHwJ6ELh6VWKXooNqM=;
 b=YoydUe4Yk9DF5s1obTC/J+KZXTEChK4kKpyWBqOS2BalJyNRvymvZiWQaotvdwKHXJMWbk9ledeuBUAqgNSBkIr9svYrqg509AUdOd9AtHTKClFU3maoezZDYrZ+KSigW4p8nDP/2wwB+AI8GGC6ByAHsqyRkr+kFCIiK8ZM2fI=
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
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v2 1/1] vpci: Add resizable bar support
Date: Mon, 2 Dec 2024 14:09:56 +0800
Message-ID: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b93b764-fdb0-4a0e-0da8-08dd12980016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kgxXR6+cewt5ibLeavB4neUpsXg38QYTdiXJPLC7XDjOr4+YQxPbaeL4x3dw?=
 =?us-ascii?Q?3faJpsMwSgjg8BBemApqXi/eRb6cO9+dnCMdOX+sckNuAvCBb4Kt282YXaoq?=
 =?us-ascii?Q?3f+fjBsOMOpWxb0kn6/mM07Ari8erNJzdFU5uR/SLtM49l17oCuLFCXZLVs7?=
 =?us-ascii?Q?wXnH/w0dVz4zcnViz+oLLFiGwcuugV813BxkrVu/jUv7Sho/pU7LqVtSkyc3?=
 =?us-ascii?Q?tlgZotrcKMPMuLD32sKz9L1VE0c4PvUbuNl4W05to0ZchSaKeMFQH3EvGItq?=
 =?us-ascii?Q?/ZIi9f5ZV0YKsk3MiO9eaLxJYr29KD6684B12qppGSDOvwPO1mjT1GHC95Pd?=
 =?us-ascii?Q?rk0r7Z40YNw67q6wvuTfw6EpTiAeZ0qXklS5Zt4vn/TFshBTMaFCSmtBZJB9?=
 =?us-ascii?Q?J0Cd5Q0f47vKzUhioTPHdhJLSSJIQINIoS5yIl6y9TI0FG8hHQLQ1H5kNjB+?=
 =?us-ascii?Q?4X6JSgsnLGiC/vVhqqqzHNLnckFuvio12/w5ZyfW3qSWWIj4+DnB2qCw5cHA?=
 =?us-ascii?Q?9ieKzRNDDOE2j7syP8J9YN1ZxxqYqs+gasSlxheCWXRXhg/qonT+CMabGZ77?=
 =?us-ascii?Q?zZ0px8r7T9Xx1IGcLHNHXP4967J6N7L3ClBhtrxi7YxLhp4uk0cPW3i9Z1Mk?=
 =?us-ascii?Q?u7I+jBYNDvqKdvCTbL1uHRK3HnoGMC6pqY+yDsDoivH7zRn+qtEGXqqg07eo?=
 =?us-ascii?Q?ttys6muQsHa/7/TloYkYWvDe41rjX6PT2gOweG7ImDqq/E+3TtGZ0LM6EMga?=
 =?us-ascii?Q?BDzsAaggJPiT2avG/B7vBqb7NsP1LygPaPG72zBhq/FzzjkNcnyNDA97p4OL?=
 =?us-ascii?Q?Cjr5JDtnNw/Y5leRgsqy1Y1TgSps78L2qVbNlE7kkFVJJUR08mgB4yzatFYs?=
 =?us-ascii?Q?+zAWn9H7YH7kaibiRfdydGkV1fIu0wSCTgU6DSKVGRnrCZhhNicARcz4/CCI?=
 =?us-ascii?Q?vVtn26xZ6qGSWI6426HujTKpuHP712vd4k6yQSjoxzmj8U7EYbRCEgnw+/DG?=
 =?us-ascii?Q?TWF7fEX8hTd7aVUqDj4AVNu5OGUa90cGr1+SDEvaETP80AX3uZahiQ+q6HJo?=
 =?us-ascii?Q?1ENOS8zw0BLv3q+g7iST0lYke9kz68/CrEPUMgQTeaPquTpXY1q1dtpDUYVC?=
 =?us-ascii?Q?q56OjC5Ilq7n06NPV2Qr5saS5kF35ve7uMS+ikkNvotwyMAB8e0OioeLjKp3?=
 =?us-ascii?Q?7h8F8vAyX/Yw7mkJ27K7UCyDe52GS3JgkNc2JHrQauHE2vQUrDY/+DTlxxGq?=
 =?us-ascii?Q?D63V9jrbf8idc380mnMU1HyY5M6liP6cM5yqGANhgTUI4VgRnY7gSX1j7Ols?=
 =?us-ascii?Q?390jDZfFD51qOSvM1eNjEK8GLrS1QVpBF0hiOKWAx8Eap+VWcnQ9wXKBjwRM?=
 =?us-ascii?Q?XB25SrdFxqECYy7IRdByjKWzpDePJ0njp4KJaHmAzTBf5se2gZY4teja1R31?=
 =?us-ascii?Q?Lyi8ei+dnp3f7x9JSemOE+h11wdFAu4n?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 06:10:20.0533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b93b764-fdb0-4a0e-0da8-08dd12980016
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844

Some devices, like discrete GPU of amd, support resizable bar
capability, but vpci of Xen doesn't support this feature, so
they fail to resize bars and then cause probing failure.

According to PCIe spec, each bar that supports resizing has
two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
handlers for them to support resizing the size of BARs.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
Hi all,

v2->v1 changes:
*In rebar_ctrl_write, to check if memory decoding is enabled, and added
some checks for the type of Bar.
*Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
no write limitation of dom0.
*And has many other minor modifications as well.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/Makefile  |  2 +-
 xen/drivers/vpci/rebar.c   | 93 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/vpci.c    |  6 +++
 xen/include/xen/pci_regs.h | 11 +++++
 xen/include/xen/vpci.h     |  2 +
 5 files changed, 113 insertions(+), 1 deletion(-)
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
index 000000000000..156e8d337426
--- /dev/null
+++ b/xen/drivers/vpci/rebar.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Jiqian Chen <Jiqian.Chen@amd.com>
+ */
+
+#include <xen/hypercall.h>
+#include <xen/vpci.h>
+
+static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
+                                      unsigned int reg,
+                                      uint32_t val,
+                                      void *data)
+{
+    uint64_t size;
+    unsigned int index;
+    struct vpci_bar *bars = data;
+
+    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
+        return;
+
+    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;
+    if ( index >= PCI_HEADER_NORMAL_NR_BARS )
+        return;
+
+    if ( bars[index].type != VPCI_BAR_MEM64_LO &&
+         bars[index].type != VPCI_BAR_MEM32 )
+        return;
+
+    size = PCI_REBAR_CTRL_SIZE(val);
+    if ( !((size >> 20) &
+         MASK_EXTR(pci_conf_read32(pdev->sbdf, reg - 4), PCI_REBAR_CAP_SIZES)) )
+        gprintk(XENLOG_WARNING,
+                "%pp: new size %#lx for BAR%u isn't supported\n",
+                &pdev->sbdf, size, index);
+
+    bars[index].size = size;
+    bars[index].addr = 0;
+    bars[index].guest_addr = 0;
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
+static int cf_check init_rebar(struct pci_dev *pdev)
+{
+    uint32_t ctrl;
+    unsigned int rebar_offset, nbars;
+
+    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
+
+    if ( !rebar_offset )
+        return 0;
+
+    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
+    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
+
+    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
+    {
+        int rc;
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
+                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
+        if ( rc )
+        {
+            printk("%pp: add register for PCI_REBAR_CAP failed (rc=%d)\n",
+                   &pdev->sbdf, rc);
+            break;
+        }
+
+        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
+                               rebar_offset + PCI_REBAR_CTRL, 4,
+                               pdev->vpci->header.bars);
+        if ( rc )
+        {
+            printk("%pp: add register for PCI_REBAR_CTRL failed %d\n",
+                   &pdev->sbdf, rc);
+            break;
+        }
+    }
+
+    return 0;
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
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..3349b98389b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
     pci_conf_write16(pdev->sbdf, reg, val);
 }
 
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write32(pdev->sbdf, reg, val);
+}
+
 int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
                            unsigned int size, void *data, uint32_t ro_mask,
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106dbd3..3fa6a9f8cad1 100644
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
+#define  PCI_REBAR_CAP_SIZES		0xFFFFFFF0  /* supported BAR sizes */
+#define PCI_REBAR_CTRL		8	/* control register */
+#define  PCI_REBAR_CTRL_BAR_IDX	0x00000007  /* BAR index */
+#define  PCI_REBAR_CTRL_NBAR_MASK	0x000000E0  /* # of resizable BARs */
+#define  PCI_REBAR_CTRL_BAR_SIZE	0x00001F00  /* BAR size */
+#define  PCI_REBAR_CTRL_SIZE(v) \
+            (1UL << (MASK_EXTR(v, PCI_REBAR_CTRL_BAR_SIZE) + 20))
+
 /*
  * Hypertransport sub capability types
  *
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc2791..72992e93cece 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -78,6 +78,8 @@ uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 void cf_check vpci_hw_write16(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
+void cf_check vpci_hw_write32(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.34.1


