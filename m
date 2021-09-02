Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3133FE97B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176932.322166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYx-0006hq-JA; Thu, 02 Sep 2021 06:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176932.322166; Thu, 02 Sep 2021 06:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYw-0006R6-Hg; Thu, 02 Sep 2021 06:51:02 +0000
Received: by outflank-mailman (input) for mailman id 176932;
 Thu, 02 Sep 2021 06:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLft9-0004hL-Ea
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.96.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17559226-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:07:45 +0000 (UTC)
Received: from SN4PR0501CA0083.namprd05.prod.outlook.com
 (2603:10b6:803:22::21) by DM6PR02MB6716.namprd02.prod.outlook.com
 (2603:10b6:5:218::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 06:07:43 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::de) by SN4PR0501CA0083.outlook.office365.com
 (2603:10b6:803:22::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.12 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:22 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:22 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsg-000F6q-Dd; Wed, 01 Sep 2021 23:07:22 -0700
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
X-Inumbo-ID: 17559226-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnC/zNap3NmjyBziOpMvDWQXaPdOpD89oEQX+ubKVltND/+dxXMhbCEef2RIk5fspdbgiS9gDPtZQq3zCITQVgOVF1uZiVBRGPBF7wpnaJTpPeHrFM6OkggsLyVJXDrhtYW2hrXmePDB4S66IzUgNe1UyNA2WdXvOQQLI4APdUegOtGSTURqS7M+l4rabkrgmWs2KasRCUHP8uTwnNkhmUMw8levOdkR+5/ef3tXxyRGteEuIiiPxpHccPEQ0mrrxSu5Lf1S0P9rmY1nIWJnpDRWxnOupSWTCQf0yuuFfW6LcczPQwRCjIjtYlwpFaunZxeeisESEJ6n96k94KLBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7bgcXdJTXoKYKNKTamQfYEjcYOoItL0nadg/TeJWjc=;
 b=mCyKJMgU9KJR2RtMojV/Nq0IeDvxGu8cciiDV6vgXxXvjrWj2YRRx7I2AzY38N1UdzdvOgh4xi6nk9LpDA+IMz7IU+v6u2krT0D5+nlafEs9Mlc/thIRB9/f+HueuSPg/MzfghNoCoH0BQXn+HvbqziYrlX7dBED9WI6WNok43sUhExApe4rGUy5ruW0DJcToXlawTIBdQDNJOZ6pNpuml+IciSWp+0ITRqq2I6lQBShh0erdZVReobp6e9oRS8JH0PCdrz9jxTXADdWK/DuvCe9dt2eO2pZm51SeD2FwORtIOlMoj07k1gPrdl9ZkfVklibdDbwKiS/FzLqT9VnPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7bgcXdJTXoKYKNKTamQfYEjcYOoItL0nadg/TeJWjc=;
 b=ZG9hLXS8uar1ahAzaZbhU+0vOk/tGHggI3e0eGYbEHfIYivRIYEWMUhYiJ9hbCFMovIqQCluPtHSXTRMAzhns7Vc8PT+WQtJ+jrN1lll1hYQl2ifrGQIHF+Z3W+pE3/s0ztIMnMN5dMMaoDB8xO7KnPWrDnWmzMjC2PiSCYk87c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][RFC PATCH 12/13] tools/libs/light: Implement new libxl functions for fpga-add and fpga-del
