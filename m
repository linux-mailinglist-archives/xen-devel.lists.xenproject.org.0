Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B448FBC1
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 09:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257847.443339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n912o-0007I8-PH; Sun, 16 Jan 2022 08:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257847.443339; Sun, 16 Jan 2022 08:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n912o-0007GD-LU; Sun, 16 Jan 2022 08:37:46 +0000
Received: by outflank-mailman (input) for mailman id 257847;
 Sun, 16 Jan 2022 08:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n90yu-0008IP-Py
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 08:33:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd1a925e-76a6-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 09:33:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5A1D7219C7;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E8D01346A;
 Sun, 16 Jan 2022 08:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gPIjClzY42HyFQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 16 Jan 2022 08:33:32 +0000
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
X-Inumbo-ID: fd1a925e-76a6-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642322012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVU0gEoX6rgZcZx+F07Qd6YUFiSDhtCjunERzqwuuYk=;
	b=kj5H3Kwbv0IQeztJ2dd0pWzgAEKjc2F6gZ1nJtUuQfy6YV6Cjl4u6ZTGGeKwgTo7EAVsDX
	ButBi2+MBU5DgfFtoLlRBAVhyGiq0dbQNegG0SPOxnAVadBQ5XZW+wBukIZ5YCu3/ECgWD
	ERv+eG/nVxiPO4IgDxOPcTj9GDOcYDo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINIOS PATCH v3 09/12] use file_ops and get_file_from_fd() for console
Date: Sun, 16 Jan 2022 09:33:25 +0100
Message-Id: <20220116083328.26524-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220116083328.26524-1-jgross@suse.com>
References: <20220116083328.26524-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add struct file_ops for the console related file types (FTYPE_CONSOLE
and savefile). FTYPE_CONSOLE remains statically defined, as it is used
to statically init stdin, stdout and stderr.

Instead of directly accessing the files[] array use get_file_from_fd().

With CONSOLE now handled via file_ops the bogus file descriptor case in
select_poll() now needs to be handled more explicit instead of dropping
into console handling, assuming that this case was basically meant to
cover SAVEFILE.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- switch to struct file * parameter for callbacks
- use __attribute__((constructor))
- make console_print() take a const pointer (Andrew Cooper)
---
 console/console.c      |   2 +-
 console/xenbus.c       | 112 +++++++++++++++++++++++++++++++++++++++++
 console/xencons_ring.c |   6 +--
 include/console.h      |   7 ++-
 include/lib.h          |   3 +-
 lib/sys.c              |  87 ++++++++------------------------
 6 files changed, 144 insertions(+), 73 deletions(-)

diff --git a/console/console.c b/console/console.c
index af1a6dd3..68c8435e 100644
--- a/console/console.c
+++ b/console/console.c
@@ -76,7 +76,7 @@ void xencons_tx(void)
 #endif
 
 
