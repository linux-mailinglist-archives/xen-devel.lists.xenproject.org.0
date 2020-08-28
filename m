Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97338255DBB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgCp-0008Pz-3s; Fri, 28 Aug 2020 15:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzq-0004eL-JP
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:54 +0000
X-Inumbo-ID: 8c9e3c4c-3574-463e-91dc-68e54913e1e0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c9e3c4c-3574-463e-91dc-68e54913e1e0;
 Fri, 28 Aug 2020 15:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B04EAF95;
 Fri, 28 Aug 2020 15:08:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 20/31] tools: split libxenstore into new tools/libs/store
 directory
Date: Fri, 28 Aug 2020 17:07:36 +0200
Message-Id: <20200828150747.25305-21-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

There is no reason why libxenstore is not placed in the tools/libs
directory.

The common files between libxenstore and xenstored are kept in the
tools/xenstore directory to be easily accessible by xenstore-stubdom
which needs the xenstored files to be built.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 .gitignore                                    |  7 +-
 stubdom/mini-os.mk                            |  2 +-
 tools/Makefile                                |  2 +-
 tools/Rules.mk                                |  5 --
 tools/libs/Makefile                           |  1 +
 tools/libs/store/Makefile                     | 64 ++++++++++++++
 .../store}/include/compat/xs.h                |  0
 .../store}/include/compat/xs_lib.h            |  0
 .../store}/include/xenstore.h                 |  0
 tools/libs/store/libxenstore.map              | 49 +++++++++++
 tools/{xenstore => libs/store}/xs.c           |  0
 tools/libs/uselibs.mk                         |  2 +
 tools/python/setup.py                         |  2 +-
 tools/xenstore/Makefile                       | 86 +------------------
 tools/xenstore/{include => }/xenstore_lib.h   |  0
 15 files changed, 129 insertions(+), 91 deletions(-)
 create mode 100644 tools/libs/store/Makefile
 rename tools/{xenstore => libs/store}/include/compat/xs.h (100%)
 rename tools/{xenstore => libs/store}/include/compat/xs_lib.h (100%)
 rename tools/{xenstore => libs/store}/include/xenstore.h (100%)
 create mode 100644 tools/libs/store/libxenstore.map
 rename tools/{xenstore => libs/store}/xs.c (100%)
 rename tools/xenstore/{include => }/xenstore_lib.h (100%)

diff --git a/.gitignore b/.gitignore
index eb637a98e9..1335034fd3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -128,6 +128,12 @@ tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
 tools/libs/guest/xc_core_x86.h
 tools/libs/guest/xc_private.h
+tools/libs/store/headers.chk
+tools/libs/store/list.h
+tools/libs/store/utils.h
+tools/libs/store/xenstore.pc
+tools/libs/store/xs_lib.c
+tools/libs/store/include/xenstore_lib.h
 tools/console/xenconsole
 tools/console/xenconsoled
 tools/console/client/_paths.h
@@ -282,7 +288,6 @@ tools/xenstore/xenstore-control
 tools/xenstore/xenstore-ls
 tools/xenstore/xenstored
 tools/xenstore/xenstored_test
-tools/xenstore/xenstore.pc
 tools/xenstore/xs_tdb_dump
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
index e1640a7cbc..420e9a8771 100644
--- a/stubdom/mini-os.mk
+++ b/stubdom/mini-os.mk
@@ -5,7 +5,7 @@
 # XEN_ROOT
 # MINIOS_TARGET_ARCH
 
-XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/xenstore/include
+XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/libs/store/include
 TOOLCORE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
 TOOLLOG_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
 EVTCHN_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
diff --git a/tools/Makefile b/tools/Makefile
index f9b4012290..4a3646871c 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -43,7 +43,7 @@ SUBDIRS-y += pygrub
 SUBDIRS-$(OCAML_TOOLS) += ocaml
 
 ifeq ($(CONFIG_RUMP),y)
