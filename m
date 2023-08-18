Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D640A780D94
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 16:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586347.917566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX09o-0006pk-4p; Fri, 18 Aug 2023 14:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586347.917566; Fri, 18 Aug 2023 14:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX09o-0006mN-1J; Fri, 18 Aug 2023 14:08:56 +0000
Received: by outflank-mailman (input) for mailman id 586347;
 Fri, 18 Aug 2023 14:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qX09m-0006mH-4z
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 14:08:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1bb875f-3dd0-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 16:08:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 395751F8A8;
 Fri, 18 Aug 2023 14:08:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBA3F13441;
 Fri, 18 Aug 2023 14:08:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OfckNHF732QKOAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 18 Aug 2023 14:08:49 +0000
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
X-Inumbo-ID: c1bb875f-3dd0-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692367730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=x0k/xmMcEMB3HG/re1U02md6JsJVh4sxDz/E/SC1Hhs=;
	b=cW0Yh+wO08rS1WrPmlKVWUo+TdS863sU5+NkKBdER9omNWpBpbVYQmj9n+m2qd/yuWU45h
	j4+6KMXydJBvuoxVcxCvqUd499yqeEjN1pTvhMdz5UMf+TdFr/KlTqwxCdWQ8TBzCqspPh
	ZYnEswplPVW+fXzKIhsFfJa+NM9PmNk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v5] tools/xenstore: move xenstored sources into dedicated directory
Date: Fri, 18 Aug 2023 16:08:48 +0200
Message-Id: <20230818140848.20220-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tools/xenstore there are living xenstored and xenstore clients.
They are no longer sharing anything apart from the "xenstore" in their
names.

Move the xenstored sources into a new directory tools/xenstored while
dropping the "xenstored_" prefix from their names. This will make it
clearer that xenstore clients and xenstored are independent from each
other.

