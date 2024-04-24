Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC508AFFCA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711030.1110688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQX-0005Gm-1T; Wed, 24 Apr 2024 03:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711030.1110688; Wed, 24 Apr 2024 03:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQW-0005E5-Ry; Wed, 24 Apr 2024 03:36:08 +0000
Received: by outflank-mailman (input) for mailman id 711030;
 Wed, 24 Apr 2024 03:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQV-0003iy-JT
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:07 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c891e3d1-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:06 +0200 (CEST)
Received: from MN2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:208:1a0::27)
 by PH8PR12MB7328.namprd12.prod.outlook.com (2603:10b6:510:214::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.45; Wed, 24 Apr
 2024 03:36:03 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::53) by MN2PR07CA0017.outlook.office365.com
 (2603:10b6:208:1a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:53 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:50 -0500
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
X-Inumbo-ID: c891e3d1-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5tL9Sxp/rggJ7CEyZxPZaL9JEYkIgKLt4n0T3mGFod7CMraQugk8RXIBtDPGZQVtbH80MO6P9p7WsjHDK4mhaY7T///UNLjX5kj0zRRoknTAtB+TuLD3V8oCg+xZo81Ao51XDzPu4JmSi2b3P4NT7abCjcRabgEWKYSS8C4H1sf/YaQYwkU4RV6fWkM7T7N46KrYGd5ccclfZQDYGotHIhEjNCHe9DNA3YfkpX/iA1ErYmeNHsAx/0dRE5Olmi4vWFykFB+FTbY4XkL+up6BeY0v9kHOWDhRBQXh+XwsGG/k3HxQOhvsfg5jtAFzuWU8q8IMxBAbMQsNwr72hR/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaZNaxhv7T814w8ZlBVgWmsi3wP0wrBR0DPOix+QGsc=;
 b=UGcpmUVDxUy//9VBsiq7i/BBFrobrxbpXjA19cRqSQwbt+hirO3oe90mN81R8hUc9TVjGZz6Dy77AOU5kzOIFB8SCsQ3OIMM6sBywXoduz52Dr3pKBRz+AbHUPFsakgoB7gXdDFiZK5hQ/yUPyAPPEaTCGBycqNMZzAmNCvMDOrnMHRLsnQN1FKnSpFchGCSHa24Lrj3DW6LPHOqvGHuU2GDrZLUK9XOhFcRi7sw611BM+orJZD0NH2cjB8sMMqBDApKIln4nbkCcpWqTJELLqhFtBvKGtJ7g7beLmLGlEd9x2UBXi6/6z+imZ3hSWL2cFgeDGy3pk9VhMEV2MaKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaZNaxhv7T814w8ZlBVgWmsi3wP0wrBR0DPOix+QGsc=;
 b=mgTFLUZb+1Q9JYLf/7Op6LsIOlgaXtxja2iEsXJkNN3ylYTUtSpTeLldzOlhAqiXvWFFOaLHlupMNwZpvYDJs9xb8wS9oXCMYnyzgY5Me33u4wQCvCoJlIu0BsoUYT9jaIY83/UmtqtjGV+uGuyYqeocZiJFcSu0KQ6uKB0vUFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 08/15] tools: Add domain_id and expert mode for overlay operations
