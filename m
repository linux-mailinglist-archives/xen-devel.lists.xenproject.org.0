Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0765A192BE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 14:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875958.1286358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taaxR-0003Pd-CO; Wed, 22 Jan 2025 13:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875958.1286358; Wed, 22 Jan 2025 13:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taaxR-0003NK-9a; Wed, 22 Jan 2025 13:39:49 +0000
Received: by outflank-mailman (input) for mailman id 875958;
 Wed, 22 Jan 2025 13:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taaxQ-0003NE-7u
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 13:39:48 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57d31ec6-d8c6-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 14:39:46 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385df53e559so5239090f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 05:39:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31898ebsm24953605e9.2.2025.01.22.05.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 05:39:45 -0800 (PST)
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
X-Inumbo-ID: 57d31ec6-d8c6-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737553185; x=1738157985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v95tgaJmKqaerP+y0ayp/BZjOw5ZF5qeHKhaytqL1x8=;
        b=fa8NY9Wye4FvWI4CFuUEDhhcP1bAlMtL8zz/JOo3NCcfvoGdeLQIkgAL1M2EgPhXqE
         iOFPpj7M5oWpjIDOBJaxWnEWaqA737VdMshXvDg02mtfIueU+9u23qp5KxfOXIgSblYf
         FEQATuNtqvDIvgEtN/PSYfVAlu03DIlSXiRQ6D40o1ADm3RsNY6UrcIyGeTUxYxUWqPX
         zrHEHmMspmdDH/hf2OqTGM1YjCR01SZnQnHFSHjXUesAi2ke1hxukc471d3NPP/dHUlD
         NRHXwlk+NkK6H/AIXOSwJMjWo1+x+SGVXBg4UTPqkwHoJwBmOMSDJnHIq0B+Rzq/Nfrm
         MMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737553185; x=1738157985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v95tgaJmKqaerP+y0ayp/BZjOw5ZF5qeHKhaytqL1x8=;
        b=GmUJO3wV/IqGHyzUy0UxG8EErFT7zQSXLar4N9f8PwLKNfCY/zHp7w3yJd7xR5gORw
         59lJprcKBcuio8NQVlk71KUpIoQgbIfECU3vuBVBanQDOE9BsJn4TBrKIVWj2MVzmnZw
         1Ml+5EUgWyFxNcWU0CbS0Y0uFZz3e5+6mIFQYj48fW/0MJecbhHNSGC02xjSFxtE0Bq1
         GkqdKH6pkP7mzFIszujW98gkE4Rd/vcfUClgu0nfSHqel6L1bJUa73Vcav4vI/pnRwbx
         m6PnQyomh9oTyZBf/m3zA1rQSLUbJS6T291vO7WlZBenpteSBv2K7AJ/VE7WXmwHeJHa
         3fuw==
X-Gm-Message-State: AOJu0YzjzY23NSeOMcBCQapgr9wY4A6Ix++6wDPtV+3EJbU78RiDK9oz
	o5Y3y5LWQIyRDdq83wFJqdOTYcUfHbydaDHtN4dkvQShfgP4DckT5wBSreawHQ==
X-Gm-Gg: ASbGncvd1oAwdXKreiTTysFNkVlBZDTtD6BqOmbIY6ehPdaYkrn9dZ8Oj4XDsYwjs36
	aa8G7BfnX11dchAkmG527+VfZztq5aQw8WjKpvBcvcuU9pbIyUP3BmNmw5Gmx8/bh4NCtWWLqe8
	dVMToFX8lqISelIpByuXQFcLLtpoGYd8+tv0BihGTDzaUYXY0ftVnDbJRVVUwJ0Rs1wPx1OwNwL
	B+mXSDl7x18GFGvG7KWkq2/hTRIN7KegVfprHKfSnrAeb6GMrhfLRKHLy1whIbwIlMh1BoYLGOp
	3uWs5TnhbPWMSBj2ZEpxVmEsId10nbXFmP1KMN0nROfnW0ywKnvZEAo=
X-Google-Smtp-Source: AGHT+IGK23Ry5+z/NqYZmgYaPVVCHAkS4RFBrRqq+UU7Oy2qOkbUvSRtlFBCFu8Z7LBD0EcRz3eIiQ==
X-Received: by 2002:a5d:6c68:0:b0:38b:ed7b:f791 with SMTP id ffacd0b85a97d-38bf5655caamr18227966f8f.5.1737553185517;
        Wed, 22 Jan 2025 05:39:45 -0800 (PST)
