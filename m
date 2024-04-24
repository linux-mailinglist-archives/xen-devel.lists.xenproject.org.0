Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD18AFFCD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711032.1110709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQc-0005wT-NF; Wed, 24 Apr 2024 03:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711032.1110709; Wed, 24 Apr 2024 03:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQc-0005tI-HX; Wed, 24 Apr 2024 03:36:14 +0000
Received: by outflank-mailman (input) for mailman id 711032;
 Wed, 24 Apr 2024 03:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQa-0002In-K5
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb071d83-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:36:10 +0200 (CEST)
Received: from MN2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:208:a8::21)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:05 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::5a) by MN2PR12CA0008.outlook.office365.com
 (2603:10b6:208:a8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:36:04 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:02 -0500
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
X-Inumbo-ID: cb071d83-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8nhVp3kknyf4echTk6sdYRC0gg6JdtjV5ydZsD+Pop2qIUQeXpBUH2baBogEOBVA3Dfbl5leTceRmzP+7k0Cfng6vA7hRPJqSS+0JWzXlrWjGd6dHH9JaxXLfMqQINM3XwcA4JZ8BqYhonvDj1lFXqamG8I5jmQyvnh4iywSIhsG+L0m5VTcbiOEjWPfIffROvQfa7FRsTB2NYGWZqJEXWMJh8jxztGVRqzU26iDtCDskJN34gpUVLdaiPDtz0OMkq6vNrqQANa7U0qQj/Y1f21JmAUq55R5XwZcaoRZMcoGL0qgWbY1st3lsyayZUHyfIWOvynA/Y2twGK7lkEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlEz8Qbz/UMaWUU/jaiTmBDD/wiyD0++iaf2udSkHFg=;
 b=WOnZvSv3PaiiQpwUiupW94vZJKTvUqD/eDO5UjBddeWMCo/zv2x+ACpNqXg0+0qxP6Q4bWtlKeBzWqhORvfiY1D4q36CvqLQ9Q6OyVWkPHx9mXBeGsjVDJtQt7l+1ijAcUy8n5i3KUKn3FSuMTcNJ16qACctIpdARoHzCCFy+A2YbQbcDnNdJG381EkOdWUkQG/UPm37y4HG2qhfFqGdbzaba6aztn/dkf/y66b1yorn1Yp7PEAnDZKT5Sv/UQbNxLq1aAwtHwigRvG4w0kUKqTjtN1Dipn39wPLuA9A4qj7nMjiBpAtjru9kbTza/0uNPt+UeVIr2Gt5Glfp2ACog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlEz8Qbz/UMaWUU/jaiTmBDD/wiyD0++iaf2udSkHFg=;
 b=IbHyBjeH1aG91WhymMQQHPWlhiAzsbyNeAfoA94TaRzXFSdUnzErh8nw6hb29YzHivz7QdWw5jzSvpAzKwP4jcIBZW2V8FrNSAMvb17CDTbkNtjF83n6rh2bHupfOLCGWKIM/YWdIjWZOv8Me5RqIgN50o9d0B351Y/v/OTEedE=
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
Subject: [PATCH 10/15] tools/xl: Share overlay with domU
Date: Wed, 24 Apr 2024 11:34:44 +0800
Message-ID: <20240424033449.168398-11-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 651dd3f1-484e-409f-7b9d-08dc640fac09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TGA3dNGoVRuoqr2bB74CDMTC3H/FjOKwXAdM0KjLpp3TYK2bBucumLoW4/rf?=
 =?us-ascii?Q?coAQkIjx33fA540XV0REnp8zF3kyxHq8qU5doepJtONQM8KMy780enBwZt13?=
 =?us-ascii?Q?Wi+iDpB7iim1m3Vky1IuLbnewzWzP4bwcTlPM3bE6ortjH2ddoRXPu3WUIIt?=
 =?us-ascii?Q?hoKdo6GPFypcaYOkYLnOOcTX72V0CiSrE9u6v31U34W1clqSHOFpYd4RD7Xi?=
 =?us-ascii?Q?899Td5TNKNra0nGgblbr1S7ymY4gzuar+zaFtgZuxOGKU3UVompkOObADegc?=
 =?us-ascii?Q?q+yAA8G1mWwr9lvZAIt9hHpBuXT5VfwInpG5TnllEhGIG9E0fG29QQdPi8Ld?=
 =?us-ascii?Q?azdGLP7s5ONnqJqm81c3fTAWVQhc8mbNAjXfU9ML7WMSaPn8YUawihltw3Da?=
 =?us-ascii?Q?UayPEpoFaCgMYvMA26aOl0I+Sd8Ha/8APUc+ZqK8JdWknFCj6uvraAXow0gM?=
 =?us-ascii?Q?bS2nyHbVEAKQOvk2lY7HDJHZUj15GJjCPpZow7U7uLLMV/vkzrGPs9JuW9AD?=
 =?us-ascii?Q?flx4iJ3+yR95+5JOUbs52nORPIq0fwvrXoJbNLJ1r64EVN5IoM+MU6hL+14a?=
 =?us-ascii?Q?VP7aLSYCjvjFKGBblkS2X4SOjcPV4bZstzlDuF+iRjV154AucXTgoyheeXHM?=
 =?us-ascii?Q?roTFMmFLztUAeAZWtV8yQAuHq5uemL0ZJHIlXMlNvq+xmnBmpJUzO9XU1skv?=
 =?us-ascii?Q?4Cg7rofTjssxy78eowUmMkCHqBhg+5syrutgGtG3IJShiMnzgyszgp4kmWXm?=
 =?us-ascii?Q?e9EU/Q2dNxwVeTB3gbGGnsd9ndhO8FO2vwf2NVM37uxnwCSgSuFkGZ87RybH?=
 =?us-ascii?Q?UjFXjuqqc963H7gob6lRYmdpxKRAC5akcYwkAV3li1FbpsZs8Bw9OyfQNft1?=
 =?us-ascii?Q?jx+o/FTEdAXNpVnLcoRoWrPw0OT8caPVtLu6m7rbgLXkJU3tWSGRKSQECoHL?=
 =?us-ascii?Q?QjA7t+wHtzTxfga7yq9qbaAugbvaCR49XQWzgmuMPJ+ktpy5DEls3x6dJyh9?=
 =?us-ascii?Q?y4xbCFnJr5XDHobweE6DL51yM0mABjpblshQ/q/CRP31DOlEo49kvv6rSsgW?=
 =?us-ascii?Q?pqsdWZjhPS4Yv+9Ux0GXc2uUUQ4/uHWtFb0BdoP2Ikpnqa3SlHI158X3BRrJ?=
 =?us-ascii?Q?x7200IaNY9P5b5CXhOvJj56BateJobmnKT+IxF6Nw5xVW5MRlr+RaO5ziz1m?=
 =?us-ascii?Q?onDlXM/rqWDu7Ixm1gwVsUjAhGEBd5Z7tKJ3eVZhFm6gGRkPV6c3YVT69oq7?=
 =?us-ascii?Q?GLXJ5RTLCm0KKDsBhwpIFMlz12KHHbgsIAKBhNQu+F5+Yacw0jYKxnQ4yp0t?=
 =?us-ascii?Q?NjMkVAcS6s8+rge63mYFN+iSUcsfKLwTFSLQgZB5I1uptKMzIc5aXC8/IcGb?=
 =?us-ascii?Q?DYl3wZdrCGFCqWQTio7vb5qOoQ+T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:05.2888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 651dd3f1-484e-409f-7b9d-08dc640fac09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Add domid to enable assigning the node to a running VMs.

Add expert mode option to share the overlay dtbo with domU. In this mode dom0
communicates with domid domain to share the overlay dtbo. This is done via
xenstore.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/xl/Makefile       |   2 +-
 tools/xl/xl_cmdtable.c  |   2 +-
 tools/xl/xl_vmcontrol.c | 343 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 342 insertions(+), 5 deletions(-)

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index d742e96a5b..122dfb9346 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -32,7 +32,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(LDLIBS_libxengnttab) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 62bdb2aeaa..2531e8517b 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -635,7 +635,7 @@ const struct cmd_spec cmd_table[] = {
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
       "Add/Remove a device tree overlay",
-      "add/remove <.dtbo>"
+      "add/remove <.dtbo> domain_id -e[expert_mode]",
       "-h print this help\n"
     },
 #endif
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 9674383ec3..2bf76dd389 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -16,6 +16,7 @@
 #include <inttypes.h>
 #include <limits.h>
 #include <stdlib.h>
+#include <sys/mman.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/utsname.h>
@@ -29,6 +30,8 @@
 #include "xl.h"
 #include "xl_utils.h"
 #include "xl_parse.h"
+#include <xenstore.h>
+#include <xengnttab.h>
 
 static int fd_lock = -1;
 
@@ -1266,6 +1269,335 @@ int main_create(int argc, char **argv)
 }
 
 #ifdef LIBXL_HAVE_DT_OVERLAY