Date: Wed, 24 Apr 2024 11:34:42 +0800
Message-ID: <20240424033449.168398-9-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|PH8PR12MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d715a70-9c56-4aa0-7bdf-08dc640faa9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBRwepVruIHZhfMopOZ1AYNL0yToTQwhSEgMm/BofFL7JAoLdUtq8DDPkU/a?=
 =?us-ascii?Q?G6YhtGbEkdlzYMu9vZrVKXetODPWrEyVRST4oxCODrscSbIQGH5ca+gfXgPE?=
 =?us-ascii?Q?uGubEsPdiBAfkjM8r2XmVQ+LEN9W7C+NrvPSBpFcCGkxEb+cc7mkxeHMjbh5?=
 =?us-ascii?Q?OMnUZrfr3Bb2Gsix9aTawVH0DaK9oXpP7gV/7FWNm8BTe0Oef7llJl448FGn?=
 =?us-ascii?Q?w/WEHKEUOL5xLTY8cyOzBlLmiNOpJvlcdSsXQ+ido7FdkU5aTJ5u+RN8ZMa2?=
 =?us-ascii?Q?Cdv9ihBr0zF331etgeYx7i4APA9KbqrrQ5d47kIeYfpFr3LrZuU5vJ9p4yCb?=
 =?us-ascii?Q?p12f+zXBovMLa+AGPY1JdNUgWDsbAl3HpNG9zyeR2xERNqv6MRqh2c18gR9q?=
 =?us-ascii?Q?LnivsZ4BFq4h9qbqnCBh7+qHQv0mAkaKYA/FMjXbGd2hc/31xuafC9VsB7sH?=
 =?us-ascii?Q?gpzMSXVO8GOECvGn+KDzAkfrvkTanEW+gvidL7Gk2RiP7GIYU9Lcc3RACHe7?=
 =?us-ascii?Q?VDO1IqOd5kKamqmalThMTmLhLjFgnNknZpUonc4zYPbv9Cgyb7v4BH1gj/r5?=
 =?us-ascii?Q?zve7PmK4WeTdiRQg3sfF35mK6q5WA3WbV2DbTINDh6fdWO7pvNSkJ1ktk+q0?=
 =?us-ascii?Q?dMOYZaHyMt4t5kFoXW2o0p4xCSjy/cnJCZ1zJLsvLNdM99bqeqrSRdX6ReHo?=
 =?us-ascii?Q?W1jdwvgmpff9gk7XZC0SIBLCsrI3LUmr9a2tYmYR/BKz4orTCB+8YgkUr/zx?=
 =?us-ascii?Q?CYgj1ZhWWjNKkZwmZZgsqPrn6ribTE90ux8SjS5o1P052bKkR1J2lc6/LkuY?=
 =?us-ascii?Q?t9vfYZb7sSRfi0A34IWlZig6uM/LpzqSHPS4wgOeMOwZpPzO+ZFj66imv3eA?=
 =?us-ascii?Q?+NAAMzIdU4/ohoO0FND7bGkUMSq5C4Fm6abRCUn7qHuIzDvp7zqVjkToU0Q8?=
 =?us-ascii?Q?UY1b03hGkYiUqujXmj5VPCZjRxZQKqfZDM8Mn6BS/7Idn7X6ve1Byezr9KKO?=
 =?us-ascii?Q?X+qJfzcBE9+79TD+yMqses3R/p7lB1b1vqbnUEroH/8Hv8ZESYtFeq9Z5BEi?=
 =?us-ascii?Q?Azkr6+ebzYFnUqgTz6SZioygSKNbrsavHnopfwR09IcguRTX7t9tptbvJU8I?=
 =?us-ascii?Q?wXTRopTydA+RjN2s3jVqJEFpYc7o8/9AbHpVdWfITbF7y8MrGRRupvlb/mBY?=
 =?us-ascii?Q?Xtbiq3p914W4kcVtp8of0PD9vTyDlDB+SZR0y2q3IdHqwFAVo1IftzotukEN?=
 =?us-ascii?Q?NjvGFeALZcOkIdTPq3PVK5VsG5Z0RQTHIMQbEkPNqH1VjftpK0YvRJYR2KWi?=
 =?us-ascii?Q?eh+6F0T8qgItwqbkTNmPpuykY5sTJTqw19Nb8Xiz7dY+s1YQlrpvipmevD54?=
 =?us-ascii?Q?KoUirtqCftkWglk1/wGiZhUBtsZl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:02.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d715a70-9c56-4aa0-7bdf-08dc640faa9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7328

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Add domain_id and expert mode for overlay assignment. This enables dynamic
programming of nodes during runtime.

Take the opportunity to fix the name mismatch in the xl command, the
command name should be "dt-overlay" instead of "dt_overlay".

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/include/libxl.h               |  8 +++++--
 tools/include/xenctrl.h             |  5 +++--
 tools/libs/ctrl/xc_dt_overlay.c     |  7 ++++--
 tools/libs/light/libxl_dt_overlay.c | 17 +++++++++++----
 tools/xl/xl_vmcontrol.c             | 34 ++++++++++++++++++++++++++---
 5 files changed, 58 insertions(+), 13 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..59a3e1b37c 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2549,8 +2549,12 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
 void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
 #if defined(__arm__) || defined(__aarch64__)
-int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
-                     uint32_t overlay_size, uint8_t overlay_op);
+#define LIBXL_DT_OVERLAY_ADD                   1
+#define LIBXL_DT_OVERLAY_REMOVE                2
+
+int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domain_id, void *overlay,
+                     uint32_t overlay_size, uint8_t overlay_op, bool auto_mode,
+                     bool domain_mapping);
 #endif
 
 /*
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e054..3861d0a23f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2654,8 +2654,9 @@ int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
 #if defined(__arm__) || defined(__aarch64__)
-int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
-                  uint32_t overlay_fdt_size, uint8_t overlay_op);
+int xc_dt_overlay(xc_interface *xch, uint32_t domain_id, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op,
+                  bool domain_mapping);
 #endif
 
 /* Compat shims */
