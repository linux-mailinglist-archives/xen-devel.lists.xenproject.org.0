Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA61826A2A2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 12:02:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI7n3-0007Nn-JV; Tue, 15 Sep 2020 10:02:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix3r=CY=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kI7n2-0007Ni-9F
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 10:02:20 +0000
X-Inumbo-ID: 20336a09-e370-4557-b317-2fba63ecc632
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20336a09-e370-4557-b317-2fba63ecc632;
 Tue, 15 Sep 2020 10:02:16 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600164135;
 bh=J7fjFvcyUTHqYbfjTlLRrUs06CW27rni4j0LhWhCa4Y=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=BRE0QvH9RGTg8IOLlzDBGU5NXj7vFcBGQ6ll8XFPXTfTMnSqT1xrlaY8NFdCzUqC2
 J6cc4ngNEq6ldZZsEtg/FIArIkUjoDEB3OW3b2YtiajIAYnG+T2YEGR29aJqtRvD53
 nXRzwvuNrXOrKXS+/0tkbCajvNzBMb7dhySCmMgI=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Cc: Jan Beulich <jbeulich@suse.com>
Subject: [RFC PATCH v2] efi: const correct EFI functions
Message-ID: <H6ozE5MaNxWCNeoYOjzIuwr5pFTnlM2wAGkSFsWA3-c6OZ4x0TpuFSJTh2e6zTVD-ZC-f9KRfA6THcbHLD2hNNbiByTbEHl56_itVZuLBYw=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

By wrapping the few EFI handler functions used by the Xen boot process
and casting away constness where safe, it is possible to allow most of
the rest of the EFI boot code to use constant strings and GUIDs.

There are a few places in the code that casts away the const that should
be reconsidered. For instance, the config parser code modifies the config
file in place, which would not work if it were in a read-only segment.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/arch/arm/efi/efi-boot.h |   8 +-
 xen/arch/x86/efi/efi-boot.h |  40 ++++-----
 xen/common/efi/boot.c       | 157 ++++++++++++++++++++----------------
 3 files changed, 111 insertions(+), 94 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6527cb0bdf..13666bc065 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -418,9 +418,9 @@ static void __init efi_arch_memory_setup(void)
 {
 }

