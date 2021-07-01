Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1153C3B9321
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148811.275140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZk-0005PV-HM; Thu, 01 Jul 2021 14:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148811.275140; Thu, 01 Jul 2021 14:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZk-0005Gh-3g; Thu, 01 Jul 2021 14:21:56 +0000
Received: by outflank-mailman (input) for mailman id 148811;
 Thu, 01 Jul 2021 14:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPv-0005F9-L9
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2af6936c-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:11:03 +0000 (UTC)
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
X-Inumbo-ID: 2af6936c-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d78ReIC4dkXR+RmdsCXwSdPyXPKAHSLgx1r8az094Oo=;
  b=eIxBi1MBjmYipGvvmIhPEBPKrG9UCNUsnwW5XXsZC9PgxcdePe5u9w+n
   3x11jLRKnJG5OFZbKfcoHCct53ACGks3fCV35UFd7j5wQWJHcPuVdTvPp
   HVkFdjJ1t8il1sTlP/H7w6Mhh7wDdwFwt3KV8j2OW02nyxv00lF36OLJK
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HUVxGlcv97ZQa0q3AG+QVFZyCim0+EctzY0AQqEJU9/a4O2q/VswMmJj2dscPL3gGS5BYDUtXu
 Ln5LcK0JeLj8SLBWQUwwPZcb+CBR0MgtYDN6Z2eKiGPu3pey4nckyiNJkJgawA9ga4padMIavk
 MLQeozwN95dAxhRg5I7rV8lpyOE2HMyCqFUVBERAhuVgHVHCUChau1oPTa0m60KwD/pveGDB8u
 5nw3wXwQep8VcCvGKUxSGPXDNh4CyEMmxS82mYFkvOVaEVcRxv5+iPxyP+T2lT+PFDjW2aqVKp
 zdQ=
X-SBRS: 5.1
X-MesageID: 49007566
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qE7bfKiEd9bH3XMDcANDU6kM4HBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="49007566"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v6 27/31] build: prepare to always invoke $(MAKE) from xen/, use $(obj)
Date: Thu, 1 Jul 2021 15:10:07 +0100
Message-ID: <20210701141011.785641-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In a future patch, when building a subdirectory, we will set
"obj=$subdir" rather than change directory.

Before that, we add "$(obj)" and "$(src)" in as many places as
possible where we will need to know which subdirectory is been built.
"$(obj)" is for files been generated during the build, and "$(src)" is
for files present in the source tree.

For now, we set both to "." in Rules.mk and Makefile.clean.

A few places don't tolerate the addition of "./", this is because make
remove the leading "./" in targets and dependencies in rules, so these
will be change later.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk                            |  5 ++-
 xen/arch/arm/Makefile                   | 14 +++---
 xen/arch/x86/Makefile                   | 60 ++++++++++++-------------
 xen/arch/x86/boot/Makefile              | 14 +++---
 xen/arch/x86/efi/Makefile               |  6 +--
 xen/common/Makefile                     |  8 ++--
 xen/common/libelf/Makefile              |  4 +-
 xen/common/libfdt/Makefile              |  6 +--
 xen/include/Makefile                    | 44 +++++++++---------
 xen/scripts/Makefile.clean              |  5 ++-
 xen/xsm/flask/Makefile                  | 34 +++++++-------
 xen/xsm/flask/policy/mkaccess_vector.sh |  7 ++-
 12 files changed, 108 insertions(+), 99 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 530aefa43ad9..0f8d90844455 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -3,6 +3,9 @@
 # Makefile and are consumed by Rules.mk
 #
 
+obj := .
+src := $(obj)
+
 -include $(BASEDIR)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
@@ -23,7 +26,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             rodata.cst$(a)) \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
-include Makefile
+include $(src)/Makefile
 
 # Linking
 # ---------------------------------------------------------------------------
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 067c0d9844e4..9f9c73aa6c5d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -88,18 +88,18 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
+$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -109,13 +109,13 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
 .PHONY: include
 include:
 
