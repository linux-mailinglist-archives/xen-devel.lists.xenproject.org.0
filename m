Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3AB27C45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083096.1442750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqSQ-0007rQ-9f; Fri, 15 Aug 2025 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083096.1442750; Fri, 15 Aug 2025 09:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqSQ-0007pd-6H; Fri, 15 Aug 2025 09:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1083096;
 Fri, 15 Aug 2025 09:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqSP-0007pW-J4
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:10:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b643f870-79b7-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:10:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so2586588a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:10:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b01b5facsm1009436a12.41.2025.08.15.02.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:10:38 -0700 (PDT)
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
X-Inumbo-ID: b643f870-79b7-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755249039; x=1755853839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KOGibgqHpFSUyECnu5mFn8dJLnKijIdNyAd+pMF56UM=;
        b=ZWTSsO6VTQKS3etBXtRlqzRzwlHVcerd/VWtvu00AMsOwD1ng+KHnIk+vt+nO5saCv
         2SrywOzADUGP2ZUIB28IHW/Gq2641oldXkEbbroG2qqILad4ONRPc+T0f+nemutT50fN
         2k37kxqohK3IL3ZWOP8/8nbwNh7/v3y7hc2Xklo+uY71xtWRTwGhlCWWkB7GABMB15Mr
         lYvR4geJDsvZHD07btDz0IFM8cBXV5CSf5nxqdVw7Gh8hmFxitsc4iQxQ81/jMB9vNgw
         OrZkgWgCzKWoHFxFhV7ZM1rhHlEj+SgLnk48kKe2kyNpSln0+bsCOqy0n/epXppQj9F3
         pJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755249039; x=1755853839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOGibgqHpFSUyECnu5mFn8dJLnKijIdNyAd+pMF56UM=;
        b=CAbUAEjOZmM2W7Mfl5JYBCQLuzlnFDfenD3OJjm+dQsyZKjEEMEWjGPsq9VR86Ho42
         1KmQwUQRGUM2tbgOYjo9l7ARv6Gc2N532wcNcEayWxfjrPBqv/FFJULkk/373zHxOZLv
         e1SzRMKSA0gk1d+mEE8pI+ymXKaR4cYWQA3U3/tsATRBGt88B9w96jSSfHQeMLfnjio2
         Bvsy7FEl2Di3j+N7KaSG6EfNXKOCTThfz/6/PJv9tdkUByLD8aTXMzpbF0uEXmWp4xIx
         wxg/KOM6rQsGULW9YKhADV8c1M1QRz+qeHWUruu7TvwC3x/2Zk1hU30w7Pox6VUI3PBu
         LKdg==
X-Forwarded-Encrypted: i=1; AJvYcCX20zctxSuYgYRe3c3SZg8rWcyd/tRkZ+0GkX8eYz0asrM6rANZpLaejqgXh2xqjKZ4E3rDRhGjtRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT03lEVwWKubTxR3qk/zpnfzQzLCHDpEdRCl7qzV9MgiYQZRCE
	+6OHupJa2o/HrrEvE+1DzHQhXlMQxwcY+KJHc9t0VW5PkE0R8DiTKS52rBm5OBe7JA==
X-Gm-Gg: ASbGncvWngMjO9pE6Eu1+Nl7JqmxbyLb4wBariBVvtvCNfJIKcJAg7VQJx6knquqFy6
	/dLCq/pjTfX0bYRHoChD/1y5LVCOGUaTjnA3Z3jAxG574HwuaL1jGTeIsB0no3CWcIDh9kznT9E
	xxKXY44N3YLPHhvuEbeIg/y377Jq7zUe5b395RmVKOiauSC81iaBZltCvgRkX8nUWMaCatzH//q
	4gxM+aacKge1AgMgY2KAJ7s4T0sODhRjniyRUQm0FezuPlMeD6OkwKC9hWy15tSwjnkuCjNzJIK
	5TcxDILGZ8ZQNgoq3cWr+Gf8UCeuKSY9Jnm2B9rDWgLo3PB3NEx/anVPkAoGK5eBjwfW4exTDeu
	k4SVD6queNeb0ZlIsXTjZOKMyqmRP3G1TAHFHONJEXWHAcdc36MNYfiVgeD32Emh1KkND6vyM3e
	AMfg/x5ljojTRCTzZCi506kYn0xBof
