Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A75486415
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 13:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253975.435444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRv-0007pO-D2; Thu, 06 Jan 2022 12:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253975.435444; Thu, 06 Jan 2022 12:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RRv-0007nQ-88; Thu, 06 Jan 2022 12:00:55 +0000
Received: by outflank-mailman (input) for mailman id 253975;
 Thu, 06 Jan 2022 12:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RPM-0005UX-VI
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3acd308-6ee7-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 12:57:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0A17212C7;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89F2113C0D;
 Thu,  6 Jan 2022 11:57:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6MSCIEXZ1mHnJgAAMHmgww
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
X-Inumbo-ID: e3acd308-6ee7-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=479+ZsaQ/HR1Ri0lahF7rot1Udcg9gaoznCeT0QqN9I=;
	b=fP1cCOY+bPvVqpVlay1gDfX8O7NpxJ+V8buwFGlupD4VRta30a8gBxfuW2lXra6O/GVt+e
	pCzOXGwBw69b5smW/dAVi5M7tLZhZnqyLla5hcIvKtzGf+KKc8LR+RbsGKk0FY9xQfmcFe
	f4HEdxeC+uV07G6NiofcCCeYE3k5TIQ=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 13/15] mini-os: eliminate tpmtis union member in struct file
Date: Thu,  6 Jan 2022 12:57:39 +0100
Message-Id: <20220106115741.3219-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the tpmtis specific union member in struct file with the
common dev pointer.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h | 5 -----
 lib/sys.c     | 2 +-
 tpm_tis.c     | 8 ++++----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 2ddc076..d6a29ba 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -193,11 +193,6 @@ struct file {
 	    struct evtchn_port_list ports;
 	} evtchn;
 	struct gntmap gntmap;
-#ifdef CONFIG_TPM_TIS
-	struct {
-	   struct tpm_chip *dev;
-	} tpm_tis;
-#endif
 #ifdef CONFIG_XENBUS
         struct {
             /* To each xenbus FD is associated a queue of watch events for this
diff --git a/lib/sys.c b/lib/sys.c
index b042bf5..96fc769 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -468,7 +468,7 @@ int close(int fd)
 #endif
 #ifdef CONFIG_TPM_TIS
 	case FTYPE_TPM_TIS:
-            shutdown_tpm_tis(files[fd].tpm_tis.dev);
+            shutdown_tpm_tis(files[fd].dev);
 	    files[fd].type = FTYPE_NONE;
 	    return 0;
 #endif
diff --git a/tpm_tis.c b/tpm_tis.c
index 4127118..477f555 100644
--- a/tpm_tis.c
+++ b/tpm_tis.c
@@ -1288,14 +1288,14 @@ int tpm_tis_open(struct tpm_chip* tpm)
 
    tpm->fd = alloc_fd(FTYPE_TPM_TIS);
    printk("tpm_tis_open() -> %d\n", tpm->fd);
-   files[tpm->fd].tpm_tis.dev = tpm;
+   files[tpm->fd].dev = tpm;
    return tpm->fd;
 }
 
 int tpm_tis_posix_write(int fd, const uint8_t* buf, size_t count)
 {
    struct tpm_chip* tpm;
-   tpm = files[fd].tpm_tis.dev;
+   tpm = files[fd].dev;
 
    if(tpm->locality < 0) {
       printk("tpm_tis_posix_write() failed! locality not set!\n");
@@ -1323,7 +1323,7 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
 {
    int rc;
    struct tpm_chip* tpm;
-   tpm = files[fd].tpm_tis.dev;
+   tpm = files[fd].dev;
 
    if(count == 0) {
       return 0;
@@ -1350,7 +1350,7 @@ int tpm_tis_posix_read(int fd, uint8_t* buf, size_t count)
 int tpm_tis_posix_fstat(int fd, struct stat* buf)
 {
    struct tpm_chip* tpm;
-   tpm = files[fd].tpm_tis.dev;
+   tpm = files[fd].dev;
 
    buf->st_mode = O_RDWR;
    buf->st_uid = 0;
-- 
2.26.2


