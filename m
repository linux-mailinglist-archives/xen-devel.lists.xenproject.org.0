Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E195014C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 11:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776083.1186235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdnv2-0007jk-TH; Tue, 13 Aug 2024 09:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776083.1186235; Tue, 13 Aug 2024 09:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdnv2-0007h6-Q7; Tue, 13 Aug 2024 09:34:20 +0000
Received: by outflank-mailman (input) for mailman id 776083;
 Tue, 13 Aug 2024 09:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdnv1-0007h0-5s
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 09:34:19 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357ff488-5957-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 11:34:16 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso572575866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 02:34:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414eb8dsm53028366b.162.2024.08.13.02.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 02:34:15 -0700 (PDT)
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
X-Inumbo-ID: 357ff488-5957-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723541656; x=1724146456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8wybzRGFdKpIOBRe95VVLGzFGfNLS3qQPmWIc2HwnU=;
        b=QmNeUglEM+Vq6+ccH23uYdjZK0a8i4cvN69f3WG49jiERizycouNeslEt9S36DGMck
         kJv1moiM9G0/SN+lV/THEY31ZErIJUiHv/lUZF8dcA7XPmr+WikbkPSCQN74ysQaQWV2
         ctBt3rT3t9ZzEsZq9pYuIJ2G/npbn89hSdsxAb9peF1bqPmk3IihGI4S6H//c+VvjCwF
         Q/Lx9ty45v6OGtqSXZygHjrvujsXTbwPsd/pXXv3KLqLVURZ03PII5Fu4gHOeJSMaa5n
         t5uPJd7xLVUPtZPqg9N4HI4wALOsm5JE4sb/2ewroveTEZ+lR1GLBuFHjS+X5hG5Tp1S
         sTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723541656; x=1724146456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8wybzRGFdKpIOBRe95VVLGzFGfNLS3qQPmWIc2HwnU=;
        b=RXDr5I6dppWCJBz0cgPS1hKBh2+c5r3oYc37a2753KrXISsCE/fMyF9G3NkcHi8N78
         82TA8g6xToLUKtadBDJCJjbA3Cyt6yL8JyqsTfXkbljJyU90DCpxjJ7CaVikfClx5CrB
         OWq4eCJYv1yrkNWKdaGSdpKbckoPgQ3xZ0te6JE3daYDoAWUCRWHREMvvlpTqJjJ1Z/i
         qaYdIYhIv90d/Eltf0oRrgiXg+RjG7vroyK7jU/kUL/GkTTtme1B11mYUGAgnOeJCqY4
         7Ls2eLvkEuxTT41+dn8Zc/Ql6x2wjTYn6qvGt4osKuwX3jqyFFCtnoJLv95AgKi6zCB3
         uHcw==
X-Forwarded-Encrypted: i=1; AJvYcCViiwDa68k6yGteqDsuioh3f7f29YNPvQvuM5ozWA+M6gejxuI7oUNZ6YAVoggbXa5ZMW3szDESwGlY7EvG4x9E7Zy5qVSX+NkFNKc7VDU=
X-Gm-Message-State: AOJu0Yyg6+Nc1LSAiDImZ8o1vkGHnpkFEqTjz0OVQ3FZEdvjbAwNwJnR
	ksaGm8AWalUDEsGbboYEJ03PhqL5x59BygUBmi77KsDyezAYCnHEHzu20oYrmg==
X-Google-Smtp-Source: AGHT+IHfx2G38wPxq7Ln01VTZJE/koAc88/7XoLtJWjyOn5GPOdxJVjj8v1dTj8WlQAaPcJWDqw0OQ==
X-Received: by 2002:a17:906:6a12:b0:a80:bf0f:2256 with SMTP id a640c23a62f3a-a80ed1b4edbmr244313966b.8.1723541655916;
        Tue, 13 Aug 2024 02:34:15 -0700 (PDT)
Message-ID: <77ff59d1-b158-4603-bdbd-67c079ce87c9@suse.com>
Date: Tue, 13 Aug 2024 11:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1a863d06866f86761d23e6da3f4a6ee58c474473.1723214540.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 18:19, Oleksii Kurochko wrote:
> @@ -31,4 +65,34 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>   */
>  void sbi_console_putchar(int ch);
>  
> +/*
> + * Check underlying SBI implementation has RFENCE
> + *
> + * @return 1 for supported AND 0 for not-supported
> + */
> +bool sbi_has_rfence(void);

Nit: With bool return type, true and false in the comment?

