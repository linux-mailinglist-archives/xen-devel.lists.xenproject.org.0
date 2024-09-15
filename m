Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE19794E9
	for <lists+xen-devel@lfdr.de>; Sun, 15 Sep 2024 09:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798860.1208896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spjFU-0000ht-Hc; Sun, 15 Sep 2024 07:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798860.1208896; Sun, 15 Sep 2024 07:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spjFU-0000fI-EF; Sun, 15 Sep 2024 07:00:44 +0000
Received: by outflank-mailman (input) for mailman id 798860;
 Sun, 15 Sep 2024 07:00:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spjFS-0000fC-Nz
 for xen-devel@lists.xenproject.org; Sun, 15 Sep 2024 07:00:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37a11ac8-7330-11ef-99a2-01e77a169b0f;
 Sun, 15 Sep 2024 09:00:40 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c251ba0d1cso4259551a12.3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 00:00:40 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb532a8sm1369573a12.28.2024.09.15.00.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 00:00:38 -0700 (PDT)
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
X-Inumbo-ID: 37a11ac8-7330-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726383639; x=1726988439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EtSKSa8ae0hkABFd5Y+Vu93fYgFSnyyWs9IxjG3oSk=;
        b=PXL55WNs2EaC1RC6RNnXd6CoM++17NXmIXsF9QKw4XtyS2XcJ01cw+eUcXln0U0pGA
         kIFur5SfFGfuTe9Bdq9brJHIMWc3l2miuhSKTgd67rLxaLIKWRf+lLsfp/kwRgGGnBVR
         F3KlwZyNduJZoVIiDd+Rn74SWWv/Ywc16FUPbDfP8dJa2pPLG+0o3NSlyu+IfNr632xM
         lGOAjBIM62b1CYhupxOuUMXeGjSGy1CdH2YdjbDFPuEznyhHg8+QsEeDkHf29vk6aGl4
         f6BqZXGiygSv+BsqSQnXem34GXe64VMLB2AymCbex2dkryQ6auHaYL0WGy3uV4V2qllv
         4muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726383639; x=1726988439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EtSKSa8ae0hkABFd5Y+Vu93fYgFSnyyWs9IxjG3oSk=;
        b=vHbrBF7InqcC3dNx8DlFgj9zv95DXckicBoPnztWDPB5yX2ensvypRDuLx6sTROnzv
         i21ja26ZGoa2Ap1H+IvLxMjT1/jillRIZdGABqsLKtnBmRQDbQpBzbl02C3A/FwYl3NT
         G4YfLDN+PZsbhPUJVBCDcMfRuA0+bp/h7QNoYAjhuiPjqtHaBFh9OAIUySWX/6bdqxsM
         Vuw2PWONq0nxEFAR03lFUIYdTQORQzPzoIYfNHnuUxnhU3qDC6sk6oiiVDG6HpXOu6lS
         IHAl+Q2dYsF0t4G1Qa2/q9DYCQif0uI3bkEr10Ywl0818/PpofVHsdKtK2unr+lbtrhU
         14+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDigchNCBhnHjMu+YOPPuYbKP5hKvSKZB8yCl5+IpWRLyz3LebP2h3tn9073v6aGObVP9vZMISXFo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSUntAW8acTDGekIgvVVeiDS3ste4d6SJP1VQMU/KJ+G9GuDAO
	lkcM6cb0Hkj7lyJrjuHvk5KcJOgPuhoYbIJWNBNeHCtwswspJcI2CJBDSe2HlQ==
X-Google-Smtp-Source: AGHT+IHz5R1Peg0o8ZKVkKM2E7WDT/jV1daskhwr0hIYKwCuDap+lsi9fNCas8odxl4tDH4xpoqQJg==
X-Received: by 2002:a05:6402:26cc:b0:5c4:2d7d:9759 with SMTP id 4fb4d7f45d1cf-5c42d7d9a77mr2877451a12.10.1726383639348;
        Sun, 15 Sep 2024 00:00:39 -0700 (PDT)
Message-ID: <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
Date: Sun, 15 Sep 2024 09:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-4-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240910161612.242702-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 18:16, Frediano Ziglio wrote:
> No need to have it coded in assembly.

As to the title: It's the EFI/MB2 case you re-write. That wants reflecting
there, as the "normal" EFI start part is all C already anyway. I also
think you mean "partly"?

> @@ -255,34 +246,29 @@ __efi64_mb2_start:
>          rep stosq
>          mov     %edx, %eax

This can be dropped then, by making ...

> -        /* Check for Multiboot2 bootloader. */
> -        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> -        je      .Lefi_multiboot2_proto
> -
> -        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
> -        lea     .Lnot_multiboot(%rip), %r15
> -        jmp     x86_32_switch
> +        /* Save Multiboot2 magic on the stack. */
> +        push    %rax

... this use %rdx.

> -.Lefi_multiboot2_proto:
> -        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
> -        xor     %esi,%esi
> -        xor     %edi,%edi
> -        xor     %edx,%edx
> +        /* Save Multiboot2 pointer on the stack. */
> +        push    %rbx

