Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872DA03D5D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 12:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866318.1277641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV7V6-0007cp-2t; Tue, 07 Jan 2025 11:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866318.1277641; Tue, 07 Jan 2025 11:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV7V5-0007bB-W3; Tue, 07 Jan 2025 11:11:55 +0000
Received: by outflank-mailman (input) for mailman id 866318;
 Tue, 07 Jan 2025 11:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV7V5-0007b5-8S
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 11:11:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32f582bf-cce8-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 12:11:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso92797225e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 03:11:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b287sm625950055e9.29.2025.01.07.03.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 03:11:52 -0800 (PST)
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
X-Inumbo-ID: 32f582bf-cce8-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736248313; x=1736853113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WKfkt7K3GVNB3ZmKMhiDK9vedKrL8wcC7HJN6PLmNRM=;
        b=L+vvYGrmrx/eaopAZD3THjonJK1dgzFd+BxSZruo0+l3PbnXr6s6x7iHjen95GBdln
         Dm7bvXcY27uveZclWetwx2c7Pr/nDqHiLeuo+0wyNGH/tHPW8IQV8wOJMORzEscGsl7R
         tzLhaAgRFER6kY35pYlgUbklnZLHDnOb0loiYoubnz4IxYC+0sWIM78iRIEIHk7eWz9g
         DHBQE6saFcj9KCsAHv3jC9Am+hRgAzulG1YPwpftbWJiYqqfg4+jRwx7dAuJ8FOaPgfQ
         QqXFObJ1kEI4DKkKzqo0D7spnPCAnFO137FCHyvvTHyNP67EbFf40l271zIFnUUjrAoa
         sAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248313; x=1736853113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKfkt7K3GVNB3ZmKMhiDK9vedKrL8wcC7HJN6PLmNRM=;
        b=vCUVyvX+lCgqXRwGsdSQJ7DSlP9yvDgjd4EYot6Or0xoksLBABQqrFdX1rCQMg7xBy
         AgX74CS4NeTqYXJY9mXhlUZhrgI0Q8E/j+gv9fGKBQXDPXUzY1oLUvpPpRD8k0Lbs7yP
         eLfA/di/5/DbeIhDKVP2HSMjJE+rTbTBFOIrlvYmDtjCjKoDMnhUreBMDLNyMgk1dFXg
         E5ELNBRJf0Yb8X5Cte3YrE4d7AUi22yczZa7BWZLXihhDEgpcUcMM7hHjwdJkrGsPERX
         vgd5whhn/ZjM8eZmhAiKqngr06pgMGj+RHxXqbSmDkwI1ldHLrqRUS8GCCYNn5YzNW4E
         j94A==
X-Forwarded-Encrypted: i=1; AJvYcCXLrsFUZiDMfjTRlKZJY1hWRIvYvQp0Sb8BYAhCVjzkz9rIUvyqGQP5a63gXRvyqk4PIoaXhHgqPIE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyat5RnwQoh49yLKKh/F8xjkDR7/FBS4FQNFahWZ17yBTk+/IIN
	HQEYHDIRFc0tbcoXkR6EJVvVXV3CyXHu96rf9VE1L/RKMRhIrVvpJPulHFz9Tw==
X-Gm-Gg: ASbGncsm+JkgCaWI/Chm/9DCg4NIImdd3PkTuwCVqpwh1S1PBWBOkF6s6VR1JmDKDAg
	eVL7dtGasQoEuKmlcq1CqR/tlmObp3quiWfRYDMw6oETKH26YSjrN+oBY6vtWbxy0tjRYXk0lhC
	nsbu0CVC457DdF6mig5ABiYDCU6SYPCxbNxsalD7vWZRLVEUyvp7606/zoB5gkApAOKnKCUlA59
	sCei7E3VGFwyZs3tLy6uqhQrDr7sGOBb9VA4fBuGv4Kdr/jHZEScvu/GYcrnM19ddtsnVyaJQ3F
	vWwT9PQpUB/Z3qjCTaaMWFyFOM982PVlU5eWJiTh9g==
