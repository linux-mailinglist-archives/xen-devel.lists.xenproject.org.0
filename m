Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E40255D67
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfzR-00051D-A3; Fri, 28 Aug 2020 15:08:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzQ-0004eG-5o
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:28 +0000
X-Inumbo-ID: 30b6fb5a-bd2b-485b-87c0-4a241c316ecb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30b6fb5a-bd2b-485b-87c0-4a241c316ecb;
 Fri, 28 Aug 2020 15:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EE1CAF2A;
 Fri, 28 Aug 2020 15:08:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v4 19/31] tools/libxc: move libxenguest to tools/libs/guest
Date: Fri, 28 Aug 2020 17:07:35 +0200
Message-Id: <20200828150747.25305-20-jgross@suse.com>
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

tools/libxc now contains libxenguest only. Move it to tools/libs/guest.

When generating the pkg-config file for libxenguest a filter is now
required for replacing "xenctrl" by "xencontrol" in the
"Requires.private:" entry. Add this filter to tools/libs/libs.mk.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org> (stubdom parts)
---
 .gitignore                                    |  16 +-
 stubdom/Makefile                              |  34 +--
 stubdom/grub/Makefile                         |   2 +-
 stubdom/mini-os.mk                            |   2 +-
 tools/Makefile                                |   3 +-
 tools/Rules.mk                                |   7 +-
 tools/libs/Makefile                           |   1 +
 tools/{libxc => libs/guest}/COPYING           |   0
 tools/libs/guest/Makefile                     | 121 ++++++++++
 .../{libxc => libs/guest}/include/xenguest.h  |   0
 tools/{libxc => libs/guest}/xg_cpuid_x86.c    |   0
 tools/{libxc => libs/guest}/xg_dom_arm.c      |   0
 .../guest}/xg_dom_armzimageloader.c           |   0
 .../{libxc => libs/guest}/xg_dom_binloader.c  |   0
 tools/{libxc => libs/guest}/xg_dom_boot.c     |   0
 .../guest}/xg_dom_bzimageloader.c             |   0
 .../guest}/xg_dom_compat_linux.c              |   0
 tools/{libxc => libs/guest}/xg_dom_core.c     |   0
 .../{libxc => libs/guest}/xg_dom_decompress.h |   0
 .../guest}/xg_dom_decompress_lz4.c            |   0
 .../guest}/xg_dom_decompress_unsafe.c         |   0
 .../guest}/xg_dom_decompress_unsafe.h         |   0
 .../guest}/xg_dom_decompress_unsafe_bzip2.c   |   0
 .../guest}/xg_dom_decompress_unsafe_lzma.c    |   0
 .../guest}/xg_dom_decompress_unsafe_lzo1x.c   |   0
 .../guest}/xg_dom_decompress_unsafe_xz.c      |   0
 .../{libxc => libs/guest}/xg_dom_elfloader.c  |   0
 .../{libxc => libs/guest}/xg_dom_hvmloader.c  |   0
 tools/{libxc => libs/guest}/xg_dom_x86.c      |   0
 tools/{libxc => libs/guest}/xg_domain.c       |   0
 tools/{libxc => libs/guest}/xg_nomigrate.c    |   0
 tools/{libxc => libs/guest}/xg_offline_page.c |   0
 tools/{libxc => libs/guest}/xg_private.c      |   0
 tools/{libxc => libs/guest}/xg_private.h      |   0
 tools/{libxc => libs/guest}/xg_save_restore.h |   0
 tools/{libxc => libs/guest}/xg_sr_common.c    |   0
 tools/{libxc => libs/guest}/xg_sr_common.h    |   0
 .../{libxc => libs/guest}/xg_sr_common_x86.c  |   0
 .../{libxc => libs/guest}/xg_sr_common_x86.h  |   0
 .../guest}/xg_sr_common_x86_pv.c              |   0
 .../guest}/xg_sr_common_x86_pv.h              |   0
 tools/{libxc => libs/guest}/xg_sr_restore.c   |   0
 .../guest}/xg_sr_restore_x86_hvm.c            |   0
 .../guest}/xg_sr_restore_x86_pv.c             |   0
 tools/{libxc => libs/guest}/xg_sr_save.c      |   0
 .../guest}/xg_sr_save_x86_hvm.c               |   0
 .../{libxc => libs/guest}/xg_sr_save_x86_pv.c |   0
 .../guest}/xg_sr_stream_format.h              |   0
 tools/{libxc => libs/guest}/xg_suspend.c      |   0
 tools/libs/libs.mk                            |   2 +-
 tools/libs/uselibs.mk                         |   2 +
 tools/libxc/Makefile                          | 219 ------------------
 52 files changed, 148 insertions(+), 261 deletions(-)
 rename tools/{libxc => libs/guest}/COPYING (100%)
 create mode 100644 tools/libs/guest/Makefile
 rename tools/{libxc => libs/guest}/include/xenguest.h (100%)
 rename tools/{libxc => libs/guest}/xg_cpuid_x86.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_arm.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_armzimageloader.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_binloader.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_boot.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_bzimageloader.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_compat_linux.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_core.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress.h (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_lz4.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe.h (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe_bzip2.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe_lzma.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe_lzo1x.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_decompress_unsafe_xz.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_elfloader.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_hvmloader.c (100%)
 rename tools/{libxc => libs/guest}/xg_dom_x86.c (100%)
 rename tools/{libxc => libs/guest}/xg_domain.c (100%)
 rename tools/{libxc => libs/guest}/xg_nomigrate.c (100%)
 rename tools/{libxc => libs/guest}/xg_offline_page.c (100%)
 rename tools/{libxc => libs/guest}/xg_private.c (100%)
 rename tools/{libxc => libs/guest}/xg_private.h (100%)
 rename tools/{libxc => libs/guest}/xg_save_restore.h (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common.h (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common_x86.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common_x86.h (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common_x86_pv.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_common_x86_pv.h (100%)
 rename tools/{libxc => libs/guest}/xg_sr_restore.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_restore_x86_hvm.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_restore_x86_pv.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_save.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_save_x86_hvm.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_save_x86_pv.c (100%)
 rename tools/{libxc => libs/guest}/xg_sr_stream_format.h (100%)
 rename tools/{libxc => libs/guest}/xg_suspend.c (100%)
 delete mode 100644 tools/libxc/Makefile

diff --git a/.gitignore b/.gitignore
index d22b031ed2..eb637a98e9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -71,7 +71,6 @@ stubdom/include
 stubdom/ioemu
 stubdom/ioemu/
 stubdom/libs-*
-stubdom/libxc-*
 stubdom/libxencall-*
 stubdom/libxenevtchn-*
 stubdom/libxenforeignmemory-*
@@ -121,6 +120,14 @@ tools/libs/foreignmemory/headers.chk
 tools/libs/foreignmemory/xenforeignmemory.pc
 tools/libs/devicemodel/headers.chk
 tools/libs/devicemodel/xendevicemodel.pc
+tools/libs/guest/_*.[ch]
+tools/libs/guest/libxenguest.map
+tools/libs/guest/xenguest.pc
+tools/libs/guest/xc_bitops.h
+tools/libs/guest/xc_core.h
+tools/libs/guest/xc_core_arm.h
+tools/libs/guest/xc_core_x86.h
+tools/libs/guest/xc_private.h
 tools/console/xenconsole
 tools/console/xenconsoled
 tools/console/client/_paths.h
@@ -197,12 +204,6 @@ tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
 tools/libvchan/xenvchan.pc
-tools/libxc/*.pc
-tools/libxc/xc_bitops.h
-tools/libxc/xc_core.h
-tools/libxc/xc_core_arm.h
-tools/libxc/xc_core_x86.h
-tools/libxc/xc_private.h
 tools/libxl/_libxl.api-for-check
 tools/libxl/*.api-ok
 tools/libxl/*.pc
@@ -370,7 +371,6 @@ tools/include/xen-foreign/arm64.h
 tools/misc/xen-hptool
 tools/misc/xen-mfndump
 tools/libs/toolcore/include/_*.h
-tools/libxc/_*.[ch]
 tools/libxl/_*.[ch]
 tools/libxl/testidl
 tools/libxl/testidl.c
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 961a9f8704..de10281ca3 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -331,7 +331,9 @@ endif
 # libraries under tools/libs
 #######
 
-STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl
+STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest
+
+LIBDEP_guest := cross-zlib
 
 #######
 # common handling
@@ -362,13 +364,10 @@ endef
 
 $(foreach lib,$(STUB_LIBS),$(eval $(call BUILD_lib,$(lib))))
 
-libxc-$(XEN_TARGET_ARCH)/stamp: $(XEN_ROOT)/tools/libxc/Makefile
-	$(do_links)
-
 xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
 	$(do_links)
 
-LINK_DIRS := libxc-$(XEN_TARGET_ARCH) xenstore $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
+LINK_DIRS := xenstore $(foreach dir,$(STUB_LIBS),libs-$(XEN_TARGET_ARCH)/$(dir))
 LINK_STAMPS := $(foreach dir,$(LINK_DIRS),$(dir)/stamp)
 
 mk-headers-$(XEN_TARGET_ARCH): $(IOEMU_LINKFARM_TARGET) $(LINK_STAMPS)
@@ -391,16 +390,6 @@ $(TARGETS_MINIOS): mini-os-%:
                 mkdir -p $@/$$i ; \
 	done
 
-#######
-# libxc
-#######
-
-.PHONY: libxc
-libxc: libxc-$(XEN_TARGET_ARCH)/libxenguest.a
-libxc-$(XEN_TARGET_ARCH)/libxenguest.a: libxenevtchn libxenctrl cross-zlib
-libxc-$(XEN_TARGET_ARCH)/libxenguest.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libxc-$(XEN_TARGET_ARCH)
-
 #######
 # ioemu
 #######
@@ -409,7 +398,7 @@ ioemu-minios-config.mk: $(CURDIR)/ioemu-minios.cfg
 	MINIOS_CONFIG="$<" CONFIG_FILE="$(CURDIR)/$@" $(MAKE) DESTDIR= -C $(MINI_OS) config
 
 .PHONY: ioemu
-ioemu: cross-zlib cross-libpci libxc ioemu-minios-config.mk
+ioemu: cross-zlib cross-libpci libxenguest ioemu-minios-config.mk
 	[ -f ioemu/config-host.mak ] || \
 	  ( $(buildmakevars2shellvars); \
 	    cd ioemu ; \
@@ -503,15 +492,15 @@ xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
 
 .PHONY: ioemu-stubdom
 ioemu-stubdom: APP_OBJS=$(CURDIR)/ioemu/i386-stubdom/qemu.a $(CURDIR)/ioemu/i386-stubdom/libqemu.a $(CURDIR)/ioemu/libqemu_common.a
-ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxc ioemu
+ioemu-stubdom: mini-os-$(XEN_TARGET_ARCH)-ioemu lwip-$(XEN_TARGET_ARCH) libxenguest ioemu
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/ioemu-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(APP_OBJS)"
 
 .PHONY: caml-stubdom
-caml-stubdom: mini-os-$(XEN_TARGET_ARCH)-caml lwip-$(XEN_TARGET_ARCH) libxc cross-ocaml caml
+caml-stubdom: mini-os-$(XEN_TARGET_ARCH)-caml lwip-$(XEN_TARGET_ARCH) libxenguest cross-ocaml caml
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/caml/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS="$(CURDIR)/caml/main-caml.o $(CURDIR)/caml/caml.o $(CAMLLIB)/libasmrun.a"
 
 .PHONY: c-stubdom
-c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxc c
+c-stubdom: mini-os-$(XEN_TARGET_ARCH)-c lwip-$(XEN_TARGET_ARCH) libxenguest c
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/c/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< LWIPDIR=$(CURDIR)/lwip-$(XEN_TARGET_ARCH) APP_OBJS=$(CURDIR)/c/main.a
 
 .PHONY: vtpm-stubdom
@@ -523,11 +512,11 @@ vtpmmgr-stubdom: mini-os-$(XEN_TARGET_ARCH)-vtpmmgr vtpmmgr
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/vtpmmgr/minios.cfg" $(MAKE) -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS="$(CURDIR)/vtpmmgr/vtpmmgr.a" APP_LDLIBS="-lm -lpolarssl"
 
 .PHONY: pv-grub
-pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxc grub
+pv-grub: mini-os-$(XEN_TARGET_ARCH)-grub libxenguest grub
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/grub/minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/grub-$(XEN_TARGET_ARCH)/main.a
 
 .PHONY: xenstore-stubdom
-xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxc xenstore
+xenstore-stubdom: mini-os-$(XEN_TARGET_ARCH)-xenstore libxenguest xenstore
 	DEF_CPPFLAGS="$(TARGET_CPPFLAGS)" DEF_CFLAGS="$(TARGET_CFLAGS)" DEF_LDFLAGS="$(TARGET_LDFLAGS)" MINIOS_CONFIG="$(CURDIR)/xenstore-minios.cfg" $(MAKE) DESTDIR= -C $(MINI_OS) OBJ_DIR=$(CURDIR)/$< APP_OBJS=$(CURDIR)/xenstore/xenstored.a
 
 #########
@@ -621,7 +610,6 @@ clean:
 	rm -f $(STUBDOMPATH)
 	rm -f *-minios-config.mk
 	rm -fr pkg-config
-	[ ! -e libxc-$(XEN_TARGET_ARCH)/Makefile ] || $(MAKE) DESTDIR= -C libxc-$(XEN_TARGET_ARCH) clean
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
 
@@ -632,7 +620,7 @@ crossclean: clean
 	rm -fr newlib-$(XEN_TARGET_ARCH)
 	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
-	rm -fr libxc-$(XEN_TARGET_ARCH) ioemu xenstore
+	rm -fr ioemu xenstore
 	rm -fr gmp-$(XEN_TARGET_ARCH)
 	rm -fr polarssl-$(XEN_TARGET_ARCH)
 	rm -fr openssl-$(XEN_TARGET_ARCH)
diff --git a/stubdom/grub/Makefile b/stubdom/grub/Makefile
index d33fa2f71e..7397661c9b 100644
--- a/stubdom/grub/Makefile
+++ b/stubdom/grub/Makefile
@@ -7,7 +7,7 @@ BOOT=$(OBJ_DIR)/boot-$(XEN_TARGET_ARCH).o
 
 DEF_CPPFLAGS += -I$(XEN_ROOT)/tools/libs/toollog/include
 DEF_CPPFLAGS += -I$(XEN_ROOT)/tools/libs/ctrl/include
-DEF_CPPFLAGS += -I$(XEN_ROOT)/tools/libxc/include
+DEF_CPPFLAGS += -I$(XEN_ROOT)/tools/libs/guest/include
 DEF_CPPFLAGS += -I$(XEN_ROOT)/tools/include -I.
 DEF_CPPFLAGS += -I../grub-upstream/stage1
 DEF_CPPFLAGS += -I../grub-upstream/stage2
diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
index b1387df3f8..e1640a7cbc 100644
--- a/stubdom/mini-os.mk
+++ b/stubdom/mini-os.mk
@@ -14,4 +14,4 @@ CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
 FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
 DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
 CTRL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/ctrl
-GUEST_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
+GUEST_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/guest
diff --git a/tools/Makefile b/tools/Makefile
index 7c9f9fc900..f9b4012290 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -6,7 +6,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 SUBDIRS-y :=
 SUBDIRS-y += libs
-SUBDIRS-y += libxc
 SUBDIRS-y += flask
 SUBDIRS-y += fuzz
 SUBDIRS-y += xenstore
@@ -44,7 +43,7 @@ SUBDIRS-y += pygrub
 SUBDIRS-$(OCAML_TOOLS) += ocaml
 
 ifeq ($(CONFIG_RUMP),y)
-SUBDIRS-y := libs libxc xenstore
+SUBDIRS-y := libs xenstore
 endif
 
 # For the sake of linking, set the sys-root
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 1cc56e9ab8..914c79bfb9 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -15,7 +15,6 @@ XEN_INCLUDE        = $(XEN_ROOT)/tools/include
 
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
-XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
@@ -105,11 +104,7 @@ $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
 CFLAGS_libxenctrl += $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) -D__XEN_TOOLS__
-
-CFLAGS_libxenguest = -I$(XEN_libxenguest)/include $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory) $(CFLAGS_xeninclude)
-SHDEPS_libxenguest = $(SHLIB_libxenevtchn) $(SHLIB_libxenctrl)
-LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libextension)
-SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
+CFLAGS_libxenguest += $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory)
 
 CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenstore = $(SHLIB_libxentoolcore) $(SHLIB_libxenctrl)
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 7648ea0e4c..f15c1688f7 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -10,6 +10,7 @@ SUBDIRS-y += call
 SUBDIRS-y += foreignmemory
 SUBDIRS-y += devicemodel
 SUBDIRS-y += ctrl
+SUBDIRS-y += guest
 SUBDIRS-y += hypfs
 
 ifeq ($(CONFIG_RUMP),y)
diff --git a/tools/libxc/COPYING b/tools/libs/guest/COPYING
similarity index 100%
rename from tools/libxc/COPYING
rename to tools/libs/guest/COPYING
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
new file mode 100644
index 0000000000..e53aeabd3e
--- /dev/null
+++ b/tools/libs/guest/Makefile
@@ -0,0 +1,121 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+ifeq ($(CONFIG_LIBXC_MINIOS),y)
+# Save/restore of a domain is currently incompatible with a stubdom environment
+override CONFIG_MIGRATE := n
+endif
+
+LINK_FILES := xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bitops.h
+
+$(LINK_FILES):
+	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@
+
+SRCS-y += xg_private.c
+SRCS-y += xg_domain.c
+SRCS-y += xg_suspend.c
+ifeq ($(CONFIG_MIGRATE),y)
+SRCS-y += xg_sr_common.c
+SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
+SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
+SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
+SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
+SRCS-y += xg_sr_restore.c
+SRCS-y += xg_sr_save.c
+SRCS-y += xg_offline_page.c
+else
+SRCS-y += xg_nomigrate.c
+endif
+
+vpath %.c ../../../xen/common/libelf
+CFLAGS += -I../../../xen/common/libelf
+
+ELF_SRCS-y += libelf-tools.c libelf-loader.c
+ELF_SRCS-y += libelf-dominfo.c
+
+SRCS-y += $(ELF_SRCS-y)
+
+$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
+$(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
+
+ifeq ($(CONFIG_X86),y) # Add libx86 to the build
+vpath %.c ../../../xen/lib/x86
+
+SRCS-y                 += cpuid.c msr.c
+endif
+
+# new domain builder
+SRCS-y                 += xg_dom_core.c
+SRCS-y                 += xg_dom_boot.c
+SRCS-y                 += xg_dom_elfloader.c
+SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
+SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
+SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
+SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
+SRCS-y                 += xg_dom_binloader.c
+SRCS-y                 += xg_dom_compat_linux.c
+
+SRCS-$(CONFIG_X86)     += xg_dom_x86.c
+SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
+
+ifeq ($(CONFIG_LIBXC_MINIOS),y)
+SRCS-y                 += xg_dom_decompress_unsafe.c
+SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
+SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
+SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
+SRCS-y                 += xg_dom_decompress_unsafe_xz.c
+endif
+
+-include $(XEN_TARGET_ARCH)/Makefile
+
+CFLAGS   += -Werror -Wmissing-prototypes
+CFLAGS   += -I. -I./include $(CFLAGS_xeninclude)
+CFLAGS   += -D__XEN_TOOLS__
+CFLAGS   += -include $(XEN_ROOT)/tools/config.h
+
+# Needed for posix_fadvise64() in xc_linux.c
+CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
+
+CFLAGS	+= $(PTHREAD_CFLAGS)
+CFLAGS	+= $(CFLAGS_libxentoollog)
+CFLAGS	+= $(CFLAGS_libxenevtchn)
+CFLAGS	+= $(CFLAGS_libxendevicemodel)
+
+# libxenguest includes xc_private.h, so needs this despite not using
+# this functionality directly.
+CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
+
+ifeq ($(CONFIG_MiniOS),y)
+zlib-options =
+else
+zlib-options = $(ZLIB)
+endif
+
+xc_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
+xc_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
+
+LIBHEADER := xenguest.h
+
+NO_HEADERS_CHK := y
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
+libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
+
+genpath-target = $(call buildmakevars2header,_paths.h)
+$(eval $(genpath-target))
+
+xc_private.h: _paths.h
+
+$(LIB_OBJS) $(PIC_OBJS): $(LINK_FILES)
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
+
+.PHONY: cleanlocal
+cleanlocal:
+	rm -f libxenguest.map
diff --git a/tools/libxc/include/xenguest.h b/tools/libs/guest/include/xenguest.h
similarity index 100%
rename from tools/libxc/include/xenguest.h
rename to tools/libs/guest/include/xenguest.h
diff --git a/tools/libxc/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
similarity index 100%
rename from tools/libxc/xg_cpuid_x86.c
rename to tools/libs/guest/xg_cpuid_x86.c
diff --git a/tools/libxc/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
similarity index 100%
rename from tools/libxc/xg_dom_arm.c
rename to tools/libs/guest/xg_dom_arm.c
diff --git a/tools/libxc/xg_dom_armzimageloader.c b/tools/libs/guest/xg_dom_armzimageloader.c
similarity index 100%
rename from tools/libxc/xg_dom_armzimageloader.c
rename to tools/libs/guest/xg_dom_armzimageloader.c
diff --git a/tools/libxc/xg_dom_binloader.c b/tools/libs/guest/xg_dom_binloader.c
similarity index 100%
rename from tools/libxc/xg_dom_binloader.c
rename to tools/libs/guest/xg_dom_binloader.c
diff --git a/tools/libxc/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
similarity index 100%
rename from tools/libxc/xg_dom_boot.c
rename to tools/libs/guest/xg_dom_boot.c
diff --git a/tools/libxc/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
similarity index 100%
rename from tools/libxc/xg_dom_bzimageloader.c
rename to tools/libs/guest/xg_dom_bzimageloader.c
diff --git a/tools/libxc/xg_dom_compat_linux.c b/tools/libs/guest/xg_dom_compat_linux.c
similarity index 100%
rename from tools/libxc/xg_dom_compat_linux.c
rename to tools/libs/guest/xg_dom_compat_linux.c
diff --git a/tools/libxc/xg_dom_core.c b/tools/libs/guest/xg_dom_core.c
similarity index 100%
rename from tools/libxc/xg_dom_core.c
rename to tools/libs/guest/xg_dom_core.c
diff --git a/tools/libxc/xg_dom_decompress.h b/tools/libs/guest/xg_dom_decompress.h
similarity index 100%
rename from tools/libxc/xg_dom_decompress.h
rename to tools/libs/guest/xg_dom_decompress.h
diff --git a/tools/libxc/xg_dom_decompress_lz4.c b/tools/libs/guest/xg_dom_decompress_lz4.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_lz4.c
rename to tools/libs/guest/xg_dom_decompress_lz4.c
diff --git a/tools/libxc/xg_dom_decompress_unsafe.c b/tools/libs/guest/xg_dom_decompress_unsafe.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe.c
rename to tools/libs/guest/xg_dom_decompress_unsafe.c
diff --git a/tools/libxc/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe.h
rename to tools/libs/guest/xg_dom_decompress_unsafe.h
diff --git a/tools/libxc/xg_dom_decompress_unsafe_bzip2.c b/tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe_bzip2.c
rename to tools/libs/guest/xg_dom_decompress_unsafe_bzip2.c
diff --git a/tools/libxc/xg_dom_decompress_unsafe_lzma.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe_lzma.c
rename to tools/libs/guest/xg_dom_decompress_unsafe_lzma.c
diff --git a/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
rename to tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
diff --git a/tools/libxc/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
similarity index 100%
rename from tools/libxc/xg_dom_decompress_unsafe_xz.c
rename to tools/libs/guest/xg_dom_decompress_unsafe_xz.c
diff --git a/tools/libxc/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
similarity index 100%
rename from tools/libxc/xg_dom_elfloader.c
rename to tools/libs/guest/xg_dom_elfloader.c
diff --git a/tools/libxc/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
similarity index 100%
rename from tools/libxc/xg_dom_hvmloader.c
rename to tools/libs/guest/xg_dom_hvmloader.c
diff --git a/tools/libxc/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
similarity index 100%
rename from tools/libxc/xg_dom_x86.c
rename to tools/libs/guest/xg_dom_x86.c
diff --git a/tools/libxc/xg_domain.c b/tools/libs/guest/xg_domain.c
similarity index 100%
rename from tools/libxc/xg_domain.c
rename to tools/libs/guest/xg_domain.c
diff --git a/tools/libxc/xg_nomigrate.c b/tools/libs/guest/xg_nomigrate.c
similarity index 100%
rename from tools/libxc/xg_nomigrate.c
rename to tools/libs/guest/xg_nomigrate.c
diff --git a/tools/libxc/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
similarity index 100%
rename from tools/libxc/xg_offline_page.c
rename to tools/libs/guest/xg_offline_page.c
diff --git a/tools/libxc/xg_private.c b/tools/libs/guest/xg_private.c
similarity index 100%
rename from tools/libxc/xg_private.c
rename to tools/libs/guest/xg_private.c
diff --git a/tools/libxc/xg_private.h b/tools/libs/guest/xg_private.h
similarity index 100%
rename from tools/libxc/xg_private.h
rename to tools/libs/guest/xg_private.h
diff --git a/tools/libxc/xg_save_restore.h b/tools/libs/guest/xg_save_restore.h
similarity index 100%
rename from tools/libxc/xg_save_restore.h
rename to tools/libs/guest/xg_save_restore.h
diff --git a/tools/libxc/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
similarity index 100%
rename from tools/libxc/xg_sr_common.c
rename to tools/libs/guest/xg_sr_common.c
diff --git a/tools/libxc/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
similarity index 100%
rename from tools/libxc/xg_sr_common.h
rename to tools/libs/guest/xg_sr_common.h
diff --git a/tools/libxc/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
similarity index 100%
rename from tools/libxc/xg_sr_common_x86.c
rename to tools/libs/guest/xg_sr_common_x86.c
diff --git a/tools/libxc/xg_sr_common_x86.h b/tools/libs/guest/xg_sr_common_x86.h
similarity index 100%
rename from tools/libxc/xg_sr_common_x86.h
rename to tools/libs/guest/xg_sr_common_x86.h
diff --git a/tools/libxc/xg_sr_common_x86_pv.c b/tools/libs/guest/xg_sr_common_x86_pv.c
similarity index 100%
rename from tools/libxc/xg_sr_common_x86_pv.c
rename to tools/libs/guest/xg_sr_common_x86_pv.c
diff --git a/tools/libxc/xg_sr_common_x86_pv.h b/tools/libs/guest/xg_sr_common_x86_pv.h
similarity index 100%
rename from tools/libxc/xg_sr_common_x86_pv.h
rename to tools/libs/guest/xg_sr_common_x86_pv.h
diff --git a/tools/libxc/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
similarity index 100%
rename from tools/libxc/xg_sr_restore.c
rename to tools/libs/guest/xg_sr_restore.c
diff --git a/tools/libxc/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
similarity index 100%
rename from tools/libxc/xg_sr_restore_x86_hvm.c
rename to tools/libs/guest/xg_sr_restore_x86_hvm.c
diff --git a/tools/libxc/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
similarity index 100%
rename from tools/libxc/xg_sr_restore_x86_pv.c
rename to tools/libs/guest/xg_sr_restore_x86_pv.c
diff --git a/tools/libxc/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
similarity index 100%
rename from tools/libxc/xg_sr_save.c
rename to tools/libs/guest/xg_sr_save.c
diff --git a/tools/libxc/xg_sr_save_x86_hvm.c b/tools/libs/guest/xg_sr_save_x86_hvm.c
similarity index 100%
rename from tools/libxc/xg_sr_save_x86_hvm.c
rename to tools/libs/guest/xg_sr_save_x86_hvm.c
diff --git a/tools/libxc/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
similarity index 100%
rename from tools/libxc/xg_sr_save_x86_pv.c
rename to tools/libs/guest/xg_sr_save_x86_pv.c
diff --git a/tools/libxc/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
similarity index 100%
rename from tools/libxc/xg_sr_stream_format.h
rename to tools/libs/guest/xg_sr_stream_format.h
diff --git a/tools/libxc/xg_suspend.c b/tools/libs/guest/xg_suspend.c
similarity index 100%
rename from tools/libxc/xg_suspend.c
rename to tools/libs/guest/xg_suspend.c
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 4679268fc2..9d0ed08846 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -34,7 +34,7 @@ PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 PKG_CONFIG_USELIBS := $(SHLIB_libxen$(LIBNAME))
 PKG_CONFIG_LIB := xen$(LIBNAME)
-PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(USELIBS_$(LIBNAME)),xen$(lib))))
+PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index 8e45e8d917..9619c576ba 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -18,3 +18,5 @@ LIBS_LIBS += hypfs
 USELIBS_hypfs := toollog toolcore call
 LIBS_LIBS += ctrl
 USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
+LIBS_LIBS += guest
+USELIBS_guest := evtchn ctrl
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
deleted file mode 100644
index 44fa0488c9..0000000000
--- a/tools/libxc/Makefile
+++ /dev/null
@@ -1,219 +0,0 @@
-XEN_ROOT = $(CURDIR)/../..
-include $(XEN_ROOT)/tools/Rules.mk
-
-MAJOR    = 4.15
-MINOR    = 0
-
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-# Save/restore of a domain is currently incompatible with a stubdom environment
-override CONFIG_MIGRATE := n
-endif
-
-LINK_FILES := xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bitops.h
-
-$(LINK_FILES):
-	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@
-
-GUEST_SRCS-y :=
-GUEST_SRCS-y += xg_private.c
-GUEST_SRCS-y += xg_domain.c
-GUEST_SRCS-y += xg_suspend.c
-ifeq ($(CONFIG_MIGRATE),y)
-GUEST_SRCS-y += xg_sr_common.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
-GUEST_SRCS-y += xg_sr_restore.c
-GUEST_SRCS-y += xg_sr_save.c
-GUEST_SRCS-y += xg_offline_page.c
-else
-GUEST_SRCS-y += xg_nomigrate.c
-endif
-
-vpath %.c ../../xen/common/libelf
-CFLAGS += -I../../xen/common/libelf
-
-ELF_SRCS-y += libelf-tools.c libelf-loader.c
-ELF_SRCS-y += libelf-dominfo.c
-
-GUEST_SRCS-y += $(ELF_SRCS-y)
-
-$(patsubst %.c,%.o,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-$(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
-
-ifeq ($(CONFIG_X86),y) # Add libx86 to the build
-vpath %.c ../../xen/lib/x86
-
-GUEST_SRCS-y                 += cpuid.c msr.c
-endif
-
-# new domain builder
-GUEST_SRCS-y                 += xg_dom_core.c
-GUEST_SRCS-y                 += xg_dom_boot.c
-GUEST_SRCS-y                 += xg_dom_elfloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
-GUEST_SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
-GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
-GUEST_SRCS-y                 += xg_dom_binloader.c
-GUEST_SRCS-y                 += xg_dom_compat_linux.c
-
-GUEST_SRCS-$(CONFIG_X86)     += xg_dom_x86.c
-GUEST_SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
-GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
-
-ifeq ($(CONFIG_LIBXC_MINIOS),y)
-GUEST_SRCS-y                 += xg_dom_decompress_unsafe.c
-GUEST_SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
-GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
-GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
-GUEST_SRCS-y                 += xg_dom_decompress_unsafe_xz.c
-endif
-
--include $(XEN_TARGET_ARCH)/Makefile
-
-CFLAGS   += -Werror -Wmissing-prototypes
-CFLAGS   += -I. -I./include $(CFLAGS_xeninclude)
-CFLAGS   += -D__XEN_TOOLS__
-
-# Needed for posix_fadvise64() in xc_linux.c
-CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
-
-CFLAGS	+= $(PTHREAD_CFLAGS)
-CFLAGS	+= $(CFLAGS_libxentoollog)
-CFLAGS	+= $(CFLAGS_libxenevtchn)
-CFLAGS	+= $(CFLAGS_libxendevicemodel)
-
-GUEST_LIB_OBJS := $(patsubst %.c,%.o,$(GUEST_SRCS-y))
-GUEST_PIC_OBJS := $(patsubst %.c,%.opic,$(GUEST_SRCS-y))
-
-$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
-
-# libxenguest includes xc_private.h, so needs this despite not using
-# this functionality directly.
-$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
-
-LIB += libxenguest.a
-ifneq ($(nosharedlibs),y)
-LIB += libxenguest.so libxenguest.so.$(MAJOR) libxenguest.so.$(MAJOR).$(MINOR)
-endif
-
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-xc_private.h: _paths.h
-
-$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): $(LINK_FILES)
-
-PKG_CONFIG := xenguest.pc
-PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
-
-xenguest.pc: PKG_CONFIG_NAME = Xenguest
-xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
-xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
-xenguest.pc: PKG_CONFIG_LIB = xenguest
-xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn
-
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_NAME = Xenguest
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_LIB = xenguest
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn,xencontrol
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
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
-.PHONY: all
-all: build
-
-.PHONY: build
-build:
-	$(MAKE) libs
-
-.PHONY: libs
-libs: $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
-
-.PHONY: install
-install: build
-	$(INSTALL_DIR) $(DESTDIR)$(libdir)
-	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxenguest.a $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
-	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenguest.so
-	$(INSTALL_DATA) include/xenguest.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) xenguest.pc $(DESTDIR)$(PKG_INSTALLDIR)
-
-.PHONY: uninstall
-uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xenguest.pc
-	rm -f $(DESTDIR)$(includedir)/xenguest.h
-	rm -f $(DESTDIR)$(libdir)/libxenguest.so
-	rm -f $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(libdir)/libxenguest.a
-
-.PHONY: TAGS
-TAGS:
-	etags -t *.c *.h
-
-.PHONY: clean
-clean:
-	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) \
-            _paths.h \
-	    $(LINK_FILES) \
-	    xenguest.pc \
-            $(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS)
-
-.PHONY: distclean
-distclean: clean
-
-.PHONY: rpm
-rpm: build
-	rm -rf staging
-	mkdir staging
-	mkdir staging/i386
-	rpmbuild --define "staging$$PWD/staging" --define '_builddir.' \
-		--define "_rpmdir$$PWD/staging" -bb rpm.spec
-	mv staging/i386/*.rpm .
-	rm -rf staging
-
-# libxenguest
-
-libxenguest.a: $(GUEST_LIB_OBJS)
-	$(AR) rc $@ $^
-
-libxenguest.so: libxenguest.so.$(MAJOR)
-	$(SYMLINK_SHLIB) $< $@
-libxenguest.so.$(MAJOR): libxenguest.so.$(MAJOR).$(MINOR)
-	$(SYMLINK_SHLIB) $< $@
-
-ifeq ($(CONFIG_MiniOS),y)
-zlib-options =
-else
-zlib-options = $(ZLIB)
-endif
-
-xc_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
-xc_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
-
-libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
-libxenguest.so.$(MAJOR).$(MINOR): $(GUEST_PIC_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenguest.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(GUEST_PIC_OBJS) $(COMPRESSION_LIBS) -lz $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(PTHREAD_LIBS) $(APPEND_LDFLAGS)
-
--include $(DEPS_INCLUDE)
-
-- 
2.26.2


