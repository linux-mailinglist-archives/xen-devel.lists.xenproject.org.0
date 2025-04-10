Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABBA848B9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 17:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946034.1344063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uE5-0005bA-UY; Thu, 10 Apr 2025 15:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946034.1344063; Thu, 10 Apr 2025 15:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2uE5-0005ZI-RN; Thu, 10 Apr 2025 15:54:01 +0000
Received: by outflank-mailman (input) for mailman id 946034;
 Thu, 10 Apr 2025 15:54:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2uE4-0005ZA-D8
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 15:54:00 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fecb8031-1623-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 17:53:50 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso557287f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 08:53:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89361170sm5189958f8f.2.2025.04.10.08.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 08:53:49 -0700 (PDT)
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
X-Inumbo-ID: fecb8031-1623-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744300430; x=1744905230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YDYezsBzyIUsRamwn96y/lgFzZ7ye0bSGn7Wc4J8kYA=;
        b=U7Gg43ABrOL/FZ8FF3N132ZYLJwp0vOM7IEyqxURzlhF6DMs1blzCLHDFiFLDFFXfb
         Ns9M9YWehNig7BPAVkdqc6CIjJlK22Pu3+fq2V3BmnAt4UgyVBnlRSqcNjd+4oKpyR8K
         OhDcD0xALgb25QkucqzN3nIbGdcZaQoys80IKxg6K8zs+Chr/sPPWXiXZFD7t6fwbyLU
         sIFJmSJPGXXKSQYjaW8rWtcoGEazwwdNY2a+n0HnEQCtwNFxipfhAQHuOYWqmULBBizl
         SeZFc2OK8EA/jSaNzW17LIDpb00Y1qMEpFQoMBPOzoHHkZ9rZIGDIi0SU3Qqr2qL4NkO
         NJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300430; x=1744905230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDYezsBzyIUsRamwn96y/lgFzZ7ye0bSGn7Wc4J8kYA=;
        b=Rf4uPXLpLuXnbf02firoGUNxd1v7LI6L7cq/OeeN7wxGtvbVKAFbVgbHvc+u1h7y3f
         hpIM7aPJ1UDrkkpPoS5uUsknu87E0qHnWX+hUovHgNlkBR9wRLf624DAyXx895uM48e6
         Wen62orZKECz4dI1rNQOSGyNUi4hQOEFq/5Csz3Safa5wJHIOkvr67aPRSekeSlJaCqK
         pzy0e7XQKwH+1HiV3BIoHf2IqDi1iIajRDNU6PwrcJlZy37Kgi0rjJmsJ3b+s/cH0vY5
         Zehv2mytRzA+TKdK6S4pMP/yJTYRJTGB/6t4TXyhtmdX4Er+QglBoy4N92nCdZqF1Z5N
         Rw6A==
X-Forwarded-Encrypted: i=1; AJvYcCX84QCwYF19EL4BKXePE+YSVmHobKuw7EkMo8r4rAQapnEl8jW10Rqcm/AGzfxHPDq8jxI1S76PSgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8/yiNoQAt/7RGHH9Nsp3LF3vRI9iqutuCAELdSG0cD1q3KSaH
	I0YLN0KRP8vLmRpYiNlY3koktqW5um6C575t268Fph4hd9vwJHjUvpMLpMDcCw==
X-Gm-Gg: ASbGncvcmNZ4rcL8nsOd0k3Ij6+5mA6so6pY26lcvntCik3wfIW7gaMjOC8wOGvK1b+
	2C5Y00kT9haHe+JeO2ThumzssApf+ZfaiiBvecjYtSX/ramNtwbiA2MBogqMvmnggUbfMtLiNiJ
	yyzOkNoBc2H5Uwd9ohn6GOUxUpKy+aYOs3ZHD/gk/Uvgwhik9uZt9o5C3+n1X9HnBGZ3cAImPu3
	bjY58iaHTSqhtW6h8A0RZ2tvWcT9wVdb9MjwSjsZZ/UFx7AHxS635mQJWKSoMtf8CvpfP9XP82O
	Nm5j2bSK48ed5dD4c6FP44p/hsDAZhZ80eYveetpGUmU/TwiMHDtH3k9HI7Y8Ho1tKUyFyBx9kD
	f1RIgaPkQToOkVDKka0OCScymJQ==
X-Google-Smtp-Source: AGHT+IED5e5p6/xo0Q9r1t4T+qpDN4g9xuNa8GepOI7o5ZD/7Zf+VVB9/GmNzCOySXEwCl8xnfVKfg==
X-Received: by 2002:a5d:64e3:0:b0:390:e853:85bd with SMTP id ffacd0b85a97d-39d8f4f0f98mr2654873f8f.48.1744300429776;
        Thu, 10 Apr 2025 08:53:49 -0700 (PDT)
Message-ID: <65f5952a-8d2a-499c-bd66-53e9e2fbfa9c@suse.com>
Date: Thu, 10 Apr 2025 17:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/14] xen/riscv: riscv_of_processor_hartid()
 implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ab592d50ad161ffed3950bdf58ade49ae90a3c0e.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> @@ -13,3 +16,68 @@ void __init smp_clear_cpu_maps(void)
>      cpumask_set_cpu(0, &cpu_online_map);
>      cpumask_copy(&cpu_present_map, &cpu_possible_map);
>  }
> +
> +/**
> + * of_get_cpu_hwid - Get the hardware ID from a CPU device node
> + *
> + * @cpun: CPU number(logical index) for which device node is required
> + * @thread: The local thread number to get the hardware ID for.
> + *
> + * Return: The hardware ID for the CPU node or ~0ULL if not found.
> + */
> +static uint64_t of_get_cpu_hwid(struct dt_device_node *cpun, unsigned int thread)

What does the "of" prefix stand for here? Looking at the function body I'm
really at a loss. (I was first guessing something like OpenFirmware, but
there's nothing here that would support that.)

As you're only fetching data - can cpun be pointer-to-const?

> +{
> +    const __be32 *cell;
> +    int ac;
> +    uint32_t len;
> +
> +    ac = dt_n_addr_cells(cpun);
> +    cell = dt_get_property(cpun, "reg", &len);
> +    if ( !cell || !ac || ((sizeof(*cell) * ac * (thread + 1)) > len) )
> +        return ~0ULL;

I'm sorry for my lack of DT knowledge, but what's "thread" representing here?
You only pass in 0 below, so it's unclear whether it's what one might expect
(the thread number on a multi-threaded core).

> +    cell += ac * thread;
> +    return dt_read_number(cell, ac);

Nit (you know what)

> +/*
> + * Returns the hart ID of the given device tree node, or -ENODEV if the node
> + * isn't an enabled and valid RISC-V hart node.
> + */
> +int riscv_of_processor_hartid(struct dt_device_node *node, unsigned long *hart)

Similar question as above: What's "of" and what significance does the "riscv"
prefix have in RISC-V code?

Const-ness question again for "node".

> +{
> +    const char *isa;
> +
> +    if ( !dt_device_is_compatible(node, "riscv") )
> +    {
> +        printk("Found incompatible CPU\n");
> +        return -ENODEV;
> +    }
> +
> +    *hart = (unsigned long) of_get_cpu_hwid(node, 0);
> +    if ( *hart == ~0UL )

While for RV64 this won't matter, the difference in types (uint64_t returned,
unsigned long used) is still puzzling me. What's the deal?

Jan

