Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848C1B2BFB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:12:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvVp-0005V7-Gy; Tue, 21 Apr 2020 16:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwqV=6F=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jQvVn-0005U4-QK
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:12:39 +0000
X-Inumbo-ID: e7f25782-83ea-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7f25782-83ea-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587485553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0hrNnTkGU1cVUEGCg9RIavqwWfviH43vEK4pXIptfW4=;
 b=PYV0Vnab5++zaB4t9ojPMEsGjKC4pW4M3cfEh4H+IV5p7IMG6rPxTEI/
 gFsPkioAtgPlRpJR0PklTfdKLTCTLS5kGL951BO4fwpNtwIj2fUmsc0Uz
 yRDv76taEQcnmL93oqG3HlbkbyYMyEQWqWXn4gOxlBmOhow9uP9OkvJm3 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kHE+1wNsgjA+7laOt810J2tJ1Z5QpvodkY9ftGvjTzxu+oZkxYuAy1XdLXq4yigz+AJJoFWbjL
 5rT/JtQ8Sg3K5hqlqEeebWZcQXkWJliHkkEdgOX5eLbqSP7XJnX9RA5bpynIkFDX+6DQG+Lcmo
 kMnJ+iy5ynNboynI6DKo8sPJENgojaJqp2Xpc4zlGyxOM2m4v59x6GlXsoQSZGzNFfbe5cvi5Z
 ZFvdRnVGHJ7nQMXR3xPWf/A0AuBuwxTQizVl5yW/k9HLbKOEav9/pNK/xbcVqx53/3GKCkFtYL
 y3c=
X-SBRS: 2.7
X-MesageID: 16262940
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16262940"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH v5 04/16] xen/build: have the root Makefile generates the
 CFLAGS
Date: Tue, 21 Apr 2020 17:11:56 +0100
Message-ID: <20200421161208.2429539-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421161208.2429539-1-anthony.perard@citrix.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Instead of generating the CFLAGS in Rules.mk everytime we enter a new
subdirectory, we are going to generate most of them a single time, and
export the result in the environment so that Rules.mk can use it.  The
only flags left to be generated are the ones that depend on the
targets, but the variable $(c_flags) takes care of that.

Arch specific CFLAGS are generated by a new file "arch/*/arch.mk"
which is included by the root Makefile.

We export the *FLAGS via the environment variables XEN_*FLAGS because
Rules.mk still includes Config.mk and would add duplicated flags to
CFLAGS.

When running Rules.mk in the root directory (xen/), the variable
`root-make-done' is set, so `need-config' will remain undef and so the
root Makefile will not generate the cflags again.

We can't use CFLAGS in subdirectories to add flags to particular
targets, instead start to use CFLAGS-y. Idem for AFLAGS.
So there are two different CFLAGS-y, the one in xen/Makefile (and
arch.mk), and the one in subdirs that Rules.mk is going to use.
We can't add to XEN_CFLAGS because it is exported, so making change to
it might be propagated to subdirectory which isn't intended.

Some style change are introduced in this patch:
    when LDFLAGS_DIRECT is included in LDFLAGS
    use of CFLAGS-$(CONFIG_INDIRECT_THUNK) instead of ifeq().

