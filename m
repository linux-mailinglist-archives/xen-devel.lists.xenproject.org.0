Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64F333A75
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95963.181278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJq-0003Dq-8N; Wed, 10 Mar 2021 10:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95963.181278; Wed, 10 Mar 2021 10:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwJp-0003CP-TQ; Wed, 10 Mar 2021 10:43:57 +0000
Received: by outflank-mailman (input) for mailman id 95963;
 Wed, 10 Mar 2021 10:43:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJwJn-000348-Rw
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:43:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4471baa2-310a-447f-ab21-e7e20a1a43d8;
 Wed, 10 Mar 2021 10:43:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582B511B3;
 Wed, 10 Mar 2021 02:43:45 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 420E33F85F;
 Wed, 10 Mar 2021 02:43:44 -0800 (PST)
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
X-Inumbo-ID: 4471baa2-310a-447f-ab21-e7e20a1a43d8
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	andrew.cooper3@citrix.com,
	amc96@cam.ac.uk
Subject: [XTF 2/4] build: Modify build system to support multiple architectures
Date: Wed, 10 Mar 2021 11:43:33 +0100
Message-Id: <20210310104335.14855-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210310104335.14855-1-michal.orzel@arm.com>
References: <20210310104335.14855-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently XTF build system is strictly made up for x86.
Modify the build system so that it will be easier
to add other platforms to XTF in the future.
This is done by generalizing the common makefiles to be
architecture independent and creating architecture
specific makefiles.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 .gitignore                            |  2 +-
 Makefile                              | 19 ++++++++---
 build/common.mk                       | 49 +++++++++++----------------
 build/gen.mk                          | 22 ++++++------
 build/x86/arch-common.mk              | 34 +++++++++++++++++++
 build/{files.mk => x86/arch-files.mk} | 12 ++-----
 6 files changed, 85 insertions(+), 53 deletions(-)
 create mode 100644 build/x86/arch-common.mk
 rename build/{files.mk => x86/arch-files.mk} (86%)

diff --git a/.gitignore b/.gitignore
index 5e458a3..dcacdf3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -4,7 +4,7 @@
 *.pyc
 *.pyo
 *.swp
-/arch/x86/*.lds
+/arch/*/*.lds
 /cscope.*
 /dist/
 /docs/autogenerated/
diff --git a/Makefile b/Makefile
index 15a865f..7c25b0d 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,5 @@
 MAKEFLAGS += -rR
 ROOT := $(abspath $(CURDIR))
-export ROOT
 
 # $(xtfdir) defaults to $(ROOT) so development and testing can be done
 # straight out of the working tree.
@@ -19,7 +18,16 @@ endif
 
 xtftestdir := $(xtfdir)/tests
 
-export DESTDIR xtfdir xtftestdir
+# Supported architectures
+SUPPORTED_ARCH := x86
+# Default architecture
+ARCH ?= x86
+# Check if specified architecture is supported
+ifeq ($(filter $(ARCH),$(SUPPORTED_ARCH)),)
+$(error Architecture '$(ARCH)' not supported)
+endif
+
+export ROOT DESTDIR ARCH xtfdir xtftestdir
 
 # Programs used
 CC              := $(CROSS_COMPILE)gcc
@@ -34,9 +42,12 @@ PYTHON          := python
 
 export CC CPP INSTALL INSTALL_DATA INSTALL_DIR INSTALL_PROGRAM OBJCOPY PYTHON
 
