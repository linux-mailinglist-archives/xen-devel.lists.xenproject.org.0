Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9949B29D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260095.449239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfe-0006EB-NS; Tue, 25 Jan 2022 11:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260095.449239; Tue, 25 Jan 2022 11:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfe-000655-DZ; Tue, 25 Jan 2022 11:07:30 +0000
Received: by outflank-mailman (input) for mailman id 260095;
 Tue, 25 Jan 2022 11:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJb5-0006Mn-Cq
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5328946c-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:02:45 +0100 (CET)
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
X-Inumbo-ID: 5328946c-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/rFX32bM93F9j3Jp4QEyees3GBWk+GfWAs8eqADudYM=;
  b=UnJgx6EMdeo4kBNL3aEWsEgYXaRb2Ix8IqT35eXSwz5jIdPzLZo6MqL4
   0kUBZNsSFUc18pAM8ctEGFub7yJ4bGyTjhm6mHXIWTZMe6ypfBoQjNkmM
   B4OmjNMPoW2AkMfTPtAWUETyF6K19Cxy1kpJtsht8eijqEwi6NeO2UAkq
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: f0hR9ZIweqH195uiWMVSO+lkH2BhEp9tVdkVjyOW36PrcdW83hcqrbZCjRKO1mQ4EXPMcn/N34
 QmbLHAXCbLd8Tz9cWvrkrQikZrwGc6f7LKoHDt4Yg+HkOkHSPf9/75Dx1eZ7a0fr2ueUVTt60H
 AzlCCPtJP0GnWO9PXHCPgpkg2ya3PlNS5hWMB08tGOJlJp49MvugQ94sRpmEOoI1+a0pJdPa4K
 Vw69XjcU2Au8b714qRvC3NVfQGVfKRRcRO6RvUvDJNCoFhSb73s+5xjzrMm9Fc4le++wfwMfOK
 ATMfAINS8E2ifWOx9RvktlFl
X-SBRS: 5.2
X-MesageID: 63107025
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tyG0fagLtOFzFKRi3tFX19KyX161yhcKZh0ujC45NGQN5FlHY01je
 htvDG6DaP3fNGr0edwgYd/i8k1X7JHUmocxGlc6ryFnRSMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1ns8CQFhYYb5bFu9sPTSYIPS1zEY9ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiFP
 pJGMWAyBPjGS0xiO2gvApc4oMnrrX+vXTh/s0mzhINitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRDh4WOdOFwBKZ43msganJhiq9V4UMfJW07uVvgUGT7mULBQcKSECgpv2klk+5XckZI
 EsRkgI1trQ7/kGvStj7XjW7rWSCsxpaXMBfe8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj/aPn3Q/WsmOXr7v2XBAKtivbU06H8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U032n1oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y4Dpg4jfIUO/CdkTNrGgk0OSZ8OEi2yCARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUj8iebPOyHLGOZdWLdrUgzfxPnYyOky2
 40HX/ZmNj0FCLGuCsUp2dB7wa82wYgTWsmt9p0/mh+rKQt6AmAxY8I9Mpt6E7GJa599z7+Sl
 lnkAxcw4AOm2RXvdFvWAlg+NuKHdcsv/BoTYH13VX71iidLXGpaxPpFH3fBVeN5pLULID8dZ
 6RtRvhs9dwWGm2YoGxMNMekxGGgHTzy7T+z0+OeSGBXV/Zdq8bho4WMktLH+HZcAyypm9E5p
 rH8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6c5MWNBHO5jqGz
 ALKUx0WkvbA/t0u+97TiKHa84rwS7liHlBXFnXw5KqtMXWI5XKqxIJNCb7afT3UWG7u1r+lY
 OFZk6P1PPEdxQ4YuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/QUlLFDuAawV
 kaewfVgOO2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMb5lDtihcuNdra3ClY+37Vcy4FWqQj8JobHJXqmkwgzVQbOc7QDSr/4ZeubdRQMxZ1f
 m/I1fSa37kMlFDfd3cTFGTW2bsPjJsDjxlG0VseKgnbgdHCnPI2gEVc/Dlfot65FfmbPzaf4
 lRWCnA=
