Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD66221243
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkEY-0002oT-OR; Wed, 15 Jul 2020 16:26:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkEW-0002Yi-B3
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:26:12 +0000
X-Inumbo-ID: d157443c-c6b7-11ea-b7bb-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d157443c-c6b7-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:38 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDx-0001sU-JK; Wed, 15 Jul 2020 17:25:37 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 07/12] tools/libxc: untangle libxenctrl from libxenguest
Date: Wed, 15 Jul 2020 17:25:06 +0100
Message-Id: <20200715162511.5941-9-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 ian.jackson@eu.citrix.com, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

Sources of libxenctrl and libxenguest are completely entangled. In
practice libxenguest is a user of libxenctrl, so don't let any source
libxenctrl include xg_private.h.

This can be achieved by moving all definitions used by libxenctrl from
xg_private.h to xc_private.h. Additionally xc_dom.h needs to be
exported, so rename it to xenctrl_dom.h.

Rename all libxenguest sources from xc_* to xg_*.

Move xc_[un]map_domain_meminfo() fnctions to new source xg_domain.c as
they are defined in include/xenguest.h and should be in libxenguest.

Remove xc_efi.h and xc_elf.h as they aren't used anywhere.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/grub/kexec.c                          |   2 +-
 tools/helpers/init-xenstore-domain.c          |   2 +-
 tools/libxc/Makefile                          |  64 +++----
 .../libxc/include/{xc_dom.h => xenctrl_dom.h} |  10 +-
 tools/libxc/include/xenguest.h                |   8 +-
 tools/libxc/xc_core.c                         |   5 +-
 tools/libxc/xc_core.h                         |   2 +-
 tools/libxc/xc_core_arm.c                     |   2 +-
 tools/libxc/xc_core_x86.c                     |   6 +-
 tools/libxc/xc_domain.c                       | 129 +-------------
 tools/libxc/xc_efi.h                          | 158 ------------------
 tools/libxc/xc_elf.h                          |  16 --
 tools/libxc/xc_hcall_buf.c                    |   1 -
 tools/libxc/xc_private.c                      |   3 +-
 tools/libxc/xc_private.h                      |  36 ++++
 tools/libxc/xc_resume.c                       |   2 -
 .../libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c}  |   0
 tools/libxc/{xc_dom_arm.c => xg_dom_arm.c}    |   2 +-
 ...imageloader.c => xg_dom_armzimageloader.c} |   2 +-
 ...{xc_dom_binloader.c => xg_dom_binloader.c} |   2 +-
 tools/libxc/{xc_dom_boot.c => xg_dom_boot.c}  |   2 +-
 ...bzimageloader.c => xg_dom_bzimageloader.c} |   2 +-
 ...m_compat_linux.c => xg_dom_compat_linux.c} |   2 +-
 tools/libxc/{xc_dom_core.c => xg_dom_core.c}  |   2 +-
 ...c_dom_decompress.h => xg_dom_decompress.h} |   4 +-
 ...compress_lz4.c => xg_dom_decompress_lz4.c} |   2 +-
 ...ss_unsafe.c => xg_dom_decompress_unsafe.c} |   2 +-
 ...ss_unsafe.h => xg_dom_decompress_unsafe.h} |   2 +-
 ...ip2.c => xg_dom_decompress_unsafe_bzip2.c} |   2 +-
 ...lzma.c => xg_dom_decompress_unsafe_lzma.c} |   2 +-
 ...o1x.c => xg_dom_decompress_unsafe_lzo1x.c} |   2 +-
 ...afe_xz.c => xg_dom_decompress_unsafe_xz.c} |   2 +-
 ...{xc_dom_elfloader.c => xg_dom_elfloader.c} |   2 +-
 ...{xc_dom_hvmloader.c => xg_dom_hvmloader.c} |   2 +-
 tools/libxc/{xc_dom_x86.c => xg_dom_x86.c}    |   2 +-
 tools/libxc/xg_domain.c                       | 149 +++++++++++++++++
 .../libxc/{xc_nomigrate.c => xg_nomigrate.c}  |   0
 .../{xc_offline_page.c => xg_offline_page.c}  |   2 +-
 tools/libxc/xg_private.h                      |  22 ---
 tools/libxc/xg_save_restore.h                 |   9 -
 .../libxc/{xc_sr_common.c => xg_sr_common.c}  |   2 +-
 .../libxc/{xc_sr_common.h => xg_sr_common.h}  |   4 +-
 ...{xc_sr_common_x86.c => xg_sr_common_x86.c} |   2 +-
 ...{xc_sr_common_x86.h => xg_sr_common_x86.h} |   2 +-
 ..._common_x86_pv.c => xg_sr_common_x86_pv.c} |   2 +-
 ..._common_x86_pv.h => xg_sr_common_x86_pv.h} |   2 +-
 .../{xc_sr_restore.c => xg_sr_restore.c}      |   2 +-
 ...tore_x86_hvm.c => xg_sr_restore_x86_hvm.c} |   2 +-
 ...estore_x86_pv.c => xg_sr_restore_x86_pv.c} |   2 +-
 tools/libxc/{xc_sr_save.c => xg_sr_save.c}    |   2 +-
 ...sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} |   2 +-
 ...c_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} |   2 +-
 ..._stream_format.h => xg_sr_stream_format.h} |   0
 tools/libxc/{xc_suspend.c => xg_suspend.c}    |   0
 tools/libxl/libxl_arm.c                       |   2 +-
 tools/libxl/libxl_arm.h                       |   2 +-
 tools/libxl/libxl_create.c                    |   2 +-
 tools/libxl/libxl_dm.c                        |   2 +-
 tools/libxl/libxl_dom.c                       |   2 +-
 tools/libxl/libxl_internal.h                  |   2 +-
 tools/libxl/libxl_vnuma.c                     |   2 +-
 tools/libxl/libxl_x86.c                       |   2 +-
 tools/libxl/libxl_x86_acpi.c                  |   2 +-
 tools/python/xen/lowlevel/xc/xc.c             |   2 +-
 tools/xcutils/readnotes.c                     |   2 +-
 65 files changed, 284 insertions(+), 430 deletions(-)
 rename tools/libxc/include/{xc_dom.h => xenctrl_dom.h} (98%)
 delete mode 100644 tools/libxc/xc_efi.h
 delete mode 100644 tools/libxc/xc_elf.h
 rename tools/libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c} (100%)
 rename tools/libxc/{xc_dom_arm.c => xg_dom_arm.c} (99%)
 rename tools/libxc/{xc_dom_armzimageloader.c => xg_dom_armzimageloader.c} (99%)
 rename tools/libxc/{xc_dom_binloader.c => xg_dom_binloader.c} (99%)
 rename tools/libxc/{xc_dom_boot.c => xg_dom_boot.c} (99%)
 rename tools/libxc/{xc_dom_bzimageloader.c => xg_dom_bzimageloader.c} (99%)
 rename tools/libxc/{xc_dom_compat_linux.c => xg_dom_compat_linux.c} (99%)
 rename tools/libxc/{xc_dom_core.c => xg_dom_core.c} (99%)
 rename tools/libxc/{xc_dom_decompress.h => xg_dom_decompress.h} (62%)
 rename tools/libxc/{xc_dom_decompress_lz4.c => xg_dom_decompress_lz4.c} (98%)
 rename tools/libxc/{xc_dom_decompress_unsafe.c => xg_dom_decompress_unsafe.c} (96%)
 rename tools/libxc/{xc_dom_decompress_unsafe.h => xg_dom_decompress_unsafe.h} (97%)
 rename tools/libxc/{xc_dom_decompress_unsafe_bzip2.c => xg_dom_decompress_unsafe_bzip2.c} (87%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzma.c => xg_dom_decompress_unsafe_lzma.c} (87%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzo1x.c => xg_dom_decompress_unsafe_lzo1x.c} (96%)
 rename tools/libxc/{xc_dom_decompress_unsafe_xz.c => xg_dom_decompress_unsafe_xz.c} (95%)
 rename tools/libxc/{xc_dom_elfloader.c => xg_dom_elfloader.c} (99%)
 rename tools/libxc/{xc_dom_hvmloader.c => xg_dom_hvmloader.c} (99%)
 rename tools/libxc/{xc_dom_x86.c => xg_dom_x86.c} (99%)
 create mode 100644 tools/libxc/xg_domain.c
 rename tools/libxc/{xc_nomigrate.c => xg_nomigrate.c} (100%)
 rename tools/libxc/{xc_offline_page.c => xg_offline_page.c} (99%)
 rename tools/libxc/{xc_sr_common.c => xg_sr_common.c} (99%)
 rename tools/libxc/{xc_sr_common.h => xg_sr_common.h} (99%)
 rename tools/libxc/{xc_sr_common_x86.c => xg_sr_common_x86.c} (99%)
 rename tools/libxc/{xc_sr_common_x86.h => xg_sr_common_x86.h} (98%)
 rename tools/libxc/{xc_sr_common_x86_pv.c => xg_sr_common_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_common_x86_pv.h => xg_sr_common_x86_pv.h} (98%)
 rename tools/libxc/{xc_sr_restore.c => xg_sr_restore.c} (99%)
 rename tools/libxc/{xc_sr_restore_x86_hvm.c => xg_sr_restore_x86_hvm.c} (99%)
 rename tools/libxc/{xc_sr_restore_x86_pv.c => xg_sr_restore_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_save.c => xg_sr_save.c} (99%)
 rename tools/libxc/{xc_sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} (99%)
 rename tools/libxc/{xc_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} (99%)
 rename tools/libxc/{xc_sr_stream_format.h => xg_sr_stream_format.h} (100%)
 rename tools/libxc/{xc_suspend.c => xg_suspend.c} (100%)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index 0e68b969a2..24001220a9 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -20,7 +20,7 @@
 #include <sys/mman.h>
 
 #include <xenctrl.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 #include <kernel.h>
 #include <console.h>
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 4ce8299c3c..5bdb48dc80 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -8,7 +8,7 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <xenctrl.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xenstore.h>
 #include <xen/sys/xenbus_dev.h>
 #include <xen-xsm/flask/flask.h>
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index 1e64116bd4..6f94b5bb4c 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -52,20 +52,22 @@ CTRL_SRCS-y       += xc_gnttab_compat.c
 CTRL_SRCS-y       += xc_devicemodel_compat.c
 
 GUEST_SRCS-y :=
