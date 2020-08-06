Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23823D7C3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 09:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3amX-0001LZ-Q3; Thu, 06 Aug 2020 07:57:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3amW-0001LU-0y
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 07:57:44 +0000
X-Inumbo-ID: e50c44e3-c9a8-4e68-bac4-ca16e3e58e89
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e50c44e3-c9a8-4e68-bac4-ca16e3e58e89;
 Thu, 06 Aug 2020 07:57:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE663AC37;
 Thu,  6 Aug 2020 07:57:58 +0000 (UTC)
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
To: Trammell Hudson <hudson@trmm.net>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
Date: Thu, 6 Aug 2020 09:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
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

On 05.08.2020 19:20, Trammell Hudson wrote:
> This preliminary patch adds support for bundling the Xen hypervisor, xen.cfg, the Linux kernel, initrd and XSM into a single "unified" EFI executable that can be signed by sbsigntool for verification by UEFI Secure Boot.  It is inspired by systemd-boot's unified kernel technique and borrows the function to locate PE sections from systemd's LGPL'ed code.
> 
> The configuration, kernel, etc are added after building using objcopy to add named sections for each input file.  This allows an administrator to update the components independently without requiring rebuilding xen. During EFI boot, Xen looks at its own loaded image to locate the PE sections and, if secure boot is enabled, only allows use of the unified components.
> 
> The resulting EFI executable can be invoked directly from the UEFI Boot Manager, removing the need to use a separate loader like grub. Unlike the shim based verification, the signature covers the entire Xen+config+kernel+initrd unified file. This also ensures that properly configured platforms will measure the entire runtime into the TPM for unsealing secrets or remote attestation.

Looks reasonable for a PoC, thanks, but needs cleaning up I think.
A couple of specific remarks / questions:

> @@ -665,6 +667,136 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
> 
> +
> +struct DosFileHeader {
> +        UINT8   Magic[2];
> +        UINT16  LastSize;
> +        UINT16  nBlocks;
> +        UINT16  nReloc;
> +        UINT16  HdrSize;
> +        UINT16  MinAlloc;
> +        UINT16  MaxAlloc;
> +        UINT16  ss;
> +        UINT16  sp;
> +        UINT16  Checksum;
> +        UINT16  ip;
> +        UINT16  cs;
> +        UINT16  RelocPos;
> +        UINT16  nOverlay;
> +        UINT16  reserved[4];
> +        UINT16  OEMId;
> +        UINT16  OEMInfo;
> +        UINT16  reserved2[10];
> +        UINT32  ExeHeader;
> +} __attribute__((packed));
> +
> +#define PE_HEADER_MACHINE_I386          0x014c
> +#define PE_HEADER_MACHINE_X64           0x8664
> +#define PE_HEADER_MACHINE_ARM64         0xaa64
> +
> +struct PeFileHeader {
> +        UINT16  Machine;
> +        UINT16  NumberOfSections;
> +        UINT32  TimeDateStamp;
> +        UINT32  PointerToSymbolTable;
> +        UINT32  NumberOfSymbols;
> +        UINT16  SizeOfOptionalHeader;
> +        UINT16  Characteristics;
> +} __attribute__((packed));
> +
> +struct PeHeader {
> +        UINT8   Magic[4];
> +        struct PeFileHeader FileHeader;
> +} __attribute__((packed));
> +
> +struct PeSectionHeader {
> +        UINT8   Name[8];
> +        UINT32  VirtualSize;
> +        UINT32  VirtualAddress;
> +        UINT32  SizeOfRawData;
> +        UINT32  PointerToRawData;
> +        UINT32  PointerToRelocations;
> +        UINT32  PointerToLinenumbers;
> +        UINT16  NumberOfRelocations;
> +        UINT16  NumberOfLinenumbers;
> +        UINT32  Characteristics;
> +} __attribute__((packed));
> +
> +static void * __init pe_find_section(const void * const image_base,
> +        const char * section_name, UINTN * size_out)
> +{
> +    const CHAR8 * const base = image_base;
> +    const struct DosFileHeader * dos = (const void*) base;
> +    const struct PeHeader * pe;
> +    const UINTN name_len = strlen(section_name);
> +    UINTN offset;
> +
> +    if ( base == NULL )
> +        return NULL;
> +
> +    if ( memcmp(dos->Magic, "MZ", 2) != 0 )
> +        return NULL;
> +
> +    pe = (const void *) &base[dos->ExeHeader];
> +    if ( memcmp(pe->Magic, "PE\0\0", 4) != 0 )
> +        return NULL;
> +
> +    /* PE32+ Subsystem type */
> +    if (pe->FileHeader.Machine != PE_HEADER_MACHINE_X64
> +    &&  pe->FileHeader.Machine != PE_HEADER_MACHINE_ARM64
> +    &&  pe->FileHeader.Machine != PE_HEADER_MACHINE_I386)
> +        return NULL;

I don't think i386 should be recognized here, and of the two other
ones only the one matching the current target architecture should
be.

> +    if ( pe->FileHeader.NumberOfSections > 96 )
> +        return NULL;

What's this 96 about?

Overall I think it might help if this PE parsing code (if UEFI
doesn't offer a protocol to do it for us) was put into its own
source file. I also wonder if it wouldn't better be optional
(i.e. depend on a Kconfig option).

> @@ -968,6 +1100,21 @@ static void __init setup_efi_pci(void)
>      efi_bs->FreePool(handles);
>  }
> 
> +static bool __init efi_secure_boot(void)
> +{
> +    static const EFI_GUID global_guid = EFI_GLOBAL_VARIABLE;
> +    uint8_t buf[8];
> +    UINTN size = sizeof(buf);
> +
> +    if ( efi_rs->GetVariable(L"SecureBoot", (EFI_GUID *)&global_guid, NULL, &size, buf) != EFI_SUCCESS )
> +        return false;
> +
> +    if ( size != 1 )
> +        return false;
> +
> +    return buf[0] != 0;
> +}

I.e. "SecureBoot=N" still means "enabled"?

> @@ -1249,9 +1402,19 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
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
> +        else if ( secure )
> +        {
> +            blexit(L"Secure Boot enabled, but configuration not included.");
> +        }
> +        else if ( !cfg_file_name )
>          {
> +            /* Read and parse the config file. */
>              CHAR16 *tail;

"secure" depending merely on an env var, how is this logic compatible
with the shim model? You need to keep the other approach working.

Also, considering kernel and initrd are embedded, is there really a
strict need for a config file? It would seem to me that you could
boot the system fine without.

> @@ -1303,27 +1466,47 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>          efi_arch_cfg_file_early(dir_handle, section.s);
> 
>          option_str = split_string(name.s);
> -        read_file(dir_handle, s2w(&name), &kernel, option_str);
> -        efi_bs->FreePool(name.w);
> 
> -        if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                        (void **)&shim_lock)) &&
> -             (status = shim_lock->Verify(kernel.ptr, kernel.size)) != EFI_SUCCESS )
> -            PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> -
> -        name.s = get_value(&cfg, section.s, "ramdisk");
> -        if ( name.s )
> +        if ( !read_section(image_base, ".kernel", &kernel, option_str) )

