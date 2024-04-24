Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2B8AFFF7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711065.1110778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTYG-0002te-NL; Wed, 24 Apr 2024 03:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711065.1110778; Wed, 24 Apr 2024 03:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTYG-0002oj-IW; Wed, 24 Apr 2024 03:44:08 +0000
Received: by outflank-mailman (input) for mailman id 711065;
 Wed, 24 Apr 2024 03:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQc-0002In-Hm
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc3f77cc-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:36:12 +0200 (CEST)
Received: from BLAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:32b::6)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:09 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::df) by BLAPR03CA0001.outlook.office365.com
 (2603:10b6:208:32b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:36:08 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:07 -0500
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
X-Inumbo-ID: cc3f77cc-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzAsCVGOIBM4aLWQepgcbkJp/V71xl8o/GOqVHdDvyYOGZG7fadR17re5j6yAaY25X9Dnls0k/woSxdzYb95y7zLYfZuDKhXayCDlOp0YSob7K8mxfGbkqA53F4CKJxgzBc/y5EyxTX/T9TzduATO8v676RgoK2t9ZX9NKb9b2hpZw1ywWOM4dokXJPH0PC5mjaaNoxqXmJyYsB0Zii6PS8HHWGQkngsqgdKnJuxedbxYlTHRIHUIFFe0+kIK+6utFCBvglfO0GntH6IQr1JAXc3u7jAQJwYxpmT7O+kOGsqlzID9F5XJSV8ssKWU8d4444AJpGxkKuyx81wIJcFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHMeGH0iZW93mGnvrfaGMm5ps1VEfR09KqSQj+crtvI=;
 b=I5GPS+tJSgbLnvAHhb1kJU2+4WaxEytlHuhkl4eWmsN9uw2dAOVCwmuQa3unVG6MhiYqVM7gMcjt2H6A2GwhZHZ9kh9bqOMm+ep7IQPZdyvrtJf3MkbX6YlDZqAU7b1hN6/v9R7YEt5LM3/vZCTQ+nf+d10wwFq/KImXAaP7zYq+U6VoI5ImPebk/VyELkQyOb9sQcjPn/MjZzXiAa0p5pwmqTev31AJWXAggl6UxszkMidal5bG39lQbVq9JqqWcVcKUeO68AZiGgrDuUnrcaInS2BtTYhEwkv/IaczKv0e/UeJKkXTlMSqL8tnzIn5SX3SaEjcfZaIPc9aNF0ksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHMeGH0iZW93mGnvrfaGMm5ps1VEfR09KqSQj+crtvI=;
 b=xYv38md6GsKSJEs4ASCuVJDkMcunQ/jigiCVYp9CaPbVbMdGUcHP4u3ObnVQDTChVU2NiZLDUG+WQXGuuzyJM73M6d9pZ8tPkeZ6gfSQSjfHdgjnyYPDsknzFZIDsMC5pVc0DTt88eb53QUL7wfsAtz9rgUk3DPZU3hPBY/PgTA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH 12/15] get_overlay: remove domU overlay