-GUEST_SRCS-y += xg_private.c xc_suspend.c
+GUEST_SRCS-y += xg_private.c
+GUEST_SRCS-y += xg_domain.c
+GUEST_SRCS-y += xg_suspend.c
 ifeq ($(CONFIG_MIGRATE),y)
-GUEST_SRCS-y += xc_sr_common.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_hvm.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_hvm.c
-GUEST_SRCS-y += xc_sr_restore.c
-GUEST_SRCS-y += xc_sr_save.c
-GUEST_SRCS-y += xc_offline_page.c
+GUEST_SRCS-y += xg_sr_common.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
+GUEST_SRCS-y += xg_sr_restore.c
+GUEST_SRCS-y += xg_sr_save.c
+GUEST_SRCS-y += xg_offline_page.c
 else
-GUEST_SRCS-y += xc_nomigrate.c
+GUEST_SRCS-y += xg_nomigrate.c
 endif
 
 vpath %.c ../../xen/common/libelf
@@ -86,25 +88,26 @@ GUEST_SRCS-y                 += cpuid.c msr.c
 endif
 
 # new domain builder
-GUEST_SRCS-y                 += xc_dom_core.c xc_dom_boot.c
-GUEST_SRCS-y                 += xc_dom_elfloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_bzimageloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_decompress_lz4.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_hvmloader.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_armzimageloader.c
-GUEST_SRCS-y                 += xc_dom_binloader.c
-GUEST_SRCS-y                 += xc_dom_compat_linux.c
-
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_x86.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_cpuid_x86.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_arm.c
+GUEST_SRCS-y                 += xg_dom_core.c
+GUEST_SRCS-y                 += xg_dom_boot.c
+GUEST_SRCS-y                 += xg_dom_elfloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
+GUEST_SRCS-y                 += xg_dom_binloader.c
+GUEST_SRCS-y                 += xg_dom_compat_linux.c
+
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_x86.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_bzip2.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzma.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzo1x.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_xz.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_xz.c
 endif
 
 -include $(XEN_TARGET_ARCH)/Makefile
@@ -190,7 +193,7 @@ install: build
 	$(INSTALL_DATA) libxenctrl.a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
 	$(SYMLINK_SHLIB) libxenctrl.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenctrl.so
-	$(INSTALL_DATA) include/xenctrl.h include/xenctrl_compat.h $(DESTDIR)$(includedir)
+	$(INSTALL_DATA) include/xenctrl.h include/xenctrl_compat.h include/xenctrl_dom.h $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
 	$(INSTALL_DATA) libxenguest.a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxenguest.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenguest.so.$(MAJOR)
@@ -210,6 +213,7 @@ uninstall:
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xencontrol.pc
 	rm -f $(DESTDIR)$(includedir)/xenctrl.h
 	rm -f $(DESTDIR)$(includedir)/xenctrl_compat.h
+	rm -f $(DESTDIR)$(includedir)/xenctrl_dom.h
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxenctrl.so.$(MAJOR).$(MINOR)
diff --git a/tools/libxc/include/xc_dom.h b/tools/libxc/include/xenctrl_dom.h
similarity index 98%
rename from tools/libxc/include/xc_dom.h
rename to tools/libxc/include/xenctrl_dom.h
index 52a4d6c8c0..40b85b7755 100644
--- a/tools/libxc/include/xc_dom.h
+++ b/tools/libxc/include/xenctrl_dom.h
@@ -17,9 +17,7 @@
 #define _XC_DOM_H
 
 #include <xen/libelf/libelf.h>
-#include <xenguest.h>
 
-#define INVALID_PFN ((xen_pfn_t)-1)
 #define X86_HVM_NR_SPECIAL_PAGES    8
 #define X86_HVM_END_SPECIAL_REGION  0xff000u
 #define XG_MAX_MODULES 2
@@ -38,6 +36,12 @@ struct xc_dom_seg {
     xen_pfn_t pages;
 };
 
