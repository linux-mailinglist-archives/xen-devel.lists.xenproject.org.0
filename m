Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48976D977
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575436.901169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNe-0008Ey-4u; Wed, 02 Aug 2023 21:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575436.901169; Wed, 02 Aug 2023 21:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJNd-0008DE-Tp; Wed, 02 Aug 2023 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 575436;
 Wed, 02 Aug 2023 21:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJE7-0001jm-EO
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:17:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08349857-317a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:17:49 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LHc3i008327
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:17:43 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LHcDt008326;
 Wed, 2 Aug 2023 14:17:38 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 08349857-317a-11ee-8613-37d641c3527e
Message-Id: <dd995e0b975d55b905ad6f668bac7cf56992981a.1690990427.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 12 Jul 2023 23:29:59 -0700
Subject: [PATCH 02/22] tools/utils: rename "n" arguments to "key"
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
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




