Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F122130A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:55:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkhC-0006Fb-Sz; Wed, 15 Jul 2020 16:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkhB-0006F0-G5
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:55:49 +0000
X-Inumbo-ID: 08084f72-c6bc-11ea-bca7-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08084f72-c6bc-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 16:55:48 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDz-0001sU-Qh; Wed, 15 Jul 2020 17:25:39 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 12/12] tools: generate most contents of library make variables
Date: Wed, 15 Jul 2020 17:25:11 +0100
Message-Id: <20200715162511.5941-14-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

Library related make variables (CFLAGS_lib*, SHDEPS_lib*, LDLIBS_lib*
and SHLIB_lib*) mostly have a common pattern for their values. Generate
most of this content automatically by adding a new per-library variable
defining on which other libraries a lib is depending. This in turn
makes it possible to drop the USELIB variable from each library
Makefile.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk                    | 103 ++++++++++--------------------
 tools/libs/call/Makefile          |   1 -
 tools/libs/ctrl/Makefile          |   1 -
 tools/libs/devicemodel/Makefile   |   1 -
 tools/libs/evtchn/Makefile        |   1 -
 tools/libs/foreignmemory/Makefile |   1 -
 tools/libs/gnttab/Makefile        |   1 -
 tools/libs/hypfs/Makefile         |   1 -
 tools/libs/libs.mk                |   5 +-
 tools/libs/stat/Makefile          |   1 -
 tools/libs/store/Makefile         |   1 -
 tools/libs/vchan/Makefile         |   1 -
 12 files changed, 35 insertions(+), 83 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 279df14152..89b28e3fad 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -12,18 +12,38 @@ INSTALL = $(XEN_ROOT)/tools/cross-install
 LDFLAGS += $(PREPEND_LDFLAGS_XEN_TOOLS)
 
 XEN_INCLUDE        = $(XEN_ROOT)/tools/include
-XEN_libxentoolcore = $(XEN_ROOT)/tools/libs/toolcore
-XEN_libxentoollog  = $(XEN_ROOT)/tools/libs/toollog
-XEN_libxenevtchn   = $(XEN_ROOT)/tools/libs/evtchn
-XEN_libxengnttab   = $(XEN_ROOT)/tools/libs/gnttab
-XEN_libxencall     = $(XEN_ROOT)/tools/libs/call
-XEN_libxenforeignmemory = $(XEN_ROOT)/tools/libs/foreignmemory
-XEN_libxendevicemodel = $(XEN_ROOT)/tools/libs/devicemodel
-XEN_libxenhypfs    = $(XEN_ROOT)/tools/libs/hypfs
-XEN_libxenctrl     = $(XEN_ROOT)/tools/libs/ctrl
-XEN_libxenstore    = $(XEN_ROOT)/tools/libs/store
-XEN_libxenstat     = $(XEN_ROOT)/tools/libs/stat
-XEN_libxenvchan    = $(XEN_ROOT)/tools/libs/vchan
+
+LIBS_LIBS += toolcore
+USELIBS_toolcore :=
+LIBS_LIBS += toollog
+USELIBS_toollog :=
+LIBS_LIBS += evtchn
+USELIBS_evtchn := toollog toolcore
+LIBS_LIBS += gnttab
+USELIBS_gnttab := toollog toolcore
+LIBS_LIBS += call
+USELIBS_call := toollog toolcore
+LIBS_LIBS += foreignmemory
+USELIBS_foreignmemory := toollog toolcore
+LIBS_LIBS += devicemodel
+USELIBS_devicemodel := toollog toolcore call
+LIBS_LIBS += hypfs
+USELIBS_hypfs := toollog toolcore call
+LIBS_LIBS += ctrl
+USELIBS_ctrl := toollog call evtchn gnttab foreignmemory devicemodel
+LIBS_LIBS += store
+USELIBS_store := toolcore
+LIBS_LIBS += stat
+USELIBS_stat := ctrl store
+LIBS_LIBS += vchan
+USELIBS_vchan := toollog store gnttab evtchn
+
+$(foreach lib,$(LIBS_LIBS),$(eval XEN_libxen$(lib) = $(XEN_ROOT)/tools/libs/$(lib)))
+$(foreach lib,$(LIBS_LIBS),$(eval CFLAGS_libxen$(lib) = -I$(XEN_libxen$(lib))/include $(CFLAGS_xeninclude)))
+$(foreach lib,$(LIBS_LIBS),$(eval SHDEPS_libxen$(lib) = $(foreach use,$(USELIBS_$(lib)),$(SHLIB_libxen$(use)))))
+$(foreach lib,$(LIBS_LIBS),$(eval LDLIBS_libxen$(lib) = $(SHDEPS_libxen$(lib)) $(XEN_libxen$(lib))/libxen$(lib)$(libextension)))
+$(foreach lib,$(LIBS_LIBS),$(eval SHLIB_libxen$(lib) = $(SHDEPS_libxen$(lib)) -Wl,-rpath-link=$(XEN_libxen$(lib))))
+
 XEN_libxenguest    = $(XEN_ROOT)/tools/libxc
 XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
