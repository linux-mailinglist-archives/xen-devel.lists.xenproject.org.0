Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9372DB186
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54527.94820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJ6-00066s-5s; Tue, 15 Dec 2020 16:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54527.94820; Tue, 15 Dec 2020 16:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDJ6-00066T-1r; Tue, 15 Dec 2020 16:36:12 +0000
Received: by outflank-mailman (input) for mailman id 54527;
 Tue, 15 Dec 2020 16:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpDJ4-000667-HD
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:36:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 149f1d9d-c46c-4705-a48a-fc83a6645843;
 Tue, 15 Dec 2020 16:36:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69CFDAD6A;
 Tue, 15 Dec 2020 16:36:08 +0000 (UTC)
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
X-Inumbo-ID: 149f1d9d-c46c-4705-a48a-fc83a6645843
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608050168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iNV/KA8nEAAEkG05F5JTnuJ6pmnkrzAhlaFIwhddg8E=;
	b=YCy9BEGPS5F1VKvruRzYcdVXEV0FJVzDpOVUONqjGiynneQTGpLlQNqVGLYAOOr/x+SGNC
	KwaT/VQS4+5Xo1G88/GKds4KGuRfw+tzH897tVDe8j01cujdCoUfctAdbiMGdHob753AUZ
	QXUrBGyoLzKc7Wsxa5dcKs7eh7JghgQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not close file descriptor on exec
Date: Tue, 15 Dec 2020 17:35:42 +0100
Message-Id: <20201215163603.21700-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215163603.21700-1-jgross@suse.com>
References: <20201215163603.21700-1-jgross@suse.com>
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

Add an alternative open function xenevtchn_open_fd() which takes that
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

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/xenevtchn.h          | 16 ++++++++++-
 tools/libs/evtchn/Makefile         |  2 +-
 tools/libs/evtchn/core.c           | 45 ++++++++++++++++++++++++------
 tools/libs/evtchn/freebsd.c        |  9 ++++--
 tools/libs/evtchn/libxenevtchn.map |  4 +++
 tools/libs/evtchn/linux.c          |  9 ++++--
 tools/libs/evtchn/minios.c         |  6 +++-
 tools/libs/evtchn/netbsd.c         |  2 +-
 tools/libs/evtchn/private.h        |  2 +-
 tools/libs/evtchn/solaris.c        |  2 +-
 10 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
index 91821ee56d..dadc46ea36 100644
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
+ * to call xenevtchn_open_fd() with that file descriptor as parameter in
+ * order to associate it with a new handle. The file descriptor can be
+ * obtained via xenevtchn_fd() before calling exec(2).
  */
-/* Currently no flags are defined */
+
+/* Don't set O_CLOEXEC when opening event channel driver node. */
+#define XENEVTCHN_NO_CLOEXEC 0x01
+
 xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
                                  unsigned open_flags);
 
+/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_open_fd(). */
+xenevtchn_handle *xenevtchn_open_fd(struct xentoollog_logger *logger,
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
index aff6ecfaa0..fa1e44b6ea 100644
--- a/tools/libs/evtchn/core.c
+++ b/tools/libs/evtchn/core.c
@@ -13,6 +13,7 @@
  * License along with this library; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <errno.h>
 #include <unistd.h>
 #include <stdlib.h>
 
@@ -28,10 +29,9 @@ static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {
     return xenevtchn_restrict(xce, domid);
 }
 
-xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
+static xenevtchn_handle *xenevtchn_alloc_handle(xentoollog_logger *logger)
 {
     xenevtchn_handle *xce = malloc(sizeof(*xce));
-    int rc;
 
     if (!xce) return NULL;
 
@@ -49,19 +49,48 @@ xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
         if (!xce->logger) goto err;
     }
 
-    rc = osdep_evtchn_open(xce);
-    if ( rc  < 0 ) goto err;
+    return xce;
+
+err:
+    xenevtchn_close(xce);
+    return NULL;
+}
+
+xenevtchn_handle *xenevtchn_open(xentoollog_logger *logger, unsigned open_flags)
+{
+    xenevtchn_handle *xce = xenevtchn_alloc_handle(logger);
+    int rc;
+
+    if (!xce) return NULL;
+
+    rc = osdep_evtchn_open(xce, open_flags);
+    if ( rc < 0 ) goto err;
 
     return xce;
 
 err:
-    xentoolcore__deregister_active_handle(&xce->tc_ah);
-    osdep_evtchn_close(xce);
-    xtl_logger_destroy(xce->logger_tofree);
-    free(xce);
+    xenevtchn_close(xce);
     return NULL;
 }
 
