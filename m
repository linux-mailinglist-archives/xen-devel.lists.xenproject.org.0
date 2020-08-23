Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D970F24EC96
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maP-0008Hv-H3; Sun, 23 Aug 2020 09:46:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQq-0004t9-Ub
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:57 +0000
X-Inumbo-ID: d540fa58-8549-4150-b507-ffe87720f715
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d540fa58-8549-4150-b507-ffe87720f715;
 Sun, 23 Aug 2020 09:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92D41AD26;
 Sun, 23 Aug 2020 09:35:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 Yang Hongyang <imhy.yang@gmail.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Subject: [PATCH v3 36/38] tools/libxl: move libxenlight to tools/libs/light
Date: Sun, 23 Aug 2020 11:35:17 +0200
Message-Id: <20200823093519.18386-37-jgross@suse.com>
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

Carve out all libxenlight related sources and move them to
tools/libs/light in order to use the generic library build environment.

The closely related sources for libxl-save-helper and the libxl test
environment are being moved, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  31 +-
 tools/Rules.mk                                |  11 +-
 tools/configure                               |   2 +-
 tools/configure.ac                            |   2 +-
 tools/libs/Makefile                           |   1 +
 tools/libs/light/CODING_STYLE                 | 330 ++++++++++++++++++
 tools/libs/light/Makefile                     | 291 +++++++++++++++
 .../light}/check-libxl-api-rules              |   0
 tools/{libxl => libs/light}/flexarray.c       |   0
 tools/{libxl => libs/light}/flexarray.h       |   0
 tools/{libxl => libs/light}/gentest.py        |   0
 tools/{libxl => libs/light}/gentypes.py       |   0
 tools/{libxl => libs/light}/idl.py            |   0
 tools/{libxl => libs/light}/idl.txt           |   0
 tools/{libxl => libs/light/include}/libxl.h   |   0
 .../light/include}/libxl_event.h              |   0
 .../light/include}/libxl_json.h               |   0
 .../light/include}/libxl_utils.h              |   0
 .../light/include}/libxl_uuid.h               |   0
 tools/{libxl => libs/light}/libxl.c           |   0
 tools/{libxl => libs/light}/libxl_9pfs.c      |   0
 tools/{libxl => libs/light}/libxl_aoutils.c   |   0
 tools/{libxl => libs/light}/libxl_arch.h      |   0
 tools/{libxl => libs/light}/libxl_arm.c       |   0
 tools/{libxl => libs/light}/libxl_arm.h       |   0
 tools/{libxl => libs/light}/libxl_arm_acpi.c  |   0
 .../{libxl => libs/light}/libxl_arm_no_acpi.c |   0
 .../{libxl => libs/light}/libxl_bootloader.c  |   0
 .../light}/libxl_checkpoint_device.c          |   0
 tools/{libxl => libs/light}/libxl_colo.h      |   0
 tools/{libxl => libs/light}/libxl_colo_nic.c  |   0
 .../{libxl => libs/light}/libxl_colo_proxy.c  |   0
 .../{libxl => libs/light}/libxl_colo_qdisk.c  |   0
 .../light}/libxl_colo_restore.c               |   0
 tools/{libxl => libs/light}/libxl_colo_save.c |   0
 tools/{libxl => libs/light}/libxl_console.c   |   0
 .../light}/libxl_convert_callout.c            |   0
 tools/{libxl => libs/light}/libxl_cpuid.c     |   0
 tools/{libxl => libs/light}/libxl_cpupool.c   |   0
 tools/{libxl => libs/light}/libxl_create.c    |   0
 tools/{libxl => libs/light}/libxl_device.c    |   0
 tools/{libxl => libs/light}/libxl_disk.c      |   0
 tools/{libxl => libs/light}/libxl_dm.c        |   0
 tools/{libxl => libs/light}/libxl_dom.c       |   0
 tools/{libxl => libs/light}/libxl_dom_save.c  |   0
 .../{libxl => libs/light}/libxl_dom_suspend.c |   0
 tools/{libxl => libs/light}/libxl_domain.c    |   0
 tools/{libxl => libs/light}/libxl_event.c     |   0
 tools/{libxl => libs/light}/libxl_exec.c      |   0
 tools/{libxl => libs/light}/libxl_flask.c     |   0
 tools/{libxl => libs/light}/libxl_fork.c      |   0
 tools/{libxl => libs/light}/libxl_freebsd.c   |   0
 tools/{libxl => libs/light}/libxl_genid.c     |   0
 tools/{libxl => libs/light}/libxl_internal.c  |   0
 tools/{libxl => libs/light}/libxl_internal.h  |   0
 tools/{libxl => libs/light}/libxl_json.c      |   0
 .../light}/libxl_libfdt_compat.c              |   0
 .../light}/libxl_libfdt_compat.h              |   0
 tools/{libxl => libs/light}/libxl_linux.c     |   0
 tools/{libxl => libs/light}/libxl_mem.c       |   0
 tools/{libxl => libs/light}/libxl_netbsd.c    |   0
 tools/{libxl => libs/light}/libxl_netbuffer.c |   0
 tools/{libxl => libs/light}/libxl_nic.c       |   0
 tools/{libxl => libs/light}/libxl_no_colo.c   |   0
 .../light}/libxl_no_convert_callout.c         |   0
 tools/{libxl => libs/light}/libxl_nocpuid.c   |   0
 .../{libxl => libs/light}/libxl_nonetbuffer.c |   0
 tools/{libxl => libs/light}/libxl_numa.c      |   0
 tools/{libxl => libs/light}/libxl_osdeps.h    |   0
 tools/{libxl => libs/light}/libxl_paths.c     |   0
 tools/{libxl => libs/light}/libxl_pci.c       |   0
 tools/{libxl => libs/light}/libxl_psr.c       |   0
 tools/{libxl => libs/light}/libxl_pvcalls.c   |   0
 tools/{libxl => libs/light}/libxl_qmp.c       |   0
 tools/{libxl => libs/light}/libxl_remus.c     |   0
 .../light}/libxl_remus_disk_drbd.c            |   0
 .../light}/libxl_save_callout.c               |   0
 .../{libxl => libs/light}/libxl_save_helper.c |   0
 .../light}/libxl_save_msgs_gen.pl             |   0
 tools/{libxl => libs/light}/libxl_sched.c     |   0
 .../light}/libxl_sr_stream_format.h           |   0
 .../{libxl => libs/light}/libxl_stream_read.c |   0
 .../light}/libxl_stream_write.c               |   0
 .../light}/libxl_test_fdevent.c               |   0
 .../light}/libxl_test_fdevent.h               |   0
 .../light}/libxl_test_timedereg.c             |   0
 .../light}/libxl_test_timedereg.h             |   0
 tools/{libxl => libs/light}/libxl_tmem.c      |   0
 tools/{libxl => libs/light}/libxl_types.idl   |   0
 .../light}/libxl_types_internal.idl           |   0
 tools/{libxl => libs/light}/libxl_usb.c       |   0
 tools/{libxl => libs/light}/libxl_utils.c     |   0
 tools/{libxl => libs/light}/libxl_uuid.c      |   0
 tools/{libxl => libs/light}/libxl_vdispl.c    |   0
 tools/{libxl => libs/light}/libxl_vkb.c       |   0
 tools/{libxl => libs/light}/libxl_vnuma.c     |   0
 tools/{libxl => libs/light}/libxl_vsnd.c      |   0
 tools/{libxl => libs/light}/libxl_vtpm.c      |   0
 tools/{libxl => libs/light}/libxl_x86.c       |   0
 tools/{libxl => libs/light}/libxl_x86_acpi.c  |   0
 tools/{libxl => libs/light}/libxl_x86_acpi.h  |   0
 tools/{libxl => libs/light}/libxl_xshelp.c    |   0
 tools/{libxl => libs/light}/osdeps.c          |   0
 tools/{libxl => libs/light}/test_common.c     |   0
 tools/{libxl => libs/light}/test_common.h     |   0
 .../{libxl => libs/light}/test_fdderegrace.c  |   0
 tools/{libxl => libs/light}/test_timedereg.c  |   0
 tools/{libxl => libs/light}/xenlight.pc.in    |   0
 tools/libs/uselibs.mk                         |   2 +
 tools/libxl/Makefile                          | 281 +--------------
 tools/ocaml/libs/xl/Makefile                  |   8 +-
 111 files changed, 658 insertions(+), 301 deletions(-)
 create mode 100644 tools/libs/light/CODING_STYLE
 create mode 100644 tools/libs/light/Makefile
 rename tools/{libxl => libs/light}/check-libxl-api-rules (100%)
 rename tools/{libxl => libs/light}/flexarray.c (100%)
 rename tools/{libxl => libs/light}/flexarray.h (100%)
 rename tools/{libxl => libs/light}/gentest.py (100%)
 rename tools/{libxl => libs/light}/gentypes.py (100%)
 rename tools/{libxl => libs/light}/idl.py (100%)
 rename tools/{libxl => libs/light}/idl.txt (100%)
 rename tools/{libxl => libs/light/include}/libxl.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_event.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_json.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_utils.h (100%)
 rename tools/{libxl => libs/light/include}/libxl_uuid.h (100%)
 rename tools/{libxl => libs/light}/libxl.c (100%)
 rename tools/{libxl => libs/light}/libxl_9pfs.c (100%)
 rename tools/{libxl => libs/light}/libxl_aoutils.c (100%)
 rename tools/{libxl => libs/light}/libxl_arch.h (100%)
 rename tools/{libxl => libs/light}/libxl_arm.c (100%)
 rename tools/{libxl => libs/light}/libxl_arm.h (100%)
 rename tools/{libxl => libs/light}/libxl_arm_acpi.c (100%)
 rename tools/{libxl => libs/light}/libxl_arm_no_acpi.c (100%)
 rename tools/{libxl => libs/light}/libxl_bootloader.c (100%)
 rename tools/{libxl => libs/light}/libxl_checkpoint_device.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo.h (100%)
 rename tools/{libxl => libs/light}/libxl_colo_nic.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_proxy.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_qdisk.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_restore.c (100%)
 rename tools/{libxl => libs/light}/libxl_colo_save.c (100%)
 rename tools/{libxl => libs/light}/libxl_console.c (100%)
 rename tools/{libxl => libs/light}/libxl_convert_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_cpuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_cpupool.c (100%)
 rename tools/{libxl => libs/light}/libxl_create.c (100%)
 rename tools/{libxl => libs/light}/libxl_device.c (100%)
 rename tools/{libxl => libs/light}/libxl_disk.c (100%)
 rename tools/{libxl => libs/light}/libxl_dm.c (100%)
 rename tools/{libxl => libs/light}/libxl_dom.c (100%)
 rename tools/{libxl => libs/light}/libxl_dom_save.c (100%)
 rename tools/{libxl => libs/light}/libxl_dom_suspend.c (100%)
 rename tools/{libxl => libs/light}/libxl_domain.c (100%)
 rename tools/{libxl => libs/light}/libxl_event.c (100%)
 rename tools/{libxl => libs/light}/libxl_exec.c (100%)
 rename tools/{libxl => libs/light}/libxl_flask.c (100%)
 rename tools/{libxl => libs/light}/libxl_fork.c (100%)
 rename tools/{libxl => libs/light}/libxl_freebsd.c (100%)
 rename tools/{libxl => libs/light}/libxl_genid.c (100%)
 rename tools/{libxl => libs/light}/libxl_internal.c (100%)
 rename tools/{libxl => libs/light}/libxl_internal.h (100%)
 rename tools/{libxl => libs/light}/libxl_json.c (100%)
 rename tools/{libxl => libs/light}/libxl_libfdt_compat.c (100%)
 rename tools/{libxl => libs/light}/libxl_libfdt_compat.h (100%)
 rename tools/{libxl => libs/light}/libxl_linux.c (100%)
 rename tools/{libxl => libs/light}/libxl_mem.c (100%)
 rename tools/{libxl => libs/light}/libxl_netbsd.c (100%)
 rename tools/{libxl => libs/light}/libxl_netbuffer.c (100%)
 rename tools/{libxl => libs/light}/libxl_nic.c (100%)
 rename tools/{libxl => libs/light}/libxl_no_colo.c (100%)
 rename tools/{libxl => libs/light}/libxl_no_convert_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_nocpuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_nonetbuffer.c (100%)
 rename tools/{libxl => libs/light}/libxl_numa.c (100%)
 rename tools/{libxl => libs/light}/libxl_osdeps.h (100%)
 rename tools/{libxl => libs/light}/libxl_paths.c (100%)
 rename tools/{libxl => libs/light}/libxl_pci.c (100%)
 rename tools/{libxl => libs/light}/libxl_psr.c (100%)
 rename tools/{libxl => libs/light}/libxl_pvcalls.c (100%)
 rename tools/{libxl => libs/light}/libxl_qmp.c (100%)
 rename tools/{libxl => libs/light}/libxl_remus.c (100%)
 rename tools/{libxl => libs/light}/libxl_remus_disk_drbd.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_callout.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_helper.c (100%)
 rename tools/{libxl => libs/light}/libxl_save_msgs_gen.pl (100%)
 rename tools/{libxl => libs/light}/libxl_sched.c (100%)
 rename tools/{libxl => libs/light}/libxl_sr_stream_format.h (100%)
 rename tools/{libxl => libs/light}/libxl_stream_read.c (100%)
 rename tools/{libxl => libs/light}/libxl_stream_write.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_fdevent.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_fdevent.h (100%)
 rename tools/{libxl => libs/light}/libxl_test_timedereg.c (100%)
 rename tools/{libxl => libs/light}/libxl_test_timedereg.h (100%)
 rename tools/{libxl => libs/light}/libxl_tmem.c (100%)
 rename tools/{libxl => libs/light}/libxl_types.idl (100%)
 rename tools/{libxl => libs/light}/libxl_types_internal.idl (100%)
 rename tools/{libxl => libs/light}/libxl_usb.c (100%)
 rename tools/{libxl => libs/light}/libxl_utils.c (100%)
 rename tools/{libxl => libs/light}/libxl_uuid.c (100%)
 rename tools/{libxl => libs/light}/libxl_vdispl.c (100%)
 rename tools/{libxl => libs/light}/libxl_vkb.c (100%)
 rename tools/{libxl => libs/light}/libxl_vnuma.c (100%)
 rename tools/{libxl => libs/light}/libxl_vsnd.c (100%)
 rename tools/{libxl => libs/light}/libxl_vtpm.c (100%)
 rename tools/{libxl => libs/light}/libxl_x86.c (100%)
 rename tools/{libxl => libs/light}/libxl_x86_acpi.c (100%)
 rename tools/{libxl => libs/light}/libxl_x86_acpi.h (100%)
 rename tools/{libxl => libs/light}/libxl_xshelp.c (100%)
 rename tools/{libxl => libs/light}/osdeps.c (100%)
 rename tools/{libxl => libs/light}/test_common.c (100%)
 rename tools/{libxl => libs/light}/test_common.h (100%)
 rename tools/{libxl => libs/light}/test_fdderegrace.c (100%)
 rename tools/{libxl => libs/light}/test_timedereg.c (100%)
 rename tools/{libxl => libs/light}/xenlight.pc.in (100%)

