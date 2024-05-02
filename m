Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A561F8B9C5B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715852.1117804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XVa-0002Qr-7c; Thu, 02 May 2024 14:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715852.1117804; Thu, 02 May 2024 14:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2XVa-0002P5-3u; Thu, 02 May 2024 14:34:02 +0000
Received: by outflank-mailman (input) for mailman id 715852;
 Thu, 02 May 2024 14:34:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2XVY-0002Ov-Rs
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:34:00 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03649f15-0891-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 16:33:59 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-34d7a32bdd3so1798205f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:33:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfef92000000b0034c71090653sm1393418wro.57.2024.05.02.07.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 07:33:58 -0700 (PDT)
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
X-Inumbo-ID: 03649f15-0891-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714660439; x=1715265239; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBcZ19biHtw7JmPakETY+HmASRLKwRBwP7yYtSvbndg=;
        b=HBB4WvNN6mFhJE8y2rEf52I253B2lX6/LjR+AwLvY3Bnnj010/7amV5+2tNBYzxP1P
         VFu/vop4+TgppqaCba5Pdls+LYIXiyqeYJ1GmjkooHdE49+URcIqxEGRi0Zb/gs5kUps
         c7oYet1q6EgBrTVnzqlYT6FruJhpFGkeKEhxu0GLyIAf0OMfv3izs9jC1G3MEHGOvx45
         EuhBr46p0qH3n9Y13AF8cO6L9GGzR35Kf0VkaDJEfSOGTJNu+FYS09+P2420dL3Ka0yP
         dRUYFvQ7RY5DQ6i1sGe8QmXqjkNZEpd0hniFbhujttF9EPFwy99rZiL/jKowyUr59vVP
         wKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660439; x=1715265239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBcZ19biHtw7JmPakETY+HmASRLKwRBwP7yYtSvbndg=;
        b=Fouesxrk2vwSdDhgcbfV6bYNamT6hA+J0aWHJWgdS5GD7UpsbtlZMntVjifdzJ/nnq
         JnHiNjTDeXwLdYVE0aIraoNc/Y/fMdHzLyQ4ypIsFimlNejBJhKshS3wg7PC0lfRq54P
         aCFnxONohKZu1b6FYXm6HR2Bnqh1CaU3ayH/UzKUepQAyQB+FVpbJTrS/G5DDPURumuN
         WaPB5cLo5AsG/09+w6/2UiMf0bqJ6dHVYujjjgavtTkuHxHJbpbiMSzdd+sqTCIhBzlQ
         IhgRNLZSnku3L/5Zs3GZzU4WO+bX2jAch/0/DhaMxWyV2VyVf9+YDTJt4xA9CN5tLy47
         idtg==
X-Forwarded-Encrypted: i=1; AJvYcCXBC62NvvOergSxNShsAVq9ERRSiLamfTJ8uea5DU7KICHYY/sh29N5PCSewCEOIA+9Sj3nU1giaItcpkCpwL7grqImZxhQR0U0NEelgYI=
X-Gm-Message-State: AOJu0Yx9yh0sPL7Y7qFB/BXZsiABEgzhhso4HenA98OSXJ+PMLNfEdCV
	lP0k0uiEF/72FZrNV3iJxI2+kYDlFn72/mH1JzJ92JqaFGUuvBTbOj8am3fuLw==
X-Google-Smtp-Source: AGHT+IF3IhUroj06pFWq7wLgGIHKh19EZOY0W6AgDpgXhf5bFTmHZ8i62IhgS4sQZctFnOtHl2iviA==
X-Received: by 2002:a5d:6449:0:b0:349:eb59:c188 with SMTP id d9-20020a5d6449000000b00349eb59c188mr5510wrw.5.1714660438816;
        Thu, 02 May 2024 07:33:58 -0700 (PDT)
