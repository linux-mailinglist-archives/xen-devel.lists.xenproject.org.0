Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037976D9AD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575646.901258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXJ-0006la-3v; Wed, 02 Aug 2023 21:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575646.901258; Wed, 02 Aug 2023 21:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXJ-0006ko-0Z; Wed, 02 Aug 2023 21:37:41 +0000
Received: by outflank-mailman (input) for mailman id 575646;
 Wed, 02 Aug 2023 21:37:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJSQ-0003Og-JX
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:32:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18eeff17-317c-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:32:36 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LWPL5008540
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:32:31 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LWPo4008539;
 Wed, 2 Aug 2023 14:32:25 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 18eeff17-317c-11ee-8613-37d641c3527e
Message-Id: <6452c9eae533fbed7e156f71f53045fe7438174b.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 26 Jul 2023 14:22:14 -0700
Subject: [PATCH 19/22] tools/utils: add pointer to in-progress settings to
 CfgParseContext
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Rather than needing the full structure, for many operations the settings
pointer is enough.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c   | 13 ++++++++-----
 tools/libs/util/libxlu_cfg_y.y |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 91e056bb33..3c0703f9df 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -67,10 +67,13 @@ XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     return cfg;
 }
 
-static int ctx_prep(CfgParseContext *ctx, XLU_Config *cfg) {
+static int ctx_prep(CfgParseContext *ctx, XLU_Config *cfg,
+    XLU_ConfigSetting **psettings)
+{
     int e;
 
     ctx->cfg= cfg;
+    ctx->psettings = psettings;
     ctx->err= 0;
     ctx->lexerrlineno= -1;
     ctx->likely_python= 0;
@@ -112,7 +115,7 @@ int xlu_cfg_readfile(XLU_Config *cfg, const char *real_filename) {
     int e;
 
     CfgParseContext ctx;
-    e = ctx_prep(&ctx, cfg);
+    e = ctx_prep(&ctx, cfg, &cfg->settings);
     if (e) { ctx.err= e; goto xe; }
 
     f= fopen(real_filename, "r");
@@ -139,7 +142,7 @@ int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length) {
     YY_BUFFER_STATE buf= 0;
 
     CfgParseContext ctx;
-    e= ctx_prep(&ctx, cfg);
+    e = ctx_prep(&ctx, cfg, &cfg->settings);
     if (e) { ctx.err= e; goto xe; }
 
     buf = xlu__cfg_yy_scan_bytes(data, length, ctx.scanner);
@@ -619,8 +622,8 @@ void xlu__cfg_set_store(CfgParseContext *ctx, char *name,
     set->value = val;
     set->op = op;
     set->lineno= lineno;
-    set->next= ctx->cfg->settings;
-    ctx->cfg->settings= set;
+    set->next = *ctx->psettings;
+    *ctx->psettings = set;
     return;
 out:
     assert(ctx->err);
diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index 5c7e31222d..5bd4cbb0ab 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -21,6 +21,7 @@
 
 typedef struct {
     XLU_Config *cfg;
+    XLU_ConfigSetting **psettings;
     int err, lexerrlineno, likely_python;
     void *scanner;
 } CfgParseContext;
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