+struct xc_hvm_firmware_module {
+    uint8_t  *data;
+    uint32_t  length;
+    uint64_t  guest_addr_out;
+};
+
 struct xc_dom_mem {
     struct xc_dom_mem *next;
     void *ptr;
@@ -255,6 +259,8 @@ struct xc_dom_arch {
     int (*setup_pgtables) (struct xc_dom_image * dom);
 
     /* arch-specific data structs setup */
+    /* in Mini-OS environment start_info might be a macro, avoid collision. */
+#undef start_info
     int (*start_info) (struct xc_dom_image * dom);
     int (*shared_info) (struct xc_dom_image * dom, void *shared_info);
     int (*vcpu) (struct xc_dom_image * dom);
diff --git a/tools/libxc/include/xenguest.h b/tools/libxc/include/xenguest.h
index 7a12d21ff2..4643384790 100644
--- a/tools/libxc/include/xenguest.h
+++ b/tools/libxc/include/xenguest.h
@@ -22,6 +22,8 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
+#include <xenctrl_dom.h>
+
 #define XC_NUMA_NO_NODE   (~0U)
 
 #define XCFLAGS_LIVE      (1 << 0)
@@ -249,12 +251,6 @@ int xc_linux_build(xc_interface *xch,
                    unsigned int console_evtchn,
                    unsigned long *console_mfn);
 
-struct xc_hvm_firmware_module {
-    uint8_t  *data;
-    uint32_t  length;
-    uint64_t  guest_addr_out;
-};
-
 /*
  * Sets *lockfd to -1.
  * Has deallocated everything even on error.
diff --git a/tools/libxc/xc_core.c b/tools/libxc/xc_core.c
index 2ee1d205b4..e8c6fb96f9 100644
--- a/tools/libxc/xc_core.c
+++ b/tools/libxc/xc_core.c
@@ -60,12 +60,13 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
-#include "xc_dom.h"
 #include <stdlib.h>
 #include <unistd.h>
 
+#include <xen/libelf/libelf.h>
+
 /* number of pages to write at a time */
 #define DUMP_INCREMENT (4 * 1024)
 
diff --git a/tools/libxc/xc_core.h b/tools/libxc/xc_core.h
index ed7ed53ca5..36fb755da2 100644
--- a/tools/libxc/xc_core.h
+++ b/tools/libxc/xc_core.h
@@ -21,7 +21,7 @@
 #define XC_CORE_H
 
 #include "xen/version.h"
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xen/libelf/elfstructs.h"
 
 /* section names */
diff --git a/tools/libxc/xc_core_arm.c b/tools/libxc/xc_core_arm.c
index c3c492c971..7b587b4cc5 100644
--- a/tools/libxc/xc_core_arm.c
+++ b/tools/libxc/xc_core_arm.c
@@ -16,7 +16,7 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
 
 #include <xen-tools/libs.h>
diff --git a/tools/libxc/xc_core_x86.c b/tools/libxc/xc_core_x86.c
index 54852a2d1a..cb76e6207b 100644
--- a/tools/libxc/xc_core_x86.c
+++ b/tools/libxc/xc_core_x86.c
@@ -17,12 +17,10 @@
  *
  */
 
-#include "xg_private.h"
+#include "xc_private.h"
 #include "xc_core.h"
 #include <xen/hvm/e820.h>
 
-#define GET_FIELD(_p, _f) ((dinfo->guest_width==8) ? ((_p)->x64._f) : ((_p)->x32._f))
-
 int
 xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
                               unsigned long pfn)
@@ -98,7 +96,7 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc
 
     live_p2m_frame_list_list =
         xc_map_foreign_range(xch, dom, PAGE_SIZE, PROT_READ,
-                             GET_FIELD(live_shinfo, arch.pfn_to_mfn_frame_list_list));
+                             GET_FIELD(live_shinfo, arch.pfn_to_mfn_frame_list_list, dinfo->guest_width));
 
     if ( !live_p2m_frame_list_list )
     {
diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
index 71829c2bce..43fab50c06 100644
--- a/tools/libxc/xc_domain.c
+++ b/tools/libxc/xc_domain.c
@@ -21,8 +21,7 @@
 
 #include "xc_private.h"
 #include "xc_core.h"
-#include "xg_private.h"
-#include "xg_save_restore.h"
+#include "xc_private.h"
 #include <xen/memory.h>
 #include <xen/hvm/hvm_op.h>
 
@@ -1892,132 +1891,6 @@ int xc_domain_unbind_pt_spi_irq(xc_interface *xch,
                                         PT_IRQ_TYPE_SPI, 0, 0, 0, 0, spi));
 }
 
