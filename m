Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F408CDF71
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728988.1134130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW8-0005Ex-FG; Fri, 24 May 2024 02:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728988.1134130; Fri, 24 May 2024 02:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW8-0005Cn-7Z; Fri, 24 May 2024 02:18:48 +0000
Received: by outflank-mailman (input) for mailman id 728988;
 Fri, 24 May 2024 02:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW6-0003tc-NW
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23483f6-1973-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:18:45 +0200 (CEST)
Received: from MW4PR04CA0064.namprd04.prod.outlook.com (2603:10b6:303:6b::9)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Fri, 24 May 2024 02:18:39 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::46) by MW4PR04CA0064.outlook.office365.com
 (2603:10b6:303:6b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 02:18:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:34 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:33 -0500
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
X-Inumbo-ID: f23483f6-1973-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLhI1eeIczr16i9d20o6T+a6XaXi7/1BvgoIwx9TlY7RjjQ63/qVEKaZ4c6RPO7NttTdlrygJM+MzoSxi5e5L+w0uwUXm379IvVVfrbck6PbxG9pqTHfUn2ayR7uhWT94BMtdTvFvs83AHHa6YJiPIj2Pxf2OyZNmUZYRNShTvXy26/IogGrMuoyuZFQ2fE8W13lgzM7A9bYiCCfjBY7IOxYUnWg7doXQ5mYKs78yYwsUcCc5KPmZfAcwRc7rQYGTjqnugNkk0cX76+gBlk7rzvabLsjB8vX0eOJgkkGPGZrk6U0tHI+GUIRnjRTVAvDcV7cNi6G1AAfdFD6bd09/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSERoOa3ZYR0kdpGTWAKdhvJ11sFwvda7ns+AIDXeNI=;
 b=KFj9jB2Qs2LWNHaInMWOjQQLSCZVJJjfbm4qjSOzI7n/isvjAeVe0RzfDZ7nzkoV3POy0A+KCE9CVFRlROUeH5aS4D4uuknHY45DFl/sncd14Nc7W5uJFQvjvMpCiXREltn1PBt0tjrI+ygY2hviqQZO7yVKB/61fHWKo6/kIxqnANPci1sN/NYp7xFy3auszkfj+IKZdxxrmYc2HTcs/AXIYiDWtXxJNyGDA8HjErYfeMy5wdhpqX09VVGvLm+UfOYJ0pRXH1Zj1O1HI7eCLrAoz/k15VLtQ+epN9rPXck0pSdnWLB58K9/JKqjMU1KABXDOMqPiLsuRmfkG/FeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSERoOa3ZYR0kdpGTWAKdhvJ11sFwvda7ns+AIDXeNI=;
 b=PxV+7V2MZooKFL0Z6fO1O0fZHCxBywvWQslCIL6Bvca9qw01BcFQrnkuio2tOd5InENv6ITPh3jvpMG6EeFk30gLs5TMzT6KwHsX5A13JxSjzCfGyqllOoJShU+jhbz58F6gv/3lcmMF4LwnYEpRX9kFYZedwBm5nWXFOMtPaNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v5 6/7] tools: Introduce the "xl dt-overlay attach" command
