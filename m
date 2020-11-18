Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972052B79B9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29536.59055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJc-0001UK-MB; Wed, 18 Nov 2020 08:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29536.59055; Wed, 18 Nov 2020 08:59:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJJc-0001TM-HY; Wed, 18 Nov 2020 08:59:48 +0000
Received: by outflank-mailman (input) for mailman id 29536;
 Wed, 18 Nov 2020 08:59:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJA0-0006e0-56
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:52 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f832a971-d419-49f9-bbc7-b121ac062b86;
 Wed, 18 Nov 2020 08:48:44 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8j-0007p0-Ax; Wed, 18 Nov 2020 08:48:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJA0-0006e0-56
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:52 +0000
X-Inumbo-ID: f832a971-d419-49f9-bbc7-b121ac062b86
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f832a971-d419-49f9-bbc7-b121ac062b86;
	Wed, 18 Nov 2020 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hNtZTYwDbpxOWnjbdPfEN2LKFTEyc+Xwk1zoPtNIsws=; b=TqocbXzDnpX4MzcZ8sgwLOlbAf
	xsj4dZC9XsQv1XS+z2XyddLzInqJ0/IKShK3LPDT7Eo8ZIpILYJY0gj9VfwBQ3nMuSg/HN+J3xlST
	FSG10B3yULkQmmKPPGNECUNZ7iTNJ5QD9Ed3/P5kQbf5pUKNe93db9DVG3tkbxyeraQrS6VjfZR1E
	w5El/hZ6ELQvxKpwQr9399o0aiwHBe3HK6K+ZrCT+dby6bdt46qtWjz7jJb2z7KRzu3kN4k6f+J35
	BMhTlxFabVq0KWEkdz8my9MdfYfF/m0hoir4VCd42ijZNbevVJzVu/cbBaaFuWLhgF/M0/GI2ryHL
	ICIiDKNg==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8j-0007p0-Ax; Wed, 18 Nov 2020 08:48:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 18/20] fs: remove get_super_thawed and get_super_exclusive_thawed
Date: Wed, 18 Nov 2020 09:47:58 +0100
Message-Id: <20201118084800.2339180-19-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Just open code the wait in the only caller of both functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/internal.h      |  2 ++
 fs/quota/quota.c   | 31 +++++++++++++++++++++-------
 fs/super.c         | 51 ++--------------------------------------------
 include/linux/fs.h |  4 +---
 4 files changed, 29 insertions(+), 59 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index a7cd0f64faa4ab..47be21dfeebef5 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -114,7 +114,9 @@ extern struct file *alloc_empty_file_noaccount(int, const struct cred *);
  */
 extern int reconfigure_super(struct fs_context *);
 extern bool trylock_super(struct super_block *sb);
+struct super_block *__get_super(struct block_device *bdev, bool excl);
 extern struct super_block *user_get_super(dev_t);
+void put_super(struct super_block *sb);
 extern bool mount_capable(struct fs_context *);
 
 /*
diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 9af95c7a0bbe3c..f3d32b0d9008f2 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -20,6 +20,7 @@
 #include <linux/writeback.h>
 #include <linux/nospec.h>
 #include "compat.h"
+#include "../internal.h"
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -868,6 +869,7 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	struct block_device *bdev;
 	struct super_block *sb;
 	struct filename *tmp = getname(special);
+	bool excl = false, thawed = false;
 
 	if (IS_ERR(tmp))
 		return ERR_CAST(tmp);
@@ -875,17 +877,32 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	putname(tmp);
 	if (IS_ERR(bdev))
 		return ERR_CAST(bdev);
-	if (quotactl_cmd_onoff(cmd))
-		sb = get_super_exclusive_thawed(bdev);
-	else if (quotactl_cmd_write(cmd))
-		sb = get_super_thawed(bdev);
-	else
-		sb = get_super(bdev);
+
+	if (quotactl_cmd_onoff(cmd)) {
+		excl = true;
+		thawed = true;
+	} else if (quotactl_cmd_write(cmd)) {
+		thawed = true;
+	}
+
+retry:
+	sb = __get_super(bdev, excl);
+	if (thawed && sb && sb->s_writers.frozen != SB_UNFROZEN) {
+		if (excl)
+			up_write(&sb->s_umount);
+		else
+			up_read(&sb->s_umount);
+		wait_event(sb->s_writers.wait_unfrozen,
+			   sb->s_writers.frozen == SB_UNFROZEN);
+		put_super(sb);
+		goto retry;
+	}
+
 	bdput(bdev);
 	if (!sb)
 		return ERR_PTR(-ENODEV);
-
 	return sb;
+
 #else
 	return ERR_PTR(-ENODEV);
 #endif
diff --git a/fs/super.c b/fs/super.c
index 98bb0629ee108e..343e5c1e538d2a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -307,7 +307,7 @@ static void __put_super(struct super_block *s)
  *	Drops a temporary reference, frees superblock if there's no
  *	references left.
  */
