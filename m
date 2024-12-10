Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D069EAE22
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:38:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852046.1265969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxdP-0002LQ-M2; Tue, 10 Dec 2024 10:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852046.1265969; Tue, 10 Dec 2024 10:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxdP-0002Ib-Ie; Tue, 10 Dec 2024 10:38:31 +0000
Received: by outflank-mailman (input) for mailman id 852046;
 Tue, 10 Dec 2024 10:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKxdO-00022t-If
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:38:30 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b6c95e-b6e2-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 11:38:28 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so35614645e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 02:38:29 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434fb9bf04esm52959495e9.26.2024.12.10.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 02:38:28 -0800 (PST)
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
X-Inumbo-ID: e4b6c95e-b6e2-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733827108; x=1734431908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OcNfAuYKkkJ781yY56TSb+Ua7bh73KAS+xQSN/RbB1g=;
        b=dL6TFSYOpE6nPxoK/RmkYRLF/pjYelXyjj9hkypCsWpD0YVfF4BX7DOE9tnPC2q2DG
         f2JtBmccOIdkQO+XzcBRRxTcVr5tJtOz6PC9YNNWmghZJxMzvaFMyjPjD/APnmeFqBrJ
         YuG1qgQzYqnV7O5paQ1pZC3aFZg8b6Pd/VYMBg/SA5DGjyRLDRMUn9rlYdeCiG7SAaDn
         J6yeCnjCT+jMtV9r7lOXiyqR6MGIz1vhU9um1OBAddsJ6OAZPJBev3QGJV72BsXPq7yA
         zSqC3w7RscEM3onWG09t9Ijvfg4oj6x/Cfd3N4OkfXGH/S9cPgnCFt8TSoMCT981PMIY
         VAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827108; x=1734431908;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcNfAuYKkkJ781yY56TSb+Ua7bh73KAS+xQSN/RbB1g=;
        b=Lt1eb/zdmpHLbN+6DhgNPOUQq798Uc/XQEuQK27UAQCwlvJy3KovQHNbDM+MfW0ghE
         zsZSi9oX2cKb6SIurFOrbN4PSDVInxS5c/2ryL9UJBRl8ONw1hRMDkah2fBzwH/Besey
         4epyAddhmy4h8TxW/dojhfkkV41n1D5VDKqxUnXHS+zvpq3yqaKFO8G734d7k7gwCWDM
         imcoZV39O7cboskoZj9/dR0NhF0dLUUZHnYleDh4p2V4bA8YTvq8u5RAWlq/l4nh8kUu
         HGbZqYOkR/VRV/mTUZYG15D1D6I7CMq3HsAH36wrwv5tTf2TjHT9vISw4qW9zUZgnUgv
         bzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUxylW9SrCcueSkG/opCOFv9b0i2YYZUftQwgFJ1Z8BVeBvD56FUVi4G+AjZeH05TBbmmNvN2SVMEI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRx7mZZ2y77Qbyq/6zGsbShJPVZxw/XKAybIZ7Q0BizsEQAw1d
	vPwiaM+3yCBNXT1uwTbV+pMAc+SFY53QfXm6W5REu2Mx87kInrQqSiwMvamYuAqPaQfCOpt0ekY
	=
X-Gm-Gg: ASbGncu1UoSRWfgXNEn3Vh6J2p8IOpcyUfTH4RLhX39oIXCsmcbREbJAcaWXcvk75gC
	XGwf9n2MEnWazBdWxjFQ6XWxwvpXNqnL0T/VBOGAQATRmyH5sUSQwyiG+2ygRVPPxo7lOJ82Pnq
	q+Fq1UG/fJDS60r6vC64i1NtE5Uum93+kV7+h8gnyeYkF8t8CnwdRN2zUWhliFxi+ZBXUJZB2a9
	LJl1fj+MBtRorWcPEz9+n2398P/cGr4vy3qjO7AZzCW7C1MQdhBXTxyhsNwCqI3RS7ZmYb8NyP0
	wLEYMcH1zQVp/gyDUwDXNiyA8KHF5FhI1sjm1QbbLh+2xj9mBQ/alirdXkkaPVbUCm0toDJsP+6
	EZdS5+tu6wQ==
