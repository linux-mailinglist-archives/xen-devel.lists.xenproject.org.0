Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1697F9DA4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641786.1000688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyN-0001Iw-BB; Mon, 27 Nov 2023 10:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641786.1000688; Mon, 27 Nov 2023 10:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyN-0001Ft-5t; Mon, 27 Nov 2023 10:36:15 +0000
Received: by outflank-mailman (input) for mailman id 641786;
 Mon, 27 Nov 2023 10:36:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yoa-0008NG-Ff
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9486b0-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:26:04 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4ABDB21B08;
 Mon, 27 Nov 2023 10:26:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CA9F132A6;
 Mon, 27 Nov 2023 10:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id LgK8BbxuZGWnfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:04 +0000
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
X-Inumbo-ID: 5e9486b0-8d0f-11ee-9b0e-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 07/32] Mini-OS: add EXPORT_SYMBOL() instances to lib/sys.c
Date: Mon, 27 Nov 2023 11:24:58 +0100
Message-Id: <20231127102523.28003-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *********************
X-Spamd-Bar: +++++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [21.50 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 21.50
X-Rspamd-Queue-Id: 4ABDB21B08
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to lib/sys.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lib/sys.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 5 deletions(-)

diff --git a/lib/sys.c b/lib/sys.c
index 118fc441..481067f7 100644
--- a/lib/sys.c
+++ b/lib/sys.c
@@ -20,6 +20,7 @@
 
 #ifdef HAVE_LIBC
 #include <os.h>
+#include <export.h>
 #include <string.h>
 #include <console.h>
 #include <sched.h>
@@ -63,7 +64,8 @@
     { \
 	print_unsupported(#function); \
 	do_exit(); \
-    }
+    } \
+    EXPORT_SYMBOL(function)
 
 /* Log and err out on function call */
 #define unsupported_function_log(type, function, ret) \
@@ -73,7 +75,8 @@
 	print_unsupported(#function); \
 	errno = ENOSYS; \
 	return ret; \
-    }
+    } \
+    EXPORT_SYMBOL(function)
 
 /* Err out on function call */
 #define unsupported_function(type, function, ret) \
@@ -82,7 +85,8 @@
     { \
 	errno = ENOSYS; \
 	return ret; \
-    }
+    } \
+    EXPORT_SYMBOL(function)
 
 #define NOFILE 32
 #define N_MOUNTS  16
@@ -187,6 +191,7 @@ unsigned int alloc_file_type(const struct file_ops *ops)
 
     return ret;
 }
+EXPORT_SYMBOL(alloc_file_type);
 
 static const struct file_ops *get_file_ops(unsigned int type)
 {
@@ -203,8 +208,10 @@ struct file *get_file_from_fd(int fd)
 
     return (files[fd].type == FTYPE_NONE) ? NULL : files + fd;
 }
+EXPORT_SYMBOL(get_file_from_fd);
 
 DECLARE_WAIT_QUEUE_HEAD(event_queue);
+EXPORT_SYMBOL(event_queue);
 
 int alloc_fd(unsigned int type)
 {
@@ -222,6 +229,7 @@ int alloc_fd(unsigned int type)
     printk("Too many opened files\n");
     do_exit();
 }
+EXPORT_SYMBOL(alloc_fd);
 
 void close_all_files(void)
 {
@@ -232,6 +240,7 @@ void close_all_files(void)
             close(i);
     pthread_mutex_unlock(&fd_lock);
 }
+EXPORT_SYMBOL(close_all_files);
 
 int dup2(int oldfd, int newfd)
 {
@@ -243,33 +252,39 @@ int dup2(int oldfd, int newfd)
     pthread_mutex_unlock(&fd_lock);
     return 0;
 }
+EXPORT_SYMBOL(dup2);
 
 pid_t getpid(void)
 {
     return 1;
 }
+EXPORT_SYMBOL(getpid);
 
 pid_t getppid(void)
 {
     return 1;
 }
+EXPORT_SYMBOL(getppid);
 
 pid_t setsid(void)
 {
     return 1;
 }
+EXPORT_SYMBOL(setsid);
 
 char *getcwd(char *buf, size_t size)
 {
     snprintf(buf, size, "/");
     return buf;
 }
+EXPORT_SYMBOL(getcwd);
 
 int mkdir(const char *pathname, mode_t mode)
 {
     errno = EIO;
     return -1;
 }
+EXPORT_SYMBOL(mkdir);
 
 #ifdef CONFIG_CONSFRONT
 int posix_openpt(int flags)
@@ -282,6 +297,7 @@ int posix_openpt(int flags)
 
     return fd;
 }
