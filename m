Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E049B2A9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260109.449363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg1-0002R8-AZ; Tue, 25 Jan 2022 11:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260109.449363; Tue, 25 Jan 2022 11:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJg0-0001tw-4D; Tue, 25 Jan 2022 11:07:52 +0000
Received: by outflank-mailman (input) for mailman id 260109;
 Tue, 25 Jan 2022 11:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaN-0006t5-0E
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 387d88dd-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:02:00 +0100 (CET)
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
X-Inumbo-ID: 387d88dd-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QgU2XAiKGGaUtDR9DMaXSUbl0JKJcMb6bF3AP0fDgTY=;
  b=JattN8a26xZv3neJT0n2weF5LXyVfAM4LRlX+TSAzvmuRPQIAvdARSCx
   dn3N5Ncc84gTcaoxdtG5HEvIlom5KW3C/Iy2VWIwCZ194JHGfXUSzz4Ve
   3FfIuUhLMRVBZaFwDKXRFqcsTniWw/tj2UY5Khe+9xq7U0+T4D7JT1TQ7
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Pl7TjXwAAY/igfWo0FrlDtBt/dgk/zMyGYCXDAWfa1C9bIzv4cGPsYDA2Z2nJKWdDPTeD2KO0d
 Uh7AQv4pcybZm0u8LXHepdQMSpNGa2Hq1lFbu7WIvP5V9BPW0y6ETrTOps6/+8Ec4ZZO9hEex7
 TtiaaBq6lmuxJhD/KG52a20gcFMHa1LN61nplBhj2C7StB182BwAsj19+aL8uzzMtwL9iijUr2
 NJp/v3TfIaBGbdnNVZWUZ/8rIs5WqgOY7L7yukfjC4TvQ5FVHVRYZr1fbQDzztmFVqd2En4ck9
 dc1DhVX1RD6DudHpkUqDFwo+
X-SBRS: 5.2
X-MesageID: 64860874
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6iW4XqgBbpitBj/mlq8IyqSgX161GRYKZh0ujC45NGQN5FlHY01je
 htvWWiAb/7cYjOmL9ggboXipEJSu5GGx9dkGVFvqysyHigb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /13uKOpDiIQF5fyid1Hazh3FyB6NvdJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiCN
 5RBOWUzBPjGSzlyBU4HEZQupeOLqzrhYQ1zqHuQl7VitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfxmif8VJMXBaeP3Pdgi12OxUQeEBQTE1C8pJGRiUm4QdtTb
 VMV/ikGqrI7/0imCNL6WnWQrGafux8AW/JZC+Ag9ByW0a3Q/hqYAW4fCDVGbbQOuMA6SDMw3
 3eVjtjpAnppq7TTRnWDnp+Wpz6vPSkeLUcZeDQJCwAC5rHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv4254FTGjjSEtpXPCAkv6W3/QWaN/g5/Iom/aOSA8kPH5PxNKIKYSFipv
 3UencWaqucUAvmweDelGbtXWuvzvrDcbWOa0QUH84QdGyqFwXOcZMd12RhEGlZQaP4lVjvoZ
 ESJtlYEjHNMB0eCYahyaoO3Ls0ly6n8CNjoPszpgspyjotZL1Heonw3DaKE9yW0yRV3z/ljU
 XuOWZv0VR4n5bJbIC1argv3+Zsi3WgAyGzaXvgXJDz3gOPFNBZ5pVroWWZij9zVDovZ+G05E
 P4FbqNmLimztsWkPkE7FqZIdTg3wYATX8yeliCuXrfrzvBaMG8gEeTN5rgqZpZoma9Y/s+Ro
 C3mAhMJlwWh1CyfQelvVpyFQOmzNXqYhSljVRHAwH7ygyRzCWpRxPl3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxGBaQRWLdKLUzx7SrXZnLNSGFmI/ZIGlKVkve5IFqH3HReX0Kf6Jply
 5X9h1yzfHb2b1k4ZCogQKjxnwrZULl0sL8aYnYk1fEKKByzq9A7cnKo5hL1SulVQSj+KvKh/
 17+KX8lSSPl+ufZKfHF2vKJqZmHCex7EhYIFmXX9+/uZyLb4nCi0clLV+PRJWLRU2b9+aODY
 +RJzq6jbK1bzQgS64csQax2ya8e5sf0o+MIxApTA3iWPU+gDaltIyfa0JAX5LFN3LJQpSC/R
 lmLpotBIbyMNc68SAwRKQMpY/6tz/YRnjWOv/05LF+jvH18/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L13kG+X6NI3oMV7QcmqsbWIK72BA2zlxiYIDHDnOk6p+4dNgRYFIhJ
 SWZhfSeiu0ElFbCaXc6CVPEwfFZ2cYVoBlPwVIPewaJl97CiqNl1RFd621qHAFczxEB2ONvI
 Gl7cUZyIPzWrTtvgcFCWUGqGh1AW0LFqhCglQNRmT2LVVSsW0zMMHY5aLSE800u+m5BeiRWo
 eODw2H/XDe2JMz800Peg6K+RyAPmTCpyjD/pQ==
