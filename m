Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCE2EA03C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61619.108521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYon-0002Az-Aa; Mon, 04 Jan 2021 22:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61619.108521; Mon, 04 Jan 2021 22:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYon-00029c-38; Mon, 04 Jan 2021 22:59:17 +0000
Received: by outflank-mailman (input) for mailman id 61619;
 Mon, 04 Jan 2021 22:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYii-0000oY-W7
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:53:01 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b7b0775-55e0-45be-b93d-4e1b891f2ea5;
 Mon, 04 Jan 2021 22:52:43 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqYZX071498
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:40 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqY8L071497;
 Mon, 4 Jan 2021 14:52:34 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0b7b0775-55e0-45be-b93d-4e1b891f2ea5
Message-Id: <42879b23f2c27ca89cda333b829488f33f3659ef.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 12 Dec 2020 21:14:26 -0800
Subject: [WIP PATCH 13/16] WIP: tools/xl: Purge list_domains()
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Everything previously done by list_domains() is now done with
build_list_domain_format() and format().

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_list.c | 90 +++++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 37 deletions(-)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index ee20d2feee..3ed6da8feb 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -342,6 +342,31 @@ const format_table_t formats = {
                    (int *)&_discard->domid - (int *)_discard, {.i = 0}},
 };
 
+static char *build_list_domain_format(bool verbose, bool context, bool claim,
+                         bool numa, bool cpupool)
+{
+    int size = 4096;
+    char *fmt = malloc(size);
+    const char lead[] = "%-40n %5i %5m %5v     %s  %8.1t";
+
+    if (!fmt) return NULL;
+
+    memcpy(fmt, lead, sizeof(lead));
+
+    if (verbose) strcat(fmt, " %u %r %16l");
+    else if (context) strcat(fmt, " %16l");
+
+    if (claim) strcat(fmt, " %5c");
+
+    if (cpupool) strcat(fmt, " %16p");
+
+    if (numa) strcat(fmt, " %A");
+
+    strcat(fmt, "\n");
+
+    return realloc(fmt, strlen(fmt) + 1);
+}
+
 
 static void list_vm(void)
 {
@@ -365,36 +390,6 @@ static void list_vm(void)
     libxl_vminfo_list_free(info, nb_vm);
 }
 
-static void list_domains(bool verbose, bool context, bool claim, bool numa,
-                         bool cpupool, const libxl_dominfo *info, int nb_domain)
-{
-    int i;
-    const char lead[] = "%-40n %5i %5m %5v     %s  %8.1t";
-
-    format(formats, lead, NULL);
-    if (verbose) {
-        format(formats, " %u %r %16l", NULL);
-    } else if (context) format(formats, " %16l", NULL);
-    if (claim) format(formats, " %5c", NULL);
-    if (cpupool) format(formats, " %16p", NULL);
-    if (numa) format(formats, " %A", NULL);
-    printf("\n");
-    for (i = 0; i < nb_domain; i++) {
-        format(formats, lead, info + i);
-        if (verbose)
-            format(formats, " %u %r", info + i);
-        if (claim)
-            format(formats, " %5c", info + i);
-        if (verbose || context)
-            format(formats, " %16l", info + i);
-        if (cpupool)
-            format(formats, " %16p", info + i);
-        if (numa)
-            format(formats, " %A", info + i);
-        putchar('\n');
-    }
-}
-
 
 int main_list(int argc, char **argv)
 {
@@ -470,7 +465,17 @@ int main_list(int argc, char **argv)
 
     if (details)
         dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
-    else if (formatstr) {
+    else {
+        char *fr = NULL;
+
+        if (!formatstr) formatstr = fr = build_list_domain_format(verbose,
+                    context, false /* claim */, numa, cpupool);
+
+        if (!formatstr) {
+            fprintf(stderr, "Memory allocation failure.\n");
+            return EXIT_FAILURE;
+        }
+
         format(formats, formatstr, NULL);
 
         while (nb_domain) {
@@ -478,9 +483,9 @@ int main_list(int argc, char **argv)
             ++info;
             --nb_domain;
         }
-    } else
-        list_domains(verbose, context, false /* claim */, numa, cpupool,
-                     info, nb_domain);
+
+        if (fr) free(fr);
+    }
 
     if (info_free)
         libxl_dominfo_list_free(info_free, nb_domain);
@@ -506,7 +511,8 @@ int main_claims(int argc, char **argv)
 {
     libxl_dominfo *info;
     int opt;
-    int nb_domain;
+    int nb_domain, i;
+    char *fmt;
 
     SWITCH_FOREACH_OPT(opt, "", NULL, "claims", 0) {
         /* No options */
@@ -521,9 +527,19 @@ int main_claims(int argc, char **argv)
         return 1;
     }
 
-    list_domains(false /* verbose */, false /* context */, true /* claim */,
-                 false /* numa */, false /* cpupool */, info, nb_domain);
+    fmt = build_list_domain_format(false /* verbose */, false /* context */,
+                 true /* claim */, false /* numa */, false /* cpupool */);
+
+    if (!fmt) {
+        fprintf(stderr, "Memory allocation failure.\n");
+        return 1;
+    }
+
+    format(formats, fmt, NULL);
+
+    for (i = 0; i < nb_domain; ++i) format(formats, fmt, info + i);
 
+    free(fmt);
     libxl_dominfo_list_free(info, nb_domain);
     return 0;
 }
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