-void console_print(struct consfront_dev *dev, char *data, int length)
+void console_print(struct consfront_dev *dev, const char *data, int length)
 {
     char *curr_char, saved_char;
     char copied_str[length+1];
diff --git a/console/xenbus.c b/console/xenbus.c
index 05fc31c0..d8950454 100644
--- a/console/xenbus.c
+++ b/console/xenbus.c
@@ -192,3 +192,115 @@ void fini_consfront(struct consfront_dev *dev)
 {
     if (dev) free_consfront(dev);
 }
+
+#ifdef HAVE_LIBC
+static int consfront_read(struct file *file, void *buf, size_t nbytes)
+{
+    int ret;
+    DEFINE_WAIT(w);
+
+    while ( 1 )
+    {
+        add_waiter(w, console_queue);
+        ret = xencons_ring_recv(file->dev, buf, nbytes);
+        if ( ret )
+            break;
+        schedule();
+    }
+
+    remove_waiter(w, console_queue);
+
+    return ret;
+}
+
+static int savefile_write(struct file *file, const void *buf, size_t nbytes)
+{
+    int ret = 0, tot = nbytes;
+
+    while ( nbytes > 0 )
+    {
+        ret = xencons_ring_send(file->dev, buf, nbytes);
+        nbytes -= ret;
+        buf = (char *)buf + ret;
+    }
+
+    return tot - nbytes;
+}
+
+static int console_write(struct file *file, const void *buf, size_t nbytes)
+{
+    console_print(file->dev, buf, nbytes);
+
+    return nbytes;
+}
+
+static int consfront_close_fd(struct file *file)
+{
+    fini_consfront(file->dev);
+
+    return 0;
+}
+
+static int consfront_fstat(struct file *file, struct stat *buf)
+{
+    buf->st_mode = S_IRUSR | S_IWUSR;
+    buf->st_mode |= (file->type == FTYPE_CONSOLE) ? S_IFCHR : S_IFREG;
+    buf->st_atime = buf->st_mtime = buf->st_ctime = time(NULL);
+
+    return 0;
+}
+
+static bool consfront_select_rd(struct file *file)
+{
+    return xencons_ring_avail(file->dev);
+}
+
+static const struct file_ops savefile_ops = {
+    .name = "savefile",
+    .read = consfront_read,
+    .write = savefile_write,
+    .close = consfront_close_fd,
+    .fstat = consfront_fstat,
+    .select_rd = consfront_select_rd,
+    .select_wr = select_yes,
+};
+
+const struct file_ops console_ops = {
+    .name = "console",
+    .read = consfront_read,
+    .write = console_write,
+    .close = consfront_close_fd,
+    .fstat = consfront_fstat,
+    .select_rd = consfront_select_rd,
+    .select_wr = select_yes,
+};
+
+static unsigned int ftype_savefile;
+
+__attribute__((constructor))
+static void consfront_initialize(void)
+{
+    ftype_savefile = alloc_file_type(&savefile_ops);
+}
+
+int open_consfront(char *nodename)
+{
+    struct consfront_dev *dev;
+    struct file *file;
+
+    dev = init_consfront(nodename);
+    if ( !dev )
+        return -1;
+
+    dev->fd = alloc_fd(nodename ? ftype_savefile : FTYPE_CONSOLE);
+    file = get_file_from_fd(dev->fd);
+    if ( !file )
+    {
+        fini_consfront(dev);
+        return -1;
+    }
+    file->dev = dev;
+
+    return dev->fd;
+}
+#endif
diff --git a/console/xencons_ring.c b/console/xencons_ring.c
index c348f3ce..efedf46b 100644
--- a/console/xencons_ring.c
+++ b/console/xencons_ring.c
@@ -99,10 +99,10 @@ void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
 	struct consfront_dev *dev = (struct consfront_dev *) data;
 #ifdef HAVE_LIBC
-        int fd = dev ? dev->fd : -1;
+        struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
 
-        if (fd != -1)
-            files[fd].read = true;
+        if ( file )
+            file->read = true;
 
         wake_up(&console_queue);
 #else
diff --git a/include/console.h b/include/console.h
index 0d7bf077..e76e4234 100644
--- a/include/console.h
+++ b/include/console.h
@@ -39,6 +39,7 @@
 #include <mini-os/os.h>
 #include <mini-os/traps.h>
 #include <mini-os/types.h>
+#include <mini-os/lib.h>
 #include <xen/grant_table.h>
 #include <xenbus.h>
 #include <xen/io/console.h>
@@ -77,7 +78,7 @@ void xencons_tx(void);
 
 void get_console(void *p);
 void init_console(void);
-void console_print(struct consfront_dev *dev, char *data, int length);
+void console_print(struct consfront_dev *dev, const char *data, int length);
 void fini_consfront(struct consfront_dev *dev);
 void suspend_console(void);
 void resume_console(void);
@@ -93,5 +94,9 @@ int xencons_ring_send_no_notify(struct consfront_dev *dev, const char *data, uns
 int xencons_ring_avail(struct consfront_dev *dev);
 int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned len);
 void free_consfront(struct consfront_dev *dev);
+#ifdef HAVE_LIBC
+extern const struct file_ops console_ops;
+int open_consfront(char *nodename);
+#endif
 
 #endif /* _LIB_CONSOLE_H_ */
diff --git a/include/lib.h b/include/lib.h
index b1beeed3..e815e0a3 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -162,8 +162,7 @@ extern struct wait_queue_head event_queue;
 #define FTYPE_FILE       2
 #define FTYPE_SOCKET     3
 #define FTYPE_MEM        4
-#define FTYPE_SAVEFILE   5
-#define FTYPE_N          6
+#define FTYPE_N          5
 #define FTYPE_SPARE     16
 
 struct file {
diff --git a/lib/sys.c b/lib/sys.c
index db26fd2d..74c82b2a 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -101,6 +101,9 @@ static const struct file_ops file_ops_none = {
 
 static const struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
     [FTYPE_NONE] = &file_ops_none,
+#ifdef CONFIG_CONSFRONT
+    [FTYPE_CONSOLE] = &console_ops,
+#endif
 };
 
 unsigned int alloc_file_type(const struct file_ops *ops)
@@ -212,31 +215,26 @@ int mkdir(const char *pathname, mode_t mode)
 #ifdef CONFIG_CONSFRONT
 int posix_openpt(int flags)
 {
-    struct consfront_dev *dev;
+    int fd;
 
     /* Ignore flags */
+    fd = open_consfront(NULL);
+    printk("fd(%d) = posix_openpt\n", fd);
 
-    dev = init_consfront(NULL);
-    dev->fd = alloc_fd(FTYPE_CONSOLE);
-    files[dev->fd].dev = dev;
-
-    printk("fd(%d) = posix_openpt\n", dev->fd);
-    return(dev->fd);
+    return fd;
 }
 
 int open_savefile(const char *path, int save)
 {
-    struct consfront_dev *dev;
+    int fd;
     char nodename[64];
 
     snprintf(nodename, sizeof(nodename), "device/console/%d", save ? SAVE_CONSOLE : RESTORE_CONSOLE);
 
-    dev = init_consfront(nodename);
-    dev->fd = alloc_fd(FTYPE_SAVEFILE);
-    files[dev->fd].dev = dev;
+    fd = open_consfront(nodename);
+    printk("fd(%d) = open_savefile\n", fd);
 
-    printk("fd(%d) = open_savefile\n", dev->fd);
-    return(dev->fd);
+    return fd;
 }
 #else
 int posix_openpt(int flags)
@@ -291,20 +289,6 @@ int read(int fd, void *buf, size_t nbytes)
         return ops->read(file, buf, nbytes);
 
     switch (file->type) {
-        case FTYPE_SAVEFILE:
-	case FTYPE_CONSOLE: {
-	    int ret;
-            DEFINE_WAIT(w);
-            while(1) {
-                add_waiter(w, console_queue);
-                ret = xencons_ring_recv(files[fd].dev, buf, nbytes);
-                if (ret)
-                    break;
-                schedule();
-            }
-            remove_waiter(w, console_queue);
-            return ret;
-        }
 #ifdef HAVE_LWIP
         case FTYPE_SOCKET:
 	    return lwip_read(files[fd].fd, buf, nbytes);
@@ -332,18 +316,6 @@ int write(int fd, const void *buf, size_t nbytes)
         return ops->write(file, buf, nbytes);
 
     switch (file->type) {
-        case FTYPE_SAVEFILE: {
-                int ret = 0, tot = nbytes;
-                while (nbytes > 0) {
-                    ret = xencons_ring_send(files[fd].dev, (char *)buf, nbytes);
-                    nbytes -= ret;
-                    buf = (char *)buf + ret;
-                }
-                return tot - nbytes;
-            }
-	case FTYPE_CONSOLE:
-	    console_print(files[fd].dev, (char *)buf, nbytes);
-	    return nbytes;
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
 	    return lwip_write(files[fd].fd, (void*) buf, nbytes);
@@ -446,12 +418,6 @@ int close(int fd)
 	case FTYPE_SOCKET:
             res = lwip_close(files[fd].fd);
             break;
-#endif
-#ifdef CONFIG_CONSFRONT
-        case FTYPE_SAVEFILE:
-        case FTYPE_CONSOLE:
-            fini_consfront(files[fd].dev);
-            break;
 #endif
 	case FTYPE_NONE:
             goto error;
@@ -501,15 +467,8 @@ int fstat(int fd, struct stat *buf)
         return ops->fstat(file, buf);
 
     switch (file->type) {
-	case FTYPE_SAVEFILE:
-	case FTYPE_CONSOLE:
 	case FTYPE_SOCKET: {
-            if (files[fd].type == FTYPE_CONSOLE)
-                buf->st_mode = S_IFCHR|S_IRUSR|S_IWUSR;
-            else if (files[fd].type == FTYPE_SOCKET)
-                buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
-            else if (files[fd].type == FTYPE_SAVEFILE)
-                buf->st_mode = S_IFREG|S_IRUSR|S_IWUSR;
+            buf->st_mode = S_IFSOCK|S_IRUSR|S_IWUSR;
 	    buf->st_uid = 0;
 	    buf->st_gid = 0;
 	    buf->st_size = 0;
@@ -630,7 +589,6 @@ int closedir(DIR *dir)
 #if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
 static const char *const file_types[] = {
     [FTYPE_NONE]    = "none",
-    [FTYPE_CONSOLE] = "console",
     [FTYPE_SOCKET]  = "socket",
 };
 
@@ -799,21 +757,18 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
             }
 
 	    if (FD_ISSET(i, readfds) || FD_ISSET(i, writefds) || FD_ISSET(i, exceptfds))
+            {
 		printk("bogus fd %d in select\n", i);
-	    /* Fallthrough.  */
-        }
-
-	case FTYPE_CONSOLE:
-	    if (FD_ISSET(i, readfds)) {
-                if (xencons_ring_avail(files[i].dev))
-		    n++;
-		else
-		    FD_CLR(i, readfds);
+                if ( FD_ISSET(i, readfds) )
+                    FD_CLR(i, readfds);
+                if ( FD_ISSET(i, writefds) )
+                    FD_CLR(i, writefds);
+                if ( FD_ISSET(i, exceptfds) )
+                    FD_CLR(i, exceptfds);
             }
-	    if (FD_ISSET(i, writefds))
-                n++;
-	    FD_CLR(i, exceptfds);
 	    break;
+        }
+
 #ifdef HAVE_LWIP
 	case FTYPE_SOCKET:
 	    if (FD_ISSET(i, readfds)) {
-- 
2.26.2