+static int copy_overlay_to_domU(uint32_t domain_id, void *overlay_dt_domU,
+                                uint32_t overlay_dt_size, uint32_t *grant_ref,
+                                uint32_t num_pages)
+{
+    void *buffer = NULL;
+    xengnttab_handle *gnttab = xengnttab_open(NULL, 0);
+
+    if (!gnttab) {
+        fprintf(stderr,"opening gnttab failed for domain %d\n", domain_id);
+        return -1;
+    }
+
+    buffer = xengnttab_map_domain_grant_refs(gnttab, num_pages, domain_id,
+                                             grant_ref, PROT_READ|PROT_WRITE);
+
+    if (buffer == NULL) {
+        fprintf(stderr, "Getting the buffer failed for grant_refs\n");
+
+        return -1;
+    }
+
+    /* buffer is contiguous allocated. */
+    memcpy(buffer, overlay_dt_domU, overlay_dt_size);
+
+    xengnttab_unmap(gnttab, buffer, num_pages);
+
+    return 0;
+}
+
+static bool wait_for_status(struct xs_handle *xs, int fd, char *status_path,
+                            const char *status)
+{
+    unsigned int num_strings;
+    char *buf = NULL;
+    char **vec = NULL;
+    bool ret = false;
+    unsigned int len;
+    int rc = 0;
+    fd_set set;
+
+    while (1)
+    {
+        FD_ZERO(&set);
+        FD_SET(fd, &set);
+
+        rc = select(fd + 1, &set, NULL, NULL, NULL);
+        /* Poll for data: Blocking. */
+        if (rc <= 0)
+            break;
+
+        if (FD_ISSET(fd, &set)) {
+            /*
+             * num_strings will be set to the number of elements in vec
+             * (2 - the watched path and the overlay_watch)
+             */
+            vec = xs_read_watch(xs, &num_strings);
+            if (!vec) {
+                break;
+            }
+
+            /* do a read. */
+            buf = xs_read(xs, XBT_NULL, status_path, &len);
+            if (buf) {
+                if (!strcmp(buf, status)) {
+                    ret = true;
+                    break;
+                }
+            }
+        }
+    }
+
+    free(vec);
+    free(buf);
+
+    return ret;
+}
+
+static bool write_overlay_size(struct xs_handle *xs, uint32_t overlay_size,
+                               char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char ref[16];
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    snprintf(ref, sizeof(ref), "%u", overlay_size);
+    snprintf(buf, sizeof(buf), "%s/overlay-size", path);
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
+static bool write_status(struct xs_handle *xs, char *status, char *status_path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        return false;
+
+    if (!xs_write(xs, xs_trans, status_path, status, strlen(status)))
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
+static uint32_t *get_page_ref(struct xs_handle *xs, const char *xs_path,
+                              uint32_t num_pages)
+{
+    char buf[128];
+    uint32_t *ref = NULL;
+    char *data;
+    char temp[16] = { };
+    unsigned int len;
+    int i = 0;
+    int j = 0;
+    int start_ind = 0;
+
+    snprintf(buf, sizeof(buf), "%s/page-ref", xs_path);
+
+    /* do a read. */
+    data = xs_read(xs, XBT_NULL, buf, &len);
+
+    if (data) {
+        /* Caller will free this. */
+        ref = (uint32_t *)calloc(num_pages, sizeof(uint32_t));
+
+        for (i = 0; data[i] != '\0'; i++) {
+            if (data[i] == ',') {
+                /* Next page_ref data. */
+                memset(temp, '\0', sizeof(temp));
+
+                /* Copy the data between previous ',' to current. */
+                memcpy(temp, &data[start_ind], i - start_ind);
+
+                /* Convert to int. */
+                ref[j] = atoi(temp);
+                start_ind = i + 1;
+                j++;
+            }
+
+            if (j == num_pages)
+                break;
+        }
+    }
+
+    if (j != num_pages) {
+        fprintf(stderr, "Number of page_refs are not equal to num_pages\n");
+        free(ref);
+        ref = NULL;
+    }
+
+    free(data);
+    return ref;
+}
+
+static uint32_t get_num_pages(struct xs_handle *xs, const char *xs_path)
+{
+    char buf[128];
+    char *ref;
+    unsigned int len;
+    uint32_t num_pages = 0;
+
+    snprintf(buf, sizeof(buf), "%s/num-pages", xs_path);
+
+    /* do a read. */
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    if (ref)
+        num_pages = atoi(ref);
+
+    free(ref);
+
+    return num_pages;
+}
+
+static int share_overlay_with_domu(void *overlay_dt_domU, int overlay_dt_size,
+                                   int domain_id)
+{
+    struct xs_handle *xs = NULL;
+    char *path = NULL;
+    char receiver_status_path[64] = { };
+    char sender_status_path[64] = { };
+    int fd = 0;
+    int err;
+    uint32_t num_pages= 1;
+    uint32_t *page_ref = NULL;
+
+    /* XS_watch part. */
+    /* Open a connection to the xenstore. */
+    xs = xs_open(0);
+    if (xs == NULL) {
+        fprintf(stderr, "Deamon open for domain%d failed\n", domain_id);
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the local domain path */
+    path = xs_get_domain_path(xs, domain_id);
+    if (path == NULL) {
+        fprintf(stderr, "Getting domain%d path failed\n", domain_id);
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Make space for our node on the path */
+    path = realloc(path, strlen(path) + strlen("/data/overlay") + 1);
+    if (path == NULL) {
+        fprintf(stderr, "Path allocation failed\n");
+        err = ERROR_NOMEM;
+        goto out;
+    }
+
+    strcat(path, "/data/overlay");
+    strcpy(receiver_status_path, path);
+    strcat(receiver_status_path, "/receiver-status");
+
+    /*
+     * Watch a node for changes (poll on fd to detect).
+     * When the node (or any child) changes, fd will become readable.
+     */
+    err = xs_watch(xs, receiver_status_path, "overlay_watch");
+    if (!err) {
+        fprintf(stderr, "Creating watch failed\n");
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    /*
+     * We are notified of read availability on the watch via the
+     * file descriptor.
+     */
+    fd = xs_fileno(xs);
+
+    /* Wait for "waiting" status from other domain. */
+    if (!wait_for_status(xs, fd, receiver_status_path, "waiting")) {
+        err = ERROR_NOT_READY;
+        goto out;
+    }
+
+    /* Share the dtb size with domain. */
+    if (!write_overlay_size(xs, overlay_dt_size, path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing page ref failed\n");
+        goto out;
+    }
+
+    strcpy(sender_status_path, path);
+    strcat(sender_status_path, "/sender-status");
+
+    /* Write the status "ready". */
+    if (!write_status(xs, "ready", sender_status_path)) {
+        err = ERROR_FAIL;
+        fprintf(stderr,"Writing status ready failed\n");
+        goto out;
+    }
+
+    /* Wait for "page_ref" status from other domain. */
+    if (!wait_for_status(xs, fd, receiver_status_path, "page_ref")) {
+        err = ERROR_NOT_READY;
+        goto out;
+    }
+
+    num_pages = get_num_pages(xs, path);
+    if (num_pages == 0) {
+        fprintf(stderr, "no pages allocated\n");
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    page_ref = get_page_ref(xs, path, num_pages);
+    if (page_ref == NULL) {
+        fprintf(stderr,"page ref is null.\n");
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    if (copy_overlay_to_domU(domain_id, overlay_dt_domU, overlay_dt_size,
+                             page_ref, num_pages)) {
+        fprintf(stderr,"Copy overlay failed\n");
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Write the status "done". */
+    if (!write_status(xs, "done", sender_status_path)) {
+        fprintf(stderr,"Writing status DONE failed\n");
+        err = ERROR_FAIL;
+        goto out;
+    }
+
+/* Cleanup */
+out:
+    if (xs) {
+        close(fd);
+        xs_unwatch(xs, path, "overlay_watch");
+        xs_close(xs);
+    }
+
+    if (path)
+        free(path);
+
+    if (page_ref)
+        free(page_ref);
+
+    return err;
+}
+
 int main_dt_overlay(int argc, char **argv)
 {
     const char *overlay_ops = NULL;
@@ -1339,11 +1671,16 @@ int main_dt_overlay(int argc, char **argv)
     rc = libxl_dt_overlay(ctx, domain_id, overlay_dtb, overlay_dtb_size, op,
                           auto_mode, domain_mapping);
 
-    free(overlay_dtb);
-
-    if (rc)
+    if (rc) {
+        free(overlay_dtb);
         return EXIT_FAILURE;
+    }
+
+    if (domain_id && auto_mode && (op == LIBXL_DT_OVERLAY_ADD))
+        rc = share_overlay_with_domu(overlay_dtb, overlay_dtb_size,
+                                     domain_id);
 
+    free(overlay_dtb);
     return rc;
 }
 #endif
-- 
2.34.1


