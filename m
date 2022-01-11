Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C848B08B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255876.438798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ip4-0004Gd-4K; Tue, 11 Jan 2022 15:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255876.438798; Tue, 11 Jan 2022 15:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Ip3-00045B-6w; Tue, 11 Jan 2022 15:12:29 +0000
Received: by outflank-mailman (input) for mailman id 255876;
 Tue, 11 Jan 2022 15:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ioz-0002Fw-DT
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 15:12:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddef8a1b-72f0-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 16:12:18 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43AEB1F3B1;
 Tue, 11 Jan 2022 15:12:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1886213DDD;
 Tue, 11 Jan 2022 15:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EL60BFKe3WG8AwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 15:12:18 +0000
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
X-Inumbo-ID: ddef8a1b-72f0-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVhuzq1ru9rCdLBgGyz4Ec9Qdw5HVMOj866c/uvvnJ8=;
	b=fyJ4xFFUjaB4MnesIRmrqRCUyyfsdRLZi/4jAokXUD4t39jqDelNiYROsMocP1Jn8duNF5
	3aXoFY79DAEDfznK9s5FKTjKbNTmsAm4DM/K6s+zw14+ofdru7KNAIy+Y4wnFdCIr+Zlo6
	tgL1v0m2i/UlH2Hrb05Ko68zCifDARI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 07/12] mini-os: use get_file_from_fd() in netfront
Date: Tue, 11 Jan 2022 16:12:10 +0100
Message-Id: <20220111151215.22955-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111151215.22955-1-jgross@suse.com>
References: <20220111151215.22955-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/lib.h |  3 +--
 lib/sys.c     | 23 ------------------
 netfront.c    | 64 ++++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 57 insertions(+), 33 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 05f5083..aa8036e 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -163,8 +163,7 @@ void sanity_check(void);
 #define FTYPE_SAVEFILE   5
 #define FTYPE_FB         6
 #define FTYPE_KBD        7
-#define FTYPE_TAP        8
-#define FTYPE_N          9
+#define FTYPE_N          8
 #define FTYPE_SPARE     16
 
 typedef int file_read_func(int fd, void *buf, size_t nbytes);
diff --git a/lib/sys.c b/lib/sys.c
index f84fedd..7f2e11f 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -303,17 +303,6 @@ int read(int fd, void *buf, size_t nbytes)
 	case FTYPE_SOCKET:
 	    return lwip_read(files[fd].fd, buf, nbytes);
 #endif
-#ifdef CONFIG_NETFRONT
-	case FTYPE_TAP: {
-	    ssize_t ret;
-	    ret = netfront_receive(files[fd].dev, buf, nbytes);
-	    if (ret <= 0) {
-		errno = EAGAIN;
-		return -1;
-	    }
-	    return ret;
-	}
-#endif
 #ifdef CONFIG_KBDFRONT
         case FTYPE_KBD: {
             int ret, n;
@@ -369,11 +358,6 @@ int write(int fd, const void *buf, size_t nbytes)
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
 	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
-#endif
-#ifdef CONFIG_NETFRONT
-	case FTYPE_TAP:
-	    netfront_xmit(files[fd].dev, (void*) buf, nbytes);
-	    return nbytes;
 #endif
 	default:
 	    break;
@@ -459,11 +443,6 @@ int close(int fd)
 	    res = lwip_close(files[fd].fd);
             break;
 #endif
-#ifdef CONFIG_NETFRONT
-	case FTYPE_TAP:
-	    shutdown_netfront(files[fd].dev);
-            break;
-#endif
 #ifdef CONFIG_KBDFRONT
 	case FTYPE_KBD:
             shutdown_kbdfront(files[fd].dev);
@@ -640,7 +619,6 @@ static const char *file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_SOCKET]  = "socket",
-    [FTYPE_TAP]     = "net",
     [FTYPE_KBD]     = "kbd",
     [FTYPE_FB]      = "fb",
 };
@@ -817,7 +795,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-	case FTYPE_TAP:
 	case FTYPE_KBD:
 	case FTYPE_FB:
 	    if (FD_ISSET(i, readfds)) {
diff --git a/netfront.c b/netfront.c
index 7696451..f86c6a2 100644
--- a/netfront.c
+++ b/netfront.c
@@ -248,14 +248,14 @@ void netfront_select_handler(evtchn_port_t port, struct pt_regs *regs, void *dat
 {
     int flags;
     struct netfront_dev *dev = data;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
 
     local_irq_save(flags);
     network_tx_buf_gc(dev);
     local_irq_restore(flags);
 
-    if (fd != -1)
-        files[fd].read = true;
+    if ( file )
+        file->read = true;
     wake_up(&netfront_queue);
 }
 #endif
@@ -565,8 +565,54 @@ error:
 }
 
 #ifdef HAVE_LIBC
+static int netfront_read(int fd, void *buf, size_t nbytes)
+{
+    ssize_t ret;
+    struct file *file = get_file_from_fd(fd);
+
+    ret = netfront_receive(file->dev, buf, nbytes);
+    if ( ret <= 0 )
+    {
+        errno = EAGAIN;
+        return -1;
+    }
+
+    return ret;
+}
+
+static int netfront_write(int fd, const void *buf, size_t nbytes)
+{
+    struct file *file = get_file_from_fd(fd);
+
+    netfront_xmit(file->dev, (void *)buf, nbytes);
+
+    return nbytes;
+}
+
+static int netfront_close_fd(int fd)
+{
+    struct file *file = get_file_from_fd(fd);
+
+    shutdown_netfront(file->dev);
+
+    return 0;
+}
+
+static struct file_ops netfront_ops = {
+    .name = "net",
+    .read = netfront_read,
+    .write = netfront_write,
+    .close = netfront_close_fd,
+    .select_rd = select_read_flag,
+};
+
 int netfront_tap_open(char *nodename) {
     struct netfront_dev *dev;
+    struct file *file;
+    static unsigned int ftype_netfront;
+
+    if ( !ftype_netfront )
+        ftype_netfront = alloc_file_type(&netfront_ops);
 
     dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
     if (!dev) {
@@ -574,9 +620,10 @@ int netfront_tap_open(char *nodename) {
 	errno = EIO;
 	return -1;
     }
-    dev->fd = alloc_fd(FTYPE_TAP);
+    dev->fd = alloc_fd(ftype_netfront);
     printk("tap_open(%s) -> %d\n", nodename, dev->fd);
-    files[dev->fd].dev = dev;
+    file = get_file_from_fd(dev->fd);
+    file->dev = dev;
     return dev->fd;
 }
 #endif
@@ -772,7 +819,8 @@ void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
 ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t len)
 {
     unsigned long flags;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
+
     ASSERT(current == main_thread);
 
     dev->rlen = 0;
@@ -781,9 +829,9 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
 
     local_irq_save(flags);
     network_rx(dev);
-    if (!dev->rlen && fd != -1)
+    if ( !dev->rlen && file )
         /* No data for us, make select stop returning */
-        files[fd].read = false;
+        file->read = false;
     /* Before re-enabling the interrupts, in case a packet just arrived in the
      * meanwhile. */
     local_irq_restore(flags);
-- 
2.26.2


