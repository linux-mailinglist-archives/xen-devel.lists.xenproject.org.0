Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1F42E79D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 06:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209568.366272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbEcr-0004N5-G4; Fri, 15 Oct 2021 04:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209568.366272; Fri, 15 Oct 2021 04:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbEcr-0004LB-D5; Fri, 15 Oct 2021 04:15:21 +0000
Received: by outflank-mailman (input) for mailman id 209568;
 Thu, 14 Oct 2021 18:37:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awOS=PC=wanadoo.fr=christophe.jaillet@srs-us1.protection.inumbo.net>)
 id 1mb5bG-0000vF-CY
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 18:37:06 +0000
Received: from smtp.smtpout.orange.fr (unknown [80.12.242.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 360ae674-1aab-47f9-a5d9-c8b0b5d976cd;
 Thu, 14 Oct 2021 18:37:05 +0000 (UTC)
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id b5bCmBF2MBazob5bDmY8O8; Thu, 14 Oct 2021 20:37:04 +0200
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
X-Inumbo-ID: 360ae674-1aab-47f9-a5d9-c8b0b5d976cd
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 14 Oct 2021 20:37:04 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] xen/pvcalls-back: Remove redundant 'flush_workqueue()' calls
Date: Thu, 14 Oct 2021 20:37:01 +0200
Message-Id: <2d6c2e031e4aa2acf2ac4e0bbbc17cfdcc8dbee2.1634236560.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/xen/pvcalls-back.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index b47fd8435061..d6f945fd4147 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -465,7 +465,6 @@ static int pvcalls_back_release_passive(struct xenbus_device *dev,
 		write_unlock_bh(&mappass->sock->sk->sk_callback_lock);
 	}
 	sock_release(mappass->sock);
-	flush_workqueue(mappass->wq);
 	destroy_workqueue(mappass->wq);
 	kfree(mappass);
 
-- 
2.30.2


