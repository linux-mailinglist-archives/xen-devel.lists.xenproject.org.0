Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0F24EC98
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maS-0008NB-FZ; Sun, 23 Aug 2020 09:46:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQo-0004sy-HM
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:54 +0000
X-Inumbo-ID: 0e0af9ef-73bc-4219-867a-052ad65ca214
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e0af9ef-73bc-4219-867a-052ad65ca214;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1AE34AD6F;
 Sun, 23 Aug 2020 09:35:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 29/38] tools: split libxenvchan into new tools/libs/vchan
 directory
Date: Sun, 23 Aug 2020 11:35:10 +0200
Message-Id: <20200823093519.18386-30-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There is no reason why libvchan is not placed in the tools/libs
directory.

At the same time move libxenvchan.h to a dedicated include directory
in tools/libs/vchan in order to follow the same pattern as the other
libraries in tools/libs.

As tools/libvchan now contains no library any longer rename it to
tools/vchan.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  8 +-
 tools/Makefile                                |  2 +-
 tools/Rules.mk                                |  6 --
 tools/libs/Makefile                           |  1 +
 tools/libs/uselibs.mk                         |  2 +
 tools/libs/vchan/Makefile                     | 20 ++++
 .../vchan/include}/libxenvchan.h              |  0
 tools/{libvchan => libs/vchan}/init.c         |  0
 tools/{libvchan => libs/vchan}/io.c           |  0
 tools/{libvchan => libs/vchan}/xenvchan.pc.in |  0
 tools/libvchan/Makefile                       | 95 -------------------
 tools/vchan/Makefile                          | 37 ++++++++
 tools/{libvchan => vchan}/node-select.c       |  0
 tools/{libvchan => vchan}/node.c              |  0
 .../{libvchan => vchan}/vchan-socket-proxy.c  |  0
 15 files changed, 66 insertions(+), 105 deletions(-)
 create mode 100644 tools/libs/vchan/Makefile
 rename tools/{libvchan => libs/vchan/include}/libxenvchan.h (100%)
 rename tools/{libvchan => libs/vchan}/init.c (100%)
 rename tools/{libvchan => libs/vchan}/io.c (100%)
 rename tools/{libvchan => libs/vchan}/xenvchan.pc.in (100%)
 delete mode 100644 tools/libvchan/Makefile
 create mode 100644 tools/vchan/Makefile
 rename tools/{libvchan => vchan}/node-select.c (100%)
 rename tools/{libvchan => vchan}/node.c (100%)
 rename tools/{libvchan => vchan}/vchan-socket-proxy.c (100%)

diff --git a/.gitignore b/.gitignore
index cdfc456aae..b7171ff2eb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -134,6 +134,9 @@ tools/libs/store/utils.h
 tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
 tools/libs/store/include/xenstore_lib.h
+tools/libs/vchan/headers.chk
+tools/libs/vchan/libxenvchan.map
+tools/libs/vchan/xenvchan.pc
 tools/console/xenconsole
 tools/console/xenconsoled
 tools/console/client/_paths.h
@@ -209,7 +212,6 @@ tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/libvchan/xenvchan.pc
 tools/libxl/_libxl.api-for-check
 tools/libxl/*.api-ok
 tools/libxl/*.pc
@@ -388,8 +390,8 @@ tools/misc/xenhypfs
 tools/misc/xenwatchdogd
 tools/misc/xen-hvmcrash
 tools/misc/xen-lowmemd
-tools/libvchan/vchan-node[12]
-tools/libvchan/vchan-socket-proxy
+tools/vchan/vchan-node[12]
+tools/vchan/vchan-socket-proxy
 tools/ocaml/*/.ocamldep.make
 tools/ocaml/*/*.cm[ixao]
 tools/ocaml/*/*.cmxa
diff --git a/tools/Makefile b/tools/Makefile
index 4a3646871c..0db01707a4 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -20,7 +20,7 @@ SUBDIRS-y += xenmon
 SUBDIRS-y += xenstat
 SUBDIRS-$(CONFIG_NetBSD) += xenbackendd
 SUBDIRS-y += libfsimage
