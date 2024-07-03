Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4A924C99
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 02:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752678.1160879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOnVJ-00068b-GU; Wed, 03 Jul 2024 00:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752678.1160879; Wed, 03 Jul 2024 00:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOnVJ-00065U-DK; Wed, 03 Jul 2024 00:05:45 +0000
Received: by outflank-mailman (input) for mailman id 752678;
 Wed, 03 Jul 2024 00:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TM78=OD=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sOnVH-00065O-F3
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 00:05:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc11a12b-38cf-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 02:05:41 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b3fee65d8so1908819a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 17:05:41 -0700 (PDT)
Received: from Xen-host.myguest.virtualbox.org ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf58cc0sm458535666b.47.2024.07.02.17.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 17:05:39 -0700 (PDT)
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
X-Inumbo-ID: fc11a12b-38cf-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719965140; x=1720569940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WNgodCAII7HiRsiU65qxSm/VeVdZnfB2Aq4uZkghcE=;
        b=QfrN5EmUX9kF24JFiZO6ko4nS1yLmISMUWOtonExVeTzysDEGkfVSNEC8IZ45UiL6q
         WZOovODPHQ9sMYQvACGbMzStp6Yfwm4Q1kNh3x15UY2jeFUNLH6Wj/h/qOGNl9ZrTFku
         KTah1C2KsjgUUyzF5PpvLYRWhIN9RKgKbskOsaNj7ewDIoKKTxEVeOMjjb44Z3NUjVoS
         MWDE3S4eCFm5NBBlIVpLV5vrlTTWm8091KqwadNgJk8NeHOeF3ScD3KWluYQdyf+Y0W5
         T1uy7s3isK8xgGFq2g04iWbufRx42beovFE6NxcxzWK9vt/i8St6j/Ib6xbWbuNuI6Ae
         GP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719965140; x=1720569940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WNgodCAII7HiRsiU65qxSm/VeVdZnfB2Aq4uZkghcE=;
        b=ehQP3yFywH3POHfNVKb0sew6b2kqYKP2aQpmqz9EtdgZ6Ae0dtXtWSCiyi9xBXb+/g
         ApZlpgaKH7xSjYZmY8BDyC26ogR6HcwOQILHmF9lC4+V6kZHsC7TvdpgyrZOtIUvTGjl
         2L0BjtiUfCOktCpmgaJ2fPik8sjhyQHj12V6o4g0iO17djNefQBWCnpy4srAA9MvJKwz
         OIGT7vO2IRLmjgldAU9bE5338rIWy4pVsvEi/IL3qa3kUXf9zkMwfBsVBfsDMxbzBAhx
         vY8htjGonK82EbSNTvvO+MCBPMHhI9LdvoaqyezCAjExUdyAWmLLyYOO9s4Ei1Et4SyJ
         IRRw==
X-Gm-Message-State: AOJu0Yw9H6ViJEurHVX3W5kQmlgXrKoPhdMJSlBh489tv3H6kZ+i4HnN
	/3XeY92df1YsMUbVJiOKp61saFX1KoHEwmbHVrW7qwb+BQK88NqgvWukV+2Z
X-Google-Smtp-Source: AGHT+IGnyegKOnsVxaysW422iRGuVgNZtwGSHz+yvt9UoXFAeE4/BSePsT+inq6CtE5wJCkqRG2SKQ==
X-Received: by 2002:a17:906:b858:b0:a72:6416:5cba with SMTP id a640c23a62f3a-a7514438b2emr605895966b.19.1719965139861;
        Tue, 02 Jul 2024 17:05:39 -0700 (PDT)
From: Milan Djokic <milandjokic1995@gmail.com>
X-Google-Original-From: Milan Djokic <milan.djokic@rt-rk.com>
To: xen-devel@lists.xenproject.org
Cc: milan.djokic@rt-rk.com,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Nikola Jelic <nikola.jelic@rt-rk.com>
Subject: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
Date: Wed,  3 Jul 2024 02:04:38 +0200
Message-Id: <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
References: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added riscv image header to enable boot from second stage bootloaders (e.g. uboot. Image header defined in riscv-image-header.h)
Additionally, RISC-V xen image is extended with PE/COFF headers, introducing EFI application format.
PE/COFF header is optionally included (with CONFIG_RISCV_EFI) so
both plain ELF and image with PE/COFF header can now be generated as build artifacts.
Note that this patch represents initial EFI application format support (image
contains EFI application header embeded into binary when CONFIG_RISCV_EFI
is enabled). For full EFI application Xen support, boot/runtime services
and system table handling are yet to be implemented.

Tested on both QEMU and StarFive VisionFive 2 with OpenSBI->U-Boot->xen->dom0 boot chain.

Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>

---
Changes since v3:
  * pe.h structures clarification
---
Changes since v2:
  * Restructured EFI image headers - generic PE/COFF headers moved to xen/include/efi/pe.h, riscv image header left in arch specific dir (riscv/include/asm/riscv-image-header.h)
  * EFI PE/COFF header section moved to separate file (efi-header.S) and optionally included into image (head.S) if CONFIG_RISCV_EFI is enabled
  * Removed explicit usage of compressed (c.*) instructions where not necessary to avoid dependency on C extension.
  * Removed redundant parts of code which were originally taken over from linux kernel, but not used in this case