Date: Thu, 23 May 2024 19:18:13 -0700
Message-ID: <20240524021814.2666257-6-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 1539460b-d240-48f7-9f12-08dc7b97d2fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A4L37uh5lyCQVNYh7YmEKmcKs+6lWcOekLbFMJmHJGZLCPY8VQoy1DpeXhYS?=
 =?us-ascii?Q?VfcCFGwC9f2FJNhJBnPyqiR5t3r8kFjT+dj5ZWiWx94pHPcSt+WCcpGL3oQe?=
 =?us-ascii?Q?IM9FG9O8+kFfyQoW5QRljeieWDJyHEoRVWLFJ9xtSJ1jw/V8N0sq08II9ISt?=
 =?us-ascii?Q?Kxzppd2vVXTq+Qx/wabjFb1kotBKwT8osrG9DgaO8Z97L9IidVj5OZqTqoE9?=
 =?us-ascii?Q?PLOodMTVAYwil2D+u2M8M0K0HyZVoFHXgKBLfB0ykilwJjTY+UDL92UTZmwH?=
 =?us-ascii?Q?pp0B2zt738Tb4cY+8CM1xGpw0blWyUc5uxku8ZOHJe1OWK3bLPZqurivCga0?=
 =?us-ascii?Q?+iKB9/b2zyygw3rAu78K8CDTTay9hvbfj/MHhtqqS3dJCGDW05eSFrmXuiMf?=
 =?us-ascii?Q?DQMgPsBqo5Hfzati6I2yFFSAYPH4HFswIfZWutWda6T7PNBLDQ3zWg1e6wU3?=
 =?us-ascii?Q?CMedWUjpbdTRnUoVckynMjnBPOWI+vhFtVjvTIt09F8ZLFlCOCaTzCSNamfB?=
 =?us-ascii?Q?kAqu/H4ACooVZ6kIAz3Ng2w1DalwJNmRKuuRzN4AP/ueLVs2Exv+qFN8X5Oz?=
 =?us-ascii?Q?4clyBphgKC/Nkn/90iwjhSt687HXlQ9deliZxAQa2q105eYgW1SPoNg8uvER?=
 =?us-ascii?Q?5CI2Wbw94lK3wI41n7cqgj2vaVfuTpxV5jUl+a9MZpIvc5QkXHs5UHqii8OV?=
 =?us-ascii?Q?L3Em1rbBUbaIzdxgc8nWyin7wC3R61033js9VUZG/Gl+gK1UsV2P4IpTihsi?=
 =?us-ascii?Q?dS26AoOFo5SvovKzqZTnEthTWmbEWI1N4EG1RIg8rENHt9qSTfqh3wy8uNbG?=
 =?us-ascii?Q?xDjngG955lpz5gt2gA1h5ZGLD/xxeAvt9Eo6YEFbETnE87n+2aJdQ86jAEUM?=
 =?us-ascii?Q?95FZ/ZdXKEdp/VzAqMmrYXi2hnq5expsP79qxmOF36IWIQpele5QcWBJyOOp?=
 =?us-ascii?Q?dquOFdpv7zmGM7ecjw4RSD+nsEXyjcz3WXFFgJh4ra/q1MXlXUfe/OiKBg5F?=
 =?us-ascii?Q?6zRdShIVcRdjjui2gNqodxUAc+4rNjry8PTuhCvAa7rKTh8vA5HERZl2AWwg?=
 =?us-ascii?Q?gDpHEXRkHdGk4BswE2kO54OSbUB+UzAtL++Pqe8Uldzb2NPcPRwe1TFbgTpw?=
 =?us-ascii?Q?YaN2+Sy4y0M4nvl5+5lsBGGbxKfQj1xR8Msj5WTQhsWrXVH/LjLy/fWs3gJF?=
 =?us-ascii?Q?Gf/rx2KXfP3mYaMD+wSEOy6Jsp6WVJH6ahp3c29OPdua8RxporAPst0lm2Yl?=
 =?us-ascii?Q?XYP1wxM+UfgZWrnUIoaKi9BeQu3bAQtYT7s6qRooiuo6de7Hez1e7GW91fw4?=
 =?us-ascii?Q?YyFRIR8jVWdPAyYxuib2Q3ZmSq9dEsiDEVG+aOlxkqTE+Ot0yx1PLWv48qRO?=
 =?us-ascii?Q?1RdMF/CaobzpIIUbbPiw3jLFyBTK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:38.8123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1539460b-d240-48f7-9f12-08dc7b97d2fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416

From: Henry Wang <xin.wang2@amd.com>

With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
attach (in the future also detach) devices from the provided DT overlay
to domains. Support this by introducing a new "xl dt-overlay" command
and related documentation, i.e. "xl dt-overlay attach. Slightly rework
the command option parsing logic.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/include/libxl.h               | 15 +++++++++++
 tools/include/xenctrl.h             |  3 +++
 tools/libs/ctrl/xc_dt_overlay.c     | 31 +++++++++++++++++++++++
 tools/libs/light/libxl_dt_overlay.c | 28 +++++++++++++++++++++
 tools/xl/xl_cmdtable.c              |  4 +--
 tools/xl/xl_vmcontrol.c             | 39 ++++++++++++++++++++---------
 6 files changed, 106 insertions(+), 14 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3b5c18b48b..f2e19ec592 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -643,6 +643,12 @@
  */
 #define LIBXL_HAVE_NR_SPIS 1
 
+/*
+ * LIBXL_HAVE_OVERLAY_DOMAIN indicates the presence of
+ * libxl_dt_overlay_domain.
+ */
+#define LIBXL_HAVE_OVERLAY_DOMAIN 1
+
 /*
  * libxl memory management
  *
@@ -2556,8 +2562,17 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
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
index 1f3c6b5897..42751228c1 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -634,8 +634,8 @@ const struct cmd_spec cmd_table[] = {
 #ifdef LIBXL_HAVE_DT_OVERLAY
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
-      "Add/Remove a device tree overlay",
-      "add/remove <.dtbo>",
+      "Add/Remove a device tree overlay to Xen device tree, attach/detach the device to a domain",
+      "<operation=add|remove> <.dtbo> OR <operation=attach> <.dtbo> <Domain>",
       "-h print this help\n"
     },
 #endif
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 02575d5d36..fa1a4420e3 100644
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
@@ -1309,7 +1320,11 @@ int main_dt_overlay(int argc, char **argv)
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
2.25.1


