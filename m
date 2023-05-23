Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3815970E1F7
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538557.838627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V21-0007xS-5H; Tue, 23 May 2023 16:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538557.838627; Tue, 23 May 2023 16:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V21-0007td-1j; Tue, 23 May 2023 16:38:41 +0000
Received: by outflank-mailman (input) for mailman id 538557;
 Tue, 23 May 2023 16:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1z-0006Dq-EZ
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4409e439-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:38 +0200 (CEST)
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
X-Inumbo-ID: 4409e439-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PR1Nr1IkdQd7XuTeHUYIINkb87rvsAFhUL6D4IH39fU=;
  b=WJ655CNxJCkwLw/sitlRzO+VagKoN294YMpWqp81TYVbGh/mLcMpPLh3
   iFEcDf/UD1c0s+SgCXB48gn8ZTfJkTzmEq6W1yFKJ9IeoT0Xt6a7JydZP
   lP4PyQjTmSJ/Tdg0v7AU01PZaxZAkX0AJ3lrRqZTEbRtd0Fu/rXTbe5CJ
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110112559
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tl6GW6IPxdOCmsGHFE+RmpIlxSXFcZb7ZxGr2PjKsXjdYENS02YAy
 mRODW3TbvfbYmX3eNsjPYy/9xsHsJDTm4BrHgtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GWFx0z
 tUULAkVSRKlprus35+iVOhj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ0MxxzF+
 zOuE2LRWUAUMtqb0Ca/6nuR2fSSoHrEdp09C+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAGUzpAZdoOpMIwAzsw2
 TehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqeissXQYDpd75r+kbhB/VUsxqFqLzi9TvACzx2
 BiDti14jLIW5eY10KG88UHCkiibjJHDRQ4o5S3aRmugqAh+YeaNbYui40nW9vZEIYOQSHGOu
 XEFn46V6+VmJZiJlTeRSeQXWr+z7vCOMSb0nlJkWZIm8lyF8Hmle4dS7DhgJVxBPcMNeDuva
 0jW0StS45lJNXfscq5zYKq2Ec0hyaWmHtPgPs04dfIXPMI3LlXeungzOwjJhTuFfFUQfb8XC
 M6mS/2FAXIjEYNl6hvvXfgwyKEqyXVrrY/MfqzTwxOi2LuYQXeaT7YZLVeDBtwEALO4TBb9q
 IgGaZbTo/lLeKinO3SMr9ZPRbwfBSJjba0avfC7YQJqzuBOPGg6Q8Hczro6E2COt/QEz7yYl
 p1Rt6Ix9bYeuZElAV/SApyAQOm1NXqakZ7cFXJEALpQ8yJ/CbtDFY9GH3fNQZEp9fZ40dl/R
 OQfdsOLD5xnE2qXp2tNNcWm/dU6KHxHYD5i2AL8OlACk2NIHVSVqrcIgCO0nMXxMsZHnZRn+
 ODxvu8qaZECWx5jHK7rVR5b9Hvo5SJ1sLsrDyP1zix7JB2EHH5Cd3ag0Zfa4qgkdX3++9dt/
 13OW0ZH+rGd8tNdHRugrfnskrpF2tBWRiJyd1Q3J57tXcUG1gJPGbN9bds=
IronPort-HdrOrdr: A9a23:0IHgGKmRtA4cNC69p2DmB8OQnoLpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:DZ5qBW2iCXgj3n4NC14DwbxfK5kYSEb0wHPpO2i6L0cwUqK4UEGR9/Yx
X-Talos-MUID: 9a23:/+oh6wQgM/5RClhHRXS31T9kMsNx/562AX1Sisg74vaqKgNvbmI=
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110112559"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [XEN PATCH 07/15] build: move XEN_HAS_BUILD_ID out of Config.mk
Date: Tue, 23 May 2023 17:38:03 +0100
Message-ID: <20230523163811.30792-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Whether or not the linker can do build id is only used by the
hypervisor build, so move that there.

Rename $(build_id_linker) to $(XEN_LDFLAGS_BUILD_ID) as this is a
better name to be exported as to use the "XEN_*" namespace.

Also update XEN_TREEWIDE_CFLAGS so flags can be used for
arch/x86/boot/ CFLAGS_x86_32

Beside a reordering of the command line where CFLAGS is used, there
shouldn't be any other changes.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk                   | 12 ------------
 xen/Makefile                | 12 ++++++++++++
 xen/arch/arm/Makefile       |  2 +-
 xen/arch/riscv/Makefile     |  2 +-
 xen/arch/x86/Makefile       | 12 ++++++------
 xen/scripts/Kbuild.include  |  3 +++
 xen/test/livepatch/Makefile |  4 ++--
 7 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/Config.mk b/Config.mk
