Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8949B507F1F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308731.524535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ts-0001hG-Dl; Wed, 20 Apr 2022 02:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308731.524535; Wed, 20 Apr 2022 02:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ts-0001eh-Af; Wed, 20 Apr 2022 02:54:12 +0000
Received: by outflank-mailman (input) for mailman id 308731;
 Wed, 20 Apr 2022 02:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0Tq-000126-NK
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:54:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 264b3875-c055-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 04:54:09 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2s0Uu093150
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:54:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2s0EU093149;
 Tue, 19 Apr 2022 19:54:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 264b3875-c055-11ec-8fbf-03012f2f19d4
Message-Id: <09213ac26738ee51401b454534c6b437766481b7.1650422518.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650422517.git.ehem+xen@m5p.com>
References: <cover.1650422517.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Apr 2022 18:23:41 -0700
Subject: [PATCH 2/2] tools/xl: Allow specifying JSON for domain configuration
 file format
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

JSON is currently used when saving domains to mass storage.  Being able
to use JSON as the normal input to `xl create` has potential to be
valuable.  Add the functionality.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h           |  5 +++++
 tools/xl/xl_cmdtable.c  |  2 ++
 tools/xl/xl_vmcontrol.c | 13 +++++++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index c5c4bedbdd..a0c03f96df 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -49,6 +49,11 @@ struct domain_create {
     int migrate_fd; /* -1 means none */
     int send_back_fd; /* -1 means none */
     char **migration_domname_r; /* from malloc */
+    enum {
+        FORMAT_DEFAULT,
+        FORMAT_JSON,
+        FORMAT_LEGACY,
+    } format;
 };
 
 int create_domain(struct domain_create *dom_info);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index f546beaceb..04d579a596 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -31,6 +31,8 @@ const struct cmd_spec cmd_table[] = {
       "-h                      Print this help.\n"
       "-p                      Leave the domain paused after it is created.\n"
       "-f FILE, --defconfig=FILE\n                     Use the given configuration file.\n"
+      "-j, --json              Interpret configuration file as JSON format\n"
+      "-J                      Use traditional configuration file format (current default)\n"
       "-n, --dryrun            Dry run - prints the resulting configuration\n"
       "                         (deprecated in favour of global -N option).\n"
       "-q, --quiet             Quiet.\n"
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 2ec4140258..41bd919d1d 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -789,7 +789,7 @@ int create_domain(struct domain_create *dom_info)
                 extra_config);
         }
         config_source=config_file;
-        config_in_json = false;
+        config_in_json = dom_info.format == FORMAT_JSON ? true : false;
     } else {
         if (!config_data) {
             fprintf(stderr, "Config file not specified and"
@@ -1173,6 +1173,7 @@ int main_create(int argc, char **argv)
         {"defconfig", 1, 0, 'f'},
         {"dryrun", 0, 0, 'n'},
         {"ignore-global-affinity-masks", 0, 0, 'i'},
+        {"json", 0, 0, 'j'},
         {"quiet", 0, 0, 'q'},
         {"vncviewer", 0, 0, 'V'},
         {"vncviewer-autopass", 0, 0, 'A'},
@@ -1181,18 +1182,23 @@ int main_create(int argc, char **argv)
 
     dom_info.extra_config = NULL;
 
+    dom_info.format = FORMAT_DEFAULT;
+
     if (argv[1] && argv[1][0] != '-' && !strchr(argv[1], '=')) {
         filename = argv[1];
         argc--; argv++;
     }
 
-    SWITCH_FOREACH_OPT(opt, "Ffnq:AVcdeip", opts, "create", 0) {
+    SWITCH_FOREACH_OPT(opt, "FJfjnq:AVcdeip", opts, "create", 0) {
     case 'A':
         vnc = vncautopass = 1;
         break;
     case 'F':
         daemonize = 0;
         break;
+    case 'J':
+        dom_info.format = FORMAT_LEGACY;
+        break;
     case 'V':
         vnc = 1;
         break;
@@ -1212,6 +1218,9 @@ int main_create(int argc, char **argv)
     case 'i':
         ignore_masks = 1;
         break;
+    case 'j':
+        dom_info.format = FORMAT_JSON;
+        break;
     case 'n':
         dryrun_only = 1;
         break;
-- 
2.30.2


