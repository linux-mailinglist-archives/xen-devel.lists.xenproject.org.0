Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6192FF99A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72504.130618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjk-0002u1-UT; Fri, 22 Jan 2021 00:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72504.130618; Fri, 22 Jan 2021 00:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjk-0002tC-Mj; Fri, 22 Jan 2021 00:55:40 +0000
Received: by outflank-mailman (input) for mailman id 72504;
 Fri, 22 Jan 2021 00:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kji-0002iW-EL
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:38 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22bb350b-2e21-4263-8a05-8a80ead6394b;
 Fri, 22 Jan 2021 00:55:25 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id e6so2793580pjj.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:25 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:23 -0800 (PST)
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
X-Inumbo-ID: 22bb350b-2e21-4263-8a05-8a80ead6394b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CUrUIp2nr5HFpIKPdSilgMoZr/i+RyO/jU6qwu1vQsI=;
        b=cFjptHHy5hLsxzrzDnFVN+Q0YzRFDFvOaqlB7Rd0qJGTQFaR2+vxGzYrnTCiYU87ZS
         1ADA9spv+W6Pw8J5NTwVDFBdcV4kCpTEylz6E7YUBnFx1DnMR7FLgnGruHrUrsNkFY7c
         dPeqTfGuopmKBUzhAvtOOZG+m+AWII4+Y+1+RZ1tY3OpT9vDBCNEwXRkk/iAow0SCdcI
         Y/cz8Q50Vypg4JGaN73hxW5D23IC4B8M+JF3TueZiPxSLSIpMpQFdzn/tSYCLmYDtIDo
         YWGTGTsP6bwJHMPNdUelWjmwuxqFJSDmw60KtkJzpLihOGgvNw7PVXzbKB7sDGTDe678
         KDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CUrUIp2nr5HFpIKPdSilgMoZr/i+RyO/jU6qwu1vQsI=;
        b=AITyyS8fa+DhGAEgBqfszvcNSfkl8PCpS8MBt93dDhE7KdexWcqc3yyhtYpwAR3tg8
         edq1u33qs4Ftvow8mD8dTlRaK53UVSrxLAoNM/8dBfdzEd1QOWXCwrd9nPgK2tvIShBY
         VvEfPIqKe/+tp5K30OY+p8lOWLSpEKB1aO9mPIwxITtp57NpesSOV/Z50xTBU719nYQE
         dFoNqwMvudELjfJV7PaqZTBCSEdf8F+UI9Zk/mW6kn3pBGwJfS0xvkWJB9pK7m1UF1qw
         Ed6jtXgm9NkBuIzngSRblG3/4vweD6gOrNKolcwPewM5Fdtb+ukhd3B9TMJ9XOamuAqe
         Q7Sw==
X-Gm-Message-State: AOAM5325gOtmP35OcnYjr2jO3fA68kbFY8V0/9ctHWpn/1i48LkWKjkk
	hMMEaIR9fpgrzSVKdxi6ENvMl9vvaLU/F6bb
X-Google-Smtp-Source: ABdhPJwXbvyZ7Ic+ePA6vA/bX8y0cAjvhwuS1lRLsSHApwADJfc2jWd7EZ0rU67xMNqhKaFtDaU5dQ==
X-Received: by 2002:a17:902:7e83:b029:de:6496:cad9 with SMTP id z3-20020a1709027e83b02900de6496cad9mr2090578pla.21.1611276924284;
        Thu, 21 Jan 2021 16:55:24 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
Date: Thu, 21 Jan 2021 16:51:41 -0800
Message-Id: <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Kiper <daniel.kiper@oracle.com>

This patch introduces xen.mb.efi which contains a manually built PE
header.

This allows us to support Xen on UEFI Secure Boot-enabled hosts via
multiboot2.

xen.mb.efi is a single binary that is loadable by a UEFI loader or via
the Multiboot/Multiboot2 protocols.

Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
---
 xen/Makefile                |  20 +++---
 xen/arch/x86/Makefile       |   7 +-
 xen/arch/x86/arch.mk        |   2 +
 xen/arch/x86/boot/Makefile  |   1 +
 xen/arch/x86/boot/head.S    |   1 +
 xen/arch/x86/boot/pecoff.S  | 123 ++++++++++++++++++++++++++++++++++++
 xen/arch/x86/efi/efi-boot.h |  24 ++++++-
 xen/arch/x86/efi/stub.c     |  12 +++-
 xen/arch/x86/xen.lds.S      |  34 ++++++++++
 xen/include/xen/efi.h       |   1 +
 10 files changed, 212 insertions(+), 13 deletions(-)
 create mode 100644 xen/arch/x86/boot/pecoff.S

