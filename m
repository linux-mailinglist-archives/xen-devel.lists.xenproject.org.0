Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E89423DB0E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 16:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3gfl-0004Yq-Mt; Thu, 06 Aug 2020 14:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=775r=BQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k3gfj-0004Yl-Tm
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 14:15:08 +0000
X-Inumbo-ID: bd257d1e-0b1a-451d-89c0-ab393de73bc4
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd257d1e-0b1a-451d-89c0-ab393de73bc4;
 Thu, 06 Aug 2020 14:15:04 +0000 (UTC)
Date: Thu, 06 Aug 2020 14:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596723302;
 bh=9EUXXDDRtXeDPJSObp3m53XCnteeXyv3fOc1N8qS8PM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=raoClrxt9plFj3mPm+vDDW1fDxOaDP23c0zUnyREHj7duBd2udDGk9Frm2tM6g8dh
 3okrXPC1FuOwKQLm7CHcLcvsHN6DuSz5qDw4FOlmhF6fxEuHAIwbI4MXlg7ggR6wUd
 BLd+YybUaTJdr3DlGFjwiF65HREKMYNE/BryO/WI=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
Message-ID: <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
In-Reply-To: <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, August 6, 2020 2:04 PM, Jan Beulich <jbeulich@suse.com> wrote:

> On 06.08.2020 13:44, Trammell Hudson wrote:
>
> > On Thursday, August 6, 2020 9:57 AM, Jan Beulich jbeulich@suse.com wrot=
e:
> >
> > > Overall I think it might help if this PE parsing code (if UEFI
> > > doesn't offer a protocol to do it for us) was put into its own
> > > source file.
> >
> > I tried to putting it into a separate file and ran into link issues,
> > seems that it needs to be mentioned in both arch/x86/Makefile and
> > arch/x86/pe/Makefile, so this was a "just make it work" for the PoC.
> > Now that it is working, I'll go back to see if I can figure out the
> > makefile magic.
>
> I was rather thinking of e.g. xen/common/efi/pe.c.

PE parsing code is in now in common/efi/pe.c, with a symlink in arch/x86/ef=
i/,
and I added an extern in common/efi/efi.h.  The Makefiles in both arch/x86 =
and
arch/x86/efi required updates to link in the extra pe.init.o file.

I think this still requires some changes for ARM.

> [...]
> > > > -   if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_gui=
d, NULL, &size, buf) !=3D EFI_SUCCESS )
> > > > -            return false;
> > > >
> > > >
> > > > -   return buf[0] !=3D 0;
> > >
> > > I.e. "SecureBoot=3DN" still means "enabled"?
> >
> > Maybe? UEFI 2.8, section 3.3 "Global Variables" says for SecureBoot:
> > "Whether the platform firmware is operating in Secure boot mode (1) or =
not (0). All other values
> > are reserved. Should be treated as read-only."
>
> But in your expression that's then presumably '0', not 0?

The values are the bytes '\x00' or '\x01'. UEFI uses human readable strings=
,
except where it doesn't.

> > > Also, considering kernel and initrd are embedded, is there really a
> > > strict need for a config file? It would seem to me that you could
> > > boot the system fine without.
> >
> > The config file is still necessary for Xen options (console, etc) as
> > well as the kernel command line.
>
> But command line options are optional. Yes, you need a config file if
> you want to pass any options. But you may be able to get away without
> command line options, and hence without config file.

My concern is that if there is no config file embedded in the unified
image, then the logic for retrieving the untrustworthy file from disk
kicks in.  However, it is not a change from the status-quo, so I've
reverted the behavior (as part of also fixing the shim logic).

I also added code to load the ucode section from the unified image
if it is present, which required touching the arm tree as well to add
an additional parameter to efi_arch_cfg_file_late().  It also
appears that in the event of the error path that the ucode will
never be freed.  Probably not a big deal, unless you're launching
a failing Xen from the EFI shell over and over.

> > > > +objcopy \
> > > >
> > > > -   --add-section .kernel=3D"$KERNEL" \
> > > > -   --add-section .ramdisk=3D"$RAMDISK" \
> > > > -   --add-section .config=3D"$CONFIG" \
> > > > -   --change-section-vma .config=3D0xffff82d041000000 \
> > > > -   --change-section-vma .kernel=3D0xffff82d041010000 \
> > > > -   --change-section-vma .ramdisk=3D0xffff82d042000000 \
> > >
> > > Of course these hard coded numbers will be eliminated in the
> > > long run?
> >
> > Ideally. We could try to parse out the address based on the objdump out=
put,
> > although oddly systemd-boot has hardcoded ones as well.
>
> Perhaps the Linux kernel (or whatever else they work on) doesn't
> ever change addresses. The addresses shown here have changed just
> recently (they moved down by 1Gb).

