Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BE6B1A2C2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069354.1433219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiutz-0005Ri-5w; Mon, 04 Aug 2025 13:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069354.1433219; Mon, 04 Aug 2025 13:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiutz-0005P9-2z; Mon, 04 Aug 2025 13:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1069354;
 Mon, 04 Aug 2025 13:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vAb3=2Q=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uiutx-0005P3-Hr
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:06:53 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e180481f-7133-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 15:06:50 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 6AF1380C0979; Mon,  4 Aug 2025 18:36:46 +0530 (IST)
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
X-Inumbo-ID: e180481f-7133-11f0-a321-13f23c93f187
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH v3] tools/xentop: Add physical CPU statistics support
Date: Mon,  4 Aug 2025 18:36:43 +0530
Message-Id: <20250804130643.1046157-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new '-p/--pcpus' flag to display physical CPU utilization metrics
using xc_interface. This provides hypervisor-level CPU usage insights alongside
existing domain statistics. This helps correlate VM resource usage with host CPU
load patterns.

Changes:
- Add pcpu.c/pcpu.h for PCPU stat collection logic
- Link against libxenctrl for xc_handle access
- Extend CLI with '-p' flag and output formatting
- Forward declare xenstat_handle to access xc_handle
- Include cleanup for PCPU resources in exit handler

Example usage:
  xentop -p  # Shows physical CPU stats
  xentop -bp # Batch mode
  xentop -d 1 -p # With different delays

Example output with '-p':
  NAME      STATE   CPU(%)  MEM(%)  VCPUS ...
  Domain-0  -----r    17.0     6.3      8
  DomD      -----r   767.0    38.1      8

  Physical CPU Usage:
  ┌───────┬────────┐
  │ Core  │ Usage  │
  ├───────┼────────┤
  │ 0     │  98.1% │
  │ ...   │  ...   │
  │ 7     │  97.3% │
  └───────┴────────┘

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 tools/xentop/Makefile |   5 +-
 tools/xentop/pcpu.c   | 152 ++++++++++++++++++++++++++++++++++++++++++
 tools/xentop/pcpu.h   |  15 +++++
 tools/xentop/xentop.c |  57 ++++++++++------
 4 files changed, 207 insertions(+), 22 deletions(-)
 create mode 100644 tools/xentop/pcpu.c
 create mode 100644 tools/xentop/pcpu.h

diff --git a/tools/xentop/Makefile b/tools/xentop/Makefile
index 70cc2211c5..f514a6f7a8 100644
--- a/tools/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -15,6 +15,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 CFLAGS += -DGCC_PRINTF $(CFLAGS_libxenstat)
 LDLIBS += $(LDLIBS_libxenstat) $(CURSES_LIBS) $(TINFO_LIBS) $(SOCKET_LIBS) -lm
+LDLIBS += $(LDLIBS_libxenctrl)
 CFLAGS += -DHOST_$(XEN_OS)
 
 # Include configure output (config.h)
@@ -25,8 +26,8 @@ TARGETS := xentop
 .PHONY: all
 all: $(TARGETS)
 
-xentop: xentop.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS) $(APPEND_LDFLAGS)
+xentop: xentop.o pcpu.o
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
diff --git a/tools/xentop/pcpu.c b/tools/xentop/pcpu.c
new file mode 100644
index 0000000000..53d6b9c30c
--- /dev/null
+++ b/tools/xentop/pcpu.c
@@ -0,0 +1,152 @@
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
+static uint64_t *prev_time = NULL;
+static int allocated_pcpus = 0;
+static xc_interface *xc_handle = NULL;
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
+        uint64_t *new_prev_idle = realloc(prev_idle,
+                        detected_cpus * sizeof(*prev_idle));
+        if (!new_prev_idle) {
+            free(new_stats);
+            goto alloc_error;
+        }
+
+        uint64_t *new_prev_time = realloc(prev_time,
+                        detected_cpus * sizeof(*prev_time));
+        if (!new_prev_time) {
+            free(new_stats);
+            free(new_prev_idle);
+            goto alloc_error;
+        }
+
+        pcpu_stats = new_stats;
+        prev_idle = new_prev_idle;
+        prev_time = new_prev_time;
+        allocated_pcpus = detected_cpus;
+
+        /* Initialize new entries */
+        for (i = 0; i < detected_cpus; i++) {
+            prev_idle[i] = info[i].idletime / 1000; /* ns->us */
+            prev_time[i] = current_time;
+            pcpu_stats[i].usage_pct = 0.0;
+        }
+        return 0;
+    }
+
+    /* Calculate CPU usage with delay normalization */
+    for (i = 0; i < detected_cpus; i++) {
+        uint64_t current_idle = info[i].idletime / 1000;
+        uint64_t idle_diff = current_idle - prev_idle[i];
+        uint64_t time_diff = current_time - prev_time[i];
+
+        /* Use configured delay when actual interval is too small */
+        if (time_diff < 100000) {
+            time_diff = delay_sec * 1000000ULL;
+        }
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
+        prev_time[i] = current_time;
+    }
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
+void print_pcpu_stats(void)
+{
+    if (!pcpu_stats || allocated_pcpus == 0) {
+        printf("\r\nNo PCPU data available\r\n");
+        return;
+    }
+
+    printf("\r\nPhysical CPU Usage:\r\n");
+    printf("+-------+--------+\r\n");
+    printf("| Core  | Usage  |\r\n");
+    printf("+-------+--------+\r\n");
+
+    for (int i = 0; i < allocated_pcpus; i++) {
+        printf("| %-5d | %5.1f%% |\r\n", i, pcpu_stats[i].usage_pct);
+    }
+
+    printf("+-------+--------+\r\n");
+}
+
+void free_pcpu_stats(void)
+{
+    if (xc_handle) {
+        xc_interface_close(xc_handle);
+        xc_handle = NULL;
+    }
+    free(pcpu_stats);
+    free(prev_idle);
+    free(prev_time);
+    pcpu_stats = NULL;
+    prev_idle = NULL;
+    prev_time = NULL;
+    allocated_pcpus = 0;
+}
diff --git a/tools/xentop/pcpu.h b/tools/xentop/pcpu.h
new file mode 100644
index 0000000000..2ce86292a6
--- /dev/null
+++ b/tools/xentop/pcpu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __XENTOP_PCPU_H__
+#define __XENTOP_PCPU_H__
+
+#include <sys/time.h>
+
+int update_pcpu_stats(const struct timeval *now, unsigned int delay);
+void print_pcpu_stats(void);
+void free_pcpu_stats(void);
+
+#endif /* __XENTOP_PCPU_H__ */
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index f5d6c19cf9..dcf2f69b59 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -37,6 +37,7 @@
 #endif
 
 #include <xenstat.h>