%rbx doesn't need preserving around a C function call (which will do
so itself if necessary). I understand a 2nd PUSH may be necessary
anyway, to keep the stack aligned, yet that then would need
commenting differently. Plus as long as we call our own functions
only, we don't require such alignment.

> -        /* Skip Multiboot2 information fixed part. */
> -        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
> -        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
> +        /*
> +         * efi_parse_mbi2() is called according to System V AMD64 ABI:
> +         *   - IN:  %edi - Multiboot2 magic, %rsi - Multiboot2 pointer.
> +         *   - OUT: %eax - error string.

Nit: %rax according to the code below.

> +         */
> +        mov     %eax, %edi
> +        mov     %ebx, %esi

This latter one would better be a 64-bit MOV, for it being a pointer?

> +        call    efi_parse_mbi2
> +        test    %rax, %rax
> +        lea     .Ldirect_error(%rip), %r15
> +        jnz     x86_32_switch

As requested by Andrew in a related context: LEA first please to follow
the pattern allowing macro fusion, even if here it is less because of
performance concerns but more to avoid giving a bad example.

> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -13,6 +13,7 @@ $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-bounda
>  
>  obj-y := common-stub.o stub.o
>  obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
> +obj-y += parse-mbi2.o

obj-bin-y I suppose, for it all being __init / __initdata, and hence the
string literals in particular also wanting to move to .init.rodata.

> --- /dev/null
> +++ b/xen/arch/x86/efi/parse-mbi2.c
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/efi.h>
> +#include <xen/init.h>
> +#include <xen/multiboot2.h>
> +#include <asm/asm_defns.h>
> +#include <asm/efibind.h>
> +#include <efi/efidef.h>
> +#include <efi/eficapsule.h>
> +#include <efi/eficon.h>
> +#include <efi/efidevp.h>
> +#include <efi/efiapi.h>

I don't think all of these are needed? Please limit #include-s to just
what is actually used.

> +void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
> +                                      EFI_SYSTEM_TABLE *SystemTable,
> +                                      const char *cmdline);

This i now solely called from C code and hence shouldn't be asmlinkage.

> +const char *__init efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)

Whereas this, called from assembly code and not having / needing a
declaration, should be.

> +{
> +    const multiboot2_tag_t *tag;
> +    EFI_HANDLE ImageHandle = NULL;
> +    EFI_SYSTEM_TABLE *SystemTable = NULL;
> +    const char *cmdline = NULL;
> +    bool have_bs = false;
> +
> +    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> +        return "ERR: Not a Multiboot bootloader!";

Assembly code merely re-used a message. Now that it separate, please make
it say "Multiboot2".

> +    /* Skip Multiboot2 information fixed part. */
> +    for ( tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));

The comment is placed as if it applied to the entire loop. It wants to move
inside the for() to make clear it only applies to the loop setup.

> +          (void *)tag - (void *)mbi < mbi->total_size && tag->type != MULTIBOOT2_TAG_TYPE_END;
> +          tag = _p(ROUNDUP((unsigned long)((void *)tag + tag->size), MULTIBOOT2_TAG_ALIGN)) )

Now that this is done in C, I think the checking wants to be more
thorough, to no only make sure the start of a sub-struct is within
the specified size, but all of it (se we won't even access past
->total_size).

Further looks like there's a line length issue here.

Also please don't cast away const-ness from pointers.

> +    {
> +        if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI_BS )
> +            have_bs = true;
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64 )
> +            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64_IH )
> +            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_CMDLINE )
> +            cmdline = ((const multiboot2_tag_string_t *)tag)->string;
> +    }
> +
> +    if ( !have_bs )
> +        return "ERR: Bootloader shutdown EFI x64 boot services!";
> +    if ( !SystemTable )
> +        return "ERR: EFI SystemTable is not provided by bootloader!";
> +    if ( !ImageHandle )
> +        return "ERR: EFI ImageHandle is not provided by bootloader!";
> +
> +    efi_multiboot2(ImageHandle, SystemTable, cmdline);

This being invoked from here now makes me wonder about the (new)
function's name and whether a separate new function is actually
needed: Can't the new code then be integrated right into
efi_multiboot2(), thus eliminating the question on the naming of
the function?

> --- a/xen/arch/x86/efi/stub.c
> +++ b/xen/arch/x86/efi/stub.c
> @@ -17,7 +17,8 @@
>   */
>  
>  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> -                                    EFI_SYSTEM_TABLE *SystemTable)
> +                                    EFI_SYSTEM_TABLE *SystemTable,
> +                                    const char *cmdline)
>  {
>      static const CHAR16 __initconst err[] =
>          L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";

This, if not a separate change, wants mentioning in the description.
It's a related observation that this wasn't properly updated, but
nothing that necessarily needs doing here. Question is whether the
declaration of the function wouldn't better go into a header now in
the first place.

Jan

