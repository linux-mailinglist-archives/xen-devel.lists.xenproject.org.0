Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C621B2BFD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVg-0005Qi-0z; Tue, 21 Apr 2020 16:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVd-0005Px-Rj
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:29 +0000
X-Inumbo-ID: e4cea4b6-83ea-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4cea4b6-83ea-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TqRiWlksd5/Lp1nWEjOyVynJCuKHF40ozmWf1/OBleM=;
 b=MaMWGnTtOjL7tYetqEPrtS0XCUp/Nsviz6KDqNd/jI3ACBpTtA7OHgmO
 T0XEoM/7eohprDuNQ3tU2RV3pOAxhKRbJrn/DLwCkZ88vWHWAdiqRFMHq
 bHJenSNCUR0tTBWX2AZ7IZ44XwbqnvbAimarIp9MLShDTt3Ay9RhBiMNi o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dTnp1eCa59ZbhtFeom1ZCXVAsTAGLPk2LMvx41CkLgFvN/TlmNWjj7ERbOofQX3r8BraIxQU+J
 ZxM7tbgTQXc2E+fXTXBa8Z0z2XewVYCyO347aLG3/emFWTJAYUN1ylHe8nZ32nFh21b8VChSsD
 zNWU0C2ughrF5vmHfA0fECySG3WcjI1kXytYRKKYEzngbkwr7h+fkg1y7+OoHSkZeqKYTS4tMN
 aW4uPz6IapUHuOn6A+7ZCQdXYashvynVtJ+CRHO43YhWNlBX6XddA7sZg36qZiwh3yA4gfgeS8
 ios=
X-SBRS: 2.7
X-MesageID: 16414403
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16414403"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 03/16] xen/build: use new $(c_flags) and $(a_flags)
 instead of $(CFLAGS)
Date: Tue, 21 Apr 2020 17:11:55 +0100
Message-ID: <20200421161208.2429539-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In a later patch ("xen/build: have the root Makefile generates the
CFLAGS), we want to generate the CFLAGS in xen/Makefile, then export
it and have Rules.mk use a CFLAGS from the environment variables. That
changes the flavor of the CFLAGS and flags intended for one target
(like -D__OBJECT_FILE__ and -M%) gets propagated and duplicated. So we
start by moving such flags out of $(CFLAGS) and into $(c_flags) which
is to be modified by only Rules.mk.

