Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC1221244
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkEd-0002s5-Bv; Wed, 15 Jul 2020 16:26:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkEb-0002Yi-B7
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:26:17 +0000
X-Inumbo-ID: d1acb2dc-c6b7-11ea-bca7-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1acb2dc-c6b7-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:39 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDy-0001sU-51; Wed, 15 Jul 2020 17:25:38 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org,
	xen-devel@dornerworks.com
Subject: [PATCH 08/12] tools: move libxenctrl below tools/libs
Date: Wed, 15 Jul 2020 17:25:07 +0100
Message-Id: <20200715162511.5941-10-ian.jackson@eu.citrix.com>
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
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

Today tools/libxc needs to be built after tools/libs as libxenctrl is
depending on some libraries in tools/libs. This in turn blocks moving
other libraries depending on libxenctrl below tools/libs.

So carve out libxenctrl from tools/libxc and move it into
tools/libs/ctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  7 ++
 MAINTAINERS                                   |  2 +-
 stubdom/Makefile                              | 29 +++++-
 stubdom/mini-os.mk                            |  2 +-
 tools/Makefile                                |  3 +
 tools/Rules.mk                                |  9 +-
 tools/libs/Makefile                           |  1 +
 tools/libs/ctrl/Makefile                      | 69 +++++++++++++
 tools/{libxc => libs/ctrl}/include/xenctrl.h  |  0
 .../ctrl}/include/xenctrl_compat.h            |  0
 .../ctrl}/include/xenctrl_dom.h               |  0
 tools/libs/ctrl/libxenctrl.map                |  3 +
 tools/{libxc => libs/ctrl}/xc_altp2m.c        |  0
 tools/{libxc => libs/ctrl}/xc_arinc653.c      |  0
 tools/{libxc => libs/ctrl}/xc_bitops.h        |  0
 tools/{libxc => libs/ctrl}/xc_core.c          |  0
 tools/{libxc => libs/ctrl}/xc_core.h          |  0
 tools/{libxc => libs/ctrl}/xc_core_arm.c      |  0
 tools/{libxc => libs/ctrl}/xc_core_arm.h      |  0
 tools/{libxc => libs/ctrl}/xc_core_x86.c      |  0
 tools/{libxc => libs/ctrl}/xc_core_x86.h      |  0
 tools/{libxc => libs/ctrl}/xc_cpu_hotplug.c   |  0
 tools/{libxc => libs/ctrl}/xc_cpupool.c       |  0
 tools/{libxc => libs/ctrl}/xc_csched.c        |  0
 tools/{libxc => libs/ctrl}/xc_csched2.c       |  0
 .../ctrl}/xc_devicemodel_compat.c             |  0
 tools/{libxc => libs/ctrl}/xc_domain.c        |  0
 tools/{libxc => libs/ctrl}/xc_evtchn.c        |  0
 tools/{libxc => libs/ctrl}/xc_evtchn_compat.c |  0
 tools/{libxc => libs/ctrl}/xc_flask.c         |  0
 .../{libxc => libs/ctrl}/xc_foreign_memory.c  |  0
 tools/{libxc => libs/ctrl}/xc_freebsd.c       |  0
 tools/{libxc => libs/ctrl}/xc_gnttab.c        |  0
 tools/{libxc => libs/ctrl}/xc_gnttab_compat.c |  0
 tools/{libxc => libs/ctrl}/xc_hcall_buf.c     |  0
 tools/{libxc => libs/ctrl}/xc_kexec.c         |  0
 tools/{libxc => libs/ctrl}/xc_linux.c         |  0
 tools/{libxc => libs/ctrl}/xc_mem_access.c    |  0
 tools/{libxc => libs/ctrl}/xc_mem_paging.c    |  0
 tools/{libxc => libs/ctrl}/xc_memshr.c        |  0
 tools/{libxc => libs/ctrl}/xc_minios.c        |  0
 tools/{libxc => libs/ctrl}/xc_misc.c          |  0
 tools/{libxc => libs/ctrl}/xc_monitor.c       |  0
 tools/{libxc => libs/ctrl}/xc_msr_x86.h       |  0
 tools/{libxc => libs/ctrl}/xc_netbsd.c        |  0
 tools/{libxc => libs/ctrl}/xc_pagetab.c       |  0
 tools/{libxc => libs/ctrl}/xc_physdev.c       |  0
 tools/{libxc => libs/ctrl}/xc_pm.c            |  0
 tools/{libxc => libs/ctrl}/xc_private.c       |  0
 tools/{libxc => libs/ctrl}/xc_private.h       |  0
 tools/{libxc => libs/ctrl}/xc_psr.c           |  0
 tools/{libxc => libs/ctrl}/xc_resource.c      |  0
 tools/{libxc => libs/ctrl}/xc_resume.c        |  0
 tools/{libxc => libs/ctrl}/xc_rt.c            |  0
 tools/{libxc => libs/ctrl}/xc_solaris.c       |  0
 tools/{libxc => libs/ctrl}/xc_tbuf.c          |  0
 tools/{libxc => libs/ctrl}/xc_vm_event.c      |  0
 .../ctrl/xenctrl.pc.in}                       |  0
 tools/libxc/Makefile                          | 99 +++----------------
 tools/libxl/Makefile                          |  2 +-
 tools/misc/Makefile                           |  1 +
 tools/python/Makefile                         |  2 +-
 tools/python/setup.py                         | 10 +-
 63 files changed, 132 insertions(+), 107 deletions(-)
 create mode 100644 tools/libs/ctrl/Makefile
 rename tools/{libxc => libs/ctrl}/include/xenctrl.h (100%)
 rename tools/{libxc => libs/ctrl}/include/xenctrl_compat.h (100%)
 rename tools/{libxc => libs/ctrl}/include/xenctrl_dom.h (100%)
 create mode 100644 tools/libs/ctrl/libxenctrl.map
 rename tools/{libxc => libs/ctrl}/xc_altp2m.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_arinc653.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_bitops.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_core.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_core.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_core_arm.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_core_arm.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_core_x86.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_core_x86.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_cpu_hotplug.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_cpupool.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_csched.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_csched2.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_devicemodel_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_domain.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_evtchn.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_evtchn_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_flask.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_foreign_memory.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_freebsd.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_gnttab.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_gnttab_compat.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_hcall_buf.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_kexec.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_linux.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_mem_access.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_mem_paging.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_memshr.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_minios.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_misc.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_monitor.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_msr_x86.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_netbsd.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_pagetab.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_physdev.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_pm.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_private.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_private.h (100%)
 rename tools/{libxc => libs/ctrl}/xc_psr.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_resource.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_resume.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_rt.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_solaris.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_tbuf.c (100%)
 rename tools/{libxc => libs/ctrl}/xc_vm_event.c (100%)
 rename tools/{libxc/xencontrol.pc.in => libs/ctrl/xenctrl.pc.in} (100%)

