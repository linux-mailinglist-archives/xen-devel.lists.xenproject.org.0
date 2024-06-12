Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577FB90523E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 14:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739291.1146270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMuK-0005Fp-3X; Wed, 12 Jun 2024 12:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739291.1146270; Wed, 12 Jun 2024 12:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMuK-0005Dh-0u; Wed, 12 Jun 2024 12:16:52 +0000
Received: by outflank-mailman (input) for mailman id 739291;
 Wed, 12 Jun 2024 12:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdqZ=NO=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sHMuI-0005Db-L6
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 12:16:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4db3b3f-28b5-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 14:16:49 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so56973025e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 05:16:49 -0700 (PDT)
Received: from Xen-host.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422a1e68d04sm4567705e9.36.2024.06.12.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 05:16:47 -0700 (PDT)
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
X-Inumbo-ID: a4db3b3f-28b5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718194608; x=1718799408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S99lrXXA8NoM9HNxPtZJ+V98dLUlIFlE99OYkDQ01bw=;
        b=f+0FZzlgOZmo/JChgGFe22sdzv1DJfMxMFa2VVBRnvyfsWLzCfkkcwbrayojJXfmXB
         gnToiW9h292OXfvuVkAouSv55LCfXGgJkcbIW0FxzvMlQIRKtZtyljI+41HAlDp8DsoL
         7AbS2sq2DaQ35Ml6dXFlfBpwh770ske/kht8DRIZcjWHH/yWG4RIl4+66+uiwq2cmVAo
         /RxrAbFzNzNnsEjNXr6jVJA+0uUzlrLKk0CLhED7T7JaHUXVd5uPBp1BlHu0bBefsnHA
         +2ZUFRor4AtBlGWojffoyUul1nq2J1Yz1/YgDaAWhBKpGBb8Q6I+qk5FFeTTTeYQ1IqS
         oaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718194608; x=1718799408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S99lrXXA8NoM9HNxPtZJ+V98dLUlIFlE99OYkDQ01bw=;
        b=M0351e/kmTfAIwXcRXuCcB1kLiGqfW4+hGh8q1LGyvGLOfVtSNzFripq1KrSenMMtN
         W1DmuLseQAOc/ILWut++zi29erdNB7R3pQTLSPp6NwV+aVVwPXQU8xdl/usmxmQZZh2k
         p3otbthTwF+fSltGVB1s+UXn6aRB7Q1M3rwTNZYSV5QJKxtiY7Tf567OkhdknW/orrlH
         dABEvA4YQgWG5KtWBuTRCb3er4iAJcAJxlY/L6eNwWsyKVh9nkjwaOfMuq1RTXVXDeQc
         BSkaw3mssavZX7k25lQZ0RtCxGi6TptAEd2KtLFRR0nb80mheMI/WVUj9+tSrTjFqYAH
         sQTg==
X-Gm-Message-State: AOJu0YzijPm8O+DIOeq9ix2kMaxVD8k4xs6rLoBTwjbxeZJhQqaQlrEn
	ta4DZ4vYNmMaY8Z5qbjVHy8TXFD48OM1vpqq+7lBpsMhW1t6HHVdR1MDZriVyGA=
X-Google-Smtp-Source: AGHT+IHOfgVHbRT2rETFlqz8L9ilmWJLeglNxaHjjabF332uZMkUE3PlReKTC9YCYHDp9on6AGoxwg==
X-Received: by 2002:a05:600c:4e52:b0:421:de31:89 with SMTP id 5b1f17b1804b1-422863b6249mr13439415e9.18.1718194608193;
        Wed, 12 Jun 2024 05:16:48 -0700 (PDT)
From: milandjokic1995@gmail.com
To: xen-devel@lists.xenproject.org
Cc: milan.djokic@rt-rk.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
Date: Wed, 12 Jun 2024 14:15:45 +0200
Message-Id: <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
References: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikola Jelic <nikola.jelic@rt-rk.com>

Extended RISC-V xen image with PE/COFF headers,
in order to support xen boot from popular bootloaders like U-boot.
Image header is optionally included (with CONFIG_RISCV_EFI) so
both plain ELF and image with PE/COFF header can now be generated as build artifacts.
Note that this patch also represents initial EFI application format support (image
contains EFI application header embeded into binary when CONFIG_RISCV_EFI
is enabled). For full EFI application Xen support, boot/runtime services
and system table handling are yet to be implemented.

Tested on both QEMU and StarFive VisionFive 2 with OpenSBI->U-Boot->xen->dom0 boot chain.

Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>

---
Changes since v1 (following review comments from Jan Beulich):
  * Fix coding style
  * Extended image header with all the necessary
    PE/COFF (EFI) fields (instead of only those used by
U-boot)
  * Removed usage of deprecated types
