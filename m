Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B360A98A372
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807347.1218736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqJ-0005Nw-NO; Mon, 30 Sep 2024 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807347.1218736; Mon, 30 Sep 2024 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqJ-0005MB-K0; Mon, 30 Sep 2024 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 807347;
 Mon, 30 Sep 2024 12:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svFqI-0005M5-Ta
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:49:34 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e5a02e-7f2a-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 14:49:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8a706236bfso364884166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 05:49:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8824949bdsm4466921a12.84.2024.09.30.05.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 05:49:32 -0700 (PDT)
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
X-Inumbo-ID: 70e5a02e-7f2a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727700572; x=1728305372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IsgxbMDNJrjoAcLf7AaytRpRYa68awuyHH+7F5tLcVU=;
        b=aLWLGKBIgjVI39Eb+cjzkDgcceq6kagNCUAO07ZPa1vUF/jOSpds1tUooAfOWSJjUp
         4GgpsNGhsJljmLWQZIcyYz3ylN/VCUyOxQKOQS22wCSj74wZ364yXU3oyeMkdXDFuErP
         /vRF6Seo2SwzY60rnDwrBxPdBSCdvzxV4pkZv0vCcOkRC+X1e9WPBxS19uflLx8AHzl/
         FWymWA2NQQE81+CARidRBxOCHdbpytNfnR06B9cDmF8D1JMkw1VEKDPgfAfgge7B3cJn
         7jtSehktDXwy0KrdpjBAAhJNoajIEY5x/S2860Qm7VSZUUfjwunNnd8OYh6eYwo0u2ET
         YNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727700572; x=1728305372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsgxbMDNJrjoAcLf7AaytRpRYa68awuyHH+7F5tLcVU=;
        b=Hw+bllsdxt+4WarbvcGdc9tba2ugy19Q9K/0UlZTULUetzft2HvtI8u5E+4ozuJGpS
         ZASPVPGO8Dqzk6AoHuce6823n5W4tSQemhMT8xkfXHc7sQBCyt/QwzdVm9ShCPxtpwv8
         eKAwCYbAcbNdsAXE9+HGL0p6uob5YxRGVTYtgksNLGvx06g6BTVknglh4Tuf0OH32SVW
         eUKNyX0lnB1cyEJW9q4MAFiEKHwdn8Z6C2ZZzM1YqvZpxy6XIDL238hzm1NbSET53BIe
         GXwkpumNrHd+okILxsRmVThGMgXHdEwgby3QF3SQj85MNN/lLn2450ocm9fbdK1UwH+T
         w5/g==
X-Forwarded-Encrypted: i=1; AJvYcCU40LLpfjzs88t73jonQlMIC4k2gggiVKemhIRYGXFlwyfduG7kYA9KbQ53wsNv2IaBvwQ4nPeG2q4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydPutEhytML88jpVA5AomFA6PysjHaYaTsfbQuyZmxbtFI46Z2
	PeJJoDPR3W4feY4YWO64xAn0dscdRMOSyElq/SjHkldJ0P9nYv+/XGXVaGYu0g==
X-Google-Smtp-Source: AGHT+IE2DB6akR15TPuVf7DWEObLNI4FykMumY9iKxqjJBxq7UsKLcznzFNf/6I7p5DQ2im9XpyCRA==
X-Received: by 2002:a05:6402:43cb:b0:5c8:8290:47bf with SMTP id 4fb4d7f45d1cf-5c882904925mr17199808a12.21.1727700572429;
        Mon, 30 Sep 2024 05:49:32 -0700 (PDT)
Message-ID: <bf154ed9-cf4f-4b20-93c9-bc0149a748b0@suse.com>
Date: Mon, 30 Sep 2024 14:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/boot: Call efi_multiboot2() at it's linked
 address
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
 <20240930120628.1072839-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240930120628.1072839-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 14:06, Andrew Cooper wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -344,6 +344,66 @@ __efi64_mb2_start:
