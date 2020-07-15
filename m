Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E070221242
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkED-0002d9-Vy; Wed, 15 Jul 2020 16:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5qj=A2=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jvkEC-0002Yi-AI
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:25:52 +0000
X-Inumbo-ID: d0395734-c6b7-11ea-b7bb-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0395734-c6b7-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 16:25:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jvkDv-0001sU-SJ; Wed, 15 Jul 2020 17:25:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 02/12] tools: switch XEN_LIBXEN* make variables to lower case
 (XEN_libxen*)
Date: Wed, 15 Jul 2020 17:25:01 +0100
Message-Id: <20200715162511.5941-4-ian.jackson@eu.citrix.com>
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
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Juergen Gross <jgross@suse.com>

In order to harmonize names of library related make variables switch
XEN_LIBXEN* names to XEN_libxen*, as all other related variables (e.g.
CFLAGS_libxen*, SHDEPS_libxen*, ...) already use this pattern.

Rename XEN_LIBXC to XEN_libxenctrl, XEN_XENSTORE to XEN_libxenstore,
XEN_XENLIGHT to XEN_libxenlight, XEN_XLUTIL to XEN_libxlutil, and
XEN_LIBVCHAN to XEN_libxenvchan for the same reason.

Introduce XEN_libxenguest with the same value as XEN_libxenctrl.

No functional change.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk                    | 120 +++++++++++++++---------------
 tools/golang/xenlight/Makefile    |   4 +-
 tools/libs/call/Makefile          |   2 +-
 tools/libs/devicemodel/Makefile   |   2 +-
 tools/libs/evtchn/Makefile        |   2 +-
 tools/libs/foreignmemory/Makefile |   2 +-
 tools/libs/gnttab/Makefile        |   2 +-
 tools/libs/hypfs/Makefile         |   2 +-
 tools/libs/toolcore/Makefile      |   2 +-
 tools/libs/toollog/Makefile       |   2 +-
 tools/libvchan/Makefile           |   2 +-
 tools/libxc/Makefile              |   2 +-
 tools/xenstat/libxenstat/Makefile |   2 +-
 tools/xenstore/Makefile           |   2 +-
 14 files changed, 75 insertions(+), 73 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 5ed5664bf7..b42e50ebf6 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -12,21 +12,23 @@ INSTALL = $(XEN_ROOT)/tools/cross-install
 LDFLAGS += $(PREPEND_LDFLAGS_XEN_TOOLS)
 
 XEN_INCLUDE        = $(XEN_ROOT)/tools/include
-XEN_LIBXENTOOLCORE  = $(XEN_ROOT)/tools/libs/toolcore
-XEN_LIBXENTOOLLOG  = $(XEN_ROOT)/tools/libs/toollog
-XEN_LIBXENEVTCHN   = $(XEN_ROOT)/tools/libs/evtchn
-XEN_LIBXENGNTTAB   = $(XEN_ROOT)/tools/libs/gnttab
-XEN_LIBXENCALL     = $(XEN_ROOT)/tools/libs/call
-XEN_LIBXENFOREIGNMEMORY = $(XEN_ROOT)/tools/libs/foreignmemory
-XEN_LIBXENDEVICEMODEL = $(XEN_ROOT)/tools/libs/devicemodel
-XEN_LIBXENHYPFS    = $(XEN_ROOT)/tools/libs/hypfs
-XEN_LIBXC          = $(XEN_ROOT)/tools/libxc
-XEN_XENLIGHT       = $(XEN_ROOT)/tools/libxl
+XEN_libxentoolcore = $(XEN_ROOT)/tools/libs/toolcore
+XEN_libxentoollog  = $(XEN_ROOT)/tools/libs/toollog
+XEN_libxenevtchn   = $(XEN_ROOT)/tools/libs/evtchn
+XEN_libxengnttab   = $(XEN_ROOT)/tools/libs/gnttab
+XEN_libxencall     = $(XEN_ROOT)/tools/libs/call
+XEN_libxenforeignmemory = $(XEN_ROOT)/tools/libs/foreignmemory
+XEN_libxendevicemodel = $(XEN_ROOT)/tools/libs/devicemodel
+XEN_libxenhypfs    = $(XEN_ROOT)/tools/libs/hypfs
+XEN_libxenctrl     = $(XEN_ROOT)/tools/libxc
+# Currently libxenguest lives in the same directory as libxenctrl
+XEN_libxenguest    = $(XEN_libxenctrl)
+XEN_libxenlight    = $(XEN_ROOT)/tools/libxl
 # Currently libxlutil lives in the same directory as libxenlight
