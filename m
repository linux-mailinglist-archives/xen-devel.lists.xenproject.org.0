Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77598A4C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 15:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807402.1218835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGOn-0000sf-Lg; Mon, 30 Sep 2024 13:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807402.1218835; Mon, 30 Sep 2024 13:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svGOn-0000q5-J1; Mon, 30 Sep 2024 13:25:13 +0000
Received: by outflank-mailman (input) for mailman id 807402;
 Mon, 30 Sep 2024 13:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svGOm-0000pz-Va
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 13:25:12 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b95d70d-7f2f-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 15:25:11 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5398f3be400so1533280e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 06:25:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297be12sm540848566b.179.2024.09.30.06.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 06:25:11 -0700 (PDT)
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
X-Inumbo-ID: 6b95d70d-7f2f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727702711; x=1728307511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mErS8Dngnf/IJL2RK1vECCk1f0tcLcO8VpvUIow9WEI=;
        b=baL2KU8hY8X0c0TF+gjIclaHxiiQ8jPro5KmkzCabIO1646l8BnWA76V03RwU8ByWb
         P8/qj04aPmZfuSp6RitERiFGw/FEdFN+cE5Y5yPU0bOL50g5FBT3Ul5+hNPUu04wmj2b
         J8uwBwAddh5H9xeYFGlFMpDmRkOYyCeYQshpBCZ8TjNLg1OItQBre2yTRT+FANMGUSnM
         NJo95mkw3gBL8Zyv5+htlhfuZsyrGvAvB9usCKMdC9slColqClZ1LHEc5MxvrIbdzg+V
         4Lxxm7ctcaEg9wg9wbft6y02KundLEh3+qzKpOtnQF4XE1WCtCxkFQfSgVWl1jS4TlFT
         7jPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702711; x=1728307511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mErS8Dngnf/IJL2RK1vECCk1f0tcLcO8VpvUIow9WEI=;
        b=LN/90oe7r8Rfd5dIfjuCXPOBif7E2AmmxNOIPvBkW0LG1F4+fKLvWshLqWeO10koes
         pHGF0HySRPMy1QEAt6j82nC8By4R5nH09DmepJHn3eEfeOBE7d2jFaqlNwJr4nP17PRZ
         ShtMdYD335Uy0VvCDPxA2nFvletWQUTthpQIBuwDi18T/tBQEiBEtTchhTqG/URWKHzI
         yM0gDjKyymF5Uw9Q/yArO4YxhPRtXIY/yjO1TxKStLmEAvAaHeS+tyCvpaDFmSwOtgpj
         7jqRDgn1WqQsdhtYJn1/WEinYKDmY57FpAHimTIE6H4bBaF7nS83/upkt/LXD2HNsYE6
         hTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD18dBhlZ5qNHRzbREIH4bIoFLPPT8l4z4RNwMRbhngkphh08kTIGtL9+jSWt8e5KjGsHFpvj3WxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHQ5AhmMja/vprg8pI+iUFwVjAozZRYHeMf1atNV7UGpIbrJ1A
	3juIx5uUUyQUjmU9Kzur4AxLgASQfRjTXhAFmqlL38jR7w5YGQWlMs/ErdJV+w==
X-Google-Smtp-Source: AGHT+IEAkrM7GI08EOPcURgZspqf1b2ojVBVPhyslxURa6rzjd0qy7VjCjxp/Qe7XvKK4uLYut3/rg==
X-Received: by 2002:a05:6512:131d:b0:52e:be84:225c with SMTP id 2adb3069b0e04-5389fc42d84mr6076339e87.33.1727702711260;
        Mon, 30 Sep 2024 06:25:11 -0700 (PDT)
Message-ID: <78a03796-e8b7-4ecc-935b-662304c7984d@suse.com>
Date: Mon, 30 Sep 2024 15:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: move per-cpu area management into common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d52cd7cddb09c3b87bc4c66458f619dbf7ac214f.1727365499.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 18:54, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/percpu.h
> @@ -0,0 +1,14 @@
> +#ifndef __X86_PERCPU_H__
> +#define __X86_PERCPU_H__
> +
> +#define PARK_OFFLINE_CPUS
> +
> +/*
> + * Force uses of per_cpu() with an invalid area to attempt to access the
> + * middle of the non-canonical address space resulting in a #GP, rather than a
> + * possible #PF at (NULL + a little) which has security implications in the
> + * context of PV guests.
> + */
> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
> +
> +#endif /* __X86_PERCPU_H__ */

With this file appearing, doesn't arch/x86/include/asm/Makefile want the
respective line removed?

> --- /dev/null
> +++ b/xen/common/percpu.c
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0-only

> +#include <xen/percpu.h>
> +#include <xen/cpu.h>
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +#include <xen/rcupdate.h>
> +
> +#ifndef INVALID_PERCPU_AREA
> +#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
> +#endif
> +
> +#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
> +
> +extern char __per_cpu_start[];
> +extern const char __per_cpu_data_end[];
> +
> +unsigned long __per_cpu_offset[NR_CPUS];

Could this perhaps become __read_mostly while it's being moved here?

> +void __init percpu_init_areas(void)
> +{
> +    unsigned int cpu;
> +
> +    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
> +        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> +}
> +
> +static int init_percpu_area(unsigned int cpu)
> +{
> +    char *p;
> +
> +    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
> +        return park_offline_cpus ? 0 : -EBUSY;
> +
> +    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
> +        return -ENOMEM;
> +
> +    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
> +    __per_cpu_offset[cpu] = p - __per_cpu_start;
> +
> +    return 0;
> +}
> +
> +struct free_info {
> +    unsigned int cpu;
> +    struct rcu_head rcu;
> +};
> +static DEFINE_PER_CPU(struct free_info, free_info);
> +
> +static void cf_check _free_percpu_area(struct rcu_head *head)
> +{
> +    struct free_info *info = container_of(head, struct free_info, rcu);
> +    unsigned int cpu = info->cpu;
> +    char *p = __per_cpu_start + __per_cpu_offset[cpu];
> +
> +    free_xenheap_pages(p, PERCPU_ORDER);

It's quite sad that just because of this __per_cpu_start[] can be const-ified.

> --- a/xen/include/xen/percpu.h
> +++ b/xen/include/xen/percpu.h
> @@ -29,6 +29,36 @@
>  
>  #include <asm/percpu.h>
>  
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/types.h>
> +#include <asm/current.h>
> +
> +#ifndef PARK_OFFLINE_CPUS
> +/*
> + * Do we, for platform reasons, need to actually keep CPUs online when we
> + * would otherwise prefer them to be off?
> + */
> +#define park_offline_cpus false
> +#endif

In the (implicit) #else case the identifier is a variable, which may end up
being set to true or false. Therefore I consider PARK_OFFLINE_CPUS somewhat
misleading: x86, #define-ing the variable, doesn't always mean to park CPUs.
Perhaps MAYBE_PARK_OFFLINE_CPUS or PARK_OFFLINE_CPUS_VAR?

Jan