+# By default enable all the tests
+TESTS ?= $(wildcard tests/*)
+
 .PHONY: all
 all:
-	@set -e; for D in $(wildcard tests/*); do \
+	@set -e; for D in $(TESTS); do \
 		[ ! -e $$D/Makefile ] && continue; \
 		$(MAKE) -C $$D build; \
 	done
@@ -45,7 +56,7 @@ all:
 install:
 	@$(INSTALL_DIR) $(DESTDIR)$(xtfdir)
 	$(INSTALL_PROGRAM) xtf-runner $(DESTDIR)$(xtfdir)
-	@set -e; for D in $(wildcard tests/*); do \
+	@set -e; for D in $(TESTS); do \
 		[ ! -e $$D/Makefile ] && continue; \
 		$(MAKE) -C $$D install; \
 	done
diff --git a/build/common.mk b/build/common.mk
index 6480a54..71fce5c 100644
--- a/build/common.mk
+++ b/build/common.mk
@@ -1,21 +1,7 @@
-ALL_CATEGORIES     := special functional xsa utility in-development
+# Architecture independent/common configuration
 
-ALL_ENVIRONMENTS   := pv64 pv32pae hvm64 hvm32pae hvm32pse hvm32
-
-PV_ENVIRONMENTS    := $(filter pv%,$(ALL_ENVIRONMENTS))
-HVM_ENVIRONMENTS   := $(filter hvm%,$(ALL_ENVIRONMENTS))
-32BIT_ENVIRONMENTS := $(filter pv32% hvm32%,$(ALL_ENVIRONMENTS))
-64BIT_ENVIRONMENTS := $(filter pv64% hvm64%,$(ALL_ENVIRONMENTS))
-
-# $(env)_guest => pv or hvm mapping
-$(foreach env,$(PV_ENVIRONMENTS),$(eval $(env)_guest := pv))
-$(foreach env,$(HVM_ENVIRONMENTS),$(eval $(env)_guest := hvm))
-
-# $(env)_arch => x86_32/64 mapping
-$(foreach env,$(32BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_32))
-$(foreach env,$(64BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_64))
-
-COMMON_FLAGS := -pipe -I$(ROOT)/include -I$(ROOT)/arch/x86/include -MMD -MP
+ALL_CATEGORIES := special functional xsa utility in-development
+COMMON_FLAGS := -pipe -I$(ROOT)/include -I$(ROOT)/arch/$(ARCH)/include -MMD -MP
 
 # Experimental LTO support.  `make ... lto=y`
 COMMON_CFLAGS-$(lto) := -flto
@@ -23,25 +9,29 @@ LDFLAGS-$(lto) := -flto -fuse-ld=gold
 
 COMMON_AFLAGS := $(COMMON_FLAGS) -D__ASSEMBLY__
 COMMON_CFLAGS := $(COMMON_FLAGS) $(COMMON_CFLAGS-y)
+
+# Include architecture specific configuration
+include $(ROOT)/build/$(ARCH)/arch-common.mk
+
+COMMON_CFLAGS += -I$(ARCH_PATH)/include
+COMMON_AFLAGS += -I$(ARCH_PATH)/include
 COMMON_CFLAGS += -Wall -Wextra -Werror -std=gnu99 -Wstrict-prototypes -O3 -g
 COMMON_CFLAGS += -fno-common -fno-asynchronous-unwind-tables -fno-strict-aliasing
 COMMON_CFLAGS += -fno-stack-protector -fno-pic -ffreestanding
-COMMON_CFLAGS += -mno-red-zone -mno-sse
 COMMON_CFLAGS += -Wno-unused-parameter -Winline
 
-COMMON_AFLAGS-x86_32 := -m32
-COMMON_AFLAGS-x86_64 := -m64
-
-COMMON_CFLAGS-x86_32 := -m32
-COMMON_CFLAGS-x86_64 := -m64
-
+# Default guest configfiles
 defcfg-pv    := $(ROOT)/config/default-pv.cfg.in
 defcfg-hvm   := $(ROOT)/config/default-hvm.cfg.in
 
+# Following variables needs to be set up in $(ROOT)/build/$(ARCH)/arch-files.mk
+# obj-perarch  get compiled once per architecture
+# obj-perenv   get compiled once for each environment
+# obj-$(env)   are objects unique to a specific environment
 obj-perarch :=
 obj-perenv  :=
-include $(ROOT)/build/files.mk
 
+include $(ROOT)/build/$(ARCH)/arch-files.mk
 
 cc-option = $(shell if [ -z "`echo 'int p=1;' | $(CC) $(1) -S -o /dev/null -x c - 2>&1`" ]; \
 			then echo y; else echo n; fi)
@@ -49,7 +39,7 @@ cc-option = $(shell if [ -z "`echo 'int p=1;' | $(CC) $(1) -S -o /dev/null -x c
 # Disable PIE, but need to check if compiler supports it
 LDFLAGS-$(call cc-option,-no-pie) += -no-pie
 
-# Run once per environment to set up some common bits & pieces
+# Set up some common bits and pieces for specified environment
 define PERENV_setup
 
 AFLAGS_$($(1)_arch) := $$(COMMON_AFLAGS) $$(COMMON_AFLAGS-$($(1)_arch))
@@ -58,8 +48,8 @@ CFLAGS_$($(1)_arch) := $$(COMMON_CFLAGS) $$(COMMON_CFLAGS-$($(1)_arch))
 AFLAGS_$(1) := $$(AFLAGS_$($(1)_arch)) $$(COMMON_AFLAGS-$(1)) -DCONFIG_ENV_$(1) -include arch/config.h
 CFLAGS_$(1) := $$(CFLAGS_$($(1)_arch)) $$(COMMON_CFLAGS-$(1)) -DCONFIG_ENV_$(1) -include arch/config.h
 
-head-$(1) := $(ROOT)/arch/x86/$($(1)_guest)/head-$(1).o
-link-$(1) := $(ROOT)/arch/x86/link-$(1).lds
+link-$(1) := $(ARCH_PATH)/link-$(1).lds
+head-$(1) := $(ARCH_PATH)/$($(1)_guest)/head-$(1).o
 
 LDFLAGS_$(1) := -Wl,-T,$$(link-$(1)) -nostdlib $(LDFLAGS-y)
 
@@ -68,7 +58,7 @@ DEPS-$(1) = $$(head-$(1)) \
 	$$(obj-perarch:%.o=%-$($(1)_arch).o) \
 	$$(obj-$(1):%.o=%-$(1).o) $$(obj-perenv:%.o=%-$(1).o)
 
-# Generate .lds with approprate flags
+# Generate .lds with appropriate flags
 %/link-$(1).lds: %/link.lds.S
 	$$(CPP) $$(AFLAGS_$(1)) -P -C $$< -o $$@
 
@@ -90,6 +80,7 @@ DEPS-$(1) = $$(head-$(1)) \
 
 endef
 
+# Make a call to a function PERENV_setup once per each environment
 $(foreach env,$(ALL_ENVIRONMENTS),$(eval $(call PERENV_setup,$(env))))
 
 define move-if-changed
diff --git a/build/gen.mk b/build/gen.mk
index f657d87..87eb74e 100644
--- a/build/gen.mk
+++ b/build/gen.mk
@@ -1,6 +1,6 @@
+# Architecture independent makefile for compiling tests
 
 # Sanity checking of expected parameters
-
 ifeq ($(NAME),)
 $(error NAME should be specified)
 endif
@@ -44,20 +44,20 @@ install: install-each-env info.json
 	@$(INSTALL_DIR) $(DESTDIR)$(xtftestdir)/$(NAME)
 	$(INSTALL_DATA) info.json $(DESTDIR)$(xtftestdir)/$(NAME)
 
-hvm64-format := $(firstword $(filter elf32-x86-64,$(shell $(OBJCOPY) --help)) elf32-i386)
-
+# Build a test for specified environment
 define PERENV_build
 
-ifneq ($(1),hvm64)
-# Generic link line for most environments
+# If any environment needs a special compilation/linking recipe instead of
+# the default one, a custom recipe called build-$(env) e.g. build-hvm64
+# should be created in $(ROOT)/build/$(ARCH)/arch-common.mk
+
 test-$(1)-$(NAME): $$(DEPS-$(1)) $$(link-$(1))
+ifndef build-$(1)
+	@# Generic link line for most environments
 	$(CC) $$(LDFLAGS_$(1)) $$(DEPS-$(1)) -o $$@
 else
-# hvm64 needs linking normally, then converting to elf32-x86-64 or elf32-i386
-test-$(1)-$(NAME): $$(DEPS-$(1)) $$(link-$(1))
-	$(CC) $$(LDFLAGS_$(1)) $$(DEPS-$(1)) -o $$@.tmp
-	$(OBJCOPY) $$@.tmp -O $(hvm64-format) $$@
-	rm -f $$@.tmp
+	@# Environment specific compilation recipe
+	$(call build-$(1))
 endif
 
 cfg-$(1) ?= $(defcfg-$($(1)_guest))
@@ -91,6 +91,8 @@ install-$(1).cfg: $(filter test-$(1)-%,$(TEST-CFGS))
 install-each-env: install-$(1) install-$(1).cfg
 
 endef
+
+# Make a call to a function PERENV_build once per each test's environment
 $(foreach env,$(TEST-ENVS),$(eval $(call PERENV_build,$(env))))
 
 .PHONY: clean
diff --git a/build/x86/arch-common.mk b/build/x86/arch-common.mk
new file mode 100644
index 0000000..72448db
--- /dev/null
+++ b/build/x86/arch-common.mk
@@ -0,0 +1,34 @@
+# Architecture specific configuration for x86
+
+ARCH_PATH          := $(ROOT)/arch/x86
+ALL_ENVIRONMENTS   := pv64 pv32pae hvm64 hvm32pae hvm32pse hvm32
+
+PV_ENVIRONMENTS    := $(filter pv%,$(ALL_ENVIRONMENTS))
+HVM_ENVIRONMENTS   := $(filter hvm%,$(ALL_ENVIRONMENTS))
+32BIT_ENVIRONMENTS := $(filter pv32% hvm32%,$(ALL_ENVIRONMENTS))
+64BIT_ENVIRONMENTS := $(filter pv64% hvm64%,$(ALL_ENVIRONMENTS))
+
+# $(env)_guest => pv or hvm mapping
+$(foreach env,$(PV_ENVIRONMENTS),$(eval $(env)_guest := pv))
+$(foreach env,$(HVM_ENVIRONMENTS),$(eval $(env)_guest := hvm))
+
+# $(env)_arch => x86_32/64 mapping
+$(foreach env,$(32BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_32))
+$(foreach env,$(64BIT_ENVIRONMENTS),$(eval $(env)_arch := x86_64))
+
+COMMON_CFLAGS += -mno-red-zone -mno-sse
+
+COMMON_AFLAGS-x86_32 := -m32
+COMMON_AFLAGS-x86_64 := -m64
+COMMON_CFLAGS-x86_32 := -m32
+COMMON_CFLAGS-x86_64 := -m64
+
+hvm64-format := $(firstword $(filter elf32-x86-64,$(shell $(OBJCOPY) --help)) elf32-i386)
+
+# Compilation recipe for hvm64
+# hvm64 needs linking normally, then converting to elf32-x86-64 or elf32-i386
+define build-hvm64
+	$(CC) $$(LDFLAGS_hvm64) $$(DEPS-hvm64) -o $$@.tmp
+	$(OBJCOPY) $$@.tmp -O $(hvm64-format) $$@
+	rm -f $$@.tmp
+endef
diff --git a/build/files.mk b/build/x86/arch-files.mk
similarity index 86%
rename from build/files.mk
rename to build/x86/arch-files.mk
index dfa27e4..b02c849 100644
--- a/build/files.mk
+++ b/build/x86/arch-files.mk
@@ -1,9 +1,6 @@
-# Files compiled and linked for different architectures and environments
-#
-# obj-perarch  get compiled once per architecture
-# obj-perenv   get get compiled once for each environment
-# obj-$(env)   are objects unique to a specific environment
+# Architecture specific files compiled and linked for x86
 
+# Per architecture
 obj-perarch += $(ROOT)/common/console.o
 obj-perarch += $(ROOT)/common/exlog.o
 obj-perarch += $(ROOT)/common/extable.o
@@ -17,6 +14,7 @@ obj-perarch += $(ROOT)/common/report.o
 obj-perarch += $(ROOT)/common/setup.o
 obj-perarch += $(ROOT)/common/xenbus.o
 
+# Per environment
 obj-perenv += $(ROOT)/arch/x86/decode.o
 obj-perenv += $(ROOT)/arch/x86/desc.o
 obj-perenv += $(ROOT)/arch/x86/extable.o
@@ -26,7 +24,6 @@ obj-perenv += $(ROOT)/arch/x86/msr.o
 obj-perenv += $(ROOT)/arch/x86/setup.o
 obj-perenv += $(ROOT)/arch/x86/traps.o
 
-
 # HVM specific objects
 obj-hvm += $(ROOT)/arch/x86/apic.o
 obj-hvm += $(ROOT)/arch/x86/hpet.o
@@ -40,17 +37,14 @@ obj-hvm += $(ROOT)/arch/x86/x86-tss.o
 
 $(foreach env,$(HVM_ENVIRONMENTS),$(eval obj-$(env) += $(obj-hvm)))
 
-
 # PV specific objects
 obj-pv  += $(ROOT)/arch/x86/pv/traps.o
 $(foreach env,$(PV_ENVIRONMENTS),$(eval obj-$(env) += $(obj-pv)))
 
-
 # 32bit specific objects
 obj-32  += $(ROOT)/arch/x86/entry_32.o
 $(foreach env,$(32BIT_ENVIRONMENTS),$(eval obj-$(env) += $(obj-32)))
 
-
 # 64bit specific objects
 obj-64  += $(ROOT)/arch/x86/entry_64.o
 $(foreach env,$(64BIT_ENVIRONMENTS),$(eval obj-$(env) += $(obj-64)))
-- 
2.29.0


