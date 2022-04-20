Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C795159DF
	for <lists+xen-devel@lfdr.de>; Sat, 30 Apr 2022 04:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317958.537514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd4A-0004rv-KZ; Sat, 30 Apr 2022 02:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317958.537514; Sat, 30 Apr 2022 02:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkd4A-0004q5-GC; Sat, 30 Apr 2022 02:42:38 +0000
Received: by outflank-mailman (input) for mailman id 317958;
 Sat, 30 Apr 2022 02:42:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yLwW=VI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nkd48-0004Ge-Kg
 for xen-devel@lists.xenproject.org; Sat, 30 Apr 2022 02:42:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30a69f7b-c82f-11ec-a405-831a346695d4;
 Sat, 30 Apr 2022 04:42:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23U2gPBT061633
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Apr 2022 22:42:31 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23U2gPka061632;
 Fri, 29 Apr 2022 19:42:25 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 30a69f7b-c82f-11ec-a405-831a346695d4
Message-Id: <9aa6160b2664a52ff778fad67c366d67d3a0f8ab.1651285313.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1651285313.git.ehem+xen@m5p.com>
References: <cover.1651285313.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Apr 2022 18:23:41 -0700
Subject: [PATCH v2 3/3] tools/xl: Allow specifying JSON for domain configuration
 file format
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

JSON is currently used when saving domains to mass storage.  Being able
to use JSON as the normal input to `xl create` has potential to be
valuable.  Add the functionality.

Move the memset() earlier so to allow use of the structure sooner.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
v2:
Removing the UUOC situation.  Correct the comparison to match the correct
variable type.  Rename to "config_format" from "format".

Rename everything from "format" to "config_format".
---
 tools/xl/xl.h           |  5 +++++
 tools/xl/xl_cmdtable.c  |  2 ++
 tools/xl/xl_vmcontrol.c | 12 ++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 72538d6a81..4b0828431f 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -48,6 +48,11 @@ struct domain_create {
     int migrate_fd; /* -1 means none */
     int send_back_fd; /* -1 means none */
     char **migration_domname_r; /* from malloc */
+    enum {
+        CONFIG_FORMAT_DEFAULT,
+        CONFIG_FORMAT_JSON,
+        CONFIG_FORMAT_LEGACY,
+    } config_format; /* format specified for configuration */
 };
 
 int create_domain(struct domain_create *dom_info);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 35182ca196..8a791d8c49 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -30,6 +30,8 @@ const struct cmd_spec cmd_table[] = {
       "-F                      Run in foreground until death of the domain.\n"
       "-f FILE, --defconfig=FILE\n                     Use the given configuration file.\n"
       "-h                      Print this help.\n"
+      "-j, --json              Interpret configuration file as JSON format\n"
+      "-J                      Use traditional configuration file format (current default)\n"
       "-n, --dryrun            Dry run - prints the resulting configuration\n"
       "                         (deprecated in favour of global -N option).\n"
       "-p                      Leave the domain paused after it is created.\n"
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 4bf041fb01..dd8b3f81a6 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -789,7 +789,7 @@ int create_domain(struct domain_create *dom_info)
                 extra_config);
         }
         config_source=config_file;
-        config_in_json = false;
+        config_in_json = dom_info->config_format == CONFIG_FORMAT_JSON;
     } else {
         if (!config_data) {
             fprintf(stderr, "Config file not specified and"
@@ -1167,6 +1167,7 @@ int main_create(int argc, char **argv)
     struct domain_create dom_info = {
         /* Command-line options */
         .config_file = NULL,
+        .config_format = CONFIG_FORMAT_DEFAULT,
         .console_autoconnect = 0,
         .debug = 0,
         .daemonize = 1,
@@ -1189,6 +1190,7 @@ int main_create(int argc, char **argv)
         {"defconfig", 1, 0, 'f'},
         {"dryrun", 0, 0, 'n'},
         {"ignore-global-affinity-masks", 0, 0, 'i'},
+        {"json", 0, 0, 'j'},
         {"quiet", 0, 0, 'q'},
         {"vncviewer", 0, 0, 'V'},
         {"vncviewer-autopass", 0, 0, 'A'},
@@ -1200,13 +1202,16 @@ int main_create(int argc, char **argv)
         argc--; argv++;
     }
 
-    SWITCH_FOREACH_OPT(opt, "AFVcdef:inpq", opts, "create", 0) {
+    SWITCH_FOREACH_OPT(opt, "AFJVcdef:ijnpq", opts, "create", 0) {
     case 'A':
         dom_info.vnc = dom_info.vncautopass = 1;
         break;
     case 'F':
         dom_info.daemonize = 0;
         break;
+    case 'J':
+        dom_info.config_format = CONFIG_FORMAT_LEGACY;
+        break;
     case 'V':
         dom_info.vnc = 1;
         break;
@@ -1226,6 +1231,9 @@ int main_create(int argc, char **argv)
     case 'i':
         dom_info.ignore_global_affinity_masks = 1;
         break;
+    case 'j':
+        dom_info.config_format = CONFIG_FORMAT_JSON;
+        break;
     case 'n':
         dryrun_only = 1;
         break;
-- 
2.30.2


