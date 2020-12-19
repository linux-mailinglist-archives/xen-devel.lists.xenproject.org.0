Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A72EA037
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61577.108473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYij-0001dO-C0; Mon, 04 Jan 2021 22:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61577.108473; Mon, 04 Jan 2021 22:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYij-0001ct-7o; Mon, 04 Jan 2021 22:53:01 +0000
Received: by outflank-mailman (input) for mailman id 61577;
 Mon, 04 Jan 2021 22:52:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYih-0001cF-9d
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:59 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbc95469-5e97-4dbe-a668-db3856b1b067;
 Mon, 04 Jan 2021 22:52:58 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqnT7071512
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:55 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqnL5071511;
 Mon, 4 Jan 2021 14:52:49 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: fbc95469-5e97-4dbe-a668-db3856b1b067
Message-Id: <fc15fc9a52552b8218ad5b8def88b6cf903c4a24.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 18 Dec 2020 23:23:36 -0800
Subject: [WIP PATCH 15/16] WIP: tools/xl: Implement output format option for
 "vm-list" command
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

While the "vm-list" subcommand has far fewer fields than the "list"
subcommand, one might still desire to list a subset of the fields.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_cmdtable.c |  7 ++++-
 tools/xl/xl_list.c     | 66 +++++++++++++++++++++++++-----------------
 2 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 91c2026bc8..c083566989 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -256,7 +256,12 @@ struct cmd_spec cmd_table[] = {
     { "vm-list",
       &main_vm_list, 0, 0,
       "List guest domains, excluding dom0, stubdoms, etc.",
-      "",
+      "[options]\n",
+      "-F, --format            Specify output format string\n"
+      "   Similar to printf(3) formatting, conversion characters are:\n"
+      "      %i    Domain Id (%o, %x, and %X allow octal and hexadecimal)\n"
+      "      %n    Domain name\n"
+      "      %u    UUID\n"
     },
     { "info",
       &main_info, 0, 0,
diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 49ff2acaad..58809aa10b 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -310,6 +310,7 @@ static void format(const format_table_t fmttab, const char *fmt,
 }
 
 static const libxl_dominfo *_discard;
+static const libxl_vminfo *_discard_vm;
 
 const format_table_t formats = {
     ['A' - 'A'] = {"NODE Affinity",     "", format_node},
@@ -340,6 +341,20 @@ const format_table_t formats = {
                    (int *)&_discard->vcpu_online - (int *)_discard, {.i = 0}},
     ['x' - 'A'] = {"ID",               "x", format_normal,
                    (int *)&_discard->domid - (int *)_discard, {.i = 0}},
+}, formats_vm = {
+    ['X' - 'A'] = {"ID",               "X", format_normal,
+                   (int *)&_discard_vm->domid - (int *)_discard_vm, {.i = 0}},
+    ['i' - 'A'] = {"ID",               "d", format_normal,
+                   (int *)&_discard_vm->domid - (int *)_discard_vm, {.i = 0}},
+    ['n' - 'A'] = {" name",            "s", format_allocstr,
+                   (uint32_t *)&_discard_vm->domid - (uint32_t *)_discard_vm,
+                   {.xlfunc = libxl_domid_to_name}},
+    ['o' - 'A'] = {"ID",               "o", format_normal,
+                   (int *)&_discard_vm->domid - (int *)_discard_vm, {.i = 0}},
+    ['u' - 'A'] = {"UUID                                ", "", format_uuid,
+                   (char *)&_discard_vm->uuid - (char *)_discard_vm},
+    ['x' - 'A'] = {"ID",               "x", format_normal,
+                   (int *)&_discard_vm->domid - (int *)_discard_vm, {.i = 0}},
 };
 
 static char *build_list_domain_format(bool verbose, bool context, bool claim,
@@ -368,29 +383,6 @@ static char *build_list_domain_format(bool verbose, bool context, bool claim,
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
-
 int main_list(int argc, char **argv)
 {
     int opt;
@@ -507,13 +499,35 @@ int main_list(int argc, char **argv)
 
 int main_vm_list(int argc, char **argv)
 {
+    const char *formatstr = "%u %5i %n\n";
     int opt;
+    static const struct option opts[] = {
+        {"format", 0, 0, 'F'},
+    };
 
-    SWITCH_FOREACH_OPT(opt, "", NULL, "vm-list", 0) {
-        /* No options */
+    libxl_vminfo *info;
+    int nb_vm, i;
+
+    SWITCH_FOREACH_OPT(opt, "F:", opts, "vm-list", 0) {
+    case 'F':
+        formatstr = optarg;
+        break;
+    }
+
+    info = libxl_list_vm(ctx, &nb_vm);
+
+    if (!info) {
+        fprintf(stderr, "libxl_list_vm failed.\n");
+        exit(EXIT_FAILURE);
     }
 
-    list_vm();
+    format(formats_vm, formatstr, NULL);
+
+    for (i = 0; i < nb_vm; i++)
+        format(formats_vm, formatstr, info + i);
+
+    libxl_vminfo_list_free(info, nb_vm);
+
     return EXIT_SUCCESS;
 }
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