index d12d4c2b8f..27f48f654a 100644
--- a/Config.mk
+++ b/Config.mk
@@ -125,18 +125,6 @@ endef
 check-$(gcc) = $(call cc-ver-check,CC,0x040100,"Xen requires at least gcc-4.1")
 $(eval $(check-y))
 
-ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
-					grep -q build-id && echo n || echo y)
-
-export XEN_HAS_BUILD_ID ?= n
-ifeq ($(call ld-ver-build-id,$(LD)),n)
-build_id_linker :=
-else
-CFLAGS += -DBUILD_ID
-export XEN_HAS_BUILD_ID=y
-build_id_linker := --build-id=sha1
-endif
-
 define buildmakevars2shellvars
     export PREFIX="$(prefix)";                                            \
     export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
diff --git a/xen/Makefile b/xen/Makefile
index 27f70d2200..4dc960df2c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -286,6 +286,18 @@ CFLAGS += $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+# XEN_HAS_BUILD_ID needed by Kconfig
+ifeq ($(call ld-ver-build-id,$(LD)),n)
+XEN_LDFLAGS_BUILD_ID :=
+XEN_HAS_BUILD_ID := n
+else
+CFLAGS += -DBUILD_ID
+XEN_TREEWIDE_CFLAGS += -DBUILD_ID
+XEN_HAS_BUILD_ID := y
+XEN_LDFLAGS_BUILD_ID := --build-id=sha1
+endif
+export XEN_HAS_BUILD_ID XEN_LDFLAGS_BUILD_ID
+
 export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
 
 # ===========================================================================
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b..1cc57d2cf0 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -102,7 +102,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(XEN_LDFLAGS_BUILD_ID) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 443f6bf15f..8a0e483c66 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -9,7 +9,7 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) -o $@
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(XEN_LDFLAGS_BUILD_ID) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2672d7f4ee..c7ec315fe6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -100,7 +100,7 @@ efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
          $(space)
 efi-$(CONFIG_PV_SHIM_EXCLUSIVE) :=
 
-ifneq ($(build_id_linker),)
+ifneq ($(XEN_LDFLAGS_BUILD_ID),)
 notes_phdrs = --notes
 else
 ifeq ($(CONFIG_PVH_GUEST),y)
@@ -136,19 +136,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(XEN_LDFLAGS_BUILD_ID) \
 	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(XEN_LDFLAGS_BUILD_ID) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(XEN_LDFLAGS_BUILD_ID) \
 	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -186,10 +186,10 @@ relocs-dummy := $(obj)/efi/relocs-dummy.o
 $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) $(obj)/efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
 endif
 
-ifneq ($(build_id_linker),)
+ifneq ($(XEN_LDFLAGS_BUILD_ID),)
 ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
 CFLAGS-y += -DBUILD_ID_EFI
-EFI_LDFLAGS += $(build_id_linker)
+EFI_LDFLAGS += $(XEN_LDFLAGS_BUILD_ID)
 note_file := $(obj)/efi/buildid.o
 # NB: this must be the last input in the linker call, because inputs following
 # the -b option will all be treated as being in the specified format.
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 785a32c32e..d820595e2f 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -91,6 +91,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 
 clang-ifversion = $(shell [ $(CONFIG_CLANG_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
+ld-ver-build-id = $(shell $(1) --build-id 2>&1 | \
+					grep -q build-id && echo n || echo y)
+
 ###
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
 # Usage:
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index c258ab0b59..c78f3ce06f 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -37,7 +37,7 @@ $(obj)/modinfo.o:
 
 #
 # This target is only accessible if CONFIG_LIVEPATCH is defined, which
-# depends on $(build_id_linker) being available. Hence we do not
+# depends on $(XEN_LDFLAGS_BUILD_ID) being available. Hence we do not
 # need any checks.
 #
 # N.B. The reason we don't use arch/x86/note.o is that it may
@@ -142,7 +142,7 @@ xen_expectations_fail-objs := xen_expectations_fail.o xen_hello_world_func.o not
 
 
 quiet_cmd_livepatch = LD      $@
-cmd_livepatch = $(LD) $(XEN_LDFLAGS) $(build_id_linker) -r -o $@ $(real-prereqs)
+cmd_livepatch = $(LD) $(XEN_LDFLAGS) $(XEN_LDFLAGS_BUILD_ID) -r -o $@ $(real-prereqs)
 
 $(obj)/%.livepatch: FORCE
 	$(call if_changed,livepatch)
-- 
Anthony PERARD