X-Google-Smtp-Source: AGHT+IEET/S86xflurpVcA0lu0b0b6pL3Blgty53NzbKALsZabhhXpBkYHtvD4ndQCzBNqiws8X+xA==
X-Received: by 2002:a05:600c:492f:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-436dc23f2d2mr20785605e9.14.1736248312585;
        Tue, 07 Jan 2025 03:11:52 -0800 (PST)
Message-ID: <48d0ab30-2a7f-44b6-bcf9-3a5c0583692e@suse.com>
Date: Tue, 7 Jan 2025 12:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] docs: FRED support in Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250103204704.84067-1-andrew.cooper3@citrix.com>
 <3ff59df0-69f8-426a-ab44-d2cd9b5bf8ea@suse.com>
 <0a780f2d-1e49-47bd-8c66-babbc2dd8f63@citrix.com>
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
In-Reply-To: <0a780f2d-1e49-47bd-8c66-babbc2dd8f63@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 17:06, Andrew Cooper wrote:
> On 06/01/2025 2:28 pm, Jan Beulich wrote:
>> On 03.01.2025 21:47, Andrew Cooper wrote:
>>> +There are several uses of the vm86 fields in Xen:
>>> +
>>> + #. ``struct vcpu`` embeds a ``struct cpu_user_regs`` to hold GPRs/etc when
>>> +    the vCPU is scheduled out.  The vm86 fields are used by the PV logic only
>>> +    (``{save,load}_segments()``) and can be moved into separate fields in
>>> +    ``struct pv_vcpu``.  PV's ``dom0_construct()`` sets these fields directly,
>>> +    and needs a matching adjustment.
>>> +
>>> + #. As part of ``arch_{get,set}_info_guest()`` during hypercalls.  The
>>> +    guest side needs to remain as-is, but the Xen side can rearranged to use
>>> +    the new fields from above.
>>> +
>>> + #. As part of vCPU diagnostics (``show_registers()`` etc).  The ``#DF`` path
>>> +    uses the fields as scratch storage for the current register values, while
>>> +    the other diagnostics are simply accessing the state of a scheduled-out
>>> +    vCPU.
>> Unlike for the former 2 points and for the one immediately below, but like for
>> the final one below you don't mention what you intend to do. Here I assume it'll
>> be reasonably straightforward to use scratch space elsewhere.
> 
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-fred
> is my working branch if you want to peek at things.
> 
> The diagnostics are handled by:
> 
> 1) "x86/traps: Rework register state printing to use an extra_state struct"
> 2) "x86/traps: Avoid OoB accesses to print the data selectors"

Doesn't this one remove the sole caller of read_sregs(), hence wanting to also
purge the function itself? Apart from this ...

> 3) "Revert "x86/traps: 'Fix' safety of read_registers() in #DF path""

... these all look fine to me; I'll wait with a formal R-b though until the
actual submission.

> Something else you might want to proactively look at.  "x86/idt:
> Generate bsp_idt[] at build time".  I figured out how to construct the
> IDT at build time, without using an external tool to format the table,
> and only some slightly disgusting linker script hackery.

Clever.

