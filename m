Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511344A74D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223699.386533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9m-0000eo-W0; Tue, 09 Nov 2021 07:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223699.386533; Tue, 09 Nov 2021 07:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9m-0000ci-QK; Tue, 09 Nov 2021 07:02:58 +0000
Received: by outflank-mailman (input) for mailman id 223699;
 Tue, 09 Nov 2021 07:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9l-0008WR-9g
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:02:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f77f2f4-412b-11ec-a9d2-d9f7a1cc8784;
 Tue, 09 Nov 2021 08:02:55 +0100 (CET)
Received: from DS7PR03CA0311.namprd03.prod.outlook.com (2603:10b6:8:2b::23) by
 CH0PR02MB8010.namprd02.prod.outlook.com (2603:10b6:610:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 07:02:52 +0000
Received: from DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::bd) by DS7PR03CA0311.outlook.office365.com
 (2603:10b6:8:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:02:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT010.mail.protection.outlook.com (10.13.5.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:02:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:50 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9e-000Ga6-IY; Mon, 08 Nov 2021 23:02:50 -0800
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
X-Inumbo-ID: 0f77f2f4-412b-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/5951yxrc2G9GErmcRSoyIb3W2UIxzv/4klY4KIlIBXWLMh+aMhJ7elFB1m4eeR9ZbwfOiGEh1/hlgD5/m82d57ZP53Ni/JXOUSxEhHf/WKs2zYV4mEeuQTomEIajQd7g/8i79EU8WgjiuS2IDBHH64FqEgj1zNOWJU9GJCRmWfkEUFSikVmeqbzoR7+QfgGMChRQ6O1S5scW4EaxBivwy7n/KDEhaKgXwseVO2qmN365dMYBnMZy6f1JUilQMgDq5SOPqr4glpkuxeUqraMWBnzVih/EFADQgX1Tj1Bpd0u55JN6eeXLEbZu+geicveEGMSRo+8kGa8nUESdN5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5zhM1yaBAdXw5ec2yVU1t3POrwQaiIRB5jEhPe+n2w=;
 b=NMehr3lFLvJr1Uocc5AeVibjwCOXVpKx2VTFdmjbxy3h1nPpfSnseMuGvVnD4WLs4kYtix7rCGaNV4R5kIsMGon2Vj20ibE7FSdQDRmf4zzk6m7zCLzTvkO6btK7NdxT/lJ6AoQFkwh2Y6etiU/jwjjXpC1mj0xPn3IB4EabCIzEFVO9zQaYTaV9K/7JnpUX10sRwWCtzS/FGKSA23exGcWWRqFAs+1WW5p6ztO5XKN3hrvRQqgs/hcxU9x03SiRoUdvNzbanoJi937ETgIdm+qzSipPP2/8WHfLJky8jC5l37lD1Kg6bkeaxU+YkM1It3acw3LYCwDyU4LmvR+wag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5zhM1yaBAdXw5ec2yVU1t3POrwQaiIRB5jEhPe+n2w=;
 b=Cyvb4k4giMGG9wy3hW21e5Q7Tl4i70A4dlqGW617FSi7loKSqywcANKrkEj7suYPRvFh0WPHvvMlmVgddKzpup7mD7P67TwqW0g538gcaln7xg0J8TVqaNm2XrPu10jleH565I61p1VpJICSLKKhXLDZzx0MGihkyDlV8ehcdRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][RFC PATCH v2 11/12] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Mon, 8 Nov 2021 23:02:26 -0800
Message-ID: <1636441347-133850-12-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64343fd2-fc7a-44ec-a629-08d9a34ef2eb
X-MS-TrafficTypeDiagnostic: CH0PR02MB8010:
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB8010C004428E2BF83FA9E108BC929@CH0PR02MB8010.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYfXO1AdMcMIcgMFoXbr0iAxdityKK5JvQJ6xFA9s28qBXZKeIvaDfd3AhkGRa0mo+N0AvYXsYx+Aq4rLU1R9OdRG/lGI/1Btp9NMEJzYxrH9eqR+JT2j1CwksihAhb/I/lE7d27FmA606EbhhdTahWjnSL7mq99wMyRNr3DCCb5VoDwCf9Dm6hdVBf9xb11V0VDWVO0B8CGYyWV6d0pHsuiFCqm8nqG2DEfAE7k+wFAqyvDiJ++5jEAHFYCD51IrUbuGypITLvss265cpUiGIVUJmpZypsFZSoH9Xi4jEgeuoiORWMU+WciLlJ4KKJPjtoj9HUCi6WxDzmnBuNpAlvG1Z5Ay1LWAdTtfkavjgsYfLvgRezzsYLHF2g4YTY7ft9OYJKS4Zve2R5c7JTJ6i0N/CWxP6SHLBViw04tO9hbTIvbJ8mbAAZfMsER5gBI05Zxj38FwOlslRmk1dpQAL8J9EwOSvP7EO9Jh2r60LYI30vB0L+1vcTOEAN+RFJ4qwHmakRzWSl6Y/IIxWQsEsZXOdFd0UsPBAmUmcqudHtDhkassbABiwueKrCK4ACDIKohz7EgNfvvHQ7f1GidDxxKmlG8C1A1KjND4Cpp7T88rT0oSxn3Fle9egsaB+zctPxEubVMPErKnXl1I6kEX5X5qgA4aQuThLnkRn5Wd0bDbpPE85uDtg/pzzSc0Evdu/kPqYSfkyP+yUY+bL3AYWIQFqD8P5bRTJJTlAVbfbqhm+BS5Cv5K18GPKLMrYRi
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(54906003)(7696005)(36860700001)(336012)(8936002)(6916009)(2616005)(426003)(82310400003)(26005)(186003)(508600001)(70586007)(70206006)(47076005)(316002)(8676002)(6666004)(36906005)(7636003)(2906002)(356005)(9786002)(5660300002)(36756003)(4326008)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:02:52.6982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64343fd2-fc7a-44ec-a629-08d9a34ef2eb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8010

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/libxl.h            |  5 ++++
 tools/libs/light/Makefile        |  3 ++
 tools/libs/light/libxl_overlay.c | 65 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 tools/libs/light/libxl_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2e8679d..3dcb3e7 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2406,6 +2406,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+#if defined (CONFIG_OVERLAY_DTB)
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+                     int overlay_size, uint8_t op);
+#endif
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 194bc5f..0fffa93 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -117,6 +117,9 @@ SRCS-y += libxl_genid.c
 SRCS-y += _libxl_types.c
 SRCS-y += libxl_flask.c
 SRCS-y += _libxl_types_internal.c
