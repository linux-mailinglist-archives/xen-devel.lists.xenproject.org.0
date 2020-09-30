Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBE27E81B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.629.2117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNamm-0001oS-HS; Wed, 30 Sep 2020 12:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629.2117; Wed, 30 Sep 2020 12:00:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNamm-0001nm-Bv; Wed, 30 Sep 2020 12:00:40 +0000
Received: by outflank-mailman (input) for mailman id 629;
 Wed, 30 Sep 2020 12:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNaml-0001mg-35
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:39 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e126dab4-d0fd-4d56-a782-66e4d8970471;
 Wed, 30 Sep 2020 12:00:38 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0btp005388;
 Wed, 30 Sep 2020 06:00:37 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdF003035;
 Wed, 30 Sep 2020 06:00:32 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNaml-0001mg-35
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:39 +0000
X-Inumbo-ID: e126dab4-d0fd-4d56-a782-66e4d8970471
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e126dab4-d0fd-4d56-a782-66e4d8970471;
	Wed, 30 Sep 2020 12:00:38 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0btp005388;
	Wed, 30 Sep 2020 06:00:37 -0600
Received-SPF: neutral (ame8.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame8.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdF003035;
	Wed, 30 Sep 2020 06:00:32 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame8.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v8 4/5] efi: Enable booting unified hypervisor/kernel/initrd images
Date: Wed, 30 Sep 2020 08:00:10 -0400
Message-Id: <20200930120011.1622924-5-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930120011.1622924-1-hudson@trmm.net>
References: <20200930120011.1622924-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame8.swcp.com [216.184.2.128]); Wed, 30 Sep 2020 06:00:34 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.99.2 at ame8
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ame8.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.1
X-Spam-Level: 

This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
configuration file, the Linux kernel and initrd, as well as the XSM,
and architectural specific files into a single "unified" EFI executable.
This allows an administrator to update the components independently
without requiring rebuilding xen, as well as to replace the components
in an existing image.

The resulting EFI executable can be invoked directly from the UEFI Boot
Manager, removing the need to use a separate loader like grub as well
as removing dependencies on local filesystem access.  And since it is
a single file, it can be signed and validated by UEFI Secure Boot without
requring the shim protocol.

It is inspired by systemd-boot's unified kernel technique and borrows the
function to locate PE sections from systemd's LGPL'ed code.  During EFI
boot, Xen looks at its own loaded image to locate the PE sections for
the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
(`.ramdisk`), and XSM config (`.xsm`), which are included after building
xen.efi using objcopy to add named sections for each input file.

For x86, the CPU ucode can be included in a section named `.ucode`,
which is loaded in the efi_arch_cfg_file_late() stage of the boot process.

