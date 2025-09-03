Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487BB41BBF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 12:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108060.1458210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeo-0001yo-Q5; Wed, 03 Sep 2025 10:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108060.1458210; Wed, 03 Sep 2025 10:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeo-0001w6-MT; Wed, 03 Sep 2025 10:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1108060;
 Wed, 03 Sep 2025 10:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO1L=3O=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1utkem-0001Ah-Ua
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:24:00 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19e2120a-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:23:59 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 871E680C0822; Wed,  3 Sep 2025 15:53:57 +0530 (IST)
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
X-Inumbo-ID: 19e2120a-88b0-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 2/4] xentop: add pcpu implementation with proper error handling
Date: Wed,  3 Sep 2025 15:53:21 +0530
Message-Id: <20250903102323.2553142-3-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce pcpu.c which implements physical CPU statistics
collection using xc_getcpuinfo(). The code handles allocation
and reallocation of statistics buffers, maintains previous
idle times, and calculates usage percentages.

Proper error handling and cleanup are provided to ensure
robustness in the face of allocation or hypervisor API
failures.

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 tools/xentop/pcpu.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 tools/xentop/pcpu.c

diff --git a/tools/xentop/pcpu.c b/tools/xentop/pcpu.c
new file mode 100644
index 0000000000..cdb4cb2131
--- /dev/null
+++ b/tools/xentop/pcpu.c
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <sys/time.h>
+#include <xenctrl.h>
+#include "pcpu.h"
+
+#define MAX_PCPUS 128
+
+typedef struct {
+    float usage_pct;
+} pcpu_stat_t;
+
+static pcpu_stat_t *pcpu_stats = NULL;
+static uint64_t *prev_idle = NULL;
+static int allocated_pcpus = 0;
+static xc_interface *xc_handle = NULL;
+static uint64_t prev_global_time = 0;
+
+static void report_pcpu_error(const char *context)
+{
+    fprintf(stderr, "PCPU error: %s (%s)\n", context, strerror(errno));
+}
+
+int update_pcpu_stats(const struct timeval *now, unsigned int delay_sec)
+{
+    struct xen_sysctl_cpuinfo info[MAX_PCPUS];
+    int detected_cpus = 0;
+    int ret, i;
+    uint64_t current_time = (uint64_t)now->tv_sec * 1000000ULL + now->tv_usec;
+    uint64_t time_diff;
+
+    if (!xc_handle) {
+        xc_handle = xc_interface_open(NULL, NULL, 0);
+        if (!xc_handle) {
+            report_pcpu_error("xc_interface_open failed");
+            return -1;
+        }
+    }
+
+    ret = xc_getcpuinfo(xc_handle, MAX_PCPUS, info, &detected_cpus);
+    if (ret < 0) {
+        report_pcpu_error("xc_getcpuinfo failed");
+        return -1;
+    }
+
+    /* Allocate/reallocate memory if needed */
+    if (!pcpu_stats || detected_cpus > allocated_pcpus) {
+        pcpu_stat_t *new_stats = realloc(pcpu_stats,
+                        detected_cpus * sizeof(*pcpu_stats));
+        if (!new_stats) goto alloc_error;
+
+        pcpu_stats = new_stats;
+
+        uint64_t *new_prev_idle = realloc(prev_idle,
+                        detected_cpus * sizeof(*prev_idle));
+        if (!new_prev_idle) goto alloc_error;
+
+        prev_idle = new_prev_idle;
+        allocated_pcpus = detected_cpus;
+
+        /* Initialize new entries */
+        for (i = 0; i < detected_cpus; i++) {
+            prev_idle[i] = info[i].idletime / 1000; /* ns->us */
+            pcpu_stats[i].usage_pct = 0.0;
+        }
+
+        /* Set initial global time reference */
+        prev_global_time = current_time;
+        return 0;
+    }
+
+    /* Calculate time difference since last update */
+    time_diff = current_time - prev_global_time;
+
+    /* Calculate CPU usage for each core */
+    for (i = 0; i < detected_cpus; i++) {
+        uint64_t current_idle = info[i].idletime / 1000;
+        uint64_t idle_diff = current_idle - prev_idle[i];
+
+        if (time_diff > 0) {
+            double usage = 100.0 * (1.0 - ((double)idle_diff / time_diff));
+            /* Clamp between 0-100% */
+            pcpu_stats[i].usage_pct = (usage < 0) ? 0.0 :
+                                     (usage > 100) ? 100.0 : usage;
+        } else {
+            pcpu_stats[i].usage_pct = 0.0;
+        }
+
+        prev_idle[i] = current_idle;
+    }
+
+    /* Update global time reference for next calculation */
+    prev_global_time = current_time;
+
+    return 0;
+
+alloc_error:
+    free_pcpu_stats();
+    errno = ENOMEM;
+    report_pcpu_error("memory allocation failed");
+    return -1;
+}
+
+/* Accessor functions for xentop.c */
+int get_pcpu_count(void)
+{
+    return allocated_pcpus;
+}
+
+float get_pcpu_usage(int cpu_index)
+{
+    if (!pcpu_stats || cpu_index < 0 || cpu_index >= allocated_pcpus) {
+        return 0.0;
+    }
+    return pcpu_stats[cpu_index].usage_pct;
+}
+
+int has_pcpu_data(void)
+{
+    return (pcpu_stats != NULL && allocated_pcpus > 0);
+}
+
+void free_pcpu_stats(void)
+{
+    if (xc_handle) {
+        xc_interface_close(xc_handle);
+        xc_handle = NULL;
+    }
+    free(pcpu_stats);
+    pcpu_stats = NULL;
+    free(prev_idle);
+    prev_idle = NULL;
+    allocated_pcpus = 0;
+}
-- 
2.34.1


