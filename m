Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA39B0D9F1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:44:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052607.1421343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCLu-000712-9B; Tue, 22 Jul 2025 12:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052607.1421343; Tue, 22 Jul 2025 12:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCLu-0006zS-66; Tue, 22 Jul 2025 12:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1052607;
 Tue, 22 Jul 2025 12:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueCLt-0006zK-0z
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:44:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 914368e4-66f9-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:44:12 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3124353f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:44:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef157sm75326345ad.190.2025.07.22.05.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:44:10 -0700 (PDT)
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
X-Inumbo-ID: 914368e4-66f9-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753188251; x=1753793051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L175Cn6Jkx0ge0NANgvJ8/QPc4JND6+FpAfTcat7my4=;
        b=ATBRDE2f1sIX4ueh9U54t1Yqa7HKsCrOEJmWxcPgeYHEqostjNrQSUW1cJcPz+UPic
         4/qG08RY1UUcCxktozDpPOiOzUkyAbE1Gpei0CynGNzhcZwP5WRseOBKAhdcZmnAQnRF
         Fk3sTYgF4SJo/MYmvWyLYFHbw1T746S8iiuv7LKUm7HX8fc6bcGAuTBMhg/alR/rdFGd
         /Dbg6qgsUz3THdVi7M8ZExAzsQ35UD5QKgpe+nc1mdXUIFanHdC/PoTEL5mYN/wiXdkg
         yKGWKgzaxnBZT9FP0dMCqH9GO+qaqxMlGi0482M2WZf0K2K74erR0B3PI+yUYlx7+E1r
         GzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753188251; x=1753793051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L175Cn6Jkx0ge0NANgvJ8/QPc4JND6+FpAfTcat7my4=;
        b=KJCYum4FPLlORy8CmXMzVRXtEWEhLM0f77aUb3L8WDEvpVBJRtZZ8pWeQ4gaYkqG7C
         ORWTEvPyigkIzKjpzCRv7qyemoN0CPUvXpSoCHMiOTIdg0V9XZJr/bSnv40fjtMhSQKD
         zlFpiCcF7WLKfYUk6tA6HU6m21LFrjO0bb09V5jSxIeieQjykfXZdwdSOlvpqyPqXRbn
         LGVV3Y3hYHU3Ck606o0A5Upv6lis9BdHOj1akPsC9c3CBx0Uy7A+4PXud6gIKnwWD+5R
         TseP06jWiPiSxDLWvHgGPxDqrxYtqqL28VNva+7176nT2YNFxkkM/fB+f27GPvARr1Xp
         n6gA==
X-Forwarded-Encrypted: i=1; AJvYcCXukg82KdvOpLt6Ca3BUEuxhZy+n6edl3QczXK+IwppeesMk0bgmbzrq5Zjdb5Wou0sNXBebJ/F0k8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKgZoWF3Hb5fH8y/W0qr7lXwl87G2IBEyDcT4DbhUkDrq4U1jr
	rsqpqfLZwXgj3FrUQ9uNX/YsOhRlrP/BY7pTr4RlNjN/FRT9JwBfkjsRWrgtok6PhQ==
X-Gm-Gg: ASbGnctMsm5V42aN6OyqEqOuqRwivQY/gmppgAm0YhN6xS5RuvkbMu8/8BLG7vOhXCO
	akdEMsWvc1YH3sVp3sa66kZFjUdv/GXtVaUoYYVR57PoF1nZy1GYdBbs4WnscHVUHSKGPIRX9bQ
	ML1xQLbao6JfX83y3fHTokSqpTGs68xV34FpR2mUvPQIjN9UbFrrbwExGxFYTseLvkBabgGhFmQ
	HkLUAWII9xsJBMvUKhHlbN3Ms0L86fiFbk+NjfD2lZhC0ANdyPGG61HNUKztGBsUsJaBKZ0gUBV
	6vKmHGhewL4Ba9bQCl6GX/Xe6B8X1zjOSz3x0PYPyFae6V3wduKDP8pT7zza4FzPYF34SAJuLvP
	Dt2mSPeGwzVO0tcso1jFbQXu9zMxgyKUHnwMJelySviJyij00IwTx/yLMY13XhD1GaY45MMAsuu
	qhcfJYAjA=
