Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C323F2EA040
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61618.108509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoj-00024V-T2; Mon, 04 Jan 2021 22:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61618.108509; Mon, 04 Jan 2021 22:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoj-00023e-PJ; Mon, 04 Jan 2021 22:59:13 +0000
Received: by outflank-mailman (input) for mailman id 61618;
 Mon, 04 Jan 2021 22:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYid-0000oY-UU
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:55 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b44001d-3b0d-4343-ad88-190b0f2e10c3;
 Mon, 04 Jan 2021 22:52:36 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqR80071482
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:33 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqRWR071481;
 Mon, 4 Jan 2021 14:52:27 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 0b44001d-3b0d-4343-ad88-190b0f2e10c3
Message-Id: <73e9c064c46da42fcd6cf30372049eceb0fc404f.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 12 Dec 2020 20:42:33 -0800
Subject: [WIP PATCH 12/16] WIP: UNTESTED: tools/xl: Replace remaining options
 with format()
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

format() is meant to be a powerful tool, sweep the remaining bits
away.  Unfortunately I am unable to test this portion.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_list.c | 44 ++++++++------------------------------------
 1 file changed, 8 insertions(+), 36 deletions(-)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 10d076864e..ee20d2feee 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -371,56 +371,28 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
     int i;
     const char lead[] = "%-40n %5i %5m %5v     %s  %8.1t";
 
-    libxl_bitmap nodemap;
-    libxl_physinfo physinfo;
-
-    libxl_bitmap_init(&nodemap);
-    libxl_physinfo_init(&physinfo);
-
     format(formats, lead, NULL);
     if (verbose) {
         format(formats, " %u %r %16l", NULL);
     } else if (context) format(formats, " %16l", NULL);
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
+    if (claim) format(formats, " %5c", NULL);
+    if (cpupool) format(formats, " %16p", NULL);
+    if (numa) format(formats, " %A", NULL);
     printf("\n");
     for (i = 0; i < nb_domain; i++) {
         format(formats, lead, info + i);
         if (verbose)
             format(formats, " %u %r", info + i);
         if (claim)
-            printf(" %5lu", (unsigned long)info[i].outstanding_memkb / 1024);
+            format(formats, " %5c", info + i);
         if (verbose || context)
             format(formats, " %16l", info + i);
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
+        if (cpupool)
+            format(formats, " %16p", info + i);
+        if (numa)
+            format(formats, " %A", info + i);
         putchar('\n');
     }
-
-    libxl_bitmap_dispose(&nodemap);
-    libxl_physinfo_dispose(&physinfo);
 }
 
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




