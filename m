Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FF2AFE291
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037860.1410358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQA9-0007U0-1l; Wed, 09 Jul 2025 08:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037860.1410358; Wed, 09 Jul 2025 08:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQA8-0007SV-Uk; Wed, 09 Jul 2025 08:28:20 +0000
Received: by outflank-mailman (input) for mailman id 1037860;
 Wed, 09 Jul 2025 08:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZIj=ZW=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uZQA6-0007R5-MR
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:28:18 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8601c29-5c9e-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:28:16 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id B5D8880C0A5B; Wed,  9 Jul 2025 13:58:12 +0530 (IST)
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
X-Inumbo-ID: a8601c29-5c9e-11f0-a317-13f23c93f187
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH v2] tools/xentop: Add physical CPU statistics support
Date: Wed,  9 Jul 2025 13:58:10 +0530
Message-Id: <20250709082810.3052544-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new '-p/--pcpus' flag to display physical CPU utilization metrics
using xc_interface. This provides hypervisor-level CPU usage insights alongside
existing domain statistics.This helps correlate VM resource usage with host CPU
load patterns.

Changes:
- Add pcpu.c/pcpu.h for PCPU stat collection logic
- Link against libxenctrl for xc_handle access
- Extend CLI with '-p' flag and output formatting
- Forward declare xenstat_handle to access xc_handle
- Include cleanup for PCPU resources in exit handler

Review Addressed:
- Removed redundant Makefile changes
- Fixed help text alignment (-b/--batch and -p/--pcpus)
- Corrected indentation in stats display block

Example usage:
  xentop -p  # Shows physical CPU stats
  xentop -bp # Batch mode

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
 tools/xentop/pcpu.c   | 116 ++++++++++++++++++++++++++++++++++++++++++
 tools/xentop/pcpu.h   |  18 +++++++
 tools/xentop/xentop.c |  63 +++++++++++++++--------
 4 files changed, 180 insertions(+), 22 deletions(-)
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
index 0000000000..6b0f2a8d3c
--- /dev/null
+++ b/tools/xentop/pcpu.c
@@ -0,0 +1,116 @@
+#include "pcpu.h"
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/time.h>
+
+#define MAX_PCPUS 128
+
+// Convert Xen's idle time (nanoseconds) to microseconds to match gettimeofday()
+#define XEN_IDLETIME_TO_USEC(idle) ((idle) / 1000)
+
+// File-scope variables (static for module privacy)
+static pcpu_stat_t *pcpu_stats = NULL;
+static int num_pcpus = 0;
+static uint64_t *prev_idle = NULL;
+static uint64_t *prev_total = NULL;
+
+int update_pcpu_stats(xc_interface *xch)
+{
+    struct xen_sysctl_cpuinfo info[MAX_PCPUS];
+    struct timeval now;
+    int nr_cpus = 0;
+    int i;
+
+    if (!xch || xc_getcpuinfo(xch, MAX_PCPUS, info, &nr_cpus) < 0) {
+        return -1;
+    }
+
+    gettimeofday(&now, NULL);
+    uint64_t current_total = (uint64_t)now.tv_sec * 1000000 + now.tv_usec;
+
+    /* Allocate memory if needed */
+    if (!pcpu_stats || nr_cpus > num_pcpus) {
+        pcpu_stat_t *new_stats = realloc(pcpu_stats, nr_cpus * sizeof(pcpu_stat_t));
+        uint64_t *new_prev_idle = realloc(prev_idle, nr_cpus * sizeof(uint64_t));
+        uint64_t *new_prev_total = realloc(prev_total, nr_cpus * sizeof(uint64_t));
+
+        if (!new_stats || !new_prev_idle || !new_prev_total) {
+            free(new_stats);
+            free(new_prev_idle);
+            free(new_prev_total);
+            return -1;
+        }
+
+        pcpu_stats = new_stats;
+        prev_idle = new_prev_idle;
+        prev_total = new_prev_total;
+        num_pcpus = nr_cpus;
+
+        /* Initialize previous values (skip first calculation) */
+        for (i = 0; i < nr_cpus; i++) {
+            prev_idle[i] = XEN_IDLETIME_TO_USEC(info[i].idletime);
+            prev_total[i] = current_total;
+            pcpu_stats[i].pcpu_id = i;
+            /* Default to 0% on first run */
+            pcpu_stats[i].usage_pct = 0.0;
+        }
+        return 0;
+    }
+
+    /* Calculate CPU usage */
+    for (i = 0; i < nr_cpus; i++) {
+        uint64_t current_idle = XEN_IDLETIME_TO_USEC(info[i].idletime);
+        uint64_t idle_diff = current_idle - prev_idle[i];
+        uint64_t total_diff = current_total - prev_total[i];
+        
+        if (total_diff > 0) {
+            double usage = 100.0 * (1.0 - ((double)idle_diff / total_diff));
+            pcpu_stats[i].usage_pct = (usage < 0) ? 0 : (usage > 100) ? 100 : usage;
+        } else {
+            pcpu_stats[i].usage_pct = 0.0;
+        }
+        pcpu_stats[i].pcpu_id = i;
+        /* Update history */
+        prev_idle[i] = current_idle;
+        prev_total[i] = current_total;
+    }
+
+    return 0;
+}
+
+void print_pcpu_stats(void)
+{
+    if (!pcpu_stats || num_pcpus == 0) {
+        printf("No PCPU data available\n");
+        return;
+    }
+
+    printf("\nPhysical CPU Usage:\n");
+    
+    // Print table header
+    printf("┌───────┬────────┐\n");
+    printf("│ Core  │ Usage  │\n");
+    printf("├───────┼────────┤\n");
+    
+    // Print each CPU's data
+    for (int i = 0; i < num_pcpus; i++) {
+        printf("│ %-5d │ %5.1f%% │\n",
+               pcpu_stats[i].pcpu_id,
+               pcpu_stats[i].usage_pct);
+    }
+    
+    // Print table footer
+    printf("└───────┴────────┘\n");
+}
+
+void free_pcpu_stats(void)
+{
+    free(pcpu_stats);
+    free(prev_idle);
+    free(prev_total);
+    pcpu_stats = NULL;
+    prev_idle = NULL;
+    prev_total = NULL;
+    num_pcpus = 0;
+}
diff --git a/tools/xentop/pcpu.h b/tools/xentop/pcpu.h
new file mode 100644
index 0000000000..6fbc023f22
--- /dev/null
+++ b/tools/xentop/pcpu.h
@@ -0,0 +1,18 @@
+#ifndef PCPU_H
+#define PCPU_H
+
+#include <xenctrl.h>
+#include <stdbool.h>
+#include <xenstat.h>
+
+typedef struct {
+    int pcpu_id;
+    float usage_pct;
+} pcpu_stat_t;
+
+/* Public API */
+int update_pcpu_stats(xc_interface *xch);
+void print_pcpu_stats(void);
+void free_pcpu_stats(void);
+
+#endif // PCPU_H
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index f5d6c19cf9..b8d0ed4015 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -24,6 +24,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <math.h>
+#include "pcpu.h"
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdarg.h>
@@ -69,6 +70,12 @@
 
 #define INT_FIELD_WIDTH(n) ((unsigned int)(log10(n) + 1))
 