-SUBDIRS-$(CONFIG_Linux) += libvchan
+SUBDIRS-$(CONFIG_Linux) += vchan
 
 # do not recurse in to a dir we are about to delete
 ifneq "$(MAKECMDGOALS)" "distclean"
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 69a9100b1c..c5f7cd26e0 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -19,7 +19,6 @@ XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
 XEN_libxenstat     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
-XEN_libxenvchan    = $(XEN_ROOT)/tools/libvchan
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -114,11 +113,6 @@ SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
 LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_libxenstat)/libxenstat$(libextension)
 SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_libxenstat)
 
-CFLAGS_libxenvchan = -I$(XEN_libxenvchan) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
-SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
-LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_libxenvchan)/libxenvchan$(libextension)
-SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_libxenvchan)
-
 ifeq ($(debug),y)
 # Disable optimizations
 CFLAGS += -O0 -fno-omit-frame-pointer
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 62bd8f5292..756d059ee7 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -13,6 +13,7 @@ SUBDIRS-y += ctrl
 SUBDIRS-y += guest
 SUBDIRS-y += hypfs
 SUBDIRS-y += store
+SUBDIRS-$(CONFIG_Linux) += vchan
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index a0fe0402ff..edb4b34256 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -22,3 +22,5 @@ LIBS_LIBS += guest
 USELIBS_guest := evtchn ctrl
 LIBS_LIBS += store
 USELIBS_store := toolcore