diff --git a/xen/Makefile b/xen/Makefile
index 85f9b763a4..9c689c2095 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -266,29 +266,31 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
+define install_xen_links
+	$(INSTALL_DATA) $(TARGET)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION)$1
+	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION)$1
+	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION)$1
+	ln -f -s $(T)-$(XEN_FULLVERSION)$1 $(D)$(BOOT_DIR)/$(T)$1
+endef
+
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
 _install: Z=$(CONFIG_XEN_INSTALL_SUFFIX)
 _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 	[ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)
-	$(INSTALL_DATA) $(TARGET)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION)$(Z)
-	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION)$(Z)
-	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)-$(XEN_VERSION)$(Z)
-	ln -f -s $(T)-$(XEN_FULLVERSION)$(Z) $(D)$(BOOT_DIR)/$(T)$(Z)
+	$(call install_xen_links,$(Z))
+	$(call install_xen_links,.mb.efi)
 	[ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)
 	$(INSTALL_DATA) $(TARGET)-syms $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION)
 	$(INSTALL_DATA) $(TARGET)-syms.map $(D)$(DEBUG_DIR)/$(T)-syms-$(XEN_FULLVERSION).map
 	$(INSTALL_DATA) $(KCONFIG_CONFIG) $(D)$(BOOT_DIR)/$(T)-$(XEN_FULLVERSION).config
 	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
 		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
-		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
 		if [ -e $(TARGET).efi.map ]; then \
 			$(INSTALL_DATA) $(TARGET).efi.map $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.map; \
 		fi; \
-		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
-		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
-		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
+		$(call install_xen_links,.efi)) \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
@@ -341,7 +343,7 @@ _clean: delete-unfresh-files
 	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
-	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
+	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET)*.efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f include/asm-*/asm-offsets.h
 	rm -f .banner
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 7769bb40d7..49c61adabf 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -110,7 +110,7 @@ syms-warn-dup-$(CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS) :=
 syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --error-dup
 
 $(TARGET): TMP = $(@D)/.$(@F).elf32