Since the unify script doesn't have access to the build tree, I added
some logic that tries to deduce the correct address range and adds the
unified bits a little ways above it.

Updated patch:


diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6527cb0..fb763ce 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -395,7 +395,7 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HAN=
DLE dir_handle, char *sec
         blexit(L"Unable to create new FDT");
 }

-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char=
 *section)
+static void __init efi_arch_cfg_file_late(const void * image_base, EFI_FIL=
E_HANDLE dir_handle, char *section)
 {
 }

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index b388861..ebb2616 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -127,13 +127,13 @@ prelink-efi_lto.o: $(ALL_OBJS) efi/runtime.o efi/comp=
at.o
 prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_l=
to.o
 =09$(LD) $(XEN_LDFLAGS) -r -o $@ $^

-prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) preli=
nk-efi_lto.o efi/boot.init.o
+prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) preli=
nk-efi_lto.o efi/boot.init.o efi/pe.init.o
 =09$(LD) $(XEN_LDFLAGS) -r -o $@ $^
 else
 prelink.o: $(ALL_OBJS)
 =09$(LD) $(XEN_LDFLAGS) -r -o $@ $^

-prelink-efi.o: $(ALL_OBJS) efi/boot.init.o efi/runtime.o efi/compat.o
+prelink-efi.o: $(ALL_OBJS) efi/boot.init.o efi/pe.init.o efi/runtime.o efi=
/compat.o
 =09$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %/efi/built_in.o,$^)
 endif

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 3e4c395..cdba3d0 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -8,7 +8,7 @@ cmd_objcopy_o_ihex =3D $(OBJCOPY) -I ihex -O binary $< $@

 boot.init.o: buildid.o

-EFIOBJ :=3D boot.init.o compat.o runtime.o
+EFIOBJ :=3D boot.init.o pe.init.o compat.o runtime.o

 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=
=3D4)
 $(EFIOBJ): CFLAGS-stack-boundary :=3D $(cflags-stack-boundary)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7188c9a..073d2e4 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -276,9 +276,11 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HA=
NDLE dir_handle, char *sec
 {
 }

-static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char=
 *section)
