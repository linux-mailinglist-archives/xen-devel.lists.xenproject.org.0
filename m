Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B1759B8E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566042.884691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAS2-0002jY-3K; Wed, 19 Jul 2023 16:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566042.884691; Wed, 19 Jul 2023 16:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAS2-0002hR-0I; Wed, 19 Jul 2023 16:54:58 +0000
Received: by outflank-mailman (input) for mailman id 566042;
 Wed, 19 Jul 2023 16:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAS1-0002h2-Be
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:54:57 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc26784e-2654-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 18:54:55 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGsiRV034053
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:54:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGsig4034052;
 Wed, 19 Jul 2023 09:54:44 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: fc26784e-2654-11ee-8611-37d641c3527e
Message-Id: <f1672fadcddb007f0f4f817625a5d15362743b3a.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 16:31:34 -0700
Subject: [PATCH 5/7] tools/utils: move XLU_ConfigSetting & xlu__cfg_set_free()
 to libxl_cfg.c
X-Spam-Status: No, score=1.2 required=10.0 tests=DATE_IN_PAST_12_24,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

XLU_ConfigSetting is only used inside libxl_cfg.c, so no need for it in
the internal header.

Similarly, xlu__cfg_set_free() is no longer used outside libxl_cfg.c, so
remove from header and redeclare static.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c      | 10 +++++++++-
 tools/libs/util/libxlu_cfg_i.h    |  1 -
 tools/libs/util/libxlu_internal.h |  8 --------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index b2947cbfc9..2979d775a6 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -25,6 +25,14 @@
 #include "libxlu_cfg_l.h"
 #include "libxlu_cfg_i.h"
 
+typedef struct XLU_ConfigSetting { /* transparent */
+    struct XLU_ConfigSetting *next;
+    char *name;
+    XLU_ConfigValue *value;
+    enum XLU_Operation op;
+    int lineno;
+} XLU_ConfigSetting;
+
 struct XLU_Config {
     XLU_ConfigSetting *settings;
     FILE *report;
@@ -155,7 +163,7 @@ void xlu__cfg_value_free(XLU_ConfigValue *value)
     free(value);
 }
 
-void xlu__cfg_set_free(XLU_ConfigSetting *set) {
+static void xlu__cfg_set_free(XLU_ConfigSetting *set) {
     if (!set) return;
     free(set->name);
     xlu__cfg_value_free(set->value);
diff --git a/tools/libs/util/libxlu_cfg_i.h b/tools/libs/util/libxlu_cfg_i.h
index 3d1e4ed568..7193867422 100644
--- a/tools/libs/util/libxlu_cfg_i.h
+++ b/tools/libs/util/libxlu_cfg_i.h
@@ -26,7 +26,6 @@ enum XLU_Operation {
     XLU_OP_ADDITION,
 };
 
-void xlu__cfg_set_free(XLU_ConfigSetting *set);
 void xlu__cfg_set_store(CfgParseContext*, char *name,
                         enum XLU_Operation op,
                         XLU_ConfigValue *val, int lineno);
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 2ef5eb7f5e..97303391c6 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -49,14 +49,6 @@ struct XLU_ConfigValue {
     YYLTYPE loc;
 };
 
-typedef struct XLU_ConfigSetting { /* transparent */
-    struct XLU_ConfigSetting *next;
-    char *name;
-    XLU_ConfigValue *value;
-    enum XLU_Operation op;
-    int lineno;
-} XLU_ConfigSetting;
-
 typedef struct {
     XLU_Config *cfg;
     int err, lexerrlineno, likely_python;
-- 
2.30.2