-$(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
+$(TARGET): $(TARGET).mb.efi $(TARGET)-syms $(efi-y) boot/mkelf32
 	./boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
 	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
 	od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
@@ -119,6 +119,11 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
 		{ echo "No Multiboot2 header found" >&2; false; }
 	mv $(TMP) $(TARGET)
 
+$(TARGET).mb.efi: $(TARGET)-syms
+	$(OBJCOPY) -O binary -S --change-section-address \
+		".efi.pe.header-`$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __image_base__$$/0x\1/p'`" \
+		$(TARGET)-syms $(TARGET).mb.efi
+
 ifneq ($(efi-y),)
 # Check if the compiler supports the MS ABI.
 export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index ce0c1a0e7f..073343d8ea 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -7,6 +7,8 @@ CFLAGS += -I$(BASEDIR)/include
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-generic
 CFLAGS += -I$(BASEDIR)/include/asm-x86/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
+CFLAGS += -DXEN_LOAD_ALIGN=XEN_IMG_OFFSET
+CFLAGS += -DXEN_FILE_ALIGN=0x20
 
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 9b31bfcbfb..a559a75e0b 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,4 +1,5 @@
 obj-bin-y += head.o
+obj-bin-y += pecoff.o
 
 DEFS_H_DEPS = defs.h $(BASEDIR)/include/xen/stdbool.h
 
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 150f7f90a2..2987b4f03a 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -1,3 +1,4 @@
+#include <xen/compile.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
 #include <public/xen.h>
diff --git a/xen/arch/x86/boot/pecoff.S b/xen/arch/x86/boot/pecoff.S
new file mode 100644
index 0000000000..fa821f42c1
--- /dev/null
+++ b/xen/arch/x86/boot/pecoff.S
@@ -0,0 +1,123 @@
+#include <xen/compile.h>
+#include <asm/page.h>
+
+#define sym_offs(sym)     ((sym) - __XEN_VIRT_START)
+
+        .section .efi.pe.header, "a", @progbits
+
+GLOBAL(efi_pe_head)
+        /*
+         * Legacy EXE header.
+         *
+         * Most of it is copied from binutils package, version 2.30,
+         * include/coff/pe.h:struct external_PEI_filehdr and
+         * bfd/peXXigen.c:_bfd_XXi_only_swap_filehdr_out().
+         *
+         * Page is equal 512 bytes here.
+         * Paragraph is equal 16 bytes here.
+         */
+        .short  0x5a4d                               /* EXE magic number. */
+        .short  0x90                                 /* Bytes on last page of file. */
+        .short  0x3                                  /* Pages in file. */
+        .short  0                                    /* Relocations. */
+        .short  0x4                                  /* Size of header in paragraphs. */
+        .short  0                                    /* Minimum extra paragraphs needed. */
+        .short  0xffff                               /* Maximum extra paragraphs needed. */
+        .short  0                                    /* Initial (relative) SS value. */
+        .short  0xb8                                 /* Initial SP value. */
+        .short  0                                    /* Checksum. */
+        .short  0                                    /* Initial IP value. */
+        .short  0                                    /* Initial (relative) CS value. */
+        .short  0x40                                 /* File address of relocation table. */
+        .short  0                                    /* Overlay number. */
+        .fill   4, 2, 0                              /* Reserved words. */
+        .short  0                                    /* OEM identifier. */
+        .short  0                                    /* OEM information. */
+        .fill   10, 2, 0                             /* Reserved words. */
+        .long   Lpe_header - efi_pe_head             /* File address of the PE header. */
+
+Lpe_header:
+        /*
+         * PE/COFF header.
+         *
+         * The PE/COFF format is defined by Microsoft, and is available from
+         * https://docs.microsoft.com/en-us/windows/win32/debug/pe-format
+         *
+         * Some ideas are taken from Linux kernel and Xen ARM64.
+         */
+        .ascii  "PE\0\0"                             /* PE signature. */
+        .short  0x8664                               /* Machine: IMAGE_FILE_MACHINE_AMD64 */
+        .short  1                                    /* NumberOfSections. */
+        .long   XEN_COMPILE_POSIX_TIME               /* TimeDateStamp. */
+        .long   0                                    /* PointerToSymbolTable. */
+        .long   0                                    /* NumberOfSymbols. */
+        .short  Lsection_table - Loptional_header      /* SizeOfOptionalHeader. */
+        .short  0x226                                /* Characteristics:
+                                                      *   IMAGE_FILE_EXECUTABLE_IMAGE |
+                                                      *   IMAGE_FILE_LARGE_ADDRESS_AWARE |
+                                                      *   IMAGE_FILE_DEBUG_STRIPPED |
+                                                      *   IMAGE_FILE_LINE_NUMS_STRIPPED
+                                                      */
+
+Loptional_header:
+        .short  0x20b                                /* PE format: PE32+ */
+        .byte   0                                    /* MajorLinkerVersion. */
+        .byte   0                                    /* MinorLinkerVersion. */
+        .long   __2M_rwdata_end - efi_pe_head_end    /* SizeOfCode. */
+        .long   0                                    /* SizeOfInitializedData. */
+        .long   0                                    /* SizeOfUninitializedData. */
+        .long   sym_offs(efi_mb_start)               /* AddressOfEntryPoint. */
+        .long   sym_offs(start)                      /* BaseOfCode. */
+        .quad   sym_offs(__image_base__)             /* ImageBase. */
+        .long   XEN_LOAD_ALIGN                       /* SectionAlignment. */
+        .long   XEN_FILE_ALIGN                       /* FileAlignment. */
+        .short  2                                    /* MajorOperatingSystemVersion. */
+        .short  0                                    /* MinorOperatingSystemVersion. */
+        .short  XEN_VERSION                          /* MajorImageVersion. */
+        .short  XEN_SUBVERSION                       /* MinorImageVersion. */
+        .short  2                                    /* MajorSubsystemVersion. */
+        .short  0                                    /* MinorSubsystemVersion. */
+        .long   0                                    /* Win32VersionValue. */
+        .long   __pe_SizeOfImage                     /* SizeOfImage. */
+        .long   efi_pe_head_end - efi_pe_head        /* SizeOfHeaders. */
+        .long   0                                    /* CheckSum. */
+        .short  0xa                                  /* Subsystem: EFI application. */
+        .short  0                                    /* DllCharacteristics. */
+        .quad   0                                    /* SizeOfStackReserve. */
+        .quad   0                                    /* SizeOfStackCommit. */
+        .quad   0                                    /* SizeOfHeapReserve. */
+        .quad   0                                    /* SizeOfHeapCommit. */
+        .long   0                                    /* LoaderFlags. */
+        .long   0x6                                  /* NumberOfRvaAndSizes. */
+
+        /* Data Directories. */
+        .quad   0                                    /* Export Table. */
+        .quad   0                                    /* Import Table. */
+        .quad   0                                    /* Resource Table. */
+        .quad   0                                    /* Exception Table. */
+        .quad   0                                    /* Certificate Table. */
+        .quad   0                                    /* Base Relocation Table. */
+
+Lsection_table:
+        .ascii  ".text\0\0\0"                        /* Name. */
+        .long   __2M_rwdata_end - efi_pe_head_end    /* VirtualSize. */
+        .long   sym_offs(start)                      /* VirtualAddress. */
+        .long   __pe_text_raw_end - efi_pe_head_end  /* SizeOfRawData. */
+        .long   efi_pe_head_end - efi_pe_head        /* PointerToRawData. */
+        .long   0                                    /* PointerToRelocations. */
+        .long   0                                    /* PointerToLinenumbers. */
+        .short  0                                    /* NumberOfRelocations. */
+        .short  0                                    /* NumberOfLinenumbers. */
+        .long   0xe0500020                           /* Characteristics:
+                                                      *   IMAGE_SCN_CNT_CODE |
+                                                      *   IMAGE_SCN_ALIGN_16BYTES |
+                                                      *   IMAGE_SCN_MEM_EXECUTE |
+                                                      *   IMAGE_SCN_MEM_READ |
+                                                      *   IMAGE_SCN_MEM_WRITE
+                                                      */
+
+        .align XEN_FILE_ALIGN
+GLOBAL(efi_pe_head_end)
+
+        .text
+
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 2541ba1f32..f694a069c9 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -32,7 +32,8 @@ static void __init edd_put_string(u8 *dst, size_t n, const char *src)
 }
 #define edd_put_string(d, s) edd_put_string(d, ARRAY_SIZE(d), s)
 