>          lea     .Lmb2_no_ih(%rip),%r15
>          jz      x86_32_switch
>  
> +        push    %rax
> +        push    %rcx
> +        push    %rdx
> +        push    %rsi
> +        push    %rdi
> +
> +        /* Merge lower half of EFI pagtables with upper half of Xen pagetables */
> +        mov     %cr3, %rsi
> +        lea     efi_l4_bootmap(%rip), %rdi
> +        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
> +        rep movsq
> +        lea     ((L4_PAGETABLE_ENTRIES / 2) * 8) + idle_pg_table(%rip), %rsi
> +        mov     $L4_PAGETABLE_ENTRIES / 2, %ecx
> +        rep movsq
> +
> +        /* Switch to merged pagetables */
> +        lea     efi_l4_bootmap(%rip), %rax
> +        mov     %rax, %cr3

While it may appear to work in some environments, I don't think we're allowed
to replace page tables prior to calling ExitBootServices(). IOW we may not
complain if somewhere this fails to work.

This also builds on the assumption that no new L4 entries would be made by
firmware, nor that it would put anything in the upper half of the L4 table.

> +        lea     __image_base__(%rip), %esi
> +
> +        /* Map Xen into the higher mappings using 2M superpages. */
> +        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX + sym_esi(_start), %eax

I'm surprised to see you put in place new RWX mappings, when the goal
supposedly is to get rid of any such.

> +        mov     $sym_offs(_start),   %ecx   /* %eax = PTE to write ^      */
> +        mov     $sym_offs(_end - 1), %edx
> +        shr     $L2_PAGETABLE_SHIFT, %ecx   /* %ecx = First slot to write */
> +        shr     $L2_PAGETABLE_SHIFT, %edx   /* %edx = Final slot to write */
> +
> +1:      mov     %eax, sym_offs(l2_xenmap)(%esi, %ecx, 8)
> +        add     $1, %ecx
> +        add     $1 << L2_PAGETABLE_SHIFT, %eax
> +
> +        cmp     %edx, %ecx
> +        jbe     1b
> +
> +        /*
> +         * Map Xen into the directmap (needed for early-boot pagetable
> +         * handling/walking), and identity map Xen into bootmap (needed for
> +         * the transition into long mode), using 2M superpages.
> +         */
> +        lea     sym_esi(_start), %ecx
> +        lea     -1 + sym_esi(_end), %edx
> +        lea     _PAGE_PSE + PAGE_HYPERVISOR_RWX(%ecx), %eax /* PTE to write. */
> +        shr     $L2_PAGETABLE_SHIFT, %ecx                   /* First slot to write. */
> +        shr     $L2_PAGETABLE_SHIFT, %edx                   /* Final slot to write. */
> +
> +1:      mov     %eax, sym_offs(l2_bootmap)  (%esi, %ecx, 8)
> +        mov     %eax, sym_offs(l2_directmap)(%esi, %ecx, 8)
> +        add     $1, %ecx
> +        add     $1 << L2_PAGETABLE_SHIFT, %eax
> +
> +        cmp     %edx, %ecx
> +        jbe     1b
> +
> +        pop     %rdi
> +        pop     %rsi
> +        pop     %rdx
> +        pop     %rcx
> +        pop     %rax
> +
>          /* Save Multiboot2 magic on the stack. */
>          push    %rax
>  
> @@ -354,8 +414,15 @@ __efi64_mb2_start:
>           * efi_multiboot2() is called according to System V AMD64 ABI:
>           *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
>           *          %rdx - MB2 cmdline
> +         *
> +         * Call via the high mappings
>           */
> -        call    efi_multiboot2
> +        lea     __image_base__(%rip), %r10
> +        lea     efi_multiboot2(%rip), %rax
> +        sub     %r10, %rax
> +        mov     $__XEN_VIRT_START, %r10
> +        addq    %r10, %rax
> +        call    *%rax

While with this you arrange for all %rip-relative addressing to result in
using the linked-at positions, static pointers requiring base relocations
will still point at the loaded-at locations. Things would get particularly
interesting if the difference of two such (dissimilar) pointers would then
be calculated.

Jan

