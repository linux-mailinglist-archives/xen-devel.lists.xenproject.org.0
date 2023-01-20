Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40CE675E46
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 20:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482099.747453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJl-0007G0-2W; Fri, 20 Jan 2023 19:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482099.747453; Fri, 20 Jan 2023 19:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIxJk-0007Cn-Vp; Fri, 20 Jan 2023 19:44:52 +0000
Received: by outflank-mailman (input) for mailman id 482099;
 Fri, 20 Jan 2023 19:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIxJj-0006vE-Kx
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 19:44:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5f4d844-98fa-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 20:44:50 +0100 (CET)
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
X-Inumbo-ID: e5f4d844-98fa-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674243889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yUuDd1gBVYbDkE4V3W6tzEt+GcRRvH9lKf79QyzlwRo=;
  b=DlfZabN+4uDl62V2QsM9LZ6s318H2J5IwETN5iPrqBm3DNummPkxxF2V
   FQU+flX+hXswe6tJnp/06DyukKFOnldenWyNXYV+nzreJ2UogenoPjH0r
   09YmQS0lnI6ILXqpYGFWiJ7QzA4sIyMIfyBEYyfcM/6pnXMR9E6m2NyWB
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96015186
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:kMFk+aNG9xApFkfvrR1sl8FynXyQoLVcMsEvi/4bfWQNrUp01GdUn
 zBNUW2BbPncajP9ftskYYW/phgAvZfcz4NnHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v14UEtv7
 P0HEyoqaEm7jrrt/rmATeY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3UHZwIxxbGz
 o7A11zfGSMhDcyi8yu672mgmuOUkinAYI1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGtBMBX9tbE8Uh9RqAjKHT5m6xBHUATzNHQMwrsokxXzNC/
 kSSg9rjCDhrsbuUYXGQ7LGZqXW1Iyd9BXAGTT8JS00C+daLiIM8lBXUVf54DbW4yNbyHFnNL
 yui9XZkwe9J1IhSivv9pAqc696xmnTXZhU6ty/2R2O61RleYtedbtTz11Pg6vkVee51UWK9l
 HQDnsGf6sUHApeMiDGBTY0xIV252xqWGGaC2AAyRvHN4xzooif+Jt4IvFmSMW8zaq45lSnVj
 Fg/UO+7zLtaJzOUYKB+eOpd4Ox6nPG7RbwJuh05B+eig6SdlyfdpkmCgHJ8OUi3yCARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUv7i+HPOSfFFe9dWLdrUgzfxPncyOky2
 48PX/ZmNj0FCLGuCsUp2dB7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt4E7GJa599z7+Sl
 lnkAx8w9bYKrSGfQel8Qiw5OeyHsFcWhS5TABHAyn7xgihzPN31sPtEH3b1FJF+nNFeITdPZ
 6FtU6297j5nFlwrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:DHRGl60tTacs22Tg72kkvQqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="96015186"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH for-4.17 v6 1/5] libs: Fix auto-generation of version-script for unstable libs
Date: Fri, 20 Jan 2023 19:44:27 +0000
Message-ID: <20230120194431.55922-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120194431.55922-1-anthony.perard@citrix.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When there isn't a version-script for a shared library (like for
unstable libs), we create one based on the current Xen version. But
that version-script became out-of-date as soon as Xen's version
changes and make as no way to regenerate the version-script on
rebuild.

For unstable libs, we only needs the symver to be different from a
previous release of Xen. There's an option "--default-symver" which
allow to use the soname as symver and as the soname have the Xen
release version, it will be different for every release. With
--default-symver we don't need to generate a version-script.

But we also need to know if there's already an existing version script
, for that we introduce $(version-script) to be used to point to the
path of the existing script. (Guessing if a version script exist for a
stable library with for example $(wildcard) won't work as a file will
exist when building the library without this patch.)

