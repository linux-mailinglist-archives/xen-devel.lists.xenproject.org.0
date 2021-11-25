Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5C45DB90
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231308.400334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6P-0000iE-Vh; Thu, 25 Nov 2021 13:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231308.400334; Thu, 25 Nov 2021 13:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6P-0000ZX-4Q; Thu, 25 Nov 2021 13:47:53 +0000
Received: by outflank-mailman (input) for mailman id 231308;
 Thu, 25 Nov 2021 13:47:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0A-0007NX-5Z
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611e7cb7-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:24 +0100 (CET)
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
X-Inumbo-ID: 611e7cb7-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObpVRqOSVUZVbZvKGeecU4tcVcjIvrlnjGlAoQ30NGE=;
  b=Qza5s+vYB9/u2LpE52KTQkcRfYF3dwZlEMDW7RJ4Wfe3PHyd4IXWOL/c
   l/i2ihkEFR/Bez+xV/kH9IPF2tv7Na7R9dbdzx7XYsN7rT3LUxURZqYhZ
   qEuUb57u9z0PYB7T+aETLtd3iTIC8RdBBTtdoIDgxY36fJ3uHc6xlx3vG
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +CeJllXYb1/n54e25C6MAweqAlhFeSD7maoeJInops44rxq6go37uZC2dOpOjSJEWlgGnnFetu
 9TA13vmjsvW8f9hZ7VsZECaUDD/FHT+slYZ8SBJGa6ZBPeVB3h76WWI21iRBJtnMT13i4Dg/qW
 VG/RzdN/76vEpt1ddGleD2BBx+guR0yWhGeaB01eD5Za8HwWcaM+vnoGo/dHh40YS3pMXeyRxr
 RlynoO7Tx3OF8YNBvvBIf8Wff8Eu6kublz9H8Q0IcYA3MIsaM1c+ArsfBg60D2lb8tMD9ddZe/
 U0RW3h9/U3xonQVQ3U5M2TL+
X-SBRS: 5.1
X-MesageID: 58135473
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bY3KEql69tpLo1WFVlKqWFjo5gz/IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCjuPa/yKMGuhfIxwOovkpBlUvJSDyd5hHAY5pS5jESMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ilsn82LCh4xB7znh+QWdQVyATphIrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKaHP
 JdFNmEHgBLoSjBqH1keCYoCtb2xhELGWA12hFuVnP9ii4TU5FMoi+W8WDbPQfSASN9JhE+eq
 iTD9n7gHxABHNWFzHyO9XfErtHImST3SYcDDoqS//RhgECQ7mELARhQXly+ydG6jUikUt4ZN
 E0Q+QIpt6E58EHtRd74NzW0uGWBvwIcc9NIHvcm9RqWza7J/weeAHNCRTlEAPQqu8M7SiYj/
 kOYlNPuQzp0ufuaTmz13qiQhSO/P24SN2BqTS4bTyMV7t/7uoYxgxnTCNF5H8adntDzXD393
 T2OhCw/nKkIy94G0b2h+lLKiC7qoYLGJiY37AjKWmOu7itieZWoIYev7DDz9u1cJYyUSl2Au
 nksmMWE6u0KS5aXm0SlQvgJHbyvz+aINnvbm1EHInU6323zoTj5J9kWuWwgYhcyWioZRdP3S
 BPyk1Jqp4ZLBWqBcq98RZ6bGd810re1QLwJScvoRtZJZ5FwciqO8ydveVOc0gjRraQ8rU0sE
 czFKJjxVB72HYwilWPrHLlFjdfH0whnnTuLLa0X2ShLxlZ3iJS9bb4eeGWDYekihE9viFWEq
 o0PXydmJvg2bQEfXsU12dJMRbzpBSJibXwTlyCwXrTeSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUMS88N+K/Dccl8yNT0ckQ0bGAgSZLXGpSxP1HK8tfkUcPqISPMsKYv
 9FaIp7dU5yjuxzM+igHbImVkWCRXE/DuO56BAL8OGJXV8c5H2Tho4a4FiOypHhmJnfm7qMW/
 uz/vj43tLJeHmyO+u6NM6nxp75w1FBA8N9Ps7zgfoMOJR6yqdcycEQcTJYfeqkxFPkK/RPCv
 y7+PPvSjbOlT1Yd/IabiKaagZ2uFuciTENWE3OCteS9NDXA/3rlyohFCb7acTfYXWLy2aOje
 eQKkK2sbKxZxA5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiEYZu3EFMYKAc/QP6E0PUYxmvb4fgveR2o7y5r5ruXF05VOkDU2iBaKbJ0NqIjw
 Psg55FKu1Du1EJyP4/f3C5O9mmKIngRaIkdt8kXUN3xlw4m6lBeepiAWCX4146CNodXOU4wL
 z7K2Keb3+ZAxlDPemYYHGTW2bYPnowHvR1HwQNQJ1mNndaZ1PY70AcIrGYyRwVRiB5Gz/hyK
 i5gMEgsffeC+DJhhc5iWWGwGl4eWE3FqxKpk1ZZxnfES0SIV3DWKDxvMOmAy0kV7mZAc2UJ5
 7qf0mvkDW7nccyZMvHegqK5RygPleBMyzA=
IronPort-HdrOrdr: A9a23:phGQ26xlNbIkAKNOYXLnKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135473"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 23/47] build: rework "clean" to clean from the root dir
Date: Thu, 25 Nov 2021 13:39:42 +0000
Message-ID: <20211125134006.1076646-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
---

Notes:
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
index 86bcedd7fa5b..deae319c8a5a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -412,18 +412,18 @@ _debug:
 
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
index 0b0ef6205bc1..243ca17f701e 100644
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
index 79b42e1252d6..d56bf7d4a452 100644
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


