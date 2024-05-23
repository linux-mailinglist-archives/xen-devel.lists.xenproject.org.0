Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E068CCD2E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728109.1132953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34d-0004by-0i; Thu, 23 May 2024 07:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728109.1132953; Thu, 23 May 2024 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34c-0004Y0-S1; Thu, 23 May 2024 07:41:14 +0000
Received: by outflank-mailman (input) for mailman id 728109;
 Thu, 23 May 2024 07:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34b-0003CF-Hg
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:41:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d34da501-18d7-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 09:41:11 +0200 (CEST)
Received: from BY5PR20CA0013.namprd20.prod.outlook.com (2603:10b6:a03:1f4::26)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 07:41:08 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::2e) by BY5PR20CA0013.outlook.office365.com
 (2603:10b6:a03:1f4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Thu, 23 May 2024 07:41:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:41:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:41:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:41:01 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:41:00 -0500
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
X-Inumbo-ID: d34da501-18d7-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8xx40pf5Keh1b42FvaLrBPfygRwS+VlBg+4pTsdKe3/5zk4nHES1+k9oi3u2mVTJPO2rld5GoqAAHfBPBCZqCihVjTf8Ec3MQZuWIxrxlUfD/IrXGfrp2f3as9Q6SBfOB58run/nINP7IvutIjKp4NwkAdoSHWQj+q4pWFqBBU5gigCfobNgeWjdJ6oFvsNHi1jImBZAwgPrx6L+ELYrHnrDuOgH4ZxJPDjFH5dkrSpZnAYXcb5C4s6DNjutiejZSAcAfKr5oLmLQbz6gbYPblppVavrKc1ZakViO+w0BcJX6icO1nYeNZBIAPo4fuovImMA8RqWBkr8bRu3SSfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da2DEjMTTPOqHs5JEHft5f2zNU/TKUOCNbSUhm9LjB0=;
 b=mJe/hsJJNhF9SfQulWbnW8YkZ51UUl+LS+LW9zlfazjX7EEK13nvmIsnqlw3dLjR+xF1bCUe9tO0BzNDt8svJckLgY9qdecfsN7B0Zot6c3I5HchUj5XsnaDybLHtb5hxBYLubL4r6wDCnMv4LXXZPYGEFZBIMtNVoi+R9szpFc1PbV1PulgxkT6u7hPEguLMKnkWpcemo8EU7pA6qE47jdIZDcfU7oXDPf3oQqXYVsIHmPimbtL/dkGsPnD7K/4qSBkBbCz/CJ5TLty9fTlctAGArW2gE0cl0MVXDeMjuR+LoXt62aKLrkiMozVxkEt/O+TI9ObnJN9/3jbCGOEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da2DEjMTTPOqHs5JEHft5f2zNU/TKUOCNbSUhm9LjB0=;
 b=Xdq9w1W82Bn0vuY6eT/+m7Ixhu5PytVvwZhlxWBg2SLQHyxj/d3M+f+I6XTMUXj7U6TXbb/iQy0tWCcx0EkK5NKziYi26jqNG/hWnJPqxc52tbxyMvEZHgL+iLb97Ne1e+v4NZvE8GNSsfBw82n61ZI8sVOl33bdhZAemF44NjM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
	Henry Wang <xin.wang2@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v4 8/9] tools: Introduce the "xl dt-overlay {attach,detach}" commands
