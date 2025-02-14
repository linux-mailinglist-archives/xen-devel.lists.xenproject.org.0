Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160BA3586F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 09:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888548.1297902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqhi-0003Wi-Fq; Fri, 14 Feb 2025 08:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888548.1297902; Fri, 14 Feb 2025 08:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqhi-0003Up-Cy; Fri, 14 Feb 2025 08:05:42 +0000
Received: by outflank-mailman (input) for mailman id 888548;
 Fri, 14 Feb 2025 08:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqhh-0003Uj-IO
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 08:05:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ab23c54-eaaa-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 09:05:39 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5de51a735acso3284245a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 00:05:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d3624sm2562744a12.40.2025.02.14.00.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:05:38 -0800 (PST)
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
X-Inumbo-ID: 7ab23c54-eaaa-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739520339; x=1740125139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CN4terUs/h4AF5NulnrCnPd2z+8lne0vqmCXj/+Tazk=;
        b=ZFm/+/bcM2Zdn5GJ0St6Ct84upZ7IQnWdwfvoaK5KX9viv+pEOxlzGMlZsPRncTsaG
         Itd55it+cEZCTwliOFMfY8XXxhFZ6jz/fnsP37Ssav71wBk+xJvFAxufBTSk4h0/2FIG
         ECurDIsp0bwgJgix+753yVR6asJ8+NxwTp7bcsSLkHz4FTJRImhaX5yh5P4SBl6IwiMP
         YgyN6xj8a52kWfHQdzBssN2nCj1cjIhYYJFygCB9np8yzJxj1QHG6EY+TvdV3Ky7eqZ7
         cWu4ZBxabKGU0qGDdgsau5kVMfeO8DR5qtsHAQLNUH9D342MY5KIoY9txz7fe6JVnyuH
         Nf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739520339; x=1740125139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN4terUs/h4AF5NulnrCnPd2z+8lne0vqmCXj/+Tazk=;
        b=VXcYibAnvmmv8wbrRPpTzeGcqcYSMHGP+XRKTTe1MUNwlA+2dnR577Lobv3Y34BR9K
         foUG7IU7g0j2iCmy/Spk4w6HBVHmFYSeKnfUgj5DaJ7xdOwnasDGpGIoNmEzWWtL89Xd
         jJEl27r39vdb5J08Ot6MpU8sROE1ipAC8pCZR7QmK61iyY3VWBVOU54p/z7rSHDuZ1Ct
         4DJfOqgpZxKnkd7XAlpJv2TIbmiKkzkFflw0ABrWkFlz/aZsBXahkN0APOGcGrlzyAtY
         cnlpALKdNKceK/zCsFP2cCU7NChRRrtfyxXGfjN+nfrPKOnOIh8+mFyKfMCG0LMCRcw9
         UO4A==
X-Forwarded-Encrypted: i=1; AJvYcCWzFdU/5vkpVgIgNpaATecuT+7qVMtVH0wIKbFa+LItsm8EKJXQumq3IVfVg3hhgUg4yC9eBEU1XUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnIeOEWVDVKIq7qkRSziUQdTdJTzvueE26RuXfPLojzknNNQVG
	RuPTEG+Ewct8nTeH+pKuUfrE5zB5t84SzfthHcARwGkt6oFfpHOI87s7CICiyg==
X-Gm-Gg: ASbGncs/EUhXR70lvJDOCx+DfvLbiC5Gbi9LvVSeAamAaNPCnRMtXauZxBVdCOH0yU/
	hKv0f45AgrO4Ofhq2J4L3P4tKtahmJ6ZiiG++Pbu3ru/pJEhmkJcXHvR9inc+0TRAts5gWvmHPl
	oR8wpnVY3hCbI3lyfjHxlFP46DkbIzPD7+7bUAzLB7NqHPAJl6OCJSPsn+jjDoxmK1/2py0VkT6
	dLibcOTFGa0IlF5B7gBRIFpfZ0knaqoczaELdrn4tEMMnbXmR4MGX295PrZgLnMweSbto53S5Zb
	ZPsisegH0IT8CYxgYP1CQKhOF3V/+4ASUDBsN6nbgdtq3eSsaFomGqKKqzMHKAyGlawXcV98v35
	V
X-Google-Smtp-Source: AGHT+IGA7GA2VNQ20O5m3ll1W/RWOMjgrSVQvBdww0pPDszTHt1BIHNQTAu1qncahVVB6eQKHwZl5Q==
X-Received: by 2002:a05:6402:270a:b0:5d0:81dc:f20e with SMTP id 4fb4d7f45d1cf-5dec9e9b317mr5418285a12.17.1739520339118;
        Fri, 14 Feb 2025 00:05:39 -0800 (PST)
Message-ID: <c70e609a-a4db-4270-b6f5-015245ac670a@suse.com>
Date: Fri, 14 Feb 2025 09:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
 <20250213220021.2897526-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250213220021.2897526-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 23:00, Volodymyr Babchuk wrote:
> Both GCC and Clang support -fstack-protector feature, which add stack
> canaries to functions where stack corruption is possible. This patch
> makes general preparations to enable this feature on different
> supported architectures:
> 
>  - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
>    can enable this feature individually
>  - Added user-selectable CONFIG_STACK_PROTECTOR option
>  - Implemented code that sets up random stack canary and a basic
>    handler for stack protector failures
> 
> Stack guard value is initialized in two phases:
> 
> 1. Pre-defined randomly-selected value.
> 
> 2. Own implementation linear congruent random number generator. It
> relies on get_cycles() being available very early. If get_cycles()
> returns zero, it would leave pre-defined value from the previous
> step.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> 
> Changes in v5:
> 
> - Fixed indentation
> - Added stack-protector.h

With this I question the retaining of Andrew's R-b.

> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +#include <xen/time.h>
> +
> +/*
> + * Initial value is chosen by a fair dice roll.
> + * It will be updated during boot process.
> + */
> +#if BITS_PER_LONG == 32
> +unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927UL;
> +#else
> +unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09cUL;
> +#endif
> +
> +/*
> + * This function should be called from early asm or from a C function
> + * that escapes stack canary tracking (by calling
> + * reset_stack_and_jump() for example).
> + */

This comment is now stale, and ...

> +void __init asmlinkage boot_stack_chk_guard_setup(void)

... I question the asmlinkage linkage here now, too.

Based on how things are moving, I don't think this should be rushed into
4.20 (anymore).

Jan

