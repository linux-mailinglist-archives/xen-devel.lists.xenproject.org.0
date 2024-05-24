Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1478CEC5E
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729892.1135251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDl-0000dl-OI; Fri, 24 May 2024 22:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729892.1135251; Fri, 24 May 2024 22:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDl-0000Y2-H1; Fri, 24 May 2024 22:17:05 +0000
Received: by outflank-mailman (input) for mailman id 729892;
 Fri, 24 May 2024 22:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDj-0007Iy-SR
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:17:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56bec488-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:17:00 +0200 (CEST)
Received: from DM5PR08CA0053.namprd08.prod.outlook.com (2603:10b6:4:60::42) by
 PH7PR12MB7186.namprd12.prod.outlook.com (2603:10b6:510:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 22:16:54 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::eb) by DM5PR08CA0053.outlook.office365.com
 (2603:10b6:4:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 22:16:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:52 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:52 -0500
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
X-Inumbo-ID: 56bec488-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1WIa5hyBbCCmlFsWsiq13AwcNfDf/prH6dSxgm6oIo3UjuP/GqZTPKrsRepQOPZlyuzfn5lhTrHU2E/kYnz12viCULvm1LYNwq4P5tSZriOz47NU6p0EgNlGTEqIOtfyo08zWXQ8yg0NtIESkV65YY7K4unrZiAzaqrZUBj2w/MCZqha3W5MoQ5QnpEJjcDYJ8YwdtoWahmNunPJqXAe5Wg2N7KXY+61l64dYoDTWwLwduInYTCbFw/h9GlvuiKBJIMCUH02mRLY+ImMMolcrFsImwG15zbIFWWT97Xd8P0aRf69Quepyeq5l4Qa+zCzc2sFzAX6gUwyhhHfb2ArQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8840+SwwfsZRigVHTRSue5zpJzKftzBoXAWMQbq7J+M=;
 b=Qrk8E90Rgt6OOmUIFY0qT0O8Z83C04195iMCs2ce652csFpzX5gnnbQc1gQQ5GABIEC3LM9Tt59zURQ7XNUCbv9UFML6sC0ZzcOBuMag/TwfTXb0sYsxny66B5ER5+bqjoOD1nETJ11vqrUOS+MiwiAV/6pbADZAYQwh+UBqDu9bSQ6sYdR/FL1MVYCHUgyQY6IaGiscYziPOMGxiZtYLTVUPwsbbu+kgjguffDNj0qTp4KHYQJqZDy4b6UKjAFm0EaQdb+T/qTdwUE4dy+OtEtUHdH84ciaOtcpSJk1awiuoWreYWqNj6V2ZtGSIUxlf09MV/29PZpMLkOlSxSMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8840+SwwfsZRigVHTRSue5zpJzKftzBoXAWMQbq7J+M=;
 b=Fq9Fg5caWy1L9wZTOdDnjbfjD7lAO/71QqmWN29AMXvkT6W2gt2puCYt+6zEkevBLQezaHP3geXk9Ep94o4lztrZ+lyZFXq88zUkREbCTZ5A9o/e5E0uBpZ+5K+fHXKWWLb1GUaL5Pm4g/mUxJAxiljI4qAGi1vXXuv3vFj6iEo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v6 6/7] tools: Introduce the "xl dt-overlay attach" command