-xen.lds: xen.lds.S FORCE
+$(obj)/xen.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed,cpp_lds_S)
 
-dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
+$(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
 .PHONY: clean
 clean::
-	rm -f xen.lds
+	rm -f $(obj)/xen.lds
 	rm -f $(BASEDIR)/.xen-syms.[0-9]*
 	rm -f $(TARGET).efi
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index fc719247eac9..2cc67d6e0e84 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -82,7 +82,7 @@ extra-y += asm-macros.i
 extra-y += xen.lds
 
 ifneq ($(CONFIG_HVM),y)
-x86_emulate.o: CFLAGS-y += -Wno-unused-label
+$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
 
 efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
@@ -113,8 +113,8 @@ syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
 
 $(TARGET): TMP = $(@D)/.$(@F).elf32
-$(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
-	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
+$(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
+	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
 	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
 	od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
 		{ echo "No Multiboot1 header found" >&2; false; }
@@ -125,29 +125,29 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 ifneq ($(efi-y),)
 
 # Check if the compiler supports the MS ABI.
-XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c $(src)/efi/check.c -o $(obj)/efi/check.o 2>/dev/null && echo y)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 # Check if the linker supports PE.
 EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
-XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o))
+XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(obj)/efi/check.efi $(obj)/efi/check.o))
 # If the above failed, it may be merely because of the linker not dealing well
 # with debug info. Try again with stripping it.
 ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
 EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o efi/check.efi efi/check.o)
+XEN_BUILD_PE := $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(obj)/efi/check.efi $(obj)/efi/check.o)
 endif
 
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default
-nr-fixups := $(shell $(OBJDUMP) -p efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
+nr-fixups := $(shell $(OBJDUMP) -p $(obj)/efi/check.efi | grep '^[[:blank:]]*reloc[[:blank:]]*[0-9][[:blank:]].*DIR64$$' | wc -l)
 ifeq ($(nr-fixups),2)
 MKRELOC := :
 relocs-dummy :=
 else
-MKRELOC := efi/mkreloc
-relocs-dummy := efi/relocs-dummy.o
+MKRELOC := $(obj)/efi/mkreloc
+relocs-dummy := $(obj)/efi/relocs-dummy.o
 # If the linker produced fixups but not precisely two of them, we need to
 # disable it doing so.  But if it didn't produce any fixups, it also wouldn't
 # recognize the option.
@@ -160,27 +160,27 @@ endif # $(XEN_BUILD_PE)
 
 endif # $(efi-y)
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
-note.o: $(TARGET)-syms
+$(obj)/note.o: $(TARGET)-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) -I binary -O elf64-x86-64 -B i386:x86-64 \
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
@@ -199,23 +199,23 @@ ifdef SOURCE_DATE_EPOCH
 EFI_LDFLAGS += --no-insert-timestamp
 endif
 
