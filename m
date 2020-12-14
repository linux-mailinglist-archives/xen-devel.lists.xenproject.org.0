Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A722D9F32
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52386.91611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshG-0001sf-Va; Mon, 14 Dec 2020 18:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52386.91611; Mon, 14 Dec 2020 18:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshG-0001rW-No; Mon, 14 Dec 2020 18:35:46 +0000
Received: by outflank-mailman (input) for mailman id 52386;
 Mon, 14 Dec 2020 16:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqqP-0006vN-If
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:37:05 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67e0c9a6-fb09-457e-b95d-83f6c8056612;
 Mon, 14 Dec 2020 16:36:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaXKv022303;
 Mon, 14 Dec 2020 17:36:33 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaXZt022112;
 Mon, 14 Dec 2020 17:36:33 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id E245AAAC68; Mon, 14 Dec 2020 17:36:32 +0100 (MET)
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
X-Inumbo-ID: 67e0c9a6-fb09-457e-b95d-83f6c8056612
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 04/24] Make xg_main.c  build on NetBSD
Date: Mon, 14 Dec 2020 17:36:03 +0100
Message-Id: <20201214163623.2127-5-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

---
 tools/debugger/gdbsx/xg/xg_main.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
index a4e8653168..fa2741ccf8 100644
--- a/tools/debugger/gdbsx/xg/xg_main.c
+++ b/tools/debugger/gdbsx/xg/xg_main.c
@@ -49,7 +49,11 @@
 #include "xg_public.h"
 #include <xen/version.h>
 #include <xen/domctl.h>
+#ifdef __NetBSD__
+#include <xen/xenio.h>
+#else
 #include <xen/sys/privcmd.h>
+#endif
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 
@@ -126,12 +130,19 @@ xg_init()
     int flags, saved_errno;
 
     XGTRC("E\n");
+#ifdef __NetBSD__
+    if ((_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
+        perror("Failed to open /kern/xen/privcmd\n");
+        return -1;
+    }
+#else
     if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
         if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
             perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
             return -1;
         }
     }
+#endif
     /* Although we return the file handle as the 'xc handle' the API
      * does not specify / guarentee that this integer is in fact
      * a file handle. Thus we must take responsiblity to ensure
-- 
2.28.0


