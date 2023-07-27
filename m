Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266D176D96A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575359.901119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJK0-0006AR-BL; Wed, 02 Aug 2023 21:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575359.901119; Wed, 02 Aug 2023 21:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJK0-00067t-8R; Wed, 02 Aug 2023 21:23:56 +0000
Received: by outflank-mailman (input) for mailman id 575359;
 Wed, 02 Aug 2023 21:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJJz-00067Z-5k
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:23:55 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0e72bc8-317a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:23:53 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LNhnU008407
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:23:49 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LNhDC008406;
 Wed, 2 Aug 2023 14:23:43 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e0e72bc8-317a-11ee-8613-37d641c3527e
Message-Id: <58041bfb2a8ce9a54a337a2293c5094c119f7390.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 26 Jul 2023 21:56:32 -0700
Subject: [PATCH 09/22] tools/utils: move CfgParseContext to top of
 libxlu_cfg_y.y
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

The CfgParseContext structure/typedef is used inside the parser.  Whereas
most #include's of libxlu_internal.h need the common declarations, not
the parser internals.  Due to this, the structure should be near the top
of libxlu_cfg_y.h (libxlu_cfg_i.h @b104c3762d), and not towards the
middle of libxlu_internal.h.

Fixes: b104c3762d ('Replace config file parser for "xl"')
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Ideally at @b104c3762d Bison might already have implemented its %code
feature.  Less ideal, but workable CfgParseContext should have been
placed in libxlu_cfg_i.h, between the two #includes:
 #include "libxlu_internal.h"
 typedef struct { } CfgParseContext;
 #include "libxlu_cfg_y.h"

Using Bison's %code feature is rather superior though.  This patch is
where indentation in Bison.y files becomes crucial.  I'm unsure of the
call to make, so I've left this as cut&paste which means this will almost
certainly change.
---
 tools/libs/util/libxlu_cfg_y.y    | 6 ++++++
 tools/libs/util/libxlu_internal.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
index adbb74ff11..75e7140478 100644
--- a/tools/libs/util/libxlu_cfg_y.y
+++ b/tools/libs/util/libxlu_cfg_y.y
@@ -18,6 +18,12 @@
 
 %code requires {
 #include "libxlu_internal.h"
+
+typedef struct {
+    XLU_Config *cfg;
+    int err, lexerrlineno, likely_python;
+    void *scanner;
+} CfgParseContext;
 }
 
 %code provides {
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 01fe073069..246ad0bde7 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -63,12 +63,6 @@ struct XLU_Config {
     char *config_source;
 };
 
-typedef struct {
-    XLU_Config *cfg;
-    int err, lexerrlineno, likely_python;
-    void *scanner;
-} CfgParseContext;
-
 
 #define STRINGIFY(x) #x
 #define TOSTRING(x) STRINGIFY(x)
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




