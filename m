Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595E84E594
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678352.1055543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gx-00069w-5W; Thu, 08 Feb 2024 16:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678352.1055543; Thu, 08 Feb 2024 16:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gx-00067P-0r; Thu, 08 Feb 2024 16:56:03 +0000
Received: by outflank-mailman (input) for mailman id 678352;
 Thu, 08 Feb 2024 16:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7gv-0005bD-Hl
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:56:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efe0cf8d-c6a2-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 17:56:00 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D35C21F60;
 Thu,  8 Feb 2024 16:56:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 580A21326D;
 Thu,  8 Feb 2024 16:56:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RjUNFKAHxWWtEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:56:00 +0000
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
X-Inumbo-ID: efe0cf8d-c6a2-11ee-8a4a-1f161083a0e0
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 02/22] tools: add a new xen 9pfs daemon
Date: Thu,  8 Feb 2024 17:55:26 +0100
Message-Id: <20240208165546.5715-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8D35C21F60
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO

Add "xen-9pfsd", a new 9pfs daemon meant to support infrastructure
domains (e.g. xenstore-stubdom) to access files in dom0.

For now only add the code needed for starting the daemon and
registering it with Xenstore via a new "libxl/xen-9pfs/state" node by
writing the "running" state to it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
V2:
- rename from xenlogd to xen-9pfsd (Andrew Cooper)
- use a backend domain local Xenstore node (Jason Andryuk)
- use "volatile" for stop_me (Andrew Cooper)
V3:
- fix SPDX Identifier (Andrew Cooper)
V4:
- add strerror() test to error logging (Andrew Cooper)
- don't handle "daemon already running" as error (Anthony Perard)
V5:
- rename source directory to tools/9pfsd (Andrew Cooper)
---
 tools/9pfsd/.gitignore  |   1 +
 tools/9pfsd/Makefile    |  38 +++++++++++
 tools/9pfsd/xen-9pfsd.c | 147 ++++++++++++++++++++++++++++++++++++++++
 tools/Makefile          |   1 +
 4 files changed, 187 insertions(+)
 create mode 100644 tools/9pfsd/.gitignore
 create mode 100644 tools/9pfsd/Makefile
 create mode 100644 tools/9pfsd/xen-9pfsd.c

