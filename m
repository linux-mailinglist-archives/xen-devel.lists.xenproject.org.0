Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2EE2EA036
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61574.108461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYic-0001Ys-2i; Mon, 04 Jan 2021 22:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61574.108461; Mon, 04 Jan 2021 22:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYib-0001YT-Ux; Mon, 04 Jan 2021 22:52:53 +0000
Received: by outflank-mailman (input) for mailman id 61574;
 Mon, 04 Jan 2021 22:52:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYia-0001Y4-5z
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:52 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0be40137-2e97-4a36-9886-3693e0ce814a;
 Mon, 04 Jan 2021 22:52:51 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqgfU071507
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:47 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqgmL071506;
 Mon, 4 Jan 2021 14:52:42 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0be40137-2e97-4a36-9886-3693e0ce814a
Message-Id: <23d48471e5f987736525b4d2be71419953fd4698.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 9 Dec 2020 14:34:37 -0800
Subject: [WIP PATCH 14/16] WIP: tools/xl: Enhance "list" command
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Add several features to specify output.  Allow omitting potentially
unneeded lines and add argument for exact line format.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_cmdtable.c |  2 ++
 tools/xl/xl_list.c     | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index f44c65a3f8..91c2026bc8 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -53,6 +53,7 @@ struct cmd_spec cmd_table[] = {
       &main_list, 0, 0,
       "List information about all/some domains",
       "[options] [Domain]\n",
+      "-0, --no-domain0        Omit information for Domain 0\n"
       "-F, --format            Specify output format string\n"
       "   Similar to printf(3) formatting, conversion characters are:\n"
       "      %A    NODE Affinity\n"
@@ -67,6 +68,7 @@ struct cmd_spec cmd_table[] = {
       "      %t    Time(s)\n"
       "      %u    UUID\n"
       "      %v    vCPUs\n"
+      "-H, --no-header         Omit table header\n"
       "-Z, --context           Prints out security context\n"
       "-c, --cpupool           Prints the cpupool the domain is in\n"
       "-l, --long              Output all VM details\n"
diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 3ed6da8feb..49ff2acaad 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -397,6 +397,8 @@ int main_list(int argc, char **argv)
     bool context = false;
     bool cpupool = false;
     bool details = false;
+    bool dom0 = true;
+    bool header = true;
     const char *formatstr = NULL;
     bool numa = false;
     bool verbose = false;
@@ -405,6 +407,8 @@ int main_list(int argc, char **argv)
         {"cpupool", 0, 0, 'c'},
         {"format", 0, 0, 'F'},
         {"long", 0, 0, 'l'},
+        {"no-domain0", 0, 0, '0'},
+        {"no-header", 0, 0, 'H'},
         {"numa", 0, 0, 'n'},
         {"verbose", 0, 0, 'v'},
         COMMON_LONG_OPTS
@@ -414,10 +418,16 @@ int main_list(int argc, char **argv)
     libxl_dominfo *info, *info_free=0;
     int nb_domain, rc;
 
-    SWITCH_FOREACH_OPT(opt, "F:Zchlnv", opts, "list", 0) {
+    SWITCH_FOREACH_OPT(opt, "0F:HZchlnv", opts, "list", 0) {
+    case '0':
+        dom0 = false;
+        break;
     case 'F':
         formatstr = optarg;
         break;
+    case 'H':
+        header = false;
+        break;
     case 'Z':
         context = true;
         break;
@@ -476,10 +486,10 @@ int main_list(int argc, char **argv)
             return EXIT_FAILURE;
         }
 
-        format(formats, formatstr, NULL);
+        if (header) format(formats, formatstr, NULL);
 
         while (nb_domain) {
-            format(formats, formatstr, info);
+            if (info->domid || dom0) format(formats, formatstr, info);
             ++info;
             --nb_domain;
         }
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




