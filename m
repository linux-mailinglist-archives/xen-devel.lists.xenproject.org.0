Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E348A6D7D6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925202.1328076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweP8-00032i-28; Mon, 24 Mar 2025 09:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925202.1328076; Mon, 24 Mar 2025 09:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweP7-0002zk-U8; Mon, 24 Mar 2025 09:47:33 +0000
Received: by outflank-mailman (input) for mailman id 925202;
 Mon, 24 Mar 2025 09:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tweP7-0002ze-12
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:47:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00d14cc6-0895-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 10:47:30 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso34761555e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 02:47:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafb7sm117663685e9.1.2025.03.24.02.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 02:47:29 -0700 (PDT)
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
X-Inumbo-ID: 00d14cc6-0895-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742809650; x=1743414450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eP2rFkH0VqSJEG5SKtL8l4OL0xSxnIb7jOADq52p4Qk=;
        b=AbcR26UuoDB1UIz/7378OhHH68iQlWRM/eZcB26erohc65eidfzNnqTqNgJe/3Xhmw
         e36zgejeTmd8QnopY1C+xHPXkpTN7+vXZAXYUR/B5xN12qBacsCZnIgs+5yn9fEUMz/L
         M3a+C7WCR/VUR6rGy9R+bRwQZS/kH9BBVPLvJ/KbpLZ+16Op/tmAn+ZMYumUjvPfKgNJ
         3wUSLDvhMN/2eQDEbOD3S2O3WbrpXieGgx/KwrpktOcuY0smCpRx/YHEodCS0gzA+Z30
         dsibt69k/chhYaYn5yCTXBj6WDi9XqvlmBapQ2rms9SsAfFf5ee8On3QB2TCV7Z5zhb2
         fqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742809650; x=1743414450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eP2rFkH0VqSJEG5SKtL8l4OL0xSxnIb7jOADq52p4Qk=;
        b=sjcRJpRIT8lYVwjZ84xPYGCbgWbPWsJ1h+vE1+9AAJQ+0Ery3o7pvr+yabWfTLZ6d7
         9uaMnO0mE9P+kHCoLQN/H91rLFC7FR0g/aXn5H+CLkFOR9gcNwHfscf+EHaeQTceOsrs
         IINcp4X3TtaxtJ4G4Jq3BpS4IvW768Sf5zqwLrqRu1E1BoVQNkO9OIdAsj86tv6oiUv5
         u4cNk+/C5MqX55qISO7tAvjn6kEkdf0UTrl+1ohVqxjEkMwE9bKJt7Tp3TQVwkkDHac4
         3zWf0356cqvpLZTA7wtoB5/FOOKw4IfMCkR3PPvud+rWvIZjjU4ZkkzvYq64YFz9FgKg
         NsdA==
X-Gm-Message-State: AOJu0YzwuZqjD3HjdU5w8+jzlRaO8QEl+EWCLZiMGBl+hEOmOBKNAF4N
	tlRSFu0IEZSO0tqHXRDeN2xlIUQutmG7TGpRiUtf4jaLTqyyVI6mtS+QZXsvLA==
X-Gm-Gg: ASbGnctSfU3oB16pR8x+5IR1Af8Hj5qRd2Rt4nohrsxCbJH/U2a28H72Kgztb1v6e7B
	yVZEBaTO80Rzb8ycwVmwhkfVgAQhB+Up4XoYUvSsbnKqEUFtf5y/wFfxa4s/Jc9AFHZhXLtOe2I
	DpGB8AbUYD1La8ZrDTCVYbd/NBLHBcSrUXmnMUMWU5wAmlNP6hWL1FqhdJyT0FXBiGGM+QW3/fM
	xjK2JNZWYxRxbLWVsQRsao7/E7TOUI3Ki+ZDVEVntKJ7t0PjYrrPJQQtXznnTJyRPQGHmy+NVHZ
	kyP4RCD4agKIKRtBydyyf27ptKhA8E5R6NqqjScBIRbLbG7F/JjPy1RYcpZ23bO0W7R73CLGFbr
	BvS3bps4SLcvq85OfoqMMsyLPpRWC1Q==
X-Google-Smtp-Source: AGHT+IFkqvBFhYQsIjF6IYX4xUrjNaoNgwzQl44VzeTnUXGjajFImZ9CovyEycxjrjs7EuHAiF/FZQ==
X-Received: by 2002:a05:600c:4e56:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43d50a36910mr113269365e9.30.1742809649971;
        Mon, 24 Mar 2025 02:47:29 -0700 (PDT)