We don't need the version-script unless we are making the shared
library so it is removed from the "all" target.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v6:
    - use --default-symver instead of generating a version-script.
      (option was available in binutils 2.16, according to the doc, so that
      should work.)
    
    v4:
    - new patch
    
    CC: Andrew Cooper <Andrew.Cooper3@citrix.com>

 tools/libs/call/Makefile          |  1 +
 tools/libs/ctrl/Makefile          |  3 ---
 tools/libs/devicemodel/Makefile   |  1 +
 tools/libs/evtchn/Makefile        |  1 +
 tools/libs/foreignmemory/Makefile |  1 +
 tools/libs/gnttab/Makefile        |  1 +
 tools/libs/guest/Makefile         |  3 ---
 tools/libs/hypfs/Makefile         |  1 +
 tools/libs/light/Makefile         |  1 -
 tools/libs/stat/Makefile          |  2 +-
 tools/libs/store/Makefile         |  1 +
 tools/libs/toolcore/Makefile      |  1 +
 tools/libs/toollog/Makefile       |  1 +
 tools/libs/util/Makefile          |  3 ---
 tools/libs/vchan/Makefile         |  3 ---
 tools/libs/libs.mk                | 10 ++++------
 .gitignore                        |  6 ------
 17 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/tools/libs/call/Makefile b/tools/libs/call/Makefile
index 103f5ad360..56a964b517 100644
--- a/tools/libs/call/Makefile
+++ b/tools/libs/call/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 3
+version-script := libxencall.map
 
 include Makefile.common
 
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 93442ab389..094e84b8d8 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -10,6 +10,3 @@ PKG_CONFIG_NAME := Xencontrol
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenctrl.map
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index b70dd774e4..20d1d112e7 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxendevicemodel.map
 
 include Makefile.common
 
diff --git a/tools/libs/evtchn/Makefile b/tools/libs/evtchn/Makefile
index 3dad3840c6..18cdaab89e 100644
--- a/tools/libs/evtchn/Makefile
+++ b/tools/libs/evtchn/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxenevtchn.map
 
 include Makefile.common
 
diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
index b70dd774e4..81398e88b1 100644
--- a/tools/libs/foreignmemory/Makefile
+++ b/tools/libs/foreignmemory/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 4
+version-script := libxenforeignmemory.map
 
 include Makefile.common
 
diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
index 3dad3840c6..4528830bdc 100644
--- a/tools/libs/gnttab/Makefile
+++ b/tools/libs/gnttab/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 2
+version-script := libxengnttab.map
 
 include Makefile.common
 
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 19d3ff2fdb..93338a9301 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -14,6 +14,3 @@ NO_HEADERS_CHK := y
 include $(XEN_ROOT)/tools/libs/libs.mk
 
 libxenguest.so.$(MAJOR).$(MINOR): LDLIBS += $(ZLIB_LIBS) -lz
-
-clean::
-	rm -f libxenguest.map
diff --git a/tools/libs/hypfs/Makefile b/tools/libs/hypfs/Makefile
index 630e1e6f3e..7fae5c750d 100644
--- a/tools/libs/hypfs/Makefile
+++ b/tools/libs/hypfs/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
 MINOR    = 0
+version-script := libxenhypfs.map
 
 LDLIBS += -lz
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 4fddcc6f51..cd3fa855e1 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -262,6 +262,5 @@ clean::
 	$(RM) testidl.c.new testidl.c *.api-ok
 	$(RM) $(TEST_PROGS) libxenlight_test.so libxl_test_*.opic
 	$(RM) -r __pycache__
-	$(RM) libxenlight.map
 	$(RM) $(AUTOSRCS) $(AUTOINCS)
 	$(MAKE) -C $(ACPI_PATH) ACPI_BUILD_DIR=$(CURDIR) clean
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index 7eaf50e91e..ee5c42bf7b 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -134,4 +134,4 @@ uninstall:: uninstall-perl-bindings
 endif
 
 clean::