-SUBDIRS-y := libs xenstore
+SUBDIRS-y := libs
 endif
 
 # For the sake of linking, set the sys-root
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 914c79bfb9..557fd1e757 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -18,7 +18,6 @@ include $(XEN_ROOT)/tools/libs/uselibs.mk
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
-XEN_libxenstore    = $(XEN_ROOT)/tools/xenstore
 XEN_libxenstat     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
 XEN_libxenvchan    = $(XEN_ROOT)/tools/libvchan
 
@@ -106,10 +105,6 @@ $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
 CFLAGS_libxenctrl += $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) -D__XEN_TOOLS__
 CFLAGS_libxenguest += $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory)
 
-CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenstore = $(SHLIB_libxentoolcore) $(SHLIB_libxenctrl)
-LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_libxenstore)/libxenstore$(libextension)
-SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_libxenstore)
 ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
 endif
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index f15c1688f7..62bd8f5292 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -12,6 +12,7 @@ SUBDIRS-y += devicemodel
 SUBDIRS-y += ctrl
 SUBDIRS-y += guest
 SUBDIRS-y += hypfs
+SUBDIRS-y += store
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
new file mode 100644
index 0000000000..4da502646e
--- /dev/null
+++ b/tools/libs/store/Makefile
@@ -0,0 +1,64 @@
+XEN_ROOT=$(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+MAJOR = 3.0
+MINOR = 3
+
+ifeq ($(CONFIG_Linux),y)
+APPEND_LDFLAGS += -ldl
+endif
+
+SRCS-y   += xs_lib.c
+SRCS-y   += xs.c
+
+LIBHEADER = xenstore.h xenstore_lib.h
+
+include ../libs.mk
+
+# Include configure output (config.h)
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+CFLAGS += $(CFLAGS_libxentoolcore)
+CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
+CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
+
+LINK_FILES = xs_lib.c include/xenstore_lib.h list.h utils.h
+
+$(LIB_OBJS): $(LINK_FILES)
+
+$(LINK_FILES):
+	ln -sf $(XEN_ROOT)/tools/xenstore/$(notdir $@) $@
+
+xs.opic: CFLAGS += -DUSE_PTHREAD
+ifeq ($(CONFIG_Linux),y)
+xs.opic: CFLAGS += -DUSE_DLSYM
+else
+PKG_CONFIG_REMOVE += -ldl
+endif
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstore)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
+
+.PHONY: install
+install: install-headers
+
+.PHONY: install-headers
+install-headers:
+	$(INSTALL_DIR) $(DESTDIR)$(includedir)
+	$(INSTALL_DIR) $(DESTDIR)$(includedir)/xenstore-compat
+	$(INSTALL_DATA) include/compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
+	$(INSTALL_DATA) include/compat/xs_lib.h $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
+	ln -sf xenstore-compat/xs.h  $(DESTDIR)$(includedir)/xs.h
+	ln -sf xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xs_lib.h
+
+.PHONY: uninstall
+uninstall: uninstall-headers
+
+.PHONY: uninstall-headers
+uninstall-headers:
+	rm -f $(DESTDIR)$(includedir)/xs_lib.h
+	rm -f $(DESTDIR)$(includedir)/xs.h
+	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
+	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs.h
+	if [ -d $(DESTDIR)$(includedir)/xenstore-compat ]; then \
+		rmdir --ignore-fail-on-non-empty $(DESTDIR)$(includedir)/xenstore-compat; \
+	fi
diff --git a/tools/xenstore/include/compat/xs.h b/tools/libs/store/include/compat/xs.h
similarity index 100%
rename from tools/xenstore/include/compat/xs.h
rename to tools/libs/store/include/compat/xs.h
diff --git a/tools/xenstore/include/compat/xs_lib.h b/tools/libs/store/include/compat/xs_lib.h
similarity index 100%
rename from tools/xenstore/include/compat/xs_lib.h
rename to tools/libs/store/include/compat/xs_lib.h
diff --git a/tools/xenstore/include/xenstore.h b/tools/libs/store/include/xenstore.h
similarity index 100%
rename from tools/xenstore/include/xenstore.h
rename to tools/libs/store/include/xenstore.h
diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
new file mode 100644
index 0000000000..9854305a2c
--- /dev/null
+++ b/tools/libs/store/libxenstore.map
@@ -0,0 +1,49 @@
+VERS_3.0.3 {
+	global:
+		xs_open;
+		xs_close;
+		xs_daemon_open;
+		xs_domain_open;
+		xs_daemon_open_readonly;
+		xs_daemon_close;
+		xs_daemon_destroy_postfork;
+		xs_directory;
+		xs_read;
+		xs_write;
+		xs_mkdir;
+		xs_rm;
+		xs_restrict;
+		xs_get_permissions;
+		xs_set_permissions;
+		xs_watch;
+		xs_fileno;
+		xs_check_watch;
+		xs_read_watch;
+		xs_unwatch;
+		xs_transaction_start;
+		xs_transaction_end;
+		xs_introduce_domain;
+		xs_set_target;
+		xs_resume_domain;
+		xs_release_domain;
+		xs_get_domain_path;
+		xs_path_is_subpath;
+		xs_is_domain_introduced;
+		xs_control_command;
+		xs_debug_command;
+		xs_suspend_evtchn_port;
+		xs_daemon_rootdir;
+		xs_daemon_rundir;
+		xs_daemon_socket;
+		xs_daemon_socket_ro;
+		xs_domain_dev;
+		xs_daemon_tdb;
+		xs_write_all;
+		xs_strings_to_perms;
+		xs_perm_to_string;
+		xs_count_strings;
+		expanding_buffer_ensure;
+		sanitise_value;
+		unsanitise_value;
+	local: *; /* Do not expose anything by default */
+};
diff --git a/tools/xenstore/xs.c b/tools/libs/store/xs.c
similarity index 100%
rename from tools/xenstore/xs.c
rename to tools/libs/store/xs.c
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index 9619c576ba..a0fe0402ff 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -20,3 +20,5 @@ LIBS_LIBS += ctrl
 USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
 LIBS_LIBS += guest
 USELIBS_guest := evtchn ctrl
