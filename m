Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94541465831
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 22:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236225.409750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msWsR-00057l-RC; Wed, 01 Dec 2021 21:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236225.409750; Wed, 01 Dec 2021 21:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msWsR-000552-NH; Wed, 01 Dec 2021 21:10:55 +0000
Received: by outflank-mailman (input) for mailman id 236225;
 Wed, 01 Dec 2021 21:10:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zo2s=QS=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1msWsP-00054v-U1
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 21:10:53 +0000
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a23b1e5-52eb-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 22:10:52 +0100 (CET)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id sWsLmkjcv65jHsWsLmTQIX; Wed, 01 Dec 2021 22:10:51 +0100
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
X-Inumbo-ID: 2a23b1e5-52eb-11ec-976b-d102b41d0961
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 01 Dec 2021 22:10:51 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	roger.pau@citrix.com,
	axboe@kernel.dk
Cc: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] xen-blkfront: Use the bitmap API when applicable
Date: Wed,  1 Dec 2021 22:10:48 +0100
Message-Id: <1c73cf8eaff02ea19439ec676c063e592d273cfe.1638392965.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'bitmap_zalloc()' to simplify code, improve the semantic and avoid some
open-coded arithmetic in allocator arguments.

Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
consistency.

Use 'bitmap_copy()' to avoid an explicit 'memcpy()'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/block/xen-blkfront.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 700c765a759a..fe4d69cf9469 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -442,16 +442,14 @@ static int xlbd_reserve_minors(unsigned int minor, unsigned int nr)
 	if (end > nr_minors) {
 		unsigned long *bitmap, *old;
 
-		bitmap = kcalloc(BITS_TO_LONGS(end), sizeof(*bitmap),
-				 GFP_KERNEL);
+		bitmap = bitmap_zalloc(end, GFP_KERNEL);
 		if (bitmap == NULL)
 			return -ENOMEM;
 
 		spin_lock(&minor_lock);
 		if (end > nr_minors) {
 			old = minors;
-			memcpy(bitmap, minors,
-			       BITS_TO_LONGS(nr_minors) * sizeof(*bitmap));
+			bitmap_copy(bitmap, minors, nr_minors);
 			minors = bitmap;
 			nr_minors = BITS_TO_LONGS(end) * BITS_PER_LONG;
 		} else
@@ -2610,7 +2608,7 @@ static void __exit xlblk_exit(void)
 
 	xenbus_unregister_driver(&blkfront_driver);
 	unregister_blkdev(XENVBD_MAJOR, DEV_NAME);
-	kfree(minors);
+	bitmap_free(minors);
 }
 module_exit(xlblk_exit);
 
-- 
2.30.2


