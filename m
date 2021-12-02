Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45970466ACF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 21:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236968.410976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mssV3-0006uW-PQ; Thu, 02 Dec 2021 20:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236968.410976; Thu, 02 Dec 2021 20:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mssV3-0006rp-LJ; Thu, 02 Dec 2021 20:16:13 +0000
Received: by outflank-mailman (input) for mailman id 236968;
 Thu, 02 Dec 2021 20:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wP8P=QT=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1mssV2-0006rj-OG
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 20:16:12 +0000
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aebe5a35-53ac-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 21:16:08 +0100 (CET)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id ssUvmqRgBozlissUvmqm80; Thu, 02 Dec 2021 21:16:07 +0100
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
X-Inumbo-ID: aebe5a35-53ac-11ec-b1df-f38ee3fbfdf7
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 02 Dec 2021 21:16:07 +0100
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
Subject: [PATCH v2] xen-blkfront: Use the bitmap API when applicable
Date: Thu,  2 Dec 2021 21:16:04 +0100
Message-Id: <d6f31db1d2542e1b4ba66d4cea80d3891678aa5a.1638476031.git.christophe.jaillet@wanadoo.fr>
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
v1 --> v2: change another kfree into bitmap_free
---
 drivers/block/xen-blkfront.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 700c765a759a..69cf13608ce0 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -442,22 +442,20 @@ static int xlbd_reserve_minors(unsigned int minor, unsigned int nr)
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
 			old = bitmap;
 		spin_unlock(&minor_lock);
-		kfree(old);
+		bitmap_free(old);
 	}
 
 	spin_lock(&minor_lock);
@@ -2610,7 +2608,7 @@ static void __exit xlblk_exit(void)
 
 	xenbus_unregister_driver(&blkfront_driver);
 	unregister_blkdev(XENVBD_MAJOR, DEV_NAME);
-	kfree(minors);
+	bitmap_free(minors);
 }
 module_exit(xlblk_exit);
 
-- 
2.30.2


