Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A62814EC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 16:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2189.6473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLx4-0007QA-4N; Fri, 02 Oct 2020 14:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2189.6473; Fri, 02 Oct 2020 14:22:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLx3-0007PY-Tc; Fri, 02 Oct 2020 14:22:25 +0000
Received: by outflank-mailman (input) for mailman id 2189;
 Fri, 02 Oct 2020 14:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOLx1-0007Ll-Gs
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3e0e85b-5246-4578-aa00-1090ff0bacdc;
 Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7007B1B8;
 Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOLx1-0007Ll-Gs
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:23 +0000
X-Inumbo-ID: e3e0e85b-5246-4578-aa00-1090ff0bacdc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e3e0e85b-5246-4578-aa00-1090ff0bacdc;
	Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601648537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4XP1g9Mr04Iv/bDO3Rv5p5eaw1xz0yirSPBgYk+Q6U=;
	b=jW1NFAJsHym+mJgJO96Iz0WZ2kfTf/UrhdoT7ZSh5PNTGGJ8B+6PFAtsOdJuUXqaB4ltDl
	dDNOWMbEOLI9KJM15SmZec/VwVyRq8dMF52ENylgmmRkvUmIgZqhGU7ZeM2QAdqdNTOc95
	deufqX0FV1yhlRe6N6rihAH9vZ2rzaY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C7007B1B8;
	Fri,  2 Oct 2020 14:22:16 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH 1/3] tools/libs: move official headers to common directory
Date: Fri,  2 Oct 2020 16:22:12 +0200
Message-Id: <20201002142214.3438-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
References: <20201002142214.3438-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of each library having an own include directory move the
official headers to tools/include instead. This will drop the need to
link those headers to tools/include and there is no need any longer
to have library-specific include paths when building Xen.

