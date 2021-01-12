Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1D2F3869
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65876.116818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGJ-0005Ae-KS; Tue, 12 Jan 2021 18:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65876.116818; Tue, 12 Jan 2021 18:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOGJ-00058p-7x; Tue, 12 Jan 2021 18:19:23 +0000
Received: by outflank-mailman (input) for mailman id 65876;
 Tue, 12 Jan 2021 18:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOCe-0003Yo-1e
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:15:36 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5148e491-bdb8-4783-90d4-f3ea69b84284;
 Tue, 12 Jan 2021 18:14:01 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIE0BO020395;
 Tue, 12 Jan 2021 19:14:00 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDxEQ025995;
 Tue, 12 Jan 2021 19:13:59 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 2C2937218; Tue, 12 Jan 2021 19:13:59 +0100 (MET)
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
X-Inumbo-ID: 5148e491-bdb8-4783-90d4-f3ea69b84284
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] xenstat_netbsd: remove usused code
Date: Tue, 12 Jan 2021 19:12:42 +0100
Message-Id: <20210112181242.1570-22-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:14:00 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

remove PROCNETDEV_HEADER[] and read_attributes_vbd(), gcc complains that they
are unused

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/stat/xenstat_netbsd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tools/libs/stat/xenstat_netbsd.c b/tools/libs/stat/xenstat_netbsd.c
index 6e9d6aee10..64eda9e1ae 100644
--- a/tools/libs/stat/xenstat_netbsd.c
+++ b/tools/libs/stat/xenstat_netbsd.c
@@ -55,11 +55,6 @@ get_priv_data(xenstat_handle *handle)
 }
 
 /* Expected format of /proc/net/dev */
-static const char PROCNETDEV_HEADER[] =
-    "Inter-|   Receive                                                |"
-    "  Transmit\n"
-    " face |bytes    packets errs drop fifo frame compressed multicast|"
-    "bytes    packets errs drop fifo colls carrier compressed\n";
 
 /* Collect information about networks */
 int xenstat_collect_networks(xenstat_node * node)
@@ -76,12 +71,6 @@ void xenstat_uninit_networks(xenstat_handle * handle)
 		fclose(priv->procnetdev);
 }
 
-static int read_attributes_vbd(const char *vbd_directory, const char *what, char *ret, int cap)
-{
-	/* XXX implement */
-	return 0;
-}
-
 /* Collect information about VBDs */
 int xenstat_collect_vbds(xenstat_node * node)
 {
-- 
2.29.2