---
 xen/arch/riscv/Kconfig                        |   9 ++
 xen/arch/riscv/include/asm/pe.h               | 148 ++++++++++++++++++
 .../riscv/include/asm/riscv_image_header.h    |  54 +++++++
 xen/arch/riscv/riscv64/head.S                 | 141 ++++++++++++++++-
 xen/arch/riscv/xen.lds.S                      |   6 +-
 5 files changed, 356 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/pe.h
 create mode 100644 xen/arch/riscv/include/asm/riscv_image_header.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..59bf5aa2a6 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -9,6 +9,15 @@ config ARCH_DEFCONFIG
 	string
 	default "arch/riscv/configs/tiny64_defconfig"
 
+config RISCV_EFI
+	bool "UEFI boot service support"
+	depends on RISCV_64
+	default n
+	help
+	  This option provides support for boot services through
+	  UEFI firmware. A UEFI stub is provided to allow Xen to
+	  be booted as an EFI application.
+
 menu "Architecture Features"
 
 source "arch/Kconfig"
diff --git a/xen/arch/riscv/include/asm/pe.h b/xen/arch/riscv/include/asm/pe.h
new file mode 100644
index 0000000000..084de1e712
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pe.h
@@ -0,0 +1,148 @@
+#ifndef _ASM_RISCV_PE_H
+#define _ASM_RISCV_PE_H
+
+#define LINUX_EFISTUB_MAJOR_VERSION     0x1
+#define LINUX_EFISTUB_MINOR_VERSION     0x0
+
+#define MZ_MAGIC                    0x5a4d          /* "MZ" */
+
+#define PE_MAGIC                    0x00004550      /* "PE\0\0" */
+#define PE_OPT_MAGIC_PE32           0x010b
+#define PE_OPT_MAGIC_PE32PLUS       0x020b
+
+/* machine type */
+#define IMAGE_FILE_MACHINE_RISCV32  0x5032
+#define IMAGE_FILE_MACHINE_RISCV64  0x5064
+
+/* flags */
+#define IMAGE_FILE_EXECUTABLE_IMAGE 0x0002
+#define IMAGE_FILE_LINE_NUMS_STRIPPED 0x0004
+#define IMAGE_FILE_DEBUG_STRIPPED   0x0200
+#define IMAGE_SUBSYSTEM_EFI_APPLICATION 10
+
+#define IMAGE_SCN_CNT_CODE          0x00000020      /* .text */
+#define IMAGE_SCN_CNT_INITIALIZED_DATA 0x00000040   /* .data */
+#define IMAGE_SCN_MEM_EXECUTE       0x20000000
+#define IMAGE_SCN_MEM_READ          0x40000000      /* readable */
+#define IMAGE_SCN_MEM_WRITE         0x80000000      /* writeable */
+
+#ifndef __ASSEMBLY__
+
+struct mz_hdr {
+    uint16_t magic;                  /* MZ_MAGIC */
+    uint16_t lbsize;                 /* size of last used block */
+    uint16_t blocks;                 /* pages in file, 0x3 */
+    uint16_t relocs;                 /* relocations */
+    uint16_t hdrsize;                /* header size in "paragraphs" */
+    uint16_t min_extra_pps;          /* .bss */
+    uint16_t max_extra_pps;          /* runtime limit for the arena size */
+    uint16_t ss;                     /* relative stack segment */
+    uint16_t sp;                     /* initial %sp register */
+    uint16_t checksum;               /* word checksum */
+    uint16_t ip;                     /* initial %ip register */
+    uint16_t cs;                     /* initial %cs relative to load segment */
+    uint16_t reloc_table_offset;     /* offset of the first relocation */
+    uint16_t overlay_num;
+    uint16_t reserved0[4];
+    uint16_t oem_id;
+    uint16_t oem_info;
+    uint16_t reserved1[10];
+    uint32_t peaddr;                 /* address of pe header */
+    char     message[];              /* message to print */
+};
+
+struct pe_hdr {
+    uint32_t magic;                  /* PE magic */
+    uint16_t machine;                /* machine type */
+    uint16_t sections;               /* number of sections */
+    uint32_t timestamp;
+    uint32_t symbol_table;           /* symbol table offset */
+    uint32_t symbols;                /* number of symbols */
+    uint16_t opt_hdr_size;           /* size of optional header */
+    uint16_t flags;                  /* flags */
+};
+
+struct pe32_opt_hdr {
+    /* "standard" header */
+    uint16_t magic;                  /* file type */
+    uint8_t  ld_major;               /* linker major version */
+    uint8_t  ld_minor;               /* linker minor version */
+    uint32_t text_size;
+    uint32_t data_size;
+    uint32_t bss_size;
+    uint32_t entry_point;            /* file offset of entry point */
+    uint32_t code_base;              /* relative code addr in ram */
+    uint32_t data_base;              /* relative data addr in ram */
+    /* "extra" header fields */
+    uint32_t image_base;             /* preferred load address */
+    uint32_t section_align;          /* alignment in bytes */
+    uint32_t file_align;             /* file alignment in bytes */
+    uint16_t os_major;
+    uint16_t os_minor;
+    uint16_t image_major;
+    uint16_t image_minor;
+    uint16_t subsys_major;
+    uint16_t subsys_minor;
+    uint32_t win32_version;          /* reserved, must be 0 */
+    uint32_t image_size;
+    uint32_t header_size;
+    uint32_t csum;
+    uint16_t subsys;
+    uint16_t dll_flags;
+    uint32_t stack_size_req;         /* amt of stack requested */
+    uint32_t stack_size;             /* amt of stack required */
+    uint32_t heap_size_req;          /* amt of heap requested */
+    uint32_t heap_size;              /* amt of heap required */
+    uint32_t loader_flags;           /* reserved, must be 0 */
+    uint32_t data_dirs;              /* number of data dir entries */
+};
+
+struct pe32plus_opt_hdr {
+    uint16_t magic;                  /* file type */
+    uint8_t  ld_major;               /* linker major version */
+    uint8_t  ld_minor;               /* linker minor version */
+    uint32_t text_size;
+    uint32_t data_size;
+    uint32_t bss_size;
+    uint32_t entry_point;            /* file offset of entry point */
+    uint32_t code_base;              /* relative code addr in ram */
+    /* "extra" header fields */
+    uint64_t image_base;             /* preferred load address */
+    uint32_t section_align;          /* alignment in bytes */
+    uint32_t file_align;             /* file alignment in bytes */
+    uint16_t os_major;
+    uint16_t os_minor;
+    uint16_t image_major;
+    uint16_t image_minor;
+    uint16_t subsys_major;
+    uint16_t subsys_minor;
+    uint32_t win32_version;          /* reserved, must be 0 */
+    uint32_t image_size;
+    uint32_t header_size;
+    uint32_t csum;
+    uint16_t subsys;
+    uint16_t dll_flags;
+    uint64_t stack_size_req;         /* amt of stack requested */
+    uint64_t stack_size;             /* amt of stack required */
+    uint64_t heap_size_req;          /* amt of heap requested */
+    uint64_t heap_size;              /* amt of heap required */
+    uint32_t loader_flags;           /* reserved, must be 0 */
+    uint32_t data_dirs;              /* number of data dir entries */
+};
+
+struct section_header {
+    char     name[8];                /* name or "/12\0" string tbl offset */
+    uint32_t virtual_size;           /* size of loaded section in ram */
+    uint32_t virtual_address;        /* relative virtual address */
+    uint32_t raw_data_size;          /* size of the section */
+    uint32_t data_addr;              /* file pointer to first page of section */
+    uint32_t relocs;                 /* file pointer to relocation entries */
+    uint32_t line_numbers;
+    uint16_t num_relocs;
+    uint16_t num_lin_numbers;
+    uint32_t flags;
+};
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_PE_H */
diff --git a/xen/arch/riscv/include/asm/riscv_image_header.h b/xen/arch/riscv/include/asm/riscv_image_header.h
new file mode 100644
index 0000000000..89c7511d56
--- /dev/null
+++ b/xen/arch/riscv/include/asm/riscv_image_header.h
@@ -0,0 +1,54 @@
+#ifndef _ASM_RISCV_IMAGE_H
+#define _ASM_RISCV_IMAGE_H
+
+#define RISCV_IMAGE_MAGIC "RISCV\0\0\0"
+#define RISCV_IMAGE_MAGIC2 "RSC\x05"
+
+#define RISCV_IMAGE_FLAG_BE_SHIFT 0
+
+#define RISCV_IMAGE_FLAG_LE 0
+#define RISCV_IMAGE_FLAG_BE 1
+
+#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
+
+#define __HEAD_FLAG(field) (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##field##_SHIFT)
+
+#define __HEAD_FLAGS (__HEAD_FLAG(BE))
+
+#define RISCV_HEADER_VERSION_MAJOR 0
+#define RISCV_HEADER_VERSION_MINOR 2
+
+#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
+                              RISCV_HEADER_VERSION_MINOR)
+
+#ifndef __ASSEMBLY__
+/*
+ * struct riscv_image_header - riscv xen image header
+ *
+ * @code0:              Executable code
+ * @code1:              Executable code
+ * @text_offset:        Image load offset
+ * @image_size:         Effective Image size
+ * @reserved:           reserved
+ * @reserved:           reserved
+ * @reserved:           reserved
+ * @magic:              Magic number
+ * @reserved:           reserved
+ * @reserved:           reserved (will be used for PE COFF offset)
+ */
+
+struct riscv_image_header
+{
+    uint32_t code0;
+    uint32_t code1;
+    uint64_t text_offset;
+    uint64_t image_size;
+    uint64_t res1;
+    uint64_t res2;
+    uint64_t res3;
+    uint64_t magic;
+    uint32_t res4;
+    uint32_t res5;
+};
+#endif /* __ASSEMBLY__ */
+#endif /* _ASM_RISCV_IMAGE_H */
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 3261e9fce8..609638b921 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,14 +1,150 @@
 #include <asm/asm.h>
 #include <asm/riscv_encoding.h>
