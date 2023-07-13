Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE5759B79
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566017.884680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAPT-000234-MW; Wed, 19 Jul 2023 16:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566017.884680; Wed, 19 Jul 2023 16:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAPT-00020t-Jn; Wed, 19 Jul 2023 16:52:19 +0000
Received: by outflank-mailman (input) for mailman id 566017;
 Wed, 19 Jul 2023 16:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAPS-0001nm-5n
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:52:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9db68d44-2654-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:52:16 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGq7Lk034023
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:52:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGq7Tc034022;
 Wed, 19 Jul 2023 09:52:07 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 9db68d44-2654-11ee-b23a-6b7b168915f2
Message-Id: <075a60a09c7f99e2d51e5cc4d63aa892dcb75f82.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 12 Jul 2023 23:29:59 -0700
Subject: [PATCH 2/7] tools/utils: rename "n" arguments to "key"
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Hopefully make it clearer to others this is the key associated with the
storage value to retrieve.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxlutil.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index fcbe41b15a..0ce66c2096 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -56,24 +56,24 @@ void xlu_cfg_destroy(XLU_Config *cfg);
  *   ERANGE   value out of range (from strtol)
  */
 
-int xlu_cfg_get_string(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_string(const XLU_Config *cfg, const char *key,
                        const char **value_r, int dont_warn);
 /* free/strdup version */
-int xlu_cfg_replace_string(const XLU_Config *cfg, const char *n,
+int xlu_cfg_replace_string(const XLU_Config *cfg, const char *key,
                            char **value_r, int dont_warn);
-int xlu_cfg_get_long(const XLU_Config *cfg, const char *n, long *value_r,
+int xlu_cfg_get_long(const XLU_Config *cfg, const char *key, long *value_r,
                      int dont_warn);
-int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *n, long min,
+int xlu_cfg_get_bounded_long(const XLU_Config *cfg, const char *key, long min,
                              long max, long *value_r, int dont_warn);
-int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_defbool(const XLU_Config *cfg, const char *key,
                         libxl_defbool *value_r, int dont_warn);
 
-int xlu_cfg_get_list(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_list(const XLU_Config *cfg, const char *key,
                      XLU_ConfigList **list_r /* may be 0 */,
                      int *entries_r /* may be 0 */,
                      int dont_warn);
   /* there is no need to free *list_r; lifetime is that of the XLU_Config */
-int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *n,
+int xlu_cfg_get_list_as_string_list(const XLU_Config *cfg, const char *key,
                                     libxl_string_list *sl, int dont_warn);
 const char *xlu_cfg_get_listitem(const XLU_ConfigList *list, int entry);
   /* xlu_cfg_get_listitem cannot fail, except that if entry is
-- 
2.30.2


