Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CF2EA031
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61544.108411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhe-0000zo-Mj; Mon, 04 Jan 2021 22:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61544.108411; Mon, 04 Jan 2021 22:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYhe-0000yV-IB; Mon, 04 Jan 2021 22:51:54 +0000
Received: by outflank-mailman (input) for mailman id 61544;
 Mon, 04 Jan 2021 22:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYhc-0000oY-Tc
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:51:52 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e4fb3fa-0264-404b-a447-8668531a2d17;
 Mon, 04 Jan 2021 22:51:51 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104Mpe90071432
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:51:46 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MpeHL071431;
 Mon, 4 Jan 2021 14:51:40 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0e4fb3fa-0264-404b-a447-8668531a2d17
Message-Id: <b55554c846bf7ddcbdbd8ce194291b7a61547174.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 9 Dec 2020 14:45:15 -0800
Subject: [WIP PATCH 06/16] tools/xl: Split list commands off of xl_info.c
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

The domain listing commands have more in common with each other than
hypervisor information commands.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
I'm concerned about my header-stripping job.  Notably the headers
<sys/stat.h>, <sys/types.h>, and <libxlutil.h> were removed from *both*
files.  This could be cause for celebration, or this could mean my
build system's headers are nice and someone else's system needs these.
---
 tools/xl/Makefile  |   2 +-
 tools/xl/xl_info.c | 221 ---------------------------------------
 tools/xl/xl_list.c | 254 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+), 222 deletions(-)
 create mode 100644 tools/xl/xl_list.c

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index bdf67c8464..eb20d834d4 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -21,7 +21,7 @@ XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
-XL_OBJS += xl_info.o xl_console.o xl_misc.o
+XL_OBJS += xl_info.o xl_list.o xl_console.o xl_misc.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
 XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
 
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index bc88014f10..e12f26994e 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -17,8 +17,6 @@
 #include <fcntl.h>
 #include <inttypes.h>
 #include <stdlib.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <sys/utsname.h>
 #include <time.h>
 #include <unistd.h>
@@ -26,7 +24,6 @@
 #include <libxl.h>
 #include <libxl_json.h>
 #include <libxl_utils.h>
-#include <libxlutil.h>
 
 #include "xl.h"
 #include "xl_utils.h"
@@ -336,105 +333,6 @@ static void print_info(int numa)
     return;
 }
 
-static void list_vm(void)
-{
-    libxl_vminfo *info;
-    char *domname;
-    int nb_vm, i;
-
-    info = libxl_list_vm(ctx, &nb_vm);
-
-    if (!info) {
-        fprintf(stderr, "libxl_list_vm failed.\n");
-        exit(EXIT_FAILURE);
-    }
-    printf("UUID                                  ID    name\n");
-    for (i = 0; i < nb_vm; i++) {
-        domname = libxl_domid_to_name(ctx, info[i].domid);
-        printf(LIBXL_UUID_FMT "  %d    %-30s\n", LIBXL_UUID_BYTES(info[i].uuid),
-            info[i].domid, domname);
-        free(domname);
-    }
-    libxl_vminfo_list_free(info, nb_vm);
-}
-
-static void list_domains(bool verbose, bool context, bool claim, bool numa,
-                         bool cpupool, const libxl_dominfo *info, int nb_domain)
-{
-    int i;
-    static const char shutdown_reason_letters[]= "-rscwS";
-    libxl_bitmap nodemap;
-    libxl_physinfo physinfo;
-
-    libxl_bitmap_init(&nodemap);
-    libxl_physinfo_init(&physinfo);
-
-    printf("Name                                        ID   Mem VCPUs\tState\tTime(s)");
-    if (verbose) printf("   UUID                            Reason-Code\tSecurity Label");
-    if (context && !verbose) printf("   Security Label");
-    if (claim) printf("  Claimed");
-    if (cpupool) printf("         Cpupool");
-    if (numa) {
-        if (libxl_node_bitmap_alloc(ctx, &nodemap, 0)) {
-            fprintf(stderr, "libxl_node_bitmap_alloc_failed.\n");
-            exit(EXIT_FAILURE);
-        }
-        if (libxl_get_physinfo(ctx, &physinfo) != 0) {
-            fprintf(stderr, "libxl_physinfo failed.\n");
-            libxl_bitmap_dispose(&nodemap);
-            exit(EXIT_FAILURE);
-        }
-
-        printf(" NODE Affinity");
-    }
-    printf("\n");
-    for (i = 0; i < nb_domain; i++) {
-        char *domname;
-        libxl_shutdown_reason shutdown_reason;
-        domname = libxl_domid_to_name(ctx, info[i].domid);
-        shutdown_reason = info[i].shutdown ? info[i].shutdown_reason : 0;
-        printf("%-40s %5d %5lu %5d     %c%c%c%c%c%c  %8.1f",
-                domname,
-                info[i].domid,
-                (unsigned long) ((info[i].current_memkb +
-                    info[i].outstanding_memkb)/ 1024),
-                info[i].vcpu_online,
-                info[i].running ? 'r' : '-',
-                info[i].blocked ? 'b' : '-',
-                info[i].paused ? 'p' : '-',
-                info[i].shutdown ? 's' : '-',
-                (shutdown_reason >= 0 &&
-                 shutdown_reason < sizeof(shutdown_reason_letters)-1
-                 ? shutdown_reason_letters[shutdown_reason] : '?'),
-                info[i].dying ? 'd' : '-',
-                ((float)info[i].cpu_time / 1e9));
-        free(domname);
-        if (verbose) {
-            printf(" " LIBXL_UUID_FMT, LIBXL_UUID_BYTES(info[i].uuid));
-            if (info[i].shutdown) printf(" %8x", shutdown_reason);
-            else printf(" %8s", "-");
-        }
-        if (claim)
-            printf(" %5lu", (unsigned long)info[i].outstanding_memkb / 1024);
-        if (verbose || context)
-            printf(" %16s", info[i].ssid_label ? : "-");
-        if (cpupool) {
-            char *poolname = libxl_cpupoolid_to_name(ctx, info[i].cpupool);
-            printf("%16s", poolname);
-            free(poolname);
-        }
-        if (numa) {
-            libxl_domain_get_nodeaffinity(ctx, info[i].domid, &nodemap);
-
-            putchar(' ');
-            print_bitmap(nodemap.map, physinfo.nr_nodes, stdout);
-        }
-        putchar('\n');
-    }
-
-    libxl_bitmap_dispose(&nodemap);
-    libxl_physinfo_dispose(&physinfo);
-}
 
 void dump_by_dominfo_list(enum output_format output_format,
                           FILE *fh,
@@ -501,99 +399,6 @@ out:
 }
 
 