-XEN_XLUTIL         = $(XEN_XENLIGHT)
-XEN_XENSTORE       = $(XEN_ROOT)/tools/xenstore
-XEN_LIBXENSTAT     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
-XEN_LIBVCHAN       = $(XEN_ROOT)/tools/libvchan
+XEN_libxlutil      = $(XEN_libxenlight)
+XEN_libxenstore    = $(XEN_ROOT)/tools/xenstore
+XEN_libxenstat     = $(XEN_ROOT)/tools/xenstat/libxenstat/src
+XEN_libxenvchan    = $(XEN_ROOT)/tools/libvchan
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -97,75 +99,75 @@ endif
 # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
 # $(SHLIB_libfoo)
 
-CFLAGS_libxentoollog = -I$(XEN_LIBXENTOOLLOG)/include $(CFLAGS_xeninclude)
+CFLAGS_libxentoollog = -I$(XEN_libxentoollog)/include $(CFLAGS_xeninclude)
 SHDEPS_libxentoollog =
-LDLIBS_libxentoollog = $(SHDEPS_libxentoollog) $(XEN_LIBXENTOOLLOG)/libxentoollog$(libextension)
-SHLIB_libxentoollog  = $(SHDEPS_libxentoollog) -Wl,-rpath-link=$(XEN_LIBXENTOOLLOG)
+LDLIBS_libxentoollog = $(SHDEPS_libxentoollog) $(XEN_libxentoollog)/libxentoollog$(libextension)
+SHLIB_libxentoollog  = $(SHDEPS_libxentoollog) -Wl,-rpath-link=$(XEN_libxentoollog)
 
-CFLAGS_libxentoolcore = -I$(XEN_LIBXENTOOLCORE)/include $(CFLAGS_xeninclude)
+CFLAGS_libxentoolcore = -I$(XEN_libxentoolcore)/include $(CFLAGS_xeninclude)
 SHDEPS_libxentoolcore =
-LDLIBS_libxentoolcore = $(SHDEPS_libxentoolcore) $(XEN_LIBXENTOOLCORE)/libxentoolcore$(libextension)
-SHLIB_libxentoolcore  = $(SHDEPS_libxentoolcore) -Wl,-rpath-link=$(XEN_LIBXENTOOLCORE)
+LDLIBS_libxentoolcore = $(SHDEPS_libxentoolcore) $(XEN_libxentoolcore)/libxentoolcore$(libextension)
+SHLIB_libxentoolcore  = $(SHDEPS_libxentoolcore) -Wl,-rpath-link=$(XEN_libxentoolcore)
 
-CFLAGS_libxenevtchn = -I$(XEN_LIBXENEVTCHN)/include $(CFLAGS_xeninclude)
+CFLAGS_libxenevtchn = -I$(XEN_libxenevtchn)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenevtchn = $(SHLIB_libxentoolcore)
-LDLIBS_libxenevtchn = $(SHDEPS_libxenevtchn) $(XEN_LIBXENEVTCHN)/libxenevtchn$(libextension)
-SHLIB_libxenevtchn  = $(SHDEPS_libxenevtchn) -Wl,-rpath-link=$(XEN_LIBXENEVTCHN)
+LDLIBS_libxenevtchn = $(SHDEPS_libxenevtchn) $(XEN_libxenevtchn)/libxenevtchn$(libextension)
+SHLIB_libxenevtchn  = $(SHDEPS_libxenevtchn) -Wl,-rpath-link=$(XEN_libxenevtchn)
 
-CFLAGS_libxengnttab = -I$(XEN_LIBXENGNTTAB)/include $(CFLAGS_xeninclude)
+CFLAGS_libxengnttab = -I$(XEN_libxengnttab)/include $(CFLAGS_xeninclude)
 SHDEPS_libxengnttab = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore)
