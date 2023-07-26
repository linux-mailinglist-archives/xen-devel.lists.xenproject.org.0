Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3076D9B0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575692.901288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXR-0007oU-VN; Wed, 02 Aug 2023 21:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575692.901288; Wed, 02 Aug 2023 21:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXR-0007kW-Qj; Wed, 02 Aug 2023 21:37:49 +0000
Received: by outflank-mailman (input) for mailman id 575692;
 Wed, 02 Aug 2023 21:37:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJTE-0003Og-So
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:33:28 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f5476d-317c-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:33:27 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LXHYp008558
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:33:23 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LXHcA008557;
 Wed, 2 Aug 2023 14:33:17 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 36f5476d-317c-11ee-8613-37d641c3527e
Message-Id: <52d5a8411767aa17ce0db845471ad38dd49f6594.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jul 2023 20:26:48 -0700
Subject: [PATCH 20/22] tools/utils: add wrapper for readfile()/readdata()
 functions
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

These functions needs to cross the boundary between core and lower-layer.
As such split them in two.  Pass most of the values from XLU_Config as
they can be used by the lower-layer.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c      | 47 ++++++++++++++++++++++---------
 tools/libs/util/libxlu_internal.h |  6 ++++
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 3c0703f9df..cb99b0aab0 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -110,39 +110,58 @@ static void parse(CfgParseContext *ctx) {
     }
 }
 
-int xlu_cfg_readfile(XLU_Config *cfg, const char *real_filename) {
-    FILE *f = 0;
+int xlu_cfg_readfile(XLU_Config *cfg, const char *name)
+{
+    FILE *file;
+    int ret;
+
+    file = fopen(name, "r");
+    if (file) {
+        ret = xlu__cfg_readfile(cfg, cfg->report, cfg->config_source,
+            &cfg->settings, file, name);
+        fclose(file);
+    } else {
+        ret = errno;
+        fprintf(cfg->report,"%s: unable to open configuration file: %s\n",
+                name, strerror(ret));
+    }
+
+    return ret;
+}
+
+int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
+    XLU_ConfigSetting **psettings, FILE *f, const char *name)
+{
     int e;
 
     CfgParseContext ctx;
-    e = ctx_prep(&ctx, cfg, &cfg->settings);
+    e = ctx_prep(&ctx, cfg, psettings);
     if (e) { ctx.err= e; goto xe; }
 
-    f= fopen(real_filename, "r");
-    if (!f) {
-        ctx.err = errno;
-        fprintf(cfg->report,"%s: unable to open configuration file: %s\n",
-                real_filename, strerror(e));
-        goto xe;
-    }
-
     xlu__cfg_yyrestart(f, ctx.scanner);
 
     parse(&ctx);
 
  xe:
     ctx_dispose(&ctx);
-    if (f) fclose(f);
 
     return ctx.err;
 }
 
-int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length) {
+int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length)
+{
+    return xlu__cfg_readdata(cfg, cfg->report, cfg->config_source,
+        &cfg->settings, data, length);
+}
+
+int xlu__cfg_readdata(XLU_Config *cfg, FILE *msgfile, const char *msgprefix,
+    XLU_ConfigSetting **psettings, const char *data, int length)
+{
     int e;
     YY_BUFFER_STATE buf= 0;
 
     CfgParseContext ctx;
-    e = ctx_prep(&ctx, cfg, &cfg->settings);
+    e = ctx_prep(&ctx, cfg, psettings);
     if (e) { ctx.err= e; goto xe; }
 
     buf = xlu__cfg_yy_scan_bytes(data, length, ctx.scanner);
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index cc98efba27..34c6c7a443 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -39,6 +39,12 @@ extern int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
  * Internals for file parser *only*, NOT to be used by other parsing/lexing
  */
 extern void xlu__cfg_set_free(XLU_ConfigSetting *set);
+extern int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile,
+    const char *msgprefix, XLU_ConfigSetting **psettings, FILE *file,
+    const char *name);
+extern int xlu__cfg_readdata(XLU_Config *cfg, FILE *msgfile,
+    const char *msgprefix, XLU_ConfigSetting **psettings, const char *data,
+    int length);
 
 #endif /*LIBXLU_INTERNAL_H*/
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