-int main_list(int argc, char **argv)
-{
-    int opt;
-    bool verbose = false;
-    bool context = false;
-    bool details = false;
-    bool cpupool = false;
-    bool numa = false;
-    static struct option opts[] = {
-        {"long", 0, 0, 'l'},
-        {"verbose", 0, 0, 'v'},
-        {"context", 0, 0, 'Z'},
-        {"cpupool", 0, 0, 'c'},
-        {"numa", 0, 0, 'n'},
-        COMMON_LONG_OPTS
-    };
-
-    libxl_dominfo info_buf;
-    libxl_dominfo *info, *info_free=0;
-    int nb_domain, rc;
-
-    SWITCH_FOREACH_OPT(opt, "lvhZcn", opts, "list", 0) {
-    case 'l':
-        details = true;
-        break;
-    case 'v':
-        verbose = true;
-        break;
-    case 'Z':
-        context = true;
-        break;
-    case 'c':
-        cpupool = true;
-        break;
-    case 'n':
-        numa = true;
-        break;
-    }
-
-    libxl_dominfo_init(&info_buf);
-
-    if (optind >= argc) {
-        info = libxl_list_domain(ctx, &nb_domain);
-        if (!info) {
-            fprintf(stderr, "libxl_list_domain failed.\n");
-            return EXIT_FAILURE;
-        }
-        info_free = info;
-    } else if (optind == argc-1) {
-        uint32_t domid = find_domain(argv[optind]);
-        rc = libxl_domain_info(ctx, &info_buf, domid);
-        if (rc == ERROR_DOMAIN_NOTFOUND) {
-            fprintf(stderr, "Error: Domain \'%s\' does not exist.\n",
-                argv[optind]);
-            return EXIT_FAILURE;
-        }
-        if (rc) {
-            fprintf(stderr, "libxl_domain_info failed (code %d).\n", rc);
-            return EXIT_FAILURE;
-        }
-        info = &info_buf;
-        nb_domain = 1;
-    } else {
-        help("list");
-        return EXIT_FAILURE;
-    }
-
-    if (details)
-        dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
-    else
-        list_domains(verbose, context, false /* claim */, numa, cpupool,
-                     info, nb_domain);
-
-    if (info_free)
-        libxl_dominfo_list_free(info, nb_domain);
-
-    libxl_dominfo_dispose(&info_buf);
-
-    return EXIT_SUCCESS;
-}
-
-int main_vm_list(int argc, char **argv)
-{
-    int opt;
-
-    SWITCH_FOREACH_OPT(opt, "", NULL, "vm-list", 0) {
-        /* No options */
-    }
-
-    list_vm();
-    return EXIT_SUCCESS;
-}
-
 int main_info(int argc, char **argv)
 {
     int opt;
@@ -703,32 +508,6 @@ static char *uptime_to_string(unsigned long uptime, int short_mode)
     return time_string;
 }
 
