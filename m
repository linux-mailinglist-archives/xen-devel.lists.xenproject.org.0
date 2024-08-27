Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E276E960D6E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784115.1193508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1six34-0004AN-A6; Tue, 27 Aug 2024 14:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784115.1193508; Tue, 27 Aug 2024 14:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1six34-00048Z-6p; Tue, 27 Aug 2024 14:19:54 +0000
Received: by outflank-mailman (input) for mailman id 784115;
 Tue, 27 Aug 2024 14:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1six32-00048T-L1
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 14:19:52 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c40561d-647f-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 16:19:51 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so504350466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 07:19:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5879183sm115146866b.182.2024.08.27.07.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 07:19:50 -0700 (PDT)
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
X-Inumbo-ID: 6c40561d-647f-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724768391; x=1725373191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DYOT7dZMikS+sZ4B5vTDVx29jinCuR0z/kKGorKdXPI=;
        b=QhLr1sCxkC4F0ErsFR5LmB1FTSig3xVDuyai4J1KPfkjdW1p6vkLPXUCcWdKN+iUC9
         Ljjt9lXNE/CKOWDF+cUijFgPZ7DaEV2PPu690zFa3WtLfl1xsBFExFAbx6drQ9lrLWDM
         yJikakOfCPVudVc9w64MvhheXKlrsxr+cbBcdY9nK1plS6On063fl/CtrVBBzd1p8WWy
         eIg7gpqhL53hM3ouYGAJ/myJeZmuaZG+hH2cskaueOuuaxWKWDpKaTNqZReu8IWlreFz
         f7pmXfQKRXoF5cmMINvXgHP7pDY1Bpg0A8rLqc+22mvX04y2csh0h58hDAYNwTFL2faD
         61lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768391; x=1725373191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYOT7dZMikS+sZ4B5vTDVx29jinCuR0z/kKGorKdXPI=;
        b=pXL9V4GIivpIFkFCU6H5w7NI9oY15lTJCijb8DErRx9CN//w0H13DZqgoStOzjQLw3
         QGyPyTFoZDvyd67Y3b54mdZOi0goscUbR/zQvE5H0bJqupvvRY57099/m81KRiHoVtLv
         g511MpsUGYlW4IA5nu5RiP8Elm/hUkCy52zCKK/DBN9J3qE0QYoBNhjrgoA7YncKsDuL
         Err+th4QF52R6lvcHHLX+Ijq0iPX/7DKxdGbZDvvZDDWIyELlkRGaSt8iqtj1XW6TJWH
         fMVeUCk2tpSo0sPWltEs9khFZQwk6kRMenKeh7iqm/kS7asIqgQIWijbWmNSnP/cq54r
         Am8g==
X-Forwarded-Encrypted: i=1; AJvYcCWZlxGpCEe9HLnDmpKT8SlchPRRsqhOZwCNYXYwIMcKAuleG4asvwa0OQKvxNs/6tAjVHPDqnYjdeQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGBbsoZFZ4jrVOrUjdfOLhi2FpH1BqJlUUGC3Xv6i/W1IE5n7/
	e+DmFC7fzXhR/lPdWKlzKk04AkNY23JqiDUjkWpPq1qV4utX+v72Ko36Zf9Qqg==
X-Google-Smtp-Source: AGHT+IEfM0ZDASYMTLjuNs6/Bk5x8+TfsQclA8OxnYtkVj1tnFTwQn4dRYrHN5ou4pkXQxxUK2K15Q==
X-Received: by 2002:a17:907:3da0:b0:a86:817e:d27b with SMTP id a640c23a62f3a-a86a54b05f3mr976162466b.43.1724768390491;
        Tue, 27 Aug 2024 07:19:50 -0700 (PDT)