On ARM systems the Device Tree can be included in a section named
`.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
the boot process.

Note that the system will fall back to loading files from disk if
the named sections do not exist. This allows distributions to continue
with the status quo if they want a signed kernel + config, while still
allowing a user provided initrd (which is how the shim protocol currently
works as well).

This patch also adds constness to the section parameter of
efi_arch_cfg_file_early() and efi_arch_cfg_file_late(),
changes pe_find_section() to use a const CHAR16 section name,
and adds pe_name_compare() to match section names.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 .gitignore                  |   1 +
 docs/misc/efi.pandoc        |  49 ++++++++++++
 xen/arch/arm/efi/efi-boot.h |  25 ++++--
 xen/arch/x86/efi/Makefile   |   2 +-
 xen/arch/x86/efi/efi-boot.h |  11 ++-
 xen/common/efi/boot.c       |  64 ++++++++++-----
 xen/common/efi/efi.h        |   3 +
 xen/common/efi/pe.c         | 153 ++++++++++++++++++++++++++++++++++++
 8 files changed, 279 insertions(+), 29 deletions(-)
 create mode 100644 xen/common/efi/pe.c

diff --git a/.gitignore b/.gitignore
index 5e8c47e2db..2857fd76eb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -317,6 +317,7 @@ xen/arch/*/efi/boot.c
 xen/arch/*/efi/compat.c
 xen/arch/*/efi/ebmalloc.c
 xen/arch/*/efi/efi.h
+xen/arch/*/efi/pe.c
 xen/arch/*/efi/runtime.c
 xen/common/config_data.S
 xen/common/config.gz
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 23c1a2732d..ac3cd58cae 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -116,3 +116,52 @@ Filenames must be specified relative to the location of the EFI binary.
 
 Extra options to be passed to Xen can also be specified on the command line,
 following a `--` separator option.
+
+## Unified Xen kernel image
+
+The "Unified" kernel image can be generated by adding additional
+sections to the Xen EFI executable with objcopy, similar to how
+[systemd-boot uses the stub to add them to the Linux kernel](https://wiki.archlinux.org/index.php/systemd-boot#Preparing_a_unified_kernel_image)
+
+The sections for the xen configuration file, the dom0 kernel, dom0 initrd,
+XSM and CPU microcode should be added after the Xen `.pad` section, the
+ending address of which can be located with:
+
+```
+objdump -h xen.efi \
+	| perl -ane '/\.pad/ && printf "0x%016x\n", hex($F[2]) + hex($F[3])'
+```
+
+For all the examples the `.pad` section ended at 0xffff82d041000000.
+All the sections are optional (`.config`, `.kernel`, `.ramdisk`, `.xsm`,
+`.ucode` (x86) and `.dtb` (ARM)) and the order does not matter.
+The virtual addresses do not need to be contiguous, although they should not
+be overlapping and should all be greater than the last virtual address of the
+hypervisor components.
+
+```
+objcopy \
+	--add-section .config=xen.cfg \
+	--change-section-vma .config=0xffff82d041000000
+	--add-section .ucode=ucode.bin \
+	--change-section-vma .ucode=0xffff82d041010000 \
+	--add-section .xsm=xsm.cfg \
+	--change-section-vma .xsm=0xffff82d041080000 \
+	--add-section .kernel=vmlinux \
+	--change-section-vma .kernel=0xffff82d041100000 \
+	--add-section .ramdisk=initrd.img \
+	--change-section-vma .ramdisk=0xffff82d042000000 \
+	xen.efi \
+	xen.unified.efi
+```
+
+The unified executable can be signed with sbsigntool to make
+it usable with UEFI secure boot:
+
+```
+sbsign \
+	--key signing.key \
+	--cert cert.pem \
+	--output xen.signed.efi \
+	xen.unified.efi
+```
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index c6200fda0e..f64a6604af 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -382,27 +382,36 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     efi_xen_start(fdt, fdt_totalsize(fdt));
 }
 
-static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *section)
+static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
+                                           EFI_FILE_HANDLE dir_handle,
+                                           const char *section)
 {
     union string name;
 
     /*
      * The DTB must be processed before any other entries in the configuration
-     * file, as the DTB is updated as modules are loaded.
+     * file, as the DTB is updated as modules are loaded.  Prefer the one
+     * stored as a PE section in a unified image, and fall back to a file
+     * on disk if the section is not present.
      */
-    name.s = get_value(&cfg, section, "dtb");
-    if ( name.s )
+    if ( !read_section(image, L"dtb", &dtbfile, NULL) )
     {
-        split_string(name.s);
-        read_file(dir_handle, s2w(&name), &dtbfile, NULL);
-        efi_bs->FreePool(name.w);
+        name.s = get_value(&cfg, section, "dtb");
+        if ( name.s )
+        {
+            split_string(name.s);
+            read_file(dir_handle, s2w(&name), &dtbfile, NULL);
+            efi_bs->FreePool(name.w);
+        }
     }
     fdt = fdt_increase_size(&dtbfile, cfg.size + EFI_PAGE_SIZE);
     if ( !fdt )
         blexit(L"Unable to create new FDT");
 }
 
-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
+static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
+                                          EFI_FILE_HANDLE dir_handle,
+                                          const char *section)
 {
 }
 
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 770438a029..e857c0f2cc 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -8,7 +8,7 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 
 boot.init.o: buildid.o
 
-EFIOBJ := boot.init.o ebmalloc.o compat.o runtime.o
+EFIOBJ := boot.init.o pe.init.o ebmalloc.o compat.o runtime.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
 $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 1025000afd..2541ba1f32 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -272,14 +272,21 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     unreachable();
 }
 
-static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *section)
+static void __init efi_arch_cfg_file_early(const EFI_LOADED_IMAGE *image,
+                                           EFI_FILE_HANDLE dir_handle,
+                                           const char *section)
 {
 }
 
-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
+static void __init efi_arch_cfg_file_late(const EFI_LOADED_IMAGE *image,
+                                          EFI_FILE_HANDLE dir_handle,
+                                          const char *section)
 {
     union string name;
 
+    if ( read_section(image, L"ucode", &ucode, NULL) )
+        return;
+
     name.s = get_value(&cfg, section, "ucode");
     if ( !name.s )
         name.s = get_value(&cfg, "global", "ucode");
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index bd629eb658..072b1cecd1 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -122,6 +122,8 @@ static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, const char *options);
+static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name,
+                         struct file *file, const char *options);
 static size_t wstrlen(const CHAR16 * s);
 static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
 static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
@@ -631,6 +633,20 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     return true;
 }
 
+static bool __init read_section(const EFI_LOADED_IMAGE *image,
+                                const CHAR16 *name, struct file *file,
+                                const char *options)
+{
+    file->ptr = pe_find_section(image->ImageBase, image->ImageSize,
+                                name, &file->size);
+    if ( !file->ptr )
+        return false;
+
+    handle_file_info(name, file, options);
+
+    return true;
+}
+
 static void __init pre_parse(const struct file *cfg)
 {
     char *ptr = cfg->str, *end = ptr + cfg->size;
@@ -1215,9 +1231,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
 
-        /* Read and parse the config file. */
-        if ( !cfg_file_name )
+        if ( read_section(loaded_image, L"config", &cfg, NULL) )
+            PrintStr(L"Using builtin config file\r\n");
+        else if ( !cfg_file_name )
         {
+            /* Read and parse the config file. */
             CHAR16 *tail;
 
             while ( (tail = point_tail(file_name)) != NULL )
@@ -1266,29 +1284,39 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         if ( !name.s )
             blexit(L"No Dom0 kernel image specified.");
 
-        efi_arch_cfg_file_early(dir_handle, section.s);
+        efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
 
         option_str = split_string(name.s);
-        read_file(dir_handle, s2w(&name), &kernel, option_str);
-        efi_bs->FreePool(name.w);
-
-        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                        (void **)&shim_lock)) &&
-             (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
-            PrintErrMesg(L"Dom0 kernel image could not be verified", status);
 
-        name.s = get_value(&cfg, section.s, "ramdisk");
-        if ( name.s )
+        if ( !read_section(loaded_image, L"kernel", &kernel, option_str) )
         {
-            read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+            read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
+
+            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                            (void **)&shim_lock)) &&
+                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
+                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
         }
 
-        name.s = get_value(&cfg, section.s, "xsm");
-        if ( name.s )
+        if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
         {
-            read_file(dir_handle, s2w(&name), &xsm, NULL);
-            efi_bs->FreePool(name.w);
+            name.s = get_value(&cfg, section.s, "ramdisk");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+                efi_bs->FreePool(name.w);
+            }
+        }
+
+        if ( !read_section(loaded_image, L"xsm", &xsm, NULL) )
+        {
+            name.s = get_value(&cfg, section.s, "xsm");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &xsm, NULL);
+                efi_bs->FreePool(name.w);
+            }
         }
 
         /*
@@ -1324,7 +1352,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             }
         }
 
-        efi_arch_cfg_file_late(dir_handle, section.s);
+        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
 
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr = 0;
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index 4845d84913..663a8b5000 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -47,3 +47,6 @@ const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
 /* EFI boot allocator. */
 void *ebmalloc(size_t size);
 void free_ebmalloc_unused_mem(void);
+
+const void *pe_find_section(const void *image_base, const size_t image_size,
+                            const CHAR16 *section_name, UINTN *size_out);
diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
new file mode 100644
index 0000000000..5c1700be03
--- /dev/null
+++ b/xen/common/efi/pe.c
@@ -0,0 +1,153 @@
+/*
+ * xen/common/efi/pe.c
+ *
+ * PE executable header parser.
+ *
+ * Derived from https://github.com/systemd/systemd/blob/master/src/boot/efi/pe.c
+ * commit 07d5ed536ec0a76b08229c7a80b910cb9acaf6b1
+ *
+ * Copyright (C) 2015 Kay Sievers <kay@vrfy.org>
+ * Copyright (C) 2020 Trammell Hudson <hudson@trmm.net>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU Lesser General Public License as published by
+ * the Free Software Foundation; either version 2.1 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ */
+
+
+#include "efi.h"
+
+struct DosFileHeader {
+    UINT8   Magic[2];
+    UINT16  LastSize;
+    UINT16  nBlocks;
+    UINT16  nReloc;
+    UINT16  HdrSize;
+    UINT16  MinAlloc;
+    UINT16  MaxAlloc;
+    UINT16  ss;
+    UINT16  sp;
+    UINT16  Checksum;
+    UINT16  ip;
+    UINT16  cs;
+    UINT16  RelocPos;
+    UINT16  nOverlay;
+    UINT16  reserved[4];
+    UINT16  OEMId;
+    UINT16  OEMInfo;
+    UINT16  reserved2[10];
+    UINT32  ExeHeader;
+};
+
+#if defined(__arm__) || defined (__aarch64__)
+#define PE_HEADER_MACHINE 0xaa64
+#elif defined(__x86_64__)
+#define PE_HEADER_MACHINE 0x8664
+#else
+#error "Unknown architecture"
+#endif
+
+struct PeFileHeader {
+    UINT16  Machine;
+    UINT16  NumberOfSections;
+    UINT32  TimeDateStamp;
+    UINT32  PointerToSymbolTable;
+    UINT32  NumberOfSymbols;
+    UINT16  SizeOfOptionalHeader;
+    UINT16  Characteristics;
+};
+
+struct PeHeader {
+    UINT8   Magic[4];
+    struct PeFileHeader FileHeader;
+};
+
+struct PeSectionHeader {
+    CHAR8   Name[8];
+    UINT32  VirtualSize;
+    UINT32  VirtualAddress;
+    UINT32  SizeOfRawData;
+    UINT32  PointerToRawData;
+    UINT32  PointerToRelocations;
+    UINT32  PointerToLinenumbers;
+    UINT16  NumberOfRelocations;
+    UINT16  NumberOfLinenumbers;
+    UINT32  Characteristics;
+};
+
+static bool __init pe_name_compare(const struct PeSectionHeader *sect,
+                                   const CHAR16 *name)
+{
+    size_t i;
+
+    if ( sect->Name[0] != '.' )
+        return -1;
+
+    for ( i = 1; i < sizeof(sect->Name); i++ )
+    {
+        const char c = sect->Name[i];
+        const CHAR16 cw = name[i - 1];
+
+        if ( cw == L'\0' && c == '\0' )
+            return true;
+        if ( cw != c )
+            return false;
+    }
+
+    return name[i - 1] == L'\0';
+}
+
+const void *__init pe_find_section(const void *image, const UINTN image_size,
+                                   const CHAR16 *section_name, UINTN *size_out)
+{
+    const struct DosFileHeader *dos = image;
+    const struct PeHeader *pe;
+    const struct PeSectionHeader *sect;
+    UINTN offset, i;
+
+    if ( image_size < sizeof(*dos) ||
+         memcmp(dos->Magic, "MZ", 2) != 0 )
+        return NULL;
+
+    offset = dos->ExeHeader;
+    pe = image + offset;
+
+    offset += sizeof(*pe);
+    if ( image_size < offset ||
+         memcmp(pe->Magic, "PE\0\0", 4) != 0 )
+        return NULL;
+
+    if ( pe->FileHeader.Machine != PE_HEADER_MACHINE )
+        return NULL;
+
+    offset += pe->FileHeader.SizeOfOptionalHeader;
+
+    for ( i = 0; i < pe->FileHeader.NumberOfSections; i++ )
+    {
+        sect = image + offset;
+        if ( image_size < offset + sizeof(*sect) )
+            return NULL;
+
+        if ( !pe_name_compare(sect, section_name) )
+        {
+            offset += sizeof(*sect);
+            continue;
+        }
+
+        if ( image_size < sect->VirtualSize + sect->VirtualAddress )
+            blexit(L"PE invalid section size + address");
+
+        if ( size_out )
+            *size_out = sect->VirtualSize;
+
+        return image + sect->VirtualAddress;
+    }
+
+    return NULL;
+}
-- 
2.25.1


