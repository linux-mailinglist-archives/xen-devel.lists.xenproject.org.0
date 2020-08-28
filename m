Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F6255D65
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfzJ-0004rg-NV; Fri, 28 Aug 2020 15:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzH-0004eL-I2
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:19 +0000
X-Inumbo-ID: 3e2f7675-d5ef-428b-8027-88930ddea09a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e2f7675-d5ef-428b-8027-88930ddea09a;
 Fri, 28 Aug 2020 15:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D409AE55;
 Fri, 28 Aug 2020 15:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 01/31] tools: generate pkg-config files from make variables
Date: Fri, 28 Aug 2020 17:07:17 +0200
Message-Id: <20200828150747.25305-2-jgross@suse.com>
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

For each library built two variants of pkg-config files are created
from a per-library template: an "official" one for installation on
the user's system, and one used for building internal tools, like e.g.
qemu.

Instead of the template which is looking very similar for all libraries
generate the pkg-config files directly from make variables.

This will reduce the need to specify some pkg-config file entries in
the templates, as the contents can easily be generated from available
data (e.g. "Version:" and "Requires.private:" entries).

Especially the variant used for building internal tools needs to gain
additional runtime link parameters for the internally used libraries,
as otherwise those won't be found by the users (e.g. qemu).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile                              |  1 -
 tools/Rules.mk                                | 52 +++++++++++--------
 tools/libs/call/xencall.pc.in                 | 10 ----
 tools/libs/devicemodel/xendevicemodel.pc.in   | 10 ----
 tools/libs/evtchn/xenevtchn.pc.in             | 10 ----
 .../libs/foreignmemory/xenforeignmemory.pc.in | 10 ----
 tools/libs/gnttab/xengnttab.pc.in             | 10 ----
 tools/libs/hypfs/xenhypfs.pc.in               | 10 ----
 tools/libs/libs.mk                            |  8 +++
 tools/libs/toolcore/Makefile                  |  1 +
 tools/libs/toolcore/xentoolcore.pc.in         |  9 ----
 tools/libs/toollog/xentoollog.pc.in           |  9 ----
 tools/libvchan/Makefile                       |  5 ++
 tools/libvchan/xenvchan.pc.in                 | 10 ----
 tools/libxc/Makefile                          | 22 ++++++++
 tools/libxc/xencontrol.pc.in                  | 10 ----
 tools/libxc/xenguest.pc.in                    | 10 ----
 tools/libxl/Makefile                          | 22 ++++++++
 tools/libxl/xenlight.pc.in                    | 12 -----
 tools/libxl/xlutil.pc.in                      | 10 ----
 tools/xenstat/libxenstat/Makefile             |  5 ++
 tools/xenstat/libxenstat/xenstat.pc.in        | 10 ----
 tools/xenstore/Makefile                       |  8 ++-
 tools/xenstore/xenstore.pc.in                 | 11 ----
 24 files changed, 98 insertions(+), 177 deletions(-)
 delete mode 100644 tools/libs/call/xencall.pc.in
 delete mode 100644 tools/libs/devicemodel/xendevicemodel.pc.in
 delete mode 100644 tools/libs/evtchn/xenevtchn.pc.in
 delete mode 100644 tools/libs/foreignmemory/xenforeignmemory.pc.in
 delete mode 100644 tools/libs/gnttab/xengnttab.pc.in
 delete mode 100644 tools/libs/hypfs/xenhypfs.pc.in
 delete mode 100644 tools/libs/toolcore/xentoolcore.pc.in
 delete mode 100644 tools/libs/toollog/xentoollog.pc.in
 delete mode 100644 tools/libvchan/xenvchan.pc.in
 delete mode 100644 tools/libxc/xencontrol.pc.in
 delete mode 100644 tools/libxc/xenguest.pc.in
 delete mode 100644 tools/libxl/xenlight.pc.in
 delete mode 100644 tools/libxl/xlutil.pc.in
 delete mode 100644 tools/xenstat/libxenstat/xenstat.pc.in
 delete mode 100644 tools/xenstore/xenstore.pc.in

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 4fd86dd44b..c466858db0 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -342,7 +342,6 @@ define do_links
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
   ln -sf $(dir $<)*.[ch] .; \
-  ln -sf $(dir $<)*.pc.in .; \
   ln -sf $(dir $<)Makefile .
   touch $@
 endef
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 7e019a8a65..7ad72bebd3 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -209,27 +209,33 @@ endif
 
 PKG_CONFIG_DIR ?= $(XEN_ROOT)/tools/pkg-config
 
