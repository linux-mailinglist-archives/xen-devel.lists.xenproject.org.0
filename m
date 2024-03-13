Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68887AA0C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692521.1079778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBv-0008Pe-Dz; Wed, 13 Mar 2024 15:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692521.1079778; Wed, 13 Mar 2024 15:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQBv-0008Kj-6v; Wed, 13 Mar 2024 15:06:51 +0000
Received: by outflank-mailman (input) for mailman id 692521;
 Wed, 13 Mar 2024 15:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQBt-0007E2-3u
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:06:49 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4efe53db-e14b-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 16:06:46 +0100 (CET)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7885bb1b760so52683685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:06:46 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a0ccb8a000000b0068fba49ae81sm4786811qvk.57.2024.03.13.08.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:06:44 -0700 (PDT)
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
X-Inumbo-ID: 4efe53db-e14b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342405; x=1710947205; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnCQ6iGEQlGDwp0KgZ7SdE2CyEyUyRyRTqUnAJN4R94=;
        b=p0Q3IN0r0VAcp9VMU56fx808dfWqDJzY2o7qhjk57+TKAKazXNwsTOp/g7IuzXe8LR
         VED4feMAUpfywv1OpqVS61kT/3sTnhGfbzkJjBx9av30U3oFWcDBg1lp55VMucuh6lLN
         njmVXmX3T3NDWZVJ1cDpO2YhdcDN+mvqFMpEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342405; x=1710947205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnCQ6iGEQlGDwp0KgZ7SdE2CyEyUyRyRTqUnAJN4R94=;
        b=BY5Mrus7BsEhKzDahT6hgAsg335Ae5tmWR1aJwp84MBXnx+znTDqxy7m0H8dis9vKZ
         /9HIbvqFgs/X7FkBeo2FnU8yUG6x1NdBSaNeWFowzaChU4i1JJm5FJ08AdDkpGPyKYdx
         bfUsXHNpoUvnqdoCWFhebbHkOSYYdv99UonyQaUb2YOHLFCQk609LHCBrgV439L8kiiO
         iqIoolUeTNPpZucrxd5yWKo7m7lzSsrBUbU8Ra/SeOK8vOPSnPnGKeucPRRR/YI+BmUM
         wn4eOzUag6CxCJNy8FR801WkwWqRrUMI6KGCNAREe6QiW7DMl+BsZoFo/RNPLIkYHWdo
         zR6Q==
X-Gm-Message-State: AOJu0Yw21eT30ccE7MG2N2L2q0Ye9IhQ4qQ7JjefH5HOH4T9m54RAMCx
	lYs9L6N7YWHopH+Q4s63isXi6AtYkw7UKU9Xw4cBMTd3MSC8LO1cf8+xXP0Swgy6VBYWZ4KORNt
	6rQ==
X-Google-Smtp-Source: AGHT+IFtTSlpAbXFsRrwJaGE4XLyNfpqFwXS0lTUp2QVeXs6Lh+rmtvs+mnKLVyFDIP0W8U3Vm+FmQ==
X-Received: by 2002:a0c:fa87:0:b0:690:d102:a6a8 with SMTP id o7-20020a0cfa87000000b00690d102a6a8mr64516qvn.42.1710342405258;
        Wed, 13 Mar 2024 08:06:45 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: grub-devel@gnu.org
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/7] multiboot2: Add PE load support
Date: Wed, 13 Mar 2024 15:07:45 +0000
Message-ID: <20240313150748.791236-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150748.791236-1-ross.lagerwall@citrix.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ability to load multiboot binaries in PE format. This allows the
binaries to be signed and verified.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 grub-core/Makefile.core.def       |   1 +
 grub-core/loader/multiboot_mbi2.c |  15 +-
 grub-core/loader/multiboot_pe.c   | 694 ++++++++++++++++++++++++++++++
 include/grub/efi/pe32.h           |  64 +++
 include/grub/multiboot2.h         |   3 +
 5 files changed, 775 insertions(+), 2 deletions(-)
 create mode 100644 grub-core/loader/multiboot_pe.c

diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
index 1571421d7e84..34697ba58171 100644
--- a/grub-core/Makefile.core.def
+++ b/grub-core/Makefile.core.def
@@ -1815,6 +1815,7 @@ module = {
 
   common = loader/multiboot.c;
   common = loader/multiboot_mbi2.c;
+  common = loader/multiboot_pe.c;
   enable = x86;
   enable = i386_xen_pvh;
   enable = mips;
diff --git a/grub-core/loader/multiboot_mbi2.c b/grub-core/loader/multiboot_mbi2.c
index 6ef4f265070a..3ec96e2f29b9 100644
--- a/grub-core/loader/multiboot_mbi2.c
+++ b/grub-core/loader/multiboot_mbi2.c
@@ -389,8 +389,19 @@ grub_multiboot2_load (grub_file_t file, const char *filename)
 	}
       break;
     }
