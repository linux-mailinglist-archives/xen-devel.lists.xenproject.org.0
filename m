Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E528C7456
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722996.1127518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxv-00079N-Ct; Thu, 16 May 2024 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722996.1127518; Thu, 16 May 2024 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxv-000750-3Z; Thu, 16 May 2024 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 722996;
 Thu, 16 May 2024 10:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxt-0005ER-TW
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:58 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a731e23-136b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:03:55 +0200 (CEST)
Received: from MW4PR03CA0153.namprd03.prod.outlook.com (2603:10b6:303:8d::8)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 10:03:52 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::d7) by MW4PR03CA0153.outlook.office365.com
 (2603:10b6:303:8d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 10:03:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 10:03:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:50 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:49 -0500
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
X-Inumbo-ID: 9a731e23-136b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu2btGx3SJHxfm7pkjGq8DxuXJGXF6D10E/DrZuLMG/HEaX9JRweTVtbApZv9WT01DjwKfLFzUQQWK1pVkHuNhsvPAXGZF9kKQikoBF36ZxAd9Sj2k8OgCaVy3JXzFC+dMQeI2AKuHvps0kXoj1tPvjiwmFb3anqMAAadovizni0NFEFeZDhERCuSJryj3ZMfU1ecG1K068etYljHmOde/+iD4Yd5z9BJCInwnwxVkUmiHo0Ch+DHFiTvrtDnmE4ufvAc7E0+t8Ex0SIJSelbAx2qUP0ri/GqcUi+ssGqLxzD1ysBKTs3bVLIfG5M42tuCSxFJbYWMI8tBXAeGgUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl/BNnEwGnkfp7ugboqdbNn2EBw+cplgSH3kLI39gkI=;
 b=hJgq1eHJforyIRyB/BFw6pOQvSM0F4LGPwb+T3CLIKVoS4hqNltUiG7mzDrj+U52D9cH8hQnlG7UtbT5227ZUb9j7Hl6Tb7e2w6Xzs/K40bUdqRg+MhLaDGRsAkrpOC4tbKeVqd4spRQflbfAheAivkeYmtXN3/YRlqoaHOY9jhKj/ANiro3XOu5i4/i3uRzcNbx2Nqi6DmkiRSzMmDqTVisXzdN5NeW5fAUAdz/OTpRRkSzLTzT0uMq1OXCVlgaOj+FDxi0VKs+XYkLIcmnxUse09/4O7i+rdKhCgcuPSY7Y5ea7BpSDEuc5bQOdIgVw9l6z5+YlVP7Ok/V+J/TJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl/BNnEwGnkfp7ugboqdbNn2EBw+cplgSH3kLI39gkI=;
 b=eb/vQBtuMWIfNdwxD9ltn6debbnOpc+7PSbaj3lDB6p0/PYwcwmPe4UlO9oC8cDYJQ32wWKFiqXTXqnCq96MNhASRougp1MxkkFLf0jKsXhTN/6lBVO5R3UQLQE1/c2kDpKu8FbmgNdMfFDT2CAX4aYjpjMOJBY+KeLEpAY9dXo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 7/8] tools: Introduce the "xl dt-overlay {attach,detach}" commands
