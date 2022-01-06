Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F24486405
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253915.435286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPC-0006r7-17; Thu, 06 Jan 2022 11:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253915.435286; Thu, 06 Jan 2022 11:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPB-0006lY-BI; Thu, 06 Jan 2022 11:58:05 +0000
Received: by outflank-mailman (input) for mailman id 253915;
 Thu, 06 Jan 2022 11:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP8-0005UX-U5
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3256124-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0B481F3A6;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9736213C0D;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IMWmI0TZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e3256124-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xErc7oBdwTzw610yqw3gpLQCyn3qczdDyg0iihAjKQM=;
	b=IPtmfN6P3iEoVunr9mUcXaEj1i9fEgD3m65LtDMKgeHnVLAeEOiyoc4jqCH8r1Bd22Fs8L
	Id1HWyvbLUUr4Vpj8VUNJaAxMAN+p3bdGBePEoP2sjnWYsNTpDV1K4H/lChVa+MDcsSAki
	sLfOeG7xXhvmJIT/1PJGOH6yOstLcNU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 08/15] mini-os: eliminate fbfront union member in struct file
Date: Thu,  6 Jan 2022 12:57:34 +0100
Message-Id: <20220106115741.3219-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the fbfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 fbfront.c     | 2 +-
 include/lib.h | 3 ---
 lib/sys.c     | 4 ++--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fbfront.c b/fbfront.c
index 6725da1..c8410af 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -703,7 +703,7 @@ int fbfront_open(struct fbfront_dev *dev)
 {
     dev->fd = alloc_fd(FTYPE_FB);
     printk("fb_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].fb.dev = dev;
+    files[dev->fd].dev = dev;
     return dev->fd;
 }
 #endif
diff --git a/include/lib.h b/include/lib.h
index 0cedae6..2a9a01c 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -199,9 +199,6 @@ struct file {
 	struct {
 	    struct kbdfront_dev *dev;
 	} kbd;
-	struct {
-	    struct fbfront_dev *dev;
-	} fb;
 #ifdef CONFIG_TPMFRONT
 	struct {
 	   struct tpmfront_dev *dev;
diff --git a/lib/sys.c b/lib/sys.c
index 62c2020..2d48657 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -287,7 +287,7 @@ int read(int fd, void *buf, size_t nbytes)
         case FTYPE_FB: {
             int ret, n;
             n = nbytes / sizeof(union xenfb_in_event);
-            ret = fbfront_receive(files[fd].fb.dev, buf, n);
+            ret = fbfront_receive(files[fd].dev, buf, n);
 	    if (ret <= 0) {
 		errno = EAGAIN;
 		return -1;
@@ -480,7 +480,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_FBFRONT
 	case FTYPE_FB:
-            shutdown_fbfront(files[fd].fb.dev);
+            shutdown_fbfront(files[fd].dev);
             files[fd].type = FTYPE_NONE;
             return 0;
 #endif
-- 
2.26.2


