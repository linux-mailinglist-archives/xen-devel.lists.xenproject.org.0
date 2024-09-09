Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8102971677
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794322.1203140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncQl-000468-3j; Mon, 09 Sep 2024 11:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794322.1203140; Mon, 09 Sep 2024 11:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncQl-00043a-0h; Mon, 09 Sep 2024 11:19:39 +0000
Received: by outflank-mailman (input) for mailman id 794322;
 Mon, 09 Sep 2024 11:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sncQj-00043U-Ss
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:19:37 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65115046-6e9d-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 13:19:35 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso387797466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:19:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced18csm325424666b.161.2024.09.09.04.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:19:34 -0700 (PDT)
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
X-Inumbo-ID: 65115046-6e9d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725880775; x=1726485575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+fQeR3ACRhCtcTHiGlm4zAY+KUZ0n3gCYmZxvneWBtQ=;
        b=NgpTLzidhQHldhnRc5BqqR7x4dmMm2BXsHFvtzrEH7RAo/6/rUEOpcJ6Lo1dvd5c90
         4qRJgm2NBx8gjFxKDgeiuaKyjLhdqYz3p25y+I0FxsB0hhNxc5l+dWi+uvlkMKwdEu9z
         kdgCfiy504o4TdspItD1dqJicqhcyVTfJWMym4it8a/RU+DQ7a3ZJklU8OHHWn2tkkRk
         3cXphfbsyXyYSha2BToO/Qq9CuFTDJ9aNGPU8JK5ZkyOQX4yX4uPJ9y6MW3mY19xiWIO
         ScFkiCwfNceHl/OsJAr4HCy6qiUQ1y+yLN8vIExYNTVu+34BUCDszwUNVvse38q9kNJh
         6UPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880775; x=1726485575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fQeR3ACRhCtcTHiGlm4zAY+KUZ0n3gCYmZxvneWBtQ=;
        b=tko+UJL3Qi0YzV37Zjrj6Lfvv2aMsrp6J0M4E0RhbKvNFPKJj8kwzR7yx+boo37hRH
         WOr6AtUaSeI2Nx/J1QP78ajDAnoPbpZjxGEKdmXMcr/l2UJpKNVyVnD3fBmF4ZP4pZqb
         XkUprAvazAjx5I56pG3jx3hH/L+24A8skXPmKl47OaSpKQBc7frieygDFhdYQ3oRTVWv
         r0WcDqYMMhBTxppAiXDtjawMHa5HTlB+7UZIKWSi8bZVaGUn6JzAclFWGZMTaYEOKp9p
         CfrLAisXB/DycIYTX8PpdiY1cGblEvwXnn6W+YExZVB0fpF5R7LWDBZYzkfcKsaEMpnr
         UoyA==
X-Forwarded-Encrypted: i=1; AJvYcCVaG7pM7XoiKoJE0vhZVsh4DfjIQx6diuDjt7zaeEpl7jkG8C6+Su2yQafQ8fSACC95KLNRNKsYHOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDdLjx+YThDDrayoO4NaZxU+j88N75xxrInTD+vaN8p7bzKxkY
	HiIzUBAnFsPrsnFbrH38ueMUp2EDe0eIdBreMxY8Gy2xnvJuu+cLRlRdebWk6qozY9QoaCOmdiw
	=
X-Google-Smtp-Source: AGHT+IGk1TaeJ6zhScoOnIUMskyqv7rohpv5ze43vAW1asIi1TUixCQLcA/klbqzRuLyH4lindV8kA==
X-Received: by 2002:a17:907:944c:b0:a8d:2ab2:c990 with SMTP id a640c23a62f3a-a8d2ab2cce5mr504083866b.64.1725880775021;
        Mon, 09 Sep 2024 04:19:35 -0700 (PDT)
Message-ID: <a125d91f-443b-43bc-aeff-0c6efdcb0686@suse.com>
Date: Mon, 9 Sep 2024 13:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: allocate emulation cache entries dynamically
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
 <e35606db-9050-485a-84fb-168f101b5d1c@suse.com>
 <53ecfaa0-3be1-4da0-ad8d-8245512e4172@citrix.com>
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
In-Reply-To: <53ecfaa0-3be1-4da0-ad8d-8245512e4172@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.09.2024 21:20, Andrew Cooper wrote:
> On 04/09/2024 2:29 pm, Jan Beulich wrote:
>> Both caches may need higher capacity, and the upper bound will need to
>> be determined dynamically based on CPUID policy (for AMX at least).
> 
> Is this to cope with TILE{LOAD,STORE}, or something else?

These two, yes.

> It's not exactly clear, even when looking at prior AMX series.

I've added mention of them.

>> While touching the check in hvmemul_phys_mmio_access() anyway, also
>> tighten it: To avoid overrunning the internal buffer we need to take the
>> offset into the buffer into account.
> 
> Does this really want to be mixed with a prep patch ?

Taking the offset into account becomes more important with subsequent
patches. If needed, I can certainly split this out into its own prereq
patch.

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
>> +    unsigned int dir:1;
>> +    uint8_t buffer[] __aligned(sizeof(long));
> 
> I know this is a minor tangent, but you are turning a regular struct
> into a flexible one.
> 
> Could we introduce __counted_by() and start using it here?
> 
> At the toolchain level, it lets the compiler understand the real size of
> the object, so e.g. the sanitisers can spot out-of-bounds accesses
> through the flexible member.
> 
> But, even in the short term, having
> 
>     /* TODO */
>     # define __counted_by(member)
> 
> in compiler.h still leaves us with better code, because
> 
>     struct hvm_mmio_cache {
>         unsigned long gla;
>         unsigned int size;
>         unsigned int space:31;
>         unsigned int dir:1;
>         uint8_t buffer[] __aligned(sizeof(long)) __counted_by(size);
>     };
> 
> is explicitly clear in a case where the "space" field creates some
> ambiguity.

Which raises a question here: Is it really "size" that you mean, not
"space"? It's the latter that describes the capacity after all.

As to __counted_by() (or counted_by()) introduction: While is seems
pretty orthogonal, I could of course add a prereq patch to introduce it.
Yet - even if I had it expand to nothing for now, what do you expect it
to expand to going forward? I've just gone through docs trying to find
something to match, yet with no success.

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
> 
> Hang on.  Do we seriously use a separate cache entry for each
> instruction byte ?

We don't _use_ one, but we set up one. Already prior to this patch; the
comment merely moves (and is extended to mention the slack space aspect).
Also note that it is only the other (read) cache this is relevant for,
not the (MMIO) cache this series as a whole is about.

Jan

