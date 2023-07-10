Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47BF759B76
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566001.884671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAOv-0001Xs-DT; Wed, 19 Jul 2023 16:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566001.884671; Wed, 19 Jul 2023 16:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAOv-0001V3-9Z; Wed, 19 Jul 2023 16:51:45 +0000
Received: by outflank-mailman (input) for mailman id 566001;
 Wed, 19 Jul 2023 16:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAOu-0001Uv-1b
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:51:44 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 889ccc0f-2654-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 18:51:41 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGpFdc034017
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:51:21 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGpFiH034016;
 Wed, 19 Jul 2023 09:51:15 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 889ccc0f-2654-11ee-8611-37d641c3527e
Message-Id: <8561fa647a637e78b67a5a9f01f6d93d6a1de2cd.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Mon, 10 Jul 2023 15:55:30 -0700
Subject: [PATCH 1/7] tools/utils: cleanup formatting of libxlutil.h
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
 tools/include/libxlutil.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

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
 
-- 
2.30.2


