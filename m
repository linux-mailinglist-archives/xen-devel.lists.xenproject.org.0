Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940445DB62
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231213.400004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzT-0000tJ-BK; Thu, 25 Nov 2021 13:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231213.400004; Thu, 25 Nov 2021 13:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzT-0000ow-2n; Thu, 25 Nov 2021 13:40:43 +0000
Received: by outflank-mailman (input) for mailman id 231213;
 Thu, 25 Nov 2021 13:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzR-00076i-3Y
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b671de-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:39 +0100 (CET)
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
X-Inumbo-ID: 46b671de-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BsQ0L1SVdAVADFxntaJZHkwKYzMkaTauH9gbpRVCxbw=;
  b=HnAiI2dB7SN8fdeJwM8EUydRkq+dq31WtsI/yWysD6/nTidwwgF2p4Uh
   sc3n8EVr5PvniXopzbPdH+ZCtHyr8mg7SjfrUBl6H6K9ya5y1/nw56kvw
   AXf04YHzxkb2TuvaBhPTeMdQsMnv4/IQq8wavnhYmV0ksMgOMUuDVwmVL
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CFpEuAkcoXFQf8bCm347qs/0XBQXY6ak0cV70fuKRK6vSNiKIf5bYoDIhqcQt72CfbctZI2wjj
 +K/15I7ynq9nzEJ1PHEiEK0r20EN40VAXiy97xO0s3Hs3NleMnwm2DqmO38RaqQvzpWeBvJoyD
 4/5u09DQGoaEo5Y685CGw6t50niZjxkWkjVNs/RyVqemQwfs8EuY/pBhacDIkmMQfkp88SpSW9
 BIHgRzXfJUq2Ru/pflccgMihAN5NkH1knQjE7qMBrBeEDKu4fE1QAwx2ADhkCLWGGE1sLTIHJg
 dQn/1NV2tLwk9DtBRB+UfWF3
X-SBRS: 5.1
X-MesageID: 58576644
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1enYOayhhmb8G/8EukV6t+ecwSrEfRIJ4+MujC+fZmUNrF6WrkVUy
 2AWCzyPPPuKYGOkKNokbY7joUIA6MfdzNM1QQU6+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+pDz
 +xQsLaNcCBqBbOLif09ejcBSRgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25ATQqiAO
 5ZxhTxHZR39UUJMKlssC8gdpP6yrCDTVQBztwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krd5HjwCBweMN2ZyBKG/2iqi+uJmjn0MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc+xYL
 0sY6y8/t58Y/UagTsT+dxCgqXvCtRkZM/JRDO8S+AyL0rDT4QuSGi4DVDEpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L3IGZCICZRsI5Z/kuo5bphDFQ8tnEaW1psboAjy2y
 DePxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3tbGWc8wZTWbeCJLe2rknCzd9uddygGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsIGexO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bMgAgBc2B2yMnT3
 Kt3lu72UB4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgDRMb9ovPPV+luEm
 zq6Cydt408BONASnwGNqdJDRbz0BSRT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwO/tokC
 kqVAxcCoHKm3CWvAVzTNhhLNeO+Nb4i/ClTFXF9Yj6VN40LPN/HAFE3LMBsI9HKNYVLkJZJc
 hXyU5naX6kUFG2Yo291gFuUhNUKSSlHTDmmZ0KNCAXTtbY7L+AQ0tO7LAbp6gcUCS+76Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX8zP7k49NWeqFZx7HU2bw9Pnwb
 OlZ1aikYvYGgExLo8x3FLMylfAy4N7mprl7yAV4HSqUMwT3W+04enTfhJtBrKxAwLNdqDCaY
 EPX94kII6iNNePkDEUVeFgvYNOc2KxGgTLV9/k0fhn3vXcl4LqdXExOFBCQkygBfqBtOYYoz
 Op96s4b7wuz1kgjPtqc130G8m2NKjoLUrk9t4FcC4ju01J5xlZHaJ3aKyn3/JDQNIkcbhh0e
 meZ1PjYmrBR5kveaH5iR3HC0N1UiYkKpB0XnkQJIE6Em4adi/I6tPGLHe/bkuiBIs177t9O
IronPort-HdrOrdr: A9a23:QCxjxKl5174YevG7Ho2C3/SVhYTpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576644"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v8 07/47] build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
Date: Thu, 25 Nov 2021 13:39:26 +0000
Message-ID: <20211125134006.1076646-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is to avoid arch/$arch/Makefile having to recurse into parents
directories.

This avoid duplication of the logic to build prelink.o between arches.

In order to do that, we cut the $(TARGET) target in the main Makefile in
two, there is a "prepare" phase/target runned before starting to build
"prelink.o" which will prepare "include/" among other things, then all
the $(ALL_OBJS) will be generated in order to build "prelink.o" and
finally $(TARGET) will be generated by calling into "arch/*/" to make
$(TARGET).

Now we don't need to prefix $(ALL_OBJS) with $(BASEDIR) as it is now
only used from the main Makefile. Other changes is to use "$<" instead
of spelling "prelink.o" in the target "$(TARGET)" in both
arch/*/Makefile.

Beside "prelink.o" been at a different location, no other functional
change intended.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - rebased
    - move Arm specific dependencies between $(ALL_OBJS) objects (head.o)
      into Arm specific "Rules.mk" instead of the common "build.mk".
    
    v7:
    - change, now things are in build.mk: no more prepare phase needed

 xen/Makefile          | 15 ++++++++++++++-
 xen/Rules.mk          | 13 -------------
 xen/arch/arm/Makefile | 31 ++++---------------------------
 xen/arch/arm/Rules.mk |  5 +++++
 xen/arch/arm/arch.mk  |  2 ++
 xen/arch/x86/Makefile | 29 ++++++-----------------------
 xen/arch/x86/arch.mk  |  2 ++
 xen/build.mk          | 18 ++++++++++++++++++
 8 files changed, 51 insertions(+), 64 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index ed61f38dd335..7bb3595d649f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -285,8 +285,21 @@ CFLAGS += -flto
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
@@ -407,7 +420,7 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
+	$(MAKE) -f $(BASEDIR)/Rules.mk $@
 
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 7b8b9047cfd5..77d359bedaf8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -8,25 +8,12 @@
 include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
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
index d0dee10102b6..14952275772b 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -75,14 +75,6 @@ ifneq ($(CONFIG_DTB_FILE),"")
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
@@ -98,33 +90,18 @@ ifeq ($(CONFIG_ARM_64),y)
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
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index e69de29bb2d1..290609487605 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -0,0 +1,5 @@
+# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
+# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
+# build head.o
+arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
+arch/arm/$(TARGET_SUBARCH)/head.o: ;
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
index d7d2adc1881e..b469ec8f2452 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,37 +123,20 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
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
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -206,7 +189,7 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 extra-y += efi.lds
-$(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
+$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
@@ -235,7 +218,7 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
-efi/buildid.o efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
+# These should already have been rebuilt when building the prerequisite of "prelink.o"
 efi/buildid.o efi/relocs-dummy.o: ;
 
 .PHONY: include
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 19c9cd206ed0..c830dc5b3a7c 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -104,3 +104,5 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
+
+ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/build.mk b/xen/build.mk
index 622e841c1cc0..740945333a97 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -58,3 +58,21 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
 	  echo ""; \
 	  echo "#endif") <$< >$@
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


