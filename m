Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CD25D93A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEBMe-0001dR-Sf; Fri, 04 Sep 2020 13:02:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+qm=CN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kEBMd-0001dM-Nz
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:02:47 +0000
X-Inumbo-ID: d0ccacd3-67a2-4970-bc7b-a21ee275cc58
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0ccacd3-67a2-4970-bc7b-a21ee275cc58;
 Fri, 04 Sep 2020 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599224565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0DE1Zm0mfUTSTvzZOo5xb4EtB90m12M4pb29Xk0WYP8=;
 b=bLHsXsKVnbt6rOItqJXRzX/B9dyAN/81PTCyJ9HSi1jJcjGtIPlojKOB
 sldSeQD7vyYyRVeGiPipmEHuxIc2lJTLVbsvES9WHkNrhwS6sJjMqp4bb
 SZjWdOHoptWjSHTanwhhTn3w6hPgZmsJfXOaP5kru2GCO3AOdkbcK1w9B M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: P++Tyai86nbeMrR7IBq/fJEbntSd1QLrB2tRn+3+hW/kvpk1JauZayh4ZfGkTPox3f/C5czuLH
 xTJXeLEhXAFC4fkzzZsE3cw71whd57NUTmJDqBiKhv5Is5LRHZd/cjmQyXecsmD5fvWOYiJLWN
 EPycQobUc0nqEGBHLjCdLmQK4x1Q7My1k7819FpqmuF/LQUAtH1t7wx20DhYx0Cd1e6EYUW7Q7
 uZZO3qmm1jPD1/TNbQSEqfJ8Sz/S+Zv5rjRQ1hj0ZN7xdO7Mvfdr9HHztBBlW87iTgj+NepiuZ
 OSA=
X-SBRS: 2.7
X-MesageID: 26016107
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="26016107"
Date: Fri, 4 Sep 2020 15:02:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
Message-ID: <20200904130225.GQ753@Air-de-Roger>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Fri, Aug 28, 2020 at 11:51:35AM +0000, Trammell Hudson wrote:
> This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
> configuration file, the Linux kernel and initrd, as well as the XSM, and
> CPU microcode into a single "unified" EFI executable.  The resulting EFI
> executable can be invoked directly from the UEFI Boot Manager, removing
> the need to use a separate loader like grub as well as removing
> dependencies on local filesystem access.
> 
> It is inspired by systemd-boot's unified kernel technique and borrows the
> function to locate PE sections from systemd's LGPL'ed code.  During EFI
> boot, Xen looks at its own loaded image to locate the PE sections for
> the configuration, kernel, etc, which are included after building xen.efi
> using objcopy to add named sections for each input file.  This allows an
> administrator to update the components independently without requiring
> rebuilding xen.
> 
> The unified image can also be signed by sbsigntool for verification
> by UEFI Secure Boot.  If secure boot is enabled, the Xen command line
> arguments are ignored.  Unlike the shim based verification, the signature
> covers the entire Xen+config+kernel+initrd unified file. This also ensures
> that properly configured platforms will measure the entire runtime into
> the TPM for unsealing secrets or remote attestation.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Thanks, some comments below.

> 
> diff --git a/xen/Makefile b/xen/Makefile
> index a87bb225dc..e4e4c6d5c1 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
>  	$(MAKE) -C tools
>  	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
>  	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
> -	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c efi.h;\
> +	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c pe.c runtime.c compat.c efi.h;\
>  		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
>  		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
>  		done; \
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 6527cb0bdf..483dec465d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -395,7 +395,7 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *sec
>          blexit(L"Unable to create new FDT");
>  }
> 
> -static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE * image, EFI_FILE_HANDLE dir_handle, char *section)
>  {
>  }
> 
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 4b2b010a80..ae666aa14c 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -8,7 +8,7 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
> 
>  boot.init.o: buildid.o
> 
> -EFIOBJ := boot.init.o compat.o runtime.o
> +EFIOBJ := boot.init.o pe.init.o compat.o runtime.o
> 
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 7188c9a551..e2650c0440 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -276,9 +276,11 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *sec
>  {
>  }
> 
> -static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE * image, EFI_FILE_HANDLE dir_handle, char *section)
>  {
>      union string name;
> +    if ( read_section(image, ".ucode", &ucode, NULL) )
> +        return;
> 
>      name.s = get_value(&cfg, section, "ucode");
>      if ( !name.s )
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 0273f79152..ba691b1890 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -156,6 +156,7 @@ SECTIONS
>         __note_gnu_build_id_end = .;
>    } :note :text
>  #elif defined(BUILD_ID_EFI)
> +  . = ALIGN(32); /* workaround binutils section overlap bug */

