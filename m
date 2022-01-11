Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153248B07A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255851.438691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Imi-0000vL-Ht; Tue, 11 Jan 2022 15:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255851.438691; Tue, 11 Jan 2022 15:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Imi-0000rj-DO; Tue, 11 Jan 2022 15:10:04 +0000
Received: by outflank-mailman (input) for mailman id 255851;
 Tue, 11 Jan 2022 15:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibb-0002OZ-EE
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:35 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1fdd83-72ee-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 140D51F3B1;
 Tue, 11 Jan 2022 14:58:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0D4013DDD;
 Tue, 11 Jan 2022 14:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJu6NQ6b3WH9eQAAMHmgww
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
X-Inumbo-ID: ec1fdd83-72ee-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knuLUyCcfoEXY1jmZHvU06lOttBFfXuiA3Ntm0yi0WI=;
	b=EFpQEMzDRCsLhCQBXwK2k2H3BhcEPZ6mVmlXCvtDA/t5hqCYWRSifDDghM0bRqeB/Qviyh
	226/HA9B/EhvS77A5nxG4pPc5UV+IDGh3+e2NK89RF4Bd1b3r8ng47I4kh+vQxhzdzkNbt
	nPZY+aEIcM6SVKcxKbIOD8iDXcpP6Ks=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 16/18] mini-os: reset file type in close() in one place only
Date: Tue, 11 Jan 2022 15:58:15 +0100
Message-Id: <20220111145817.22170-17-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the file type in struct file is set to FTYPE_NONE for each
file type individually. Do that at the end of close() handling for
all types.

While at it wipe the complete struct file, too, in order to avoid
old data creeping into a new allocated struct file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 lib/sys.c | 53 ++++++++++++++++++++++++-----------------------------
 lib/xs.c  |  1 -
 2 files changed, 24 insertions(+), 30 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 0e6fe5d..323a7cd 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -424,87 +424,82 @@ int fsync(int fd) {
 
 int close(int fd)
 {
+    int res = 0;
+
     printk("close(%d)\n", fd);
     switch (files[fd].type) {
         default:
-	    files[fd].type = FTYPE_NONE;
-	    return 0;
+            break;
 #ifdef CONFIG_XENBUS
 	case FTYPE_XENBUS:
             xs_daemon_close((void*)(intptr_t) fd);
-            return 0;
+            break;
 #endif
 #ifdef HAVE_LWIP
-	case FTYPE_SOCKET: {
-	    int res = lwip_close(files[fd].fd);
-	    files[fd].type = FTYPE_NONE;
-	    return res;
-	}
+	case FTYPE_SOCKET:
+	    res = lwip_close(files[fd].fd);
+            break;
 #endif
 #ifdef CONFIG_LIBXENCTRL
 	case FTYPE_XC:
 	    minios_interface_close_fd(fd);
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_LIBXENEVTCHN
 	case FTYPE_EVTCHN:
 	    minios_evtchn_close_fd(fd);
-            return 0;
+            break;
 #endif
 #ifdef CONFIG_LIBXENGNTTAB
 	case FTYPE_GNTMAP:
 	    minios_gnttab_close_fd(fd);
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP:
 	    shutdown_netfront(files[fd].dev);
-	    files[fd].type = FTYPE_NONE;
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_BLKFRONT
 	case FTYPE_BLK:
             shutdown_blkfront(files[fd].dev);
-	    files[fd].type = FTYPE_NONE;
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_TPMFRONT
 	case FTYPE_TPMFRONT:
             shutdown_tpmfront(files[fd].dev);
-	    files[fd].type = FTYPE_NONE;
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_TPM_TIS
 	case FTYPE_TPM_TIS:
             shutdown_tpm_tis(files[fd].dev);
-	    files[fd].type = FTYPE_NONE;
-	    return 0;
+            break;
 #endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
             shutdown_kbdfront(files[fd].dev);
-            files[fd].type = FTYPE_NONE;
-            return 0;
+            break;
 #endif
 #ifdef CONFIG_FBFRONT
 	case FTYPE_FB:
             shutdown_fbfront(files[fd].dev);
-            files[fd].type = FTYPE_NONE;
-            return 0;
+            break;
 #endif
 #ifdef CONFIG_CONSFRONT
         case FTYPE_SAVEFILE:
         case FTYPE_CONSOLE:
             fini_consfront(files[fd].dev);
-            files[fd].type = FTYPE_NONE;
-            return 0;
+            break;
 #endif
 	case FTYPE_NONE:
-	    break;
+            printk("close(%d): Bad descriptor\n", fd);
+            errno = EBADF;
+            return -1;
     }
-    printk("close(%d): Bad descriptor\n", fd);
-    errno = EBADF;
-    return -1;
+
+    memset(files + fd, 0, sizeof(struct file));
+    files[fd].type = FTYPE_NONE;
+    return res;
 }
 
 static void init_stat(struct stat *buf)
diff --git a/lib/xs.c b/lib/xs.c
index 0459f52..4af0f96 100644
--- a/lib/xs.c
+++ b/lib/xs.c
@@ -35,7 +35,6 @@ void xs_daemon_close(struct xs_handle *h)
         next = event->next;
         free(event);
     }
-    files[fd].type = FTYPE_NONE;
 }
 
 int xs_fileno(struct xs_handle *h)
-- 
2.26.2