diff --git a/.gitignore b/.gitignore
index 5ea48af818..e28c21641c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -114,6 +114,8 @@ tools/libs/hypfs/headers.chk
 tools/libs/hypfs/xenhypfs.pc
 tools/libs/call/headers.chk
 tools/libs/call/xencall.pc
+tools/libs/ctrl/_paths.h
+tools/libs/ctrl/xenctrl.pc
 tools/libs/foreignmemory/headers.chk
 tools/libs/foreignmemory/xenforeignmemory.pc
 tools/libs/devicemodel/headers.chk
@@ -195,6 +197,11 @@ tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
 tools/libvchan/xenvchan.pc
 tools/libxc/*.pc
+tools/libxc/xc_bitops.h
+tools/libxc/xc_core.h
+tools/libxc/xc_core_arm.h
+tools/libxc/xc_core_x86.h
+tools/libxc/xc_private.h
 tools/libxl/_libxl.api-for-check
 tools/libxl/*.api-ok
 tools/libxl/*.pc
diff --git a/MAINTAINERS b/MAINTAINERS
index e374816755..7d25ed9c95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -226,7 +226,7 @@ M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
 S:	Supported
 L:	xen-devel@dornerworks.com
 F:	xen/common/sched/arinc653.c
-F:	tools/libxc/xc_arinc653.c
+F:	tools/libs/ctrl/xc_arinc653.c
 
 ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
 M:	Stefano Stabellini <sstabellini@kernel.org>
diff --git a/stubdom/Makefile b/stubdom/Makefile
index af8cde41b9..8147635ad0 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -351,13 +351,16 @@ libs-$(XEN_TARGET_ARCH)/foreignmemory/stamp: $(XEN_ROOT)/tools/libs/foreignmemor
 libs-$(XEN_TARGET_ARCH)/devicemodel/stamp: $(XEN_ROOT)/tools/libs/devicemodel/Makefile
 	$(do_links)
 
+libs-$(XEN_TARGET_ARCH)/ctrl/stamp: $(XEN_ROOT)/tools/libs/ctrl/Makefile
+	$(do_links)
+
 libxc-$(XEN_TARGET_ARCH)/stamp: $(XEN_ROOT)/tools/libxc/Makefile
 	$(do_links)
 
 xenstore/stamp: $(XEN_ROOT)/tools/xenstore/Makefile
 	$(do_links)
 
-LINK_LIBS_DIRS := toolcore toollog evtchn gnttab call foreignmemory devicemodel
+LINK_LIBS_DIRS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl
 LINK_DIRS := libxc-$(XEN_TARGET_ARCH) xenstore $(foreach dir,$(LINK_LIBS_DIRS),libs-$(XEN_TARGET_ARCH)/$(dir))
 LINK_STAMPS := $(foreach dir,$(LINK_DIRS),$(dir)/stamp)
 
@@ -405,6 +408,7 @@ libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $
 
 .PHONY: libxenevtchn
 libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
+libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/evtchn
 
@@ -414,6 +418,7 @@ libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxengnttab
 libxengnttab: libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a
+libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: libxentoolcore libxentoollog
 libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/gnttab
 
@@ -423,6 +428,7 @@ libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(N
 
 .PHONY: libxencall
 libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
+libs-$(XEN_TARGET_ARCH)/call/libxencall.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call
 
@@ -432,6 +438,7 @@ libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLI
 
 .PHONY: libxenforeignmemory
 libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
+libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: libxentoolcore
 libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory
 
@@ -441,20 +448,31 @@ libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: mk-headers-$(XEN_TA
 
 .PHONY: libxendevicemodel
 libxendevicemodel: libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a
+libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: libxentoolcore libxentoollog libxencall
 libs-$(XEN_TARGET_ARCH)/devicemodel/libxendevicemodel.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel
 
+#######
+#######
+# libxenctrl
+#######
+
+.PHONY: libxenctrl
+libxenctrl: libs-$(XEN_TARGET_ARCH)/ctrl/libxenctrl.a
+libs-$(XEN_TARGET_ARCH)/ctrl/libxenctrl.a: libxentoollog libxencall libxenevtchn libxengnttab libxenforeignmemory libxendevicemodel
+libs-$(XEN_TARGET_ARCH)/ctrl/libxenctrl.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
+	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libs-$(XEN_TARGET_ARCH)/ctrl
+
 #######
 # libxc
 #######
 
 .PHONY: libxc
-libxc: libxc-$(XEN_TARGET_ARCH)/libxenctrl.a libxc-$(XEN_TARGET_ARCH)/libxenguest.a
-libxc-$(XEN_TARGET_ARCH)/libxenctrl.a: mk-headers-$(XEN_TARGET_ARCH) libxentoolcore libxentoollog libxenevtchn libxengnttab libxencall libxenforeignmemory libxendevicemodel cross-zlib
+libxc: libxc-$(XEN_TARGET_ARCH)/libxenguest.a
+libxc-$(XEN_TARGET_ARCH)/libxenguest.a: libxenevtchn libxenctrl cross-zlib
+libxc-$(XEN_TARGET_ARCH)/libxenguest.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	CPPFLAGS="$(TARGET_CPPFLAGS)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libxc-$(XEN_TARGET_ARCH)
 
- libxc-$(XEN_TARGET_ARCH)/libxenguest.a: libxc-$(XEN_TARGET_ARCH)/libxenctrl.a
-
 #######
 # ioemu
 #######
@@ -681,6 +699,7 @@ clean:
 	[ ! -e libs-$(XEN_TARGET_ARCH)/call/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/call clean
 	[ ! -e libs-$(XEN_TARGET_ARCH)/foreignmemory/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/foreignmemory clean
 	[ ! -e libs-$(XEN_TARGET_ARCH)/devicemodel/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/devicemodel clean
+	[ ! -e libs-$(XEN_TARGET_ARCH)/ctrl/Makefile ] || $(MAKE) DESTDIR= -C libs-$(XEN_TARGET_ARCH)/ctrl clean
 	[ ! -e libxc-$(XEN_TARGET_ARCH)/Makefile ] || $(MAKE) DESTDIR= -C libxc-$(XEN_TARGET_ARCH) clean
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
 	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
index 32528bb91f..b1387df3f8 100644
--- a/stubdom/mini-os.mk
+++ b/stubdom/mini-os.mk
@@ -13,5 +13,5 @@ GNTTAB_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
 CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
 FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
 DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
-CTRL_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
+CTRL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/ctrl
 GUEST_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
diff --git a/tools/Makefile b/tools/Makefile
index c10946e3b1..7c62c599dd 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -255,6 +255,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		-I$(XEN_ROOT)/tools/libs/gnttab/include \
 		-I$(XEN_ROOT)/tools/libs/foreignmemory/include \
 		-I$(XEN_ROOT)/tools/libs/devicemodel/include \
+		-I$(XEN_ROOT)/tools/libs/ctrl/include \
 		-I$(XEN_ROOT)/tools/libxc/include \
 		-I$(XEN_ROOT)/tools/xenstore/include \
 		-I$(XEN_ROOT)/tools/xenstore/compat/include \
@@ -266,6 +267,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		-L$(XEN_ROOT)/tools/libs/gnttab \
 		-L$(XEN_ROOT)/tools/libs/foreignmemory \
 		-L$(XEN_ROOT)/tools/libs/devicemodel \
+		-L$(XEN_ROOT)/tools/libs/ctrl \
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toolcore \
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/toollog \
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/evtchn \
@@ -273,6 +275,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/call \
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/foreignmemory \
 		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/devicemodel \
+		-Wl,-rpath-link=$(XEN_ROOT)/tools/libs/ctrl \
 		$(QEMU_UPSTREAM_RPATH)" \
 		--bindir=$(LIBEXEC_BIN) \
 		--datadir=$(SHAREDIR)/qemu-xen \
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5d699cfd39..6bc3347a1c 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -20,9 +20,8 @@ XEN_libxencall     = $(XEN_ROOT)/tools/libs/call
 XEN_libxenforeignmemory = $(XEN_ROOT)/tools/libs/foreignmemory
 XEN_libxendevicemodel = $(XEN_ROOT)/tools/libs/devicemodel
 XEN_libxenhypfs    = $(XEN_ROOT)/tools/libs/hypfs
-XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
-# Currently libxenguest lives in the same directory as libxenctrl
-XEN_libxenguest    = $(XEN_libxenctrl)
+XEN_libxenctrl     = $(XEN_ROOT)/tools/libs/ctrl
+XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
 XEN_libxlutil      = $(XEN_libxenlight)
@@ -147,7 +146,7 @@ LDLIBS_libxenctrl = $(SHDEPS_libxenctrl) $(XEN_libxenctrl)/libxenctrl$(libextens
 SHLIB_libxenctrl  = $(SHDEPS_libxenctrl) -Wl,-rpath-link=$(XEN_libxenctrl)
 
 CFLAGS_libxenguest = -I$(XEN_libxenguest)/include $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory) $(CFLAGS_xeninclude)
-SHDEPS_libxenguest = $(SHLIB_libxenevtchn)
+SHDEPS_libxenguest = $(SHLIB_libxenevtchn) $(SHLIB_libxenctrl)
 LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libextension)
 SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
 
@@ -179,7 +178,7 @@ CFLAGS += -O2 -fomit-frame-pointer
 endif
 
 CFLAGS_libxenlight = -I$(XEN_libxenlight) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
-SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs)
+SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs) $(SHLIB_libxenguest)
 LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_libxenlight)/libxenlight$(libextension)
 SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_libxenlight)
 
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index 69cdfb5975..7648ea0e4c 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -9,6 +9,7 @@ SUBDIRS-y += gnttab
 SUBDIRS-y += call
 SUBDIRS-y += foreignmemory
 SUBDIRS-y += devicemodel
+SUBDIRS-y += ctrl
 SUBDIRS-y += hypfs
 
 ifeq ($(CONFIG_RUMP),y)
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
new file mode 100644
index 0000000000..bda0b43dfa
--- /dev/null
+++ b/tools/libs/ctrl/Makefile
@@ -0,0 +1,69 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+MAJOR    = 4.14
+MINOR    = 0
+LIBNAME  := ctrl
+USELIBS  := toollog call evtchn gnttab foreignmemory devicemodel
+
+SRCS-y       += xc_altp2m.c
+SRCS-y       += xc_core.c
+SRCS-$(CONFIG_X86) += xc_core_x86.c
+SRCS-$(CONFIG_ARM) += xc_core_arm.c
+SRCS-y       += xc_cpupool.c
+SRCS-y       += xc_domain.c
+SRCS-y       += xc_evtchn.c
+SRCS-y       += xc_gnttab.c
+SRCS-y       += xc_misc.c
+SRCS-y       += xc_flask.c
+SRCS-y       += xc_physdev.c
+SRCS-y       += xc_private.c
+SRCS-y       += xc_csched.c
+SRCS-y       += xc_csched2.c
+SRCS-y       += xc_arinc653.c
+SRCS-y       += xc_rt.c
+SRCS-y       += xc_tbuf.c
+SRCS-y       += xc_pm.c
+SRCS-y       += xc_cpu_hotplug.c
+SRCS-y       += xc_resume.c
+SRCS-y       += xc_vm_event.c
+SRCS-y       += xc_monitor.c
+SRCS-y       += xc_mem_paging.c
+SRCS-y       += xc_mem_access.c
+SRCS-y       += xc_memshr.c
+SRCS-y       += xc_hcall_buf.c
+SRCS-y       += xc_foreign_memory.c
+SRCS-y       += xc_kexec.c
+SRCS-y       += xc_resource.c
+SRCS-$(CONFIG_X86) += xc_psr.c
+SRCS-$(CONFIG_X86) += xc_pagetab.c
+SRCS-$(CONFIG_Linux) += xc_linux.c
+SRCS-$(CONFIG_FreeBSD) += xc_freebsd.c
+SRCS-$(CONFIG_SunOS) += xc_solaris.c
+SRCS-$(CONFIG_NetBSD) += xc_netbsd.c
+SRCS-$(CONFIG_NetBSDRump) += xc_netbsd.c
+SRCS-$(CONFIG_MiniOS) += xc_minios.c
+SRCS-y       += xc_evtchn_compat.c
+SRCS-y       += xc_gnttab_compat.c
+SRCS-y       += xc_devicemodel_compat.c
+
+CFLAGS   += -D__XEN_TOOLS__
+CFLAGS	+= $(PTHREAD_CFLAGS)
+CFLAGS += -include $(XEN_ROOT)/tools/config.h
+
+# Needed for posix_fadvise64() in xc_linux.c
+CFLAGS-$(CONFIG_Linux) += -D_GNU_SOURCE
+
+LIBHEADER := xenctrl.h xenctrl_compat.h xenctrl_dom.h
+
+NO_HEADERS_CHK := y
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+genpath-target = $(call buildmakevars2header,_paths.h)
+$(eval $(genpath-target))
+
+xc_private.h: _paths.h
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libxc/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
similarity index 100%
rename from tools/libxc/include/xenctrl.h
rename to tools/libs/ctrl/include/xenctrl.h
diff --git a/tools/libxc/include/xenctrl_compat.h b/tools/libs/ctrl/include/xenctrl_compat.h
similarity index 100%
rename from tools/libxc/include/xenctrl_compat.h
rename to tools/libs/ctrl/include/xenctrl_compat.h
diff --git a/tools/libxc/include/xenctrl_dom.h b/tools/libs/ctrl/include/xenctrl_dom.h
similarity index 100%
rename from tools/libxc/include/xenctrl_dom.h
rename to tools/libs/ctrl/include/xenctrl_dom.h
diff --git a/tools/libs/ctrl/libxenctrl.map b/tools/libs/ctrl/libxenctrl.map
new file mode 100644
index 0000000000..26f1402d6d
--- /dev/null
+++ b/tools/libs/ctrl/libxenctrl.map
@@ -0,0 +1,3 @@
+VERS_4.14.0 {
+	global: *; /* Expose everything */
+};
diff --git a/tools/libxc/xc_altp2m.c b/tools/libs/ctrl/xc_altp2m.c
similarity index 100%
rename from tools/libxc/xc_altp2m.c
rename to tools/libs/ctrl/xc_altp2m.c
diff --git a/tools/libxc/xc_arinc653.c b/tools/libs/ctrl/xc_arinc653.c
similarity index 100%
rename from tools/libxc/xc_arinc653.c
rename to tools/libs/ctrl/xc_arinc653.c
diff --git a/tools/libxc/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
similarity index 100%
rename from tools/libxc/xc_bitops.h
rename to tools/libs/ctrl/xc_bitops.h
diff --git a/tools/libxc/xc_core.c b/tools/libs/ctrl/xc_core.c
similarity index 100%
rename from tools/libxc/xc_core.c
rename to tools/libs/ctrl/xc_core.c
diff --git a/tools/libxc/xc_core.h b/tools/libs/ctrl/xc_core.h
similarity index 100%
rename from tools/libxc/xc_core.h
rename to tools/libs/ctrl/xc_core.h
diff --git a/tools/libxc/xc_core_arm.c b/tools/libs/ctrl/xc_core_arm.c
similarity index 100%
rename from tools/libxc/xc_core_arm.c
rename to tools/libs/ctrl/xc_core_arm.c
diff --git a/tools/libxc/xc_core_arm.h b/tools/libs/ctrl/xc_core_arm.h
similarity index 100%
rename from tools/libxc/xc_core_arm.h
rename to tools/libs/ctrl/xc_core_arm.h
diff --git a/tools/libxc/xc_core_x86.c b/tools/libs/ctrl/xc_core_x86.c
similarity index 100%
rename from tools/libxc/xc_core_x86.c
rename to tools/libs/ctrl/xc_core_x86.c
diff --git a/tools/libxc/xc_core_x86.h b/tools/libs/ctrl/xc_core_x86.h
similarity index 100%
rename from tools/libxc/xc_core_x86.h
rename to tools/libs/ctrl/xc_core_x86.h
diff --git a/tools/libxc/xc_cpu_hotplug.c b/tools/libs/ctrl/xc_cpu_hotplug.c
similarity index 100%
rename from tools/libxc/xc_cpu_hotplug.c
rename to tools/libs/ctrl/xc_cpu_hotplug.c
diff --git a/tools/libxc/xc_cpupool.c b/tools/libs/ctrl/xc_cpupool.c
similarity index 100%
rename from tools/libxc/xc_cpupool.c
rename to tools/libs/ctrl/xc_cpupool.c
diff --git a/tools/libxc/xc_csched.c b/tools/libs/ctrl/xc_csched.c
similarity index 100%
rename from tools/libxc/xc_csched.c
rename to tools/libs/ctrl/xc_csched.c
diff --git a/tools/libxc/xc_csched2.c b/tools/libs/ctrl/xc_csched2.c
similarity index 100%
rename from tools/libxc/xc_csched2.c
rename to tools/libs/ctrl/xc_csched2.c
diff --git a/tools/libxc/xc_devicemodel_compat.c b/tools/libs/ctrl/xc_devicemodel_compat.c
similarity index 100%
rename from tools/libxc/xc_devicemodel_compat.c
rename to tools/libs/ctrl/xc_devicemodel_compat.c
diff --git a/tools/libxc/xc_domain.c b/tools/libs/ctrl/xc_domain.c
similarity index 100%
rename from tools/libxc/xc_domain.c
rename to tools/libs/ctrl/xc_domain.c
diff --git a/tools/libxc/xc_evtchn.c b/tools/libs/ctrl/xc_evtchn.c
similarity index 100%
rename from tools/libxc/xc_evtchn.c
rename to tools/libs/ctrl/xc_evtchn.c
diff --git a/tools/libxc/xc_evtchn_compat.c b/tools/libs/ctrl/xc_evtchn_compat.c
similarity index 100%
rename from tools/libxc/xc_evtchn_compat.c
rename to tools/libs/ctrl/xc_evtchn_compat.c
diff --git a/tools/libxc/xc_flask.c b/tools/libs/ctrl/xc_flask.c
similarity index 100%
rename from tools/libxc/xc_flask.c
rename to tools/libs/ctrl/xc_flask.c
diff --git a/tools/libxc/xc_foreign_memory.c b/tools/libs/ctrl/xc_foreign_memory.c
similarity index 100%
rename from tools/libxc/xc_foreign_memory.c
rename to tools/libs/ctrl/xc_foreign_memory.c
diff --git a/tools/libxc/xc_freebsd.c b/tools/libs/ctrl/xc_freebsd.c
similarity index 100%
rename from tools/libxc/xc_freebsd.c
rename to tools/libs/ctrl/xc_freebsd.c
diff --git a/tools/libxc/xc_gnttab.c b/tools/libs/ctrl/xc_gnttab.c
similarity index 100%
rename from tools/libxc/xc_gnttab.c
rename to tools/libs/ctrl/xc_gnttab.c
diff --git a/tools/libxc/xc_gnttab_compat.c b/tools/libs/ctrl/xc_gnttab_compat.c
similarity index 100%
rename from tools/libxc/xc_gnttab_compat.c
rename to tools/libs/ctrl/xc_gnttab_compat.c
diff --git a/tools/libxc/xc_hcall_buf.c b/tools/libs/ctrl/xc_hcall_buf.c
similarity index 100%
rename from tools/libxc/xc_hcall_buf.c
rename to tools/libs/ctrl/xc_hcall_buf.c
diff --git a/tools/libxc/xc_kexec.c b/tools/libs/ctrl/xc_kexec.c
similarity index 100%
rename from tools/libxc/xc_kexec.c
rename to tools/libs/ctrl/xc_kexec.c
diff --git a/tools/libxc/xc_linux.c b/tools/libs/ctrl/xc_linux.c
similarity index 100%
rename from tools/libxc/xc_linux.c
rename to tools/libs/ctrl/xc_linux.c
diff --git a/tools/libxc/xc_mem_access.c b/tools/libs/ctrl/xc_mem_access.c
similarity index 100%
rename from tools/libxc/xc_mem_access.c
rename to tools/libs/ctrl/xc_mem_access.c
diff --git a/tools/libxc/xc_mem_paging.c b/tools/libs/ctrl/xc_mem_paging.c
similarity index 100%
rename from tools/libxc/xc_mem_paging.c
rename to tools/libs/ctrl/xc_mem_paging.c
diff --git a/tools/libxc/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
similarity index 100%
rename from tools/libxc/xc_memshr.c
rename to tools/libs/ctrl/xc_memshr.c
diff --git a/tools/libxc/xc_minios.c b/tools/libs/ctrl/xc_minios.c
similarity index 100%
rename from tools/libxc/xc_minios.c
rename to tools/libs/ctrl/xc_minios.c
diff --git a/tools/libxc/xc_misc.c b/tools/libs/ctrl/xc_misc.c
similarity index 100%
rename from tools/libxc/xc_misc.c
rename to tools/libs/ctrl/xc_misc.c
diff --git a/tools/libxc/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
similarity index 100%
rename from tools/libxc/xc_monitor.c
rename to tools/libs/ctrl/xc_monitor.c
diff --git a/tools/libxc/xc_msr_x86.h b/tools/libs/ctrl/xc_msr_x86.h
similarity index 100%
rename from tools/libxc/xc_msr_x86.h
rename to tools/libs/ctrl/xc_msr_x86.h
diff --git a/tools/libxc/xc_netbsd.c b/tools/libs/ctrl/xc_netbsd.c
similarity index 100%
rename from tools/libxc/xc_netbsd.c
rename to tools/libs/ctrl/xc_netbsd.c
diff --git a/tools/libxc/xc_pagetab.c b/tools/libs/ctrl/xc_pagetab.c
similarity index 100%
rename from tools/libxc/xc_pagetab.c
rename to tools/libs/ctrl/xc_pagetab.c
diff --git a/tools/libxc/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
similarity index 100%
rename from tools/libxc/xc_physdev.c
rename to tools/libs/ctrl/xc_physdev.c
diff --git a/tools/libxc/xc_pm.c b/tools/libs/ctrl/xc_pm.c
similarity index 100%
rename from tools/libxc/xc_pm.c
rename to tools/libs/ctrl/xc_pm.c
diff --git a/tools/libxc/xc_private.c b/tools/libs/ctrl/xc_private.c
similarity index 100%
rename from tools/libxc/xc_private.c
rename to tools/libs/ctrl/xc_private.c
diff --git a/tools/libxc/xc_private.h b/tools/libs/ctrl/xc_private.h
similarity index 100%
rename from tools/libxc/xc_private.h
rename to tools/libs/ctrl/xc_private.h
diff --git a/tools/libxc/xc_psr.c b/tools/libs/ctrl/xc_psr.c
similarity index 100%
rename from tools/libxc/xc_psr.c
rename to tools/libs/ctrl/xc_psr.c
diff --git a/tools/libxc/xc_resource.c b/tools/libs/ctrl/xc_resource.c
similarity index 100%
rename from tools/libxc/xc_resource.c
rename to tools/libs/ctrl/xc_resource.c
diff --git a/tools/libxc/xc_resume.c b/tools/libs/ctrl/xc_resume.c
similarity index 100%
rename from tools/libxc/xc_resume.c
rename to tools/libs/ctrl/xc_resume.c
diff --git a/tools/libxc/xc_rt.c b/tools/libs/ctrl/xc_rt.c
similarity index 100%
rename from tools/libxc/xc_rt.c
rename to tools/libs/ctrl/xc_rt.c
diff --git a/tools/libxc/xc_solaris.c b/tools/libs/ctrl/xc_solaris.c
similarity index 100%
rename from tools/libxc/xc_solaris.c
rename to tools/libs/ctrl/xc_solaris.c
diff --git a/tools/libxc/xc_tbuf.c b/tools/libs/ctrl/xc_tbuf.c
similarity index 100%
rename from tools/libxc/xc_tbuf.c
rename to tools/libs/ctrl/xc_tbuf.c
diff --git a/tools/libxc/xc_vm_event.c b/tools/libs/ctrl/xc_vm_event.c
similarity index 100%
rename from tools/libxc/xc_vm_event.c
rename to tools/libs/ctrl/xc_vm_event.c
diff --git a/tools/libxc/xencontrol.pc.in b/tools/libs/ctrl/xenctrl.pc.in
similarity index 100%
rename from tools/libxc/xencontrol.pc.in
rename to tools/libs/ctrl/xenctrl.pc.in
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index 6f94b5bb4c..1312223093 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -9,47 +9,10 @@ ifeq ($(CONFIG_LIBXC_MINIOS),y)
 override CONFIG_MIGRATE := n
 endif
 
