Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AF93A57D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 20:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763475.1173743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKAW-0008AA-B6; Tue, 23 Jul 2024 18:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763475.1173743; Tue, 23 Jul 2024 18:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKAW-00087V-7u; Tue, 23 Jul 2024 18:23:24 +0000
Received: by outflank-mailman (input) for mailman id 763475;
 Tue, 23 Jul 2024 18:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m9Jy=OX=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sWKAU-00087P-Ur
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 18:23:23 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a38c1262-4920-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 20:23:20 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-368313809a4so74918f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 11:23:20 -0700 (PDT)
Received: from Xen-host.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878695165sm12153993f8f.62.2024.07.23.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 11:23:18 -0700 (PDT)
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
X-Inumbo-ID: a38c1262-4920-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721759000; x=1722363800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEKXJ3rnaM1OvcvTBXIXn3MAAErsEuSno4les8Onla4=;
        b=gpv2fpQIy3/p4qq/hhbx4Gqsu9yXHA+yLAiRs/9nRDc1hCpiOPg51aDFTTT3Q6/QNb
         0ffwVNXCh9Aoq48ErHKF4I18dl/tFqTYHWhCLN2yF8HfG46/xxypV8SpIx1kWSHGy72l
         Mn3jPYSwPG8uwnWTeRIAV0HYfDEHmNR+1hFsj8ogVXlQYLprvDESswx6+IphysDor/fY
         Y0Xvki9PZ7yfJRfOYMUMKTuvWORWqm6TA1ThXk8jtEFgzANL+5T22lLB1jKkrN5yTHsy
         D2MGonY8aV0JardKJLgHkVn5zBqa7xx9D9GnMHq7rqA28vH/oM3Xc1RatxkaeHbzz97o
         9vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721759000; x=1722363800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEKXJ3rnaM1OvcvTBXIXn3MAAErsEuSno4les8Onla4=;
        b=b21j1ISVX4k2Jory/Rf7tlO+mN/C/fcm+Cez9t8m41LBNCpCPzVmXq1UCK9OMGki/O
         kfrXCFvRXT78/sU/4L8pQ9U1CtOu4XNNr6UABAwmxn9LL+jAQ/TC9NVUnr6jpiIoWITc
         UpTuPgVSlIfgvU9cnmo/Ro58/DM+bY/ctLFFDeVGXnt65dpfags3fYuKohyb7/gLok7X
         XNHoFb0Sfui5RLocpn0PU5nj18OFTUehqCFKII09U67L4ZLaIgRADezW+mnDYIaZqXAW
         3K8eAUeyEqHGWngle2FOZcbKAjH2ldSatd2eU7iI7nqMjLAvhaSMJIF1nOlMHcqiL/rP
         NiGg==
X-Gm-Message-State: AOJu0Yw3XgYDwSPg53j9twE9TvOHYpViOIOrn3BZNycKpnCDV4XSdGA/
	0xamfWouoF/ILJ1AoHX/jBMgtttLSANZVdgZR/kXIimyKBpfaL0UBZ6jBuuW
X-Google-Smtp-Source: AGHT+IF3Fo/93/hCrwGY9D48HZbsCXb4BnNPN4ndkhdnPMjtwU39QaZeKp+eQ777InDukQAZZAlSsg==
X-Received: by 2002:a05:6000:1544:b0:366:df35:b64f with SMTP id ffacd0b85a97d-369e3e5a4f9mr2768780f8f.4.1721758999264;
        Tue, 23 Jul 2024 11:23:19 -0700 (PDT)
From: Milan Djokic <milandjokic1995@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Milan Djokic <milan.djokic@rt-rk.com>
Subject: [PATCH v2] xen: PE/COFF image header
Date: Tue, 23 Jul 2024 20:22:06 +0200
Message-Id: <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikola Jelic <nikola.jelic@rt-rk.com>

Added PE/COFF generic image header which shall be used for EFI
application format for x86/risc-v. x86 and risc-v source shall be adjusted
to use this header in following commits. pe.h header is taken over from
linux kernel with minor changes in terms of formatting and structure member comments.
Also, COFF relocation and win cert structures are ommited, since these are not relevant for Xen.

Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 36e4fc57fc16

Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
---
This header is split into a separate commit following discussion from https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00166.html
Upcoming commit shall modify x86 implementation to use this header
instead of internal structures.
---
Changes in V2:
  - Fixed header formatting and some structure member names/comments
  - Removed linux kernel specific macros (EFI stub version, linux pe
magic)
  - Removed duplicated values
  - Removed COFF relocation and win cert structures which are not relevant for Xen