-  case MULTIBOOT_LOAD_TYPE_PE:
-      grub_fatal ("Unsupported load type: %u\n", mld.load_type);
+ case MULTIBOOT_LOAD_TYPE_PE:
+    {
+      mld.file = file;
+      mld.filename = filename;
+      mld.avoid_efi_boot_services = keep_bs;
+      err = grub_multiboot2_load_pe (&mld);
+      if (err)
+        {
+          grub_free (mld.buffer);
+          return err;
+        }
+      break;
+    }
   default:
     /* should be impossible */
     grub_fatal ("Unknown load type: %u\n", mld.load_type);
diff --git a/grub-core/loader/multiboot_pe.c b/grub-core/loader/multiboot_pe.c
new file mode 100644
index 000000000000..7f418348ac70
--- /dev/null
+++ b/grub-core/loader/multiboot_pe.c
@@ -0,0 +1,694 @@
+/*
+ * Significant portions of this code are derived from the Fedora GRUB patch
+ * "0007-Add-secureboot-support-on-efi-chainloader.patch" which is in turn
+ * derived from the PE loading code in Shim. The license is reproduced below:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * Redistributions of source code must retain the above copyright
+ * notice, this list of conditions and the following disclaimer.
+ *
+ * Redistributions in binary form must reproduce the above copyright
+ * notice, this list of conditions and the following disclaimer in the
+ * documentation and/or other materials provided with the
+ * distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+ * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
+ * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+ * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+ * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+ * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
+ * OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * Copyright Peter Jones <pjones@redhat.com>
+ *
+ * Modifications:
+ *
+ * Copyright (c) 2024. Cloud Software Group, Inc.
+ */
+
+#include <grub/multiboot2.h>
+#include <grub/i386/relocator.h>
+#include <grub/efi/pe32.h>
+
+static int
+image_is_64_bit (grub_pe_header_t *pe_hdr)
+{
+  /* .Magic is the same offset in all cases */
+  return pe_hdr->pe32plus.optional_header.magic == GRUB_PE32_PE64_MAGIC;
+}
+
+static const grub_uint16_t machine_type __attribute__((__unused__)) =
+#if defined(__x86_64__)
+  GRUB_PE32_MACHINE_X86_64;
+#elif defined(__aarch64__)
+  GRUB_PE32_MACHINE_ARM64;
+#elif defined(__arm__)
+  GRUB_PE32_MACHINE_ARMTHUMB_MIXED;
+#elif defined(__i386__) || defined(__i486__) || defined(__i686__)
+  GRUB_PE32_MACHINE_I386;
+#elif defined(__ia64__)
+  GRUB_PE32_MACHINE_IA64;
+#elif defined(__riscv) && (__riscv_xlen == 32)
+  GRUB_PE32_MACHINE_RISCV32;
+#elif defined(__riscv) && (__riscv_xlen == 64)
+  GRUB_PE32_MACHINE_RISCV64;
+#else
+#error this architecture is not supported by grub2
+#endif
+
+static int
+image_is_loadable(grub_pe_header_t *pe_hdr)
+{
+  /*
+   * Check the machine type matches the binary and that we recognize
+   * the magic number.
+   */
+    return (pe_hdr->pe32.coff_header.machine == machine_type ||
+            (pe_hdr->pe32.coff_header.machine == GRUB_PE32_MACHINE_X86_64 &&
+             machine_type == GRUB_PE32_MACHINE_I386)) &&
+           (pe_hdr->pe32plus.optional_header.magic == GRUB_PE32_PE32_MAGIC ||
+            pe_hdr->pe32plus.optional_header.magic == GRUB_PE32_PE64_MAGIC);
+}
+
+/*
+ * Read the binary header and grab appropriate information from it
+ */
+static grub_err_t
+read_header(void *data, unsigned int datasize,
+            pe_coff_loader_image_context_t *context)
+{
+  grub_pe32_msdos_header_t *dos_hdr = data;
+  grub_pe_header_t *pe_hdr = data;
+  unsigned long header_without_data_dir, section_header_offset, opt_header_size;
+  unsigned long file_alignment = 0;
+
+  if (datasize < sizeof (pe_hdr->pe32))
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Invalid image");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  if (dos_hdr->e_magic == GRUB_PE32_MAGIC)
+    pe_hdr = (grub_pe_header_t *)((char *)data + dos_hdr->e_lfanew);
+
+  if (!image_is_loadable(pe_hdr))
+    {
+      grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET, "Platform does not support this image");
+      return GRUB_ERR_NOT_IMPLEMENTED_YET;
+    }
+
+  if (image_is_64_bit(pe_hdr))
+    {
+      context->number_of_rva_and_sizes = pe_hdr->pe32plus.optional_header.num_data_directories;
+      context->size_of_headers = pe_hdr->pe32plus.optional_header.header_size;
+      context->image_size = pe_hdr->pe32plus.optional_header.image_size;
+      context->section_alignment = pe_hdr->pe32plus.optional_header.section_alignment;
+      file_alignment = pe_hdr->pe32plus.optional_header.file_alignment;
+      opt_header_size = sizeof(struct grub_pe64_optional_header);
+    }
+  else
+    {
+      context->number_of_rva_and_sizes = pe_hdr->pe32.optional_header.num_data_directories;
+      context->size_of_headers = pe_hdr->pe32.optional_header.header_size;
+      context->image_size = (grub_uint64_t)pe_hdr->pe32.optional_header.image_size;
+      context->section_alignment = pe_hdr->pe32.optional_header.section_alignment;
+      file_alignment = pe_hdr->pe32.optional_header.file_alignment;
+      opt_header_size = sizeof(struct grub_pe32_optional_header);
+    }
+
+  if (file_alignment % 2 != 0)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "File Alignment is invalid (%ld)", file_alignment);
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+  if (file_alignment == 0)
+    file_alignment = 0x200;
+  if (context->section_alignment == 0)
+    context->section_alignment = GRUB_EFI_PAGE_SIZE;
+  if (context->section_alignment < file_alignment)
+    context->section_alignment = file_alignment;
+
+  context->number_of_sections = pe_hdr->pe32.coff_header.num_sections;
+
+  if (EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES < context->number_of_rva_and_sizes)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Image header too small");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  header_without_data_dir = opt_header_size
+                  - sizeof (struct grub_pe32_data_directory) * EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES;
+  if (((grub_uint32_t)pe_hdr->pe32.coff_header.optional_header_size - header_without_data_dir) !=
+                  context->number_of_rva_and_sizes * sizeof (struct grub_pe32_data_directory))
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Image header overflows data directory");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  section_header_offset = dos_hdr->e_lfanew
+                          + sizeof (grub_uint32_t)
+                          + sizeof (struct grub_pe32_coff_header)
+                          + pe_hdr->pe32.coff_header.optional_header_size;
+  if (((grub_uint32_t)context->image_size - section_header_offset) / sizeof(struct grub_pe32_section_table)
+                  <= context->number_of_sections)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Image sections overflow image size");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  if ((context->size_of_headers - section_header_offset) / sizeof(struct grub_pe32_section_table)
+                  < (grub_uint32_t)context->number_of_sections)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Image sections overflow section headers");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  if ((((grub_uint8_t *)pe_hdr - (grub_uint8_t *)data) + sizeof(grub_pe_header_t)) > datasize)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Invalid image");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  if (pe_hdr->pe32.signature[0] != 'P' ||
+              pe_hdr->pe32.signature[1] != 'E' ||
+              pe_hdr->pe32.signature[2] != 0x00 ||
+              pe_hdr->pe32.signature[3] != 0x00)
+    {
+      grub_error (GRUB_ERR_NOT_IMPLEMENTED_YET, "Unsupported image type");
+      return GRUB_ERR_NOT_IMPLEMENTED_YET;
+    }
+
+  context->pe_hdr = pe_hdr;
+
+  if (image_is_64_bit(pe_hdr))
+    {
+      context->image_address = pe_hdr->pe32plus.optional_header.image_base;
+      context->entry_point = pe_hdr->pe32plus.optional_header.entry_addr;
+      context->reloc_dir = &pe_hdr->pe32plus.optional_header.base_relocation_table;
+      context->sec_dir = &pe_hdr->pe32plus.optional_header.certificate_table;
+    }
+  else
+    {
+      context->image_address = pe_hdr->pe32.optional_header.image_base;
+      context->entry_point = pe_hdr->pe32.optional_header.entry_addr;
+      context->reloc_dir = &pe_hdr->pe32.optional_header.base_relocation_table;
+      context->sec_dir = &pe_hdr->pe32.optional_header.certificate_table;
+    }
+
+  context->first_section = (struct grub_pe32_section_table *)((char *)pe_hdr +
+          pe_hdr->pe32.coff_header.optional_header_size +
+          sizeof(grub_uint32_t) + sizeof(struct grub_pe32_coff_header));
+
+  if (context->image_size < context->size_of_headers)
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Invalid image");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+
+  if ((unsigned long)((grub_uint8_t *)context->sec_dir - (grub_uint8_t *)data) >
+      (datasize - sizeof(struct grub_pe32_data_directory)))
+    {
+      grub_error (GRUB_ERR_OUT_OF_RANGE, "Invalid image");
+      return GRUB_ERR_OUT_OF_RANGE;
+    }
+  return GRUB_ERR_NONE;
+}
+
+static grub_phys_addr_t
+image_address (grub_phys_addr_t image, grub_uint64_t sz, grub_uint64_t addr)
+{
+  if (addr > sz)
+    return 0;
+
+  return image + addr;
+}
+
+static grub_err_t
+relocate_coff (pe_coff_loader_image_context_t *context,
+               struct grub_pe32_section_table *section,
+               grub_phys_addr_t phys_addr, grub_uint8_t *virt_addr,
+               mbi_load_data_t *mld)
+{
+  struct grub_pe32_data_directory *reloc_base, *reloc_base_end;
+  grub_uint8_t *reloc_buffer;
+  grub_uint64_t adjust;
+  struct grub_pe32_fixup_block *reloc, *reloc_end;
+  grub_uint8_t *fixup, *fixup_base;
+  grub_uint16_t *fixup_16;
+  grub_uint32_t *fixup_32;
+  grub_uint64_t *fixup_64;
+  int n = 0;
+  grub_err_t ret = GRUB_ERR_NONE;
+
+  if (image_is_64_bit (context->pe_hdr))
+    context->pe_hdr->pe32plus.optional_header.image_base =
+      (grub_uint64_t)(unsigned long)phys_addr;
+  else
+    context->pe_hdr->pe32.optional_header.image_base =
+      (grub_uint32_t)(unsigned long)phys_addr;
+
+  /* Alright, so here's how this works:
+   *
+   * context->reloc_dir gives us two things:
+   * - the VA the table of base relocation blocks are (maybe) to be
+   *   mapped at (reloc_dir->rva)
+   * - the virtual size (reloc_dir->size)
+   *
+   * The .reloc section (section here) gives us some other things:
+   * - the name! kind of. (section->name)
+   * - the virtual size (section->virtual_size), which should be the same
+   *   as RelocDir->Size
+   * - the virtual address (section->virtual_address)
+   * - the file section size (section->raw_data_size), which is
+   *   a multiple of optional_header->file_alignment.  Only useful for image
+   *   validation, not really useful for iteration bounds.
+   * - the file address (section->raw_data_offset)
+   * - a bunch of stuff we don't use that's 0 in our binaries usually
+   * - Flags (section->characteristics)
+   *
+   * and then the thing that's actually at the file address is an array
+   * of struct grub_pe32_fixup_block structs with some values packed behind
+   * them.  The block_size field of this structure includes the
+   * structure itself, and adding it to that structure's address will
+   * yield the next entry in the array.
+   */
+
+  reloc_buffer = grub_malloc (section->virtual_size);
+  if (!reloc_buffer)
+      return grub_errno;
+
+  if (grub_file_seek (mld->file, section->raw_data_offset) == (grub_off_t) -1)
+    {
+      ret = grub_errno;
+      goto out;
+    }
+
+  if (grub_file_read (mld->file, reloc_buffer, section->virtual_size)
+      != (grub_ssize_t) section->virtual_size)
+    {
+      if (!grub_errno)
+        {
+          grub_error (GRUB_ERR_FILE_READ_ERROR, "premature end of file %s",
+                      mld->filename);
+          ret = GRUB_ERR_FILE_READ_ERROR;
+        }
+      else
+          ret = grub_errno;
+      goto out;
+    }
+
+  reloc_base = (struct grub_pe32_data_directory *)reloc_buffer;
+  reloc_base_end = (struct grub_pe32_data_directory *)(reloc_buffer + section->virtual_size);
+
+  grub_dprintf ("multiboot_loader", "relocate_coff(): reloc_base %p reloc_base_end %p\n",
+                reloc_base, reloc_base_end);
+
+  if (!reloc_base && !reloc_base_end)
+    return GRUB_ERR_NONE;
+
+  if (!reloc_base || !reloc_base_end)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT, "Reloc table overflows binary");
+      return GRUB_ERR_BAD_ARGUMENT;
+    }
+
+  adjust = (grub_uint64_t)(grub_efi_uintn_t)phys_addr - context->image_address;
+  if (adjust == 0)
+    return GRUB_ERR_NONE;
+
+  while (reloc_base < reloc_base_end)
+    {
+      grub_uint16_t *entry;
+      reloc = (struct grub_pe32_fixup_block *)((char*)reloc_base);
+
+      if ((reloc_base->size == 0) ||
+          (reloc_base->size > context->reloc_dir->size))
+        {
+          grub_error (GRUB_ERR_BAD_ARGUMENT,
+                      "Reloc %d block size %d is invalid\n", n,
+                      reloc_base->size);
+          ret = GRUB_ERR_BAD_ARGUMENT;
+          goto out;
+        }
+
+      entry = &reloc->entries[0];
+      reloc_end = (struct grub_pe32_fixup_block *)
+        ((char *)reloc_base + reloc_base->size);
+
+      if ((grub_uint8_t *)reloc_end < reloc_buffer ||
+          (grub_uint8_t *)reloc_end > (reloc_buffer + section->virtual_size))
+        {
+          grub_error (GRUB_ERR_BAD_ARGUMENT, "Reloc entry %d overflows binary",
+                      n);
+          return GRUB_ERR_BAD_ARGUMENT;
+        }
+
+      fixup_base = virt_addr + reloc_base->rva;
+      if (!fixup_base)
+        {
+          grub_error (GRUB_ERR_BAD_ARGUMENT, "Reloc %d Invalid fixupbase", n);
+          ret = GRUB_ERR_BAD_ARGUMENT;
+          goto out;
+        }
+
+      while ((void *)entry < (void *)reloc_end)
+        {
+          fixup = fixup_base + (*entry & 0xFFF);
+          switch ((*entry) >> 12)
+            {
+              case GRUB_PE32_REL_BASED_ABSOLUTE:
+                break;
+              case GRUB_PE32_REL_BASED_HIGH:
+                fixup_16 = (grub_uint16_t *)fixup;
+                *fixup_16 = (grub_uint16_t)
+                  (*fixup_16 + ((grub_uint16_t)((grub_uint32_t)adjust >> 16)));
+                break;
+              case GRUB_PE32_REL_BASED_LOW:
+                fixup_16 = (grub_uint16_t *)fixup;
+                *fixup_16 = (grub_uint16_t) (*fixup_16 + (grub_uint16_t)adjust);
+                break;
+              case GRUB_PE32_REL_BASED_HIGHLOW:
+                fixup_32 = (grub_uint32_t *)fixup;
+                *fixup_32 = *fixup_32 + (grub_uint32_t)adjust;
+                break;
+              case GRUB_PE32_REL_BASED_DIR64:
+                fixup_64 = (grub_uint64_t *)fixup;
+                *fixup_64 = *fixup_64 + (grub_uint64_t)adjust;
+                break;
+              default:
+                grub_error (GRUB_ERR_BAD_ARGUMENT,
+                            "Reloc %d unknown relocation type %d",
+                            n, (*entry) >> 12);
+                ret = GRUB_ERR_BAD_ARGUMENT;
+                goto out;
+            }
+          entry += 1;
+        }
+      reloc_base = (struct grub_pe32_data_directory *)reloc_end;
+      n++;
+    }
+
+out:
+  grub_free(reloc_buffer);
+
+  return ret;
+}
+
+grub_err_t
+grub_multiboot2_load_pe (mbi_load_data_t *mld)
+{
+  int i;
+  grub_uint8_t *virt_addr;
+  grub_phys_addr_t phys_addr, reloc_base, reloc_base_end, base, end;
+  struct grub_pe32_section_table *reloc_section = NULL, fake_reloc_section;
+  struct grub_pe32_section_table *section;
+  grub_relocator_chunk_t ch;
+  pe_coff_loader_image_context_t context;
+  grub_err_t ret = GRUB_ERR_NONE;
+  grub_uint32_t section_alignment;
+  int found_entry_point = 0;
+
+  ret = read_header(mld->buffer, MULTIBOOT_SEARCH, &context);
+  if (ret)
+      return ret;
+
+  /*
+   * The spec says, uselessly, of SectionAlignment:
+   * =====
+   * The alignment (in bytes) of sections when they are loaded into
+   * memory. It must be greater than or equal to FileAlignment. The
+   * default is the page size for the architecture.
+   * =====
+   * Which doesn't tell you whose responsibility it is to enforce the
+   * "default", or when.  It implies that the value in the field must
+   * be > FileAlignment (also poorly defined), but it appears visual
+   * studio will happily write 512 for FileAlignment (its default) and
+   * 0 for SectionAlignment, intending to imply PAGE_SIZE.
+   *
+   * We only support one page size, so if it's zero, nerf it to 4096.
+   */
+  section_alignment = context.section_alignment;
+  if (section_alignment == 0)
+    section_alignment = 4096;
+
+  section_alignment = grub_max(section_alignment, mld->align);
+
+  ret = grub_relocator_alloc_chunk_align_safe (grub_multiboot2_relocator, &ch,
+                                               mld->min_addr, mld->max_addr,
+                                               context.image_size, section_alignment,
+                                               mld->preference, mld->avoid_efi_boot_services);
+
+  if (ret)
+    {
+      grub_dprintf ("multiboot_loader", "Cannot allocate memory for OS image\n");
+      return ret;
+    }
+
+  virt_addr = get_virtual_current_address (ch);
+  phys_addr = get_physical_target_address (ch);
+
+  if (grub_file_seek (mld->file, 0) == (grub_off_t) -1) {
+      ret = grub_errno;
+      goto out;
+  }
+
+  if (grub_file_read (mld->file, virt_addr, context.size_of_headers)
+      != (grub_ssize_t) context.size_of_headers)
+    {
+      if (!grub_errno)
+        {
+          grub_error (GRUB_ERR_FILE_READ_ERROR, "premature end of file %s",
+                      mld->filename);
+          ret = GRUB_ERR_FILE_READ_ERROR;
+        }
+      else
+          ret = grub_errno;
+      goto out;
+    }
+
+  mld->load_base_addr = phys_addr;
+  mld->link_base_addr = context.image_address;
+
+  grub_dprintf ("multiboot_loader", "load_base_addr: 0x%08x link_base_addr 0x%08x\n",
+                mld->load_base_addr, mld->link_base_addr);
+
+  grub_multiboot2_payload_eip = context.entry_point;
+  grub_dprintf ("multiboot_loader", "entry_point: 0x%08x\n", grub_multiboot2_payload_eip);
+  if (!grub_multiboot2_payload_eip)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT, "invalid entry point");
+      ret = GRUB_ERR_BAD_ARGUMENT;
+      goto out;
+    }
+
+  grub_dprintf ("multiboot_loader", "reloc_dir: %p reloc_size: 0x%08x\n",
+                (void *)(unsigned long)context.reloc_dir->rva,
+                context.reloc_dir->size);
+  reloc_base = image_address (phys_addr, context.image_size,
+                              context.reloc_dir->rva);
+  /* RelocBaseEnd here is the address of the last byte of the table */
+  reloc_base_end = image_address (phys_addr, context.image_size,
+                                  context.reloc_dir->rva
+                                  + context.reloc_dir->size - 1);
+  grub_dprintf ("multiboot_loader", "reloc_base: 0x%016lx reloc_base_end: 0x%016lx\n",
+                reloc_base, reloc_base_end);
+
+  section = context.first_section;
+  for (i = 0; i < context.number_of_sections; i++, section++)
+    {
+      char name[9];
+
+      base = image_address (phys_addr, context.image_size,
+                            section->virtual_address);
+      end = image_address (phys_addr, context.image_size,
+                           section->virtual_address + section->virtual_size -1);
+
+      grub_strncpy(name, section->name, 9);
+      name[8] = '\0';
+      grub_dprintf ("multiboot_loader", "Section %d \"%s\" at 0x%016lx..0x%016lx\n", i,
+                   name, base, end);
+
+      if (end < base)
+        {
+          grub_dprintf ("multiboot_loader", " base is 0x%016lx but end is 0x%016lx... bad.\n",
+                       base, end);
+          grub_error (GRUB_ERR_BAD_ARGUMENT,
+                      "Image has invalid negative size");
+          ret = GRUB_ERR_BAD_ARGUMENT;
+          goto out;
+        }
+
+      if (section->virtual_address <= context.entry_point &&
+          (section->virtual_address + section->raw_data_size - 1)
+          > context.entry_point)
+        {
+          found_entry_point++;
+          grub_dprintf ("multiboot_loader", " section contains entry point\n");
+        }
+
+      /* We do want to process .reloc, but it's often marked
+       * discardable, so we don't want to memcpy it. */
+      if (grub_memcmp (section->name, ".reloc\0\0", 8) == 0)
+        {
+          if (reloc_section)
+            {
+              grub_error (GRUB_ERR_BAD_ARGUMENT,
+                          "Image has multiple relocation sections");
+              ret = GRUB_ERR_BAD_ARGUMENT;
+              goto out;
+            }
+
+          /* If it has nonzero sizes, and our bounds check
+           * made sense, and the VA and size match RelocDir's
+           * versions, then we believe in this section table. */
+          if (section->raw_data_size && section->virtual_size &&
+              base && end && reloc_base == base)
+            {
+              if (reloc_base_end == end)
+                {
+                  grub_dprintf ("multiboot_loader", " section is relocation section\n");
+                  reloc_section = section;
+                }
+              else if (reloc_base_end && reloc_base_end < end)
+                {
+                  /* Bogus virtual size in the reloc section -- RelocDir
+                   * reported a smaller Base Relocation Directory. Decrease
+                   * the section's virtual size so that it equal RelocDir's
+                   * idea, but only for the purposes of relocate_coff(). */
+                  grub_dprintf ("multiboot_loader",
+                                " section is (overlong) relocation section\n");
+                  grub_memcpy (&fake_reloc_section, section, sizeof *section);
+                  fake_reloc_section.virtual_size -= (end - reloc_base_end);
+                  reloc_section = &fake_reloc_section;
+                }
+            }
+
+          if (!reloc_section)
+            {
+              grub_dprintf ("multiboot_loader", " section is not reloc section?\n");
+              grub_dprintf ("multiboot_loader", " rds: 0x%08x, vs: %08x\n",
+                            section->raw_data_size, section->virtual_size);
+              grub_dprintf ("multiboot_loader", " base: 0x%016lx end: 0x%016lx\n", base, end);
+              grub_dprintf ("multiboot_loader", " reloc_base: 0x%016lx reloc_base_end: 0x%016lx\n",
+                            reloc_base, reloc_base_end);
+            }
+        }
+
+      grub_dprintf ("multiboot_loader", " Section characteristics are %08x\n",
+                   section->characteristics);
+      grub_dprintf ("multiboot_loader", " Section virtual size: %08x\n",
+                   section->virtual_size);
+      grub_dprintf ("multiboot_loader", " Section raw_data size: %08x\n",
+                   section->raw_data_size);
+      if (section->characteristics & GRUB_PE32_SCN_MEM_DISCARDABLE)
+        {
+          grub_dprintf ("multiboot_loader", " Discarding section\n");
+          continue;
+        }
+
+      if (!base || !end)
+        {
+          grub_dprintf ("multiboot_loader", " section is invalid\n");
+          grub_error (GRUB_ERR_BAD_ARGUMENT, "Invalid section size");
+          ret = GRUB_ERR_BAD_ARGUMENT;
+          goto out;
+        }
+
+      if (section->characteristics & GRUB_PE32_SCN_CNT_UNINITIALIZED_DATA)
+        {
+          if (section->raw_data_size != 0)
+            grub_dprintf ("multiboot_loader", " UNINITIALIZED_DATA section has data?\n");
+        }
+      else if (section->virtual_address < context.size_of_headers ||
+               section->raw_data_offset < context.size_of_headers)
+        {
+          grub_error (GRUB_ERR_BAD_ARGUMENT,
+                      "Section %d is inside image headers", i);
+          ret = GRUB_ERR_BAD_ARGUMENT;
+          goto out;
+        }
+
+      if (section->raw_data_size > 0)
+        {
+          grub_dprintf ("multiboot_loader", " copying 0x%08x bytes to 0x%016lx\n",
+                        section->raw_data_size, base);
+
+          if (grub_file_seek (mld->file, section->raw_data_offset) == (grub_off_t) -1)
+            {
+              ret = grub_errno;
+              goto out;
+            }
+
+          if (grub_file_read (mld->file, virt_addr + (base - phys_addr), section->raw_data_size)
+              != (grub_ssize_t) section->raw_data_size)
+            {
+              if (!grub_errno)
+                {
+                  grub_error (GRUB_ERR_FILE_READ_ERROR, "premature end of file %s",
+                              mld->filename);
+                  ret = GRUB_ERR_FILE_READ_ERROR;
+                }
+              else
+                  ret = grub_errno;
+              goto out;
+            }
+        }
+
+      if (section->raw_data_size < section->virtual_size)
+        {
+          grub_dprintf ("multiboot_loader", " padding with 0x%08x bytes at 0x%016lx\n",
+                        section->virtual_size - section->raw_data_size,
+                        base + section->raw_data_size);
+          grub_memset (virt_addr + (base - phys_addr) + section->raw_data_size, 0,
+                       section->virtual_size - section->raw_data_size);
+        }
+
+      grub_dprintf ("multiboot_loader", " finished section %s\n", name);
+    }
+
+  /* 5 == EFI_IMAGE_DIRECTORY_ENTRY_BASERELOC */
+  if (context.number_of_rva_and_sizes <= 5)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT, "image has no relocation entry\n");
+      ret = GRUB_ERR_BAD_ARGUMENT;
+      goto out;
+    }
+
+  if (context.reloc_dir->size && reloc_section)
+    {
+      /* run the relocation fixups */
+      ret = relocate_coff (&context, reloc_section, phys_addr, virt_addr, mld);
+
+      if (ret)
+        {
+          grub_error (GRUB_ERR_BAD_ARGUMENT, "relocation failed");
+          goto out;
+        }
+    }
+
+  if (!found_entry_point)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT, "entry point is not within sections");
+      ret = GRUB_ERR_BAD_ARGUMENT;
+      goto out;
+    }
+  if (found_entry_point > 1)
+    {
+      grub_error (GRUB_ERR_BAD_ARGUMENT, "%d sections contain entry point",
+                  found_entry_point);
+      ret = GRUB_ERR_BAD_ARGUMENT;
+      goto out;
+    }
+
+out:
+  return ret;
+}
diff --git a/include/grub/efi/pe32.h b/include/grub/efi/pe32.h
index 4e6e9d254bd3..94435d758b46 100644
--- a/include/grub/efi/pe32.h
+++ b/include/grub/efi/pe32.h
@@ -20,6 +20,7 @@
 #define GRUB_EFI_PE32_HEADER	1
 
 #include <grub/types.h>