-static void put_super(struct super_block *sb)
+void put_super(struct super_block *sb)
 {
 	spin_lock(&sb_lock);
 	__put_super(sb);
@@ -740,7 +740,7 @@ void iterate_supers_type(struct file_system_type *type,
 
 EXPORT_SYMBOL(iterate_supers_type);
 
-static struct super_block *__get_super(struct block_device *bdev, bool excl)
+struct super_block *__get_super(struct block_device *bdev, bool excl)
 {
 	struct super_block *sb;
 
@@ -789,53 +789,6 @@ struct super_block *get_super(struct block_device *bdev)
 }
 EXPORT_SYMBOL(get_super);
 
-static struct super_block *__get_super_thawed(struct block_device *bdev,
-					      bool excl)
-{
-	while (1) {
-		struct super_block *s = __get_super(bdev, excl);
-		if (!s || s->s_writers.frozen == SB_UNFROZEN)
-			return s;
-		if (!excl)
-			up_read(&s->s_umount);
-		else
-			up_write(&s->s_umount);
-		wait_event(s->s_writers.wait_unfrozen,
-			   s->s_writers.frozen == SB_UNFROZEN);
-		put_super(s);
-	}
-}
-
-/**
- *	get_super_thawed - get thawed superblock of a device
- *	@bdev: device to get the superblock for
- *
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device. The superblock is returned once it is thawed
- *	(or immediately if it was not frozen). %NULL is returned if no match
- *	is found.
- */
-struct super_block *get_super_thawed(struct block_device *bdev)
-{
-	return __get_super_thawed(bdev, false);
-}
-EXPORT_SYMBOL(get_super_thawed);
-
-/**
- *	get_super_exclusive_thawed - get thawed superblock of a device
- *	@bdev: device to get the superblock for
- *
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device. The superblock is returned once it is thawed
- *	(or immediately if it was not frozen) and s_umount semaphore is held
- *	in exclusive mode. %NULL is returned if no match is found.
- */
-struct super_block *get_super_exclusive_thawed(struct block_device *bdev)
-{
-	return __get_super_thawed(bdev, true);
-}
-EXPORT_SYMBOL(get_super_exclusive_thawed);
-
 /**
  * get_active_super - get an active reference to the superblock of a device
  * @bdev: device to get the superblock for
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8667d0cdc71e76..a61df0dd4f1989 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1409,7 +1409,7 @@ enum {
 
 struct sb_writers {
 	int				frozen;		/* Is sb frozen? */
-	wait_queue_head_t		wait_unfrozen;	/* for get_super_thawed() */
+	wait_queue_head_t		wait_unfrozen;	/* wait for thaw */
 	struct percpu_rw_semaphore	rw_sem[SB_FREEZE_LEVELS];
 };
 
@@ -3132,8 +3132,6 @@ extern struct file_system_type *get_filesystem(struct file_system_type *fs);
 extern void put_filesystem(struct file_system_type *fs);
 extern struct file_system_type *get_fs_type(const char *name);
 extern struct super_block *get_super(struct block_device *);
-extern struct super_block *get_super_thawed(struct block_device *);
-extern struct super_block *get_super_exclusive_thawed(struct block_device *bdev);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern void drop_super(struct super_block *sb);
 extern void drop_super_exclusive(struct super_block *sb);
-- 
2.29.2


