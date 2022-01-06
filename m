Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F748640A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253918.435302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPD-0007Id-PY; Thu, 06 Jan 2022 11:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253918.435302; Thu, 06 Jan 2022 11:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPD-0007CE-BR; Thu, 06 Jan 2022 11:58:07 +0000
Received: by outflank-mailman (input) for mailman id 253918;
 Thu, 06 Jan 2022 11:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPA-0005Uf-Hx
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b29e51-6ee7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 848E31F3A9;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D05713C0D;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFlkFUXZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:57 +0000
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
X-Inumbo-ID: e3b29e51-6ee7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlUsXgmJVXs1bcrolch8AFDDMEltM2NC+VAU9LgoD0k=;
	b=lfHgdbJ6+meI0zCgqlYs1d1O3JM3OxV6m/IJ98l7HCddq4gKMv95J04jw6VHtAscXrHoLX
	QomAKyIBBAHOEqFzYEsSUk9GU/Ju7rEZ9dWchvkvyCDOqvQ073CobaOV4aQlduMxHyduQG
	kc4m6V9oqCFAeQGXoSwjiejWAfD6c6U=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 12/15] mini-os: eliminate tpmfront union member in struct file
Date: Thu,  6 Jan 2022 12:57:38 +0100
Message-Id: <20220106115741.3219-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tpmfront specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
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