diff --git a/tools/libs/ctrl/xc_dt_overlay.c b/tools/libs/ctrl/xc_dt_overlay.c
index c2224c4d15..a1dc549915 100644
--- a/tools/libs/ctrl/xc_dt_overlay.c
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -20,15 +20,18 @@
 
 #include "xc_private.h"
 
-int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
-                  uint32_t overlay_fdt_size, uint8_t overlay_op)
+int xc_dt_overlay(xc_interface *xch, uint32_t domid, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op,
+                  bool domain_mapping)
 {
     int err;
     struct xen_sysctl sysctl = {
         .cmd = XEN_SYSCTL_dt_overlay,
         .u.dt_overlay = {
+            .domain_id = domid,
             .overlay_op = overlay_op,
             .overlay_fdt_size = overlay_fdt_size,
+            .domain_mapping = domain_mapping,
         }
     };
 
diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
index a6c709a6dc..cdb62b28cf 100644
--- a/tools/libs/light/libxl_dt_overlay.c
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -41,8 +41,9 @@ static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
     return 0;
 }
 
-int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
-                     uint8_t overlay_op)
+int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
+                     uint32_t overlay_dt_size, uint8_t overlay_op,
+                     bool auto_mode, bool domain_mapping)
 {
     int rc;
     int r;
@@ -57,10 +58,18 @@ int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, uint32_t overlay_dt_size,
         rc = 0;
     }
 
-    r = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);
+    /* Check if user entered a valid domain id. */
+    rc = libxl_domain_info(CTX, NULL, domid);
+    if (rc == ERROR_DOMAIN_NOTFOUND) {
+        LOGD(ERROR, domid, "Non-existant domain.");
+        return ERROR_FAIL;
+    }
+
+    r = xc_dt_overlay(ctx->xch, domid, overlay_dt, overlay_dt_size, overlay_op,
+                      domain_mapping);
 
     if (r) {
-        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.", __func__);
+        LOG(ERROR, "domain%d: Adding/Removing overlay dtb failed.", domid);
         rc = ERROR_FAIL;
     }
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 98f6bd2e76..9674383ec3 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1270,21 +1270,48 @@ int main_dt_overlay(int argc, char **argv)
 {
     const char *overlay_ops = NULL;
     const char *overlay_config_file = NULL;
+    uint32_t domain_id = 0;
     void *overlay_dtb = NULL;
     int rc;
+    bool auto_mode = true;
+    bool domain_mapping = false;
     uint8_t op;
     int overlay_dtb_size = 0;
     const int overlay_add_op = 1;
     const int overlay_remove_op = 2;
 
-    if (argc < 2) {
-        help("dt_overlay");
+    if (argc < 3) {
+        help("dt-overlay");
         return EXIT_FAILURE;
     }
 
+    if (argc > 5) {
+        fprintf(stderr, "Too many arguments\n");
+        return ERROR_FAIL;
+    }
+
     overlay_ops = argv[1];
     overlay_config_file = argv[2];
 
+    if (!strcmp(argv[argc - 1], "-e"))
+        auto_mode = false;
+
+    if (argc == 4 || !auto_mode) {
+        domain_id = find_domain(argv[argc-1]);
+        domain_mapping = true;
+    }
+
+    if (argc == 5 || !auto_mode) {
+        domain_id = find_domain(argv[argc-2]);
+        domain_mapping = true;
+    }
+
+    /* User didn't prove any overlay operation. */
+    if (overlay_ops == NULL) {
+        fprintf(stderr, "No overlay operation mode provided\n");
+        return ERROR_FAIL;
+    }
+
     if (strcmp(overlay_ops, "add") == 0)
         op = overlay_add_op;
     else if (strcmp(overlay_ops, "remove") == 0)
@@ -1309,7 +1336,8 @@ int main_dt_overlay(int argc, char **argv)
         return ERROR_FAIL;
     }
 
-    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+    rc = libxl_dt_overlay(ctx, domain_id, overlay_dtb, overlay_dtb_size, op,
+                          auto_mode, domain_mapping);
 
     free(overlay_dtb);
 
-- 
2.34.1