-PKG_CONFIG_FILTER = $(foreach l,$(PKG_CONFIG_REMOVE),-e 's!\([ ,]\)$(l),!\1!g' -e 's![ ,]$(l)$$!!g')
-
-$(PKG_CONFIG_DIR)/%.pc: %.pc.in Makefile $(XEN_ROOT)/tools/Rules.mk
+$(PKG_CONFIG_DIR):
 	mkdir -p $(PKG_CONFIG_DIR)
-	@sed -e 's!@@version@@!$(PKG_CONFIG_VERSION)!g' \
-	     -e 's!@@prefix@@!$(PKG_CONFIG_PREFIX)!g' \
-	     -e 's!@@incdir@@!$(PKG_CONFIG_INCDIR)!g' \
-	     -e 's!@@libdir@@!$(PKG_CONFIG_LIBDIR)!g' \
-	     -e 's!@@firmwaredir@@!$(XENFIRMWAREDIR)!g' \
-	     -e 's!@@libexecbin@@!$(LIBEXEC_BIN)!g' \
-	     -e 's!@@cflagslocal@@!$(PKG_CONFIG_CFLAGS_LOCAL)!g' \
-	     -e 's!@@libsflag@@\([^ ]*\)!-L\1 -Wl,-rpath-link=\1!g' \
-	     $(PKG_CONFIG_FILTER) < $< > $@
-
-%.pc: %.pc.in Makefile $(XEN_ROOT)/tools/Rules.mk
-	@sed -e 's!@@version@@!$(PKG_CONFIG_VERSION)!g' \
-	     -e 's!@@prefix@@!$(PKG_CONFIG_PREFIX)!g' \
-	     -e 's!@@incdir@@!$(PKG_CONFIG_INCDIR)!g' \
-	     -e 's!@@libdir@@!$(PKG_CONFIG_LIBDIR)!g' \
-	     -e 's!@@firmwaredir@@!$(XENFIRMWAREDIR)!g' \
-	     -e 's!@@libexecbin@@!$(LIBEXEC_BIN)!g' \
-	     -e 's!@@cflagslocal@@!!g' \
-	     -e 's!@@libsflag@@!-L!g' \
-	     $(PKG_CONFIG_FILTER) < $< > $@
+
+$(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
+	$(file >$@,prefix=$(PKG_CONFIG_PREFIX))
+	$(file >>$@,includedir=$(PKG_CONFIG_INCDIR))
+	$(file >>$@,libdir=$(PKG_CONFIG_LIBDIR))
+	$(foreach var,$(PKG_CONFIG_VARS),$(file >>$@,$(var)))
+	$(file >>$@,)
+	$(file >>$@,Name: $(PKG_CONFIG_NAME))
+	$(file >>$@,Description: $(PKG_CONFIG_DESC))
+	$(file >>$@,Version: $(PKG_CONFIG_VERSION))
+	$(file >>$@,Cflags: -I$${includedir} $(CFLAGS_xeninclude))
+	$(file >>$@,Libs: -L$${libdir} $(PKG_CONFIG_USELIBS) -l$(PKG_CONFIG_LIB))
+	$(file >>$@,Libs.private: $(PKG_CONFIG_LIBSPRIV))
+	$(file >>$@,Requires.private: $(PKG_CONFIG_REQPRIV))
+
+%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk
+	$(file >$@,prefix=$(PKG_CONFIG_PREFIX))
+	$(file >>$@,includedir=$(PKG_CONFIG_INCDIR))
+	$(file >>$@,libdir=$(PKG_CONFIG_LIBDIR))
+	$(foreach var,$(PKG_CONFIG_VARS),$(file >>$@,$(var)))
+	$(file >>$@,)
+	$(file >>$@,Name: $(PKG_CONFIG_NAME))
+	$(file >>$@,Description: $(PKG_CONFIG_DESC))
+	$(file >>$@,Version: $(PKG_CONFIG_VERSION))
+	$(file >>$@,Cflags: -I$${includedir})
+	$(file >>$@,Libs: -L$${libdir} -l$(PKG_CONFIG_LIB))
+	$(file >>$@,Libs.private: $(PKG_CONFIG_LIBSPRIV))
+	$(file >>$@,Requires.private: $(PKG_CONFIG_REQPRIV))
diff --git a/tools/libs/call/xencall.pc.in b/tools/libs/call/xencall.pc.in
deleted file mode 100644
index 409773e535..0000000000
--- a/tools/libs/call/xencall.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xencall
-Description: The Xencall library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxencall
-Requires.private: xentoollog,xentoolcore
diff --git a/tools/libs/devicemodel/xendevicemodel.pc.in b/tools/libs/devicemodel/xendevicemodel.pc.in
deleted file mode 100644
index 8bd04faf47..0000000000
--- a/tools/libs/devicemodel/xendevicemodel.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xendevicemodel
-Description: The Xendevicemodel library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxendevicemodel
-Requires.private: xentoolcore,xentoollog,xencall
diff --git a/tools/libs/evtchn/xenevtchn.pc.in b/tools/libs/evtchn/xenevtchn.pc.in
deleted file mode 100644
index c74af1ece4..0000000000
--- a/tools/libs/evtchn/xenevtchn.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenevtchn
-Description: The Xenevtchn library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxenevtchn
-Requires.private: xentoollog
diff --git a/tools/libs/foreignmemory/xenforeignmemory.pc.in b/tools/libs/foreignmemory/xenforeignmemory.pc.in
deleted file mode 100644
index 61c9def69c..0000000000
--- a/tools/libs/foreignmemory/xenforeignmemory.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenforeignmemory
-Description: The Xenforeignmemory library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxenforeignmemory
-Requires.private: xentoollog,xentoolcore
diff --git a/tools/libs/gnttab/xengnttab.pc.in b/tools/libs/gnttab/xengnttab.pc.in
deleted file mode 100644
index 4c3beed5dc..0000000000
--- a/tools/libs/gnttab/xengnttab.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xengnttab
-Description: The Xengnttab library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxengnttab
-Requires.private: xentoollog,xentoolcore
diff --git a/tools/libs/hypfs/xenhypfs.pc.in b/tools/libs/hypfs/xenhypfs.pc.in
deleted file mode 100644
index ef9fcc87bf..0000000000
--- a/tools/libs/hypfs/xenhypfs.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenhypfs
-Description: The Xenhypfs library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxenhypfs
-Requires.private: xentoolcore,xentoollog,xencall,zlib
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 8b1ca2aa62..4679268fc2 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -25,8 +25,16 @@ ifneq ($(nosharedlibs),y)
 LIB += libxen$(LIBNAME).so
 endif
 
+comma:= ,
+empty:=
+space:= $(empty) $(empty)
 PKG_CONFIG ?= xen$(LIBNAME).pc
+PKG_CONFIG_NAME ?= Xen$(LIBNAME)
+PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
+PKG_CONFIG_USELIBS := $(SHLIB_libxen$(LIBNAME))
+PKG_CONFIG_LIB := xen$(LIBNAME)
+PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(USELIBS_$(LIBNAME)),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 34b08a4236..5819bbc8ee 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -9,6 +9,7 @@ SRCS-y	+= handlereg.c
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
+PKG_CONFIG_DESC := Central support for Xen Hypervisor userland libraries
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_libxentoolcore)/include
 
 $(LIB_OBJS): $(AUTOINCS)
