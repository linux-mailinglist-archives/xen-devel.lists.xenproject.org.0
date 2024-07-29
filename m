Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946E93F9DF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766945.1177494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSgB-00023x-04; Mon, 29 Jul 2024 15:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766945.1177494; Mon, 29 Jul 2024 15:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSgA-00022R-Sw; Mon, 29 Jul 2024 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 766945;
 Mon, 29 Jul 2024 15:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYSg9-0001xm-Sd
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:52:53 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cb701e8-4dc2-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 17:52:52 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a8caef11fso400932966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:52:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad9127esm531811266b.149.2024.07.29.08.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:52:51 -0700 (PDT)
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
X-Inumbo-ID: 9cb701e8-4dc2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722268371; x=1722873171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ob9uToRYdqOwVGZHRH+DfX5JpxOpUV+wANi4VdXUBec=;
        b=KPp9hJ5CTOlDNorrVn6BEJ9S6XgmbVR/YFprxs9lx+Rp2qvxutrvyf3PyAykNECPm9
         QHTYw8HhEZ7WwBlasYIIAsNH7rSxAd8MQkFZGb1M4RWRDnUwUoSj57/PoU29Sr4tNyvQ
         CcUH7qk+yavySlu9TRAtRUq7OEmIFerNndGjDnr1jBHKGDbJ8njsZcnNjDhChhQ3kNfY
         bJahLkArEhIjK3QSGY2dxRxk0LIJ1BvvsFEvBfm27zw+ibVh1Y2rIX0bZOJy2ucDIAZ8
         6iJpU9zpM1SuoJzB2N9r8rDIOrQ6zr14AViLMwuNhJJ560gvh7OV4fo/CrzGq0+CAl5N
         O7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268371; x=1722873171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob9uToRYdqOwVGZHRH+DfX5JpxOpUV+wANi4VdXUBec=;
        b=P6R3gloeKNktDCZoUn9I/qima49b2V+3iqPuWZY+QyuyqdCXCX2Agwjk1ePzOZOhMJ
         6Ua5WymmuRFTOSgOEZ4+4oKGUVjqOBXEUobgMF4KSamr30o0aeNN1dK9QVf6c/mG/tNR
         plxcpjy6MToB52fHljrIivEp7C3O7y7srygqAkhhDKYor75kRkLnJwokgSM34LYWKzZH
         0wfsurdGlSFut+PluTDHFJfAFu82NdpOrrJIf6/bIGAiWSTi4101YHagu1/pRy+FzF/f
         HVB/bQuCQWslKh1r7dPBXg79KXGxIbliMdUZA2o/eFHMDxbGjYbf4V57L5jmPEZknw9x
         OP7w==
X-Forwarded-Encrypted: i=1; AJvYcCWMCRlZG8vSdQLYq9vnv/YpZhIBe40M3yYmhTxNyC3RvhLClcFaH9f1PnD5jmpx+5HgMxqvn5/pmE1oYxOBk/j8D5+0FhY62jILbreaqIM=
X-Gm-Message-State: AOJu0YxBvpliKY6JphRp/83bKEfrgpciN9h4lzkk4N68nIYL++Tc0m1U
	+to6P9E1LT/kmqSm2spHa6mPmYvORCufgmWqSg4Gupzk4bGqC9W9blf8ar5oeQ==
X-Google-Smtp-Source: AGHT+IEzR3SnxNJm82vspv5KbX90mUjmOu2jPLODDSkt9aXW+HydS7OU5fqpSTX7S9928ONN20GtNQ==
X-Received: by 2002:a17:907:97d0:b0:a7a:aa35:4089 with SMTP id a640c23a62f3a-a7d40051478mr597724366b.24.1722268371401;
        Mon, 29 Jul 2024 08:52:51 -0700 (PDT)
Message-ID: <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
Date: Mon, 29 Jul 2024 17:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE extension
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -14,6 +14,38 @@
>  
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
> +#define SBI_SPEC_VERSION_MAJOR_SHIFT    24
> +#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
> +
> +/* SBI return error codes */
> +#define SBI_SUCCESS             0
> +#define SBI_ERR_FAILURE         -1
> +#define SBI_ERR_NOT_SUPPORTED   -2
> +#define SBI_ERR_INVALID_PARAM   -3
> +#define SBI_ERR_DENIED          -4
> +#define SBI_ERR_INVALID_ADDRESS -5