-CTRL_SRCS-y       :=
-CTRL_SRCS-y       += xc_altp2m.c
-CTRL_SRCS-y       += xc_core.c
-CTRL_SRCS-$(CONFIG_X86) += xc_core_x86.c
-CTRL_SRCS-$(CONFIG_ARM) += xc_core_arm.c
-CTRL_SRCS-y       += xc_cpupool.c
-CTRL_SRCS-y       += xc_domain.c
-CTRL_SRCS-y       += xc_evtchn.c
-CTRL_SRCS-y       += xc_gnttab.c
-CTRL_SRCS-y       += xc_misc.c
-CTRL_SRCS-y       += xc_flask.c
-CTRL_SRCS-y       += xc_physdev.c
-CTRL_SRCS-y       += xc_private.c
-CTRL_SRCS-y       += xc_csched.c
-CTRL_SRCS-y       += xc_csched2.c
-CTRL_SRCS-y       += xc_arinc653.c
-CTRL_SRCS-y       += xc_rt.c
-CTRL_SRCS-y       += xc_tbuf.c
-CTRL_SRCS-y       += xc_pm.c
-CTRL_SRCS-y       += xc_cpu_hotplug.c
-CTRL_SRCS-y       += xc_resume.c
-CTRL_SRCS-y       += xc_vm_event.c
-CTRL_SRCS-y       += xc_monitor.c
-CTRL_SRCS-y       += xc_mem_paging.c
-CTRL_SRCS-y       += xc_mem_access.c
-CTRL_SRCS-y       += xc_memshr.c
-CTRL_SRCS-y       += xc_hcall_buf.c
-CTRL_SRCS-y       += xc_foreign_memory.c
-CTRL_SRCS-y       += xc_kexec.c
-CTRL_SRCS-y       += xc_resource.c
-CTRL_SRCS-$(CONFIG_X86) += xc_psr.c
-CTRL_SRCS-$(CONFIG_X86) += xc_pagetab.c
-CTRL_SRCS-$(CONFIG_Linux) += xc_linux.c
-CTRL_SRCS-$(CONFIG_FreeBSD) += xc_freebsd.c
-CTRL_SRCS-$(CONFIG_SunOS) += xc_solaris.c
-CTRL_SRCS-$(CONFIG_NetBSD) += xc_netbsd.c
-CTRL_SRCS-$(CONFIG_NetBSDRump) += xc_netbsd.c
-CTRL_SRCS-$(CONFIG_MiniOS) += xc_minios.c
-CTRL_SRCS-y       += xc_evtchn_compat.c
-CTRL_SRCS-y       += xc_gnttab_compat.c
-CTRL_SRCS-y       += xc_devicemodel_compat.c
+LINK_FILES := xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bitops.h
+
+$(LINK_FILES):
+	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@
 
 GUEST_SRCS-y :=
 GUEST_SRCS-y += xg_private.c