The LTO change hasn't been tested properly, as LTO is marked as
broken.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v5:
    - typos
    - remove -flto from XEN_CFLAGS instead of calling lto broken and
      commenting out lto stuff.
    
    v4:
    - typos
    - Adding $(AFLAGS-y) to $(AFLAGS)
    
    v3:
    - squash "xen/build: introduce ccflags-y and CFLAGS_$@" here, with
      those changes:
        - rename ccflags-y to simply CFLAGS-y and start using AFLAGS-y in
          subdirs.
        - remove CFLAGS_$@, we don't need it yet.
        - fix build of xen.lds and efi.lds which needed -D to be a_flags
    - remove arch_ccflags, and modify c_flags directly
      with that change, reorder c_flags, so that target specific flags are last.
    - remove HAVE_AS_QUOTED_SYM from envvar and check XEN_CFLAGS to find if
      it's there when adding -D__OBJECT_LABEL__.
    - fix missing some flags in AFLAGS
      (like -fshort-wchar in xen/arch/x86/efi/Makefile,
       and -D__OBJECT_LABEL__ and CFLAGS-stack-boundary)
    - keep COV_FLAGS generation in Rules.mk since it doesn't invovle to
      call CC
    - fix clang test for "asm()-s support .include." (in a new patch done
      ahead)
    - include Kconfig.include in xen/Makefile because as-option-add is
      defined there now.

 xen/Makefile                       | 58 +++++++++++++++++++
 xen/Rules.mk                       | 73 ++++++------------------
 xen/arch/arm/Makefile              | 10 ++--
 xen/arch/arm/Rules.mk              | 23 --------
 xen/arch/arm/{Rules.mk => arch.mk} |  5 --
 xen/arch/arm/efi/Makefile          |  2 +-
 xen/arch/x86/Makefile              | 24 ++++----
 xen/arch/x86/Rules.mk              | 91 ++----------------------------
 xen/arch/x86/{Rules.mk => arch.mk} | 17 ++----
 xen/arch/x86/efi/Makefile          |  2 +-
 xen/common/libelf/Makefile         |  4 +-
 xen/common/libfdt/Makefile         |  4 +-
 xen/include/Makefile               |  2 +-
 xen/xsm/flask/Makefile             |  2 +-
 xen/xsm/flask/ss/Makefile          |  2 +-
 15 files changed, 114 insertions(+), 205 deletions(-)
 copy xen/arch/arm/{Rules.mk => arch.mk} (85%)
 copy xen/arch/x86/{Rules.mk => arch.mk} (87%)

diff --git a/xen/Makefile b/xen/Makefile
index 643c689658f3..2a689b26a2ba 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -118,6 +118,64 @@ $(KCONFIG_CONFIG):
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
 	$(MAKE) $(kconfig) syncconfig
 
+ifeq ($(CONFIG_DEBUG),y)
+CFLAGS += -O1
+else
+CFLAGS += -O2
+endif
+
+ifeq ($(CONFIG_FRAME_POINTER),y)
+CFLAGS += -fno-omit-frame-pointer
+else
+CFLAGS += -fomit-frame-pointer
+endif
+
+CFLAGS += -nostdinc -fno-builtin -fno-common
+CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+$(call cc-option-add,CFLAGS,CC,-Wvla)
+CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+CFLAGS-$(CONFIG_DEBUG_INFO) += -g
+
+ifneq ($(CONFIG_CC_IS_CLANG),y)
+# Clang doesn't understand this command line argument, and doesn't appear to
+# have a suitable alternative.  The resulting compiled binary does function,
+# but has an excessively large symbol table.
+CFLAGS += -Wa,--strip-local-absolute
+endif
+
+AFLAGS += -D__ASSEMBLY__
+
+CFLAGS += $(CFLAGS-y)
+# allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
+CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
+
+# Most CFLAGS are safe for assembly files:
+#  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
+#  -flto makes no sense and annoys clang
+AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS)) $(AFLAGS-y)
+
+# LDFLAGS are only passed directly to $(LD)
+LDFLAGS += $(LDFLAGS_DIRECT) $(LDFLAGS-y)
+
+ifeq ($(CONFIG_UBSAN),y)
+CFLAGS_UBSAN := -fsanitize=undefined
+else
+CFLAGS_UBSAN :=
+endif
+
+ifeq ($(CONFIG_LTO),y)
+CFLAGS += -flto
+LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
+endif
+
+include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
+
+# define new variables to avoid the ones defined in Config.mk
+export XEN_CFLAGS := $(CFLAGS)
+export XEN_AFLAGS := $(AFLAGS)
+export XEN_LDFLAGS := $(LDFLAGS)
+export CFLAGS_UBSAN
+
 endif # need-config
 
 .PHONY: build install uninstall clean distclean MAP
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 3408a35dbf53..8e4b9e3a4a82 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -38,59 +38,17 @@ ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
 ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
 
 # Initialise some variables