+EXPORT_SYMBOL(posix_openpt);
 
 static int open_pt(struct mount_point *mnt, const char *pathname, int flags,
                    mode_t mode)
@@ -313,6 +329,8 @@ int posix_openpt(int flags)
 	errno = EIO;
 	return -1;
 }
+EXPORT_SYMBOL(posix_openpt);
+
 int open_savefile(const char *path, int save)
 {
 	errno = EIO;
@@ -378,6 +396,8 @@ int open(const char *pathname, int flags, ...)
     errno = EIO;
     return -1;
 }
+EXPORT_SYMBOL(open);
+EXPORT_SYMBOL(open64);
 
 int mount(const char *path, void *dev,
           int (*open)(struct mount_point *, const char *, int, mode_t))
@@ -422,6 +442,7 @@ int isatty(int fd)
 {
     return files[fd].type == FTYPE_CONSOLE;
 }
+EXPORT_SYMBOL(isatty);
 
 int read(int fd, void *buf, size_t nbytes)
 {
@@ -440,6 +461,7 @@ int read(int fd, void *buf, size_t nbytes)
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(read);
 
 int write(int fd, const void *buf, size_t nbytes)
 {
@@ -458,6 +480,7 @@ int write(int fd, const void *buf, size_t nbytes)
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(write);
 
 off_t lseek_default(struct file *file, off_t offset, int whence)
 {
@@ -510,11 +533,14 @@ off_t lseek(int fd, off_t offset, int whence)
     errno = ESPIPE;
     return (off_t) -1;
 }
+EXPORT_SYMBOL(lseek);
+EXPORT_SYMBOL(lseek64);
 
 int fsync(int fd) {
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(fsync);
 
 int close(int fd)
 {
@@ -542,6 +568,7 @@ int close(int fd)
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(close);
 
 static void init_stat(struct stat *buf)
 {
@@ -559,6 +586,7 @@ int stat(const char *path, struct stat *buf)
     errno = EIO;
     return -1;
 }
+EXPORT_SYMBOL(stat);
 
 int fstat(int fd, struct stat *buf)
 {
@@ -579,28 +607,34 @@ int fstat(int fd, struct stat *buf)
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(fstat);
+EXPORT_SYMBOL(fstat64);
 
 int ftruncate(int fd, off_t length)
 {
     errno = EBADF;
     return -1;
 }
+EXPORT_SYMBOL(ftruncate);
 
 int remove(const char *pathname)
 {
     errno = EIO;
     return -1;
 }
+EXPORT_SYMBOL(remove);
 
 int unlink(const char *pathname)
 {
     return remove(pathname);
 }
+EXPORT_SYMBOL(unlink);
 
 int rmdir(const char *pathname)
 {
     return remove(pathname);
 }
+EXPORT_SYMBOL(rmdir);
 
 int fcntl(int fd, int cmd, ...)
 {
@@ -635,6 +669,7 @@ int fcntl(int fd, int cmd, ...)
     errno = ENOSYS;
     return -1;
 }
+EXPORT_SYMBOL(fcntl);
 
 DIR *opendir(const char *name)
 {
@@ -648,11 +683,13 @@ DIR *opendir(const char *name)
     ret->has_more = 1;
     return ret;
 }
+EXPORT_SYMBOL(opendir);
 
 struct dirent *readdir(DIR *dir)
 {
     return NULL;
 } 
+EXPORT_SYMBOL(readdir);
 
 int closedir(DIR *dir)
 {
@@ -664,6 +701,7 @@ int closedir(DIR *dir)
     free(dir);
     return 0;
 }
+EXPORT_SYMBOL(closedir);
 
 /* We assume that only the main thread calls select(). */
 
@@ -732,6 +770,7 @@ bool select_read_flag(struct file *file)
 {
     return file->read;
 }
+EXPORT_SYMBOL(select_read_flag);
 
 /* Just poll without blocking */
 static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds)
@@ -1044,6 +1083,7 @@ out:
     remove_waiter(console_w, console_queue);
     return ret;
 }
+EXPORT_SYMBOL(select);
 
 /* Wrap around select */
 int poll(struct pollfd _pfd[], nfds_t _nfds, int _timeout)
@@ -1136,6 +1176,7 @@ int poll(struct pollfd _pfd[], nfds_t _nfds, int _timeout)
 
     return n;
 }
+EXPORT_SYMBOL(poll);
 
 #ifdef HAVE_LWIP
 int socket(int domain, int type, int protocol)
@@ -1149,6 +1190,7 @@ int socket(int domain, int type, int protocol)
     files[res].fd = fd;
     return res;
 }
+EXPORT_SYMBOL(socket);
 
 int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
 {
@@ -1166,6 +1208,7 @@ int accept(int s, struct sockaddr *addr, socklen_t *addrlen)
     printk("accepted on %d -> %d\n", s, res);
     return res;
 }
+EXPORT_SYMBOL(accept);
 
 #define LWIP_STUB(ret, name, proto, args) \
 ret name proto \
@@ -1180,15 +1223,25 @@ ret name proto \
 }
 
 LWIP_STUB(int, bind, (int s, struct sockaddr *my_addr, socklen_t addrlen), (s, my_addr, addrlen))
