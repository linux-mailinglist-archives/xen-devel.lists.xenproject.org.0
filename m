Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5582F745D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 09:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67714.121003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUq-0008Jz-BR; Fri, 15 Jan 2021 08:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67714.121003; Fri, 15 Jan 2021 08:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0KUq-0008JQ-6H; Fri, 15 Jan 2021 08:30:16 +0000
Received: by outflank-mailman (input) for mailman id 67714;
 Fri, 15 Jan 2021 08:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v6X5=GS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l0KUo-0008Gh-Ee
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 08:30:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f24ecc88-757a-4488-9397-2a88204bbb7f;
 Fri, 15 Jan 2021 08:30:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6F45B96C;
 Fri, 15 Jan 2021 08:30:06 +0000 (UTC)
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
X-Inumbo-ID: f24ecc88-757a-4488-9397-2a88204bbb7f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610699407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDOKCm1PBekJ/I7OVe/tbhyex8V7rdSW9/SSHYEJKQE=;
	b=R6NxtkjDSpZKiQOIQXgpnyRxDVwEyOd/MmrX3tCPvzeiogY82qn4AZFK3KMC+Ee6OCzEPR
	HGfNLtR+ltnGxrlFx+DmJxau6B4VkIRU231uNMp13Hx1apZ4oFtUtPMQOn6b6ihCY2Bwlv
	gbcIC5mMvGH/+3mNPhC3Dbw9k5qT8SM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v12 05/27] tools/libxenevtchn: add possibility to not close file descriptor on exec
Date: Fri, 15 Jan 2021 09:29:38 +0100
Message-Id: <20210115083000.14186-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115083000.14186-1-jgross@suse.com>
References: <20210115083000.14186-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today the file descriptor for the access of the event channel driver
is being closed in case of exec(2). For the support of live update of
a daemon using libxenevtchn this can be problematic, so add a way to
keep that file descriptor open.

Add support of a flag XENEVTCHN_NO_CLOEXEC for xenevtchn_open() which
will result in _not_ setting O_CLOEXEC when opening the event channel
driver node.

The caller can then obtain the file descriptor via xenevtchn_fd().

Add an alternative open function xenevtchn_fdopen() which takes that
file descriptor as an additional parameter. This allows to allocate a
xenevtchn_handle and to associate it with that file descriptor.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Wei Liu <wl@xen.org>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
V7:
- new patch

V8:
- some minor comments by Julien Grall addressed

V11:
- rename to xenevtchn_fdopen() (Andrew Cooper)

V12:
- better comments in header file (Andrew Cooper)
- reject flags != 0 if fdopen (Andrew Cooper)
- style (Andrew Cooper)
---
 tools/include/xenevtchn.h          | 50 +++++++++++++++---------
 tools/libs/evtchn/Makefile         |  2 +-
 tools/libs/evtchn/core.c           | 62 ++++++++++++++++++++++--------
 tools/libs/evtchn/freebsd.c        |  7 +++-
 tools/libs/evtchn/libxenevtchn.map |  4 ++
 tools/libs/evtchn/linux.c          |  6 ++-
 tools/libs/evtchn/minios.c         |  4 ++
 7 files changed, 97 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 3e9b6e7323..10dbe1a06e 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -42,35 +42,47 @@ struct xentoollog_logger;
  */
 
 /*
- * Return a handle to the event channel driver, or NULL on failure, in
- * which case errno will be set appropriately.
+ * Opens the evtchn device node.  Return a handle to the event channel
+ * driver, or NULL on failure, in which case errno will be set
+ * appropriately.
  *
- * Note: After fork(2) a child process must not use any opened evtchn
- * handle inherited from their parent, nor access any grant mapped
- * areas associated with that handle.
+ * On fork(2):
  *
- * The child must open a new handle if they want to interact with
- * evtchn.
+ *   After fork, a child process must not use any opened evtchn handle
+ *   inherited from their parent.  This includes operations such as
+ *   poll() on the underlying file descriptor.  Calling xenevtchn_close()
+ *   is the only safe operation on a xenevtchn_handle which has been
+ *   inherited.
  *
- * Calling exec(2) in a child will safely (and reliably) reclaim any
- * allocated resources via a xenevtchn_handle in the parent.
+ *   The child must open a new handle if they want to interact with
+ *   evtchn.
  *
- * A child which does not call exec(2) may safely call
- * xenevtchn_close() on a xenevtchn_handle inherited from their
- * parent. This will attempt to reclaim any resources associated with
- * that handle. Note that in some implementations this reclamation may
- * not be completely effective, in this case any affected resources
- * remain allocated.
+ * On exec(2):
  *
- * Calling xenevtchn_close() is the only safe operation on a
- * xenevtchn_handle which has been inherited.
+ *   Wherever possible, the device node will be opened with O_CLOEXEC,
+ *   so it is not inherited by the subsequent program.
+ *
+ *   However the XENEVTCHN_NO_CLOEXEC flag may be used to avoid opening
+ *   the device node with O_CLOEXEC.  This is intended for use by
+ *   daemons which support a self-reexec method of updating themselves.
+ *
+ *   In this case, the updated daemon should pass the underlying file
+ *   descriptor it inherited to xenevtchn_fdopen() to reconstruct the
+ *   library handle.
  */