diff --git a/.gitignore b/.gitignore
index 44abbc7e43..94af7a4aee 100644
--- a/.gitignore
+++ b/.gitignore
@@ -128,6 +128,22 @@ tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
 tools/libs/guest/xc_core_x86.h
 tools/libs/guest/xc_private.h
+tools/libs/light/_*.[ch]
+tools/libs/light/*.pyc
+tools/libs/light/_libxl.api-for-check
+tools/libs/light/*.api-ok
+tools/libs/light/libxenlight.map
+tools/libs/light/libxl-save-helper
+tools/libs/light/dsdt*
+tools/libs/light/mk_dsdt
+tools/libs/light/ssdt*
+tools/libs/light/testidl
+tools/libs/light/testidl.c
+tools/libs/light/test_timedereg
+tools/libs/light/test_fdderegrace
+tools/libs/light/tmp.*
+tools/libs/light/xenlight.pc
+tools/libs/light/include/_*.h
 tools/libs/stat/_paths.h
 tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
@@ -216,16 +232,8 @@ tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/libxl/_libxl.api-for-check
-tools/libxl/*.api-ok
 tools/libxl/*.pc
-tools/libxl/dsdt*
 tools/libxl/libxlu_cfg_y.output
-tools/libxl/mk_dsdt
-tools/libxl/ssdt*
-tools/libxl/testenum
-tools/libxl/testenum.c
-tools/libxl/tmp.*
 tools/misc/cpuperf/cpuperf-perfcntr
 tools/misc/cpuperf/cpuperf-xen
 tools/misc/xc_shadow
@@ -379,13 +387,6 @@ tools/include/xen-foreign/arm64.h
 tools/misc/xen-hptool
 tools/misc/xen-mfndump
 tools/libs/toolcore/include/_*.h
-tools/libxl/_*.[ch]
-tools/libxl/testidl
-tools/libxl/testidl.c
-tools/libxl/*.pyc
-tools/libxl/libxl-save-helper
-tools/libxl/test_timedereg
-tools/libxl/test_fdderegrace
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
 tools/misc/xenhypfs
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 241e8e7d9a..8ecaf063b5 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -15,9 +15,7 @@ XEN_INCLUDE        = $(XEN_ROOT)/tools/include
 
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
-XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
-# Currently libxlutil lives in the same directory as libxenlight
-XEN_libxlutil      = $(XEN_libxenlight)
+XEN_libxlutil      = $(XEN_ROOT)/tools/libxl
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -107,6 +105,8 @@ ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
 endif
 
+CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
+
 ifeq ($(debug),y)
 # Disable optimizations
 CFLAGS += -O0 -fno-omit-frame-pointer
@@ -116,11 +116,6 @@ else
 CFLAGS += -O2 -fomit-frame-pointer
 endif
 
-CFLAGS_libxenlight = -I$(XEN_libxenlight) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
-SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs) $(SHLIB_libxenguest)
-LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_libxenlight)/libxenlight$(libextension)
-SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_libxenlight)
-
 CFLAGS_libxlutil = -I$(XEN_libxlutil)
 SHDEPS_libxlutil = $(SHLIB_libxenlight)
 LDLIBS_libxlutil = $(SHDEPS_libxlutil) $(XEN_libxlutil)/libxlutil$(libextension)
diff --git a/tools/configure b/tools/configure
index edcdcf4f73..8a708e9baa 100755
--- a/tools/configure
+++ b/tools/configure
@@ -585,7 +585,7 @@ PACKAGE_STRING='Xen Hypervisor Tools 4.15'
 PACKAGE_BUGREPORT='xen-devel@lists.xen.org'
 PACKAGE_URL='https://www.xen.org/'
 
-ac_unique_file="libxl/libxl.c"
+ac_unique_file="libs/light/libxl.c"
 # Factoring default headers for most tests.
 ac_includes_default="\
 #include <stdio.h>
diff --git a/tools/configure.ac b/tools/configure.ac
index 6614a4f130..ee8ba5ff24 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -4,7 +4,7 @@
 AC_PREREQ([2.67])
 AC_INIT([Xen Hypervisor Tools], m4_esyscmd([../version.sh ../xen/Makefile]),
     [xen-devel@lists.xen.org], [xen], [https://www.xen.org/])
-AC_CONFIG_SRCDIR([libxl/libxl.c])
+AC_CONFIG_SRCDIR([libs/light/libxl.c])
 AC_CONFIG_FILES([
 ../config/Tools.mk
 hotplug/FreeBSD/rc.d/xencommons
diff --git a/tools/libs/Makefile b/tools/libs/Makefile
index e8fcd59214..c41455c604 100644
--- a/tools/libs/Makefile
+++ b/tools/libs/Makefile
@@ -15,6 +15,7 @@ SUBDIRS-y += hypfs
 SUBDIRS-y += store
 SUBDIRS-y += stat
 SUBDIRS-$(CONFIG_Linux) += vchan
+SUBDIRS-y += light
 
 ifeq ($(CONFIG_RUMP),y)
 SUBDIRS-y := toolcore
diff --git a/tools/libs/light/CODING_STYLE b/tools/libs/light/CODING_STYLE
new file mode 100644
index 0000000000..3d572f6925
--- /dev/null
+++ b/tools/libs/light/CODING_STYLE
@@ -0,0 +1,330 @@
+LIBXENLIGHT CODING STYLE
+========================
+
+
+AN APOLOGY AND WARNING
+----------------------
+
+Much of the code in libxl does not yet follow this coding style
+document in every respect.  However, new code is expected to conform.
+
+Patches to improve the style of existing code are welcome.  Please
+separate these out from functional changes.
+
+If it is not feasible to conform fully to the style while patching old
+code, without doing substantial style reengineering first, we may
+accept patches which contain nonconformant elements, provided that
+they don't make the coding style problem worse overall.
+
+In this case, the new code should conform to the prevailing style in
+the area being touched.
+
+
+MEMORY ALLOCATION
+-----------------
+
+Memory allocation for libxl-internal purposes should normally be done
+with the provided gc mechanisms; there is then no need to free.  See
+"libxl memory management" in libxl.h.
+
+
+CONVENTIONAL VARIABLE NAMES
+---------------------------
+
+The following local variable names should be used where applicable:
+
+  int rc;    /* a libxl error code - and not anything else */
+  int r;     /* the return value from a system call (or libxc call) */
+  bool ok;   /* the success return value from a boolean function */
+
+  uint32_t domid;
+  libxl__gc *gc;
+  libxl__egc *egc;
+  libxl__ao *ao;
+
+  libxl_foo_bar_state *fbs;    /* local variable */
+  libxl_foo_bar_state foo_bar; /* inside another state struct */
+
+
+CONVENIENCE MACROS
+------------------
+
+There are a number of convenience macros which shorten the program and
+avoid opportunity for mistakes.  In some cases non-use of the macros
+produces functional bugs or incorrect error handling.  Use the macros
+whenever they are applicable.  For example:
+
+ Usually, don't use:     Instead, use (see libxl_internal.h):
+  libxl__log[v]           LOG, LOGE, LOGEV
+  libxl__sprintf          GCSPRINTF
+  libxl__*alloc et al.    GCNEW, GCNEW_ARRAY, GCREALLOC_ARRAY
+  isalnum etc. directly   CTYPE
+  libxl__ctx_[un]lock     CTX_LOCK, CTX_UNLOCK
+  gc=...; ao=...;         EGC_GC, AO_GC, STATE_AO_GC
+  explicit gc creation    GC_INIT, GC_FREE
+  memset(..,0,sizeof..)   FILLZERO
+
+Instead of malloc et al one should (as an exception to the above) use
+libxl__{zalloc,calloc,realloc} etc but passing NOGC.
+
+ERROR HANDLING
+--------------
+
+Unless, there are good reasons to do otherwise, the following error
+handling and cleanup paradigm should be used:
+
+  * All local variables referring to resources which might need
+    cleaning up are declared at the top of the function, and
+    initialised to a sentinel value indicating "nothing allocated".
+    For example,
+            libxl_evgen_disk_eject *evg = NULL;
+            int nullfd = -1;
+
+  * If the function is to return a libxl error value, `rc' is
+    used to contain the error code, but it is NOT initialised:
+            int rc;
+
+  * There is only one error cleanup path out of the function.  It
+    starts with a label `out:'.  That error cleanup path checks for
+    each allocated resource and frees it iff necessary.  It then
+    returns rc.  For example,
+         out:
+             if (evg) libxl__evdisable_disk_eject(gc, evg);
+             if (nullfd >= 0) close(nullfd);
+             return rc;
+
+  * Function calls which might fail (ie most function calls) are
+    handled by putting the return/status value into a variable, and
+    then checking it in a separate statement:
+            char *dompath = libxl__xs_get_dompath(gc, bl->domid);
+            if (!dompath) { rc = ERROR_FAIL; goto out; }
+
+  * If a resource is freed in the main body of the function (for
+    example, in a loop), the corresponding variable has to be reset to
+    the sentinel at the point where it's freed.
+
+Whether to use the `out' path for successful returns as well as error
+returns is a matter of taste and convenience for the specific
+function.  Not reusing the out path is fine if the duplicated function
+exit code is only `CTX_UNLOCK; GC_FREE;' (or similar).
+
+If you reuse the `out' path for successful returns, there may be
+resources which are to be returned to the caller rather than freed.
+In that case you have to reset the local variable to `nothing here',
+to avoid the resource being freed on the out path.  That resetting
+should be done immediately after the resource value is stored at the
+applicable _r function parameter (or equivalent).  Do not test `rc' in
+the out section, to discover whether to free things.
+
+The uses of the single-line formatting in the examples above are
+permitted exceptions to the usual libxl code formatting rules.
+
+
+
+IDEMPOTENT DATA STRUCTURE CONSTRUCTION/DESTRUCTION
+--------------------------------------------------
+
+Nontrivial data structures (in structs) should come with an idempotent
+_dispose function, which must free all resources associated with the
+data structure (but not free the struct itself).
+
+Such a struct should also come with an _init function which
+initialises the struct so that _dispose is a no-op.
+
+
+ASYNCHRONOUS/LONG-RUNNING OPERATIONS
+------------------------------------
+
+All long-running operations in libxl need to use the asynchronous
+operation machinery.  Consult the programmer documentation in
+libxl_internal.h for details - search for "Machinery for asynchronous
+operations".
+
+The code for asynchronous operations should be laid out in
+chronological order.  That is, where there is a chain of callback
+functions, each subsequent function should be, textually, the next
+function in the file.  This will normally involve predeclaring the
+callback functions.  Synchronous helper functions should be separated
+out into a section preceding the main callback chain.
+
+Control flow arrangements in asynchronous operations should be made as
+simple as possible, because it can otherwise be very hard to see
+through the tangle.
+
+
+When inventing a new sub-operation in asynchronous code, consider
+whether to structure it formally as a sub-operation with its own state
+structure.  (See, for example, libxl__datacopier_*.)
+
+An ao-suboperation state structure should contain, in this order:
+  * fields that the caller must fill in, and which are,
+    effectively, the parameters to the operation, including:
+      - libxl__ao *ao
+      - the callback function pointer(s), which
+        should be named callback or callback_*.
+  * shared information fields or ones used for returning information
+    to the calling operation
+  * private fields
+These sections should be clearly demarcated by comments.
+
+An asynchronous operation should normally have an idempotent stop or
+cancel function.  It should normally also have an _init function for
+its state struct, which arranges that the stop is a no-op.
+
+The permitted order of calls into your ao operation's methods must be
+documented in comments, if it is nontrivial.
+
+
+When using an ao sub-operation, you should normally:
+ * Physically include the sub-operation state struct in your
+   own state struct;
+ * Use CONTAINER_OF to find your own state struct at the start of
+   your implementations of the sub-operation callback functions;
+ * Unconditionally initialise the sub-operation's struct (with its
+   _init method) in your own _init method.
+ * Unconditionally cancel or destroy the sub-operation in your own
+   cancel or destroy method.
+
+
+FORMATTING AND NAMING
+---------------------
+
+Blatantly copied from qemu and linux with few modifications.
+
+
+1. Whitespace
+
+Of course, the most important aspect in any coding style is whitespace.
+Crusty old coders who have trouble spotting the glasses on their noses
+can tell the difference between a tab and eight spaces from a distance
+of approximately fifteen parsecs.  Many a flamewar have been fought and
+lost on this issue.
+
+Libxenlight indents are four spaces.  Tabs are never used, except in
+Makefiles where they have been irreversibly coded into the syntax.
+Spaces of course are superior to tabs because:
+
+ - You have just one way to specify whitespace, not two.  Ambiguity breeds
+   mistakes.
+ - The confusion surrounding 'use tabs to indent, spaces to justify' is gone.
+ - Tab indents push your code to the right, making your screen seriously
+   unbalanced.
+ - Tabs will be rendered incorrectly on editors who are misconfigured not
+   to use tab stops of eight positions.
+ - Tabs are rendered badly in patches, causing off-by-one errors in almost
+   every line.
+ - It is the libxenlight coding style.
+
+Do not leave whitespace dangling off the ends of lines.
+
+
+2. Line width
+
+Lines are limited to 75 characters.
+
+Rationale:
+ - Some people like to tile their 24" screens with a 6x4 matrix of 80x24
+   xterms and use vi in all of them.  The best way to punish them is to
+   let them keep doing it.
+ - In an 80 column terminal, some room needs to be left for > quoting
+   characters, +/- diff characters, and so on, in emails.
+ - Code and especially patches is much more readable if limited to a sane
+   line length.  Eighty is traditional.
+ - It is the libxenlight coding style.
+
+
+3. Naming
+
+C is a Spartan language, and so should your naming be.  Unlike Modula-2
+and Pascal programmers, C programmers do not use cute names like
+ThisVariableIsATemporaryCounter.  A C programmer would call that
+variable "tmp", which is much easier to write, and not the least more
+difficult to understand.
+
+HOWEVER, while mixed-case names are frowned upon, descriptive names for
+global variables are a must.  To call a global function "foo" is a
+shooting offense.
+
+GLOBAL variables (to be used only if you _really_ need them) need to
+have descriptive names, as do global functions.  If you have a function
+that counts the number of active users, you should call that
+"count_active_users()" or similar, you should _not_ call it "cntusr()".
+
+Encoding the type of a function into the name (so-called Hungarian
+notation) is brain damaged - the compiler knows the types anyway and can
+check those, and it only confuses the programmer.
+
+LOCAL variable names should be short, and to the point.  If you have
+some random integer loop counter, it should probably be called "i".
+Calling it "loop_counter" is non-productive, if there is no chance of it
+being mis-understood.  Similarly, "tmp" can be just about any type of
+variable that is used to hold a temporary value.
+
+Local variables used to store return values should have descriptive name
+like "rc" or "ret". Following the same reasoning the label used as exit
+path should be called "out".
+
+Function arguments which are used to return values to the caller
+should be suffixed `_r' or `_out'.
+
+Variables, type names and function names are
+lower_case_with_underscores.
+Type names and function names use the prefix libxl__ when internal to
+libxenlight and libxl_ when exported in libxl.h.
+Xl should avoid using libxl_ and libxl__ as prefix for its own function
+names.
+
+When wrapping standard library functions, use the prefix libxl_ to alert
+readers that they are seeing a wrapped version; otherwise avoid this prefix.
+
+Typedefs are used to eliminate the redundant 'struct' keyword.
+It is the libxenlight coding style.
+
+
+4. Statements
+
+Don't put multiple statements on a single line.
+Don't put multiple assignments on a single line either.
+Error code paths with an if statement and a goto or a return on the same
+line are allowed. Examples:
+
+    if (rc) goto out;
+    if (rc < 0) return;
+
+Libxenlight coding style is super simple.  Avoid tricky expressions.
+
+
+5. Block structure
+
+Every indented statement is braced, but blocks that contain just one
+statement may have the braces omitted.  To avoid confusion, either all
+the blocks in an if...else chain have braces, or none of them do.
+
+The opening brace is on the line that contains the control flow
+statement that introduces the new block; the closing brace is on the
+same line as the else keyword, or on a line by itself if there is no
+else keyword.  Examples:
+
+    if (a == 5) {
+        printf("a was 5.\n");
+    } else if (a == 6) {
+        printf("a was 6.\n");
+    } else {
+        printf("a was something else entirely.\n");
+    }
+
+    if (a == 5)
+        printf("a was 5.\n");
+
+An exception is the opening brace for a function; for reasons of tradition
+and clarity it comes on a line by itself:
+
+    void a_function(void)
+    {
+        do_something();
+    }
+
+Rationale: a consistent (except for functions...) bracing style reduces
+ambiguity and avoids needless churn when lines are added or removed.
+Furthermore, it is the libxenlight coding style.
+
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
new file mode 100644
index 0000000000..a8a715a4da
--- /dev/null
+++ b/tools/libs/light/Makefile
@@ -0,0 +1,291 @@
+XEN_ROOT = $(CURDIR)/../../..
+include $(XEN_ROOT)/tools/Rules.mk
+
+SRCS-y += osdeps.c
+SRCS-y += libxl_paths.c
+SRCS-y += libxl_bootloader.c
+SRCS-y += flexarray.c
+ifeq ($(CONFIG_LIBNL),y)
+SRCS-y += libxl_netbuffer.c
+else
+SRCS-y += libxl_nonetbuffer.c
+endif
+ifeq ($(CONFIG_X86),y)
+SRCS-y += libxl_convert_callout.c
+else
+SRCS-y += libxl_no_convert_callout.c
+endif
+SRCS-y += libxl_remus.c
+SRCS-y += libxl_checkpoint_device.c
+SRCS-y += libxl_remus_disk_drbd.c
+ifeq ($(CONFIG_LIBNL),y)
+SRCS-y += libxl_colo_restore.c
+SRCS-y += libxl_colo_save.c
+SRCS-y += libxl_colo_qdisk.c
+SRCS-y += libxl_colo_proxy.c
+SRCS-y += libxl_colo_nic.c
+else
+SRCS-y += libxl_no_colo.c
+endif
+
+ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
+DSDT_FILES-$(CONFIG_X86) = dsdt_pvh.c
+ACPI_OBJS  = $(patsubst %.c,%.o,$(DSDT_FILES-y)) build.o static_tables.o
+ACPI_PIC_OBJS = $(patsubst %.o,%.opic,$(ACPI_OBJS))
+$(DSDT_FILES-y): acpi
+vpath build.c $(ACPI_PATH)/
+vpath static_tables.c $(ACPI_PATH)/
+
+.PHONY: acpi
+acpi:
+	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
+
+SRCS-$(CONFIG_X86) += $(ACPI_OBJS:.o=.c)
+
+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+	-Wno-declaration-after-statement -Wformat-nonliteral
+CFLAGS += -I.
+
+SRCS-$(CONFIG_X86) += libxl_cpuid.c
+SRCS-$(CONFIG_X86) += libxl_x86.c
+SRCS-$(CONFIG_X86) += libxl_psr.c
+SRCS-$(CONFIG_X86) += libxl_x86_acpi.c
+SRCS-$(CONFIG_ARM) += libxl_nocpuid.c
+SRCS-$(CONFIG_ARM) += libxl_arm.c
+SRCS-$(CONFIG_ARM) += libxl_libfdt_compat.c
+ifeq ($(CONFIG_ARM_64),y)
+DSDT_FILES-y = dsdt_anycpu_arm.c
+SRCS-y += libxl_arm_acpi.c
+SRCS-y += $(DSDT_FILES-y)
+dsdt_anycpu_arm.c:
+	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
+else
+SRCS-$(CONFIG_ARM) += libxl_arm_no_acpi.c
+endif
+
+SRCS-OS-$(CONFIG_NetBSD) = libxl_netbsd.c
+SRCS-OS-$(CONFIG_Linux) = libxl_linux.c
+SRCS-OS-$(CONFIG_FreeBSD) = libxl_freebsd.c
+ifeq ($(SRCS-OS-y),)
+$(error Your Operating System is not supported by libxenlight, \
+please check libxl_linux.c and libxl_netbsd.c to see how to get it ported)
+endif
+SRCS-y += $(SRCS-OS-y)
+
+SRCS-y += libxl.c
+SRCS-y += libxl_create.c
+SRCS-y += libxl_dm.c
+SRCS-y += libxl_pci.c
+SRCS-y += libxl_dom.c
+SRCS-y += libxl_exec.c
+SRCS-y += libxl_xshelp.c
+SRCS-y += libxl_device.c
+SRCS-y += libxl_internal.c
+SRCS-y += libxl_utils.c
+SRCS-y += libxl_uuid.c
+SRCS-y += libxl_json.c
+SRCS-y += libxl_aoutils.c
+SRCS-y += libxl_numa.c
+SRCS-y += libxl_vnuma.c
+SRCS-y += libxl_stream_read.c
+SRCS-y += libxl_stream_write.c
+SRCS-y += libxl_save_callout.c
+SRCS-y += _libxl_save_msgs_callout.c
+SRCS-y += libxl_qmp.c
+SRCS-y += libxl_event.c
+SRCS-y += libxl_fork.c
+SRCS-y += libxl_dom_suspend.c
+SRCS-y += libxl_dom_save.c
+SRCS-y += libxl_usb.c
+SRCS-y += libxl_vtpm.c
+SRCS-y += libxl_nic.c
+SRCS-y += libxl_disk.c
+SRCS-y += libxl_console.c
+SRCS-y += libxl_cpupool.c
+SRCS-y += libxl_mem.c
+SRCS-y += libxl_sched.c
+SRCS-y += libxl_tmem.c
+SRCS-y += libxl_9pfs.c
+SRCS-y += libxl_domain.c
+SRCS-y += libxl_vdispl.c
+SRCS-y += libxl_pvcalls.c
+SRCS-y += libxl_vsnd.c
+SRCS-y += libxl_vkb.c
+SRCS-y += libxl_genid.c
+SRCS-y += _libxl_types.c
+SRCS-y += libxl_flask.c
+SRCS-y += _libxl_types_internal.c
+
+ifeq ($(CONFIG_LIBNL),y)
+CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
+endif
+CFLAGS_LIBXL += -Wshadow
+ifeq ($(debug),y)
+CFLAGS_LIBXL += -DCONFIG_DEBUG
+endif
+
+CFLAGS += $(PTHREAD_CFLAGS)
+LDFLAGS += $(PTHREAD_LDFLAGS)
+
+LIBXL_TESTS += timedereg
+LIBXL_TESTS_PROGS = $(LIBXL_TESTS) fdderegrace
+LIBXL_TESTS_INSIDE = $(LIBXL_TESTS) fdevent
+
+# Each entry FOO in LIBXL_TESTS has two main .c files:
+#   libxl_test_FOO.c  "inside libxl" code to support the test case
+#   test_FOO.c        "outside libxl" code to exercise the test case
+# Conventionally there will also be:
+#   libxl_test_FOO.h  interface between the "inside" and "outside" parts
+# The "inside libxl" file is compiled exactly like a piece of libxl, and the
+# "outside libxl" file is compiled exactly like a piece of application
+# code.  They must share information via explicit libxl entrypoints.
+# Unlike proper parts of libxl, it is permissible for libxl_test_FOO.c
+# to use private global variables for its state.  Note that all the
+# "inside" parts are compiled into a single test library, so their
+# symbol names must be unique.
+#
+# To run these tests, either use LD_PRELOAD to get libxenlight_test.so
+# loaded, or rename it to libxenlight.so so it is the target of the
+# appropriate symlinks.
+
+LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
+TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
+TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
+
+AUTOINCS = _libxl_list.h _paths.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
+AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
+
+CLIENTS = testidl libxl-save-helper
+
+SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
+
+LIBHEADER := libxl.h libxl_event.h libxl_json.h _libxl_types.h _libxl_types_json.h _libxl_list.h libxl_utils.h libxl_uuid.h
+
+NO_HEADERS_CHK := y
+
+include $(XEN_ROOT)/tools/libs/libs.mk
+
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(CURDIR)
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
+
+LDUSELIBS-y += $(PTYFUNCS_LIBS)
+LDUSELIBS-$(CONFIG_LIBNL) += $(LIBNL3_LIBS)
+LDUSELIBS-$(CONFIG_Linux) += -luuid
+LDUSELIBS-$(CONFIG_Linux) += -lrt
+LDUSELIBS-$(CONFIG_ARM) += -lfdt
+LDUSELIBS-y += $(PTHREAD_LIBS)
+LDUSELIBS-y += -lyajl
+LDUSELIBS += $(LDUSELIBS-y)
+
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
+$(ACPI_OBJS) $(ACPI_PIC_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
+$(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
+libxl_dom.o libxl_dom.opic: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
+libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
+$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
+
+testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
+testidl.c: libxl_types.idl gentest.py include/libxl.h $(AUTOINCS)
+	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
+	mv testidl.c.new testidl.c
+
+build: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS) idl-external
+
+$(LIB_OBJS) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
+
+genpath-target = $(call buildmakevars2header,_paths.h)
+$(eval $(genpath-target))
+
+libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
+	$(PERL) $^
+	touch $@
+
+_%.api-for-check: include/%.h $(AUTOINCS)
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -E $< $(APPEND_CFLAGS) \
+		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
+		>$@.new
+	mv -f $@.new $@
+
+_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
+	$(PERL) $^ --prefix=libxl >$@.new
+	$(call move-if-changed,$@.new,$@)
+
+_libxl_save_msgs_helper.c _libxl_save_msgs_callout.c \
+_libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
+		libxl_save_msgs_gen.pl
+	$(PERL) -w $< $@ >$@.new
+	$(call move-if-changed,$@.new,$@)
+
+include/libxl.h: _libxl_types.h _libxl_list.h
+include/libxl_json.h: _libxl_types_json.h
+libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h _paths.h
+libxl_internal_json.h: _libxl_types_internal_json.h
+xl.h: _paths.h
+
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): include/libxl.h
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
+
+_libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
+	$(eval stem = $(notdir $*))
+	$(PYTHON) gentypes.py libxl_type$(stem).idl __libxl_type$(stem).h __libxl_type$(stem)_private.h \
+		__libxl_type$(stem)_json.h  __libxl_type$(stem).c
+	$(call move-if-changed,__libxl_type$(stem).h,_libxl_type$(stem).h)
+	$(call move-if-changed,__libxl_type$(stem)_private.h,_libxl_type$(stem)_private.h)
+	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
+	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
+
+include/_%.h: _%.h
+	cp $< $@
+
+# NOTE: This is safe to do at the moment because idl-external and
+# idl-gen are only called from libxl/Makefile:all, which must return
+# before golang/Makefile is callid.  idl-external and idl-gen must
+# never be called from another part of the make system without careful thought
+# about races with tools/golang/xenlight/Makefile:all
+.PHONY: idl-external
+idl-external:
+	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
+
+LIBXL_IDLGEN_FILES = include/_libxl_types.h include/_libxl_types_json.h _libxl_types_private.h _libxl_types.c \
+	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c
+
+idl-gen: $(LIBXL_GEN_FILES) idl-external
+
+libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
+	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDUSELIBS) $(APPEND_LDFLAGS)
+
+test_%: test_%.o test_common.o libxenlight_test.so
+	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
+
+libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
+	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+
+testidl: testidl.o libxenlight.so
+	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
+
+install: installlocal $(LIBHEADERS)
+
+.PHONY: installlocal
+installlocal:
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) libxl-save-helper $(DESTDIR)$(LIBEXEC_BIN)
+
+uninstall: uninstalllocal
+
+.PHONY: uninstalllocal
+uninstalllocal:
+	rm -f $(DESTDIR)$(LIBEXEC_BIN)/libxl-save-helper
+
+clean: cleanlocal
+
+.PHONY: cleanlocal
+cleanlocal:
+	$(RM) -f $(LIBXL_IDLGEN_FILES) *.o $(CLIENTS)
+	$(RM) -f *.pyc _paths.*.tmp _*.api-for-check
+	$(RM) -f testidl.c.new testidl.c *.api-ok
+	$(RM) -f $(TEST_PROGS)
+	$(RM) -rf __pycache__
+	$(RM) -f include/_*.h
+	$(RM) -f libxenlight.map
+	$(RM) -f $(AUTOSRCS) $(AUTOINCS)
+	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
diff --git a/tools/libxl/check-libxl-api-rules b/tools/libs/light/check-libxl-api-rules
similarity index 100%
rename from tools/libxl/check-libxl-api-rules
rename to tools/libs/light/check-libxl-api-rules
diff --git a/tools/libxl/flexarray.c b/tools/libs/light/flexarray.c
similarity index 100%
rename from tools/libxl/flexarray.c
rename to tools/libs/light/flexarray.c
diff --git a/tools/libxl/flexarray.h b/tools/libs/light/flexarray.h
similarity index 100%
rename from tools/libxl/flexarray.h
rename to tools/libs/light/flexarray.h
diff --git a/tools/libxl/gentest.py b/tools/libs/light/gentest.py
similarity index 100%
rename from tools/libxl/gentest.py
rename to tools/libs/light/gentest.py
diff --git a/tools/libxl/gentypes.py b/tools/libs/light/gentypes.py
similarity index 100%
rename from tools/libxl/gentypes.py
rename to tools/libs/light/gentypes.py
diff --git a/tools/libxl/idl.py b/tools/libs/light/idl.py
similarity index 100%
rename from tools/libxl/idl.py
rename to tools/libs/light/idl.py
diff --git a/tools/libxl/idl.txt b/tools/libs/light/idl.txt
similarity index 100%
rename from tools/libxl/idl.txt
rename to tools/libs/light/idl.txt
diff --git a/tools/libxl/libxl.h b/tools/libs/light/include/libxl.h
similarity index 100%
rename from tools/libxl/libxl.h
rename to tools/libs/light/include/libxl.h
diff --git a/tools/libxl/libxl_event.h b/tools/libs/light/include/libxl_event.h
similarity index 100%
rename from tools/libxl/libxl_event.h
rename to tools/libs/light/include/libxl_event.h
diff --git a/tools/libxl/libxl_json.h b/tools/libs/light/include/libxl_json.h
similarity index 100%
rename from tools/libxl/libxl_json.h
rename to tools/libs/light/include/libxl_json.h
diff --git a/tools/libxl/libxl_utils.h b/tools/libs/light/include/libxl_utils.h
similarity index 100%
rename from tools/libxl/libxl_utils.h
rename to tools/libs/light/include/libxl_utils.h
diff --git a/tools/libxl/libxl_uuid.h b/tools/libs/light/include/libxl_uuid.h
similarity index 100%
rename from tools/libxl/libxl_uuid.h
rename to tools/libs/light/include/libxl_uuid.h
diff --git a/tools/libxl/libxl.c b/tools/libs/light/libxl.c
similarity index 100%
rename from tools/libxl/libxl.c
rename to tools/libs/light/libxl.c
diff --git a/tools/libxl/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
similarity index 100%
rename from tools/libxl/libxl_9pfs.c
rename to tools/libs/light/libxl_9pfs.c
diff --git a/tools/libxl/libxl_aoutils.c b/tools/libs/light/libxl_aoutils.c
similarity index 100%
rename from tools/libxl/libxl_aoutils.c
rename to tools/libs/light/libxl_aoutils.c
diff --git a/tools/libxl/libxl_arch.h b/tools/libs/light/libxl_arch.h
similarity index 100%
rename from tools/libxl/libxl_arch.h
rename to tools/libs/light/libxl_arch.h
diff --git a/tools/libxl/libxl_arm.c b/tools/libs/light/libxl_arm.c
similarity index 100%
rename from tools/libxl/libxl_arm.c
rename to tools/libs/light/libxl_arm.c
diff --git a/tools/libxl/libxl_arm.h b/tools/libs/light/libxl_arm.h
similarity index 100%
rename from tools/libxl/libxl_arm.h
rename to tools/libs/light/libxl_arm.h
diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libs/light/libxl_arm_acpi.c
similarity index 100%
rename from tools/libxl/libxl_arm_acpi.c
rename to tools/libs/light/libxl_arm_acpi.c
diff --git a/tools/libxl/libxl_arm_no_acpi.c b/tools/libs/light/libxl_arm_no_acpi.c
similarity index 100%
rename from tools/libxl/libxl_arm_no_acpi.c
rename to tools/libs/light/libxl_arm_no_acpi.c
diff --git a/tools/libxl/libxl_bootloader.c b/tools/libs/light/libxl_bootloader.c
similarity index 100%
rename from tools/libxl/libxl_bootloader.c
rename to tools/libs/light/libxl_bootloader.c
diff --git a/tools/libxl/libxl_checkpoint_device.c b/tools/libs/light/libxl_checkpoint_device.c
similarity index 100%
rename from tools/libxl/libxl_checkpoint_device.c
rename to tools/libs/light/libxl_checkpoint_device.c
diff --git a/tools/libxl/libxl_colo.h b/tools/libs/light/libxl_colo.h
similarity index 100%
rename from tools/libxl/libxl_colo.h
rename to tools/libs/light/libxl_colo.h
diff --git a/tools/libxl/libxl_colo_nic.c b/tools/libs/light/libxl_colo_nic.c
similarity index 100%
rename from tools/libxl/libxl_colo_nic.c
rename to tools/libs/light/libxl_colo_nic.c
diff --git a/tools/libxl/libxl_colo_proxy.c b/tools/libs/light/libxl_colo_proxy.c
similarity index 100%
rename from tools/libxl/libxl_colo_proxy.c
rename to tools/libs/light/libxl_colo_proxy.c
diff --git a/tools/libxl/libxl_colo_qdisk.c b/tools/libs/light/libxl_colo_qdisk.c
similarity index 100%
rename from tools/libxl/libxl_colo_qdisk.c
rename to tools/libs/light/libxl_colo_qdisk.c
diff --git a/tools/libxl/libxl_colo_restore.c b/tools/libs/light/libxl_colo_restore.c
similarity index 100%
rename from tools/libxl/libxl_colo_restore.c
rename to tools/libs/light/libxl_colo_restore.c
diff --git a/tools/libxl/libxl_colo_save.c b/tools/libs/light/libxl_colo_save.c
similarity index 100%
rename from tools/libxl/libxl_colo_save.c
rename to tools/libs/light/libxl_colo_save.c
diff --git a/tools/libxl/libxl_console.c b/tools/libs/light/libxl_console.c
similarity index 100%
rename from tools/libxl/libxl_console.c
rename to tools/libs/light/libxl_console.c
diff --git a/tools/libxl/libxl_convert_callout.c b/tools/libs/light/libxl_convert_callout.c
similarity index 100%
rename from tools/libxl/libxl_convert_callout.c
rename to tools/libs/light/libxl_convert_callout.c
diff --git a/tools/libxl/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
similarity index 100%
rename from tools/libxl/libxl_cpuid.c
rename to tools/libs/light/libxl_cpuid.c
diff --git a/tools/libxl/libxl_cpupool.c b/tools/libs/light/libxl_cpupool.c
similarity index 100%
rename from tools/libxl/libxl_cpupool.c
rename to tools/libs/light/libxl_cpupool.c
diff --git a/tools/libxl/libxl_create.c b/tools/libs/light/libxl_create.c
similarity index 100%
rename from tools/libxl/libxl_create.c
rename to tools/libs/light/libxl_create.c
diff --git a/tools/libxl/libxl_device.c b/tools/libs/light/libxl_device.c
similarity index 100%
rename from tools/libxl/libxl_device.c
rename to tools/libs/light/libxl_device.c
diff --git a/tools/libxl/libxl_disk.c b/tools/libs/light/libxl_disk.c
similarity index 100%
rename from tools/libxl/libxl_disk.c
rename to tools/libs/light/libxl_disk.c
diff --git a/tools/libxl/libxl_dm.c b/tools/libs/light/libxl_dm.c
similarity index 100%
rename from tools/libxl/libxl_dm.c
rename to tools/libs/light/libxl_dm.c
diff --git a/tools/libxl/libxl_dom.c b/tools/libs/light/libxl_dom.c
similarity index 100%
rename from tools/libxl/libxl_dom.c
rename to tools/libs/light/libxl_dom.c
diff --git a/tools/libxl/libxl_dom_save.c b/tools/libs/light/libxl_dom_save.c
similarity index 100%
rename from tools/libxl/libxl_dom_save.c
rename to tools/libs/light/libxl_dom_save.c
diff --git a/tools/libxl/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
similarity index 100%
rename from tools/libxl/libxl_dom_suspend.c
rename to tools/libs/light/libxl_dom_suspend.c
diff --git a/tools/libxl/libxl_domain.c b/tools/libs/light/libxl_domain.c
similarity index 100%
rename from tools/libxl/libxl_domain.c
rename to tools/libs/light/libxl_domain.c
diff --git a/tools/libxl/libxl_event.c b/tools/libs/light/libxl_event.c
similarity index 100%
rename from tools/libxl/libxl_event.c
rename to tools/libs/light/libxl_event.c
diff --git a/tools/libxl/libxl_exec.c b/tools/libs/light/libxl_exec.c
similarity index 100%
rename from tools/libxl/libxl_exec.c
rename to tools/libs/light/libxl_exec.c
diff --git a/tools/libxl/libxl_flask.c b/tools/libs/light/libxl_flask.c
similarity index 100%
rename from tools/libxl/libxl_flask.c
rename to tools/libs/light/libxl_flask.c
diff --git a/tools/libxl/libxl_fork.c b/tools/libs/light/libxl_fork.c
similarity index 100%
rename from tools/libxl/libxl_fork.c
rename to tools/libs/light/libxl_fork.c
diff --git a/tools/libxl/libxl_freebsd.c b/tools/libs/light/libxl_freebsd.c
similarity index 100%
rename from tools/libxl/libxl_freebsd.c
rename to tools/libs/light/libxl_freebsd.c
diff --git a/tools/libxl/libxl_genid.c b/tools/libs/light/libxl_genid.c
similarity index 100%
rename from tools/libxl/libxl_genid.c
rename to tools/libs/light/libxl_genid.c
diff --git a/tools/libxl/libxl_internal.c b/tools/libs/light/libxl_internal.c
similarity index 100%
rename from tools/libxl/libxl_internal.c
rename to tools/libs/light/libxl_internal.c
diff --git a/tools/libxl/libxl_internal.h b/tools/libs/light/libxl_internal.h
similarity index 100%
rename from tools/libxl/libxl_internal.h
rename to tools/libs/light/libxl_internal.h
diff --git a/tools/libxl/libxl_json.c b/tools/libs/light/libxl_json.c
similarity index 100%
rename from tools/libxl/libxl_json.c
rename to tools/libs/light/libxl_json.c
diff --git a/tools/libxl/libxl_libfdt_compat.c b/tools/libs/light/libxl_libfdt_compat.c
similarity index 100%
rename from tools/libxl/libxl_libfdt_compat.c
rename to tools/libs/light/libxl_libfdt_compat.c
diff --git a/tools/libxl/libxl_libfdt_compat.h b/tools/libs/light/libxl_libfdt_compat.h
similarity index 100%
rename from tools/libxl/libxl_libfdt_compat.h
rename to tools/libs/light/libxl_libfdt_compat.h
diff --git a/tools/libxl/libxl_linux.c b/tools/libs/light/libxl_linux.c
similarity index 100%
rename from tools/libxl/libxl_linux.c
rename to tools/libs/light/libxl_linux.c
diff --git a/tools/libxl/libxl_mem.c b/tools/libs/light/libxl_mem.c
similarity index 100%
rename from tools/libxl/libxl_mem.c
rename to tools/libs/light/libxl_mem.c
diff --git a/tools/libxl/libxl_netbsd.c b/tools/libs/light/libxl_netbsd.c
similarity index 100%
rename from tools/libxl/libxl_netbsd.c
rename to tools/libs/light/libxl_netbsd.c
diff --git a/tools/libxl/libxl_netbuffer.c b/tools/libs/light/libxl_netbuffer.c
similarity index 100%
rename from tools/libxl/libxl_netbuffer.c
rename to tools/libs/light/libxl_netbuffer.c
diff --git a/tools/libxl/libxl_nic.c b/tools/libs/light/libxl_nic.c
similarity index 100%
rename from tools/libxl/libxl_nic.c
rename to tools/libs/light/libxl_nic.c
diff --git a/tools/libxl/libxl_no_colo.c b/tools/libs/light/libxl_no_colo.c
similarity index 100%
rename from tools/libxl/libxl_no_colo.c
rename to tools/libs/light/libxl_no_colo.c
diff --git a/tools/libxl/libxl_no_convert_callout.c b/tools/libs/light/libxl_no_convert_callout.c
similarity index 100%
rename from tools/libxl/libxl_no_convert_callout.c
rename to tools/libs/light/libxl_no_convert_callout.c
diff --git a/tools/libxl/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
similarity index 100%
rename from tools/libxl/libxl_nocpuid.c
rename to tools/libs/light/libxl_nocpuid.c
diff --git a/tools/libxl/libxl_nonetbuffer.c b/tools/libs/light/libxl_nonetbuffer.c
similarity index 100%
rename from tools/libxl/libxl_nonetbuffer.c
rename to tools/libs/light/libxl_nonetbuffer.c
diff --git a/tools/libxl/libxl_numa.c b/tools/libs/light/libxl_numa.c
similarity index 100%
rename from tools/libxl/libxl_numa.c
rename to tools/libs/light/libxl_numa.c
diff --git a/tools/libxl/libxl_osdeps.h b/tools/libs/light/libxl_osdeps.h
similarity index 100%
rename from tools/libxl/libxl_osdeps.h
rename to tools/libs/light/libxl_osdeps.h
diff --git a/tools/libxl/libxl_paths.c b/tools/libs/light/libxl_paths.c
similarity index 100%
rename from tools/libxl/libxl_paths.c
rename to tools/libs/light/libxl_paths.c
diff --git a/tools/libxl/libxl_pci.c b/tools/libs/light/libxl_pci.c
similarity index 100%
rename from tools/libxl/libxl_pci.c
rename to tools/libs/light/libxl_pci.c
diff --git a/tools/libxl/libxl_psr.c b/tools/libs/light/libxl_psr.c
similarity index 100%
rename from tools/libxl/libxl_psr.c
rename to tools/libs/light/libxl_psr.c
diff --git a/tools/libxl/libxl_pvcalls.c b/tools/libs/light/libxl_pvcalls.c
similarity index 100%
rename from tools/libxl/libxl_pvcalls.c
rename to tools/libs/light/libxl_pvcalls.c
diff --git a/tools/libxl/libxl_qmp.c b/tools/libs/light/libxl_qmp.c
similarity index 100%
rename from tools/libxl/libxl_qmp.c
rename to tools/libs/light/libxl_qmp.c
diff --git a/tools/libxl/libxl_remus.c b/tools/libs/light/libxl_remus.c
similarity index 100%
rename from tools/libxl/libxl_remus.c
rename to tools/libs/light/libxl_remus.c
diff --git a/tools/libxl/libxl_remus_disk_drbd.c b/tools/libs/light/libxl_remus_disk_drbd.c
similarity index 100%
rename from tools/libxl/libxl_remus_disk_drbd.c
rename to tools/libs/light/libxl_remus_disk_drbd.c
diff --git a/tools/libxl/libxl_save_callout.c b/tools/libs/light/libxl_save_callout.c
similarity index 100%
rename from tools/libxl/libxl_save_callout.c
rename to tools/libs/light/libxl_save_callout.c
diff --git a/tools/libxl/libxl_save_helper.c b/tools/libs/light/libxl_save_helper.c
similarity index 100%
rename from tools/libxl/libxl_save_helper.c
rename to tools/libs/light/libxl_save_helper.c
diff --git a/tools/libxl/libxl_save_msgs_gen.pl b/tools/libs/light/libxl_save_msgs_gen.pl
similarity index 100%
rename from tools/libxl/libxl_save_msgs_gen.pl
rename to tools/libs/light/libxl_save_msgs_gen.pl
diff --git a/tools/libxl/libxl_sched.c b/tools/libs/light/libxl_sched.c
similarity index 100%
rename from tools/libxl/libxl_sched.c
rename to tools/libs/light/libxl_sched.c
diff --git a/tools/libxl/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
similarity index 100%
rename from tools/libxl/libxl_sr_stream_format.h
rename to tools/libs/light/libxl_sr_stream_format.h
diff --git a/tools/libxl/libxl_stream_read.c b/tools/libs/light/libxl_stream_read.c
similarity index 100%
rename from tools/libxl/libxl_stream_read.c
rename to tools/libs/light/libxl_stream_read.c
diff --git a/tools/libxl/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
similarity index 100%
rename from tools/libxl/libxl_stream_write.c
rename to tools/libs/light/libxl_stream_write.c
diff --git a/tools/libxl/libxl_test_fdevent.c b/tools/libs/light/libxl_test_fdevent.c
similarity index 100%
rename from tools/libxl/libxl_test_fdevent.c
rename to tools/libs/light/libxl_test_fdevent.c
diff --git a/tools/libxl/libxl_test_fdevent.h b/tools/libs/light/libxl_test_fdevent.h
similarity index 100%
rename from tools/libxl/libxl_test_fdevent.h
rename to tools/libs/light/libxl_test_fdevent.h
diff --git a/tools/libxl/libxl_test_timedereg.c b/tools/libs/light/libxl_test_timedereg.c
similarity index 100%
rename from tools/libxl/libxl_test_timedereg.c
rename to tools/libs/light/libxl_test_timedereg.c
diff --git a/tools/libxl/libxl_test_timedereg.h b/tools/libs/light/libxl_test_timedereg.h
similarity index 100%
rename from tools/libxl/libxl_test_timedereg.h
rename to tools/libs/light/libxl_test_timedereg.h
diff --git a/tools/libxl/libxl_tmem.c b/tools/libs/light/libxl_tmem.c
similarity index 100%
rename from tools/libxl/libxl_tmem.c
rename to tools/libs/light/libxl_tmem.c
diff --git a/tools/libxl/libxl_types.idl b/tools/libs/light/libxl_types.idl
similarity index 100%
rename from tools/libxl/libxl_types.idl
rename to tools/libs/light/libxl_types.idl
diff --git a/tools/libxl/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
similarity index 100%
rename from tools/libxl/libxl_types_internal.idl
rename to tools/libs/light/libxl_types_internal.idl
diff --git a/tools/libxl/libxl_usb.c b/tools/libs/light/libxl_usb.c
similarity index 100%
rename from tools/libxl/libxl_usb.c
rename to tools/libs/light/libxl_usb.c
diff --git a/tools/libxl/libxl_utils.c b/tools/libs/light/libxl_utils.c
similarity index 100%
rename from tools/libxl/libxl_utils.c
rename to tools/libs/light/libxl_utils.c
diff --git a/tools/libxl/libxl_uuid.c b/tools/libs/light/libxl_uuid.c
similarity index 100%
rename from tools/libxl/libxl_uuid.c
rename to tools/libs/light/libxl_uuid.c
diff --git a/tools/libxl/libxl_vdispl.c b/tools/libs/light/libxl_vdispl.c
similarity index 100%
rename from tools/libxl/libxl_vdispl.c
rename to tools/libs/light/libxl_vdispl.c
diff --git a/tools/libxl/libxl_vkb.c b/tools/libs/light/libxl_vkb.c
similarity index 100%
rename from tools/libxl/libxl_vkb.c
rename to tools/libs/light/libxl_vkb.c
diff --git a/tools/libxl/libxl_vnuma.c b/tools/libs/light/libxl_vnuma.c
similarity index 100%
rename from tools/libxl/libxl_vnuma.c
rename to tools/libs/light/libxl_vnuma.c
diff --git a/tools/libxl/libxl_vsnd.c b/tools/libs/light/libxl_vsnd.c
similarity index 100%
rename from tools/libxl/libxl_vsnd.c
rename to tools/libs/light/libxl_vsnd.c
diff --git a/tools/libxl/libxl_vtpm.c b/tools/libs/light/libxl_vtpm.c
similarity index 100%
rename from tools/libxl/libxl_vtpm.c
rename to tools/libs/light/libxl_vtpm.c
diff --git a/tools/libxl/libxl_x86.c b/tools/libs/light/libxl_x86.c
similarity index 100%
rename from tools/libxl/libxl_x86.c
rename to tools/libs/light/libxl_x86.c
diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
similarity index 100%
rename from tools/libxl/libxl_x86_acpi.c
rename to tools/libs/light/libxl_x86_acpi.c
diff --git a/tools/libxl/libxl_x86_acpi.h b/tools/libs/light/libxl_x86_acpi.h
similarity index 100%
rename from tools/libxl/libxl_x86_acpi.h
rename to tools/libs/light/libxl_x86_acpi.h
diff --git a/tools/libxl/libxl_xshelp.c b/tools/libs/light/libxl_xshelp.c
similarity index 100%
rename from tools/libxl/libxl_xshelp.c
rename to tools/libs/light/libxl_xshelp.c
diff --git a/tools/libxl/osdeps.c b/tools/libs/light/osdeps.c
similarity index 100%
rename from tools/libxl/osdeps.c
rename to tools/libs/light/osdeps.c
diff --git a/tools/libxl/test_common.c b/tools/libs/light/test_common.c
similarity index 100%
rename from tools/libxl/test_common.c
rename to tools/libs/light/test_common.c
diff --git a/tools/libxl/test_common.h b/tools/libs/light/test_common.h
similarity index 100%
rename from tools/libxl/test_common.h
rename to tools/libs/light/test_common.h
diff --git a/tools/libxl/test_fdderegrace.c b/tools/libs/light/test_fdderegrace.c
similarity index 100%
rename from tools/libxl/test_fdderegrace.c
rename to tools/libs/light/test_fdderegrace.c
diff --git a/tools/libxl/test_timedereg.c b/tools/libs/light/test_timedereg.c
similarity index 100%
rename from tools/libxl/test_timedereg.c
rename to tools/libs/light/test_timedereg.c
diff --git a/tools/libxl/xenlight.pc.in b/tools/libs/light/xenlight.pc.in
similarity index 100%
rename from tools/libxl/xenlight.pc.in
rename to tools/libs/light/xenlight.pc.in
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
index a9dc2ce994..685f368aed 100644
--- a/tools/libs/uselibs.mk
+++ b/tools/libs/uselibs.mk
@@ -26,3 +26,5 @@ LIBS_LIBS += vchan
 USELIBS_vchan := toollog store gnttab evtchn
 LIBS_LIBS += stat
 USELIBS_stat := ctrl store