In order to avoid two very similar named directories below tools,
rename tools/xenstore to tools/xs-clients.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
After the large overhaul of xenstored I think such a reorg would make
sense to go into the same Xen version. Delaying it until the next
version would make potential backports for 4.18 harder.
V4:
- new patch
V5:
- rename xenstore directory to xs-clients (Julien Grall)
---
 .gitignore                                    | 22 ++++-----
 MAINTAINERS                                   |  3 +-
 stubdom/Makefile                              |  4 +-
 tools/Makefile                                |  3 +-
 tools/xenstored/Makefile                      | 48 +++++++++++++++++++
 tools/{xenstore => xenstored}/Makefile.common | 13 +++--
 tools/{xenstore => xenstored}/README          |  0
 .../control.c}                                |  8 ++--
 .../control.h}                                |  0
 .../xenstored_core.c => xenstored/core.c}     | 14 +++---
 .../xenstored_core.h => xenstored/core.h}     |  0
 .../xenstored_domain.c => xenstored/domain.c} | 10 ++--
 .../xenstored_domain.h => xenstored/domain.h} |  0
 tools/{xenstore => xenstored}/hashtable.c     |  0
 tools/{xenstore => xenstored}/hashtable.h     |  0
 tools/{xenstore => xenstored}/list.h          |  0
 .../xenstored_lu.c => xenstored/lu.c}         |  8 ++--
 .../xenstored_lu.h => xenstored/lu.h}         |  0
 .../lu_daemon.c}                              |  4 +-
 .../lu_minios.c}                              |  2 +-
 .../xenstored_minios.c => xenstored/minios.c} |  2 +-
 .../xenstored_osdep.h => xenstored/osdep.h}   |  0
 .../xenstored_posix.c => xenstored/posix.c}   |  4 +-
 tools/{xenstore => xenstored}/talloc.c        |  0
 tools/{xenstore => xenstored}/talloc.h        |  0
 .../{xenstore => xenstored}/talloc_guide.txt  |  0
 .../transaction.c}                            |  6 +--
 .../transaction.h}                            |  2 +-
 tools/{xenstore => xenstored}/utils.c         |  0
 tools/{xenstore => xenstored}/utils.h         |  0
 .../xenstored_watch.c => xenstored/watch.c}   |  6 +--
 .../xenstored_watch.h => xenstored/watch.h}   |  2 +-
 .../include => xenstored}/xenstore_state.h    |  0
 tools/{xenstore => xs-clients}/Makefile       | 30 ++----------
 .../xenstore_client.c                         |  0
 .../xenstore_control.c                        |  0
 36 files changed, 110 insertions(+), 81 deletions(-)
 create mode 100644 tools/xenstored/Makefile
 rename tools/{xenstore => xenstored}/Makefile.common (50%)
 rename tools/{xenstore => xenstored}/README (100%)
 rename tools/{xenstore/xenstored_control.c => xenstored/control.c} (98%)
 rename tools/{xenstore/xenstored_control.h => xenstored/control.h} (100%)
 rename tools/{xenstore/xenstored_core.c => xenstored/core.c} (99%)
 rename tools/{xenstore/xenstored_core.h => xenstored/core.h} (100%)
 rename tools/{xenstore/xenstored_domain.c => xenstored/domain.c} (99%)
 rename tools/{xenstore/xenstored_domain.h => xenstored/domain.h} (100%)
 rename tools/{xenstore => xenstored}/hashtable.c (100%)
 rename tools/{xenstore => xenstored}/hashtable.h (100%)
 rename tools/{xenstore => xenstored}/list.h (100%)
 rename tools/{xenstore/xenstored_lu.c => xenstored/lu.c} (98%)
 rename tools/{xenstore/xenstored_lu.h => xenstored/lu.h} (100%)
 rename tools/{xenstore/xenstored_lu_daemon.c => xenstored/lu_daemon.c} (97%)
 rename tools/{xenstore/xenstored_lu_minios.c => xenstored/lu_minios.c} (98%)
 rename tools/{xenstore/xenstored_minios.c => xenstored/minios.c} (97%)
 rename tools/{xenstore/xenstored_osdep.h => xenstored/osdep.h} (100%)
 rename tools/{xenstore/xenstored_posix.c => xenstored/posix.c} (98%)
 rename tools/{xenstore => xenstored}/talloc.c (100%)
 rename tools/{xenstore => xenstored}/talloc.h (100%)
 rename tools/{xenstore => xenstored}/talloc_guide.txt (100%)
 rename tools/{xenstore/xenstored_transaction.c => xenstored/transaction.c} (99%)
 rename tools/{xenstore/xenstored_transaction.h => xenstored/transaction.h} (98%)
 rename tools/{xenstore => xenstored}/utils.c (100%)
 rename tools/{xenstore => xenstored}/utils.h (100%)
 rename tools/{xenstore/xenstored_watch.c => xenstored/watch.c} (98%)
 rename tools/{xenstore/xenstored_watch.h => xenstored/watch.h} (98%)
 rename tools/{xenstore/include => xenstored}/xenstore_state.h (100%)
 rename tools/{xenstore => xs-clients}/Makefile (74%)
 rename tools/{xenstore => xs-clients}/xenstore_client.c (100%)
 rename tools/{xenstore => xs-clients}/xenstore_control.c (100%)

diff --git a/.gitignore b/.gitignore
index c1b73b0968..c6489c4e70 100644
--- a/.gitignore
+++ b/.gitignore
@@ -237,22 +237,22 @@ tools/xenmon/xentrace_setmask
 tools/xenmon/xenbaked
 tools/xenpaging/xenpaging
 tools/xenpmd/xenpmd
-tools/xenstore/xenstore
-tools/xenstore/xenstore-chmod
-tools/xenstore/xenstore-control
-tools/xenstore/xenstore-exists
-tools/xenstore/xenstore-list
-tools/xenstore/xenstore-ls
-tools/xenstore/xenstore-read
-tools/xenstore/xenstore-rm
-tools/xenstore/xenstore-watch
-tools/xenstore/xenstore-write
-tools/xenstore/xenstored
+tools/xenstored/xenstored
 tools/xentop/xentop
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
 tools/xentrace/xenctx
 tools/xentrace/xentrace