-/* Currently no flags are defined */
+
+/* Don't set O_CLOEXEC when opening event channel driver node. */
+#define XENEVTCHN_NO_CLOEXEC (1U <<0)
+
 xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
                                  unsigned int flags);
 
+/* Flag XENEVTCHN_NO_CLOEXEC is rejected by xenevtchn_fdopen(). */
+xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
+                                    int fd, unsigned open_flags);
+
 /*
- * Close a handle previously allocated with xenevtchn_open().
+ * Close a handle previously allocated with xenevtchn_{,fd}open().
  */
 int xenevtchn_close(xenevtchn_handle *xce);
 
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index ad01a17b3d..b8c37b5b97 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 1
+MINOR    = 2
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/evtchn/core.c b/tools/libs/evtchn/core.c
index d3cc93e98f..abebf72559 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -30,18 +30,10 @@ static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid)
     return xenevtchn_restrict(xce, domid);
 }
 
-xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
+static xenevtchn_handle *xenevtchn_alloc_handle(xentoollog_logger *logger)
 {
-    xenevtchn_handle *xce;
-    int rc;
-
-    if ( flags )
-    {
-        errno = EINVAL;
-        return NULL;
-    }
+    xenevtchn_handle *xce = malloc(sizeof(*xce));
 
-    xce = malloc(sizeof(*xce));
     if ( !xce )
         return NULL;
 
@@ -60,21 +52,59 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
             goto err;
     }
 
+    return xce;
+
+err:
+    xenevtchn_close(xce);
+    return NULL;
+}
+
+xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned int flags)
+{
+    xenevtchn_handle *xce;
+    int rc;
+
+    if ( flags & ~XENEVTCHN_NO_CLOEXEC )
+    {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    xce = xenevtchn_alloc_handle(logger);
+    if ( !xce )
+        return NULL;
+
     rc = osdep_evtchn_open(xce, flags);
     if ( rc < 0 )
         goto err;
 
     return xce;
 
- err:
-    xentoolcore__deregister_active_handle(&xce->tc_ah);
-    osdep_evtchn_close(xce);
-    xtl_logger_destroy(xce->logger_tofree);
-    free(xce);
-
+err:
+    xenevtchn_close(xce);
     return NULL;
 }
 
+xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
+                                   int fd, unsigned int flags)
+{
+    xenevtchn_handle *xce;
+
+    if ( flags )
+    {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    xce = xenevtchn_alloc_handle(logger);
+    if ( !xce )
+        return NULL;
+
+    xce->fd = fd;
+
+    return xce;
+}
+
 int xenevtchn_close(xenevtchn_handle *xce)
 {
     int rc;
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index bb601f350f..7427ab2408 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -33,8 +33,13 @@
 
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
-    int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
+    int open_flags = O_RDWR;
+    int fd;
 
+    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
+        open_flags |= O_CLOEXEC;
+
+    fd = open(EVTCHN_DEV, open_flags);
     if ( fd == -1 )
         return -1;
 
diff --git a/tools/libs/evtchn/libxenevtchn.map b/tools/libs/evtchn/libxenevtchn.map
index 33a38f953a..4c180ea65d 100644
--- a/tools/libs/evtchn/libxenevtchn.map
+++ b/tools/libs/evtchn/libxenevtchn.map
@@ -21,3 +21,7 @@ VERS_1.1 {
 	global:
 		xenevtchn_restrict;
 } VERS_1.0;
+VERS_1.2 {
+	global:
+		xenevtchn_fdopen;
+} VERS_1.1;
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index 62adc0e574..60bb75a791 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -36,8 +36,12 @@
 
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
-    int fd = open("/dev/xen/evtchn", O_RDWR|O_CLOEXEC);
+    int open_flags = O_RDWR;
+    int fd;
 
+    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
+        open_flags |= O_CLOEXEC;
+    fd = open("/dev/xen/evtchn", open_flags);
     if ( fd == -1 )
         return -1;
 
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 3afc8e2517..57f712ade3 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -69,6 +69,10 @@ static void port_dealloc(struct evtchn_port_info *port_info)
     free(port_info);
 }
 
+/*
+ * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
+ * in Mini-OS.
+ */
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
     int fd = alloc_fd(FTYPE_EVTCHN);
-- 
2.26.2