-LDLIBS_libxengnttab = $(SHDEPS_libxengnttab) $(XEN_LIBXENGNTTAB)/libxengnttab$(libextension)
-SHLIB_libxengnttab  = $(SHDEPS_libxengnttab) -Wl,-rpath-link=$(XEN_LIBXENGNTTAB)
+LDLIBS_libxengnttab = $(SHDEPS_libxengnttab) $(XEN_libxengnttab)/libxengnttab$(libextension)
+SHLIB_libxengnttab  = $(SHDEPS_libxengnttab) -Wl,-rpath-link=$(XEN_libxengnttab)
 
-CFLAGS_libxencall = -I$(XEN_LIBXENCALL)/include $(CFLAGS_xeninclude)
+CFLAGS_libxencall = -I$(XEN_libxencall)/include $(CFLAGS_xeninclude)
 SHDEPS_libxencall = $(SHLIB_libxentoolcore)
-LDLIBS_libxencall = $(SHDEPS_libxencall) $(XEN_LIBXENCALL)/libxencall$(libextension)
-SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_LIBXENCALL)
+LDLIBS_libxencall = $(SHDEPS_libxencall) $(XEN_libxencall)/libxencall$(libextension)
+SHLIB_libxencall  = $(SHDEPS_libxencall) -Wl,-rpath-link=$(XEN_libxencall)
 
-CFLAGS_libxenforeignmemory = -I$(XEN_LIBXENFOREIGNMEMORY)/include $(CFLAGS_xeninclude)
+CFLAGS_libxenforeignmemory = -I$(XEN_libxenforeignmemory)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenforeignmemory = $(SHLIB_libxentoolcore)
-LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory) $(XEN_LIBXENFOREIGNMEMORY)/libxenforeignmemory$(libextension)
-SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory) -Wl,-rpath-link=$(XEN_LIBXENFOREIGNMEMORY)
+LDLIBS_libxenforeignmemory = $(SHDEPS_libxenforeignmemory) $(XEN_libxenforeignmemory)/libxenforeignmemory$(libextension)
+SHLIB_libxenforeignmemory  = $(SHDEPS_libxenforeignmemory) -Wl,-rpath-link=$(XEN_libxenforeignmemory)
 
-CFLAGS_libxendevicemodel = -I$(XEN_LIBXENDEVICEMODEL)/include $(CFLAGS_xeninclude)
+CFLAGS_libxendevicemodel = -I$(XEN_libxendevicemodel)/include $(CFLAGS_xeninclude)
 SHDEPS_libxendevicemodel = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
-LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_LIBXENDEVICEMODEL)/libxendevicemodel$(libextension)
-SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_LIBXENDEVICEMODEL)
+LDLIBS_libxendevicemodel = $(SHDEPS_libxendevicemodel) $(XEN_libxendevicemodel)/libxendevicemodel$(libextension)
+SHLIB_libxendevicemodel  = $(SHDEPS_libxendevicemodel) -Wl,-rpath-link=$(XEN_libxendevicemodel)
 
-CFLAGS_libxenhypfs = -I$(XEN_LIBXENHYPFS)/include $(CFLAGS_xeninclude)
+CFLAGS_libxenhypfs = -I$(XEN_libxenhypfs)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenhypfs = $(SHLIB_libxentoollog) $(SHLIB_libxentoolcore) $(SHLIB_libxencall)
-LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_LIBXENHYPFS)/libxenhypfs$(libextension)
-SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_LIBXENHYPFS)
+LDLIBS_libxenhypfs = $(SHDEPS_libxenhypfs) $(XEN_libxenhypfs)/libxenhypfs$(libextension)
+SHLIB_libxenhypfs  = $(SHDEPS_libxenhypfs) -Wl,-rpath-link=$(XEN_libxenhypfs)
 
 # code which compiles against libxenctrl get __XEN_TOOLS__ and
 # therefore sees the unstable hypercall interfaces.
