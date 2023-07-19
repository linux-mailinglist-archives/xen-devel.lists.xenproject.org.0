Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2676D9AE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 23:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575654.901269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXK-00072m-Cn; Wed, 02 Aug 2023 21:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575654.901269; Wed, 02 Aug 2023 21:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRJXK-00070T-8i; Wed, 02 Aug 2023 21:37:42 +0000
Received: by outflank-mailman (input) for mailman id 575654;
 Wed, 02 Aug 2023 21:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w0qL=DT=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qRJNK-0004vP-G1
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 21:27:22 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d25a01e-317b-11ee-b263-6b7b168915f2;
 Wed, 02 Aug 2023 23:27:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 372LRCsJ008463
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 2 Aug 2023 17:27:18 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 372LRCav008462;
 Wed, 2 Aug 2023 14:27:12 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 5d25a01e-317b-11ee-b263-6b7b168915f2
Message-Id: <de7fedb2b94476563d9c7657c9cba70b82767027.1690990428.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1690990427.git.ehem+xen@m5p.com>
References: <cover.1690990427.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 23:07:20 -0700
Subject: [PATCH 13/22] tools/utils: move XLU_ConfigList to libxl_cfg.c
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

With XLU_ConfigValue now in libxlu_cfg.c, XLU_ConfigList can follow.

Fixes: 1a09c5113a ("libxlu: rework internal representation of setting")
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Placing XLU_ConfigValue/XLU_ConfigList in libxlu_internal.h was certainly
*wrong*.
---
 tools/libs/util/libxlu_cfg.c      | 6 ++++++
 tools/libs/util/libxlu_internal.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/libs/util/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
index d3b5c86ed6..67d1a8123f 100644
--- a/tools/libs/util/libxlu_cfg.c
+++ b/tools/libs/util/libxlu_cfg.c
@@ -31,6 +31,12 @@ struct XLU_ConfigSetting {
     int lineno;
 };
 
+struct XLU_ConfigList {
+    int avalues; /* available slots */
+    int nvalues; /* actual occupied slots */
+    XLU_ConfigValue **values;
+};
+
 struct XLU_ConfigValue {
     enum XLU_ConfigValueType type;
     union {
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index c68669c3a1..310e2145a7 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -25,12 +25,6 @@
 
 #include "libxlutil.h"
 
-struct XLU_ConfigList {
-    int avalues; /* available slots */
-    int nvalues; /* actual occupied slots */
-    XLU_ConfigValue **values;
-};
-
 typedef struct XLU_ConfigSetting XLU_ConfigSetting;
 
 struct XLU_Config {
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@m5p.com      PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




