Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 236BB2F64CA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67203.119761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hY-0002g5-8V; Thu, 14 Jan 2021 15:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67203.119761; Thu, 14 Jan 2021 15:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04hY-0002fA-4F; Thu, 14 Jan 2021 15:38:20 +0000
Received: by outflank-mailman (input) for mailman id 67203;
 Thu, 14 Jan 2021 15:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P5GR=GR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l04hW-0002SV-MU
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:38:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f85b026-8068-4767-b39e-45a4417decf0;
 Thu, 14 Jan 2021 15:38:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE9BCAEBE;
 Thu, 14 Jan 2021 15:38:07 +0000 (UTC)
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
X-Inumbo-ID: 5f85b026-8068-4767-b39e-45a4417decf0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610638687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc8XJlBBCFCXPvnosQgq4Bg2x9BkkZUgnRW4AZN2k5c=;
	b=huO36VVcQDejAzBmWRbEAjA0Yr2wrLA1CUtDWs/z2GPtzlbdRaxMg/6JC+B6vSzzC4qIm9
	KCEOxyivm6r2bC0mEzk9/U6zIo1cs2eBTq2n4NviLGCbIToTO6HcI7daRy0J1JlU8Ba3Fl
	pqTmcaRzhdTQufEmI2BvKKQtcqpWRYY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v11 05/27] tools/libxenevtchn: add possibility to not close file descriptor on exec
Date: Thu, 14 Jan 2021 16:37:41 +0100
Message-Id: <20210114153803.2591-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114153803.2591-1-jgross@suse.com>
References: <20210114153803.2591-1-jgross@suse.com>
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
---
 tools/include/xenevtchn.h          | 16 +++++++-
 tools/libs/evtchn/Makefile         |  2 +-
 tools/libs/evtchn/core.c           | 64 ++++++++++++++++++++++--------
 tools/libs/evtchn/freebsd.c        |  6 ++-
 tools/libs/evtchn/libxenevtchn.map |  4 ++
 tools/libs/evtchn/linux.c          |  6 ++-
 tools/libs/evtchn/minios.c         |  4 ++
 7 files changed, 81 insertions(+), 21 deletions(-)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 3e9b6e7323..b6dd8f3186 100644
--- a/tools/include/xenevtchn.h
+++ b/tools/include/xenevtchn.h
@@ -64,11 +64,25 @@ struct xentoollog_logger;
  *
  * Calling xenevtchn_close() is the only safe operation on a
  * xenevtchn_handle which has been inherited.
+ *
+ * Setting XENEVTCHN_NO_CLOEXEC allows to keep the file descriptor used
+ * for the event channel driver open across exec(2). In order to be able
+ * to use that file descriptor the new binary activated via exec(2) has
+ * to call xenevtchn_fdopen() with that file descriptor as parameter in
+ * order to associate it with a new handle. The file descriptor can be
+ * obtained via xenevtchn_fd() before calling exec(2).
  */
-/* Currently no flags are defined */
+
+/* Don't set O_CLOEXEC when opening event channel driver node. */
+#define XENEVTCHN_NO_CLOEXEC 0x01
+
 xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
                                  unsigned int flags);
 
+/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_fdopen(). */
+xenevtchn_handle *xenevtchn_fdopen(struct xentoollog_logger *logger,
+                                    int fd, unsigned open_flags);
+
 /*
  * Close a handle previously allocated with xenevtchn_open().
  */
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
index c069d5da71..f2ab27384b 100644
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
-    if ( rc  < 0 )
+    if ( rc < 0 )
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
+    xce->fd = fd;
+
+    return xce;
+}
+
 int xenevtchn_close(xenevtchn_handle *xce)
 {
     int rc;
diff --git a/tools/libs/evtchn/freebsd.c b/tools/libs/evtchn/freebsd.c
index bb601f350f..ed2baf3c95 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -33,8 +33,12 @@
 
 int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int flags)
 {
-    int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
+    int open_flags = O_RDWR;
+    int fd;
 
+    if ( !(flags & XENEVTCHN_NO_CLOEXEC) )
+        open_flags |= O_CLOEXEC;
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
index 47c153c268..5728991cb8 100644
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


