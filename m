Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9376D982
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575503.901188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJP2-0001rG-NO; Wed, 02 Aug 2023 21:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575503.901188; Wed, 02 Aug 2023 21:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJP2-0001pH-KW; Wed, 02 Aug 2023 21:29:08 +0000
Received: by outflank-mailman (input) for mailman id 575503;
 Wed, 02 Aug 2023 21:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJP2-0001nP-0O
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:29:08 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7a40ad-317b-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:29:06 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LSusM008502
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:29:02 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LSusJ008501;
 Wed, 2 Aug 2023 14:28:56 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 9b7a40ad-317b-11ee-8613-37d641c3527e
Message-Id: <e685f7dd1464953fe59dfa29115cfac669e00df0.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Thu, 13 Jul 2023 19:01:19 -0700
Subject: [PATCH 15/22] tools/utils: move XLU_Config to libxlu_cfg.c
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Only the lowest layer of configuration handling looks inside XLU_Config.
As such the structure can move to this header instead of the shared
header.

Mark ->config_source as constant.  Most places it truly is constant, only
the free() violates the constant.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
This could also move to libxlu_cfg_y.h and make preserving messages
easier while allowing libxlu_cfg.c to split.
---
 tools/libs/util/libxlu_cfg.c      | 8 +++++++-
 tools/libs/util/libxlu_internal.h | 6 ------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index e37f84829f..69b95a4ed0 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -47,6 +47,12 @@ struct XLU_ConfigValue {
     XLU__CFG_YYLTYPE loc;
 };
 
+struct XLU_Config {
+    XLU_ConfigSetting *settings;
+    FILE *report;
+    const char *config_source;
+};
+
 XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     XLU_Config *cfg;
 
@@ -188,7 +194,7 @@ void xlu_cfg_destroy(XLU_Config *cfg) {
         set_next= set->next;
         xlu__cfg_set_free(set);
     }
-    free(cfg->config_source);
+    free((void *)cfg->config_source);
     free(cfg);
 }
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 214ebe5f48..93caf24a6e 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -27,12 +27,6 @@
 
 typedef struct XLU_ConfigSetting XLU_ConfigSetting;
 
-struct XLU_Config {
-    XLU_ConfigSetting *settings;
-    FILE *report;
-    char *config_source;
-};
-
 
 #define STRINGIFY(x) #x
 #define TOSTRING(x) STRINGIFY(x)
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




