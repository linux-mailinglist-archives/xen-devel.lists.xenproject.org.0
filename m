Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293742688F6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:07:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHlNe-0003Hc-10; Mon, 14 Sep 2020 10:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odsp=CX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kHlNc-0003HX-WB
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:06:37 +0000
X-Inumbo-ID: 47b27018-6585-4dfb-b1f1-8600c0585742
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b27018-6585-4dfb-b1f1-8600c0585742;
 Mon, 14 Sep 2020 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600077984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YhvGXKxmiS2WR6VvNgHiXO4YFR3fVBE7rtTJ0YbEhPA=;
 b=YNKUFeBAwroRHxfxVnyNUa/Qjhmbsr6IPOCxp/Sv6r76j9nS4TIc2Fs0
 Fy6OnkKpvwc3m6fPGkN4LvgTnPhQhViMbPgRSfNZmRn3tJw0OTGogdyZ7
 rHLVayH/huyRd+Hy4/AzODzSIPDz1AYrrXgZoixO6FKNmx60wRyjqEhYB I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4Z1mg5yNdmM17Dt3Vk15/bWzxIjE/cwj5CakckRA3srvzKzHxFpzrU1soWBpb7TfKD37kvQNVc
 O0izsloUOtScl9xwvkjj1wtji8Foa6zPMZbMJtULb8/DpEF25PORqmHcUcIJ+SqKXGmG5tLNOF
 0tVMgBa49N9EaKNIron1L6P9uPeAJ5ep3YXni0yoko09I6CskKM8e1WP8VYXEYVtguG4/MzmX0
 FV7Yg7/aa5LZQfKThfqDhph2tYVJThX3manOz+dCbPn4N9UHSZZLAYoNASsZZ2DbXic0raza8L
 WOM=
X-SBRS: 2.7
X-MesageID: 27591689
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,425,1592884800"; d="scan'208";a="27591689"
Date: Mon, 14 Sep 2020 12:06:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <20200914100609.GC753@Air-de-Roger>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-4-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200907190027.669086-4-hudson@trmm.net>
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

On Mon, Sep 07, 2020 at 03:00:26PM -0400, Trammell Hudson wrote:
> From: Trammell hudson <hudson@trmm.net>
> 
> This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
> configuration file, the Linux kernel and initrd, as well as the XSM,
> and architectural specific files into a single "unified" EFI executable.
> This allows an administrator to update the components independently
> without requiring rebuilding xen, as well as to replace the components
> in an existing image.
> 
> The resulting EFI executable can be invoked directly from the UEFI Boot
> Manager, removing the need to use a separate loader like grub as well
> as removing dependencies on local filesystem access.  And since it is
> a single file, it can be signed and validated by UEFI Secure Boot without
> requring the shim protocol.
> 
> It is inspired by systemd-boot's unified kernel technique and borrows the
> function to locate PE sections from systemd's LGPL'ed code.  During EFI
> boot, Xen looks at its own loaded image to locate the PE sections for
> the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
> (`.initrd`), and XSM config (`.xsm`), which are included after building

Could we name this kernel_payload or maybe just payload instead of
initrd?

That's a Linux specific concept.

> xen.efi using objcopy to add named sections for each input file.
> 
> For x86, the CPU ucode can be included in a section named `.ucode`,
> which is loaded in the efi_arch_cfg_file_late() stage of the boot process.
> 
> On ARM systems the Device Tree can be included in a section named
> `.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
> the boot process.
> 
> Signed-off-by: Trammell hudson <hudson@trmm.net>
> ---
>  .gitignore                  |   1 +
>  docs/misc/efi.pandoc        |  47 ++++++++++++
>  xen/arch/arm/efi/efi-boot.h |  22 ++++--
>  xen/arch/x86/efi/Makefile   |   2 +-
>  xen/arch/x86/efi/efi-boot.h |   7 +-
>  xen/common/efi/boot.c       |  72 +++++++++++++-----
>  xen/common/efi/efi.h        |   3 +
>  xen/common/efi/pe.c         | 141 ++++++++++++++++++++++++++++++++++++
>  8 files changed, 266 insertions(+), 29 deletions(-)
>  create mode 100644 xen/common/efi/pe.c
> 
> diff --git a/.gitignore b/.gitignore
> index 823f4743dc..1c79b9f90a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -296,6 +296,7 @@ xen/arch/x86/efi/mkreloc
>  xen/arch/*/xen.lds
>  xen/arch/*/asm-offsets.s
>  xen/arch/*/efi/boot.c
> +xen/arch/*/efi/pe.c

Please sort alphabetically like to rest of the entries in efi/.

>  xen/arch/*/efi/compat.c
>  xen/arch/*/efi/ebmalloc.c
>  xen/arch/*/efi/efi.h
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 23c1a2732d..c882b1f8f8 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -116,3 +116,50 @@ Filenames must be specified relative to the location of the EFI binary.
>  
>  Extra options to be passed to Xen can also be specified on the command line,
>  following a `--` separator option.
> +
> +## Unified Xen kernel image
> +
> +The "Unified" kernel image can be generated by adding additional
> +sections to the Xen EFI executable with objcopy, similar to how
> +[systemd-boot uses the stub to add them to the Linux kernel](https://wiki.archlinux.org/index.php/systemd-boot#Preparing_a_unified_kernel_image)
> +
> +The sections for the xen configuration file, the dom0 kernel, dom0 initrd,
> +XSM and CPU microcode should be added after the Xen `.pad` section, the
> +ending address of which can be located with:
> +
> +```
> +objdump -h xen.efi \
> +	| perl -ane '/\.pad/ && printf "0x%016x\n", hex($F[2]) + hex($F[3])'
> +```
> +
> +All the sections are optional (`.config`, `.kernel`, `.initrd`, `.xsm`,
> +`.ucode` (x86) and `.dtb` (ARM)) and the order does not matter.
> +The addresses do not need to be contiguous, although they should not
> +be overlapping.
> +
> +```
> +objcopy \
> +	--add-section .config=xen.cfg \
> +	--change-section-vma .config=0xffff82d041000000
> +	--add-section .ucode=ucode.bin \
> +	--change-section-vma .ucode=0xffff82d041010000 \
> +	--add-section .xsm=xsm.cfg \
> +	--change-section-vma .xsm=0xffff82d041080000 \
> +	--add-section .kernel=vmlinux \
> +	--change-section-vma .kernel=0xffff82d041100000 \
> +	--add-section .ramdisk=initrd.img \

