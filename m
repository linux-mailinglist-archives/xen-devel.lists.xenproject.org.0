Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAEC76D970
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575374.901129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJKq-0006mk-P0; Wed, 02 Aug 2023 21:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575374.901129; Wed, 02 Aug 2023 21:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJKq-0006l1-LR; Wed, 02 Aug 2023 21:24:48 +0000
Received: by outflank-mailman (input) for mailman id 575374;
 Wed, 02 Aug 2023 21:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJKo-00067Z-UA
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:24:46 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffe0de99-317a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:24:45 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LOZ04008420
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:24:41 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LOZN1008419;
 Wed, 2 Aug 2023 14:24:35 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ffe0de99-317a-11ee-8613-37d641c3527e
Message-Id: <e25a056307c43161cdd93bb9aaf6c5073971034f.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 16:31:34 -0700
Subject: [PATCH 10/22] tools/utils: move XLU_ConfigSetting to libxl_cfg.c
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

XLU_ConfigSetting is only used inside libxl_cfg.c, so no need for it in
the internal header.  Keep the type definition in libxlu_internal.h as
the incomplete definition is needed for xlu__cfg_set_free().

There is no longer any need for XLU_ConfigSetting to be transparent.

Fixes: b104c3762d, 1a09c5113a ("libxlu: rework internal representation of setting")
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
@1a09c5113a deeper probing should have been done and figured out
everything needed to move to libxlu_cfg_i.h.  Making use of %code would
have been better, but moving would have been sufficient.

Note: If the decision is made to keep libxlu_cfg.c intact, then the type
definition should be in libxlu_cfg_y.y/libxlu_cfg_y.h.
---
 tools/libs/util/libxlu_cfg.c      | 8 ++++++++
 tools/libs/util/libxlu_internal.h | 8 +-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 20534343f4..2ad58d4240 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -23,6 +23,14 @@
 #include "libxlu_cfg_y.h"
 #include "libxlu_cfg_l.h"
 
+struct XLU_ConfigSetting {
+    struct XLU_ConfigSetting *next;
+    char *name;
+    XLU_ConfigValue *value;
+    enum XLU_Operation op;
+    int lineno;
+};
+
 XLU_Config *xlu_cfg_init(FILE *report, const char *report_source) {
     XLU_Config *cfg;
 
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 246ad0bde7..bf1827ea73 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -49,13 +49,7 @@ struct XLU_ConfigValue {
     XLU__CFG_YYLTYPE loc;
 };
 
-typedef struct XLU_ConfigSetting { /* transparent */
-    struct XLU_ConfigSetting *next;
-    char *name;
-    XLU_ConfigValue *value;
-    enum XLU_Operation op;
-    int lineno;
-} XLU_ConfigSetting;
+typedef struct XLU_ConfigSetting XLU_ConfigSetting;
 
 struct XLU_Config {
     XLU_ConfigSetting *settings;
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




