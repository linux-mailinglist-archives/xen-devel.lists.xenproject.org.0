Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC61EA4D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOc-0006wI-Se; Mon, 01 Jun 2020 13:22:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOb-0006uV-3W
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:29 +0000
X-Inumbo-ID: e0867e0c-a40a-11ea-8993-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0867e0c-a40a-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 13:22:01 +0000 (UTC)
IronPort-SDR: swwNZtVJOd6u4QhrFDPrBdlamAA74Yp2isDHdnSQf0hnEp3F2CBbYsaV1Cfa8JHOrQUN+UoiPY
 91wY0fFtIAWA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:22:00 -0700
IronPort-SDR: 6fAP/sT786E5b+wVau0KnNKPiBUnslAnYMWwlPPMG2gDSjTHUFKlyREzr2kMpPdNsThtjKfXCD
 ptNRwxkDwFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887324"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:22:00 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 12/13] tools/xl: Add xl fork-vm command
Date: Mon,  1 Jun 2020 06:21:46 -0700
Message-Id: <da122402f491598df80517a458e050ec46f640ac.1591017086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591017086.git.tamas.lengyel@intel.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding the xl fork-vm command, compiled only on x86. Only the essential bits
are available via this command to create a fork and launch QEMU for it. The
command still allows to perform the task in a split-model, first creating the
fork and launching QEMU only later.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/xl/Makefile       |   2 +-
 tools/xl/xl.h           |   4 ++
 tools/xl/xl_cmdtable.c  |  13 +++++
 tools/xl/xl_forkvm.c    | 122 ++++++++++++++++++++++++++++++++++++++++
 tools/xl/xl_vmcontrol.c |  13 +++++
 5 files changed, 153 insertions(+), 1 deletion(-)
 create mode 100644 tools/xl/xl_forkvm.c

diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index af4912e67a..073222233b 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -15,7 +15,7 @@ LDFLAGS += $(PTHREAD_LDFLAGS)
 CFLAGS_XL += $(CFLAGS_libxenlight)
 CFLAGS_XL += -Wshadow
 
-XL_OBJS-$(CONFIG_X86) = xl_psr.o
+XL_OBJS-$(CONFIG_X86) = xl_psr.o xl_forkvm.o
 XL_OBJS = xl.o xl_cmdtable.o xl_sxp.o xl_utils.o $(XL_OBJS-y)
 XL_OBJS += xl_parse.o xl_cpupool.o xl_flask.o
 XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 06569c6c4a..4b4442e875 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -50,6 +50,8 @@ struct domain_create {
     int migrate_fd; /* -1 means none */
     int send_back_fd; /* -1 means none */
     char **migration_domname_r; /* from malloc */
+    uint32_t dm_restore_domid; /* restore dm for this domid */
+    const char *dm_restore_file; /* path to dm restore file */
 };
 
 int create_domain(struct domain_create *dom_info);
@@ -131,6 +133,8 @@ int main_restore(int argc, char **argv);
 int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
+int main_fork_vm(int argc, char **argv);
+int main_fork_launch_dm(int argc, char **argv);
 #endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 08335394e5..523d955317 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -187,6 +187,19 @@ struct cmd_spec cmd_table[] = {
       "Restore a domain from a saved state",
       "- for internal use only",
     },
