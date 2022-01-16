Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA048FB34
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 07:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257774.443045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIF-00006i-N9; Sun, 16 Jan 2022 06:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257774.443045; Sun, 16 Jan 2022 06:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8zIF-00004q-Ef; Sun, 16 Jan 2022 06:45:35 +0000
Received: by outflank-mailman (input) for mailman id 257774;
 Sun, 16 Jan 2022 06:45:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n8zIE-0008SH-0d
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 06:45:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e56722e7-7697-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 07:45:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2085E1F3B2;
 Sun, 16 Jan 2022 06:45:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EABF313350;
 Sun, 16 Jan 2022 06:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8BQdOAm/42H0eQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 06:45:29 +0000
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
X-Inumbo-ID: e56722e7-7697-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642315530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gNDOfInVfcNlQrXw2pw9v+H3MpjcRV3L7PS0stFBOo=;
	b=Gq18xKWfycegxkOc2K08BzGK4gxRqZRSeaKgjvUjTDmZJSEaYFFdNxPROi6msHdvphQ/kY
	OChWev3wte86QRL8c4LInH5R/HDNveeIlTzGJrTGbrHUDoS8uGs0lr5/IczUhyoV/N8P3I
	vBSB+0fqlXd/qp+S6fLBklbsEaH7UzY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 2/5] reset file type in close() in one place only
Date: Sun, 16 Jan 2022 07:45:24 +0100
Message-Id: <20220116064527.23519-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116064527.23519-1-jgross@suse.com>
References: <20220116064527.23519-1-jgross@suse.com>
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
V3:
- add error handling (Andrew Cooper)
- use BUILD_BUG_ON() (Andrew Cooper)
---
 lib/sys.c | 56 ++++++++++++++++++++++++++++---------------------------
 lib/xs.c  |  1 -
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 9a03875c..7df77cc6 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -265,7 +265,7 @@ int read(int fd, void *buf, size_t nbytes)
             return ret;
         }
 #ifdef HAVE_LWIP
-	case FTYPE_SOCKET:
+        case FTYPE_SOCKET:
 	    return lwip_read(files[fd].fd, buf, nbytes);
 #endif
 #ifdef CONFIG_NETFRONT
@@ -424,84 +424,86 @@ int fsync(int fd) {
 
 int close(int fd)
 {
+    int res = 0;
+
+    if ( fd < 0 || fd >= ARRAY_SIZE(files) )
+        goto error;
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
+            res = lwip_close(files[fd].fd);
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
+            goto error;
     }
+
+    memset(files + fd, 0, sizeof(struct file));
+    BUILD_BUG_ON(FTYPE_NONE != 0);
+
+    return res;
+
+ error:
     printk("close(%d): Bad descriptor\n", fd);
     errno = EBADF;
     return -1;
diff --git a/lib/xs.c b/lib/xs.c
index 0459f52f..4af0f960 100644
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


