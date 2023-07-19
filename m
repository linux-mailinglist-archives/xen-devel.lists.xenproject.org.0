Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B276D98A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575560.901208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJRa-0003zO-F5; Wed, 02 Aug 2023 21:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575560.901208; Wed, 02 Aug 2023 21:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJRa-0003xi-CU; Wed, 02 Aug 2023 21:31:46 +0000
Received: by outflank-mailman (input) for mailman id 575560;
 Wed, 02 Aug 2023 21:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJRZ-0003Og-5O
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:31:45 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f90ad61c-317b-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:31:43 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LVX8K008530
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:31:38 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LVXH9008529;
 Wed, 2 Aug 2023 14:31:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f90ad61c-317b-11ee-8613-37d641c3527e
Message-Id: <88fee0319d859ab9643a735bc3a3038e245afe6d.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 19 Jul 2023 10:31:21 -0700
Subject: [PATCH 18/22] tools/utils: spread xlu_cfg_printf() over libxlu_cfg.c
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

There are far more printf()s inside libxlu_cfg.c, so these had been left
alone briefly.  Now attack all of these.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Note, several messages change mildly.  The message in parse() didn't
previously include the filename.
---
 tools/libs/util/libxlu_cfg.c | 78 ++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 7fec7fe7be..91e056bb33 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -78,8 +78,7 @@ static int ctx_prep(CfgParseContext *ctx, XLU_Config *cfg) {
 
     e= xlu__cfg_yylex_init_extra(ctx, &ctx->scanner);
     if (e) {
-        fprintf(cfg->report,"%s: unable to create scanner: %s\n",
-                cfg->config_source, strerror(e));
+        xlu_cfg_printf(cfg, " unable to create scanner: %s\n", strerror(e));
         return e;
     }
     return 0;
@@ -99,11 +98,12 @@ static void parse(CfgParseContext *ctx) {
     if (r) assert(ctx->err);
 
     if (ctx->err && ctx->likely_python) {
-        fputs(
- "warning: Config file looks like it contains Python code.\n"
- "warning:  Arbitrary Python is no longer supported.\n"
- "warning:  See https://wiki.xen.org/wiki/PythonInXlConfig\n",
-              ctx->cfg->report);
+        xlu_cfg_printf(ctx->cfg,
+ " warning: Config file looks like it contains Python code.\n");
+        xlu_cfg_printf(ctx->cfg,
+ " warning:  Arbitrary Python is no longer supported.\n");
+        xlu_cfg_printf(ctx->cfg,
+ " warning:  See https://wiki.xen.org/wiki/PythonInXlConfig\n");
     }
 }
 
@@ -144,8 +144,7 @@ int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length) {
 
     buf = xlu__cfg_yy_scan_bytes(data, length, ctx.scanner);
     if (!buf) {
-        fprintf(cfg->report,"%s: unable to allocate scanner buffer\n",
-                cfg->config_source);
+        xlu_cfg_printf(cfg, " unable to allocate scanner buffer\n");
         ctx.err= ENOMEM;
         goto xe;
     }
@@ -236,10 +235,10 @@ static int find_atom(const XLU_Config *cfg, const char *n,
 
     if (set->value->type!=XLU_STRING) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: parameter `%s' is"
+            xlu_cfg_printf(cfg,
+                    "%d: warning: parameter `%s' is"
                     " a list but should be a single value\n",
-                    cfg->config_source, set->lineno, n);
+                    set->lineno, n);
         return EINVAL;
     }
     *set_r= set;
@@ -257,10 +256,8 @@ int xlu_cfg_value_get_string(const XLU_Config *cfg, XLU_ConfigValue *value,
 {
     if (value->type != XLU_STRING) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d:%d: warning: value is not a string\n",
-                    cfg->config_source, value->loc.first_line,
-                    value->loc.first_column);
+            xlu_cfg_printf(cfg, "%d:%d: warning: value is not a string\n",
+                    value->loc.first_line, value->loc.first_column);
         *value_r = NULL;
         return EINVAL;
     }