IronPort-HdrOrdr: A9a23:8qrP+q6t3hg8dRopwAPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860874"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 20/30] build: rework "clean" to clean from the root dir
Date: Tue, 25 Jan 2022 11:00:53 +0000
Message-ID: <20220125110103.3527686-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow "clean" to work from an out-of-tree build when
it will be available.

Some of the file been removed in current "clean" target aren't added
to $(clean-files) because they are already listed in $(extra-) or
$(extra-y).

Also start to clean files listed in $(targets). This allows to clean
"common/config_data.S" and "xsm/flask/flask-policy.S" without
having to list them a second time.

Also clean files in "arch/x86/boot" from that directory by allowing
"clean" to descend into the subdir by adding "boot" into $(subdir-).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - reviewed
    
    v8:
    - fix comment for the shorthand
    - move this patch earlier in the series
    - replace some BASEDIR by objtree
    - start to clean $(targets) files.

 xen/Makefile                | 24 ++++++++++++------------
 xen/arch/arm/Makefile       |  5 +----
 xen/arch/x86/Makefile       | 20 ++++++++++++--------
 xen/arch/x86/boot/Makefile  |  2 ++
 xen/common/Makefile         |  3 +--
 xen/include/Makefile        |  4 +---
 xen/scripts/Kbuild.include  |  4 ++--
 xen/scripts/Makefile.clean  | 14 +++++++++++---
 xen/test/livepatch/Makefile |  4 +---
 xen/xsm/flask/Makefile      |  4 +---
 10 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index b2df072d2a62..dc25fa443b82 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -409,18 +409,18 @@ _debug:
 
 .PHONY: _clean
 _clean:
-	$(MAKE) $(clean) tools
-	$(MAKE) $(clean) include
-	$(MAKE) $(clean) common
-	$(MAKE) $(clean) drivers
-	$(MAKE) $(clean) lib
-	$(MAKE) $(clean) xsm
-	$(MAKE) $(clean) crypto
-	$(MAKE) $(clean) arch/arm
-	$(MAKE) $(clean) arch/riscv
-	$(MAKE) $(clean) arch/x86
-	$(MAKE) $(clean) test
-	$(MAKE) $(clean) tools/kconfig
+	$(Q)$(MAKE) $(clean)=tools
+	$(Q)$(MAKE) $(clean)=include
+	$(Q)$(MAKE) $(clean)=common
+	$(Q)$(MAKE) $(clean)=drivers
+	$(Q)$(MAKE) $(clean)=lib
+	$(Q)$(MAKE) $(clean)=xsm
+	$(Q)$(MAKE) $(clean)=crypto
+	$(Q)$(MAKE) $(clean)=arch/arm
+	$(Q)$(MAKE) $(clean)=arch/riscv
+	$(Q)$(MAKE) $(clean)=arch/x86
+	$(Q)$(MAKE) $(clean)=test
+	$(Q)$(MAKE) $(clean)=tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3ce5f1674f6f..cecfaf4f3c0f 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -116,7 +116,4 @@ $(obj)/xen.lds: $(src)/xen.lds.S FORCE
 
 $(obj)/dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
-.PHONY: clean
-clean::
-	rm -f $(obj)/xen.lds
-	rm -f $(BASEDIR)/.xen-syms.[0-9]*
+clean-files := $(objtree)/.xen-syms.[0-9]*
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 60e802ba9503..bb57ed5096d5 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -77,6 +77,9 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 obj-y += sysctl.o
 endif
 
+# Allows "clean" to descend into boot/
+subdir- += boot
+
 extra-y += asm-macros.i
 extra-y += xen.lds
 
@@ -190,8 +193,8 @@ note_file :=
 endif
 note_file_option ?= $(note_file)
 
+extra-$(XEN_BUILD_PE) += efi.lds
 ifeq ($(XEN_BUILD_PE),y)
