Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD05486407
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253908.435226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP7-0005e6-7P; Thu, 06 Jan 2022 11:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253908.435226; Thu, 06 Jan 2022 11:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RP6-0005Z6-Vw; Thu, 06 Jan 2022 11:58:00 +0000
Received: by outflank-mailman (input) for mailman id 253908;
 Thu, 06 Jan 2022 11:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP5-0005Uf-HV
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:57:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33f3c66-6ee7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDC5B1F3A7;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5E4E13C0D;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KPwkL0TZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e33f3c66-6ee7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmQsTeEAO2F2JehoSUAYba8Y3ffpdoax96zqkTw3H6w=;
	b=SIUb5DfRwcn7TS4qWmIGSdd7G6qhQ/XrhDETu7o7sN0SC7IQBPp4/22hBxBXw10PqAnY9h
	P28ZPsi+nfl6AnKztBteqgLZ1OlxkDu1UPeDHwIfmUXRKyVzq4DEpZSVD8r37fY872FJEg
	7ywrBQ4TCoVf91mYmkMlD3GkklXXA7M=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/15] mini-os: eliminate kbdfront union member in struct file
Date: Thu,  6 Jan 2022 12:57:35 +0100
Message-Id: <20220106115741.3219-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the kbdfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 fbfront.c     | 2 +-
 include/lib.h | 3 ---
 lib/sys.c     | 4 ++--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fbfront.c b/fbfront.c
index c8410af..1e055fb 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -302,7 +302,7 @@ int kbdfront_open(struct kbdfront_dev *dev)
 {
     dev->fd = alloc_fd(FTYPE_KBD);
     printk("kbd_open(%s) -> %d\n", dev->nodename, dev->fd);
-    files[dev->fd].kbd.dev = dev;
+    files[dev->fd].dev = dev;
     return dev->fd;
 }
 #endif
diff --git a/include/lib.h b/include/lib.h
index 2a9a01c..5201ed7 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -196,9 +196,6 @@ struct file {
 	struct {
 	    struct netfront_dev *dev;
 	} tap;
-	struct {
-	    struct kbdfront_dev *dev;
-	} kbd;
 #ifdef CONFIG_TPMFRONT
 	struct {
 	   struct tpmfront_dev *dev;
diff --git a/lib/sys.c b/lib/sys.c
index 2d48657..8c7ea3c 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -275,7 +275,7 @@ int read(int fd, void *buf, size_t nbytes)
         case FTYPE_KBD: {
             int ret, n;
             n = nbytes / sizeof(union xenkbd_in_event);
-            ret = kbdfront_receive(files[fd].kbd.dev, buf, n);
+            ret = kbdfront_receive(files[fd].dev, buf, n);
 	    if (ret <= 0) {
 		errno = EAGAIN;
 		return -1;
@@ -474,7 +474,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
-            shutdown_kbdfront(files[fd].kbd.dev);
+            shutdown_kbdfront(files[fd].dev);
             files[fd].type = FTYPE_NONE;
             return 0;
 #endif
-- 
2.26.2