@@ -98,76 +118,19 @@ endif
 # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
 # $(SHLIB_libfoo)
 
-CFLAGS_libxentoollog = -I$(XEN_libxentoollog)/include $(CFLAGS_xeninclude)
-SHDEPS_libxentoollog =
-LDLIBS_libxentoollog = $(SHDEPS_libxentoollog) $(XEN_libxentoollog)/libxentoollog$(libextension)
-SHLIB_libxentoollog  = $(SHDEPS_libxentoollog) -Wl,-rpath-link=$(XEN_libxentoollog)
-
-CFLAGS_libxentoolcore = -I$(XEN_libxentoolcore)/include $(CFLAGS_xeninclude)
-SHDEPS_libxentoolcore =
-LDLIBS_libxentoolcore = $(SHDEPS_libxentoolcore) $(XEN_libxentoolcore)/libxentoolcore$(libextension)
-SHLIB_libxentoolcore  = $(SHDEPS_libxentoolcore) -Wl,-rpath-link=$(XEN_libxentoolcore)
-
-CFLAGS_libxenevtchn = -I$(XEN_libxenevtchn)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenevtchn = $(SHLIB_libxentoolcore)
-LDLIBS_libxenevtchn = $(SHDEPS_libxenevtchn) $(XEN_libxenevtchn)/libxenevtchn$(libextension)
-SHLIB_libxenevtchn  = $(SHDEPS_libxenevtchn) -Wl,-rpath-link=$(XEN_libxenevtchn)
-
-CFLAGS_libxengnttab = -I$(XEN_libxengnttab)/include $(CFLAGS_xeninclude)
-SHDEPS_libxengnttab = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore)
-LDLIBS_libxengnttab = $(SHDEPS_libxengnttab) $(XEN_libxengnttab)/libxengnttab$(libextension)
-SHLIB_libxengnttab  = $(SHDEPS_libxengnttab) -Wl,-rpath-link=$(XEN_libxengnttab)
-
-CFLAGS_libxencall = -I$(XEN_libxencall)/include $(CFLAGS_xeninclude)
-SHDEPS_libxencall = $(SHLIB_libxentoolcore)
-LDLIBS_libxencall = $(SHDEPS_libxencall) $(XEN_libxencall)/libxencall$(libextension)
-SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_libxencall)
-
-CFLAGS_libxenforeignmemory = -I$(XEN_libxenforeignmemory)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore)
-LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory) $(XEN_libxenforeignmemory)/libxenforeignmemory$(libextension)
-SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory) -Wl,-rpath-link=$(XEN_libxenforeignmemory)
-
-CFLAGS_libxendevicemodel = -I$(XEN_libxendevicemodel)/include $(CFLAGS_xeninclude)
-SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
-LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_libxendevicemodel)/libxendevicemodel$(libextension)
-SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_libxendevicemodel)
-
-CFLAGS_libxenhypfs = -I$(XEN_libxenhypfs)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
-LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_libxenhypfs)/libxenhypfs$(libextension)
-SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_libxenhypfs)
-
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
-CFLAGS_libxenctrl = -I$(XEN_libxenctrl)/include $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) $(CFLAGS_xeninclude) -D__XEN_TOOLS__
-SHDEPS_libxenctrl = $(SHLIB_libxentoollog) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab) $(SHLIB_libxencall) $(SHLIB_libxenforeignmemory) $(SHLIB_libxendevicemodel)
-LDLIBS_libxenctrl = $(SHDEPS_libxenctrl) $(XEN_libxenctrl)/libxenctrl$(libextension)
-SHLIB_libxenctrl  = $(SHDEPS_libxenctrl) -Wl,-rpath-link=$(XEN_libxenctrl)
+CFLAGS_libxenctrl += (CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) -D__XEN_TOOLS__
 
 CFLAGS_libxenguest = -I$(XEN_libxenguest)/include $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory) $(CFLAGS_xeninclude)
 SHDEPS_libxenguest = $(SHLIB_libxenevtchn) $(SHLIB_libxenctrl)
 LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libextension)
 SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
 
-CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
-SHDEPS_libxenstore = $(SHLIB_libxentoolcore)
-LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_libxenstore)/libxenstore$(libextension)
-SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_libxenstore)
 ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
 endif
 
-CFLAGS_libxenstat  = -I$(XEN_libxenstat)/include
-SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
-LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_libxenstat)/libxenstat$(libextension)
-SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_libxenstat)
-
-CFLAGS_libxenvchan = -I$(XEN_libxenvchan)/include $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
-SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
-LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_libxenvchan)/libxenvchan$(libextension)
-SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_libxenvchan)
-
 ifeq ($(debug),y)
 # Disable optimizations
 CFLAGS += -O0 -fno-omit-frame-pointer
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 7994b411fa..acddc41928 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 LIBNAME  := call
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c buffer.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index bda0b43dfa..9d9b32cd2b 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 4.14
 MINOR    = 0
 LIBNAME  := ctrl
-USELIBS  := toollog call evtchn gnttab foreignmemory devicemodel
 
 SRCS-y       += xc_altp2m.c
 SRCS-y       += xc_core.c
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index d9d1d1b850..0c0d9114cb 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 3
 LIBNAME  := devicemodel
-USELIBS  := toollog toolcore call
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index d7aa4d402f..ea529e5fb7 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 1
 LIBNAME  := evtchn
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 823989681d..17057fc1e1 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 3
 LIBNAME  := foreignmemory
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index c0fffdac71..2467330d1a 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 2
 LIBNAME  := gnttab
-USELIBS  := toollog toolcore
 
 SRCS-GNTTAB            += gnttab_core.c
 SRCS-GNTSHR            += gntshr_core.c
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index b4c41f6189..af358547f2 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR    = 1
 MINOR    = 0
 LIBNAME  := hypfs
-USELIBS  := toollog toolcore call
 
 APPEND_LDFLAGS += -lz
 
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 764f5441e2..dde0360b1e 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -4,15 +4,14 @@
 #   LIBNAME: name of lib to build, will be prepended with "libxen"
 #   MAJOR:   major version of lib
 #   MINOR:   minor version of lib
-#   USELIBS: xen libs to use (e.g. "toolcore toollog")
 
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
 
 CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += -I./include $(CFLAGS_xeninclude)
-CFLAGS   += $(foreach lib, $(USELIBS), $(CFLAGS_libxen$(lib)))
+CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
-LDUSELIBS = $(foreach lib, $(USELIBS), $(LDLIBS_libxen$(lib)))
+LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 6162395a9a..87bfa1b91c 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -18,7 +18,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR = 4.14
 MINOR = 0
 LIBNAME  := stat
-USELIBS  := ctrl store
 
 CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenstore) $(CFLAGS_xeninclude) -include $(XEN_ROOT)/tools/config.h
 
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 76b30145cf..2aa8add521 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR = 3.0
 MINOR = 3
 LIBNAME  := store
-USELIBS  := toolcore
 
 ifeq ($(CONFIG_Linux),y)
 APPEND_LDFLAGS += -ldl
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index bf944d251c..5b59ff5265 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -4,7 +4,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 MAJOR = 4.14
 MINOR = 0
 LIBNAME  := vchan
-USELIBS  := toollog store evtchn gnttab
 
 CFLAGS += $(CFLAGS_libxenctrl)
 
-- 
2.20.1


