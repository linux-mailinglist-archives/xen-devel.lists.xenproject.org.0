Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265BB507F1D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308718.524524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Si-000151-2u; Wed, 20 Apr 2022 02:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308718.524524; Wed, 20 Apr 2022 02:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Sh-00012a-WB; Wed, 20 Apr 2022 02:52:59 +0000
Received: by outflank-mailman (input) for mailman id 308718;
 Wed, 20 Apr 2022 02:52:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0Sg-00012Q-EA
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:52:58 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0a3102-c054-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:52:57 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2qlpN093140
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:52:53 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2ql8U093139;
 Tue, 19 Apr 2022 19:52:47 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: fb0a3102-c054-11ec-a405-831a346695d4
Message-Id: <c145a7648025e9bbc2f47ab8bd5839c80c01933f.1650422518.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650422517.git.ehem+xen@m5p.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Apr 2022 18:56:03 -0700
Subject: [PATCH 1/2] tools/xl: Sort create command options
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

Hopefully simplify future changes by sorting options lists for
`xl create`.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_cmdtable.c  | 10 +++++-----
 tools/xl/xl_vmcontrol.c | 40 ++++++++++++++++++++--------------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d488..f546beaceb 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -24,16 +24,16 @@ const struct cmd_spec cmd_table[] = {
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
       "<ConfigFile> [options] [vars]",
+      "-c                      Connect to the console after the domain is created.\n"
+      "-d                      Enable debug messages.\n"
+      "-e                      Do not wait in the background for the death of the domain.\n"
+      "-F                      Run in foreground until death of the domain.\n"
       "-h                      Print this help.\n"
       "-p                      Leave the domain paused after it is created.\n"
-      "-c                      Connect to the console after the domain is created.\n"
       "-f FILE, --defconfig=FILE\n                     Use the given configuration file.\n"
-      "-q, --quiet             Quiet.\n"
       "-n, --dryrun            Dry run - prints the resulting configuration\n"
       "                         (deprecated in favour of global -N option).\n"
-      "-d                      Enable debug messages.\n"
-      "-F                      Run in foreground until death of the domain.\n"
-      "-e                      Do not wait in the background for the death of the domain.\n"
+      "-q, --quiet             Quiet.\n"
       "-V, --vncviewer         Connect to the VNC display after the domain is created.\n"
       "-A, --vncviewer-autopass\n"
       "                        Pass VNC password to viewer via stdin.\n"
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a033..2ec4140258 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1169,13 +1169,13 @@ int main_create(int argc, char **argv)
     int paused = 0, debug = 0, daemonize = 1, console_autoconnect = 0,
         quiet = 0, monitor = 1, vnc = 0, vncautopass = 0, ignore_masks = 0;
     int opt, rc;
-    static struct option opts[] = {
+    static const struct option opts[] = {
+        {"defconfig", 1, 0, 'f'},
         {"dryrun", 0, 0, 'n'},
+        {"ignore-global-affinity-masks", 0, 0, 'i'},
         {"quiet", 0, 0, 'q'},
-        {"defconfig", 1, 0, 'f'},
         {"vncviewer", 0, 0, 'V'},
         {"vncviewer-autopass", 0, 0, 'A'},
-        {"ignore-global-affinity-masks", 0, 0, 'i'},
         COMMON_LONG_OPTS
     };
 
@@ -1186,12 +1186,15 @@ int main_create(int argc, char **argv)
         argc--; argv++;
     }
 
-    SWITCH_FOREACH_OPT(opt, "Fnqf:pcdeVAi", opts, "create", 0) {
-    case 'f':
-        filename = optarg;
+    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {
+    case 'A':
+        vnc = vncautopass = 1;
         break;
-    case 'p':
-        paused = 1;
+    case 'F':
+        daemonize = 0;
+        break;
+    case 'V':
+        vnc = 1;
         break;
     case 'c':
         console_autoconnect = 1;
@@ -1199,28 +1202,25 @@ int main_create(int argc, char **argv)
     case 'd':
         debug = 1;
         break;
-    case 'F':
-        daemonize = 0;
-        break;
     case 'e':
         daemonize = 0;
         monitor = 0;
         break;
+    case 'f':
+        filename = optarg;
+        break;
+    case 'i':
+        ignore_masks = 1;
+        break;
     case 'n':
         dryrun_only = 1;
         break;
+    case 'p':
+        paused = 1;
+        break;
     case 'q':
         quiet = 1;
         break;
-    case 'V':
-        vnc = 1;
-        break;
-    case 'A':
-        vnc = vncautopass = 1;
-        break;
-    case 'i':
-        ignore_masks = 1;
-        break;
     }
 
     memset(&dom_info, 0, sizeof(dom_info));
-- 
2.30.2