-static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
-                                           CHAR16 *cmdline_options,
-                                           char *cfgfile_options)
+static void __init efi_arch_handle_cmdline(const CHAR16 *image_name,
+                                           const CHAR16 *cmdline_options,
+                                           const char *cfgfile_options)
 {
     union string name;
     char *buf;
@@ -482,7 +482,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *imag=
e_name,
 }

 static void __init efi_arch_handle_module(struct file *file, const CHAR16 =
*name,
-                                          char *options)
+                                          const char *options)
 {
     int node;
     int chosen;
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7188c9a551..8e9811f3e0 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -280,10 +280,10 @@ static void __init efi_arch_cfg_file_late(EFI_FILE_HA=
NDLE dir_handle, char *sect
 {
     union string name;

-    name.s =3D get_value(&cfg, section, "ucode");
-    if ( !name.s )
-        name.s =3D get_value(&cfg, "global", "ucode");
-    if ( name.s )
+    name.cs =3D get_value(&cfg, section, "ucode");
+    if ( !name.cs )
+        name.cs =3D get_value(&cfg, "global", "ucode");
+    if ( name.cs )
     {
         microcode_set_module(mbi.mods_count);
         split_string(name.s);
@@ -292,29 +292,29 @@ static void __init efi_arch_cfg_file_late(EFI_FILE_HA=
NDLE dir_handle, char *sect
     }
 }

-static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
-                                           CHAR16 *cmdline_options,
-                                           char *cfgfile_options)
+static void __init efi_arch_handle_cmdline(const CHAR16 *image_name,
+                                           const CHAR16 *cmdline_options,
+                                           const char *cfgfile_options)
 {
     union string name;

     if ( cmdline_options )
     {
-        name.w =3D cmdline_options;
+        name.cw =3D cmdline_options;
         w2s(&name);
-        place_string(&mbi.cmdline, name.s);
+        place_string(&mbi.cmdline, name.cs);
     }
     if ( cfgfile_options )
         place_string(&mbi.cmdline, cfgfile_options);
     /* Insert image name last, as it gets prefixed to the other options. *=
/
     if ( image_name )
     {
-        name.w =3D image_name;
+        name.cw =3D image_name;
         w2s(&name);
     }
     else
-        name.s =3D "xen";
-    place_string(&mbi.cmdline, name.s);
+        name.cs =3D "xen";
+    place_string(&mbi.cmdline, name.cs);

     if ( mbi.cmdline )
         mbi.flags |=3D MBI_CMDLINE;
@@ -328,8 +328,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *imag=
e_name,

 static void __init efi_arch_edd(void)
 {
-    static EFI_GUID __initdata bio_guid =3D BLOCK_IO_PROTOCOL;
-    static EFI_GUID __initdata devp_guid =3D DEVICE_PATH_PROTOCOL;
+    static const EFI_GUID __initconst bio_guid =3D BLOCK_IO_PROTOCOL;
+    static const EFI_GUID __initconst devp_guid =3D DEVICE_PATH_PROTOCOL;
     EFI_HANDLE *handles =3D NULL;
     unsigned int i;
     UINTN size;
@@ -339,12 +339,12 @@ static void __init efi_arch_edd(void)
     BUILD_BUG_ON(offsetof(struct edd_info, edd_device_params) !=3D EDDEXTS=
IZE);
     BUILD_BUG_ON(sizeof(struct edd_device_params) !=3D EDDPARMSIZE);
     size =3D 0;
-    status =3D efi_bs->LocateHandle(ByProtocol, &bio_guid, NULL, &size, NU=
LL);
+    status =3D efi_locate_handle(ByProtocol, &bio_guid, NULL, &size, NULL)=
;
     if ( status =3D=3D EFI_BUFFER_TOO_SMALL )
         status =3D efi_bs->AllocatePool(EfiLoaderData, size, (void **)&han=
dles);
     if ( !EFI_ERROR(status) )
-        status =3D efi_bs->LocateHandle(ByProtocol, &bio_guid, NULL, &size=
,
-                                      handles);
+        status =3D efi_locate_handle(ByProtocol, &bio_guid, NULL, &size,
+                                   handles);
     if ( EFI_ERROR(status) )
         size =3D 0;
     for ( i =3D 0; i < size / sizeof(*handles); ++i )
@@ -355,7 +355,7 @@ static void __init efi_arch_edd(void)
         struct edd_device_params *params =3D &info->edd_device_params;
         enum { root, acpi, pci, ctrlr } state =3D root;

-        status =3D efi_bs->HandleProtocol(handles[i], &bio_guid, (void **)=
&bio);
+        status =3D efi_handle_protocol(handles[i], &bio_guid, (void **)&bi=
o);
         if ( EFI_ERROR(status) ||
              bio->Media->RemovableMedia ||
              bio->Media->LogicalPartition )
@@ -370,7 +370,7 @@ static void __init efi_arch_edd(void)
             params->dpte_ptr =3D ~0;
         }
         ++boot_edd_info_nr;
-        status =3D efi_bs->HandleProtocol(handles[i], &devp_guid,
+        status =3D efi_handle_protocol(handles[i], &devp_guid,
                                         (void **)&devp);
         if ( EFI_ERROR(status) )
             continue;
@@ -636,7 +636,7 @@ static void __init efi_arch_memory_setup(void)
 }

 static void __init efi_arch_handle_module(struct file *file, const CHAR16 =
*name,
-                                          char *options)
+                                          const char *options)
 {
     union string local_name;
     void *ptr;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 4022a672c9..1e6fe85c2a 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -98,13 +98,14 @@ union string {
     CHAR16 *w;
     char *s;
     const char *cs;
+    const CHAR16 *cw;
 };

 struct file {
     UINTN size;
     union {
         EFI_PHYSICAL_ADDRESS addr;
-        void *ptr;
+        const void *ptr;
     };
 };

@@ -113,13 +114,13 @@ static CHAR16 *FormatHex(UINT64 Val, UINTN Width, CHA=
R16 *Buffer);
 static void  DisplayUint(UINT64 Val, INTN Width);
 static CHAR16 *wstrcpy(CHAR16 *d, const CHAR16 *s);
 static void PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode);
-static char *get_value(const struct file *cfg, const char *section,
-                              const char *item);
+static const char *get_value(const struct file *cfg, const char *section,
+                             const char *item);
 static char *split_string(char *s);
-static CHAR16 *s2w(union string *str);
-static char *w2s(const union string *str);
-static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
-                      struct file *file, char *options);
+static const CHAR16 *s2w(union string *str);
+static const char *w2s(const union string *str);
+static bool read_file(EFI_FILE_HANDLE dir_handle, const CHAR16 *name,
+                      struct file *file, const char *options);
 static size_t wstrlen(const CHAR16 * s);
 static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
 static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
@@ -149,10 +150,23 @@ static struct file __initdata cfg;
 static struct file __initdata kernel;
 static struct file __initdata ramdisk;
 static struct file __initdata xsm;
-static CHAR16 __initdata newline[] =3D L"\r\n";
-
-#define PrintStr(s) StdOut->OutputString(StdOut, s)
-#define PrintErr(s) StdErr->OutputString(StdErr, s)
+static const CHAR16 __initconst newline[] =3D L"\r\n";
+
+/* Cast away const-ness on EFI entry points */
+#define PrintStr(s) StdOut->OutputString(StdOut, (CHAR16 *)(s))
+#define PrintErr(s) StdErr->OutputString(StdErr, (CHAR16 *)(s))
+#define efi_file_open(file,handle,name,mode,attr) \
+    (file)->Open(file, handle, (CHAR16 *)(name), mode, attr)
+#define efi_handle_protocol(handle, protocol, interface) \
+    efi_bs->HandleProtocol(handle, (EFI_GUID *)(protocol), interface)
+#define efi_locate_protocol(protocol, registration, interface) \
+    efi_bs->LocateProtocol((EFI_GUID *)(protocol), (void *)(registration),=
 \
+                           interface)
+#define efi_locate_handle(type, protocol, key, size, buffer) \
+    efi_bs->LocateHandle(type, (EFI_GUID *)(protocol), (void *)(key), \
+                         size, buffer)
+#define shim_verify(shim, ptr, len) \
+    (shim)->Verify((void *)(ptr), len)

 /*
  * Include architecture specific implementation here, which references the
@@ -230,7 +244,7 @@ static int __init wstrncmp(const CHAR16 *s1, const CHAR=
16 *s2, UINTN n)
     return n ? *s1 - *s2 : 0;
 }

-static CHAR16 *__init s2w(union string *str)
+static const CHAR16 *__init s2w(union string *str)
 {
     const char *s =3D str->s;
     CHAR16 *w;
@@ -245,12 +259,12 @@ static CHAR16 *__init s2w(union string *str)
         *w =3D *s++;
     } while ( *w++ );

-    return str->w;
+    return str->cw;
 }

-static char *__init w2s(const union string *str)
+static const char *__init w2s(const union string *str)
 {
-    const CHAR16 *w =3D str->w;
+    const CHAR16 *w =3D str->cw;
     char *s =3D str->s;

     do {
@@ -259,7 +273,7 @@ static char *__init w2s(const union string *str)
         *s =3D *w++;
     } while ( *s++ );

-    return str->s;
+    return str->cs;
 }

 static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2=
)
@@ -314,7 +328,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI=
_STATUS ErrCode)
     EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;

     StdOut =3D StdErr;
-    PrintErr((CHAR16 *)mesg);
+    PrintErr(mesg);
     PrintErr(L": ");

     if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
@@ -330,7 +344,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI=
_STATUS ErrCode)

 static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
                                     VOID *data, UINTN size, UINTN *offset,
-                                    CHAR16 **options)
+                                    const CHAR16 **options)
 {
     CHAR16 *ptr =3D (CHAR16 *)(argv + argc + 1), *prev =3D NULL, *cmdline =
=3D NULL;
     bool prev_sep =3D true;
@@ -423,7 +437,7 @@ static unsigned int __init get_argv(unsigned int argc, =
CHAR16 **argv,
 static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_i=
mage,
                                                 CHAR16 **leaf)
 {
-    static EFI_GUID __initdata fs_protocol =3D SIMPLE_FILE_SYSTEM_PROTOCOL=
;
+    static const EFI_GUID __initconst fs_protocol =3D SIMPLE_FILE_SYSTEM_P=
ROTOCOL;
     static CHAR16 __initdata buffer[512];
     EFI_FILE_HANDLE dir_handle;
     EFI_DEVICE_PATH *dp;
@@ -434,8 +448,8 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOA=
DED_IMAGE *loaded_image,
         EFI_FILE_IO_INTERFACE *fio;

         /* Get the file system interface. */
-        ret =3D efi_bs->HandleProtocol(loaded_image->DeviceHandle,
-                                     &fs_protocol, (void **)&fio);
+        ret =3D efi_handle_protocol(loaded_image->DeviceHandle,
+                                  &fs_protocol, (void **)&fio);
         if ( EFI_ERROR(ret) )
             PrintErrMesg(L"Couldn't obtain the File System Protocol Interf=
ace",
                          ret);
@@ -538,18 +552,19 @@ static char * __init split_string(char *s)
     return NULL;
 }

-static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
-                             struct file *file, char *options)
+static bool __init read_file(EFI_FILE_HANDLE dir_handle, const CHAR16 *nam=
e,
+                             struct file *file, const char *options)
 {
     EFI_FILE_HANDLE FileHandle =3D NULL;
     UINT64 size;
     EFI_STATUS ret;
-    CHAR16 *what =3D NULL;
+    const CHAR16 *what =3D NULL;
+    EFI_PHYSICAL_ADDRESS addr =3D 0;

     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
-    ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
-                           EFI_FILE_MODE_READ, 0);
+    ret =3D efi_file_open(dir_handle, &FileHandle, name,
+                        EFI_FILE_MODE_READ, 0);
     if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
         return false;
     if ( EFI_ERROR(ret) )
@@ -568,10 +583,10 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
         what =3D what ?: L"Seek";
     else
     {
-        file->addr =3D min(1UL << (32 + PAGE_SHIFT),
-                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
+        addr =3D min(1UL << (32 + PAGE_SHIFT),
+                   HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
-                                    PFN_UP(size), &file->addr);
+                                    PFN_UP(size), &addr);
     }
     if ( EFI_ERROR(ret) )
     {
@@ -581,6 +596,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
     else
     {
         file->size =3D size;
+        file->addr =3D addr;
         if ( file !=3D &cfg )
         {
             PrintStr(name);
@@ -592,7 +608,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
             efi_arch_handle_module(file, name, options);
         }

-        ret =3D FileHandle->Read(FileHandle, &file->size, file->ptr);
+        ret =3D FileHandle->Read(FileHandle, &file->size, (void *)addr);
         if ( !EFI_ERROR(ret) && file->size !=3D size )
             ret =3D EFI_ABORTED;
         if ( EFI_ERROR(ret) )
@@ -616,7 +632,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,

 static void __init pre_parse(const struct file *cfg)
 {
-    char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
+    char *ptr =3D (void *)cfg->ptr, *end =3D ptr + cfg->size;
     bool start =3D true, comment =3D false;

     for ( ; ptr < end; ++ptr )
@@ -642,10 +658,10 @@ static void __init pre_parse(const struct file *cfg)
                    " last line will be ignored.\r\n");
 }

-static char *__init get_value(const struct file *cfg, const char *section,
-                              const char *item)
+static const char *__init get_value(const struct file *cfg, const char *se=
ction,
+                                    const char *item)
 {
-    char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
+    const char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
     size_t slen =3D section ? strlen(section) : 0, ilen =3D strlen(item);
     bool match =3D !slen;

@@ -720,20 +736,20 @@ static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_g=
op(void)
     EFI_HANDLE *handles =3D NULL;
     EFI_STATUS status;
     UINTN info_size, size =3D 0;
-    static EFI_GUID __initdata gop_guid =3D EFI_GRAPHICS_OUTPUT_PROTOCOL_G=
UID;
+    static const EFI_GUID __initconst gop_guid =3D EFI_GRAPHICS_OUTPUT_PRO=
TOCOL_GUID;
     unsigned int i;

-    status =3D efi_bs->LocateHandle(ByProtocol, &gop_guid, NULL, &size, NU=
LL);
+    status =3D efi_locate_handle(ByProtocol, &gop_guid, NULL, &size, NULL)=
;
     if ( status =3D=3D EFI_BUFFER_TOO_SMALL )
         status =3D efi_bs->AllocatePool(EfiLoaderData, size, (void **)&han=
dles);
     if ( !EFI_ERROR(status) )
-        status =3D efi_bs->LocateHandle(ByProtocol, &gop_guid, NULL, &size=
,
-                                      handles);
+        status =3D efi_locate_handle(ByProtocol, &gop_guid, NULL, &size,
+                                   handles);
     if ( EFI_ERROR(status) )
         size =3D 0;
     for ( i =3D 0; i < size / sizeof(*handles); ++i )
     {
-        status =3D efi_bs->HandleProtocol(handles[i], &gop_guid, (void **)=
&gop);
+        status =3D efi_handle_protocol(handles[i], &gop_guid, (void **)&go=
p);
         if ( EFI_ERROR(status) )
             continue;
         status =3D gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_=
info);
@@ -804,11 +820,11 @@ static void __init efi_tables(void)
     /* Obtain basic table pointers. */
     for ( i =3D 0; i < efi_num_ct; ++i )
     {
-        static EFI_GUID __initdata acpi2_guid =3D ACPI_20_TABLE_GUID;
-        static EFI_GUID __initdata acpi_guid =3D ACPI_TABLE_GUID;
-        static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
-        static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
-        static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
+        static const EFI_GUID __initconst acpi2_guid =3D ACPI_20_TABLE_GUI=
D;
+        static const EFI_GUID __initconst acpi_guid =3D ACPI_TABLE_GUID;
+        static const EFI_GUID __initconst mps_guid =3D MPS_TABLE_GUID;
+        static const EFI_GUID __initconst smbios_guid =3D SMBIOS_TABLE_GUI=
D;
+        static const EFI_GUID __initconst smbios3_guid =3D SMBIOS3_TABLE_G=
UID;

         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
 =09       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
@@ -834,17 +850,17 @@ static void __init setup_efi_pci(void)
 {
     EFI_STATUS status;
     EFI_HANDLE *handles;
-    static EFI_GUID __initdata pci_guid =3D EFI_PCI_IO_PROTOCOL;
+    static const EFI_GUID __initconst pci_guid =3D EFI_PCI_IO_PROTOCOL;
     UINTN i, nr_pci, size =3D 0;
     struct efi_pci_rom *last =3D NULL;

-    status =3D efi_bs->LocateHandle(ByProtocol, &pci_guid, NULL, &size, NU=
LL);
+    status =3D efi_locate_handle(ByProtocol, &pci_guid, NULL, &size, NULL)=
;
     if ( status !=3D EFI_BUFFER_TOO_SMALL )
         return;
     status =3D efi_bs->AllocatePool(EfiLoaderData, size, (void **)&handles=
);
     if ( EFI_ERROR(status) )
         return;
-    status =3D efi_bs->LocateHandle(ByProtocol, &pci_guid, NULL, &size, ha=
ndles);
+    status =3D efi_locate_handle(ByProtocol, &pci_guid, NULL, &size, handl=
es);
     if ( EFI_ERROR(status) )
         size =3D 0;

@@ -856,7 +872,7 @@ static void __init setup_efi_pci(void)
         struct efi_pci_rom *rom, *va;
         UINTN segment, bus, device, function;

-        status =3D efi_bs->HandleProtocol(handles[i], &pci_guid, (void **)=
&pci);
+        status =3D efi_handle_protocol(handles[i], &pci_guid, (void **)&pc=
i);
         if ( EFI_ERROR(status) || !pci || !pci->RomImage || !pci->RomSize =
)
             continue;

@@ -942,14 +958,14 @@ static void __init efi_variables(void)

 static void __init efi_get_apple_properties(void)
 {
-    static EFI_GUID __initdata props_guid =3D APPLE_PROPERTIES_PROTOCOL_GU=
ID;
+    static const EFI_GUID __initconst props_guid =3D APPLE_PROPERTIES_PROT=
OCOL_GUID;
     EFI_APPLE_PROPERTIES *props;
     UINT32 size =3D 0;
     VOID *data;
     EFI_STATUS status;

-    if ( efi_bs->LocateProtocol(&props_guid, NULL,
-                                (void **)&props) !=3D EFI_SUCCESS )
+    if ( efi_locate_protocol(&props_guid, NULL,
+                             (void **)&props) !=3D EFI_SUCCESS )
         return;
     if ( props->Version !=3D 0x10000 )
     {
@@ -1089,12 +1105,13 @@ static int __init __maybe_unused set_color(u32 mask=
, int bpp, u8 *pos, u8 *sz)
 void EFIAPI __init noreturn
 efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
-    static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOCOL=
;
-    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
+    static const EFI_GUID __initconst loaded_image_guid =3D LOADED_IMAGE_P=
ROTOCOL;
+    static const EFI_GUID __initconst shim_lock_guid =3D SHIM_LOCK_PROTOCO=
L_GUID;
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
     unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
+    CHAR16 **argv, *file_name;
+    const CHAR16 *cfg_file_name =3D NULL, *options =3D NULL;
     UINTN gop_mode =3D ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
@@ -1114,7 +1131,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)

     use_cfg_file =3D efi_arch_use_config_file(SystemTable);

-    status =3D efi_bs->HandleProtocol(ImageHandle, &loaded_image_guid,
+    status =3D efi_handle_protocol(ImageHandle, &loaded_image_guid,
                                     (void **)&loaded_image);
     if ( status !=3D EFI_SUCCESS )
         PrintErrMesg(L"No Loaded Image Protocol", status);
@@ -1138,7 +1155,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
             argc =3D 0;
         for ( i =3D 1; i < argc; ++i )
         {
-            CHAR16 *ptr =3D argv[i];
+            const CHAR16 *ptr =3D argv[i];

             if ( !ptr )
                 break;
@@ -1170,7 +1187,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
                 }
             }
             else
-                section.w =3D ptr;
+                section.cw =3D ptr;
         }

         if ( !base_video )
@@ -1223,15 +1240,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
         if ( section.w )
             w2s(&section);
         else
-            section.s =3D get_value(&cfg, "global", "default");
+            section.cs =3D get_value(&cfg, "global", "default");

         for ( ; ; )
         {
-            name.s =3D get_value(&cfg, section.s, "kernel");
-            if ( name.s )
+            name.cs =3D get_value(&cfg, section.s, "kernel");
+            if ( name.cs )
                 break;
-            name.s =3D get_value(&cfg, "global", "chain");
-            if ( !name.s )
+            name.cs =3D get_value(&cfg, "global", "chain");
+            if ( !name.cs )
                 break;
             efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
             cfg.addr =3D 0;
@@ -1255,20 +1272,20 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
         read_file(dir_handle, s2w(&name), &kernel, option_str);
         efi_bs->FreePool(name.w);

-        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
-                        (void **)&shim_lock)) &&
-             (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D =
EFI_SUCCESS )
+        if ( !EFI_ERROR(efi_locate_protocol(&shim_lock_guid, NULL,
+                                            (void **)&shim_lock)) &&
+             (status =3D shim_verify(shim_lock, kernel.ptr, kernel.size)) =
!=3D EFI_SUCCESS )
             PrintErrMesg(L"Dom0 kernel image could not be verified", statu=
s);

-        name.s =3D get_value(&cfg, section.s, "ramdisk");
-        if ( name.s )
+        name.cs =3D get_value(&cfg, section.s, "ramdisk");
+        if ( name.cs )
         {
             read_file(dir_handle, s2w(&name), &ramdisk, NULL);
             efi_bs->FreePool(name.w);
         }

-        name.s =3D get_value(&cfg, section.s, "xsm");
-        if ( name.s )
+        name.cs =3D get_value(&cfg, section.s, "xsm");
+        if ( name.cs )
         {
             read_file(dir_handle, s2w(&name), &xsm, NULL);
             efi_bs->FreePool(name.w);
@@ -1287,7 +1304,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
             *argv =3D file_name;
         }

-        name.s =3D get_value(&cfg, section.s, "options");
+        name.cs =3D get_value(&cfg, section.cs, "options");
         efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);

         if ( !base_video )
--
2.17.1





