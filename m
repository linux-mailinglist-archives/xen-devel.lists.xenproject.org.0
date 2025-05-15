Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6DDAB7F72
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 09:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984858.1370786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTSb-0001PD-9E; Thu, 15 May 2025 07:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984858.1370786; Thu, 15 May 2025 07:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFTSb-0001NV-6O; Thu, 15 May 2025 07:56:57 +0000
Received: by outflank-mailman (input) for mailman id 984858;
 Thu, 15 May 2025 07:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFTSZ-0001NP-Ey
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 07:56:55 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a282cc2-3162-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 09:56:53 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so1282907a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 00:56:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fff0cde389sm389443a12.17.2025.05.15.00.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 00:56:52 -0700 (PDT)
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
X-Inumbo-ID: 2a282cc2-3162-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747295813; x=1747900613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YeK56Adq5vSSVWRg/BGj/yQlkl1aU3vMjnhbTKKe8ek=;
        b=aT5ifZF07Ia+sWfUqmapQxji7SAeD6IYqUBzymLUThpKTTu1i7B/KCazbW/xxAkble
         RW87JJ8mFevSvM/Kq15/wgRLiA7nvssyRjqEEZopxRbAeOrLt7SKUKFS15/QK1R1twww
         7IWzSVDl30nppu/YSLGRrLRR163RxE+/vhBn06wlsJbcOmyopTbO6ABaSsHSS1b6+Xwg
         CPTzrQVpW6TcISFv91+s4ULufDQ6SrXcHCO5w00X4JYgZy14oOqqHSW/g2tx7uzIlh6/
         PwiuqD1rJHiQ7O5nX2KuMyYQu8FyLuZf093y3HzsfGSYTTEM/6mkwK2+10EFUJeqN2ux
         WS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295813; x=1747900613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeK56Adq5vSSVWRg/BGj/yQlkl1aU3vMjnhbTKKe8ek=;
        b=XrI2aej2omcqAymh4UEw6XVD/KQgmnzjN01m0ppU2N6KCmxJdMtjqM1HDGSQH01lRQ
         f8Yx3t/fBvahQGxSQ53EvMgcQoMZwLt2riU8SKuakMKO0UDWCCxDHFA2Vk4/w60EPSK7
         xXQCUpIoInxKC7xbWl6FJni085trBBiMUbbEIsFV9YjW8ITVstj3uKX682QyU++vYycP
         fK8d/HwNOOHKvVEbRrdlct9q9E8ZTyrDKBvFv4fVIqj1QJPIkJgTPAErsyScmvh4NssJ
         7UDLy74ZUBU0qwVHpwtgz9Hj88uK1F06ebB+f9jvmkAQ1c7vuosxj/DMC6ApmnMoV8Fb
         QoOA==
X-Forwarded-Encrypted: i=1; AJvYcCUa/pIbsYnbzqLNyPPmD2yToJGRl78Llsn4c+plb5zdcKE5V/uGXmp0fpWziAjWPaidxdPuieGglWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzPekBJ0psJCflqUoK57npcV2O5EV6FudFosFdU/YmFV/lqSnW
	i+6x2wsb8nVw6Paecm7uWyWdKDrXyrU4R9wTl/40nZkhSIwpHnqyFP+SoA/isw==
X-Gm-Gg: ASbGncv8VTCRfh7awVoowWw6MzRudCao8LKMi1g5d1Y6tvccR12COlKrjpYEt5lsSUa
	8kdiLXTKndPF8kZqmQdqM3XliQZnlVEqNQq66DxsWZb3CI2nmACKLYoxZKahdc8Jd5BWhgxZXhS
	nO7UKQ5DnX27XQBrrze0woN+lIydZt9OspOSx+iphiXCg2KXYFLI7D5668fniepel8RfVC96KZL
	SuR7hNMdUFquIaX6YAQjEhehOXRPNEyXIJXt9fUNgYtJvuFwr0xXCM7JZi7FsRPAoNDNCKdJc0t
	bNM8W+MHN7fnZAR2S3CC1//77eFjfEVpb0N+WKp+k9CRHUxam1N3hUiZJRTRfjK8EdE4PakrYcb
	awWaapnE7TanqruCxYtUiJrctux/nXMswR3x6
