Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B2486406
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253912.435261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP9-0006LO-JO; Thu, 06 Jan 2022 11:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253912.435261; Thu, 06 Jan 2022 11:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP9-0006Di-65; Thu, 06 Jan 2022 11:58:03 +0000
Received: by outflank-mailman (input) for mailman id 253912;
 Thu, 06 Jan 2022 11:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP7-0005Uf-Hh
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e38d72f9-6ee7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65C0B212FE;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BE7213C0D;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGJfDUTZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:56 +0000
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
X-Inumbo-ID: e38d72f9-6ee7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmVybJWUa0fFpI1LcBKz9xhn6xImelv7T4pQq8L9wmI=;
	b=Fs+UM/pWdDVvJXN8OAMiyiD3OkCUNAbWinIFWd/F0qaF9KZkPplY/ZsLiQrZC5bn42+yzU
	DXYYsyjqIiH0Rcz4eufKAnteQTq+nh0x3TnCxrLaV/ystB9ur0TWc/5DIhjbgmzk3M7jbW
	H9NWENjKQdu5+qgvy5/2JYb2t1p3E/s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 06/15] mini-os: eliminate blkfront union member in struct file
Date: Thu,  6 Jan 2022 12:57:32 +0100
Message-Id: <20220106115741.3219-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the blkfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 blkfront.c    | 6 +++---
 include/lib.h | 3 ---
 lib/sys.c     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/blkfront.c b/blkfront.c
index 8137106..e3f42be 100644
--- a/blkfront.c
+++ b/blkfront.c
@@ -562,13 +562,13 @@ int blkfront_open(struct blkfront_dev *dev)
     }
     dev->fd = alloc_fd(FTYPE_BLK);
     printk("blk_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].blk.dev = dev;
+    files[dev->fd].dev = dev;
     return dev->fd;
 }
 
 int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
 {
-   struct blkfront_dev* dev = files[fd].blk.dev;
+   struct blkfront_dev* dev = files[fd].dev;
    off_t offset = files[fd].offset;
    struct blkfront_aiocb aiocb;
    unsigned long long disksize = dev->info.sectors * dev->info.sector_size;
@@ -718,7 +718,7 @@ int blkfront_posix_rwop(int fd, uint8_t* buf, size_t count, int write)
 
 int blkfront_posix_fstat(int fd, struct stat* buf)
 {
-   struct blkfront_dev* dev = files[fd].blk.dev;
+   struct blkfront_dev* dev = files[fd].dev;
 
    buf->st_mode = dev->info.mode;
    buf->st_uid = 0;
diff --git a/include/lib.h b/include/lib.h
index 60aaf1c..3a40634 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -196,9 +196,6 @@ struct file {
 	struct {
 	    struct netfront_dev *dev;
 	} tap;
-	struct {
-	    struct blkfront_dev *dev;
-	} blk;
 	struct {
 	    struct kbdfront_dev *dev;
 	} kbd;
diff --git a/lib/sys.c b/lib/sys.c
index 1da7401..f2fdbdf 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -456,7 +456,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_BLKFRONT
 	case FTYPE_BLK:
-            shutdown_blkfront(files[fd].blk.dev);
+            shutdown_blkfront(files[fd].dev);
 	    files[fd].type = FTYPE_NONE;
 	    return 0;
 #endif
-- 
2.26.2