> +/*
> + * Instructs the remote harts to execute one or more SFENCE.VMA
> + * instructions, covering the range of virtual addresses between
> + * start_addr and start_addr + size.

It's relatively clear what is meant here, but maybe still better to
make things explicit by using a mathematical range:
[start_addr, start_addr + size).

> + * Returns 0 if IPI was sent to all the targeted harts successfully
> + * or negative value if start_addr or size is not valid.
> + *
> + * @hart_mask a cpu mask containing all the target harts.
> + * @param start virtual address start
> + * @param size virtual address range size
> + */
> +int sbi_remote_sfence_vma(cpumask_t *cpu_mask,

pointer-to-const?

> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -7,11 +7,23 @@
>   * Modified by Bobby Eshleman (bobby.eshleman@gmail.com).
>   *
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> - * Copyright (c) 2021-2023 Vates SAS.
> + * Copyright (c) 2021-2024 Vates SAS.
>   */
>  
> +#include <xen/compiler.h>
> +#include <xen/const.h>
> +#include <xen/cpumask.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/smp.h>
> +
> +#include <asm/processor.h>
>  #include <asm/sbi.h>
>  
> +static unsigned long sbi_spec_version = SBI_SPEC_VERSION_DEFAULT;
> +static unsigned long sbi_fw_id, sbi_fw_version;

__ro_after_init for perhaps all three of them?

Considering SBI_SPEC_VERSION_{MAJOR,MINOR}_MASK, at least the first
of them also doesn't need to be unsigned long, but could be unsigned
int?

> @@ -38,7 +50,245 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>      return ret;
>  }
>  
> +static int sbi_err_map_xen_errno(int err)
> +{
> +    switch ( err )
> +    {
> +    case SBI_SUCCESS:
> +        return 0;
> +    case SBI_ERR_DENIED:
> +        return -EACCES;
> +    case SBI_ERR_INVALID_PARAM:
> +        return -EINVAL;
> +    case SBI_ERR_INVALID_ADDRESS:
> +        return -EFAULT;
> +    case SBI_ERR_NOT_SUPPORTED:
> +        return -EOPNOTSUPP;
> +    case SBI_ERR_FAILURE:
> +        fallthrough;
> +    default:
> +        return -ENOSYS;
> +    };
> +}
> +
>  void sbi_console_putchar(int ch)
>  {
>      sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
>  }
> +
> +static unsigned long sbi_major_version(void)
> +{
> +    return (sbi_spec_version >> SBI_SPEC_VERSION_MAJOR_SHIFT) &
> +        SBI_SPEC_VERSION_MAJOR_MASK;
> +}

Can you use MASK_EXTR() here, allowing to even drop the separate
SBI_SPEC_VERSION_MAJOR_SHIFT?

> +static unsigned long sbi_minor_version(void)
> +{
> +    return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MASK;
> +}

For consistency here then, too.

> +static long sbi_ext_base_func(long fid)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +    if ( !ret.error )
> +        return ret.value;
> +    else
> +        return ret.error;

With the folding of two distinct values, how is the caller going to
tell failure from success?

> +}
> +
> +static int __sbi_rfence_v02_real(unsigned long fid,

Are the double leading underscores really necessary here? (Same again
further down.)

> +                                 unsigned long hmask, unsigned long hbase,
> +                                 unsigned long start, unsigned long size,
> +                                 unsigned long arg4)
> +{
> +    struct sbiret ret = {0};
> +    int result = 0;
> +
> +    switch ( fid )
> +    {
> +    case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                0, 0, 0, 0);
> +        break;
> +    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, 0, 0);
> +        break;
> +    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, arg4, 0);
> +        break;
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, 0, 0);
> +        break;

How is e.g. this different from SBI_EXT_RFENCE_REMOTE_SFENCE_VMA
handling? To ease recognition, I think you want to fold cases with
identical handling.

> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, arg4, 0);
> +        break;
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, 0, 0);
> +        break;
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                start, size, arg4, 0);
> +        break;
> +
> +    default:

Nit: Just like you have it here, blank lines please between any non-
fallthrough case blocks.

