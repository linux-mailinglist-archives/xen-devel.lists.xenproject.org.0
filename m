Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20893758C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 11:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760938.1170904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjh9-0001jW-Pp; Fri, 19 Jul 2024 09:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760938.1170904; Fri, 19 Jul 2024 09:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUjh9-0001i1-MU; Fri, 19 Jul 2024 09:14:31 +0000
Received: by outflank-mailman (input) for mailman id 760938;
 Fri, 19 Jul 2024 09:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUjh7-0001hv-M2
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 09:14:29 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c79be6c-45af-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 11:14:28 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so23575411fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 02:14:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ccf7b2f300sm1094414a91.10.2024.07.19.02.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 02:14:26 -0700 (PDT)
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
X-Inumbo-ID: 4c79be6c-45af-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721380467; x=1721985267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nYuKqorvNH3x3saBcLhRLAXZjtCGyXm9P8WjxtissRY=;
        b=BIChjvQwWixLydoDkHX2MPJ7TaUwO1nIdg8Dht8y2YY7WRsWXVEx4OTMI1MXlOcA+1
         xvWPpuScZ4Boejfq8Cze1H4S+wKnTk5XmQC96WcMp097DEYGcth1dWtRtqPixVMn/5nH
         /49fliZxgCGhKgCOoTNGkLZXCQ7cZlRZf5g+DXvYFOG84947b/D0eSB34AlhDlLj2BTH
         9D4K2pQB1z9suxbPNldiwTI9MdFtb3D5fr+UVhgUS+L19bgR4We9dH9eb3GZlsQOsRXz
         YiiiSqLgZYNAvpwhYrsWnLiRNj6B1adHI7OVxSSneiagA9F9PbFRW74xautO5FDzi3Dd
         DHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721380467; x=1721985267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYuKqorvNH3x3saBcLhRLAXZjtCGyXm9P8WjxtissRY=;
        b=BaFtq3jpNccKwNwhBnYqK3jzx2Unh+EVAenycoNvezjdbwRW88Yq8Ex8TXyvoVNY+9
         DKnrY5sKqYZHl19OBL925147wWTIqJ3H/AfJCaqv+BXcIHq2Nz9yaLdfhiyK4eiIDXWJ
         khqgCUh9uDyB5hU1tVK3On4f1SlLMkX14qU6fGEQzaGrKMIM3BRrZq8dQLuI4dgImVau
         fJFfpvJWkoflJ5bEbouK0h5gZvoWK1sulpycNcyWN3vIw962az8RNGxGGgG+w9dy932O
         Yxlr2sKW/1U0eAAFtwlwayypqtJQBFtNL1cnsXkGv+cNFqytj2iOkeMHOjtxbrc7Q7eP
         hGKg==
X-Forwarded-Encrypted: i=1; AJvYcCXGXKV7oQ9WOuz4sktXmyKKk947ak2xLT0BXIbiRVs6UYXMnAlsHZD0V9hbwEzVqfOG/ccMbOzX2LLEXVgddNc2dFZVkjvTZ3DvEQqE9bY=
X-Gm-Message-State: AOJu0Yz7I47fa6vvOwi4lBGj2W0L+CWkltmmgN1oOPFj8hIJCKMU3joI
	ayZP0eZFQNTVc75MR2nuByZJ4Cg/frulIHQziR7/jti3w+oSIES0CRxNcYIQKz3Z+rRRiYBXF7o
	=
X-Google-Smtp-Source: AGHT+IHEbnddAncRuj9XUXgECejYLUMWDEiGvMXgZL3gngOuXD9Ieunuz2YfHBmuF4/1Qpqu30Vbig==
X-Received: by 2002:a2e:8912:0:b0:2ee:4e67:85e0 with SMTP id 38308e7fff4ca-2ef05c52c41mr35104491fa.3.1721380467021;
        Fri, 19 Jul 2024 02:14:27 -0700 (PDT)