+LIBS_LIBS += store
+USELIBS_store := toolcore
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 24b284af39..8254464aff 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -11,7 +11,7 @@ PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"
 PATH_LIBXENEVTCHN = XEN_ROOT + "/tools/libs/evtchn"
 PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
 PATH_LIBXL    = XEN_ROOT + "/tools/libxl"
-PATH_XENSTORE = XEN_ROOT + "/tools/xenstore"
+PATH_XENSTORE = XEN_ROOT + "/tools/libs/store"
 
 xc = Extension("xc",
                extra_compile_args = extra_compile_args,
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 574be8d15c..9a0f0d012d 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -34,17 +34,7 @@ XENSTORED_OBJS_$(CONFIG_MiniOS) = xenstored_minios.o
 XENSTORED_OBJS += $(XENSTORED_OBJS_y)
 LDLIBS_xenstored += -lrt
 
-ifneq ($(XENSTORE_STATIC_CLIENTS),y)
-LIBXENSTORE := libxenstore.so
-else
-LIBXENSTORE := libxenstore.a
-xenstore xenstore-control: CFLAGS += -static
-endif
-
-ALL_TARGETS = libxenstore.a clients
-ifneq ($(nosharedlibs),y)
-ALL_TARGETS += libxenstore.so
-endif
+ALL_TARGETS = clients
 ifeq ($(XENSTORE_XENSTORED),y)
 ALL_TARGETS += xs_tdb_dump xenstored
 endif
@@ -87,64 +77,21 @@ xenstored.a: $(XENSTORED_OBJS)
 $(CLIENTS): xenstore
 	ln -f xenstore $@
 
-xenstore: xenstore_client.o $(LIBXENSTORE)
+xenstore: xenstore_client.o
 	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
-xenstore-control: xenstore_control.o $(LIBXENSTORE)
+xenstore-control: xenstore_control.o
 	$(CC) $< $(LDFLAGS) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) -o $@ $(APPEND_LDFLAGS)
 
 xs_tdb_dump: xs_tdb_dump.o utils.o tdb.o talloc.o
 	$(CC) $^ $(LDFLAGS) -o $@ $(APPEND_LDFLAGS)
 
