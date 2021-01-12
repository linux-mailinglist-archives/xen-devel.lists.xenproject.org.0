Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460512F3868
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65875.116813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGJ-00059F-8W; Tue, 12 Jan 2021 18:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65875.116813; Tue, 12 Jan 2021 18:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGI-00057T-MY; Tue, 12 Jan 2021 18:19:22 +0000
Received: by outflank-mailman (input) for mailman id 65875;
 Tue, 12 Jan 2021 18:19:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOBa-0003Yo-Ve
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:14:31 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd7948a6-efbf-4162-ba1b-ebc08799d93e;
 Tue, 12 Jan 2021 18:13:34 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDXEi023363;
 Tue, 12 Jan 2021 19:13:33 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDWOw006995;
 Tue, 12 Jan 2021 19:13:32 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 26A867218; Tue, 12 Jan 2021 19:13:32 +0100 (MET)
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
X-Inumbo-ID: dd7948a6-efbf-4162-ba1b-ebc08799d93e
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] libs/evtchn: fix build on NetBSD.
Date: Tue, 12 Jan 2021 19:12:30 +0100
Message-Id: <20210112181242.1570-10-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:33 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

use xenio3.h for ioctl definitions
read_exact/write_exact seems to not be available here, which cause
a gcc error.
Use plain read/write, the xenevtchn interface won't do partial read/write
on NetBSD anyway so it should be safe.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
Fixes: b7f76a699dc ('tools: Refactor /dev/xen/evtchn wrappers into libxenevtchn.
')

---
 tools/libs/evtchn/netbsd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 8b8545d2f9..6d4ce28011 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -25,10 +25,10 @@
 
 #include <sys/ioctl.h>
 
-#include <xen/sys/evtchn.h>
-
 #include "private.h"
 
+#include <xen/xenio3.h>
+
 #define EVTCHN_DEV_NAME  "/dev/xenevt"
 
 int osdep_evtchn_open(xenevtchn_handle *xce)
@@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
     int fd = xce->fd;
     evtchn_port_t port;
 
-    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
+    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
         return -1;
 
     return port;
@@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
 int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
 {
     int fd = xce->fd;
-    return write_exact(fd, (char *)&port, sizeof(port));
+    return write(fd, (char *)&port, sizeof(port));
 }
 
 /*
-- 
2.29.2


