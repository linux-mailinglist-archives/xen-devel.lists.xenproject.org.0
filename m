Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B057F33D681
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98353.186546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBJZ-00045q-Kt; Tue, 16 Mar 2021 15:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98353.186546; Tue, 16 Mar 2021 15:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBJZ-00045N-FF; Tue, 16 Mar 2021 15:08:57 +0000
Received: by outflank-mailman (input) for mailman id 98353;
 Tue, 16 Mar 2021 15:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lMBJX-00045E-Si
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:08:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1ce2870-9f57-4a52-bf65-701ea9ae0e27;
 Tue, 16 Mar 2021 15:08:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE638AC24;
 Tue, 16 Mar 2021 15:08:53 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f1ce2870-9f57-4a52-bf65-701ea9ae0e27
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615907333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5Q0FZLg0YSHnXmpGl6RFh/nV7Mg0ceTrLYn9AYFV8o=;
	b=pCiS2eHLqG38v45KjElxdffKkZd8BOBAdjqvSBgPbUMN86yAna8lEBEu9orF75NV0Gp6Qt
	dpZwJyER3WkxxK2gjbrawsjlte9BZSvUjepxp1nHON4AXVem3CuHkCY59CdDFhfyGlKGfI
	oQ8oNFeDszXq8y8mI7ZjbJnoYizJ0To=
Subject: Re: [PATCH v3 5/5] xen/x86/efi: Verify dom0 kernel with SHIM_LOCK
 protocol in efi_multiboot2()
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <44cb9567aa17d6255beadaa48defccd246b35669.1611273359.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ba72288-6753-a049-7a9d-7fcdc124cd47@suse.com>
Date: Tue, 16 Mar 2021 16:08:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <44cb9567aa17d6255beadaa48defccd246b35669.1611273359.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 01:51, Bobby Eshleman wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -244,9 +244,13 @@ __efi64_mb2_start:
>          jmp     x86_32_switch
>  
>  .Lefi_multiboot2_proto:
> -        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
> +        /*
> +         * Zero EFI SystemTable, EFI ImageHandle and
> +         * dom0 kernel module struct addresses.
> +         */
>          xor     %esi,%esi
>          xor     %edi,%edi
> +        xor     %r14d, %r14d

Nit: There's little point in having the d suffixes here and below,
and the code would be slightly easier to read without.

>          /* Skip Multiboot2 information fixed part. */
>          lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
> @@ -284,6 +288,15 @@ __efi64_mb2_start:
>          cmove   MB2_efi64_ih(%rcx),%rdi
>          je      .Lefi_mb2_next_tag
>  
> +        /* Get Dom0 kernel module struct address from Multiboot2 information. */
> +        cmpl    $MULTIBOOT2_TAG_TYPE_MODULE,MB2_tag_type(%rcx)

Not: If elsewhere in the code additions you put blanks after the
comma (which I appreciate), please do so here as well.

> +        jne     .Lefi_mb2_end
> +
> +        test    %r14d, %r14d
> +        cmovz   %ecx, %r14d

So this doesn't truncate the address because higher up %ecx was
loaded instead of %rcx. I realize that's not code you add, but
it still strikes me as odd. Are there indeed guarantees that all
of this will live below 4Gb?

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -3,6 +3,8 @@
>   * is intended to be included by common/efi/boot.c _only_, and
>   * therefore can define arch specific global variables.
>   */
> +#include <xen/types.h>
> +#include <xen/multiboot2.h>
>  #include <xen/vga.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
> @@ -762,6 +764,10 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,

Isn't there a hunk missing up from here to add the new parameter to
efi_multiboot2()?

>      gop = efi_get_gop();
>  
> +    if ( dom0_kernel && dom0_kernel->mod_end > dom0_kernel->mod_start )
> +        efi_shim_lock((VOID *)(unsigned long)dom0_kernel->mod_start,
> +                      dom0_kernel->mod_end - dom0_kernel->mod_start);

While somewhat unrelated to the change itself - how come the fields
are all u32 (and hence you need to cast to unsigned long first)?
There having been requests to allow for about 1Gb initrd images, I
find it quite reasonable to expect that modules may not all fit
below 4Gb.

> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -1,7 +1,9 @@
> +#include <xen/types.h>

Please don't, even less so without honoring the alphabetical sorting.

>  #include <xen/efi.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/multiboot2.h>
>  #include <asm/asm_defns.h>
>  #include <asm/efibind.h>
>  #include <asm/page.h>
> @@ -29,7 +31,8 @@ asm (
>      );
>  
>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> -                                    EFI_SYSTEM_TABLE *SystemTable)
> +                                    EFI_SYSTEM_TABLE *SystemTable,
> +                                    multiboot2_tag_module_t *dom0_kernel)

const?

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -133,6 +133,7 @@ static void efi_console_set_mode(void);
>  static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(void);
>  static UINTN efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>                                 UINTN cols, UINTN rows, UINTN depth);
> +static void efi_shim_lock(const VOID *Buffer, UINT32 Size);
>  static void efi_tables(void);
>  static void setup_efi_pci(void);
>  static void efi_variables(void);
> @@ -830,6 +831,17 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>      return gop_mode;
>  }
>  
> +static void __init efi_shim_lock(const VOID *Buffer, UINT32 Size)

Maybe better efi_shim_lock_verify()?

> +{
> +    static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
> +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    EFI_STATUS status;
> +
> +    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL, (void **)&shim_lock)) &&

Nit: Overly long line.

> +         (status = shim_lock->Verify(Buffer, Size)) != EFI_SUCCESS )
> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status);

I'm willing to let it be as is, but in principle this function is
not Dom0-specific the way you've split it out. _If_ you leave it
this way, perhaps (on top of the suggestion above) perhaps better
name it efi_shim_lock_verify_dom0()?

Jan