Message-ID: <dad023f2-c74b-4067-a3e3-4236d9424689@suse.com>
Date: Thu, 2 May 2024 16:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] x86/cpu-policy: Simplify recalculate_xstate()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
 <20240429182823.1130436-4-andrew.cooper3@citrix.com>
 <ecd6e142-7a08-46e8-83c0-7d9b0bc6f66f@suse.com>
 <b5560120-96c5-4b97-a4cc-36fbcfdd223c@citrix.com>
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
In-Reply-To: <b5560120-96c5-4b97-a4cc-36fbcfdd223c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 15:24, Andrew Cooper wrote:
> On 02/05/2024 1:39 pm, Jan Beulich wrote:
>> On 29.04.2024 20:28, Andrew Cooper wrote:
>>> Make use of the new xstate_uncompressed_size() helper rather than maintaining
>>> the running calculation while accumulating feature components.
>> xstate_uncompressed_size() isn't really a new function, but the re-work of
>> an earlier one. That, aiui, could have been used here, too, just that it
>> would have been inefficient to do so. IOW perhaps drop "the new"?
> 
> Ok.
> 
>>
>>> The rest of the CPUID data can come direct from the raw cpu policy.  All
>>> per-component data form an ABI through the behaviour of the X{SAVE,RSTOR}*
>>> instructions.
>>>
>>> Use for_each_set_bit() rather than opencoding a slightly awkward version of
>>> it.  Mask the attributes in ecx down based on the visible features.  This
>>> isn't actually necessary for any components or attributes defined at the time
>>> of writing (up to AMX), but is added out of an abundance of caution.
>> As to this, ...
>>
>>> @@ -206,61 +205,47 @@ static void recalculate_xstate(struct cpu_policy *p)
>>>          return;
>>>  
>>>      if ( p->basic.avx )
>>> -    {
>>>          xstates |= X86_XCR0_YMM;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_YMM_POS] +
>>> -                          xstate_sizes[X86_XCR0_YMM_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.mpx )
>>> -    {
>>>          xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
>>> -                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.avx512f )
>>> -    {
>>>          xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
>>> -                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.pku )
>>> -    {
>>>          xstates |= X86_XCR0_PKRU;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_PKRU_POS] +
>>> -                          xstate_sizes[X86_XCR0_PKRU_POS]);
>>> -    }
>>>  
>>> -    p->xstate.max_size  =  xstate_size;
>>> +    /* Subleaf 0 */
>>> +    p->xstate.max_size =
>>> +        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
>>>      p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
>>>      p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
>>>  
>>> +    /* Subleaf 1 */
>>>      p->xstate.Da1 = Da1;
>>> +    if ( p->xstate.xsavec )
>>> +        ecx_mask |= XSTATE_ALIGN64;
>>> +
>>>      if ( p->xstate.xsaves )
>>>      {
>>> +        ecx_mask |= XSTATE_XSS;
>>>          p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
>>>          p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>>      }
>>> -    else
>>> -        xstates &= ~XSTATE_XSAVES_ONLY;
>>>  
>>> -    for ( i = 2; i < min(63UL, ARRAY_SIZE(p->xstate.comp)); ++i )
>>> +    /* Subleafs 2+ */
>>> +    xstates &= ~XSTATE_FP_SSE;
>>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>      {
>>> -        uint64_t curr_xstate = 1UL << i;
>>> -
>>> -        if ( !(xstates & curr_xstate) )
>>> -            continue;
>>> -
>>> -        p->xstate.comp[i].size   = xstate_sizes[i];
>>> -        p->xstate.comp[i].offset = xstate_offsets[i];
>>> -        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
>>> -        p->xstate.comp[i].align  = curr_xstate & xstate_align;
>> ... for this bit, isn't the move from this ...
>>
>>> +        /*
>>> +         * Pass through size (eax) and offset (ebx) directly.  Visbility of
>>> +         * attributes in ecx limited by visible features in Da1.
>>> +         */
>>> +        p->xstate.raw[i].a = raw_cpu_policy.xstate.raw[i].a;
>>> +        p->xstate.raw[i].b = raw_cpu_policy.xstate.raw[i].b;
>>> +        p->xstate.raw[i].c = raw_cpu_policy.xstate.raw[i].c & ecx_mask;
>> ... to this changing what guests get to see, i.e. (mildly?) incompatible?
> 
> No.
> 
> The only "rows" in leaf 0xd we expose to guests are AVX, MPX, AVX512 and
> PKU  (higher up in this hunk, selecting valid bits in xstates).  None of
> these have a non-zero value in ecx.
> 
> This is a latent bug until we offer AMX or CET, hence why I wanted to
> complete this series before your AMX series goes in.

Oh, so finally a description of that very issue you kept mentioning. With
the small tweak to the description then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