> +        printk("%s: unknown function ID [%lu]\n",
> +               __func__, fid);
> +        result = -EINVAL;
> +        break;
> +    };
> +
> +    if ( ret.error )
> +    {
> +        result = sbi_err_map_xen_errno(ret.error);
> +        printk("%s: hbase=%lu hmask=%#lx failed (error %d)\n",
> +               __func__, hbase, hmask, result);
> +    }
> +
> +    return result;
> +}
> +
> +static int __sbi_rfence_v02(unsigned long fid,

This has its address taken for storing in a function pointer. I'd like
to suggest that from the very beginning you mark such functions cf_check.

> +                            const cpumask_t *cpu_mask,
> +                            unsigned long start, unsigned long size,
> +                            unsigned long arg4, unsigned long arg5)
> +{
> +    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
> +    int result;
> +
> +    /*
> +     * hart_mask_base can be set to -1 to indicate that hart_mask can be
> +     * ignored and all available harts must be considered.
> +     */
> +    if ( !cpu_mask )
> +        return __sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
> +
> +    for_each_cpu( cpuid, cpu_mask )

Nit: Either

    for_each_cpu ( cpuid, cpu_mask )

(if you deem for_each_cpu a pseudo-keyword) or

    for_each_cpu(cpuid, cpu_mask)

(if you don't).

> +    {
> +        hartid = cpuid_to_hartid(cpuid);
> +        if ( hmask )
> +        {
> +            if ( hartid + BITS_PER_LONG <= htop ||
> +                 hbase + BITS_PER_LONG <= hartid )
> +            {
> +                result = __sbi_rfence_v02_real(fid, hmask, hbase,
> +                                               start, size, arg4);
> +                if ( result )
> +                    return result;
> +                hmask = 0;
> +            }
> +            else if ( hartid < hbase )
> +            {
> +                /* shift the mask to fit lower hartid */
> +                hmask <<= hbase - hartid;
> +                hbase = hartid;
> +            }
> +        }
> +
> +        if ( !hmask )
> +        {
> +            hbase = hartid;
> +            htop = hartid;
> +        } else if ( hartid > htop )

Nit: Closing brace on its own line please.

> +            htop = hartid;
> +
> +        hmask |= BIT(hartid - hbase, UL);
> +    }

I can see how you will successfully batch for certain configurations
this way. When hart ID mapping is something like (0,64,1,65,2,66,...)
you won't batch at all though. Which may be fine at least for now, but
then I think a comment wants to state what is or is not intended to be
covered. It is only this way that people will know that certain
shortcomings aren't bugs.

> +    if ( hmask )
> +    {
> +        result = __sbi_rfence_v02_real(fid, hmask, hbase,
> +                                       start, size, arg4);
> +        if ( result )
> +            return result;
> +    }
> +
> +    return 0;
> +}
> +
> +static int (*__sbi_rfence)(unsigned long fid,
> +                           const cpumask_t *cpu_mask,
> +                           unsigned long start, unsigned long size,
> +                           unsigned long arg4, unsigned long arg5) = NULL;

__ro_after_init and no need for an initializer.

> +int sbi_remote_sfence_vma(cpumask_t *cpu_mask,
> +                          unsigned long start_addr,
> +                          unsigned long size)
> +{
> +    return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
> +                        cpu_mask, start_addr, size, 0, 0);

No check (not even an assertion) here for __sbi_rfence still being NULL?

> +int __init sbi_init(void)
> +{
> +    int ret;
> +
> +    ret = sbi_get_spec_version();
> +    if ( ret > 0 )
> +        sbi_spec_version = ret;

Truncation from long to int is not an issue here?

> +    printk("SBI specification v%lu.%lu detected\n",
> +            sbi_major_version(), sbi_minor_version());
> +
> +    if ( !sbi_spec_is_0_1() )
> +    {
> +        sbi_fw_id = sbi_get_firmware_id();
> +        sbi_fw_version = sbi_get_firmware_version();

These cannot return errors?

> +        printk("SBI implementation ID=%#lx Version=%#lx\n",
> +            sbi_fw_id, sbi_fw_version);
> +
> +        if ( sbi_probe_extension(SBI_EXT_RFENCE) > 0 )
> +        {
> +            __sbi_rfence = __sbi_rfence_v02;
> +            printk("SBI v0.2 RFENCE extension detected\n");
> +        }
> +    } else {

Nit: Style (and I think I said so before).

> +        BUG_ON("Ooops. SBI spec veriosn 0.1 detected. Need to add support");

Besides the typo (version) here and ...

> +    }
> +
> +    if ( !sbi_has_rfence() )
> +    {
> +        BUG_ON("At the moment flush_xen_tlb_range_va() uses SBI rfence to "
> +               "flush TLB for all CPUS!");

... here better panic()? A call trace doesn't really add any value for these.

Jan