Date: Wed, 24 Apr 2024 11:34:46 +0800
Message-ID: <20240424033449.168398-13-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6bd8ae-55d2-45c2-2d01-08dc640fae7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Smpqz978Gt8Y4jwYCowjh4u88gFcgSMPBYg2xfE1oZXVTOHkXfrmDhRjxqBr?=
 =?us-ascii?Q?QgyZwnCQ2ytVopj33BzY2ozwczeOtOxkD0iJxut9cGiujaT7DIVETZgIUy1Z?=
 =?us-ascii?Q?tRWdBeucLa6F8+R/V/xGJF3fajioMu8RBdgWcpN35XAA9FN0HqIURCjdrygK?=
 =?us-ascii?Q?fuh+IRnLX+UW+5FUHlvh7BzKfeCHPCeMuvxaoEVcOw2yDOVZTeoG1ElyoocF?=
 =?us-ascii?Q?0leHcZnyKZnsneTzIkWHA+bhirtXRnHn2KdbeR7RiWkVz33LFAPhEhCP3gII?=
 =?us-ascii?Q?FJIspEWW+ba9buzx7Y6lIgyrekQz007TK/l/b04ZPNfNmOfYEklIQFS1yToJ?=
 =?us-ascii?Q?xxG9m/JLL26w2CgJVqbc8ftPd0jdHIzLt+Vk9VY4GR96NLHPi9WbO0Imdw6t?=
 =?us-ascii?Q?eQutXZlgu4CXWUf9KQYdu2v4AK6hoMpXGd5FkbR7sGGLfn4HqjX/erBWDJiM?=
 =?us-ascii?Q?MVi+PO5N9WSkqErcPtgIDl/rBBp5KmXa1ULxe+9j5yrWg71B9Z92gYZFc0tQ?=
 =?us-ascii?Q?xlpKo+DtS4xBjr2Em7AVwrfijy4bI+T1kqSEuIUtFasxvoeUH/J6OsFbZn2U?=
 =?us-ascii?Q?kmxkuD+PTSJLa8EXx+O8fJgQwQ0oPn2DW/tsZJhlnNfMxkxDtfzf3K+sTUAP?=
 =?us-ascii?Q?FF1YRtjuPnSnoUgDmEOI4cQAn8IytKjvGywAa6t61GY0AOcM5FZP+0RKZjrl?=
 =?us-ascii?Q?qeOyyCN7eP39mgXJqw81rqKYAV4ll8caqLJI4u8/DzgBc00GkrtnyOt3Xqet?=
 =?us-ascii?Q?6N4Gw3OCdlqTFI1A82ZjlfpnZrtUenVhY8k+xVvZMnOiXPjksyzO/HBlvGK8?=
 =?us-ascii?Q?oPxgs0VoVS/VCsL6gRigzajHp1w0EwrEg6vtqGWQmbHZ5Ro5f8VY/+KWQV7B?=
 =?us-ascii?Q?7zFdW2LRFuIFVVL6LN3QTGb5djSDvG6bPgccmKrou5mE2BMaMb5SL8PA63iB?=
 =?us-ascii?Q?Okx8j4jhuc1B4qWp2SNcOpKQio/PEUAtTCwhJDgi6yrqf589pmdm9qLXTT/x?=
 =?us-ascii?Q?W1d7O1Tu7S8cc4rJQkYbJ5kJ40+Tbucx782pZCTD/OquZNgoJx+GwV7KKy4Y?=
 =?us-ascii?Q?itCXkQrk3+5i7NpqQIETggqV8Pl5Y+uw6QLQScN6WnY1ircg25PMY/EWUOva?=
 =?us-ascii?Q?fZOiMlM9YqhoVo2yhRJqp+tBNqpYXDBedHIbiZntj6TKI/NLKSVooQ6k/TWu?=
 =?us-ascii?Q?75rwbcP0Cy9NUmxruGnv0NdOxOLvywPXie6Gi7lLBLmlIt3IuAImM3vAdFVS?=
 =?us-ascii?Q?pY9ulG1c8iM8fEueoMHeGLVDVDGu1jTxcgUJUkDApasPkuPgpzNis9XsTSTV?=
 =?us-ascii?Q?zkDbIqIbpWX3+QWrvBWpVN+d4045R6vGK8V8tetUvFeHJ1QzTizQnGnq+GmG?=
 =?us-ascii?Q?4D4gIzs2jWazB8PB9qwcIZguTgTG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:09.4156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6bd8ae-55d2-45c2-2d01-08dc640fae7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Retrieve 4 new parameters from xenstore: overlay name, type, whether it
is a partial overlay and operation. Operation can be "add" or "remove".

Add correspond to existing mode of operation. Remove introduces support
for removing an overlay from a domU.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/helpers/get_overlay.c | 132 +++++++++++++++++++++++++++++++++---
 1 file changed, 123 insertions(+), 9 deletions(-)

diff --git a/tools/helpers/get_overlay.c b/tools/helpers/get_overlay.c
index ca3007570e..daa697ca04 100644
--- a/tools/helpers/get_overlay.c
+++ b/tools/helpers/get_overlay.c
@@ -66,6 +66,33 @@ retry_transaction:
     snprintf(ref, sizeof(ref), "%s", "not_ready");
     snprintf(buf, sizeof(buf), "%s/sender-status", xs_base);
 
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    /* Create overlay-name node. */
+    snprintf(ref, sizeof(ref), "%s", "overlay_node");
+    snprintf(buf, sizeof(buf), "%s/overlay-name", xs_base);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    /* Create overlay-type node. */
+    snprintf(ref, sizeof(ref), "%s", "type");
+    snprintf(buf, sizeof(buf), "%s/overlay-type", xs_base);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    /* Create overlay-partial node. */
+    snprintf(ref, sizeof(ref), "%d", 0);
+    snprintf(buf, sizeof(buf), "%s/overlay-partial", xs_base);
+
     if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
         goto fail_xs_transaction;
     if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
