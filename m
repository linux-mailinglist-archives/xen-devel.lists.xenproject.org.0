Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69243F5CA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170977.312142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBR-0005Yv-Pn; Tue, 24 Aug 2021 11:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170977.312142; Tue, 24 Aug 2021 11:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBR-0005Lm-93; Tue, 24 Aug 2021 11:01:33 +0000
Received: by outflank-mailman (input) for mailman id 170977;
 Tue, 24 Aug 2021 11:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3y-0003Ux-Dz
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58312edd-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:16 +0000 (UTC)
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
X-Inumbo-ID: 58312edd-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JD+7VO3K52HwJz8EfkgwAVmchIJrhqCdmlKnQtk1bE0=;
  b=EII+9uvLpfXGVicNq9z0JoHN5jV2UbmDKoS25kz5i5YFxWuneOaEIWff
   jm7f0icPRg+q+fQst03VM6cXYYRYf/AZ283B8kdf5EQ+/SraUQkuEakSl
   c+oqogak6HEifq8ecwzQrQpVSOqBrdlN3/zmhnskT5kYl9AJIKEGG0K/h
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7t/CwgoykC3EH/Ms9CYPanVVarqk2ub3S2sjL78gsjcXbCZTQnBvoJADlt7wG2u/yoZsxm2Dgs
 a/TWTiTPaWQXWe1K0C/5b1P9syRlSuSoVzxQP+MzkNvAg7gRUb2OobBrrgjpie6OUbY9SDH6QI
 hVqxwz6Z+1P0Xu2nJSRB7W4Ki84FS42LQPOp8eZNKyNz/ZZPidOruYETSDDiyuIhRqwjwsdbMq
 9l6AAhMWsm9qHN7B4/kAArQXlELjEyb4R5kkogwiTnvylk272FOE22hsNfwGRl2iXQxejg1+7s
 pqTxR4SpagLwQN08/p8i97oY
X-SBRS: 5.1
X-MesageID: 51540947
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NXnpRKOKZDr4oMBcT33155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE7gr4WBkb+exoS5PwOE80lKQFqrX5Uo3SODUO1FHHEGgA1/qp/9SDIVyYygc178
 4JH8dD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5Nv2/jNId0VHeqtg5wB2BkKwCUttXjRLApI/Cd
 61+tdHjyDIQwVaUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmj2AsEWT8n+8ZszY
 GFqX222kyQiYD69vbu7R6R032Qoqqi9jJ3Pr3MtiHSEESotu/nXvUkZ1TIhkFMnAjm0idQrD
 CLmWZsAy070QKqQkil5RTqwAXuyzAo9jvrzkKZm2LqpYjjSCs9ENcpv/MuTvL10TtVgDhH6t
 M944tZjesnMTrQ2CDmo9TYXRBjkUS55XIkjO4IlnRaFY8TcqVYo4AT9F5cVM5oJlOz1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGclzJWgHd6xU0Fw9F3pAZIyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBdC6D2TcKCi8RV564W6XZp3vHki91aIfzI9FmN1CSaZ4v6fawq
 6xLW+wnVRCBH7GGImU2oFX/lTXXGCwNA6duv1j2w==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540947"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 43/51] build: replace $(BASEDIR) by $(objtree)
Date: Tue, 24 Aug 2021 11:50:30 +0100
Message-ID: <20210824105038.1257926-44-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We need to differentiate between source files and generated/built
files. We will be replacing $(BASEDIR) by $(objtree) for files that
are generated, and $(abs_objtree) in cases where an absolute path is
necessary.

The "clean" target is still changing to the subdir been cleaned, to
remove file in the root we need to use $(abs_objtree).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile                |  5 +++++
 xen/Rules.mk                |  2 +-
 xen/arch/arm/Makefile       | 12 ++++++------
 xen/arch/x86/Makefile       | 34 +++++++++++++++++-----------------
 xen/common/Makefile         |  2 +-
 xen/test/livepatch/Makefile | 12 ++++++------
 xen/xsm/flask/Makefile      |  2 +-
 7 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 4c1dd9ce2ea1..36a64118007b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -135,6 +135,11 @@ endif
 
 export quiet Q KBUILD_VERBOSE
 
+abs_objtree := $(CURDIR)
+abs_srctree := $(CURDIR)
+
+export abs_srctree abs_objtree
+
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
 
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 6877fcc2d6d8..fae6b8918019 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -8,7 +8,7 @@ src := $(obj)
 PHONY := __build
 __build:
 
--include $(BASEDIR)/include/config/auto.conf
+-include $(objtree)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e6eff291c5e5..774648d6296e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -88,21 +88,21 @@ ifeq ($(CONFIG_ARM_64),y)
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
 
@@ -117,4 +117,4 @@ $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 .PHONY: clean
 clean::
 	rm -f $(obj)/xen.lds
-	rm -f $(BASEDIR)/.xen-syms.[0-9]*
+	rm -f $(abs_objtree)/.xen-syms.[0-9]*
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 4ea8ade7202c..85c44c69ff5a 100644
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
@@ -133,23 +133,23 @@ ifneq ($(efi-y),)
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 endif # $(efi-y)
 
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
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
@@ -199,28 +199,28 @@ note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
 extra-y += efi.lds
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
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 else
 $(TARGET).efi: FORCE
@@ -232,11 +232,11 @@ endif
 $(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 
 .PHONY: include
-include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
+include: $(objtree)/arch/x86/include/asm/asm-macros.h
 
 $(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
-$(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
+$(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	$(call filechk,asm-macros.h)
 
 define filechk_asm-macros.h
@@ -260,7 +260,7 @@ $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
 .PHONY: clean
 clean::
 	rm -f *.lds
-	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
-	rm -f $(BASEDIR)/.xen-syms.[0-9]* $(BASEDIR)/.xen.elf32
-	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi
+	rm -f asm-macros.i $(abs_objtree)/arch/x86/include/asm/asm-macros.*
+	rm -f $(abs_objtree)/.xen-syms.[0-9]* $(abs_objtree)/.xen.elf32
+	rm -f $(abs_objtree)/.xen.efi.[0-9]* efi/*.efi
 	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ca839118e4d1..8771c2775efb 100644
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
index dee5fd78c188..008e89fc9a47 100644
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
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 8d18c7d4ae6f..bff36aa97918 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -40,7 +40,7 @@ $(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
 targets += flask-policy.S
 
-FLASK_BUILD_DIR := $(BASEDIR)/$(obj)
+FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
 $(obj)/policy.bin: FORCE
-- 
Anthony PERARD


