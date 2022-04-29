Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A735159DC
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 04:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317947.537503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd3a-0004Jm-As; Sat, 30 Apr 2022 02:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317947.537503; Sat, 30 Apr 2022 02:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd3a-0004Gt-71; Sat, 30 Apr 2022 02:42:02 +0000
Received: by outflank-mailman (input) for mailman id 317947;
 Sat, 30 Apr 2022 02:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yLwW=VI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nkd3Y-0004Ge-LJ
 for xen-devel@lists.xenproject.org; Sat, 30 Apr 2022 02:42:00 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a890cc2-c82f-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 04:41:58 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23U2fm87061622
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Apr 2022 22:41:54 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23U2fmBJ061621;
 Fri, 29 Apr 2022 19:41:48 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1a890cc2-c82f-11ec-a405-831a346695d4
Message-Id: <a444edf57dbb1ea45ce4af471bf2c5f9b362bbde.1651285313.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1651285313.git.ehem+xen@m5p.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 29 Apr 2022 15:45:25 -0700
Subject: [PATCH v2 2/3] tools/xl: Use sparse init for dom_info, remove duplicate
 vars
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_03_06,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Rather than having shadow variables for every element of dom_info, it is
better to properly initialize dom_info at the start.  This also removes
the misleading memset() in the middle of main_create().

Remove the dryrun element of domain_create as that has been displaced
by the global "dryrun_only" variable.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
v2:
This was added due to the confusing situation with dom_info.
---
 tools/xl/xl.h           |  1 -
 tools/xl/xl_vmcontrol.c | 76 ++++++++++++++++++++---------------------
 2 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..72538d6a81 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -34,7 +34,6 @@ struct domain_create {
     int daemonize;
     int monitor; /* handle guest reboots etc */
     int paused;
-    int dryrun;
     int quiet;
     int vnc;
     int vncautopass;
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index d081c6c290..4bf041fb01 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -854,8 +854,8 @@ int create_domain(struct domain_create *dom_info)
         }
     }
 
-    if (debug || dom_info->dryrun) {
-        FILE *cfg_print_fh = (debug && !dom_info->dryrun) ? stderr : stdout;
+    if (debug || dryrun_only) {
+        FILE *cfg_print_fh = (debug && !dryrun_only) ? stderr : stdout;
         if (default_output_format == OUTPUT_FORMAT_SXP) {
             printf_info_sexp(-1, &d_config, cfg_print_fh);
         } else {
@@ -873,7 +873,7 @@ int create_domain(struct domain_create *dom_info)
 
 
     ret = 0;
-    if (dom_info->dryrun)
+    if (dryrun_only)
         goto out;
 
 start:
@@ -1164,10 +1164,26 @@ out:
 
 int main_create(int argc, char **argv)
 {
-    const char *filename = NULL;
-    struct domain_create dom_info;
-    int paused = 0, debug = 0, daemonize = 1, console_autoconnect = 0,
-        quiet = 0, monitor = 1, vnc = 0, vncautopass = 0, ignore_masks = 0;
+    struct domain_create dom_info = {
+        /* Command-line options */
+        .config_file = NULL,
+        .console_autoconnect = 0,
+        .debug = 0,
+        .daemonize = 1,
+        .ignore_global_affinity_masks = 0,
+        .monitor = 1,
+        .paused = 0,
+        .quiet = 0,
+        .vnc = 0,
+        .vncautopass = 0,
+
+        /* Extra configuration file settings */
+        .extra_config = NULL,
+
+        /* FDs, initialize to invalid */
+        .migrate_fd = -1,
+        .send_back_fd = -1,
+    };
     int opt, rc;
     static const struct option opts[] = {
         {"defconfig", 1, 0, 'f'},
@@ -1179,58 +1195,54 @@ int main_create(int argc, char **argv)
         COMMON_LONG_OPTS
     };
 
-    dom_info.extra_config = NULL;
-
     if (argv[1] && argv[1][0] != '-' && !strchr(argv[1], '=')) {
-        filename = argv[1];
+        dom_info.config_file = argv[1];
         argc--; argv++;
     }
 
     SWITCH_FOREACH_OPT(opt, "AFVcdef:inpq", opts, "create", 0) {
     case 'A':
-        vnc = vncautopass = 1;
+        dom_info.vnc = dom_info.vncautopass = 1;
         break;
     case 'F':
-        daemonize = 0;
+        dom_info.daemonize = 0;
         break;
     case 'V':
-        vnc = 1;
+        dom_info.vnc = 1;
         break;
     case 'c':
-        console_autoconnect = 1;
+        dom_info.console_autoconnect = 1;
         break;
     case 'd':
-        debug = 1;
+        dom_info.debug = 1;
         break;
     case 'e':
-        daemonize = 0;
-        monitor = 0;
+        dom_info.daemonize = 0;
+        dom_info.monitor = 0;
         break;
     case 'f':
-        filename = optarg;
+        dom_info.config_file = optarg;
         break;
     case 'i':
-        ignore_masks = 1;
+        dom_info.ignore_global_affinity_masks = 1;
         break;
     case 'n':
         dryrun_only = 1;
         break;
     case 'p':
-        paused = 1;
+        dom_info.paused = 1;
         break;
     case 'q':
-        quiet = 1;
+        dom_info.quiet = 1;
         break;
     }
 
-    memset(&dom_info, 0, sizeof(dom_info));
-
     for (; optind < argc; optind++) {
         if (strchr(argv[optind], '=') != NULL) {
             string_realloc_append(&dom_info.extra_config, argv[optind]);
             string_realloc_append(&dom_info.extra_config, "\n");
-        } else if (!filename) {
-            filename = argv[optind];
+        } else if (!dom_info.config_file) {
+            dom_info.config_file = argv[optind];
         } else {
             help("create");
             free(dom_info.extra_config);
@@ -1238,20 +1250,6 @@ int main_create(int argc, char **argv)
         }
     }
 
-    dom_info.debug = debug;
-    dom_info.daemonize = daemonize;
-    dom_info.monitor = monitor;
-    dom_info.paused = paused;
-    dom_info.dryrun = dryrun_only;
-    dom_info.quiet = quiet;
-    dom_info.config_file = filename;
-    dom_info.migrate_fd = -1;
-    dom_info.send_back_fd = -1;
-    dom_info.vnc = vnc;
-    dom_info.vncautopass = vncautopass;
-    dom_info.console_autoconnect = console_autoconnect;
-    dom_info.ignore_global_affinity_masks = ignore_masks;
-
     rc = create_domain(&dom_info);
     if (rc < 0) {
         free(dom_info.extra_config);
-- 
2.30.2


