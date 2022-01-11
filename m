Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AC448B06F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 16:08:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255823.438606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Il8-0005HY-ER; Tue, 11 Jan 2022 15:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255823.438606; Tue, 11 Jan 2022 15:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Il8-0005ER-Ax; Tue, 11 Jan 2022 15:08:26 +0000
Received: by outflank-mailman (input) for mailman id 255823;
 Tue, 11 Jan 2022 15:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Ibi-0002Oa-EL
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:58:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec45faef-72ee-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:58:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 476361F3BB;
 Tue, 11 Jan 2022 14:58:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B56813DDD;
 Tue, 11 Jan 2022 14:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Jl+BQ+b3WH9eQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 14:58:23 +0000
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
X-Inumbo-ID: ec45faef-72ee-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641913103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhH/Bo3lirfkf7NoVUI5lwaB8z0a64DTHY6OLddxQ6Q=;
	b=N0yIni7CUgPltcFS9sVSL589r0Kj+q5S/ADpIDzeweucEGAEh95WRb6hVaOCFkGNvGKyMo
	GVSiEJ0yZ6jqAnsDEtRT39cSKfH7pD5P21357Md51nDjxBhuWFvRxsmHsPGLSgxXjyOg5T
	GJyQlwHB1lVrXjMeIUz3gngOpJs3REc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 17/18] mini-os: use function vectors instead of switch for file operations
Date: Tue, 11 Jan 2022 15:58:16 +0100
Message-Id: <20220111145817.22170-18-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220111145817.22170-1-jgross@suse.com>
References: <20220111145817.22170-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce file type specific function vectors for all the needed file
operations which are file type specific in order to prepare replacing
the large switch statements in each generic file function.

Add a function to allocate a new file type dynamically in order to
prepare removing direct dependencies to external components in the
future. For this reason switch the file type from an enum to an
unsigned int. Prepare removal of some statically defines file types
by putting them at the end of the defined list.

Change the debug output for the file type from a single character to
a string in order to support a future removal of the file_types[]
array.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 include/lib.h |  65 +++++++++++-----
 lib/sys.c     | 208 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 217 insertions(+), 56 deletions(-)

diff --git a/include/lib.h b/include/lib.h
index 7a0546b..b40e213 100644
--- a/include/lib.h
+++ b/include/lib.h
@@ -66,6 +66,7 @@
 
 #ifdef HAVE_LIBC
 #include <sys/queue.h>
+#include <sys/stat.h>
 #include <stdio.h>
 #include <string.h>
 #else
