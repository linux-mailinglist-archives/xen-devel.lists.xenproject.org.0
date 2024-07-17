Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A254933D7C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 15:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759988.1169701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU4W4-00070Q-Ud; Wed, 17 Jul 2024 13:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759988.1169701; Wed, 17 Jul 2024 13:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU4W4-0006xk-Rt; Wed, 17 Jul 2024 13:16:20 +0000
Received: by outflank-mailman (input) for mailman id 759988;
 Wed, 17 Jul 2024 13:16:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU4W3-0006xe-7F
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 13:16:19 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c061b56b-443e-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 15:16:17 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ee91d9cb71so69191611fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 06:16:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc509d2sm74776475ad.281.2024.07.17.06.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 06:16:16 -0700 (PDT)
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
X-Inumbo-ID: c061b56b-443e-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721222177; x=1721826977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ELFvhNM/rt3fq16pXm3bUgW+Iw7XQxF0ekLZIZt6IKU=;
        b=Y9VxM5lM82EoHaACqGHA31g58TLLJtGSP86a51eMnOpgeBVDabYqYNn384FiRkIVrN
         qUatS10zQp820Co1832q5vKI0EpclaVpuVj9v/FCZeCXdSLJo+yAeT3CX2uW1gjmDouN
         yMXknu5Naksf8LB577sFwWf+TBprulABdGJug9a0oE4oxJEp8Gltxd7uld1Q3swOAjZP
         cmD3Z55boHhBqGoHUBZKqIx1RmC8dLh9fnYWoAiNOa/9+kN+rXQ38aOl/mU2n30vwYvg
         9/Zqi/CwWpsJNhid9DJNUWeDQ0Vy+RaMtiFjVpXwOYQbaSABASPBnaN2sPgEsPfcWcJl
         o27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721222177; x=1721826977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELFvhNM/rt3fq16pXm3bUgW+Iw7XQxF0ekLZIZt6IKU=;
        b=KA8jq5eDue+QCUrwLdGvD5RB8Zs6suCBvE/oO4OPSZ7qSa3vzSdbkmzW3F2wgPTQ4+
         R8fG/bEraVfV/MfIXzkBNhndDYyZweUtYSLvuT0k48NdfAbah8zy+4tzFjURr3bgP3rN
         AqrXYPKZwAYThFr152u4o2/MJYaNnUd86BG+aQc1fpEPGd8y31kNAeUvk/pKPMV7gdNY
         nNv4Y1SMnXfGthA8b0TP2cXHWH+RXV60+77dLHM1HayQa81PYJXr/GhKqTltaoHRUgcX
         OFjpKAvgEvCApTaF8O8cp6s0QHFyhdzK/IwKng0nFMwpKErMlZnBu7JkCMP1llaFDN+w
         7lyA==
X-Forwarded-Encrypted: i=1; AJvYcCUmfXXN55gPQ0R3bBTkgyqserlRXJsZB7tvDFVicYyufp0hK65D6eBe4tfhYxumt8ys4HHhwZpvSfhpoaLdgoiHbP/GNgXHJPUSUzJc2a8=
X-Gm-Message-State: AOJu0Yx2ZuZQlKqOtevFE2bWXwb6PIOEVet7xVNkxsxJroKNXwpepwvI
	JkyWgcA12+0PyeMUN/0W+dFormnrMCZ/jqVaLMwSiMmDgHAMf06Kk5AwuZ6IVpjajG5R1J+7qvc
	=
X-Google-Smtp-Source: AGHT+IHKSSNmKuIjelaNuW1i/Lnp2Wni5eyV3lPqM552hWapVv2+k3yeg8e40rS0mkNcIs78o/arvg==
X-Received: by 2002:a05:651c:550:b0:2ee:7dfe:d99c with SMTP id 38308e7fff4ca-2eefd143c0cmr14969771fa.31.1721222177235;
        Wed, 17 Jul 2024 06:16:17 -0700 (PDT)
Message-ID: <a63fc95b-c698-4ddd-a16d-c167fa48aa11@suse.com>
Date: Wed, 17 Jul 2024 15:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: drop REX64_PREFIX
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <16b45b39-aadd-4a53-bcb9-214ded193db9@suse.com>
 <dd01ff4e-2f81-4291-b155-b2baa693548f@citrix.com>
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
In-Reply-To: <dd01ff4e-2f81-4291-b155-b2baa693548f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 15:05, Andrew Cooper wrote:
> On 17/07/2024 1:40 pm, Jan Beulich wrote:
>> While we didn't copy the full Linux commentary, Linux commit
>> 7180d4fb8308 ("x86_64: Fix 64bit FXSAVE encoding") is quite explicit
>> about gas 2.16 supporting FXSAVEQ / FXRSTORQ. As that's presently our
>> minimal required version, we can drop the workaround that was needed for
>> yet for older gas.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> It's especially nice to get rid of the __sun__ block, although having
> looked through this, ...
> 
>> --- a/xen/arch/x86/i387.c
>> +++ b/xen/arch/x86/i387.c
>> @@ -64,13 +64,12 @@ static inline void fpu_fxrstor(struct vc
>>      {
>>      default:
>>          asm volatile (
>> -            /* See below for why the operands/constraints are this way. */
>> -            "1: " REX64_PREFIX "fxrstor (%2)\n"
>> +            "1: fxrstorq %0\n"
>>              ".section .fixup,\"ax\"   \n"
>>              "2: push %%"__OP"ax       \n"
>>              "   push %%"__OP"cx       \n"
>>              "   push %%"__OP"di       \n"
>> -            "   mov  %2,%%"__OP"di    \n"
>> +            "   lea  %0,%%"__OP"di    \n"
>>              "   mov  %1,%%ecx         \n"
>>              "   xor  %%eax,%%eax      \n"
>>              "   rep ; stosl           \n"
>> @@ -81,7 +80,7 @@ static inline void fpu_fxrstor(struct vc
>>              ".previous                \n"
>>              _ASM_EXTABLE(1b, 2b)
> 
> ... the internals of the fixup section leave a lot to be desired.
> 
> My build happens to have emitted lea (%rdi), %rdi for this.

Yeah, that was supposed to be happening somewhere. I saw %rax and %rdx
once each, and using LEA there is still kind of a waste.

> A better option than opencoding memset() would be to simply return
> -EIO/-EFAULT like we do from *msr_safe(), writing the error path in C,
> and getting the system optimised memset() rather than using a form which
> is definitely sub-optimal on all 64bit processors.

I think the reason for having done this in assembly is to be able to
wire back to the faulting instruction. On top of what you say we could
do we'd then further need to put the whole thing in a loop, or add a
3rd FXSTOR. Which isn't to say that the overall result then isn't going
to be neater. What I'm not concerned of with this fallback code is
performance, though. That fixup path better wouldn't be taken anyway.

Jan

