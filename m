Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD025E13E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 19:59:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFyp-0000GM-06; Fri, 04 Sep 2020 17:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQwi=CN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kEFyn-0000GH-12
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:58:29 +0000
X-Inumbo-ID: 4f16bdb2-db7f-412f-a9e3-ef00e78b9005
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f16bdb2-db7f-412f-a9e3-ef00e78b9005;
 Fri, 04 Sep 2020 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=y00+3XC1cO+ac6aakkbnFPFG9SF7Z3iSdrYUGT4JfT0=; b=bioZFK24MQ9BmzhualUx6noaqu
 vIUdKi9EGHJb5KKcTTY7fVHg1GiApCajEa1/yvlwxJyZytv6WWMSovC/wLPzktZZoU3lbL5gbdqAv
 9xOqnSniowEZk5M8C8GNnmLES46ROd0DUcZRc06bf1uAPNfjYg270JMvgKNXfEfXQdB4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kEFyl-0003AD-3K; Fri, 04 Sep 2020 17:58:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kEFyk-00050q-JW; Fri, 04 Sep 2020 17:58:27 +0000
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <6beb3e6b-e438-caa1-5b51-836091c05ade@xen.org>
Date: Fri, 4 Sep 2020 18:58:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi,

On 28/08/2020 12:51, Trammell Hudson wrote:
> This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
> configuration file, the Linux kernel and initrd, as well as the XSM, and
> CPU microcode into a single "unified" EFI executable.

For Arm, I would also consider to add the DTB in "unified" EFI 
executable. See efi_arch_cfg_file_early() in xen/arch/arm/efi/efi-boot.h.

>  The resulting EFI
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

I don't seem to be able to apply the patch using git-am:

42sh> git checkout origin/staging

42sh> git am ~/Downloads/patches/\[PATCH\]\ EFI_\ Enable\ booting\ 
unified\ hypervisor_kernel_initrd\ images.eml
Applying: EFI: Enable booting unified hypervisor/kernel/initrd images
error: patch failed: xen/Makefile:355
error: xen/Makefile: patch does not apply
error: patch failed: xen/arch/x86/efi/Makefile:8
error: xen/arch/x86/efi/Makefile: patch does not apply
error: patch failed: xen/common/efi/efi.h:41
error: xen/common/efi/efi.h: patch does not apply
Patch failed at 0001 EFI: Enable booting unified 
hypervisor/kernel/initrd images
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

42sh> git am --show-current-patch | patch -p1
patching file xen/Makefile
patch: **** malformed patch at line 122: i.h;\

How did you send/generate the patch?

> 
> diff --git a/xen/Makefile b/xen/Makefile
> index a87bb225dc..e4e4c6d5c1 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -355,7 +355,7 @@ $(TARGET): delete-unfresh-files
>   	$(MAKE) -C tools
>   	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
>   	[ -e include/asm ] || ln -sf asm-$(TARGET_ARCH) include/asm
> -	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c runtime.c compat.c efi.h;\
> +	[ -e arch/$(TARGET_ARCH)/efi ] && for f in boot.c pe.c runtime.c compat.c efi.h;\
>   		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
>   		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
>   		done; \
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 6527cb0bdf..483dec465d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -395,7 +395,7 @@ static void __init efi_arch_cfg_file_early(EFI_FILE_HANDLE dir_handle, char *sec
>           blexit(L"Unable to create new FDT");
>   }
> 
> -static void __init efi_arch_cfg_file_late(EFI_FILE_HANDLE dir_handle, char *section)
> +static void __init efi_arch_cfg_file_late(EFI_LOADED_IMAGE * image, EFI_FILE_HANDLE dir_handle, char *section)
>   {
>   }
> 
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 4b2b010a80..ae666aa14c 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -8,7 +8,7 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
> 
>   boot.init.o: buildid.o
> 
> -EFIOBJ := boot.init.o compat.o runtime.o
> +EFIOBJ := boot.init.o pe.init.o compat.o runtime.o

I believe you will need to replicate this change in 
xen/arch/arm/efi/Makefile as well.

> 
>   $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>   $(EFIOBJ): CFLAGS-stack-boundary := $(cflags-stack-boundary)

[...]

> @@ -1171,8 +1221,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>           PrintErrMesg(L"No Loaded Image Protocol", status);
> 
>       efi_arch_load_addr_check(loaded_image);
> +    secure = efi_secure_boot();
> 
> -    if ( use_cfg_file )
> +    /* If UEFI Secure Boot is enabled, do not parse the command line */
> +    if ( use_cfg_file && !secure )
>       {
>           UINTN offset = 0;
> 
> @@ -1230,6 +1282,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> 
>       PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
>                XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> +    if ( secure )
> +	PrintStr(L"UEFI Secure Boot enabled\r\n");

Xen is using softtab.

> 
>       efi_arch_relocate_image(0);
> 
> @@ -1249,9 +1303,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>           /* Get the file system interface. */
>           dir_handle = get_parent_handle(loaded_image, &file_name);
> 
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(loaded_image, ".config", &cfg, NULL) )
>           {
> +            PrintStr(L"Using unified config file\r\n");
> +        }
> +        else if ( !cfg_file_name )
> +        {
> +            /* Read and parse the config file. */
>               CHAR16 *tail;
> 
>               while ( (tail = point_tail(file_name)) != NULL )
> @@ -1303,26 +1361,36 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>           efi_arch_cfg_file_early(dir_handle, section.s);
> 
>           option_str = split_string(name.s);
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
>           {
> -            read_file(dir_handle, s2w(&name), &ramdisk, NULL);
> +            read_file(dir_handle, s2w(&name), &kernel, option_str);
>               efi_bs->FreePool(name.w);
> +
> +            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                            (void **)&shim_lock)) &&
> +                 (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> +                PrintErrMesg(L"Dom0 kernel image could not be verified", status);
>           }
> 
> -        name.s = get_value(&cfg, section.s, "xsm");
> -        if ( name.s )
> +        if ( !read_section(loaded_image, ".ramdisk", &ramdisk, NULL) )
>           {
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
>           }

AFAICT, the code to use the section or fallback to the cfg is nearly the 
same for each binary. I think it would make sense to have an helper tha 
check if a given section exist and look in the cfg.

> 
>           /*
> @@ -1358,7 +1426,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>               }
>           }
> 
> -        efi_arch_cfg_file_late(dir_handle, section.s);
> +        efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
> 
>           efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>           cfg.addr = 0;
> diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
> index 2e38d05f3d..d3018f81a1 100644
> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -41,3 +41,6 @@ extern UINT64 efi_apple_properties_addr;
>   extern UINTN efi_apple_properties_len;
> 
>   const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
> +
> +const void * pe_find_section(const UINT8 * image_base, const size_t image_size,
> +        const char * section_name, UINTN * size_out);
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

I would suggest to mention the commit ID of the baseline.

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
> +    {
> +        sect = (const void *) &image[offset];
> +        if ( image_size < offset + sizeof(*sect) )
> +            return NULL;
> +
> +        if ( memcmp(sect->Name, section_name, name_len) != 0
> +        ||   image_size < sect->VirtualSize + sect->VirtualAddress )
> +        {
> +            offset += sizeof(*sect);
> +            continue;
> +        }
> +
> +        if ( size_out )
> +            *size_out = sect->VirtualSize;
> +
> +        return &image[sect->VirtualAddress];
> +    }
> +
> +    return NULL;
> +}
> 
> 

Cheers,

-- 
Julien Grall

