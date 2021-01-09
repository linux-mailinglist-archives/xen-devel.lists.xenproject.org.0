Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F844507F01
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 04:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308664.524469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ht-0005O6-P2; Wed, 20 Apr 2022 02:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308664.524469; Wed, 20 Apr 2022 02:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh0Ht-0005MH-M7; Wed, 20 Apr 2022 02:41:49 +0000
Received: by outflank-mailman (input) for mailman id 308664;
 Wed, 20 Apr 2022 02:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=80Cj=U6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nh0Bd-0000eu-1j
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 02:35:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85040090-c052-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 04:35:20 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 23K2ZB2W092991
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Apr 2022 22:35:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 23K2ZBk1092990;
 Tue, 19 Apr 2022 19:35:11 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 85040090-c052-11ec-a405-831a346695d4
Message-Id: <f3f72c2a42a0e2b682221f7914ff90fc3365fc19.1650420617.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1650420617.git.ehem+xen@m5p.com>
References: <cover.1650420617.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Date: Sat, 9 Jan 2021 14:44:07 -0800
Subject: [PATCH 05/10] docs: xlexample.hvm: Fix maxmem value
To: xen-devel@lists.xenproject.org
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.5
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

HVM doesn't balloon and so it makes no sense to specify maxmem.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/examples/xlexample.hvm | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/examples/xlexample.hvm b/tools/examples/xlexample.hvm
index 26ae1c2fb4..a6cafcbf9f 100644
--- a/tools/examples/xlexample.hvm
+++ b/tools/examples/xlexample.hvm
@@ -25,9 +25,9 @@ name = "example.hvm"
 memory = 384
 
 # Maximum memory (MB)
-# If this is greater than `memory' then the slack will start ballooned
-# (this assumes guest kernel support for ballooning)
-#maxmem = 512
+# Unlike PV or PVH, HVM cannot balloon memory and hence this should match
+# `memory' or simply be left unset.
+#maxmem =
 
 # Number of VCPUS
 vcpus = 3
-- 
2.30.2