diff --git a/tools/libs/toolcore/xentoolcore.pc.in b/tools/libs/toolcore/xentoolcore.pc.in
deleted file mode 100644
index 55ff4e25e4..0000000000
--- a/tools/libs/toolcore/xentoolcore.pc.in
+++ /dev/null
@@ -1,9 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xentoolcore
-Description: Central support for Xen Hypervisor userland libraries
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxentoolcore
diff --git a/tools/libs/toollog/xentoollog.pc.in b/tools/libs/toollog/xentoollog.pc.in
deleted file mode 100644
index 554e4d5b34..0000000000
--- a/tools/libs/toollog/xentoollog.pc.in
+++ /dev/null
@@ -1,9 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xentoollog
-Description: The Xentoollog library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxentoollog
diff --git a/tools/libvchan/Makefile b/tools/libvchan/Makefile
index a5441162a0..e718447977 100644
--- a/tools/libvchan/Makefile
+++ b/tools/libvchan/Makefile
@@ -23,7 +23,12 @@ CFLAGS += -I../include -I.
 io.o io.opic: CFLAGS += $(CFLAGS_libxenctrl) # for xen_mb et al
 
 PKG_CONFIG := xenvchan.pc
+PKG_CONFIG_NAME := Xenvchan
+PKG_CONFIG_DESC := The Xenvchan library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
+PKG_CONFIG_USELIBS := $(SHLIB_libxenvchan)
+PKG_CONFIG_LIB := xenvchan
+PKG_CONFIG_REQPRIV := xentoollog,xenstore,xenevtchn,xengnttab
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
diff --git a/tools/libvchan/xenvchan.pc.in b/tools/libvchan/xenvchan.pc.in
deleted file mode 100644
index 6fd13108d2..0000000000
--- a/tools/libvchan/xenvchan.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenvchan
-Description: The Xenvchan library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxenvchan
-Requires.private: xentoollog,xenstore,xenevtchn,xengnttab
diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index c1e41a8ee9..315ac0b4f3 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -158,6 +158,28 @@ $(CTRL_PIC_OBJS) $(GUEST_PIC_OBJS): xc_private.h
 PKG_CONFIG := xencontrol.pc xenguest.pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 