-CFLAGS_libxenctrl = -I$(XEN_LIBXC)/include $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) $(CFLAGS_xeninclude) -D__XEN_TOOLS__
+CFLAGS_libxenctrl = -I$(XEN_libxenctrl)/include $(CFLAGS_libxentoollog) $(CFLAGS_libxenforeignmemory) $(CFLAGS_libxendevicemodel) $(CFLAGS_xeninclude) -D__XEN_TOOLS__
 SHDEPS_libxenctrl = $(SHLIB_libxentoollog) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab) $(SHLIB_libxencall) $(SHLIB_libxenforeignmemory) $(SHLIB_libxendevicemodel)
-LDLIBS_libxenctrl = $(SHDEPS_libxenctrl) $(XEN_LIBXC)/libxenctrl$(libextension)
-SHLIB_libxenctrl  = $(SHDEPS_libxenctrl) -Wl,-rpath-link=$(XEN_LIBXC)
+LDLIBS_libxenctrl = $(SHDEPS_libxenctrl) $(XEN_libxenctrl)/libxenctrl$(libextension)
+SHLIB_libxenctrl  = $(SHDEPS_libxenctrl) -Wl,-rpath-link=$(XEN_libxenctrl)
 
-CFLAGS_libxenguest = -I$(XEN_LIBXC)/include $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory) $(CFLAGS_xeninclude)
+CFLAGS_libxenguest = -I$(XEN_libxenguest)/include $(CFLAGS_libxenevtchn) $(CFLAGS_libxenforeignmemory) $(CFLAGS_xeninclude)
 SHDEPS_libxenguest = $(SHLIB_libxenevtchn)
-LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_LIBXC)/libxenguest$(libextension)
-SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_LIBXC)
+LDLIBS_libxenguest = $(SHDEPS_libxenguest) $(XEN_libxenguest)/libxenguest$(libextension)
+SHLIB_libxenguest  = $(SHDEPS_libxenguest) -Wl,-rpath-link=$(XEN_libxenguest)
 
-CFLAGS_libxenstore = -I$(XEN_XENSTORE)/include $(CFLAGS_xeninclude)
+CFLAGS_libxenstore = -I$(XEN_libxenstore)/include $(CFLAGS_xeninclude)
 SHDEPS_libxenstore = $(SHLIB_libxentoolcore)
-LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_XENSTORE)/libxenstore$(libextension)
-SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_XENSTORE)
+LDLIBS_libxenstore = $(SHDEPS_libxenstore) $(XEN_libxenstore)/libxenstore$(libextension)
+SHLIB_libxenstore  = $(SHDEPS_libxenstore) -Wl,-rpath-link=$(XEN_libxenstore)
 ifeq ($(CONFIG_Linux),y)
 LDLIBS_libxenstore += -ldl
 endif
 
-CFLAGS_libxenstat  = -I$(XEN_LIBXENSTAT)
+CFLAGS_libxenstat  = -I$(XEN_libxenstat)
 SHDEPS_libxenstat  = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
-LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_LIBXENSTAT)/libxenstat$(libextension)
-SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_LIBXENSTAT)
+LDLIBS_libxenstat  = $(SHDEPS_libxenstat) $(XEN_libxenstat)/libxenstat$(libextension)
+SHLIB_libxenstat   = $(SHDEPS_libxenstat) -Wl,-rpath-link=$(XEN_libxenstat)
 
-CFLAGS_libxenvchan = -I$(XEN_LIBVCHAN) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
+CFLAGS_libxenvchan = -I$(XEN_libxenvchan) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 SHDEPS_libxenvchan = $(SHLIB_libxentoollog) $(SHLIB_libxenstore) $(SHLIB_libxenevtchn) $(SHLIB_libxengnttab)
-LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_LIBVCHAN)/libxenvchan$(libextension)
-SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_LIBVCHAN)
+LDLIBS_libxenvchan = $(SHDEPS_libxenvchan) $(XEN_libxenvchan)/libxenvchan$(libextension)
+SHLIB_libxenvchan  = $(SHDEPS_libxenvchan) -Wl,-rpath-link=$(XEN_libxenvchan)
 
 ifeq ($(debug),y)
 # Disable optimizations
@@ -176,15 +178,15 @@ else
 CFLAGS += -O2 -fomit-frame-pointer
 endif
 
