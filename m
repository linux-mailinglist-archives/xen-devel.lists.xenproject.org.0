Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61764E3D7A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293378.498410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbI-0002oc-W7; Tue, 22 Mar 2022 11:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293378.498410; Tue, 22 Mar 2022 11:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbI-0002kr-Qj; Tue, 22 Mar 2022 11:22:56 +0000
Received: by outflank-mailman (input) for mailman id 293378;
 Tue, 22 Mar 2022 11:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbG-0001pm-OC
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ec4df0-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:22:53 +0100 (CET)
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
X-Inumbo-ID: 69ec4df0-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b8QJw/R+95kdQ8nhsS0sB38nPXZyrRBhXuNV+PLsfNw=;
  b=SSWeHwBAekoRIp9lmx79YfTsZW8bn8elVO4OJ4sluc0YhF5DbnNUKOm3
   RS3efiylicmjRNNwUudrg8y+Oup66Xr+iAjNej4ryYSWz9WCckTnzjKIw
   fPObDq8R2LrNkAowJgETk2D5dByxgrrFRbXHSWVEml5AhBK7d2TReXl2I
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66847210
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lYgdha2+shXEJwawxPbD5Qtxkn2cJEfYwER7XKvMYLTBsI5bp2YFy
 jYfXGqDOqmOZDChfth+aYyy9BtXv5fdmIA3HAVrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1B7LmJYDkSMZTPwuQBahoHFSZ5JoFvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiAN
 5ZGM2M3BPjGSwVAIXMnVdEspcC5pCnbVxR7ggufn4NitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ+vFmjVKJz0QPGRYWUh29uvD/hUmgM/pdN
 kgV9ywGvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9RWqG87aIrRu7ISUPMXIZfigAUBcE5N/45oo0i3ryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAj2/yexHn5uD2VpcLJUjc2uQPQWXmJx1YsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPYm8Phw3RoAXCnSUSONh1Hs1DaJ39zqx+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlk0v3geXDOy/PF+pt3L6yggYRtv/sTOL9q
 Ys3Cid3408HDL2Wjtf/r+b/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6ehJRmCRpIwMzr2g1
 ijkAidwkQOj7VWaeVTiQi0yM9vHAMcgxU/XyARxZD5ELVB4Ot3xhEreHrNqFYQaGBtLlqclE
 aNaJ53eXpyiiF3volwgUHU0l6Q6HDzDuO5EF3fNjOQXF3K4ezH0xw==
IronPort-HdrOrdr: A9a23:C3cf0K1HhrTSpAsxtZPqXwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="66847210"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: [XEN PATCH v10 3/7] build: replace $(BASEDIR) and use $(srctree)
Date: Tue, 22 Mar 2022 11:22:34 +0000
Message-ID: <20220322112238.1117737-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
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
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com> # XSM
---

Notes:
    v10:
    - rebased: use $(srctree) for ./tools/check-endbr.sh
    
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
 xen/arch/x86/Makefile       |  4 ++--
 xen/arch/x86/arch.mk        |  2 +-
 xen/build.mk                |  4 ++--
 xen/common/Makefile         |  2 +-
 xen/common/libfdt/Makefile  |  2 +-
 xen/include/Makefile        | 14 +++++++-------
 xen/scripts/Kconfig.include |  2 +-
 xen/scripts/Makefile.clean  |  5 ++++-
 xen/xsm/flask/Makefile      | 10 +++++-----
 12 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index d134397a0ba6..ec2bd9fbcfaa 100644
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
index dec489f2a909..b89db5e8ab37 100644
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
@@ -326,7 +325,7 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
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
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 7cea79ed2f8a..717bcbcac7a0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -153,7 +153,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
 
 $(obj)/note.o: $(TARGET)-syms
@@ -226,7 +226,7 @@ endif
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
-	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
 else
 $(TARGET).efi: FORCE
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index c90e56aeab87..cfde143053fc 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -78,7 +78,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
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