+xencontrol.pc: PKG_CONFIG_NAME = Xencontrol
+xencontrol.pc: PKG_CONFIG_DESC = The Xencontrol library for Xen hypervisor
+xencontrol.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenctrl)
+xencontrol.pc: PKG_CONFIG_LIB = xenctrl
+xencontrol.pc: PKG_CONFIG_REQPRIV = xenevtchn,xengnttab,xencall,xenforeignmemory,xendevicemodel,xentoollog
+xenguest.pc: PKG_CONFIG_NAME = Xenguest
+xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
+xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
+xenguest.pc: PKG_CONFIG_LIB = xenguest
+xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn
+
+$(PKG_CONFIG_DIR)/xencontrol.pc: PKG_CONFIG_NAME = Xencontrol
+$(PKG_CONFIG_DIR)/xencontrol.pc: PKG_CONFIG_DESC = The Xencontrol library for Xen hypervisor
+$(PKG_CONFIG_DIR)/xencontrol.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenctrl)
+$(PKG_CONFIG_DIR)/xencontrol.pc: PKG_CONFIG_LIB = xenctrl
+$(PKG_CONFIG_DIR)/xencontrol.pc: PKG_CONFIG_REQPRIV = xenevtchn,xengnttab,xencall,xenforeignmemory,xendevicemodel,xentoollog
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_NAME = Xenguest
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_LIB = xenguest
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn
+
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
 $(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
diff --git a/tools/libxc/xencontrol.pc.in b/tools/libxc/xencontrol.pc.in
deleted file mode 100644
index e653ba2543..0000000000
--- a/tools/libxc/xencontrol.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xencontrol
-Description: The Xencontrol library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxenctrl
-Requires.private: xenevtchn,xengnttab,xencall,xenforeignmemory,xendevicemodel,xentoollog
diff --git a/tools/libxc/xenguest.pc.in b/tools/libxc/xenguest.pc.in
deleted file mode 100644
index 225ac0b9c8..0000000000
--- a/tools/libxc/xenguest.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenguest
-Description: The Xenguest library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxenguest
-Requires.private: xentoollog,xencall,xenforeignmemory,xenevtchn
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 0e8dfc6193..684da32a5b 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -195,8 +195,19 @@ PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
+xenlight.pc: PKG_CONFIG_NAME = Xenlight
+xenlight.pc: PKG_CONFIG_DESC = The Xenlight library for Xen hypervisor
 xenlight.pc: PKG_CONFIG_VERSION = $(MAJOR).$(MINOR)
+xenlight.pc: PKG_CONFIG_VARS = xenfirmwaredir=$(XENFIRMWAREDIR) libexec_bin=$(LIBEXEC_BIN)
+xenlight.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenlight)
+xenlight.pc: PKG_CONFIG_LIB = xenlight
+xenlight.pc: PKG_CONFIG_REQPRIV = xentoollog,xenevtchn,xencontrol,xenguest,xenstore,xenhypfs
+xlutil.pc: PKG_CONFIG_NAME = Xlutil
+xlutil.pc: PKG_CONFIG_DESC = The xl utility library for Xen hypervisor
 xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
+xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxlutil)
+xlutil.pc: PKG_CONFIG_LIB = xlutil
+xlutil.pc: PKG_CONFIG_REQPRIV = xenlight
 $(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
 $(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
 $(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
@@ -204,8 +215,19 @@ endif
 
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_NAME = Xenlight
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_DESC = The Xenlight library for Xen hypervisor
 $(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_VERSION = $(MAJOR).$(MINOR)
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_VARS = xenfirmwaredir=$(XENFIRMWAREDIR) libexec_bin=$(LIBEXEC_BIN)
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenlight)
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_LIB = xenlight
+$(PKG_CONFIG_DIR)/xenlight.pc: PKG_CONFIG_REQPRIV = xentoollog,xenevtchn,xencontrol,xenguest,xenstore,xenhypfs
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_NAME = Xlutil
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_DESC = The xl utility library for Xen hypervisor
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxlutil)
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_LIB = xlutil
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_REQPRIV = xenlight
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(CURDIR)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
diff --git a/tools/libxl/xenlight.pc.in b/tools/libxl/xenlight.pc.in
deleted file mode 100644
index 6b351ba096..0000000000
--- a/tools/libxl/xenlight.pc.in
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-xenfirmwaredir=@@firmwaredir@@
-libexec_bin=@@libexecbin@@
-
-Name: Xenlight
-Description: The Xenlight library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxenlight
-Requires.private: xentoollog,xenevtchn,xencontrol,xenguest,xenstore,xenhypfs
diff --git a/tools/libxl/xlutil.pc.in b/tools/libxl/xlutil.pc.in
deleted file mode 100644
index cdd98fba74..0000000000
--- a/tools/libxl/xlutil.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xlutil
-Description: The xl utility library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxlutil
-Requires.private: xenlight
diff --git a/tools/xenstat/libxenstat/Makefile b/tools/xenstat/libxenstat/Makefile
index b5e623b155..bdd5a0f469 100644
--- a/tools/xenstat/libxenstat/Makefile
+++ b/tools/xenstat/libxenstat/Makefile
@@ -38,7 +38,12 @@ LDLIBS-y = $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) -lyajl
 LDLIBS-$(CONFIG_SunOS) += -lkstat
 
 PKG_CONFIG := xenstat.pc
+PKG_CONFIG_NAME := Xenstat
+PKG_CONFIG_DESC := The Xenstat library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
+PKG_CONFIG_USELIBS := $(SHLIB_libxenstat)
+PKG_CONFIG_LIB := xenstat
+PKG_CONFIG_REQPRIV := xencontrol,xenstore
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
diff --git a/tools/xenstat/libxenstat/xenstat.pc.in b/tools/xenstat/libxenstat/xenstat.pc.in
deleted file mode 100644
index ad00577c89..0000000000
--- a/tools/xenstat/libxenstat/xenstat.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenstat
-Description: The Xenstat library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir}
-Libs: @@libsflag@@${libdir} -lxenstat
-Requires.private: xencontrol,xenstore
diff --git a/tools/xenstore/Makefile b/tools/xenstore/Makefile
index 0a64ac1571..574be8d15c 100644
--- a/tools/xenstore/Makefile
+++ b/tools/xenstore/Makefile
@@ -105,8 +105,7 @@ xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
 xs.opic: CFLAGS += -DUSE_DLSYM
 libxenstore.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += -ldl
-else
-PKG_CONFIG_REMOVE += -ldl
+PKG_CONFIG_LIBSPRIV := -ldl
 endif
 
 libxenstore.so.$(MAJOR).$(MINOR): xs.opic xs_lib.opic
@@ -116,7 +115,12 @@ libxenstore.a: xs.o xs_lib.o
 	$(AR) rcs $@ $^
 
 PKG_CONFIG := xenstore.pc
+PKG_CONFIG_NAME := Xenstore
+PKG_CONFIG_DESC := The Xenstore library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
+PKG_CONFIG_USELIBS := $(SHLIB_libxenstore)
+PKG_CONFIG_LIB := xenstore
+PKG_CONFIG_REQPRIV := xenevtchn,xencontrol,xengnttab,xentoolcore
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
diff --git a/tools/xenstore/xenstore.pc.in b/tools/xenstore/xenstore.pc.in
deleted file mode 100644
index 2f64a6b824..0000000000
--- a/tools/xenstore/xenstore.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=@@prefix@@
-includedir=@@incdir@@
-libdir=@@libdir@@
-
-Name: Xenstore
-Description: The Xenstore library for Xen hypervisor
-Version: @@version@@
-Cflags: -I${includedir} @@cflagslocal@@
-Libs: @@libsflag@@${libdir} -lxenstore
-Libs.private: -ldl
-Requires.private: xenevtchn,xencontrol,xengnttab,xentoolcore
-- 
2.26.2


