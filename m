Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F02960C72
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784033.1193378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwTe-00060v-Qh; Tue, 27 Aug 2024 13:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784033.1193378; Tue, 27 Aug 2024 13:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwTe-0005yN-NZ; Tue, 27 Aug 2024 13:43:18 +0000
Received: by outflank-mailman (input) for mailman id 784033;
 Tue, 27 Aug 2024 13:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srL3=P2=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1siwTc-0005yA-Gr
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:43:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee487af-647a-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 15:43:14 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-428f5c0833bso34973565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:43:14 -0700 (PDT)
Received: from Xen-host.domain.local ([89.216.37.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abed922b4sm224508655e9.11.2024.08.27.06.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:43:12 -0700 (PDT)
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
X-Inumbo-ID: 4ee487af-647a-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724766194; x=1725370994; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Tgax+vjGdtrfqrPbjfbqDqR1Q/xtHhM/7GrhsWe0+Q=;
        b=nnVVghhCEzkz95t+vfCRGml8u1QwQmWJ8rlO+mgOeJWvNU6abJPohObmRWL538etvJ
         3qrPGgH2Sv/tfzS3MMRMojzJJe1VGxBnX5eK+QILtXQ/UTrpy9/m7YcA7Ibgkyl0JN7j
         WC04k7SEqtKVKQofSBGxOxUA3gm8C2MLc7D+8wpcCid6QpazGx986Q+CJSkIH/dUieXw
         3Wcv3Rzp2+4/S9X6ifKAwA0oGCq9A37+1e9cCvvFAL3VwCPVudyMih5ijXlqMARC8hIZ
         V65SkAIyYNuWfZFEPQLDC7KJ3/gkq8usYCb5h6c5zhsWunHuMHOxiqmhIOXCIuNZVDRt
         3xMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766194; x=1725370994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Tgax+vjGdtrfqrPbjfbqDqR1Q/xtHhM/7GrhsWe0+Q=;
        b=rMhDGsTLH1mBQrTsssse92jvBgvHp+LTkNGIRVXc91rPsVivbsfBEhk8uCh9FAigEX
         WX2eoFru3uu+O1z/1NC5vy5n2yiXqmQHdkvvtXtVvOZpYMuXAOH8cL775pFWKKmgvPHn
         x/x5DxtOyL0v6JHtjXYaY+/qlXJCZLndO+ElcQ2HXmeysiVszEeXO0YQ/+W34v3Z6qF9
         ZAGm4OaeyZxrIToLPbB++9ZUpOLsbQksRKMu9OAhssrPB9rdax/HHK3wnK9KYyJ93wq9
         uWM30bod6wJQiPeL7Mp/h4pdSXuD5NYCPVVYtRiQ9EUoko87JBlDECtESxKNXbYRQC7d
         bMUw==
X-Gm-Message-State: AOJu0YwezKgwdUJPGedR46n0XtmULERAHz42SozUUmv2xxv+kOwK2FKt
	ivb+Bfqj+fBS+s5PxTcYyYWDtHTHDjAPedV/vkFYx8XsZewslAxOk7R7TuNu
X-Google-Smtp-Source: AGHT+IEFiwKleDqqXWpVs+bQ/rh6tyVbHOUPBcweltDZaX5aM0/89sUTKHE3APO7xO/9Z1c0RU+kFA==
X-Received: by 2002:adf:fc0d:0:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-3748c88a349mr1892085f8f.21.1724766193283;
        Tue, 27 Aug 2024 06:43:13 -0700 (PDT)
From: Milan Djokic <milandjokic1995@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Nikola Jelic <nikola.jelic@rt-rk.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Milan Djokic <milan.djokic@rt-rk.com>
Subject: [PATCH v2] x86/efi: Use generic PE/COFF structures
Date: Tue, 27 Aug 2024 15:42:10 +0200
Message-Id: <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikola Jelic <nikola.jelic@rt-rk.com>

Adapted x86 efi parser and mkreloc utility to use generic PE header
(efi/pe.h), instead of locally defined structures for each component.

Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
---
Changes in V2:
  - Using pe header constants instead of hardcoded values (magic,
    machine)
---
 xen/arch/x86/efi/mkreloc.c | 134 +++++++++++--------------------------
 xen/common/efi/pe.c        |  96 ++++++--------------------
 2 files changed, 61 insertions(+), 169 deletions(-)

diff --git a/xen/arch/x86/efi/mkreloc.c b/xen/arch/x86/efi/mkreloc.c
index 083740ab8a..89c525d81e 100644
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -9,45 +9,7 @@
 #include <sys/mman.h>
 #include <unistd.h>
 
-struct mz_hdr {
-    uint16_t signature;
-#define MZ_SIGNATURE 0x5a4d
-    uint16_t last_page_size;
-    uint16_t page_count;
-    uint16_t relocation_count;
-    uint16_t header_paras;
-    uint16_t min_paras;
-    uint16_t max_paras;
-    uint16_t entry_ss;
-    uint16_t entry_sp;
-    uint16_t checksum;
-    uint16_t entry_ip;
-    uint16_t entry_cs;
-    uint16_t relocations;
-    uint16_t overlay;
-    uint8_t reserved[32];
-    uint32_t extended_header_base;
-};
-
-struct pe_hdr {
-    uint32_t signature;
-#define PE_SIGNATURE 0x00004550
-    uint16_t cpu;
-    uint16_t section_count;
-    int32_t timestamp;
-    uint32_t symbols_file_offset;
-    uint32_t symbol_count;
-    uint16_t opt_hdr_size;
-    uint16_t flags;
-    struct {
-        uint16_t magic;
-#define PE_MAGIC_EXE32     0x010b
-#define PE_MAGIC_EXE32PLUS 0x020b
-        uint8_t linker_major, linker_minor;
-        uint32_t code_size, data_size, bss_size;
-        uint32_t entry_rva, code_rva, data_rva;
-    } opt_hdr;
-};
+#include "../../../include/efi/pe.h"
 
 #define PE_PAGE_SIZE 0x1000
 
@@ -55,22 +17,6 @@ struct pe_hdr {
 #define PE_BASE_RELOC_HIGHLOW  3
 #define PE_BASE_RELOC_DIR64   10
 
-struct coff_section {
-    char name[8];
-    uint32_t size;
-    uint32_t rva;
-    uint32_t file_size;
-    uint32_t file_offset;
-    uint32_t relocation_file_offset;
-    uint32_t line_number_file_offset;
-    uint16_t relocation_count;
-    uint16_t line_number_count;
-    uint32_t flags;
-#define COFF_SECTION_BSS         0x00000080U
-#define COFF_SECTION_DISCARDABLE 0x02000000U
-#define COFF_SECTION_WRITEABLE   0x80000000U
-};
-
 static void usage(const char *cmd, int rc)
 {
     fprintf(rc ? stderr : stdout,
@@ -80,7 +26,7 @@ static void usage(const char *cmd, int rc)
 }
 
 static unsigned int load(const char *name, int *handle,
-                         struct coff_section **sections,
+                         struct section_header **sections,
                          uint_fast64_t *image_base,
                          uint32_t *image_size,
                          unsigned int *width)
@@ -88,6 +34,7 @@ static unsigned int load(const char *name, int *handle,
     int in = open(name, O_RDONLY);
     struct mz_hdr mz_hdr;
     struct pe_hdr pe_hdr;
+    struct pe32_opt_hdr pe32_opt_hdr;
     uint32_t base;
 
     if ( in < 0 ||
@@ -96,16 +43,17 @@ static unsigned int load(const char *name, int *handle,
         perror(name);
         exit(2);
     }
-    if ( mz_hdr.signature != MZ_SIGNATURE ||
-         mz_hdr.relocations < sizeof(mz_hdr) ||
-         !mz_hdr.extended_header_base )
+    if ( mz_hdr.magic != MZ_MAGIC ||
+         mz_hdr.reloc_table_offset < sizeof(mz_hdr) ||
+         !mz_hdr.peaddr )
     {
         fprintf(stderr, "%s: Wrong DOS file format\n", name);
         exit(2);
     }
 
-    if ( lseek(in, mz_hdr.extended_header_base, SEEK_SET) < 0 ||
+    if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
          read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
+         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
          read(in, &base, sizeof(base)) != sizeof(base) ||
          /*
           * Luckily the image size field lives at the
@@ -117,35 +65,33 @@ static unsigned int load(const char *name, int *handle,
         perror(name);
         exit(3);
     }
-    switch ( (pe_hdr.signature == PE_SIGNATURE &&
-              pe_hdr.opt_hdr_size > sizeof(pe_hdr.opt_hdr)) *
-             pe_hdr.opt_hdr.magic )
+    switch ( (pe_hdr.magic == PE_MAGIC &&
+              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
+              pe32_opt_hdr.magic )
     {
-    case PE_MAGIC_EXE32:
+    case PE_OPT_MAGIC_PE32:
         *width = 32;
         *image_base = base;
         break;
-    case PE_MAGIC_EXE32PLUS:
+    case PE_OPT_MAGIC_PE32PLUS:
         *width = 64;
-        *image_base = ((uint64_t)base << 32) | pe_hdr.opt_hdr.data_rva;
+        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
         break;
     default:
         fprintf(stderr, "%s: Wrong PE file format\n", name);
         exit(3);
     }
 
-    *sections = malloc(pe_hdr.section_count * sizeof(**sections));
+    *sections = malloc(pe_hdr.sections * sizeof(**sections));
     if ( !*sections )
     {
         perror(NULL);
         exit(4);
     }
-    if ( lseek(in,
-               mz_hdr.extended_header_base + offsetof(struct pe_hdr, opt_hdr) +
-                  pe_hdr.opt_hdr_size,
+    if ( lseek(in, mz_hdr.peaddr + sizeof(pe_hdr) + pe_hdr.opt_hdr_size,
                SEEK_SET) < 0 ||
-         read(in, *sections, pe_hdr.section_count * sizeof(**sections)) !=
-             pe_hdr.section_count * sizeof(**sections) )
+         read(in, *sections, pe_hdr.sections * sizeof(**sections)) !=
+             pe_hdr.sections * sizeof(**sections) )
     {
         perror(name);
         exit(4);
@@ -153,12 +99,12 @@ static unsigned int load(const char *name, int *handle,
 
     *handle = in;
 
-    return pe_hdr.section_count;
+    return pe_hdr.sections;
 }
 
 static long page_size;
 
-static const void *map_section(const struct coff_section *sec, int in,
+static const void *map_section(const struct section_header *sec, int in,
                                const char *name)
 {
     const char *ptr;
@@ -166,10 +112,10 @@ static const void *map_section(const struct coff_section *sec, int in,
 
     if ( !page_size )
         page_size = sysconf(_SC_PAGESIZE);
-    offs = sec->file_offset & (page_size - 1);
+    offs = sec->data_addr & (page_size - 1);
 
-    ptr = mmap(0, offs + sec->file_size, PROT_READ, MAP_PRIVATE, in,
-               sec->file_offset - offs);
+    ptr = mmap(0, offs + sec->raw_data_size, PROT_READ, MAP_PRIVATE, in,
+               sec->data_addr - offs);
     if ( ptr == MAP_FAILED )
     {
         perror(name);
@@ -179,15 +125,15 @@ static const void *map_section(const struct coff_section *sec, int in,
     return ptr + offs;
 }
 
-static void unmap_section(const void *ptr, const struct coff_section *sec)
+static void unmap_section(const void *ptr, const struct section_header *sec)
 {
-    unsigned long offs = sec->file_offset & (page_size - 1);
+    unsigned long offs = sec->data_addr & (page_size - 1);
 
-    munmap((char *)ptr - offs, offs + sec->file_size);
+    munmap((char *)ptr - offs, offs + sec->raw_data_size);
 }
 
 static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
-                          const struct coff_section *sec,
+                          const struct section_header *sec,
                           int_fast64_t diff, unsigned int width,
                           uint_fast64_t base, uint_fast64_t end)
 {
@@ -208,7 +154,7 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
     while ( !(diff & (((int_fast64_t)1 << ((disp + 1) * CHAR_BIT)) - 1)) )
         ++disp;
 
-    for ( i = 0; i < sec->file_size; ++i )
+    for ( i = 0; i < sec->raw_data_size; ++i )
     {
         uint_fast32_t rva;
         union {
@@ -222,7 +168,7 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
         if ( ptr1[i] == ptr2[i] )
             continue;
 
-        if ( i < disp || i + width - disp > sec->file_size )
+        if ( i < disp || i + width - disp > sec->raw_data_size )
         {
             fprintf(stderr,
                     "Bogus difference at %.8s:%08" PRIxFAST32 "\n",
@@ -250,11 +196,11 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
             reloc_size += reloc_size & 2;
             if ( reloc_size )
                 printf("\t.equ rva_%08" PRIxFAST32 "_relocs,"
-                             " %#08" PRIxFAST32 "\n",
+                       " %#08" PRIxFAST32 "\n",
                        cur_rva, reloc_size);
             printf("\t.balign 4\n"
                    "\t.long %#08" PRIxFAST32 ","
-                          " rva_%08" PRIxFAST32 "_relocs\n",
+                   " rva_%08" PRIxFAST32 "_relocs\n",
                    rva, rva);
             cur_rva = rva;
             reloc_size = 8;
@@ -267,7 +213,7 @@ static void diff_sections(const unsigned char *ptr1, const unsigned char *ptr2,
             exit(3);
         }
 
-        if ( !(sec->flags & COFF_SECTION_WRITEABLE) )
+        if ( !(sec->flags & IMAGE_SCN_MEM_WRITE) )
             fprintf(stderr,
                     "Warning: relocation to r/o section %.8s:%08" PRIxFAST32 "\n",
                     sec->name, i - disp);
@@ -285,7 +231,7 @@ int main(int argc, char *argv[])
     unsigned int i, nsec, width1, width2;
     uint_fast64_t base1, base2;
     uint32_t size1, size2;
-    struct coff_section *sec1, *sec2;
+    struct section_header *sec1, *sec2;
 
     if ( argc == 1 ||
          !strcmp(argv[1], "-?") ||
@@ -328,16 +274,16 @@ int main(int argc, char *argv[])
 
         if ( memcmp(sec1[i].name, sec2[i].name, sizeof(sec1[i].name)) ||
              sec1[i].rva != sec2[i].rva ||
-             sec1[i].size != sec2[i].size ||
-             sec1[i].file_size != sec2[i].file_size ||
+             sec1[i].virtual_size != sec2[i].virtual_size ||
+             sec1[i].raw_data_size != sec2[i].raw_data_size ||
              sec1[i].flags != sec2[i].flags )
         {
             fprintf(stderr, "Mismatched section %u parameters\n", i);
             return 5;
         }
 
-        if ( !sec1[i].size ||
-             (sec1[i].flags & (COFF_SECTION_DISCARDABLE|COFF_SECTION_BSS)) )
+        if ( !sec1[i].virtual_size ||
+             (sec1[i].flags & (IMAGE_SCN_MEM_DISCARDABLE | IMAGE_SCN_CNT_UNINITIALIZED_DATA)) )
             continue;
 
         /*
@@ -354,10 +300,10 @@ int main(int argc, char *argv[])
             return 3;
         }
 
-        if ( sec1[i].file_size > sec1[i].size )
+        if ( sec1[i].raw_data_size > sec1[i].virtual_size )
         {
-            sec1[i].file_size = sec1[i].size;
-            sec2[i].file_size = sec2[i].size;
+            sec1[i].raw_data_size = sec1[i].virtual_size;
+            sec2[i].raw_data_size = sec2[i].virtual_size;
         }
         ptr1 = map_section(sec1 + i, in1, argv[1]);
         ptr2 = map_section(sec2 + i, in2, argv[2]);
diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
index ef8a2543e0..560f35188d 100644
--- a/xen/common/efi/pe.c
+++ b/xen/common/efi/pe.c
@@ -20,78 +20,28 @@
  * Lesser General Public License for more details.
  */
 
-
 #include "efi.h"
+#include "efi/pe.h"
 
-struct DosFileHeader {
-    UINT8   Magic[2];
-    UINT16  LastSize;
-    UINT16  nBlocks;
-    UINT16  nReloc;
-    UINT16  HdrSize;
-    UINT16  MinAlloc;
-    UINT16  MaxAlloc;
-    UINT16  ss;
-    UINT16  sp;
-    UINT16  Checksum;
-    UINT16  ip;
-    UINT16  cs;
-    UINT16  RelocPos;
-    UINT16  nOverlay;
-    UINT16  reserved[4];
-    UINT16  OEMId;
-    UINT16  OEMInfo;
-    UINT16  reserved2[10];
-    UINT32  ExeHeader;
-};
-
-#if defined(__arm__) || defined (__aarch64__)
-#define PE_HEADER_MACHINE 0xaa64
+#if defined(__arm__) || defined(__aarch64__)
+#define PE_HEADER_MACHINE IMAGE_FILE_MACHINE_ARM64
 #elif defined(__x86_64__)
-#define PE_HEADER_MACHINE 0x8664
+#define PE_HEADER_MACHINE IMAGE_FILE_MACHINE_AMD64
 #else
 #error "Unknown architecture"
 #endif
 
-struct PeFileHeader {
-    UINT16  Machine;
-    UINT16  NumberOfSections;
-    UINT32  TimeDateStamp;
-    UINT32  PointerToSymbolTable;
-    UINT32  NumberOfSymbols;
-    UINT16  SizeOfOptionalHeader;
-    UINT16  Characteristics;
-};
-
-struct PeHeader {
-    UINT8   Magic[4];
-    struct PeFileHeader FileHeader;
-};
-
-struct PeSectionHeader {
-    CHAR8   Name[8];
-    UINT32  VirtualSize;
-    UINT32  VirtualAddress;
-    UINT32  SizeOfRawData;
-    UINT32  PointerToRawData;
-    UINT32  PointerToRelocations;
-    UINT32  PointerToLinenumbers;
-    UINT16  NumberOfRelocations;
-    UINT16  NumberOfLinenumbers;
-    UINT32  Characteristics;
-};
-
-static bool __init pe_name_compare(const struct PeSectionHeader *sect,
+static bool __init pe_name_compare(const struct section_header *sect,
                                    const CHAR16 *name)
 {
     size_t i;
 
-    if ( sect->Name[0] != '.' )
+    if ( sect->name[0] != '.' )
         return false;
 
-    for ( i = 1; i < sizeof(sect->Name); i++ )
+    for ( i = 1; i < sizeof(sect->name); i++ )
     {
-        const char c = sect->Name[i];
+        const char c = sect->name[i];
 
         if ( c != name[i - 1] )
             return false;
@@ -105,33 +55,29 @@ static bool __init pe_name_compare(const struct PeSectionHeader *sect,
 const void *__init pe_find_section(const void *image, const UINTN image_size,
                                    const CHAR16 *section_name, UINTN *size_out)
 {
-    const struct DosFileHeader *dos = image;
-    const struct PeHeader *pe;
-    const struct PeSectionHeader *sect;
+    const struct mz_hdr *mz = image;
+    const struct pe_hdr *pe;
+    const struct section_header *sect;
     UINTN offset, i;
 
-    if ( image_size < sizeof(*dos) ||
-         dos->Magic[0] != 'M' ||
-         dos->Magic[1] != 'Z' )
+    if ( image_size < sizeof(*mz) ||
+         mz->magic != MZ_MAGIC )
         return NULL;
 
-    offset = dos->ExeHeader;
+    offset = mz->peaddr;
     pe = image + offset;
 
     offset += sizeof(*pe);
     if ( image_size < offset ||
-         pe->Magic[0] != 'P' ||
-         pe->Magic[1] != 'E' ||
-         pe->Magic[2] != '\0' ||
-         pe->Magic[3] != '\0' )
+         pe->magic != PE_MAGIC )
         return NULL;
 
-    if ( pe->FileHeader.Machine != PE_HEADER_MACHINE )
+    if ( pe->machine != PE_HEADER_MACHINE )
         return NULL;
 
-    offset += pe->FileHeader.SizeOfOptionalHeader;
+    offset += pe->opt_hdr_size;
 
-    for ( i = 0; i < pe->FileHeader.NumberOfSections; i++ )
+    for ( i = 0; i < pe->sections; i++ )
     {
         sect = image + offset;
         if ( image_size < offset + sizeof(*sect) )
@@ -143,13 +89,13 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
             continue;
         }
 
-        if ( image_size < sect->VirtualSize + sect->VirtualAddress )
+        if ( image_size < sect->virtual_size + sect->rva )
             blexit(L"PE invalid section size + address");
 
         if ( size_out )
-            *size_out = sect->VirtualSize;
+            *size_out = sect->virtual_size;
 
-        return image + sect->VirtualAddress;
+        return image + sect->rva;
     }
 
     return NULL;
-- 
2.25.1