+static void __init efi_arch_cfg_file_late(const void * image_base, EFI_FIL=
E_HANDLE dir_handle, char *section)
 {
     union string name;
+    if ( read_section(image_base, ".ucode", &ucode, NULL) )
+        return;

     name.s =3D get_value(&cfg, section, "ucode");
     if ( !name.s )
diff --git a/xen/arch/x86/efi/pe.c b/xen/arch/x86/efi/pe.c
new file mode 120000
index 0000000..e1de52a
--- /dev/null
+++ b/xen/arch/x86/efi/pe.c
@@ -0,0 +1 @@
+../../../common/efi/pe.c
\ No newline at end of file
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5a520bf..0c76f31 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {

 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         void *ptr;
@@ -121,6 +122,8 @@ static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, char *options);
+static bool read_section(const void * const image_base,
+        char * const name, struct file *file, char *options);
 static size_t wstrlen(const CHAR16 * s);
 static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
 static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
@@ -330,13 +333,13 @@ static void __init noreturn blexit(const CHAR16 *str)
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
@@ -619,6 +622,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle=
, CHAR16 *name,
         what =3D what ?: L"Seek";
     else
     {
+        file->need_to_free =3D true;
         file->addr =3D min(1UL << (32 + PAGE_SHIFT),
                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
         ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
@@ -665,6 +669,37 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handl=
e, CHAR16 *name,
     return true;
 }

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
+
+    efi_arch_handle_module(file, name_string.w, options);
+    efi_bs->FreePool(name_string.w);
+
+    return true;
+}
+
 static void __init pre_parse(const struct file *cfg)
 {
     char *ptr =3D cfg->ptr, *end =3D ptr + cfg->size;
@@ -968,6 +1003,21 @@ static void __init setup_efi_pci(void)
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
@@ -1143,6 +1193,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOCOL=
;
     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
     EFI_LOADED_IMAGE *loaded_image;
+    void * image_base =3D NULL;
     EFI_STATUS status;
     unsigned int i, argc;
     CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
@@ -1153,6 +1204,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     bool base_video =3D false;
     char *option_str;
     bool use_cfg_file;
+    bool secure =3D false;

     __set_bit(EFI_BOOT, &efi_flags);
     __set_bit(EFI_LOADER, &efi_flags);
@@ -1171,6 +1223,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
SystemTable)
         PrintErrMesg(L"No Loaded Image Protocol", status);

     efi_arch_load_addr_check(loaded_image);
+    if ( loaded_image )
+        image_base =3D loaded_image->ImageBase;
+
+    secure =3D efi_secure_boot();

     if ( use_cfg_file )
     {
@@ -1249,9 +1305,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *=
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
+        else if ( !cfg_file_name )
         {
+            /* Read and parse the config file. */
             CHAR16 *tail;

             while ( (tail =3D point_tail(file_name)) !=3D NULL )
@@ -1303,26 +1365,36 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
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
+            name.s =3D get_value(&cfg, section.s, "ramdisk");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
+                efi_bs->FreePool(name.w);
+            }
+        }
+
+        if ( !read_section(image_base, ".xsm", &xsm, NULL) )
+        {
+            name.s =3D get_value(&cfg, section.s, "xsm");
+            if ( name.s )
+            {
+                read_file(dir_handle, s2w(&name), &xsm, NULL);
+                efi_bs->FreePool(name.w);
+            }
         }

         /*
@@ -1358,7 +1430,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
             }
         }

-        efi_arch_cfg_file_late(dir_handle, section.s);
+        efi_arch_cfg_file_late(image_base, dir_handle, section.s);

         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
         cfg.addr =3D 0;
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index 2e38d05..cd5f456 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -41,3 +41,6 @@ extern UINT64 efi_apple_properties_addr;
 extern UINTN efi_apple_properties_len;

 const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
+
+void * pe_find_section(const void * const image_base,
+        const char * section_name, UINTN * size_out);
diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
new file mode 100644
index 0000000..4eaa73d
--- /dev/null
+++ b/xen/common/efi/pe.c
@@ -0,0 +1,107 @@
+#include "efi.h"
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
+#define PE_HEADER_MACHINE_ARM64         0xaa64
+#define PE_HEADER_MACHINE_X64           0x8664
+#define PE_HEADER_MACHINE_I386          0x014c
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
+void * __init pe_find_section(const void * const image_base,
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
+#if defined(__ARM__)
+    if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_ARM64)
+        return NULL;
+#elif defined(__x86_64__)
+    if (pe->FileHeader.Machine !=3D PE_HEADER_MACHINE_X64)
+        return NULL;
+#else
+    // unknown architecture
+    return NULL;
+#endif
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
diff --git a/xen/scripts/unify-xen b/xen/scripts/unify-xen
new file mode 100755
index 0000000..6d17169
--- /dev/null
+++ b/xen/scripts/unify-xen
@@ -0,0 +1,89 @@
+#!/bin/bash
+# Build a "unified Xen" image.
+# Usage
+# unify xen.efi xen.cfg bzimage initrd [xsm [ucode]]
+#
+# Merge a Xen configuration, Linux kernel, initrd, and optional XSM or uco=
de
+# into xen.efi to produce a single signed EFI executable.
+#
+# For shellcheck
+# - turn off "expressions don't expand in single quotes"
+# - and "can't follow non-constant sources"
+# shellcheck disable=3DSC2016 disable=3DSC1090
+set -e -o pipefail
+export LC_ALL=3DC
+
+die() { echo "$@" >&2 ; exit 1 ; }
+warn() { echo "$@" >&2 ; }
+debug() { [ "$V" =3D=3D 1 ] && echo "$@" >&2 ; }
+
+cleanup() {
+=09rm -rf "$TMP"
+}
+
+TMP=3D$(mktemp -d)
+trap cleanup EXIT
+
+########################################
+
+XEN=3D"$1"
+CONFIG=3D"$2"
+KERNEL=3D"$3"
+RAMDISK=3D"$4"
+XSM=3D"$5"
+UCODE=3D"$6"
+
+if [ ! -r "$XEN" ]; then
+=09die "$XEN: Unable to find Xen executable"
+fi
+
+BASE_ADDR=3D"$(objdump -h "$XEN" | awk '/ \.text / { print $4 }')"
+PREFIX_ADDR=3D"0x$(echo "$BASE_ADDR" | cut -c1-9)"
+warn "$XEN: Base address $BASE_ADDR"
+
+objcopy \
+=09${CONFIG:+\
+=09=09--add-section .config=3D"$CONFIG" \
+=09=09--change-section-vma .config=3D${PREFIX_ADDR}1000000 \
+=09} \
+=09${UCODE:+\
+=09=09--add-section .ucode=3D"$UCODE" \
+=09=09--change-section-vma  .ucode=3D${PREFIX_ADDR}1010000 \
+=09} \
+=09${XSM:+\
+=09=09--add-section .xsm=3D"$XSM" \
+=09=09--change-section-vma  .xsm=3D${PREFIX_ADDR}1080000 \
+=09} \
+=09${KERNEL:+\
+=09=09--add-section .kernel=3D"$KERNEL" \
+=09=09--change-section-vma  .kernel=3D${PREFIX_ADDR}1100000 \
+=09} \
+=09${RAMDISK:+\
+=09=09--add-section .ramdisk=3D"$RAMDISK" \
+=09=09--change-section-vma .ramdisk=3D${PREFIX_ADDR}2000000 \
+=09} \
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
+=09warn "signature failed! Try $try."
+done
+