+EXPORT_SYMBOL(bind);
 LWIP_STUB(int, getsockopt, (int s, int level, int optname, void *optval, socklen_t *optlen), (s, level, optname, optval, optlen))
+EXPORT_SYMBOL(getsockopt);
 LWIP_STUB(int, setsockopt, (int s, int level, int optname, void *optval, socklen_t optlen), (s, level, optname, optval, optlen))
+EXPORT_SYMBOL(setsockopt);
 LWIP_STUB(int, connect, (int s, struct sockaddr *serv_addr, socklen_t addrlen), (s, serv_addr, addrlen))
+EXPORT_SYMBOL(connect);
 LWIP_STUB(int, listen, (int s, int backlog), (s, backlog));
+EXPORT_SYMBOL(listen);
 LWIP_STUB(ssize_t, recv, (int s, void *buf, size_t len, int flags), (s, buf, len, flags))
+EXPORT_SYMBOL(recv);
 LWIP_STUB(ssize_t, recvfrom, (int s, void *buf, size_t len, int flags, struct sockaddr *from, socklen_t *fromlen), (s, buf, len, flags, from, fromlen))
+EXPORT_SYMBOL(recvfrom);
 LWIP_STUB(ssize_t, send, (int s, void *buf, size_t len, int flags), (s, buf, len, flags))
+EXPORT_SYMBOL(send);
 LWIP_STUB(ssize_t, sendto, (int s, void *buf, size_t len, int flags, struct sockaddr *to, socklen_t tolen), (s, buf, len, flags, to, tolen))
+EXPORT_SYMBOL(sendto);
 LWIP_STUB(int, getsockname, (int s, struct sockaddr *name, socklen_t *namelen), (s, name, namelen))
+EXPORT_SYMBOL(getsockname);
 #endif
 
 static char *syslog_ident;
@@ -1197,12 +1250,14 @@ void openlog(const char *ident, int option, int facility)
     free(syslog_ident);
     syslog_ident = strdup(ident);
 }
+EXPORT_SYMBOL(openlog);
 
 void vsyslog(int priority, const char *format, va_list ap)
 {
     printk("%s: ", syslog_ident);
     print(0, format, ap);
 }
+EXPORT_SYMBOL(vsyslog);
 
 void syslog(int priority, const char *format, ...)
 {
@@ -1211,12 +1266,14 @@ void syslog(int priority, const char *format, ...)
     vsyslog(priority, format, ap);
     va_end(ap);
 }
+EXPORT_SYMBOL(syslog);
 
 void closelog(void)
 {
     free(syslog_ident);
     syslog_ident = NULL;
 }
+EXPORT_SYMBOL(closelog);
 
 void vwarn(const char *format, va_list ap)
 {
@@ -1228,6 +1285,7 @@ void vwarn(const char *format, va_list ap)
     }
     printk("%s", strerror(the_errno));
 }
+EXPORT_SYMBOL(vwarn);
 
 void warn(const char *format, ...)
 {
@@ -1236,12 +1294,14 @@ void warn(const char *format, ...)
     vwarn(format, ap);
     va_end(ap);
 }
+EXPORT_SYMBOL(warn);
 
 void verr(int eval, const char *format, va_list ap)
 {
     vwarn(format, ap);
     exit(eval);
 }
+EXPORT_SYMBOL(verr);
 
 void err(int eval, const char *format, ...)
 {
@@ -1250,6 +1310,7 @@ void err(int eval, const char *format, ...)
     verr(eval, format, ap);
     va_end(ap);
 }
+EXPORT_SYMBOL(err);
 
 void vwarnx(const char *format, va_list ap)
 {
@@ -1257,6 +1318,7 @@ void vwarnx(const char *format, va_list ap)
     if (format)
         print(0, format, ap);
 }
+EXPORT_SYMBOL(vwarnx);
 
 void warnx(const char *format, ...)
 {
@@ -1265,12 +1327,14 @@ void warnx(const char *format, ...)
     vwarnx(format, ap);
     va_end(ap);
 }