---
 xen/include/efi/pe.h | 291 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)
 create mode 100644 xen/include/efi/pe.h

diff --git a/xen/include/efi/pe.h b/xen/include/efi/pe.h
new file mode 100644
index 0000000000..64e047e88b
--- /dev/null
+++ b/xen/include/efi/pe.h
@@ -0,0 +1,291 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2011 Red Hat, Inc.
+ * All rights reserved.
+ *
+ * Author(s): Peter Jones <pjones@redhat.com>
+ */
+#ifndef EFI__PE_H
+#define EFI__PE_H
+
+#define MZ_MAGIC 0x5a4d /* "MZ" */
+
+#define PE_MAGIC              0x00004550 /* "PE\0\0" */
+#define PE_OPT_MAGIC_PE32     0x010b
+#define PE_OPT_MAGIC_PE32_ROM 0x0107
+#define PE_OPT_MAGIC_PE32PLUS 0x020b
+
+/* machine type */
+#define IMAGE_FILE_MACHINE_UNKNOWN     0x0000
+#define IMAGE_FILE_MACHINE_AM33        0x01d3
+#define IMAGE_FILE_MACHINE_AMD64       0x8664
+#define IMAGE_FILE_MACHINE_ARM         0x01c0
+#define IMAGE_FILE_MACHINE_ARMV7       0x01c4
+#define IMAGE_FILE_MACHINE_ARM64       0xaa64
+#define IMAGE_FILE_MACHINE_EBC         0x0ebc
+#define IMAGE_FILE_MACHINE_I386        0x014c
+#define IMAGE_FILE_MACHINE_IA64        0x0200
+#define IMAGE_FILE_MACHINE_M32R        0x9041
+#define IMAGE_FILE_MACHINE_MIPS16      0x0266
+#define IMAGE_FILE_MACHINE_MIPSFPU     0x0366
+#define IMAGE_FILE_MACHINE_MIPSFPU16   0x0466
+#define IMAGE_FILE_MACHINE_POWERPC     0x01f0
+#define IMAGE_FILE_MACHINE_POWERPCFP   0x01f1
+#define IMAGE_FILE_MACHINE_R4000       0x0166
+#define IMAGE_FILE_MACHINE_RISCV32     0x5032
+#define IMAGE_FILE_MACHINE_RISCV64     0x5064
+#define IMAGE_FILE_MACHINE_RISCV128    0x5128
+#define IMAGE_FILE_MACHINE_SH3         0x01a2
+#define IMAGE_FILE_MACHINE_SH3DSP      0x01a3
+#define IMAGE_FILE_MACHINE_SH3E        0x01a4
+#define IMAGE_FILE_MACHINE_SH4         0x01a6
+#define IMAGE_FILE_MACHINE_SH5         0x01a8
+#define IMAGE_FILE_MACHINE_THUMB       0x01c2
+#define IMAGE_FILE_MACHINE_WCEMIPSV2   0x0169
+#define IMAGE_FILE_MACHINE_LOONGARCH32 0x6232
+#define IMAGE_FILE_MACHINE_LOONGARCH64 0x6264
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
+#define IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT         0x0001
+#define IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT 0x0040
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
+/* and here they just stuck a 1-nibble integer in the middle of a bitfield */
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
+#define IMAGE_DEBUG_TYPE_CODEVIEW              2
+#define IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS 20
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
+    uint32_t peaddr;             /* file offset of PE header */
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
+/*
+ * the fact that pe32 isn't padded where pe32+ is 64-bit means union won't
+ * work right.
+ */
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
+    uint16_t dll_flags;      /* more flags! */
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
+    uint16_t dll_flags;      /* more flags! */
+    uint64_t stack_size_req; /* amt of stack requested */
+    uint64_t stack_size;     /* amt of stack required */
+    uint64_t heap_size_req;  /* amt of heap requested */
+    uint64_t heap_size;      /* amt of heap required */
+    uint32_t loader_flags;   /* reserved, must be 0 */
+    uint32_t data_dirs;      /* number of data dir entries */
+};
+
+struct data_dirent {
+    uint32_t rva;            /* relative to load address */
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
+    uint32_t rva;             /* relative virtual address */
+    uint32_t raw_data_size;   /* size of the section */
+    uint32_t data_addr;       /* file pointer to first page of sec */
+    uint32_t relocs;          /* file pointer to relocation entries */
+    uint32_t line_numbers;    /* line numbers */
+    uint16_t num_relocs;      /* number of relocations */
+    uint16_t num_lin_numbers; /* COFF line count */
+    uint32_t flags;
+};
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* EFI__PE_H */
-- 
2.25.1