+#include "pcpu.h"
 
 #define XENTOP_VERSION "1.0"
 
@@ -205,6 +206,7 @@ field_id sort_field = FIELD_DOMID;
 unsigned int first_domain_index = 0;
 unsigned int delay = 3;
 unsigned int batch = 0;
+static unsigned int show_pcpus = 0;
 unsigned int loop = 1;
 unsigned int iterations = 0;
 int show_vcpus = 0;
@@ -230,22 +232,23 @@ static WINDOW *cwin;
 /* Print usage message, using given program name */
 static void usage(const char *program)
 {
-	printf("Usage: %s [OPTION]\n"
-	       "Displays ongoing information about xen vm resources \n\n"
-	       "-h, --help           display this help and exit\n"
-	       "-V, --version        output version information and exit\n"
-	       "-d, --delay=SECONDS  seconds between updates (default 3)\n"
-	       "-n, --networks       output vif network data\n"
-	       "-x, --vbds           output vbd block device data\n"
-	       "-r, --repeat-header  repeat table header before each domain\n"
-	       "-v, --vcpus          output vcpu data\n"
-	       "-b, --batch	     output in batch mode, no user input accepted\n"
-	       "-i, --iterations     number of iterations before exiting\n"
-	       "-f, --full-name      output the full domain name (not truncated)\n"
-	       "-z, --dom0-first     display dom0 first (ignore sorting)\n"
-	       "\n" XENTOP_BUGSTO,
-	       program);
-	return;
+    printf("Usage: %s [OPTION]\n"
+           "Displays ongoing information about xen vm resources \n\n"
+           "-h, --help           display this help and exit\n"
+           "-V, --version        output version information and exit\n"
+           "-d, --delay=SECONDS  seconds between updates (default 3)\n"
+           "-n, --networks       output vif network data\n"
+           "-x, --vbds           output vbd block device data\n"
+           "-r, --repeat-header  repeat table header before each domain\n"
+           "-v, --vcpus          output vcpu data\n"
+           "-b, --batch          output in batch mode, no user input accepted\n"
+           "-p, --pcpus          show physical CPU stats\n"
+           "-i, --iterations     number of iterations before exiting\n"
+           "-f, --full-name      output the full domain name (not truncated)\n"
+           "-z, --dom0-first     display dom0 first (ignore sorting)\n"
+           "\n" XENTOP_BUGSTO,
+           program);
+    return;
 }
 
 /* Print program version information */
@@ -267,6 +270,8 @@ static void cleanup(void)
 		xenstat_free_node(cur_node);
 	if(xhandle != NULL)
 		xenstat_uninit(xhandle);
+
+	free_pcpu_stats();
 }
 
 /* Display the given message and gracefully exit */
@@ -1189,7 +1194,7 @@ static void top(void)
 		fail("Failed to retrieve statistics from libxenstat\n");
 
 	/* dump summary top information */
-	if (!batch)
+	if (!batch && !show_pcpus)
 		do_summary();
 
 	/* Count the number of domains for which to report data */
@@ -1245,9 +1250,17 @@ static void top(void)
 			do_vbd(domains[i]);
 	}
 
-	if (!batch)
+	if (!batch && !show_pcpus)
 		do_bottom_line();
 
+    if (show_pcpus) {
+        if (update_pcpu_stats(&curtime, delay) == 0) {
+            print_pcpu_stats();
+        } else {
+            fail("Error getting PCPU stats\n");
+        }
+    }
+
 	free(domains);
 }
 
@@ -1271,13 +1284,14 @@ int main(int argc, char **argv)
 		{ "repeat-header", no_argument,       NULL, 'r' },
 		{ "vcpus",         no_argument,       NULL, 'v' },
 		{ "delay",         required_argument, NULL, 'd' },
-		{ "batch",	   no_argument,	      NULL, 'b' },
+		{ "batch",         no_argument,	      NULL, 'b' },
+		{ "pcpus",         no_argument,       NULL, 'p' },
 		{ "iterations",	   required_argument, NULL, 'i' },
 		{ "full-name",     no_argument,       NULL, 'f' },
 		{ "dom0-first",    no_argument,       NULL, 'z' },
 		{ 0, 0, 0, 0 },
 	};
-	const char *sopts = "hVnxrvd:bi:fz";
+	const char *sopts = "hVnxrvd:bpi:fz";
 
 	if (atexit(cleanup) != 0)
 		fail("Failed to install cleanup handler.\n");
@@ -1312,6 +1326,9 @@ int main(int argc, char **argv)
 		case 'b':
 			batch = 1;
 			break;
+		case 'p':
+			show_pcpus = 1;
+			break;
 		case 'i':
 			iterations = atoi(optarg);
 			loop = 0;
-- 
2.34.1