+#include <grub/efi/api.h>
 #include <grub/efi/memory.h>
 
 /* The MSDOS compatibility stub. This was copied from the output of
@@ -46,6 +47,28 @@
 
 #define GRUB_PE32_MSDOS_STUB_SIZE	0x80
 
+typedef struct {
+  grub_uint16_t  e_magic;    ///< Magic number.
+  grub_uint16_t  e_cblp;     ///< Bytes on last page of file.
+  grub_uint16_t  e_cp;       ///< Pages in file.
+  grub_uint16_t  e_crlc;     ///< Relocations.
+  grub_uint16_t  e_cparhdr;  ///< Size of header in paragraphs.
+  grub_uint16_t  e_minalloc; ///< Minimum extra paragraphs needed.
+  grub_uint16_t  e_maxalloc; ///< Maximum extra paragraphs needed.
+  grub_uint16_t  e_ss;       ///< Initial (relative) SS value.
+  grub_uint16_t  e_sp;       ///< Initial SP value.
+  grub_uint16_t  e_csum;     ///< Checksum.
+  grub_uint16_t  e_ip;       ///< Initial IP value.
+  grub_uint16_t  e_cs;       ///< Initial (relative) CS value.
+  grub_uint16_t  e_lfarlc;   ///< File address of relocation table.
+  grub_uint16_t  e_ovno;     ///< Overlay number.
+  grub_uint16_t  e_res[4];   ///< Reserved words.
+  grub_uint16_t  e_oemid;    ///< OEM identifier (for e_oeminfo).
+  grub_uint16_t  e_oeminfo;  ///< OEM information; e_oemid specific.
+  grub_uint16_t  e_res2[10]; ///< Reserved words.
+  grub_uint32_t  e_lfanew;   ///< File address of new exe header.
+} grub_pe32_msdos_header_t;
+
 #define GRUB_PE32_MAGIC			0x5a4d
 
 struct grub_msdos_image_header
@@ -249,6 +272,7 @@ struct grub_pe32_section_table
 
 #define GRUB_PE32_SCN_CNT_CODE			0x00000020
 #define GRUB_PE32_SCN_CNT_INITIALIZED_DATA	0x00000040
+#define GRUB_PE32_SCN_CNT_UNINITIALIZED_DATA    0x00000080
 #define GRUB_PE32_SCN_MEM_DISCARDABLE		0x02000000
 #define GRUB_PE32_SCN_MEM_EXECUTE		0x20000000
 #define GRUB_PE32_SCN_MEM_READ			0x40000000
@@ -349,4 +373,44 @@ struct grub_pe32_reloc
 #define GRUB_PE32_REL_I386_DIR32	0x6
 #define GRUB_PE32_REL_I386_REL32	0x14
 
+struct grub_pe32_header_32
+{
+  char signature[GRUB_PE32_SIGNATURE_SIZE];
+  struct grub_pe32_coff_header coff_header;
+  struct grub_pe32_optional_header optional_header;
+};
+
+struct grub_pe32_header_64
+{
+  char signature[GRUB_PE32_SIGNATURE_SIZE];
+  struct grub_pe32_coff_header coff_header;
+  struct grub_pe64_optional_header optional_header;
+};
+
+typedef union
+{
+  struct grub_pe32_header_32 pe32;
+  struct grub_pe32_header_64 pe32plus;
+} grub_pe_header_t;
+
+struct pe_coff_loader_image_context
+{
+  grub_efi_uint64_t image_address;
+  grub_efi_uint64_t image_size;
+  grub_efi_uint64_t entry_point;
+  grub_efi_uintn_t size_of_headers;
+  grub_efi_uint16_t image_type;
+  grub_efi_uint16_t number_of_sections;
+  grub_efi_uint32_t section_alignment;
+  struct grub_pe32_section_table *first_section;
+  struct grub_pe32_data_directory *reloc_dir;
+  struct grub_pe32_data_directory *sec_dir;
+  grub_efi_uint64_t number_of_rva_and_sizes;
+  grub_pe_header_t *pe_hdr;
+};
+
+typedef struct pe_coff_loader_image_context pe_coff_loader_image_context_t;
+
+#define EFI_IMAGE_NUMBER_OF_DIRECTORY_ENTRIES 16
+
 #endif /* ! GRUB_EFI_PE32_HEADER */
diff --git a/include/grub/multiboot2.h b/include/grub/multiboot2.h
index 1f6d4fc9e336..01e2b11755c2 100644
--- a/include/grub/multiboot2.h
+++ b/include/grub/multiboot2.h
@@ -97,6 +97,9 @@ typedef struct mbi_load_data mbi_load_data_t;
 grub_err_t
 grub_multiboot2_load_elf (mbi_load_data_t *mld);
 
+grub_err_t
+grub_multiboot2_load_pe (mbi_load_data_t *mld);
+
 extern grub_size_t grub_multiboot2_pure_size;
 extern grub_size_t grub_multiboot2_alloc_mbi;
 extern grub_uint32_t grub_multiboot2_payload_eip;
-- 
2.43.0


