Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30B9794BC
	for <lists+xen-devel@lfdr.de>; Sun, 15 Sep 2024 08:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798849.1208876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spiYr-0002gf-F3; Sun, 15 Sep 2024 06:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798849.1208876; Sun, 15 Sep 2024 06:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spiYr-0002fA-Bs; Sun, 15 Sep 2024 06:16:41 +0000
Received: by outflank-mailman (input) for mailman id 798849;
 Sun, 15 Sep 2024 06:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spiYq-0002f4-5v
 for xen-devel@lists.xenproject.org; Sun, 15 Sep 2024 06:16:40 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ae25b1-732a-11ef-99a2-01e77a169b0f;
 Sun, 15 Sep 2024 08:16:37 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so4438126a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 14 Sep 2024 23:16:37 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3833sm157404866b.128.2024.09.14.23.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 23:16:36 -0700 (PDT)
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
X-Inumbo-ID: 10ae25b1-732a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726380997; x=1726985797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAlVJG3pEPzTtNVSmws+kFaweQytw5CkDAoSTM847M4=;
        b=Ell8c/DgDvnmsZsHS7BSB6aWax1S2/I5oL3bhUlU3BrjYG8yjXSAKTqdsiukJHQT0Y
         8LpggUR1/azo8WilJ4LT0wEVsJSeMAqJh2zKBDN5NHc0Qrn40sdnFewve4x1G/pdK02S
         bkjX8hz5Qzp6EMSmaEUMius13nVmjl5/eEXExZ8QQqAv4ngcV2Wd1oYTsha1DLXQFgrp
         zPLOlXruFVo1KM3JkEb4fhVULAAYQSC4kWspq5VREzh5nZqutPWmTecu2hRAY0eamX0B
         p6312zRiQWFBGVj/azU7HsT/4tWEGPP0qn4r7dTP+RX7+GURQ+PtbrRCxfBR7lZB/pdJ
         9nHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726380997; x=1726985797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAlVJG3pEPzTtNVSmws+kFaweQytw5CkDAoSTM847M4=;
        b=rTUn2K4qGChj+hprVYIz3wGkWWzJ3icjVIeYaVVz2g9hmln6VhRuJcp+zJ1YOYmvVO
         sTsZm/hipmsdwwNBc+6aYNR3zsj06yaseH6QHvGwmRaJhRFMmqxRLRNLKCRabv4uNw2y
         fxnBOxzNtOTO/A3QICQQ8q0ZdLbLUKBErnMLne/acVrdMeRcZPuAm2AYIz0i28JgaC82
         yEytTeO+iTHZA6fSVC5+awyIssS/o7dcnqyldFCKLRgN7HJJ1ldqHVGtz6u/sW2PHkA+
         /cQ1H9q4Mxa8a0FuyA+I4JuZx2CRMlRerKecfXny3o+LAnjkhF1PDYbncUVCSmiw0NJF
         qErg==
X-Forwarded-Encrypted: i=1; AJvYcCUB0w6lyCT3ol4JNZt3OtIemfrSa2a5vBYl6NOHR+yl18rda05Ws/SDLuNW3qDSAzuq/R2WEhQ1cpY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzeQ8/EclOHUKZUpp58OsgXdo7kdOyiSJe6YLUGYWj3ebtYrBcu
	Mt/Z3SUqW9ee5rJTZSDKEBrn9XzDtP2zWsjjt87iMF6bT+RgurTifmR+yXCpSA==
X-Google-Smtp-Source: AGHT+IHtfrzvwIX9PJtree7N+Odk8pd40FAXuHBztzdocTiQK333PgF3tB4eUMKOEzTZ2D3RsLKxEg==
X-Received: by 2002:a17:907:2da3:b0:a7d:9f92:9107 with SMTP id a640c23a62f3a-a9029690793mr1358276466b.58.1726380997000;
        Sat, 14 Sep 2024 23:16:37 -0700 (PDT)
Message-ID: <cb1e0f12-57ee-41a8-acc1-0db36ed14c4c@suse.com>
Date: Sun, 15 Sep 2024 08:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Refactor BIOS/PVH start
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-3-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240910161612.242702-3-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 18:16, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -25,6 +25,9 @@
>  #define MB2_HT(name)      (MULTIBOOT2_HEADER_TAG_##name)
>  #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
>  
> +#define BOOT_TYPE_BIOS 1
> +#define BOOT_TYPE_PVH 2

Did you consider using 0 and 1, to be able to use XOR on the BIOS
path and TEST for checking?