@@ -124,26 +87,14 @@ CFLAGS	+= $(CFLAGS_libxentoollog)
 CFLAGS	+= $(CFLAGS_libxenevtchn)
 CFLAGS	+= $(CFLAGS_libxendevicemodel)
 
-CTRL_LIB_OBJS := $(patsubst %.c,%.o,$(CTRL_SRCS-y))
-CTRL_PIC_OBJS := $(patsubst %.c,%.opic,$(CTRL_SRCS-y))
-
 GUEST_LIB_OBJS := $(patsubst %.c,%.o,$(GUEST_SRCS-y))
 GUEST_PIC_OBJS := $(patsubst %.c,%.opic,$(GUEST_SRCS-y))
 
-$(CTRL_LIB_OBJS) $(GUEST_LIB_OBJS) \
-$(CTRL_PIC_OBJS) $(GUEST_PIC_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
+$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
 # libxenguest includes xc_private.h, so needs this despite not using
 # this functionality directly.
-$(CTRL_LIB_OBJS) $(GUEST_LIB_OBJS) \
-$(CTRL_PIC_OBJS) $(GUEST_PIC_OBJS): CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
-
-$(CTRL_LIB_OBJS) $(CTRL_PIC_OBJS): CFLAGS += $(CFLAGS_libxengnttab)
-
-LIB := libxenctrl.a
-ifneq ($(nosharedlibs),y)
-LIB += libxenctrl.so libxenctrl.so.$(MAJOR) libxenctrl.so.$(MAJOR).$(MINOR)
-endif
+$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): CFLAGS += $(CFLAGS_libxencall) $(CFLAGS_libxenforeignmemory)
 
 LIB += libxenguest.a
 ifneq ($(nosharedlibs),y)
