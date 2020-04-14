Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB91A79D1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:44:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJyh-0004nz-U8; Tue, 14 Apr 2020 11:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOJyf-0004nu-VW
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:43:41 +0000
X-Inumbo-ID: 2fa59b09-7e45-11ea-8927-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fa59b09-7e45-11ea-8927-12813bfff9fa;
 Tue, 14 Apr 2020 11:43:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33DAAAC4A;
 Tue, 14 Apr 2020 11:43:39 +0000 (UTC)
Subject: [PATCH v6 01/10] x86: determine HAVE_AS_* just once
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <8fc57413-4adb-fd31-ea43-440eda3c1e92@suse.com>
Date: Tue, 14 Apr 2020 13:43:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

With the exception of HAVE_AS_QUOTED_SYM, populate the results into a
generated header instead of (at least once per [sub]directory) into
CFLAGS. This results in proper rebuilds (via make dependencies) in case
the compiler used changes between builds. It additionally eases
inspection of which assembler features were actually found usable.

Some trickery is needed to avoid header generation itself to try to
include the to-be/not-yet-generated header.

Since the definitions in generated/config.h, previously having been
command line options, might even affect xen/config.h or its descendants,
move adding of the -include option for the latter after inclusion of the
per-arch Rules.mk. Use the occasion to also move the most general -I
option to the common Rules.mk.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v4: New.
---
An alternative to the $(MAKECMDGOALS) trickery would be to make
generation of generated/config.h part of the asm-offsets.s rule, instead
of adding it as a dependency there. Not sure whether either is truly
better than the other.

--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -55,7 +55,7 @@ endif
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
-CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+CFLAGS += -pipe -D__XEN__ -I$(BASEDIR)/include
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 CFLAGS += '-D__OBJECT_FILE__="$@"'
 
@@ -95,6 +95,9 @@ SPECIAL_DATA_SECTIONS := rodata $(foreac
 
 include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
+# Allow the arch to use -include ahead of this one.
+CFLAGS += -include xen/config.h
+
 include Makefile
 
 define gendep
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -6,8 +6,6 @@
 # 'make clean' before rebuilding.
 #
 
-CFLAGS += -I$(BASEDIR)/include
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -225,7 +225,8 @@ endif
 efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
 efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: ;
 
-asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
+asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h \
+	$(BASEDIR)/include/generated/config.h
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(CFLAGS)) -S -o $@ $<
 
 asm-macros.i: CFLAGS += -D__ASSEMBLY__ -P
@@ -241,6 +242,45 @@ $(BASEDIR)/include/asm-x86/asm-macros.h:
 	echo '#endif' >>$@.new
 	$(call move-if-changed,$@.new,$@)
 
+# There are multiple invocations of this Makefile, one each for asm-offset.s,
+# $(TARGET), built_in.o, and several more from the rules building $(TARGET)
+# and $(TARGET).efi. The 2nd and 3rd may race with one another, and we don't
+# want to re-generate config.h in that case anyway, so guard the logic
+# accordingly. (We do want to have the FORCE dependency on the rule, to be
+# sure we pick up changes when the compiler used has changed.)
+ifeq ($(MAKECMDGOALS),asm-offsets.s)
+
+as-ISA-list := CLWB EPT FSGSBASE INVPCID RDRAND RDSEED SSE4_2 VMX XSAVEOPT
+
+CLWB-insn	:= clwb (%rax)
+EPT-insn	:= invept (%rax),%rax
+FSGSBASE-insn	:= rdfsbase %rax
+INVPCID-insn	:= invpcid (%rax),%rax
+RDRAND-insn	:= rdrand %eax
+RDSEED-insn	:= rdseed %eax
+SSE4_2-insn	:= crc32 %eax,%eax
+VMX-insn	:= vmcall
+XSAVEOPT-insn	:= xsaveopt (%rax)
+
+# GAS's idea of true is -1.  Clang's idea is 1.
+NEGATIVE_TRUE-insn := .if ((1 > 0) > 0); .error \"\"; .endif
+
+# Check to see whether the assembler supports the .nops directive.
+NOPS_DIRECTIVE-insn := .L1: .L2: .nops (.L2 - .L1),9
+
+as-features-list := $(as-ISA-list) NEGATIVE_TRUE NOPS_DIRECTIVE
+
+$(BASEDIR)/include/generated/config.h: FORCE
+	echo '/* Generated header, do not edit. */' >$@.new
+	$(foreach f,$(as-features-list), \
+	  $(if $($(f)-insn),,$(error $(f)-insn is empty)) \
+	  echo '#$(call as-insn,$(CC) $(CFLAGS),"$($(f)-insn)", \
+	           define, \
+	           undef) HAVE_AS_$(f) /* $($(f)-insn) */' >>$@.new;)
+	$(call move-if-changed,$@.new,$@)
+
+endif
+
 efi.lds: AFLAGS += -DEFI
 xen.lds efi.lds: xen.lds.S
 	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(AFLAGS)) -o $@ $<
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -3,7 +3,7 @@
 
 XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(BASEDIR)/include
+CFLAGS += $(if $(filter asm-macros.% %/generated/config.h,$@),,-include generated/config.h)
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
@@ -38,26 +38,9 @@ endif
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
-$(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$$(comma)%rax",-DHAVE_AS_EPT)
-$(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
-$(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
-$(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
-$(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
-$(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1", \
                      -U__OBJECT_LABEL__ -DHAVE_AS_QUOTED_SYM \
                      '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$$@')
-$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
-
-# GAS's idea of true is -1.  Clang's idea is 1
-$(call as-option-add,CFLAGS,CC,\
-    ".if ((1 > 0) < 0); .error \"\";.endif",,-DHAVE_AS_NEGATIVE_TRUE)
-
-# Check to see whether the assmbler supports the .nop directive.
-$(call as-option-add,CFLAGS,CC,\
-    ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
 CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
 
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -64,7 +64,7 @@ compat/%.h: compat/%.i Makefile $(BASEDI
 	mv -f $@.new $@
 
 compat/%.i: compat/%.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)% -M% %.d -include %/include/xen/config.h,$(CFLAGS)) $(cppflags-y) -o $@ $<
+	$(CPP) $(filter-out -Wa$(comma)% -M% %.d -include %/config.h,$(CFLAGS)) $(cppflags-y) -o $@ $<
 
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -10,7 +10,7 @@ DEPS_INCLUDE = $(addsuffix .d2, $(basena
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
-                       | $(filter-out -M% %.d -include %/include/xen/config.h,$(1)) \
+                       | $(filter-out -M% %.d -include %/config.h,$(1)) \
                               -c -x c -o /dev/null - 2>&1),$(4),$(3))
 
 # as-option-add: Conditionally add options to flags


