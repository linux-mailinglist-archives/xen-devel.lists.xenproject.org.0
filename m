Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BF26BE11
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRvU-0002zq-2Y; Wed, 16 Sep 2020 07:32:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIRvT-0002zk-3L
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:32:23 +0000
X-Inumbo-ID: 3e07b482-31cb-4c6e-ba91-011b999dbfca
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e07b482-31cb-4c6e-ba91-011b999dbfca;
 Wed, 16 Sep 2020 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600241541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4KwSHYZVkgv+mu2JzrMomPJ9elb9q96v+VOa/zB6whE=;
 b=DF5slkxE4J5p8HqWPhrpyK983rTgfS3wm3MAT1j39u+/EYc2vaJVLTyq
 B19Dd+oVvBaQUNe8CJ/zOGnJ/8JDjUJMZls398jZWRxJ+YjrzWeAJAwPN
 Y6+NJqepXHTro1j8yYAA8qCcm4S4jkVKTH/EsodDwWtgqYwVuWm0SVg1s k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UMwF3pdEUeL8MztTw2DBbPd04CC+zwzvKj5nSnvKkNjygYJ1iwk+B13raLlGdRpGEbzFrf4tyX
 +kNFZNdU6gmoYBAalYiQebVcencc+rOh+5zQx/ICPoTy6Oro+TbJXSvdmflIk61qKC+HX4qMzX
 +I9BQEB6i5Ox8dRzon1Ya6EN46olFIw3uROISjr5A2DlW7lsLyJldZZTsd55Mc6EvcVNAIEbks
 FZe8dM7xo9MiXjoIWN1oCwU3SDTZS+mlYVdxIDiQRCb5mO+6fQmKaI0ePHowlMZ0pBO+gUECFN
 YxA=
X-SBRS: 2.7
X-MesageID: 26916647
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,431,1592884800"; d="scan'208";a="26916647"
Date: Wed, 16 Sep 2020 09:32:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
 <andrew.cooper3@citrix.com>, <wl@xen.org>
Subject: Re: [PATCH v4 3/4] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <20200916073209.GR753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-4-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200914115013.814079-4-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On Mon, Sep 14, 2020 at 07:50:12AM -0400, Trammell Hudson wrote:
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
> (`.ramdisk`), and XSM config (`.xsm`), which are included after building
> xen.efi using objcopy to add named sections for each input file.
> 
> For x86, the CPU ucode can be included in a section named `.ucode`,
> which is loaded in the efi_arch_cfg_file_late() stage of the boot process.
> 
> On ARM systems the Device Tree can be included in a section named
> `.dtb`, which is loaded during the efi_arch_cfg_file_early() stage of
> the boot process.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Thanks, just have one comment and two style nits.

> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 57df89cacb..4b1fbc9643 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -121,6 +121,8 @@ static CHAR16 *s2w(union string *str);
>  static char *w2s(const union string *str);
>  static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                        struct file *file, char *options);
> +static bool read_section(const EFI_LOADED_IMAGE *image,
> +                         char *name, struct file *file, char *options);
>  static size_t wstrlen(const CHAR16 * s);
>  static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
>  static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
> @@ -623,6 +625,27 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>      return true;
>  }
>  
> +static bool __init read_section(const EFI_LOADED_IMAGE *image,
> +                                char *const name, struct file *file,
> +                                char *options)
> +{
> +    /* skip the leading "." in the section name */
> +    union string name_string = { .s = name + 1 };
> +
> +    file->ptr = (void *)pe_find_section(image->ImageBase, image->ImageSize,
> +                                        name, &file->size);
> +    if ( !file->ptr )
> +        return false;
> +
> +    file->need_to_free = false;
> +
> +    s2w(&name_string);

Don't you need to check that s2w succeed, so that name_string.w is not
a random pointer from stack garbage?

> +    handle_file_info(name_string.w, file, options);
> +    efi_bs->FreePool(name_string.w);
> +
> +    return true;
> +}
> +
>  static void __init pre_parse(const struct file *cfg)
>  {
>      char *ptr = cfg->ptr, *end = ptr + cfg->size;
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

Nit: extra space between * and function name.

> diff --git a/xen/common/efi/pe.c b/xen/common/efi/pe.c
> new file mode 100644
> index 0000000000..2986545d53
> --- /dev/null
> +++ b/xen/common/efi/pe.c
> @@ -0,0 +1,137 @@
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
> +const void *__init pe_find_section(const CHAR8 *image, const UINTN image_size,
> +                                   const char *section_name, UINTN *size_out)
> +{
> +    const struct DosFileHeader *dos = (const void*)image;

Nit: missing space between void and *.

Thanks, Roger.

