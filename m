Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C436BB2C973
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 18:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086709.1444889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoP7u-0005yE-RG; Tue, 19 Aug 2025 16:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086709.1444889; Tue, 19 Aug 2025 16:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoP7u-0005wR-Od; Tue, 19 Aug 2025 16:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1086709;
 Tue, 19 Aug 2025 16:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoP7t-0005wL-BS
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 16:23:57 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e715c0ef-7d18-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 18:23:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7a3b3a9so794817266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 09:23:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4c90c8sm9179666b.79.2025.08.19.09.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 09:23:55 -0700 (PDT)
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
X-Inumbo-ID: e715c0ef-7d18-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755620635; x=1756225435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GV+5N3WlhEmPQywyRK1B/Hsutcc9qZV2JpT3bduLdsM=;
        b=MuxLrJCWop1iv0MoM8zTGEIa5MLTKie+7GXRnMCCDZHtb8+g0jlkQD9gSXF0GBZqWI
         W3O/Tc2HXDCTNnDEvgVOhsdjxks5zAU8lH3R26+sYNXbo98HFPq1wQUZh7s7FO2+RsZS
         BL1OxKp5mSF82mqaryeqCnuVVf2x0FLSqRpTd+jD9SQvlELbTjbQNqGpIK5SBN8qah5Z
         jECzpzee0wrn6SqhSa6pl5gQhgUmIW8bWnnl0sdzycw4nkNp3NMNjfKhmQ2U76/nvTGZ
         AnUqMrz/v/kuYYBI1nZawStIlhgVS/lTtfx72xBU1wegy3o7XBGycmZBgIhX8fQmjLGU
         Ts8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755620635; x=1756225435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV+5N3WlhEmPQywyRK1B/Hsutcc9qZV2JpT3bduLdsM=;
        b=SEmMDLoIQFsR+gE5ClfYYo4gBxpzRJnLm1S0f06wkeA85SNmRa1HDWkFwPJQezmAUf
         11qc6DPKScZd7maMkEi6BR5oucz6NB96rRV57vaH2CmVmgo0x74Pcp9VvnUWNBUmFdGC
         RACYUDns2nL83L9sxjKE2BVT9z4XkNAwo1dmVlweDZ5DqG8iluXYNQVsuE9erIfyZrVt
         V1ioE+RxVpHQ809t8zI+Ds6vwbpWFbo335FgbgmfKg5y/vXyfSKFzIBXjC4RMrO8Lae1
         7pRUD8Zb5Z8MNd/x+NtZG/acckUZU+y0F0Qdy893XnqiwWBOd1GC3mExIO2O0Fw1s4NM
         y+dw==
X-Forwarded-Encrypted: i=1; AJvYcCVebfQH1LeDelAxsn2rnNO8I7rdkLRKUKZcN3XyQ5ALfek431y+RdG9nHMKZfvcHHex1TRHEUTTDD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoDVuFawbEgoU+Bmcsn2Rsp/PR3X4ytOmdUjaOM86yH/QW3zHy
	cFeZIuH8d/d+t6D/ifUw8LDavhkaU1YlZn/MNBHvm/frVtmdNv7k7pFyrN7N3+LiAQ==
X-Gm-Gg: ASbGncsnQIC9axx6+Rg66XbOuzyFLM1YcytppgE0Tu0wAva30naiw0Gxn7Cc6ue0d1G
	R1g88XokNE5h27CDkid3mmEHjEScsRRgDXQJ2sv7fM1eidKqkwSQFefZFSdv0HAKv8JwtfVNiak
	o0cdg3d6tLiD2JoXGH40KQdFN7IYN0BoiL/NmHWVHAWnPMM7Ip5truDWdXCIf6833kiKn9og/6/
	l28uA/VOoK+I0Gli0TZgmt/D+S1Fo8ujU53XvYGy+rH0QQ64pg39KlKpdMkwKFj8EQLN/vpPV/u
	4o6hbpNsCXcYe//er6USKy2ct03hVRohlcSypsgaizb5uUu6IpZWIiOEs3H6nDn4hwyvEoJLECo
	JjQGTckEeAzumAhjxLw6pvOYY4bbvEiZXZxnJ7xGXwoAclmLxFcL3kl5U4Y3goqZghgkf5RX8KR
	duyDu1GvT5ATUpah3Rgw==
X-Google-Smtp-Source: AGHT+IF5b4IjrQx+w80DfoTMKy1X6rgWK8BTE6Kjru7Wen+oJdIdzBXg8X0NOQojKbeTO6Hk+tpQYA==
X-Received: by 2002:a17:907:3da2:b0:af9:3c05:b724 with SMTP id a640c23a62f3a-afddd0d23c7mr319008366b.40.1755620635479;
        Tue, 19 Aug 2025 09:23:55 -0700 (PDT)
Message-ID: <01ece885-1363-4aac-99ce-205354419400@suse.com>
Date: Tue, 19 Aug 2025 18:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-3-andrew.cooper3@citrix.com>
 <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
 <7b836f06-74ab-4588-8aeb-d0105b54be91@citrix.com>
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
In-Reply-To: <7b836f06-74ab-4588-8aeb-d0105b54be91@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2025 15:52, Andrew Cooper wrote:
> On 18/08/2025 12:27 pm, Jan Beulich wrote:
>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>> ... on capable toolchains.
>>>
>>> This avoids needing to hold rc in a register across the RDMSR, and in most
>>> cases removes direct testing and branching based on rc, as the fault label can
>>> be rearranged to directly land on the out-of-line block.
>>>
>>> There is a subtle difference in behaviour.  The old behaviour would, on fault,
>>> still produce 0's and write to val.
>>>
>>> The new behaviour only writes val on success, and write_msr() is the only
>>> place where this matters.  Move temp out of switch() scope and initialise it
>>> to 0.
>> But what's the motivation behind making this behavioral change? At least in
>> the cases where the return value isn't checked, it would feel safer if we
>> continued clearing the value. Even if in all cases where this could matter
>> (besides the one you cover here) one can prove correctness by looking at
>> surrounding code.
> 
> I didn't realise I'd made a change at first, but it's a consequence of
> the compiler's ability to rearrange basic blocks.
> 
> It can be fixed with ...
> 
>>
>>> --- a/xen/arch/x86/include/asm/msr.h
>>> +++ b/xen/arch/x86/include/asm/msr.h
>>> @@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>>>  /* rdmsr with exception handling */
>>>  static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
>>>  {
>>> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>>> +    uint64_t lo, hi;
>>> +    asm_inline goto (
>>> +        "1: rdmsr\n\t"
>>> +        _ASM_EXTABLE(1b, %l[fault])
>>> +        : "=a" (lo), "=d" (hi)
>>> +        : "c" (msr)
>>> +        :
>>> +        : fault );
>>> +
>>> +    *val = lo | (hi << 32);
>>> +
>>> +    return 0;
>>> +
>>> + fault:
> 
>     *val = 0;
> 
> here, but I don't want to do this.  Because val is by pointer and
> generally spilled to the stack, the compiler can't optimise away the store.

But the compiler is dealing with such indirection in inline functions just
fine. I don't expect it would typically spill val to the stack. Is there
anything specific here that you think would make this more likely?

> I'd far rather get a real compiler error, than to have logic relying on
> the result of a faulting MSR read.

A compiler error? (Hmm, perhaps you think of uninitialized variable
diagnostics. That may or may not trigger, depending on how else the
caller's variable is used.)

Jan

