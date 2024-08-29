Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55964963B5E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 08:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785475.1194920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYau-0001RV-2K; Thu, 29 Aug 2024 06:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785475.1194920; Thu, 29 Aug 2024 06:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjYat-0001P9-Vy; Thu, 29 Aug 2024 06:25:19 +0000
Received: by outflank-mailman (input) for mailman id 785475;
 Thu, 29 Aug 2024 06:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjYas-0001P3-FU
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 06:25:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7546a949-65cf-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 08:25:17 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso259023666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 23:25:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb592sm34807666b.13.2024.08.28.23.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 23:25:16 -0700 (PDT)
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
X-Inumbo-ID: 7546a949-65cf-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724912717; x=1725517517; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+l/JIYcACG+9Ld1DN3q7Z0bV6lqYTRANY4kBSvKDckA=;
        b=ISWr6FbS+9SzKfeB1de0xty+xi1moocq9wN6JHSNicYDDSDI5ItZ9XZGuOu0gDFZ+8
         VStVCQYsejyEpKO2XncxD5vtwFGq80HpY4ekKAGjD/DS7PLDuNL389aUCrMFvfVdCfNv
         2vvnSraj+hcj0Y/yAv6UEAm5b6cylAaqKWpzPXbfsGvY307mMVrkH/rvC7gJzFgFpdNe
         C+/2S95oVw+kYQ+sR/dfsf5u/QXOXHRJIVygIkxX0OoNN40A/YrGlS1eOGK6zdeRW1Mj
         cQqXdIR50Py2JsuBprxNEI+VcHonk7p+WMxGoGWEOYl729CJS6+p20n5nq42eIrwbUeH
         CpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724912717; x=1725517517;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+l/JIYcACG+9Ld1DN3q7Z0bV6lqYTRANY4kBSvKDckA=;
        b=kFS3NmgxQSdoOeR6MIl7izZHHj3/MYp4xAS+ctkcjCOhrWH2EVxWl5nKsQRqvrN38k
         GitcSrwrXMP7P2/xAKmknrvuFtk43iyLVU7xxQw07opa5XTG3moLRbi3ypYuStsaiq4N
         hOrVuPaR2fB/flPkRsxsT/51JXfEkxRH5v2NbXiSx85S+YI/y5v46U6p48AMGmioS6NE
         T0+pETSCKCPbw3asmydOiFxS42xxwPuIpnKg/+DSl7o28yQl8uB71vdQ68MR5vMePWSD
         h5XU/Rr74qSECh1ZVBw2rt6m/uRMpOWXBSg4pbace2iP18VI4vPndr6g4Evg3oweHmrO
         xOSg==
X-Forwarded-Encrypted: i=1; AJvYcCWqn16qrLgLzao8OxAom3DjURj0g6zpXh6sLHHZowrAKCBkdGAv30EweDUdQgJxUBaoHt8JsdeXheY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRxLSmiVFQTKyo21q9+TwujgLcgLHSEhqpSAwCxwC8mg45P/XQ
	L4FEWI8Ii2s4bBIJEWNXgqE+++lKMrrKYhcHeBQvXYLr1qtylMcAdgAO0njHlA==
X-Google-Smtp-Source: AGHT+IEq9NwshHsMMX0yaBp9VeuhfCYg0S2YDyvEZtxh6SWBtH48OWnpGYFqHkzls8YF5zLvPXId1A==
X-Received: by 2002:a17:907:7e99:b0:a86:abbd:6834 with SMTP id a640c23a62f3a-a89828335famr140267866b.30.1724912716550;
        Wed, 28 Aug 2024 23:25:16 -0700 (PDT)
