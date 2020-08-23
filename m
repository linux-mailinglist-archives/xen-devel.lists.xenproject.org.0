Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817324EC93
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9ma4-00086V-5d; Sun, 23 Aug 2020 09:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQl-0004t9-UL
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:51 +0000
X-Inumbo-ID: ee3fe154-c5ad-4f93-b546-ba5c236694b9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee3fe154-c5ad-4f93-b546-ba5c236694b9;
 Sun, 23 Aug 2020 09:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A50DAC7F;
 Sun, 23 Aug 2020 09:35:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 38/38] tools: move libxlutil to tools/libs/util
Date: Sun, 23 Aug 2020 11:35:19 +0200
Message-Id: <20200823093519.18386-39-jgross@suse.com>
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

Move the libxlutil source to tools/libs/util and delete tools/libxl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |   6 +-
 tools/Makefile                                |   1 -
 tools/Rules.mk                                |   7 --
 tools/libs/Makefile                           |   1 +
 tools/libs/uselibs.mk                         |   3 +
 tools/{libxl => libs/util}/CODING_STYLE       |   0
 tools/libs/util/Makefile                      |  61 ++++++++++
 .../{libxl => libs/util/include}/libxlutil.h  |   0
 tools/{libxl => libs/util}/libxlu_cfg.c       |   0
 tools/{libxl => libs/util}/libxlu_cfg_i.h     |   0
 tools/{libxl => libs/util}/libxlu_cfg_l.c     |   0
 tools/{libxl => libs/util}/libxlu_cfg_l.h     |   0
 tools/{libxl => libs/util}/libxlu_cfg_l.l     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.c     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.h     |   0
 tools/{libxl => libs/util}/libxlu_cfg_y.y     |   0
 tools/{libxl => libs/util}/libxlu_disk.c      |   0
 tools/{libxl => libs/util}/libxlu_disk_i.h    |   0
 tools/{libxl => libs/util}/libxlu_disk_l.c    |   0
 tools/{libxl => libs/util}/libxlu_disk_l.h    |   0
 tools/{libxl => libs/util}/libxlu_disk_l.l    |   0
 tools/{libxl => libs/util}/libxlu_internal.h  |   0
 tools/{libxl => libs/util}/libxlu_pci.c       |   0
 tools/{libxl => libs/util}/libxlu_vif.c       |   0
 tools/{libxl => libs/util}/xlutil.pc.in       |   0
 tools/libxl/Makefile                          | 114 ------------------
 26 files changed, 69 insertions(+), 124 deletions(-)
 rename tools/{libxl => libs/util}/CODING_STYLE (100%)
 create mode 100644 tools/libs/util/Makefile
 rename tools/{libxl => libs/util/include}/libxlutil.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg.c (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_i.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.c (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_l.l (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.c (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.h (100%)
 rename tools/{libxl => libs/util}/libxlu_cfg_y.y (100%)
 rename tools/{libxl => libs/util}/libxlu_disk.c (100%)
 rename tools/{libxl => libs/util}/libxlu_disk_i.h (100%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.c (100%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.h (100%)
 rename tools/{libxl => libs/util}/libxlu_disk_l.l (100%)
 rename tools/{libxl => libs/util}/libxlu_internal.h (100%)
 rename tools/{libxl => libs/util}/libxlu_pci.c (100%)
 rename tools/{libxl => libs/util}/libxlu_vif.c (100%)
 rename tools/{libxl => libs/util}/xlutil.pc.in (100%)
 delete mode 100644 tools/libxl/Makefile

diff --git a/.gitignore b/.gitignore
index 94af7a4aee..6dbbd691cb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -154,6 +154,10 @@ tools/libs/store/utils.h
 tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
 tools/libs/store/include/xenstore_lib.h
+tools/libs/util/*.pc
+tools/libs/util/_paths.h
+tools/libs/util/libxlu_cfg_y.output
+tools/libs/util/libxlutil.map
 tools/libs/vchan/headers.chk
 tools/libs/vchan/libxenvchan.map
 tools/libs/vchan/xenvchan.pc
@@ -232,8 +236,6 @@ tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/libxl/*.pc
-tools/libxl/libxlu_cfg_y.output
 tools/misc/cpuperf/cpuperf-perfcntr
 tools/misc/cpuperf/cpuperf-xen
 tools/misc/xc_shadow
diff --git a/tools/Makefile b/tools/Makefile
index ea69675cca..9c77ee6763 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -29,7 +29,6 @@ SUBDIRS-$(CONFIG_QEMU_XEN) += qemu-xen-dir
 endif
 
 SUBDIRS-y += xenpmd
-SUBDIRS-y += libxl
 SUBDIRS-$(CONFIG_GOLANG) += golang
 SUBDIRS-y += xl
 SUBDIRS-y += helpers
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5537056d00..7f0b2c2f24 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -15,8 +15,6 @@ XEN_INCLUDE        = $(XEN_ROOT)/tools/include
 
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
-XEN_libxlutil      = $(XEN_ROOT)/tools/libxl
-
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
 XENSTORE_XENSTORED ?= y
@@ -118,11 +116,6 @@ else
 CFLAGS += -O2 -fomit-frame-pointer
 endif
 
-CFLAGS_libxlutil = -I$(XEN_libxlutil)
-SHDEPS_libxlutil = $(SHLIB_libxenlight)
-LDLIBS_libxlutil = $(SHDEPS_libxlutil) $(XEN_libxlutil)/libxlutil$(libextension)
-SHLIB_libxlutil  = $(SHDEPS_libxlutil) -Wl,-rpath-link=$(XEN_libxlutil)
-
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
 
 # Get gcc to generate the dependencies for us.
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index c41455c604..1afcd12e2b 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -16,6 +16,7 @@ SUBDIRS-y += store
 SUBDIRS-y += stat
 SUBDIRS-$(CONFIG_Linux) += vchan
 SUBDIRS-y += light
+SUBDIRS-y += util
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index 685f368aed..74913717a6 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -28,3 +28,6 @@ LIBS_LIBS += stat
 USELIBS_stat := ctrl store
 LIBS_LIBS += light
 USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
+LIBS_LIBS += util
+USELIBS_util := light
+LIB_PREFIX_util := xl
diff --git a/tools/libxl/CODING_STYLE b/tools/libs/util/CODING_STYLE
similarity index 100%
rename from tools/libxl/CODING_STYLE
rename to tools/libs/util/CODING_STYLE
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
new file mode 100644
index 0000000000..96508a49e2
--- /dev/null
+++ b/tools/libs/util/Makefile
@@ -0,0 +1,61 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+SRCS-y += libxlu_cfg_y.c
+SRCS-y += libxlu_cfg_l.c
+SRCS-y += libxlu_cfg.c
+SRCS-y += libxlu_disk_l.c
+SRCS-y += libxlu_disk.c
+SRCS-y += libxlu_vif.c
+SRCS-y += libxlu_pci.c
+
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -I. $(CFLAGS_libxenctrl)
+
+CFLAGS += $(PTHREAD_CFLAGS)
+LDFLAGS += $(PTHREAD_LDFLAGS)
+
+ifeq ($(FLEX),)
+%.c %.h:: %.l
+	$(warning Flex is needed to rebuild some libxl parsers and \
+		  scanners, please install it and rerun configure)
+endif
+
+ifeq ($(BISON),)
+%.c %.h:: %.y
+	$(warning Bison is needed to rebuild some libxl parsers and \
+		  scanners, please install it an rerun configure)
+endif
+
+AUTOINCS = libxlu_cfg_y.h libxlu_cfg_l.h libxlu_disk_l.h
+AUTOSRCS = libxlu_cfg_y.c libxlu_cfg_l.c
+
+LIBHEADER := libxlutil.h
+
+NO_HEADERS_CHK := y
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxlutil)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
+
+$(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS) _paths.h
+
+%.c %.h:: %.y
+	@rm -f $*.[ch]
+	$(BISON) --output=$*.c $<
+
+%.c %.h:: %.l
+	@rm -f $*.[ch]
+	$(FLEX) --header-file=$*.h --outfile=$*.c $<
+
+genpath-target = $(call buildmakevars2header,_paths.h)
+$(eval $(genpath-target))
+
+clean: cleanlocal
+
+.PHONY: cleanlocal
+cleanlocal:
+	$(RM) -f _*.h
+	$(RM) -f libxlutil.map
diff --git a/tools/libxl/libxlutil.h b/tools/libs/util/include/libxlutil.h
similarity index 100%
rename from tools/libxl/libxlutil.h
rename to tools/libs/util/include/libxlutil.h
diff --git a/tools/libxl/libxlu_cfg.c b/tools/libs/util/libxlu_cfg.c
similarity index 100%
rename from tools/libxl/libxlu_cfg.c
rename to tools/libs/util/libxlu_cfg.c
diff --git a/tools/libxl/libxlu_cfg_i.h b/tools/libs/util/libxlu_cfg_i.h
similarity index 100%
rename from tools/libxl/libxlu_cfg_i.h
rename to tools/libs/util/libxlu_cfg_i.h
diff --git a/tools/libxl/libxlu_cfg_l.c b/tools/libs/util/libxlu_cfg_l.c
similarity index 100%
rename from tools/libxl/libxlu_cfg_l.c
rename to tools/libs/util/libxlu_cfg_l.c
diff --git a/tools/libxl/libxlu_cfg_l.h b/tools/libs/util/libxlu_cfg_l.h
similarity index 100%
rename from tools/libxl/libxlu_cfg_l.h
rename to tools/libs/util/libxlu_cfg_l.h
diff --git a/tools/libxl/libxlu_cfg_l.l b/tools/libs/util/libxlu_cfg_l.l
similarity index 100%
rename from tools/libxl/libxlu_cfg_l.l
rename to tools/libs/util/libxlu_cfg_l.l
diff --git a/tools/libxl/libxlu_cfg_y.c b/tools/libs/util/libxlu_cfg_y.c
similarity index 100%
rename from tools/libxl/libxlu_cfg_y.c
rename to tools/libs/util/libxlu_cfg_y.c
diff --git a/tools/libxl/libxlu_cfg_y.h b/tools/libs/util/libxlu_cfg_y.h
similarity index 100%
rename from tools/libxl/libxlu_cfg_y.h
rename to tools/libs/util/libxlu_cfg_y.h
diff --git a/tools/libxl/libxlu_cfg_y.y b/tools/libs/util/libxlu_cfg_y.y
similarity index 100%
rename from tools/libxl/libxlu_cfg_y.y
rename to tools/libs/util/libxlu_cfg_y.y
diff --git a/tools/libxl/libxlu_disk.c b/tools/libs/util/libxlu_disk.c
similarity index 100%
rename from tools/libxl/libxlu_disk.c
rename to tools/libs/util/libxlu_disk.c
diff --git a/tools/libxl/libxlu_disk_i.h b/tools/libs/util/libxlu_disk_i.h
similarity index 100%
rename from tools/libxl/libxlu_disk_i.h
rename to tools/libs/util/libxlu_disk_i.h
diff --git a/tools/libxl/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
similarity index 100%
rename from tools/libxl/libxlu_disk_l.c
rename to tools/libs/util/libxlu_disk_l.c
diff --git a/tools/libxl/libxlu_disk_l.h b/tools/libs/util/libxlu_disk_l.h
similarity index 100%
rename from tools/libxl/libxlu_disk_l.h
rename to tools/libs/util/libxlu_disk_l.h
diff --git a/tools/libxl/libxlu_disk_l.l b/tools/libs/util/libxlu_disk_l.l
similarity index 100%
rename from tools/libxl/libxlu_disk_l.l
rename to tools/libs/util/libxlu_disk_l.l
diff --git a/tools/libxl/libxlu_internal.h b/tools/libs/util/libxlu_internal.h
similarity index 100%
rename from tools/libxl/libxlu_internal.h
rename to tools/libs/util/libxlu_internal.h
diff --git a/tools/libxl/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
similarity index 100%
rename from tools/libxl/libxlu_pci.c
rename to tools/libs/util/libxlu_pci.c
diff --git a/tools/libxl/libxlu_vif.c b/tools/libs/util/libxlu_vif.c
similarity index 100%
rename from tools/libxl/libxlu_vif.c
rename to tools/libs/util/libxlu_vif.c
diff --git a/tools/libxl/xlutil.pc.in b/tools/libs/util/xlutil.pc.in
similarity index 100%
rename from tools/libxl/xlutil.pc.in
rename to tools/libs/util/xlutil.pc.in
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
deleted file mode 100644
index 8d930dc047..0000000000
--- a/tools/libxl/Makefile
+++ /dev/null
@@ -1,114 +0,0 @@
-#
-# tools/libxl/Makefile
-#
-
-XEN_ROOT = $(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-XLUMAJOR = 4.15
-XLUMINOR = 0
-
-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
-	-Wno-declaration-after-statement -Wformat-nonliteral
-CFLAGS += -I. -fPIC
-
-CFLAGS += $(PTHREAD_CFLAGS)
-LDFLAGS += $(PTHREAD_LDFLAGS)
-
-LIBXLU_LIBS = $(LDLIBS_libxenlight)
-
-ifeq ($(FLEX),)
-%.c %.h:: %.l
-	$(warning Flex is needed to rebuild some libxl parsers and \
-		  scanners, please install it and rerun configure)
-endif
-
-ifeq ($(BISON),)
-%.c %.h:: %.y
-	$(warning Bison is needed to rebuild some libxl parsers and \
-		  scanners, please install it an rerun configure)
-endif
-
-AUTOINCS= libxlu_cfg_y.h libxlu_cfg_l.h libxlu_disk_l.h
-AUTOSRCS= libxlu_cfg_y.c libxlu_cfg_l.c
-LIBXLU_OBJS = libxlu_cfg_y.o libxlu_cfg_l.o libxlu_cfg.o \
-	libxlu_disk_l.o libxlu_disk.o libxlu_vif.o libxlu_pci.o
-$(LIBXLU_OBJS): CFLAGS += $(CFLAGS_libxenctrl) # For xentoollog.h
-
-PKG_CONFIG = xlutil.pc
-
-ifneq ($(CONFIG_LIBXC_MINIOS),y)
-PKG_CONFIG_INST := $(PKG_CONFIG)
-xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
-$(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
-$(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
-$(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
-endif
-
-PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
-
-$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
-.PHONY: all
-all: libxlutil.so libxlutil.a $(AUTOSRCS) $(AUTOINCS) $(PKG_CONFIG) $(PKG_CONFIG_LOCAL)
-
-$(LIBXLU_OBJS): $(AUTOINCS)
-
-%.c %.h:: %.y
-	@rm -f $*.[ch]
-	$(BISON) --output=$*.c $<
-
-%.c %.h:: %.l
-	@rm -f $*.[ch]
-	$(FLEX) --header-file=$*.h --outfile=$*.c $<
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-libxlutil.so: libxlutil.so.$(XLUMAJOR)
-	$(SYMLINK_SHLIB) $< $@
-
-libxlutil.so.$(XLUMAJOR): libxlutil.so.$(XLUMAJOR).$(XLUMINOR)
-	$(SYMLINK_SHLIB) $< $@
-
-libxlutil.so.$(XLUMAJOR).$(XLUMINOR): $(LIBXLU_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxlutil.so.$(XLUMAJOR) $(SHLIB_LDFLAGS) -o $@ $(LIBXLU_OBJS) $(LIBXLU_LIBS) $(APPEND_LDFLAGS)
-
-libxlutil.a: $(LIBXLU_OBJS)
-	$(AR) rcs libxlutil.a $^
-
-.PHONY: install
-install: all
-	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_SHLIB) libxlutil.so.$(XLUMAJOR).$(XLUMINOR) $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxlutil.so.$(XLUMAJOR).$(XLUMINOR) $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR)
-	$(SYMLINK_SHLIB) libxlutil.so.$(XLUMAJOR) $(DESTDIR)$(libdir)/libxlutil.so
-	$(INSTALL_DATA) libxlutil.a $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxlutil.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) xlutil.pc $(DESTDIR)$(PKG_INSTALLDIR)
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xlutil.pc
-	rm -f $(DESTDIR)$(includedir)/libxlutil.h
-	rm -f $(DESTDIR)$(libdir)/libxlutil.a
-	rm -f $(DESTDIR)$(libdir)/libxlutil.so
-	rm -f $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR).$(XLUMINOR)
-
-.PHONY: clean
-clean:
-	$(RM) -f _*.h *.o *.so* *.a $(DEPS_RM)
-	$(RM) -f xlutil.pc
-
-distclean: clean
-
-realclean: distclean
-	$(RM) -f $(AUTOSRCS) $(AUTOINCS)
-
--include $(DEPS_INCLUDE)
-- 
2.26.2