-libxenstore.so: libxenstore.so.$(MAJOR)
-	ln -sf $< $@
-libxenstore.so.$(MAJOR): libxenstore.so.$(MAJOR).$(MINOR)
-	ln -sf $< $@
-
-xs.opic: CFLAGS += -DUSE_PTHREAD
-ifeq ($(CONFIG_Linux),y)
-xs.opic: CFLAGS += -DUSE_DLSYM
-libxenstore.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += -ldl
-PKG_CONFIG_LIBSPRIV := -ldl
-endif
-
-libxenstore.so.$(MAJOR).$(MINOR): xs.opic xs_lib.opic
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenstore.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS_libxentoolcore) $(SOCKET_LIBS) $(PTHREAD_LIBS) $(APPEND_LDFLAGS)
-
-libxenstore.a: xs.o xs_lib.o
-	$(AR) rcs $@ $^
-
-PKG_CONFIG := xenstore.pc
-PKG_CONFIG_NAME := Xenstore
-PKG_CONFIG_DESC := The Xenstore library for Xen hypervisor
-PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
-PKG_CONFIG_USELIBS := $(SHLIB_libxenstore)
-PKG_CONFIG_LIB := xenstore
-PKG_CONFIG_REQPRIV := xenevtchn,xencontrol,xengnttab,xentoolcore
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
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstore)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
-$(LIBXENSTORE): $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-
 .PHONY: clean
 clean:
-	rm -f *.a *.o *.opic *.so* xenstored_probes.h
+	rm -f *.a *.o xenstored_probes.h
 	rm -f xenstored xs_random xs_stress xs_crashme
 	rm -f xs_tdb_dump xenstore-control init-xenstore-domain
 	rm -f xenstore $(CLIENTS)
-	rm -f xenstore.pc
 	$(RM) $(DEPS_RM)
 
 .PHONY: distclean
@@ -161,8 +108,6 @@ tarball: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
-	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_DIR) $(DESTDIR)$(includedir)/xenstore-compat
 ifeq ($(XENSTORE_XENSTORED),y)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
 	$(INSTALL_DIR) $(DESTDIR)$(XEN_LIB_STORED)
@@ -173,32 +118,9 @@ endif
 	set -e ; for c in $(CLIENTS) ; do \
 		ln -f $(DESTDIR)$(bindir)/xenstore $(DESTDIR)$(bindir)/$${c} ; \
 	done
-	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-	$(INSTALL_SHLIB) libxenstore.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	ln -sf libxenstore.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenstore.so.$(MAJOR)
-	ln -sf libxenstore.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenstore.so
-	$(INSTALL_DATA) libxenstore.a $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) include/xenstore.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) include/xenstore_lib.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) include/compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
-	$(INSTALL_DATA) include/compat/xs_lib.h $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
-	ln -sf xenstore-compat/xs.h  $(DESTDIR)$(includedir)/xs.h
-	ln -sf xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xs_lib.h
-	$(INSTALL_DATA) xenstore.pc $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xenstore.pc
-	rm -f $(DESTDIR)$(includedir)/xs_lib.h
-	rm -f $(DESTDIR)$(includedir)/xs.h
-	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
-	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs.h
-	rm -f $(DESTDIR)$(includedir)/xenstore_lib.h
-	rm -f $(DESTDIR)$(includedir)/xenstore.h
-	rm -f $(DESTDIR)$(libdir)/libxenstore.a
-	rm -f $(DESTDIR)$(libdir)/libxenstore.so
-	rm -f $(DESTDIR)$(libdir)/libxenstore.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenstore.so.$(MAJOR).$(MINOR)
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(CLIENTS))
 	rm -f $(DESTDIR)$(bindir)/xenstore
 	rm -f $(DESTDIR)$(bindir)/xenstore-control
diff --git a/tools/xenstore/include/xenstore_lib.h b/tools/xenstore/xenstore_lib.h
similarity index 100%
rename from tools/xenstore/include/xenstore_lib.h
rename to tools/xenstore/xenstore_lib.h
-- 
2.26.2


