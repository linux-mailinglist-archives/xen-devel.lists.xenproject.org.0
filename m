Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BFE23CD29
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 19:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3N6D-000498-1P; Wed, 05 Aug 2020 17:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CKEr=BP=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3N6B-000493-Ii
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 17:21:07 +0000
X-Inumbo-ID: 886d5c0b-818e-472d-8033-dc25ab1f62df
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 886d5c0b-818e-472d-8033-dc25ab1f62df;
 Wed, 05 Aug 2020 17:21:01 +0000 (UTC)
Date: Wed, 05 Aug 2020 17:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596648059;
 bh=l1doubPoPn+XYU/lLBZRazYcvNj3vmi0JDcutwQoyQ0=;
 h=Date:To:From:Reply-To:Subject:From;
 b=AGrU1KVLW16bS57DpbUTZZG+rG2iKEZMXg4QnH1b0D64iZwGnAEdbbIks8RsTVj6z
 JIIcK8OSVTUAf4V55cq3v8YyQjEJ+UUbYTTbBLHj5zpYKheiWsFOHSw3bRKA9xKdx6
 9evw2IJpXS2OSKwtwAbDeByh8jhFeaBtI/mGxNFQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot support
Message-ID: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This preliminary patch adds support for bundling the Xen hypervisor, xen.cf=
g, the Linux kernel, initrd and XSM into a single "unified" EFI executable =
that can be signed by sbsigntool for verification by UEFI Secure Boot.  It =
is inspired by systemd-boot's unified kernel technique and borrows the func=
tion to locate PE sections from systemd's LGPL'ed code.

The configuration, kernel, etc are added after building using objcopy to ad=
d named sections for each input file.  This allows an administrator to upda=
te the components independently without requiring rebuilding xen. During EF=
I boot, Xen looks at its own loaded image to locate the PE sections and, if=
 secure boot is enabled, only allows use of the unified components.

The resulting EFI executable can be invoked directly from the UEFI Boot Man=
ager, removing the need to use a separate loader like grub. Unlike the shim=
 based verification, the signature covers the entire Xen+config+kernel+init=
rd unified file. This also ensures that properly configured platforms will =
measure the entire runtime into the TPM for unsealing secrets or remote att=
estation.

It has been tested on qemu OVMF with Secure Boot enabled, as well as on rea=
l Thinkpad hardware.  The EFI console is very slow, although it works and i=
s able to boot into dom0.

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf..b7b08b6 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {

 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         void *ptr;
@@ -330,13 +331,13 @@ static void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();

-    if ( cfg.addr )
+    if ( cfg.addr && cfg.need_to_free)
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.addr && kernel.need_to_free)
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.addr && ramdisk.need_to_free)
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.addr && xsm.need_to_free)
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));

     efi_arch_blexit();
