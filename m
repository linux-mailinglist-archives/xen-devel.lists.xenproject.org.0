Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3A6C3B58C
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 14:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156949.1485894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0HM-0004VN-72; Thu, 06 Nov 2025 13:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156949.1485894; Thu, 06 Nov 2025 13:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH0HM-0004TC-3u; Thu, 06 Nov 2025 13:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1156949;
 Thu, 06 Nov 2025 13:43:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vH0HL-0004R8-3I
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 13:43:55 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1fe539a-bb16-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 14:43:53 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63bea08a326so882720a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 05:43:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728964480esm211649766b.38.2025.11.06.05.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 05:43:52 -0800 (PST)
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
X-Inumbo-ID: a1fe539a-bb16-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762436632; x=1763041432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ig10tzCj2v0cij1uqORzajW9xoL4sM628AWRNL5jgIs=;
        b=OXy466KspyRvb162PwQ+csNnzVXiJ8jirfD7izOkhx1ceoK1UveNjNVFrui8kd5Ycq
         v54oRC52dWBan9Pn16Iz+3DJR3ou9kjLbhEm+24lSySeVyOlBj5iQnhqLd/BGDmTKF6q
         v6qunkAom/zXhIrefbYlBQXT3XCeFLrZQo0jFdf7OO0Y9yYkxAkMcDwgEeDVZ2dpa5WD
         vfMwq0//V9/dPla5/ITMSK4Ztx9kXgHgtxQLOJBE0y77nKszQ6azrWQLEccrbyeZF2A0
         eQhUqyntYg5Fbs4uxP9Qsp3fj01LgZXu99Z7mQgO6kvnAnWOVDMOrW0ztTyCyVfszy6P
         sYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762436632; x=1763041432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig10tzCj2v0cij1uqORzajW9xoL4sM628AWRNL5jgIs=;
        b=ffnA/q4G2gb0sWtFDhzws1AqCJjzOGuC+vlwN/loR02qfF+gtiu7LPu+i/FYvBSF4/
         ltU1dgBESTPynz+4u+FNlMSlEq8nvZeeZ+NljnTmTPWdeagYdDoHUzrt+Ykb+Tua+LP9
         gIM0PwzweuQfksBLMEbN1at1vBE6+W/Dk1MFUbRauZ8yhsp90EwUO9Am102c3Uwn2/em
         aSxtesWHaYMn/LOkquMe7f/8jMCyxUbko+4/Si3GS4MHJRVDLRLhuGqKc1nIt/Hw8HP9
         7VfqtwFDsLRp3HNn7WzG0CneLTanDXxXIgpxZwVHeIuDKfuJrp5StW36Jft6IhrQ0Dw5
         9j6A==
X-Forwarded-Encrypted: i=1; AJvYcCW+GoLVdC6iAR8sQW/H6eciB3UmKx5GD0RRry7huCmjPJ5ZMAjatLkffrTAMShpdlJSq7z8aJDOlfs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgw+atXvg+6yy81fNoqpF/5jQur6LERrfDrxxE3+VBDskKfVZF
	CbzXprjtCAaVlc6hdw3dFRPPJBIFKOT9j792BH+FGoOy21iUCJjoVztboFS8PcQbJw==
X-Gm-Gg: ASbGncuTlCGepDMVC9L9pvbUlZvW+44XzQqDZbXEwwEHsdS9VbDpt+ItY2DLwmZYyuj
	xoJlAU038bqgwZcbeN8TbFs938WE+9LV2TQVKXoXDf0WVu0Fa9OVFLs0QlYW+ZdRrRltZoHjobY
	wjgKCMJiXXhBejB4GcJmAwerTHPM6pTSoaYIqiTE9DgL8Fn9pZ9yE1RibqdsuQk8J8ohiFFynqQ
	IpHpymYk9j145tT8Lqun3lrjMvOeFycFgIUFfogo7Yh17q+s71AgUGA64fq1zLxlGEEOXqeZYTx
	BEyWcJ3LktsJgF9YYuaA3Oz/5zJX5MnDuxZL9KI8q73B43p6xdxNiBevCD0gP0qk4hfrEqOt9IY
	LBiu+PCR2XjS8QOn06YMG2MEzt3Pxr/+IaRwoCRBAwUi9LYScRif6yWBUJ+LysLFfTYFGUNGiez
	z/sBEaoZ/2qYtfSbfJCqhUi1wz+TH3VxyI28BY4W7PuTHLuP76UgPVM1YUPDT5cNdxKggq0b0=
