Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A65F76D9AB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575603.901239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJX0-0005r1-Ks; Wed, 02 Aug 2023 21:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575603.901239; Wed, 02 Aug 2023 21:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJX0-0005nq-I8; Wed, 02 Aug 2023 21:37:22 +0000
Received: by outflank-mailman (input) for mailman id 575603;
 Wed, 02 Aug 2023 21:37:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJU4-0003Og-Oi
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:34:20 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55ed6a32-317c-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 23:34:19 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LY9lp008578
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:34:15 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LY9Dr008577;
 Wed, 2 Aug 2023 14:34:09 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 55ed6a32-317c-11ee-8613-37d641c3527e
Message-Id: <d1e5795e274571a63b94148a7d371c629eefb3a5.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 25 Jul 2023 20:11:06 -0700
Subject: [PATCH 21/22] tools/utils: add settings get function
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

The better to isolate the shared portion of the interface from the
low-level implementation.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_cfg.c      | 7 ++++++-
 tools/libs/util/libxlu_internal.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index cb99b0aab0..7bbedde8f6 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -240,7 +240,7 @@ int xlu_cfg_printf(const XLU_Config *cfg, const char *format, ...)
 static XLU_ConfigSetting *find(const XLU_Config *cfg, const char *n) {
     XLU_ConfigSetting *set;
 
-    for (set= cfg->settings;
+    for (set = xlu__cfg_get_settings(cfg);
          set;
          set= set->next)
         if (!strcmp(set->name, n))
@@ -267,6 +267,11 @@ static int find_atom(const XLU_Config *cfg, const char *n,
     return 0;
 }
 
+XLU_ConfigSetting *xlu__cfg_get_settings(const XLU_Config *cfg)
+{
+    return cfg->settings;
+}
+
 
 enum XLU_ConfigValueType xlu_cfg_value_type(const XLU_ConfigValue *value)
 {
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 34c6c7a443..993ff88171 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -45,6 +45,8 @@ extern int xlu__cfg_readfile(XLU_Config *cfg, FILE *msgfile,
 extern int xlu__cfg_readdata(XLU_Config *cfg, FILE *msgfile,
     const char *msgprefix, XLU_ConfigSetting **psettings, const char *data,
     int length);
+extern XLU_ConfigSetting *xlu__cfg_get_settings(const XLU_Config *cfg)
+    __attribute__((access(read_only, 1)));
 
 #endif /*LIBXLU_INTERNAL_H*/
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




