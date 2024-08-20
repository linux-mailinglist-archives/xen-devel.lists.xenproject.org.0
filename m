Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C03E9580DB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780155.1189787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK9g-0003n7-RX; Tue, 20 Aug 2024 08:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780155.1189787; Tue, 20 Aug 2024 08:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgK9g-0003lU-Nj; Tue, 20 Aug 2024 08:23:52 +0000
Received: by outflank-mailman (input) for mailman id 780155;
 Tue, 20 Aug 2024 08:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgK9f-0003lO-0k
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:23:51 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8694954f-5ecd-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 10:23:49 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so582858666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 01:23:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfb53sm726564566b.79.2024.08.20.01.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 01:23:48 -0700 (PDT)
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
X-Inumbo-ID: 8694954f-5ecd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724142229; x=1724747029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7WpmPY1Z9c6A7wRbZvB7T5fS4HEEC46M0iWedMztVgY=;
        b=aRyZzsN5Z5IED6rEFfsMtzMq+EHGKd+EDAv68TngYfkl6fCTLIejaSC89L5UyDR0Ub
         bZgfzineb3XkBkbknGhmphBVdgkh9jrtflQ/f/Jc6OH0ZDbHCvWo5XR8WdAx5AxZOe/5
         YVcwIJYOs1d1Jbcc6gp6XC6lY+8Sb+d4EnmwDwaHpvXWQI6VTjt6g+37p6PIa9wQyXEQ
         v+s6SSd0b1tn34A/Au3hmCR70Lm+NgjuZdNB1XMZIe/NAvqeLfx2cI1jhJ9JK84/NJPu
         9xGaCLIcQhDjUF2OOYrJyiAPgWd4KOpiYlZAG6rAtQnCIBeaqSQQQWqlbBzJHfJqce80
         B/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142229; x=1724747029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WpmPY1Z9c6A7wRbZvB7T5fS4HEEC46M0iWedMztVgY=;
        b=DxzZ/x9gJuRiKQrTs69/ws0xIAhG0SnjYno6heBAkE75mP3v6uMjoAgFfFEIejMqhl
         N8NPJb/A6IVJ2/rrO7xMtry5Av8upRmtacsekRlBDUrrpnO7BuCG0mjwJjeG/zTmqHf7
         E15LTnan/ESBoWyfEcXMzIgf+capoiK6Sk9eQL82ipg3e+0X62STiZaAiXTW5vCvgG49
         vtR/YyQNOyLLubsJOW4+kU+YVrV9t760j/EtV5KbbSdU1XTeRD/T679fE//9TiAsF3nW
         jUb5Jql6lr9MEQ9zVr1CzMQFva//zCaQGXu+hqBq7sTZvdY6wEwJfs23wm85+EAt51Rm
         uFFg==
X-Forwarded-Encrypted: i=1; AJvYcCUyIf+G1wUOHuP4J5tNdV5nd1O4C0tckvAnssxBJpzdomQKPXQ02esgIGyk1nJLwF4qNHQ/NdCDTEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIJSbGig5/D7X7EfWa8MLuHYm1IhR7pnPG0GHpzL2dr/iOYMke
	Dz70lwVka9A2otQp+ksbravQ8OKXx8McmTpbU0xGTAPeCQf9TysiR0QFABAyFQ==
X-Google-Smtp-Source: AGHT+IEjyfwzXic/hewZa+0bJ5yvG551Lc1J9WjzGhweV2Kd5Tc/N/VoteigRMJK77QpHWDdkicO/g==
X-Received: by 2002:a17:907:2d88:b0:a7a:c083:8579 with SMTP id a640c23a62f3a-a8392a4b2e0mr974562966b.62.1724142228452;
        Tue, 20 Aug 2024 01:23:48 -0700 (PDT)
Message-ID: <bea70201-55d3-45ed-8f71-65987dd67740@suse.com>
Date: Tue, 20 Aug 2024 10:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86: Force proper gdt_boot_base setting
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
 <20240814083428.3012-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240814083428.3012-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 10:34, Frediano Ziglio wrote:
> Instead of relocate the value at that position compute it
> entirely and write it.
> During EFI boots sym_offs(SYMBOL) are potentially relocated
> causing the values to be corrupted.

This requires quite a bit more explanation, also to understand why a
lone specific sym_offs() is being dealt with here, leaving others
untouched. I'm specifically puzzled by the two in the MB2 header: If
the GDT one is a problem, why would those not be? Of course similarly
for others, in particular those used to pre-fill page tables. I think
an adjustment here needs to come with the addition of a comment next
to the #define, to clarify where the use is appropriate and where it
needs to be avoided.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -132,8 +132,7 @@ multiboot2_header:
>  gdt_boot_descr:
>          .word   .Ltrampoline_gdt_end - trampoline_gdt - 1
>  gdt_boot_base:
> -        .long   sym_offs(trampoline_gdt)
> -        .long   0 /* Needed for 64-bit lgdt */
> +        .quad   0 /* Needed for 64-bit lgdt */

The comment is now somewhat odd: It's no longer the entire line that's
there just because we want to use LGDT from 64-bit code, but just half
of what the .quad produces. Therefore perhaps either keep as two longs
(maybe with a different brief comment put on the former), or adjust
the comment wording.

> @@ -373,15 +372,16 @@ __efi64_mb2_start:
>  x86_32_switch:
>          mov     %r15,%rdi
>  
> -        /* Store Xen image load base address in place accessible for 32-bit code. */
> -        lea     __image_base__(%rip),%esi
> -
>          cli
>  
>          /* Initialize GDTR. */
> -        add     %esi,gdt_boot_base(%rip)
> +        lea     trampoline_gdt(%rip), %esi
> +        mov     %esi, gdt_boot_base(%rip)
>          lgdt    gdt_boot_descr(%rip)
>  
> +        /* Store Xen image load base address in place accessible for 32-bit code. */
> +        lea     __image_base__(%rip),%esi

What's the point in moving this code? Surely you could use another
register for the LEA/MOV pair above? In any event - _if_ you move
the code, please also add the blank missing after the comma.

> @@ -439,7 +439,8 @@ __pvh_start:
>          movb    $-1, sym_esi(opt_console_xen)
>  
>          /* Prepare gdt and segments */
> -        add     %esi, sym_esi(gdt_boot_base)
> +        lea     sym_esi(trampoline_gdt), %ecx
> +        mov     %ecx, sym_esi(gdt_boot_base)
>          lgdt    sym_esi(gdt_boot_descr)
>  
>          mov     $BOOT_DS, %ecx
> @@ -543,7 +544,8 @@ trampoline_bios_setup:
>           *
>           * Initialize GDTR and basic data segments.
>           */
> -        add     %esi,sym_esi(gdt_boot_base)
> +        lea     sym_esi(trampoline_gdt), %ecx
> +        mov     %ecx, sym_esi(gdt_boot_base)
>          lgdt    sym_esi(gdt_boot_descr)
>  
>          mov     $BOOT_DS,%ecx

While you mention that you make these changes for consistency, I'm
afraid I don't really see the point. The paths are all different
anyway - there's nothing wrong with leaving everything except
x86_32_switch untouched. Far less code churn then. All it would take
is extending the comment there a little to mention why the value is
fully overwritten rather than merely adjusted.

Jan