+EXPORT_SYMBOL(warnx);
 
 void verrx(int eval, const char *format, va_list ap)
 {
     vwarnx(format, ap);
     exit(eval);
 }
+EXPORT_SYMBOL(verrx);
 
 void errx(int eval, const char *format, ...)
 {
@@ -1279,6 +1343,7 @@ void errx(int eval, const char *format, ...)
     verrx(eval, format, ap);
     va_end(ap);
 }
+EXPORT_SYMBOL(errx);
 
 int nanosleep(const struct timespec *req, struct timespec *rem)
 {
@@ -1304,6 +1369,7 @@ int nanosleep(const struct timespec *req, struct timespec *rem)
 
     return 0;
 }
+EXPORT_SYMBOL(nanosleep);
 
 int usleep(useconds_t usec)
 {
@@ -1317,6 +1383,7 @@ int usleep(useconds_t usec)
 
     return 0;
 }
+EXPORT_SYMBOL(usleep);
 
 unsigned int sleep(unsigned int seconds)
 {
@@ -1332,6 +1399,7 @@ unsigned int sleep(unsigned int seconds)
 
     return rem.tv_sec;
 }
+EXPORT_SYMBOL(sleep);
 
 int clock_gettime(clockid_t clk_id, struct timespec *tp)
 {
@@ -1364,37 +1432,44 @@ int clock_gettime(clockid_t clk_id, struct timespec *tp)
 
     return 0;
 }
+EXPORT_SYMBOL(clock_gettime);
 
 uid_t getuid(void)
 {
 	return 0;
 }
+EXPORT_SYMBOL(getuid);
 
 uid_t geteuid(void)
 {
 	return 0;
 }
+EXPORT_SYMBOL(geteuid);
 
 gid_t getgid(void)
 {
 	return 0;
 }
+EXPORT_SYMBOL(getgid);
 
 gid_t getegid(void)
 {
 	return 0;
 }
+EXPORT_SYMBOL(getegid);
 
 int gethostname(char *name, size_t namelen)
 {
 	strncpy(name, "mini-os", namelen);
 	return 0;
 }
+EXPORT_SYMBOL(gethostname);
 
 size_t getpagesize(void)
 {
     return PAGE_SIZE;
 }
+EXPORT_SYMBOL(getpagesize);
 
 void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset)
 {
@@ -1412,6 +1487,8 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
         return map_frames_ex(&first_mfn, n, 0, 1, 1, DOMID_IO, NULL, _PAGE_PRESENT|_PAGE_RW);
     } else ASSERT(0);
 }
+EXPORT_SYMBOL(mmap);
+EXPORT_SYMBOL(mmap64);
 
 int munmap(void *start, size_t length)
 {
@@ -1425,6 +1502,7 @@ int munmap(void *start, size_t length)
     }
     return 0;
 }
+EXPORT_SYMBOL(munmap);
 
 void sparse(unsigned long data, size_t size)
 {
@@ -1465,6 +1543,7 @@ int nice(int inc)
     printk("nice() stub called with inc=%d\n", inc);
     return 0;
 }
+EXPORT_SYMBOL(nice);
 
 /* Limited termios terminal settings support */
 const struct termios default_termios = {0,             /* iflag */
@@ -1512,6 +1591,7 @@ int tcsetattr(int fildes, int action, const struct termios *tios)
 
     return 0;
 }
+EXPORT_SYMBOL(tcsetattr);
 
 int tcgetattr(int fildes, struct termios *tios)
 {
@@ -1545,6 +1625,7 @@ int tcgetattr(int fildes, struct termios *tios)
 
     return 0;
 }
+EXPORT_SYMBOL(tcgetattr);
 
 void cfmakeraw(struct termios *tios)
 {
@@ -1555,6 +1636,7 @@ void cfmakeraw(struct termios *tios)
     tios->c_cflag &= ~(CSIZE | PARENB);
     tios->c_cflag |= CS8;
 }
+EXPORT_SYMBOL(cfmakeraw);
 
 /* Not supported by FS yet.  */
 unsupported_function_crash(link);
@@ -1659,8 +1741,8 @@ unsupported_function_log(int, ftruncate64, -1);
 unsupported_function_log(int, fchown, -1);
 unsupported_function_log(int, fchmod, -1);
 unsupported_function_crash(execvp);
-unsupported_function_log(int, dup, -1)
-unsupported_function_log(int, chroot, -1)
+unsupported_function_log(int, dup, -1);
+unsupported_function_log(int, chroot, -1);
 unsupported_function_log(int, chown, -1);
 unsupported_function_log(int, chmod, -1);
 unsupported_function_crash(alarm);
-- 
2.35.3


