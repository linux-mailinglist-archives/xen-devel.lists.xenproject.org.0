Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E481670E1FB
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:39:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538571.838675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2K-0002B7-C3; Tue, 23 May 2023 16:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538571.838675; Tue, 23 May 2023 16:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V2K-000240-2g; Tue, 23 May 2023 16:39:00 +0000
Received: by outflank-mailman (input) for mailman id 538571;
 Tue, 23 May 2023 16:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V2I-0006Dr-Ua
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eed198e-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:56 +0200 (CEST)
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
X-Inumbo-ID: 4eed198e-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NQbxeavhneBRrc5N4TAMJ536RafB9YjyOc/ENwv/Ymk=;
  b=NGpLfxnujMQzESbFl3zoFl5z7trgZIOTN6hOAGjwMxY0S+rfik8Wmfoy
   Wa3N1jdv8NfpKDeiDMZcYr8sj0JHLWKwFLNeGWt2JZ3X4iHr3frqLHFL6
   XAnUL2Hk9thB98XIaL88gNqazvt7U0FR28RrZDeX6CrT2MN3Hs4HUK9MZ
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109985465
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xTHf2qoAs4rTChhkO6Qj8ZBj5lFeBmKqZRIvgKrLsJaIsI4StFCzt
 garIBnSOfaLNGv2Ltojb9i08E9Tvp7Rm4VnSQJq+301FXkRo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzSJNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACAJYhTel/KH+uKEd6psvM0lIszVLIxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 juerjWpX01EabRzzxKp/3S+pMrGzBrdXYsLEKyH8/p3rn+Mkzl75Bo+CgLg/KjRZlSFc+xYL
 0sY6y8/t58Y/UagTsT+dxCgqXvCtRkZM/JaHvcm8giLxuzR6hyAG2kfZjdbbZots8pebSMu/
 k+EmZXuHzMHmLeSQ3iM+6yUqT63MC49ImoLZCtCRgwAi/Hop4c1iRDDR8hiC4a6i9T0HXf7x
 DXihCE6hq4PhM8Rkauh9FbMgimEuZTCCAUy423/Tm+jqw90eoOhT4ip8kTAq+ZNKp6DSVuMt
 2RCnNKRhMgVFo2EniGJROQLHZmq6uyDPTmahkRgd7Ej6jCs9niLbY1WpjZkKy9BMMwJZDvoa
 0/7oh5K6dlYO37CUENsS9vvUYJwl/GmTIm7EKmONbKif6SdaieX+C1qOF6A7lq9r3VvkZs2P
 5meT9ajWCNy5btc8BK6QOIU0LkOzy84xH/OSZ2T8ylLwYZyd1bOF+5bbQLmgvQRqfrd/V6Lq
 4o3296ikU03bQHoXsXAHWf/x3guJGNzO535otc/mgWrcls/QzFJ5xM8LNocl21Zc0Z9zL+gE
 pKVABUwJL/DaZrvd223hohLMu+HYHqGhStT0dYQFVipwWM/Ro2k8b0ScZA6FZF+qrw/kq4sE
 6JUIp3cahiqdtgg021HBaQRUaQ4LEj77e5wF3HNjMcDk25IGFWSp46MkvrH/ygSFCun3fYDT
 0mb/lqDG/IrHl0yZPs6ndrzlztdS1BBwrMtN6YJS/EPEHjRHH9CcHSr36Boe5FddX0uBFKyj
 m6rPPvRnsGVy6ddzTUDrfrUx2t1O4OSxnZnIlQ=
IronPort-HdrOrdr: A9a23:Purub6ixrSIPgfr7MA8h30qkinBQXioji2hC6mlwRA09TyX5ra
 2TdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKF+Vzd8kXFndK1vp
 0QEZSWZueRMbEAt7ec3OG5eexQvOVu8sqT9JjjJ6EGd3AVV0lihT0JezpyCidNNW977QJSLu
 vn2iJAzQDQAEg/X4CAKVQuefPMnNHPnIKOW296O/Z2gDP+9Q9B8dTBYmOl4is=