X-Google-Smtp-Source: AGHT+IGRIHz2iS/A66gqpX2g+js7fRNFX7SfZcZjcAx/2OWsra+1FHuT0yQIIazgSmJPCqPI5VDgew==
X-Received: by 2002:a05:6402:1ed1:b0:5ff:712a:bab2 with SMTP id 4fb4d7f45d1cf-5ff988b9ae6mr4891380a12.18.1747295812691;
        Thu, 15 May 2025 00:56:52 -0700 (PDT)
Message-ID: <df77a5c5-de45-4432-a86f-d120e9417d86@suse.com>
Date: Thu, 15 May 2025 09:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] xen/riscv: dt_processor_cpuid() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <4e4b3a018e8dacbe85cc080d9209e2ba3cdf4330.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4e4b3a018e8dacbe85cc080d9209e2ba3cdf4330.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(adding Bertrand as the one further DT maintainer, for a respective question
below)

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> Implements dt_processor_hartid()

There's no such function (anymore).

> to get the hart ID of the given
> device tree node and do some checks if CPU is available and given device
> tree node has proper riscv,isa property.
> 
> As a helper function dt_get_cpuid() is introduced to deal specifically
> with reg propery of a CPU device node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - s/of_get_cpu_hwid()/dt_get_cpu_id().
>  - Update prototype of dt_get_cpu_hwid(), use pointer-to-const for cpun arg.
>  - Add empty line before last return in dt_get_cpu_hwid().
>  - s/riscv_of_processor_hartid/dt_processor_cpuid().
>  - Use pointer-to_const for node argument of dt_processor_cpuid().
>  - Use for hart_id unsigned long type as according to the spec for RV128
>    mhartid register will be 128 bit long.
>  - Update commit message and subject.
>  - use 'CPU' instead of 'HART'.

Was this is good move? What is returned ...

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
>  
>  void setup_tp(unsigned int cpuid);
>  
> +struct dt_device_node;
> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid);

... here isn't a number in Xen's CPU numbering space. From earlier discussions I'm
not sure it's a hart ID either, so it may need further clarification (and I'd
expect RISC-V to have suitable terminology to tell apart the different entities).

> @@ -10,3 +13,66 @@ void __init smp_prepare_boot_cpu(void)
>      cpumask_set_cpu(0, &cpu_possible_map);
>      cpumask_set_cpu(0, &cpu_online_map);
>  }
> +
> +/**
> + * dt_get_cpuid - Get the cpuid from a CPU device node
> + *
> + * @cpun: CPU number(logical index) for which device node is required
> + *
> + * Return: The cpuid for the CPU node or ~0ULL if not found.
> + */
> +static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
> +{
> +    const __be32 *cell;
> +    int ac;

This is bogus (should be unsigned int afaict), but dictated by ...

> +    uint32_t len;
> +
> +    ac = dt_n_addr_cells(cpun);

... the return value here and ...

> +    cell = dt_get_property(cpun, "reg", &len);
> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
> +        return ~0ULL;

(Nit: This doesn't match the return type of the function; same for
the function comment. Also, what if sizeof(*cell) * ac < len?)

> +    return dt_read_number(cell, ac);

... the function parameter type here. In fact, that function is raising
another question: If the "size" argument is outside of [0, 2], the value
returned is silently truncated.

More generally - are there any plans to make DT code signed-ness-correct?

> +/*
> + * Returns the cpuid of the given device tree node, or -ENODEV if the node
> + * isn't an enabled and valid RISC-V hart node.
> + */
> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
> +{
> +    const char *isa;
> +
> +    if ( !dt_device_is_compatible(node, "riscv") )
> +    {
> +        printk("Found incompatible CPU\n");
> +        return -ENODEV;
> +    }
> +
> +    *cpuid = dt_get_cpuid(node);
> +    if ( *cpuid == ~0UL )
> +    {
> +        printk("Found CPU without CPU ID\n");
> +        return -ENODEV;
> +    }
> +
> +    if ( !dt_device_is_available(node))
> +    {
> +        printk("CPU with cpuid=%lu is not available\n", *cpuid);
> +        return -ENODEV;
> +    }
> +
> +    if ( dt_property_read_string(node, "riscv,isa", &isa) )
> +    {
> +        printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
> +        return -ENODEV;
> +    }
> +
> +    if ( isa[0] != 'r' || isa[1] != 'v' )
> +    {
> +        printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
> +        return -ENODEV;
> +    }
> +
> +    return 0;
> +}

I view it as unhelpful that all errors result in -ENODEV. Yes, there are log
messages for all of the cases, but surely there are errno values better
representing the individual failure reasons?

Jan