(data directories definition in optional PE header, _init_end_efi in linker script)
  * Removed nested code, explained pe header fields mapping and current EFI support status
  * Clarified riscv image header which is inserted into image regardless EFI option value (in order to support boot from second stage bootloaders for both ELF and EFI image format)
---
Changes since v1 (following review comments from Jan Beulich):
  * Fix coding style
  * Extended image header with all the necessary
    PE/COFF (EFI) fields (instead of only those used by U-boot)
  * Removed usage of deprecated types
---
 xen/arch/riscv/Kconfig                        |  10 +
 .../riscv/include/asm/riscv-image-header.h    |  57 +++
 xen/arch/riscv/riscv64/efi-header.S           |  99 ++++
 xen/arch/riscv/riscv64/head.S                 |  45 +-
 xen/arch/riscv/xen.lds.S                      |   3 +
 xen/include/efi/pe.h                          | 458 ++++++++++++++++++
 6 files changed, 670 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/riscv-image-header.h
 create mode 100644 xen/arch/riscv/riscv64/efi-header.S
 create mode 100644 xen/include/efi/pe.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..ec1e2b1386 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -9,6 +9,16 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config RISCV_EFI
+	bool "UEFI boot service support"
+	depends on RISCV_64 && RISCV_ISA_C
+	help
+	  This option provides support for boot services through
+	  UEFI firmware. A UEFI stub is provided to allow Xen to
+	  be booted as an EFI application. Currently, only EFI PE/COFF application
+	  header is included into RISC-V image. Boot/Runtime services as part
+	  of EFI application stub are yet to be implemented.
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/include/asm/riscv-image-header.h b/xen/arch/riscv/include/asm/riscv-image-header.h
new file mode 100644
index 0000000000..eebca47620
--- /dev/null
+++ b/xen/arch/riscv/include/asm/riscv-image-header.h
@@ -0,0 +1,57 @@
+#ifndef _ASM_RISCV_IMAGE_H
+#define _ASM_RISCV_IMAGE_H
+
+#define RISCV_IMAGE_MAGIC  "RISCV\0\0\0"
+#define RISCV_IMAGE_MAGIC2 "RSC\x05"
+
+#define RISCV_IMAGE_FLAG_BE_SHIFT 0
+
+#define RISCV_IMAGE_FLAG_LE 0
+#define RISCV_IMAGE_FLAG_BE 1
+
+#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
+
+#define __HEAD_FLAG(field)                                                     \
+    (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##field##_SHIFT)
+
+#define __HEAD_FLAGS (__HEAD_FLAG(BE))
+
+#define RISCV_HEADER_VERSION_MAJOR 0
+#define RISCV_HEADER_VERSION_MINOR 2
+
+#define RISCV_HEADER_VERSION                                                   \
+    (RISCV_HEADER_VERSION_MAJOR << 16 | RISCV_HEADER_VERSION_MINOR)
+
+#ifndef __ASSEMBLY__
+/**
+ * struct riscv_image_header - riscv image header
+ * @code0:      Executable code
+ * @code1:      Executable code
+ * @text_offset:    Image load offset (little endian)
+ * @image_size:     Effective Image size (little endian)
+ * @flags:      kernel flags (little endian)
+ * @version:    version
+ * @res1:       reserved
+ * @res2:       reserved
+ * @magic:      Magic number (RISC-V specific; deprecated)
+ * @magic2:     Magic number 2 (to match the ARM64 'magic' field pos)
+ * @res3:       reserved (will be used for PE COFF offset)
+ *
+ * The intention is for this header format to be shared between multiple
+ * architectures to avoid a proliferation of image header formats.
+ */
+struct riscv_image_header {
+    uint32_t code0;
+    uint32_t code1;
+    uint64_t text_offset;
+    uint64_t image_size;
+    uint64_t flags;
+    uint64_t version;
+    uint32_t res1;
+    uint64_t res2;
+    uint64_t magic;
+    uint32_t magic2;
+    uint32_t res3;
+};
+#endif /* __ASSEMBLY__ */
+#endif /* _ASM_RISCV_IMAGE_H */
diff --git a/xen/arch/riscv/riscv64/efi-header.S b/xen/arch/riscv/riscv64/efi-header.S
new file mode 100644
index 0000000000..87cd591a96
--- /dev/null
+++ b/xen/arch/riscv/riscv64/efi-header.S
@@ -0,0 +1,99 @@
+#include <efi/pe.h>
+#include <xen/sizes.h>
+
+        .macro __EFI_PE_HEADER
+        .long PE_MAGIC
+coff_header:
+#ifdef CONFIG_RISCV_64
+        .short  IMAGE_FILE_MACHINE_RISCV64              /* Machine */
+#else
+        .short  IMAGE_FILE_MACHINE_RISCV32              /* Machine */
+#endif
+        .short  section_count                           /* NumberOfSections */
+        .long   0                                       /* TimeDateStamp */
+        .long   0                                       /* PointerToSymbolTable */
+        .long   0                                       /* NumberOfSymbols */
+        .short  section_table - optional_header         /* SizeOfOptionalHeader */
+        .short  IMAGE_FILE_DEBUG_STRIPPED | \
+                IMAGE_FILE_EXECUTABLE_IMAGE | \
+                IMAGE_FILE_LINE_NUMS_STRIPPED           /* Characteristics */
+
+optional_header:
+#ifdef CONFIG_RISCV_64
+        .short  PE_OPT_MAGIC_PE32PLUS                   /* PE32+ format */
+#else
+        .short  PE_OPT_MAGIC_PE32                       /* PE32 format */
+#endif
+        .byte   0x02                                    /* MajorLinkerVersion */
+        .byte   0x14                                    /* MinorLinkerVersion */
+        .long   _end - xen_start                        /* SizeOfCode */
+        .long   0                                       /* SizeOfInitializedData */
+        .long   0                                       /* SizeOfUninitializedData */
+        .long   0                                       /* AddressOfEntryPoint */
+        .long   xen_start - _start                      /* BaseOfCode */
+#ifdef CONFIG_RISCV_32
+        .long  _end - _start                            /* BaseOfData */
+#endif
+
+extra_header_fields:
+        .quad   0                                       /* ImageBase */
+        .long   PECOFF_SECTION_ALIGNMENT                /* SectionAlignment */
+        .long   PECOFF_FILE_ALIGNMENT                   /* FileAlignment */
+        .short  0                                       /* MajorOperatingSystemVersion */
+        .short  0                                       /* MinorOperatingSystemVersion */
+        .short  LINUX_EFISTUB_MAJOR_VERSION             /* MajorImageVersion */
+        .short  LINUX_EFISTUB_MINOR_VERSION             /* MinorImageVersion */
+        .short  0                                       /* MajorSubsystemVersion */
+        .short  0                                       /* MinorSubsystemVersion */
+        .long   0                                       /* Win32VersionValue */
+        .long   _end - _start                           /* SizeOfImage */
+
+        /* Everything before the xen image is considered part of the header */
+        .long   xen_start - _start                      /* SizeOfHeaders */
+        .long   0                                       /* CheckSum */
+        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
+        .short  0                                       /* DllCharacteristics */
+        .quad   0                                       /* SizeOfStackReserve */
+        .quad   0                                       /* SizeOfStackCommit */
+        .quad   0                                       /* SizeOfHeapReserve */
+        .quad   0                                       /* SizeOfHeapCommit */
+        .long   0                                       /* LoaderFlags */
+        .long   (section_table - .) / 8                 /* NumberOfRvaAndSizes */
+        /*
+         * Data directories are not used in this case, therefore not defined to reduce header size.
+         */
+
+        /* Section table */
+section_table:
+        /* Currently code/data sections are not used since EFI stub implementation is not yet finalized */
+        .ascii  ".text\0\0\0"
+        .long   0                                       /* VirtualSize */
+        .long   0                                       /* VirtualAddress */
+        .long   0                                       /* SizeOfRawData */
+        .long   0                                       /* PointerToRawData */
+        .long   0                                       /* PointerToRelocations */
+        .long   0                                       /* PointerToLineNumbers */
+        .short  0                                       /* NumberOfRelocations */
+        .short  0                                       /* NumberOfLineNumbers */
+        .long   IMAGE_SCN_CNT_CODE | \
+                IMAGE_SCN_MEM_READ | \
+                IMAGE_SCN_MEM_EXECUTE                   /* Characteristics */
+
+        .ascii  ".data\0\0\0"
+        .long   0                                       /* VirtualSize */
+        .long   0                                       /* VirtualAddress */
+        .long   0                                       /* SizeOfRawData */
+        .long   0                                       /* PointerToRawData */
+        .long   0                                       /* PointerToRelocations */
+        .long   0                                       /* PointerToLineNumbers */
+        .short  0                                       /* NumberOfRelocations */
+        .short  0                                       /* NumberOfLineNumbers */
+        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
+                IMAGE_SCN_MEM_READ | \
+                IMAGE_SCN_MEM_WRITE                    /* Characteristics */
+
+        .set    section_count, (. - section_table) / 40
+
+        .balign  0x1000
+efi_header_end:
+        .endm
\ No newline at end of file
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..5669e5df20 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,14 +1,54 @@
 #include <asm/asm.h>
 #include <asm/riscv_encoding.h>
+#include <asm/riscv-image-header.h>
+#ifdef CONFIG_RISCV_EFI
+#include "efi-header.S"
+#endif
 
         .section .text.header, "ax", %progbits
-
         /*
          * OpenSBI pass to start():
          *   a0 -> hart_id ( bootcpu_id )
-         *   a1 -> dtb_base 
+         *   a1 -> dtb_base
          */
 FUNC(start)
+/* Image header expected by second stage bootloaders (format defined in asm/riscv-image-header.h) */
+#ifdef CONFIG_RISCV_EFI
+        /*
+         * This instruction decodes to "MZ" ASCII required by UEFI.
+         */
+        c.li s4,-13
+        c.j xen_start
+#else
+        /* jump to start kernel */
+        jal xen_start
+#endif
+        .balign 8
+#ifdef CONFIG_RISCV_64
+        /* Image load offset(2MB) from start of RAM */
+        .quad 0x200000
+#else
+        /* Image load offset(4MB) from start of RAM */
+        .quad 0x400000
+#endif
+        .quad _end - _start              /* Effective Image size */
+        .quad __HEAD_FLAGS
+        .long RISCV_HEADER_VERSION
+        .long 0                          /* reserved */
+        .quad 0                          /* reserved */
+        .ascii RISCV_IMAGE_MAGIC         /* Magic number (RISC-V specific; deprecated) */
+        .balign 4
+        .ascii RISCV_IMAGE_MAGIC2        /* Magic number 2 (to match the ARM64 'magic' field pos) */
+#ifdef CONFIG_RISCV_EFI
+        .long pe_head_start - _start     /* reserved (PE COFF offset) */
+pe_head_start:
+
+        __EFI_PE_HEADER
+#else
+        .long 0                          /* 0 means no PE header. */
+#endif
+
+xen_start:
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
@@ -60,6 +100,7 @@ FUNC(start)
         mv      a1, s1
 
         tail    start_xen
+
 END(start)
 
         .section .text, "ax", %progbits
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8510a87c4d..c36d76baf3 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -12,6 +12,9 @@ PHDRS
 #endif
 }
 