X-Talos-CUID: 9a23:zQciRGOW3sj4YO5DSC1r8BMECvEfIkLgj3fqKkm2DFh5R+jA
X-Talos-MUID: 9a23:bvn3Dwk6E3u5H3vQ4n4bdnpOOcF6wYGnWXkrlJwfv9i7MChtFRWC2WE=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109985465"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 11/15] build: rename CFLAGS to XEN_CFLAGS in xen/Makefile
Date: Tue, 23 May 2023 17:38:07 +0100
Message-ID: <20230523163811.30792-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is a preparatory patch. A future patch will not even use
$(CFLAGS) to seed $(XEN_CFLAGS).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile           | 41 ++++++++++++++---------------
 xen/arch/arm/arch.mk   |  4 +--
 xen/arch/riscv/arch.mk |  4 +--
 xen/arch/x86/arch.mk   | 58 +++++++++++++++++++++---------------------
 4 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index c4a83fca76..b3bffe8c6f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -259,6 +259,7 @@ export KBUILD_DEFCONFIG := $(ARCH)_defconfig
 export XEN_TREEWIDE_CFLAGS := $(CFLAGS)
 
 XEN_AFLAGS =
+XEN_CFLAGS = $(CFLAGS)
 
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
@@ -284,7 +285,7 @@ CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
 endif
 
 CLANG_FLAGS += -Werror=unknown-warning-option
-CFLAGS += $(CLANG_FLAGS)
+XEN_CFLAGS += $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
@@ -293,7 +294,7 @@ ifeq ($(call ld-ver-build-id,$(LD)),n)
 XEN_LDFLAGS_BUILD_ID :=
 XEN_HAS_BUILD_ID := n
 else
-CFLAGS += -DBUILD_ID
+XEN_CFLAGS += -DBUILD_ID
 XEN_TREEWIDE_CFLAGS += -DBUILD_ID
 XEN_HAS_BUILD_ID := y
 XEN_LDFLAGS_BUILD_ID := --build-id=sha1
@@ -388,30 +389,30 @@ include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
-CFLAGS += -O1
+XEN_CFLAGS += -O1
 else
-CFLAGS += -O2
+XEN_CFLAGS += -O2
 endif
 
 ifeq ($(CONFIG_FRAME_POINTER),y)
-CFLAGS += -fno-omit-frame-pointer
+XEN_CFLAGS += -fno-omit-frame-pointer
 else
-CFLAGS += -fomit-frame-pointer
+XEN_CFLAGS += -fomit-frame-pointer
 endif
 
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
 
-CFLAGS += -nostdinc -fno-builtin -fno-common
-CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
-$(call cc-option-add,CFLAGS,CC,-Wvla)
-CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
+XEN_CFLAGS += -nostdinc -fno-builtin -fno-common
+XEN_CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+$(call cc-option-add,XEN_CFLAGS,CC,-Wvla)
+XEN_CFLAGS += -pipe -D__XEN__ -include $(srctree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 # Clang doesn't understand this command line argument, and doesn't appear to
 # have a suitable alternative.  The resulting compiled binary does function,
 # but has an excessively large symbol table.
-CFLAGS += -Wa,--strip-local-absolute
+XEN_CFLAGS += -Wa,--strip-local-absolute
 endif
 
 XEN_AFLAGS += -D__ASSEMBLY__
@@ -420,14 +421,14 @@ $(call cc-option-add,XEN_AFLAGS,CC,-Wa$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
-CFLAGS += $(CFLAGS-y)
+XEN_CFLAGS += $(CFLAGS-y)
 # allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
-CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
+XEN_CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
 
 # Most CFLAGS are safe for assembly files:
 #  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
 #  -flto makes no sense and annoys clang
-XEN_AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS)) $(AFLAGS-y)
+XEN_AFLAGS += $(filter-out -std=gnu% -flto,$(XEN_CFLAGS)) $(AFLAGS-y)
 
 # LDFLAGS are only passed directly to $(LD)
 LDFLAGS += $(LDFLAGS_DIRECT) $(LDFLAGS-y)
@@ -439,16 +440,16 @@ CFLAGS_UBSAN :=
 endif
 
 ifeq ($(CONFIG_LTO),y)
-CFLAGS += -flto
+XEN_CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
 ifdef building_out_of_srctree
-    CFLAGS += -I$(objtree)/include
-    CFLAGS += -I$(objtree)/arch/$(TARGET_ARCH)/include
+    XEN_CFLAGS += -I$(objtree)/include
+    XEN_CFLAGS += -I$(objtree)/arch/$(TARGET_ARCH)/include
 endif
-CFLAGS += -I$(srctree)/include
-CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
+XEN_CFLAGS += -I$(srctree)/include
+XEN_CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
@@ -463,7 +464,7 @@ ALL_LIBS-y                := lib/lib.a
 include $(srctree)/arch/$(TARGET_ARCH)/arch.mk
 
 # define new variables to avoid the ones defined in Config.mk