@@ -155,10 +106,9 @@ $(eval $(genpath-target))
 
 xc_private.h: _paths.h
 
-$(CTRL_LIB_OBJS) $(GUEST_LIB_OBJS) \
-$(CTRL_PIC_OBJS) $(GUEST_PIC_OBJS): xc_private.h
+$(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS): $(LINK_FILES)
 
-PKG_CONFIG := xencontrol.pc xenguest.pc
+PKG_CONFIG := xenguest.pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
@@ -189,17 +139,11 @@ libs: $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_SHLIB) libxenctrl.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxenctrl.a $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
-	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenctrl.so
-	$(INSTALL_DATA) include/xenctrl.h include/xenctrl_compat.h include/xenctrl_dom.h $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
 	$(INSTALL_DATA) libxenguest.a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
 	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenguest.so
 	$(INSTALL_DATA) include/xenguest.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) xencontrol.pc $(DESTDIR)$(PKG_INSTALLDIR)
 	$(INSTALL_DATA) xenguest.pc $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
@@ -210,14 +154,6 @@ uninstall:
 	rm -f $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR).$(MINOR)
 	rm -f $(DESTDIR)$(libdir)/libxenguest.a
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xencontrol.pc
-	rm -f $(DESTDIR)$(includedir)/xenctrl.h
-	rm -f $(DESTDIR)$(includedir)/xenctrl_compat.h
-	rm -f $(DESTDIR)$(includedir)/xenctrl_dom.h
-	rm -f $(DESTDIR)$(libdir)/libxenctrl.so
-	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(libdir)/libxenctrl.a
 
 .PHONY: TAGS
 TAGS:
