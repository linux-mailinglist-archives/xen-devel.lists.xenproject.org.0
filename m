Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4676D97A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575426.901150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007er-Oa; Wed, 02 Aug 2023 21:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575426.901150; Wed, 02 Aug 2023 21:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNb-0007WQ-Jt; Wed, 02 Aug 2023 21:27:39 +0000
Received: by outflank-mailman (input) for mailman id 575426;
 Wed, 02 Aug 2023 21:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJLe-0004vP-1G
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:25:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ef7b072-317b-11ee-b263-6b7b168915f2;
 Wed, 02 Aug 2023 23:25:37 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LPSkE008432
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:25:33 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LPS4R008431;
 Wed, 2 Aug 2023 14:25:28 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1ef7b072-317b-11ee-b263-6b7b168915f2
Message-Id: <22cd5f8f7d7d7c54a1a02a36bcd32c88632c6dbb.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 23:07:20 -0700
Subject: [PATCH 11/22] tools/utils: move XLU_ConfigValue to libxl_cfg.c
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

At no point was the complete type for XLU_ConfigValue used anywhere
besides libxlu_cfg.c, overdue for a move.

Fixes: 1a09c5113a ("libxlu: rework internal representation of setting")
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c      | 9 +++++++++
 tools/libs/util/libxlu_internal.h | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 2ad58d4240..d3b5c86ed6 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -31,6 +31,15 @@ struct XLU_ConfigSetting {
     int lineno;
 };
 
+struct XLU_ConfigValue {
+    enum XLU_ConfigValueType type;
+    union {
+        char *string;
+        XLU_ConfigList list;
+    } u;
+    XLU__CFG_YYLTYPE loc;
+};
+
 XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     XLU_Config *cfg;
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index bf1827ea73..1a9d25e14e 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -40,15 +40,6 @@ typedef struct XLU__CFG_YYLTYPE
 } XLU__CFG_YYLTYPE;
 #define XLU__CFG_YYLTYPE_IS_DECLARED
 
-struct XLU_ConfigValue {
-    enum XLU_ConfigValueType type;
-    union {
-        char *string;
-        XLU_ConfigList list;
-    } u;
-    XLU__CFG_YYLTYPE loc;
-};
-
 typedef struct XLU_ConfigSetting XLU_ConfigSetting;
 
 struct XLU_Config {
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