-CFLAGS_UBSAN :=
-
-ifeq ($(CONFIG_DEBUG),y)
-CFLAGS += -O1
-else
-CFLAGS += -O2
-endif
-
-ifeq ($(CONFIG_FRAME_POINTER),y)
-CFLAGS += -fno-omit-frame-pointer
-else
-CFLAGS += -fomit-frame-pointer
-endif
-
-CFLAGS += -nostdinc -fno-builtin -fno-common
-CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
-$(call cc-option-add,CFLAGS,CC,-Wvla)
-CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
-CFLAGS-$(CONFIG_DEBUG_INFO) += -g
-
-ifneq ($(CONFIG_CC_IS_CLANG),y)
-# Clang doesn't understand this command line argument, and doesn't appear to
-# have an suitable alternative.  The resulting compiled binary does function,
-# but has an excessively large symbol table.
-CFLAGS += -Wa,--strip-local-absolute
-endif
-
-AFLAGS += -D__ASSEMBLY__
+CFLAGS-y :=
+AFLAGS-y :=
 
 ALL_OBJS := $(ALL_OBJS-y)
 
-CFLAGS += $(CFLAGS-y)
-# allow extra CFLAGS externally via EXTRA_CFLAGS_XEN_CORE
-CFLAGS += $(EXTRA_CFLAGS_XEN_CORE)
-
-# Most CFLAGS are safe for assembly files:
-#  -std=gnu{89,99} gets confused by #-prefixed end-of-line comments
-#  -flto makes no sense and annoys clang
-AFLAGS += $(filter-out -std=gnu% -flto,$(CFLAGS))
-
-# LDFLAGS are only passed directly to $(LD)
-LDFLAGS += $(LDFLAGS_DIRECT)
-
-LDFLAGS += $(LDFLAGS-y)
-
 SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             $(foreach w,1 2 4, \
                                                         rodata.str$(w).$(a)) \
                                             rodata.cst$(a)) \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
-include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
-
 include Makefile
 
 define gendep