+#include <asm/riscv_image_header.h>
+#ifdef CONFIG_RISCV_EFI
+#include <asm/pe.h>
+#endif
 
         .section .text.header, "ax", %progbits
 
         /*
          * OpenSBI pass to start():
          *   a0 -> hart_id ( bootcpu_id )
-         *   a1 -> dtb_base 
+         *   a1 -> dtb_base
          */
 FUNC(start)
+
+efi_head:
+
+#ifdef CONFIG_RISCV_EFI
+        /*
+         * This instruction decodes to "MZ" ASCII required by UEFI.
+         */
+        c.li s4,-13
+        j xen_start
+#else
+        /* jump to start kernel */
+        j xen_start
+        /* reserved */
+        .word 0
+#endif
+        .balign 8
+#ifdef CONFIG_RISCV_64
+        /* Image load offset(2MB) from start of RAM */
+        .dword 0x200000
+#else
+        /* Image load offset(4MB) from start of RAM */
+        .dword 0x400000
+#endif
+        /* Effective size of xen image */
+        .dword _end - _start
+        .dword __HEAD_FLAGS
+        .word RISCV_HEADER_VERSION
+        .word 0
+        .dword 0
+        .ascii RISCV_IMAGE_MAGIC
+        .balign 4
+        .ascii RISCV_IMAGE_MAGIC2
+#ifndef CONFIG_RISCV_EFI
+        .word 0
+#else
+        .word pe_head_start - efi_head
+pe_head_start:
+        .long	PE_MAGIC
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
+        .long   xen_start - efi_head                    /* BaseOfCode */
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
+        .long   _end - efi_head                         /* SizeOfImage */
+
+        /* Everything before the xen image is considered part of the header */
+        .long   xen_start - efi_head                    /* SizeOfHeaders */
+        .long   0                                       /* CheckSum */
+        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
+        .short  0                                       /* DllCharacteristics */
+        .quad   0                                       /* SizeOfStackReserve */
+        .quad   0                                       /* SizeOfStackCommit */
+        .quad   0                                       /* SizeOfHeapReserve */
+        .quad   0                                       /* SizeOfHeapCommit */
+        .long   0                                       /* LoaderFlags */
+        .long   (section_table - .) / 8                 /* NumberOfRvaAndSizes */
+        .quad   0                                       /* ExportTable */
+        .quad   0                                       /* ImportTable */
+        .quad   0                                       /* ResourceTable */
+        .quad   0                                       /* ExceptionTable */
+        .quad   0                                       /* CertificationTable */
+        .quad   0                                       /* BaseRelocationTable */
+
+/* Section table */
+section_table:
+        .ascii  ".text\0\0\0"
+        .long   0
+        .long   0
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
+        .long   _end - xen_start                        /* VirtualSize */
+        .long   xen_start - efi_head                    /* VirtualAddress */
+        .long   __init_end_efi - xen_start              /* SizeOfRawData */
+        .long   xen_start - efi_head                    /* PointerToRawData */
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
+#endif/* CONFIG_RISCV_EFI */
+
+FUNC(xen_start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
@@ -60,6 +196,9 @@ FUNC(start)
         mv      a1, s1
 
         tail    start_xen
+
+END(xen_start)
+
 END(start)
 
         .section .text, "ax", %progbits
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8510a87c4d..2eddde43c1 100644
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
@@ -144,7 +147,7 @@ SECTIONS
     .got.plt : {
         *(.got.plt)
     } : text
-
+    __init_end_efi = .;
     . = ALIGN(POINTER_ALIGN);
     __init_end = .;
 
@@ -165,6 +168,7 @@ SECTIONS
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
     } :text
+
     _end = . ;
 
     /* Section for the device tree blob (if any). */
-- 
2.25.1


