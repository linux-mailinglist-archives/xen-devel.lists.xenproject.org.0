Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780D42EA03E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61616.108494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoi-00022D-E9; Mon, 04 Jan 2021 22:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61616.108494; Mon, 04 Jan 2021 22:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoi-000219-9j; Mon, 04 Jan 2021 22:59:12 +0000
Received: by outflank-mailman (input) for mailman id 61616;
 Mon, 04 Jan 2021 22:59:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYiO-0000oY-Tn
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:40 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be390425-e523-4291-b9e2-b28c9aa5a300;
 Mon, 04 Jan 2021 22:52:22 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqCdc071464
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:18 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqCX9071463;
 Mon, 4 Jan 2021 14:52:12 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: be390425-e523-4291-b9e2-b28c9aa5a300
Message-Id: <18f651f76d3af79d87d2c19ac74795c0ba587824.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Thu, 10 Dec 2020 15:09:06 -0800
Subject: [WIP PATCH 10/16] WIP: tools/xl: Implement output format option
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Often it is desireable to only list a specific subset of fields, or list
them in an unusual order.  Previously `xl list` gave output in a fixed
order, now add "-F" to allow specifying fields and formatting.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_cmdtable.c | 14 ++++++++++++
 tools/xl/xl_list.c     | 50 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 6a05bf7ce2..f44c65a3f8 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -53,6 +53,20 @@ struct cmd_spec cmd_table[] = {
       &main_list, 0, 0,
       "List information about all/some domains",
       "[options] [Domain]\n",
+      "-F, --format            Specify output format string\n"
+      "   Similar to printf(3) formatting, conversion characters are:\n"
+      "      %A    NODE Affinity\n"
+      "      %c    Claimed\n"
+      "      %i    Domain Id (%o, %x, and %X allow octal and hexadecimal)\n"
+      "      %l    Security label\n"
+      "      %m    Memory (Megabytes)\n"
+      "      %n    Domain name\n"
+      "      %p    CPU Pool\n"
+      "      %r    Shutdown reason\n"
+      "      %s    State\n"
+      "      %t    Time(s)\n"
+      "      %u    UUID\n"
+      "      %v    vCPUs\n"
       "-Z, --context           Prints out security context\n"
       "-c, --cpupool           Prints the cpupool the domain is in\n"
       "-l, --long              Output all VM details\n"
diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 1c04f2126b..c79b5e041b 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -309,6 +309,39 @@ static void format(const format_table_t fmttab, const char *fmt,
     }
 }
 
+static const libxl_dominfo *_discard;
+
+const format_table_t formats = {
+    ['A' - 'A'] = {"NODE Affinity",     "", format_node},
+    ['X' - 'A'] = {"ID",               "X", format_normal,
+                   (int *)&_discard->domid - (int *)_discard, {.i = 0}},
+    ['c' - 'A'] = {"Claim",           "lu", format_normal,
+                   (unsigned long *)&_discard->outstanding_memkb -
+                   (unsigned long *)_discard, {.lu = 1024}},
+    ['i' - 'A'] = {"ID",               "d", format_normal,
+                   (int *)&_discard->domid - (int *)_discard, {.i = 0}},
+    ['l' - 'A'] = {"Security Label",   "s", format_normal,
+                   (char **)&_discard->ssid_label - (char **)_discard},
+    ['m' - 'A'] = {"Mem",             "lu", format_memory},
+    ['n' - 'A'] = {"Name",             "s", format_allocstr,
+                   (uint32_t *)&_discard->domid - (uint32_t *)_discard,
+                   {.xlfunc = libxl_domid_to_name}},
+    ['o' - 'A'] = {"ID",               "o", format_normal,
+                   (int *)&_discard->domid - (int *)_discard, {.i = 0}},
+    ['p' - 'A'] = {"Cpupool",          "s", format_allocstr,
+                   (uint32_t *)&_discard->cpupool - (uint32_t *)_discard,
+                   {.xlfunc = libxl_cpupoolid_to_name}},
+    ['r' - 'A'] = {"Reason",            "", format_reason},
+    ['s' - 'A'] = {"State",            "s", format_state},
+    ['t' - 'A'] = {"Time(s)",         "qu", format_time},
+    ['u' - 'A'] = {"  UUID                              ", "", format_uuid,
+                   (char *)&_discard->uuid - (char *)_discard},
+    ['v' - 'A'] = {"VCPUs",            "d", format_normal,
+                   (int *)&_discard->vcpu_online - (int *)_discard, {.i = 0}},
+    ['x' - 'A'] = {"ID",               "x", format_normal,
+                   (int *)&_discard->domid - (int *)_discard, {.i = 0}},
+};
+
 
 static void list_vm(void)
 {
@@ -417,11 +450,13 @@ int main_list(int argc, char **argv)
     bool context = false;
     bool cpupool = false;
     bool details = false;
+    const char *formatstr = NULL;
     bool numa = false;
     bool verbose = false;
     static struct option opts[] = {
         {"context", 0, 0, 'Z'},
         {"cpupool", 0, 0, 'c'},
+        {"format", 0, 0, 'F'},
         {"long", 0, 0, 'l'},
         {"numa", 0, 0, 'n'},
         {"verbose", 0, 0, 'v'},
@@ -432,7 +467,10 @@ int main_list(int argc, char **argv)
     libxl_dominfo *info, *info_free=0;
     int nb_domain, rc;
 
-    SWITCH_FOREACH_OPT(opt, "Zchlnv", opts, "list", 0) {
+    SWITCH_FOREACH_OPT(opt, "F:Zchlnv", opts, "list", 0) {
+    case 'F':
+        formatstr = optarg;
+        break;
     case 'Z':
         context = true;
         break;
@@ -480,7 +518,15 @@ int main_list(int argc, char **argv)
 
     if (details)
         dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
-    else
+    else if (formatstr) {
+        format(formats, formatstr, NULL);
+
+        while (nb_domain) {
+            format(formats, formatstr, info);
+            ++info;
+            --nb_domain;
+        }
+    } else
         list_domains(verbose, context, false /* claim */, numa, cpupool,
                      info, nb_domain);
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




