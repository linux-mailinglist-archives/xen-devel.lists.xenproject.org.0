Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E32F3867
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65874.116801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGI-00057g-GL; Tue, 12 Jan 2021 18:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65874.116801; Tue, 12 Jan 2021 18:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGI-00056t-85; Tue, 12 Jan 2021 18:19:22 +0000
Received: by outflank-mailman (input) for mailman id 65874;
 Tue, 12 Jan 2021 18:19:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOB6-0003Yo-UE
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:14:00 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daf962e1-e655-4aeb-a74b-a397aa52de59;
 Tue, 12 Jan 2021 18:13:25 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDOm0018700;
 Tue, 12 Jan 2021 19:13:24 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDNwJ021031;
 Tue, 12 Jan 2021 19:13:23 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 1995D7218; Tue, 12 Jan 2021 19:13:23 +0100 (MET)
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
X-Inumbo-ID: daf962e1-e655-4aeb-a74b-a397aa52de59
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] gdbsx: use right path for privcmd
Date: Tue, 12 Jan 2021 19:12:28 +0100
Message-Id: <20210112181242.1570-8-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:24 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

On NetBSD the privcmd interface node is /kern/xen/privcmd

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/debugger/gdbsx/xg/xg_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
index ce95648e7e..83a009c195 100644
--- a/tools/debugger/gdbsx/xg/xg_main.c
+++ b/tools/debugger/gdbsx/xg/xg_main.c
@@ -130,11 +130,11 @@ xg_init()
     int flags, saved_errno;
 
     XGTRC("E\n");
-    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
-        if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
-            perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
-            return -1;
-        }
+    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1 &&
+        (_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1 &&
+	(_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
+        perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or /kern/xen/privcmd\n");
+        return -1;
     }
     /* Although we return the file handle as the 'xc handle' the API
      * does not specify / guarentee that this integer is in fact
-- 
2.29.2