Date: Wed, 1 Sep 2021 23:06:02 -0700
Message-ID: <1630562763-390068-13-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 486282e8-4a79-441f-0264-08d96dd7f9cd
X-MS-TrafficTypeDiagnostic: DM6PR02MB6716:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB6716778FE694B490CB32CA89BCCE9@DM6PR02MB6716.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7da38gZlNn3e0k98mCCgPkePjD0Y6Mmg0n0YzpnVhA0UlfuB5PtLftDi2EmxPx5t2ro6pNFEXqnNkkCuwKgzDXPCcxuP1NQyaLEa8ErqZ9iRkiuY3Ru/vGcOe9xBKTySCWC2jPD8fVxCnIejAHeTXFhe5Zu7LhTJPAslvMCEOMpCuiqF02LrUaQFBAc06+i5E8dtctC7wPCXS2VMh0HOcpkloSw7Zov9gZFEYKc5ZtjpC8YJ5OhFVHPu/n0fkee9oel19yvc/bWYJQ8bOJwaJRRmrkDu5aQTERE+/0ujwxzwhs/OO97SWl4ryH5dgZfiDB6/iwxsDtMi2BtK1mzxH/Ri91eBsA1UUY7NC6ZiBySz30zgJJznLRtqvX0CPlWKLfE/vl8NqfWnoJUioVY9Ya6PSfz8VhsRByWdoF6B9PtbyDzEGL5eeMNaPyGC7LZwq/PKJkM1+DPNyUInV1dWmmteoA6KmE1g8Cv0DQSgjd0iAstUEPIgJQIH6K8JJCb74AlYyaP4QTpJgXq1j0F9e/vyJbavJaZBGsYQbzMpSn9cSvIeao19phWmnSuthBGWkPTRWHbjMuhFJldRoo/hjmn2xPT1bHJ5TbmTVFyINAGBDRa+cLHf6wE7gJL/8QbP+q2edzuWDNuHBamFm2RKM9eTGDaWXqJMImXayVfl8p6iYd/UZDAo/GPZw0F4IFtifKL+xW3y56Ldghk2SNF8Q62oJmzgOArPmE1rQTWg0D2NpE3qqGoclTPp1VXZ6V2X
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(46966006)(82310400003)(70206006)(70586007)(5660300002)(36756003)(8676002)(9786002)(36860700001)(8936002)(47076005)(478600001)(4326008)(54906003)(82740400003)(316002)(2906002)(36906005)(356005)(7636003)(336012)(186003)(2616005)(426003)(6666004)(7696005)(26005)(6916009)(102446001)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:42.5194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486282e8-4a79-441f-0264-08d96dd7f9cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6716

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/include/libxl.h         |  5 +++
 tools/libs/light/Makefile     |  1 +
 tools/libs/light/libxl_fpga.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 tools/libs/light/libxl_fpga.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d..896cbcf 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2386,6 +2386,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+/* FPGA device add. */
+int libxl_add_fpga_node(libxl_ctx *ctx, void *pfdt, int pfdt_size);
+/* FPGA device remove. */
+int libxl_del_fpga_node(libxl_ctx *ctx, char *full_dt_node_path);
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 7d8c51d..b17d4a6 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -115,6 +115,7 @@ SRCS-y += libxl_genid.c
 SRCS-y += _libxl_types.c
 SRCS-y += libxl_flask.c
 SRCS-y += _libxl_types_internal.c
+SRCS-y += libxl_fpga.o
 
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
diff --git a/tools/libs/light/libxl_fpga.c b/tools/libs/light/libxl_fpga.c
new file mode 100644
index 0000000..a33d00f
--- /dev/null
+++ b/tools/libs/light/libxl_fpga.c
@@ -0,0 +1,73 @@
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
+static int check_partial_fdt(libxl__gc *gc, void *fdt, size_t size)
+{
+    int r;
+
+    if (fdt_magic(fdt) != FDT_MAGIC) {
+        LOG(ERROR, "Partial FDT is not a valid Flat Device Tree");
+        return ERROR_FAIL;
+    }
+
+    r = fdt_check_header(fdt);
+    if (r) {
+        LOG(ERROR, "Failed to check the partial FDT (%d)", r);
+        return ERROR_FAIL;
+    }
+
+    if (fdt_totalsize(fdt) > size) {
+        LOG(ERROR, "Partial FDT totalsize is too big");
+        return ERROR_FAIL;
+    }
+
+    return 0;
+}
+
+int libxl_add_fpga_node(libxl_ctx *ctx, void *pfdt, int pfdt_size)
+{
+    int rc = 0;
+    GC_INIT(ctx);
+
+    if (check_partial_fdt(gc, pfdt, pfdt_size)) {
+        LOG(ERROR, "Partial DTB check failed\n");
+        return ERROR_FAIL;
+    } else
+        LOG(DEBUG, "Partial DTB check passed\n");
+
+    /* We don't need to do  xc_interface_open here. */
+    rc = xc_domain_add_fpga(ctx->xch, pfdt, pfdt_size);
+
+    if (rc)
+        LOG(ERROR, "%s: Adding partial dtb failed.\n", __func__);
+
+    return rc;
+}
+
+int libxl_del_fpga_node(libxl_ctx *ctx, char *device_path)
+{
+    int rc = 0;
+
+    /* We don't need to do  xc_interface_open here. */
+    rc = xc_domain_del_fpga(ctx->xch, device_path);
+
+    return rc;
+}
-- 
2.7.4