__OBJECT_FILE__ is only used by arch/x86/mm/*.c files, so having it in
$(c_flags) is enough, we don't need it in $(a_flags).

For include/Makefile and as-insn we can keep using CFLAGS, but since
it doesn't have -M* flags anymore there is no need to filter them out.

The XEN_BUILD_EFI tests in arch/x86/Makefile was filtering out
CFLAGS-y, but according to dd40177c1bc8 ("x86-64/EFI: add CFLAGS to
check compile"), it was done to filter out -MF. CFLAGS doesn't
have those flags anymore, so no filtering is needed.

This is inspired by the way Kbuild generates CFLAGS for each targets.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v4:
    - drop change in as-insn macro, and keep filtering-out -M% %.d
    
    v3:
    - include/Makefile: Keep using CFLAGS, but since it doesn't have -M*
      flags anymore, no need to filter it.
    - Write c_flags and a_flags on a single line.
    - arch/x86/Makefile: remove the filter-out of dependency flags
      they are remove from CFLAGS anyway.
      (was intended to be done in xen/build: have the root Makefile
      generates the CFLAGS originally, move the change to this patch).
    - also modify as-insn as it is now xen/ only.

 xen/Rules.mk                    | 23 +++++++++++------------
 xen/arch/arm/Makefile           |  4 ++--
 xen/arch/x86/Makefile           |  6 +++---
 xen/arch/x86/mm/Makefile        |  6 +++---
 xen/arch/x86/mm/hap/Makefile    |  6 +++---
 xen/arch/x86/mm/shadow/Makefile |  6 +++---
 xen/include/Makefile            |  2 +-
 7 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 9079df7978a7..3408a35dbf53 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -57,7 +57,6 @@ CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
 CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
-CFLAGS += '-D__OBJECT_FILE__="$@"'
 
 ifneq ($(CONFIG_CC_IS_CLANG),y)
 # Clang doesn't understand this command line argument, and doesn't appear to
@@ -70,9 +69,6 @@ AFLAGS += -D__ASSEMBLY__
 
 ALL_OBJS := $(ALL_OBJS-y)
 
-# Get gcc to generate the dependencies for us.
-CFLAGS-y += -MMD -MP -MF $(@D)/.$(@F).d
-
 CFLAGS += $(CFLAGS-y)
 # allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
 CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
@@ -146,9 +142,12 @@ endif
 # Always build obj-bin files as binary even if they come from C source. 
 $(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
 
+c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(CFLAGS) '-D__OBJECT_FILE__="$@"'
+a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(AFLAGS)
+
 built_in.o: $(obj-y) $(extra-y)
 ifeq ($(obj-y),)
-	$(CC) $(CFLAGS) -c -x c /dev/null -o $@
+	$(CC) $(c_flags) -c -x c /dev/null -o $@
 else
 ifeq ($(CONFIG_LTO),y)
 	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
@@ -159,7 +158,7 @@ endif
 
 built_in_bin.o: $(obj-bin-y) $(extra-y)
 ifeq ($(obj-bin-y),)
-	$(CC) $(AFLAGS) -c -x assembler /dev/null -o $@
+	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
 else
 	$(LD) $(LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
 endif
@@ -178,7 +177,7 @@ SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
 
 %.o: %.c Makefile
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
-	$(CC) $(CFLAGS) -c $< -o $(@D)/.$(@F).tmp -MQ $@
+	$(CC) $(c_flags) -c $< -o $(@D)/.$(@F).tmp -MQ $@
 ifeq ($(CONFIG_CC_IS_CLANG),y)
 	$(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(@D)/.$(@F).tmp $@
 else
@@ -186,11 +185,11 @@ else
 endif
 	rm -f $(@D)/.$(@F).tmp
 else
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(CC) $(c_flags) -c $< -o $@
 endif
 
 %.o: %.S Makefile
-	$(CC) $(AFLAGS) -c $< -o $@
+	$(CC) $(a_flags) -c $< -o $@
 
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o Makefile
 	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | while read idx name sz rest; do \
@@ -205,12 +204,12 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o Makefile
 	$(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 
 %.i: %.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(CFLAGS)) $< -o $@
+	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
 
 %.s: %.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(CFLAGS)) -S $< -o $@
+	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
 %.s: %.S Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(AFLAGS)) $< -o $@
+	$(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
 
 -include $(DEPS_INCLUDE)
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7273f356f190..913f6cdeed3f 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -120,10 +120,10 @@ $(TARGET)-syms: prelink.o xen.lds
 	rm -f $(@D)/.$(@F).[0-9]*
 
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
-	$(CC) $(filter-out -flto,$(CFLAGS)) -S -o $@ $<
+	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
 
 xen.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(AFLAGS) -o $@ $<
+	$(CC) -P -E -Ui386 $(a_flags) -o $@ $<
 	sed -e 's/xen\.lds\.o:/xen\.lds:/g' <.xen.lds.d >.xen.lds.d.new
 	mv -f .xen.lds.d.new .xen.lds.d
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index e954edbc2e0a..1405525105d9 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -168,7 +168,7 @@ EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
 EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
 
 # Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(filter-out $(CFLAGS-y) .%.d,$(CFLAGS)) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+export XEN_BUILD_EFI := $(shell $(CC) $(CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 # Check if the linker supports PE.
 XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
@@ -223,7 +223,7 @@ efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: $(B
 efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: ;
 
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
-	$(CC) $(filter-out -Wa$(comma)% -flto,$(CFLAGS)) -S -o $@ $<
+	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -o $@ $<
 
 asm-macros.i: CFLAGS += -D__ASSEMBLY__ -P
 
@@ -240,7 +240,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 
 efi.lds: AFLAGS += -DEFI
 xen.lds efi.lds: xen.lds.S
-	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(AFLAGS)) -o $@ $<
+	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
 	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
 	mv -f .$(@F).d.new .$(@F).d
 
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index d87dc0aa6eeb..a2431fde6bb4 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -12,10 +12,10 @@ obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
 obj-y += paging.o
 
 guest_walk_%.o: guest_walk.c Makefile
-	$(CC) $(CFLAGS) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index b14a9aff93d2..22e7ad54bd33 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -6,10 +6,10 @@ obj-y += nested_hap.o
 obj-y += nested_ept.o
 
 guest_walk_%level.o: guest_walk.c Makefile
-	$(CC) $(CFLAGS) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.i: guest_walk.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_walk_%level.s: guest_walk.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/arch/x86/mm/shadow/Makefile b/xen/arch/x86/mm/shadow/Makefile
index ff03a9937f9b..23d3ff10802c 100644
--- a/xen/arch/x86/mm/shadow/Makefile
+++ b/xen/arch/x86/mm/shadow/Makefile
@@ -7,10 +7,10 @@ obj-y += none.o
 endif
 
 guest_%.o: multi.c Makefile
-	$(CC) $(CFLAGS) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.i: multi.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
+	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
 
 guest_%.s: multi.c Makefile
-	$(CC) $(filter-out -Wa$(comma)%,$(CFLAGS)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
+	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -DGUEST_PAGING_LEVELS=$* -S $< -o $@
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 433bad9055b2..a488a98d8bb7 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -64,7 +64,7 @@ compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
 	mv -f $@.new $@
 
 compat/%.i: compat/%.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)% -M% %.d -include %/include/xen/config.h,$(CFLAGS)) $(cppflags-y) -o $@ $<
+	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(CFLAGS)) $(cppflags-y) -o $@ $<
 
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-- 
Anthony PERARD