-CFLAGS_libxenlight = -I$(XEN_XENLIGHT) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
+CFLAGS_libxenlight = -I$(XEN_libxenlight) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
 SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs)
-LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_XENLIGHT)/libxenlight$(libextension)
-SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_XENLIGHT)
+LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_libxenlight)/libxenlight$(libextension)
+SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_libxenlight)
 
-CFLAGS_libxlutil = -I$(XEN_XLUTIL)
+CFLAGS_libxlutil = -I$(XEN_libxlutil)
 SHDEPS_libxlutil = $(SHLIB_libxenlight)
-LDLIBS_libxlutil = $(SHDEPS_libxlutil) $(XEN_XLUTIL)/libxlutil$(libextension)
-SHLIB_libxlutil  = $(SHDEPS_libxlutil) -Wl,-rpath-link=$(XEN_XLUTIL)
+LDLIBS_libxlutil = $(SHDEPS_libxlutil) $(XEN_libxlutil)/libxlutil$(libextension)
+SHLIB_libxlutil  = $(SHDEPS_libxlutil) -Wl,-rpath-link=$(XEN_libxlutil)
 
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
 
diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index eac9dbf12a..a83fff7573 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -30,11 +30,11 @@ idl-gen: $(GOXL_GEN_FILES)
 #
 # NB that because the users of this library need to be able to
 # recompile the library from source, it needs to include '-lxenlight'
-# in the LDFLAGS; and thus we need to add -L$(XEN_XENLIGHT) here
+# in the LDFLAGS; and thus we need to add -L$(XEN_libxenlight) here
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_XENLIGHT) -L$(XEN_LIBXENTOOLLOG)" $(GO) build -x
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog)" $(GO) build -x
 
 .PHONY: install
 install: build
diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 7f6dc3fcbd..7994b411fa 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -15,5 +15,5 @@ SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENCALL)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxencall)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index 61bfa35273..d9d1d1b850 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -15,5 +15,5 @@ SRCS-$(CONFIG_MiniOS)  += compat.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENDEVICEMODEL)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxendevicemodel)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index 9206f622ef..d7aa4d402f 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -15,4 +15,4 @@ SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENEVTCHN)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenevtchn)/include
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index 28f1bddc96..823989681d 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -15,5 +15,5 @@ SRCS-$(CONFIG_MiniOS)  += minios.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENFOREIGNMEMORY)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenforeignmemory)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 2da8fbbb7f..c0fffdac71 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -17,5 +17,5 @@ SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENGNTTAB)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxengnttab)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 06dd449929..b4c41f6189 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -12,5 +12,5 @@ SRCS-y                 += core.c
 
 include ../libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENHYPFS)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenhypfs)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 9c5a92d93f..85ff2b26fd 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -10,7 +10,7 @@ SRCS-y	+= handlereg.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENTOOLCORE)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxentoolcore)/include
 
 $(LIB_OBJS): $(AUTOINCS)
 $(PIC_OBJS): $(AUTOINCS)
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 9156e5d08e..2d3ae4e627 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -10,4 +10,4 @@ SRCS-y	+= xtl_logger_stdio.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENTOOLLOG)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxentoollog)/include
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
index 913bcc8884..025a935cb7 100644
--- a/tools/libvchan/Makefile
+++ b/tools/libvchan/Makefile
@@ -35,7 +35,7 @@ endif
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBVCHAN)
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenvchan)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
 
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index fae5969a73..1e64116bd4 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -168,7 +168,7 @@ endif
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXC)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenctrl)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
 
diff --git a/tools/xenstat/libxenstat/Makefile b/tools/xenstat/libxenstat/Makefile
index 03cb212e3b..3d05ecdd9f 100644
--- a/tools/xenstat/libxenstat/Makefile
+++ b/tools/xenstat/libxenstat/Makefile
@@ -50,7 +50,7 @@ endif
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_LIBXENSTAT)
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstat)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 445e9911b2..0a64ac1571 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -128,7 +128,7 @@ endif
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
-$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_XENSTORE)/include
+$(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxenstore)/include
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_CFLAGS_LOCAL = $(CFLAGS_xeninclude)
 
-- 
2.20.1


