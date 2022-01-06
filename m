Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCD486412
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 13:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253954.435402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRC-0005tG-DF; Thu, 06 Jan 2022 12:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253954.435402; Thu, 06 Jan 2022 12:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRC-0005qy-9I; Thu, 06 Jan 2022 12:00:10 +0000
Received: by outflank-mailman (input) for mailman id 253954;
 Thu, 06 Jan 2022 12:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPK-0005UX-VB
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e38fef9d-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56DD521637;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F50613C0D;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gJgyCkXZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e38fef9d-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRc5gY/92MrOjMdEN5JMRpsapAMAJSL5mvFXRrg0SZ8=;
	b=EINi4iUrnmV02sZOkEQ0aY0MAvCbGsD2i1M+BL96gDxQk8ndjP1Ku7fAFaGucY5P7HstbD
	nGCSejiWKdhxXJAYAWY1ON+bV8q5+Xo6L7ThJLjeLIGtAE4z/tNkJTAzoO2pxzssh6mziG
	1ssRJAkF0pweesDReQlfRaTtpuPCXmE=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 11/15] mini-os: move tpm respgot member of struct file to device specific data
Date: Thu,  6 Jan 2022 12:57:37 +0100
Message-Id: <20220106115741.3219-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tpmfront has a "respgot" flag in struct file, which can be moved to the
device specific data. While at it make it a bool.

The respgot flag of the tpm_tis member of struct file can be removed,
as it is never read.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h      |  2 --
 include/tpmfront.h |  2 ++
 tpm_tis.c          |  2 --
 tpmfront.c         | 10 +++++-----
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index f2a124e..d740065 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -196,13 +196,11 @@ struct file {
 #ifdef CONFIG_TPMFRONT
 	struct {
 	   struct tpmfront_dev *dev;
-	   int respgot;
 	} tpmfront;
 #endif
 #ifdef CONFIG_TPM_TIS
 	struct {
 	   struct tpm_chip *dev;
-	   int respgot;
 	} tpm_tis;
 #endif
 #ifdef CONFIG_XENBUS
diff --git a/include/tpmfront.h b/include/tpmfront.h
index c489fae..b7da50e 100644
--- a/include/tpmfront.h
+++ b/include/tpmfront.h
@@ -25,6 +25,7 @@
 #ifndef TPMFRONT_H
 #define TPMFRONT_H
 
+#include <stdbool.h>
 #include <mini-os/types.h>
 #include <mini-os/os.h>
 #include <mini-os/events.h>
@@ -53,6 +54,7 @@ struct tpmfront_dev {
 
 #ifdef HAVE_LIBC
    int fd;
+   bool respgot;
 #endif
 
 };
diff --git a/tpm_tis.c b/tpm_tis.c
index 8a632b1..4127118 100644
--- a/tpm_tis.c
+++ b/tpm_tis.c
@@ -846,7 +846,6 @@ int tpm_tis_send(struct tpm_chip* tpm, uint8_t* buf, size_t len) {
 #ifdef HAVE_LIBC
    if(tpm->fd >= 0) {
       files[tpm->fd].read = false;
-      files[tpm->fd].tpm_tis.respgot = 0;
       files[tpm->fd].offset = 0;
    }
 #endif
@@ -1290,7 +1289,6 @@ int tpm_tis_open(struct tpm_chip* tpm)
    tpm->fd = alloc_fd(FTYPE_TPM_TIS);
    printk("tpm_tis_open() -> %d\n", tpm->fd);
    files[tpm->fd].tpm_tis.dev = tpm;
-   files[tpm->fd].tpm_tis.respgot = 0;
    return tpm->fd;
 }
 
diff --git a/tpmfront.c b/tpmfront.c
index 8b2a910..be671c2 100644
--- a/tpmfront.c
+++ b/tpmfront.c
@@ -439,8 +439,8 @@ int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
 #ifdef HAVE_LIBC
    if(dev->fd >= 0) {
       files[dev->fd].read = false;
-      files[dev->fd].tpmfront.respgot = 0;
       files[dev->fd].offset = 0;
+      dev->respgot = false;
    }
 #endif
    wmb();
@@ -499,7 +499,7 @@ int i;
 #endif
 #ifdef HAVE_LIBC
    if(dev->fd >= 0) {
-      files[dev->fd].tpmfront.respgot = 1;
+      dev->respgot = true;
    }
 #endif
 quit:
@@ -539,7 +539,7 @@ int tpmfront_open(struct tpmfront_dev* dev)
    dev->fd = alloc_fd(FTYPE_TPMFRONT);
    printk("tpmfront_open(%s) -> %d\n", dev->nodename, dev->fd);
    files[dev->fd].tpmfront.dev = dev;
-   files[dev->fd].tpmfront.respgot = 0;
+   dev->respgot = false;
    return dev->fd;
 }
 
@@ -580,7 +580,7 @@ int tpmfront_posix_read(int fd, uint8_t* buf, size_t count)
    }
 
    /* get the response if we haven't already */
-   if(files[dev->fd].tpmfront.respgot == 0) {
+   if (!dev->respgot) {
       if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
 	 errno = EIO;
 	 return -1;
@@ -610,7 +610,7 @@ int tpmfront_posix_fstat(int fd, struct stat* buf)
 
    /* If we have a response waiting, then read it now from the backend
     * so we can get its length*/
-   if(dev->waiting || (files[dev->fd].read && !files[dev->fd].tpmfront.respgot)) {
+   if(dev->waiting || (files[dev->fd].read && !dev->respgot)) {
       if ((rc = tpmfront_recv(dev, &dummybuf, &dummysz)) != 0) {
 	 errno = EIO;
 	 return -1;
-- 
2.26.2


