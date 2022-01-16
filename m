Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EEB48FBB4
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257835.443274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yv-000279-AO; Sun, 16 Jan 2022 08:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257835.443274; Sun, 16 Jan 2022 08:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n90yu-0001oe-4u; Sun, 16 Jan 2022 08:33:44 +0000
Received: by outflank-mailman (input) for mailman id 257835;
 Sun, 16 Jan 2022 08:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yp-0008IP-PN
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcddc162-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00A211F3B2;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C14431346A;
 Sun, 16 Jan 2022 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SBf1LVvY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:31 +0000
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
X-Inumbo-ID: fcddc162-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/vC7tx78nDm4GqTKex/CmQNpmhFP/CrwSTFfFKDiV0=;
	b=GNbSZjwy7POyyXYRYjJBwE0+AievuggavYIBPtCINlJ6RJj6rMv5rduHp2JCvUN/g40k/l
	msxIrrAuYJr2WFo75sNf6pGbDdMSyQgpvjV1YvM8k32Zl8rZ+P/7xJETUIZ8Dqe07LobjF
	C/1ZOSGWsyRMhepceTlQyAyubIgnM6s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 07/12] use alloc_file_type() and get_file_from_fd() in netfront
Date: Sun, 16 Jan 2022 09:33:23 +0100
Message-Id: <20220116083328.26524-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the file type dynamically via alloc_file_type().

Instead of directly accessing the files[] array use get_file_from_fd().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
---
 include/lib.h      |  3 +--
 include/netfront.h |  3 ++-
 lib/sys.c          | 23 ----------------
 netfront.c         | 65 +++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 2f472b00..b0d08807 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -165,8 +165,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_SAVEFILE   5
 #define FTYPE_FB         6
 #define FTYPE_KBD        7
-#define FTYPE_TAP        8
-#define FTYPE_N          9
+#define FTYPE_N          8
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/include/netfront.h b/include/netfront.h
index ec641c80..75080c26 100644
--- a/include/netfront.h
+++ b/include/netfront.h
@@ -10,7 +10,8 @@ struct netfront_dev *init_netfront(char *nodename,
                                    char **ip);
 char *netfront_get_netmask(struct netfront_dev *dev);
 char *netfront_get_gateway(struct netfront_dev *dev);
-void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len);
+void netfront_xmit(struct netfront_dev *dev, const unsigned char *data,
+                   int len);
 void shutdown_netfront(struct netfront_dev *dev);
 void suspend_netfront(void);
 void resume_netfront(void);
diff --git a/lib/sys.c b/lib/sys.c
index 90684335..44fe848c 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -309,17 +309,6 @@ int read(int fd, void *buf, size_t nbytes)
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
@@ -382,11 +371,6 @@ int write(int fd, const void *buf, size_t nbytes)
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
@@ -487,11 +471,6 @@ int close(int fd)
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
@@ -687,7 +666,6 @@ static const char *const file_types[] = {
     [FTYPE_NONE]    = "none",
     [FTYPE_CONSOLE] = "console",
     [FTYPE_SOCKET]  = "socket",
-    [FTYPE_TAP]     = "net",
     [FTYPE_KBD]     = "kbd",
     [FTYPE_FB]      = "fb",
 };
@@ -872,7 +850,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
                 n++;
 	    FD_CLR(i, exceptfds);
 	    break;
-	case FTYPE_TAP:
 	case FTYPE_KBD:
 	case FTYPE_FB:
 	    if (FD_ISSET(i, readfds)) {
diff --git a/netfront.c b/netfront.c
index 76964514..164fdc66 100644
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
@@ -565,8 +565,53 @@ error:
 }
 
 #ifdef HAVE_LIBC
+static int netfront_read(struct file *file, void *buf, size_t nbytes)
+{
+    ssize_t ret;
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
+static int netfront_write(struct file *file, const void *buf, size_t nbytes)
+{
+    netfront_xmit(file->dev, buf, nbytes);
+
+    return nbytes;
+}
+
+static int netfront_close_fd(struct file *file)
+{
+    shutdown_netfront(file->dev);
+
+    return 0;
+}
+
+static const struct file_ops netfront_ops = {
+    .name = "net",
+    .read = netfront_read,
+    .write = netfront_write,
+    .close = netfront_close_fd,
+    .select_rd = select_read_flag,
+};
+
+static unsigned int ftype_netfront;
+
+__attribute__((constructor))
+static void netfront_initialize(void)
+{
+    ftype_netfront = alloc_file_type(&netfront_ops);
+}
+
 int netfront_tap_open(char *nodename) {
     struct netfront_dev *dev;
+    struct file *file;
 
     dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
     if (!dev) {
@@ -574,9 +619,10 @@ int netfront_tap_open(char *nodename) {
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
@@ -720,7 +766,7 @@ void init_rx_buffers(struct netfront_dev *dev)
 }
 
 
-void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
+void netfront_xmit(struct netfront_dev *dev, const unsigned char *data, int len)
 {
     int flags;
     struct netif_tx_request *tx;
@@ -772,7 +818,8 @@ void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len)
 ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t len)
 {
     unsigned long flags;
-    int fd = dev->fd;
+    struct file *file = get_file_from_fd(dev->fd);
+
     ASSERT(current == main_thread);
 
     dev->rlen = 0;
@@ -781,9 +828,9 @@ ssize_t netfront_receive(struct netfront_dev *dev, unsigned char *data, size_t l
 
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