+LIBS_LIBS += vchan
+USELIBS_vchan := toollog store gnttab evtchn
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
new file mode 100644
index 0000000000..87ff608f45
--- /dev/null
+++ b/tools/libs/vchan/Makefile
@@ -0,0 +1,20 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+CFLAGS += $(CFLAGS_libxenctrl)
+
+LIBHEADER := libxenvchan.h
+
+SRCS-y += init.c
+SRCS-y += io.c
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenvchan)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
+
+clean: cleanlocal
+
+.PHONY: cleanlocal
+cleanlocal:
+	rm -f libxenvchan.map
diff --git a/tools/libvchan/libxenvchan.h b/tools/libs/vchan/include/libxenvchan.h
similarity index 100%
rename from tools/libvchan/libxenvchan.h
rename to tools/libs/vchan/include/libxenvchan.h
diff --git a/tools/libvchan/init.c b/tools/libs/vchan/init.c
similarity index 100%
rename from tools/libvchan/init.c
rename to tools/libs/vchan/init.c
diff --git a/tools/libvchan/io.c b/tools/libs/vchan/io.c
similarity index 100%
rename from tools/libvchan/io.c
rename to tools/libs/vchan/io.c
diff --git a/tools/libvchan/xenvchan.pc.in b/tools/libs/vchan/xenvchan.pc.in
similarity index 100%
rename from tools/libvchan/xenvchan.pc.in
rename to tools/libs/vchan/xenvchan.pc.in
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
deleted file mode 100644
index a5441162a0..0000000000
--- a/tools/libvchan/Makefile
+++ /dev/null
@@ -1,95 +0,0 @@
-#
-# tools/libvchan/Makefile
-#
-
-XEN_ROOT = $(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-LIBVCHAN_OBJS = init.o io.o
-NODE_OBJS = node.o
-NODE2_OBJS = node-select.o
-
-LIBVCHAN_PIC_OBJS = $(patsubst %.o,%.opic,$(LIBVCHAN_OBJS))
-LIBVCHAN_LIBS = $(LDLIBS_libxenstore) $(LDLIBS_libxengnttab) $(LDLIBS_libxenevtchn)
-$(LIBVCHAN_OBJS) $(LIBVCHAN_PIC_OBJS): CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
-$(NODE_OBJS) $(NODE2_OBJS): CFLAGS += $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
-vchan-socket-proxy.o: CFLAGS += $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
-
-MAJOR = 4.15
-MINOR = 0
-
-CFLAGS += -I../include -I.
-
-io.o io.opic: CFLAGS += $(CFLAGS_libxenctrl) # for xen_mb et al
-
-PKG_CONFIG := xenvchan.pc
-PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
-
-ifneq ($(CONFIG_LIBXC_MINIOS),y)
-PKG_CONFIG_INST := $(PKG_CONFIG)
-$(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
-$(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
-$(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
-endif
-
-PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenvchan)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
-.PHONY: all
-all: libxenvchan.so vchan-node1 vchan-node2 vchan-socket-proxy libxenvchan.a $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-
-libxenvchan.so: libxenvchan.so.$(MAJOR)
-	ln -sf $< $@
-
-libxenvchan.so.$(MAJOR): libxenvchan.so.$(MAJOR).$(MINOR)
-	ln -sf $< $@
-
-libxenvchan.so.$(MAJOR).$(MINOR): $(LIBVCHAN_PIC_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenvchan.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LIBVCHAN_LIBS) $(APPEND_LDFLAGS)
-
-libxenvchan.a: $(LIBVCHAN_OBJS)
-	$(AR) rcs libxenvchan.a $^
-
-vchan-node1: $(NODE_OBJS) libxenvchan.so
-	$(CC) $(LDFLAGS) -o $@ $(NODE_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
-
-vchan-node2: $(NODE2_OBJS) libxenvchan.so
-	$(CC) $(LDFLAGS) -o $@ $(NODE2_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
-
-vchan-socket-proxy: vchan-socket-proxy.o libxenvchan.so
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_DIR) $(DESTDIR)$(bindir)
-	$(INSTALL_PROG) libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	ln -sf libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenvchan.so.$(MAJOR)
-	ln -sf libxenvchan.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenvchan.so
-	$(INSTALL_PROG) vchan-socket-proxy $(DESTDIR)$(bindir)
-	$(INSTALL_DATA) libxenvchan.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) libxenvchan.a $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) xenvchan.pc $(DESTDIR)$(PKG_INSTALLDIR)
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xenvchan.pc
-	rm -f $(DESTDIR)$(libdir)/libxenvchan.a
-	rm -f $(DESTDIR)$(includedir)/libxenvchan.h
-	rm -f $(DESTDIR)$(libdir)/libxenvchan.so
-	rm -f $(DESTDIR)$(libdir)/libxenvchan.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenvchan.so.$(MAJOR).$(MINOR)
-
-.PHONY: clean
-clean:
-	$(RM) -f *.o *.opic *.so* *.a vchan-node1 vchan-node2 $(DEPS_RM)
-	$(RM) -f xenvchan.pc
-
-distclean: clean
-
--include $(DEPS_INCLUDE)
diff --git a/tools/vchan/Makefile b/tools/vchan/Makefile
new file mode 100644
index 0000000000..a731e0e073
--- /dev/null
+++ b/tools/vchan/Makefile
@@ -0,0 +1,37 @@
+#
+# tools/vchan/Makefile
+#
+
+XEN_ROOT = $(CURDIR)/../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+NODE_OBJS = node.o
+NODE2_OBJS = node-select.o
+
+$(NODE_OBJS) $(NODE2_OBJS): CFLAGS += $(CFLAGS_libxenvchan) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
+vchan-socket-proxy.o: CFLAGS += $(CFLAGS_libxenvchan) $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
+
+.PHONY: all
+all: vchan-node1 vchan-node2 vchan-socket-proxy
+
+vchan-node1: $(NODE_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(NODE_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
+
+vchan-node2: $(NODE2_OBJS)
+	$(CC) $(LDFLAGS) -o $@ $(NODE2_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
+
+vchan-socket-proxy: vchan-socket-proxy.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
+.PHONY: install
+install: all
+	$(INSTALL_DIR) $(DESTDIR)$(bindir)
+	$(INSTALL_PROG) vchan-socket-proxy $(DESTDIR)$(bindir)
+
+.PHONY: clean
+clean:
+	$(RM) -f *.o vchan-node1 vchan-node2 $(DEPS_RM)
+
+distclean: clean
+
+-include $(DEPS_INCLUDE)
diff --git a/tools/libvchan/node-select.c b/tools/vchan/node-select.c
similarity index 100%
rename from tools/libvchan/node-select.c
rename to tools/vchan/node-select.c
diff --git a/tools/libvchan/node.c b/tools/vchan/node.c
similarity index 100%
rename from tools/libvchan/node.c
rename to tools/vchan/node.c
diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
similarity index 100%
rename from tools/libvchan/vchan-socket-proxy.c
rename to tools/vchan/vchan-socket-proxy.c
-- 
2.26.2


