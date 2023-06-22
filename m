Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F973A515
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553683.864404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJ0-0002TQ-6g; Thu, 22 Jun 2023 15:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553683.864404; Thu, 22 Jun 2023 15:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMJ0-0002RE-3C; Thu, 22 Jun 2023 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 553683;
 Thu, 22 Jun 2023 15:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCMIx-0002MD-RA
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:33:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1236430b-1112-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:33:02 +0200 (CEST)
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
X-Inumbo-ID: 1236430b-1112-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687447982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oCKLH/zSg4xUlzCsYWMLexAT1INT2AflrWoFzXWfGBY=;
  b=dcWR56HUWqYawH1alc4JXyweBK/KcqP4aRtmPMUFMAqZyIalfGiXWWpb
   5WdBha5+IkIMOzo12aWLapl0xlkU8eJdpe5cb/gtdj4echofr3slfoKPW
   PKsPlaYGlF+YvgSjgHY6heNRR06ClCBpodAs2AIgEwMlcp4RbZGJwtLmH
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112500242
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:vJxeBa64oKsIr4Y+jPpbgQxRtMrHchMFZxGqfqrLsTDasY5as4F+v
 jQfDW2FOPzbZjemL9kkYIy09xgCv5SGm4NkGQY4rHswHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa4R5geC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 PElLBQoZC24t+Ok7Ju2W+hFmNQuI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/C+
 zqepTijav0cHNuT7SSG702Ous7KsiP8arNKL6Pn88c/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpasEitcIwbSwn0
 BmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBsZRQBy8nupsc0lB2nZtxkGqSkg8b1HTz1y
 jaioy03hrFVhskOv42y+VHcnzutvN7HVAcz7QTMdn2p5UVyY4vNT4ev717c7/pJMoeCZlaEt
 XkA3cOZ6Ygz4YqlzXLXBr9XRffwuqjDaWeH6bJyI3U/3y2gxnqHWIpt2wF/NmtAP9cFUCH5b
 UCG7Gu9+6Rv0GuWgb5fOtzhVJ90nfa8RbwJRdiPMIMQP8EZmBuvuXg3OBXOhz2FfF0Ey/lXB
 HuNTSq74Z/244xDxSH+eeoS2KRDKssWlTKKHsCTI/hKPNOjiJ+ppVQtagHmghgRtv/sneks2
 4832zG24xteSvbiRSLc7JQeK1sHRVBiW8Cp8JMNLL7bf1E3cI3ENxM36el6E2CCt/4P/tokA
 1nnAhMIoLYBrSOvxfq2hoBLN+q0AMcXQYMTNi0wJ1e4s0XPkq72hJrzg6AfJOF9nMQ6lK4cc
 hXwU5nYahi5Ymidqmt1gFiUhNAKSSlHcirXZHT5O2ZgL8I5L+ELk/e9FjbSGOA1JnLfnaMDT
 3eIiGs3nbJrq9xeMfvr
IronPort-HdrOrdr: A9a23:P66W/KqdhmHw70/frDtBV5kaV5oGeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5gr5NEtQ++xoRpPwO080hKQV3WB5B97LMDUO3lHYVL2KwrGM/9SKIVycygcy79
 YET0A3YOebMbAx5fyW3OH3eOxQpKjhzEgo7t2utkuEJGtRGsddB+cQMHfhLnFL
X-Talos-CUID: 9a23:S1KAmm3xtA/2ZGw/Sm+AB7xfA80Ydln4xkrrE06qJU9kWby8V0+d9/Yx
X-Talos-MUID: 9a23:Br+qBwrtROSdCM27o7wezzZuENlr/puMNGEIvpUBifjcDjIvPg7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,149,1684814400"; 
   d="scan'208";a="112500242"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [XEN PATCH v2 3/5] build: remove TARGET_ARCH, a duplicates of SRCARCH
Date: Thu, 22 Jun 2023 16:30:03 +0100
Message-ID: <20230622153005.31604-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622153005.31604-1-anthony.perard@citrix.com>
References: <20230622153005.31604-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The same command is used to generate the value of both $(TARGET_ARCH)
and $(SRCARCH), as $(ARCH) is an alias for $(XEN_TARGET_ARCH).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch

 xen/Makefile           | 18 +++++++-----------
 xen/Rules.mk           |  2 +-
 xen/arch/riscv/arch.mk |  2 +-
 xen/build.mk           |  6 +++---
 4 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index bc639a1f80..ac2765050b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -242,10 +242,6 @@ SRCARCH := $(shell echo $(ARCH) | \
         -e 's/riscv.*/riscv/g')
 export ARCH SRCARCH
 
-export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-                                -e s'/riscv.*/riscv/g')
-
 export CONFIG_SHELL := $(SHELL)
 export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
 export YACC = $(if $(BISON),$(BISON),bison)
@@ -262,7 +258,7 @@ export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
 
-ifeq ($(TARGET_ARCH),x86)
+ifeq ($(SRCARCH),x86)
 # The tests to select whether the integrated assembler is usable need to happen
 # before testing any assembler features, or else the result of the tests would
 # be stale if the integrated assembler is not used.
@@ -430,22 +426,22 @@ endif
 
 ifdef building_out_of_srctree
     CFLAGS += -I$(objtree)/include
-    CFLAGS += -I$(objtree)/arch/$(TARGET_ARCH)/include
+    CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
 endif
 CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
+CFLAGS += -I$(srctree)/arch/$(SRCARCH)/include
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
 ALL_OBJS-y                += drivers/built_in.o
 ALL_OBJS-y                += lib/built_in.o
 ALL_OBJS-y                += xsm/built_in.o
-ALL_OBJS-y                += arch/$(TARGET_ARCH)/built_in.o
+ALL_OBJS-y                += arch/$(SRCARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
 ALL_LIBS-y                := lib/lib.a
 
-include $(srctree)/arch/$(TARGET_ARCH)/arch.mk
+include $(srctree)/arch/$(SRCARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
 export XEN_CFLAGS := $(CFLAGS)
@@ -588,8 +584,8 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	$(Q)$(MAKE) $(build)=include all
-	$(Q)$(MAKE) $(build)=arch/$(TARGET_ARCH) include
-	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
+	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
+	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
 
 SUBDIRS = xsm arch common crypto drivers lib test
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 59072ae8df..8af3dd7277 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -180,7 +180,7 @@ cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
 c_flags = -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
 a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
-include $(srctree)/arch/$(TARGET_ARCH)/Rules.mk
+include $(srctree)/arch/$(SRCARCH)/Rules.mk
 
 c_flags += $(_c_flags)
 a_flags += $(_c_flags)
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 7448f759b4..8403f96b6f 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -15,5 +15,5 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
-override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
+override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
 override ALL_LIBS-y =
diff --git a/xen/build.mk b/xen/build.mk
index 7e33e710fd..26dd5a8e87 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -41,11 +41,11 @@ include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 targets += include/xen/compile.h
 
 -include $(wildcard .asm-offsets.s.d)
-asm-offsets.s: arch/$(TARGET_ARCH)/$(ARCH)/asm-offsets.c
+asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
-arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
+arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	@(set -e; \
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
@@ -87,4 +87,4 @@ endif
 targets += prelink.o
 
 $(TARGET): prelink.o FORCE
-	$(Q)$(MAKE) $(build)=arch/$(TARGET_ARCH) $@
+	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) $@
-- 
Anthony PERARD