Is this a separate bugfix?

That's the only change to the linker script, so is this bug somehow
triggered by the new code additions this commit makes?

It might also be nice to have some reference to the bug if possible,
so that we know when the bug has been fixed and thus we can drop the
workaround.

>    DECL_SECTION(.buildid) {
>         __note_gnu_build_id_start = .;
>         *(.buildid)
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 5a520bf21d..258433331f 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -102,6 +102,7 @@ union string {
> 
>  struct file {
>      UINTN size;
> +    bool need_to_free;
>      union {
>          EFI_PHYSICAL_ADDRESS addr;
>          void *ptr;
> @@ -121,6 +122,8 @@ static CHAR16 *s2w(union string *str);
>  static char *w2s(const union string *str);
>  static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                        struct file *file, char *options);
> +static bool read_section(EFI_LOADED_IMAGE * image,
> +        char * name, struct file *file, char *options);
>  static size_t wstrlen(const CHAR16 * s);
>  static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
>  static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
> @@ -330,13 +333,13 @@ static void __init noreturn blexit(const CHAR16 *str)
>      if ( !efi_bs )
>          efi_arch_halt();
> 
> -    if ( cfg.addr )
> +    if ( cfg.addr && cfg.need_to_free)
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.addr )
> +    if ( kernel.addr && kernel.need_to_free)
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.addr )
> +    if ( ramdisk.addr && ramdisk.need_to_free)
>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.addr )
> +    if ( xsm.addr && xsm.need_to_free)
>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
> 
>      efi_arch_blexit();
> @@ -589,6 +592,21 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
> 
> +static void __init display_file_info(CHAR16 * name, struct file * file, char * options)
> +{
> +    if ( file == &cfg )
> +        return;
> +
> +    PrintStr(name);
> +    PrintStr(L": ");
> +    DisplayUint(file->addr, 2 * sizeof(file->addr));
> +    PrintStr(L"-");
> +    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
> +    PrintStr(newline);
> +
> +    efi_arch_handle_module(file, name, options);
> +}
> +
>  static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                               struct file *file, char *options)
>  {
> @@ -619,6 +637,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>          what = what ?: L"Seek";
>      else
>      {
> +        file->need_to_free = true;

Don't you need to set need_to_free after AllocatePages has returned
successfully?

Also the error handling in read_file is horrible to follow IMO.

>          file->addr = min(1UL << (32 + PAGE_SHIFT),
>                           HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>          ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> @@ -632,16 +651,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      else
>      {
>          file->size = size;
> -        if ( file != &cfg )
> -        {
> -            PrintStr(name);
> -            PrintStr(L": ");
> -            DisplayUint(file->addr, 2 * sizeof(file->addr));
> -            PrintStr(L"-");
> -            DisplayUint(file->addr + size, 2 * sizeof(file->addr));
> -            PrintStr(newline);
> -            efi_arch_handle_module(file, name, options);
> -        }
> +        display_file_info(name, file, options);

For future patches it might be helpful to split non-functional changes
into a separate patch. For example the inclusion of display_file_info
could be a pre-patch, and that would help reduce the size of the diff.

> 
>          ret = FileHandle->Read(FileHandle, &file->size, file->ptr);
>          if ( !EFI_ERROR(ret) && file->size != size )
> @@ -665,6 +675,25 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
> 
> +static bool __init read_section(EFI_LOADED_IMAGE * image,
> +                                char * const name, struct file *file, char *options)
> +{
> +    /* skip the leading "." in the section name */
> +    union string name_string = { .s = name + 1 };
> +
> +    file->ptr = (void*) pe_find_section(image->ImageBase, image->ImageSize, name, &file->size);

Line is too long, and we usually cast to void as: (void *)foo.

> +    if ( !file->ptr )
> +        return false;
> +
> +    file->need_to_free = false;
> +
> +    s2w(&name_string);
> +    display_file_info(name_string.w, file, options);
> +    efi_bs->FreePool(name_string.w);
> +
> +    return true;
> +}
> +
>  static void __init pre_parse(const struct file *cfg)
>  {
>      char *ptr = cfg->ptr, *end = ptr + cfg->size;
> @@ -968,6 +997,26 @@ static void __init setup_efi_pci(void)
>      efi_bs->FreePool(handles);
>  }
> 
> +/*
> + * Logic should remain sync'ed with linux/arch/x86/xen/efi.c
> + * Secure Boot is enabled iff 'SecureBoot' is set and the system is
> + * not in Setup Mode.
> + */
> +static bool __init efi_secure_boot(void)
> +{
> +    static const __initconst EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
> +    uint8_t secboot, setupmode;
> +    UINTN secboot_size = sizeof(secboot);
> +    UINTN setupmode_size = sizeof(setupmode);
> +
> +    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &secboot_size, &secboot) != EFI_SUCCESS )
> +        return false;
> +    if ( efi_rs->GetVariable(L"SetupMode", (EFI_GUID *)&global_guid, NULL, &setupmode_size, &setupmode) != EFI_SUCCESS )
> +        return false;

You could join both into a single if IMO, but at least lines should be
trimmed to 80 cols.

> +
> +    return secboot == 1 && setupmode == 0;

Does this need to be strictly 1, or any value != 0?

> +}
> +
>  static void __init efi_variables(void)
>  {
>      EFI_STATUS status;
> @@ -1144,8 +1193,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> -    unsigned int i, argc;
> -    CHAR16 **argv, *file_name, *cfg_file_name = NULL, *options = NULL;
> +    unsigned int i, argc = 0;
> +    CHAR16 **argv = NULL, *file_name, *cfg_file_name = NULL, *options = NULL;
>      UINTN gop_mode = ~0;
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
> @@ -1153,6 +1202,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>      bool base_video = false;
>      char *option_str;
>      bool use_cfg_file;
> +    bool secure = false;
> 
>      __set_bit(EFI_BOOT, &efi_flags);
>      __set_bit(EFI_LOADER, &efi_flags);
> @@ -1171,8 +1221,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          PrintErrMesg(L"No Loaded Image Protocol", status);
> 
>      efi_arch_load_addr_check(loaded_image);
> +    secure = efi_secure_boot();
> 
> -    if ( use_cfg_file )
> +    /* If UEFI Secure Boot is enabled, do not parse the command line */
> +    if ( use_cfg_file && !secure )
>      {
>          UINTN offset = 0;
> 
> @@ -1230,6 +1282,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> 
>      PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
>               XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> +    if ( secure )
> +	PrintStr(L"UEFI Secure Boot enabled\r\n");

Indentation (hard tab instead of spaces).

> 
>      efi_arch_relocate_image(0);
> 
> @@ -1249,9 +1303,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
> 
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(loaded_image, ".config", &cfg, NULL) )
>          {
> +            PrintStr(L"Using unified config file\r\n");
> +        }
> +        else if ( !cfg_file_name )
> +        {
> +            /* Read and parse the config file. */
>              CHAR16 *tail;
> 
>              while ( (tail = point_tail(file_name)) != NULL )
> @@ -1303,26 +1361,36 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_arch_cfg_file_early(dir_handle, section.s);
> 
>          option_str = split_string(name.s);
> -        read_file(dir_handle, s2w(&name), &kernel, option_str);
> -        efi_bs->FreePool(name.w);
> -
> -        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                        (void **)&shim_lock)) &&
> -             (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> -            PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> 
> -        name.s = get_value(&cfg, section.s, "ramdisk");
> -        if ( name.s )
> +        if ( !read_section(loaded_image, ".kernel", &kernel, option_str) )
>          {
> -            read_file(dir_handle, s2w(&name), &ramdisk, NULL);
> +            read_file(dir_handle, s2w(&name), &kernel, option_str);
>              efi_bs->FreePool(name.w);
> +
> +            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                            (void **)&shim_lock)) &&
> +                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> +                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
>          }
> 
> -        name.s = get_value(&cfg, section.s, "xsm");
> -        if ( name.s )
> +        if ( !read_section(loaded_image, ".ramdisk", &ramdisk, NULL) )
>          {
> -            read_file(dir_handle, s2w(&name), &xsm, NULL);
> -            efi_bs->FreePool(name.w);
> +            name.s = get_value(&cfg, section.s, "ramdisk");
> +            if ( name.s )
> +            {
> +                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
> +                efi_bs->FreePool(name.w);
> +            }

I have to admit I know very little, but don't you need to verify the
ramdisk also, like you verify the kernel? Or is the kernel the one
that's supposed to verify it's ramdisk before using it?

> +        }
> +
> +        if ( !read_section(loaded_image, ".xsm", &xsm, NULL) )
> +        {
> +            name.s = get_value(&cfg, section.s, "xsm");
> +            if ( name.s )
> +            {
> +                read_file(dir_handle, s2w(&name), &xsm, NULL);
> +                efi_bs->FreePool(name.w);
> +            }
>          }
> 
>          /*
> @@ -1358,7 +1426,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              }
>          }
> 
> -        efi_arch_cfg_file_late(dir_handle, section.s);
> +        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
> 
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
> diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
> index 2e38d05f3d..d3018f81a1 100644
> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -41,3 +41,6 @@ extern UINT64 efi_apple_properties_addr;
>  extern UINTN efi_apple_properties_len;
> 
>  const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
> +
> +const void * pe_find_section(const UINT8 * image_base, const size_t image_size,
> +        const char * section_name, UINTN * size_out);

Extra space between * and function name (this seems to be quite
common, so I'm not going to comment on all of those).

Also function parameters should be aligned on the newline.

> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> new file mode 100644
> index 0000000000..3440d82598
> --- /dev/null
> +++ b/xen/common/efi/pe.c
> @@ -0,0 +1,181 @@
> +/*
> + * xen/common/efi/pe.c
> + *
> + * PE executable header parser.
> + *
> + * Derived from https://github.com/systemd/systemd/blob/master/src/boot/efi/pe.c

Is it worth adding the commit that you used as the base for this file?

> + *
> + * Copyright (C) 2015 Kay Sievers <kay@vrfy.org>
> + * Copyright (C) 2020 Trammell Hudson <hudson@trmm.net>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU Lesser General Public License as published by
> + * the Free Software Foundation; either version 2.1 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * Lesser General Public License for more details.
> + */
> +
> +/*
> + * The "Unified" kernel image can be generated by adding additional
> + * sections to the Xen EFI executable with objcopy, similar to how
> + * systemd-boot uses the stub to add them to the Linux kernel:
> + *
> + * https://wiki.archlinux.org/index.php/systemd-boot#Preparing_a_unified_kernel_image
> + *
> + * The sections for the xen configuration file, the dom0 kernel, dom0 initrd,
> + * XSM and CPU microcode should be added after the Xen `.pad` section, the
> + * ending address of which can be located with:
> + *
> + *	objdump -h xen.efi \
> + *	| perl -ane '/\.pad/ && printf "0x%016x\n", hex($F[2]) + hex($F[3])'
> + *
> + * All the additional sections are optional and the order does not
> + * matter.  The addresses do not need to be contiguous, although
> + * they should not be overlapping.
> + *
> + * objcopy \
> + *	--add-section .config=xen.cfg \
> + *	--change-section-vma .config=0xffff82d041000000
> + *	--add-section .ucode=ucode.bin \
> + *	--change-section-vma .ucode=0xffff82d041010000 \
> + *	--add-section .xsm=xsm.cfg \
> + *	--change-section-vma .xsm=0xffff82d041080000 \
> + *	--add-section .kernel=vmlinux \
> + *	--change-section-vma .kernel=0xffff82d041100000 \
> + *	--add-section .ramdisk=initrd.img \
> + *	--change-section-vma .initrd=0xffff82d042000000 \
> + *	xen.efi \
> + *	xen.unified.efi
> + *
> + * The unified executable can be signed with sbsigntool to make
> + * it usable with UEFI secure boot:
> + *
> + * sbsign \
> + *	--key signing.key \
> + *	--cert cert.pem \
> + *	--output xen.signed.efi \
> + *	xen.unified.efi
> + */

This must be in a doc somewhere, likely in misc/efi.pandoc? People
trying to use such functionality shouldn't resort to reading a comment
on a source file IMO.

> +
> +#include "efi.h"
> +
> +struct DosFileHeader {
> +    UINT8   Magic[2];
> +    UINT16  LastSize;
> +    UINT16  nBlocks;
> +    UINT16  nReloc;
> +    UINT16  HdrSize;
> +    UINT16  MinAlloc;
> +    UINT16  MaxAlloc;
> +    UINT16  ss;
> +    UINT16  sp;
> +    UINT16  Checksum;
> +    UINT16  ip;
> +    UINT16  cs;
> +    UINT16  RelocPos;
> +    UINT16  nOverlay;
> +    UINT16  reserved[4];
> +    UINT16  OEMId;
> +    UINT16  OEMInfo;
> +    UINT16  reserved2[10];
> +    UINT32  ExeHeader;
> +} __attribute__((packed));
> +
> +#define PE_HEADER_MACHINE_ARM64         0xaa64
> +#define PE_HEADER_MACHINE_X64           0x8664
> +#define PE_HEADER_MACHINE_I386          0x014c
> +
> +struct PeFileHeader {
> +    UINT16  Machine;
> +    UINT16  NumberOfSections;
> +    UINT32  TimeDateStamp;
> +    UINT32  PointerToSymbolTable;
> +    UINT32  NumberOfSymbols;
> +    UINT16  SizeOfOptionalHeader;
> +    UINT16  Characteristics;
> +} __attribute__((packed));
> +
> +struct PeHeader {
> +    UINT8   Magic[4];
> +    struct PeFileHeader FileHeader;
> +} __attribute__((packed));
> +
> +struct PeSectionHeader {
> +    UINT8   Name[8];
> +    UINT32  VirtualSize;
> +    UINT32  VirtualAddress;
> +    UINT32  SizeOfRawData;
> +    UINT32  PointerToRawData;
> +    UINT32  PointerToRelocations;
> +    UINT32  PointerToLinenumbers;
> +    UINT16  NumberOfRelocations;
> +    UINT16  NumberOfLinenumbers;
> +    UINT32  Characteristics;
> +} __attribute__((packed));
> +
> +const void * __init pe_find_section(const CHAR8 * image, const UINTN image_size,
> +                              const char * section_name, UINTN * size_out)
> +{
> +    const struct DosFileHeader * dos = (const void*) image;
> +    const struct PeHeader * pe;
> +    const struct PeSectionHeader * sect;
> +    const UINTN name_len = strlen(section_name);
> +    UINTN offset = 0;
> +
> +    if ( name_len > sizeof(sect->Name) )
> +        return NULL;
> +
> +    if ( image_size < sizeof(*dos) )
> +        return NULL;
> +    if ( memcmp(dos->Magic, "MZ", 2) != 0 )
> +        return NULL;

You can join all the above into a single if that returns NULL.

> +
> +    offset = dos->ExeHeader;
> +    pe = (const void *) &image[offset];
> +
> +    offset += sizeof(*pe);
> +    if ( image_size < offset)
> +        return NULL;
> +
> +    if ( memcmp(pe->Magic, "PE\0\0", 4) != 0 )
> +        return NULL;
> +
> +    /* PE32+ Subsystem type */
> +#if defined(__ARM__)
> +    if (pe->FileHeader.Machine != PE_HEADER_MACHINE_ARM64)
> +        return NULL;
> +#elif defined(__x86_64__)
> +    if (pe->FileHeader.Machine != PE_HEADER_MACHINE_X64)
> +        return NULL;
> +#else
> +    /* unknown architecture */
> +    return NULL;
> +#endif
> +
> +    offset += pe->FileHeader.SizeOfOptionalHeader;
> +
> +    for (UINTN i = 0 ; i < pe->FileHeader.NumberOfSections ; i++)

Missing spaces, and we generally don't allow defining variables inside
of for loops (ie: should be pulled out and defined at the top of the
function).

> +    {
> +        sect = (const void *) &image[offset];

You can declare sec here to reduce it's scope.

Thanks, Roger.