Date: Thu, 16 May 2024 18:03:29 +0800
Message-ID: <20240516100330.1433265-8-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d26934f-4574-4069-9ef0-08dc758f7d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZy7jMliXsiLUTDfo09ghojyymhC1KLC0CRovvdLSdQjzUL54AxcPh/jorGv?=
 =?us-ascii?Q?THi4hp81jUB+BXMEtOOG5qH9Wx2AptIo83Etz1gqbVtAgtrmwWiM2Oxb32p5?=
 =?us-ascii?Q?5qxCP+IdZCDwPdVg30bpuPqdyNcNDPU5MnuiFFBsAPBtHKDlNWjFypW7tGu4?=
 =?us-ascii?Q?Idj0fHC6FbXH2C0jvqpYio+V1U3sVXlZJiJyM13bwR9XF+2dzWhiTsDzhzkF?=
 =?us-ascii?Q?s6owlBrwL9U9Q89lzK6gsWgEhIYeZ4yNbJa52jcGFx6exwuRlqUS5YdcgrOT?=
 =?us-ascii?Q?DUD02Q5gNDCQl4+rOhvgBQ6Z3QAfRFrKxfMjtAY0NMHB/kACtaIMzBleS9Ne?=
 =?us-ascii?Q?dG+tDR0+qrPfVSUqcZOz76VOw+GPjaYLpge6P9ruO6YXDqrt6k641UEmszBK?=
 =?us-ascii?Q?sUVpMRub21dyzscPUF61iHhttLyzmBxQQBeulkoFg35VGQrsUBqvv0zaVvIt?=
 =?us-ascii?Q?HBB+wqvVVzCNk6Gugw2i7OU0+f9qLsAIhjFJBNa6X/li4e2HprqDppY4qD+E?=
 =?us-ascii?Q?+adB5IJ5efqxw1wI79zti6cSqiE8L7cJW4eJZH1TfY6d2DIRQ20f5gJCESvg?=
 =?us-ascii?Q?OEuQFtV76f9kAnz5y0U5dkihfqOUvW3BD+esTQnSiz75u3w9DacdL4vA+seC?=
 =?us-ascii?Q?tm5lGYhQr4aGBh2MijXS2AphsCZ0ecDqI1Z8aebVjiL3YlXALdy9tYmGFBcI?=
 =?us-ascii?Q?AnEw6C8e/T9MMqAwW1GC03lb17mB/8OaWZwJxqwtP6poabUk6ytpO2JBxKgJ?=
 =?us-ascii?Q?CSJzbrBwM9AbrborIcG2IHonTBMXSjTdeUxcriTZAOv1aW6eY3C83mKXCYef?=
 =?us-ascii?Q?tAtZpg+LP7KtOVkh+Bm6ovJJUDmCBl/c64KkDQ9GeEMcH2+gY52S7Tiw7QDp?=
 =?us-ascii?Q?gqxVP+dH8u+b5sOVJ3UOkO/qc7n6/zVWR3GSMRrQQuI0fLHsxcFdXnvWSDRe?=
 =?us-ascii?Q?gVWCPJ9uXeeQ7UndGQDPCdLPIKEKAjJeUH3ioW1Sxx/zenOgE5shK7eTNY6Q?=
 =?us-ascii?Q?hyUMuBhdHSx69jcOxlCDAtCPvTU31myTyPoqdZFEcWj2wbmX7RWwdB0nEzBu?=
 =?us-ascii?Q?3tNbRZfr5xADn4FoCBYtcnKrpks3BK8agsg41s2csN0qyxTmWnxAhS0bj04I?=
 =?us-ascii?Q?P5vmUbxJ7A0LP3YwdBVDyRkIaMXOwR+aJ6Abtrk0ckPucLjMzGVP7pxBjJbU?=
 =?us-ascii?Q?4yCsiTAh+TSRYg3rL8VY82kCaXu33vofr21gZZEzCtTH0UjqcmHiyA5QpdIm?=
 =?us-ascii?Q?W374p4sQ/KolzOjhAShZLknXv+u7mJN7rDs5hJt04oFrYFLbZI1B6eZgUCAk?=
 =?us-ascii?Q?DZ06ghBIt0+XY0K9ZFnKSOYH7BXSOC8CM9qIPhgr1O7SZfDWikjZE4dmzJzz?=
 =?us-ascii?Q?hpjHgzy8dTgxeLYs95hyj+OoN0In?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:51.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d26934f-4574-4069-9ef0-08dc758f7d19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428

With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
attach/detach devices from the provided DT overlay to domains.
Support this by introducing a new set of "xl dt-overlay" commands and
related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
rework the command option parsing logic.

Since the addition of these two commands modifies the existing libxl
API libxl_dt_overlay(), also provide the backward compatible for it.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch.
---
 tools/include/libxl.h               | 15 ++++++++++++-
 tools/include/xenctrl.h             |  3 +++
 tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++++++++
 tools/libs/light/libxl_dt_overlay.c | 30 ++++++++++++++++++++------
 tools/xl/xl_cmdtable.c              |  4 ++--
 tools/xl/xl_vmcontrol.c             | 33 +++++++++++++++++++----------
 6 files changed, 96 insertions(+), 20 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..27aab4bcee 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2549,8 +2549,21 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
 #if defined(__arm__) || defined(__aarch64__)
-int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
+#define LIBXL_DT_OVERLAY_ADD                   1
+#define LIBXL_DT_OVERLAY_REMOVE                2
+#define LIBXL_DT_OVERLAY_ATTACH                3
+#define LIBXL_DT_OVERLAY_DETACH                4
+
+int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domain_id, void *overlay,
                      uint32_t overlay_size, uint8_t overlay_op);
+#if defined(LIBXL_API_VERSION) && LIBXL_API_VERSION < 0x041900
+int libxl_dt_overlay_0x041800(libxl_ctx *ctx, void *overlay,
+                              uint32_t overlay_size, uint8_t overlay_op);
+{
+    return libxl_dt_overlay(ctx, 0, overlay, overlay_size, overlay_op);
+}
+#define libxl_dt_overlay libxl_dt_overlay_0x041800
+#endif
 #endif
 
 /*
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4996855944..9ceca0cffc 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2657,6 +2657,9 @@ int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
+int xc_dt_overlay_domain(xc_interface *xch, void *overlay_fdt,
+                         uint32_t overlay_fdt_size, uint8_t overlay_op,
+                         uint32_t domain_id);
 #endif
 
 /* Compat shims */
diff --git a/tools/libs/ctrl/xc_dt_overlay.c b/tools/libs/ctrl/xc_dt_overlay.c
index c2224c4d15..ea1da522d1 100644
--- a/tools/libs/ctrl/xc_dt_overlay.c
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -48,3 +48,34 @@ err:
 
     return err;
 }
