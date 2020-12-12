Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD22EA035
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61567.108449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYiE-0001Oj-PS; Mon, 04 Jan 2021 22:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61567.108449; Mon, 04 Jan 2021 22:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYiE-0001OE-LW; Mon, 04 Jan 2021 22:52:30 +0000
Received: by outflank-mailman (input) for mailman id 61567;
 Mon, 04 Jan 2021 22:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYiD-0001O0-SV
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:52:29 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af198cf0-2695-4410-9693-9f57bc21a189;
 Mon, 04 Jan 2021 22:52:29 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqKYE071472
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:52:25 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqKI4071471;
 Mon, 4 Jan 2021 14:52:20 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: af198cf0-2695-4410-9693-9f57bc21a189
Message-Id: <6d58dc4f945abebfab21d46cd52940e984eb8ae6.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 11 Dec 2020 22:18:14 -0800
Subject: [WIP PATCH 11/16] WIP: tools/xl: Replace most of list_domains with use
 of format()
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

With a generalized formatting function now available, start to replace
the old specialized formatting bits.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_list.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index c79b5e041b..10d076864e 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -369,16 +369,18 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
                          bool cpupool, const libxl_dominfo *info, int nb_domain)
 {
     int i;
-    static const char shutdown_reason_letters[]= "-rscwS";
+    const char lead[] = "%-40n %5i %5m %5v     %s  %8.1t";
+
     libxl_bitmap nodemap;
     libxl_physinfo physinfo;
 
     libxl_bitmap_init(&nodemap);
     libxl_physinfo_init(&physinfo);
 
-    printf("Name                                        ID   Mem VCPUs\tState\tTime(s)");
-    if (verbose) printf("   UUID                            Reason-Code\tSecurity Label");
-    if (context && !verbose) printf("   Security Label");
+    format(formats, lead, NULL);
+    if (verbose) {
+        format(formats, " %u %r %16l", NULL);
+    } else if (context) format(formats, " %16l", NULL);
     if (claim) printf("  Claimed");
     if (cpupool) printf("         Cpupool");
     if (numa) {
@@ -396,35 +398,13 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
     }
     printf("\n");
     for (i = 0; i < nb_domain; i++) {
-        char *domname;
-        libxl_shutdown_reason shutdown_reason;
-        domname = libxl_domid_to_name(ctx, info[i].domid);
-        shutdown_reason = info[i].shutdown ? info[i].shutdown_reason : 0;
-        printf("%-40s %5d %5lu %5d     %c%c%c%c%c%c  %8.1f",
-                domname,
-                info[i].domid,
-                (unsigned long) ((info[i].current_memkb +
-                    info[i].outstanding_memkb)/ 1024),
-                info[i].vcpu_online,
-                info[i].running ? 'r' : '-',
-                info[i].blocked ? 'b' : '-',
-                info[i].paused ? 'p' : '-',
-                info[i].shutdown ? 's' : '-',
-                (shutdown_reason >= 0 &&
-                 shutdown_reason < sizeof(shutdown_reason_letters)-1
-                 ? shutdown_reason_letters[shutdown_reason] : '?'),
-                info[i].dying ? 'd' : '-',
-                ((float)info[i].cpu_time / 1e9));
-        free(domname);
-        if (verbose) {
-            printf(" " LIBXL_UUID_FMT, LIBXL_UUID_BYTES(info[i].uuid));
-            if (info[i].shutdown) printf(" %8x", shutdown_reason);
-            else printf(" %8s", "-");
-        }
+        format(formats, lead, info + i);
+        if (verbose)
+            format(formats, " %u %r", info + i);
         if (claim)
             printf(" %5lu", (unsigned long)info[i].outstanding_memkb / 1024);
         if (verbose || context)
-            printf(" %16s", info[i].ssid_label ? : "-");
+            format(formats, " %16l", info + i);
         if (cpupool) {
             char *poolname = libxl_cpupoolid_to_name(ctx, info[i].cpupool);
             printf("%16s", poolname);
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