-extern const intpte_t __page_tables_start[], __page_tables_end[];
+extern intpte_t __page_tables_start[], __page_tables_end[];
+
 #define in_page_tables(v) ((intpte_t *)(v) >= __page_tables_start && \
                            (intpte_t *)(v) < __page_tables_end)
 
@@ -568,6 +569,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
 
 static void __init efi_arch_memory_setup(void)
 {
+    intpte_t *pte;
     unsigned int i;
     EFI_STATUS status;
 
@@ -592,6 +594,13 @@ static void __init efi_arch_memory_setup(void)
     if ( !efi_enabled(EFI_LOADER) )
         return;
 
+    if ( efi_enabled(EFI_MB_LOADER) )
+        for ( pte = __page_tables_start; pte < __page_tables_end; pte += ARRAY_SIZE(l2_directmap) )
+            /* Skip relocating the directmap because start_xen() does this for us when
+             * when it updates all superpage-aligned mappings.  */
+            if ( (pte != (intpte_t *)l2_directmap) && (get_pte_flags(*pte) & _PAGE_PRESENT) )
+                *pte += xen_phys_start;
+
     /*
      * Map Xen into the higher mappings, using 2M superpages.
      *
@@ -724,7 +733,18 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
 
 static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
 
-void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+void EFIAPI efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
+
+void EFIAPI __init noreturn
+efi_mb_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
+{
+    __set_bit(EFI_MB_LOADER, &efi_flags);
+    efi_start(ImageHandle, SystemTable);
+}
+
+void __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                           EFI_SYSTEM_TABLE *SystemTable,
+                           multiboot2_tag_module_t *dom0_kernel)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     UINTN cols, gop_mode = ~0, rows;
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 9984932626..9bd6355ec3 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -15,9 +15,19 @@
  * Here we are in EFI stub. EFI calls are not supported due to lack
  * of relevant functionality in compiler and/or linker.
  *
- * efi_multiboot2() is an exception. Please look below for more details.
+ * efi_mb_start() and efi_multiboot2() are the exceptions.
+ * Please look below for more details.
  */
 
+asm (
+    "    .text                         \n"
+    "    .globl efi_mb_start           \n"
+    "efi_mb_start:                     \n"
+    "    mov    %rcx,%rdi              \n"
+    "    mov    %rdx,%rsi              \n"
+    "    call   efi_multiboot2         \n"
+    );
+
 void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
                                     EFI_SYSTEM_TABLE *SystemTable)
 {
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 0273f79152..a58ae1e491 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -63,7 +63,22 @@ SECTIONS
 
   start_pa = ABSOLUTE(start - __XEN_VIRT_START);
 
+#ifdef EFI
   . = __XEN_VIRT_START + XEN_IMG_OFFSET;
+#else
+  /*
+   * Multiboot2 with an EFI PE/COFF header.
+   *
+   * The PE header must be followed by .text section which
+   * starts at __XEN_VIRT_START + XEN_IMG_OFFSET address.
+   */
+  . = __XEN_VIRT_START + XEN_IMG_OFFSET - efi_pe_head_end + efi_pe_head;
+
+  DECL_SECTION(.efi.pe.header) {
+       *(.efi.pe.header)
+  } :NONE
+#endif
+
   _start = .;
   DECL_SECTION(.text) {
         _stext = .;            /* Text and read-only data */
@@ -289,6 +304,13 @@ SECTIONS
        *(.data.rel)
        *(.data.rel.*)
        CONSTRUCTORS
+       /*
+        * A la the PE/COFF spec, the PE file data section must end at the
+        * alignment boundary equal to FileAlignment in the optional header,
+        * i.e., XEN_FILE_ALIGN.
+        */
+       . = ALIGN(XEN_FILE_ALIGN);
+       __pe_text_raw_end = .;
   } :text
 
   DECL_SECTION(.bss) {
@@ -312,6 +334,8 @@ SECTIONS
   . = ALIGN(SECTION_ALIGN);
   __2M_rwdata_end = .;
 
+  __pe_SizeOfImage = ALIGN(. - __image_base__, MB(16));
+
 #ifdef EFI
   . = ALIGN(4);
   DECL_SECTION(.reloc) {
@@ -341,6 +365,7 @@ SECTIONS
        *(.discard.*)
        *(.eh_frame)
 #ifdef EFI
+       *(.efi.pe.header)
        *(.comment)
        *(.comment.*)
        *(.note.Xen)
@@ -392,5 +417,14 @@ ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SPACE_MIN,
 ASSERT((wakeup_stack - wakeup_stack_start) >= WAKEUP_STACK_MIN,
     "wakeup stack too small")
 
+#ifndef EFI
+ASSERT(efi_pe_head_end == _start, "PE header does not end at the beginning of .text section")
+ASSERT(_start == __XEN_VIRT_START + XEN_IMG_OFFSET, ".text section begins at wrong address")
+ASSERT(IS_ALIGNED(_start,      XEN_FILE_ALIGN), "_start misaligned")
+ASSERT(IS_ALIGNED(__bss_start, XEN_FILE_ALIGN), "__bss_start misaligned")
+ASSERT(IS_ALIGNED(__pe_SizeOfImage, XEN_LOAD_ALIGN), "__pe_SizeOfImage is not multiple of XEN_LOAD_ALIGN")
+ASSERT(XEN_LOAD_ALIGN >= XEN_FILE_ALIGN, "XEN_LOAD_ALIGN < XEN_FILE_ALIGN")
+#endif
+
 /* Plenty of boot code assumes that Xen isn't larger than 16M. */
 ASSERT(_end - _start <= MB(16), "Xen too large for early-boot assumptions")
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f9..f7f92b4e3d 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -11,6 +11,7 @@ extern unsigned int efi_flags;
 #define EFI_BOOT	0	/* Were we booted from EFI? */
 #define EFI_LOADER	1	/* Were we booted directly from EFI loader? */
 #define EFI_RS		2	/* Can we use runtime services? */
+#define EFI_MB_LOADER	4	/* xen.mb.efi booted directly from EFI loader? */
 
 /* Add fields here only if they need to be referenced from non-EFI code. */
 struct efi {
-- 
2.30.0


