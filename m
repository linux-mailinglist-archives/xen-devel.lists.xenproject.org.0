Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5862649B27C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260065.449121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZj-0007bw-Tn; Tue, 25 Jan 2022 11:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260065.449121; Tue, 25 Jan 2022 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZj-0007Zf-Nx; Tue, 25 Jan 2022 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 260065;
 Tue, 25 Jan 2022 11:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZh-0006t5-RC
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f3f0f74-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:19 +0100 (CET)
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
X-Inumbo-ID: 1f3f0f74-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M8det7BVyAZ9jG+uoy51sxW5kTIksATQWQPhjBlsZwM=;
  b=F5Ce8KIPfQ4xBOpnI50ZwfHw8+PLT4pLT0H5dnmkSEi7SFQLIaZWl2HZ
   qRcaRIlhaTYIfV5eAVQAgGrQsJABZP7oqwSEhniXsimQvxzkLtlzSVY2L
   3n7gX87RH5LzO6jlHbbmIoVLSzC5NG5A40YSJntGkKMjFNBr0RPLFz0KT
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tdR4hJ1Z+P7anKi2iACXwIkYpwxKgrUaEr1Ej05ej/z5/zT7nfPiFCHxEJwco6Nfv/x2Xk+GGk
 EypvSQw95ZCrCl81ZaDxGfaRqaRNQ32Elr1RDrlb9CWNY/JkepizXS4d7ZbPZ6VwNl/jcVcZ7S
 6GIRmGDfAxx5hdBrtV5yf7qy3cbTtNme1d+oeU6YBr04Q2j58qnGPJ4F9mdYNcilP6qMJgqpyt
 +JkwiVuVa2c67nKkmfkEcDYYR9AS5S04CuhzAh950sBXAlqtEOUAVmtHd9tWfiXDJp9gsnZeY9
 txwIXROd2m/RhopNKRGweP33
X-SBRS: 5.2
X-MesageID: 64860812
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Hspnmqsly/lHO0hFz6Zj1CT6c+fnVPxZMUV32f8akzHdYApBsoF/q
 tZmKWrVa/iLa2L1eYglOYvnoENQ7JTXmtBjHgpp+3syFntE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYx24XhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrrCRS1gXLvP1vsMQeAsCKBt7LZ9s9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6AO
 5pHMWo2NnwsZTUQF3oeBb85uN3y3GLObgJ2qUikh/Qotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKi8dMNuT2D+U6EWGj+XEnT74cI8KHbj+/flv6HWZy3YPEhQQWR2+qOOgl0+lc9tFL
 gof/S9GhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsreYVHac/be8ti6pNG4eKmpqTS0ZSQoI5fHzrYd1iQjAJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2g0XHF3Ay8+KHvaQMe9F/sZGe13Cl2MdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFpib7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgHfq2MBjatSsIoHONiwM2ITRTMt4wKuBN0+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jeHGOC/KFulUYQPmggUFAEWs+lm9H
 zF3bJPi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9cNokihrc+Rp
 ivVchYBkDLX3CSbQS3XNCwLQO6xDP5X8CJqVQRxbA3A8yVyPu6SAFI3KsFfkU8PrrIzlJaZj
 pAtJq29Pxi4Ym2XomtGNcik8tUKmdbCrVvmAhdJqQMXJ/ZILzElMPe/Fuc23CVRXCexq+Ukp
 LisilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLpFeMwjHyxuby
 x2SXUUSq97SrtJn69LOn62F8dukSrMsAkpAEmDHxr+qLi2GrHG7yIpNXb/QLzDQXW/54ou4Y
 uBRw62uOfELhg8S4YF9D6xq3eQ14N62/+1WyQFtHXPqaVW3C+w/finajJcX7qAUn+1Xowq7X
 E6L6+J2A7TRNZO3CkMVKSokcv+HiaMelA7N4KlnO079/iJ2ouaKCB0AIxmWhSVBB7JpK4d5k
 /w5scsb5gHj2BonNtGK0nJd+2iWdyFSVqwmstcRAZPxixptwVZHOMSOBijz6ZCJStNNLkh1f
 WPE2Puc3+xRlhjYbn4+NXnRxu4M150BtSdDwEIGO1nUyMHOgeU63UEJ/Dk6JuiPIs6rDw6n1
 rBXCnBI
IronPort-HdrOrdr: A9a23:4FU4567HOa5OzTrEAAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860812"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v9 04/30] build: set ALL_OBJS in main Makefile; move prelink.o to main Makefile
Date: Tue, 25 Jan 2022 11:00:37 +0000
Message-ID: <20220125110103.3527686-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
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
    v9:
    - set ALL_OBJS and ALL_LIBS on make command line instead of exporting
      them.
    - arm/Rules.mk, have one rule instead of two for head.o
    - fix typo in title
    
    v8:
    - rebased
    - move Arm specific dependencies between $(ALL_OBJS) objects (head.o)
      into Arm specific "Rules.mk" instead of the common "build.mk".
    
    v7:
    - change, now things are in build.mk: no more prepare phase needed

 xen/Makefile          | 12 +++++++++++-
 xen/Rules.mk          | 13 -------------
 xen/arch/arm/Makefile | 31 ++++---------------------------
 xen/arch/arm/Rules.mk |  4 ++++
 xen/arch/arm/arch.mk  |  2 ++
 xen/arch/x86/Makefile | 29 ++++++-----------------------
 xen/arch/x86/arch.mk  |  2 ++
 xen/build.mk          | 18 ++++++++++++++++++
 8 files changed, 47 insertions(+), 64 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index fb37043d08e0..d953dc50ac6a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -285,6 +285,16 @@ CFLAGS += -flto
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
 
 # define new variables to avoid the ones defined in Config.mk
@@ -407,7 +417,7 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) MKRELOC=$(MKRELOC) $@
+	$(MAKE) -f $(BASEDIR)/Rules.mk MKRELOC=$(MKRELOC) "ALL_OBJS=$(ALL_OBJS-y)" "ALL_LIBS=$(ALL_LIBS-y)" $@
 
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
index e69de29bb2d1..c6463a433efd 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -0,0 +1,4 @@
+# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
+# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
+# build head.o
+arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o ;
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
index 9fc884813cb5..a830b5791e8b 100644
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
index fa7cf3844362..bfd5eaa35f25 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -104,3 +104,5 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
+
+ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/build.mk b/xen/build.mk
index 3d7a91df22d1..af1b28311393 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -59,3 +59,21 @@ arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
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