Message-ID: <10789eb4-ed96-48ab-860b-ec6f2d0e6341@suse.com>
Date: Tue, 27 Aug 2024 16:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <69da9fc18b9987285e4037ef08714e8f9faa66a7.1724256027.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <69da9fc18b9987285e4037ef08714e8f9faa66a7.1724256027.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 18:06, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -12,8 +12,41 @@
>  #ifndef __ASM_RISCV_SBI_H__
>  #define __ASM_RISCV_SBI_H__
>  
> +#include <xen/cpumask.h>
> +
>  #define SBI_EXT_0_1_CONSOLE_PUTCHAR		0x1
>  
> +#define SBI_EXT_BASE                    0x10
> +#define SBI_EXT_RFENCE                  0x52464E43
> +
> +/* SBI function IDs for BASE extension */
> +#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> +#define SBI_EXT_BASE_GET_IMP_ID         0x1
> +#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
> +#define SBI_EXT_BASE_PROBE_EXT          0x3
> +
> +/* SBI function IDs for RFENCE extension */
> +#define SBI_EXT_RFENCE_REMOTE_FENCE_I           0x0
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA        0x1
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID   0x2
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA       0x3
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID  0x4
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA       0x5
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID  0x6
> +
> +#define SBI_SPEC_VERSION_MAJOR_MASK     0x7F000000
> +#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff

Nit: Perhaps neater / more clear as

#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f000000
#define SBI_SPEC_VERSION_MINOR_MASK     0x00ffffff

> @@ -31,4 +64,34 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>   */
>  void sbi_console_putchar(int ch);
>  
> +/*
> + * Check underlying SBI implementation has RFENCE
> + *
> + * @return true for supported AND false for not-supported
> + */
> +bool sbi_has_rfence(void);
> +
> +/*
> + * Instructs the remote harts to execute one or more SFENCE.VMA
> + * instructions, covering the range of virtual addresses between
> + * [start_addr, start_addr + size).
> + *
> + * Returns 0 if IPI was sent to all the targeted harts successfully
> + * or negative value if start_addr or size is not valid.
> + *
> + * @hart_mask a cpu mask containing all the target harts.
> + * @param start virtual address start
> + * @param size virtual address range size
> + */
> +int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
> +                          unsigned long start_addr,
> +                          unsigned long size);

I may have asked before: Why not vaddr_t and size_t respectively?

> @@ -38,7 +51,265 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
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

What's the significance of the "fallthrough" here?

> +static unsigned long sbi_major_version(void)
> +{
> +    return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MAJOR_MASK);
> +}
> +
> +static unsigned long sbi_minor_version(void)
> +{
> +    return MASK_EXTR(sbi_spec_version, SBI_SPEC_VERSION_MINOR_MASK);
> +}

Both functions return less than 32-bit wide values. Why unsigned long
return types?

> +static long sbi_ext_base_func(long fid)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +
> +    /*
> +     * I wasn't able to find a case in the SBI spec where sbiret.value
> +     * could be negative.
> +     *
> +     * Unfortunately, the spec does not specify the possible values of
> +     * sbiret.value, but based on the description of the SBI function,
> +     * ret.value >= 0 when sbiret.error = 0. SPI spec specify only
> +     * possible value for sbiret.error (<= 0 whwere 0 is SBI_SUCCESS ).
> +     *
> +     * Just to be sure that SBI base extension functions one day won't
> +     * start to return a negative value for sbiret.value when
> +     * sbiret.error < 0 BUG_ON() is added.
> +     */
> +    BUG_ON(ret.value < 0);

I'd be careful here and move this ...

> +    if ( !ret.error )
> +        return ret.value;

... into the if() body here, just to avoid the BUG_ON() pointlessly
triggering ...

> +    else
> +        return ret.error;

... when an error is returned anyway. After all, if an error is returned,
ret.value presumably is (deemed) undefined.

