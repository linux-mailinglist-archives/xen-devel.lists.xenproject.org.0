Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877B48B079
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255845.438677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImQ-0007uT-6w; Tue, 11 Jan 2022 15:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255845.438677; Tue, 11 Jan 2022 15:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImQ-0007pl-2f; Tue, 11 Jan 2022 15:09:46 +0000
Received: by outflank-mailman (input) for mailman id 255845;
 Tue, 11 Jan 2022 15:09:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibc-0002Oa-Dd
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec17fb13-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B8721F3BF;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60D931403F;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cCpeFg2b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:21 +0000
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
X-Inumbo-ID: ec17fb13-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TCkN47zI3SYm+mHMLDmij+4Y00VWhhcxxyZlFlzzdgc=;
	b=OUTHaG7Za4OLcRVER+k9rsHzA3tJlldnWMM3DF4J9ecUKfFu3136R9mIRg4FghLkU13SvK
	uzc8EpFlxNG/8ZCXTvffr6d1eGq/uWfwpHHKPTcQLAuUO/910sYhoQSv4j9XwZ5PKLNP7i
	LfwrwgrT9OKljA6xK+yV5nNXDk3W3WA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 08/18] mini-os: eliminate fbfront union member in struct file
Date: Tue, 11 Jan 2022 15:58:07 +0100
Message-Id: <20220111145817.22170-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the fbfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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


