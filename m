Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF408AFFEF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711057.1110737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY1-00014a-5X; Wed, 24 Apr 2024 03:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711057.1110737; Wed, 24 Apr 2024 03:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY1-000136-27; Wed, 24 Apr 2024 03:43:53 +0000
Received: by outflank-mailman (input) for mailman id 711057;
 Wed, 24 Apr 2024 03:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQg-0003iy-A8
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce1f1d0c-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:17 +0200 (CEST)
Received: from BL0PR0102CA0061.prod.exchangelabs.com (2603:10b6:208:25::38) by
 PH8PR12MB7206.namprd12.prod.outlook.com (2603:10b6:510:226::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Wed, 24 Apr 2024 03:36:12 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::1) by BL0PR0102CA0061.outlook.office365.com
 (2603:10b6:208:25::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:36:10 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:09 -0500
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
X-Inumbo-ID: ce1f1d0c-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghRDvkE9FCgwOryUffkQ9/MwMaiV/3XgkUUbsRiyZV1Ju4JDEoOE3d4quczvM9RU7t801t4SWP4jZUvyJC8LNHE3XjA6EWqNofTeXngVmMIKXBfO3QkqYH7/j0rkmtWNvW5H3nzSxGpEBqrgZqPqqUbdzyDYoU91RCcot+qwc8x7cNKoB9x2vD6LSQLDM5nn1DJRVapKLpnBQxQJZRk6zaFECljOYc1rn+LhrFe7uRD4/ZPaUeksycAUVPwfUtsFp9a4RPexFbcufFjVFBk7DyXDav1aJB36xf9JFmN6ah7PqL5S63oKsqRxzbZc1CC3nMJjy2Z+HThri4PqG7ZaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQUYI8nFNauA8Eqc+dTwkfBb4u7bvFl+DOSdQh9a2O8=;
 b=Hg6AyUF//gVHUUAvePooLAjWKg3lzfTBVFQLY6PPF/xxFCSWjQ+TK16Czg9ySV4aMUFCYYaGQi8aboE2dXunUVGvJpRcMHVL9w/SLbiBH+V0rZZ92mzDioo+8GIvXokuqXL3pVEaqvSV39iFs5n7B0caaSOhIpH/UkWirBvOvgIbA7z2MrPyPB42ZQvbpixxAtzNeQ7i+mpblIj4X1Ub7YFHVgBQ9D5Sbl5fNnl8jFj2CV7Xrlw9f/T8DV0JoQODNk5JcLSDpKXntEDo4bs58m6DWag0cnACnlDoFh/xh2b/Ei+B/5i7vAr8MPqhr2jBRnktrXwQuyQPewhT7eX/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQUYI8nFNauA8Eqc+dTwkfBb4u7bvFl+DOSdQh9a2O8=;
 b=NB4Jbd0TLDTXBfahb8afVzymAvLYtFwrQWa+qWp2ymRyc6DC4Vs0Mbg2aESyxRy3j2dMZG41qgbf6+e2725bNGYK20CLCC+Iw97kBjh4YxVwmlERzQFPkBE0E1mxxiB7kOWfBDfTRkNzvAV6tli3vabUSuEv0F9gQyN82zz1JBE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 13/15] xl/overlay: add remove operation to xenstore
