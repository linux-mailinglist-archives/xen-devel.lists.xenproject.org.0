Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960C759B94
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 18:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566056.884700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMASq-0003H9-Bn; Wed, 19 Jul 2023 16:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566056.884700; Wed, 19 Jul 2023 16:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMASq-0003FW-96; Wed, 19 Jul 2023 16:55:48 +0000
Received: by outflank-mailman (input) for mailman id 566056;
 Wed, 19 Jul 2023 16:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Pwt=DF=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qMASo-00037w-F6
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 16:55:46 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a4a14f1-2655-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 18:55:45 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36JGtauS034072
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 19 Jul 2023 12:55:42 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36JGtaU7034071;
 Wed, 19 Jul 2023 09:55:36 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1a4a14f1-2655-11ee-b23a-6b7b168915f2
Message-Id: <4b72ad7c94e325f21849037cfe96eeb0723fa138.1689779749.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689779749.git.ehem+xen@m5p.com>
References: <cover.1689779749.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2023 22:02:48 -0700
Subject: [PATCH 6/7] tools/utils: remove libxlu_cfg_i.h from libxlu_disk.c
X-Spam-Status: No, score=1.5 required=10.0 tests=DATE_IN_PAST_06_12,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

The upper layer disk string parser doesn't need the internals of the
lower layer file parser.  Split the layers apart.  This is viable due
to the lower-layer internals having been removed from
libxlu_internals.h.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/libs/util/libxlu_disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/libs/util/libxlu_disk.c b/tools/libs/util/libxlu_disk.c
index a4d08ab7e9..92da9bd3b1 100644
--- a/tools/libs/util/libxlu_disk.c
+++ b/tools/libs/util/libxlu_disk.c
@@ -1,7 +1,6 @@
 #include "libxlu_internal.h"
 #include "libxlu_disk_l.h"
 #include "libxlu_disk_i.h"
-#include "libxlu_cfg_i.h"
 
 void xlu__disk_err(DiskParseContext *dpc, const char *erroneous,
                    const char *message) {
-- 
2.30.2