+xenevtchn_handle *xenevtchn_open_fd(struct xentoollog_logger *logger,
+                                    int fd, unsigned open_flags)
+{
+    xenevtchn_handle *xce;
+
+    if (open_flags & ~XENEVTCHN_NO_CLOEXEC) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    xce = xenevtchn_alloc_handle(logger);
+    if (!xce) return NULL;
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
index 6564ed4c44..635c10f09f 100644
--- a/tools/libs/evtchn/freebsd.c
+++ b/tools/libs/evtchn/freebsd.c
@@ -31,9 +31,14 @@
 
 #define EVTCHN_DEV      "/dev/xen/evtchn"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags)
 {
-    int fd = open(EVTCHN_DEV, O_RDWR|O_CLOEXEC);
+    int flags = O_RDWR;
+    int fd;
+
+    if ( !(open_flags & XENEVTCHN_NO_CLOEXEC) )
+        flags |= O_CLOEXEC;
+    fd = open(EVTCHN_DEV, flags);
     if ( fd == -1 )
         return -1;
     xce->fd = fd;
diff --git a/tools/libs/evtchn/libxenevtchn.map b/tools/libs/evtchn/libxenevtchn.map
index 33a38f953a..722fa026f9 100644
--- a/tools/libs/evtchn/libxenevtchn.map
+++ b/tools/libs/evtchn/libxenevtchn.map
@@ -21,3 +21,7 @@ VERS_1.1 {
 	global:
 		xenevtchn_restrict;
 } VERS_1.0;
+VERS_1.2 {
+	global:
+		xenevtchn_open_fd;
+} VERS_1.1;
diff --git a/tools/libs/evtchn/linux.c b/tools/libs/evtchn/linux.c
index 17e64aea32..2297488f88 100644
--- a/tools/libs/evtchn/linux.c
+++ b/tools/libs/evtchn/linux.c
@@ -34,9 +34,14 @@
 #define O_CLOEXEC 0
 #endif
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags)
 {
-    int fd = open("/dev/xen/evtchn", O_RDWR|O_CLOEXEC);
+    int flags = O_RDWR;
+    int fd;
+
+    if ( !(open_flags & XENEVTCHN_NO_CLOEXEC) )
+        flags |= O_CLOEXEC;
+    fd = open("/dev/xen/evtchn", flags);
     if ( fd == -1 )
         return -1;
     xce->fd = fd;
diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
index 9cd7636fc5..f5db021747 100644
--- a/tools/libs/evtchn/minios.c
+++ b/tools/libs/evtchn/minios.c
@@ -63,7 +63,11 @@ static void port_dealloc(struct evtchn_port_info *port_info) {
     free(port_info);
 }
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+/*
+ * XENEVTCHN_NO_CLOEXEC is being ignored, as there is no exec() call supported
+ * in Mini-OS.
+ */
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags)
 {
     int fd = alloc_fd(FTYPE_EVTCHN);
     if ( fd == -1 )
diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
index 8b8545d2f9..7c73d1c599 100644
--- a/tools/libs/evtchn/netbsd.c
+++ b/tools/libs/evtchn/netbsd.c
@@ -31,7 +31,7 @@
 
 #define EVTCHN_DEV_NAME  "/dev/xenevt"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags)
 {
     int fd = open(EVTCHN_DEV_NAME, O_NONBLOCK|O_RDWR);
     if ( fd == -1 )
diff --git a/tools/libs/evtchn/private.h b/tools/libs/evtchn/private.h
index 31e595bea2..bcac2a191d 100644
--- a/tools/libs/evtchn/private.h
+++ b/tools/libs/evtchn/private.h
@@ -14,7 +14,7 @@ struct xenevtchn_handle {
     Xentoolcore__Active_Handle tc_ah;
 };
 
-int osdep_evtchn_open(xenevtchn_handle *xce);
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags);
 int osdep_evtchn_close(xenevtchn_handle *xce);
 int osdep_evtchn_restrict(xenevtchn_handle *xce, domid_t domid);
 
diff --git a/tools/libs/evtchn/solaris.c b/tools/libs/evtchn/solaris.c
index dd41f62a24..7e22f7906a 100644
--- a/tools/libs/evtchn/solaris.c
+++ b/tools/libs/evtchn/solaris.c
@@ -29,7 +29,7 @@
 
 #include "private.h"
 
-int osdep_evtchn_open(xenevtchn_handle *xce)
+int osdep_evtchn_open(xenevtchn_handle *xce, unsigned int open_flags)
 {
     int fd;
 
-- 
2.26.2