-int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
-{
-    struct domain_info_context _di = { .guest_width = minfo->guest_width,
-                                       .p2m_size = minfo->p2m_size};
-    struct domain_info_context *dinfo = &_di;
-
-    free(minfo->pfn_type);
-    if ( minfo->p2m_table )
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
-    minfo->p2m_table = NULL;
-
-    return 0;
-}
-
-int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
-                          struct xc_domain_meminfo *minfo)
-{
-    struct domain_info_context _di;
-    struct domain_info_context *dinfo = &_di;
-
-    xc_dominfo_t info;
-    shared_info_any_t *live_shinfo;
-    xen_capabilities_info_t xen_caps = "";
-    int i;
-
-    /* Only be initialized once */
-    if ( minfo->pfn_type || minfo->p2m_table )
-    {
-        errno = EINVAL;
-        return -1;
-    }
-
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
-    {
-        PERROR("Could not get domain info");
-        return -1;
-    }
-
-    if ( xc_domain_get_guest_width(xch, domid, &minfo->guest_width) )
-    {
-        PERROR("Could not get domain address size");
-        return -1;
-    }
-    _di.guest_width = minfo->guest_width;
-
-    /* Get page table levels (see get_platform_info() in xg_save_restore.h */
-    if ( xc_version(xch, XENVER_capabilities, &xen_caps) )
-    {
-        PERROR("Could not get Xen capabilities (for page table levels)");
-        return -1;
-    }
-    if ( strstr(xen_caps, "xen-3.0-x86_64") )
-        /* Depends on whether it's a compat 32-on-64 guest */
-        minfo->pt_levels = ( (minfo->guest_width == 8) ? 4 : 3 );
-    else if ( strstr(xen_caps, "xen-3.0-x86_32p") )
-        minfo->pt_levels = 3;
-    else if ( strstr(xen_caps, "xen-3.0-x86_32") )
-        minfo->pt_levels = 2;
-    else
-    {
-        errno = EFAULT;
-        return -1;
-    }
-
-    /* We need the shared info page for mapping the P2M */
-    live_shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
-                                       info.shared_info_frame);
-    if ( !live_shinfo )
-    {
-        PERROR("Could not map the shared info frame (MFN 0x%lx)",
-               info.shared_info_frame);
-        return -1;
-    }
-
-    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,
-                                       live_shinfo, &minfo->p2m_table,
-                                       &minfo->p2m_size) )
-    {
-        PERROR("Could not map the P2M table");
-        munmap(live_shinfo, PAGE_SIZE);
-        return -1;
-    }
-    munmap(live_shinfo, PAGE_SIZE);
-    _di.p2m_size = minfo->p2m_size;
-
-    /* Make space and prepare for getting the PFN types */
-    minfo->pfn_type = calloc(sizeof(*minfo->pfn_type), minfo->p2m_size);
-    if ( !minfo->pfn_type )
-    {
-        PERROR("Could not allocate memory for the PFN types");
-        goto failed;
-    }
-    for ( i = 0; i < minfo->p2m_size; i++ )
-        minfo->pfn_type[i] = xc_pfn_to_mfn(i, minfo->p2m_table,
-                                           minfo->guest_width);
-
-    /* Retrieve PFN types in batches */
-    for ( i = 0; i < minfo->p2m_size ; i+=1024 )
-    {
-        int count = ((minfo->p2m_size - i ) > 1024 ) ?
-                        1024: (minfo->p2m_size - i);
-
-        if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
-        {
-            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
-            goto failed;
-        }
-    }
-
-    return 0;
-
-failed:
-    if ( minfo->pfn_type )
-    {
-        free(minfo->pfn_type);
-        minfo->pfn_type = NULL;
-    }
-    if ( minfo->p2m_table )
-    {
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
-        minfo->p2m_table = NULL;
-    }
-
-    return -1;
-}
-
 int xc_domain_memory_mapping(
     xc_interface *xch,
     uint32_t domid,
diff --git a/tools/libxc/xc_efi.h b/tools/libxc/xc_efi.h
deleted file mode 100644
index dbe105be8f..0000000000
--- a/tools/libxc/xc_efi.h
+++ /dev/null
@@ -1,158 +0,0 @@
-/*
- * Extensible Firmware Interface
- * Based on 'Extensible Firmware Interface Specification' version 0.9, April 30, 1999
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation;
- * version 2.1 of the License.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Copyright (C) 1999 VA Linux Systems
- * Copyright (C) 1999 Walt Drummond <drummond@valinux.com>
- * Copyright (C) 1999, 2002-2003 Hewlett-Packard Co.
- *      David Mosberger-Tang <davidm@hpl.hp.com>
- *      Stephane Eranian <eranian@hpl.hp.com>
- */
-
-#ifndef XC_EFI_H
-#define XC_EFI_H
-
-/* definitions from xen/include/asm-ia64/linux-xen/linux/efi.h */
-
-typedef struct {
-        uint8_t b[16];
-} efi_guid_t;
-
-#define EFI_GUID(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7) \
-((efi_guid_t) \
-{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
-  (b) & 0xff, ((b) >> 8) & 0xff, \
-  (c) & 0xff, ((c) >> 8) & 0xff, \
-  (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
-
-/*
- * Generic EFI table header
- */
-typedef struct {
-	uint64_t signature;
-	uint32_t revision;
-	uint32_t headersize;
-	uint32_t crc32;
-	uint32_t reserved;
-} efi_table_hdr_t;
-
-/*
- * Memory map descriptor:
- */
-
-/* Memory types: */
-#define EFI_RESERVED_TYPE                0
-#define EFI_LOADER_CODE                  1
-#define EFI_LOADER_DATA                  2
-#define EFI_BOOT_SERVICES_CODE           3
-#define EFI_BOOT_SERVICES_DATA           4
-#define EFI_RUNTIME_SERVICES_CODE        5
-#define EFI_RUNTIME_SERVICES_DATA        6
-#define EFI_CONVENTIONAL_MEMORY          7
-#define EFI_UNUSABLE_MEMORY              8
-#define EFI_ACPI_RECLAIM_MEMORY          9
-#define EFI_ACPI_MEMORY_NVS             10
-#define EFI_MEMORY_MAPPED_IO            11
-#define EFI_MEMORY_MAPPED_IO_PORT_SPACE 12
-#define EFI_PAL_CODE                    13
-#define EFI_MAX_MEMORY_TYPE             14
-
-/* Attribute values: */
-#define EFI_MEMORY_UC           ((uint64_t)0x0000000000000001ULL)    /* uncached */
-#define EFI_MEMORY_WC           ((uint64_t)0x0000000000000002ULL)    /* write-coalescing */
-#define EFI_MEMORY_WT           ((uint64_t)0x0000000000000004ULL)    /* write-through */
-#define EFI_MEMORY_WB           ((uint64_t)0x0000000000000008ULL)    /* write-back */
-#define EFI_MEMORY_WP           ((uint64_t)0x0000000000001000ULL)    /* write-protect */
-#define EFI_MEMORY_RP           ((uint64_t)0x0000000000002000ULL)    /* read-protect */
-#define EFI_MEMORY_XP           ((uint64_t)0x0000000000004000ULL)    /* execute-protect */
-#define EFI_MEMORY_RUNTIME      ((uint64_t)0x8000000000000000ULL)    /* range requires runtime mapping */
-#define EFI_MEMORY_DESCRIPTOR_VERSION   1
-
-#define EFI_PAGE_SHIFT          12
-
-/*
- * For current x86 implementations of EFI, there is
- * additional padding in the mem descriptors.  This is not
- * the case in ia64.  Need to have this fixed in the f/w.
- */
-typedef struct {
-        uint32_t type;
-        uint32_t pad;
-        uint64_t phys_addr;
-        uint64_t virt_addr;
-        uint64_t num_pages;
-        uint64_t attribute;
-#if defined (__i386__)
-        uint64_t pad1;
-#endif
-} efi_memory_desc_t;
-
-/*
- * EFI Runtime Services table
- */
-#define EFI_RUNTIME_SERVICES_SIGNATURE	((uint64_t)0x5652453544e5552ULL)
-#define EFI_RUNTIME_SERVICES_REVISION	0x00010000
-
-typedef struct {
-	efi_table_hdr_t hdr;
-	unsigned long get_time;
-	unsigned long set_time;
-	unsigned long get_wakeup_time;
-	unsigned long set_wakeup_time;
-	unsigned long set_virtual_address_map;
-	unsigned long convert_pointer;
-	unsigned long get_variable;
-	unsigned long get_next_variable;
-	unsigned long set_variable;
-	unsigned long get_next_high_mono_count;
-	unsigned long reset_system;
-} efi_runtime_services_t;
-
-/*
- *  EFI Configuration Table and GUID definitions
- */
-#define NULL_GUID \
-    EFI_GUID(  0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 )
-#define ACPI_20_TABLE_GUID    \
-    EFI_GUID(  0x8868e871, 0xe4f1, 0x11d3, 0xbc, 0x22, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81 )
-#define SAL_SYSTEM_TABLE_GUID    \
-    EFI_GUID(  0xeb9d2d32, 0x2d88, 0x11d3, 0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d )
-
-typedef struct {
-	efi_guid_t guid;
-	unsigned long table;
-} efi_config_table_t;
-
-#define EFI_SYSTEM_TABLE_SIGNATURE ((uint64_t)0x5453595320494249ULL)
-#define EFI_SYSTEM_TABLE_REVISION  ((1 << 16) | 00)
-
-typedef struct {
-	efi_table_hdr_t hdr;
-	unsigned long fw_vendor;	/* physical addr of CHAR16 vendor string */
-	uint32_t fw_revision;
-	unsigned long con_in_handle;
-	unsigned long con_in;
-	unsigned long con_out_handle;
-	unsigned long con_out;
-	unsigned long stderr_handle;
-	unsigned long stderr;
-	efi_runtime_services_t *runtime;
-	unsigned long boottime;
-	unsigned long nr_tables;
-	unsigned long tables;
-} efi_system_table_t;
-
-#endif /* XC_EFI_H */
diff --git a/tools/libxc/xc_elf.h b/tools/libxc/xc_elf.h
deleted file mode 100644
index acbc0280bd..0000000000
--- a/tools/libxc/xc_elf.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation;
- * version 2.1 of the License.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <xen/libelf/elfstructs.h>
diff --git a/tools/libxc/xc_hcall_buf.c b/tools/libxc/xc_hcall_buf.c
index c1230a1e2b..200671f36f 100644
--- a/tools/libxc/xc_hcall_buf.c
+++ b/tools/libxc/xc_hcall_buf.c
@@ -19,7 +19,6 @@
 #include <string.h>
 
 #include "xc_private.h"
-#include "xg_private.h"
 
 xc_hypercall_buffer_t XC__HYPERCALL_BUFFER_NAME(HYPERCALL_BUFFER_NULL) = {
     .hbuf = NULL,
diff --git a/tools/libxc/xc_private.c b/tools/libxc/xc_private.c
index 90974d572e..8af96b1b7e 100644
--- a/tools/libxc/xc_private.c
+++ b/tools/libxc/xc_private.c
@@ -18,8 +18,7 @@
  */
 
 #include "xc_private.h"
-#include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include <stdarg.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/libxc/xc_private.h b/tools/libxc/xc_private.h
index c77edb3c4c..f0b5f83ac8 100644
--- a/tools/libxc/xc_private.h
+++ b/tools/libxc/xc_private.h
@@ -26,6 +26,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <stdlib.h>
+#include <limits.h>
 #include <sys/ioctl.h>
 
 #include "_paths.h"
@@ -62,6 +63,39 @@ struct iovec {
 #include <sys/uio.h>
 #endif
 
+#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
+
+#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
+
+#define SET_FIELD(_p, _f, _v, _w) do {          \
+    if ((_w) == 8)                              \
+        (_p)->x64._f = (_v);                    \
+    else                                        \
+        (_p)->x32._f = (_v);                    \
+} while (0)
+
+/* XXX SMH: following skanky macros rely on variable p2m_size being set */
+/* XXX TJD: also, "guest_width" should be the guest's sizeof(unsigned long) */
+
+struct domain_info_context {
+    unsigned int guest_width;
+    unsigned long p2m_size;
+};
+
+/* Number of xen_pfn_t in a page */
+#define FPP             (PAGE_SIZE/(dinfo->guest_width))
+
+/* Number of entries in the pfn_to_mfn_frame_list_list */
+#define P2M_FLL_ENTRIES (((dinfo->p2m_size)+(FPP*FPP)-1)/(FPP*FPP))
+
+/* Number of entries in the pfn_to_mfn_frame_list */
+#define P2M_FL_ENTRIES  (((dinfo->p2m_size)+FPP-1)/FPP)
+
+/* Size in bytes of the pfn_to_mfn_frame_list     */
+#define P2M_GUEST_FL_SIZE ((P2M_FL_ENTRIES) * (dinfo->guest_width))
+#define P2M_TOOLS_FL_SIZE ((P2M_FL_ENTRIES) *                           \
+                           max_t(size_t, sizeof(xen_pfn_t), dinfo->guest_width))
+
 #define DECLARE_DOMCTL struct xen_domctl domctl
 #define DECLARE_SYSCTL struct xen_sysctl sysctl
 #define DECLARE_PHYSDEV_OP struct physdev_op physdev_op
@@ -75,6 +109,8 @@ struct iovec {
 #define PAGE_SIZE               XC_PAGE_SIZE
 #define PAGE_MASK               XC_PAGE_MASK
 
+#define INVALID_PFN ((xen_pfn_t)-1)
+
 /*
 ** Define max dirty page cache to permit during save/restore -- need to balance 
 ** keeping cache usage down with CPU impact of invalidating too often.
diff --git a/tools/libxc/xc_resume.c b/tools/libxc/xc_resume.c
index c169204fac..94c6c9fb31 100644
--- a/tools/libxc/xc_resume.c
+++ b/tools/libxc/xc_resume.c
@@ -14,8 +14,6 @@
  */
 
 #include "xc_private.h"
-#include "xg_private.h"
-#include "xg_save_restore.h"
 
 #if defined(__i386__) || defined(__x86_64__)
 
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xg_cpuid_x86.c
similarity index 100%
rename from tools/libxc/xc_cpuid_x86.c
rename to tools/libxc/xg_cpuid_x86.c
diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xg_dom_arm.c
similarity index 99%
rename from tools/libxc/xc_dom_arm.c
rename to tools/libxc/xg_dom_arm.c
index 931404c222..3f66f1d890 100644
--- a/tools/libxc/xc_dom_arm.c
+++ b/tools/libxc/xg_dom_arm.c
@@ -24,7 +24,7 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #define NR_MAGIC_PAGES 4
 #define CONSOLE_PFN_OFFSET 0
diff --git a/tools/libxc/xc_dom_armzimageloader.c b/tools/libxc/xg_dom_armzimageloader.c
similarity index 99%
rename from tools/libxc/xc_dom_armzimageloader.c
rename to tools/libxc/xg_dom_armzimageloader.c
index 0df8c2a4b1..4246c8e5fa 100644
--- a/tools/libxc/xc_dom_armzimageloader.c
+++ b/tools/libxc/xg_dom_armzimageloader.c
@@ -25,7 +25,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #include <arpa/inet.h> /* XXX ntohl is not the right function... */
 
diff --git a/tools/libxc/xc_dom_binloader.c b/tools/libxc/xg_dom_binloader.c
similarity index 99%
rename from tools/libxc/xc_dom_binloader.c
rename to tools/libxc/xg_dom_binloader.c
index d6f7f2a500..870a921427 100644
--- a/tools/libxc/xc_dom_binloader.c
+++ b/tools/libxc/xg_dom_binloader.c
@@ -83,7 +83,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #define round_pgup(_p)    (((_p)+(PAGE_SIZE_X86-1))&PAGE_MASK_X86)
 #define round_pgdown(_p)  ((_p)&PAGE_MASK_X86)
diff --git a/tools/libxc/xc_dom_boot.c b/tools/libxc/xg_dom_boot.c
similarity index 99%
rename from tools/libxc/xc_dom_boot.c
rename to tools/libxc/xg_dom_boot.c
index bb599b33ba..1e31e92244 100644
--- a/tools/libxc/xc_dom_boot.c
+++ b/tools/libxc/xg_dom_boot.c
@@ -31,7 +31,7 @@
 #include <zlib.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_core.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
diff --git a/tools/libxc/xc_dom_bzimageloader.c b/tools/libxc/xg_dom_bzimageloader.c
similarity index 99%
rename from tools/libxc/xc_dom_bzimageloader.c
rename to tools/libxc/xg_dom_bzimageloader.c
index a7d70cc7c6..f959a77602 100644
--- a/tools/libxc/xc_dom_bzimageloader.c
+++ b/tools/libxc/xg_dom_bzimageloader.c
@@ -32,7 +32,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress.h"
+#include "xg_dom_decompress.h"
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxc/xc_dom_compat_linux.c b/tools/libxc/xg_dom_compat_linux.c
similarity index 99%
rename from tools/libxc/xc_dom_compat_linux.c
rename to tools/libxc/xg_dom_compat_linux.c
index b3d43feed9..b645f0b14b 100644
--- a/tools/libxc/xc_dom_compat_linux.c
+++ b/tools/libxc/xg_dom_compat_linux.c
@@ -30,7 +30,7 @@
 
 #include "xenctrl.h"
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 /* ------------------------------------------------------------------------ */
 
diff --git a/tools/libxc/xc_dom_core.c b/tools/libxc/xg_dom_core.c
similarity index 99%
rename from tools/libxc/xc_dom_core.c
rename to tools/libxc/xg_dom_core.c
index 327c8a8575..1c91cce315 100644
--- a/tools/libxc/xc_dom_core.c
+++ b/tools/libxc/xg_dom_core.c
@@ -32,7 +32,7 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "_paths.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xc_dom_decompress.h b/tools/libxc/xg_dom_decompress.h
similarity index 62%
rename from tools/libxc/xc_dom_decompress.h
rename to tools/libxc/xg_dom_decompress.h
index 42cefa3f0e..c5ab2e59eb 100644
--- a/tools/libxc/xc_dom_decompress.h
+++ b/tools/libxc/xg_dom_decompress.h
@@ -1,7 +1,7 @@
 #ifndef __MINIOS__
-# include "xc_dom.h"
+# include "xenctrl_dom.h"
 #else
-# include "xc_dom_decompress_unsafe.h"
+# include "xg_dom_decompress_unsafe.h"
 #endif
 
 int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size);
diff --git a/tools/libxc/xc_dom_decompress_lz4.c b/tools/libxc/xg_dom_decompress_lz4.c
similarity index 98%
rename from tools/libxc/xc_dom_decompress_lz4.c
rename to tools/libxc/xg_dom_decompress_lz4.c
index b6a33f27a8..97ba620d86 100644
--- a/tools/libxc/xc_dom_decompress_lz4.c
+++ b/tools/libxc/xg_dom_decompress_lz4.c
@@ -4,7 +4,7 @@
 #include <stdint.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress.h"
+#include "xg_dom_decompress.h"
 
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 
diff --git a/tools/libxc/xc_dom_decompress_unsafe.c b/tools/libxc/xg_dom_decompress_unsafe.c
similarity index 96%
rename from tools/libxc/xc_dom_decompress_unsafe.c
rename to tools/libxc/xg_dom_decompress_unsafe.c
index 164e35558f..21d964787d 100644
--- a/tools/libxc/xc_dom_decompress_unsafe.c
+++ b/tools/libxc/xg_dom_decompress_unsafe.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 static struct xc_dom_image *unsafe_dom;
 static unsigned char *output_blob;
diff --git a/tools/libxc/xc_dom_decompress_unsafe.h b/tools/libxc/xg_dom_decompress_unsafe.h
similarity index 97%
rename from tools/libxc/xc_dom_decompress_unsafe.h
rename to tools/libxc/xg_dom_decompress_unsafe.h
index 64f68864b1..fb84b6add8 100644
--- a/tools/libxc/xc_dom_decompress_unsafe.h
+++ b/tools/libxc/xg_dom_decompress_unsafe.h
@@ -1,4 +1,4 @@
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
diff --git a/tools/libxc/xc_dom_decompress_unsafe_bzip2.c b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
similarity index 87%
rename from tools/libxc/xc_dom_decompress_unsafe_bzip2.c
rename to tools/libxc/xg_dom_decompress_unsafe_bzip2.c
index 4dcabe4061..9d3709e6cc 100644
--- a/tools/libxc/xc_dom_decompress_unsafe_bzip2.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 #include "../../xen/common/bunzip2.c"
 
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzma.c b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
similarity index 87%
rename from tools/libxc/xc_dom_decompress_unsafe_lzma.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzma.c
index 4ee8cdbab1..5d178f0c43 100644
--- a/tools/libxc/xc_dom_decompress_unsafe_lzma.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 #include "../../xen/common/unlzma.c"
 
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzo1x.c b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
similarity index 96%
rename from tools/libxc/xc_dom_decompress_unsafe_lzo1x.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
index 59888b9da2..a4f8ebd42d 100644
--- a/tools/libxc/xc_dom_decompress_unsafe_lzo1x.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
@@ -5,7 +5,7 @@
 #include <stdint.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 typedef uint8_t u8;
 typedef uint32_t u32;
diff --git a/tools/libxc/xc_dom_decompress_unsafe_xz.c b/tools/libxc/xg_dom_decompress_unsafe_xz.c
similarity index 95%
rename from tools/libxc/xc_dom_decompress_unsafe_xz.c
rename to tools/libxc/xg_dom_decompress_unsafe_xz.c
index fe7a7f49b4..ff6824b38d 100644
--- a/tools/libxc/xc_dom_decompress_unsafe_xz.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_xz.c
@@ -6,7 +6,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 // TODO
 #define XZ_DEC_X86
diff --git a/tools/libxc/xc_dom_elfloader.c b/tools/libxc/xg_dom_elfloader.c
similarity index 99%
rename from tools/libxc/xc_dom_elfloader.c
rename to tools/libxc/xg_dom_elfloader.c
index b327db219d..7043c3bbba 100644
--- a/tools/libxc/xc_dom_elfloader.c
+++ b/tools/libxc/xg_dom_elfloader.c
@@ -26,7 +26,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 #define XEN_VER "xen-3.0"
diff --git a/tools/libxc/xc_dom_hvmloader.c b/tools/libxc/xg_dom_hvmloader.c
similarity index 99%
rename from tools/libxc/xc_dom_hvmloader.c
rename to tools/libxc/xg_dom_hvmloader.c
index 3f0bd65547..995a0f3dc3 100644
--- a/tools/libxc/xc_dom_hvmloader.c
+++ b/tools/libxc/xg_dom_hvmloader.c
@@ -26,7 +26,7 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xc_dom_x86.c b/tools/libxc/xg_dom_x86.c
similarity index 99%
rename from tools/libxc/xc_dom_x86.c
rename to tools/libxc/xg_dom_x86.c
index 9439805eaa..842dbcccdd 100644
--- a/tools/libxc/xc_dom_x86.c
+++ b/tools/libxc/xg_dom_x86.c
@@ -38,7 +38,7 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xenctrl.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xg_domain.c b/tools/libxc/xg_domain.c
new file mode 100644
index 0000000000..e982f7f077
--- /dev/null
+++ b/tools/libxc/xg_domain.c
@@ -0,0 +1,149 @@
+/******************************************************************************
+ * xc_domain.c
+ *
+ * API for manipulating and obtaining information on domains.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2003, K A Fraser.
+ */
+
+#include "xg_private.h"
+#include "xc_core.h"
+
+int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
+{
+    struct domain_info_context _di = { .guest_width = minfo->guest_width,
+                                       .p2m_size = minfo->p2m_size};
+    struct domain_info_context *dinfo = &_di;
+
+    free(minfo->pfn_type);
+    if ( minfo->p2m_table )
+        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+    minfo->p2m_table = NULL;
+
+    return 0;
+}
+
+int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
+                          struct xc_domain_meminfo *minfo)
+{
+    struct domain_info_context _di;
+    struct domain_info_context *dinfo = &_di;
+
+    xc_dominfo_t info;
+    shared_info_any_t *live_shinfo;
+    xen_capabilities_info_t xen_caps = "";
+    int i;
+
+    /* Only be initialized once */
+    if ( minfo->pfn_type || minfo->p2m_table )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    {
+        PERROR("Could not get domain info");
+        return -1;
+    }
+
+    if ( xc_domain_get_guest_width(xch, domid, &minfo->guest_width) )
+    {
+        PERROR("Could not get domain address size");
+        return -1;
+    }
+    _di.guest_width = minfo->guest_width;
+
+    /* Get page table levels (see get_platform_info() in xg_save_restore.h */
+    if ( xc_version(xch, XENVER_capabilities, &xen_caps) )
+    {
+        PERROR("Could not get Xen capabilities (for page table levels)");
+        return -1;
+    }
+    if ( strstr(xen_caps, "xen-3.0-x86_64") )
+        /* Depends on whether it's a compat 32-on-64 guest */
+        minfo->pt_levels = ( (minfo->guest_width == 8) ? 4 : 3 );
+    else if ( strstr(xen_caps, "xen-3.0-x86_32p") )
+        minfo->pt_levels = 3;
+    else if ( strstr(xen_caps, "xen-3.0-x86_32") )
+        minfo->pt_levels = 2;
+    else
+    {
+        errno = EFAULT;
+        return -1;
+    }
+
+    /* We need the shared info page for mapping the P2M */
+    live_shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
+                                       info.shared_info_frame);
+    if ( !live_shinfo )
+    {
+        PERROR("Could not map the shared info frame (MFN 0x%lx)",
+               info.shared_info_frame);
+        return -1;
+    }
+
+    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,
+                                       live_shinfo, &minfo->p2m_table,
+                                       &minfo->p2m_size) )
+    {
+        PERROR("Could not map the P2M table");
+        munmap(live_shinfo, PAGE_SIZE);
+        return -1;
+    }
+    munmap(live_shinfo, PAGE_SIZE);
+    _di.p2m_size = minfo->p2m_size;
+
+    /* Make space and prepare for getting the PFN types */
+    minfo->pfn_type = calloc(sizeof(*minfo->pfn_type), minfo->p2m_size);
+    if ( !minfo->pfn_type )
+    {
+        PERROR("Could not allocate memory for the PFN types");
+        goto failed;
+    }
+    for ( i = 0; i < minfo->p2m_size; i++ )
+        minfo->pfn_type[i] = xc_pfn_to_mfn(i, minfo->p2m_table,
+                                           minfo->guest_width);
+
+    /* Retrieve PFN types in batches */
+    for ( i = 0; i < minfo->p2m_size ; i+=1024 )
+    {
+        int count = ((minfo->p2m_size - i ) > 1024 ) ?
+                        1024: (minfo->p2m_size - i);
+
+        if ( xc_get_pfn_type_batch(xch, domid, count, minfo->pfn_type + i) )
+        {
+            PERROR("Could not get %d-eth batch of PFN types", (i+1)/1024);
+            goto failed;
+        }
+    }
+
+    return 0;
+
+failed:
+    if ( minfo->pfn_type )
+    {
+        free(minfo->pfn_type);
+        minfo->pfn_type = NULL;
+    }
+    if ( minfo->p2m_table )
+    {
+        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+        minfo->p2m_table = NULL;
+    }
+
+    return -1;
+}
diff --git a/tools/libxc/xc_nomigrate.c b/tools/libxc/xg_nomigrate.c
similarity index 100%
rename from tools/libxc/xc_nomigrate.c
rename to tools/libxc/xg_nomigrate.c
diff --git a/tools/libxc/xc_offline_page.c b/tools/libxc/xg_offline_page.c
similarity index 99%
rename from tools/libxc/xc_offline_page.c
rename to tools/libxc/xg_offline_page.c
index 19538fc436..77e8889b11 100644
--- a/tools/libxc/xc_offline_page.c
+++ b/tools/libxc/xg_offline_page.c
@@ -28,7 +28,7 @@
 #include <xc_core.h>
 
 #include "xc_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xg_private.h"
 #include "xg_save_restore.h"
 