Parentheses around all the negative numbers please.

> +#define SBI_SPEC_VERSION_DEFAULT        0x1
> +
>  struct sbiret {
>      long error;
>      long value;
> @@ -31,4 +63,29 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
>   */
>  void sbi_console_putchar(int ch);
>  
> +/*
> + * Check underlying SBI implementation has RFENCE
> + *
> + * @return 1 for supported AND 0 for not-supported

In which case ...

> + */
> +int sbi_has_rfence(void);

... bool please.

> +/*
> + * Send SFENCE_VMA to a set of target HARTs.
> + *
> + * @param hart_mask mask representing set of target HARTs
> + * @param start virtual address start
> + * @param size virtual address size

Are these really virtual addresses, not somehow a bias and a number
of bits (CPUs) or elements? From the rest of the patch I can't deduce
what these two parameters express.

> + */
> +void sbi_remote_sfence_vma(const unsigned long *hart_mask,

Maybe better hart_mask[]? It's not clear to me though what the upper
bound of the array is.

> @@ -38,7 +48,253 @@ struct sbiret sbi_ecall(unsigned long ext, unsigned long fid,
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
> +    case SBI_ERR_FAILURE:
> +    default:
> +        return -EOPNOTSUPP;

Mapping FAILURE to -EOPNOTSUPP may end up confusing.

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
> +
> +static unsigned long sbi_minor_version(void)
> +{
> +    return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MASK;
> +}
> +
> +static long sbi_ext_base_func(long fid)
> +{
> +    struct sbiret ret;
> +
> +    ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
> +    if (!ret.error)

Nit: Blanks missing.

> +        return ret.value;
> +    else
> +        return ret.error;
> +}
> +
> +static void sbi_cpumask_to_hartmask(const struct cpumask *cmask,
> +                 struct cpumask *hmask)

I doubt it is valud to re-use struct cpumask for hart maps.

> +{
> +    u32 cpu;

uint32_t or yet better unsigned int please.

> +    unsigned long hart = INVALID_HARTID;
> +
> +    if (!cmask || !hmask)
> +        return;
> +
> +    cpumask_clear(hmask);
> +    for_each_cpu(cpu, cmask)
> +    {
> +        if ( CONFIG_NR_CPUS <= cpu )
> +        {
> +            printk(XENLOG_ERR "SBI: invalid hart=%lu for cpu=%d\n",

%u for the CPU please.

> +                     hart, cpu);

"hart" wasn't set yet and hence is invalid or at least misleading to
log.

Nit: Indentation.

> +            continue;

Can you really sensibly continue in such a case?

> +        }
> +
> +        hart = cpuid_to_hartid_map(pcpu_info[cpu].processor_id);

What does "_map" in the function/macro name signify?

> +        cpumask_set_cpu(hart, hmask);
> +    }
> +}
> +
> +static int __sbi_rfence_v02_real(unsigned long fid,
> +                 unsigned long hmask, unsigned long hbase,
> +                 unsigned long start, unsigned long size,
> +                 unsigned long arg4)

Nit: Indentation (more similar issues elsewhere).

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
> +        printk("%s: unknown function ID [%lu]\n",
> +               __func__, fid);
> +        result = -EINVAL;
> +        break;
> +    };
> +
> +    if ( ret.error )
> +    {
> +        result = sbi_err_map_xen_errno(ret.error);
> +        printk("%s: hbase=%lu hmask=0x%lx failed (error %d)\n",

%#lx (also elsewhere)

> +               __func__, hbase, hmask, result);
> +    }
> +
> +    return result;
> +}
> +
> +static int __sbi_rfence_v02(unsigned long fid,
> +                const unsigned long *hart_mask,
> +                unsigned long start, unsigned long size,
> +                unsigned long arg4, unsigned long arg5)
> +{
> +    struct cpumask tmask;
> +    unsigned long hart, hmask, hbase;
> +    int result;
> +
> +    if (!hart_mask)

Nit: Style (and more below). And I'm afraid I'm tired of making such
remarks. Please check style yourself before submitting.

> +static int sbi_spec_is_0_1(void)
> +{
> +    return (sbi_spec_version == SBI_SPEC_VERSION_DEFAULT) ? 1 : 0;

bool and no conditional operator

Jan