Message-ID: <2f08e857-e56b-41ca-8f99-ba36742d232b@suse.com>
Date: Thu, 29 Aug 2024 08:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/hvm: Rework hpet_write() for improved code
 generation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-4-andrew.cooper3@citrix.com>
 <2316ca39-50d4-4311-aeff-30be588245d9@suse.com>
 <7b7b1434-e615-4189-ab52-3cce2932fb4b@citrix.com>
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
In-Reply-To: <7b7b1434-e615-4189-ab52-3cce2932fb4b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2024 19:50, Andrew Cooper wrote:
> On 28/08/2024 9:13 am, Jan Beulich wrote:
>> On 27.08.2024 15:57, Andrew Cooper wrote:
>>> In the HPET_STATUS handling, the use of __clear_bit(i, &new_val) is the only
>>> thing causing it to be spilled to the stack.  Furthemore we only care about
>>> the bottom 3 bits, so rewrite it to be a plain for loop.
>>>
>>> For the {start,stop}_timer variables, these are spilled to the stack despite
>>> the __{set,clear}_bit() calls.
>> That's an observation from what the compiler happens to do? I don't see any
>> other reason why they would need spilling; I expect it's merely a matter of
>> registers better be used for other variables.
> 
> It is a consequence of how our helpers are written.  I do expect it to
> improve when I get around to reworking them.
> 
> For example, the Linux helpers have enough constant folding capabilities
> to allow the compiler to turn:
> 
> {
>     int foo = 0;
>     ...
>     __set_bit(1, &foo);
> 
> into:
> 
> {
>     int foo = 1;
> 
> 
> as well as being able to emit LOCK AND/OR/XOR in place of LOCK BT{C,S,R}
> for a constant bit position.
> 
> One thing I want to do, which I haven't figured out how to do yet, is to
> allow the arch form to emit BT?Q forms.
> 
> Right now, code generation for PGC_* and PGT_* suffers quite a lot.  We
> mix between reg/imm logic, then spill to the stack because top bits
> aren't within range for the "I" constraint on 32-bit instructions, issue
> a BT?L reg/mem (which has much higher latency than any other form), then
> pick it back off the stack to do more reg/imm logic.
> 
> I was wondering if, because of the always_inline, I could do something
> like __builtin_constant_p(bit) && __builtin_object_size(addr, 0) >= 8
> and emitting long-granular logic, which will be able to pick the imm/reg
> form rather than turning into reg/mem.

That may work, provided there actually was always_inline.

>>  If we ever meant to build Xen
>> with APX fully in use, that might change. IOW may I at least ask for
>> s/are/happen to be/? I'm also a little irritated by "despite", but you're
>> the native speaker. It would have seemed to me that e.g. "irrespective of"
>> would better express what (I think) is meant.
> 
> "despite" isn't really the right term, but I also wouldn't have said it
> was something to be irritated over.
> 
> What I was trying to say was "they're spilled to the stack even with the
> __set_bit() calls removed".  Which makes sense; they're values held for
> almost the full duration of the function, that are not used in ~every
> step of logic.

Right, the "not a good use for a register var" reason that I had alluded to.

>>>  Again we only care about the bottom 3 bits, so
>>> shrink the variables from long to int.  Use for_each_set_bit() rather than
>>> opencoding it at the end which amongst other things means the loop predicate
>>> is no longer forced to the stack by the loop body.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> All in all, it's modest according to bloat-o-meter:
>>>
>>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-29 (-29)
>>>   Function                                     old     new   delta
>>>   hpet_write                                  2225    2196     -29
>>>
>>> but we have shrunk the stack frame by 8 bytes; 0x28 as opposed to 0x30 before.
>> However, on the negative side all the first of the loops you touch now always
>> takes 3 iterations, when previously we may have got away with as little as
>> none. Is there a reason not to use
>>
>>     for_each_set_bit ( i, new_val & ((1U << HPET_TIMER_NUM) - 1) )
>>
>> there (with the masking of the low bit possibly pulled out)?
> 
> There are multiple angles here.
> 
> First, I got an unexpected surprise on ARM with an expression, and while
> this one won't pick up pointer const-ness, I can never remember what
> MISRA's view on this is.
> 
> Second, this is the odd-loop-out compared to rest of the function, which
> are all of the form "for ( i = 0; i < HPET_TIMER_NUM ;".
> 
> But perhaps most importantly, OSes don't touch this register.  Xen not
> at all, and Linux only in _hpet_print_config().  Neither bother
> preserving/clearing it on suspend/resume, even when running the HPET in
> legacy replacement mode.
> 
> I haven't checked windows behaviour, but I don't expect it to differ
> here.  This register simply isn't interesting for the preferred type of
> interrupts (edge), and also isn't useful for an ISR handling a line
> interrupt.

Yet there must have been an environment where the register is of use, or
else Roger wouldn't have been prompted to make what is now be07023be115
("x86/vhpet: add support for level triggered interrupts").

Jan

