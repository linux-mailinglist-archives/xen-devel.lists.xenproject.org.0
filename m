Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A202B41BC2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 12:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108066.1458229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkes-0002Vy-8x; Wed, 03 Sep 2025 10:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108066.1458229; Wed, 03 Sep 2025 10:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkes-0002TW-54; Wed, 03 Sep 2025 10:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1108066;
 Wed, 03 Sep 2025 10:24:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO1L=3O=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1utker-0001Ah-Jm
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:24:05 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ca9427b-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:24:03 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 3254980C094F; Wed,  3 Sep 2025 15:54:02 +0530 (IST)
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
X-Inumbo-ID: 1ca9427b-88b0-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 4/4] xentop: integrate pcpu support into main program
Date: Wed,  3 Sep 2025 15:53:23 +0530
Message-Id: <20250903102323.2553142-5-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Integrate physical CPU usage statistics into xentop.
This patch adds:
 - a new command-line option (-p, --pcpus)
 - display of per-CPU usage statistics
 - cleanup of pcpu resources on exit

This allows users to monitor host physical CPU utilization
alongside existing domain metrics.

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 tools/xentop/xentop.c | 79 +++++++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 18 deletions(-)

diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index f5d6c19cf9..addb1c70c9 100644
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
@@ -313,6 +318,32 @@ static void print(const char *fmt, ...)
 	}
 }
 
+/* PCPU statistics display function */
+static void print_pcpu_stats_display(void)
+{
+    int i;
+    int num_cpus;
+
+    if (!has_pcpu_data()) {
+        print("\nNo PCPU data available\n");
+        return;
+    }
+
+    num_cpus = get_pcpu_count();
+
+    /* Use the existing print() function which handles cursor bounds */
+    print("\nPhysical CPU Usage:\n");
+    print("+-------+--------+\n");
+    print("| Core  | Usage  |\n");
+    print("+-------+--------+\n");
+
+    for (i = 0; i < num_cpus; i++) {
+        print("| %-5d | %5.1f%% |\n", i, get_pcpu_usage(i));
+    }
+
+    print("+-------+--------+\n");
+}
+
 static void xentop_attron(int attr)
 {
 	if (!batch)
@@ -1245,6 +1276,14 @@ static void top(void)
 			do_vbd(domains[i]);
 	}
 
+    if (show_pcpus) {
+        if (update_pcpu_stats(&curtime, delay) == 0) {
+            print_pcpu_stats_display();
+        } else {
+            fail("Error getting PCPU stats\n");
+        }
+    }
+
 	if (!batch)
 		do_bottom_line();
 
@@ -1271,13 +1310,14 @@ int main(int argc, char **argv)
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
@@ -1312,6 +1352,9 @@ int main(int argc, char **argv)
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


