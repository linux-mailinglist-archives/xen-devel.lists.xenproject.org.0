Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BF778161D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586784.918115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9wR-0005IW-9t; Sat, 19 Aug 2023 00:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586784.918115; Sat, 19 Aug 2023 00:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9wR-0005FB-6C; Sat, 19 Aug 2023 00:35:47 +0000
Received: by outflank-mailman (input) for mailman id 586784;
 Sat, 19 Aug 2023 00:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qI-0001hl-Uz
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 722cae73-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:24 +0200 (CEST)
Received: from BYAPR11CA0089.namprd11.prod.outlook.com (2603:10b6:a03:f4::30)
 by MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:21 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::df) by BYAPR11CA0089.outlook.office365.com
 (2603:10b6:a03:f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:20 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:19 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:18 -0500
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
X-Inumbo-ID: 722cae73-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlnmpfAf+0d0yqLlIBWJFe0CIm2r1P/GXXgkWJWsXT+C8NTZw3597UPOKTak8Hxgq+rS1PkeSCUi+PRWgA+0mDertEPasdBwsBfTaWcKECOukqTBDGj1CqfSiqL4rb4MPCA/SS7vaY5m7xjaCSgz9W9X+CaTXp0RrICS+xwG7uksEzqG+Xb5idkKJyS9qM2CRFMsHkoadc6FtA9cFQTPNtZolIVR6pY3OQVEYKzvih5L7rEw+1lQF/IojT+/oLEkimKRLqsYOvRfcB6MgNeF+QrSMqsaodmXWTCyDYF4mnLiDwBJdv+U/y9pXEZ1TCenpyisvIHm3tfBNHgPd8ldxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=eOM7K8Umq3fWB9LibAOCWCcI/i2SkAbtZn9aYp4vTmo0ZYnTcxE082F/awSwVFJtXqG5GgKc7LpqS36q7Gdze9fPBHkpYKrhZlSRr6R8ANhp1IjZ1UiBcwOsLI4r13yxHqtW5JIkY3P0m6/Ur2JUdXhvpOKrJbcODZJYmJrSksAkkIOXynSmEdrEioClkWKH4/plFU5yHsByjgXcOZ0Wrrw9+7NpovUqgClktSxY64ruyY1YH9BfbbtfuV15krwDxZvWPTcI+E/sMHCmhm6B2J0bsaabT5ViTjpGc3fmAkJcQt8bzuh0zOLC3p5lmSz1ISNZNV15zzsECwNgVCZJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=QRPrLd/Jc43Y2IT8MtYFfMZr2qDZyqS9MwgFPosP4FRr/iMMtKQoI2T9yI+Ec8k8erMQRoWIvJXzRNzrdOpuFMTElCvttQGYwif2DRCrEvRLPceiLENnaxvdYK+vZmyJnrKvtokwhUGoFKXQ2aj8mxadgdj/OfLFy/AhbBbeYW0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v9 18/19] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Fri, 18 Aug 2023 17:28:49 -0700
Message-ID: <20230819002850.32349-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fe3671-8a9b-49a4-4ab4-08dba04b5492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fVFFnqgUBXQfVtUZZ+rdQLks6xvFaeVUh9LFHs8/K5KFYOc+HF9CPSjBdmA1ZuPYAg8rqxlMMA/gsnoICbOAwNjmfLhwsOw5shtQ0dL4mzscIC3V5sku2TPUvqFwTJGv00yGjwCxnKYWt8ngjKGiIdS9P69AbnAYCSuC3TBt5FWbYhS1iVbXc3+c2UYzvJAu2Ez2Kqc6aCiMgP5FPp0xNSEQamgBrq8VZXlN0GqbvqYkfjyGb8wor1SD/xXHhNhBHeshdn1/VjrO9xCyZw0b+NzsTvf9Vv6EofKmL+OK8JqA7d9CZpZNJEaq8e7roMhIWk7mBQYZ6n9u6meXX+QsQaGdoxqeaNmtNdhSqaajHxa3II1zvty4lWdGl0e8Gq9GbYIeW4I3mVtNqxcIG7r3EhFmBCu6Yo2nJXGqWK/aBjGbYPbNbXSeqz97jThDCwLFc/IdahWGmJKzvrYYDq/Op4N/UfG2E0QdB56Vn761BvdkIsTaY79GVLWXti3lKqfrNkvh9gD/hIFk4gqSoBYft8qizkz0L3Nj5oJZ4tBKE9i5HjPgdVv5MaGzIRJVPYUZ060XRzxITlAUmezfwUgSl6Wd4rgaTJBabO+AuKHAmOC8rfn7QgyEkRIkYcA2aSUqWSYEKcXs3Qr4AfGP+TZhTxuW8wxJ+rB5kYhmi8gOfzTVIoHy2yQvad9hH1+zKZSxoGeJR2d2u/TvK4pcMCd83Xy5f5s/u96cFbuQVBc1vhUfpj45qNqeg1rPcYUoI2ttpuyJ1EGvwcUxjSgO6kjfdo3IqsNVAC1q9BFxi9JJnmk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(36756003)(40460700003)(40480700001)(8936002)(4326008)(5660300002)(36860700001)(1076003)(2906002)(8676002)(41300700001)(26005)(44832011)(426003)(47076005)(6666004)(336012)(2616005)(356005)(478600001)(82740400003)(81166007)(316002)(70206006)(70586007)(6916009)(54906003)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:20.3359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fe3671-8a9b-49a4-4ab4-08dba04b5492
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h               | 11 +++++
 tools/libs/light/Makefile           |  3 ++
 tools/libs/light/libxl_dt_overlay.c | 71 +++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 tools/libs/light/libxl_dt_overlay.c

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index aa5b1c98d4..b4f2a69b34 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -259,6 +259,12 @@
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
@@ -2493,6 +2499,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
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
index 5d7ff94b05..ba4c1b7933 100644
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