Date: Wed, 24 Apr 2024 11:34:47 +0800
Message-ID: <20240424033449.168398-14-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|PH8PR12MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df460e3-5aae-437d-590a-08dc640fafa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400014|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TdSarGKTVe51lz0a5kBmLLtN4JH9E1C/limauW/385+6HgkrE0eLPd7S4OUz?=
 =?us-ascii?Q?tr2+yOqQW6YtjGty/LjAuVxVFqFFf7goUCzFmJdvslNm4AY6lPm4POtW042a?=
 =?us-ascii?Q?Z4wqyYUiwKYK8tMt74ZV1sgNQNRR45CKZGgJ4Saze56BFdeYf84UhmLM8FPi?=
 =?us-ascii?Q?6xrKF09ueQAr+ccZ7RgF/pTv0DEE9W0eRhHj2nmNbHCeMdlG8K1M3pPsJwt8?=
 =?us-ascii?Q?CWDwovIUm3c3+8bX813nbCI7XGz8/r3i6Z1CAsgakI2m/KPV2UA996gvVxnP?=
 =?us-ascii?Q?wZLSEzluNRZRhMHRa0EQ2FgrhaqhgV7K6y9l4q8P9xboPHzULrKGUF03XUCR?=
 =?us-ascii?Q?eFpGTBj6EwFM8cfo/21C8sfwsaZnZNmJyR8lD5wjfLyUNKJLu37RPJGOqKoi?=
 =?us-ascii?Q?3swZzAJwMSq+egrEmq7AJhAY/f1oqbEmpYtBvw69JJnupDXn/xKr4yprInt+?=
 =?us-ascii?Q?cU1F7yA5Y3E2jaxsk6uNEJi4De1yuo5n3yU59YsGMAoYNcvti3JkkUZ9Ph/+?=
 =?us-ascii?Q?SZlEzXBZ9ST5i/SYtNk3oFnnxmmelY0lPgvovnlMOBPf8WoCex89AVFX7mqz?=
 =?us-ascii?Q?XMXuEuewBAekC0OW5Pl681djcBJ77DneVOaK488Y7Db6yzS9q0lxeO1pUoaF?=
 =?us-ascii?Q?N+lL7R+KtzItyau3rt0qXWzRS6LUZooovv5Q0ruSqTav1Sbrty6JItgdDo+I?=
 =?us-ascii?Q?BUp1fXDvWAsz75D1C2l/1LIxtZL10fYXATi54w63VeY5olLnu2QOTJ49a6tv?=
 =?us-ascii?Q?Uh0F3gTzII+fD/9ds7YsVyQpr6jqocrPphLj/NTSmmPmkr/R2HKFWaoC6RaZ?=
 =?us-ascii?Q?5nP+Ik7e8njzpwfPP90eRhKAvgbI/oZsLalsVRMUMi/nb46LFd3mjexBA1D8?=
 =?us-ascii?Q?MKz3jIgeBmuk8KHHKpF1opR+WMpEVkca7PY7MyVHIBrzMBgmHtAqLQrGQ9bh?=
 =?us-ascii?Q?A0QL3NPJ9DjkDQnUOvKdJ4CxjStGBM1HGK/8a1kNBeVHw/YjOT/nL1uXuT+U?=
 =?us-ascii?Q?d69mOLMOXh73V/rcMt8/dB3C7WgSqkso0X/QmpjTyXXh1eLZJan2fYsgyTSX?=
 =?us-ascii?Q?ajRdKce8GM3lyERucDqAKr0akogONq2LmNVm6/qphCG8pak1O3NPGIdWfN8S?=
 =?us-ascii?Q?G0W+vwrRQUm157twupH4QzCenPJe5OAjlbl0zIPuw72QwGphN/xKx/VL7BGm?=
 =?us-ascii?Q?WiuDtXE1s2EJNne9CXKw7vPw70h1Onu7A2805l/Mg/+FSBa/SDV7gRmYi44l?=
 =?us-ascii?Q?+/SJl7oiKYOR8ZTlYaKbypN4lAnwx2wB0vr4kL5XMKuRa2jROMlgFRDbc8+T?=
 =?us-ascii?Q?htdxTWZI7OaapO+oigcGabM+Cx1GBC9epj2MhUSSujgHVmZy9fYL5EsagACb?=
 =?us-ascii?Q?oCyHnhc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:11.3238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df460e3-5aae-437d-590a-08dc640fafa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7206

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Add 3 new command line parameters to the xl overlay command: overlay
name, type and partial. Pass these paramters to the domU via xenstore.

Also introduce support for "operation" in xenstore: it can be "add" or
"remove". In case of "remove", the overlay is to be removed from the
domU device tree.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/xl/xl_vmcontrol.c | 184 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 173 insertions(+), 11 deletions(-)

diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 2bf76dd389..ddd6e9e370 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1466,8 +1466,123 @@ static uint32_t get_num_pages(struct xs_handle *xs, const char *xs_path)
     return num_pages;
 }
 
