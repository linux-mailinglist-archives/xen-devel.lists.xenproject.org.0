Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A981C7DDE79
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626237.976332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7ba-0006ak-QO; Wed, 01 Nov 2023 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626237.976332; Wed, 01 Nov 2023 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7ba-0006Yr-NA; Wed, 01 Nov 2023 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 626237;
 Wed, 01 Nov 2023 09:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7bZ-0005sN-W9
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:33:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd92e289-7899-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 10:33:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 063D921835;
 Wed,  1 Nov 2023 09:33:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D607413460;
 Wed,  1 Nov 2023 09:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ttESM3MbQmWpCAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:33:39 +0000
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
X-Inumbo-ID: bd92e289-7899-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PS/B4Q2Vo5wSif1LySkXXDYKmcLHmew3UeAfGM1754=;
	b=LahJQ7AYFfYHpbMQyR4BIp13vK/OpGZ8Yv3ohtloNscXyy1IAs59lN10gBGxq09bfHFQ1C
	cyozIzBuGI6kDb22YkYc5Mkes7IIbdlokshXUgy5d9z9vnyK80rjXGt82skhYoBCY7HjV4
	PB/PublIvSGlwhkrpKGrX2/Hx7oHqp0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 02/29] tools: add a new xen logging daemon
Date: Wed,  1 Nov 2023 10:32:58 +0100
Message-Id: <20231101093325.30302-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xenlogd", a new logging daemon meant to support infrastructure
domains (e.g. xenstore-stubdom) to write log files in dom0.

For now only add the code needed for starting the daemon and
registering it with Xenstore via a new "/tool/xenlog/state" node by
writing the "running" state to it.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Makefile           |   1 +
 tools/xenlogd/.gitignore |   1 +
 tools/xenlogd/Makefile   |  38 ++++++++++
 tools/xenlogd/xenlogd.c  | 145 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 185 insertions(+)
 create mode 100644 tools/xenlogd/.gitignore
 create mode 100644 tools/xenlogd/Makefile
 create mode 100644 tools/xenlogd/xenlogd.c

diff --git a/tools/Makefile b/tools/Makefile
index 3a510663a0..0225020416 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -32,6 +32,7 @@ SUBDIRS-y += xenpmd
 SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
+SUBDIRS-y += xenlogd
 SUBDIRS-$(CONFIG_X86) += xenpaging
 SUBDIRS-$(CONFIG_X86) += debugger
 SUBDIRS-$(CONFIG_TESTS) += tests
diff --git a/tools/xenlogd/.gitignore b/tools/xenlogd/.gitignore
new file mode 100644
index 0000000000..a0305ae096
--- /dev/null
+++ b/tools/xenlogd/.gitignore
@@ -0,0 +1 @@
+/xenlogd
diff --git a/tools/xenlogd/Makefile b/tools/xenlogd/Makefile
new file mode 100644
index 0000000000..550e914f59
--- /dev/null
+++ b/tools/xenlogd/Makefile
@@ -0,0 +1,38 @@
+#
+# tools/helpers/Makefile
+#
+
+XEN_ROOT = $(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += $(PTHREAD_CFLAGS)
+LDFLAGS += $(PTHREAD_LDFLAGS)
+
+TARGETS := xenlogd
+
+XENLOGD_OBJS = xenlogd.o
+$(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxenstore)
+$(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
+$(XENLOGD_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
+xenlogd: LDLIBS += $(call xenlibs-ldlibs,store evtchn gnttab)
+
+.PHONY: all
+all: $(TARGETS)
+
+xenlogd: $(XENLOGD_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(XENLOGD_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
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
diff --git a/tools/xenlogd/xenlogd.c b/tools/xenlogd/xenlogd.c
new file mode 100644
index 0000000000..792d1026a3
--- /dev/null
+++ b/tools/xenlogd/xenlogd.c
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * xenlogd - Xen logging daemon
+ *
+ * Copyright (C) 2023 Juergen Gross <jgross@suse.com>
+ *
+ * Daemon to enable guests to access a directory of the dom0 file system.
+ * Access is made via the 9pfs protocol (xenlogd acts as a PV 9pfs backend).
+ *
+ * Usage: xenlogd
+ *
+ * xenlogd does NOT support writing any links (neither soft links nor hard
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
+static bool stop_me;
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
+        xs_rm(xs, XBT_NULL, "/tool/xenlog");
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
+    syslog(LOG_ALERT, "%s, errno = %d", msg, errno);
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
+        val = xs_read(xs, t, "/tool/xenlog/state", &len);
+        if ( val )
+        {
+            free(val);
+            xs_transaction_end(xs, t, true);
+            do_err("daemon already running");
+        }
+
+        if ( !xs_write(xs, t, "/tool/xenlog/state", "running",
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
+    if ( getenv("XENLOGD_VERBOSE") )
+        syslog_mask |= LOG_MASK(LOG_NOTICE) | LOG_MASK(LOG_INFO);
+    openlog("xenlogd", LOG_CONS, LOG_DAEMON);
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
-- 
2.35.3