X-Google-Smtp-Source: AGHT+IFG7yAhaiDAgztVqlBgzkzTPd1QK3cF4sYr8FukEhuYaaVtd3ibyfOn6QDiAwW1pIGa1NDvyw==
X-Received: by 2002:a17:907:268e:b0:af9:6f04:8dd0 with SMTP id a640c23a62f3a-afcdc32f33cmr130938166b.55.1755249038360;
        Fri, 15 Aug 2025 02:10:38 -0700 (PDT)
Message-ID: <0fdea579-7100-43d8-b5ec-0c9d34476aea@suse.com>
Date: Fri, 15 Aug 2025 11:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/22] x86/traps: Alter switch_stack_and_jump() for FRED
 mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-21-andrew.cooper3@citrix.com>
 <7b46de92-d7b6-462f-8469-0f334d9e70bb@suse.com>
 <17498f02-0603-489c-bbc9-2207ffef8029@citrix.com>
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
In-Reply-To: <17498f02-0603-489c-bbc9-2207ffef8029@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 22:55, Andrew Cooper wrote:
> On 14/08/2025 4:35 pm, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>>> is active.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> RFC.  I don't like this, but it does work.
>>>
>>> This emits opt_fred logic outside of CONFIG_XEN_SHSTK.
>> opt_fred and XEN_SHSTK are orthogonal, so that's fine anyway. What I guess
>> you may mean is that you now have a shstk-related calculation outside of
>> a respective #ifdef.
> 
> I really mean "outside of the path where shadow stacks are known to be
> active", i.e. inside the middle of SHADOW_STACK_WORK
> 
>>  Given the simplicity of the calculation, ...
>>
>>>  But frankly, the
>>> construct is already too unweildly, and all options I can think of make it
>>> moreso.
>> ... I agree having it like this is okay.
> 
> Yes, but it is a read of a global even when it's not used.
> 
> And as a tangent, we probably want __ro_after_init_read_mostly too.  The
> read mostly is about cache locality, and is applicable even to the
> __ro_after_init section.

Not really: __read_mostly is to keep stuff rarely written apart from stuff
more frequently written (cache locality, yes). There's not going to be any
frequently written data next to a __ro_after_init item; it's all r/o post-
boot. And I don't think we care much during boot.

>>> @@ -154,7 +155,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>      "rdsspd %[ssp];"                                            \
>>>      "cmp $1, %[ssp];"                                           \
>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>> -    "mov $%c[skstk_base], %[val];"                              \
>>>      "and $%c[stack_mask], %[ssp];"                              \
>>>      "sub %[ssp], %[val];"                                       \
>>>      "shr $3, %[val];"                                           \
>> With the latter two insns here, ...
>>
>>> @@ -177,6 +177,8 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>  
>>>  #define switch_stack_and_jump(fn, instr, constr)                        \
>>>      ({                                                                  \
>>> +        unsigned int token_offset =                                     \
>>> +            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - (opt_fred ? 0 : 8);  \
>>>          unsigned int tmp;                                               \
>>>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
>>>          __asm__ __volatile__ (                                          \
>>> @@ -184,12 +186,11 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>              "mov %[stk], %%rsp;"                                        \
>>>              CHECK_FOR_LIVEPATCH_WORK                                    \
>>>              instr "[fun]"                                               \
>>> -            : [val] "=&r" (tmp),                                        \
>>> +            : [val] "=r" (tmp),                                         \
>> ... I don't think you can legitimately drop the & from here? With it
>> retained:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> You chopped the bit which has an explicit input for "[val]", making the
> earlyclobber incorrect.

I was wondering whether there was a connection there, but ...

> IIRC, one version of Clang complained.

... that's not good. Without the early-clobber the asm() isn't quite
correct imo. If the same value appeared as another input, the compiler
may validly tie both together, assuming the register stays intact until
the very last insn (and hence even that last insn could still use the
register as an input). IOW if there's a Clang issue here, I think it
may need working around explicitly.

Jan