> +static int sbi_rfence_v02_real(unsigned long fid,
> +                               unsigned long hmask, unsigned long hbase,
> +                               unsigned long start, unsigned long size,

Again vaddr_t / size_t perhaps? And then again elsewhere as well.

> +                               unsigned long arg4)
> +{
> +    struct sbiret ret = {0};
> +    int result = 0;
> +
> +    switch ( fid )
> +    {
> +    case SBI_EXT_RFENCE_REMOTE_FENCE_I:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                        0, 0, 0, 0);
> +        break;
> +
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
> +    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                        start, size, 0, 0);
> +        break;
> +
> +    case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
> +    case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
> +        ret = sbi_ecall(SBI_EXT_RFENCE, fid, hmask, hbase,
> +                        start, size, arg4, 0);
> +        break;
> +
> +    default:
> +        printk("%s: unknown function ID [%lu]\n",

I wonder how useful the logging in decimal of (perhaps large) unknown
values is.

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

Considering that sbi_err_map_xen_errno() may lose information, I'd
recommend logging ret.error here.

> +static int cf_check sbi_rfence_v02(unsigned long fid,
> +                                   const cpumask_t *cpu_mask,
> +                                   unsigned long start, unsigned long size,
> +                                   unsigned long arg4, unsigned long arg5)
> +{
> +    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
> +    int result;
> +
> +    /*
> +     * hart_mask_base can be set to -1 to indicate that hart_mask can be
> +     * ignored and all available harts must be considered.
> +     */
> +    if ( !cpu_mask )
> +        return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size, arg4);
> +
> +    for_each_cpu ( cpuid, cpu_mask )
> +    {
> +        /*
> +        * Hart IDs might not necessarily be numbered contiguously in
> +        * a multiprocessor system, but at least one hart must have a
> +        * hart ID of zero.

Does this latter fact matter here in any way?

> +        * This means that it is possible for the hart ID mapping to look like:
> +        *  0, 1, 3, 65, 66, 69
> +        * In such cases, more than one call to sbi_rfence_v02_real() will be
> +        * needed, as a single hmask can only cover sizeof(unsigned long) CPUs:
> +        *  1. sbi_rfence_v02_real(hmask=0b1011, hbase=0)
> +        *  2. sbi_rfence_v02_real(hmask=0b1011, hbase=65)
> +        *
> +        * The algorithm below tries to batch as many harts as possible before
> +        * making an SBI call. However, batching may not always be possible.
> +        * For example, consider the hart ID mapping:
> +        *   0, 64, 1, 65, 2, 66

Just to mention it: Batching is also possible here: First (0,1,2), then
(64,65,66). It just requires a different approach. Whether switching is
worthwhile depends on how numbering is done on real world systems.

> +        */
> +        hartid = cpuid_to_hartid(cpuid);
> +        if ( hmask )
> +        {
> +            if ( hartid + BITS_PER_LONG <= htop ||
> +                 hbase + BITS_PER_LONG <= hartid )
> +            {
> +                result = sbi_rfence_v02_real(fid, hmask, hbase,
> +                                             start, size, arg4);
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
> +        }
> +        else if ( hartid > htop )
> +            htop = hartid;
> +
> +        hmask |= BIT(hartid - hbase, UL);
> +    }
> +
> +    if ( hmask )
> +    {
> +        result = sbi_rfence_v02_real(fid, hmask, hbase,
> +                                     start, size, arg4);
> +        if ( result )
> +            return result;

It's a little odd to have this here, rather than ...

> +    }
> +
> +    return 0;
> +}

... making these two a uniform return path. If you wanted you
could even replace the return in the loop with a simple break,
merely requiring the clearing of hmask to come first.

> +static int (* __ro_after_init sbi_rfence)(unsigned long fid,
> +                                          const cpumask_t *cpu_mask,
> +                                          unsigned long start,
> +                                          unsigned long size,
> +                                          unsigned long arg4,
> +                                          unsigned long arg5);
> +
> +int sbi_remote_sfence_vma(const cpumask_t *cpu_mask,
> +                          unsigned long start_addr,

To match other functions, perhaps just "start"?

> +int sbi_probe_extension(long extid)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
> +                    0, 0, 0, 0, 0);
> +    if ( !ret.error && ret.value )
> +        return ret.value;
> +
> +    return -EOPNOTSUPP;

Any reason not to use sbi_err_map_xen_errno() here?

Jan

