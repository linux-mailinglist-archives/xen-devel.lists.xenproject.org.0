Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67BB24EC92
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maF-0008Br-Qb; Sun, 23 Aug 2020 09:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQb-0004t9-Tw
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:41 +0000
X-Inumbo-ID: 40544d03-8f5f-4fb8-a53a-b5e25912074c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40544d03-8f5f-4fb8-a53a-b5e25912074c;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BA0CADD6;
 Sun, 23 Aug 2020 09:35:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 30/38] tools: split libxenstat into new tools/libs/stat
 directory
Date: Sun, 23 Aug 2020 11:35:11 +0200
Message-Id: <20200823093519.18386-31-jgross@suse.com>
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

There is no reason why libxenstat is not placed in the tools/libs
directory.

At the same time move xenstat.h to a dedicated include directory
in tools/libs/stat in order to follow the same pattern as the other
libraries in tools/libs.

As now xentop is the only left directory in xenstat move it directly
under tools and get rid of tools/xenstat.

Fix some missing prototype errors (add one prototype and make two
functions static).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |   8 +-
 tools/Makefile                                |   2 +-
 tools/Rules.mk                                |   6 --
 tools/libs/Makefile                           |   1 +
 .../{xenstat/libxenstat => libs/stat}/COPYING |   0
 .../libxenstat => libs/stat}/Makefile         | 100 ++++--------------
 .../stat}/bindings/swig/perl/.empty           |   0
 .../stat}/bindings/swig/python/.empty         |   0
 .../stat}/bindings/swig/xenstat.i             |   0
 .../src => libs/stat/include}/xenstat.h       |   3 +
 .../libxenstat/src => libs/stat}/xenstat.c    |   0
 .../libxenstat => libs/stat}/xenstat.pc.in    |   2 +-
 .../src => libs/stat}/xenstat_freebsd.c       |   0
 .../src => libs/stat}/xenstat_linux.c         |   4 +-
 .../src => libs/stat}/xenstat_netbsd.c        |   0
 .../src => libs/stat}/xenstat_priv.h          |   0
 .../src => libs/stat}/xenstat_qmp.c           |   0
 .../src => libs/stat}/xenstat_solaris.c       |   0
 tools/libs/uselibs.mk                         |   2 +
 tools/xenstat/Makefile                        |  10 --
 tools/{xenstat => }/xentop/Makefile           |   2 +-
 tools/{xenstat => }/xentop/TODO               |   0
 tools/{xenstat => }/xentop/xentop.c           |   0
 23 files changed, 37 insertions(+), 103 deletions(-)
 rename tools/{xenstat/libxenstat => libs/stat}/COPYING (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/Makefile (55%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/perl/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/python/.empty (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/bindings/swig/xenstat.i (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat/include}/xenstat.h (98%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat.c (100%)
 rename tools/{xenstat/libxenstat => libs/stat}/xenstat.pc.in (82%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_freebsd.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_linux.c (98%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_netbsd.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_priv.h (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_qmp.c (100%)
 rename tools/{xenstat/libxenstat/src => libs/stat}/xenstat_solaris.c (100%)
 delete mode 100644 tools/xenstat/Makefile
 rename tools/{xenstat => }/xentop/Makefile (97%)
 rename tools/{xenstat => }/xentop/TODO (100%)
 rename tools/{xenstat => }/xentop/xentop.c (100%)

diff --git a/.gitignore b/.gitignore
index b7171ff2eb..44abbc7e43 100644
--- a/.gitignore
+++ b/.gitignore
@@ -128,6 +128,10 @@ tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
 tools/libs/guest/xc_core_x86.h
 tools/libs/guest/xc_private.h
+tools/libs/stat/_paths.h
+tools/libs/stat/headers.chk
+tools/libs/stat/libxenstat.map
+tools/libs/stat/xenstat.pc
 tools/libs/store/headers.chk
 tools/libs/store/list.h
 tools/libs/store/utils.h
@@ -276,9 +280,6 @@ tools/xenmon/xentrace_setmask
 tools/xenmon/xenbaked
 tools/xenpaging/xenpaging
 tools/xenpmd/xenpmd
-tools/xenstat/libxenstat/src/_paths.h
-tools/xenstat/libxenstat/xenstat.pc
-tools/xenstat/xentop/xentop
 tools/xenstore/xenstore
 tools/xenstore/xenstore-chmod
 tools/xenstore/xenstore-exists
@@ -291,6 +292,7 @@ tools/xenstore/xenstore-ls
 tools/xenstore/xenstored
 tools/xenstore/xenstored_test
 tools/xenstore/xs_tdb_dump
+tools/xentop/xentop
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
 tools/xentrace/xenctx
diff --git a/tools/Makefile b/tools/Makefile
index 0db01707a4..ea69675cca 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -17,7 +17,7 @@ SUBDIRS-$(CONFIG_XCUTILS) += xcutils
 SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
-SUBDIRS-y += xenstat
+SUBDIRS-y += xentop
 SUBDIRS-$(CONFIG_NetBSD) += xenbackendd
 SUBDIRS-y += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
diff --git a/tools/Rules.mk b/tools/Rules.mk
index c5f7cd26e0..241e8e7d9a 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -18,7 +18,6 @@ include $(XEN_ROOT)/tools/libs/uselibs.mk
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
-XEN_libxenstat     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -108,11 +107,6 @@ ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
 endif
 
-CFLAGS_libxenstat  = -I$(XEN_libxenstat)
-SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
-LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_libxenstat)/libxenstat$(libextension)
-SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_libxenstat)
-
 ifeq ($(debug),y)
 # Disable optimizations
 CFLAGS += -O0 -fno-omit-frame-pointer
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 756d059ee7..e8fcd59214 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -13,6 +13,7 @@ SUBDIRS-y += ctrl
 SUBDIRS-y += guest
 SUBDIRS-y += hypfs
 SUBDIRS-y += store
+SUBDIRS-y += stat
 SUBDIRS-$(CONFIG_Linux) += vchan
 
 ifeq ($(CONFIG_RUMP),y)
diff --git a/tools/xenstat/libxenstat/COPYING b/tools/libs/stat/COPYING
similarity index 100%
rename from tools/xenstat/libxenstat/COPYING
rename to tools/libs/stat/COPYING
diff --git a/tools/xenstat/libxenstat/Makefile b/tools/libs/stat/Makefile
similarity index 55%
rename from tools/xenstat/libxenstat/Makefile
rename to tools/libs/stat/Makefile
index b5e623b155..5463f5f7ca 100644
--- a/tools/xenstat/libxenstat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -15,80 +15,24 @@
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-LDCONFIG=ldconfig
-MAKE_LINK=ln -sf
-
-MAJOR=4.15
-MINOR=0
-
-LIB=src/libxenstat.a
-SHLIB=src/libxenstat.so.$(MAJOR).$(MINOR)
-SHLIB_LINKS=src/libxenstat.so.$(MAJOR) src/libxenstat.so
-OBJECTS-y=src/xenstat.o src/xenstat_qmp.o
-OBJECTS-$(CONFIG_Linux) += src/xenstat_linux.o
-OBJECTS-$(CONFIG_SunOS) += src/xenstat_solaris.o
-OBJECTS-$(CONFIG_NetBSD) += src/xenstat_netbsd.o
-OBJECTS-$(CONFIG_FreeBSD) += src/xenstat_freebsd.o
-SONAME_FLAGS=-Wl,$(SONAME_LDFLAG) -Wl,libxenstat.so.$(MAJOR)
-
-CFLAGS+=-fPIC -Werror
-CFLAGS+=-Isrc $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(CFLAGS_xeninclude) -include $(XEN_ROOT)/tools/config.h
-
-LDLIBS-y = $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) -lyajl
-LDLIBS-$(CONFIG_SunOS) += -lkstat
-
-PKG_CONFIG := xenstat.pc
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
+CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(CFLAGS_xeninclude) -include $(XEN_ROOT)/tools/config.h
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstat)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
+SRCS-y += xenstat.c
+SRCS-y += xenstat_qmp.c
+SRCS-$(CONFIG_Linux) += xenstat_linux.c
+SRCS-$(CONFIG_SunOS) += xenstat_solaris.c
+SRCS-$(CONFIG_NetBSD) += xenstat_netbsd.c
+SRCS-$(CONFIG_FreeBSD) += xenstat_freebsd.c
 
-.PHONY: all
-all: $(LIB) $(SHLIB) $(SHLIB_LINKS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-
-$(OBJECTS-y): src/_paths.h
-
-$(LIB): $(OBJECTS-y)
-	$(AR) rc $@ $^
-	$(RANLIB) $@
-
-$(SHLIB): $(OBJECTS-y)
-	$(CC) $(LDFLAGS) $(SONAME_FLAGS) $(SHLIB_LDFLAGS) -o $@ \
-	    $(OBJECTS-y) $(LDLIBS-y) $(APPEND_LDFLAGS)
+LDLIBS-y += -lyajl
+LDLIBS-$(CONFIG_SunOS) += -lkstat
+APPEND_LDFLAGS += $(LDLIBS-y)
 
-src/libxenstat.so.$(MAJOR): $(SHLIB)
-	$(MAKE_LINK) $(<F) $@
+include $(XEN_ROOT)/tools/libs/libs.mk
 
-src/libxenstat.so: src/libxenstat.so.$(MAJOR)
-	$(MAKE_LINK) $(<F) $@
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstat)/include
 
-.PHONY: install
-install: all
-	$(INSTALL_DATA) src/xenstat.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) $(LIB) $(DESTDIR)$(libdir)/libxenstat.a
-	$(INSTALL_PROG) src/libxenstat.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	ln -sf libxenstat.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenstat.so.$(MAJOR)
-	ln -sf libxenstat.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenstat.so
-	$(INSTALL_DATA) xenstat.pc $(DESTDIR)$(PKG_INSTALLDIR)
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xenstat.pc
-	rm -f $(DESTDIR)$(libdir)/libxenstat.so
-	rm -f $(DESTDIR)$(libdir)/libxenstat.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenstat.so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(libdir)/libxenstat.a
-	rm -f $(DESTDIR)$(includedir)/xenstat.h
+$(LIB_OBJS): _paths.h
 
 PYLIB=bindings/swig/python/_xenstat.so
 PYMOD=bindings/swig/python/xenstat.py
@@ -109,9 +53,9 @@ install-bindings: install-perl-bindings install-python-bindings
 .PHONY: uninstall-bindings
 uninstall-bindings: uninstall-perl-bindings uninstall-python-bindings
 
-$(BINDINGS): $(SHLIB) $(SHLIB_LINKS) src/xenstat.h
+$(BINDINGS): $(SHLIB) $(SHLIB_LINKS) include/xenstat.h
 
-SWIG_FLAGS=-module xenstat -Isrc
+SWIG_FLAGS=-module xenstat -Iinclude -I.
 
 # Python bindings
 PYTHON_VERSION=$(PYTHON:python%=%)
@@ -175,16 +119,14 @@ install: install-perl-bindings
 uninstall: uninstall-perl-bindings
 endif
 
-.PHONY: clean
-clean:
-	rm -f $(LIB) $(SHLIB) $(SHLIB_LINKS) $(OBJECTS-y) \
-	      $(BINDINGS) $(BINDINGSRC) $(DEPS_RM) src/_paths.h
-	rm -f xenstat.pc
+clean: cleanlocal
 
-.PHONY: distclean
-distclean: clean
+.PHONY: cleanlocal
+cleanlocal:
+	rm -f $(BINDINGS) $(BINDINGSRC) $(DEPS_RM) _paths.h
+	rm -f libxenstat.map
 
 -include $(DEPS_INCLUDE)
 
-genpath-target = $(call buildmakevars2header,src/_paths.h)
+genpath-target = $(call buildmakevars2header,_paths.h)
 $(eval $(genpath-target))
diff --git a/tools/xenstat/libxenstat/bindings/swig/perl/.empty b/tools/libs/stat/bindings/swig/perl/.empty
similarity index 100%
rename from tools/xenstat/libxenstat/bindings/swig/perl/.empty
rename to tools/libs/stat/bindings/swig/perl/.empty
diff --git a/tools/xenstat/libxenstat/bindings/swig/python/.empty b/tools/libs/stat/bindings/swig/python/.empty
similarity index 100%
rename from tools/xenstat/libxenstat/bindings/swig/python/.empty
rename to tools/libs/stat/bindings/swig/python/.empty
diff --git a/tools/xenstat/libxenstat/bindings/swig/xenstat.i b/tools/libs/stat/bindings/swig/xenstat.i
similarity index 100%
rename from tools/xenstat/libxenstat/bindings/swig/xenstat.i
rename to tools/libs/stat/bindings/swig/xenstat.i
diff --git a/tools/xenstat/libxenstat/src/xenstat.h b/tools/libs/stat/include/xenstat.h
similarity index 98%
rename from tools/xenstat/libxenstat/src/xenstat.h
rename to tools/libs/stat/include/xenstat.h
index 76a660f321..c3b98909dd 100644
--- a/tools/xenstat/libxenstat/src/xenstat.h
+++ b/tools/libs/stat/include/xenstat.h
@@ -71,6 +71,9 @@ unsigned long long xenstat_node_tot_mem(xenstat_node * node);
 /* Get amount of free memory on a node */
 unsigned long long xenstat_node_free_mem(xenstat_node * node);
 
+/* Get amount of freeable memory on a node */
+long xenstat_node_freeable_mb(xenstat_node * node);
+
 /* Find the number of domains existing on a node */
 unsigned int xenstat_node_num_domains(xenstat_node * node);
 
diff --git a/tools/xenstat/libxenstat/src/xenstat.c b/tools/libs/stat/xenstat.c
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat.c
rename to tools/libs/stat/xenstat.c
diff --git a/tools/xenstat/libxenstat/xenstat.pc.in b/tools/libs/stat/xenstat.pc.in
similarity index 82%
rename from tools/xenstat/libxenstat/xenstat.pc.in
rename to tools/libs/stat/xenstat.pc.in
index ad00577c89..6005593ba1 100644
--- a/tools/xenstat/libxenstat/xenstat.pc.in
+++ b/tools/libs/stat/xenstat.pc.in
@@ -7,4 +7,4 @@ Description: The Xenstat library for Xen hypervisor
 Version: @@version@@
 Cflags: -I${includedir}
 Libs: @@libsflag@@${libdir} -lxenstat
-Requires.private: xencontrol,xenstore
+Requires.private: xencontrol,xenstore,yajl
diff --git a/tools/xenstat/libxenstat/src/xenstat_freebsd.c b/tools/libs/stat/xenstat_freebsd.c
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat_freebsd.c
rename to tools/libs/stat/xenstat_freebsd.c
diff --git a/tools/xenstat/libxenstat/src/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
similarity index 98%
rename from tools/xenstat/libxenstat/src/xenstat_linux.c
rename to tools/libs/stat/xenstat_linux.c
index 7530349eee..793263f2b6 100644
--- a/tools/xenstat/libxenstat/src/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -64,7 +64,7 @@ static const char PROCNETDEV_HEADER[] =
 
 /* We need to get the name of the bridge interface for use with bonding interfaces */
 /* Use excludeName parameter to avoid adding bridges we don't care about, eg. virbr0 */
-void getBridge(char *excludeName, char *result, size_t resultLen)
+static void getBridge(char *excludeName, char *result, size_t resultLen)
 {
 	struct dirent *de;
 	DIR *d;
@@ -89,7 +89,7 @@ void getBridge(char *excludeName, char *result, size_t resultLen)
 
 /* parseNetLine provides regular expression based parsing for lines from /proc/net/dev, all the */
 /* information are parsed but not all are used in our case, ie. for xenstat */
-int parseNetDevLine(char *line, char *iface, unsigned long long *rxBytes, unsigned long long *rxPackets,
+static int parseNetDevLine(char *line, char *iface, unsigned long long *rxBytes, unsigned long long *rxPackets,
 		unsigned long long *rxErrs, unsigned long long *rxDrops, unsigned long long *rxFifo,
 		unsigned long long *rxFrames, unsigned long long *rxComp, unsigned long long *rxMcast,
 		unsigned long long *txBytes, unsigned long long *txPackets, unsigned long long *txErrs,
diff --git a/tools/xenstat/libxenstat/src/xenstat_netbsd.c b/tools/libs/stat/xenstat_netbsd.c
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat_netbsd.c
rename to tools/libs/stat/xenstat_netbsd.c
diff --git a/tools/xenstat/libxenstat/src/xenstat_priv.h b/tools/libs/stat/xenstat_priv.h
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat_priv.h
rename to tools/libs/stat/xenstat_priv.h
diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/libs/stat/xenstat_qmp.c
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat_qmp.c
rename to tools/libs/stat/xenstat_qmp.c
diff --git a/tools/xenstat/libxenstat/src/xenstat_solaris.c b/tools/libs/stat/xenstat_solaris.c
similarity index 100%
rename from tools/xenstat/libxenstat/src/xenstat_solaris.c
rename to tools/libs/stat/xenstat_solaris.c
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index edb4b34256..a9dc2ce994 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -24,3 +24,5 @@ LIBS_LIBS += store
 USELIBS_store := toolcore
 LIBS_LIBS += vchan
 USELIBS_vchan := toollog store gnttab evtchn
+LIBS_LIBS += stat
+USELIBS_stat := ctrl store
diff --git a/tools/xenstat/Makefile b/tools/xenstat/Makefile
deleted file mode 100644
index b300f31289..0000000000
--- a/tools/xenstat/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-XEN_ROOT = $(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-SUBDIRS :=
-SUBDIRS += libxenstat
-SUBDIRS += xentop
-
-.PHONY: all install clean distclean uninstall
-
-all install clean distclean uninstall: %: subdirs-%
diff --git a/tools/xenstat/xentop/Makefile b/tools/xentop/Makefile
similarity index 97%
rename from tools/xenstat/xentop/Makefile
rename to tools/xentop/Makefile
index ec612db2a2..0034114684 100644
--- a/tools/xenstat/xentop/Makefile
+++ b/tools/xentop/Makefile
@@ -10,7 +10,7 @@
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 
-XEN_ROOT=$(CURDIR)/../../..
+XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 ifneq ($(XENSTAT_XENTOP),y)
diff --git a/tools/xenstat/xentop/TODO b/tools/xentop/TODO
similarity index 100%
rename from tools/xenstat/xentop/TODO
rename to tools/xentop/TODO
diff --git a/tools/xenstat/xentop/xentop.c b/tools/xentop/xentop.c
similarity index 100%
rename from tools/xenstat/xentop/xentop.c
rename to tools/xentop/xentop.c
-- 
2.26.2


