Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14FC77EE78
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585045.916077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDd-0003AP-JA; Thu, 17 Aug 2023 00:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585045.916077; Thu, 17 Aug 2023 00:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDd-00037x-Fa; Thu, 17 Aug 2023 00:50:33 +0000
Received: by outflank-mailman (input) for mailman id 585045;
 Thu, 17 Aug 2023 00:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4N-000280-V4
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e88::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba26f191-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:57 +0200 (CEST)
Received: from CY5PR22CA0095.namprd22.prod.outlook.com (2603:10b6:930:65::13)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:51 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:65:cafe::9e) by CY5PR22CA0095.outlook.office365.com
 (2603:10b6:930:65::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:50 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:50 -0500
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
X-Inumbo-ID: ba26f191-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF/nv3PDUb/ecNR6tMXNfToo18rNqv80My1N3evK8wV5hJtxJuK3Tacthb9k0COZvcazUtTWyEr818J+VD6eouhVmCicz01TyH+lo8/LcbJz+Vws8QJimVW4eWx8uPHTP7rVjinUE45/TpnVnSYaqlg7dd6gda5oHgVXi3uW/1a4BU9hH7NKZyNFJpFcuccfPW9vLVLefaCj/jVt+Ge4+M84+zjIsn9BFwvFncrblqyx8VBvN+XKJBXPWB3vHKcmsRK/l1fqsRHoG3iOQjgvJ/9aGWxnkW4sMZKZ6622NJ6kNgAS7GgN8lA22vS3ugl3JOQFMsde37Md9r9A6ttLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=bXurwo8Q1hRorkclsgGurF/NCAWEGQILwBsMm6VQE2nSh3790WVT7prN190Wo4OXtDqJwLGZlbOtwk4WOWLRSpuRltS7GQB6CGaSP4Vbbd4WMCjqe792mKZHjyN9WdjkFYtgOaz8L8KM0xhmgfohKcojvPRN/s76fg8usWezM6FpxCokV7Qoh9T4kq73rltoR2Bn9lw7HGxiD7Fk0a/6PLPYSz8KmZu08goYkhLuhVsb331FH8X1YuOlDbqW2tfoxXzi/4+2kpLDki9QZ8JGl0FEvkvVJSD2u76NSmC6WOa0PUDt2QaBo7tm7w2kvGUcx/uGVcy3zldWRaMqbMLjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niCrThl8tSMKvN20vRpMYz3k/B1BccExVBIC4Bh0pr4=;
 b=MFE9jO5mwevqGUnAnP3Pn1XvS00/YzXJP6uxtWZX8Hh7WOytXpmyNHjDPBc63Z2O7rnaA7Pr4fThmRFVfaPraidEaM7/cCPYjftnM1rdt7rPwZX+Hu+sKdn+vyKvWqymg+qM1eb98pJ2H3RyS9rzlY588CW/03svIdU/DRkqb4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v8 18/19] tools/libs/light: Implement new libxl functions for device tree overlay ops
Date: Wed, 16 Aug 2023 17:39:46 -0700
Message-ID: <20230817003947.3849-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH3PR12MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: c92ee712-76bf-45cc-850d-08db9eba9bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnEDntm4nuvJ4sJ6D2gyBlHfPVbxMl0I0gZV9Ud7J3UpaEt5nGd0xakWuVlo1TQCKnb5nMvyPE2jaOo8ayqCMSe5HaSxDEGEKo3Tgw3kUpmR7tLsrRAe4SvkA5gkQBQhqP3NI6KgWJzFCXAKSroFz5zHnBmhZzcR31GYcW93vNwVQnXPu0Tvtw6K2YqQIFe6YumDLQYvb+9InV8ihP+l0EGCqMtpU++r09HeR7mN2ILRMMOKpf22S2KuyDa0JSQCYdiGcrUgRur66I6WqdUDwUYhtYP7sfRR+QenAS8frfRLh88f/1D8rj8GYudZV5XFJIT4ANBnDdGT5s3p3SKRz93anXFaqPz42ElY0eiSfi2DhjGa4n5nKWaxBJlp+7Y3ZGDSO3GjkNkpK1XjE33r9z1hYcJ2aTjDUeTz9P7CDjKqNGFY9CFTSvKBt1yrxQs3bs6BrnLKTlzKXVeXX/NNDxtueiFsgnPFcdfBb/pXuZDCCRqymBs8rqy0IlCyRcXOIbwG8AgJCHyAt0R+bukR10QGjICLCqLzwy+CPwaKVMkVuL7QVIN1E/g0RKqbFvZqEszzNUrbtJDfensoGTKFm5d8Zh8UIrZxYPG+BpmHYshYFSwu3HRuGebY5gXsVx/acCk/n+ZAsL7e3L62VKoD8QEn0k8KXQFpYisIHQFb93HjrktTo5uHORTAiLRRMh1Cpo1gHvbanZaDDDgwImnPjUYyxJftstSVOb+qzDyoTPlo6wZAjkzLbaZAcdhHeai6tEw6EMT6Z6KDEOibiR9jmuRjC+O2z9Wto9K3Nhmre7A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:51.5171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92ee712-76bf-45cc-850d-08db9eba9bb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972

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