+tools/xs-clients/xenstore
+tools/xs-clients/xenstore-chmod
+tools/xs-clients/xenstore-control
+tools/xs-clients/xenstore-exists
+tools/xs-clients/xenstore-list
+tools/xs-clients/xenstore-ls
+tools/xs-clients/xenstore-read
+tools/xs-clients/xenstore-rm
+tools/xs-clients/xenstore-watch
+tools/xs-clients/xenstore-write
 xen/**/*.i
 xen/**/*.s
 xen/.banner
diff --git a/MAINTAINERS b/MAINTAINERS
index a0805d35cd..bf71ac144c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -669,7 +669,8 @@ F:	tools/include/xenstore.h
 F:	tools/include/xenstore_lib.h
 F:	tools/include/xen-tools/xenstore-common.h
 F:	tools/libs/store/
-F:	tools/xenstore/
+F:	tools/xenstored/
+F:	tools/xs-clients/
 
 XENTRACE
 M:	George Dunlap <george.dunlap@citrix.com>
diff --git a/stubdom/Makefile b/stubdom/Makefile
index d5fb354e7e..52bf7f0e21 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -371,10 +371,10 @@ endef
 
 $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
-xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile.common
+xenstore/stamp: $(XEN_ROOT)/tools/xenstored/Makefile.common
 	$(do_links)
 
-xenstorepvh/stamp: $(XEN_ROOT)/tools/xenstore/Makefile.common
+xenstorepvh/stamp: $(XEN_ROOT)/tools/xenstored/Makefile.common
 	$(do_links)
 
 LINK_DIRS := xenstore xenstorepvh $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
diff --git a/tools/Makefile b/tools/Makefile
index 311a9098d7..3a510663a0 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -8,7 +8,8 @@ SUBDIRS-y :=
 SUBDIRS-y += libs
 SUBDIRS-y += flask
 SUBDIRS-y += fuzz
-SUBDIRS-y += xenstore
+SUBDIRS-y += xs-clients
+SUBDIRS-$(XENSTORE_XENSTORED) += xenstored
 SUBDIRS-y += misc
 SUBDIRS-y += examples
 SUBDIRS-y += hotplug
diff --git a/tools/xenstored/Makefile b/tools/xenstored/Makefile
new file mode 100644
index 0000000000..f3bd3d43c4
--- /dev/null
+++ b/tools/xenstored/Makefile
@@ -0,0 +1,48 @@
+XEN_ROOT=$(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+include Makefile.common
+
+xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
+xenstored: LDLIBS += $(LDLIBS_libxengnttab)
+xenstored: LDLIBS += $(LDLIBS_libxenctrl)
+xenstored: LDLIBS += -lrt
+xenstored: LDLIBS += $(SOCKET_LIBS)
+
+ifeq ($(CONFIG_SYSTEMD),y)
+$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
+xenstored: LDLIBS += $(SYSTEMD_LIBS)
+endif
+
+TARGETS += xenstored
+
+.PHONY: all
+all: $(TARGETS)
+
+xenstored: $(XENSTORED_OBJS-y)
+	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
+
+.PHONY: clean
+clean::
+	$(RM) $(TARGETS) $(DEPS_RM)
+
+.PHONY: distclean
+distclean: clean
+
+.PHONY: TAGS
+TAGS:
+	etags `find . -name '*.[ch]'`
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
+	$(INSTALL_PROG) xenstored $(DESTDIR)$(sbindir)
+
+.PHONY: uninstall
+uninstall:
+	rm -f $(DESTDIR)$(sbindir)/xenstored
+	if [ -d $(DESTDIR)$(includedir)/xenstore-compat ]; then \
+		rmdir --ignore-fail-on-non-empty $(DESTDIR)$(includedir)/xenstore-compat; \
+	fi
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/xenstore/Makefile.common b/tools/xenstored/Makefile.common
similarity index 50%
rename from tools/xenstore/Makefile.common
rename to tools/xenstored/Makefile.common
index 41973a8a5e..189ab81b8d 100644
--- a/tools/xenstore/Makefile.common
+++ b/tools/xenstored/Makefile.common
@@ -1,17 +1,16 @@
 # Makefile shared with stubdom
 
-XENSTORED_OBJS-y := xenstored_core.o xenstored_watch.o xenstored_domain.o
-XENSTORED_OBJS-y += xenstored_transaction.o xenstored_control.o xenstored_lu.o
+XENSTORED_OBJS-y := core.o watch.o domain.o
+XENSTORED_OBJS-y += transaction.o control.o lu.o
 XENSTORED_OBJS-y += talloc.o utils.o hashtable.o
 
-XENSTORED_OBJS-$(CONFIG_Linux) += xenstored_posix.o xenstored_lu_daemon.o
-XENSTORED_OBJS-$(CONFIG_NetBSD) += xenstored_posix.o xenstored_lu_daemon.o
-XENSTORED_OBJS-$(CONFIG_FreeBSD) += xenstored_posix.o xenstored_lu_daemon.o
-XENSTORED_OBJS-$(CONFIG_MiniOS) += xenstored_minios.o xenstored_lu_minios.o
+XENSTORED_OBJS-$(CONFIG_Linux) += posix.o lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_NetBSD) += posix.o lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_FreeBSD) += posix.o lu_daemon.o
+XENSTORED_OBJS-$(CONFIG_MiniOS) += minios.o lu_minios.o
 
 # Include configure output (config.h)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