@@ -107,7 +65,7 @@ $(foreach o,$(filter-out %/,$(obj-y) $(obj-bin-y) $(extra-y)),$(eval $(call gend
 subdir-y := $(subdir-y) $(filter %/, $(obj-y))
 obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS += -DINIT_SECTIONS_ONLY
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
 ifeq ($(CONFIG_COVERAGE),y)
 ifeq ($(CONFIG_CC_IS_CLANG),y)
@@ -115,19 +73,16 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
 else
     COV_FLAGS := -fprofile-arcs -ftest-coverage
 endif
-$(filter-out %.init.o $(nocov-y),$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS += $(COV_FLAGS)
+$(filter-out %.init.o $(nocov-y),$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += $(COV_FLAGS)
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
-CFLAGS_UBSAN += -fsanitize=undefined
 # Any -fno-sanitize= options need to come after any -fsanitize= options
 $(filter-out %.init.o $(noubsan-y),$(obj-y) $(obj-bin-y) $(extra-y)): \
-CFLAGS += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
+CFLAGS-y += $(filter-out -fno-%,$(CFLAGS_UBSAN)) $(filter -fno-%,$(CFLAGS_UBSAN))
 endif
 
 ifeq ($(CONFIG_LTO),y)
-CFLAGS += -flto
-LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 # Would like to handle all object files as bitcode, but objects made from
 # pure asm are in a different format and have to be collected separately.
 # Mirror the directory tree, collecting them as built_in_bin.o.
@@ -140,10 +95,18 @@ obj-bin-y :=
 endif
 
 # Always build obj-bin files as binary even if they come from C source. 
-$(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
+$(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
+
+# Calculation of flags, first the generic flags, then the arch specific flags,
+# and last the flags modified for a target or a directory.
+
+c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_CFLAGS) '-D__OBJECT_FILE__="$@"'
+a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(XEN_AFLAGS)
+
+include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
 
-c_flags = -MMD -MP -MF $(@D)/.$(@F).d $(CFLAGS) '-D__OBJECT_FILE__="$@"'
-a_flags = -MMD -MP -MF $(@D)/.$(@F).d $(AFLAGS)
+c_flags += $(CFLAGS-y)
+a_flags += $(CFLAGS-y) $(AFLAGS-y)
 
 built_in.o: $(obj-y) $(extra-y)
 ifeq ($(obj-y),)
@@ -152,7 +115,7 @@ else
 ifeq ($(CONFIG_LTO),y)
 	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
 else
-	$(LD) $(LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
 endif
 endif
 
@@ -160,7 +123,7 @@ built_in_bin.o: $(obj-bin-y) $(extra-y)
 ifeq ($(obj-bin-y),)
 	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
 else
-	$(LD) $(LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
 endif
 
 # Force execution of pattern rules (for which PHONY cannot be directly used).
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 913f6cdeed3f..9f1ab2335756 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -95,24 +95,24 @@ prelink_lto.o: $(ALL_OBJS)
 
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
 prelink.o: $(ALL_OBJS)
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 endif
 
 $(TARGET)-syms: prelink.o xen.lds
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index 3ad284aa71a4..e69de29bb2d1 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -1,23 +0,0 @@
-########################################
-# arm-specific definitions
-
-#
-# If you change any of these configuration options then you must
-# 'make clean' before rebuilding.
-#
-
-CFLAGS += -I$(BASEDIR)/include
-
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-
-# Prevent floating-point variables from creeping into Xen.
-CFLAGS-$(CONFIG_ARM_32) += -msoft-float
-CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
-
-CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
-CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
-
-ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
-    $(error You must use 'make menuconfig' to enable/disable early printk now)
-endif
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/arch.mk
similarity index 85%
copy from xen/arch/arm/Rules.mk
copy to xen/arch/arm/arch.mk
index 3ad284aa71a4..c8186f58288d 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,11 +1,6 @@
 ########################################
 # arm-specific definitions
 
-#
-# If you change any of these configuration options then you must
-# 'make clean' before rebuilding.
-#
-
 CFLAGS += -I$(BASEDIR)/include
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index d34c9168914a..e3ff2c3f283c 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS += -fshort-wchar
+CFLAGS-y += -fshort-wchar
 
 obj-y +=  boot.init.o runtime.o
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 1405525105d9..a805e9982e85 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -121,32 +121,32 @@ prelink-efi_lto.o: $(ALL_OBJS) efi/runtime.o efi/compat.o
 
 # Link it with all the binary objects
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 
 prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink-efi_lto.o efi/boot.init.o
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
 prelink.o: $(ALL_OBJS)
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 
 prelink-efi.o: $(ALL_OBJS) efi/boot.init.o efi/runtime.o efi/compat.o
-	$(LD) $(LDFLAGS) -r -o $@ $(filter-out %/efi/built_in.o,$^)
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %/efi/built_in.o,$^)
 endif
 
 $(TARGET)-syms: prelink.o xen.lds
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
-	$(LD) $(LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --xensyms --sysv --sort \
@@ -159,7 +159,7 @@ note.o: $(TARGET)-syms
 		--rename-section=.data=.note.gnu.build-id -S $@.bin $@
 	rm -f $@.bin
 
-EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10
+EFI_LDFLAGS = $(patsubst -m%,-mi386pep,$(XEN_LDFLAGS)) --subsystem=10
 EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 --strip-debug
 EFI_LDFLAGS += --section-alignment=0x200000 --file-alignment=0x20
 EFI_LDFLAGS += --major-image-version=$(XEN_VERSION)
@@ -168,7 +168,7 @@ EFI_LDFLAGS += --major-os-version=2 --minor-os-version=0
 EFI_LDFLAGS += --major-subsystem-version=2 --minor-subsystem-version=0
 
 # Check if the compiler supports the MS ABI.
-export XEN_BUILD_EFI := $(shell $(CC) $(CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
+export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
 # Check if the linker supports PE.
 XEN_BUILD_PE := $(if $(XEN_BUILD_EFI),$(shell $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o 2>/dev/null && echo y))
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
@@ -178,7 +178,7 @@ $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_
 
 ifneq ($(build_id_linker),)
 ifeq ($(call ld-ver-build-id,$(LD) $(filter -m%,$(EFI_LDFLAGS))),y)
-CFLAGS += -DBUILD_ID_EFI
+CFLAGS-y += -DBUILD_ID_EFI
 EFI_LDFLAGS += $(build_id_linker)
 note_file := efi/buildid.o
 # NB: this must be the last input in the linker call, because inputs following
@@ -225,7 +225,7 @@ efi/boot.init.o efi/runtime.o efi/compat.o efi/buildid.o efi/relocs-dummy.o: ;
 asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c $(BASEDIR)/include/asm-x86/asm-macros.h
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -o $@ $<
 
-asm-macros.i: CFLAGS += -D__ASSEMBLY__ -P
+asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
 $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	echo '#if 0' >$@.new
@@ -238,7 +238,7 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	echo '#endif' >>$@.new
 	$(call move-if-changed,$@.new,$@)
 
-efi.lds: AFLAGS += -DEFI
+efi.lds: AFLAGS-y += -DEFI
 xen.lds efi.lds: xen.lds.S
 	$(CC) -P -E -Ui386 $(filter-out -Wa$(comma)%,$(a_flags)) -o $@ $<
 	sed -e 's/.*\.lds\.o:/$(@F):/g' <.$(@F).d >.$(@F).d.new
diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
index 4b7ab784670c..56fe22c979ea 100644
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -1,89 +1,10 @@
 ########################################
 # x86-specific definitions
 
-XEN_IMG_OFFSET := 0x200000
-
-CFLAGS += -I$(BASEDIR)/include
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
-CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
-CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
-CFLAGS += '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'
-
-# Prevent floating-point variables from creeping into Xen.
-CFLAGS += -msoft-float
-
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-# Note: Any test which adds -no-integrated-as will cause subsequent tests to
-# succeed, and not trigger further additions.
-#
-# The tests to select whether the integrated assembler is usable need to happen
-# before testing any assembler features, or else the result of the tests would
-# be stale if the integrated assembler is not used.
-
-# Older clang's built-in assembler doesn't understand .skip with labels:
-# https://bugs.llvm.org/show_bug.cgi?id=27369
-$(call as-option-add,CFLAGS,CC,".L0: .L1: .skip (.L1 - .L0)",,\
-                     -no-integrated-as)
-
-# Check whether clang asm()-s support .include.
-$(call as-option-add,CFLAGS,CC,".include \"asm-x86/indirect_thunk_asm.h\"",,\
-                     -no-integrated-as)
-
-# Check whether clang keeps .macro-s between asm()-s:
-# https://bugs.llvm.org/show_bug.cgi?id=36110
-$(call as-option-add,CFLAGS,CC,\
-                     ".macro FOO;.endm"$$(close); asm volatile $$(open)".macro FOO;.endm",\
-                     -no-integrated-as)
-endif
-
-$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
-$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,"vmcall",-DHAVE_AS_VMX)
-$(call as-option-add,CFLAGS,CC,"crc32 %eax$$(comma)%eax",-DHAVE_AS_SSE4_2)
-$(call as-option-add,CFLAGS,CC,"invept (%rax)$$(comma)%rax",-DHAVE_AS_EPT)
-$(call as-option-add,CFLAGS,CC,"rdrand %eax",-DHAVE_AS_RDRAND)
-$(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
-$(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
-$(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
-$(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
-$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1", \
-                     -U__OBJECT_LABEL__ -DHAVE_AS_QUOTED_SYM \
-                     '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$$@')
-$(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
-
-# GAS's idea of true is -1.  Clang's idea is 1
-$(call as-option-add,CFLAGS,CC,\
-    ".if ((1 > 0) < 0); .error \"\";.endif",,-DHAVE_AS_NEGATIVE_TRUE)
-
-# Check to see whether the assmbler supports the .nop directive.
-$(call as-option-add,CFLAGS,CC,\
-    ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
-
-CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
-
-# Xen doesn't use SSE interally.  If the compiler supports it, also skip the
-# SSE setup for variadic function calls.
-CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
-
-# Compile with thunk-extern, indirect-branch-register if avaiable.
-ifeq ($(CONFIG_INDIRECT_THUNK),y)
-CFLAGS += -mindirect-branch=thunk-extern -mindirect-branch-register
-CFLAGS += -fno-jump-tables
+ifneq ($(filter -DHAVE_AS_QUOTED_SYM,$(XEN_CFLAGS)),)
+object_label_flags = '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$@'
+else
+object_label_flags = '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'
 endif
-
-# If supported by the compiler, reduce stack alignment to 8 bytes. But allow
-# this to be overridden elsewhere.
-$(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
-CFLAGS += $(CFLAGS-stack-boundary)
-
-ifeq ($(CONFIG_UBSAN),y)
-# Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
-# and various things (ACPI tables, hypercall pages, stubs, etc) are wont-fix.
-# It also causes an as-yet-unidentified crash on native boot before the
-# console starts.
-$(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
-endif
-
-# Set up the assembler include path properly for older toolchains.
-CFLAGS += -Wa,-I$(BASEDIR)/include
-
+c_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
+a_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/arch.mk
similarity index 87%
copy from xen/arch/x86/Rules.mk
copy to xen/arch/x86/arch.mk
index 4b7ab784670c..2a51553edb3c 100644
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/arch.mk
@@ -1,13 +1,12 @@
 ########################################
 # x86-specific definitions
 
-XEN_IMG_OFFSET := 0x200000
+export XEN_IMG_OFFSET := 0x200000
 
 CFLAGS += -I$(BASEDIR)/include
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
-CFLAGS += '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'
 
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
@@ -46,9 +45,7 @@ $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
 $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
 $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
 $(call as-option-add,CFLAGS,CC,"clwb (%rax)",-DHAVE_AS_CLWB)
-$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1", \
-                     -U__OBJECT_LABEL__ -DHAVE_AS_QUOTED_SYM \
-                     '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$$@')
+$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1",-DHAVE_AS_QUOTED_SYM)
 $(call as-option-add,CFLAGS,CC,"invpcid (%rax)$$(comma)%rax",-DHAVE_AS_INVPCID)
 
 # GAS's idea of true is -1.  Clang's idea is 1
@@ -66,15 +63,14 @@ CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
 CFLAGS += -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
 # Compile with thunk-extern, indirect-branch-register if avaiable.
-ifeq ($(CONFIG_INDIRECT_THUNK),y)
-CFLAGS += -mindirect-branch=thunk-extern -mindirect-branch-register
-CFLAGS += -fno-jump-tables
-endif
+CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch=thunk-extern
+CFLAGS-$(CONFIG_INDIRECT_THUNK) += -mindirect-branch-register
+CFLAGS-$(CONFIG_INDIRECT_THUNK) += -fno-jump-tables
 
 # If supported by the compiler, reduce stack alignment to 8 bytes. But allow
 # this to be overridden elsewhere.
 $(call cc-option-add,CFLAGS-stack-boundary,CC,-mpreferred-stack-boundary=3)
-CFLAGS += $(CFLAGS-stack-boundary)
+export CFLAGS-stack-boundary
 
 ifeq ($(CONFIG_UBSAN),y)
 # Don't enable alignment sanitisation.  x86 has efficient unaligned accesses,
@@ -86,4 +82,3 @@ endif
 
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
-
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 4bc0a196e9ca..490d791aae2d 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,4 +1,4 @@
-CFLAGS += -fshort-wchar
+CFLAGS-y += -fshort-wchar
 
 %.o: %.ihex
 	$(OBJCOPY) -I ihex -O binary $< $@
diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
index 3d9e38f27e65..464c448d9d37 100644
--- a/xen/common/libelf/Makefile
+++ b/xen/common/libelf/Makefile
@@ -3,10 +3,10 @@ nocov-y += libelf.o
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 
-CFLAGS += -Wno-pointer-sign
+CFLAGS-y += -Wno-pointer-sign
 
 libelf.o: libelf-temp.o Makefile
 	$(OBJCOPY) $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 
 libelf-temp.o: libelf-tools.o libelf-loader.o libelf-dominfo.o #libelf-relocate.o
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index c075bbf5462a..e2a5e59380a0 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -5,10 +5,10 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 obj-y += libfdt.o
 nocov-y += libfdt.o
 
-CFLAGS += -I$(BASEDIR)/include/xen/libfdt/
+CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
 
 libfdt.o: libfdt-temp.o Makefile
 	$(OBJCOPY) $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 
 libfdt-temp.o: $(LIBFDT_OBJS)
-	$(LD) $(LDFLAGS) -r -o $@ $^
+	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
diff --git a/xen/include/Makefile b/xen/include/Makefile
index a488a98d8bb7..2a10725d689b 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -64,7 +64,7 @@ compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
 	mv -f $@.new $@
 
 compat/%.i: compat/%.c Makefile
-	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(CFLAGS)) $(cppflags-y) -o $@ $<
+	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index f001bb18d4ed..6db396347b1f 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -4,7 +4,7 @@ obj-y += flask_op.o
 
 obj-y += ss/
 
-CFLAGS += -I./include
+CFLAGS-y += -I./include
 
 AWK = awk
 
diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
index 046ce8f53326..d32b9e07138e 100644
--- a/xen/xsm/flask/ss/Makefile
+++ b/xen/xsm/flask/ss/Makefile
@@ -8,4 +8,4 @@ obj-y += services.o
 obj-y += conditional.o
 obj-y += mls.o
 
-CFLAGS += -I../include
+CFLAGS-y += -I../include
-- 
Anthony PERARD


