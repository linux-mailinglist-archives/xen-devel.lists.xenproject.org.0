Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F726221308
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:55:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkgh-00065E-4x; Wed, 15 Jul 2020 16:55:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkgf-00064u-Oc
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:55:17 +0000
X-Inumbo-ID: f5198b9c-c6bb-11ea-8496-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5198b9c-c6bb-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 16:55:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDz-0001sU-2q; Wed, 15 Jul 2020 17:25:39 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 10/12] tools: split libxenvchan into new tools/libs/vchan
 directory
Date: Wed, 15 Jul 2020 17:25:09 +0100
Message-Id: <20200715162511.5941-12-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
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
Reply-To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 ian.jackson@eu.citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

There is no reason why libvchan is not placed in the tools/libs
directory.

At the same time move libxenvchan.h to a dedicated include directory
in tools/libs/vchan in order to follow the same pattern as the other
libraries in tools/libs.

As tools/libvchan now contains no library any longer rename it to
tools/vchan.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  7 +-
 tools/Makefile                                |  2 +-
 tools/Rules.mk                                |  4 +-
 tools/libs/Makefile                           |  1 +
 tools/libs/vchan/Makefile                     | 19 ++++
 .../vchan/include}/libxenvchan.h              |  0
 tools/{libvchan => libs/vchan}/init.c         |  0
 tools/{libvchan => libs/vchan}/io.c           |  0
 tools/libs/vchan/libxenvchan.map              | 16 ++++
 tools/{libvchan => libs/vchan}/xenvchan.pc.in |  0
 tools/libvchan/Makefile                       | 95 -------------------
 tools/vchan/Makefile                          | 37 ++++++++
 tools/{libvchan => vchan}/node-select.c       |  0
 tools/{libvchan => vchan}/node.c              |  0
 .../{libvchan => vchan}/vchan-socket-proxy.c  |  0
 15 files changed, 80 insertions(+), 101 deletions(-)
 create mode 100644 tools/libs/vchan/Makefile
 rename tools/{libvchan => libs/vchan/include}/libxenvchan.h (100%)
 rename tools/{libvchan => libs/vchan}/init.c (100%)
 rename tools/{libvchan => libs/vchan}/io.c (100%)
 create mode 100644 tools/libs/vchan/libxenvchan.map
 rename tools/{libvchan => libs/vchan}/xenvchan.pc.in (100%)
 delete mode 100644 tools/libvchan/Makefile
 create mode 100644 tools/vchan/Makefile
 rename tools/{libvchan => vchan}/node-select.c (100%)
 rename tools/{libvchan => vchan}/node.c (100%)
 rename tools/{libvchan => vchan}/vchan-socket-proxy.c (100%)

diff --git a/.gitignore b/.gitignore
index dad694a979..3e130b0596 100644
--- a/.gitignore
+++ b/.gitignore
@@ -126,6 +126,8 @@ tools/libs/store/utils.h
 tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
 tools/libs/store/include/xenstore_lib.h
+tools/libs/vchan/headers.chk
+tools/libs/vchan/xenvchan.pc
 tools/console/xenconsole
 tools/console/xenconsoled
 tools/console/client/_paths.h
@@ -201,7 +203,6 @@ tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/libvchan/xenvchan.pc
 tools/libxc/*.pc
 tools/libxc/xc_bitops.h
 tools/libxc/xc_core.h
@@ -387,8 +388,8 @@ tools/misc/xenhypfs
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
index 88231856d7..ed119fffd7 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -21,7 +21,7 @@ SUBDIRS-y += xenmon
 SUBDIRS-y += xenstat
 SUBDIRS-$(CONFIG_NetBSD) += xenbackendd
 SUBDIRS-y += libfsimage
-SUBDIRS-$(CONFIG_Linux) += libvchan
+SUBDIRS-$(CONFIG_Linux) += vchan
 
 # do not recurse in to a dir we are about to delete
 ifneq "$(MAKECMDGOALS)" "distclean"
diff --git a/tools/Rules.mk b/tools/Rules.mk
index cd1b49bca8..30ee379484 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -22,12 +22,12 @@ XEN_libxendevicemodel = $(XEN_ROOT)/tools/libs/devicemodel
 XEN_libxenhypfs    = $(XEN_ROOT)/tools/libs/hypfs
 XEN_libxenctrl     = $(XEN_ROOT)/tools/libs/ctrl
 XEN_libxenstore    = $(XEN_ROOT)/tools/libs/store
+XEN_libxenvchan    = $(XEN_ROOT)/tools/libs/vchan
 XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
 XEN_libxenstat     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
-XEN_libxenvchan    = $(XEN_ROOT)/tools/libvchan
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -163,7 +163,7 @@ SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
 LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_libxenstat)/libxenstat$(libextension)
 SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_libxenstat)
 
-CFLAGS_libxenvchan = -I$(XEN_libxenvchan) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
+CFLAGS_libxenvchan = -I$(XEN_libxenvchan)/include $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
 LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_libxenvchan)/libxenvchan$(libextension)
 SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_libxenvchan)
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 27a7df9b31..396116b0b3 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -12,6 +12,7 @@ SUBDIRS-y += devicemodel
 SUBDIRS-y += ctrl
 SUBDIRS-y += hypfs
 SUBDIRS-y += store
+SUBDIRS-$(CONFIG_Linux) += vchan
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
new file mode 100644
index 0000000000..bf944d251c
--- /dev/null
+++ b/tools/libs/vchan/Makefile
@@ -0,0 +1,19 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+MAJOR = 4.14
+MINOR = 0
+LIBNAME  := vchan
+USELIBS  := toollog store evtchn gnttab
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
diff --git a/tools/libs/vchan/libxenvchan.map b/tools/libs/vchan/libxenvchan.map
new file mode 100644
index 0000000000..9ac00c5b45
--- /dev/null
+++ b/tools/libs/vchan/libxenvchan.map
@@ -0,0 +1,16 @@
+VERS_4.14.0 {
+	global:
+		libxenvchan_server_init;
+		libxenvchan_client_init;
+		libxenvchan_close;
+		libxenvchan_recv;
+		libxenvchan_read;
+		libxenvchan_send;
+		libxenvchan_write;
+		libxenvchan_wait;
+		libxenvchan_fd_for_select;
+		libxenvchan_is_open;
+		libxenvchan_data_ready;
+		libxenvchan_buffer_space;
+	local: *; /* Do not expose anything by default */
+};
diff --git a/tools/libvchan/xenvchan.pc.in b/tools/libs/vchan/xenvchan.pc.in
similarity index 100%
rename from tools/libvchan/xenvchan.pc.in
rename to tools/libs/vchan/xenvchan.pc.in
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
deleted file mode 100644
index 025a935cb7..0000000000
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
-MAJOR = 4.14
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
2.20.1