@@ -174,7 +201,7 @@ static bool wait_for_status(struct xs_handle *xs, int fd, char *status_path,
 }
 
 static bool write_page_ref(struct xs_handle *xs, uint32_t *page_ref,
-                           uint32_t num_pages, char *path)
+                           uint32_t num_pages, const char *path)
 {
     xs_transaction_t xs_trans = XBT_NULL;
     char buf[128];
@@ -249,12 +276,69 @@ retry_transaction:
     return true;
 }
 
+static char *get_overlay_ops(struct xs_handle *xs, const char *xs_path)
+{
+    char buf[128];
+    char *ref = NULL;
+    unsigned int len;
+
+    snprintf(buf, sizeof(buf), "%s/overlay-operation", xs_path);
+
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    return ref;
+}
+static char *get_overlay_name(struct xs_handle *xs, const char *xs_path)
+{
+    char buf[128];
+    char *ref = NULL;
+    unsigned int len;
+
+    snprintf(buf, sizeof(buf), "%s/overlay-name", xs_path);
+
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    return ref;
+}
+
+static char *get_overlay_type(struct xs_handle *xs, const char *xs_path)
+{
+    char buf[128];
+    char *ref = NULL;
+    unsigned int len;
+
+    snprintf(buf, sizeof(buf), "%s/overlay-type", xs_path);
+
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    return ref;
+}
+
+static bool get_overlay_partial(struct xs_handle *xs, const char *xs_path)
+{
+    char buf[128];
+    char *ref = NULL;
+    unsigned int len;
+
+    snprintf(buf, sizeof(buf), "%s/overlay-partial", xs_path);
+
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    if (ref) {
+        bool is_partial = atoi(ref);
+        free(ref);
+        return is_partial;
+    }
+
+    return false;
+}
+
 int main(int argc, char **argv)
 {
     void *buffer = NULL;
     int domain ;
     uint32_t *page_refs = NULL;
-    FILE *fptr;
+    FILE *fptr = NULL;
     int dtbo_size = 0;
     const char *path = "data/overlay";
     char receiver_status_path[64] = { };
@@ -263,7 +347,11 @@ int main(int argc, char **argv)
     int rc = 0;
     int fd = 0;
     uint32_t num_pages = 0;
-    xengntshr_handle *gntshr;
+    xengntshr_handle *gntshr = NULL;
+    char *overlay_ops = NULL;
+    char *name = NULL;
+    char *type = NULL;
+    bool is_partial = false;
 
     if (argc < 2) {
        fprintf(stderr,"Please enter domain_id.\n");
@@ -357,16 +445,33 @@ int main(int argc, char **argv)
         goto out;
     }
 
-    if ((fptr = fopen("overlay.dtbo","wb")) == NULL) {
-        fprintf(stderr,"Error! opening file");
+    overlay_ops = get_overlay_ops(xs, path);
+    name = get_overlay_name(xs, path);
+    type = get_overlay_type(xs, path);
+    is_partial = get_overlay_partial(xs, path);
+
+    if (overlay_ops == NULL || name == NULL || type == NULL)
         goto out;
-    }
 
-    printf("Writing to file overlay.dtbo.\n");
+    printf("%s %s %s", overlay_ops, name, type);
+    if (is_partial)
+        printf(" %d", is_partial);
+
+    printf("\n");
 
-    fwrite(buffer, dtbo_size, 1, fptr);
+    if (!strcmp(overlay_ops, "add")) {
 
-    printf("Done writing to file overlay.dtbo \n");
+        if ((fptr = fopen("overlay.dtbo","wb")) == NULL) {
+            fprintf(stderr,"Error! opening file");
+            goto out;
+        }
+
+        printf("Writing to file overlay.dtbo.\n");
+
+        fwrite(buffer, dtbo_size, 1, fptr);
+
+        printf("Done writing to file overlay.dtbo \n");
+    }
 
 out:
     if (fptr)
@@ -375,6 +480,15 @@ out:
     if (page_refs)
         free(page_refs);
 
+    if (overlay_ops)
+        free(overlay_ops);
+
+    if (name)
+        free(name);
+
+    if (type)
+        free(type);
+
     if (xs) {
         close(fd);
 
-- 
2.34.1


