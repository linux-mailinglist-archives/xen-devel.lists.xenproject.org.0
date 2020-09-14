Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA002268D8A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 16:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHpQI-0003Zd-SW; Mon, 14 Sep 2020 14:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHpQG-0003ZY-Ha
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:25:36 +0000
X-Inumbo-ID: 2e4ee2c1-66de-4482-8ce6-cc319723f9fd
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e4ee2c1-66de-4482-8ce6-cc319723f9fd;
 Mon, 14 Sep 2020 14:25:34 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08EEPWb1025788;
 Mon, 14 Sep 2020 08:25:33 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08EEPSYq043968;
 Mon, 14 Sep 2020 08:25:29 -0600 (MDT) (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com
Subject: [RFC PATCH] efi: const correct EFI functions
Date: Mon, 14 Sep 2020 10:25:28 -0400
Message-Id: <20200914142528.897639-1-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Mon, 14 Sep 2020 08:25:30 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
 version=3.4.2
X-Spam-Level: 
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

By defining IN as const, the EFI handler functions become almost
const-correct and allow most of the rest of the EFI boot code to
use constant strings.

There are a few places in the code that casts away the const
that should be reconsidered. The config parser code modifies the
config file in place, which would not work if it were in a read-only
segment.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/arch/arm/efi/efi-boot.h |  8 ++--
 xen/arch/x86/efi/efi-boot.h | 26 +++++------
 xen/common/efi/boot.c       | 92 +++++++++++++++++++------------------
 xen/include/efi/efidef.h    |  2 +-
 4 files changed, 66 insertions(+), 62 deletions(-)

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
@@ -482,7 +482,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
 }
 
 static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
-                                          char *options)
+                                          const char *options)
 {
     int node;
     int chosen;
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7188c9a551..ce5577012b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -280,10 +280,10 @@ static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *sect
 {
     union string name;
 
-    name.s = get_value(&cfg, section, "ucode");
-    if ( !name.s )
-        name.s = get_value(&cfg, "global", "ucode");
-    if ( name.s )
+    name.cs = get_value(&cfg, section, "ucode");
+    if ( !name.cs )
+        name.cs = get_value(&cfg, "global", "ucode");
+    if ( name.cs )
     {
         microcode_set_module(mbi.mods_count);
         split_string(name.s);
@@ -292,29 +292,29 @@ static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *sect
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
-        name.w = cmdline_options;
+        name.cw = cmdline_options;
         w2s(&name);
-        place_string(&mbi.cmdline, name.s);
+        place_string(&mbi.cmdline, name.cs);
     }
     if ( cfgfile_options )
         place_string(&mbi.cmdline, cfgfile_options);
     /* Insert image name last, as it gets prefixed to the other options. */
     if ( image_name )
     {
-        name.w = image_name;
+        name.cw = image_name;
         w2s(&name);
     }
     else
-        name.s = "xen";
-    place_string(&mbi.cmdline, name.s);
+        name.cs = "xen";
+    place_string(&mbi.cmdline, name.cs);
 
     if ( mbi.cmdline )
         mbi.flags |= MBI_CMDLINE;
@@ -636,7 +636,7 @@ static void __init efi_arch_memory_setup(void)
 }
 
 static void __init efi_arch_handle_module(struct file *file, const CHAR16 *name,
-                                          char *options)
+                                          const char *options)
 {
     union string local_name;
     void *ptr;
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 4022a672c9..147af81286 100644
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
 
@@ -113,13 +114,13 @@ static CHAR16 *FormatHex(UINT64 Val, UINTN Width, CHAR16 *Buffer);
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
@@ -149,7 +150,7 @@ static struct file __initdata cfg;
 static struct file __initdata kernel;
 static struct file __initdata ramdisk;
 static struct file __initdata xsm;
-static CHAR16 __initdata newline[] = L"\r\n";
+static const CHAR16 __initconst newline[] = L"\r\n";
 
 #define PrintStr(s) StdOut->OutputString(StdOut, s)
 #define PrintErr(s) StdErr->OutputString(StdErr, s)
@@ -230,7 +231,7 @@ static int __init wstrncmp(const CHAR16 *s1, const CHAR16 *s2, UINTN n)
     return n ? *s1 - *s2 : 0;
 }
 
