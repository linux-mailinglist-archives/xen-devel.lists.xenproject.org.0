Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D33898340
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 10:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700757.1094373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIZu-0003Y7-HH; Thu, 04 Apr 2024 08:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700757.1094373; Thu, 04 Apr 2024 08:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsIZu-0003Ws-Ef; Thu, 04 Apr 2024 08:36:10 +0000
Received: by outflank-mailman (input) for mailman id 700757;
 Thu, 04 Apr 2024 08:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsIZs-0003Wm-Nm
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 08:36:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612785a3-f25e-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 10:36:06 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so707153a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 01:36:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fj22-20020a0564022b9600b0056a2cc5c868sm8912880edb.72.2024.04.04.01.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 01:36:05 -0700 (PDT)
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
X-Inumbo-ID: 612785a3-f25e-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712219766; x=1712824566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7pbkG9sf+QKas/gJZ0Wkks6WsQAaDgzjFnJVABh5T8=;
        b=YmIcTH/uIlYGtg6AVVz0u4g4eeJSomu3DG1w9SmRE2DGmJU0F9QVZYj2Il160NK3UO
         IcOBw5OUSfT+ZmzClnMDHwQvZ3M3cTEVp3OQdjQy2eiPINkcvHkgLExmu7tOICUUUovZ
         iFTEVzjp+0vcdabJgZsB3S43EnEKQYVUj3niJxgLxyNt54aTCEkAGS0DAmZ4kk4HmXXK
         /NNRbTgeXiUvX+N++R22nGHM8EtvHjugXLH42xVbqQHpp1Dg/iZ/cyrS7NDykYJPYEPj
         arabBiSFnbBf04Lb8MxuHRWfIwVQctvMqxXH1Ea20ML2DzK4G1TT/drjENQB+v2WslQ/
         RX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712219766; x=1712824566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7pbkG9sf+QKas/gJZ0Wkks6WsQAaDgzjFnJVABh5T8=;
        b=DhTLcfLspGJs0QtuVUp8GntbnLWX7RmncaUI+87HQJLbP0WbtDI4Ut8jJp1qHEIOKL
         NuMYr9AjcrhzSkHz/Hyhj4okpL8Sa++YFz1Iadzl/LXUFDcWhQT98oV5j/gbIN4sgo5y
         Yz8Z0m0hOmldCTm9xGis+UVUNImXuO13KpPAyJ225ZZu3cDklpF20fOytUA2KcqQY7E7
         Yc9SfUQTkeZj4KlGRs+RrDY3pu5SYfwDCOflqLX0aPIWvM558/aqKiAVRgPRRU66sJqL
         8EsEiU4Nj+0NQQXPhWuiKBIp8TLCxHGUTeymr+4GpBMZb1nDUA6/13J9qig4a9Cp5G/g
         EXWg==
X-Forwarded-Encrypted: i=1; AJvYcCXbMZbwqrZykZKkldw0L79WlI44Vmdm/N1IRcMT1Mcq6MzoJxyTnehO7b2jrNZdaIB8ZPbaSVOLy8IL1cMV/UHmrzOicBNltaufLhKGQ9w=
X-Gm-Message-State: AOJu0YwNKIhe6Mfo1tbd24lGDW216cFfGZdvMeEi3xGR/3rOXUbDjP5R
	THw16cZ5eiN88Z4kHVwc8STFRNvsNqzoWCL9w+klqT3rD6LtfokQSQ/VJ9mjGw==
X-Google-Smtp-Source: AGHT+IHvjWdPuuaqWtvs8gU/qIU73un3d1x4VXqOx4TCpOxuuRJecRq1+iy/qHzF+II0YKbY1q1tjw==
X-Received: by 2002:a05:6402:1653:b0:568:cdf3:5cb2 with SMTP id s19-20020a056402165300b00568cdf35cb2mr1613430edx.30.1712219766105;
        Thu, 04 Apr 2024 01:36:06 -0700 (PDT)
Message-ID: <e3e13f3f-3df6-4eb4-8b73-21387007e7c3@suse.com>
Date: Thu, 4 Apr 2024 10:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 03:12, Stefano Stabellini wrote:
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -480,4 +480,73 @@ The table columns are as follows:
>       - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
>  
>  
> +Sizes of Integer types
> +______________________
> +
> +Xen expects System V ABI on x86_64:
> +  https://gitlab.com/x86-psABIs/x86-64-ABI
> +
> +Xen expects AAPCS32 on ARMv8-A AArch32:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
> +
> +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
> +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
> +
> +A summary table of data types, sizes and alignment is below:
> +
> +.. list-table::
> +   :widths: 10 10 10 45
> +   :header-rows: 1
> +
> +   * - Type
> +     - Size
> +     - Alignment
> +     - Architectures
> +
> +   * - char 
> +     - 8 bits
> +     - 8 bits
> +     - all architectures

This one _may_ be acceptable, but already feels like going too far.

> +   * - short
> +     - 16 bits
> +     - 16 bits
> +     - all architectures
> +
> +   * - int
> +     - 32 bits
> +     - 32 bits
> +     - all architectures

These two I continue to disagree with. The values are minimum required ones.
Even if code changes may be needed (Misra already helps us here by stopping
undue mixing of e.g. unsigned int and uint32_t in at least some situations),
there's no inherent requirement in Xen for such restrictions.

> +   * - long
> +     - 32 bits
> +     - 32 bits 
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> +
> +   * - long
> +     - 64 bits
> +     - 64 bits 
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> +
> +   * - long long
> +     - 64-bit
> +     - 32-bit
> +     - x86_32
> +
> +   * - long long
> +     - 64-bit
> +     - 64-bit
> +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32

Along the lines of the above, simply saying "64-bit architectures" here
is too generic. Whereas for long (above) and ...

> +   * - pointer
> +     - 32-bit
> +     - 32-bit
> +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> +
> +   * - pointer
> +     - 64-bit
> +     - 64-bit
> +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)

... pointers I agree (and the special mentioning of the architectures
in parentheses could even be omitted imo). To summarize, my counter
proposal:

   * - char 
     - at least 8 bits
     - equaling size
     - all architectures

   * - char
     - 8 bits
     - 8 bits
     - x86, ARM, RISC-V, PPC

   * - short
     - at least 16 bits
     - equaling size
     - all architectures

   * - short
     - 16 bits
     - 16 bits
     - x86, ARM, RISC-V, PPC

   * - int
     - at least 32 bits
     - equaling size
     - all architectures

   * - int
     - 32 bits
     - 32 bits
     - x86, ARM, RISC-V, PPC

   * - long
     - 32 bits
     - 32 bits 
     - 32-bit architectures

   * - long
     - 64 bits
     - 64 bits 
     - 64-bit architectures

   * - long long
     - 64-bit
     - 32-bit
     - x86_32

   * - long long
     - 64-bit
     - 64-bit
     - x86_64, ARMv8-A AArch64, RV64, PPC64, ARMv8-A AArch32, ARMv8-R AArch32

   * - pointer
     - 32-bit
     - 32-bit
     - 32-bit architectures

   * - pointer
     - 64-bit
     - 64-bit
     - 64-bit architectures

Eventually, by properly decoupling pointers from longs (via using {,u}intptr_t
appropriately), the restrictions on "long" could also be lifted.

Note that the generic requirements on char and short also are imposed by C99.
It may therefore not be necessary to state them explicitly, but rather refer
to that standard (just like you're now referencing the SysV psABI-s).

Jan