+#if defined(__i386__) || defined(__x86_64__)
+    { "fork-vm",
+      &main_fork_vm, 0, 1,
+      "Fork a domain from the running parent domid. Experimental. Most config settings must match parent.",
+      "[options] <Domid>",
+      "-h                           Print this help.\n"
+      "-C <config>                  Use config file for VM fork.\n"
+      "-Q <qemu-save-file>          Use qemu save file for VM fork.\n"
+      "--launch-dm <yes|no|late>    Launch device model (QEMU) for VM fork (default yes).\n"
+      "-p                           Do not unpause fork VM fork after operation.\n"
+      "-d                           Enable debug messages.\n"
+    },
+#endif
 #endif
     { "dump-core",
       &main_dump_core, 0, 1,
diff --git a/tools/xl/xl_forkvm.c b/tools/xl/xl_forkvm.c
new file mode 100644
index 0000000000..5ab57ae41b
--- /dev/null
+++ b/tools/xl/xl_forkvm.c
@@ -0,0 +1,122 @@
+/*
+ * Copyright 2020 Intel Corporation
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
+#include <fcntl.h>
+#include <inttypes.h>
+#include <stdlib.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/utsname.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <libxl.h>
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+int main_fork_vm(int argc, char **argv)
+{
+    int rc, debug = 0;
+    uint32_t domid_in = INVALID_DOMID, domid_out = INVALID_DOMID;
+    int launch_dm = 1;
+    bool pause = 0;
+    const char *config_file = NULL;
+    const char *dm_restore_file = NULL;
+
+    int opt;
+    static struct option opts[] = {
+        {"launch-dm", 1, 0, 'l'},
+        COMMON_LONG_OPTS
+    };
+
+    SWITCH_FOREACH_OPT(opt, "phdC:Q:l:", opts, "fork-vm", 1) {
+    case 'd':
+        debug = 1;
+        break;
+    case 'p':
+        pause = 1;
+        break;
+    case 'C':
+        config_file = optarg;
+        break;
+    case 'Q':
+        dm_restore_file = optarg;
+        break;
+    case 'l':
+        if ( !strcmp(optarg, "no") )
+            launch_dm = 0;
+        if ( !strcmp(optarg, "yes") )
+            launch_dm = 1;
+        if ( !strcmp(optarg, "late") )
+            launch_dm = 2;
+        break;
+    default:
+        fprintf(stderr, "Unimplemented option(s)\n");
+        return EXIT_FAILURE;
+    }
+
+    if (argc-optind == 1) {
+        domid_in = atoi(argv[optind]);
+    } else {
+        help("fork-vm");
+        return EXIT_FAILURE;
+    }
+
+    if (launch_dm && (!config_file || !dm_restore_file)) {
+        fprintf(stderr, "Currently you must provide both -C and -Q options\n");
+        return EXIT_FAILURE;
+    }
+
+    if (launch_dm == 2) {
+        domid_out = domid_in;
+        rc = EXIT_SUCCESS;
+    } else {
+        rc = libxl_domain_fork_vm(ctx, domid_in, &domid_out);
+    }
+
+    if (rc == EXIT_SUCCESS) {
+        if ( launch_dm ) {
+            struct domain_create dom_info;
+            memset(&dom_info, 0, sizeof(dom_info));
+            dom_info.dm_restore_domid = domid_out;
+            dom_info.dm_restore_file = dm_restore_file;
+            dom_info.debug = debug;
+            dom_info.paused = pause;
+            dom_info.config_file = config_file;
+            dom_info.migrate_fd = -1;
+            dom_info.send_back_fd = -1;
+            rc = create_domain(&dom_info) < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+        } else if ( !pause )
+            rc = libxl_domain_unpause(ctx, domid_out, NULL);
+    }
+
+    if (rc == EXIT_SUCCESS)
+        fprintf(stderr, "fork-vm command successfully returned domid: %u\n", domid_out);
+    else if ( domid_out != INVALID_DOMID )
+        libxl_domain_destroy(ctx, domid_out, 0);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 17b4514c94..508a7c70bb 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -676,6 +676,12 @@ int create_domain(struct domain_create *dom_info)
 
     int restoring = (restore_file || (migrate_fd >= 0));
 
+#if defined(__i386__) || defined(__x86_64__)
+    /* VM forking, restore dm for this domain */
+    uint32_t dm_restore_domid = dom_info->dm_restore_domid;
+    const char *dm_restore_file = dom_info->dm_restore_file;
+#endif
+
     libxl_domain_config_init(&d_config);
 
     if (restoring) {
@@ -934,6 +940,13 @@ start:
                                       0, autoconnect_console_how);
         domid = domid_soft_reset;
         domid_soft_reset = INVALID_DOMID;
+#if defined(__i386__) || defined(__x86_64__)
+    } else if (dm_restore_file) {
+        d_config.dm_restore_file = dm_restore_file;
+        ret = libxl_domain_fork_launch_dm(ctx, &d_config, dm_restore_domid,
+                                          autoconnect_console_how);
+        domid = dm_restore_domid;
+#endif
     } else {
         ret = libxl_domain_create_new(ctx, &d_config, &domid,
                                       0, autoconnect_console_how);
-- 
2.25.1


