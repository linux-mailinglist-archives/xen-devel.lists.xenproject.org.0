Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804342EA02B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 23:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61523.108364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYh8-0000aW-AZ; Mon, 04 Jan 2021 22:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61523.108364; Mon, 04 Jan 2021 22:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwYh8-0000Zu-7L; Mon, 04 Jan 2021 22:51:22 +0000
Received: by outflank-mailman (input) for mailman id 61523;
 Mon, 04 Jan 2021 22:51:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wh7t=GH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kwYh6-0000ZU-QT
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 22:51:20 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74eddb61-79df-4678-bd50-c2d0dfdcce29;
 Mon, 04 Jan 2021 22:51:20 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 104MpADi071400
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Jan 2021 17:51:16 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 104MpAT8071399;
 Mon, 4 Jan 2021 14:51:10 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 74eddb61-79df-4678-bd50-c2d0dfdcce29
Message-Id: <03e1951b566bf6c010d9d62a1379288411fbab7b.1608663694.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1608663694.git.ehem+xen@m5p.com>
References: <cover.1608663694.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 18 Dec 2020 14:45:02 -0800
Subject: [WIP PATCH 02/16] tools/libxl: Tiny optimization of
 libxl__mac_is_default()
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

This should result in fewer branch instructions and a small performance
gain.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/light/libxl_internal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index 32b8788b59..b4b2eb4deb 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -346,8 +346,8 @@ _hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)
 
 _hidden int libxl__mac_is_default(const libxl_mac *mac)
 {
-    return (!(*mac)[0] && !(*mac)[1] && !(*mac)[2] &&
-            !(*mac)[3] && !(*mac)[4] && !(*mac)[5]);
+    return !((*mac)[0] | (*mac)[1] | (*mac)[2] |
+             (*mac)[3] | (*mac)[4] | (*mac)[5]);
 }
 
 _hidden int libxl__init_recursive_mutex(libxl_ctx *ctx, pthread_mutex_t *lock)
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