-export XEN_CFLAGS := $(CFLAGS)
+export XEN_CFLAGS := $(XEN_CFLAGS)
 export XEN_AFLAGS := $(XEN_AFLAGS)
 export XEN_LDFLAGS := $(LDFLAGS)
 export CFLAGS_UBSAN
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 58db76c4e1..300b8bf7ae 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,8 +1,8 @@
 ########################################
 # arm-specific definitions
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
+$(call cc-options-add,XEN_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-option-add,XEN_CFLAGS,CC,-Wnested-externs)
 
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS-$(CONFIG_ARM_32) += -msoft-float
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 7448f759b4..aadf373ce8 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -1,7 +1,7 @@
 ########################################
 # RISCV-specific definitions
 
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-options-add,XEN_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
 
@@ -12,7 +12,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # into the upper half _or_ the lower half of the address space.
 # -mcmodel=medlow would force Xen into the lower half.
 
-CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
+XEN_CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
 
 # TODO: Drop override when more of the build is working
 override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 13ec88a628..5df3cf6bc3 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,42 +3,42 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
-CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
-CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
+XEN_CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-generic
+XEN_CFLAGS += -I$(srctree)/arch/x86/include/asm/mach-default
+XEN_CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
-CFLAGS += -msoft-float
-
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
-$(call as-option-add,CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
-$(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
-$(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
-$(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
-$(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
-$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
-$(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
-$(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
-$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
-$(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
-$(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
+XEN_CFLAGS += -msoft-float
+
+$(call cc-options-add,XEN_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
+$(call cc-option-add,XEN_CFLAGS,CC,-Wnested-externs)
+$(call as-option-add,XEN_CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
+$(call as-option-add,XEN_CFLAGS,CC,"crc32 %eax$(comma)%eax",-DHAVE_AS_SSE4_2)
+$(call as-option-add,XEN_CFLAGS,CC,"invept (%rax)$(comma)%rax",-DHAVE_AS_EPT)
+$(call as-option-add,XEN_CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
+$(call as-option-add,XEN_CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
+$(call as-option-add,XEN_CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
+$(call as-option-add,XEN_CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
+$(call as-option-add,XEN_CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
+$(call as-option-add,XEN_CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
+$(call as-option-add,XEN_CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
+$(call as-option-add,XEN_CFLAGS,CC,"invpcid (%rax)$(comma)%rax",-DHAVE_AS_INVPCID)
+$(call as-option-add,XEN_CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+$(call as-option-add,XEN_CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
 # GAS's idea of true is -1.  Clang's idea is 1
-$(call as-option-add,CFLAGS,CC,\
+$(call as-option-add,XEN_CFLAGS,CC,\
     ".if ((1 > 0) < 0); .error \"\";.endif",,-DHAVE_AS_NEGATIVE_TRUE)
 
 # Check to see whether the assmbler supports the .nop directive.
-$(call as-option-add,CFLAGS,CC,\
+$(call as-option-add,XEN_CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
-CFLAGS += -mno-red-zone -fpic
+XEN_CFLAGS += -mno-red-zone -fpic
 
 # Xen doesn't use MMX or SSE interally.  If the compiler supports it, also skip
 # the SSE setup for variadic function calls.
-CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
+XEN_CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
@@ -54,10 +54,10 @@ ifdef CONFIG_XEN_IBT
 # Force -fno-jump-tables to work around
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
 #   https://github.com/llvm/llvm-project/issues/54247
-CFLAGS += -fcf-protection=branch -mmanual-endbr -fno-jump-tables
-$(call cc-option-add,CFLAGS,CC,-fcf-check-attribute=no)
+XEN_CFLAGS += -fcf-protection=branch -mmanual-endbr -fno-jump-tables
+$(call cc-option-add,XEN_CFLAGS,CC,-fcf-check-attribute=no)
 else
-$(call cc-option-add,CFLAGS,CC,-fcf-protection=none)
+$(call cc-option-add,XEN_CFLAGS,CC,-fcf-protection=none)
 endif
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
@@ -91,7 +91,7 @@ efi-check := arch/x86/efi/check
 $(shell mkdir -p $(dir $(efi-check)))
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
+XEN_BUILD_EFI := $(call if-success,$(CC) $(XEN_CFLAGS) -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
 
 # Check if the linker supports PE.
 EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
@@ -129,4 +129,4 @@ export EFI_LDFLAGS
 endif
 
 # Set up the assembler include path properly for older toolchains.
-CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
+XEN_CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
-- 
Anthony PERARD