+
+int xc_dt_overlay_domain(xc_interface *xch, void *overlay_fdt,
+                         uint32_t overlay_fdt_size, uint8_t overlay_op,
+                         uint32_t domain_id)
+{
+    int err;
+    struct xen_domctl domctl = {
+        .cmd = XEN_DOMCTL_dt_overlay,
+        .domain = domain_id,
+        .u.dt_overlay = {
+            .overlay_op = overlay_op,
+            .overlay_fdt_size = overlay_fdt_size,
+        }
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
+
+    set_xen_guest_handle(domctl.u.dt_overlay.overlay_fdt, overlay_fdt);
+
+    if ( (err = do_domctl(xch, &domctl)) != 0 )
+        PERROR("%s failed", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, overlay_fdt);
+
+    return err;
+}
diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
index a6c709a6dc..9110b1efd2 100644
--- a/tools/libs/light/libxl_dt_overlay.c
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -41,8 +41,8 @@ static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
     return 0;
 }
 
-int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
-                     uint8_t overlay_op)
+int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domain_id, void *overlay_dt,
+                     uint32_t overlay_dt_size, uint8_t overlay_op)
 {
     int rc;
     int r;
@@ -57,11 +57,29 @@ int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
         rc = 0;
     }
 
-    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
-
-    if (r) {
-        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
+    switch (overlay_op)
+    {
+    case LIBXL_DT_OVERLAY_ADD:
+    case LIBXL_DT_OVERLAY_REMOVE:
+        r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
+        if (r) {
+            LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
+            rc = ERROR_FAIL;
+        }
+        break;
+    case LIBXL_DT_OVERLAY_ATTACH:
+    case LIBXL_DT_OVERLAY_DETACH:
+        r = xc_dt_overlay_domain(ctx->xch, overlay_dt, overlay_dt_size,
+                                 overlay_op, domain_id);
+        if (r) {
+            LOG(ERROR, "%s: Attaching/Detaching overlay dtb failed.", __func__);
+            rc = ERROR_FAIL;
+        }
+        break;
+    default:
+        LOG(ERROR, "%s: Invalid overlay dtb op.", __func__);
         rc = ERROR_FAIL;
+        break;
     }
 
 out:
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 1f3c6b5897..37770b20e3 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -634,8 +634,8 @@ const struct cmd_spec cmd_table[] = {
 #ifdef LIBXL_HAVE_DT_OVERLAY
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
-      "Add/Remove a device tree overlay",
-      "add/remove <.dtbo>",
+      "Add/Remove a device tree overlay to Xen device tree, attach/detach the device to a domain",
+      "<operation=add|remove> <.dtbo> OR <operation=attach|detach> <.dtbo> <Domain>",
       "-h print this help\n"
     },
 #endif
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 02575d5d36..53d1fa3655 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1268,32 +1268,43 @@ int main_create(int argc, char **argv)
 #ifdef LIBXL_HAVE_DT_OVERLAY
 int main_dt_overlay(int argc, char **argv)
 {
-    const char *overlay_ops = NULL;
     const char *overlay_config_file = NULL;
     void *overlay_dtb = NULL;
     int rc;
     uint8_t op;
     int overlay_dtb_size = 0;
-    const int overlay_add_op = 1;
-    const int overlay_remove_op = 2;
+    uint32_t domain_id = 0;
 
     if (argc < 2) {
         help("dt-overlay");
         return EXIT_FAILURE;
     }
 
-    overlay_ops = argv[1];
-    overlay_config_file = argv[2];
-
-    if (strcmp(overlay_ops, "add") == 0)
-        op = overlay_add_op;
-    else if (strcmp(overlay_ops, "remove") == 0)
-        op = overlay_remove_op;
+    if (strcmp(argv[optind], "add") == 0)
+        op = LIBXL_DT_OVERLAY_ADD;
+    else if (strcmp(argv[optind], "remove") == 0)
+        op = LIBXL_DT_OVERLAY_REMOVE;
+    else if (strcmp(argv[optind], "attach") == 0)
+        op = LIBXL_DT_OVERLAY_ATTACH;
+    else if (strcmp(argv[optind], "detach") == 0)
+        op = LIBXL_DT_OVERLAY_DETACH;
     else {
         fprintf(stderr, "Invalid dt overlay operation\n");
         return EXIT_FAILURE;
     }
 
+    overlay_config_file = argv[optind+1];
+
+    if (op == LIBXL_DT_OVERLAY_ATTACH || op == LIBXL_DT_OVERLAY_DETACH) {
+        if (argc <= optind + 2) {
+            fprintf(stderr, "Missing domain ID\n");
+            help("dt-overlay");
+            return EXIT_FAILURE;
+        } else {
+            domain_id = strtol(argv[optind+2], NULL, 10);
+        }
+    }
+
     if (overlay_config_file) {
         rc = libxl_read_file_contents(ctx, overlay_config_file,
                                       &overlay_dtb, &overlay_dtb_size);
@@ -1309,7 +1320,7 @@ int main_dt_overlay(int argc, char **argv)
         return EXIT_FAILURE;
     }
 
-    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    rc = libxl_dt_overlay(ctx, domain_id, overlay_dtb, overlay_dtb_size, op);
 
     free(overlay_dtb);
 
-- 
2.34.1