This seems like a typo, you should use .initrd instead?

> +	--change-section-vma .initrd=0xffff82d042000000 \

Why do you need to adjust the VMA, is this not set to a suitable
default value?

How can users find a suitable VMA value?

> +	xen.efi \
> +	xen.unified.efi
> +```
> +
> +The unified executable can be signed with sbsigntool to make
> +it usable with UEFI secure boot:
> +
> +```
> +sbsign \
> +	--key signing.key \
> +	--cert cert.pem \
> +	--output xen.signed.efi \
> +	xen.unified.efi
> +```
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 6527cb0bdf..154e605fee 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -375,27 +375,33 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>      efi_xen_start(fdt, fdt_totalsize(fdt));
>  }
>  
> -static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_early(EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle, char *section)

image should be const.

>  {
>      union string name;
>  
>      /*
>       * The DTB must be processed before any other entries in the configuration
> -     * file, as the DTB is updated as modules are loaded.
> +     * file, as the DTB is updated as modules are loaded.  Prefer the one
> +     * stored as a PE section in a unified image, and fall back to a file
> +     * on disk if the section is not present.
>       */
> -    name.s = get_value(&cfg, section, "dtb");
> -    if ( name.s )
> +    if ( !read_section(image, ".dtb", &dtbfile, NULL) )
>      {
> -        split_string(name.s);
> -        read_file(dir_handle, s2w(&name), &dtbfile, NULL);
> -        efi_bs->FreePool(name.w);
> +	    name.s = get_value(&cfg, section, "dtb");
> +	    if ( name.s )
> +	    {
> +		split_string(name.s);
> +		read_file(dir_handle, s2w(&name), &dtbfile, NULL);
> +		efi_bs->FreePool(name.w);
> +	    }

You seem to have used hard tabs instead of spaces.

>      }
> +
>      fdt = fdt_increase_size(&dtbfile, cfg.size + EFI_PAGE_SIZE);
>      if ( !fdt )
>          blexit(L"Unable to create new FDT");
>  }
>  
> -static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle, char *section)
>  {
>  }
>  
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 770438a029..e857c0f2cc 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -8,7 +8,7 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
>  
>  boot.init.o: buildid.o
>  
> -EFIOBJ := boot.init.o ebmalloc.o compat.o runtime.o
> +EFIOBJ := boot.init.o pe.init.o ebmalloc.o compat.o runtime.o
>  
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 7188c9a551..ecc1bbd17d 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -272,14 +272,17 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>      unreachable();
>  }
>  
> -static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_early(EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle, char *section)
>  {
>  }
>  
> -static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE *image, EFI_FILE_HANDLE dir_handle, char *section)

Same here, image could be const.

>  {
>      union string name;
>  
> +    if ( read_section(image, ".ucode", &ucode, NULL) )
> +        return;
> +
>      name.s = get_value(&cfg, section, "ucode");
>      if ( !name.s )
>          name.s = get_value(&cfg, "global", "ucode");
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index f5bdc4b1df..452b5f4362 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -121,6 +121,8 @@ static CHAR16 *s2w(union string *str);
>  static char *w2s(const union string *str);
>  static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                        struct file *file, char *options);
> +static bool read_section(EFI_LOADED_IMAGE *image,
> +        char *name, struct file *file, char *options);

Aling overflow parameters to the start parentheses please.

>  static size_t wstrlen(const CHAR16 * s);
>  static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
>  static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
> @@ -622,6 +624,26 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
>  
> +static bool __init read_section(EFI_LOADED_IMAGE *image,

image can be const I think.

> +                                char *const name, struct file *file, char *optio/pe_find_sectionns)

options should also be const IMO, but that would require a change to
efi_arch_handle_module AFAICT.

> +{
> +    /* skip the leading "." in the section name */
> +    union string name_string = { .s = name + 1 };
> +
> +    file->ptr = (void *)pe_find_section(image->ImageBase, image->ImageSize,

This already returns a void *, so there's no need for the cast.

> +        name, &file->size);

Same comment regarding alignment of overflow parameters.

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
> @@ -1206,9 +1228,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
>  
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(loaded_image, ".config", &cfg, NULL) )
> +        {
> +            PrintStr(L"Using unified config file\r\n");
> +        }
> +        else if ( !cfg_file_name )
>          {
> +            /* Read and parse the config file. */
>              CHAR16 *tail;
>  
>              while ( (tail = point_tail(file_name)) != NULL )
> @@ -1257,29 +1283,39 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          if ( !name.s )
>              blexit(L"No Dom0 kernel image specified.");
>  
> -        efi_arch_cfg_file_early(dir_handle, section.s);
> +        efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
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

In the commit message you mention .initrd, but here you seem to use
.ramdisk instead as the section name for the kernel payload?

>          {
> -            read_file(dir_handle, s2w(&name), &xsm, NULL);
> -            efi_bs->FreePool(name.w);
> +            name.s = get_value(&cfg, section.s, "ramdisk");
> +            if ( name.s )
> +            {
> +                read_file(dir_handle, s2w(&name), &ramdisk, NULL);
> +                efi_bs->FreePool(name.w);
> +            }
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
> @@ -1315,7 +1351,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              }
>          }
>  
> -        efi_arch_cfg_file_late(dir_handle, section.s);
> +        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
>  
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr = 0;
> diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
> index 4845d84913..c9b741bf27 100644
> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -47,3 +47,6 @@ const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
>  /* EFI boot allocator. */
>  void *ebmalloc(size_t size);
>  void free_ebmalloc_unused_mem(void);
> +
> +const void * pe_find_section(const UINT8 *image_base, const size_t image_size,
> +        const char *section_name, UINTN *size_out);
> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> new file mode 100644
> index 0000000000..097c6848a8
> --- /dev/null
> +++ b/xen/common/efi/pe.c
> @@ -0,0 +1,141 @@
> +/*
> + * xen/common/efi/pe.c
> + *
> + * PE executable header parser.
> + *
> + * Derived from https://github.com/systemd/systemd/blob/master/src/boot/efi/pe.c
> + * commit 07d5ed536ec0a76b08229c7a80b910cb9acaf6b1
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

You seem to have changed this quite extensively, so the spaces between
the * and the parameter name (or __init) should be removed.

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

Please join all the ifs into a single one.

> +
> +    offset = dos->ExeHeader;
> +    pe = (const void *) &image[offset];

Extra space after the closing parentheses.

> +
> +    offset += sizeof(*pe);
> +    if ( image_size < offset )
> +        return NULL;
> +
> +    if ( memcmp(pe->Magic, "PE\0\0", 4) != 0 )
> +        return NULL;

Same here, you can join the two ifs into a single one.

> +
> +    /* PE32+ Subsystem type */
> +#if defined(__arm__) || defined (__aarch64__)
> +    if ( pe->FileHeader.Machine != PE_HEADER_MACHINE_ARM64 )
> +        return NULL;
> +#elif defined(__x86_64__)
> +    if ( pe->FileHeader.Machine != PE_HEADER_MACHINE_X64 )
> +        return NULL;
> +#else
> +    /* unknown architecture */
> +    return NULL;
> +#endif
> +
> +    offset += pe->FileHeader.SizeOfOptionalHeader;
> +
> +    for ( UINTN i = 0 ; i < pe->FileHeader.NumberOfSections ; i++ )

Please define i at the top of the function, and there's an extra space
before the semicolon:

for ( i = 0; i < ...

> +    {
> +        sect = (const void *) &image[offset];
> +        if ( image_size < offset + sizeof(*sect) )
> +            return NULL;
> +
> +        if ( memcmp(sect->Name, section_name, name_len) != 0 ||
> +             image_size < sect->VirtualSize + sect->VirtualAddress )
> +        {
> +            offset += sizeof(*sect);
> +            continue;
> +        }
> +
> +        if ( size_out )
> +            *size_out = sect->VirtualSize;
> +
> +        return &image[sect->VirtualAddress];

Oh, so the virtual address does indeed matter, and hence will need a
bit more explanation in the document I think.

Thanks, Roger.