-	$(RM) libxenstat.map $(BINDINGS) $(BINDINGSRC)
+	$(RM) $(BINDINGS) $(BINDINGSRC)
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 3557a8c76d..daed9d148f 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR = 4
 MINOR = 0
+version-script := libxenstore.map
 
 ifeq ($(CONFIG_Linux),y)
 LDLIBS += -ldl
diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 0d92b68b3b..20671dadd0 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoolcore.map
 
 LIBHEADER := xentoolcore.h
 
diff --git a/tools/libs/toollog/Makefile b/tools/libs/toollog/Makefile
index 2361b8cbf1..d612227c85 100644
--- a/tools/libs/toollog/Makefile
+++ b/tools/libs/toollog/Makefile
@@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR	= 1
 MINOR	= 0
+version-script := libxentoollog.map
 
 include Makefile.common
 
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index 493d2e00be..e016baf888 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -47,6 +47,3 @@ $(OBJS-y) $(PIC_OBJS): $(AUTOINCS)
 %.c %.h:: %.l
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
-
-clean::
-	$(RM) libxenutil.map
diff --git a/tools/libs/vchan/Makefile b/tools/libs/vchan/Makefile
index ac2bff66f5..a1ef60ac8e 100644
--- a/tools/libs/vchan/Makefile
+++ b/tools/libs/vchan/Makefile
@@ -11,6 +11,3 @@ OBJS-y += io.o
 NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
-
-clean::
-	rm -f libxenvchan.map
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 3eb91fc8f3..0e4b5e0bd0 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -4,6 +4,7 @@
 #   PKG_CONFIG: name of pkg-config file (xen$(LIBNAME).pc if empty)
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
+#   version-script: Specify the name of a version script to the linker.
 
 LIBNAME := $(notdir $(CURDIR))
 
@@ -53,7 +54,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: $(TARGETS) $(PKG_CONFIG_LOCAL) $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 all: headers.chk
@@ -71,9 +72,6 @@ headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
 
-libxen$(LIBNAME).map:
-	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
-
 lib$(LIB_FILE_NAME).a: $(OBJS-y)
 	$(AR) rc $@ $^
 
@@ -82,8 +80,8 @@ lib$(LIB_FILE_NAME).so: lib$(LIB_FILE_NAME).so.$(MAJOR)
 lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,--version-script=libxen$(LIBNAME).map $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
+lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(version-script)
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) -Wl,$(if $(version-script),--version-script=$(version-script),--default-symver) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDLIBS) $(APPEND_LDFLAGS)
 
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
diff --git a/.gitignore b/.gitignore
index 880ba88c55..d9c906670d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -110,8 +110,6 @@ tools/config.cache
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
-tools/libs/ctrl/libxenctrl.map
-tools/libs/guest/libxenguest.map
 tools/libs/guest/xc_bitops.h
 tools/libs/guest/xc_core.h
 tools/libs/guest/xc_core_arm.h
@@ -121,7 +119,6 @@ tools/libs/light/_*.[ch]
 tools/libs/light/*.pyc
 tools/libs/light/_libxl.api-for-check
 tools/libs/light/*.api-ok
-tools/libs/light/libxenlight.map
 tools/libs/light/libxl-save-helper
 tools/libs/light/dsdt*
 tools/libs/light/mk_dsdt
@@ -131,13 +128,10 @@ tools/libs/light/testidl.c
 tools/libs/light/test_timedereg
 tools/libs/light/test_fdderegrace
 tools/libs/light/tmp.*
-tools/libs/stat/libxenstat.map
 tools/libs/store/list.h
 tools/libs/store/utils.h
 tools/libs/store/xs_lib.c
 tools/libs/util/libxlu_cfg_y.output
-tools/libs/util/libxenutil.map
-tools/libs/vchan/libxenvchan.map
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdb/gdb-6.2.1.tar.bz2
-- 
Anthony PERARD


