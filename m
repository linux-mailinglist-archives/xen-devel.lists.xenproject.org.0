Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC328AFFF2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711059.1110758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY8-0001vI-VY; Wed, 24 Apr 2024 03:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711059.1110758; Wed, 24 Apr 2024 03:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTY8-0001qw-Pb; Wed, 24 Apr 2024 03:44:00 +0000
Received: by outflank-mailman (input) for mailman id 711059;
 Wed, 24 Apr 2024 03:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQe-0003iy-1c
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cce739cd-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:15 +0200 (CEST)
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by PH7PR12MB6492.namprd12.prod.outlook.com (2603:10b6:510:1f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:36:10 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::33) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:36:06 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:05 -0500
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
X-Inumbo-ID: cce739cd-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Y8Do8PJ0gFHTwaKOnk631MUVzOH5f7+coDhnlY/oqNY0Ei/9dEVuyVi3unJ72yXGtB1cO/9VfbIOo1YP/EZAD99LN8VCZz9buxPtDCbjLM4QorILWbpTeb9uA8giZxf/PmgZL9n7vMLFGqFCuc2eNU8ApkKc79vgmtctoPMEyzNoDg1gVY5hyk065gI7AgeBPgW7v96llRQkK9aXnBJGi6SqxYheZZrzrqq1tX2kdnJQMB2Yu5wTrEn8hfOIKYtByHea96ifrpmSrf3rXHHsr4gJECLTPbSPOPdV7Zf/TimiwJZqmPnFxxAofXCllYdHdHY+/UDI5pC6cLJTbAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGHzXleFvzlwnXmUM43m2CIMguyeDmKkEqOTHA8C5K0=;
 b=Z8x+RI/6hyZDgv1zoU/Jkbcm+3BctGJNn5fsfbpfp0RAczxS6omKECunZR6jfvEXExFEdoYkDv/JV5Fb8zB+022yVvlK4KSWWVhagbAhjI4LbApIXVyE4zo+zuLpE9iwDkrs4+Qkxl5ACojFikbFeyyUI3tWH3Ed9oXdQ3M/Ip0exf5enLDpEACmlgfeHvh0E0CZZEmppVOi6knFyogGgpe+m8MNnyqIQ2qgcjnAxPZOwYaY5TEDWbiUyIeFIEy5H4mHltrbJN01P9o8ryZL9tm+3LwkozAY4K8hsjAiYJemYt46fMKMhQ6asvnqA9qyKVFchtv2/dJ24jR40zqIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGHzXleFvzlwnXmUM43m2CIMguyeDmKkEqOTHA8C5K0=;
 b=27/mfB22zp2YcUf41E90IeUhIAyNZ2Rap5RnuvZIdVyWA5OY+VCTtgBdA+oVvydZjwWXBp9MAmm11ChgD5wLtCOLzD1/XNhX03zGkpyyh6y2ZJRW2atn5gOn74X7HGfOGV1t87T4F2He8IqWScIGK5SqZ41gKf5ECOEyUACC4E8=
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
Subject: [PATCH 11/15] tools/helpers: Add get_overlay
Date: Wed, 24 Apr 2024 11:34:45 +0800
Message-ID: <20240424033449.168398-12-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|PH7PR12MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: fbce0043-a436-4641-53cf-08dc640fae9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400014|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/h1q+75M1kl1T8hCqlGvm+4UyBWUPEj3XbKLJWRKrFVcBujWIAWwvAsi/xY?=
 =?us-ascii?Q?0SeqQYDNNLLCMy406lk2QGhVRfPPe2LGm9teeE2hNaYoOnZlYA0lBcw7YfIL?=
 =?us-ascii?Q?04BIO31VkIwGNttD23qvcmABd9IlrMzrMknGvQ+lLsel1744PnbRT7CVhmTE?=
 =?us-ascii?Q?4exLbjHtXnmx/nl/jAmktl6k5qIvONL4R0PLp08cO+KsB++XYj2Ea7MeI7ly?=
 =?us-ascii?Q?KKaHYpOUwYpUa+hitPATDsoHP44ipj3UxveOroFvtGOkOonvtuNJ/tN2gJi8?=
 =?us-ascii?Q?xeT/AvEBc113Nuj5A8f1HXnL+uz4htJEU7uKuXbXV5AxOiDK4h/0rJ5yCJgO?=
 =?us-ascii?Q?mLMNFXzWtkqDT9GM7XVoeIRfJTXdT99eJQnTog5dq15OGN92g5xd9z4qzvnZ?=
 =?us-ascii?Q?csYk8+04bHMHmIlAZIqFHzRDNJSJ3mMwh4HHRxdwml28Y+vHunC7YW1M9gIo?=
 =?us-ascii?Q?EXDcUaeYBLmQ7Syd6Jkjz+2+uOjQOYciLsG7YVdhB01tobbl6Xjxwee6TJVu?=
 =?us-ascii?Q?aXeGtg6anH0d+GwTMK2uKkjyZfDfsy4+P1OQcDjAUupyJY6m+jyrdkt36Y0G?=
 =?us-ascii?Q?Jlw1UYaeuJZIcKcK3AstB4XebOBm8Tvgt1cdLdiUNRne9+loFzycDhtH6MzZ?=
 =?us-ascii?Q?XTG+JOVXXd+nlZv3aoXQt3bUVR6HXz5abUx4phirIaIHDklpEyIPqxw/IvMh?=
 =?us-ascii?Q?NqxXfVBPy3cQ4QJKWW5onlbN0N+BNcDCDCkRMDViYtC5y1sTnoqrFIIS8l+E?=
 =?us-ascii?Q?nG1oWRnVrPdNKgQGQ5ERSA/X4BenYWdlJ58yQNldAoe44xYp2gyDp7O0MYUg?=
 =?us-ascii?Q?ZPxZMF7W+oHmijF/mIEd2AyhV0BznPjZaYkcpHuxvB+NKc2YvDbZEe3O+oWx?=
 =?us-ascii?Q?BFS/QNWswFD5x9wDfcxNalQ6JJaGUZpBLmleZgkHVMnNv7phM0xL+MThJLla?=
 =?us-ascii?Q?I25Kd3An77odv4eRh4uu3G1ITHXTG7KqFiLzq7MxZRPKL6P4UJ72S/VyZ5kG?=
 =?us-ascii?Q?nDNH+DWpghTEhu1GdWgGIpj49Idu2EMU7HpU7u01ZD4Hhtzjnhb5ZvjvCB1+?=
 =?us-ascii?Q?b85OWBEFipqHu4810mv1x72N/6C4oYGrDPqHAlvYaQFPvdu6CHW8pF5ExyUO?=
 =?us-ascii?Q?bTueSve+gliJ5XdDEMY6W4s4v8mWilqIuPkt2yowFCeo/6Dx5OaKzj4u7BrV?=
 =?us-ascii?Q?G0a6jd62ZQG61yIueOiux7xesu/hoHQRnkBO1xgJOdZazKnTrUHEFg1ttwQO?=
 =?us-ascii?Q?bq0APEv8UBfsouzPaLAAtOxVaaNJY7uszZesQZWH8Zfn2iaaWx75ZxiuOAUL?=
 =?us-ascii?Q?ABupNZWifq9nvFxgL0lvJoSw9YNJS64LazxW3T9fpZdjkbYtoTrBeWp3HTWl?=
 =?us-ascii?Q?BpUIdPw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:09.5935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbce0043-a436-4641-53cf-08dc640fae9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6492

