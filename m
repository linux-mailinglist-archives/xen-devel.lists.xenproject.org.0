Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DAF23ED45
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 14:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k41PC-0003rm-Kb; Fri, 07 Aug 2020 12:23:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k41PA-0003rh-Of
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 12:23:24 +0000
X-Inumbo-ID: 568c2916-908f-4e77-89ed-bf583fa82b3a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 568c2916-908f-4e77-89ed-bf583fa82b3a;
 Fri, 07 Aug 2020 12:23:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAD0AB16D;
 Fri,  7 Aug 2020 12:23:40 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1489916a-24cc-3e2c-98a0-1f35186e4b06@suse.com>
Date: Fri, 7 Aug 2020 14:23:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 16:15, Trammell Hudson wrote:
> Updated patch:

I'm afraid the number of style issues has further increased. First
and foremost please read ./CODING_STYLE and look at surrounding code.

> --- /dev/null
> +++ b/xen/arch/x86/efi/pe.c
> @@ -0,0 +1 @@
> +../../../common/efi/pe.c
> \ No newline at end of file

This isn't supposed to be part of the patch; the symlinks get
created in the course of building.

> @@ -665,6 +669,37 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
> 
> +
> +static bool __init read_section(const void * const image_base,
> +        char * const name, struct file *file, char *options)
> +{
> +    union string name_string = { .s = name + 1 };
> +    if ( !image_base )
> +        return false;
> +
> +    file->ptr = pe_find_section(image_base, name, &file->size);
> +    if ( !file->ptr )
> +        return false;
> +
> +    file->need_to_free = false;
> +
> +    if ( file == &cfg )
> +        return true;
> +
> +    s2w(&name_string);
> +    PrintStr(name_string.w);
> +    PrintStr(L": ");
> +    DisplayUint(file->addr, 2 * sizeof(file->addr));
> +    PrintStr(L"-");
> +    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
> +    PrintStr(newline);
> +
> +    efi_arch_handle_module(file, name_string.w, options);

This is a copy of existing code - please make a helper function
instead of duplicating (preferably in a separate, prereq patch, but
I guess there's anyway the open question on whether this change
can/should be split into smaller pieces).

> @@ -968,6 +1003,21 @@ static void __init setup_efi_pci(void)
>      efi_bs->FreePool(handles);
>  }
> 
> +static bool __init efi_secure_boot(void)
> +{
> +    static const EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;

Also __initconst please.

> +    uint8_t buf[8];
> +    UINTN size = sizeof(buf);
> +
> +    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &size, buf) != EFI_SUCCESS )
> +        return false;
> +
> +    if ( size != 1 )
> +        return false;

Judging from Linux code you also need to evaluate the SetupMode var.

> @@ -1171,6 +1223,10 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          PrintErrMesg(L"No Loaded Image Protocol", status);
> 
>      efi_arch_load_addr_check(loaded_image);
> +    if ( loaded_image )
> +        image_base = loaded_image->ImageBase;

There's no point in having the if() - efi_arch_load_addr_check()
has already de-referenced loaded_image. If HandleProtocol() fails
we won't make it here.

