Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832249B2AC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260108.449356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfz-0001xt-K1; Tue, 25 Jan 2022 11:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260108.449356; Tue, 25 Jan 2022 11:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfy-0001X2-9g; Tue, 25 Jan 2022 11:07:50 +0000
Received: by outflank-mailman (input) for mailman id 260108;
 Tue, 25 Jan 2022 11:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaf-0006t5-5T
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42778510-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:02:19 +0100 (CET)
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
X-Inumbo-ID: 42778510-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DaswvKiuEtjVJe2RswYhB1g+kMvhDg7/P4Auiwxt1Rk=;
  b=XdUQIwzDMAcD4d+B/wvnIdxD3LFsdHXZpfRHSS4LTO6qYQFckHgrgW9n
   5tiyat4qnUbTXPtsX00o2WwnMoYauL8Zv7c/w3Nv/UelXLi2Bo2nlodJJ
   IiKWoVXdgYTA828U4hTyxVH5WgdKI4atDaSp5Ndcq2xBLZGsLp3eEEZgv
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CgHIF03Jjm4nvjMbA9pO/hjtnYsmKvLTqFlIOZQ7HdY10VJ8QW+kJeUwsooawYyME8EU4A5Btn
 ZSIDxDmpf0YruY5CVE0Ona0jDgDMtKkWqWnj8n/MNvC7hWYaiK3ropOt7jytS1tFDGew6dVfy8
 23PCCr2nhWiZjpW7i4EFjq2OjOxiUwJMsd85GjzUvRgHNMV9C3H5RggRDhskOxJw03D3IA6JyC
 UZIWAu3AaQo/CtZG08U4a+mLRyC1Epeu3qFkDpn0adF/G4uBUumB0Q7OA8tZWhmceV3Yx2peoc
 LDiZt3S9FmVJ8K2c29MaGGxS
X-SBRS: 5.2
X-MesageID: 62699789
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hrFy76B0XGHmTxVW/2Tlw5YqxClBgxIJ4kV8jS/XYbTApDxx0jYAy
 jdJWDuGO/iNYjGmcoh+b46xo0NS6MDWz4BqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940087wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lG3XkYhoy
 up2hLe5ESMNPYfmxfxaekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGhmlh158eTJ4yY
 eIrKiBCdE/KPiRfGUYyM5cGvLipi37gJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKa9lq8i+mJmjn0MKoRE7ui//Isn1yXxUQUEhQdUVb9qv684ma0VshDM
 UUS9mwrpLIr6U2wZtDnWluzp3vslhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtR+FK+4iPXlFDe2x
 CqFxBXSnJ1K05RNjf/iuwma3XT8/fAlUzLZ+C3IBjyrthp7W7WUTIXwzXzYx9wdNMGwGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsJGexC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRPIt4wOuBJ1+U3aB
 Xt9WZzwZZr9If8/pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsPjc/FSKr
 IgOZpPiJ/BjvAvWOHW/HWk7dghiEJTGLcqu95w/mhCrfGKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxYwrA8yV9MO6HsfdOH7NqLOJP3LEykpZJo
 wwtJp/o7gJnEGqXolzwrPDV8eRfSfhcrVveZnX+OGlmIccIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX6hms3mLIPGFZvCtj4cvWqww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvylaK8HkV9GvpBSCbFuya5itdLjq6UDllZvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EYZq3HkQQKQwpavW4+csVwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3END/cnu5UdDNO5gwYn0AgfM5nVCyuw65CTcdRcdEItJ
 2bM1qbFgr1dwGvEcmYySieRjbYM28xWtUAY1kIGKnSIhsHB160+0xBm+DgqShhYk0dc2OVpN
 2k3b0B4KM1iJduzaBSvi4x0Jzx8OQ==
IronPort-HdrOrdr: A9a23:X4heVKmq+wg7tBJAJRruqLzUmBzpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699789"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
Subject: [XEN PATCH v9 25/30] build: replace $(BASEDIR) by $(objtree)
Date: Tue, 25 Jan 2022 11:00:58 +0000
Message-ID: <20220125110103.3527686-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
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
index a847c989ff92..3fb59987776b 100644
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