Date: Thu, 23 May 2024 15:40:39 +0800
Message-ID: <20240523074040.1611264-9-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 543ba5a1-7b6f-43ed-6a07-08dc7afbb558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?thVannc2U8Dx/QzE1TkJBopXvcqv5OJO1x6Qv+15CEuSHxn6lj+eFTZmWNhz?=
 =?us-ascii?Q?kI3HTlMG/cd2WkdjXcht9nqn2OuqxzADHOpbEP2ajzRD9F2iyeVAvir42gb3?=
 =?us-ascii?Q?AIuo7mxkIBIRUOy4sXFqiecwP6OKOmGA18bbPgIJPseM2h/+r5KCNTpTCrwF?=
 =?us-ascii?Q?R0UYPrGVHd5EvPe21LPzv7gegeIgqDDf1PUDzGk+sqzEgb91KVzifAqG962m?=
 =?us-ascii?Q?H/R1fZnCaY1IC1fhxyU2wilKCjc7lGG3IPKgv7tNXgUb9iMcRkHDFCKYSD9M?=
 =?us-ascii?Q?RasR7Z7A8A5AVvIIB64YeaTwxX/RXgImQ//RiV4yzA7gPOFBywzl3y7CMRcw?=
 =?us-ascii?Q?QXWMEnWhI/LY4PacYosUfohypuvWYmOG1dW8OBPuBOsJz1i1KANjeMcfgp01?=
 =?us-ascii?Q?wdt0tCSQFfBpARNRbHghaN8DCpum8/bA3H1QsWlK3KnVz9GZDZJ8Bx8Vh/6Q?=
 =?us-ascii?Q?OGdtjJLXvyRwTCT6QVFYD+rIHn2PjPAkqewG1i4E19ybdX/jkUGTe2PlVXjW?=
 =?us-ascii?Q?7v73FajVGMOlgUf0d//LUoY/XCuYuGBezRKIJfMjq1gBSUUA4OS4M3av8cyY?=
 =?us-ascii?Q?zoqH8QU8CPNj7WHmitm+oibjs98hor4MrtVMtJEoVGL2i65eniSZDFlfbKem?=
 =?us-ascii?Q?dGuVce9BT+O9Ff8O5rovFCictvdzHNPToQlQ0snKJet8SHZNNIdaDNmn+0dR?=
 =?us-ascii?Q?YcytvDIp0pBlxabx003sb/5y7LzvTkutaH7BYcOMDRy+7ZoJKYPb8mOoc+hK?=
 =?us-ascii?Q?aEJC9gdUQr0X+fufjswffBO084hTxI8x1q/XykxT4ole9P5CxoS1sQCnQ8+R?=
 =?us-ascii?Q?MeFq4/UxErk/maNgJhUGxmP7Tw/RQWabOh7mRr3U7Y7FCvEADDv2ntUGPrKG?=
 =?us-ascii?Q?iFanZejcICUQPO7ma1KMy16F+YY92cZpx4ixLBUsTfveebLDgL9OmGxdqdP2?=
 =?us-ascii?Q?tYaQn3AuICSuZKyWTli1b3uQwvy+9Bpu5XM9CQODlOTz4XA/cEdz5uEO/c8N?=
 =?us-ascii?Q?+prTFj7MieelZIXNx36DU7l6F440XeVVOjrn4PhnvwNxj9iWsiWCfvI+3Z5Y?=
 =?us-ascii?Q?oHK/y+WK3x3AdArXQEydsUurLql9HWJq2gmCAPM9mlvMhV5ZMADX1M/aZaAy?=
 =?us-ascii?Q?2wbJnrg28UHI/WdVEL0Ib48QqrSSLKNClpCCuoIYXzBD9/dqmYm7y8aBXXJT?=
 =?us-ascii?Q?xuaYY+IH9m7ipSjCVpjji/G30Del/ThGG8HUOxj82i+5JE8TMivTO1vCR9mr?=
 =?us-ascii?Q?k5sOjfCJWqftfp4bWoQQpowEcYmciPhjXzvc8zi/u8mvfyiDB6xHcY0sncY7?=
 =?us-ascii?Q?LQU8nFNJ1g0a2NWaioe1Ej952p+sb/XW3c0syXKtMC9GOV9EYHCPXrg2wWKE?=
 =?us-ascii?Q?8k1J6rmIX3z/i3cmPMAF1GeSw/pn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:41:07.6055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 543ba5a1-7b6f-43ed-6a07-08dc7afbb558
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804

With the XEN_DOMCTL_dt_overlay DOMCTL added, users should be able to
attach/detach devices from the provided DT overlay to domains.
Support this by introducing a new set of "xl dt-overlay" commands and
related documentation, i.e. "xl dt-overlay {attach,detach}". Slightly
rework the command option parsing logic.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
- Add Jason's Reviewed-by tag.
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