> @@ -409,13 +412,28 @@ cs32_switch:
>  ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
>  
>  __pvh_start:
> -        cld
>          cli
> +        mov     $BOOT_TYPE_PVH, %ebp
> +        jmp     common_bios_pvh
> +#endif /* CONFIG_PVH_GUEST */
> +
> +__start:
> +        cli
> +        mov     $BOOT_TYPE_BIOS, %ebp
> +
> +common_bios_pvh:

I think labels like this one don't need to show up in the symbol
table, and hence would better start with .L.

> +        cld

So you fold the STDs but not the STIs, despite that not even having
been first on the PVH path. This decision wants explaining in the
description, even if just briefly.

> @@ -433,14 +451,9 @@ __pvh_start:
>          /* Set up stack. */
>          lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
>  
> -        call    initialise_bss

I'm little puzzled: The previous patch moved it "as early as possible"
just for it to be moved to a later point again here?

> -        mov     %ebx, sym_esi(pvh_start_info_pa)
> -
> -        /* Force xen console.  Will revert to user choice in init code. */
> -        movb    $-1, sym_esi(opt_console_xen)
> -
> -        /* Prepare gdt and segments */
> +        /*
> +         * Initialize GDTR and basic data segments.
> +         */
>          add     %esi, sym_esi(gdt_boot_base)
>          lgdt    sym_esi(gdt_boot_descr)

No real need to change the comment? In any even it wants to remain a
single-line one.

> @@ -449,67 +462,44 @@ __pvh_start:
>          mov     %ecx, %es
>          mov     %ecx, %ss
>  
> -        /* Skip bootloader setup and bios setup, go straight to trampoline */
> -        movb    $1, sym_esi(pvh_boot)
> -        movb    $1, sym_esi(skip_realmode)
> -
> -        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
> -        movw    $0x1000, sym_esi(trampoline_phys)
> -        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
> -        jmp     trampoline_setup
> -
> -#endif /* CONFIG_PVH_GUEST */
> +        /* Load null descriptor to unused segment registers. */
> +        xor     %ecx, %ecx
> +        mov     %ecx, %fs
> +        mov     %ecx, %gs

The comment said "descriptor", yes, but it's a null selector that
we load here. Perhaps worth adjusting as the comment is moved.

> -initialise_bss:
>          /*
>           * Initialise the BSS.
>           *
>           * !!! WARNING - also zeroes the current stack !!!
>           */
> -        pop     %ebp
>          mov     %eax, %edx
> -
>          lea     sym_esi(__bss_start), %edi
>          lea     sym_esi(__bss_end), %ecx
>          sub     %edi, %ecx
>          xor     %eax, %eax
>          shr     $2, %ecx
>          rep stosl
> -
>          mov     %edx, %eax
> -        jmp     *%ebp
> -
> -__start:
> -        cld
> -        cli
>  
> -        /*
> -         * Multiboot (both 1 and 2) specify the stack pointer as undefined
> -         * when entering in BIOS circumstances.  This is unhelpful for
> -         * relocatable images, where one call (i.e. push) is required to
> -         * calculate the image's load address.
> -         *
> -         * This early in boot, there is one area of memory we know about with
> -         * reasonable confidence that it isn't overlapped by Xen, and that's
> -         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
> -         */
> -
> -        /* Preserve the field we're about to clobber. */
> -        mov     (%ebx), %edx
> -        lea     4(%ebx), %esp
> +#ifdef CONFIG_PVH_GUEST
> +        cmp     $BOOT_TYPE_PVH, %ebp
> +        jne     1f
>  
> -        /* Calculate the load base address. */
> -        call    1f
> -1:      pop     %esi
> -        sub     $sym_offs(1b), %esi
> +        mov     %ebx, sym_esi(pvh_start_info_pa)
>  
> -        /* Restore the clobbered field. */
> -        mov     %edx, (%ebx)
> +        /* Force xen console.  Will revert to user choice in init code. */
> +        movb    $-1, sym_esi(opt_console_xen)
>  
> -        /* Set up stack. */
> -        lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
> +        /* Skip bootloader setup and bios setup, go straight to trampoline */
> +        movb    $1, sym_esi(pvh_boot)
> +        movb    $1, sym_esi(skip_realmode)
>  
> -        call    initialise_bss
> +        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
> +        movw    $0x1000, sym_esi(trampoline_phys)

I realize you merely move this, yet I question the use of MOVW here.
You use 32-bit operations e.g. to set %ebp; perhaps the same should
be done here, even if that means a 1 byte code size increase. In any
even this would preferably use PAGE_SIZE imo.

Jan

