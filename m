Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69CD74DBD3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 19:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561314.877765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIuEn-0005na-VP; Mon, 10 Jul 2023 16:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561314.877765; Mon, 10 Jul 2023 16:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIuEn-0005kv-SC; Mon, 10 Jul 2023 16:59:49 +0000
Received: by outflank-mailman (input) for mailman id 561314;
 Mon, 10 Jul 2023 16:59:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wLvp=C4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qIuEm-0005kp-ON
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 16:59:48 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b8fda60-1f43-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 18:59:46 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36AGxX62081751
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 10 Jul 2023 12:59:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36AGxWqn081750;
 Mon, 10 Jul 2023 09:59:32 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 2b8fda60-1f43-11ee-b239-6b7b168915f2
Message-Id: <96726e1f51811a95b96adc029a7d573d8c254361.1689008310.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Sun, 9 Jul 2023 16:06:30 -0700
Subject: [PATCH] tools/utils: move XLU_Operation to libxlu_internal.h
X-Spam-Status: No, score=1.2 required=10.0 tests=DATE_IN_PAST_12_24,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This enumerated value is never used outside of the configuration parser.
As such, move to the internal header.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxlutil.h         | 5 -----
 tools/libs/util/libxlu_internal.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/include/libxlutil.h b/tools/include/libxlutil.h
index 4dd3c5e92b..24c31744ae 100644
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
diff --git a/tools/libs/util/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
index 1f7559ecd9..68bacdc384 100644
--- a/tools/libs/util/libxlu_internal.h
+++ b/tools/libs/util/libxlu_internal.h
@@ -25,6 +25,11 @@
 
 #include "libxlutil.h"
 
+enum XLU_Operation {
+    XLU_OP_ASSIGNMENT = 0,
+    XLU_OP_ADDITION,
+};
+
 struct XLU_ConfigList {
     int avalues; /* available slots */
     int nvalues; /* actual occupied slots */
-- 
2.30.2


