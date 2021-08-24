Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386073F5CB2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171032.312300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC0-0004ve-3j; Tue, 24 Aug 2021 11:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171032.312300; Tue, 24 Aug 2021 11:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBy-0004at-Mn; Tue, 24 Aug 2021 11:02:06 +0000
Received: by outflank-mailman (input) for mailman id 171032;
 Tue, 24 Aug 2021 11:02:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2q-0001EC-BW
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a383b904-a75f-42e2-b22a-f5d75428bf56;
 Tue, 24 Aug 2021 10:51:29 +0000 (UTC)
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
X-Inumbo-ID: a383b904-a75f-42e2-b22a-f5d75428bf56
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ui+BY0F0TRtPJ3eDZ5+KxMNHd28XswPS9MmRVT66jrE=;
  b=LOODNyByltSuy4o1SAC2+OXZ11+tNhMOPKh6bG0DaYntlkFY83PaVe9H
   mej4+cCVM0eZ+0bIhFj+YIcvNPLJGOvTO7+IlF9A579d3r2K7eKwoSi8/
   WWPCtIjLHK7DBsNi8i6Pvajfi9eL2IYye8AHdeTqXCkuwmM7ddMbFCIH8
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Z9UG7eg6GsKnDrcWXWdKaaOqYma/EzdXgtDFjV7xBXYDGIQCcQpUG4hHl/qHGEJ4azM9ZGsjC1
 1fMCjRpKt0UDhQrWjyLa05p192wmTZud/SSNfby9tPDWgQq3UcZ2n3x0coNYdYkk9fzb1g98Xo
 hrsDc4t2TAuWyFKTrjzqhgod4vzOW9gGgO27G4wil19k9SGVMKfI6JVc7DyX2WHqD0Wx4AjzV/
 bZ0eNQ9533X6clG8VC5Jo/ZlUkaiLh8EzA02ab3NCEKVGYTw7ErDcOcNQ2E8AmqSq91kieoJ5w
 fEtbYxQA5TRp3tsdtScu4Xlt
X-SBRS: 5.1
X-MesageID: 51540914
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yGeysawQjWlVbuwI6/S/KrPxkOskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBHpTiBUJPhfZquz+8N3WBxB8boYOCIghrNEGgP1+XfKl7bamfDH4xmpM
 BdmsFFYbWdYmSS5vyKgzVQZuxQpeVvh5rY59s2oU0NcShaL4VbqytpAAeSFUN7ACNcA4AiKZ
 aa7s1b4xK9ZHU+dK2AdzU4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUglI3awp/Q
 H+4kPED+SYwr+GIy3npi/uBqdt6ZjcIxx4dY6xY/0uW3TRY8CTFcFcsvO5zXQISaqUmS4XeZ
 H30mwd1oJImj7slyiO0GHQ8hil3zA053D4z1iExXPlvMziXTo/T9FMnIRDb3LimjwdVfxHod
 Z2Nliixu1q5NL77VXAzsmNUwsvmlu/oHIkn+JWh3tDUZEGYLsUqYAE5ktaHJoJASq/sekcYa
 FTJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8xUoFw84UmGsG6fsGOtB5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIWh7IOHL6GyWTKEjGAQO+l3fT2sRK2AiHQu118HICou
 WzbLoDjx9OR6vHM7zw4LRbtgvKXHiwGS/wz8023ekIhoHB
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540914"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v7 21/51] build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
Date: Tue, 24 Aug 2021 11:50:08 +0100
Message-ID: <20210824105038.1257926-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is to avoid arch/$arch/Makefile having to recurse into parents
directories.

This avoid duplication of the logic to build prelink.o between arches.

In order to do that, we cut the $(TARGET) target in the main Makefile in
two, there is a "prepare" phase/target runned before starting to build
"prelink.o" which will prepare "include/" among other things, the all
the $(ALL_OBJS) will be generated in order to build "prelink.o" and
finally $(TARGET) will be generated by calling into "arch/*/" to make
$(TARGET).

