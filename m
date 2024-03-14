Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185787B85C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692888.1080511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfGj-0003lR-7R; Thu, 14 Mar 2024 07:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692888.1080511; Thu, 14 Mar 2024 07:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfGj-0003j4-4d; Thu, 14 Mar 2024 07:12:49 +0000
Received: by outflank-mailman (input) for mailman id 692888;
 Thu, 14 Mar 2024 07:12:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkfGh-0003ir-4N
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:12:47 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 414cb66f-e1d2-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:12:45 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a467322d52eso22830966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 00:12:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b00a44e2f3024bsm407573eje.68.2024.03.14.00.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 00:12:44 -0700 (PDT)
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
X-Inumbo-ID: 414cb66f-e1d2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710400364; x=1711005164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEGIKWERXxJZZsP2GSvtxoFBn1i7L5TVlz/9PjvFIIg=;
        b=YU775gH72Tq9CChpUK+sszg0rOd6unSEEP3oKcNnhVDx9V3Pq50x0h1Sue5DUS9WOj
         IBEm1oz3S0VHckOR9/70YYxUiG/mVn7U1ZFk8MUOOkL5LzEA9qhv+0oC2UIj4iTbhqAY
         9OnLHCwAvmtPm4vfXMkeWNhKETIiaTmqMB+InyUh5sDkr77y/h1uIytLXuAG0tFNryZB
         LaHbLCV1KepKqnX+ClNB3QvIIMKJSrZVwlYTBPo7qWqZOSvCnRIpLMXIxd8KksuqHlg/
         FZmAZ8mZd7In/r158k1f2dGxRfp9YOVWaK6YDLMzyG4hWIawdruWBhsZ3pKcOvwAzFjO
         pi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400364; x=1711005164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEGIKWERXxJZZsP2GSvtxoFBn1i7L5TVlz/9PjvFIIg=;
        b=PtleGJuEE7pQiRUMcJ/RN+vxhG4Mqv1aHxMCSzwTR3UnxB61qyc9ACH+irPZhRgCX2
         re3DFguqT7oxy3eiOb6owcUq7RlhTx9V0V7scaOHscCIgx+7n5Ya1nru44AbxUA2qFc3
         jxNSjjliQxik/rM2C3cGdnEHk+qjFh/gO+h9w1ze+4Bs3SZ9D6v6dqp1KILfQvl7iBke
         5K2dbEgZwYMhZ1n1t4JqIZzTvxq99Y0ye77ovQw3CHNjYiGmT/S+yyJjrdSDlJEa0eyH
         47jl6Hi/lfpshdtQJePx6+sGn7sMaK2UwAEe2Uk83GRgzUNFc4kEUSpQgdklPGLN+86v
         5vgA==
X-Forwarded-Encrypted: i=1; AJvYcCX6rW2oomA5biTUbFyTMJiwghFe09hXZ8hUSxo2Xn/E8ySjszVvB9j1/8J7joRkuZkavrgQ5HVNSTJt50nK23OdjUrWA42nVKVYkX3Ey2g=
X-Gm-Message-State: AOJu0YweIGHWjFRdyqkcuiu9vwQ6CsKpSiarUUtOHsFJkCsgmseCZgUq
	FVdCYj/adHNetDOeqG9qGXznnKyzVkq9GixdP0mwHtYZo18wKReLw7k9DygOKg==
X-Google-Smtp-Source: AGHT+IHlAGzbMsO3qiuxPwesexCM+itoBYdRpP/Rr/YTkAsTZBpwUOjui8Fsp4B6W7gp2nn7qRDa4Q==
X-Received: by 2002:a17:906:6545:b0:a45:2e21:c78c with SMTP id u5-20020a170906654500b00a452e21c78cmr453720ejn.13.1710400364611;
        Thu, 14 Mar 2024 00:12:44 -0700 (PDT)
Message-ID: <ee471b89-b630-443d-8ad8-0ea384871137@suse.com>
Date: Thu, 14 Mar 2024 08:12:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <70daf607-03e7-4927-8ce2-5721ca3387ee@amd.com>
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
In-Reply-To: <70daf607-03e7-4927-8ce2-5721ca3387ee@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 22:02, Jason Andryuk wrote:
> On 2024-03-13 15:30, Jason Andryuk wrote:
>> +/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
>> +static paddr_t __init find_kernel_memory(
>> +    const struct domain *d, struct elf_binary *elf,
>> +    const struct elf_dom_parms *parms)
>> +{
>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>> +    paddr_t kernel_size = kernel_end - kernel_start;
>> +    unsigned int i;
>> +
>> +    /*
>> +     * The memory map is sorted and all RAM regions starts and sizes are
>> +     * aligned to page boundaries.
>> +     */
>> +    for ( i = 0; i < d->arch.nr_e820; i++ )
>> +    {
>> +        paddr_t start = d->arch.e820[i].addr;
>> +        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
>> +        paddr_t kstart, kend;
>> +
>> +        if ( d->arch.e820[i].type != E820_RAM )
>> +            continue;
>> +
>> +        if ( d->arch.e820[i].size < kernel_size )
>> +            continue;
>> +
>> +        kstart = ROUNDUP(start, parms->phys_align);
>> +        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;
> 
> This should be
>          kstart = MAX(kstart, parms->phys_min);

Except that MAX() really ought to be the last resort; max() and max_t()
want considering in preference.

Jan