+ifeq ($(CONFIG_OVERLAY_DTB),y)
+SRCS-y += libxl_overlay.o
+endif
 
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
diff --git a/tools/libs/light/libxl_overlay.c b/tools/libs/light/libxl_overlay.c
new file mode 100644
index 0000000..d965aee
--- /dev/null
+++ b/tools/libs/light/libxl_overlay.c
@@ -0,0 +1,65 @@
+/*
+ * Copyright (C) 2021 Xilinx Inc.
+ * Author Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_osdeps.h" /* must come before any other headers */
+#include "libxl_internal.h"
+#include <libfdt.h>
+#include <xenguest.h>
+#include <xenctrl.h>
+
+static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
+{
+    int r;
+
+    if (fdt_magic(fdt) != FDT_MAGIC) {
+        LOG(ERROR, "Overlay FDT is not a valid Flat Device Tree");
+        return ERROR_FAIL;
+    }
+
+    r = fdt_check_header(fdt);
+    if (r) {
+        LOG(ERROR, "Failed to check the overlay FDT (%d)", r);
+        return ERROR_FAIL;
+    }
+
+    if (fdt_totalsize(fdt) > size) {
+        LOG(ERROR, "Overlay FDT totalsize is too big");
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, int overlay_dt_size,
+                     uint8_t op)
+{
+    int rc = 0;
+    GC_INIT(ctx);
+
+    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
+        LOG(ERROR, "Overlay DTB check failed\n");
+        return ERROR_FAIL;
+    } else
+        LOG(DEBUG, "Overlay DTB check passed\n");
+
+    /* We don't need to do  xc_interface_open here. */
+    rc = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, op);
+
+    if (rc)
+        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.\n", __func__);
+
+    return rc;
+}
+
-- 
2.7.4