+LIBS_LIBS += light
+USELIBS_light := toollog evtchn toolcore ctrl store hypfs guest
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 1476c7897f..8d930dc047 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -5,9 +5,6 @@
 XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-MAJOR = 4.15
-MINOR = 0
-
 XLUMAJOR = 4.15
 XLUMINOR = 0
 
@@ -15,107 +12,11 @@ CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
 	-Wno-declaration-after-statement -Wformat-nonliteral
 CFLAGS += -I. -fPIC
 
-ifeq ($(CONFIG_Linux),y)
-LIBUUID_LIBS += -luuid
-endif
-
-LIBXL_LIBS =
-LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
-ifeq ($(CONFIG_LIBNL),y)
-LIBXL_LIBS += $(LIBNL3_LIBS)
-endif
-ifeq ($(CONFIG_Linux),y)
-LIBXL_LIBS += -lrt
-endif
-
-CFLAGS_LIBXL += $(CFLAGS_libxentoollog)
-CFLAGS_LIBXL += $(CFLAGS_libxentoolcore)
-CFLAGS_LIBXL += $(CFLAGS_libxenevtchn)
-CFLAGS_LIBXL += $(CFLAGS_libxenctrl)
-CFLAGS_LIBXL += $(CFLAGS_libxenguest)
-CFLAGS_LIBXL += $(CFLAGS_libxenhypfs)
-CFLAGS_LIBXL += $(CFLAGS_libxenstore)
-ifeq ($(CONFIG_LIBNL),y)
-CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
-endif
-CFLAGS_LIBXL += -Wshadow
-ifeq ($(debug),y)
-CFLAGS_LIBXL += -DCONFIG_DEBUG
-endif
-
-LIBXL_LIBS-$(CONFIG_ARM) += -lfdt
-
 CFLAGS += $(PTHREAD_CFLAGS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
-LIBXL_LIBS += $(PTHREAD_LIBS)
-LIBXL_LIBS += $(LIBXL_LIBS-y)
 
 LIBXLU_LIBS = $(LDLIBS_libxenlight)
 
-LIBXL_OBJS-y = osdeps.o libxl_paths.o libxl_bootloader.o flexarray.o
-
-ifeq ($(CONFIG_LIBNL),y)
-LIBXL_OBJS-y += libxl_netbuffer.o
-else
-LIBXL_OBJS-y += libxl_nonetbuffer.o
-endif
-
-ifeq ($(CONFIG_X86),y)
-LIBXL_OBJS-y += libxl_convert_callout.o
-else
-LIBXL_OBJS-y += libxl_no_convert_callout.o
-endif
-
-LIBXL_OBJS-y += libxl_remus.o libxl_checkpoint_device.o libxl_remus_disk_drbd.o
-
-ifeq ($(CONFIG_LIBNL),y)
-LIBXL_OBJS-y += libxl_colo_restore.o libxl_colo_save.o
-LIBXL_OBJS-y += libxl_colo_qdisk.o
-LIBXL_OBJS-y += libxl_colo_proxy.o
-LIBXL_OBJS-y += libxl_colo_nic.o
-else
-LIBXL_OBJS-y += libxl_no_colo.o
-endif
-
-ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
-DSDT_FILES-$(CONFIG_X86) = dsdt_pvh.c
-ACPI_OBJS  = $(patsubst %.c,%.o,$(DSDT_FILES-y)) build.o static_tables.o
-$(DSDT_FILES-y): acpi
-$(ACPI_OBJS): CFLAGS += -I. -DLIBACPI_STDUTILS=\"$(CURDIR)/libxl_x86_acpi.h\"
-vpath build.c $(ACPI_PATH)/
-vpath static_tables.c $(ACPI_PATH)/
-LIBXL_OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
-
-.PHONY: acpi
-acpi:
-	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
-
-LIBXL_OBJS-$(CONFIG_X86) += libxl_cpuid.o libxl_x86.o libxl_psr.o libxl_x86_acpi.o
-LIBXL_OBJS-$(CONFIG_ARM) += libxl_nocpuid.o libxl_arm.o libxl_libfdt_compat.o
-ifeq ($(CONFIG_ARM_64),y)
-DSDT_FILES-y = dsdt_anycpu_arm.c
-LIBXL_OBJS-y += libxl_arm_acpi.o $(patsubst %.c,%.o,$(DSDT_FILES-y))
-dsdt_anycpu_arm.c:
-	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) DSDT_FILES="$(DSDT_FILES-y)"
-else
-LIBXL_OBJS-$(CONFIG_ARM) += libxl_arm_no_acpi.o
-endif
-
-ifeq ($(CONFIG_NetBSD),y)
-LIBXL_OBJS-y += libxl_netbsd.o
-else
-ifeq ($(CONFIG_Linux),y)
-LIBXL_OBJS-y += libxl_linux.o
-else
-ifeq ($(CONFIG_FreeBSD),y)
-LIBXL_OBJS-y += libxl_freebsd.o
-else
-$(error Your Operating System is not supported by libxenlight, \
-please check libxl_linux.c and libxl_netbsd.c to see how to get it ported)
-endif
-endif
-endif
-
 ifeq ($(FLEX),)
 %.c %.h:: %.l
 	$(warning Flex is needed to rebuild some libxl parsers and \
@@ -128,74 +29,16 @@ ifeq ($(BISON),)
 		  scanners, please install it an rerun configure)
 endif
 
