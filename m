Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F095EBB7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 10:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783358.1192677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUyb-0005jE-M3; Mon, 26 Aug 2024 08:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783358.1192677; Mon, 26 Aug 2024 08:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siUyb-0005gS-Ir; Mon, 26 Aug 2024 08:21:25 +0000
Received: by outflank-mailman (input) for mailman id 783358;
 Mon, 26 Aug 2024 08:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siUya-0005gM-Ey
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 08:21:24 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d47ce4f-6384-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 10:21:22 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so310678966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 01:21:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f29a4e0sm633318666b.58.2024.08.26.01.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 01:21:21 -0700 (PDT)
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
X-Inumbo-ID: 2d47ce4f-6384-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724660481; x=1725265281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JxSRI57/dbar7REbw2c2FcaNkJ+kScc0xmfODQhklvo=;
        b=ahLmoe3lVtl+005nmwbKIAumXdFFi9FfeaLN9X4gbgW+fwa1ipfP2oDyRYLlBKYVvD
         vmHtumXOLGieHkGc6gxcvdpGfsjgWnkIY9aCjob2b+t9wZ2KnALSzXb/PVftMhSDBGYc
         kZTkKUtY7t5OVUXb/wivOY8dx0W0HsigadOvdR0dgEM1OMkuYO3E0bk/R5N0vZvicNd3
         kKArwVqdVIy6ruVYVJeinb//KRSHD7BXBeiHLFq/T97SlIBTn64rV4EjLcZ1eZ+IO0WD
         PG6Fwg4StDXfg/TpVH0X/M3048TuSs1cWE4fUxkBKRsV4FD4kNV8dgha06vK1xyeLgEo
         Oq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660481; x=1725265281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxSRI57/dbar7REbw2c2FcaNkJ+kScc0xmfODQhklvo=;
        b=Rjyn2HNaf3ro/jhESw1KrupEAdYQjaEhaEJSFnrNWmJV0CD4w9qOnXS05pbukJTERX
         ONORLHzd1QIMMBVwF8f0aAEa2gBIWXbzOJzRopy4FyHiTJz2UAsFqsQyqqPv/R83wwFo
         rMAvAT+J3W1D9R/RgrDx/2+n5bZDG8okztp2Gmi8AkMuiS/5BGy585EYqImSWss3Bk/v
         KmBpB/2n5Dz75HtsaodbGfYKvlywVUB56qhgCbMONY9yePORa/anllAy4BH6RgdGkivq
         2cHJISh+9rG0CE0fNKC6wV02DOdaaQyj0jhptAuKAetzlC4RconW/1/oi9TpTaBbUyMx
         4hpw==
X-Forwarded-Encrypted: i=1; AJvYcCUqVSx3J2Mh6/BpD+rHamLn4zSU+jB4rEpAo3MOpDlq1RWZU9naBm60EXy5fMqmFs0DI9HeAXzSKGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxzAz8/Xxj/M2TUaBRkf6FeaajLsMPJ+Sl3NEpkYIm4OA4eemc
	7Z7RwI5Gp2L3HAMDX2SO1EmKDg+WCpT4izi+tpjm2533m1b26HoUcuV60ZTBhg==
X-Google-Smtp-Source: AGHT+IHVnv/pN3wjA1meTxPQ4YcECe/NmOQ16cCDdbt1spC4VxzQL60QkHhEkwVtvOYYFGT6x15dew==
X-Received: by 2002:a17:906:f59e:b0:a7a:9144:e23b with SMTP id a640c23a62f3a-a86a52b6124mr528268766b.19.1724660481335;
        Mon, 26 Aug 2024 01:21:21 -0700 (PDT)
Message-ID: <55e6dc6c-344a-4483-90c2-e414ef4bc869@suse.com>
Date: Mon, 26 Aug 2024 10:21:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Avoid additional relocations in trampoline code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240822152953.489136-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240822152953.489136-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2024 17:29, Frediano Ziglio wrote:
> The trampoline could have "manual" relocation entries (created
> by assembly macros and some code to use them) and (in case of PE)
> normal executable relocations.
> Remove all normal executable ones. In this way we don't have to
> worry about applying both correctly (they need proper order
> which is hard to spot looking at the code).
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

I think this wants splitting into one patch replacing sym_offs() and a
2nd one introducing the hand-crafted __XEN_VIRT_START additions (which
may want macro-izing). Plus the justification for the change wants
extending, to actually explain what the problem is - after all there's
no issue anywhere right now.

> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -73,7 +73,7 @@ trampoline_protmode_entry:
>          mov     %ecx,%cr4
>  
>          /* Load pagetable base register. */
> -        mov     $sym_offs(idle_pg_table),%eax
> +        mov     $idle_pg_table_pa, %eax
>          add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
>          mov     %eax,%cr3
>  
> @@ -113,7 +113,7 @@ trampoline_protmode_entry:
>          .code64
>  start64:
>          /* Jump to high mappings. */
> -        movabs  $__high_start, %rdi
> +        movabs  $__high_start_pa + __XEN_VIRT_START, %rdi
>          jmpq    *%rdi
>  
>  #include "video.h"
> --- a/xen/arch/x86/boot/wakeup.S
> +++ b/xen/arch/x86/boot/wakeup.S
> @@ -99,7 +99,7 @@ wakeup_32:
>          mov     $bootsym_rel(wakeup_stack, 4, %esp)
>  
>          # check saved magic again
> -        mov     $sym_offs(saved_magic),%eax
> +        mov     $saved_magic_pa, %eax
>          add     bootsym_rel(trampoline_xen_phys_start, 4, %eax)
>          mov     (%eax), %eax
>          cmp     $0x9abcdef0, %eax
> @@ -112,7 +112,7 @@ wakeup_32:
>          mov     %ecx, %cr4
>  
>          /* Load pagetable base register */
> -        mov     $sym_offs(idle_pg_table),%eax
> +        mov     $idle_pg_table_pa ,%eax
>          add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
>          mov     %eax,%cr3
>  
> @@ -156,7 +156,7 @@ wakeup_32:
>          .code64
>  wakeup_64:
>          /* Jump to high mappings and the higher-level wakeup code. */
> -        movabs  $s3_resume, %rbx
> +        movabs  $s3_resume_pa + __XEN_VIRT_START, %rbx
>          jmp     *%rbx
>  
>  bogus_saved_magic:

With the sym_offs() uses gone, I think it would be best if the macro was
#undef-ed ahead of the inclusion of trampoline.S. Since x86_64.S uses the
macro, that'll require careful re-arrangement of #include order.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -71,7 +71,12 @@ SECTIONS
>    __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
>  #endif
>  
> -  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
> +#define DEFINE_PA_ADDRESS(sym) sym ## _pa = ABSOLUTE(sym - __XEN_VIRT_START)
> +  DEFINE_PA_ADDRESS(start);
> +  DEFINE_PA_ADDRESS(saved_magic);
> +  DEFINE_PA_ADDRESS(idle_pg_table);
> +  DEFINE_PA_ADDRESS(__high_start);
> +  DEFINE_PA_ADDRESS(s3_resume);
>  
>    . = __XEN_VIRT_START + XEN_IMG_OFFSET;
>    _start = .;

For the cases where in assembly code you add __XEN_VIRT_START this is pretty
odd: You subtract the value here just to add it back there. Did you consider
a more straightforward approach, like introducing absolute xxx_va symbols?

Also, as a general request: Can you please become used to adding meaningful
subject prefixes to your patches?

Jan

