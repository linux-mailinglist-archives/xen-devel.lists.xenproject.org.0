Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9076D978
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575423.901145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007We-I2; Wed, 02 Aug 2023 21:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575423.901145; Wed, 02 Aug 2023 21:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007Tn-9w; Wed, 02 Aug 2023 21:27:39 +0000
Received: by outflank-mailman (input) for mailman id 575423;
 Wed, 02 Aug 2023 21:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJJ7-0004vP-OS
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:23:01 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1bf85c8-317a-11ee-b263-6b7b168915f2;
 Wed, 02 Aug 2023 23:23:01 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LMpRt008400
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:22:57 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LMphh008399;
 Wed, 2 Aug 2023 14:22:51 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c1bf85c8-317a-11ee-b263-6b7b168915f2
Message-Id: <cdd94e122d92f65b6df668faac3f8d2b25eddb0a.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Sat, 29 Jul 2023 17:03:47 -0700
Subject: [PATCH 08/22] tools/utils: Bison: switch from name-prefix to
 api.prefix
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

bison -Wall declares %name-prefix deprecated.  The suggested replacement
is "api.prefix".  "api.prefix" though effects rather a lot more places
than %name-prefix does.  As a result, rename YYLTYPE/YYSTYPE to match.

As a quick workaround #define YYLTYPE/YYSTYPE to convince flex to
interface correctly.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
According to the documentation api.prefix was introduced in Bison 2.6,
while braces became recommended with Bison 3.0.  This seems sufficiently
in the past to be worth adopting now.

A better workaround for flex is needed.
---
 tools/libs/util/libxlu_cfg.c      |  9 +++++----
 tools/libs/util/libxlu_cfg_y.y    | 13 +++++++++----
 tools/libs/util/libxlu_internal.h |  8 ++++----
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 7e9eec550d..20534343f4 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -388,7 +388,7 @@ const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry) {
 
 
 XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx, char *atom,
-                                    YYLTYPE *loc)
+                                    XLU__CFG_YYLTYPE *loc)
 {
     XLU_ConfigValue *value = NULL;
 
@@ -412,7 +412,7 @@ XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx, char *atom,
 
 XLU_ConfigValue *xlu__cfg_list_mk(CfgParseContext *ctx,
                                   XLU_ConfigValue *val,
-                                  YYLTYPE *loc)
+                                  XLU__CFG_YYLTYPE *loc)
 {
     XLU_ConfigValue *value = NULL;
     XLU_ConfigValue **values = NULL;
@@ -667,13 +667,14 @@ char *xlu__cfgl_dequote(CfgParseContext *ctx, const char *src) {
 }
 
 void xlu__cfgl_lexicalerror(CfgParseContext *ctx, char const *msg) {
-    YYLTYPE loc;
+    XLU__CFG_YYLTYPE loc;
     loc.first_line= xlu__cfg_yyget_lineno(ctx->scanner);
     xlu__cfg_yyerror(&loc, ctx, msg);
     ctx->lexerrlineno= loc.first_line;
 }
 
-void xlu__cfg_yyerror(YYLTYPE *loc, CfgParseContext *ctx, char const *msg) {
+void xlu__cfg_yyerror(XLU__CFG_YYLTYPE *loc, CfgParseContext *ctx,
+        char const *msg) {
     const char *text, *newline;
     int len, lineno;
 
diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index e796066941..adbb74ff11 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -26,10 +26,10 @@ void xlu__cfg_set_store(CfgParseContext*, char *name,
                         enum XLU_Operation op,
                         XLU_ConfigValue *val, int lineno);
 XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx,
-                                    char *atom, YYLTYPE *loc);
+                                    char *atom, XLU__CFG_YYLTYPE *loc);
 XLU_ConfigValue *xlu__cfg_list_mk(CfgParseContext *ctx,
                                   XLU_ConfigValue *val,
-                                  YYLTYPE *loc);
+                                  XLU__CFG_YYLTYPE *loc);
 void xlu__cfg_list_append(CfgParseContext *ctx,
                           XLU_ConfigValue *list,
                           XLU_ConfigValue *val);
@@ -37,10 +37,15 @@ void xlu__cfg_value_free(XLU_ConfigValue *value);
 char *xlu__cfgl_strdup(CfgParseContext*, const char *src);
 char *xlu__cfgl_dequote(CfgParseContext*, const char *src);
 
-void xlu__cfg_yyerror(YYLTYPE *locp, CfgParseContext*, char const *msg);
+void xlu__cfg_yyerror(XLU__CFG_YYLTYPE *locp, CfgParseContext*,
+                      char const *msg);
 void xlu__cfgl_lexicalerror(CfgParseContext*, char const *msg);
 
 void xlu__cfgl_likely_python(CfgParseContext *ctx);
+
+/* issue of name-prefix versus api.prefix and Flex Bison-bridge */
+#define YYLTYPE XLU__CFG_YYLTYPE
+#define YYSTYPE XLU__CFG_YYSTYPE
 }
 
 %{
@@ -58,7 +63,7 @@ void xlu__cfgl_likely_python(CfgParseContext *ctx);
 %define api.pure
 %defines
 %define parse.error verbose
-%name-prefix "xlu__cfg_yy"
+%define api.prefix {xlu__cfg_yy}
 %parse-param { CfgParseContext *ctx }
 %lex-param { ctx_scanner }
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 1f7559ecd9..01fe073069 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -31,14 +31,14 @@ struct XLU_ConfigList {
     XLU_ConfigValue **values;
 };
 
-typedef struct YYLTYPE
+typedef struct XLU__CFG_YYLTYPE
 {
   int first_line;
   int first_column;
   int last_line;
   int last_column;
-} YYLTYPE;
-#define YYLTYPE_IS_DECLARED
+} XLU__CFG_YYLTYPE;
+#define XLU__CFG_YYLTYPE_IS_DECLARED
 
 struct XLU_ConfigValue {
     enum XLU_ConfigValueType type;
@@ -46,7 +46,7 @@ struct XLU_ConfigValue {
         char *string;
         XLU_ConfigList list;
     } u;
-    YYLTYPE loc;
+    XLU__CFG_YYLTYPE loc;
 };
 
 typedef struct XLU_ConfigSetting { /* transparent */
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