-extra-y += efi.lds
 $(TARGET).efi: $(BASEDIR)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/relocs-dummy.o $(obj)/efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
@@ -256,10 +259,11 @@ $(obj)/boot/mkelf32: $(src)/boot/mkelf32.c
 $(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
 
-.PHONY: clean
-clean::
-	rm -f *.lds boot/mkelf32
-	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
-	rm -f $(BASEDIR)/.xen-syms.[0-9]* $(BASEDIR)/.xen.elf32
-	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
-	rm -f boot/cmdline.S boot/reloc.S boot/*.lnk boot/*.bin
+clean-files := \
+    boot/mkelf32 \
+    include/asm/asm-macros.* \
+    $(objtree)/.xen-syms.[0-9]* \
+    $(objtree)/.xen.elf32 \
+    $(objtree)/.xen.efi.[0-9]* \
+    efi/*.efi \
+    efi/mkreloc
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ba732e4a88c3..1ac8cb435e0e 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -21,3 +21,5 @@ $(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
 
 $(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS) $(src)/build32.lds
 	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
+
+clean-files := cmdline.S reloc.S *.lnk *.bin
diff --git a/xen/common/Makefile b/xen/common/Makefile
index ca839118e4d1..dc8d3a13f5b8 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -84,5 +84,4 @@ $(obj)/config_data.S: $(BASEDIR)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
 
-clean::
-	rm -f config_data.S config.gz 2>/dev/null
+clean-files := config.gz
diff --git a/xen/include/Makefile b/xen/include/Makefile
index cd40d5b4c923..a3c2511f5f60 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -131,6 +131,4 @@ lib-x86-all:
 all: lib-x86-all
 endif
 
-clean::
-	rm -rf compat config generated headers*.chk
-	rm -f $(BASEDIR)/include/xen/lib/x86/cpuid-autogen.h
+clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index ed48fb39f1f1..6e7a403b353c 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -99,8 +99,8 @@ build := -f $(srctree)/Rules.mk obj
 
 # Shorthand for $(MAKE) clean
 # Usage:
-# $(MAKE) $(clean) dir
-clean := -f $(BASEDIR)/scripts/Makefile.clean clean -C
+# $(Q)$(MAKE) $(clean)=dir
+clean := -f $(srctree)/scripts/Makefile.clean obj
 
 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index c2689d4af5fa..4eed31974509 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -3,7 +3,6 @@
 # Cleaning up
 # ==========================================================================
 
-obj := .
 src := $(obj)
 
 clean::
@@ -17,11 +16,20 @@ include $(src)/Makefile
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
+subdir-all := $(addprefix $(obj)/,$(subdir-all))
+
 __clean-files := \
     $(clean-files) $(hostprogs-y) $(hostprogs-) \
+    $(extra-y) $(extra-) $(targets) \
     $(hostprogs-always-y) $(hostprogs-always-)
 
-__clean-files := $(wildcard $(__clean-files))
+# clean-files is given relative to the current directory, unless it
+# starts with $(objtree)/ (which means "./", so do not add "./" unless
+# you want to delete a file from the toplevel object directory).
+
+__clean-files := $(wildcard \
+		   $(addprefix $(obj)/, $(filter-out /% $(objtree)/%, $(__clean-files))) \
+		   $(filter /% $(objtree)/%, $(__clean-files)))
 
 .PHONY: clean
 clean:: $(subdir-all)
@@ -35,6 +43,6 @@ endif
 
 PHONY += $(subdir-all)
 $(subdir-all):
-	$(MAKE) $(clean) $@
+	$(Q)$(MAKE) $(clean)=$@
 
 .PHONY: $(PHONY)
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index adb484dc5d2c..e6fee84b69da 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -160,6 +160,4 @@ install: $(addprefix $(obj)/,$(LIVEPATCHES))
 uninstall:
 	cd $(DESTDIR)$(LIVEPATCH_DEBUG_DIR) && rm -f $(LIVEPATCHES)
 
-.PHONY: clean
-clean::
-	rm -f *.livepatch config.h expect_config.h
+clean-files := config.h expect_config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 832f65274cc0..4ac6fb8778ae 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -49,6 +49,4 @@ $(obj)/policy.bin: FORCE
 	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
 	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
 
-.PHONY: clean
-clean::
-	rm -f $(ALL_H_FILES) policy.* $(POLICY_SRC) flask-policy.S
+clean-files := policy.* $(POLICY_SRC)
-- 
Anthony PERARD


