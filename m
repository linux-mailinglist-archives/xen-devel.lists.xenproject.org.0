Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DFD76D986
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575537.901199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJQk-0003Qv-6t; Wed, 02 Aug 2023 21:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575537.901199; Wed, 02 Aug 2023 21:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJQk-0003Or-3w; Wed, 02 Aug 2023 21:30:54 +0000
Received: by outflank-mailman (input) for mailman id 575537;
 Wed, 02 Aug 2023 21:30:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJQi-0003Og-9l
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:30:52 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d971e1d6-317b-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:30:50 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LUerU008520
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:30:46 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LUeMk008519;
 Wed, 2 Aug 2023 14:30:40 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d971e1d6-317b-11ee-8613-37d641c3527e
Message-Id: <829def3bc27e138286677b95d549684b82f864f4.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jul 2023 11:06:06 -0700
Subject: [PATCH 17/22] tools/utils: move setting free loop to
 xlu__cfg_set_free()
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This better breaks layers apart.  xlu_cfg_destroy() now only knows about
the XLU_Config structure, while xlu__cfg_set_free() knows about
XLU_ConfigSetting.

Move declaration of xlu__cfg_set_free() to shared header to indicate it
will bridge layers.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
This is the end of the higher-value series.  Moving the loop is
appropriate whether or not libxlu_cfg.c is split.

Moving the declaration and patches after this though are mostly valuable
for splitting libxlu_cfg.c into reusable and non-reusable portions.
---
 tools/libs/util/libxlu_cfg.c      | 20 ++++++++------------
 tools/libs/util/libxlu_cfg_y.y    |  1 -
 tools/libs/util/libxlu_internal.h |  5 +++++
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 69b95a4ed0..7fec7fe7be 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -178,22 +178,18 @@ void xlu__cfg_value_free(XLU_ConfigValue *value)
 }
 
 void xlu__cfg_set_free(XLU_ConfigSetting *set) {
-    if (!set) return;
-    free(set->name);
-    xlu__cfg_value_free(set->value);
-    free(set);
+    while(set) {
+        XLU_ConfigSetting *next = set->next;
+        free(set->name);
+        xlu__cfg_value_free(set->value);
+        free(set);
+        set = next;
+    }
 }
 
 void xlu_cfg_destroy(XLU_Config *cfg) {
-    XLU_ConfigSetting *set, *set_next;
-
     if (!cfg) return;
-    for (set= cfg->settings;
-         set;
-         set= set_next) {
-        set_next= set->next;
-        xlu__cfg_set_free(set);
-    }
+    xlu__cfg_set_free(cfg->settings);
     free((void *)cfg->config_source);
     free(cfg);
 }
diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index 5dfb06941a..5c7e31222d 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -32,7 +32,6 @@ enum XLU_Operation {
     XLU_OP_ADDITION,
 };
 
-void xlu__cfg_set_free(XLU_ConfigSetting *set);
 void xlu__cfg_set_store(CfgParseContext*, char *name,
                         enum XLU_Operation op,
                         XLU_ConfigValue *val, int lineno);
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 93caf24a6e..cc98efba27 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -35,6 +35,11 @@ typedef struct XLU_ConfigSetting XLU_ConfigSetting;
 extern int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
     __attribute__((__format__(__printf__, 2, 3)));
 
+/*
+ * Internals for file parser *only*, NOT to be used by other parsing/lexing
+ */
+extern void xlu__cfg_set_free(XLU_ConfigSetting *set);
+
 #endif /*LIBXLU_INTERNAL_H*/
 
 /*
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