IronPort-HdrOrdr: A9a23:m+dIaa4pYxsDUheGTgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="63107025"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 26/30] build: replace $(BASEDIR) and use $(srctree)
Date: Tue, 25 Jan 2022 11:00:59 +0000
Message-ID: <20220125110103.3527686-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(srctree) is a better description for the source directory than
$(BASEDIR) that has been used for both source and build directory
(which where the same).

This adds $(srctree) to a few path where make's VPATH=$(srctree) won't
apply. And replace $(BASEDIR) by $(srctree).

Introduce "$(srcdir)" as a shortcut for "$(srctree)/$(src)" as the
later is used often enough.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - acked
    - reword "# shortcut for $(srctree)/$(src)" into "# shortcuts" in both
      places.
    
    v8:
    - merge of two patchs from v7:
        build: add $(srctree) in few key places
        build: replace $(BASEDIR) by $(srctree)
      both patch were acked
    - introduce $(srcdir) as a shortcut for $(srctree)/$(src)

 xen/Kconfig                 |  4 ++--
 xen/Makefile                |  7 +++----
 xen/Rules.mk                |  9 ++++++---
 xen/arch/x86/arch.mk        |  2 +-
 xen/build.mk                |  4 ++--
 xen/common/Makefile         |  2 +-
 xen/common/libfdt/Makefile  |  2 +-
 xen/include/Makefile        | 14 +++++++-------
 xen/scripts/Kconfig.include |  2 +-
 xen/scripts/Makefile.clean  |  5 ++++-
 xen/xsm/flask/Makefile      | 10 +++++-----
 11 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index bcbd2758e5d3..ac9a638d372e 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -14,14 +14,14 @@ config CC_IS_GCC
 
 config GCC_VERSION
 	int
-	default $(shell,$(BASEDIR)/scripts/gcc-version.sh $(CC))
+	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
 
 config CC_IS_CLANG
 	def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
 
 config CLANG_VERSION
 	int
-	default $(shell,$(BASEDIR)/scripts/clang-version.sh $(CC))
+	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
 # -fvisibility=hidden reduces -fpic cost, if it's available
 config CC_HAS_VISIBILITY_ATTRIBUTE
diff --git a/xen/Makefile b/xen/Makefile
index 443784dfce80..c39c1699966f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -19,8 +19,7 @@ export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
 
-export BASEDIR := $(CURDIR)
-export XEN_ROOT := $(BASEDIR)/..
+export XEN_ROOT := $(CURDIR)/..
 
 abs_objtree := $(CURDIR)
 abs_srctree := $(CURDIR)
@@ -189,7 +188,7 @@ ifeq ($(TARGET_ARCH),x86)
 t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
 
 # Check whether clang asm()-s support .include.
-t2 = $(call as-insn,$(CC) -I$(BASEDIR)/arch/x86/include,".include \"asm/asm-defns.h\"",,-no-integrated-as)
+t2 = $(call as-insn,$(CC) -I$(srctree)/arch/x86/include,".include \"asm/asm-defns.h\"",,-no-integrated-as)
 
 # Check whether clang keeps .macro-s between asm()-s:
 # https://bugs.llvm.org/show_bug.cgi?id=36110
@@ -329,7 +328,7 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
 ALL_LIBS-y                := lib/lib.a
 
-include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
+include $(srctree)/arch/$(TARGET_ARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
 export XEN_CFLAGS := $(CFLAGS)
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 7712bfa063e0..57a029455586 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -9,13 +9,16 @@ endif
 
 src := $(obj)
 
+# shortcuts
+srcdir := $(srctree)/$(src)
+
 PHONY := __build
 __build:
 
 -include $(objtree)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
-include $(BASEDIR)/scripts/Kbuild.include
+include $(srctree)/scripts/Kbuild.include
 
 # Initialise some variables
 obj-y :=
@@ -58,7 +61,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
 # binfile
 # use e.g. $(call if_changed,binfile,binary-file varname)
 quiet_cmd_binfile = BINFILE $@
-cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
+cmd_binfile = $(SHELL) $(srctree)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
 
 # Figure out what we need to build from the various variables
 # ===========================================================================
@@ -177,7 +180,7 @@ cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
 c_flags = -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
 a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
-include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
+include $(srctree)/arch/$(TARGET_ARCH)/Rules.mk
 
 c_flags += $(_c_flags)
 a_flags += $(_c_flags)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 8bc0e01ceb2b..2fcb6271faf7 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -63,7 +63,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 efi-check := arch/x86/efi/check
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check).c -o $(efi-check).o,y)
+XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
 
 # Check if the linker supports PE.
 EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
