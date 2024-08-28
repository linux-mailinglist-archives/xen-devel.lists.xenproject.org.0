Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A8962B06
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 17:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784969.1194401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjKCn-0001Aj-Re; Wed, 28 Aug 2024 15:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784969.1194401; Wed, 28 Aug 2024 15:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjKCn-00018H-ON; Wed, 28 Aug 2024 15:03:29 +0000
Received: by outflank-mailman (input) for mailman id 784969;
 Wed, 28 Aug 2024 15:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjKCl-000187-T5
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 15:03:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8693f8-654e-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 17:03:26 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a868d7f92feso871166766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 08:03:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5143dc6sm256111866b.0.2024.08.28.08.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 08:03:25 -0700 (PDT)
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
X-Inumbo-ID: ad8693f8-654e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724857406; x=1725462206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDVX7He1O/8M+9lQ6hRGuhTAR/5SuIZg5vw8mjOO8X8=;
        b=hATaX62QozmRUZYB4LmURPZL75+HLVyWSMDsz6hxLIpa902aJog1t16+3f5ahPk4NR
         PrWKtbOdZocs5L3F5ACo0FFHakDHzLjXcnNLTa3Detm4agauvk4f4ItLYzxgbGr7f2hf
         3ucTPAZxB2ogpI5dI+EeHqXH3UnkkuwTbB+mn9bmXk/W9fTVzgdritAADm661N8flgb2
         SJhN3IzJuOM/AcNaf9PYufwLxc00HN/3GdhJW5xAA3iUvoZZC4F06QbqrIWhsKKng56n
         Kcl3N6Dd7nDXAPUmcQ9h+LPrKOlK8ztLbV7LseN6tPxREDqlwSXB+7/G7u61TRREjTyU
         T+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724857406; x=1725462206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDVX7He1O/8M+9lQ6hRGuhTAR/5SuIZg5vw8mjOO8X8=;
        b=cjCT2Hej1+Kb0d7zFOfuiaM1MzbfYZ4atfNv4mrWxOKg3PB91crutdaSZrQzYjFbHE
         P5Yr1O+QswImO0Zo9U+iHuGKV76Sqm2BGOJEK5m5PScMiZnjGkWBKpZWHL4Qf/B0sUI4
         jMy1i3bXa3OU4eNvVQhk3PH7PMCqJukdI9eGO9vLz3KXw/kaRZbDGF6jrDeELXYW3Xk/
         YQPjJhAeyFpzWBc3DhZmgOaIk+FU3mK90D2/0BAuXAlmolSE75/FbXhxqVl2ZYVZPIvJ
         yAk2QVhGsu4TdTPJ5GfjbHtOiTyaj7J4N5P2bJrB9pXzqi4pSFWN54bk2k68uruO9PQ/
         GP7A==
X-Forwarded-Encrypted: i=1; AJvYcCVfkZ9S0FCRM+EYvyYbFNIJT4r8Nk867xDjKGuNcAerG5pI3JU+jGCnzCaiuVkKN1hV/b8m++E/Ac4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyFxIZniciHYlORS2B2281A0mytIH3G1tnrAIfmnktmSOez7Im
	kLIM8UfmkxdG71ARPnSIxZxO+5t4sMrQNaO4aDXkSOHBe13rnOlGgPu0P75wUw==
X-Google-Smtp-Source: AGHT+IFtOUWTC/kJ9aAYvUj2ubqs9ktLnqDAfsAmLBtj97DwAOurLqN0HJyTM4hY6qVKGFYQ0aJc3w==
X-Received: by 2002:a17:907:3f12:b0:a86:b042:585a with SMTP id a640c23a62f3a-a86b0425952mr1253240266b.57.1724857405518;
        Wed, 28 Aug 2024 08:03:25 -0700 (PDT)
