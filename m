Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6F759BA2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566092.884730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUO-0004aC-7H; Wed, 19 Jul 2023 16:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566092.884730; Wed, 19 Jul 2023 16:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUO-0004Xk-33; Wed, 19 Jul 2023 16:57:24 +0000
Received: by outflank-mailman (input) for mailman id 566092;
 Wed, 19 Jul 2023 16:57:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMATe-00037w-B5
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:56:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 392a26b5-2655-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:56:37 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGuSsM034084
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:56:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGuSMU034083;
 Wed, 19 Jul 2023 09:56:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 392a26b5-2655-11ee-b23a-6b7b168915f2
Message-Id: <56c1d2d7360945f5507817585c8303ad46072aee.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 23:07:20 -0700
Subject: [PATCH 7/7] tools/utils: move remaining lower-layer data from
 libxlu_internal.h
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_06_12,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Correcting the order of #includes and data type declarations allows the
remaining lower-layer structures to move to libxlu_cfg_i.h.  Now
libxlu_internal.h is purely generalized routines meant to be shared
between all layers.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c      |  2 +-
 tools/libs/util/libxlu_cfg_i.h    | 31 +++++++++++++++++++++++++++++++
 tools/libs/util/libxlu_internal.h | 30 ------------------------------
 3 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 2979d775a6..2913c99478 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -21,9 +21,9 @@
 #include <stdarg.h>
 
 #include "libxlu_internal.h"
+#include "libxlu_cfg_i.h"
 #include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
-#include "libxlu_cfg_i.h"
 
 typedef struct XLU_ConfigSetting { /* transparent */
     struct XLU_ConfigSetting *next;
diff --git a/tools/libs/util/libxlu_cfg_i.h b/tools/libs/util/libxlu_cfg_i.h
index 7193867422..1c6a44b60f 100644
--- a/tools/libs/util/libxlu_cfg_i.h
+++ b/tools/libs/util/libxlu_cfg_i.h
@@ -19,6 +19,37 @@
 #define LIBXLU_CFG_I_H
 
 #include "libxlu_internal.h"
+
+struct XLU_ConfigList {
+    int avalues; /* available slots */
+    int nvalues; /* actual occupied slots */
+    XLU_ConfigValue **values;
+};
+
+typedef struct YYLTYPE
+{
+  int first_line;
+  int first_column;
+  int last_line;
+  int last_column;
+} YYLTYPE;
+#define YYLTYPE_IS_DECLARED
+
+struct XLU_ConfigValue {
+    enum XLU_ConfigValueType type;
+    union {
+        char *string;
+        XLU_ConfigList list;
+    } u;
+    YYLTYPE loc;
+};
+
+typedef struct {
+    XLU_Config *cfg;
+    int err, lexerrlineno, likely_python;
+    void *scanner;
+} CfgParseContext;
+
 #include "libxlu_cfg_y.h"
 
 enum XLU_Operation {
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 97303391c6..7cbb2e632d 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -25,36 +25,6 @@
 
 #include "libxlutil.h"
 
-struct XLU_ConfigList {
-    int avalues; /* available slots */
-    int nvalues; /* actual occupied slots */
-    XLU_ConfigValue **values;
-};
-
-typedef struct YYLTYPE
-{
-  int first_line;
-  int first_column;
-  int last_line;
-  int last_column;
-} YYLTYPE;
-#define YYLTYPE_IS_DECLARED
-
-struct XLU_ConfigValue {
-    enum XLU_ConfigValueType type;
-    union {
-        char *string;
-        XLU_ConfigList list;
-    } u;
-    YYLTYPE loc;
-};
-
-typedef struct {
-    XLU_Config *cfg;
-    int err, lexerrlineno, likely_python;
-    void *scanner;
-} CfgParseContext;
-
 
 #define STRINGIFY(x) #x
 #define TOSTRING(x) STRINGIFY(x)
-- 
2.30.2