Message-ID: <4cc61747-904c-4b00-a722-2c31f7d04c2d@suse.com>
Date: Fri, 19 Jul 2024 11:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 3/4] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <170c78f39dfef620d9060be3f1b31313673f09b9.1720538832.git.alejandro.vallejo@cloud.com>
 <78ae0b2f-e0a6-4ab9-b7a6-43e1357ff9b9@suse.com>
 <D2STLWUF9965.3QXLJ2TWIXS1Z@cloud.com>
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
In-Reply-To: <D2STLWUF9965.3QXLJ2TWIXS1Z@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2024 18:54, Alejandro Vallejo wrote:
> On Thu Jul 18, 2024 at 12:49 PM BST, Jan Beulich wrote:
>> On 09.07.2024 17:52, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/include/asm/domain.h
>>> +++ b/xen/arch/x86/include/asm/domain.h
>>> @@ -591,12 +591,7 @@ struct pv_vcpu
>>>  
>>>  struct arch_vcpu
>>>  {
>>> -    /*
>>> -     * guest context (mirroring struct vcpu_guest_context) common
>>> -     * between pv and hvm guests
>>> -     */
>>> -
>>> -    void              *fpu_ctxt;
>>> +    /* Fixed point registers */
>>>      struct cpu_user_regs user_regs;
>>
>> Not exactly, no. Selector registers are there as well for example, which
>> I wouldn't consider "fixed point" ones. I wonder why the existing comment
>> cannot simply be kept, perhaps extended to mention that fpu_ctxt now lives
>> elsewhere.
> 
> Would you prefer "general purpose registers"? It's not quite that either, but
> it's arguably closer. I can part with the comment altogether but I'd rather
> leave a token amount of information to say "non-FPU register state" (but not
> that, because that would be a terrible description). 
> 
> I'd rather update it to something that better reflects reality, as I found it
> quite misleading when reading through. I initially thought it may have been
> related to struct layout (as in C-style single-level inheritance), but as it
> turns out it's merely establishing a vague relationship between arch_vcpu and
> vcpu_guest_context. I can believe once upon a time the relationship was closer
> than it it now, but with the guest context missing AVX state, MSR state and
> other bits and pieces I thought it better to avoid such confusions for future
> navigators down the line so limit its description to the line below.

As said, I'd prefer if you amended the existing comment. Properly describing
what's in cpu_user_regs isn't quite as easy in only very few words. Neither
"fixed point register" nor "general purpose registers" really covers it. And
I'd really like to avoid having potentially confusing comments.

>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -507,9 +507,16 @@ int xstate_alloc_save_area(struct vcpu *v)
>>>      unsigned int size;
>>>  
>>>      if ( !cpu_has_xsave )
>>> -        return 0;
>>> -
>>> -    if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
>>> +    {
>>> +        /*
>>> +         * This is bigger than FXSAVE_SIZE by 64 bytes, but it helps treating
>>> +         * the FPU state uniformly as an XSAVE buffer even if XSAVE is not
>>> +         * available in the host. Note the alignment restriction of the XSAVE
>>> +         * area are stricter than those of the FXSAVE area.
>>> +         */
>>> +        size = XSTATE_AREA_MIN_SIZE;
>>
>> What exactly would break if just (a little over) 512 bytes worth were allocated
>> when there's no XSAVE? If it was exactly 512, something like xstate_all() would
>> need to apply a little more care, I guess. Yet for that having just always-zero
>> xstate_bv and xcomp_bv there would already suffice (e.g. using
>> offsetof(..., xsave_hdr.reserved) here, to cover further fields gaining meaning
>> down the road). Remember that due to xmalloc() overhead and the 64-byte-aligned
>> requirement, you can only have 6 of them in a page the way you do it, when the
>> alternative way 7 would fit (if I got my math right).
> 
> I'm slightly confused.
> 
> XSTATE_AREA_MIN_SIZE is already 512 + 64 to account for the XSAVE header,
> including its reserved fields. Did you mean something else?

No, I didn't. I've in fact commented on it precisely because it is the value
you name. That's larger than necessary, and when suitably shrunk - as said -
one more of these structures could fit in a page (assuming they were all
allocated back-to-back, which isn't quite true right now, but other
intervening allocations may or may not take space from the same page, so
chances are still that the ones here all might come from one page as long as
there's space left).

>     #define XSAVE_HDR_SIZE            64
>     #define XSAVE_SSE_OFFSET          160
>     #define XSTATE_YMM_SIZE           256
>     #define FXSAVE_SIZE               512
>     #define XSAVE_HDR_OFFSET          FXSAVE_SIZE
>     #define XSTATE_AREA_MIN_SIZE      (FXSAVE_SIZE + XSAVE_HDR_SIZE)
> 
> Part of the rationale is to simplify other bits of code that are currently
> conditionalized on v->xsave_header being NULL. And for that the full xsave
> header must be present (even if unused because !cpu_xsave)

But that's my point: The reserved[] part doesn't need to be there; it's
not being accessed anywhere, I don't think.

Jan