> @@ -1249,9 +1305,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
> 
> -        /* Read and parse the config file. */
> -        if ( !cfg_file_name )
> +        if ( read_section(image_base, ".config", &cfg, NULL) )
> +        {
> +            if ( secure )
> +                PrintStr(L"Secure Boot enabled: ");
> +            PrintStr(L"Using unified config file\r\n");
> +        }
> +        else if ( !cfg_file_name )
>          {
> +            /* Read and parse the config file. */
>              CHAR16 *tail;

As said before, I think we want an all-or-nothing approach. You
want to first establish whether the image is a unified one, and
if so not fall back to reading from disk. Otherwise the claim
of secure boot above is liable to be wrong.

I'm also unconvinced of reporting the secure boot status only in
the case you're interested in.

> +void * __init pe_find_section(const void * const image_base,
> +        const char * section_name, UINTN * size_out)
> +{
> +    const CHAR8 * const base = image_base;

Why the extra variable? The more that ...

> +    const struct DosFileHeader * dos = (const void*) base;

... if you used image_base, the cast would become unnecessary.

> +    const struct PeHeader * pe;
> +    const UINTN name_len = strlen(section_name);
> +    UINTN offset;
> +
> +    if ( base == NULL )
> +        return NULL;

Looks to be quite pointless a check.

> +    if ( memcmp(dos->Magic, "MZ", 2) != 0 )
> +        return NULL;
> +
> +    pe = (const void *) &base[dos->ExeHeader];
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
> +    // unknown architecture
> +    return NULL;
> +#endif
> +
> +    if ( pe->FileHeader.NumberOfSections > 96 )
> +        return NULL;

Besides there still needing to be an explanation for this apparently
arbitrary limit, I also find the amount of consistency checking
insufficient. At the very least I'd like to see you check the COFF
magic value (0x020b).

> +    offset = dos->ExeHeader + sizeof(*pe) + pe->FileHeader.SizeOfOptionalHeader;
> +
> +    for (UINTN i = 0; i < pe->FileHeader.NumberOfSections; i++)
> +    {
> +        const struct PeSectionHeader *const sect = (const struct PeSectionHeader *)&base[offset];
> +        if ( memcmp(sect->Name, section_name, name_len) == 0 )
> +        {
> +            if ( size_out )
> +                *size_out = sect->VirtualSize;

Is this correct in all cases? Iirc zero tail padding can be
expressed by SizeOfRawData < VirtualSize, in which case there
won't be as many bytes to copy / use as you tell your caller.

> +            return (void*)(sect->VirtualAddress + (uintptr_t) image_base);

Again no need for the cast; the function should return
const void * anyway, as the caller isn't supposed to alter
section contents (I hope).

> --- /dev/null
> +++ b/xen/scripts/unify-xen
> @@ -0,0 +1,89 @@
> +#!/bin/bash
> +# Build a "unified Xen" image.
> +# Usage
> +# unify xen.efi xen.cfg bzimage initrd [xsm [ucode]]
> +#
> +# Merge a Xen configuration, Linux kernel, initrd, and optional XSM or ucode
> +# into xen.efi to produce a single signed EFI executable.
> +#
> +# For shellcheck
> +# - turn off "expressions don't expand in single quotes"
> +# - and "can't follow non-constant sources"
> +# shellcheck disable=SC2016 disable=SC1090
> +set -e -o pipefail
> +export LC_ALL=C
> +
> +die() { echo "$@" >&2 ; exit 1 ; }
> +warn() { echo "$@" >&2 ; }
> +debug() { [ "$V" == 1 ] && echo "$@" >&2 ; }
> +
> +cleanup() {
> +	rm -rf "$TMP"
> +}
> +
> +TMP=$(mktemp -d)
> +trap cleanup EXIT
> +
> +########################################
> +
> +XEN="$1"
> +CONFIG="$2"
> +KERNEL="$3"
> +RAMDISK="$4"
> +XSM="$5"
> +UCODE="$6"
> +
> +if [ ! -r "$XEN" ]; then
> +	die "$XEN: Unable to find Xen executable"
> +fi
> +
> +BASE_ADDR="$(objdump -h "$XEN" | awk '/ \.text / { print $4 }')"
> +PREFIX_ADDR="0x$(echo "$BASE_ADDR" | cut -c1-9)"
> +warn "$XEN: Base address $BASE_ADDR"
> +
> +objcopy \
> +	${CONFIG:+\
> +		--add-section .config="$CONFIG" \
> +		--change-section-vma .config=${PREFIX_ADDR}1000000 \
> +	} \
> +	${UCODE:+\
> +		--add-section .ucode="$UCODE" \
> +		--change-section-vma  .ucode=${PREFIX_ADDR}1010000 \
> +	} \
> +	${XSM:+\
> +		--add-section .xsm="$XSM" \
> +		--change-section-vma  .xsm=${PREFIX_ADDR}1080000 \
> +	} \
> +	${KERNEL:+\
> +		--add-section .kernel="$KERNEL" \
> +		--change-section-vma  .kernel=${PREFIX_ADDR}1100000 \
> +	} \
> +	${RAMDISK:+\
> +		--add-section .ramdisk="$RAMDISK" \
> +		--change-section-vma .ramdisk=${PREFIX_ADDR}2000000 \
> +	} \

With all these hard coded size restrictions I take it this still is
just an example, not something that is to eventually get committed.

Jan