+PECOFF_SECTION_ALIGNMENT = 0x1000;
+PECOFF_FILE_ALIGNMENT = 0x200;
+
 SECTIONS
 {
     . = XEN_VIRT_START;
diff --git a/xen/include/efi/pe.h b/xen/include/efi/pe.h
new file mode 100644
index 0000000000..bc42c3d85e
--- /dev/null
+++ b/xen/include/efi/pe.h
@@ -0,0 +1,458 @@
+#ifndef __PE_H
+#define __PE_H
+
+/*
+ * Linux EFI stub v1.0 adds the following functionality:
+ * - Loading initrd from the LINUX_EFI_INITRD_MEDIA_GUID device path,
+ * - Loading/starting the kernel from firmware that targets a different
+ *   machine type, via the entrypoint exposed in the .compat PE/COFF section.
+ *
+ * The recommended way of loading and starting v1.0 or later kernels is to use
+ * the LoadImage() and StartImage() EFI boot services, and expose the initrd
+ * via the LINUX_EFI_INITRD_MEDIA_GUID device path.
+ *
+ * Versions older than v1.0 support initrd loading via the image load options
+ * (using initrd=, limited to the volume from which the kernel itself was
+ * loaded), or via arch specific means (bootparams, DT, etc).
+ *
+ * On x86, LoadImage() and StartImage() can be omitted if the EFI handover
+ * protocol is implemented, which can be inferred from the version,
+ * handover_offset and xloadflags fields in the bootparams structure.
+ */
+#define LINUX_EFISTUB_MAJOR_VERSION 0x1
+#define LINUX_EFISTUB_MINOR_VERSION 0x0
+
+#define MZ_MAGIC 0x5a4d /* "MZ" */
+
+#define PE_MAGIC              0x00004550 /* "PE\0\0" */
+#define PE_OPT_MAGIC_PE32     0x010b
+#define PE_OPT_MAGIC_PE32_ROM 0x0107
+#define PE_OPT_MAGIC_PE32PLUS 0x020b
+
+/* machine type */
+#define IMAGE_FILE_MACHINE_UNKNOWN   0x0000
+#define IMAGE_FILE_MACHINE_AM33      0x01d3
+#define IMAGE_FILE_MACHINE_AMD64     0x8664
+#define IMAGE_FILE_MACHINE_ARM       0x01c0
+#define IMAGE_FILE_MACHINE_ARMV7     0x01c4
+#define IMAGE_FILE_MACHINE_ARM64     0xaa64
+#define IMAGE_FILE_MACHINE_EBC       0x0ebc
+#define IMAGE_FILE_MACHINE_I386      0x014c
+#define IMAGE_FILE_MACHINE_IA64      0x0200
+#define IMAGE_FILE_MACHINE_M32R      0x9041
+#define IMAGE_FILE_MACHINE_MIPS16    0x0266
+#define IMAGE_FILE_MACHINE_MIPSFPU   0x0366
+#define IMAGE_FILE_MACHINE_MIPSFPU16 0x0466
+#define IMAGE_FILE_MACHINE_POWERPC   0x01f0
+#define IMAGE_FILE_MACHINE_POWERPCFP 0x01f1
+#define IMAGE_FILE_MACHINE_R4000     0x0166
+#define IMAGE_FILE_MACHINE_RISCV32   0x5032
+#define IMAGE_FILE_MACHINE_RISCV64   0x5064
+#define IMAGE_FILE_MACHINE_RISCV128  0x5128
+#define IMAGE_FILE_MACHINE_SH3       0x01a2
+#define IMAGE_FILE_MACHINE_SH3DSP    0x01a3
+#define IMAGE_FILE_MACHINE_SH3E      0x01a4
+#define IMAGE_FILE_MACHINE_SH4       0x01a6
+#define IMAGE_FILE_MACHINE_SH5       0x01a8
+#define IMAGE_FILE_MACHINE_THUMB     0x01c2
+#define IMAGE_FILE_MACHINE_WCEMIPSV2 0x0169
+
+/* flags */
+#define IMAGE_FILE_RELOCS_STRIPPED         0x0001
+#define IMAGE_FILE_EXECUTABLE_IMAGE        0x0002
+#define IMAGE_FILE_LINE_NUMS_STRIPPED      0x0004
+#define IMAGE_FILE_LOCAL_SYMS_STRIPPED     0x0008
+#define IMAGE_FILE_AGGRESSIVE_WS_TRIM      0x0010
+#define IMAGE_FILE_LARGE_ADDRESS_AWARE     0x0020
+#define IMAGE_FILE_16BIT_MACHINE           0x0040
+#define IMAGE_FILE_BYTES_REVERSED_LO       0x0080
+#define IMAGE_FILE_32BIT_MACHINE           0x0100
+#define IMAGE_FILE_DEBUG_STRIPPED          0x0200
+#define IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP 0x0400
+#define IMAGE_FILE_NET_RUN_FROM_SWAP       0x0800
+#define IMAGE_FILE_SYSTEM                  0x1000
+#define IMAGE_FILE_DLL                     0x2000
+#define IMAGE_FILE_UP_SYSTEM_ONLY          0x4000
+#define IMAGE_FILE_BYTES_REVERSED_HI       0x8000
+
+#define IMAGE_FILE_OPT_ROM_MAGIC       0x107
+#define IMAGE_FILE_OPT_PE32_MAGIC      0x10b
+#define IMAGE_FILE_OPT_PE32_PLUS_MAGIC 0x20b
+
+#define IMAGE_SUBSYSTEM_UNKNOWN                 0
+#define IMAGE_SUBSYSTEM_NATIVE                  1
+#define IMAGE_SUBSYSTEM_WINDOWS_GUI             2
+#define IMAGE_SUBSYSTEM_WINDOWS_CUI             3
+#define IMAGE_SUBSYSTEM_POSIX_CUI               7
+#define IMAGE_SUBSYSTEM_WINDOWS_CE_GUI          9
+#define IMAGE_SUBSYSTEM_EFI_APPLICATION         10
+#define IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER 11
+#define IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER      12
+#define IMAGE_SUBSYSTEM_EFI_ROM_IMAGE           13
+#define IMAGE_SUBSYSTEM_XBOX                    14
+
+#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
+#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
+#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
+#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
+#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
+#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
+#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
+#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
+
+/* they actually defined 0x00000000 as well, but I think we'll skip that one. */
+#define IMAGE_SCN_RESERVED_0             0x00000001
+#define IMAGE_SCN_RESERVED_1             0x00000002
+#define IMAGE_SCN_RESERVED_2             0x00000004
+#define IMAGE_SCN_TYPE_NO_PAD            0x00000008 /* don't pad - obsolete */
+#define IMAGE_SCN_RESERVED_3             0x00000010
+#define IMAGE_SCN_CNT_CODE               0x00000020 /* .text */
+#define IMAGE_SCN_CNT_INITIALIZED_DATA   0x00000040 /* .data */
+#define IMAGE_SCN_CNT_UNINITIALIZED_DATA 0x00000080 /* .bss */
+#define IMAGE_SCN_LNK_OTHER              0x00000100 /* reserved */
+#define IMAGE_SCN_LNK_INFO               0x00000200 /* .drectve comments */
+#define IMAGE_SCN_RESERVED_4             0x00000400
+#define IMAGE_SCN_LNK_REMOVE             0x00000800 /* .o only - scn to be rm'd*/
+#define IMAGE_SCN_LNK_COMDAT             0x00001000 /* .o only - COMDAT data */
+#define IMAGE_SCN_RESERVED_5             0x00002000 /* spec omits this */
+#define IMAGE_SCN_RESERVED_6             0x00004000 /* spec omits this */
+#define IMAGE_SCN_GPREL                  0x00008000 /* global pointer referenced data */
+/* spec lists 0x20000 twice, I suspect they meant 0x10000 for one of them */
+#define IMAGE_SCN_MEM_PURGEABLE 0x00010000 /* reserved for "future" use */
+#define IMAGE_SCN_16BIT         0x00020000 /* reserved for "future" use */
+#define IMAGE_SCN_LOCKED        0x00040000 /* reserved for "future" use */
+#define IMAGE_SCN_PRELOAD       0x00080000 /* reserved for "future" use */
+/* and here they just stuck a 1-byte integer in the middle of a bitfield */
+#define IMAGE_SCN_ALIGN_1BYTES    0x00100000 /* it does what it says on the box */
+#define IMAGE_SCN_ALIGN_2BYTES    0x00200000
+#define IMAGE_SCN_ALIGN_4BYTES    0x00300000
+#define IMAGE_SCN_ALIGN_8BYTES    0x00400000
+#define IMAGE_SCN_ALIGN_16BYTES   0x00500000
+#define IMAGE_SCN_ALIGN_32BYTES   0x00600000
+#define IMAGE_SCN_ALIGN_64BYTES   0x00700000
+#define IMAGE_SCN_ALIGN_128BYTES  0x00800000
+#define IMAGE_SCN_ALIGN_256BYTES  0x00900000
+#define IMAGE_SCN_ALIGN_512BYTES  0x00a00000
+#define IMAGE_SCN_ALIGN_1024BYTES 0x00b00000
+#define IMAGE_SCN_ALIGN_2048BYTES 0x00c00000
+#define IMAGE_SCN_ALIGN_4096BYTES 0x00d00000
+#define IMAGE_SCN_ALIGN_8192BYTES 0x00e00000
+#define IMAGE_SCN_LNK_NRELOC_OVFL 0x01000000 /* extended relocations */
+#define IMAGE_SCN_MEM_DISCARDABLE 0x02000000 /* scn can be discarded */
+#define IMAGE_SCN_MEM_NOT_CACHED  0x04000000 /* cannot be cached */
+#define IMAGE_SCN_MEM_NOT_PAGED   0x08000000 /* not pageable */
+#define IMAGE_SCN_MEM_SHARED      0x10000000 /* can be shared */
+#define IMAGE_SCN_MEM_EXECUTE     0x20000000 /* can be executed as code */
+#define IMAGE_SCN_MEM_READ        0x40000000 /* readable */
+#define IMAGE_SCN_MEM_WRITE       0x80000000 /* writeable */
+
+#define IMAGE_DEBUG_TYPE_CODEVIEW 2
+
+#ifndef __ASSEMBLY__
+
+struct mz_hdr {
+    uint16_t magic;              /* MZ_MAGIC */
+    uint16_t lbsize;             /* size of last used block */
+    uint16_t blocks;             /* pages in file, 0x3 */
+    uint16_t relocs;             /* relocations */
+    uint16_t hdrsize;            /* header size in "paragraphs" */
+    uint16_t min_extra_pps;      /* .bss */
+    uint16_t max_extra_pps;      /* runtime limit for the arena size */
+    uint16_t ss;                 /* relative stack segment */
+    uint16_t sp;                 /* initial %sp register */
+    uint16_t checksum;           /* word checksum */
+    uint16_t ip;                 /* initial %ip register */
+    uint16_t cs;                 /* initial %cs relative to load segment */
+    uint16_t reloc_table_offset; /* offset of the first relocation */
+    uint16_t overlay_num;        /* overlay number.  set to 0. */
+    uint16_t reserved0[4];       /* reserved */
+    uint16_t oem_id;             /* oem identifier */
+    uint16_t oem_info;           /* oem specific */
+    uint16_t reserved1[10];      /* reserved */
+    uint32_t peaddr;             /* address of pe header */
+    char     message[];          /* message to print */
+};
+
+struct mz_reloc {
+    uint16_t offset;
+    uint16_t segment;
+};
+
+struct pe_hdr {
+    uint32_t magic;        /* PE magic */
+    uint16_t machine;      /* machine type */
+    uint16_t sections;     /* number of sections */
+    uint32_t timestamp;    /* time_t */
+    uint32_t symbol_table; /* symbol table offset */
+    uint32_t symbols;      /* number of symbols */
+    uint16_t opt_hdr_size; /* size of optional header */
+    uint16_t flags;        /* flags */
+};
+
+/* the fact that pe32 isn't padded where pe32+ is 64-bit means union won't
+ * work right.  vomit. */
+struct pe32_opt_hdr {
+    /* "standard" header */
+    uint16_t magic;       /* file type */
+    uint8_t  ld_major;    /* linker major version */
+    uint8_t  ld_minor;    /* linker minor version */
+    uint32_t text_size;   /* size of text section(s) */
+    uint32_t data_size;   /* size of data section(s) */
+    uint32_t bss_size;    /* size of bss section(s) */
+    uint32_t entry_point; /* file offset of entry point */
+    uint32_t code_base;   /* relative code addr in ram */
+    uint32_t data_base;   /* relative data addr in ram */
+    /* "windows" header */
+    uint32_t image_base;     /* preferred load address */
+    uint32_t section_align;  /* alignment in bytes */
+    uint32_t file_align;     /* file alignment in bytes */
+    uint16_t os_major;       /* major OS version */
+    uint16_t os_minor;       /* minor OS version */
+    uint16_t image_major;    /* major image version */
+    uint16_t image_minor;    /* minor image version */
+    uint16_t subsys_major;   /* major subsystem version */
+    uint16_t subsys_minor;   /* minor subsystem version */
+    uint32_t win32_version;  /* reserved, must be 0 */
+    uint32_t image_size;     /* image size */
+    uint32_t header_size;    /* header size rounded up to file_align */
+    uint32_t csum;           /* checksum */
+    uint16_t subsys;         /* subsystem */
+    uint16_t dll_flags;      /* executable characteristics */
+    uint32_t stack_size_req; /* amt of stack requested */
+    uint32_t stack_size;     /* amt of stack required */
+    uint32_t heap_size_req;  /* amt of heap requested */
+    uint32_t heap_size;      /* amt of heap required */
+    uint32_t loader_flags;   /* reserved, must be 0 */
+    uint32_t data_dirs;      /* number of data dir entries */
+};
+
+struct pe32plus_opt_hdr {
+    uint16_t magic;       /* file type */
+    uint8_t  ld_major;    /* linker major version */
+    uint8_t  ld_minor;    /* linker minor version */
+    uint32_t text_size;   /* size of text section(s) */
+    uint32_t data_size;   /* size of data section(s) */
+    uint32_t bss_size;    /* size of bss section(s) */
+    uint32_t entry_point; /* file offset of entry point */
+    uint32_t code_base;   /* relative code addr in ram */
+    /* "windows" header */
+    uint64_t image_base;     /* preferred load address */
+    uint32_t section_align;  /* alignment in bytes */
+    uint32_t file_align;     /* file alignment in bytes */
+    uint16_t os_major;       /* major OS version */
+    uint16_t os_minor;       /* minor OS version */
+    uint16_t image_major;    /* major image version */
+    uint16_t image_minor;    /* minor image version */
+    uint16_t subsys_major;   /* major subsystem version */
+    uint16_t subsys_minor;   /* minor subsystem version */
+    uint32_t win32_version;  /* reserved, must be 0 */
+    uint32_t image_size;     /* image size */
+    uint32_t header_size;    /* header size rounded up to file_align */
+    uint32_t csum;           /* checksum */
+    uint16_t subsys;         /* subsystem */
+    uint16_t dll_flags;      /* executable characteristics */
+    uint64_t stack_size_req; /* amt of stack requested */
+    uint64_t stack_size;     /* amt of stack required */
+    uint64_t heap_size_req;  /* amt of heap requested */
+    uint64_t heap_size;      /* amt of heap required */
+    uint32_t loader_flags;   /* reserved, must be 0 */
+    uint32_t data_dirs;      /* number of data dir entries */
+};
+
+struct data_dirent {
+    uint32_t virtual_address; /* relative to load address */
+    uint32_t size;
+};
+
+struct data_directory {
+    struct data_dirent exports;          /* .edata */
+    struct data_dirent imports;          /* .idata */
+    struct data_dirent resources;        /* .rsrc */
+    struct data_dirent exceptions;       /* .pdata */
+    struct data_dirent certs;            /* certs */
+    struct data_dirent base_relocations; /* .reloc */
+    struct data_dirent debug;            /* .debug */
+    struct data_dirent arch;             /* reservered */
+    struct data_dirent global_ptr;       /* global pointer reg. Size=0 */
+    struct data_dirent tls;              /* .tls */
+    struct data_dirent load_config;      /* load configuration structure */
+    struct data_dirent bound_imports;    /* no idea */
+    struct data_dirent import_addrs;     /* import address table */
+    struct data_dirent delay_imports;    /* delay-load import table */
+    struct data_dirent clr_runtime_hdr;  /* .cor (object only) */
+    struct data_dirent reserved;
+};
+
+struct section_header {
+    char     name[8];         /* name or string tbl offset */
+    uint32_t virtual_size;    /* size of loaded section in ram */
+    uint32_t virtual_address; /* relative virtual address */
+    uint32_t raw_data_size;   /* size of the section */
+    uint32_t data_addr;       /* file pointer to first page of sec */
+    uint32_t relocs;          /* file pointer to relocation entries */
+    uint32_t line_numbers;    /* line numbers */
+    uint16_t num_relocs;      /* number of relocations */
+    uint16_t num_lin_numbers; /* COFF line count. */
+    uint32_t flags;
+};
+
+enum x64_coff_reloc_type {
+    IMAGE_REL_AMD64_ABSOLUTE = 0,
+    IMAGE_REL_AMD64_ADDR64,
+    IMAGE_REL_AMD64_ADDR32,
+    IMAGE_REL_AMD64_ADDR32N,
+    IMAGE_REL_AMD64_REL32,
+    IMAGE_REL_AMD64_REL32_1,
+    IMAGE_REL_AMD64_REL32_2,
+    IMAGE_REL_AMD64_REL32_3,
+    IMAGE_REL_AMD64_REL32_4,
+    IMAGE_REL_AMD64_REL32_5,
+    IMAGE_REL_AMD64_SECTION,
+    IMAGE_REL_AMD64_SECREL,
+    IMAGE_REL_AMD64_SECREL7,
+    IMAGE_REL_AMD64_TOKEN,
+    IMAGE_REL_AMD64_SREL32,
+    IMAGE_REL_AMD64_PAIR,
+    IMAGE_REL_AMD64_SSPAN32,
+};
+
+enum arm_coff_reloc_type {
+    IMAGE_REL_ARM_ABSOLUTE,
+    IMAGE_REL_ARM_ADDR32,
+    IMAGE_REL_ARM_ADDR32N,
+    IMAGE_REL_ARM_BRANCH2,
+    IMAGE_REL_ARM_BRANCH1,
+    IMAGE_REL_ARM_SECTION,
+    IMAGE_REL_ARM_SECREL,
+};
+
+enum sh_coff_reloc_type {
+    IMAGE_REL_SH3_ABSOLUTE,
+    IMAGE_REL_SH3_DIRECT16,
+    IMAGE_REL_SH3_DIRECT32,
+    IMAGE_REL_SH3_DIRECT8,
+    IMAGE_REL_SH3_DIRECT8_WORD,
+    IMAGE_REL_SH3_DIRECT8_LONG,
+    IMAGE_REL_SH3_DIRECT4,
+    IMAGE_REL_SH3_DIRECT4_WORD,
+    IMAGE_REL_SH3_DIRECT4_LONG,
+    IMAGE_REL_SH3_PCREL8_WORD,
+    IMAGE_REL_SH3_PCREL8_LONG,
+    IMAGE_REL_SH3_PCREL12_WORD,
+    IMAGE_REL_SH3_STARTOF_SECTION,
+    IMAGE_REL_SH3_SIZEOF_SECTION,
+    IMAGE_REL_SH3_SECTION,
+    IMAGE_REL_SH3_SECREL,
+    IMAGE_REL_SH3_DIRECT32_NB,
+    IMAGE_REL_SH3_GPREL4_LONG,
+    IMAGE_REL_SH3_TOKEN,
+    IMAGE_REL_SHM_PCRELPT,
+    IMAGE_REL_SHM_REFLO,
+    IMAGE_REL_SHM_REFHALF,
+    IMAGE_REL_SHM_RELLO,
+    IMAGE_REL_SHM_RELHALF,
+    IMAGE_REL_SHM_PAIR,
+    IMAGE_REL_SHM_NOMODE,
+};
+
+enum ppc_coff_reloc_type {
+    IMAGE_REL_PPC_ABSOLUTE,
+    IMAGE_REL_PPC_ADDR64,
+    IMAGE_REL_PPC_ADDR32,
+    IMAGE_REL_PPC_ADDR24,
+    IMAGE_REL_PPC_ADDR16,
+    IMAGE_REL_PPC_ADDR14,
+    IMAGE_REL_PPC_REL24,
+    IMAGE_REL_PPC_REL14,
+    IMAGE_REL_PPC_ADDR32N,
+    IMAGE_REL_PPC_SECREL,
+    IMAGE_REL_PPC_SECTION,
+    IMAGE_REL_PPC_SECREL16,
+    IMAGE_REL_PPC_REFHI,
+    IMAGE_REL_PPC_REFLO,
+    IMAGE_REL_PPC_PAIR,
+    IMAGE_REL_PPC_SECRELLO,
+    IMAGE_REL_PPC_GPREL,
+    IMAGE_REL_PPC_TOKEN,
+};
+
+enum x86_coff_reloc_type {
+    IMAGE_REL_I386_ABSOLUTE,
+    IMAGE_REL_I386_DIR16,
+    IMAGE_REL_I386_REL16,
+    IMAGE_REL_I386_DIR32,
+    IMAGE_REL_I386_DIR32NB,
+    IMAGE_REL_I386_SEG12,
+    IMAGE_REL_I386_SECTION,
+    IMAGE_REL_I386_SECREL,
+    IMAGE_REL_I386_TOKEN,
+    IMAGE_REL_I386_SECREL7,
+    IMAGE_REL_I386_REL32,
+};
+
+enum ia64_coff_reloc_type {
+    IMAGE_REL_IA64_ABSOLUTE,
+    IMAGE_REL_IA64_IMM14,
+    IMAGE_REL_IA64_IMM22,
+    IMAGE_REL_IA64_IMM64,
+    IMAGE_REL_IA64_DIR32,
+    IMAGE_REL_IA64_DIR64,
+    IMAGE_REL_IA64_PCREL21B,
+    IMAGE_REL_IA64_PCREL21M,
+    IMAGE_REL_IA64_PCREL21F,
+    IMAGE_REL_IA64_GPREL22,
+    IMAGE_REL_IA64_LTOFF22,
+    IMAGE_REL_IA64_SECTION,
+    IMAGE_REL_IA64_SECREL22,
+    IMAGE_REL_IA64_SECREL64I,
+    IMAGE_REL_IA64_SECREL32,
+    IMAGE_REL_IA64_DIR32NB,
+    IMAGE_REL_IA64_SREL14,
+    IMAGE_REL_IA64_SREL22,
+    IMAGE_REL_IA64_SREL32,
+    IMAGE_REL_IA64_UREL32,
+    IMAGE_REL_IA64_PCREL60X,
+    IMAGE_REL_IA64_PCREL60B,
+    IMAGE_REL_IA64_PCREL60F,
+    IMAGE_REL_IA64_PCREL60I,
+    IMAGE_REL_IA64_PCREL60M,
+    IMAGE_REL_IA64_IMMGPREL6,
+    IMAGE_REL_IA64_TOKEN,
+    IMAGE_REL_IA64_GPREL32,
+    IMAGE_REL_IA64_ADDEND,
+};
+
+struct coff_reloc {
+    uint32_t virtual_address;
+    uint32_t symbol_table_index;
+
+    union {
+        enum x64_coff_reloc_type  x64_type;
+        enum arm_coff_reloc_type  arm_type;
+        enum sh_coff_reloc_type   sh_type;
+        enum ppc_coff_reloc_type  ppc_type;
+        enum x86_coff_reloc_type  x86_type;
+        enum ia64_coff_reloc_type ia64_type;
+        uint16_t                  data;
+    };
+};
+
+/*
+ * Definitions for the contents of the certs data block
+ */
+#define WIN_CERT_TYPE_PKCS_SIGNED_DATA 0x0002
+#define WIN_CERT_TYPE_EFI_OKCS115      0x0EF0
+#define WIN_CERT_TYPE_EFI_GUID         0x0EF1
+
+#define WIN_CERT_REVISION_1_0 0x0100
+#define WIN_CERT_REVISION_2_0 0x0200
+
+struct win_certificate {
+    uint32_t length;
+    uint16_t revision;
+    uint16_t cert_type;
+};
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __PE_H */
-- 
2.25.1


