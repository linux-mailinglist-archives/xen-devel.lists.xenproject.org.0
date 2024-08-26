Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B995F264
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 15:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783467.1192803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siZRR-0000jo-Rn; Mon, 26 Aug 2024 13:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783467.1192803; Mon, 26 Aug 2024 13:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siZRR-0000hF-OS; Mon, 26 Aug 2024 13:07:29 +0000
Received: by outflank-mailman (input) for mailman id 783467;
 Mon, 26 Aug 2024 13:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siZRQ-0000h7-VS
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 13:07:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b17f0a-63ac-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 15:07:27 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53345dcd377so5426177e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 06:07:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4360e7sm660561066b.123.2024.08.26.06.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 06:07:26 -0700 (PDT)
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
X-Inumbo-ID: 24b17f0a-63ac-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724677647; x=1725282447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R7zH0p5To41HaXQsL9JKFBkLYk67deeIbjqF+2DF2Zw=;
        b=UblDZIYO53GgnJebU7xL7aQsTWBuk2SIsw39aGHNqvY81ET2g1xXQq9AcMKkJ4i3Es
         eMnzUXuKEm52qt1mYvwwlspcAmCmwuXLl2hhB5dV2PY1q0HGUe92vy7qVmamYEg15w3z
         0jUwuLWMEu6QcNx35k/Af+3Y3s4EI9ZuQaybhRNFGY899c6iDPhFF+xA6DZKFjTbFNYR
         zuwj7tVRtkBrswWT/PoRSf/5VtL0Xw7iYZj1Kfv0NpUlRymBBUqqnfXqy+cnR4qB7Zko
         lPr4GgrXgfe/mzhC+IWZ7LySJZUBhp0BzQtBOwAPgydMKmtmJDcry9mEOf1DJqSfDYQn
         f2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724677647; x=1725282447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7zH0p5To41HaXQsL9JKFBkLYk67deeIbjqF+2DF2Zw=;
        b=gPJVMjYmmPBnsJ851lBDIzXu2LJUasQmgU2i5nDBrZmzgKzhF2cNuLGUR4BLfJ8O3M
         MsyfqYEI1sj2R7fz0H1ViQ9tDXJ/SZ+JnaZPdHlwLFtzhignYPn8UIMM31wQNE77qjTm
         XZ1agHEb/t3GHKvPvojzTj2skhJ9V1QZGls/wi4gbvXmArDKD33kKjF6pUmUF49XLMYZ
         Pz12gkA889Qz+9PjtbCwx0rtdRj6pUpJyGACFlgpWiho9ZjDe4K4wlA0Y6vz01CpcWqb
         ZNq3XqdqUDYNUACDvzq5vZYhjg/lB1Hnyix2GZPXXQsN037/5CP4tkLaERhC4cnCfx+7
         c4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCAQPUw3D12Jc4mc8dRnxZ8Uf33eSkMxIbntxOQBkHc4I6ky4pfZ+74DA6o1+V3aLCzEKP3BCduVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyR4jw0f6eeWSQCoVY1j3e9V4JtHMbXhDHBEvEMqsYtEVP76tP
	qETO4v/7hkSzOau/WJdOsvfnRa+qwKKYItTC74zBqN93HeEsJidW9Ds4tggfYQ==
X-Google-Smtp-Source: AGHT+IFlydMbfDXf5rBjQuuX6/0xL2LwR6G8WQX+1iuWn+dDJVowRAGn5wQ8j+h27jKp3wnuHNH1Rg==
X-Received: by 2002:a05:6512:234b:b0:533:40dc:823e with SMTP id 2adb3069b0e04-534387bb4a6mr7341187e87.48.1724677646597;
        Mon, 26 Aug 2024 06:07:26 -0700 (PDT)
Message-ID: <03febf18-516b-4677-a0a5-102036c91a29@suse.com>
Date: Mon, 26 Aug 2024 15:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-10-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> A few RFC points.
> 
>  * I throught we had an x86 general lib-y but I can't find one, hence why it's
>    still in xen/lib/ for now.

We indeed have nothing like that yet. The file name should then imo not be
arch-* though, but x86-*. Or you could put it in xen/lib/x86/. It could even
be obj-y rather than lib-y, unless you expect we'll be able to get rid of
all uses, which seems unlikely at least due to bitmap_weight(). Otoh with
my ABI-level series the call site in arch_hweightl() could then be made go
away for v2 and above, at which point it living in lib-y will be preferable.

>  * When we up the minimum toolchain to GCC 7 / Clang 5, we can use a
>    __attribute__((no_caller_saved_registers)) and can forgo writing this in asm.
> 
>    GCC seems to need extra help, and wants -mgeneral-regs-only too.  It has a
>    habit of complaining about incompatible instructions even when it's not
>    emitting them.

What is this part about? What incompatible instructions, in particular?

> @@ -475,4 +476,24 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>  }
>  #define arch_flsl arch_flsl
>  
> +static always_inline unsigned int arch_hweightl(unsigned long x)
> +{
> +    unsigned int r;
> +
> +    /*
> +     * arch_generic_hweightl() is written in ASM in order to preserve all
> +     * registers, as the compiler can't see the call.
> +     *
> +     * This limits the POPCNT instruction to using the same ABI as a function
> +     * call (input in %rdi, output in %eax) but that's fine.
> +     */
> +    alternative_io("call arch_generic_hweightl",
> +                   "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
> +                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
> +                   [val] "D" (x));

If you made [val] an output ("+D") you could avoid preserving the register
in the function. And I'd expect the register wouldn't be re-used often
afterwards, so its clobbering likely won't harm code quality very much.

> --- /dev/null
> +++ b/xen/lib/arch-generic-hweightl.S
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +        .file __FILE__
> +
> +#include <xen/linkage.h>
> +
> +/*
> + * An implementation of generic_hweightl() used on hardware without the POPCNT
> + * instruction.
> + *
> + * This function is called from within an ALTERNATIVE in arch_hweightl().
> + * i.e. behind the back of the compiler.  Therefore all registers are callee
> + * preserved.
> + *
> + * The ASM is what GCC-12 emits for generic_hweightl() in a release build of
> + * Xen, with spilling of %rdi/%rdx to preserve the callers registers.
> + */
> +FUNC(arch_generic_hweightl)
> +        push   %rdi
> +        push   %rdx
> +
> +        movabs $0x5555555555555555, %rdx
> +        mov    %rdi, %rax
> +        shr    $1, %rax
> +        and    %rdx, %rax
> +        sub    %rax, %rdi
> +        movabs $0x3333333333333333, %rax
> +        mov    %rdi, %rdx
> +        shr    $0x2, %rdi

Could I talk you into omitting the 0x here and ...

> +        and    %rax, %rdx
> +        and    %rax, %rdi
> +        add    %rdi, %rdx
> +        mov    %rdx, %rax
> +        shr    $0x4, %rax

... here, and maybe use ...

> +        add    %rdx, %rax
> +        movabs $0xf0f0f0f0f0f0f0f, %rdx
> +        and    %rdx, %rax
> +        movabs $0x101010101010101, %rdx
> +        imul   %rdx, %rax
> +        shr    $0x38, %rax

... 56 here (or even BITS_PER_LONG-8)?

Jan

