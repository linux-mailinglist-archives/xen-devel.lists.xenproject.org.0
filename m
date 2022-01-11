Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8E48B006
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255768.438411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbU-00031m-1o; Tue, 11 Jan 2022 14:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255768.438411; Tue, 11 Jan 2022 14:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7IbT-0002xY-TO; Tue, 11 Jan 2022 14:58:27 +0000
Received: by outflank-mailman (input) for mailman id 255768;
 Tue, 11 Jan 2022 14:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7IbS-0002OZ-Ci
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb74dc4e-72ee-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 15:58:22 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9B53212CA;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFE8913DDD;
 Tue, 11 Jan 2022 14:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SM+DLQ2b3WH9eQAAMHmgww
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
X-Inumbo-ID: eb74dc4e-72ee-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TREXG7+5/igcPNPrnaoW0C+ol3WOPsTOJ1n+uetqVIM=;
	b=RMzEluR0R4fgFdGUYZlpRN9kcrLAm9FKaQhlsOwmr0NuaXYDlXIX2d9602zbkd5n3DldVS
	FWh6iw030rnPWCiK37hb+Kqi0mle91w9GKtHPMavCQJZCK0fT2kygkIPsxpMysR9NYHfHS
	vvB0GFH/b9YGFFmP7w1jRCSg3WT26KE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 10/18] mini-os: eliminate netfront union member in struct file
Date: Tue, 11 Jan 2022 15:58:09 +0100
Message-Id: <20220111145817.22170-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the netfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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