X-Google-Smtp-Source: AGHT+IF5mivMTF42KgqnMZZtT8U/0a1FprggGeju9lBXMtLt4roOafDHK3QRdtAd6Ybn0eX2bv5KAg==
X-Received: by 2002:a05:6000:2087:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3b60e4eef0bmr20015803f8f.23.1753188251254;
        Tue, 22 Jul 2025 05:44:11 -0700 (PDT)
Message-ID: <15a876ae-fdc5-4292-bd3b-1f6f2ae0e448@suse.com>
Date: Tue, 22 Jul 2025 14:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 08/10] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <6df9b5bbeae12a74397d72d53c530313f0778025.1753184487.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <6df9b5bbeae12a74397d72d53c530313f0778025.1753184487.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:41, Oleksii Moisieiev wrote:
> This commit introduces two helper functions, `__memcpy_fromio` and
> `__memcpy_toio`, to provide a robust mechanism for copying data between
> standard memory and memory-mapped I/O (MMIO) space for the ARM
> architecture.
> 
> These functions are designed to handle memory transfers safely,
> accounting for potential address alignment issues to ensure correctness
> and improve performance where possible. The implementation is specific
> to ARM and uses relaxed I/O accessors.

The implementation could be reused by any arch providing
{read,write}*_relaxed(), couldn't it?

> __memcpy_fromio:
> Copies a block of data from an I/O memory source to a destination in
> standard ("real") memory. The implementation first handles any unaligned
> bytes at the beginning of the source buffer individually using byte-wise
> reads. It then copies the bulk of the data using 32-bit reads for
> efficiency, and finally processes any remaining bytes at the end of the
> buffer.
> 
> __memcpy_toio:
> Copies a block of data from standard memory to a destination in I/O
> memory space. It follows a similar strategy, handling any initial
> unaligned portion of the destination buffer byte-by-byte before using
> more efficient 32-bit writes for the main, aligned part of the transfer.
> Any trailing bytes are also handled individually.
> xen/include/xen/lib/arm/io.h

Why exactly do the functions need two leading underscores in their names?

> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_X86) += x86/
> +obj-$(CONFIG_ARM) += arm/

Nit: Alphabetically sorted please.

> --- /dev/null
> +++ b/xen/lib/arm/Makefile
> @@ -0,0 +1 @@
> +obj-y += io.o
> \ No newline at end of file

Please make sure all files properly end in a newline.

> --- /dev/null
> +++ b/xen/lib/arm/io.c
> @@ -0,0 +1,80 @@
> +#include <asm/io.h>
> +#include <xen/lib/arm/io.h>
> +
> +/*
> + * memcpy_fromio - Copy data from IO memory space to "real" memory space.
> + * @to: Where to copy to
> + * @from: Where to copy from
> + * @count: The size of the area.
> + */
> +void __memcpy_fromio(void *to, const volatile void __iomem *from,
> +                     size_t count)
> +{
> +    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
> +    {
> +        *(u8 *)to = readb_relaxed(from);

No u<N> anymore in new code please; use uint<N>_t instead.

Further, what tells you that accessing a 16-bit register residing in MMIO
can legitimately be accessed using two 8-bit accesses?

> +        from++;
> +        to++;
> +        count--;
> +    }
> +
> +    while ( count >= 4 )
> +    {
> +        *(u32 *)to = readl_relaxed(from);
> +        from += 4;
> +        to += 4;
> +        count -= 4;
> +    }

Not attempting 64-bit accesses on 64-bit arches will want an explanatory
comment, I think.

> +    while ( count )
> +    {
> +        *(u8 *)to = readb_relaxed(from);
> +        from++;
> +        to++;
> +        count--;
> +    }
> +}
> +
> +/*
> + * memcpy_toio - Copy data from "real" memory space to IO memory space.
> + * @to: Where to copy to
> + * @from: Where to copy from
> + * @count: The size of the area.
> + */
> +void __memcpy_toio(volatile void __iomem *to, const void *from,
> +                   size_t count)
> +{
> +    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
> +    {
> +        writeb_relaxed(*(u8 *)from, to);

Please never cast away const-ness. This is a violation of some Misra rule,
iirc.

Jan

