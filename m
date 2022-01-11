Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFA48B008
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255767.438417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbU-00039z-HG; Tue, 11 Jan 2022 14:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255767.438417; Tue, 11 Jan 2022 14:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbU-00031s-9r; Tue, 11 Jan 2022 14:58:28 +0000
Received: by outflank-mailman (input) for mailman id 255767;
 Tue, 11 Jan 2022 14:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IbS-0002Oa-Ct
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb068b7d-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BE751F3BC;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0484A13DDD;
 Tue, 11 Jan 2022 14:58:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8NN9Owyb3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:20 +0000
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
X-Inumbo-ID: eb068b7d-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpZ+5J0dnLWZk57QHjN9YUOxVha4rvn1wsE3TtHogLs=;
	b=GgsG7/fulZvIDHuEMcqegNiYNkq/fIzKJ14c9i1ZyEujrgF7ivH9zajgC+1sYzo67tNkVC
	z5tBQ66e1EP45KeW2YHCgLaTT81ormHlyMXeQ0cNwZxwQmKjPRsnP+Q4GRR7br7XsJeoZl
	dCHr125Rm95Gx36yZl+/4hhKPiPJTQc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 06/18] mini-os: eliminate blkfront union member in struct file
Date: Tue, 11 Jan 2022 15:58:05 +0100
Message-Id: <20220111145817.22170-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the blkfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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