-$(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
+$(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
 ifeq ($(MKRELOC),:)
 $(TARGET).efi: ALT_BASE :=
 else
-$(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
+$(TARGET).efi: ALT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
 ifneq ($(build_id_linker),)
 ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
 CFLAGS-y += -DBUILD_ID_EFI
 EFI_LDFLAGS += $(build_id_linker)
-note_file := efi/buildid.o
+note_file := $(obj)/efi/buildid.o
 # NB: this must be the last input in the linker call, because inputs following
 # the -b option will all be treated as being in the specified format.
 note_file_option := -b pe-x86-64 $(note_file)
 else
-note_file := note.o
+note_file := $(obj)/note.o
 endif
 else
 note_file :=
@@ -224,25 +224,25 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 extra-y += efi.lds
-$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< $(relocs-dummy) \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
 	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
@@ -253,15 +253,15 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
-efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
-efi/buildid.o efi/relocs-dummy.o: ;
+$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
+$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 
 .PHONY: include
 include: $(BASEDIR)/include/arch-x86/asm/asm-macros.h
 
-asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
+$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/include/arch-x86/asm/asm-macros.h: asm-macros.i Makefile
+$(BASEDIR)/include/arch-x86/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	echo '#if 0' >$@.new
 	echo '.if 0' >>$@.new
 	echo '#endif' >>$@.new
@@ -275,14 +275,14 @@ $(BASEDIR)/include/arch-x86/asm/asm-macros.h: asm-macros.i Makefile
 	echo '#endif' >>$@.new
 	$(call move-if-changed,$@.new,$@)
 
-efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S FORCE
+$(obj)/efi.lds: AFLAGS-y += -DEFI
+$(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 	$(call if_changed,cpp_lds_S)
 
-boot/mkelf32: boot/mkelf32.c
+$(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
 
-efi/mkreloc: efi/mkreloc.c
+$(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
 
 .PHONY: clean
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 9b31bfcbfb8a..53d357489df2 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,8 +1,8 @@
 obj-bin-y += head.o
 
-DEFS_H_DEPS = defs.h $(BASEDIR)/include/xen/stdbool.h
+DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) video.h
+CMDLINE_DEPS = $(DEFS_H_DEPS) $(src)/video.h
 
 RELOC_DEPS = $(DEFS_H_DEPS) \
 	     $(BASEDIR)/include/generated/autoconf.h \
@@ -11,10 +11,10 @@ RELOC_DEPS = $(DEFS_H_DEPS) \
 	     $(BASEDIR)/include/xen/multiboot2.h \
 	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
 
-head.o: cmdline.S reloc.S
+$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
 
-cmdline.S: cmdline.c $(CMDLINE_DEPS)
-	$(MAKE) -f build32.mk $@ CMDLINE_DEPS="$(CMDLINE_DEPS)"
+$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS)
+	$(MAKE) -f build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
 
-reloc.S: reloc.c $(RELOC_DEPS)
-	$(MAKE) -f build32.mk $@ RELOC_DEPS="$(RELOC_DEPS)"
+$(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS)
+	$(MAKE) -f build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 87b927ed865b..ac815f02cb5e 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -3,16 +3,16 @@ CFLAGS-y += -fshort-wchar
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 
-%.o: %.ihex FORCE
+$(obj)/%.o: $(src)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
-boot.init.o: buildid.o
+$(obj)/boot.init.o: $(obj)/buildid.o
 
 EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
 EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-$(EFIOBJ-y): CFLAGS-stack-boundary := $(cflags-stack-boundary)
+$(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS-stack-boundary := $(cflags-stack-boundary)
 
 obj-y := stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 93df3178b71f..0d5509583427 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -75,15 +75,15 @@ obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(BASEDIR)/)$(KCONFIG_CONFIG)
-config.gz: $(CONF_FILE)
+$(obj)/config.gz: $(CONF_FILE)
 	gzip -n -c $< >$@
 
-config_data.o: config.gz
+$(obj)/config_data.o: $(obj)/config.gz
 
 quiet_cmd_binfile = BINFILE $@
-cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
+cmd_binfile = $(SHELL) $< $@ $(obj)/config.gz xen_config_data
 
-config_data.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/config_data.S: $(BASEDIR)/tools/binfile FORCE
 	$(call if_changed,binfile)
 targets += config_data.S
 
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index a92326c982e9..8a4522e4e141 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -7,10 +7,10 @@ OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
 
 CFLAGS-y += -Wno-pointer-sign
 
-libelf.o: libelf-temp.o FORCE
+$(obj)/libelf.o: $(obj)/libelf-temp.o FORCE
 	$(call if_changed,objcopy)
 
-libelf-temp.o: $(libelf-objs) FORCE
+$(obj)/libelf-temp.o: $(addprefix $(obj)/,$(libelf-objs)) FORCE
 	$(call if_changed,ld)
 
 extra-y += libelf-temp.o $(libelf-objs)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6bd207cf8ffa..6708af12e583 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,4 +1,4 @@
-include Makefile.libfdt
+include $(src)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
@@ -8,10 +8,10 @@ nocov-y += libfdt.o
 
 CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
 
-libfdt.o: libfdt-temp.o FORCE
+$(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 	$(call if_changed,objcopy)
 
-libfdt-temp.o: $(LIBFDT_OBJS) FORCE
+$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
 	$(call if_changed,ld)
 
 extra-y += libfdt-temp.o $(LIBFDT_OBJS)
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 9feb57545ef1..a969e76ddcad 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -39,57 +39,57 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
+public-$(CONFIG_X86) := $(wildcard $(src)/public/arch-x86/*.h $(src)/public/arch-x86/*/*.h)
+public-$(CONFIG_ARM) := $(wildcard $(src)/public/arch-arm/*.h $(src)/public/arch-arm/*/*.h)
 
 .PHONY: all
-all: $(headers-y)
+all: $(addprefix $(obj)/,$(headers-y))
 
-compat/%.h: compat/%.i $(BASEDIR)/tools/compat-build-header.py
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $@ >>$@.new; \
+$(obj)/compat/%.h: $(obj)/compat/%.i $(BASEDIR)/tools/compat-build-header.py
+	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
-compat/%.i: compat/%.c Makefile
+$(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-compat/%.c: public/%.h xlat.lst $(BASEDIR)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py xlat.lst <$< >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(src)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh $(src)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
 		$(SHELL) $(BASEDIR)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
 	done <$(patsubst compat/%,compat/.xlat/%,$(basename $<)).lst >$@.new
 	mv -f $@.new $@
 
-.PRECIOUS: compat/.xlat/%.lst
-compat/.xlat/%.lst: xlat.lst Makefile
+.PRECIOUS: $(obj)/compat/.xlat/%.lst
+$(obj)/compat/.xlat/%.lst: $(src)/xlat.lst $(src)/Makefile
 	mkdir -p $(@D)
 	grep -v '^[[:blank:]]*#' $< | sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,[[:blank:]]+$*\.h[[:blank:]]*$$,,p' >$@.new
 	$(call move-if-changed,$@.new,$@)
 
-xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' xlat.lst | uniq)
+xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(src)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
-compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y)) config/auto.conf Makefile
+$(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/auto.conf $(src)/Makefile
 	cat $(filter %.h,$^) >$@.new
 	mv -f $@.new $@
 
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
-all: headers.chk headers99.chk headers++.chk
+all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h) $(public-y))
+PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
 
-PUBLIC_C99_HEADERS := public/io/9pfs.h public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out public/%ctl.h public/xsm/% public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
+PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
 
 public/io/9pfs.h-prereq := string
 public/io/pvcalls.h-prereq := string
 
-headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
+$(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
 	          -S -o /dev/null $$i || exit 1; \
@@ -97,7 +97,7 @@ headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
 	done >$@.new
 	mv $@.new $@
 
-headers99.chk: $(PUBLIC_C99_HEADERS) Makefile
+$(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	rm -f $@.new
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
@@ -107,7 +107,7 @@ headers99.chk: $(PUBLIC_C99_HEADERS) Makefile
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
-headers++.chk: $(PUBLIC_HEADERS) Makefile
+$(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
 	rm -f $@.new
 	if ! $(CXX) -v >/dev/null 2>&1; then                                  \
 	    touch $@.new;                                                     \
@@ -116,7 +116,7 @@ headers++.chk: $(PUBLIC_HEADERS) Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
-	      -include stdint.h -include public/xen.h                         \
+	      -include stdint.h -include $(src)/public/xen.h                  \
 	      $(foreach j, $($(i)-prereq), -include c$(j)) -S -o /dev/null -  \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
@@ -126,7 +126,7 @@ endif
 ifeq ($(XEN_TARGET_ARCH),x86_64)
 .PHONY: lib-x86-all
 lib-x86-all:
-	$(MAKE) -C xen/lib/x86 all
+	$(MAKE) -C $(obj)/xen/lib/x86 all
 
 all: lib-x86-all
 endif
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index b6df9e861e6e..36b7e7e92f93 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -3,11 +3,14 @@
 # Cleaning up
 # ==========================================================================
 
+obj := .
+src := $(obj)
+
 clean::
 
 include $(BASEDIR)/scripts/Kbuild.include
 
-include Makefile
+include $(src)/Makefile
 
 # Figure out what we need to clean from the various variables
 # ==========================================================================
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 0ad15cb16606..3ea726d66f8b 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -4,48 +4,48 @@ obj-y += flask_op.o
 
 obj-y += ss/
 
-CFLAGS-y += -I./include
+CFLAGS-y += -I$(obj)/include
 
 AWK = awk
 
-FLASK_H_DEPEND = policy/security_classes policy/initial_sids
-AV_H_DEPEND = policy/access_vectors
+FLASK_H_DEPEND := $(addprefix $(src)/policy/,security_classes initial_sids)
+AV_H_DEPEND = $(src)/policy/access_vectors
 
-FLASK_H_FILES = include/flask.h include/class_to_string.h include/initial_sid_to_string.h
-AV_H_FILES = include/av_perm_to_string.h include/av_permissions.h
-ALL_H_FILES = $(FLASK_H_FILES) $(AV_H_FILES)
+FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
+AV_H_FILES := av_perm_to_string.h av_permissions.h
+ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
 
-$(obj-y) ss/built_in.o: $(ALL_H_FILES)
+$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
 extra-y += $(ALL_H_FILES)
 
-mkflask := policy/mkflask.sh
+mkflask := $(src)/policy/mkflask.sh
 quiet_cmd_mkflask = MKFLASK $@
-cmd_mkflask = $(SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
+cmd_mkflask = $(SHELL) $(mkflask) $(AWK) $(obj)/include $(FLASK_H_DEPEND)
 
-$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
+$(addprefix $(obj)/%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
 	$(call if_changed,mkflask)
 
-mkaccess := policy/mkaccess_vector.sh
+mkaccess := $(src)/policy/mkaccess_vector.sh
 quiet_cmd_mkaccess = MKACCESS VECTOR $@
-cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
+cmd_mkaccess = $(SHELL) $(mkaccess) $(AWK) $(obj)/include $(AV_H_DEPEND)
 
-$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
+$(addprefix $(obj)/%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
 	$(call if_changed,mkaccess)
 
 obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
-flask-policy.o: policy.bin
+$(obj)/flask-policy.o: $(obj)/policy.bin
 
 quiet_cmd_binfile = BINFILE $@
-cmd_binfile = $(SHELL) $< -i $@ policy.bin xsm_flask_init_policy
+cmd_binfile = $(SHELL) $< -i $@ $(obj)/policy.bin xsm_flask_init_policy
 
-flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
 	$(call if_changed,binfile)
 targets += flask-policy.S
 
 FLASK_BUILD_DIR := $(CURDIR)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
-policy.bin: FORCE
+$(obj)/policy.bin: FORCE
 	$(MAKE) -f $(XEN_ROOT)/tools/flask/policy/Makefile.common -C $(XEN_ROOT)/tools/flask/policy FLASK_BUILD_DIR=$(FLASK_BUILD_DIR)
 	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
 
diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
index 942ede4713f1..ad9772193bff 100755
--- a/xen/xsm/flask/policy/mkaccess_vector.sh
+++ b/xen/xsm/flask/policy/mkaccess_vector.sh
@@ -8,9 +8,12 @@ set -e
 awk=$1
 shift
 
+output_dir=$1
+shift
+
 # output files
-av_permissions="include/av_permissions.h"
-av_perm_to_string="include/av_perm_to_string.h"
+av_permissions="$output_dir/av_permissions.h"
+av_perm_to_string="$output_dir/av_perm_to_string.h"
 
 cat $* | $awk "
 BEGIN	{
-- 
Anthony PERARD