@@ -227,8 +163,8 @@ TAGS:
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) \
             _paths.h \
-	    xencontrol.pc xenguest.pc \
-            $(CTRL_LIB_OBJS) $(CTRL_PIC_OBJS) \
+	    $(LINK_FILES) \
+	    xenguest.pc \
             $(GUEST_LIB_OBJS) $(GUEST_PIC_OBJS)
 
 .PHONY: distclean
@@ -244,19 +180,6 @@ rpm: build
 	mv staging/i386/*.rpm .
 	rm -rf staging
 
-# libxenctrl
-
-libxenctrl.a: $(CTRL_LIB_OBJS)
-	$(AR) rc $@ $^
-
-libxenctrl.so: libxenctrl.so.$(MAJOR)
-	$(SYMLINK_SHLIB) $< $@
-libxenctrl.so.$(MAJOR): libxenctrl.so.$(MAJOR).$(MINOR)
-	$(SYMLINK_SHLIB) $< $@
-
-libxenctrl.so.$(MAJOR).$(MINOR): $(CTRL_PIC_OBJS)
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenctrl.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxencall) $(LDLIBS_libxenforeignmemory) $(LDLIBS_libxendevicemodel) $(PTHREAD_LIBS) $(APPEND_LDFLAGS)
-
 # libxenguest
 
 libxenguest.a: $(GUEST_LIB_OBJS)
@@ -277,7 +200,7 @@ xc_dom_bzimageloader.o: CFLAGS += $(filter -D%,$(zlib-options))
 xc_dom_bzimageloader.opic: CFLAGS += $(filter -D%,$(zlib-options))
 
 libxenguest.so.$(MAJOR).$(MINOR): COMPRESSION_LIBS = $(filter -l%,$(zlib-options))
-libxenguest.so.$(MAJOR).$(MINOR): $(GUEST_PIC_OBJS) libxenctrl.so
+libxenguest.so.$(MAJOR).$(MINOR): $(GUEST_PIC_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenguest.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(GUEST_PIC_OBJS) $(COMPRESSION_LIBS) -lz $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(PTHREAD_LIBS) $(APPEND_LDFLAGS)
 
 -include $(DEPS_INCLUDE)
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 38cd43abae..b1cd5d8ef2 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -188,7 +188,7 @@ libxl_dom.o: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
 libxl_x86_acpi.o: CFLAGS += -I$(XEN_ROOT)/tools
 
 SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
-$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn)
+$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 PKG_CONFIG = xenlight.pc xlutil.pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 4e2e8f3b17..7d37f297a9 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -6,6 +6,7 @@ CFLAGS += -Werror
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS += $(CFLAGS_libxenevtchn)
 CFLAGS += $(CFLAGS_libxenctrl)
+CFLAGS += $(CFLAGS_libxenguest)
 CFLAGS += $(CFLAGS_xeninclude)
 CFLAGS += $(CFLAGS_libxenstore)
 
diff --git a/tools/python/Makefile b/tools/python/Makefile
index 8d22c03676..bd3d62a36c 100644
--- a/tools/python/Makefile
+++ b/tools/python/Makefile
@@ -33,7 +33,7 @@ uninstall:
 
 .PHONY: test
 test:
-	LD_LIBRARY_PATH=$$(readlink -f ../libxc):$$(readlink -f ../xenstore) $(PYTHON) -m unittest discover
+	LD_LIBRARY_PATH=$$(readlink -f ../libs/ctrl):$$(readlink -f ../libxc):$$(readlink -f ../xenstore) $(PYTHON) -m unittest discover
 
 .PHONY: clean
 clean:
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8faf1c0ddc..24b284af39 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -9,7 +9,7 @@ extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
 PATH_XEN      = XEN_ROOT + "/tools/include"
 PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"
 PATH_LIBXENEVTCHN = XEN_ROOT + "/tools/libs/evtchn"
-PATH_LIBXC    = XEN_ROOT + "/tools/libxc"
+PATH_LIBXENCTRL = XEN_ROOT + "/tools/libs/ctrl"
 PATH_LIBXL    = XEN_ROOT + "/tools/libxl"
 PATH_XENSTORE = XEN_ROOT + "/tools/xenstore"
 
@@ -18,11 +18,11 @@ xc = Extension("xc",
                include_dirs       = [ PATH_XEN,
                                       PATH_LIBXENTOOLLOG + "/include",
                                       PATH_LIBXENEVTCHN + "/include",
-                                      PATH_LIBXC + "/include",
+                                      PATH_LIBXENCTRL + "/include",
                                       "xen/lowlevel/xc" ],
-               library_dirs       = [ PATH_LIBXC ],
-               libraries          = [ "xenctrl", "xenguest" ],
-               depends            = [ PATH_LIBXC + "/libxenctrl.so", PATH_LIBXC + "/libxenguest.so" ],
+               library_dirs       = [ PATH_LIBXENCTRL ],
+               libraries          = [ "xenctrl" ],
+               depends            = [ PATH_LIBXENCTRL + "/libxenctrl.so" ],
                extra_link_args    = [ "-Wl,-rpath-link="+PATH_LIBXENTOOLLOG ],
                sources            = [ "xen/lowlevel/xc/xc.c" ])
 
-- 
2.20.1