Date: Fri, 24 May 2024 15:16:46 -0700
Message-ID: <20240524221647.2860711-6-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH7PR12MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ee4b0c-592c-4e4e-93e8-08dc7c3f37b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U4fvEoe62dzmheReT3IX5YSBS6THqI7f9eCy8/PXK3G2ySg6+fuUd3nDyGK8?=
 =?us-ascii?Q?tG91lPI7TuDG4N3+enj7jOGF/PS8vKIk/NUhumPlOkCfNmA9xGttOoWv+8go?=
 =?us-ascii?Q?iSO4Pgn6ZE8pCskl1obbxJHSgHK8TUejGKJfyk2UUZb7GBMhUYjNnnso1ngs?=
 =?us-ascii?Q?i6rNYkCs67hMA2ZJOsktatvcMO195MonofhLr3vngg32r8HhlolMVXULhwUz?=
 =?us-ascii?Q?SS7bnr4/VL4LDnbFV0E56OsaMFMFyKzk+APf/s5Pe85yty4SgcTYe5KcPiBr?=
 =?us-ascii?Q?HBS3FGNVAKhuh4Q3sN87MaPQtqyKnb3ouvRwoTxozA/ddP+R+1NTEw9Yewt1?=
 =?us-ascii?Q?woYmszs0kDIYaHc8c21RC8nisZEFBbHFfUxrlItAiqCtVT9T6J109+WVAiWF?=
 =?us-ascii?Q?r9k6GVRqdSDayzPcdV1eAAJuISNDHVK3XBqCB3VoCY6nzG7FgRdyV4Yk2aZK?=
 =?us-ascii?Q?u7vX6nYUAhxmtBEoYBhZknadZ26P5lWyaLPXfG3JQGkwp3IUzSbykpXjEbSJ?=
 =?us-ascii?Q?3x/wPyy/7aIOmBGbpAFpoIG9NasLMp8rXUd+teYwZKFrgbeglyyajaSOyvQS?=
 =?us-ascii?Q?OEk0dgF9pwT9Ye6sVI0nd6WVAZxH20aqSoSME5zXQfmrB1sDf1FoOsawCaG5?=
 =?us-ascii?Q?bczEW55Z9mV9fcZAQAVL8FS74EFaeR/22UFNcFIrWvSoHiDLhjcK+7WEB+EC?=
 =?us-ascii?Q?PgGN7AVw/diyymphRb/DsVyvyrZrm/nh80RfzZI1wVB0tRnwUFVyll72LsHg?=
 =?us-ascii?Q?wVLcWcDLZ7FbMUVjfJxYC0XmtyGcVF214Mu2abQXWYOl8u4aWRrcjbEbzobf?=
 =?us-ascii?Q?OD1xH8gQFgLBaZ4e+IpoOeqW9hNeLCqp2Pt59kiLVRrQv2g61n024xxwqDV7?=
 =?us-ascii?Q?Dg4j50cp3TKDqe1klIkKn+Q67JKRrGDOEcZ3ly78yFsYmsyHFbZJt5x2zcBP?=
 =?us-ascii?Q?WKcP/vVLZHG+f/UFQiWkJ9Eu/KzBPaKCBlKZOJX2n1fNjXExzlBdiCJtMw/n?=
 =?us-ascii?Q?PruPBfolRqYCAu686/c5qYthZTGD3t/XrZVVemULFPRzdDowogcz62GPi7ne?=
 =?us-ascii?Q?s5TKw4tgqBeenvioCzTgvyySJQozI6OSp4HTjxBIjS/kf4PeoLruOB9CiTBl?=
 =?us-ascii?Q?eUwvwmmBShi0vdBhbWjfq4iRzqL49qxVc50u0PUp91loQ2NSJUiUrQFIC6og?=
 =?us-ascii?Q?oAojShaBmycYaPTa2u4abnd98Dti94R09cb7ehUG1NStysdnZRmUJycW/xG/?=
 =?us-ascii?Q?F+ydTDXqnak4eGY0h7svTjZKF/S8HW2obWdgv+VjVQb90hnvhD6kQYqDL9kh?=
 =?us-ascii?Q?jEa6wmKNjI6IY3rgrKBrYicxpxK73OoErtb6O7x/h0O6q+fBawH7SeQduZJ0?=
 =?us-ascii?Q?LTd9aTLasnDpEi80051JEwHcKWjx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:53.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ee4b0c-592c-4e4e-93e8-08dc7c3f37b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7186

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
index a3d05c840b..f5c7167742 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -641,6 +641,12 @@
  */
 #define LIBXL_HAVE_XEN_9PFS 1
 
+/*
+ * LIBXL_HAVE_DT_OVERLAY_DOMAIN indicates the presence of
+ * libxl_dt_overlay_domain.
+ */
+#define LIBXL_HAVE_DT_OVERLAY_DOMAIN 1
+
 /*
  * libxl memory management
  *
@@ -2554,8 +2560,17 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
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