diff --git a/tools/libxc/xg_private.h b/tools/libxc/xg_private.h
index 40b5baecde..0000b2b9b6 100644
--- a/tools/libxc/xg_private.h
+++ b/tools/libxc/xg_private.h
@@ -97,15 +97,6 @@ typedef uint64_t x86_pgentry_t;
 
 #define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
 
-
-/* XXX SMH: following skanky macros rely on variable p2m_size being set */
-/* XXX TJD: also, "guest_width" should be the guest's sizeof(unsigned long) */
-
-struct domain_info_context {
-    unsigned int guest_width;
-    unsigned long p2m_size;
-};
-
 static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
                                       unsigned gwidth)
 {
@@ -121,19 +112,6 @@ static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
     }
 }
 
-/* Number of xen_pfn_t in a page */
-#define FPP             (PAGE_SIZE/(dinfo->guest_width))
-
-/* Number of entries in the pfn_to_mfn_frame_list_list */
-#define P2M_FLL_ENTRIES (((dinfo->p2m_size)+(FPP*FPP)-1)/(FPP*FPP))
-
-/* Number of entries in the pfn_to_mfn_frame_list */
-#define P2M_FL_ENTRIES  (((dinfo->p2m_size)+FPP-1)/FPP)
-
-/* Size in bytes of the pfn_to_mfn_frame_list     */
-#define P2M_GUEST_FL_SIZE ((P2M_FL_ENTRIES) * (dinfo->guest_width))
-#define P2M_TOOLS_FL_SIZE ((P2M_FL_ENTRIES) *                           \
-                           max_t(size_t, sizeof(xen_pfn_t), dinfo->guest_width))
 
 /* Masks for PTE<->PFN conversions */
 #define MADDR_BITS_X86  ((dinfo->guest_width == 8) ? 52 : 44)
diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
index b904296997..88120eb54b 100644
--- a/tools/libxc/xg_save_restore.h
+++ b/tools/libxc/xg_save_restore.h
@@ -109,15 +109,6 @@ static inline int get_platform_info(xc_interface *xch, uint32_t dom,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-#define GET_FIELD(_p, _f, _w) (((_w) == 8) ? ((_p)->x64._f) : ((_p)->x32._f))
-
-#define SET_FIELD(_p, _f, _v, _w) do {          \
-    if ((_w) == 8)                              \
-        (_p)->x64._f = (_v);                    \
-    else                                        \
-        (_p)->x32._f = (_v);                    \
-} while (0)
-
 #define UNFOLD_CR3(_c)                                                  \
   ((uint64_t)((dinfo->guest_width == 8)                                 \
               ? ((_c) >> 12)                                            \
diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xg_sr_common.c
similarity index 99%
rename from tools/libxc/xc_sr_common.c
rename to tools/libxc/xg_sr_common.c
index 7c54b03414..17567ab133 100644
--- a/tools/libxc/xc_sr_common.c
+++ b/tools/libxc/xg_sr_common.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xg_sr_common.h
similarity index 99%
rename from tools/libxc/xc_sr_common.h
rename to tools/libxc/xg_sr_common.h
index f3bdea8006..13fcc47420 100644
--- a/tools/libxc/xc_sr_common.h
+++ b/tools/libxc/xg_sr_common.h
@@ -5,10 +5,10 @@
 
 #include "xg_private.h"
 #include "xg_save_restore.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
-#include "xc_sr_stream_format.h"
+#include "xg_sr_stream_format.h"
 
 /* String representation of Domain Header types. */
 const char *dhdr_type_to_str(uint32_t type);
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xg_sr_common_x86.c
similarity index 99%
rename from tools/libxc/xc_sr_common_x86.c
rename to tools/libxc/xg_sr_common_x86.c
index 77ea044a74..6f12483907 100644
--- a/tools/libxc/xc_sr_common_x86.c
+++ b/tools/libxc/xg_sr_common_x86.c
@@ -1,4 +1,4 @@
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
diff --git a/tools/libxc/xc_sr_common_x86.h b/tools/libxc/xg_sr_common_x86.h
similarity index 98%
rename from tools/libxc/xc_sr_common_x86.h
rename to tools/libxc/xg_sr_common_x86.h
index e08d81e0e7..b55758c96d 100644
--- a/tools/libxc/xc_sr_common_x86.h
+++ b/tools/libxc/xg_sr_common_x86.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86__H
 #define __COMMON_X86__H
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Obtains a domains TSC information from Xen and writes a X86_TSC_INFO record
diff --git a/tools/libxc/xc_sr_common_x86_pv.c b/tools/libxc/xg_sr_common_x86_pv.c
similarity index 99%
rename from tools/libxc/xc_sr_common_x86_pv.c
rename to tools/libxc/xg_sr_common_x86_pv.c
index d3d425cb82..cd33406aab 100644
--- a/tools/libxc/xc_sr_common_x86_pv.c
+++ b/tools/libxc/xg_sr_common_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 xen_pfn_t mfn_to_pfn(struct xc_sr_context *ctx, xen_pfn_t mfn)
 {
diff --git a/tools/libxc/xc_sr_common_x86_pv.h b/tools/libxc/xg_sr_common_x86_pv.h
similarity index 98%
rename from tools/libxc/xc_sr_common_x86_pv.h
rename to tools/libxc/xg_sr_common_x86_pv.h
index 2ed03309af..953b5bfb8d 100644
--- a/tools/libxc/xc_sr_common_x86_pv.h
+++ b/tools/libxc/xg_sr_common_x86_pv.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86_PV_H
 #define __COMMON_X86_PV_H
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 /* Virtual address ranges reserved for hypervisor. */
 #define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
diff --git a/tools/libxc/xc_sr_restore.c b/tools/libxc/xg_sr_restore.c
similarity index 99%
rename from tools/libxc/xc_sr_restore.c
rename to tools/libxc/xg_sr_restore.c
index bc811e6e3a..b57a787519 100644
--- a/tools/libxc/xc_sr_restore.c
+++ b/tools/libxc/xg_sr_restore.c
@@ -2,7 +2,7 @@
 
 #include <assert.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Read and validate the Image and Domain headers.
diff --git a/tools/libxc/xc_sr_restore_x86_hvm.c b/tools/libxc/xg_sr_restore_x86_hvm.c
similarity index 99%
rename from tools/libxc/xc_sr_restore_x86_hvm.c
rename to tools/libxc/xg_sr_restore_x86_hvm.c
index a77624cc9d..d6ea6f3012 100644
--- a/tools/libxc/xc_sr_restore_x86_hvm.c
+++ b/tools/libxc/xg_sr_restore_x86_hvm.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <arpa/inet.h>
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 /*
  * Process an HVM_CONTEXT record from the stream.
diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xg_sr_restore_x86_pv.c
similarity index 99%
rename from tools/libxc/xc_sr_restore_x86_pv.c
rename to tools/libxc/xg_sr_restore_x86_pv.c
index d086271efb..dc50b0f5a8 100644
--- a/tools/libxc/xc_sr_restore_x86_pv.c
+++ b/tools/libxc/xg_sr_restore_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 static xen_pfn_t pfn_to_mfn(const struct xc_sr_context *ctx, xen_pfn_t pfn)
 {
diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xg_sr_save.c
similarity index 99%
rename from tools/libxc/xc_sr_save.c
rename to tools/libxc/xg_sr_save.c
index 80b1d5de1f..d74c72cba6 100644
--- a/tools/libxc/xc_sr_save.c
+++ b/tools/libxc/xg_sr_save.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <arpa/inet.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Writes an Image header and Domain header into the stream.
diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xg_sr_save_x86_hvm.c
similarity index 99%
rename from tools/libxc/xc_sr_save_x86_hvm.c
rename to tools/libxc/xg_sr_save_x86_hvm.c
index 0b2abb26bd..1634a7bc43 100644
--- a/tools/libxc/xc_sr_save_x86_hvm.c
+++ b/tools/libxc/xg_sr_save_x86_hvm.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 #include <xen/hvm/params.h>
 
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xg_sr_save_x86_pv.c
similarity index 99%
rename from tools/libxc/xc_sr_save_x86_pv.c
rename to tools/libxc/xg_sr_save_x86_pv.c
index c7e246ef4f..4964f1f7b8 100644
--- a/tools/libxc/xc_sr_save_x86_pv.c
+++ b/tools/libxc/xg_sr_save_x86_pv.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <limits.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 /* Check a 64 bit virtual address for being canonical. */
 static inline bool is_canonical_address(xen_vaddr_t vaddr)
diff --git a/tools/libxc/xc_sr_stream_format.h b/tools/libxc/xg_sr_stream_format.h
similarity index 100%
rename from tools/libxc/xc_sr_stream_format.h
rename to tools/libxc/xg_sr_stream_format.h
diff --git a/tools/libxc/xc_suspend.c b/tools/libxc/xg_suspend.c
similarity index 100%
rename from tools/libxc/xc_suspend.c
rename to tools/libxc/xg_suspend.c
diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29056..975a4d730a 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -3,7 +3,7 @@
 #include "libxl_libfdt_compat.h"
 #include "libxl_arm.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <stdbool.h>
 #include <libfdt.h>
 #include <assert.h>
diff --git a/tools/libxl/libxl_arm.h b/tools/libxl/libxl_arm.h
index 8aef210d4c..52c2ab5e3a 100644
--- a/tools/libxl/libxl_arm.h
+++ b/tools/libxl/libxl_arm.h
@@ -17,7 +17,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 _hidden
 int libxl__prepare_acpi(libxl__gc *gc, libxl_domain_build_info *info,
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818e34..1031b75159 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -20,7 +20,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xenguest.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc5696b9..fec4e0fbe5 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -19,7 +19,7 @@
 
 #include "libxl_internal.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xen/hvm/e820.h>
 #include <sys/types.h>
 #include <pwd.h>
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index f8661e90d4..e2dca64aa1 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -20,7 +20,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index c63d0686fd..e16ae9630b 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -57,7 +57,7 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <xenhypfs.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxl/libxl_vnuma.c b/tools/libxl/libxl_vnuma.c
index 8ec2abb2e6..c2e144ceae 100644
--- a/tools/libxl/libxl_vnuma.c
+++ b/tools/libxl/libxl_vnuma.c
@@ -17,7 +17,7 @@
 #include "libxl_arch.h"
 #include <stdlib.h>
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 bool libxl__vnuma_configured(const libxl_domain_build_info *b_info)
 {
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index e57f63282e..7d95506e00 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -1,7 +1,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
index ed6610c84e..3df86c7be5 100644
--- a/tools/libxl/libxl_x86_acpi.c
+++ b/tools/libxl/libxl_x86_acpi.c
@@ -18,7 +18,7 @@
 #include <xen/hvm/e820.h>
 #include "libacpi/libacpi.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 8fde5f311f..8c7b184f0b 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -17,7 +17,7 @@
 #include <arpa/inet.h>
 
 #include <xen/elfnote.h>
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/params.h>
 
diff --git a/tools/xcutils/readnotes.c b/tools/xcutils/readnotes.c
index e682dd1a21..a6b7358e70 100644
--- a/tools/xcutils/readnotes.c
+++ b/tools/xcutils/readnotes.c
@@ -12,7 +12,7 @@
 #include <sys/mman.h>
 
 #include <xg_private.h>
-#include <xc_dom.h> /* gunzip bits */
+#include <xenctrl_dom.h> /* gunzip bits */
 
 #include <xen/libelf/libelf.h>
 
-- 
2.20.1