-int main_claims(int argc, char **argv)
-{
-    libxl_dominfo *info;
-    int opt;
-    int nb_domain;
-
-    SWITCH_FOREACH_OPT(opt, "", NULL, "claims", 0) {
-        /* No options */
-    }
-
-    if (!claim_mode)
-        fprintf(stderr, "claim_mode not enabled (see man xl.conf).\n");
-
-    info = libxl_list_domain(ctx, &nb_domain);
-    if (!info) {
-        fprintf(stderr, "libxl_list_domain failed.\n");
-        return 1;
-    }
-
-    list_domains(false /* verbose */, false /* context */, true /* claim */,
-                 false /* numa */, false /* cpupool */, info, nb_domain);
-
-    libxl_dominfo_list_free(info, nb_domain);
-    return 0;
-}
-
 static char *current_time_to_string(time_t now)
 {
     char now_str[100];
diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
new file mode 100644
index 0000000000..ac6a9e5eac
--- /dev/null
+++ b/tools/xl/xl_list.c
@@ -0,0 +1,254 @@
+/*
+ * Copyright 2009-2020 Citrix Ltd and other contributors
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#define _GNU_SOURCE
+
+#include <inttypes.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include <libxl.h>
+#include <libxl_utils.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+
+
+static void list_vm(void)
+{
+    libxl_vminfo *info;
+    char *domname;
+    int nb_vm, i;
+
+    info = libxl_list_vm(ctx, &nb_vm);
+
+    if (!info) {
+        fprintf(stderr, "libxl_list_vm failed.\n");
+        exit(EXIT_FAILURE);
+    }
+    printf("UUID                                  ID    name\n");
+    for (i = 0; i < nb_vm; i++) {
+        domname = libxl_domid_to_name(ctx, info[i].domid);
+        printf(LIBXL_UUID_FMT "  %d    %-30s\n", LIBXL_UUID_BYTES(info[i].uuid),
+            info[i].domid, domname);
+        free(domname);
+    }
+    libxl_vminfo_list_free(info, nb_vm);
+}
+
+static void list_domains(bool verbose, bool context, bool claim, bool numa,
+                         bool cpupool, const libxl_dominfo *info, int nb_domain)
+{
+    int i;
+    static const char shutdown_reason_letters[]= "-rscwS";
+    libxl_bitmap nodemap;
+    libxl_physinfo physinfo;
+
+    libxl_bitmap_init(&nodemap);
+    libxl_physinfo_init(&physinfo);
+
+    printf("Name                                        ID   Mem VCPUs\tState\tTime(s)");
+    if (verbose) printf("   UUID                            Reason-Code\tSecurity Label");
+    if (context && !verbose) printf("   Security Label");
+    if (claim) printf("  Claimed");
+    if (cpupool) printf("         Cpupool");
+    if (numa) {
+        if (libxl_node_bitmap_alloc(ctx, &nodemap, 0)) {
+            fprintf(stderr, "libxl_node_bitmap_alloc_failed.\n");
+            exit(EXIT_FAILURE);
+        }
+        if (libxl_get_physinfo(ctx, &physinfo) != 0) {
+            fprintf(stderr, "libxl_physinfo failed.\n");
+            libxl_bitmap_dispose(&nodemap);
+            exit(EXIT_FAILURE);
+        }
+
+        printf(" NODE Affinity");
+    }
+    printf("\n");
+    for (i = 0; i < nb_domain; i++) {
+        char *domname;
+        libxl_shutdown_reason shutdown_reason;
+        domname = libxl_domid_to_name(ctx, info[i].domid);
+        shutdown_reason = info[i].shutdown ? info[i].shutdown_reason : 0;
+        printf("%-40s %5d %5lu %5d     %c%c%c%c%c%c  %8.1f",
+                domname,
+                info[i].domid,
+                (unsigned long) ((info[i].current_memkb +
+                    info[i].outstanding_memkb)/ 1024),
+                info[i].vcpu_online,
+                info[i].running ? 'r' : '-',
+                info[i].blocked ? 'b' : '-',
+                info[i].paused ? 'p' : '-',
+                info[i].shutdown ? 's' : '-',
+                (shutdown_reason >= 0 &&
+                 shutdown_reason < sizeof(shutdown_reason_letters)-1
+                 ? shutdown_reason_letters[shutdown_reason] : '?'),
+                info[i].dying ? 'd' : '-',
+                ((float)info[i].cpu_time / 1e9));
+        free(domname);
+        if (verbose) {
+            printf(" " LIBXL_UUID_FMT, LIBXL_UUID_BYTES(info[i].uuid));
+            if (info[i].shutdown) printf(" %8x", shutdown_reason);
+            else printf(" %8s", "-");
+        }
+        if (claim)
+            printf(" %5lu", (unsigned long)info[i].outstanding_memkb / 1024);
+        if (verbose || context)
+            printf(" %16s", info[i].ssid_label ? : "-");
+        if (cpupool) {
+            char *poolname = libxl_cpupoolid_to_name(ctx, info[i].cpupool);
+            printf("%16s", poolname);
+            free(poolname);
+        }
+        if (numa) {
+            libxl_domain_get_nodeaffinity(ctx, info[i].domid, &nodemap);
+
+            putchar(' ');
+            print_bitmap(nodemap.map, physinfo.nr_nodes, stdout);
+        }
+        putchar('\n');
+    }
+
+    libxl_bitmap_dispose(&nodemap);
+    libxl_physinfo_dispose(&physinfo);
+}
+
+
+int main_list(int argc, char **argv)
+{
+    int opt;
+    bool verbose = false;
+    bool context = false;
+    bool details = false;
+    bool cpupool = false;
+    bool numa = false;
+    static struct option opts[] = {
+        {"long", 0, 0, 'l'},
+        {"verbose", 0, 0, 'v'},
+        {"context", 0, 0, 'Z'},
+        {"cpupool", 0, 0, 'c'},
+        {"numa", 0, 0, 'n'},
+        COMMON_LONG_OPTS
+    };
+
+    libxl_dominfo info_buf;
+    libxl_dominfo *info, *info_free=0;
+    int nb_domain, rc;
+
+    SWITCH_FOREACH_OPT(opt, "lvhZcn", opts, "list", 0) {
+    case 'l':
+        details = true;
+        break;
+    case 'v':
+        verbose = true;
+        break;
+    case 'Z':
+        context = true;
+        break;
+    case 'c':
+        cpupool = true;
+        break;
+    case 'n':
+        numa = true;
+        break;
+    }
+
+    libxl_dominfo_init(&info_buf);
+
+    if (optind >= argc) {
+        info = libxl_list_domain(ctx, &nb_domain);
+        if (!info) {
+            fprintf(stderr, "libxl_list_domain failed.\n");
+            return EXIT_FAILURE;
+        }
+        info_free = info;
+    } else if (optind == argc-1) {
+        uint32_t domid = find_domain(argv[optind]);
+        rc = libxl_domain_info(ctx, &info_buf, domid);
+        if (rc == ERROR_DOMAIN_NOTFOUND) {
+            fprintf(stderr, "Error: Domain \'%s\' does not exist.\n",
+                argv[optind]);
+            return EXIT_FAILURE;
+        }
+        if (rc) {
+            fprintf(stderr, "libxl_domain_info failed (code %d).\n", rc);
+            return EXIT_FAILURE;
+        }
+        info = &info_buf;
+        nb_domain = 1;
+    } else {
+        help("list");
+        return EXIT_FAILURE;
+    }
+
+    if (details)
+        dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
+    else
+        list_domains(verbose, context, false /* claim */, numa, cpupool,
+                     info, nb_domain);
+
+    if (info_free)
+        libxl_dominfo_list_free(info, nb_domain);
+
+    libxl_dominfo_dispose(&info_buf);
+
+    return EXIT_SUCCESS;
+}
+
+int main_vm_list(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "vm-list", 0) {
+        /* No options */
+    }
+
+    list_vm();
+    return EXIT_SUCCESS;
+}
+
+int main_claims(int argc, char **argv)
+{
+    libxl_dominfo *info;
+    int opt;
+    int nb_domain;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "claims", 0) {
+        /* No options */
+    }
+
+    if (!claim_mode)
+        fprintf(stderr, "claim_mode not enabled (see man xl.conf).\n");
+
+    info = libxl_list_domain(ctx, &nb_domain);
+    if (!info) {
+        fprintf(stderr, "libxl_list_domain failed.\n");
+        return 1;
+    }
+
+    list_domains(false /* verbose */, false /* context */, true /* claim */,
+                 false /* numa */, false /* cpupool */, info, nb_domain);
+
+    libxl_dominfo_list_free(info, nb_domain);
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




