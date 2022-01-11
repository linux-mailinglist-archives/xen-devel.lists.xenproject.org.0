Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E8C48B077
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255839.438646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImJ-0007BD-G0; Tue, 11 Jan 2022 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255839.438646; Tue, 11 Jan 2022 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ImJ-00079M-Cz; Tue, 11 Jan 2022 15:09:39 +0000
Received: by outflank-mailman (input) for mailman id 255839;
 Tue, 11 Jan 2022 15:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Iba-0002OZ-Dx
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec22a130-72ee-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 525AD212CC;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A2A313DDD;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kPEGCQ6b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:22 +0000
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
X-Inumbo-ID: ec22a130-72ee-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYu3u434xIrAQdgw8rYV9Jpr+7UfDsZfUtYVg6rlj/g=;
	b=J3rgPmuEtBeQvoQJca4UnYfrUOjV1xo9h6RDBETYShjI5hzhYdMG/c270TX5v9LPhSMqDM
	YL2NDZPvYuGIGysONZxLf7UT5uhAl+sjK0zISGCk+LQDI/+7r4wlKjIoqori+NZw5uKQqi
	cX5wL7HX68hb4SvSod2FFS0SUVnIZF8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 12/18] mini-os: eliminate tpmfront union member in struct file
Date: Tue, 11 Jan 2022 15:58:11 +0100
Message-Id: <20220111145817.22170-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tpmfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/lib.h | 5 -----
 lib/sys.c     | 2 +-
 tpmfront.c    | 8 ++++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index d740065..2ddc076 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -193,11 +193,6 @@ struct file {
 	    struct evtchn_port_list ports;
 	} evtchn;
 	struct gntmap gntmap;
-#ifdef CONFIG_TPMFRONT
-	struct {
-	   struct tpmfront_dev *dev;
-	} tpmfront;
-#endif
 #ifdef CONFIG_TPM_TIS
 	struct {
 	   struct tpm_chip *dev;
diff --git a/lib/sys.c b/lib/sys.c
index b35e433..b042bf5 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -462,7 +462,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_TPMFRONT
 	case FTYPE_TPMFRONT:
-            shutdown_tpmfront(files[fd].tpmfront.dev);
+            shutdown_tpmfront(files[fd].dev);
 	    files[fd].type = FTYPE_NONE;
 	    return 0;
 #endif
diff --git a/tpmfront.c b/tpmfront.c
index be671c2..0a2fefc 100644
--- a/tpmfront.c
+++ b/tpmfront.c
@@ -538,7 +538,7 @@ int tpmfront_open(struct tpmfront_dev* dev)
 
    dev->fd = alloc_fd(FTYPE_TPMFRONT);
    printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
-   files[dev->fd].tpmfront.dev = dev;
+   files[dev->fd].dev = dev;
    dev->respgot = false;
    return dev->fd;
 }
@@ -547,7 +547,7 @@ int tpmfront_posix_write(int fd, const uint8_t* buf, size_t count)
 {
    int rc;
    struct tpmfront_dev* dev;
-   dev = files[fd].tpmfront.dev;
+   dev = files[fd].dev;
 
    if(count == 0) {
       return 0;
@@ -573,7 +573,7 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
    size_t dummysz;
    struct tpmfront_dev* dev;
 
-   dev = files[fd].tpmfront.dev;
+   dev = files[fd].dev;
 
    if(count == 0) {
       return 0;
@@ -606,7 +606,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
    uint8_t* dummybuf;
    size_t dummysz;
    int rc;
-   struct tpmfront_dev* dev = files[fd].tpmfront.dev;
+   struct tpmfront_dev* dev = files[fd].dev;
 
    /* If we have a response waiting, then read it now from the backend
     * so we can get its length*/
-- 
2.26.2