+static bool write_overlay_operation(struct xs_handle *xs, char *operation,
+                               char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char ref[64];
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    snprintf(ref, sizeof(ref), "%s", operation);
+    snprintf(buf, sizeof(buf), "%s/overlay-operation", path);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        return false;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            return false;
+    }
+
+    return true;
+}
+
+static bool write_overlay_name(struct xs_handle *xs, char *name,
+                               char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char ref[64];
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    snprintf(ref, sizeof(ref), "%s", name);
+    snprintf(buf, sizeof(buf), "%s/overlay-name", path);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        return false;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            return false;
+    }
+
+    return true;
+}
+
+static bool write_overlay_type(struct xs_handle *xs, char *type,
+                               char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char ref[64];
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    snprintf(ref, sizeof(ref), "%s", type);
+    snprintf(buf, sizeof(buf), "%s/overlay-type", path);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        return false;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            return false;
+    }
+
+    return true;
+}
+
+static bool write_overlay_partial(struct xs_handle *xs, bool is_partial,
+                                  char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char ref[4];
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    snprintf(ref, sizeof(ref), "%d", is_partial);
+    snprintf(buf, sizeof(buf), "%s/overlay-partial", path);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        return false;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            return false;
+    }
+
+    return true;
+}
+
+
 static int share_overlay_with_domu(void *overlay_dt_domU, int overlay_dt_size,
-                                   int domain_id)
+                                   int domain_id, char *overlay_ops,
+                                   char *overlay_name,
+                                   char *overlay_type, bool is_overlay_partial)
 {
     struct xs_handle *xs = NULL;
     char *path = NULL;
@@ -1574,6 +1689,34 @@ static int share_overlay_with_domu(void *overlay_dt_domU, int overlay_dt_size,
         goto out;
     }
 
+    /* write overlay ops */
+    if (!write_overlay_operation(xs, overlay_ops, path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing overlay_ops ready failed\n");
+        goto out;
+    }
+
+    /* Write the overlay-name. */
+    if (!write_overlay_name(xs, overlay_name, path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing overlay_name ready failed\n");
+        goto out;
+    }
+
+    /* Write the overlay-type. */
+    if (!write_overlay_type(xs, overlay_type, path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing overlay_type ready failed\n");
+        goto out;
+    }
+
+    /* Write the overlay-partial. */
+    if (!write_overlay_partial(xs, is_overlay_partial, path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing overlay_partial ready failed\n");
+        goto out;
+    }
+
     /* Write the status "done". */
     if (!write_status(xs, "done", sender_status_path)) {
         fprintf(stderr,"Writing status DONE failed\n");
@@ -1611,13 +1754,16 @@ int main_dt_overlay(int argc, char **argv)
     int overlay_dtb_size = 0;
     const int overlay_add_op = 1;
     const int overlay_remove_op = 2;
+    char *overlay_name = "overlay";
+    char *overlay_type = "normal";
+    bool is_overlay_partial = false;
 
     if (argc < 3) {
         help("dt-overlay");
         return EXIT_FAILURE;
     }
 
-    if (argc > 5) {
+    if (argc > 7) {
         fprintf(stderr, "Too many arguments\n");
         return ERROR_FAIL;
     }
@@ -1625,17 +1771,22 @@ int main_dt_overlay(int argc, char **argv)
     overlay_ops = argv[1];
     overlay_config_file = argv[2];
 
-    if (!strcmp(argv[argc - 1], "-e"))
-        auto_mode = false;
-
-    if (argc == 4 || !auto_mode) {
+    if (argc == 4 ) {
         domain_id = find_domain(argv[argc-1]);
         domain_mapping = true;
-    }
-
-    if (argc == 5 || !auto_mode) {
-        domain_id = find_domain(argv[argc-2]);
+    } else if (argc == 5 && !strcmp(argv[4], "-e")) {
+        domain_id = find_domain(argv[3]);
+        auto_mode = false;
         domain_mapping = true;
+    } else if (argc == 7) {
+        domain_id = find_domain(argv[3]);
+        domain_mapping = true;
+        overlay_name = argv[4];
+        overlay_type = argv[5];
+        is_overlay_partial = atoi(argv[6]);
+    } else {
+        fprintf(stderr, "Invalid arguments\n");
+        return ERROR_FAIL;
     }
 
     /* User didn't prove any overlay operation. */
@@ -1678,7 +1829,18 @@ int main_dt_overlay(int argc, char **argv)
 
     if (domain_id && auto_mode && (op == LIBXL_DT_OVERLAY_ADD))
         rc = share_overlay_with_domu(overlay_dtb, overlay_dtb_size,
-                                     domain_id);
+                                     domain_id, "add", overlay_name,
+                                     overlay_type, is_overlay_partial);
+
+    if (rc) {
+        free(overlay_dtb);
+        return rc;
+    }
+
+    if (domain_id && auto_mode && (op == LIBXL_DT_OVERLAY_REMOVE))
+        rc = share_overlay_with_domu(overlay_dtb, overlay_dtb_size,
+                                     domain_id, "remove", overlay_name,
+                                     overlay_type, is_overlay_partial);
 
     free(overlay_dtb);
     return rc;
-- 
2.34.1


