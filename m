Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4C8CA773
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726504.1130844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEb-0008P3-VT; Tue, 21 May 2024 04:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726504.1130844; Tue, 21 May 2024 04:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEb-0008LO-Qd; Tue, 21 May 2024 04:36:21 +0000
Received: by outflank-mailman (input) for mailman id 726504;
 Tue, 21 May 2024 04:36:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HEZ-0006hu-OB
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91c120f-172b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 06:36:17 +0200 (CEST)
Received: from SA1PR04CA0016.namprd04.prod.outlook.com (2603:10b6:806:2ce::21)
 by DS0PR12MB8504.namprd12.prod.outlook.com (2603:10b6:8:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:36:15 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::3f) by SA1PR04CA0016.outlook.office365.com
 (2603:10b6:806:2ce::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 04:36:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:14 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:13 -0500
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
X-Inumbo-ID: a91c120f-172b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHWCQdml5dsyd4yFmEEqFcnqeCsYYa5zf+yjVwVhDiX5MSfRcJxncv90F+LduLO9bvmyQsHmiUri+z/Kb2xBX7vLPPJUyBKRcujNLDyMO9/JHEAd/m1EJeuov9awrm+ol3BCx7WfI1aY3Shv+q5smepX1ehEbXkwl9cEtOMtGKCi8DL8ePpW8O25Hkvh360xHP5XjV51Tk1PsyKtj8fnDqYWFVLsvqXmEoszriGnT75x+btEwizXBwgo6ZGn/m0TIAlD+QBgrQWpV4cwVO34zkx3pJCKhAZgZNXskNPyYCgl0KVnk0T3rqStQ+pPkCawPhH5vyni9QpaDzIF0LUIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE7z9HeLzOE9JPXCOJkwYcS8CjTT2Ru5y5EpVZBDA6c=;
 b=i3ZuKH//kSg9znsMnvoRrbQSZyIP5KMKXf3CPo+uCxrRFIcqnodr9PW3VX98kx0la017YA0nlSaI2yQrP7iPmPPbjN4tPjVu6rgUyqXlIm1TgV/qmIKh32SMfpTVrlM/tB47h9P0MAydbuzvli9T+J6BvQzDrEbNs3zGFdZ1Owo5lyRZkP02GgG44ZdFVrl1E7s6sTuNxED2QfUGoEysvQiGNO7/HXUqvZIho99mSDo4KtV+hbBN82c7dWM4qEnhRyXW+f5jGyfBajpfYQCR0/iRjqQAuWvq/iqzuWdTxYjFzZ4paK95VIiwy9zYujf0hlFS3AG6n02Zg6zKiFPR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE7z9HeLzOE9JPXCOJkwYcS8CjTT2Ru5y5EpVZBDA6c=;
 b=fDcBnNDMgjgGpw58GfvPp6nkvXvcuoNk2zHHI/ETgxZB+/dR5nmkh3/01WtQ7bIq7cN4K1HXjjrQAHQYrcK5Lo5zvC9/Tukq728sEtWEElUX91wAoZcBezD1h7pQyA4AJH1OMlfRa11N36FvmORZgetYhmnsaK3CA9ACi0pqQqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
	Henry Wang <xin.wang2@amd.com>
Subject: [PATCH v3 7/8] tools: Introduce the "xl dt-overlay {attach,detach}" commands
Date: Tue, 21 May 2024 12:35:56 +0800
Message-ID: <20240521043557.1580753-8-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DS0PR12MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9fe93c-9dbc-4460-2658-08dc794f8cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fzb3V6t8baIST7lGd/94pmH7QN5oUjDSEYhvlfpybNneUdap1+G/ESLH9Ilk?=
 =?us-ascii?Q?lOPHq1t/2P/HUSEYhmy263qZdy+O++CuiXaO+NGdKF5OhsixsVACXWj3cJGB?=
 =?us-ascii?Q?d4vTMHNnFTEeT7uliTlqaGjyFaJZfIqVYNH6mXbL5GedV6ltCNNUKB9wI1Lh?=
 =?us-ascii?Q?Br4YfH6ei3l2ExajslKGVDezuthZ7dM5vJ9OaqZFIPiN3xFwaZUUKw2OreQ3?=
 =?us-ascii?Q?IoyduyL/dF3bhQCtazN+Tlxbf8ttpO9ZKyhxWC9Pt5PWUgpZeIpMdZXGI3Kq?=
 =?us-ascii?Q?NKjsRacfbBRKUDc39fTl5vI8aUmBODFpYtz6TQCOvP1BM4X7F5BOzho2vD2V?=
 =?us-ascii?Q?DnrFUD70k+eYAUkKiikJQuP2dRNgCQvpWa6Vrq85h8kr4xBMgZrf9An/j/zl?=
 =?us-ascii?Q?YGa2Hs+v5gChKdbOM4J51UW4BkcKil/LG1m1YeFdeuqlyEXT35fcTJiKWwYB?=
 =?us-ascii?Q?oXAtOJU1Ctz6u0CetiVATZZAkfxxcIyRfaELdtkq09EHI5usewpQYbpKzBcF?=
 =?us-ascii?Q?sYLHjP5XxIGYx44SE89KFyw1cjb+C6jId87kACSCaD6l8cqmuPbXFpxhXNt8?=
 =?us-ascii?Q?VjH8jwDcLkyMVd8OemML4+m7htmAyYCfTAw//bRmUd016JFfGpNGYg25jueL?=
 =?us-ascii?Q?nIOvsd1BHS7UfNuRHzneNH4mBShJd20kPwLh/p7lxIaNxfVD5J8QMcX2ipbj?=
 =?us-ascii?Q?UgCdhJso2yWVZi0vVfvRdiwPuxv7Xby4fYGBUhjPUnWXsXveWSiq0db5q9Gy?=
 =?us-ascii?Q?Pxv3L9fnOLOrS6U8i9pwnDMk8Mnw0z6GX7piI185MoyBu3FbOnlEnpVRA4kf?=
 =?us-ascii?Q?U7bz7cHJXK+KGNB7NaUGaCkcZSJv8TJfGbfjJoWDO5/4Y14xsmwCu5aPwtcX?=
 =?us-ascii?Q?JJaiXW4bSrRz0QSWjLvOM63UVjP/exc9C8DwjTJ73R+nE5v1Mo5ZCka0DHyb?=
 =?us-ascii?Q?kAiOf36SKDy4neU6wIQquOJYJc1D68OuNOOoOdx1H8EL0hoibt0mJ8GmWI/Y?=
 =?us-ascii?Q?AeFAMS9fX5Ygu4cZbLUTA9dEfyU5M4KH9/BdfSXnCEA6FfDoo4O1+pLbQM0L?=
 =?us-ascii?Q?NXnsBDV+LNFm5uWyiN/rgsDyNij1SEFi9mKXHmx6k/+HeHLBGRnIQnMCBwNR?=
 =?us-ascii?Q?fMOb4z3yLXDYVnrjmAWBb4FxGRkHyTcZwrrF1EsHne4MQ5ftU6vf/9jjdzUA?=
 =?us-ascii?Q?fIsmSDfmAmL7MWk+eqxyHr48ROXG1K+c7nTS0l5gMctDbzHAIzvEOMgw6+2Y?=
 =?us-ascii?Q?AS0edmW9HzgBwzzhsUDCgYMoxd2Yi1zyzFcQiQjVO77dn33dNFpZRWbdbDR5?=
 =?us-ascii?Q?gKt0v3wkW8Uj5SKUjKK2Gqj1VtEXuk4uhpezehvxM1pDQPp10iwbz51ao9X/?=
 =?us-ascii?Q?szKXkltQbNkmNnczlkndUYpnXgTL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:15.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9fe93c-9dbc-4460-2658-08dc794f8cc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8504

With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
attach/detach devices from the provided DT overlay to domains.
Support this by introducing a new set of "xl dt-overlay" commands and
related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
rework the command option parsing logic.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Introduce new API libxl_dt_overlay_domain() and co., instead of
  reusing existing API libxl_dt_overlay().
- Add in-code comments for the LIBXL_DT_OVERLAY_* macros.
- Use find_domain() to avoid getting domain_id from strtol().
v2:
- New patch.
---
 tools/include/libxl.h               | 10 +++++++
 tools/include/xenctrl.h             |  3 +++
 tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++
 tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++
 tools/xl/xl_cmdtable.c              |  4 +--
 tools/xl/xl_vmcontrol.c             | 42 ++++++++++++++++++++---------
 6 files changed, 104 insertions(+), 14 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..6cc6d6bf6a 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2549,8 +2549,18 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
 #if defined(__arm__) || defined(__aarch64__)
+/* Values should keep consistent with the op from XEN_SYSCTL_dt_overlay */
+#define LIBXL_DT_OVERLAY_ADD                   1
+#define LIBXL_DT_OVERLAY_REMOVE                2
 int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
                      uint32_t overlay_size, uint8_t overlay_op);