@@ -154,25 +155,51 @@ do {                                                           \
 void sanity_check(void);
 
 #ifdef HAVE_LIBC
-enum fd_type {
-    FTYPE_NONE = 0,
-    FTYPE_CONSOLE,
-    FTYPE_FILE,
-    FTYPE_XENBUS,
-    FTYPE_XC,
-    FTYPE_EVTCHN,
-    FTYPE_GNTMAP,
-    FTYPE_SOCKET,
-    FTYPE_TAP,
-    FTYPE_BLK,
-    FTYPE_KBD,
-    FTYPE_FB,
-    FTYPE_MEM,
-    FTYPE_SAVEFILE,
-    FTYPE_TPMFRONT,
-    FTYPE_TPM_TIS,
+#define FTYPE_NONE       0
+#define FTYPE_CONSOLE    1
+#define FTYPE_FILE       2
+#define FTYPE_SOCKET     3
+#define FTYPE_MEM        4
+#define FTYPE_SAVEFILE   5
+#define FTYPE_FB         6
+#define FTYPE_KBD        7
+#define FTYPE_TAP        8
+#define FTYPE_BLK        9
+#define FTYPE_TPMFRONT  10
+#define FTYPE_TPM_TIS   11
+#define FTYPE_XENBUS    12
+#define FTYPE_GNTMAP    13
+#define FTYPE_EVTCHN    14
+#define FTYPE_XC        15
+#define FTYPE_N         16
+#define FTYPE_SPARE     16
+
+typedef int file_read_func(int fd, void *buf, size_t nbytes);
+typedef int file_write_func(int fd, const void *buf, size_t nbytes);
+typedef off_t file_lseek_func(int fd, off_t offset, int whence);
+typedef int file_close_func(int fd);
+typedef int file_fstat_func(int fd, struct stat *buf);
+typedef int file_fcntl_func(int fd, int cmd, va_list args);
+typedef bool file_select_func(int fd);
+
+struct file_ops {
+    const char *name;
+    file_read_func *read;
+    file_write_func *write;
+    file_lseek_func *lseek;
+    file_close_func *close;
+    file_fstat_func *fstat;
+    file_fcntl_func *fcntl;
+    file_select_func *select_rd;
+    file_select_func *select_wr;
 };
 
+unsigned int alloc_file_type(struct file_ops *ops);
+
+off_t lseek_default(int fd, off_t offset, int whence);
+bool select_yes(int fd);
+bool select_read_flag(int fd);
+
 LIST_HEAD(evtchn_port_list, evtchn_port_info);
 
 struct evtchn_port_info {
@@ -183,7 +210,7 @@ struct evtchn_port_info {
 };
 
 struct file {
-    enum fd_type type;
+    unsigned int type;
     bool read;	/* maybe available for read */
     off_t offset;
     union {
@@ -199,7 +226,7 @@ struct file {
 extern struct file files[];
 
 struct file *get_file_from_fd(int fd);
-int alloc_fd(enum fd_type type);
+int alloc_fd(unsigned int type);
 void close_all_files(void);
 extern struct thread *main_thread;
 void sparse(unsigned long data, size_t size);
diff --git a/lib/sys.c b/lib/sys.c
index 323a7cd..c327247 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -98,6 +98,39 @@ struct file files[NOFILE] = {
     { .type = FTYPE_CONSOLE }, /* stderr */
 };
 
+static struct file_ops file_ops_none = {
+    .name = "none",
+};
+
+static struct file_ops *file_ops[FTYPE_N + FTYPE_SPARE] = {
+    [FTYPE_NONE] = &file_ops_none,
+};
+
+unsigned int alloc_file_type(struct file_ops *ops)
+{
+    unsigned int i;
+
+    pthread_mutex_lock(&fd_lock);
+
+    for ( i = FTYPE_N; i < ARRAY_SIZE(file_ops) && file_ops[i]; i++ );
+    BUG_ON(i == ARRAY_SIZE(file_ops));
+    file_ops[i] = ops;
+
+    pthread_mutex_unlock(&fd_lock);
+
+    printk("New file type \"%s\"(%u) allocated\n", ops->name, i);
+
+    return i;
+}
+
+static struct file_ops *get_file_ops(unsigned int type)
+{
+    if ( type >= ARRAY_SIZE(file_ops) || !file_ops[type] )
+        return &file_ops_none;
+
+    return file_ops[type];
+}
+
 struct file *get_file_from_fd(int fd)
 {
     if ( fd < 0 || fd >= NOFILE )
@@ -108,7 +141,7 @@ struct file *get_file_from_fd(int fd)
 
 DECLARE_WAIT_QUEUE_HEAD(event_queue);
 
-int alloc_fd(enum fd_type type)
+int alloc_fd(unsigned int type)
 {
     int i;
     pthread_mutex_lock(&fd_lock);
@@ -249,6 +282,11 @@ int isatty(int fd)
 
 int read(int fd, void *buf, size_t nbytes)
 {
+    struct file_ops *ops = get_file_ops(files[fd].type);
+
+    if ( ops->read )
+        return ops->read(fd, buf, nbytes);
+
     switch (files[fd].type) {
         case FTYPE_SAVEFILE:
 	case FTYPE_CONSOLE: {
@@ -328,6 +366,11 @@ int read(int fd, void *buf, size_t nbytes)
 
 int write(int fd, const void *buf, size_t nbytes)
 {
+    struct file_ops *ops = get_file_ops(files[fd].type);
+
+    if ( ops->write )
+        return ops->write(fd, buf, nbytes);
+
     switch (files[fd].type) {
         case FTYPE_SAVEFILE: {
                 int ret = 0, tot = nbytes;
@@ -370,8 +413,45 @@ int write(int fd, const void *buf, size_t nbytes)
     return -1;
 }
 
+off_t lseek_default(int fd, off_t offset, int whence)
+{
+    switch ( whence )
+    {
+    case SEEK_SET:
+        files[fd].offset = offset;
+        break;
+
+    case SEEK_CUR:
+        files[fd].offset += offset;
+        break;
+
+    case SEEK_END:
+    {
+        struct stat st;
+        int ret;
+
+        ret = fstat(fd, &st);
+        if ( ret )
+            return -1;
+        files[fd].offset = st.st_size + offset;
+        break;
+    }
+
+    default:
+        errno = EINVAL;
+        return -1;
+    }
+
+    return files[fd].offset;
+}
+
 off_t lseek(int fd, off_t offset, int whence)
 {
+    struct file_ops *ops = get_file_ops(files[fd].type);
+
+    if ( ops->lseek )
+        return ops->lseek(fd, offset, whence);
+
     switch(files[fd].type) {
 #ifdef CONFIG_BLKFRONT
        case FTYPE_BLK:
@@ -393,28 +473,7 @@ off_t lseek(int fd, off_t offset, int whence)
           return (off_t) -1;
     }
 
-    switch (whence) {
-       case SEEK_SET:
-          files[fd].offset = offset;
-          break;
-       case SEEK_CUR:
-          files[fd].offset += offset;
-          break;
-       case SEEK_END:
-          {
-             struct stat st;
-             int ret;
-             ret = fstat(fd, &st);
-             if (ret)
-                return -1;
-             files[fd].offset = st.st_size + offset;
-             break;
-          }
-       default:
-          errno = EINVAL;
-          return -1;
-    }
-    return files[fd].offset;
+    return lseek_default(fd, offset, whence);
 }
 
 int fsync(int fd) {
@@ -425,8 +484,15 @@ int fsync(int fd) {
 int close(int fd)
 {
     int res = 0;
+    struct file_ops *ops = get_file_ops(files[fd].type);
 
     printk("close(%d)\n", fd);
+    if ( ops->close )
+    {
+        res = ops->close(fd);
+        goto out;
+    }
+
     switch (files[fd].type) {
         default:
             break;
@@ -497,6 +563,7 @@ int close(int fd)
             return -1;
     }
 
+ out:
     memset(files + fd, 0, sizeof(struct file));
     files[fd].type = FTYPE_NONE;
     return res;
@@ -521,7 +588,13 @@ int stat(const char *path, struct stat *buf)
 
 int fstat(int fd, struct stat *buf)
 {
+    struct file_ops *ops = get_file_ops(files[fd].type);
+
     init_stat(buf);
+
+    if ( ops->fstat )
+        return ops->fstat(fd, buf);
+
     switch (files[fd].type) {
 	case FTYPE_SAVEFILE:
 	case FTYPE_CONSOLE:
@@ -587,6 +660,18 @@ int fcntl(int fd, int cmd, ...)
 {
     long arg;
     va_list ap;
+    int res;
+    struct file_ops *ops = get_file_ops(files[fd].type);
+
+    if ( ops->fcntl )
+    {
+        va_start(ap, cmd);
+        res = ops->fcntl(fd, cmd, ap);
+        va_end(ap);
+
+        return res;
+    }
+
     va_start(ap, cmd);
     arg = va_arg(ap, long);
     va_end(ap);
@@ -640,18 +725,29 @@ int closedir(DIR *dir)
 /* We assume that only the main thread calls select(). */
 
 #if defined(LIBC_DEBUG) || defined(LIBC_VERBOSE)
-static const char file_types[] = {
-    [FTYPE_NONE]	= 'N',
-    [FTYPE_CONSOLE]	= 'C',
-    [FTYPE_XENBUS]	= 'S',
-    [FTYPE_XC]		= 'X',
-    [FTYPE_EVTCHN]	= 'E',
-    [FTYPE_SOCKET]	= 's',
-    [FTYPE_TAP]		= 'T',
-    [FTYPE_BLK]		= 'B',
-    [FTYPE_KBD]		= 'K',
-    [FTYPE_FB]		= 'G',
+static const char *file_types[] = {
+    [FTYPE_NONE]    = "none",
+    [FTYPE_CONSOLE] = "console",
+    [FTYPE_XENBUS]  = "xenbus",
+    [FTYPE_XC]      = "ctrl",
+    [FTYPE_EVTCHN]  = "evtchn",
+    [FTYPE_SOCKET]  = "socket",
+    [FTYPE_TAP]     = "net",
+    [FTYPE_BLK]     = "blk",
+    [FTYPE_KBD]     = "kbd",
+    [FTYPE_FB]      = "fb",
 };
+
+static char *get_type_name(unsigned int type)
+{
+    if ( type < ARRAY_SIZE(file_ops) && file_ops[type] )
+        return file_ops[type]->name;
+
+    if ( type < ARRAY_SIZE(file_types) && file_types[type] )
+        return file_types[type];
+
+    return "none";
+}
 #endif
 #ifdef LIBC_DEBUG
 static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout)
@@ -663,7 +759,7 @@ static void dump_set(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	if (FD_ISSET(i, set)) { \
 	    if (comma) \
 		printk(", "); \
-	    printk("%d(%c)", i, file_types[files[i].type]); \
+	    printk("%d(%s)", i, get_type_name(files[i].type)); \
 	    comma = 1; \
 	} \
     } \
@@ -697,7 +793,7 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
         fd = pfd[i].fd;
         if (comma)
             printk(", ");
-        printk("%d(%c)/%02x", fd, file_types[files[fd].type],
+        printk("%d(%s)/%02x", fd, get_type_name(files[fd].type),
             pfd[i].events);
             comma = 1;
     }
@@ -709,6 +805,18 @@ static void dump_pollfds(struct pollfd *pfd, int nfds, int timeout)
 #define dump_pollfds(pfds, nfds, timeout)
 #endif
 
+bool select_yes(int fd)
+{
+    return true;
+}
+
+bool select_read_flag(int fd)
+{
+    struct file *file = get_file_from_fd(fd);
+
+    return file->read;
+}
+
 /* Just poll without blocking */
 static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds)
 {
@@ -762,9 +870,35 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
     for (i = 0; i < nfds; i++) {
 	switch(files[i].type) {
 	default:
+        {
+            struct file_ops *ops = file_ops[files[i].type];
+
+            if ( ops )
+            {
+                if ( FD_ISSET(i, readfds) )
+                {
+                    if ( ops->select_rd && ops->select_rd(i) )
+                        n++;
+                    else
+                        FD_CLR(i, readfds);
+                }
+                if ( FD_ISSET(i, writefds) )
+                {
+                    if ( ops->select_wr && ops->select_wr(i) )
+                        n++;
+                    else
+                        FD_CLR(i, writefds);
+                }
+	        FD_CLR(i, exceptfds);
+
+                break;
+            }
+
 	    if (FD_ISSET(i, readfds) || FD_ISSET(i, writefds) || FD_ISSET(i, exceptfds))
 		printk("bogus fd %d in select\n", i);
 	    /* Fallthrough.  */
+        }
+
 	case FTYPE_CONSOLE:
 	    if (FD_ISSET(i, readfds)) {
                 if (xencons_ring_avail(files[i].dev))
@@ -842,7 +976,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
 	printk("%d(%d): ", nb, sock_n);
 	for (i = 0; i < nfds; i++) {
 	    if (nbread[i] || nbwrite[i] || nbexcept[i])
-		printk(" %d(%c):", i, file_types[files[i].type]);
+		printk(" %d(%c):", i, get_type_name(files[i].type));
 	    if (nbread[i])
 	    	printk(" %dR", nbread[i]);
 	    if (nbwrite[i])
-- 
2.26.2