X-Google-Smtp-Source: AGHT+IGkt6HsJkwAlJrlsbzw0lA9tXESGB2K/GiIvjNawo3xTTc7fIpwQbbWVe+aLzUStfb/N2zEBw==
X-Received: by 2002:a17:907:701:b0:b41:4e72:309f with SMTP id a640c23a62f3a-b726559ec17mr749081966b.50.1762436632342;
        Thu, 06 Nov 2025 05:43:52 -0800 (PST)
Message-ID: <8b204b21-80fb-408d-972e-8f183eb45dfc@suse.com>
Date: Thu, 6 Nov 2025 14:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 01/18] xen/riscv: detect and initialize G-stage mode
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2b21348b3300c741b276a47d5942e71d306846eb.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> Changes in V5:
>  - Add static and __initconst for local variable modes[] in
>    gstage_mode_detect().
>  - Change type for gstage_mode from 'unsigned long' to 'unsigned char'.
>  - Update the comment inisde defintion if modes[] variable in
>    gstage_mode_detect():
>    - Add information about Bare mode.
>    - Drop "a paged virtual-memory scheme described in Section 10.3" as it isn't
>      relevant here.
>  - Drop printing of function name when chosen G-stage mode message is printed.
>  - Drop the call of gstage_mode_detect() from start_xen(). It will be added into
>    p2m_init() when the latter will be introduced.

Well, thanks, but ...

>  - Introduce pre_gstage_init().

... the same comment that I gave before now applies here: This doesn't look to
belong directly in start_xen(). In x86'es terms I'd say this is a tiny part of
paging_init().

> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -7,6 +7,7 @@ obj-y += intc.o
>  obj-y += irq.o
>  obj-y += mm.o
>  obj-y += pt.o
> +obj-y += p2m.o

Nit: Please keep things sorted (numbers sort before letters).

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -6,6 +6,8 @@
>  
>  #include <asm/page-bits.h>
>  
> +extern unsigned char gstage_mode;

Better move down some, at the very least ...

>  #define paddr_bits PADDR_BITS

... past more fundamental #define-s?

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -131,13 +131,16 @@
>  #define HGATP_MODE_SV32X4		_UL(1)
>  #define HGATP_MODE_SV39X4		_UL(8)
>  #define HGATP_MODE_SV48X4		_UL(9)
> +#define HGATP_MODE_SV57X4		_UL(10)
>  
>  #define HGATP32_MODE_SHIFT		31
> +#define HGATP32_MODE_MASK		_UL(0x80000000)

Please can we avoid redundant (and then not even connected) #define-s? I
don't see why you would need HGATP32_MODE_SHIFT when you have
HGATP32_MODE_MASK. Similarly ...

>  #define HGATP32_VMID_SHIFT		22
>  #define HGATP32_VMID_MASK		_UL(0x1FC00000)

... here, while ...

>  #define HGATP32_PPN			_UL(0x003FFFFF)

... here the constant isn't even suffixed with _MASK.

> --- /dev/null
> +++ b/xen/arch/riscv/p2m.c
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/macros.h>
> +#include <xen/sections.h>
> +
> +#include <asm/csr.h>
> +#include <asm/flushtlb.h>
> +#include <asm/riscv_encoding.h>
> +
> +unsigned char __ro_after_init gstage_mode;
> +
> +static void __init gstage_mode_detect(void)
> +{
> +    static const struct {
> +        unsigned char mode;
> +        unsigned int paging_levels;
> +        const char name[8];
> +    } modes[] __initconst = {
> +        /*
> +         * Based on the RISC-V spec:
> +         *   Bare mode is always supported, regardless of SXLEN.
> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32.
> +         *   When SXLEN=64, three paged virtual-memory schemes are defined:
> +         *   Sv39, Sv48, and Sv57.
> +         */
> +#ifdef CONFIG_RISCV_32
> +        { HGATP_MODE_SV32X4, 2, "Sv32x4" }
> +#else
> +        { HGATP_MODE_SV39X4, 3, "Sv39x4" },
> +        { HGATP_MODE_SV48X4, 4, "Sv48x4" },
> +        { HGATP_MODE_SV57X4, 5, "Sv57x4" },
> +#endif
> +    };
> +
> +    unsigned int mode_idx;
> +
> +    gstage_mode = HGATP_MODE_OFF;

Why is this not the variable's initializer?

> +    for ( mode_idx = 0; mode_idx < ARRAY_SIZE(modes); mode_idx++ )
> +    {
> +        unsigned long mode = modes[mode_idx].mode;
> +
> +        csr_write(CSR_HGATP, MASK_INSR(mode, HGATP_MODE_MASK));
> +
> +        if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
> +        {
> +            gstage_mode = mode;
> +            break;
> +        }
> +    }

I take it that using the first available mode is only transient. To support bigger
guests, you may need to pick 48x4 or even 57x4 no matter that 39x4 is available.
I wonder whether you wouldn't be better off recording all supported modes right
away.

Jan