+/* TEMPORARY: Forward declare the internal structure */
+struct xenstat_handle {
+    xc_interface *xc_handle;
+    /* Other members don't matter for now */
+};
+
 /*
  * Function prototypes
  */
@@ -205,6 +212,7 @@ field_id sort_field = FIELD_DOMID;
 unsigned int first_domain_index = 0;
 unsigned int delay = 3;
 unsigned int batch = 0;
+static unsigned int show_pcpus = 0;
 unsigned int loop = 1;
 unsigned int iterations = 0;
 int show_vcpus = 0;
@@ -230,22 +238,23 @@ static WINDOW *cwin;
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
@@ -267,6 +276,8 @@ static void cleanup(void)
 		xenstat_free_node(cur_node);
 	if(xhandle != NULL)
 		xenstat_uninit(xhandle);
+
+	free_pcpu_stats();
 }
 
 /* Display the given message and gracefully exit */
@@ -1189,7 +1200,7 @@ static void top(void)
 		fail("Failed to retrieve statistics from libxenstat\n");
 
 	/* dump summary top information */
-	if (!batch)
+	if (!batch && !show_pcpus)
 		do_summary();
 
 	/* Count the number of domains for which to report data */
@@ -1245,9 +1256,17 @@ static void top(void)
 			do_vbd(domains[i]);
 	}
 
-	if (!batch)
+	if (!batch && !show_pcpus)
 		do_bottom_line();
 
+    if (show_pcpus && xhandle != NULL) {
+        if (update_pcpu_stats(xhandle->xc_handle) == 0) {
+            print_pcpu_stats();
+        } else {
+            print("Error getting PCPU stats\n");
+        }
+    }
+	
 	free(domains);
 }
 
@@ -1271,13 +1290,14 @@ int main(int argc, char **argv)
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
@@ -1312,6 +1332,9 @@ int main(int argc, char **argv)
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


