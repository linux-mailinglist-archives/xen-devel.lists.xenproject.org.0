Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46476D967
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575335.901105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJIJ-0005XB-Ux; Wed, 02 Aug 2023 21:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575335.901105; Wed, 02 Aug 2023 21:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJIJ-0005Ue-S4; Wed, 02 Aug 2023 21:22:11 +0000
Received: by outflank-mailman (input) for mailman id 575335;
 Wed, 02 Aug 2023 21:22:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJII-0005Ie-Kh
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:22:10 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2aa3667-317a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:22:08 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LLxep008383
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:22:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LLx0F008382;
 Wed, 2 Aug 2023 14:21:59 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: a2aa3667-317a-11ee-8613-37d641c3527e
Message-Id: <39785555d883fa43b03423e68964bd21f92e791a.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Fri, 28 Jul 2023 12:10:14 -0700
Subject: [PATCH 07/22] tools/utils: merge contents of libxlu_cfg_i.h to
 libxlu_cfg_y.y
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Bison has added the ability to emit declarations in its header.  As such
everything can instead be dumped in Bison's header instead of having a
private one.

This resolves the mixed up situation with the libxlu headers.  Problem is
libxlu_cfg_i.h was trying to function as a wrapper for libxlu_cfg_y.h.
Issue is libxlu_cfg.c's #include order didn't match and thus everything
was fragile.

Fixes: b104c3762d ('Replace config file parser for "xl"')
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
The bug @b104c3762d was the incorrect ordering of #includes in
libxlu_cfg.c.  It should instead have been:
 #include "libxlu_cfg_i.h"
 #include "libxlu_cfg_l.h"

Had this bug not been present, later commits might have looked deeper and
chosen correct solutions.  Instead this resulted in all the ripples which
this series fixes.

I'm unsure whether Bison had implemented the %code feature by this point
in time.

The one and a half remaining issues are whether to convert the %{ %}
section to %code and move it after the %union.  The %union construct ends
up in libxlu_cfg_y.h, whereas the %{ %}/%code construct ends up in
libxlu_cfg_y.c.
---
 tools/libs/util/libxlu_cfg.c   |  1 -
 tools/libs/util/libxlu_cfg_i.h | 53 ----------------------------------
 tools/libs/util/libxlu_cfg_l.l |  2 +-
 tools/libs/util/libxlu_cfg_y.y | 29 ++++++++++++++++++-
 4 files changed, 29 insertions(+), 56 deletions(-)
 delete mode 100644 tools/libs/util/libxlu_cfg_i.h

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 87ac8c4b41..7e9eec550d 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -22,7 +22,6 @@
 #include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
-#include "libxlu_cfg_i.h"
 
 XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     XLU_Config *cfg;
diff --git a/tools/libs/util/libxlu_cfg_i.h b/tools/libs/util/libxlu_cfg_i.h
deleted file mode 100644
index 3717b9460c..0000000000
--- a/tools/libs/util/libxlu_cfg_i.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * libxlu_cfg_i.h - xl configuration file parsing: parser-internal declarations
- *
- * Copyright (C) 2010      Citrix Ltd.
- * Author Ian Jackson <ian.jackson@eu.citrix.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License as published
- * by the Free Software Foundation; version 2.1 only. with the special
- * exception on linking described in file LICENSE.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU Lesser General Public License for more details.
- */
-
-#ifndef LIBXLU_CFG_I_H
-#define LIBXLU_CFG_I_H
-
-#include "libxlu_internal.h"
-#include "libxlu_cfg_y.h"
-
-void xlu__cfg_set_free(XLU_ConfigSetting *set);
-void xlu__cfg_set_store(CfgParseContext*, char *name,
-                        enum XLU_Operation op,
-                        XLU_ConfigValue *val, int lineno);
-XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx,
-                                    char *atom, YYLTYPE *loc);
-XLU_ConfigValue *xlu__cfg_list_mk(CfgParseContext *ctx,
-                                  XLU_ConfigValue *val,
-                                  YYLTYPE *loc);
-void xlu__cfg_list_append(CfgParseContext *ctx,
-                          XLU_ConfigValue *list,
-                          XLU_ConfigValue *val);
-void xlu__cfg_value_free(XLU_ConfigValue *value);
-char *xlu__cfgl_strdup(CfgParseContext*, const char *src);
-char *xlu__cfgl_dequote(CfgParseContext*, const char *src);
-
-void xlu__cfg_yyerror(YYLTYPE *locp, CfgParseContext*, char const *msg);
-void xlu__cfgl_lexicalerror(CfgParseContext*, char const *msg);
-
-void xlu__cfgl_likely_python(CfgParseContext *ctx);
-
-#endif /*LIBXLU_CFG_I_H*/
-
-/*
- * Local variables:
- * mode: C
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/tools/libs/util/libxlu_cfg_l.l b/tools/libs/util/libxlu_cfg_l.l
index 390d6e2c2b..ba023fd679 100644
--- a/tools/libs/util/libxlu_cfg_l.l
+++ b/tools/libs/util/libxlu_cfg_l.l
@@ -17,7 +17,7 @@
  */
 
 %{
-#include "libxlu_cfg_i.h"
+#include "libxlu_cfg_y.h"
 
 #define ctx ((CfgParseContext*)yyextra)
 #define YY_NO_INPUT
diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index e53d8ed337..e796066941 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -16,9 +16,36 @@
  * GNU Lesser General Public License for more details.
  */
 
+%code requires {
+#include "libxlu_internal.h"
+}
+
+%code provides {
+void xlu__cfg_set_free(XLU_ConfigSetting *set);
+void xlu__cfg_set_store(CfgParseContext*, char *name,
+                        enum XLU_Operation op,
+                        XLU_ConfigValue *val, int lineno);
+XLU_ConfigValue *xlu__cfg_string_mk(CfgParseContext *ctx,
+                                    char *atom, YYLTYPE *loc);
+XLU_ConfigValue *xlu__cfg_list_mk(CfgParseContext *ctx,
+                                  XLU_ConfigValue *val,
+                                  YYLTYPE *loc);
+void xlu__cfg_list_append(CfgParseContext *ctx,
+                          XLU_ConfigValue *list,
+                          XLU_ConfigValue *val);
+void xlu__cfg_value_free(XLU_ConfigValue *value);
+char *xlu__cfgl_strdup(CfgParseContext*, const char *src);
+char *xlu__cfgl_dequote(CfgParseContext*, const char *src);
+
+void xlu__cfg_yyerror(YYLTYPE *locp, CfgParseContext*, char const *msg);
+void xlu__cfgl_lexicalerror(CfgParseContext*, char const *msg);
+
+void xlu__cfgl_likely_python(CfgParseContext *ctx);
+}
+
 %{
 #define ctx_scanner ctx->scanner
-#include "libxlu_cfg_i.h"
+#include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
 %}
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