Message-ID: <de1934b8-b7c9-472f-9b9e-5183a5a34b65@suse.com>
Date: Wed, 22 Jan 2025 14:39:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/HVM: allocate emulation cache entries
 dynamically
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
 <93967ab8-a472-475a-bdd6-41dfc3afa895@suse.com>
 <Z5Ddzh-Ygy5cGuPj@macbook.local>
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
In-Reply-To: <Z5Ddzh-Ygy5cGuPj@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.01.2025 13:00, Roger Pau Monné wrote:
> On Tue, Oct 01, 2024 at 10:49:10AM +0200, Jan Beulich wrote:
>> Both caches may need higher capacity, and the upper bound will need to
>> be determined dynamically based on CPUID policy (for AMX'es TILELOAD /
>> TILESTORE at least).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Just a couple of comments below.
> 
>> ---
>> This is a patch taken from the AMX series, but wasn't part of the v3
>> submission. All I did is strip out the actual AMX bits (from
>> hvmemul_cache_init()), plus of course change the description. As a
>> result some local variables there may look unnecessary, but this way
>> it's going to be less churn when the AMX bits are added. The next patch
>> pretty strongly depends on the changed approach (contextually, not so
>> much functionally), and I'd really like to avoid rebasing that one ahead
>> of this one, and then this one on top of that.
> 
> Oh, I was just going to ask about the weirdness of nents compared to
> what was previously.

And then you did ask; I'll comment on that below.

>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -26,6 +26,18 @@
>>  #include <asm/iocap.h>
>>  #include <asm/vm_event.h>
>>  
>> +/*
>> + * We may read or write up to m512 or up to a tile row as a number of
>> + * device-model transactions.
>> + */
>> +struct hvm_mmio_cache {
>> +    unsigned long gla;
>> +    unsigned int size;
>> +    unsigned int space:31;
> 
> Having size and space is kind of confusing, would you mind adding a
> comment that size is the runtime consumed buffer space, while space is
> the total allocated buffer size (and hence not supposed to change
> during usage)?

Sure; I thought the two names would be clear enough when sitting side by
side, but here you go:

    unsigned int size;     /* Amount of buffer[] actually used. */
    unsigned int space:31; /* Allocated size of buffer[]. */


>> @@ -2978,16 +2991,21 @@ void hvm_dump_emulation_state(const char
>>  int hvmemul_cache_init(struct vcpu *v)
>>  {
>>      /*
>> -     * No insn can access more than 16 independent linear addresses (AVX512F
>> -     * scatters/gathers being the worst). Each such linear range can span a
>> -     * page boundary, i.e. may require two page walks. Account for each insn
>> -     * byte individually, for simplicity.
>> +     * AVX512F scatter/gather insns can access up to 16 independent linear
>> +     * addresses, up to 8 bytes size. Each such linear range can span a page
>> +     * boundary, i.e. may require two page walks.
>> +     */
>> +    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
>> +    unsigned int i, max_bytes = 64;
>> +    struct hvmemul_cache *cache;
>> +
>> +    /*
>> +     * Account for each insn byte individually, both for simplicity and to
>> +     * leave some slack space.
>>       */
>> -    const unsigned int nents = (CONFIG_PAGING_LEVELS + 1) *
>> -                               (MAX_INST_LEN + 16 * 2);
>> -    struct hvmemul_cache *cache = xmalloc_flex_struct(struct hvmemul_cache,
>> -                                                      ents, nents);
>> +    nents += MAX_INST_LEN * (CONFIG_PAGING_LEVELS + 1);
>>  
>> +    cache = xvmalloc_flex_struct(struct hvmemul_cache, ents, nents);
> 
> Change here seems completely unrelated, but I guess this is what you
> refer to in the post-commit remark.  IOW: the split of the nents
> variable setup, plus the change of xmalloc_flex_struct() ->
> xvmalloc_flex_struct() don't seem to be related to the change at
> hand.

See the post-commit-message remark that you commented on. To repeat:
It'll be quite a bit easier for me if the seemingly unrelated adjustments
could be kept like that. Unless of course there's something wrong with
them.

>> @@ -2997,6 +3015,15 @@ int hvmemul_cache_init(struct vcpu *v)
>>  
>>      v->arch.hvm.hvm_io.cache = cache;
>>  
>> +    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
>> +    {
>> +        v->arch.hvm.hvm_io.mmio_cache[i] =
>> +            xmalloc_flex_struct(struct hvm_mmio_cache, buffer, max_bytes);
> 
> TBH I would be tempted to just use xvmalloc here also, even if the
> structure is never going to be > PAGE_SIZE, it's more consistent IMO.

Oh, absolutely under the current rules (which weren't in effect yet back
when all of this was written).

Jan

