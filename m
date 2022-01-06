Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41494486408
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253923.435330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPH-0007vc-1Z; Thu, 06 Jan 2022 11:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253923.435330; Thu, 06 Jan 2022 11:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPG-0007b4-Bo; Thu, 06 Jan 2022 11:58:10 +0000
Received: by outflank-mailman (input) for mailman id 253923;
 Thu, 06 Jan 2022 11:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPC-0005UX-UF
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e35b35a9-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 282E51F3A8;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F352113C0D;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wIYpOkTZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e35b35a9-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yL3iNqERg5EulNmJK0ycoAwzGvfibMXTv4Vh1zCFUho=;
	b=G76wKbbFM05FStujvf/bF/czASQ6aHupL7jeNQeVnlWOFrqYUzFmSDKosGJMmltnA/LJJ1
	USaPHOqWwxFbc1FAgAlIiKlUdkyAmeCSIElV/7K0mSOEC9ssyWZDLzcz2jL3jI42sOvyY5
	C6hJQLbxXyqk3OonxIsIRRrHpEQI2/0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 10/15] mini-os: eliminate netfront union member in struct file
Date: Thu,  6 Jan 2022 12:57:36 +0100
Message-Id: <20220106115741.3219-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the netfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 3 ---
 lib/sys.c     | 6 +++---
 netfront.c    | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 5201ed7..f2a124e 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -193,9 +193,6 @@ struct file {
 	    struct evtchn_port_list ports;
 	} evtchn;
 	struct gntmap gntmap;
-	struct {
-	    struct netfront_dev *dev;
-	} tap;
 #ifdef CONFIG_TPMFRONT
 	struct {
 	   struct tpmfront_dev *dev;
diff --git a/lib/sys.c b/lib/sys.c
index 8c7ea3c..b35e433 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -263,7 +263,7 @@ int read(int fd, void *buf, size_t nbytes)
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP: {
 	    ssize_t ret;
-	    ret = netfront_receive(files[fd].tap.dev, buf, nbytes);
+	    ret = netfront_receive(files[fd].dev, buf, nbytes);
 	    if (ret <= 0) {
 		errno = EAGAIN;
 		return -1;
@@ -339,7 +339,7 @@ int write(int fd, const void *buf, size_t nbytes)
 #endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP:
-	    netfront_xmit(files[fd].tap.dev, (void*) buf, nbytes);
+	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
 	    return nbytes;
 #endif
 #ifdef CONFIG_BLKFRONT
@@ -450,7 +450,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP:
-	    shutdown_netfront(files[fd].tap.dev);
+	    shutdown_netfront(files[fd].dev);
 	    files[fd].type = FTYPE_NONE;
 	    return 0;
 #endif
diff --git a/netfront.c b/netfront.c
index a566e34..7696451 100644
--- a/netfront.c
+++ b/netfront.c
@@ -576,7 +576,7 @@ int netfront_tap_open(char *nodename) {
     }
     dev->fd = alloc_fd(FTYPE_TAP);
     printk("tap_open(%s) -> %d\n", nodename, dev->fd);
-    files[dev->fd].tap.dev = dev;
+    files[dev->fd].dev = dev;
     return dev->fd;
 }
 #endif
-- 
2.26.2


