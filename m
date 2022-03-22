Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D174E3D78
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293377.498400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbE-0002PT-GI; Tue, 22 Mar 2022 11:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293377.498400; Tue, 22 Mar 2022 11:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbE-0002NQ-AI; Tue, 22 Mar 2022 11:22:52 +0000
Received: by outflank-mailman (input) for mailman id 293377;
 Tue, 22 Mar 2022 11:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbC-0001pm-RB
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a30a1c-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:22:49 +0100 (CET)
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
X-Inumbo-ID: 67a30a1c-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=me6cYbyjxTaz58GzY4A+RYvN1kF6kozo10n0R4eb5yI=;
  b=JOp0xW9GIavx2jrWE6OKq7JOqjegrN0DztPHigeFk+876ungG0LDdT2e
   FQgqzvY+qb0P6Sg3k1BELgnzHGJxC6ITRWm5MVKWlNb8KSDV2yNSwZh02
   wdv41jueiS1H79esM3V4mDaZMz/A/ASVbvY3pUWUuyw7zHNGS/Q45/Wv3
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66847200
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZNz+v6tfiBodvmGImFpRualVUufnVKVeMUV32f8akzHdYApBsoF/q
 tZmKWCAaauNNjOgfYskaoq39EoEuJPVyIdhSgto/iw0HilD+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX4
 4uoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8RGKP9xeYBayUAUAhiF59Ppb2aC2mW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQxPEifOUUXUrsRIL8s3+v5j0fbTx4b9m6Z/Idr5VbezQMkhdABN/KKI4fXFK25hH2wr
 G/c437wBB1cMdWF0CeE6VqlnOqJliT+MKoNEJWo+/gsh0ecrkQQDxsMXFf9vvi9iWa5QdtUL
 0FS8S0rxYAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L84QyUG2wFRT5pc8E9uYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiirjU6hrgVpd4G0eO851+vvt63jsGXFEhvvFyRBz/7qFMiDGK4W2C2wWD948cdLpqhcgHCl
 WQuqcHD7r0kHLjYwURhX94xNL2u4v+ENhjVjlhuA4Qt+lyRxpKzQWxDyGogfRk0a67obResO
 RaO4l0JuPe/KVPwNcdKj5SN59PGJEQKPfDsTbjqY9VHefCdnyfXrXg1NSZ8M40A+XXAcJ3T2
 7/GKK5A7l5AUMyLKQZaoc9HitfHIQhkmQvuqWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUkAAL2hP3aGq9BORbzvEZTdLcqqwyCwXrTeSjeK5Ul7U6OBqV/fU9INc1tpehfgo
 SjmBx4wJKvXjnzbMwSaAk2Pm5u0NauTWUkTZHR2VX7xgiBLSd/2sM83KstmFZF6pbcL5aMlE
 JE4lzCoX60npsLvoG9GM/EQbeVKKXyWuO55F3H8MWZlIMI4GVChFx2NVlKHyRTixxGf7aMWy
 4BMHCuAKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:R9tuA6BV382/h9DlHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="66847200"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree)
Date: Tue, 22 Mar 2022 11:22:33 +0000
Message-ID: <20220322112238.1117737-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We need to differentiate between source files and generated/built
files. We will be replacing $(BASEDIR) by $(objtree) for files that
are generated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - acked
    
    v8:
    - rebased

 xen/Rules.mk                |  2 +-
 xen/arch/arm/Makefile       | 10 +++++-----
 xen/arch/x86/Makefile       | 28 ++++++++++++++--------------
 xen/common/Makefile         |  2 +-
 xen/test/livepatch/Makefile | 12 ++++++------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index abeba1ab7494..7712bfa063e0 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -12,7 +12,7 @@ src := $(obj)
 PHONY := __build
 __build:
 
--include $(BASEDIR)/include/config/auto.conf
+-include $(objtree)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 51ec2ba928e3..1d862351d111 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -90,21 +90,21 @@ ifeq ($(CONFIG_ARM_64),y)
 	ln -sf $(@F) $@.efi
 endif
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
-	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
+	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]*
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b6b082ee1d14..7cea79ed2f8a 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -92,8 +92,8 @@ ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
 
-efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
-                      -O $(BASEDIR)/include/xen/compile.h ]; then \
+efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
+                      -O $(objtree)/include/xen/compile.h ]; then \
                          echo '$(TARGET).efi'; fi) \
          $(space)
 efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
@@ -133,23 +133,23 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
-$(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
+$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
+	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
@@ -202,28 +202,28 @@ note_file_option ?= $(note_file)
 
 extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-$(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
+$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
-	                $(BASEDIR)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
+	                $(objtree)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
@@ -238,11 +238,11 @@ endif
 $(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 
 .PHONY: include
-include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
+include: $(objtree)/arch/x86/include/asm/asm-macros.h
 
 $(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
+$(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
diff --git a/xen/common/Makefile b/xen/common/Makefile
index dc8d3a13f5b8..30641a737231 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -74,7 +74,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
 obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
 
-CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(BASEDIR)/)$(KCONFIG_CONFIG)
+CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
 	gzip -n -c $< >$@
 
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index e6fee84b69da..ddb07371315e 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -22,9 +22,9 @@ $(obj)/xen_hello_world.o: $(obj)/config.h
 $(obj)/config.h: $(obj)/xen_hello_world_func.o
 	(set -e; \
 	 echo "#define NEW_CODE_SZ $(call CODE_SZ,$<,xen_hello_world)"; \
-	 echo "#define MINOR_VERSION_SZ $(call CODE_SZ,$(BASEDIR)/xen-syms,xen_minor_version)"; \
-	 echo "#define MINOR_VERSION_ADDR $(call CODE_ADDR,$(BASEDIR)/xen-syms,xen_minor_version)"; \
-	 echo "#define OLD_CODE_SZ $(call CODE_SZ,$(BASEDIR)/xen-syms,xen_extra_version)") > $@
+	 echo "#define MINOR_VERSION_SZ $(call CODE_SZ,$(objtree)/xen-syms,xen_minor_version)"; \
+	 echo "#define MINOR_VERSION_ADDR $(call CODE_ADDR,$(objtree)/xen-syms,xen_minor_version)"; \
+	 echo "#define OLD_CODE_SZ $(call CODE_SZ,$(objtree)/xen-syms,xen_extra_version)") > $@
 
 $(obj)/modinfo.o:
 	(set -e; \
@@ -42,7 +42,7 @@ $(obj)/modinfo.o:
 # not be built (it is for EFI builds), and that we do not have
 # the note.o.bin to muck with (as it gets deleted)
 #
-$(obj)/note.o: $(BASEDIR)/xen-syms
+$(obj)/note.o: $(objtree)/xen-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.livepatch.depends,alloc,load,readonly,data,contents -S $@.bin $@
@@ -52,7 +52,7 @@ $(obj)/note.o: $(BASEDIR)/xen-syms
 # Append .livepatch.xen_depends section
 # with Xen build-id derived from xen-syms.
 #
-$(obj)/xen_note.o: $(BASEDIR)/xen-syms
+$(obj)/xen_note.o: $(objtree)/xen-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
 	$(OBJCOPY) $(OBJCOPY_MAGIC) \
 		   --rename-section=.data=.livepatch.xen_depends,alloc,load,readonly,data,contents -S $@.bin $@
@@ -125,7 +125,7 @@ xen_action_hooks_norevert-objs := xen_action_hooks_marker.o xen_hello_world_func
 
 EXPECT_BYTES_COUNT := 8
 CODE_GET_EXPECT=$(shell $(OBJDUMP) -d --insn-width=1 $(1) | sed -n -e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | awk '{$$0=$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' | sed 's/^/{/;s/,$$/}/g')
-$(obj)/expect_config.h: $(BASEDIR)/xen-syms
+$(obj)/expect_config.h: $(objtree)/xen-syms
 	(set -e; \
 	 echo "#define EXPECT_BYTES $(call CODE_GET_EXPECT,$<,xen_extra_version)"; \
          echo "#define EXPECT_BYTES_COUNT $(EXPECT_BYTES_COUNT)") > $@
-- 
Anthony PERARD


