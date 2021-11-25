Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0F45DB97
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231318.400394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6d-0003sD-By; Thu, 25 Nov 2021 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231318.400394; Thu, 25 Nov 2021 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6c-0003cv-Mh; Thu, 25 Nov 2021 13:48:06 +0000
Received: by outflank-mailman (input) for mailman id 231318;
 Thu, 25 Nov 2021 13:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0M-0007NX-As
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 682b4b48-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:36 +0100 (CET)
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
X-Inumbo-ID: 682b4b48-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0dwWPZpy0KkJ+4xdfvtRcrAAB0kbPpTPYuJAwuL/Dtw=;
  b=aMv9hvnMFTmRvaM98W4aNy5AwrpgL8cY81hA32lBSG0awbI3KAAk31Nf
   YrT6rQ7Eb3Ow9K3gbk6RQWF1iOqsq2yEsGTmN7X+ivQnqVvx3lKAc0ipG
   7L8GdpZusOciyLJUlHqIjYbR4KJXv7tBPW/WnpDTVSjp/RKYx+VA8VTFs
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yA3hOxrap6m/MqP6PIvyqdPo+yEYS+YXrv8+M+u630gD3nh6wM/unVUC/IPppLFE2HrAb0Oo8l
 vlBwS69H0keRJujuK2AHHsKr1/BtkSEmapu0u5sC7/oKSMyZQyWvBydOMDpUTsp0ci1df7XCQn
 WvZTfyxrmoh/S3eb4EiTHTXWTI/X9DpF3TmU8yNXmzv4qXKqdIRqLS0ajSyY8Ea2MA0deuU9H4
 E/IMTZZAcrwp6G/yscmv2QWILi6rN4xXaKkwlcevtQ4fW3QvVuw5K6rd/GmUdUQ0nOKqXwUXi9
 FcZ/ORgK/kyCtslFjS/M7sZw
X-SBRS: 5.1
X-MesageID: 58617683
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LRHkIqCNuTeWvBVW/2rlw5YqxClBgxIJ4kV8jS/XYbTApDsq12dUn
 DcaCG2Ca/3bZTf3KtEgPN62pBkAvZLSnNNmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540087wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2gunxY8g2
 f9xlcKMElsWJYTIpPkaakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjGlp2Z4eRp4yY
 eICMiNSUkj/fCEVEVlGBckYxtmQnl7GJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKa9lq8i+mJmjn0MKoRE7ui//Isn1yXxUQUEhQdUVb9qv684ma0VshDM
 UUS9mwrpLIr6U2wZtDnWluzp3vslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQN05tucmSDoyz
 FiLktj1Qzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWhb8ekMoK3KWT5k3cjnSnoZ2hc+IuzlyJBCT/tFo/PdP7IdzzgbTG0RpeBNenYAPe7
 Wkup+jA0LtSMoqkkBCQR9xYSdlF+M25GDHbhFduGbwo+DKs52OvcOhs3d1uGKt6Gp1aIGG0O
 Sc/rSsUvcYOZyXyMcebdqroU5xypZUMA+gJQRw9gjBmRpFqPDGK8yh1DaJ79zC8yRN8+U3T1
 HryTCpNMZr4Ifg4pNZVb71EuVPO+szZ7TmOLa0XNzz9jdKjiIe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wBC7KhPXiHod9JcwFiwZ0H6Xfe8ZI/SwJ+ClA+RDFJ5wH5ndvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QisLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD2VjTYnH7OWdnJPaNhWXho7fZQ+cmzwFWZgLfiCf0i
 +TIOtrzTcVRSgJ8ItzRbf7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYlqmuMPAOkFtQnZB7FrJnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOzQas3/EVMXKA40Vci51KkZymvI8PA4AETm/ysrrrCJZlpfYkuXgytHIborbI58m
 bU9uNQb4hCUgwYxNorUlThd8mmBIyBSU6gjsZ1GUobnhhBylwNHaJ3YTCT3/IuOe5NHNUxze
 m2Yg6/LhrJ9wEveciVsSSiRjLQF3Zle6gpXyFIiJkiSnouXj/A66xRd7DArQ1kH1R5Aye9yZ
 jBmOkAdyX9iJNu0aByvh1yRJjw=
IronPort-HdrOrdr: A9a23:1uUI1ajwLjY6Q1EfdBhsRVHjQ3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617683"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>
Subject: [XEN PATCH v8 28/47] build: replace $(BASEDIR) by $(objtree)
Date: Thu, 25 Nov 2021 13:39:47 +0000
Message-ID: <20211125134006.1076646-29-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We need to differentiate between source files and generated/built
files. We will be replacing $(BASEDIR) by $(objtree) for files that
are generated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - rebased

 xen/Rules.mk                |  2 +-
 xen/arch/arm/Makefile       | 10 +++++-----
 xen/arch/x86/Makefile       | 28 ++++++++++++++--------------
 xen/common/Makefile         |  2 +-
 xen/test/livepatch/Makefile | 12 ++++++------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index d6eabd3415b5..cd00f006ee8f 100644
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
index cecfaf4f3c0f..ae7a2f907540 100644
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
index eabd8d3919a4..5fb7f1408768 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -94,8 +94,8 @@ ifneq ($(CONFIG_HVM),y)
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
 	$(MAKE) $(build)=$(@D) efi-y= $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
 	$(MAKE) $(build)=$(@D) efi-y= $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
-		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
+		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
 
@@ -199,28 +199,28 @@ note_file_option ?= $(note_file)
 
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
 	$(MAKE) $(build)=$(@D) efi-y= .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
-		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
 	$(MAKE) $(build)=$(@D) efi-y= .$(@F).1r.o .$(@F).1s.o
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


