Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63432D9F37
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52420.91817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshp-0003R9-S2; Mon, 14 Dec 2020 18:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52420.91817; Mon, 14 Dec 2020 18:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kosho-0003Ie-1U; Mon, 14 Dec 2020 18:36:20 +0000
Received: by outflank-mailman (input) for mailman id 52420;
 Mon, 14 Dec 2020 16:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nuho=FS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1koqrc-0006vN-Lp
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 16:38:20 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bcad583-616e-4839-92f7-87b1ad9ad5fa;
 Mon, 14 Dec 2020 16:36:35 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BEGaYZu023577;
 Mon, 14 Dec 2020 17:36:34 +0100 (CET)
Received: from borneo.soc.lip6.fr (borneo [132.227.103.47])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 0BEGaYxu022690;
 Mon, 14 Dec 2020 17:36:34 +0100 (MET)
Received: by borneo.soc.lip6.fr (Postfix, from userid 373)
 id 22A26AAC66; Mon, 14 Dec 2020 17:36:34 +0100 (MET)
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
X-Inumbo-ID: 8bcad583-616e-4839-92f7-87b1ad9ad5fa
From: Manuel Bouyer <bouyer@netbsd.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>
Subject: [PATCH 21/24] Fix unused functions/variables error
Date: Mon, 14 Dec 2020 17:36:20 +0100
Message-Id: <20201214163623.2127-22-bouyer@netbsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201214163623.2127-1-bouyer@netbsd.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 14 Dec 2020 17:36:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

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
2.28.0