-static CHAR16 *__init s2w(union string *str)
+static const CHAR16 *__init s2w(union string *str)
 {
     const char *s = str->s;
     CHAR16 *w;
@@ -245,12 +246,12 @@ static CHAR16 *__init s2w(union string *str)
         *w = *s++;
     } while ( *w++ );
 
-    return str->w;
+    return str->cw;
 }
 
-static char *__init w2s(const union string *str)
+static const char *__init w2s(const union string *str)
 {
-    const CHAR16 *w = str->w;
+    const CHAR16 *w = str->cw;
     char *s = str->s;
 
     do {
@@ -259,7 +260,7 @@ static char *__init w2s(const union string *str)
         *s = *w++;
     } while ( *s++ );
 
-    return str->s;
+    return str->cs;
 }
 
 static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
@@ -314,7 +315,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
     EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
 
     StdOut = StdErr;
-    PrintErr((CHAR16 *)mesg);
+    PrintErr(mesg);
     PrintErr(L": ");
 
     if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
@@ -330,7 +331,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
 
 static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
                                     VOID *data, UINTN size, UINTN *offset,
-                                    CHAR16 **options)
+                                    const CHAR16 **options)
 {
     CHAR16 *ptr = (CHAR16 *)(argv + argc + 1), *prev = NULL, *cmdline = NULL;
     bool prev_sep = true;
@@ -538,13 +539,14 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
-static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
-                             struct file *file, char *options)
+static bool __init read_file(EFI_FILE_HANDLE dir_handle, const CHAR16 *name,
+                             struct file *file, const char *options)
 {
     EFI_FILE_HANDLE FileHandle = NULL;
     UINT64 size;
     EFI_STATUS ret;
-    CHAR16 *what = NULL;
+    const CHAR16 *what = NULL;
+    EFI_PHYSICAL_ADDRESS addr = 0;
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
@@ -568,10 +570,10 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
         what = what ?: L"Seek";
     else
     {
-        file->addr = min(1UL << (32 + PAGE_SHIFT),
-                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
+        addr = min(1UL << (32 + PAGE_SHIFT),
+                   HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
-                                    PFN_UP(size), &file->addr);
+                                    PFN_UP(size), &addr);
     }
     if ( EFI_ERROR(ret) )
     {
@@ -581,6 +583,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     else
     {
         file->size = size;
+        file->addr = addr;
         if ( file != &cfg )
         {
             PrintStr(name);
@@ -592,7 +595,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
             efi_arch_handle_module(file, name, options);
         }
 
-        ret = FileHandle->Read(FileHandle, &file->size, file->ptr);
+        ret = FileHandle->Read(FileHandle, &file->size, (void *)addr);
         if ( !EFI_ERROR(ret) && file->size != size )
             ret = EFI_ABORTED;
         if ( EFI_ERROR(ret) )
@@ -616,7 +619,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
 static void __init pre_parse(const struct file *cfg)
 {
-    char *ptr = cfg->ptr, *end = ptr + cfg->size;
+    char *ptr = (void *)cfg->ptr, *end = ptr + cfg->size;
     bool start = true, comment = false;
 
     for ( ; ptr < end; ++ptr )
@@ -642,10 +645,10 @@ static void __init pre_parse(const struct file *cfg)
                    " last line will be ignored.\r\n");
 }
 
-static char *__init get_value(const struct file *cfg, const char *section,
-                              const char *item)
+static const char *__init get_value(const struct file *cfg, const char *section,
+                                    const char *item)
 {
-    char *ptr = cfg->ptr, *end = ptr + cfg->size;
+    const char *ptr = cfg->ptr, *end = ptr + cfg->size;
     size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
     bool match = !slen;
 
@@ -804,11 +807,11 @@ static void __init efi_tables(void)
     /* Obtain basic table pointers. */
     for ( i = 0; i < efi_num_ct; ++i )
     {
-        static EFI_GUID __initdata acpi2_guid = ACPI_20_TABLE_GUID;
-        static EFI_GUID __initdata acpi_guid = ACPI_TABLE_GUID;
-        static EFI_GUID __initdata mps_guid = MPS_TABLE_GUID;
-        static EFI_GUID __initdata smbios_guid = SMBIOS_TABLE_GUID;
-        static EFI_GUID __initdata smbios3_guid = SMBIOS3_TABLE_GUID;
+        static const EFI_GUID __initconst acpi2_guid = ACPI_20_TABLE_GUID;
+        static const EFI_GUID __initconst acpi_guid = ACPI_TABLE_GUID;
+        static const EFI_GUID __initconst mps_guid = MPS_TABLE_GUID;
+        static const EFI_GUID __initconst smbios_guid = SMBIOS_TABLE_GUID;
+        static const EFI_GUID __initconst smbios3_guid = SMBIOS3_TABLE_GUID;
 
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
 	       efi.acpi20 = (long)efi_ct[i].VendorTable;
@@ -1094,7 +1097,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
     EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
     unsigned int i, argc;
-    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
+    CHAR16 **argv, *file_name;
+    const CHAR16 *cfg_file_name = NULL, *options = NULL;
     UINTN gop_mode = ~0;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
@@ -1138,7 +1142,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             argc = 0;
         for ( i = 1; i < argc; ++i )
         {
-            CHAR16 *ptr = argv[i];
+            const CHAR16 *ptr = argv[i];
 
             if ( !ptr )
                 break;
@@ -1170,7 +1174,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
                 }
             }
             else
-                section.w = ptr;
+                section.cw = ptr;
         }
 
         if ( !base_video )
@@ -1223,15 +1227,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
         if ( section.w )
             w2s(&section);
         else
-            section.s = get_value(&cfg, "global", "default");
+            section.cs = get_value(&cfg, "global", "default");
 
         for ( ; ; )
         {
-            name.s = get_value(&cfg, section.s, "kernel");
-            if ( name.s )
+            name.cs = get_value(&cfg, section.s, "kernel");
+            if ( name.cs )
                 break;
-            name.s = get_value(&cfg, "global", "chain");
-            if ( !name.s )
+            name.cs = get_value(&cfg, "global", "chain");
+            if ( !name.cs )
                 break;
             efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
             cfg.addr = 0;
@@ -1260,15 +1264,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
              (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
             PrintErrMesg(L"Dom0 kernel image could not be verified", status);
 
-        name.s = get_value(&cfg, section.s, "ramdisk");
-        if ( name.s )
+        name.cs = get_value(&cfg, section.s, "ramdisk");
+        if ( name.cs )
         {
             read_file(dir_handle, s2w(&name), &ramdisk, NULL);
             efi_bs->FreePool(name.w);
         }
 
-        name.s = get_value(&cfg, section.s, "xsm");
-        if ( name.s )
+        name.cs = get_value(&cfg, section.s, "xsm");
+        if ( name.cs )
         {
             read_file(dir_handle, s2w(&name), &xsm, NULL);
             efi_bs->FreePool(name.w);
@@ -1287,7 +1291,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
             *argv = file_name;
         }
 
-        name.s = get_value(&cfg, section.s, "options");
+        name.cs = get_value(&cfg, section.cs, "options");
         efi_arch_handle_cmdline(argc ? *argv : NULL, options, name.s);
 
         if ( !base_video )
diff --git a/xen/include/efi/efidef.h b/xen/include/efi/efidef.h
index 86a7e111bf..1d1c779d66 100644
--- a/xen/include/efi/efidef.h
+++ b/xen/include/efi/efidef.h
@@ -50,7 +50,7 @@ typedef VOID            *EFI_EVENT;
 //
 
 #ifndef IN
-    #define IN
+    #define IN const
     #define OUT
     #define OPTIONAL
 #endif
-- 
2.25.1