+
+/* Values should keep consistent with the op from XEN_DOMCTL_dt_overlay */
+#define LIBXL_DT_OVERLAY_DOMAIN_ATTACH         1
+#define LIBXL_DT_OVERLAY_DOMAIN_DETACH         2
+int libxl_dt_overlay_domain(libxl_ctx *ctx, uint32_t domain_id,
+                            void *overlay_dt, uint32_t overlay_dt_size,
+                            uint8_t overlay_op);
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
index a6c709a6dc..00503b76bd 100644
--- a/tools/libs/light/libxl_dt_overlay.c
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -69,3 +69,31 @@ out:
     return rc;
 }
 
+int libxl_dt_overlay_domain(libxl_ctx *ctx, uint32_t domain_id,
+                            void *overlay_dt, uint32_t overlay_dt_size,
+                            uint8_t overlay_op)
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
+    r = xc_dt_overlay_domain(ctx->xch, overlay_dt, overlay_dt_size, overlay_op,
+                             domain_id);
+    if (r) {
+        LOG(ERROR, "%s: Attaching/Detaching overlay dtb failed.", __func__);
+        rc = ERROR_FAIL;
+    }
+
+out:
+    GC_FREE;
+    return rc;
+}
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
index 02575d5d36..ccfeec39f1 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1268,32 +1268,46 @@ int main_create(int argc, char **argv)
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
+    bool domain_op = false;
 
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
-    else {
+    if (strcmp(argv[optind], "add") == 0)
+        op = LIBXL_DT_OVERLAY_ADD;
+    else if (strcmp(argv[optind], "remove") == 0)
+        op = LIBXL_DT_OVERLAY_REMOVE;
+    else if (strcmp(argv[optind], "attach") == 0) {
+        op = LIBXL_DT_OVERLAY_DOMAIN_ATTACH;
+        domain_op = true;
+    } else if (strcmp(argv[optind], "detach") == 0) {
+        op = LIBXL_DT_OVERLAY_DOMAIN_DETACH;
+        domain_op = true;
+    } else {
         fprintf(stderr, "Invalid dt overlay operation\n");
         return EXIT_FAILURE;
     }
 
+    overlay_config_file = argv[optind+1];
+
+    if (domain_op) {
+        if (argc <= optind + 2) {
+            fprintf(stderr, "Missing domain ID\n");
+            help("dt-overlay");
+            return EXIT_FAILURE;
+        } else {
+            domain_id = find_domain(argv[optind+2]);
+        }
+    }
+
     if (overlay_config_file) {
         rc = libxl_read_file_contents(ctx, overlay_config_file,
                                       &overlay_dtb, &overlay_dtb_size);
@@ -1309,7 +1323,11 @@ int main_dt_overlay(int argc, char **argv)
         return EXIT_FAILURE;
     }
 
-    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    if (!domain_op)
+        rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    else
+        rc = libxl_dt_overlay_domain(ctx, domain_id, overlay_dtb,
+                                     overlay_dtb_size, op);
 
     free(overlay_dtb);
 
-- 
2.34.1