-CFLAGS += -I./include
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenguest)
diff --git a/tools/xenstore/README b/tools/xenstored/README
similarity index 100%
rename from tools/xenstore/README
rename to tools/xenstored/README
diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstored/control.c
similarity index 98%
rename from tools/xenstore/xenstored_control.c
rename to tools/xenstored/control.c
index 3bdf2edc34..b2f64d674f 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstored/control.c
@@ -27,10 +27,10 @@
 
 #include "utils.h"
 #include "talloc.h"
-#include "xenstored_core.h"
-#include "xenstored_control.h"
-#include "xenstored_domain.h"
-#include "xenstored_lu.h"
+#include "core.h"
+#include "control.h"
+#include "domain.h"
+#include "lu.h"
 
 struct cmd_s {
 	char *cmd;
diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstored/control.h
similarity index 100%
rename from tools/xenstore/xenstored_control.h
rename to tools/xenstored/control.h
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstored/core.c
similarity index 99%
rename from tools/xenstore/xenstored_core.c
rename to tools/xenstored/core.c
index 7de4df2f28..092de76a2e 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstored/core.c
@@ -47,12 +47,12 @@
 #include "utils.h"
 #include "list.h"
 #include "talloc.h"
-#include "xenstored_core.h"
-#include "xenstored_watch.h"
-#include "xenstored_transaction.h"
-#include "xenstored_domain.h"
-#include "xenstored_control.h"
-#include "xenstored_lu.h"
+#include "core.h"
+#include "watch.h"
+#include "transaction.h"
+#include "domain.h"
+#include "control.h"
+#include "lu.h"
 
 #ifndef NO_SOCKETS
 #if defined(HAVE_SYSTEMD)
@@ -64,7 +64,7 @@
 #include <systemd/sd-daemon.h>
 #endif
 
-extern xenevtchn_handle *xce_handle; /* in xenstored_domain.c */
+extern xenevtchn_handle *xce_handle; /* in domain.c */
 static int xce_pollfd_idx = -1;
 static struct pollfd *fds;
 static unsigned int current_array_size;
diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstored/core.h
similarity index 100%
rename from tools/xenstore/xenstored_core.h
rename to tools/xenstored/core.h
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstored/domain.c
similarity index 99%
rename from tools/xenstore/xenstored_domain.c
rename to tools/xenstored/domain.c
index 1bf138c8b1..a6cd199fdc 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstored/domain.c
@@ -27,11 +27,11 @@
 
 #include "utils.h"
 #include "talloc.h"
-#include "xenstored_core.h"
-#include "xenstored_domain.h"
-#include "xenstored_transaction.h"
-#include "xenstored_watch.h"
-#include "xenstored_control.h"
+#include "core.h"
+#include "domain.h"
+#include "transaction.h"
+#include "watch.h"
+#include "control.h"
 
 #include <xenevtchn.h>
 #include <xenctrl.h>
diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstored/domain.h
similarity index 100%
rename from tools/xenstore/xenstored_domain.h
rename to tools/xenstored/domain.h
diff --git a/tools/xenstore/hashtable.c b/tools/xenstored/hashtable.c
similarity index 100%
rename from tools/xenstore/hashtable.c
rename to tools/xenstored/hashtable.c
diff --git a/tools/xenstore/hashtable.h b/tools/xenstored/hashtable.h
similarity index 100%
rename from tools/xenstore/hashtable.h
rename to tools/xenstored/hashtable.h
diff --git a/tools/xenstore/list.h b/tools/xenstored/list.h
similarity index 100%
rename from tools/xenstore/list.h
rename to tools/xenstored/list.h
diff --git a/tools/xenstore/xenstored_lu.c b/tools/xenstored/lu.c
similarity index 98%
rename from tools/xenstore/xenstored_lu.c
rename to tools/xenstored/lu.c
index f7f76acbf9..2f41d10c95 100644
--- a/tools/xenstore/xenstored_lu.c
+++ b/tools/xenstored/lu.c
@@ -13,10 +13,10 @@
 #include <time.h>
 
 #include "talloc.h"
-#include "xenstored_core.h"
-#include "xenstored_domain.h"
-#include "xenstored_lu.h"
-#include "xenstored_watch.h"
+#include "core.h"
+#include "domain.h"
+#include "lu.h"
+#include "watch.h"
 
 #ifndef NO_LIVE_UPDATE
 struct live_update *lu_status;
diff --git a/tools/xenstore/xenstored_lu.h b/tools/xenstored/lu.h
similarity index 100%
rename from tools/xenstore/xenstored_lu.h
rename to tools/xenstored/lu.h
diff --git a/tools/xenstore/xenstored_lu_daemon.c b/tools/xenstored/lu_daemon.c
similarity index 97%
rename from tools/xenstore/xenstored_lu_daemon.c
rename to tools/xenstored/lu_daemon.c
index 8c7522b0e1..71bcabadd3 100644
--- a/tools/xenstore/xenstored_lu_daemon.c
+++ b/tools/xenstored/lu_daemon.c
@@ -13,8 +13,8 @@
 #include <xen-tools/xenstore-common.h>
 
 #include "talloc.h"
-#include "xenstored_core.h"
-#include "xenstored_lu.h"
+#include "core.h"
+#include "lu.h"
 
 #ifndef NO_LIVE_UPDATE
 void lu_get_dump_state(struct lu_dump_state *state)
diff --git a/tools/xenstore/xenstored_lu_minios.c b/tools/xenstored/lu_minios.c
similarity index 98%
rename from tools/xenstore/xenstored_lu_minios.c
rename to tools/xenstored/lu_minios.c
index ae0483575e..ede8b4dd47 100644
--- a/tools/xenstore/xenstored_lu_minios.c
+++ b/tools/xenstored/lu_minios.c
@@ -14,7 +14,7 @@
 #include <xen-tools/common-macros.h>
 
 #include "talloc.h"
-#include "xenstored_lu.h"
+#include "lu.h"
 
 /* Mini-OS only knows about MAP_ANON. */
 #ifndef MAP_ANONYMOUS
diff --git a/tools/xenstore/xenstored_minios.c b/tools/xenstored/minios.c
similarity index 97%
rename from tools/xenstore/xenstored_minios.c
rename to tools/xenstored/minios.c
index aa384e50c8..b5c3a205e6 100644
--- a/tools/xenstore/xenstored_minios.c
+++ b/tools/xenstored/minios.c
@@ -17,7 +17,7 @@
 */
 #include <sys/types.h>
 #include <sys/mman.h>
-#include "xenstored_core.h"
+#include "core.h"
 #include <xen/grant_table.h>
 
 void write_pidfile(const char *pidfile)
diff --git a/tools/xenstore/xenstored_osdep.h b/tools/xenstored/osdep.h
similarity index 100%
rename from tools/xenstore/xenstored_osdep.h
rename to tools/xenstored/osdep.h
diff --git a/tools/xenstore/xenstored_posix.c b/tools/xenstored/posix.c
similarity index 98%
rename from tools/xenstore/xenstored_posix.c
rename to tools/xenstored/posix.c
index b20504d1b6..6ac45fdb45 100644
--- a/tools/xenstore/xenstored_posix.c
+++ b/tools/xenstored/posix.c
@@ -24,8 +24,8 @@
 #include <sys/mman.h>
 
 #include "utils.h"
-#include "xenstored_core.h"
-#include "xenstored_osdep.h"
+#include "core.h"
+#include "osdep.h"
 
 void write_pidfile(const char *pidfile)
 {
diff --git a/tools/xenstore/talloc.c b/tools/xenstored/talloc.c
similarity index 100%
rename from tools/xenstore/talloc.c
rename to tools/xenstored/talloc.c
diff --git a/tools/xenstore/talloc.h b/tools/xenstored/talloc.h
similarity index 100%
rename from tools/xenstore/talloc.h
rename to tools/xenstored/talloc.h
diff --git a/tools/xenstore/talloc_guide.txt b/tools/xenstored/talloc_guide.txt
similarity index 100%
rename from tools/xenstore/talloc_guide.txt
rename to tools/xenstored/talloc_guide.txt
diff --git a/tools/xenstore/xenstored_transaction.c b/tools/xenstored/transaction.c
similarity index 99%
rename from tools/xenstore/xenstored_transaction.c
rename to tools/xenstored/transaction.c
index 1f892b002d..167cd597fd 100644
--- a/tools/xenstore/xenstored_transaction.c
+++ b/tools/xenstored/transaction.c
@@ -30,9 +30,9 @@
 #include <unistd.h>
 #include "talloc.h"
 #include "list.h"
-#include "xenstored_transaction.h"
-#include "xenstored_watch.h"
-#include "xenstored_domain.h"
+#include "transaction.h"
+#include "watch.h"
+#include "domain.h"
 #include "xenstore_lib.h"
 #include "utils.h"
 
diff --git a/tools/xenstore/xenstored_transaction.h b/tools/xenstored/transaction.h
similarity index 98%
rename from tools/xenstore/xenstored_transaction.h
rename to tools/xenstored/transaction.h
index b196b1ab07..90435b4fc9 100644
--- a/tools/xenstore/xenstored_transaction.h
+++ b/tools/xenstored/transaction.h
@@ -17,7 +17,7 @@
 */
 #ifndef _XENSTORED_TRANSACTION_H
 #define _XENSTORED_TRANSACTION_H
-#include "xenstored_core.h"
+#include "core.h"
 
 enum node_access_type {
     NODE_ACCESS_READ,
diff --git a/tools/xenstore/utils.c b/tools/xenstored/utils.c
similarity index 100%
rename from tools/xenstore/utils.c
rename to tools/xenstored/utils.c
diff --git a/tools/xenstore/utils.h b/tools/xenstored/utils.h
similarity index 100%
rename from tools/xenstore/utils.h
rename to tools/xenstored/utils.h
diff --git a/tools/xenstore/xenstored_watch.c b/tools/xenstored/watch.c
similarity index 98%
rename from tools/xenstore/xenstored_watch.c
rename to tools/xenstored/watch.c
index 7d4d097cf9..b66a9f1a39 100644
--- a/tools/xenstore/xenstored_watch.c
+++ b/tools/xenstored/watch.c
@@ -25,11 +25,11 @@
 #include <assert.h>
 #include "talloc.h"
 #include "list.h"
-#include "xenstored_watch.h"
+#include "watch.h"
 #include "xenstore_lib.h"
 #include "utils.h"
-#include "xenstored_domain.h"
-#include "xenstored_transaction.h"
+#include "domain.h"
+#include "transaction.h"
 
 struct watch
 {
diff --git a/tools/xenstore/xenstored_watch.h b/tools/xenstored/watch.h
similarity index 98%
rename from tools/xenstore/xenstored_watch.h
rename to tools/xenstored/watch.h
index ea247997ad..d9ac6a334a 100644
--- a/tools/xenstore/xenstored_watch.h
+++ b/tools/xenstored/watch.h
@@ -19,7 +19,7 @@
 #ifndef _XENSTORED_WATCH_H
 #define _XENSTORED_WATCH_H
 
-#include "xenstored_core.h"
+#include "core.h"
 
 int do_watch(const void *ctx, struct connection *conn,
 	     struct buffered_data *in);
diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstored/xenstore_state.h
similarity index 100%
rename from tools/xenstore/include/xenstore_state.h
rename to tools/xenstored/xenstore_state.h
diff --git a/tools/xenstore/Makefile b/tools/xs-clients/Makefile
similarity index 74%
rename from tools/xenstore/Makefile
rename to tools/xs-clients/Makefile
index dc39b6cb31..1c5740450a 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xs-clients/Makefile
@@ -1,18 +1,11 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-include Makefile.common
-
-xenstored: LDLIBS += $(LDLIBS_libxenevtchn)
-xenstored: LDLIBS += $(LDLIBS_libxengnttab)
-xenstored: LDLIBS += $(LDLIBS_libxenctrl)
-xenstored: LDLIBS += -lrt
-xenstored: LDLIBS += $(SOCKET_LIBS)
-
-ifeq ($(CONFIG_SYSTEMD),y)
-$(XENSTORED_OBJS-y): CFLAGS += $(SYSTEMD_CFLAGS)
-xenstored: LDLIBS += $(SYSTEMD_LIBS)
-endif
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
+CFLAGS += $(CFLAGS_libxentoolcore)
+CFLAGS += $(CFLAGS_libxenstore)
 
 xenstore: LDLIBS += $(LDLIBS_libxenstore)
 xenstore: LDLIBS += $(LDLIBS_libxentoolcore)
@@ -28,9 +21,6 @@ CLIENTS := xenstore-exists xenstore-list xenstore-read xenstore-rm xenstore-chmo
 CLIENTS += xenstore-write xenstore-ls xenstore-watch
 
 TARGETS := xenstore $(CLIENTS) xenstore-control
-ifeq ($(XENSTORE_XENSTORED),y)
-TARGETS += xenstored
-endif
 
 .PHONY: all
 all: $(TARGETS)
@@ -38,9 +28,6 @@ all: $(TARGETS)
 .PHONY: clients
 clients: xenstore $(CLIENTS) xenstore-control
 
-xenstored: $(XENSTORED_OBJS-y)
-	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@ $(APPEND_LDFLAGS)
-
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
@@ -64,10 +51,6 @@ TAGS:
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
-ifeq ($(XENSTORE_XENSTORED),y)
-	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) xenstored $(DESTDIR)$(sbindir)
-endif
 	$(INSTALL_PROG) xenstore-control $(DESTDIR)$(bindir)
 	$(INSTALL_PROG) xenstore $(DESTDIR)$(bindir)
 	set -e ; for c in $(CLIENTS) ; do \
@@ -79,9 +62,6 @@ uninstall:
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(CLIENTS))
 	rm -f $(DESTDIR)$(bindir)/xenstore
 	rm -f $(DESTDIR)$(bindir)/xenstore-control
-ifeq ($(XENSTORE_XENSTORED),y)
-	rm -f $(DESTDIR)$(sbindir)/xenstored
-endif
 	if [ -d $(DESTDIR)$(includedir)/xenstore-compat ]; then \
 		rmdir --ignore-fail-on-non-empty $(DESTDIR)$(includedir)/xenstore-compat; \
 	fi
diff --git a/tools/xenstore/xenstore_client.c b/tools/xs-clients/xenstore_client.c
similarity index 100%
rename from tools/xenstore/xenstore_client.c
rename to tools/xs-clients/xenstore_client.c
diff --git a/tools/xenstore/xenstore_control.c b/tools/xs-clients/xenstore_control.c
similarity index 100%
rename from tools/xenstore/xenstore_control.c
rename to tools/xs-clients/xenstore_control.c
-- 
2.35.3


