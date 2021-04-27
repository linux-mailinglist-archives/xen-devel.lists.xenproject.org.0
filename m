Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A936C5C1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118362.224447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMTA-000686-GI; Tue, 27 Apr 2021 12:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118362.224447; Tue, 27 Apr 2021 12:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbMTA-00067B-7R; Tue, 27 Apr 2021 12:05:36 +0000
Received: by outflank-mailman (input) for mailman id 118362;
 Tue, 27 Apr 2021 12:05:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmyD=JY=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1lbMT8-00062t-UJ
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:05:34 +0000
Received: from mx.upb.ro (unknown [141.85.13.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b7d1fb2-0de2-4f02-986c-29249f071718;
 Tue, 27 Apr 2021 12:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id ED01AB560069;
 Tue, 27 Apr 2021 15:05:27 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HxNMnXbwKZLk; Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 1D4ECB5600B9;
 Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rk5V-VS7Et-W; Tue, 27 Apr 2021 15:05:26 +0300 (EEST)
Received: from localhost.localdomain (unknown [188.25.174.245])
 by mx.upb.ro (Postfix) with ESMTPSA id A39C2B560069;
 Tue, 27 Apr 2021 15:05:25 +0300 (EEST)
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
X-Inumbo-ID: 7b7d1fb2-0de2-4f02-986c-29249f071718
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE redefinition error
Date: Tue, 27 Apr 2021 15:05:18 +0300
Message-Id: <b9a300edca034d44375d8b16d352110186657e75.1619524463.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619524463.git.costin.lupu@cs.pub.ro>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PAGE_SIZE is already defined in the system (e.g. in
/usr/include/limits.h header) then gcc will trigger a redefinition error
because of -Werror. This commit also protects PAGE_SHIFT and PAGE_MASK
definitions for keeping consistency.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/libs/foreignmemory/private.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemor=
y/private.h
index 1ee3626dd2..f3c1ba2867 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -10,11 +10,13 @@
 #include <xen/xen.h>
 #include <xen/sys/privcmd.h>
=20
-#ifndef PAGE_SHIFT /* Mini-os, Yukk */
+#ifndef PAGE_SHIFT
 #define PAGE_SHIFT           12
 #endif
-#ifndef __MINIOS__ /* Yukk */
+#ifndef PAGE_SIZE
 #define PAGE_SIZE            (1UL << PAGE_SHIFT)
+#endif
+#ifndef PAGE_MASK
 #define PAGE_MASK            (~(PAGE_SIZE-1))
 #endif
=20
--=20
2.20.1


