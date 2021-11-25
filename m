Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29845DB8A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231291.400270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6C-00064u-IW; Thu, 25 Nov 2021 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231291.400270; Thu, 25 Nov 2021 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6C-0005ie-4L; Thu, 25 Nov 2021 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 231291;
 Thu, 25 Nov 2021 13:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0N-0007NX-Uj
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a04796b-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:38 +0100 (CET)
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
X-Inumbo-ID: 6a04796b-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FtVQFQfJL5CyXQ1ZSfQvYF26EeFUF5cby1srpXXTn8k=;
  b=eZqFY6otvEt7tCa2l/8ciQWddfU4yRN8YMdX8JmxiFgzm5M6ViyiJpsB
   mcjUkWdAe4OgQETYPwXLIS+VGq9OVa8UqmhBVlWOWPsdntcmhN26+2zqP
   Gf8lpsiPfFzr1q5zim9PGw5bI8e/lQSXuwkubfSKhsCSw2ObX8Fz1HG6C
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +bIhSrwkA0hCCTnI0uc+8tdcEcuFSS9cQlB329mXcfgAXawm9cc4E+2Rz+TukriUS29v6WUTOX
 2Gne4sCyhjlpCU0TAj/k1sD/QdshbEO4qe3nKQib9BNLX8LTysKThcU1rhl8wm5NyAxdem2gLL
 otA7XzrIsyLj+oUiKoMqSEZqiMPBVPRiXaNEQJ42u+0I7WDh7yYw7f5O2EhpgE1S1jPWfA06Ge
 H5bMlV+8AfqPQMWhx91XPaafKyOC9sYjWbN093bkhYx3R+R/xmHG9JS0Ls5G9QOt52Z8miLbWL
 QbXARuq/LDXCMIT6tnIWW7wR
X-SBRS: 5.1
X-MesageID: 58617688
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vnXV363VLHi3j8tQ4/bD5Xt2kn2cJEfYwER7XKvMYLTBsI5bp2MBy
 2pKC23VP66MYGPzfognaYy0p05V7ZHcx4NnSwpqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhs8Fsy
 4xKu5GKbQ4YMrLvnMgCbjcbOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t1p4XQqiON
 6L1bxJAYw2bcR5+EGxGUsw1sczyoUHwcxdx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcI4KD7i56v5CiUWe3HAOEwYRUUanoP6/kQi1XNc3A
 0Ab9icht6Ea6F2gTt67WQax5nGDoHY0WsVSO/037hmXzajZ6BrfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESoIKW4PYwcUQA1D5MPsyKkxhB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B02nESoX1ohAdyhTKXTui4A5DQIeUa5OL7XTE0NgDBdPMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8Gp9cIWeBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGORH4M4PFyhFEfUQD1
 XCzK5vEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlebwTRP7Bpvfna8W05F
 uqz0OPQlX1ivBDWOHGLoeb/03hWRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi0zOdvHAMckxVpmbHNEALpd8yV6CWpZxPxELMVfkHhO3LEL8MOYu
 NFZIZjdWaoWFWyck9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMniTFpY3peBXB7i4LAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIU6eTbsivIXIt0XLUmRzDWty
 AvLUwwTovPAotFp/YCR17yEtYqgD8B3AlFeQzvA9b+zOCSDpjijzIZMXfymZzfYUG+oqqyua
 f8Ml6P3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UutteyDU09NOu6tBwq5ilTG3A
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY4on
 bUhtcoR51DtgxYmKI/b3CVd9mDKJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2/GnrfGipRd2lHGIig6GnX61OZAgYgD5UJRx1gYKlXVwtfIi5fbBvGKHejbmuiN8ih67g==
IronPort-HdrOrdr: A9a23:9GPbgKH7ACxPdG0tpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617688"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 29/47] build: replace $(BASEDIR) and use $(srctree)
Date: Thu, 25 Nov 2021 13:39:48 +0000
Message-ID: <20211125134006.1076646-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
---

Notes:
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
index 2a809d577fc3..318320e79c7d 100644
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
 
 export ALL_OBJS := $(ALL_OBJS-y)
 export ALL_LIBS := $(ALL_LIBS-y)
diff --git a/xen/Rules.mk b/xen/Rules.mk
index cd00f006ee8f..20dedce06cd8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -9,13 +9,16 @@ endif
 
 src := $(obj)
 
+# shortcut for $(srctree)/$(src)
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
index 1ba488d645c0..7cfc9fd3bb1c 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -63,7 +63,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 efi-check-o := arch/x86/efi/check.o
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(efi-check-o:.o=.c) -o $(efi-check-o),y)
+XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check-o:.o=.c) -o $(efi-check-o),y)
 
 # Check if the linker supports PE.
 EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
diff --git a/xen/build.mk b/xen/build.mk
index c471312f98a3..65d8dbc13828 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -26,9 +26,9 @@ define cmd_compile.h
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
index 4eed31974509..53f7a76b3075 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -5,9 +5,12 @@
 
 src := $(obj)
 
+# shortcut for $(srctree)/$(src)
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