@@ -619,6 +620,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
         what =3D what ?: L"Seek";
     else
     {
+        file->need_to_free =3D true;
         file->addr =3D min(1UL << (32 + PAGE_SHIFT),
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
@@ -665,6 +667,136 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
     return true;
 }

+
+struct DosFileHeader {
+        UINT8   Magic[2];
+        UINT16  LastSize;
+        UINT16  nBlocks;
+        UINT16  nReloc;
+        UINT16  HdrSize;
+        UINT16  MinAlloc;
+        UINT16  MaxAlloc;
+        UINT16  ss;
+        UINT16  sp;
+        UINT16  Checksum;
+        UINT16  ip;
+        UINT16  cs;
+        UINT16  RelocPos;
+        UINT16  nOverlay;
+        UINT16  reserved[4];
+        UINT16  OEMId;
+        UINT16  OEMInfo;
+        UINT16  reserved2[10];
+        UINT32  ExeHeader;
+} __attribute__((packed));
+
+#define PE_HEADER_MACHINE_I386          0x014c
+#define PE_HEADER_MACHINE_X64           0x8664
+#define PE_HEADER_MACHINE_ARM64         0xaa64
+
+struct PeFileHeader {
+        UINT16  Machine;
+        UINT16  NumberOfSections;
+        UINT32  TimeDateStamp;
+        UINT32  PointerToSymbolTable;
+        UINT32  NumberOfSymbols;
+        UINT16  SizeOfOptionalHeader;
+        UINT16  Characteristics;
+} __attribute__((packed));
+
+struct PeHeader {
+        UINT8   Magic[4];
+        struct PeFileHeader FileHeader;
+} __attribute__((packed));
+
+struct PeSectionHeader {
+        UINT8   Name[8];
+        UINT32  VirtualSize;
+        UINT32  VirtualAddress;
+        UINT32  SizeOfRawData;
+        UINT32  PointerToRawData;
+        UINT32  PointerToRelocations;
+        UINT32  PointerToLinenumbers;
+        UINT16  NumberOfRelocations;
+        UINT16  NumberOfLinenumbers;
+        UINT32  Characteristics;
+} __attribute__((packed));
+
+static void * __init pe_find_section(const void * const image_base,
+        const char * section_name, UINTN * size_out)
+{
+    const CHAR8 * const base =3D image_base;
+    const struct DosFileHeader * dos =3D (const void*) base;
+    const struct PeHeader * pe;
+    const UINTN name_len =3D strlen(section_name);
+    UINTN offset;
+
+    if ( base =3D=3D NULL )
+        return NULL;
+
+    if ( memcmp(dos->Magic, "MZ", 2) !=3D 0 )
+        return NULL;
+
+    pe =3D (const void *) &base[dos->ExeHeader];
+    if ( memcmp(pe->Magic, "PE\0\0", 4) !=3D 0 )
+        return NULL;
+
+    /* PE32+ Subsystem type */
+    if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_X64
+    &&  pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_ARM64
+    &&  pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_I386)
+        return NULL;
+
+    if ( pe->FileHeader.NumberOfSections > 96 )
+        return NULL;
+
+    offset =3D dos->ExeHeader + sizeof(*pe) + pe->FileHeader.SizeOfOptiona=
lHeader;
+
+    for (UINTN i =3D 0; i < pe->FileHeader.NumberOfSections; i++)
+    {
+        const struct PeSectionHeader *const sect =3D (const struct PeSecti=
onHeader *)&base[offset];
+        if ( memcmp(sect->Name, section_name, name_len) =3D=3D 0 )
+        {
+            if ( size_out )
+                *size_out =3D sect->VirtualSize;
+            return (void*)(sect->VirtualAddress + (uintptr_t) image_base);
+        }
+
+        offset +=3D sizeof(*sect);
+    }
+
+    return NULL;
+}
+
+static bool __init read_section(const void * const image_base,
+        char * const name, struct file *file, char *options)
+{
+    union string name_string =3D { .s =3D name + 1 };
+    if ( !image_base )
+        return false;
+
+    file->ptr =3D pe_find_section(image_base, name, &file->size);
+    if ( !file->ptr )
+        return false;
+
+    file->need_to_free =3D false;
+
+    if ( file =3D=3D &cfg )
+        return true;
+
+    s2w(&name_string);
+    PrintStr(name_string.w);
+    PrintStr(L": ");
+    DisplayUint(file->addr, 2 * sizeof(file->addr));
+    PrintStr(L"-");
+    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
+    PrintStr(newline);
+    efi_arch_handle_module(file, name_string.w, options);
+    efi_bs->FreePool(name_string.w);
+
+    return true;
+}
+
 static void __init pre_parse(const struct file *cfg)
 {
     char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
@@ -968,6 +1100,21 @@ static void __init setup_efi_pci(void)
     efi_bs->FreePool(handles);
 }

+static bool __init efi_secure_boot(void)
+{
+    static const EFI_GUID global_guid =3D EFI_GLOBAL_VARIABLE;
+    uint8_t buf[8];
+    UINTN size =3D sizeof(buf);
+
+    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL=
, &size, buf) !=3D EFI_SUCCESS )
+        return false;
+
+    if ( size !=3D 1 )
+        return false;
+
+    return buf[0] !=3D 0;
+}
+
 static void __init efi_variables(void)
 {
     EFI_STATUS status;
@@ -1143,6 +1290,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOCOL=
;
     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
+    void * image_base =3D NULL;
     EFI_STATUS status;
     unsigned int i, argc;
     CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
@@ -1153,6 +1301,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     bool base_video =3D false;
     char *option_str;
     bool use_cfg_file;
+    bool secure =3D false;

     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1171,6 +1320,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);

     efi_arch_load_addr_check(loaded_image);
+    if ( loaded_image )
+        image_base =3D loaded_image->ImageBase;
+
+    secure =3D efi_secure_boot();

     if ( use_cfg_file )
     {
@@ -1249,9 +1402,19 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         /* Get the file system interface. */
         dir_handle =3D get_parent_handle(loaded_image, &file_name);

-        /* Read and parse the config file. */
-        if ( !cfg_file_name )
+        if ( read_section(image_base, ".config", &cfg, NULL) )
+        {
+            if ( secure )
+                PrintStr(L"Secure Boot enabled: ");
+            PrintStr(L"Using unified config file\r\n");
+        }
+        else if ( secure )
+        {
+            blexit(L"Secure Boot enabled, but configuration not included."=
);
+        }
+        else if ( !cfg_file_name )
         {
+            /* Read and parse the config file. */
             CHAR16 *tail;

             while ( (tail =3D point_tail(file_name)) !=3D NULL )
@@ -1303,27 +1466,47 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
         efi_arch_cfg_file_early(dir_handle, section.s);

         option_str =3D split_string(name.s);
-        read_file(dir_handle, s2w(&name), &kernel, option_str);
-        efi_bs->FreePool(name.w);

-        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                        (void **)&shim_lock)) &&
-             (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D =
EFI_SUCCESS )
-            PrintErrMesg(L"Dom0 kernel image could not be verified", statu=
s);
-
-        name.s =3D get_value(&cfg, section.s, "ramdisk");
-        if ( name.s )
+        if ( !read_section(image_base, ".kernel", &kernel, option_str) )
         {
-            read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+            if ( secure )
+                blexit(L"Secure Boot enabled, but no kernel included");
+            read_file(dir_handle, s2w(&name), &kernel, option_str);
             efi_bs->FreePool(name.w);
+
+            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
+                            (void **)&shim_lock)) &&
+                 (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=
=3D EFI_SUCCESS )
+                PrintErrMesg(L"Dom0 kernel image could not be verified", s=
tatus);
         }