From: Vikram Garhwal <fnu.vikram@xilinx.com>

This user level application copies the overlay dtbo shared by dom0 while doing
overlay node assignment operation. It uses xenstore to communicate with dom0.
More information on the protocol is writtien in docs/misc/overlay.txt file.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/helpers/Makefile      |   8 +
 tools/helpers/get_overlay.c | 393 ++++++++++++++++++++++++++++++++++++
 2 files changed, 401 insertions(+)
 create mode 100644 tools/helpers/get_overlay.c

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 09590eb5b6..dfe17ef269 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -12,6 +12,7 @@ TARGETS += init-xenstore-domain
 endif
 ifeq ($(CONFIG_ARM),y)
 TARGETS += init-dom0less
+TARGETS += get_overlay
 endif
 endif
 
@@ -39,6 +40,9 @@ $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
 init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
 
+SHARE_OVERLAY_OBJS = get_overlay.o
+$(SHARE_OVERLAY_OBJS): CFLAGS += $(CFLAGS_libxengnttab) $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl)
+
 .PHONY: all
 all: $(TARGETS)
 
@@ -51,6 +55,10 @@ init-xenstore-domain: $(INIT_XENSTORE_DOMAIN_OBJS)
 init-dom0less: $(INIT_DOM0LESS_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(INIT_DOM0LESS_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
+get_overlay: $(SHARE_OVERLAY_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
+
+
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
diff --git a/tools/helpers/get_overlay.c b/tools/helpers/get_overlay.c
new file mode 100644
index 0000000000..ca3007570e
--- /dev/null
+++ b/tools/helpers/get_overlay.c
@@ -0,0 +1,393 @@
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <limits.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <xenstore.h>
+#include <libxenvchan.h>
+#include <xengnttab.h>
+
+#define PAGE_SIZE 4096
+
+static int xs_create_overlay_node(int domain, const char *xs_base,
+                                  struct xs_handle *xs)
+{
+    int ret = -1;
+    struct xs_permissions perms[2];
+    char buf[64];
+    char ref[16];
+    char *domid_str = NULL;
+    int overlay_size = 0;
+
+    xs_transaction_t xs_trans = XBT_NULL;
+
+    domid_str = xs_read(xs, XBT_NULL, "domid", NULL);
+
+    if (!domid_str)
+        return ret;
+
+    /* owner domain is us */
+    perms[0].id = atoi(domid_str);
+    /* permissions for domains not listed = none. */
+    perms[0].perms = XS_PERM_NONE;
+    /* other domains i.e. domain provided by user gets r/w permissions. */
+    perms[1].id = domain;
+    perms[1].perms =  XS_PERM_READ | XS_PERM_WRITE;
+
+retry_transaction:
+
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        goto fail_xs_transaction;
+
+    /* Create overlay-size node. */
+    snprintf(ref, sizeof(ref), "%d", overlay_size);
+    snprintf(buf, sizeof(buf), "%s/overlay-size", xs_base);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    /* Create domU status node. */
+    snprintf(ref, sizeof(ref), "%s", "waiting");
+    snprintf(buf, sizeof(buf), "%s/receiver-status", xs_base);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    /* Create dom0 status node. */
+    snprintf(ref, sizeof(ref), "%s", "not_ready");
+    snprintf(buf, sizeof(buf), "%s/sender-status", xs_base);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto fail_xs_transaction;
+    if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
+        goto fail_xs_transaction;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            goto fail_xs_transaction;
+    } else
+        ret = 0;
+
+fail_xs_transaction:
+    free(domid_str);
+
+    return ret;
+}
+
+static int get_overlay_size(struct xs_handle *xs, int domain,
+                            const char *xs_path)
+{
+    char buf[128];
+    char *ref;
+    unsigned int len;
+    int dt_size = 0;
+
+    snprintf(buf, sizeof(buf), "%s/overlay-size", xs_path);
+
+    ref = xs_read(xs, XBT_NULL, buf, &len);
+
+    if (!ref)
+        return dt_size;
+
+    dt_size = atoi(ref);
+
+    free(ref);
+
+    return dt_size;
+}
+
+static uint32_t get_num_pages(int dtbo_size)
+{
+    int num_pages = 1;
+
+    while (dtbo_size > PAGE_SIZE) {
+        dtbo_size = dtbo_size - PAGE_SIZE;
+        num_pages++;
+    }
+
+    return num_pages;
+}
+
+static void *create_shared_buffer(int domain, uint32_t *refs, uint32_t pages,
+                                  xengntshr_handle *gntshr)
+{
+    return xengntshr_share_pages(gntshr, domain, pages, refs, 1);
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
+static bool write_page_ref(struct xs_handle *xs, uint32_t *page_ref,
+                           uint32_t num_pages, char *path)
+{
+    xs_transaction_t xs_trans = XBT_NULL;
+    char buf[128];
+    char *ref = NULL;
+    char tmp[16];
+    int i = 0;
+    bool rc = false;
+
+    /* Caller will free this. */
+    ref = (char *)calloc(num_pages * 16, sizeof(char)); /* For each number. */
+    if (ref == NULL) {
+        fprintf(stderr, "Memory calloc for ref failed\n");
+        return rc;
+    }
+
+retry_transaction:
+    xs_trans = xs_transaction_start(xs);
+    if (!xs_trans)
+        goto out;
+
+    for (i = 0; i < num_pages; i++) {
+        snprintf(tmp, sizeof(tmp), "%d,", page_ref[i]);
+        strcat(ref, tmp);
+    }
+
+    snprintf(buf, sizeof(buf), "%s/page-ref", path);
+
+    if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
+        goto out;
+
+    snprintf(buf, sizeof(buf), "%s/num-pages", path);
+    snprintf(tmp, sizeof(tmp), "%u", num_pages);
+    if (!xs_write(xs, xs_trans, buf, tmp, strlen(tmp)))
+        goto out;
+
+    if (!xs_transaction_end(xs, xs_trans, 0)) {
+        if (errno == EAGAIN)
+            goto retry_transaction;
+        else
+            goto out;
+    }
+
+    rc = true;
+
+out:
+    if (ref)
+        free(ref);
+
+    return rc;
+}
+
+static bool write_status(struct xs_handle *xs, const char *status,
+                         const char *status_path)
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
+int main(int argc, char **argv)
+{
+    void *buffer = NULL;
+    int domain ;
+    uint32_t *page_refs = NULL;
+    FILE *fptr;
+    int dtbo_size = 0;
+    const char *path = "data/overlay";
+    char receiver_status_path[64] = { };
+    char sender_status_path[64] = { };
+    struct xs_handle *xs = NULL;
+    int rc = 0;
+    int fd = 0;
+    uint32_t num_pages = 0;
+    xengntshr_handle *gntshr;
+
+    if (argc < 2) {
+       fprintf(stderr,"Please enter domain_id.\n");
+        return 0;
+    }
+
+    domain = atoi(argv[1]);
+
+    xs = xs_open(0);
+    if (xs == NULL) {
+        fprintf(stderr, "Xenstore open for domain%d failed\n", domain);
+        goto out;
+    }
+
+    rc = xs_create_overlay_node(domain, path, xs);
+    if (rc) {
+        fprintf(stderr,"Creating overlay nodes failed\n");
+        goto out;
+    }
+
+    strcpy(receiver_status_path, path);
+    strcat(receiver_status_path, "/receiver-status");
+
+    strcpy(sender_status_path, path);
+    strcat(sender_status_path, "/sender-status");
+
+    /*
+     * Watch a node for changes (poll on fd to detect).
+     * When the node changes, fd will become readable.
+     */
+    rc = xs_watch(xs, sender_status_path, "overlay_watch");
+    if (rc == 0) {
+        fprintf(stderr, "Creating watch failed\n");
+        goto out;
+    }
+
+    /* We are notified of read availability on the watch via the
+     * file descriptor.
+     */
+    fd = xs_fileno(xs);
+
+    /* Wait for ready. */
+    if (!wait_for_status(xs, fd, sender_status_path, "ready")) {
+        fprintf(stderr, "dom0 not ready.\n");
+        goto out;
+    }
+
+    dtbo_size = get_overlay_size(xs, domain, path);
+    if (dtbo_size == 0) {
+        fprintf(stderr,"Overlay data size is zero. Exiting the application\n");
+        goto out;
+    }
+
+    gntshr = xengntshr_open(NULL, 0);
+    if (!gntshr) {
+        fprintf(stderr,"Error in opening gntshr\n");
+        goto out;
+    }
+
+    num_pages = get_num_pages(dtbo_size);
+
+    page_refs =(uint32_t *)malloc(num_pages * sizeof(int));
+    if (page_refs == NULL) {
+        fprintf(stderr, "Allocating page_ref array failed\n");
+        goto out;
+    }
+
+    /* Allocate memory for data size and share with domain. */
+    buffer = create_shared_buffer(domain, page_refs, num_pages,
+                                  gntshr);
+    if (buffer == NULL) {
+        fprintf(stderr,"Buffer allocation failed\n");
+        goto out;
+    }
+
+    /* Created the buffer and got page_ref. Share the page_ref with domain. */
+    if (!write_page_ref(xs, page_refs, num_pages, path)) {
+        fprintf(stderr,"Writing page ref failed\n");
+        goto out;
+    }
+
+    /* Write the status "page_ref". */
+    if (!write_status(xs, "page_ref", receiver_status_path)) {
+        fprintf(stderr,"Writing status DONE failed\n");
+        goto out;
+    }
+
+    /* Wait for done. This means other domain done copying the dtb to buffer. */
+    if (!wait_for_status(xs, fd, sender_status_path, "done")) {
+        fprintf(stderr, "dom0 status not done\n");
+        goto out;
+    }
+
+    if ((fptr = fopen("overlay.dtbo","wb")) == NULL) {
+        fprintf(stderr,"Error! opening file");
+        goto out;
+    }
+
+    printf("Writing to file overlay.dtbo.\n");
+
+    fwrite(buffer, dtbo_size, 1, fptr);
+
+    printf("Done writing to file overlay.dtbo \n");
+
+out:
+    if (fptr)
+        fclose(fptr);
+
+    if (page_refs)
+        free(page_refs);
+
+    if (xs) {
+        close(fd);
+
+        xs_unwatch(xs, path, "overlay_watch");
+
+        xs_close(xs);
+    }
+
+    if (buffer)
+        xengntshr_unshare(gntshr, buffer, num_pages);
+
+    if (gntshr)
+         xengntshr_close(gntshr);
+
+    return 0;
+}
-- 
2.34.1


