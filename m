Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C48C24EC79
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:35:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mPQ-0004tH-1u; Sun, 23 Aug 2020 09:35:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mPP-0004t9-2Y
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:35:27 +0000
X-Inumbo-ID: 49da23b1-b10f-40a4-bf47-daf5264da9ff
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49da23b1-b10f-40a4-bf47-daf5264da9ff;
 Sun, 23 Aug 2020 09:35:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E851DADC4;
 Sun, 23 Aug 2020 09:35:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/38] tools: generate most contents of library make
 variables
Date: Sun, 23 Aug 2020 11:34:47 +0200
Message-Id: <20200823093519.18386-7-jgross@suse.com>
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

Library related make variables (CFLAGS_lib*, SHDEPS_lib*, LDLIBS_lib*
and SHLIB_lib*) mostly have a common pattern for their values. Generate
most of this content automatically by adding a new per-library variable
defining on which other libraries a lib is depending. Those definitions
are put into an own file in order to make it possible to include it
from various Makefiles, especially for stubdom.

This in turn makes it possible to drop the USELIB variable from each
library Makefile.

The LIBNAME variable can be dropped, too, as it can be derived from the
directory name the library is residing in.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk                    | 59 +++++++------------------------
 tools/libs/call/Makefile          |  2 --
 tools/libs/devicemodel/Makefile   |  2 --
 tools/libs/evtchn/Makefile        |  2 --
 tools/libs/foreignmemory/Makefile |  2 --
 tools/libs/gnttab/Makefile        |  2 --
 tools/libs/hypfs/Makefile         |  2 --
 tools/libs/libs.mk                |  8 ++---
 tools/libs/toolcore/Makefile      |  1 -
 tools/libs/toollog/Makefile       |  1 -
 tools/libs/uselibs.mk             | 18 ++++++++++
 11 files changed, 34 insertions(+), 65 deletions(-)
 create mode 100644 tools/libs/uselibs.mk

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5d699cfd39..7e019a8a65 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -12,14 +12,9 @@ INSTALL = $(XEN_ROOT)/tools/cross-install
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
+
+include $(XEN_ROOT)/tools/libs/uselibs.mk
+
 XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
 # Currently libxenguest lives in the same directory as libxenctrl
 XEN_libxenguest    = $(XEN_libxenctrl)
@@ -99,45 +94,15 @@ endif
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
+define LIB_defs =
+ XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
+ CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
+ SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
+ LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/libxen$(1)$$(libextension)
+ SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
+endef
+
+$(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
 
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 7994b411fa..81c7478efd 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
-LIBNAME  := call
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c buffer.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index d9d1d1b850..42417958f2 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 3
-LIBNAME  := devicemodel
-USELIBS  := toollog toolcore call
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index d7aa4d402f..aec76641e8 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 1
-LIBNAME  := evtchn
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 823989681d..cf444d3c1a 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 3
-LIBNAME  := foreignmemory
-USELIBS  := toollog toolcore
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += linux.c
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index c0fffdac71..d8d4d55e27 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
-LIBNAME  := gnttab
-USELIBS  := toollog toolcore
 
 SRCS-GNTTAB            += gnttab_core.c
 SRCS-GNTSHR            += gntshr_core.c
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index b4c41f6189..668d68853f 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -3,8 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 0
-LIBNAME  := hypfs
-USELIBS  := toollog toolcore call
 
 APPEND_LDFLAGS += -lz
 
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 764f5441e2..19efc5e743 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -1,18 +1,18 @@
 # Common Makefile for building a lib.
 #
 # Variables taken as input:
-#   LIBNAME: name of lib to build, will be prepended with "libxen"
 #   MAJOR:   major version of lib
 #   MINOR:   minor version of lib
-#   USELIBS: xen libs to use (e.g. "toolcore toollog")
+
+LIBNAME := $(notdir $(CURDIR))
 
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
 
 CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += -I./include $(CFLAGS_xeninclude)
-CFLAGS   += $(foreach lib, $(USELIBS), $(CFLAGS_libxen$(lib)))
+CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
-LDUSELIBS = $(foreach lib, $(USELIBS), $(LDLIBS_libxen$(lib)))
+LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 85ff2b26fd..34b08a4236 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
-LIBNAME  := toolcore
 AUTOINCS := include/_xentoolcore_list.h
 
 SRCS-y	+= handlereg.c
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 2d3ae4e627..3f986835d6 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -3,7 +3,6 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
-LIBNAME  := toollog
 
 SRCS-y	+= xtl_core.c
 SRCS-y	+= xtl_logger_stdio.c
diff --git a/tools/libs/uselibs.mk b/tools/libs/uselibs.mk
new file mode 100644
index 0000000000..db73fe314e
--- /dev/null
+++ b/tools/libs/uselibs.mk
@@ -0,0 +1,18 @@
+# Libraries below tools/libs/ and their dependencies
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
-- 
2.26.2