-        name.s =3D get_value(&cfg, section.s, "xsm");
-        if ( name.s )
+        if ( !read_section(image_base, ".ramdisk", &ramdisk, NULL) )
         {
-            read_file(dir_handle, s2w(&name), &xsm, NULL);
-            efi_bs->FreePool(name.w);
+            if ( secure )
+                blexit(L"Secure Boot enabled, but no initrd included");
+            name.s =3D get_value(&cfg, section.s, "ramdisk");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+                efi_bs->FreePool(name.w);
+            }
+        }
+
+#ifdef CONFIG_XSM
+        if ( !read_section(image_base, ".xsm", &xsm, NULL) )
+        {
+#ifndef CONFIG_XSM_FLASK_POLICY
+            if ( secure )
+                blexit(L"Secure Boot enabled, but no FLASK policy included=
");
+#endif
+            name.s =3D get_value(&cfg, section.s, "xsm");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &xsm, NULL);
+                efi_bs->FreePool(name.w);
+            }
         }
+#endif

         /*
          * EFI_LOAD_OPTION does not supply an image name as first componen=
t:
diff --git a/xen/scripts/unify-xen b/xen/scripts/unify-xen
new file mode 100755
index 0000000..b6072b1
--- /dev/null
+++ b/xen/scripts/unify-xen
@@ -0,0 +1,68 @@
+#!/bin/bash
+# Merge a Linux kernel, initrd and commandline into xen.efi to produce a s=
ingle signed
+# EFI executable.
+#
+# turn off "expressions don't expand in single quotes"
+# and "can't follow non-constant sources"
+# shellcheck disable=3DSC2016 disable=3DSC1090
+set -e -o pipefail
+export LC_ALL=3DC
+
+die() { echo "$@" >&2 ; exit 1 ; }
+warn() { echo "$@" >&2 ; }
+debug() { [ "$VERBOSE" =3D=3D 1 ] && echo "$@" >&2 ; }
+
+cleanup() {
+=09rm -rf "$TMP"
+}
+
+TMP=3D$(mktemp -d)
+TMP_MOUNT=3Dn
+trap cleanup EXIT
+
+########################################
+
+# Usage
+# unify xen.efi xen.cfg bzimage initrd
+# Xen goes up to a pad at 00400000
+
+XEN=3D"$1"
+CONFIG=3D"$2"
+KERNEL=3D"$3"
+RAMDISK=3D"$4"
+#=09--change-section-vma  .config=3D0x0500000 \
+#=09--change-section-vma  .kernel=3D0x0510000 \
+#=09--change-section-vma .ramdisk=3D0x3000000 \
+
+objcopy \
+=09--add-section .kernel=3D"$KERNEL" \
+=09--add-section .ramdisk=3D"$RAMDISK" \
+=09--add-section .config=3D"$CONFIG" \
+=09--change-section-vma  .config=3D0xffff82d041000000 \
+=09--change-section-vma  .kernel=3D0xffff82d041010000 \
+=09--change-section-vma .ramdisk=3D0xffff82d042000000 \
+=09"$XEN" \
+=09"$TMP/xen.efi" \
+|| die "$TMP/xen.efi: unable to create"
+
+KEY_ENGINE=3D""
+KEY=3D"/etc/safeboot/signing.key"
+CERT=3D"/etc/safeboot/cert.pem"
+
+for try in 1 2 3 ; do
+=09warn "$TMP/xen.efi: Signing (ignore warnings about gaps)"
+=09sbsign.safeboot \
+=09=09$KEY_ENGINE \
+=09=09--key "$KEY" \
+=09=09--cert "$CERT" \
+=09=09--output "xen.signed.efi" \
+=09=09"$TMP/xen.efi" \
+=09&& break
+
+=09if [ "$try" =3D=3D 3 ]; then
+=09=09die "xen.signed.efi: failed after $try tries"
+=09fi
+
+=09warn "$OUTDIR/linux.efi: signature failed! Try $try."
+done
+


