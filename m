Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41692D1BA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 14:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756937.1165674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRWaK-0004dK-IC; Wed, 10 Jul 2024 12:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756937.1165674; Wed, 10 Jul 2024 12:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRWaK-0004a2-Dd; Wed, 10 Jul 2024 12:38:12 +0000
Received: by outflank-mailman (input) for mailman id 756937;
 Wed, 10 Jul 2024 12:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRWaI-0004Zw-D8
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 12:38:10 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431d669a-3eb9-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 14:38:08 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee9b098bd5so59345741fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 05:38:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6ac0fd1sm33391765ad.208.2024.07.10.05.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 05:38:07 -0700 (PDT)
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
X-Inumbo-ID: 431d669a-3eb9-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720615088; x=1721219888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0PWzvhQhBu1t2ahtKLYW3Aknb759sp/s2xEo997KCYw=;
        b=K5LciHFfn+87itXwm6BlcyOM96iVwqEM8SrWyvx849VwmAyqFxrnj3Oo/FzdaF0Ahm
         MiRcqDUeGmtJ3dT97/ybtfsA95YovD1u6M78rzCiMZq2eH9w+e+kSPRXIHGEw3RxqM3G
         5lmbJXwHiT5Mu+UhRcXVvWqEVvVYz7PVaDUWHiTonNixmrwxxQ7679tUjYvUlHi4t4Hi
         PKb68RUXDZ8LBuGyNfiYzxTK4ONN6S7Lrk+tnN+Q8U2hYhqwFFO2aJIUZ+I0RXjzRt3Y
         kHwhFjf9mAGlWkZAzZsYZRUOpcIMuMJQsojQQQ2I4z5Ej2yC2aaKZPhK+lKJReMCrCDZ
         misw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720615088; x=1721219888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PWzvhQhBu1t2ahtKLYW3Aknb759sp/s2xEo997KCYw=;
        b=GqJ1tbvW4jvrQuo5l14UG5OQT/50DLFhq4WWbGkRdPsZI7qLe3MJvEf03+ZKATtz2D
         AW1/3Hgoy9LAZzykW2RWw8mioy02/PZQuxDk6yOw30XcEdOo9wWTJ6BgwcxZvyZVOKnX
         ssuNYWHAooOfvSjAGRmeCjdhWlJjDnQKMLiYvJm8211l55mtujuguU3CUsMuzghjZn6p
         mek+bz/q8B+NkBvAkSCW3t2h2oBY2lF/Oo1lP0MzNeZbtEhF/RjrhBNAGwowlcGfB1p0
         Vy/9s6gfC7YNkLIkkKoZkYGhQLzstL/c/NqnP+nKljmPo5rZsgpDeutmglRYcoFmq0RV
         1vGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUajXbzveSYPdFW1wU/60gSyPv6h6Lmte/w5Dp9ISxcOi5c4ru1qfYcbhegssOHUG8Y6e7+bel8i6+7+9OGXtyNSS6iszceGK+55+jo18M=
X-Gm-Message-State: AOJu0YyBNu8+46bnyWKUcj/6221Scp6Wl42zjs8atckBFbDxPWjFanD5
	fvmLz5r9t33HbBkW7FZeZxItrxd4aUs+y8izaAmCgYfF/NtNsINr14Qk4BmqnQ==
X-Google-Smtp-Source: AGHT+IFmW9BstZb++a6Gqfs++0ptFvHxkphj6UBGEEalyMH1E3MygcuV7XsNC3rs22Q9qZSEXEf0aQ==
X-Received: by 2002:a2e:87ce:0:b0:2ec:5933:a62c with SMTP id 38308e7fff4ca-2eeb30e3a18mr44336701fa.22.1720615088295;
        Wed, 10 Jul 2024 05:38:08 -0700 (PDT)
Message-ID: <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
Date: Wed, 10 Jul 2024 14:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 12:42, Oleksii Kurochko wrote:
> Except mapping of FDT, it is also printing command line passed by
> a DTB and initialize bootinfo from a DTB.

I'm glad the description isn't empty here. However, ...

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -41,6 +41,9 @@ FUNC(start)
>  
>          jal     setup_initial_pagetables
>  
> +        mv      a0, s1
> +        jal     fdt_map
> +
>          /* Calculate proper VA after jump from 1:1 mapping */
>          la      a0, .L_primary_switched
>          sub     a0, a0, s2

... it could do with clarifying why this needs calling from assembly
code. Mapping the FDT clearly looks like something that wants doing
from start_xen(), i.e. from C code.

> @@ -33,15 +35,34 @@ static void test_macros_from_bug_h(void)
>      printk("WARN is most likely working\n");
>  }
>  
> +void __init fdt_map(paddr_t dtb_addr)
> +{
> +    device_tree_flattened = early_fdt_map(dtb_addr);
> +    if ( !device_tree_flattened )
> +    {
> +        printk("wrong FDT\n");
> +        die();
> +    }
> +}
> +
>  void __init noreturn start_xen(unsigned long bootcpu_id,
>                                 paddr_t dtb_addr)
>  {
> +    size_t fdt_size;
> +    const char *cmdline;
> +
>      remove_identity_mapping();
>  
>      trap_init();
>  
>      test_macros_from_bug_h();
>  
> +    fdt_size = boot_fdt_info(device_tree_flattened, dtb_addr);

You don't use the return value anywhere below. What use is the local var
then?

Jan

> +    cmdline = boot_fdt_cmdline(device_tree_flattened);
> +    printk("Command line: %s\n", cmdline);
> +    cmdline_parse(cmdline);
> +
>      printk("All set up\n");
>  
>      for ( ;; )