Message-ID: <fdbb0485-ec42-41c2-8fa5-d0560e0a10a4@suse.com>
Date: Mon, 24 Mar 2025 10:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/public: Split the struct cpu_user_regs type
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-8-andrew.cooper3@citrix.com>
 <8edba542-9844-409e-bbf0-5ff1c9287a10@suse.com>
 <eaaf2aef-129a-45ce-b5e7-ae884c2385f3@citrix.com>
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
In-Reply-To: <eaaf2aef-129a-45ce-b5e7-ae884c2385f3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 16:11, Andrew Cooper wrote:
> On 17/03/2025 12:15 pm, Jan Beulich wrote:
>> On 11.03.2025 22:10, Andrew Cooper wrote:
>>> In order to support FRED, we're going to have to remove the {ds..gs} fields
>>> from struct cpu_user_regs, meaning that it is going to have to become a
>>> different type to the structure embedded in vcpu_guest_context_u.
>>>
>>> struct cpu_user_regs is a name used in common Xen code (i.e. needs to stay
>>> using this name), so renaming the public struct to be guest_user_regs in Xen's
>>> view only.
>>>
>>> Introduce a brand hew cpu-user-regs.h, currently containing a duplicate
>>> structure.  This removes the need for current.h to include public/xen.h, and
>>> highlights a case where the emulator was picking up cpu_user_regs
>>> transitively.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>>> cpu_user_regs_t and the guest handle don't seem to be used anywhere.  I'm
>>> tempted to exclude them from Xen builds.
>> I concur. We can always re-expose them should they be needed somewhere.
> 
> It's actually a little ugly to do.
> 
> #ifdef __XEN__
> #undef cpu_user_regs
> #else
> typedef struct cpu_user_regs cpu_user_regs_t;
> DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
> #endif
> 
> and I don't particularly like it, given the complexity of #ifdef-ary
> around it.  Thoughts?

It's not really pretty, but I'd be okay with this.

>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
>>> @@ -0,0 +1,69 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#ifndef X86_CPU_USER_REGS_H
>>> +#define X86_CPU_USER_REGS_H
>>> +
>>> +#define DECL_REG_LOHI(which) union { \
>>> +    uint64_t r ## which ## x; \
>>> +    uint32_t e ## which ## x; \
>>> +    uint16_t which ## x; \
>>> +    struct { \
>>> +        uint8_t which ## l; \
>>> +        uint8_t which ## h; \
>>> +    }; \
>>> +}
>>> +#define DECL_REG_LO8(name) union { \
>>> +    uint64_t r ## name; \
>>> +    uint32_t e ## name; \
>>> +    uint16_t name; \
>>> +    uint8_t name ## l; \
>>> +}
>>> +#define DECL_REG_LO16(name) union { \
>>> +    uint64_t r ## name; \
>>> +    uint32_t e ## name; \
>>> +    uint16_t name; \
>>> +}
>>> +#define DECL_REG_HI(num) union { \
>>> +    uint64_t r ## num; \
>>> +    uint32_t r ## num ## d; \
>>> +    uint16_t r ## num ## w; \
>>> +    uint8_t r ## num ## b; \
>>> +}
>> Can we try to avoid repeating these here? The #undef-s in the public header are
>> to keep external consumers' namespaces reasonably tidy. In Xen, since we don't
>> otherwise use identifiers of these names, can't we simply #ifdef-out those
>> #undef-s, and then not re-introduce the same (less the two underscores) here?
>> Granted we then need to include the public header here, but I think that's a
>> fair price to pay to avoid the redundancy.
> 
> Breaking the connection between asm/current.h and public/xen.h is very
> important IMO.  Right now, the public interface/types/defines are in
> every TU, and they absolutely shouldn't be.

Hmm, that's a good point. Nevertheless I wonder if we still couldn't avoid the
unhelpful redundancy. E.g. by introducing a separate, small public header with
just these. Which we'd then pull in here as well.

> Sadly, the compiler isn't happy when including public/xen.h after
> asm/current.h, hence the dropping of the underscores.

Even if the ones here are #undef-ed after use?

> I did have half a mind to expand them fully.  I find them unintuitive,
> but I also didn't think I'd successfully argue that change in.

Roger - do you have an opinion here? I like these wrappers, yet then I also
understand this is code that's pretty unlikely to ever change again. Hence
fully expanding them is an option.

Jan