diff --git a/xen/build.mk b/xen/build.mk
index e718743ef772..758590c68eab 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -27,9 +27,9 @@ define cmd_compile.h
 	    -e 's/@@version@@/$(XEN_VERSION)/g' \
 	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
 	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
-	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
+	    -e 's!@@changeset@@!$(shell $(srctree)/tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
 	    < $< > $(dot-target).tmp; \
-	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
+	sed -rf $(srctree)/tools/process-banner.sed < .banner >> $(dot-target).tmp; \
 	mv -f $(dot-target).tmp $@; \
     fi
 endef
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 30641a737231..b1e076c30b81 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -80,7 +80,7 @@ $(obj)/config.gz: $(CONF_FILE)
 
 $(obj)/config_data.o: $(obj)/config.gz
 
-$(obj)/config_data.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/config_data.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
 
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6708af12e583..75aaefa2e37f 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -6,7 +6,7 @@ OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
 obj-y += libfdt.o
 nocov-y += libfdt.o
 
-CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
+CFLAGS-y += -I$(srctree)/include/xen/libfdt/
 
 $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 	$(call if_changed,objcopy)
diff --git a/xen/include/Makefile b/xen/include/Makefile
index a3c2511f5f60..5a2b4c9f65fa 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -45,22 +45,22 @@ public-$(CONFIG_ARM) := $(wildcard $(src)/public/arch-arm/*.h $(src)/public/arch
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
 
-$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(BASEDIR)/tools/compat-build-header.py
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
+$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(srctree)/tools/compat-build-header.py
+	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
 $(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(BASEDIR)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(srctree)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(src)/xlat.lst <$< >$@.new
+	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srcdir)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh $(src)/Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(src)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
-		$(SHELL) $(BASEDIR)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
+		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
 	done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new
 	mv -f $@.new $@
 
@@ -70,7 +70,7 @@ $(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(src)/xlat.lst | uniq)
+xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
diff --git a/xen/scripts/Kconfig.include b/xen/scripts/Kconfig.include
index e1f13e17207e..389a690a127a 100644
--- a/xen/scripts/Kconfig.include
+++ b/xen/scripts/Kconfig.include
@@ -40,4 +40,4 @@ $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
 # gcc version including patch level
-gcc-version := $(shell,$(BASEDIR)/scripts/gcc-version.sh $(CC))
+gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 4eed31974509..f97ecd3b8eee 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -5,9 +5,12 @@
 
 src := $(obj)
 
+# shortcuts
+srcdir := $(srctree)/$(src)
+
 clean::
 
-include $(BASEDIR)/scripts/Kbuild.include
+include $(srctree)/scripts/Kbuild.include
 
 include $(src)/Makefile
 
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 4ac6fb8778ae..a99038cb5722 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -8,8 +8,8 @@ CFLAGS-y += -I$(obj)/include
 
 AWK = awk
 
-FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
-AV_H_DEPEND = $(src)/policy/access_vectors
+FLASK_H_DEPEND := $(addprefix $(srcdir)/policy/,security_classes initial_sids)
+AV_H_DEPEND := $(srcdir)/policy/access_vectors
 
 FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
 AV_H_FILES := av_perm_to_string.h av_permissions.h
@@ -18,14 +18,14 @@ ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
 $(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
 extra-y += $(ALL_H_FILES)
 
-mkflask := $(src)/policy/mkflask.sh
+mkflask := $(srcdir)/policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
 cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
 
 $(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
-mkaccess := $(src)/policy/mkaccess_vector.sh
+mkaccess := $(srcdir)/policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
 cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
 
@@ -36,7 +36,7 @@ obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 $(obj)/flask-policy.o: $(obj)/policy.bin
 
 $(obj)/flask-policy.S: BINFILE_FLAGS := -i
-$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/flask-policy.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
 targets += flask-policy.S
 
-- 
Anthony PERARD


