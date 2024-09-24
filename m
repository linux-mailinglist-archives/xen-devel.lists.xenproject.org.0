Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E498474B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:08:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802971.1213339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6DF-0000PB-Tt; Tue, 24 Sep 2024 14:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802971.1213339; Tue, 24 Sep 2024 14:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6DF-0000NH-R6; Tue, 24 Sep 2024 14:08:21 +0000
Received: by outflank-mailman (input) for mailman id 802971;
 Tue, 24 Sep 2024 14:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st6DE-0000MJ-S5
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:08:20 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73448cda-7a7e-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 16:08:19 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so5598168a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:08:19 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f46ffsm87025466b.155.2024.09.24.07.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:08:17 -0700 (PDT)
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
X-Inumbo-ID: 73448cda-7a7e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727186898; x=1727791698; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8u3xPHfadYAvYQ7MBsCZQJQxU9cITwjLvQC2T+YM0g=;
        b=uoHlTWsprhHu/Fh2oCAYCfvbQhcDlfi8/gnTgRJSoBXpxr23sJT2MjaBQUNBua9dba
         C4Fb6DkxRGafS3rKXz9Uuo5Zy0fNeYJeJs4En1hgM/lMZ37BA4GgNRhAvxla/ba12mv0
         KlAJUSMxkYP3VpiPEwOEuUEIp5yB37sdnyrM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186898; x=1727791698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8u3xPHfadYAvYQ7MBsCZQJQxU9cITwjLvQC2T+YM0g=;
        b=LDJ5Psr2ewxXJhTTHui2sExJTcvosbNV8AQ/kOUW190NFm+Ez6g0rWU/6CJ91v0I0a
         DQr08SBeCJceIn666HhmUfixSFvxOyA8+afUUKVdkpm0xT9w3vWpRsdwjDLaTIKu/+Jx
         4q8/J4OeXIitgzS/Mo+d/zE8gdXu96HXwyabpS0nrBFTEPJj6wR4w2PZnypST6exLHEs
         xxuMQ4T5TReKxvoRg+11hlfoP8w2xkr3tpfvBa40zezS3zVSoWlmDFqq/WWtzGbehNIm
         ZtAPmhT6SkxSHOJqaJW1tbcv/iVnGAG8MONdEWKAN8iOz1UqSaMkDScg7wGk2biHLhb9
         7ZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhMNG8oQ8YU7NVYYAohEk9b8wgBT84sA3RzmvLSeU70zqTZAMhAOXXi+XGvfcJ+w7XoJCwXCNP5zI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYjcxGJ74quWwm7NUgdN56i4xLq6/H1Mz5h7tlGJ332zdPoEyd
	Qm8EhQaLc+5O/32/QMkyqN3yzlXnCH9ye0YKO9T1VLc9MtBPRItPParJ/cDJXrE=
X-Google-Smtp-Source: AGHT+IGVXKyRsh3Xhvvvb+nH/BEFWdymLrqtemCgs94AatLN/wk1izcTmN6jFKqbb8vRVQLPfKX6GQ==
X-Received: by 2002:a17:907:7287:b0:a86:97c0:9bb3 with SMTP id a640c23a62f3a-a90d51281acmr1752548166b.51.1727186898332;
        Tue, 24 Sep 2024 07:08:18 -0700 (PDT)
Message-ID: <672bc47a-8d7a-471b-8f72-e6ca2aedadd7@citrix.com>
Date: Tue, 24 Sep 2024 15:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-4-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240924102811.86884-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/09/2024 11:28 am, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 80bba6ff21..6d8eec554b 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -253,36 +244,30 @@ __efi64_mb2_start:
>          shr     $3, %ecx
>          xor     %eax, %eax
>          rep stosq
> -        mov     %edx, %eax
>  
> -        /* Check for Multiboot2 bootloader. */
> -        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> -        je      .Lefi_multiboot2_proto
> -
> -        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
> -        lea     .Lnot_multiboot(%rip), %r15
> -        jmp     x86_32_switch
> +        /* Save Multiboot2 magic on the stack. */
> +        push    %rdx
>  
> -.Lefi_multiboot2_proto:
> -        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
> -        xor     %esi,%esi
> -        xor     %edi,%edi
> -        xor     %edx,%edx
> +        /* Save Multiboot2 pointer on the stack, keep the stack aligned. */
> +        push    %rbx

I'd merge these two pushes, so

    /* Spill MB2 magic.  Spill the pointer too, to keep the stack
aligned. */
    push %rdx
    push %rbx

and ...

>  
> -        /* Skip Multiboot2 information fixed part. */
> -        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
> -        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
> +        /*
> +         * efi_parse_mbi2() is called according to System V AMD64 ABI:
> +         *   - IN:  %edi - Multiboot2 magic, %rsi - Multiboot2 pointer.

%rsi below %edi please, for readability.

> +         *   - OUT: %rax - error string.
> +         */
> +        mov     %edx, %edi
> +        mov     %rbx, %rsi
> +        call    efi_parse_mbi2
> +        lea     .Ldirect_error(%rip), %r15
> +        test    %rax, %rax
> +        jnz     x86_32_switch
>  
> -.Lefi_mb2_tsize:
> -        /* Check Multiboot2 information total size. */
> -        mov     %ecx,%r8d
> -        sub     %ebx,%r8d
> -        cmp     %r8d,MB2_fixed_total_size(%rbx)
> -        jbe     .Lrun_bs
> +        /* Restore Multiboot2 pointer. */
> +        pop     %rbx
>  
> -        /* Are EFI boot services available? */
> -        cmpl    $MULTIBOOT2_TAG_TYPE_EFI_BS,MB2_tag_type(%rcx)
> -        jne     .Lefi_mb2_st
> +        /* Restore Multiboot2 magic. */
> +        pop     %rax

... merge these pops too.  (It's a shame the pushes/pops implement a
%edx -> %eax swap for magic, but it's for BSS clearing purposes.)

> diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
> new file mode 100644
> index 0000000000..6038f35b16
> --- /dev/null
> +++ b/xen/arch/x86/efi/parse-mbi2.c
> @@ -0,0 +1,58 @@
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
> +
> +void __init efi_multiboot2(EFI_HANDLE ImageHandle,
> +                           EFI_SYSTEM_TABLE *SystemTable,
> +                           const char *cmdline);

This wants to be in a header file seen by all references.  I see you
you've fixed up an error in the stub clearly caused by the absence of a
shared header.

> +
> +const char * asmlinkage __init
> +efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
> +{
> +    const multiboot2_tag_t *tag;
> +    EFI_HANDLE ImageHandle = NULL;
> +    EFI_SYSTEM_TABLE *SystemTable = NULL;
> +    const char *cmdline = NULL;
> +    bool have_bs = false;
> +
> +    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
> +        return "ERR: Not a Multiboot2 bootloader!";
> +
> +    /* Skip Multiboot2 information fixed part. */
> +    tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
> +
> +    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> +            && tag->type != MULTIBOOT2_TAG_TYPE_END;
> +          tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
> +                   MULTIBOOT2_TAG_ALIGN)) )
> +    {
> +        if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI_BS )
> +            have_bs = true;
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64 )
> +            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64_IH )
> +            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
> +        else if ( tag->type == MULTIBOOT2_TAG_TYPE_CMDLINE )
> +            cmdline = ((const multiboot2_tag_string_t *)tag)->string;

switch ( tag->type ) please.  It's more lines, but more legible.

Otherwise, LGTM.  Definitely nice to move this out of asm.

~Andrew