-LIBXL_LIBS += -lyajl
-
-LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
-			libxl_dom.o libxl_exec.o libxl_xshelp.o libxl_device.o \
-			libxl_internal.o libxl_utils.o libxl_uuid.o \
-			libxl_json.o libxl_aoutils.o libxl_numa.o libxl_vnuma.o \
-			libxl_stream_read.o libxl_stream_write.o \
-			libxl_save_callout.o _libxl_save_msgs_callout.o \
-			libxl_qmp.o libxl_event.o libxl_fork.o \
-			libxl_dom_suspend.o libxl_dom_save.o libxl_usb.o \
-			libxl_vtpm.o libxl_nic.o libxl_disk.o libxl_console.o \
-			libxl_cpupool.o libxl_mem.o libxl_sched.o libxl_tmem.o \
-			libxl_9pfs.o libxl_domain.o libxl_vdispl.o \
-			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o $(LIBXL_OBJS-y)
-LIBXL_OBJS += libxl_genid.o
-LIBXL_OBJS += _libxl_types.o libxl_flask.o _libxl_types_internal.o
-
-LIBXL_TESTS += timedereg
-LIBXL_TESTS_PROGS = $(LIBXL_TESTS) fdderegrace
-LIBXL_TESTS_INSIDE = $(LIBXL_TESTS) fdevent
-
-# Each entry FOO in LIBXL_TESTS has two main .c files:
-#   libxl_test_FOO.c  "inside libxl" code to support the test case
-#   test_FOO.c        "outside libxl" code to exercise the test case
-# Conventionally there will also be:
-#   libxl_test_FOO.h  interface between the "inside" and "outside" parts
-# The "inside libxl" file is compiled exactly like a piece of libxl, and the
-# "outside libxl" file is compiled exactly like a piece of application
-# code.  They must share information via explicit libxl entrypoints.
-# Unlike proper parts of libxl, it is permissible for libxl_test_FOO.c
-# to use private global variables for its state.  Note that all the
-# "inside" parts are compiled into a single test library, so their
-# symbol names must be unique.
-#
-# To run these tests, either use LD_PRELOAD to get libxenlight_test.so
-# loaded, or rename it to libxenlight.so so it is the target of the
-# appropriate symlinks.
-
-LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.o)
-TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
-TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
-
-$(LIBXL_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
-
-AUTOINCS= libxlu_cfg_y.h libxlu_cfg_l.h _libxl_list.h _paths.h \
-	libxlu_disk_l.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
+AUTOINCS= libxlu_cfg_y.h libxlu_cfg_l.h libxlu_disk_l.h
 AUTOSRCS= libxlu_cfg_y.c libxlu_cfg_l.c
-AUTOSRCS += _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
 LIBXLU_OBJS = libxlu_cfg_y.o libxlu_cfg_l.o libxlu_cfg.o \
 	libxlu_disk_l.o libxlu_disk.o libxlu_vif.o libxlu_pci.o
 $(LIBXLU_OBJS): CFLAGS += $(CFLAGS_libxenctrl) # For xentoollog.h
 
-$(TEST_PROG_OBJS) _libxl.api-for-check: CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxentoolcore)
-
-CLIENTS = testidl libxl-save-helper
-
-libxl_dom.o: CFLAGS += -I$(XEN_ROOT)/tools  # include libacpi/x86.h
-libxl_x86_acpi.o: CFLAGS += -I$(XEN_ROOT)/tools
-
-SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
-$(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
-
-PKG_CONFIG = xenlight.pc xlutil.pc
-PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
+PKG_CONFIG = xlutil.pc
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
-xenlight.pc: PKG_CONFIG_VERSION = $(MAJOR).$(MINOR)
 xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
 $(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
 $(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
@@ -204,26 +47,16 @@ endif
 
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
-$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_VERSION = $(MAJOR).$(MINOR)
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
 
-testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
-testidl.c: libxl_types.idl gentest.py libxl.h $(AUTOINCS)
-	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
-	mv testidl.c.new testidl.c
-
 .PHONY: all
-all: $(CLIENTS) $(TEST_PROGS) $(PKG_CONFIG) $(PKG_CONFIG_LOCAL) \
-		libxenlight.so libxenlight.a libxlutil.so libxlutil.a \
-	$(AUTOSRCS) $(AUTOINCS) idl-external
+all: libxlutil.so libxlutil.a $(AUTOSRCS) $(AUTOINCS) $(PKG_CONFIG) $(PKG_CONFIG_LOCAL)
 
-$(LIBXL_OBJS) $(LIBXLU_OBJS) $(SAVE_HELPER_OBJS) \
-		$(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): \
-	$(AUTOINCS) libxl.api-ok
+$(LIBXLU_OBJS): $(AUTOINCS)
 
 %.c %.h:: %.y
 	@rm -f $*.[ch]
@@ -236,138 +69,42 @@ $(LIBXL_OBJS) $(LIBXLU_OBJS) $(SAVE_HELPER_OBJS) \
 genpath-target = $(call buildmakevars2header,_paths.h)
 $(eval $(genpath-target))
 
-libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
-	$(PERL) $^
-	touch $@
-
-_%.api-for-check: %.h $(AUTOINCS)
-	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -E $< $(APPEND_CFLAGS) \
-		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
-		>$@.new
-	mv -f $@.new $@
-
-_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=libxl >$@.new
-	$(call move-if-changed,$@.new,$@)
-
-_libxl_save_msgs_helper.c _libxl_save_msgs_callout.c \
-_libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
-		libxl_save_msgs_gen.pl
-	$(PERL) -w $< $@ >$@.new
-	$(call move-if-changed,$@.new,$@)
-
-libxl.h: _libxl_types.h _libxl_list.h
-libxl_json.h: _libxl_types_json.h
-libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h _paths.h
-libxl_internal_json.h: _libxl_types_internal_json.h
-xl.h: _paths.h
-
-$(LIBXL_OBJS) $(LIBXL_TEST_OBJS) $(LIBXLU_OBJS) \
-	$(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): libxl.h
-$(LIBXL_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
-
-_libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
-	$(eval stem = $(notdir $*))
-	$(PYTHON) gentypes.py libxl_type$(stem).idl __libxl_type$(stem).h __libxl_type$(stem)_private.h \
-		__libxl_type$(stem)_json.h  __libxl_type$(stem).c
-	$(call move-if-changed,__libxl_type$(stem).h,_libxl_type$(stem).h)
-	$(call move-if-changed,__libxl_type$(stem)_private.h,_libxl_type$(stem)_private.h)
-	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
-	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
-
-# NOTE: This is safe to do at the moment because idl-external and
-# idl-gen are only called from libxl/Makefile:all, which must return
-# before golang/Makefile is callid.  idl-external and idl-gen must
-# never be called from another part of the make system without careful thought
-# about races with tools/golang/xenlight/Makefile:all
-.PHONY: idl-external
-idl-external:
-	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
-
-LIBXL_IDLGEN_FILES = _libxl_types.h _libxl_types_json.h _libxl_types_private.h _libxl_types.c \
-	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c
-
-
-idl-gen: $(LIBXL_GEN_FILES) idl-external
-
-libxenlight.so: libxenlight.so.$(MAJOR)
-	$(SYMLINK_SHLIB) $< $@
-
-libxenlight.so.$(MAJOR): libxenlight.so.$(MAJOR).$(MINOR)
-	$(SYMLINK_SHLIB) $< $@
-
-libxenlight.so.$(MAJOR).$(MINOR): $(LIBXL_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LIBXL_LIBS) $(APPEND_LDFLAGS)
-
-libxenlight_test.so: $(LIBXL_OBJS) $(LIBXL_TEST_OBJS)
-	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LIBXL_LIBS) $(APPEND_LDFLAGS)
-
-libxenlight.a: $(LIBXL_OBJS)
-	$(AR) rcs libxenlight.a $^
-
 libxlutil.so: libxlutil.so.$(XLUMAJOR)
 	$(SYMLINK_SHLIB) $< $@
 
 libxlutil.so.$(XLUMAJOR): libxlutil.so.$(XLUMAJOR).$(XLUMINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-libxlutil.so.$(XLUMAJOR).$(XLUMINOR): $(LIBXLU_OBJS) libxenlight.so
+libxlutil.so.$(XLUMAJOR).$(XLUMINOR): $(LIBXLU_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxlutil.so.$(XLUMAJOR) $(SHLIB_LDFLAGS) -o $@ $(LIBXLU_OBJS) $(LIBXLU_LIBS) $(APPEND_LDFLAGS)
 
 libxlutil.a: $(LIBXLU_OBJS)
 	$(AR) rcs libxlutil.a $^
 
-test_%: test_%.o test_common.o libxenlight_test.so
-	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
-
-libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
-
-testidl: testidl.o libxenlight.so
-	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
-
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) libxl-save-helper $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_SHLIB) libxenlight.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxenlight.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenlight.so.$(MAJOR)
-	$(SYMLINK_SHLIB) libxenlight.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenlight.so
-	$(INSTALL_DATA) libxenlight.a $(DESTDIR)$(libdir)
 	$(INSTALL_SHLIB) libxlutil.so.$(XLUMAJOR).$(XLUMINOR) $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxlutil.so.$(XLUMAJOR).$(XLUMINOR) $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR)
 	$(SYMLINK_SHLIB) libxlutil.so.$(XLUMAJOR) $(DESTDIR)$(libdir)/libxlutil.so
 	$(INSTALL_DATA) libxlutil.a $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxl.h libxl_event.h libxl_json.h _libxl_types.h _libxl_types_json.h _libxl_list.h libxl_utils.h libxl_uuid.h libxlutil.h $(DESTDIR)$(includedir)
-	$(INSTALL_DATA) xenlight.pc $(DESTDIR)$(PKG_INSTALLDIR)
+	$(INSTALL_DATA) libxlutil.h $(DESTDIR)$(includedir)
 	$(INSTALL_DATA) xlutil.pc $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(PKG_INSTALLDIR)/,xlutil.pc xenlight.pc)
-	rm -f $(addprefix $(DESTDIR)$(includedir)/,libxl.h libxl_event.h libxl_json.h _libxl_types.h _libxl_types_json.h _libxl_list.h libxl_utils.h libxl_uuid.h libxlutil.h)
+	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xlutil.pc
+	rm -f $(DESTDIR)$(includedir)/libxlutil.h
 	rm -f $(DESTDIR)$(libdir)/libxlutil.a
 	rm -f $(DESTDIR)$(libdir)/libxlutil.so
 	rm -f $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxlutil.so.$(XLUMAJOR).$(XLUMINOR)
-	rm -f $(DESTDIR)$(libdir)/libxenlight.a
-	rm -f $(DESTDIR)$(libdir)/libxenlight.so
-	rm -f $(DESTDIR)$(libdir)/libxenlight.so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxenlight.so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(LIBEXEC_BIN)/libxl-save-helper
 
 .PHONY: clean
 clean:
-	$(RM) -f _*.h *.o *.so* *.a $(CLIENTS) $(DEPS_RM)
-	$(RM) -f _*.c *.pyc _paths.*.tmp _*.api-for-check
-	$(RM) -f testidl.c.new testidl.c *.api-ok
-	$(RM) -f $(TEST_PROGS)
-	$(RM) -f xenlight.pc
+	$(RM) -f _*.h *.o *.so* *.a $(DEPS_RM)
 	$(RM) -f xlutil.pc
-	$(RM) -rf __pycache__
-	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
 
 distclean: clean
 
diff --git a/tools/ocaml/libs/xl/Makefile b/tools/ocaml/libs/xl/Makefile
index 0d1549dd3a..cbe1569cc5 100644
--- a/tools/ocaml/libs/xl/Makefile
+++ b/tools/ocaml/libs/xl/Makefile
@@ -50,10 +50,10 @@ xenlight.mli: xenlight.mli.in _libxl_types.mli.in
 	  < xenlight.mli.in > xenlight.mli.tmp
 	$(Q)mv xenlight.mli.tmp xenlight.mli
 
-_libxl_types.ml.in _libxl_types.mli.in _libxl_types.inc: genwrap.py $(XEN_ROOT)/tools/libxl/libxl_types.idl \
-                $(XEN_ROOT)/tools/libxl/idl.py
-	PYTHONPATH=$(XEN_ROOT)/tools/libxl $(PYTHON) genwrap.py \
-		$(XEN_ROOT)/tools/libxl/libxl_types.idl \
+_libxl_types.ml.in _libxl_types.mli.in _libxl_types.inc: genwrap.py $(XEN_ROOT)/tools/libs/light/libxl_types.idl \
+                $(XEN_ROOT)/tools/libs/light/idl.py
+	PYTHONPATH=$(XEN_ROOT)/tools/libs/light $(PYTHON) genwrap.py \
+		$(XEN_ROOT)/tools/libs/light/libxl_types.idl \
 		_libxl_types.mli.in _libxl_types.ml.in _libxl_types.inc
 
 libs: $(LIBS)
-- 
2.26.2