Message-ID: <c7b8997d-8cbf-463e-bccd-ae850885f576@suse.com>
Date: Wed, 28 Aug 2024 17:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce and initialize SBI RFENCE
 extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <69da9fc18b9987285e4037ef08714e8f9faa66a7.1724256027.git.oleksii.kurochko@gmail.com>
 <10789eb4-ed96-48ab-860b-ec6f2d0e6341@suse.com>
 <d3fb6472f995646d9e998c847bfb2b9dc1488caa.camel@gmail.com>
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
In-Reply-To: <d3fb6472f995646d9e998c847bfb2b9dc1488caa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 15:11, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 16:19 +0200, Jan Beulich wrote:
>> On 21.08.2024 18:06, Oleksii Kurochko wrote:
>>> @@ -38,7 +51,265 @@ struct sbiret sbi_ecall(unsigned long ext,
>>> unsigned long fid,
>>>      return ret;
>>>  }
>>>  
>>> +static int sbi_err_map_xen_errno(int err)
>>> +{
>>> +    switch ( err )
>>> +    {
>>> +    case SBI_SUCCESS:
>>> +        return 0;
>>> +    case SBI_ERR_DENIED:
>>> +        return -EACCES;
>>> +    case SBI_ERR_INVALID_PARAM:
>>> +        return -EINVAL;
>>> +    case SBI_ERR_INVALID_ADDRESS:
>>> +        return -EFAULT;
>>> +    case SBI_ERR_NOT_SUPPORTED:
>>> +        return -EOPNOTSUPP;
>>> +    case SBI_ERR_FAILURE:
>>> +        fallthrough;
>>> +    default:
>>
>> What's the significance of the "fallthrough" here?
> To indicate that the fallthrough from the case SBI_ERR_FAILURE and
> default labels is intentional and should not be diagnosed by a compiler
> that warns on fallthrough. Or it is needed only when fallthough happen
> between switch's cases label ( not default label ) like in the
> following code ( should it be fallthrough here? ):
>     case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
>     case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
>     case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:

No, it's also not needed there. It's only needed when there are statements
in between.

> Additionally, I am considering whether the case SBI_ERR_FAILURE should
> be removed or if we should find the appropriate Xen error code for this
> case. I am uncertain which Xen error code from xen/errno.h would be
> appropriate.

There's nothing really suitable, I fear.

>>> +static unsigned long sbi_major_version(void)
>>> +{
>>> +    return MASK_EXTR(sbi_spec_version,
>>> SBI_SPEC_VERSION_MAJOR_MASK);
>>> +}
>>> +
>>> +static unsigned long sbi_minor_version(void)
>>> +{
>>> +    return MASK_EXTR(sbi_spec_version,
>>> SBI_SPEC_VERSION_MINOR_MASK);
>>> +}
>>
>> Both functions return less than 32-bit wide values. Why unsigned long
>> return types?
> We had this discussion in the previous patch series. Please look here:
> https://lore.kernel.org/xen-devel/253638c4-2256-4bdd-9f12-7f99e373355e@suse.com/

That was for the variables used here, not the functions. The functions
clip the values in the variables enough to no longer warrant wider-
than-int.

>>> +    if ( ret.error )
>>> +    {
>>> +        result = sbi_err_map_xen_errno(ret.error);
>>> +        printk("%s: hbase=%lu hmask=%#lx failed (error %d)\n",
>>> +               __func__, hbase, hmask, result);
>>
>> Considering that sbi_err_map_xen_errno() may lose information, I'd
>> recommend logging ret.error here.
> By 'lose information' you mean case SBI_ERR_FAILURE?

Or anything else hitting the default label there.

>>> +static int cf_check sbi_rfence_v02(unsigned long fid,
>>> +                                   const cpumask_t *cpu_mask,
>>> +                                   unsigned long start, unsigned
>>> long size,
>>> +                                   unsigned long arg4, unsigned
>>> long arg5)
>>> +{
>>> +    unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>>> +    int result;
>>> +
>>> +    /*
>>> +     * hart_mask_base can be set to -1 to indicate that hart_mask
>>> can be
>>> +     * ignored and all available harts must be considered.
>>> +     */
>>> +    if ( !cpu_mask )
>>> +        return sbi_rfence_v02_real(fid, 0UL, -1UL, start, size,
>>> arg4);
>>> +
>>> +    for_each_cpu ( cpuid, cpu_mask )
>>> +    {
>>> +        /*
>>> +        * Hart IDs might not necessarily be numbered contiguously
>>> in
>>> +        * a multiprocessor system, but at least one hart must have
>>> a
>>> +        * hart ID of zero.
>>
>> Does this latter fact matter here in any way?
> It doesn't, just copy from the RISC-V spec the full sentence. If it
> would be better to drop the latter fact I will be happy to do that in
> the next patch version.

You may certainly leave extra information, but then you want to somehow
express which part is relevant and which part is "extra". One way of
achieving such would imo be to actually state that you're quoting from
some spec.

>>> +        * This means that it is possible for the hart ID mapping
>>> to look like:
>>> +        *  0, 1, 3, 65, 66, 69
>>> +        * In such cases, more than one call to
>>> sbi_rfence_v02_real() will be
>>> +        * needed, as a single hmask can only cover sizeof(unsigned
>>> long) CPUs:
>>> +        *  1. sbi_rfence_v02_real(hmask=0b1011, hbase=0)
>>> +        *  2. sbi_rfence_v02_real(hmask=0b1011, hbase=65)
>>> +        *
>>> +        * The algorithm below tries to batch as many harts as
>>> possible before
>>> +        * making an SBI call. However, batching may not always be
>>> possible.
>>> +        * For example, consider the hart ID mapping:
>>> +        *   0, 64, 1, 65, 2, 66
>>
>> Just to mention it: Batching is also possible here: First (0,1,2),
>> then
>> (64,65,66). It just requires a different approach. Whether switching
>> is
>> worthwhile depends on how numbering is done on real world systems.
> For sure, it's possible to do that. I was just trying to describe the
> currently implemented algorithm. If you think it's beneficial to add
> that information to the comment, I can include it as well.

What I'd like to ask for is that you make a difference between "cannot"
and "we don't".

Jan

