Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72093759BA1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566078.884710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUL-0003zv-Mb; Wed, 19 Jul 2023 16:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566078.884710; Wed, 19 Jul 2023 16:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMAUL-0003yf-JA; Wed, 19 Jul 2023 16:57:21 +0000
Received: by outflank-mailman (input) for mailman id 566078;
 Wed, 19 Jul 2023 16:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMAQT-0001Uv-5W
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:53:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2feaa43-2654-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 18:53:19 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGqxYS034041
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:53:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGqxCQ034040;
 Wed, 19 Jul 2023 09:52:59 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c2feaa43-2654-11ee-8611-37d641c3527e
Message-Id: <6f482f3d54989e4ccce1b651db750c2e789a8886.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Sun, 9 Jul 2023 16:06:30 -0700
Subject: [PATCH 3/7] tools/utils: move XLU_Operation to libxlu_cfg_i.h.h
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This enumerated value is never used outside of the lowest layer of the
configuration parser.  As such, move to the internal header.

Fixes: a30910bfd7 ("libxlu: Handle += in config files")
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
I'm unsure whether this is fixing a30910bfd7.  Placing XLU_Operation in
libxlutil.h was certainly erroneous, but it is quite unlikely to directly
result in actual bugs.
---
 tools/include/libxlutil.h      | 5 -----
 tools/libs/util/libxlu_cfg_i.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 0ce66c2096..de57ca4200 100644
--- a/tools/include/libxlutil.h
+++ b/tools/include/libxlutil.h
@@ -25,11 +25,6 @@ enum XLU_ConfigValueType {
     XLU_LIST,
 };
 
-enum XLU_Operation {
-    XLU_OP_ASSIGNMENT = 0,
-    XLU_OP_ADDITION,
-};
-
 /* Unless otherwise stated, all functions return an errno value. */
 typedef struct XLU_Config XLU_Config;
 typedef struct XLU_ConfigList XLU_ConfigList;
diff --git a/tools/libs/util/libxlu_cfg_i.h b/tools/libs/util/libxlu_cfg_i.h
index 4217f5b28d..3d1e4ed568 100644
--- a/tools/libs/util/libxlu_cfg_i.h
+++ b/tools/libs/util/libxlu_cfg_i.h
@@ -21,6 +21,11 @@
 #include "libxlu_internal.h"
 #include "libxlu_cfg_y.h"
 
+enum XLU_Operation {
+    XLU_OP_ASSIGNMENT = 0,
+    XLU_OP_ADDITION,
+};
+
 void xlu__cfg_set_free(XLU_ConfigSetting *set);
 void xlu__cfg_set_store(CfgParseContext*, char *name,
                         enum XLU_Operation op,
-- 
2.30.2


