Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924962EA03F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:59:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61608.108483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoi-000217-1q; Mon, 04 Jan 2021 22:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61608.108483; Mon, 04 Jan 2021 22:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYoh-00020i-UQ; Mon, 04 Jan 2021 22:59:11 +0000
Received: by outflank-mailman (input) for mailman id 61608;
 Mon, 04 Jan 2021 22:59:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYjH-0000oY-Vq
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:53:36 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21118051-e2b3-41c1-a8c5-e610e60ebd68;
 Mon, 04 Jan 2021 22:53:05 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MqumN071518
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:53:02 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MqulQ071517;
 Mon, 4 Jan 2021 14:52:56 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 21118051-e2b3-41c1-a8c5-e610e60ebd68
Message-Id: <7335199fc01d8dc6bf524cd764ed8e9107066380.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 19 Dec 2020 23:43:08 -0800
Subject: [WIP PATCH 16/16] WIP: tools/xl: Enhance "vm-list" command
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Add several features to specify output.  Allow omitting potentially
unneeded lines and add argument for exact line format.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl_list.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/xl/xl_list.c b/tools/xl/xl_list.c
index 58809aa10b..ef44466017 100644
--- a/tools/xl/xl_list.c
+++ b/tools/xl/xl_list.c
@@ -500,18 +500,28 @@ int main_list(int argc, char **argv)
 int main_vm_list(int argc, char **argv)
 {
     const char *formatstr = "%u %5i %n\n";
+    bool dom0 = true;
+    bool header = true;
     int opt;
     static const struct option opts[] = {
         {"format", 0, 0, 'F'},
+        {"no-domain0", 0, 0, '0'},
+        {"no-header", 0, 0, 'H'},
     };
 
     libxl_vminfo *info;
     int nb_vm, i;
 
-    SWITCH_FOREACH_OPT(opt, "F:", opts, "vm-list", 0) {
+    SWITCH_FOREACH_OPT(opt, "0F:H", opts, "vm-list", 0) {
+    case '0':
+        dom0 = false;
+        break;
     case 'F':
         formatstr = optarg;
         break;
+    case 'H':
+        header = false;
+        break;
     }
 
     info = libxl_list_vm(ctx, &nb_vm);
@@ -521,10 +531,10 @@ int main_vm_list(int argc, char **argv)
         exit(EXIT_FAILURE);
     }
 
-    format(formats_vm, formatstr, NULL);
+    if (header) format(formats_vm, formatstr, NULL);
 
     for (i = 0; i < nb_vm; i++)
-        format(formats_vm, formatstr, info + i);
+        if (info[i].domid || dom0) format(formats_vm, formatstr, info + i);
 
     libxl_vminfo_list_free(info, nb_vm);
 
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