>>> +Stack layout
>>> +""""""""""""
>>> +
>>> +Xen's CPU stacks are 8-page (8-page aligned), arranged as::
>>> +
>>> +  7 - Primary stack (with a struct cpu_info at the top)
>>> +  6 - Primary stack
>>> +  5 - Primary Shadow Stack (read-only)
>>> +  4 - #DF IST stack
>>> +  3 - #DB IST stack
>>> +  2 - NMI IST stack
>>> +  1 - #MC IST stack
>>> +  0 - IST Shadow Stacks (4x 1k, read-only)
>>> +
>>> +which needs mapping into FREDs Stack Levels.
>>> +
>>> +FRED Stack Levels replace IST.  Most events from Ring3 enter Ring0 at SL0,
>>> +including interrupts, and even exceptions with a non-zero Stack Level
>>> +configured.  Nested exceptions originate from Ring0 even if they were trying
>>> +to push a Ring3 event frame onto the stack, so do follow the Ring0 CSL rules.
>>> +
>>> +Within Ring0, a stack switch occurs on event delivery if the event has a
>>> +higher configured Stack Level (exceptions in ``MSR_FRED_STK_LVLS``, interrupts
>>> +in ``MSR_FRED_CONFIG``).  Otherwise, the new event is delivered on the current
>>> +stack.
>>> +
>>> +Under FRED, most sources of ``#DF`` are gone; failure to push a new event
>>> +frame onto a stack is the main remaining one, so ``#DF`` needs to be the
>>> +highest stack level (SL3) to catch errors at all other stack levels.
>>> +
>>> +Also, FRED removes the "syscall gap", removing the primary need for ``NMI``,
>>> +``#DB`` and ``#MC`` to need separate stacks.
>>> +
>>> +Therefore, Xen has no need for SL1 or SL2.  Under IDT delivery, we poison the
>>> +unused stack pointers with a non-canonical address, but we cannot do that
>>> +under FRED; they're held in MSRs and checked at WRMSR time.  Instead, we can
>>> +point the SL pairs (RSP + SSP) at each others (regular and shadow stack) guard
>>> +pages such that any use of an unused SL will escalate to ``#DF``.
>> I may have a language issue here: "each others" reads wrong to me; do you perhaps
>> mean "each ones"?
> 
> It's poor grammar, but not wrong per say.  I'll try to find a different
> way to phrase it.
> 
>>
>> Further, mainly to double check my own understanding: Almost half of the stack
>> area then isn't used anymore when FRED is active: 2 pages for the primary stack,
>> 1 page for the primary shadow stack, 1 page for the SL3 stack, and (somewhat
>> wastefully) 1 more for the SL3 shadow stack.
> 
> This matches my understanding (on the proviso that I've still not wired
> up the stack handling yet.  Still cleaning up the initialisation paths.)
> 
>>  There'll be 3 unused pages, and
>> hence space again to have true guard pages, e.g.
>>
>>   7 - Primary stack (with a struct cpu_info at the top)
>>   6 - Primary stack
>>   5 - Guard page
>>   4 - Primary Shadow Stack (read-only)
>>   3 - Guard page
>>   2 - #DF stack
>>   1 - #DF Shadow Stack (read-only)
>>   0 - Guard page
> 
> Shadow stack frames are perfectly good guard pages for regular stacks,
> and vice versa.  That's why I set them up as shadow stack pages even
> when CET isn't active.

"Perfectly valid" isn't quite true: These pages being readable means
writes below the stack bottom (likely the prevailing kind of problem)
are detected, but reads wouldn't be.

> And yes, we could rearrange the stack.  But, there's also a good reason
> not to.  Our code has to cope with both IDT and FRED layouts, which is
> much easier if they're the same.

I certainly can see the value of keeping stack layout uniform.

>> Having reached the bottom of the section, there's one special IST aspect that
>> I'm missing, special enough imo to warrant mentioning even if only to state that
>> it's (hopefully) going to be irrelevant (i.e. not require replacing by another
>> similar hack): {dis,en}able_each_ist() as used by SVM (on the assumption that
>> sooner or later AMD is likely to also implement FRED, and that you may already
>> know of details of their respective VMCB integration).
> 
> AMD haven't said anything about FRED yet, despite a very large number of
> software partners asking about it.
> 
> However, If AMD were to do FRED, I'd expect it to work just like CET
> does today, seeing as there's a proper host/guest split of CR4, and
> everything else is in MSRs the guest can't touch.

As in "can be prevented to touch directly", aiui.

Jan

