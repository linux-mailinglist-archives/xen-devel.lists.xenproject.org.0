Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE76F4DB4
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528899.822687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaH-00067O-7t; Tue, 02 May 2023 23:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528899.822687; Tue, 02 May 2023 23:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaH-000655-4D; Tue, 02 May 2023 23:39:01 +0000
Received: by outflank-mailman (input) for mailman id 528899;
 Tue, 02 May 2023 23:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ8-0005Si-KC
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5852231d-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:48 +0200 (CEST)
Received: from BN9PR03CA0269.namprd03.prod.outlook.com (2603:10b6:408:ff::34)
 by MW3PR12MB4441.namprd12.prod.outlook.com (2603:10b6:303:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:44 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::2c) by BN9PR03CA0269.outlook.office365.com
 (2603:10b6:408:ff::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:42 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:41 -0500
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
X-Inumbo-ID: 5852231d-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9KJvxaJwC7gSbVT/N0kcaG447n665alx2AFy1uWliqBzkmRVikvSOeO+S5Ubpv9EW2JcueM5Ns+LHYlbYnq2CXHnK42OyJIzo7cngq1FoKWKXJ3DhSjBMhpQvTSt1h8JjgB1LMxOR29g0qrnriJlFI2LRg0QdJfoUhmXr3lvOJNfiENv/A8ZVn1j6l6wS0MSe+xWd16iR84yEJZQVZ0BLIWNbeNxflQqJQEfAJQMO3rgNSl7/Ahsuth0O9lY3N3jqlffV6vvLBmhAyZPh+EmCkQUjfxNQlPSpSdVSFxMF0tpwnim08Frz6HPdZhK9yNmXLFa1ciisrAfJF7SwXm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91E2KEtRfiC4xks88DcPT08G46pT034ykx3UwRRlezk=;
 b=bYPfW6hbwLA+thF6ca7CBjdBIlWJxlk0Sg5jlme6Najiqe+bl2kdfgvb97Lr+ujgZnd4yrJVZ8MdH4XyKgWpUl0bQF3ZjeQp7ijqGU8lsZq/G5g6ZqtRNJ5SRa+s+iWE6vldLb98w9LDhKS/ftkDFxl2DCo1IgquGcvjki0aPp57C1FQ7LFKJB5bPpV7XEfq9cQHjeZElRmjpwb1TwPwZQfQxYjbRMglaBJv79zZqksys65Edxe1mcHZ5cgwqZXR5HksP1Hd6gmEwCjMWkaqqZPmMsUQUdA8KDUKxF9M2s4Y0MUfYrHMMc05ILm+6nBeo0dR+Dv7A190Ox9L3rwaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91E2KEtRfiC4xks88DcPT08G46pT034ykx3UwRRlezk=;
 b=hQeYj5zsHKXYLQ5oZ+X59iJtWrHLjoaauVSb5Tg/5IuQt5Vu2d4Z15FmUy4YWG5JY45jxcV6Mn/UmRM7SLJRVyd+CAWee5mFkcfL/V3wyZtDY/djiKDk9/8z/eZnZ1kvSIodkAC+saLlGRKZJlvyxPvaIRZZizMj6eStxABGNhw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v6 18/19] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Tue, 2 May 2023 16:36:49 -0700
Message-ID: <20230502233650.20121-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|MW3PR12MB4441:EE_
X-MS-Office365-Filtering-Correlation-Id: 5347c826-59cd-4976-0a45-08db4b663a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WDRiwXSfCM+NKXNP/23ZDrpZh1shJqPjsyD0mxQbTv1llItNW+0F+6gp6h0+uCV715uKpHYCDSt2Y1WQIXGT+iX9roA/pKCce3QTT7lnpTYZHeWQaUB7EhUZlKuyzOczC7fkm0Z0EMqyCmDdZnTkyCDStaEx5cRm6xUxinC9eEINZhxvH8k4LmpdIdPm43on96NUQLxZKmVXGdYop5XVEy6pEO0aXd6ThHiQKO+bQx2gO4JONuKwuJRAR787zGyKibdnysVIlGPXYTQxt3lXGrC2EkXHeac4+0v5VG3pHU0OhvItI14/9ZiEkjUQbfOrt2mC3zAfgS8Gwd4xFzp8avQeXywY6RKxwMcM2fMyg+jvH3Q2fCwWAR+W2RxRXWF4/Lb1OyhPBu7bO5tKawuRrK3/xk/2HubNPyKJN2z++G68x+6cUEtfq+a3VgY5pJwfSPxdvVMxZKA4/SeYJuzurysfof86jlj3PokCw89qmnYZb41pyaknKgQWmL3pRMoYz+rQ2T1G0GEupxlkpxEafGt1IvihjOz5DyEDWHNZvqSEKH+sPw/1j6w3YtClPsbWI5sittpV1abYsn8H//mvN1VMsTdz3VhQ3DUzeh+QmD8EGba7mCL5Wph1X4G34D0Km0niXBTAJniZzNRG13WnybOhoq5ioKU5JABDwClfiAmfPL8n67pGUr8HZEiWhck7uoeR+/0PqNbZltJ7CiPFbW1BpOGEMvOZGSyuqzwix2+9vrylBuO9x+HVXW3RdaNU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(82310400005)(316002)(2906002)(6916009)(70206006)(70586007)(4326008)(36756003)(40480700001)(86362001)(54906003)(40460700003)(1076003)(8936002)(8676002)(44832011)(2616005)(336012)(426003)(36860700001)(5660300002)(186003)(47076005)(26005)(82740400003)(356005)(81166007)(41300700001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:44.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5347c826-59cd-4976-0a45-08db4b663a80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4441

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/libxl.h               | 11 +++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 71 +++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cfa1a19131..1c5e8abaae 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -250,6 +250,12 @@
  */
 #define LIBXL_HAVE_DEVICETREE_PASSTHROUGH 1
 
+#if defined(__arm__) || defined(__aarch64__)
+/**
+ * This means Device Tree Overlay is supported.
+ */
+#define LIBXL_HAVE_DT_OVERLAY 1
+#endif
 /*
  * libxl_domain_build_info has device_model_user to specify the user to
  * run the device model with. See docs/misc/qemu-deprivilege.txt.
@@ -2453,6 +2459,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
+#if defined(__arm__) || defined(__aarch64__)
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+                     uint32_t overlay_size, uint8_t overlay_op);
+#endif
+
 /*
  * Turns the current process into a backend device service daemon
  * for a driver domain.
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 96daeabc47..563a1e8d0a 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -112,6 +112,9 @@ OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
 OBJS-y += _libxl_types_internal.o
 
+# Device tree overlay is enabled only for ARM architecture.
+OBJS-$(CONFIG_ARM) += libxl_dt_overlay.o
+
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
 endif
diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
new file mode 100644
index 0000000000..a6c709a6dc
--- /dev/null
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -0,0 +1,71 @@
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
+int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
+                     uint8_t overlay_op)
+{
+    int rc;
+    int r;
+    GC_INIT(ctx);
+
+    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
+        LOG(ERROR, "Overlay DTB check failed");
+        rc = ERROR_FAIL;
+        goto out;
+    } else {
+        LOG(DEBUG, "Overlay DTB check passed");
+        rc = 0;
+    }
+
+    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
+
+    if (r) {
+        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
+        rc = ERROR_FAIL;
+    }
+
+out:
+    GC_FREE;
+    return rc;
+}
+
-- 
2.17.1