Once you know whether you're dealing with a "unified" image, you
shouldn't have a need to make logic dependent upon read_section()
finding a particular section: Either you find all of them (and
don't even try to interpret respective config file settings), or
you read everything from disk.

> --- /dev/null
> +++ b/xen/scripts/unify-xen
> @@ -0,0 +1,68 @@
> +#!/bin/bash
> +# Merge a Linux kernel, initrd and commandline into xen.efi to produce a single signed
> +# EFI executable.
> +#
> +# turn off "expressions don't expand in single quotes"
> +# and "can't follow non-constant sources"
> +# shellcheck disable=SC2016 disable=SC1090

What are these three lines about?

> +set -e -o pipefail
> +export LC_ALL=C
> +
> +die() { echo "$@" >&2 ; exit 1 ; }
> +warn() { echo "$@" >&2 ; }
> +debug() { [ "$VERBOSE" == 1 ] && echo "$@" >&2 ; }
> +
> +cleanup() {
> +	rm -rf "$TMP"
> +}
> +
> +TMP=$(mktemp -d)
> +TMP_MOUNT=n
> +trap cleanup EXIT
> +
> +########################################
> +
> +# Usage
> +# unify xen.efi xen.cfg bzimage initrd
> +# Xen goes up to a pad at 00400000

"pad at 00400000"?

> +XEN="$1"
> +CONFIG="$2"
> +KERNEL="$3"
> +RAMDISK="$4"

What about ucode and xsm policy?

> +#	--change-section-vma  .config=0x0500000 \
> +#	--change-section-vma  .kernel=0x0510000 \
> +#	--change-section-vma .ramdisk=0x3000000 \
> +
> +objcopy \
> +	--add-section .kernel="$KERNEL" \
> +	--add-section .ramdisk="$RAMDISK" \
> +	--add-section .config="$CONFIG" \
> +	--change-section-vma  .config=0xffff82d041000000 \
> +	--change-section-vma  .kernel=0xffff82d041010000 \
> +	--change-section-vma .ramdisk=0xffff82d042000000 \

Of course these hard coded numbers will be eliminated in the
long run?

> +	"$XEN" \
> +	"$TMP/xen.efi" \
> +|| die "$TMP/xen.efi: unable to create"
> +
> +KEY_ENGINE=""
> +KEY="/etc/safeboot/signing.key"
> +CERT="/etc/safeboot/cert.pem"
> +
> +for try in 1 2 3 ; do
> +	warn "$TMP/xen.efi: Signing (ignore warnings about gaps)"
> +	sbsign.safeboot \
> +		$KEY_ENGINE \
> +		--key "$KEY" \
> +		--cert "$CERT" \
> +		--output "xen.signed.efi" \
> +		"$TMP/xen.efi" \
> +	&& break
> +
> +	if [ "$try" == 3 ]; then
> +		die "xen.signed.efi: failed after $try tries"
> +	fi
> +
> +	warn "$OUTDIR/linux.efi: signature failed! Try $try."
> +done

Why the retries? (Also leftover "linux.efi" in the warning?)

Jan