X-Google-Smtp-Source: AGHT+IHb1waYUOD+i+h023do9krN08k5i7QI04vnesyxgIZpfZIwnQsjaIjo+W1Wb1e7mmu0YWs8Mw==
X-Received: by 2002:a05:600c:1e87:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-434fffc6caamr37350475e9.31.1733827108359;
        Tue, 10 Dec 2024 02:38:28 -0800 (PST)
Message-ID: <d5b856b5-ba0d-489b-9107-7c16b4042c55@suse.com>
Date: Tue, 10 Dec 2024 11:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/boot: Move some settings to C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-4-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241122093358.478774-4-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.11.2024 10:33, Frediano Ziglio wrote:
> Initialise multiboot_ptr and pvh_start_info_pa from C code.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/build32.lds.S           |  3 +++
>  xen/arch/x86/boot/head.S                  | 10 --------
>  xen/arch/x86/boot/reloc.c                 | 28 ++++++++++++++++++-----
>  xen/arch/x86/include/asm/guest/pvh-boot.h |  1 +
>  4 files changed, 26 insertions(+), 16 deletions(-)

From the diffstat alone - is this really a win?

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -517,16 +517,6 @@ trampoline_setup:
>          /*      reloc(magic/eax, info/edx) using fastcall. */
>          call    reloc
>  
> -#ifdef CONFIG_PVH_GUEST
> -        cmpb    $0, sym_esi(pvh_boot)
> -        je      1f
> -        mov     %eax, sym_esi(pvh_start_info_pa)
> -        jmp     2f
> -#endif
> -1:
> -        mov     %eax, sym_esi(multiboot_ptr)
> -2:
> -
>          /* Interrogate CPU extended features via CPUID. */
>          mov     $1, %eax
>          cpuid
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -17,13 +17,15 @@
>  #include <xen/types.h>
>  
>  #include <xen/kconfig.h>
> -#include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
>  #include <xen/page-size.h>
> +#include <xen/bug.h>
>  
>  #include <asm/trampoline.h>
> +#include <asm/setup.h>
>  
>  #include <public/arch-x86/hvm/start_info.h>
> +#include <asm/guest/pvh-boot.h>
>  
>  #ifdef CONFIG_VIDEO
>  # include "video.h"
> @@ -347,27 +349,41 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
>  }
>  
>  /* SAF-1-safe */
> -void *reloc(uint32_t magic, uint32_t in)
> +void reloc(uint32_t magic, uint32_t in)
>  {
>      memctx ctx = { trampoline_phys + TRAMPOLINE_HEAP_END };
>  
> +    void *res;
> +

Nit: Please avoid blank lines between declarations unless the set of locals
is huge, or some really need to stand out.

>      switch ( magic )
>      {
>      case MULTIBOOT_BOOTLOADER_MAGIC:
> -        return mbi_reloc(in, &ctx);
> +        res = mbi_reloc(in, &ctx);
> +        break;
>  
>      case MULTIBOOT2_BOOTLOADER_MAGIC:
> -        return mbi2_reloc(in, &ctx);
> +        res = mbi2_reloc(in, &ctx);
> +        break;
>  
>      case XEN_HVM_START_MAGIC_VALUE:
>          if ( IS_ENABLED(CONFIG_PVH_GUEST) )
> -            return pvh_info_reloc(in, &ctx);
> +        {
> +            res = pvh_info_reloc(in, &ctx);
> +            break;
> +        }
>          /* Fallthrough */
>  
>      default:
>          /* Nothing we can do */
> -        return NULL;
> +        res = NULL;

Simply keep returning here? No need to write the NULL when the variables
start out zeroed?

>      }
> +
> +#ifdef CONFIG_PVH_GUEST
> +    if ( pvh_boot )
> +        pvh_start_info_pa = (unsigned long)res;
> +#endif
> +
> +    multiboot_ptr = (unsigned long)res;

In the assembly original this is an "else" to the if().

Jan