While at it remove setting of the unused variable
PKG_CONFIG_CFLAGS_LOCAL in libs/*/Makefile.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore                                    |  5 ++--
 stubdom/mini-os.mk                            |  2 +-
 tools/Rules.mk                                |  5 ++--
 tools/{libs/vchan => }/include/libxenvchan.h  |  0
 tools/{libs/light => }/include/libxl.h        |  0
 tools/{libs/light => }/include/libxl_event.h  |  0
 tools/{libs/light => }/include/libxl_json.h   |  0
 tools/{libs/light => }/include/libxl_utils.h  |  0
 tools/{libs/light => }/include/libxl_uuid.h   |  0
 tools/{libs/util => }/include/libxlutil.h     |  0
 tools/{libs/call => }/include/xencall.h       |  0
 tools/{libs/ctrl => }/include/xenctrl.h       |  0
 .../{libs/ctrl => }/include/xenctrl_compat.h  |  0
 .../devicemodel => }/include/xendevicemodel.h |  0
 tools/{libs/evtchn => }/include/xenevtchn.h   |  0
 .../include/xenforeignmemory.h                |  0
 tools/{libs/gnttab => }/include/xengnttab.h   |  0
 tools/{libs/guest => }/include/xenguest.h     |  0
 tools/{libs/hypfs => }/include/xenhypfs.h     |  0
 tools/{libs/stat => }/include/xenstat.h       |  0
 .../compat => include/xenstore-compat}/xs.h   |  0
 .../xenstore-compat}/xs_lib.h                 |  0
 tools/{libs/store => }/include/xenstore.h     |  0
 tools/{xenstore => include}/xenstore_lib.h    |  0
 .../{libs/toolcore => }/include/xentoolcore.h |  0
 .../include/xentoolcore_internal.h            |  0
 tools/{libs/toollog => }/include/xentoollog.h |  0
 tools/libs/call/Makefile                      |  3 ---
 tools/libs/ctrl/Makefile                      |  3 ---
 tools/libs/devicemodel/Makefile               |  3 ---
 tools/libs/evtchn/Makefile                    |  2 --
 tools/libs/foreignmemory/Makefile             |  3 ---
 tools/libs/gnttab/Makefile                    |  3 ---
 tools/libs/guest/Makefile                     |  3 ---
 tools/libs/hypfs/Makefile                     |  3 ---
 tools/libs/libs.mk                            | 10 +++----
 tools/libs/light/Makefile                     | 27 +++++++++----------
 tools/libs/stat/Makefile                      |  2 --
 tools/libs/store/Makefile                     | 11 +++-----
 tools/libs/toolcore/Makefile                  |  9 +++----
 tools/libs/toollog/Makefile                   |  2 --
 tools/libs/util/Makefile                      |  3 ---
 tools/libs/vchan/Makefile                     |  3 ---
 tools/ocaml/libs/xentoollog/Makefile          |  2 +-
 tools/ocaml/libs/xentoollog/genlevels.py      |  2 +-
 45 files changed, 30 insertions(+), 76 deletions(-)
 rename tools/{libs/vchan => }/include/libxenvchan.h (100%)
 rename tools/{libs/light => }/include/libxl.h (100%)
 rename tools/{libs/light => }/include/libxl_event.h (100%)
 rename tools/{libs/light => }/include/libxl_json.h (100%)
 rename tools/{libs/light => }/include/libxl_utils.h (100%)
 rename tools/{libs/light => }/include/libxl_uuid.h (100%)
 rename tools/{libs/util => }/include/libxlutil.h (100%)
 rename tools/{libs/call => }/include/xencall.h (100%)
 rename tools/{libs/ctrl => }/include/xenctrl.h (100%)
 rename tools/{libs/ctrl => }/include/xenctrl_compat.h (100%)
 rename tools/{libs/devicemodel => }/include/xendevicemodel.h (100%)
 rename tools/{libs/evtchn => }/include/xenevtchn.h (100%)
 rename tools/{libs/foreignmemory => }/include/xenforeignmemory.h (100%)
 rename tools/{libs/gnttab => }/include/xengnttab.h (100%)
 rename tools/{libs/guest => }/include/xenguest.h (100%)
 rename tools/{libs/hypfs => }/include/xenhypfs.h (100%)
 rename tools/{libs/stat => }/include/xenstat.h (100%)
 rename tools/{libs/store/include/compat => include/xenstore-compat}/xs.h (100%)
 rename tools/{libs/store/include/compat => include/xenstore-compat}/xs_lib.h (100%)
 rename tools/{libs/store => }/include/xenstore.h (100%)
 rename tools/{xenstore => include}/xenstore_lib.h (100%)
 rename tools/{libs/toolcore => }/include/xentoolcore.h (100%)
 rename tools/{libs/toolcore => }/include/xentoolcore_internal.h (100%)
 rename tools/{libs/toollog => }/include/xentoollog.h (100%)

diff --git a/.gitignore b/.gitignore
index 188495783e..0515ca0aca 100644
--- a/.gitignore
+++ b/.gitignore
@@ -143,7 +143,6 @@ tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
 tools/libs/light/xenlight.pc
-tools/libs/light/include/_*.h
 tools/libs/stat/_paths.h
 tools/libs/stat/headers.chk
 tools/libs/stat/libxenstat.map
@@ -153,7 +152,6 @@ tools/libs/store/list.h
 tools/libs/store/utils.h
 tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
-tools/libs/store/include/xenstore_lib.h
 tools/libs/util/*.pc
 tools/libs/util/_paths.h
 tools/libs/util/libxlu_cfg_y.output
@@ -231,7 +229,8 @@ tools/hotplug/Linux/xendomains
 tools/hotplug/NetBSD/rc.d/xencommons
 tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
-tools/include/*.h
+tools/include/_libxl*.h
+tools/include/_xentoolcore_list.h
 tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
index 420e9a8771..7e4968e026 100644
--- a/stubdom/mini-os.mk
+++ b/stubdom/mini-os.mk
@@ -5,7 +5,7 @@
 # XEN_ROOT
 # MINIOS_TARGET_ARCH
 
-XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/libs/store/include
+XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/include
 TOOLCORE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
 TOOLLOG_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
 EVTCHN_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
diff --git a/tools/Rules.mk b/tools/Rules.mk
index f3e0078927..f61da81f4a 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -87,7 +87,7 @@ endif
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
- CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
+ CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)
  SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
  LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/lib$$(FILENAME_$(1))$$(libextension)
  SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
@@ -97,8 +97,7 @@ $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
 
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
-CFLAGS_libxenctrl += $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) -D__XEN_TOOLS__
-CFLAGS_libxenguest += $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory)
+CFLAGS_libxenctrl += -D__XEN_TOOLS__
 
 ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
diff --git a/tools/libs/vchan/include/libxenvchan.h b/tools/include/libxenvchan.h
similarity index 100%
rename from tools/libs/vchan/include/libxenvchan.h
rename to tools/include/libxenvchan.h
diff --git a/tools/libs/light/include/libxl.h b/tools/include/libxl.h
similarity index 100%
rename from tools/libs/light/include/libxl.h
rename to tools/include/libxl.h
diff --git a/tools/libs/light/include/libxl_event.h b/tools/include/libxl_event.h
similarity index 100%
rename from tools/libs/light/include/libxl_event.h
rename to tools/include/libxl_event.h
diff --git a/tools/libs/light/include/libxl_json.h b/tools/include/libxl_json.h
similarity index 100%
rename from tools/libs/light/include/libxl_json.h
rename to tools/include/libxl_json.h
diff --git a/tools/libs/light/include/libxl_utils.h b/tools/include/libxl_utils.h
similarity index 100%
rename from tools/libs/light/include/libxl_utils.h
rename to tools/include/libxl_utils.h
diff --git a/tools/libs/light/include/libxl_uuid.h b/tools/include/libxl_uuid.h
similarity index 100%
rename from tools/libs/light/include/libxl_uuid.h
rename to tools/include/libxl_uuid.h
diff --git a/tools/libs/util/include/libxlutil.h b/tools/include/libxlutil.h
similarity index 100%
rename from tools/libs/util/include/libxlutil.h
rename to tools/include/libxlutil.h
diff --git a/tools/libs/call/include/xencall.h b/tools/include/xencall.h
similarity index 100%
rename from tools/libs/call/include/xencall.h
rename to tools/include/xencall.h
diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/include/xenctrl.h
similarity index 100%
rename from tools/libs/ctrl/include/xenctrl.h
rename to tools/include/xenctrl.h
diff --git a/tools/libs/ctrl/include/xenctrl_compat.h b/tools/include/xenctrl_compat.h
similarity index 100%
rename from tools/libs/ctrl/include/xenctrl_compat.h
rename to tools/include/xenctrl_compat.h
diff --git a/tools/libs/devicemodel/include/xendevicemodel.h b/tools/include/xendevicemodel.h
similarity index 100%
rename from tools/libs/devicemodel/include/xendevicemodel.h
rename to tools/include/xendevicemodel.h
diff --git a/tools/libs/evtchn/include/xenevtchn.h b/tools/include/xenevtchn.h
similarity index 100%
rename from tools/libs/evtchn/include/xenevtchn.h
rename to tools/include/xenevtchn.h
diff --git a/tools/libs/foreignmemory/include/xenforeignmemory.h b/tools/include/xenforeignmemory.h
similarity index 100%
rename from tools/libs/foreignmemory/include/xenforeignmemory.h
rename to tools/include/xenforeignmemory.h
diff --git a/tools/libs/gnttab/include/xengnttab.h b/tools/include/xengnttab.h
similarity index 100%
rename from tools/libs/gnttab/include/xengnttab.h
rename to tools/include/xengnttab.h
diff --git a/tools/libs/guest/include/xenguest.h b/tools/include/xenguest.h
similarity index 100%
rename from tools/libs/guest/include/xenguest.h
rename to tools/include/xenguest.h
diff --git a/tools/libs/hypfs/include/xenhypfs.h b/tools/include/xenhypfs.h
similarity index 100%
rename from tools/libs/hypfs/include/xenhypfs.h
rename to tools/include/xenhypfs.h
diff --git a/tools/libs/stat/include/xenstat.h b/tools/include/xenstat.h
similarity index 100%
rename from tools/libs/stat/include/xenstat.h
rename to tools/include/xenstat.h
diff --git a/tools/libs/store/include/compat/xs.h b/tools/include/xenstore-compat/xs.h
similarity index 100%
rename from tools/libs/store/include/compat/xs.h
rename to tools/include/xenstore-compat/xs.h
diff --git a/tools/libs/store/include/compat/xs_lib.h b/tools/include/xenstore-compat/xs_lib.h
similarity index 100%
rename from tools/libs/store/include/compat/xs_lib.h
rename to tools/include/xenstore-compat/xs_lib.h
diff --git a/tools/libs/store/include/xenstore.h b/tools/include/xenstore.h
similarity index 100%
rename from tools/libs/store/include/xenstore.h
rename to tools/include/xenstore.h
diff --git a/tools/xenstore/xenstore_lib.h b/tools/include/xenstore_lib.h
similarity index 100%
rename from tools/xenstore/xenstore_lib.h
rename to tools/include/xenstore_lib.h
diff --git a/tools/libs/toolcore/include/xentoolcore.h b/tools/include/xentoolcore.h
similarity index 100%
rename from tools/libs/toolcore/include/xentoolcore.h
rename to tools/include/xentoolcore.h
diff --git a/tools/libs/toolcore/include/xentoolcore_internal.h b/tools/include/xentoolcore_internal.h
similarity index 100%
rename from tools/libs/toolcore/include/xentoolcore_internal.h
rename to tools/include/xentoolcore_internal.h
diff --git a/tools/libs/toollog/include/xentoollog.h b/tools/include/xentoollog.h
similarity index 100%
rename from tools/libs/toollog/include/xentoollog.h
rename to tools/include/xentoollog.h
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 81c7478efd..4ed201b3b3 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -12,6 +12,3 @@ SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxencall)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 0071226d2a..4185dc3f22 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -62,9 +62,6 @@ $(eval $(genpath-target))
 
 $(LIB_OBJS) $(PIC_OBJS): _paths.h
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 clean: cleanlocal
 
 .PHONY: cleanlocal
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index 42417958f2..b67fc0fac1 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -12,6 +12,3 @@ SRCS-$(CONFIG_NetBSD)  += compat.c
 SRCS-$(CONFIG_MiniOS)  += compat.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxendevicemodel)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index aec76641e8..ad01a17b3d 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -12,5 +12,3 @@ SRCS-$(CONFIG_NetBSD)  += netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenevtchn)/include
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index cf444d3c1a..13850f7988 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -12,6 +12,3 @@ SRCS-$(CONFIG_NetBSD)  += compat.c netbsd.c
 SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenforeignmemory)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index d8d4d55e27..d86c49d243 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -14,6 +14,3 @@ SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
 SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxengnttab)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index f24732fbcd..5b4ad313cc 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -113,9 +113,6 @@ xc_private.h: _paths.h
 
 $(LIB_OBJS) $(PIC_OBJS): $(LINK_FILES)
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 .PHONY: cleanlocal
 cleanlocal:
 	rm -f libxenguest.map
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 668d68853f..39feca87e8 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -9,6 +9,3 @@ APPEND_LDFLAGS += -lz
 SRCS-y                 += core.c
 
 include ../libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenhypfs)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 325b7b7cea..959ff91a56 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -47,10 +47,10 @@ endif
 PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 
 LIBHEADER ?= $(LIB_FILE_NAME).h
-LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
-LIBHEADERSGLOB = $(foreach h, $(LIBHEADER), $(XEN_ROOT)/tools/include/$(h))
+LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
@@ -74,14 +74,11 @@ else
 .PHONY: headers.chk
 endif
 
-headers.chk: $(LIBHEADERSGLOB) $(AUTOINCS)
+headers.chk: $(AUTOINCS)
 
 libxen$(LIBNAME).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
-$(LIBHEADERSGLOB): $(LIBHEADERS)
-	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
-
 lib$(LIB_FILE_NAME).a: $(LIB_OBJS)
 	$(AR) rc $@ $^
 
@@ -123,7 +120,6 @@ clean:
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk
 	rm -f $(PKG_CONFIG)
-	rm -f $(LIBHEADERSGLOB)
 	rm -f _paths.h
 
 .PHONY: distclean
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index f58a3214e5..fbaffdf5a2 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -152,7 +152,7 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
 TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
 TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
 
-AUTOINCS = _libxl_list.h _paths.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
+AUTOINCS = $(XEN_INCLUDE)/_libxl_list.h _paths.h _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
 AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
 
 CLIENTS = testidl libxl-save-helper
@@ -165,9 +165,6 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(CURDIR)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 LDUSELIBS-y += $(PTYFUNCS_LIBS)
 LDUSELIBS-$(CONFIG_LIBNL) += $(LIBNL3_LIBS)
 LDUSELIBS-$(CONFIG_Linux) += -luuid
@@ -185,7 +182,7 @@ libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
 $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
 
 testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
-testidl.c: libxl_types.idl gentest.py include/libxl.h $(AUTOINCS)
+testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
 	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
 	mv testidl.c.new testidl.c
 
@@ -200,15 +197,15 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
 	$(PERL) $^
 	touch $@
 
-_%.api-for-check: include/%.h $(AUTOINCS)
-	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -c -E $< $(APPEND_CFLAGS) \
+_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
+	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_libxl.o) -c -E $< $(APPEND_CFLAGS) \
 		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
 		>$@.new
 	mv -f $@.new $@
 
-_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=libxl >$@.new
-	$(call move-if-changed,$@.new,$@)
+$(XEN_INCLUDE)/_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
+	$(PERL) $^ --prefix=libxl >$(notdir $@).new
+	$(call move-if-changed,$(notdir $@).new,$@)
 
 _libxl_save_msgs_helper.c _libxl_save_msgs_callout.c \
 _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
@@ -216,13 +213,13 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
 	$(PERL) -w $< $@ >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-include/libxl.h: _libxl_types.h _libxl_list.h
-include/libxl_json.h: _libxl_types_json.h
+$(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h $(XEN_INCLUDE)/_libxl_list.h
+$(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
 libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h _paths.h
 libxl_internal_json.h: _libxl_types_internal_json.h
 xl.h: _paths.h
 
-$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): include/libxl.h
+$(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
 $(LIB_OBJS) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
 
 _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_type%.idl gentypes.py idl.py
@@ -234,8 +231,8 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
 	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
 
-include/_%.h: _%.h
-	cp $< $@
+$(XEN_INCLUDE)/_%.h: _%.h
+	$(call move-if-changed,_$*.h,$(XEN_INCLUDE)/_$*.h)
 
 libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
 	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDUSELIBS) $(APPEND_LDFLAGS)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 5463f5f7ca..8353e96946 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -30,8 +30,6 @@ APPEND_LDFLAGS += $(LDLIBS-y)
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstat)/include
-
 $(LIB_OBJS): _paths.h
 
 PYLIB=bindings/swig/python/_xenstat.so
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 4da502646e..930e763de9 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -21,12 +21,12 @@ CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
-LINK_FILES = xs_lib.c include/xenstore_lib.h list.h utils.h
+LINK_FILES = xs_lib.c list.h utils.h
 
 $(LIB_OBJS): $(LINK_FILES)
 
 $(LINK_FILES):
-	ln -sf $(XEN_ROOT)/tools/xenstore/$(notdir $@) $@
+	ln -sf $(XEN_ROOT)/tools/xenstore/$@ $@
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
@@ -35,9 +35,6 @@ else
 PKG_CONFIG_REMOVE += -ldl
 endif
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstore)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 .PHONY: install
 install: install-headers
 
@@ -45,8 +42,8 @@ install: install-headers
 install-headers:
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)/xenstore-compat
-	$(INSTALL_DATA) include/compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
-	$(INSTALL_DATA) include/compat/xs_lib.h $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
+	$(INSTALL_DATA) $(XEN_INCLUDE)/xenstore-compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
+	$(INSTALL_DATA) $(XEN_INCLUDE)/xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
 	ln -sf xenstore-compat/xs.h  $(DESTDIR)$(includedir)/xs.h
 	ln -sf xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xs_lib.h
 
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 5819bbc8ee..1cf30733c9 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,18 +3,17 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
-AUTOINCS := include/_xentoolcore_list.h
+AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
 SRCS-y	+= handlereg.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 PKG_CONFIG_DESC := Central support for Xen Hypervisor userland libraries
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxentoolcore)/include
 
 $(LIB_OBJS): $(AUTOINCS)
 $(PIC_OBJS): $(AUTOINCS)
 
-include/_xentoolcore_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=xentoolcore >$@.new
-	$(call move-if-changed,$@.new,$@)
+$(XEN_INCLUDE)/_xentoolcore_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
+	$(PERL) $^ --prefix=xentoolcore >$(notdir $@).new
+	$(call move-if-changed,$(notdir $@).new,$@)
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 3f986835d6..dce1b2de85 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -8,5 +8,3 @@ SRCS-y	+= xtl_core.c
 SRCS-y	+= xtl_logger_stdio.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxentoollog)/include
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 0c9db8027d..b739360be7 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -39,9 +39,6 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenutil)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS) _paths.h
 
 %.c %.h:: %.y
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index 5e18d5b196..83a45d2817 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -12,9 +12,6 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenvchan)/include
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
-
 clean: cleanlocal
 
 .PHONY: cleanlocal
diff --git a/tools/ocaml/libs/xentoollog/Makefile b/tools/ocaml/libs/xentoollog/Makefile
index 8ae0a784fd..593f9e9e9d 100644
--- a/tools/ocaml/libs/xentoollog/Makefile
+++ b/tools/ocaml/libs/xentoollog/Makefile
@@ -49,7 +49,7 @@ xentoollog.mli: xentoollog.mli.in _xtl_levels.mli.in
 
 libs: $(LIBS)
 
-_xtl_levels.ml.in _xtl_levels.mli.in _xtl_levels.inc: genlevels.py $(XEN_ROOT)/tools/libs/toollog/include/xentoollog.h
+_xtl_levels.ml.in _xtl_levels.mli.in _xtl_levels.inc: genlevels.py $(XEN_INCLUDE)/xentoollog.h
 	$(PYTHON) genlevels.py _xtl_levels.mli.in _xtl_levels.ml.in _xtl_levels.inc
 
 .PHONY: install
diff --git a/tools/ocaml/libs/xentoollog/genlevels.py b/tools/ocaml/libs/xentoollog/genlevels.py
index f9cf853e26..11a623e459 100755
--- a/tools/ocaml/libs/xentoollog/genlevels.py
+++ b/tools/ocaml/libs/xentoollog/genlevels.py
@@ -6,7 +6,7 @@ import sys
 from functools import reduce
 
 def read_levels():
-	f = open('../../../libs/toollog/include/xentoollog.h', 'r')
+	f = open('../../../include/xentoollog.h', 'r')
 
 	levels = []
 	record = False
-- 
2.26.2


