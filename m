Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F348640F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 12:58:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253914.435275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPB-0006lZ-1J; Thu, 06 Jan 2022 11:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253914.435275; Thu, 06 Jan 2022 11:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5RPA-0006eH-O0; Thu, 06 Jan 2022 11:58:04 +0000
Received: by outflank-mailman (input) for mailman id 253914;
 Thu, 06 Jan 2022 11:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5RP8-0005Uf-Hj
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 11:58:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2aad614-6ee7-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 12:57:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02273212CB;
 Thu,  6 Jan 2022 11:57:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB74C13C0D;
 Thu,  6 Jan 2022 11:57:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qKd1MEPZ1mHnJgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 11:57:55 +0000
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
X-Inumbo-ID: e2aad614-6ee7-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641470276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51rtfDlnCwvtylJO0A+QuSOibmO2F89Q2mcJem6Kck0=;
	b=IvjSX2gexxgKdcxmktE+tINJhUGi/QHxpWqsA/JpnM5W2NBqMGPuSUjvaFJVxQeA5wmZjW
	OT3La1KL4bWX7a/BiEaFOG1LvEHxW4lWZYOk7Fp5s/0sN6CaP2Px082/dvXYmca2T+VlTK
	7CGQ19MKJH7vWWNYzP8tE+dm9LJ5g4A=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 04/15] mini-os: replace multiple fd elements in struct file by common one
Date: Thu,  6 Jan 2022 12:57:30 +0100
Message-Id: <20220106115741.3219-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220106115741.3219-1-jgross@suse.com>
References: <20220106115741.3219-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type specific union in struct files contains two instances of
"int fd". Replace them by a common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h |  9 +--------
 lib/sys.c     | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 4d9b14b..dc56f52 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -187,14 +187,7 @@ struct file {
     bool read;	/* maybe available for read */
     off_t offset;
     union {
-	struct {
-            /* lwIP fd */
-	    int fd;
-	} socket;
-	struct {
-            /* FS import fd */
-	    int fd;
-	} file;
+        int fd; /* Any fd from an upper layer. */
 	struct {
 	    struct evtchn_port_list ports;
 	} evtchn;
diff --git a/lib/sys.c b/lib/sys.c
index e1cea70..1da7401 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -258,7 +258,7 @@ int read(int fd, void *buf, size_t nbytes)
         }
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
-	    return lwip_read(files[fd].socket.fd, buf, nbytes);
+	    return lwip_read(files[fd].fd, buf, nbytes);
 #endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP: {
@@ -335,7 +335,7 @@ int write(int fd, const void *buf, size_t nbytes)
 	    return nbytes;
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
-	    return lwip_write(files[fd].socket.fd, (void*) buf, nbytes);
+	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
 #endif
 #ifdef CONFIG_NETFRONT
 	case FTYPE_TAP:
@@ -428,7 +428,7 @@ int close(int fd)
 #endif
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET: {
-	    int res = lwip_close(files[fd].socket.fd);
+	    int res = lwip_close(files[fd].fd);
 	    files[fd].type = FTYPE_NONE;
 	    return res;
 	}
@@ -594,7 +594,7 @@ int fcntl(int fd, int cmd, ...)
 	    if (files[fd].type == FTYPE_SOCKET && !(arg & ~O_NONBLOCK)) {
 		/* Only flag supported: non-blocking mode */
 		uint32_t nblock = !!(arg & O_NONBLOCK);
-		return lwip_ioctl(files[fd].socket.fd, FIONBIO, &nblock);
+		return lwip_ioctl(files[fd].fd, FIONBIO, &nblock);
 	    }
 	    /* Fallthrough */
 #endif
@@ -732,15 +732,15 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
     for (i = 0; i < nfds; i++) {
 	if (files[i].type == FTYPE_SOCKET) {
 	    if (FD_ISSET(i, readfds)) {
-		FD_SET(files[i].socket.fd, &sock_readfds);
+		FD_SET(files[i].fd, &sock_readfds);
 		sock_nfds = i+1;
 	    }
 	    if (FD_ISSET(i, writefds)) {
-		FD_SET(files[i].socket.fd, &sock_writefds);
+		FD_SET(files[i].fd, &sock_writefds);
 		sock_nfds = i+1;
 	    }
 	    if (FD_ISSET(i, exceptfds)) {
-		FD_SET(files[i].socket.fd, &sock_exceptfds);
+		FD_SET(files[i].fd, &sock_exceptfds);
 		sock_nfds = i+1;
 	    }
 	}
@@ -803,19 +803,19 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	case FTYPE_SOCKET:
 	    if (FD_ISSET(i, readfds)) {
 	        /* Optimize no-network-packet case.  */
-		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_readfds))
+		if (sock_n && FD_ISSET(files[i].fd, &sock_readfds))
 		    n++;
 		else
 		    FD_CLR(i, readfds);
 	    }
             if (FD_ISSET(i, writefds)) {
-		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_writefds))
+		if (sock_n && FD_ISSET(files[i].fd, &sock_writefds))
 		    n++;
 		else
 		    FD_CLR(i, writefds);
             }
             if (FD_ISSET(i, exceptfds)) {
-		if (sock_n && FD_ISSET(files[i].socket.fd, &sock_exceptfds))
+		if (sock_n && FD_ISSET(files[i].fd, &sock_exceptfds))
 		    n++;
 		else
 		    FD_CLR(i, exceptfds);
@@ -1112,7 +1112,7 @@ int socket(int domain, int type, int protocol)
 	return -1;
     res = alloc_fd(FTYPE_SOCKET);
     printk("socket -> %d\n", res);
-    files[res].socket.fd = fd;
+    files[res].fd = fd;
     return res;
 }
 
@@ -1124,11 +1124,11 @@ int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
 	errno = EBADF;
 	return -1;
     }
-    fd = lwip_accept(files[s].socket.fd, addr, addrlen);
+    fd = lwip_accept(files[s].fd, addr, addrlen);
     if (fd < 0)
 	return -1;
     res = alloc_fd(FTYPE_SOCKET);
-    files[res].socket.fd = fd;
+    files[res].fd = fd;
     printk("accepted on %d -> %d\n", s, res);
     return res;
 }
@@ -1141,7 +1141,7 @@ ret name proto \
 	errno = EBADF; \
 	return -1; \
     } \
-    s = files[s].socket.fd; \
+    s = files[s].fd; \
     return lwip_##name args; \
 }
 
-- 
2.26.2


