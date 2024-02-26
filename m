Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD522866C16
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685305.1065799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWJD-0002A0-AB; Mon, 26 Feb 2024 08:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685305.1065799; Mon, 26 Feb 2024 08:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWJD-00028U-7Y; Mon, 26 Feb 2024 08:25:59 +0000
Received: by outflank-mailman (input) for mailman id 685305;
 Mon, 26 Feb 2024 08:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWJC-00028K-8H
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:25:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a98e9f3f-d480-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 09:25:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso432353266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:25:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i19-20020a17090639d300b00a3f81200425sm2166049eje.122.2024.02.26.00.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:25:55 -0800 (PST)
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
X-Inumbo-ID: a98e9f3f-d480-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708935956; x=1709540756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUeYrdWPS0lIWnR9EDneERJUkpPmXqsRbAsuMqSX10c=;
        b=T/J64ZbnBGqi2XZfnsELPtYymXPjIWdQLnArSUNRJAXdsdMm6hxmOaoif37kzvi5wO
         /HOONfGxziMvn0flDE2UcZcq6v/ME+n8UtFZ+XQOOwKQfC0/i7FPi0mP+Sf8mMmcgCU3
         XXxltb3m0ppZ0ilPTbm19d+/t1hq1a2CwujWJOq8mKbJdB10CoocZO8p1nO4VcY1DR+g
         eWTi4iplfrE8IZVsmAaqdEBGbCobfP7Mt535Vak+PhrTdUeUWo6nOeWnbwGJM63PdscY
         omNo/Is/f2bWaqVGIHs1BNTUlQnY0XyTjyjrkG6nP8uZNd1IAVKrQX015zuPIFX9qTPb
         Hpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935956; x=1709540756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUeYrdWPS0lIWnR9EDneERJUkpPmXqsRbAsuMqSX10c=;
        b=NgZvlWIRWQ4yGwHZqXIhU79GAP5QjHAogoyX//Sdr/Rkz+gUe3FQWWEf00qT4ncm1H
         GBpbyR1+bKaUzW7g/l1HGitBUlkTNj8xnQd5IBuicVGZwK1Pdt9Rqxa5InI1T/tAxdM6
         /OGHxY2kF2JvcK8dW+mo3lvEvIjXPNHUWd7Z8X/CAamdv0I4s811Y2CHxg4I0oCj3XiA
         /vTBOS+CnHpc3C6nYWH0A4M2wD+VkNqX9jkwEXc8gltNFbGNIyG6DdqtsfL87TzQjV9a
         nC+l9RmKUYRJQVKPtXWq4cJc5Ft7DpYq6bg2QxFymyY4plFw6r8HBr8hrTB5EZXV4zI/
         WEsA==
X-Forwarded-Encrypted: i=1; AJvYcCX6UenN7Mj1NBoIKyMDUk3H8+y3InOVRnDZ/MUMN8FY2hA7AFj5rHcfuIy8G+FCql7zqPqxqdnN9SRC1AwZ02s/djHrJEB+S17TgGaV5iU=
X-Gm-Message-State: AOJu0YyDlB4zI/H1itJtUL3yjH5olSKr/1bBv7ri1kGSwESfCYhUY/7+
	MJqUaPnvgxAA62egQIUcUTM+XlUQpP7rLsVLxBmEuIHd6QvLH4v29dYYiqOmXw==
X-Google-Smtp-Source: AGHT+IGqtR6wy19YcGHLZpETATECuDGQuxEVIsnI6MUKjSanaFGrayR4faxLNXT73ARQHZypG66wPg==
X-Received: by 2002:a17:906:e298:b0:a42:f0b6:c2f1 with SMTP id gg24-20020a170906e29800b00a42f0b6c2f1mr4819760ejb.28.1708935955728;
        Mon, 26 Feb 2024 00:25:55 -0800 (PST)
Message-ID: <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
Date: Mon, 26 Feb 2024 09:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
 xen-devel@lists.xenproject.org
References: <20240226011935.169462-1-xin.wang2@amd.com>
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
In-Reply-To: <20240226011935.169462-1-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 02:19, Henry Wang wrote:
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -428,6 +428,19 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
>      } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
>  }
>  
> +#define MAGIC_PAGE_N_GPFN(n)     ((GUEST_MAGIC_BASE >> PAGE_SHIFT) + n)
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    unsigned int i;
> +    for ( i = 0; i < NR_MAGIC_PAGES; i++ )

Nit: Blank line please between declaration(s) and statement(s).

> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -256,4 +256,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return true;
>  }
>  
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}
> +
>  #endif /* _ASM_PPC_MM_H */
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,6 +3,7 @@
>  #ifndef _ASM_RISCV_MM_H
>  #define _ASM_RISCV_MM_H
>  
> +#include <public/xen.h>
>  #include <asm/page-bits.h>
>  
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
> @@ -20,4 +21,9 @@ unsigned long calc_phys_offset(void);
>  
>  void turn_on_mmu(unsigned long ra);
>  
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}
> +
>  #endif /* _ASM_RISCV_MM_H */
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -628,4 +628,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return (mfn + nr) <= (virt_to_mfn(eva - 1) + 1);
>  }
>  
> +static inline bool is_magic_gpfn(xen_pfn_t gpfn)
> +{
> +    return false;
> +}

I don't think every arch should need to gain such a dummy function. Plus
the function name doesn't clarify at all what kind of "magic" this is
about. Plus I think the (being phased out) term "gpfn" would better not
be used in new functions anymore. Instead type-safe gfn_t would likely
better be used as parameter type.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>          }
>          else
>          {
> -            if ( is_domain_direct_mapped(d) )
> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>              {
>                  mfn = _mfn(gpfn);
>  

I wonder whether is_domain_direct_mapped() shouldn't either be cloned
into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
such a (then optional) 2nd parameter. (Of course there again shouldn't be
a need for every domain to define a stub is_domain_direct_mapped() - if
not defined by an arch header, the stub can be supplied in a single
central place.)

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -476,6 +476,12 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
>  #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
>  
> +#define NR_MAGIC_PAGES 4
> +#define CONSOLE_PFN_OFFSET 0
> +#define XENSTORE_PFN_OFFSET 1
> +#define MEMACCESS_PFN_OFFSET 2
> +#define VUART_PFN_OFFSET 3
> +
>  #define GUEST_RAM_BANKS   2

Of these only NR_MAGIC_PAGES is really used in Xen, afaics.

Also while this is added to a tools-only section, I'm also concerned of
the ongoing additions here without suitable XEN_ prefixes. Any number
of kinds of magic pages may exist for other reasons in a platform; which
ones are meant would therefore better be sufficiently clear from the
identifier used.

Jan