@@ -274,10 +271,8 @@ int xlu_cfg_value_get_list(const XLU_Config *cfg, XLU_ConfigValue *value,
 {
     if (value->type != XLU_LIST) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d:%d: warning: value is not a list\n",
-                    cfg->config_source, value->loc.first_line,
-                    value->loc.first_column);
+            xlu_cfg_printf(cfg, "%d:%d: warning: value is not a list\n",
+                    value->loc.first_line, value->loc.first_column);
         *value_r = NULL;
         return EINVAL;
     }
@@ -325,10 +320,10 @@ int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n,
     e= find_atom(cfg,n,&set,dont_warn);  if (e) return e;
     if (set->op == XLU_OP_ADDITION) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: can't use += with numbers"
+            xlu_cfg_printf(cfg,
+                    "%d: warning: can't use += with numbers"
                     " for parameter `%s'\n",
-                    cfg->config_source, set->lineno, n);
+                    set->lineno, n);
         return EINVAL;
     }
     errno= 0; l= strtol(set->value->u.string, &ep, 0);
@@ -337,31 +332,31 @@ int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n,
         e= errno;
         assert(e==EINVAL || e==ERANGE);
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: parameter `%s' could not be parsed"
+            xlu_cfg_printf(cfg,
+                    "%d: warning: parameter `%s' could not be parsed"
                     " as a number: %s\n",
-                    cfg->config_source, set->lineno, n, strerror(e));
+                    set->lineno, n, strerror(e));
         return e;
     }
     if (*ep || ep==set->value->u.string) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: parameter `%s' is not a valid number\n",
-                    cfg->config_source, set->lineno, n);
+            xlu_cfg_printf(cfg,
+                    "%d: warning: parameter `%s' is not a valid number\n",
+                    set->lineno, n);
         return EINVAL;
     }
     if (l < min) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: value `%ld' is smaller than minimum bound '%ld'\n",
-                    cfg->config_source, set->lineno, l, min);
+            xlu_cfg_printf(cfg,
+                    "%d: warning: value `%ld' is smaller than minimum bound '%ld'\n",
+                    set->lineno, l, min);
         return EINVAL;
     }
     if (l > max) {
         if (!dont_warn)
-            fprintf(cfg->report,
-                    "%s:%d: warning: value `%ld' is greater than maximum bound '%ld'\n",
-                    cfg->config_source, set->lineno, l, max);
+            xlu_cfg_printf(cfg,
+                    "%d: warning: value `%ld' is greater than maximum bound '%ld'\n",
+                    set->lineno, l, max);
         return EINVAL;
     }
 
@@ -393,10 +388,10 @@ int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
     set= find(cfg,n);  if (!set) return ESRCH;
     if (set->value->type!=XLU_LIST) {
         if (!dont_warn) {
-            fprintf(cfg->report,
-                    "%s:%d: warning: parameter `%s' is a single value"
+            xlu_cfg_printf(cfg,
+                    "%d: warning: parameter `%s' is a single value"
                     " but should be a list\n",
-                    cfg->config_source, set->lineno, n);
+                    set->lineno, n);
         }
         return EINVAL;
     }
@@ -743,11 +738,8 @@ void xlu__cfg_yyerror(XLU__CFG_YYLTYPE *loc, CfgParseContext *ctx,
         len--;
     }
 
-    fprintf(ctx->cfg->report,
-            "%s:%d: config parsing error near %s%.*s%s%s: %s\n",
-            ctx->cfg->config_source, lineno,
-            len?"`":"", len, text, len?"'":"", newline,
-            msg);
+    xlu_cfg_printf(ctx->cfg, "%d: config parsing error near %s%.*s%s%s: %s\n",
+            lineno, len?"`":"", len, text, len?"'":"", newline, msg);
     if (!ctx->err) ctx->err= EINVAL;
 }
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




