Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B676D950
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575263.901065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJDL-0002N9-NY; Wed, 02 Aug 2023 21:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575263.901065; Wed, 02 Aug 2023 21:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJDL-0002KO-K3; Wed, 02 Aug 2023 21:17:03 +0000
Received: by outflank-mailman (input) for mailman id 575263;
 Wed, 02 Aug 2023 21:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJDK-0001jm-97
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:17:02 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eab11be8-3179-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:17:00 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LGkRh008303
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:16:51 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LGkHC008302;
 Wed, 2 Aug 2023 14:16:46 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: eab11be8-3179-11ee-8613-37d641c3527e
Message-Id: <81a887863224ef22b8d582129fc3cbda596c7880.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Mon, 10 Jul 2023 15:55:30 -0700
Subject: [PATCH 01/22] tools/utils: cleanup formatting of libxlutil.h
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Some arguments included a name, but not all did.  Now use "cfg" for
all uses of XLU_Config * and "list" for uses of XLU_ConfigList *.

Also fix some spaces missing from xlu_cfg_get_defbool()'s prototype.

Rename the "b" argument of xlu_cfg_get_defbool() to "value_r".  Similar
to other functions this is where the returned value is stored.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxlutil.h    | 22 +++++++++++-----------
 tools/libs/util/libxlu_cfg.c |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 4dd3c5e92b..fcbe41b15a 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -40,12 +40,12 @@ XLU_Config *xlu_cfg_init(FILE *report, const char *report_filename);
   /* report_filename is copied; report is saved and must remain valid
    *  until the Config is destroyed. */
 
-int xlu_cfg_readfile(XLU_Config*, const char *real_filename);
-int xlu_cfg_readdata(XLU_Config*, const char *data, int length);
+int xlu_cfg_readfile(XLU_Config *cfg, const char *real_filename);
+int xlu_cfg_readdata(XLU_Config *cfg, const char *data, int length);
   /* If these fail, then it is undefined behaviour to call xlu_cfg_get_...
    * functions.  You have to just xlu_cfg_destroy. */
 
-void xlu_cfg_destroy(XLU_Config*);
+void xlu_cfg_destroy(XLU_Config *cfg);
 
 
 /* All of the following print warnings to "report" if there is a problem.
@@ -56,26 +56,26 @@ void xlu_cfg_destroy(XLU_Config*);
  *   ERANGE   value out of range (from strtol)
  */
 
-int xlu_cfg_get_string(const XLU_Config*, const char *n, const char **value_r,
-                       int dont_warn);
+int xlu_cfg_get_string(const XLU_Config *cfg, const char *n,
+                       const char **value_r, int dont_warn);
 /* free/strdup version */
 int xlu_cfg_replace_string(const XLU_Config *cfg, const char *n,
                            char **value_r, int dont_warn);
-int xlu_cfg_get_long(const XLU_Config*, const char *n, long *value_r,
+int xlu_cfg_get_long(const XLU_Config *cfg, const char *n, long *value_r,
                      int dont_warn);
-int xlu_cfg_get_bounded_long(const XLU_Config*, const char *n, long min,
+int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n, long min,
                              long max, long *value_r, int dont_warn);
-int xlu_cfg_get_defbool(const XLU_Config*, const char *n, libxl_defbool *b,
-                     int dont_warn);
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+                        libxl_defbool *value_r, int dont_warn);
 
-int xlu_cfg_get_list(const XLU_Config*, const char *n,
+int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
                      XLU_ConfigList **list_r /* may be 0 */,
                      int *entries_r /* may be 0 */,
                      int dont_warn);
   /* there is no need to free *list_r; lifetime is that of the XLU_Config */
 int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *n,
                                     libxl_string_list *sl, int dont_warn);
-const char *xlu_cfg_get_listitem(const XLU_ConfigList*, int entry);
+const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry);
   /* xlu_cfg_get_listitem cannot fail, except that if entry is
    * out of range it returns 0 (not setting errno) */
 
diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index 874f5abfb9..87ac8c4b41 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -328,15 +328,15 @@ int xlu_cfg_get_long(const XLU_Config *cfg, const char *n,
                                     dont_warn);
 }
 
-int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n, libxl_defbool *b,
-                     int dont_warn)
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+                        libxl_defbool *value_r, int dont_warn)
 {
     int ret;
     long l;
 
     ret = xlu_cfg_get_long(cfg, n, &l, dont_warn);
     if (ret) return ret;
-    libxl_defbool_set(b, !!l);
+    libxl_defbool_set(value_r, !!l);
     return 0;
 }
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