Now we don't need to prefix $(ALL_OBJS) with $(BASEDIR) as it is now
only used from the main Makefile. Other changes is using "$<" instead
of spelling "prelink.o" in the target "$(TARGET)" in both
arch/*/Makefile.

Beside "prelink.o" been at a different location, no other functional
change intended.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - change, now things are in build.mk: no more prepare phase needed

 xen/Makefile          | 15 ++++++++++++++-
 xen/Rules.mk          | 14 --------------
 xen/arch/arm/Makefile | 31 ++++---------------------------
 xen/arch/arm/arch.mk  |  2 ++
 xen/arch/x86/Makefile | 29 ++++++-----------------------
 xen/arch/x86/arch.mk  |  2 ++
 xen/build.mk          | 24 ++++++++++++++++++++++++
 7 files changed, 52 insertions(+), 65 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 7f100845cdd0..1dad20a95be6 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -271,8 +271,21 @@ CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
+# Note that link order matters!
+ALL_OBJS-y                := common/built_in.o
+ALL_OBJS-y                += drivers/built_in.o
+ALL_OBJS-y                += lib/built_in.o
+ALL_OBJS-y                += xsm/built_in.o
+ALL_OBJS-y                += arch/$(TARGET_ARCH)/built_in.o
+ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
+
+ALL_LIBS-y                := lib/lib.a
+
 include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
 
+export ALL_OBJS := $(ALL_OBJS-y)
+export ALL_LIBS := $(ALL_LIBS-y)
+
 # define new variables to avoid the ones defined in Config.mk
 export XEN_CFLAGS := $(CFLAGS)
 export XEN_AFLAGS := $(AFLAGS)
@@ -393,7 +406,7 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
+	$(MAKE) -f $(BASEDIR)/Rules.mk $@
 
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
diff --git a/xen/Rules.mk b/xen/Rules.mk
index a49ca4ceca39..2db13a8f9c54 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -8,26 +8,12 @@
 include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
-
-# Note that link order matters!
-ALL_OBJS-y               += $(BASEDIR)/common/built_in.o
-ALL_OBJS-y               += $(BASEDIR)/drivers/built_in.o
-ALL_OBJS-y               += $(BASEDIR)/lib/built_in.o
-ALL_OBJS-y               += $(BASEDIR)/xsm/built_in.o
-ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
-ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
-
-ALL_LIBS-y               := $(BASEDIR)/lib/lib.a
-
 # Initialise some variables
 lib-y :=
 targets :=
 CFLAGS-y :=
 AFLAGS-y :=
 
-ALL_OBJS := $(ALL_OBJS-y)
-ALL_LIBS := $(ALL_LIBS-y)
-
 SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             $(foreach w,1 2 4, \
                                                         rodata.str$(w).$(a)) \
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index dc1d09c8b429..067c0d9844e4 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -73,14 +73,6 @@ ifneq ($(CONFIG_DTB_FILE),"")
 obj-y += dtb.o
 endif
 
-ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
-
-# head.o is built by descending into the sub-directory, depends on the part of
-# $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and build
-# head.o
-$(TARGET_SUBARCH)/head.o: $(BASEDIR)/arch/arm/built_in.o
-$(TARGET_SUBARCH)/head.o: ;
-
 ifdef CONFIG_LIVEPATCH
 all_symbols = --all-symbols
 ifdef CONFIG_FAST_SYMBOL_LOOKUP
@@ -96,33 +88,18 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
-ifeq ($(CONFIG_LTO),y)
-# Gather all LTO objects together
-prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
-	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
-
-# Link it with all the binary objects
-prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
-	$(call if_changed,ld)
-else
-prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
-	$(call if_changed,ld)
-endif
-
-targets += prelink.o
-
-$(TARGET)-syms: prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
+$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index c3ac443b3788..ba3f140e2ea7 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -26,3 +26,5 @@ ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
         LDFLAGS += --fix-cortex-a53-843419
     endif
 endif
+
+ALL_OBJS-y := arch/arm/$(TARGET_SUBARCH)/head.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 29aa67ea371e..823f8fed4144 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -126,37 +126,20 @@ ifneq ($(efi-y),)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 endif # $(efi-y)
 
-ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
-
-ifeq ($(CONFIG_LTO),y)
-# Gather all LTO objects together
-prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
-	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
-
-# Link it with all the binary objects
-prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
-	$(call if_changed,ld)
-else
-prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
-	$(call if_changed,ld)
-endif
-
-targets += prelink.o
-
-$(TARGET)-syms: prelink.o xen.lds
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+$(TARGET)-syms: $(BASEDIR)/prelink.o xen.lds
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -209,7 +192,7 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 extra-y += efi.lds
-$(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
@@ -238,7 +221,7 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
-efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
+# These should already have been rebuilt when building the prerequisite of "prelink.o"
 efi/buildid.o efi/relocs-dummy.o: ;
 
 .PHONY: include
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 98dd41d32118..61e0222f4a08 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -104,3 +104,5 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
+
+ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/build.mk b/xen/build.mk
index 369e1fe5c698..9093d9f493bc 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -56,3 +56,27 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
 	  echo ""; \
 	  echo "#endif") <$< >$@
+
+# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
+# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
+# build head.o
+arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
+arch/arm/$(TARGET_SUBARCH)/head.o: ;
+
+ifeq ($(CONFIG_LTO),y)
+# Gather all LTO objects together
+prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
+	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
+
+# Link it with all the binary objects
+prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
+	$(call if_changed,ld)
+else
+prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
+	$(call if_changed,ld)
+endif
+
+targets += prelink.o
+
+$(TARGET): prelink.o FORCE
+	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
-- 
Anthony PERARD