diff --git a/tools/9pfsd/.gitignore b/tools/9pfsd/.gitignore
new file mode 100644
index 0000000000..d0c2d223ef
--- /dev/null
+++ b/tools/9pfsd/.gitignore
@@ -0,0 +1 @@
+/xen-9pfsd
diff --git a/tools/9pfsd/Makefile b/tools/9pfsd/Makefile
new file mode 100644
index 0000000000..089cf5ae24
--- /dev/null
+++ b/tools/9pfsd/Makefile
@@ -0,0 +1,38 @@
+#
+# tools/9pfsd/Makefile
+#
+
+XEN_ROOT = $(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += $(PTHREAD_CFLAGS)
+LDFLAGS += $(PTHREAD_LDFLAGS)
+
+TARGETS := xen-9pfsd
+
+XEN-9PFSD_OBJS = xen-9pfsd.o
+$(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxenstore)
+$(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
+$(XEN-9PFSD_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
+xen-9pfsd: LDLIBS += $(call xenlibs-ldlibs,store evtchn gnttab)
+
+.PHONY: all
+all: $(TARGETS)
+
+xen-9pfsd: $(XEN-9PFSD_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(XEN-9PFSD_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	for i in $(TARGETS); do $(INSTALL_PROG) $$i $(DESTDIR)$(LIBEXEC_BIN); done
+
+.PHONY: uninstall
+uninstall:
+	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
+
+.PHONY: clean
+clean:
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
+
+distclean: clean
diff --git a/tools/9pfsd/xen-9pfsd.c b/tools/9pfsd/xen-9pfsd.c
new file mode 100644
index 0000000000..6939d01574
--- /dev/null
+++ b/tools/9pfsd/xen-9pfsd.c
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * xen-9pfsd - Xen 9pfs daemon
+ *
+ * Copyright (C) 2024 Juergen Gross <jgross@suse.com>
+ *
+ * Daemon to enable guests to access a directory of the dom0 file system.
+ * Access is made via the 9pfs protocol (xen-9pfsd acts as a PV 9pfs backend).
+ *
+ * Usage: xen-9pfsd
+ *
+ * xen-9pfsd does NOT support writing any links (neither soft links nor hard
+ * links), and it is accepting only canonicalized file paths in order to
+ * avoid the possibility to "escape" from the guest specific directory.
+ *
+ * The backend device string is "xen_9pfs", the tag used for mounting the
+ * 9pfs device is "Xen".
+ *
+ * As an additional security measure the maximum file space used by the guest
+ * can be limited by the backend Xenstore node "max-size" specifying the size
+ * in MBytes. This size includes the size of the root directory of the guest.
+ */
+
+#include <err.h>
+#include <errno.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <syslog.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <xenevtchn.h>
+#include <xengnttab.h>
+#include <xenstore.h>
+
+static volatile bool stop_me;
+static bool daemon_running;
+static struct xs_handle *xs;
+static xengnttab_handle *xg;
+static xenevtchn_handle *xe;
+
+static void handle_stop(int sig)
+{
+    stop_me = true;
+}
+
+static void close_all(void)
+{
+    if ( daemon_running )
+        xs_rm(xs, XBT_NULL, "libxl/xen-9pfs");
+    if ( xe )
+        xenevtchn_close(xe);
+    if ( xg )
+        xengnttab_close(xg);
+    if ( xs )
+        xs_close(xs);
+    closelog();
+}
+
+static void do_err(const char *msg)
+{
+    syslog(LOG_ALERT, "%s, errno = %d, %s", msg, errno, strerror(errno));
+    close_all();
+    exit(1);
+}
+
+static void xen_connect(void)
+{
+    xs_transaction_t t;
+    char *val;
+    unsigned int len;
+
+    xs = xs_open(0);
+    if ( xs == NULL )
+        do_err("xs_open() failed");
+
+    xg = xengnttab_open(NULL, 0);
+    if ( xg == NULL )
+        do_err("xengnttab_open() failed");
+
+    xe = xenevtchn_open(NULL, 0);
+    if ( xe == NULL )
+        do_err("xenevtchn_open() failed");
+
+    while ( true )
+    {
+        t = xs_transaction_start(xs);
+        if ( t == XBT_NULL )
+            do_err("xs_transaction_start() failed");
+
+        val = xs_read(xs, t, "libxl/xen-9pfs/state", &len);
+        if ( val )
+        {
+            free(val);
+            xs_transaction_end(xs, t, true);
+            syslog(LOG_INFO, "daemon already running");
+            close_all();
+            exit(0);
+        }
+
+        if ( !xs_write(xs, t, "libxl/xen-9pfs/state", "running",
+                       strlen("running")) )
+        {
+            xs_transaction_end(xs, t, true);
+            do_err("xs_write() failed writing state");
+        }
+
+        if ( xs_transaction_end(xs, t, false) )
+            break;
+        if ( errno != EAGAIN )
+            do_err("xs_transaction_end() failed");
+    }
+
+    daemon_running = true;
+}
+
+int main(int argc, char *argv[])
+{
+    struct sigaction act = { .sa_handler = handle_stop, };
+    int syslog_mask = LOG_MASK(LOG_WARNING) | LOG_MASK(LOG_ERR) |
+                      LOG_MASK(LOG_CRIT) | LOG_MASK(LOG_ALERT) |
+                      LOG_MASK(LOG_EMERG);
+
+    umask(027);
+    if ( getenv("XEN_9PFSD_VERBOSE") )
+        syslog_mask |= LOG_MASK(LOG_NOTICE) | LOG_MASK(LOG_INFO);
+    openlog("xen-9pfsd", LOG_CONS, LOG_DAEMON);
+    setlogmask(syslog_mask);
+
+    sigemptyset(&act.sa_mask);
+    sigaction(SIGHUP, &act, NULL);
+
+    xen_connect();
+
+    while ( !stop_me )
+    {
+        sleep(60);
+    }
+
+    close_all();
+
+    return 0;
+}
diff --git a/tools/Makefile b/tools/Makefile
index 3a510663a0..7d17211782 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -32,6 +32,7 @@ SUBDIRS-y += xenpmd
 SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
+SUBDIRS-y += 9pfsd
 SUBDIRS-$(CONFIG_X86) += xenpaging
 SUBDIRS-$(CONFIG_X86) += debugger
 SUBDIRS-$(CONFIG_TESTS) += tests
-- 
2.35.3


