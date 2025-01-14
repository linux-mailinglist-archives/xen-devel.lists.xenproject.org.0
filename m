Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960D0A10A2C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 16:02:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871467.1282462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiQg-0003qH-5v; Tue, 14 Jan 2025 15:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871467.1282462; Tue, 14 Jan 2025 15:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiQg-0003oF-3L; Tue, 14 Jan 2025 15:02:06 +0000
Received: by outflank-mailman (input) for mailman id 871467;
 Tue, 14 Jan 2025 15:02:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXiQe-0003o8-Uv
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 15:02:04 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8383a50f-d288-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 16:02:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361c705434so40126475e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 07:02:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89df1sm211552115e9.27.2025.01.14.07.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 07:02:01 -0800 (PST)
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
X-Inumbo-ID: 8383a50f-d288-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736866923; x=1737471723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+y5xQkwrI3izGnMbJbaJUFiYT/ZYalok8ANyM4JHUX4=;
        b=XzmnSqZqERTiM4FzMG/Wts57HsZcG0dfxC8JozQ+6987rKGgrsplvoha+E26HSlIwz
         DwmTmAoVEx+aeDdLBMnC44bQ8IC9tTNXASwpq3BdJF+qfIeDTBYlW4lYsp6IOjvpNdUW
         oupmA5fekwO8z3eXorMXDHyEBNwV20D+uzkaMPQ30wdjynwEUb3ys7neYBmnVRQeU/s7
         jFlrcCOeGLU7eb1MEiMOWIZy4nOf+wkFW8cnMTJL//Rm97ru/unE84vOqO3de3Ftmpqr
         NfH4Dfr/B+RymbTxXMaJGgx/gQoKpQgw+ffILIWuylL4MaGGkHi+CpJcOjBTc88lfhf7
         ZwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866923; x=1737471723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y5xQkwrI3izGnMbJbaJUFiYT/ZYalok8ANyM4JHUX4=;
        b=jySVA9Hma8oJO4rm6DjfBXnwU5Q67s45DylJSIH6Tl9PpCkY25HovztgqIb/3scYzz
         byrnuTv17YwokQUAsZBG4XeubMi7PyABoZQwASMXd7qUYeuEI29Y5wbbhMj/jq7wKQD/
         HwokQvws7GjG3YjpZbcPvQ7J1pBnuzYj/4UUke9iOqiecsyxcSmwxiP9xDCdqQhEi33q
         9svJP7vLOK9F4h4pzCHqgCE4QNt0O6AyhoMSTauapNQrrkQu8XhlqjtqALLv8h+5Sh/E
         H3f4qie5qf7pIPBZ7OPXmvYPIgBqNDruqBPc9brwWZyia+18/xoq8GzAgFQnoPVEgg6F
         N21w==
X-Forwarded-Encrypted: i=1; AJvYcCVlDn9JvXOqNkVoqFdYvgVLBMyIMtfKE7efuFj43CwqXSd9pEDc9tUupSUp7MFL+75wsVcl6zzRvIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9iDkQkXVOgvSjByG59bufCOSfkxRXSBODSudLjir//s4v1TKK
	8S0qBuVdI4P1MQAN1Z8atQ+2DUkkZ8v0n66A2dtYyFCBU5ePy3YDnaapp7TjKA==
X-Gm-Gg: ASbGncsM8H61VXCVM9CBHep1dNFgXeSUC2UStCShlSX6ExcEfDhcLkJTBevSxFiBuA1
	/3ggbaVaekh0vEX7MMbpqXoY3zO5mljCQIQFFJyXPbLCf6VkClD1YWw78JtAsG6smZqUh/feDaz
	+B2YrTKXYck1qQTSacLxy0ODoeJArBwOYTx5aartU7GGwwATGagINX2JuMjs3xV/pyNtia2Tbfe
	+gEoLYLpbnt/BPGOBtWX2kJ0R2m4Tf0O9ytsDTZ2dklHB6CVlk0FgTEKFGBQAFeAtvs0D4wRf9A
	HbJRHEurcfieDMEeqjTBlbU4sLk3I4A0mp9vA+SwyQ==
X-Google-Smtp-Source: AGHT+IF1FlKQAM4ZXL3OpzuuSEiCSUhuSm7fOBhqbQZdDWsjKy5J1jjwavrxIW4GC3y5o/vn5Ldk4g==
X-Received: by 2002:a05:600c:3114:b0:434:f609:1af7 with SMTP id 5b1f17b1804b1-436e2677361mr224792005e9.4.1736866922667;
        Tue, 14 Jan 2025 07:02:02 -0800 (PST)
Message-ID: <153425e6-a17d-48d2-a1d7-a9b0bf3167dd@suse.com>
Date: Tue, 14 Jan 2025 16:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
 <46cb0ee0-ea9f-4515-abac-058a9aa846e4@suse.com>
 <Z4AIdlx7uWcS3cOP@macbook.local>
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
In-Reply-To: <Z4AIdlx7uWcS3cOP@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2025 18:33, Roger Pau Monné wrote:
> On Thu, Jan 09, 2025 at 09:59:58AM +0100, Jan Beulich wrote:
>> On 08.01.2025 15:26, Roger Pau Monne wrote:
>>> @@ -2048,8 +2060,6 @@ static void __context_switch(void)
>>>      if ( pd != nd )
>>>          cpumask_clear_cpu(cpu, pd->dirty_cpumask);
>>>      write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
>>> -
>>> -    per_cpu(curr_vcpu, cpu) = n;
>>>  }
>>>  
>>>  void context_switch(struct vcpu *prev, struct vcpu *next)
>>> @@ -2081,16 +2091,36 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>>>  
>>>      local_irq_disable();
>>>  
>>> -    set_current(next);
>>> -
>>>      if ( (per_cpu(curr_vcpu, cpu) == next) ||
>>>           (is_idle_domain(nextd) && cpu_online(cpu)) )
>>>      {
>>> +        /*
>>> +         * Lazy context switch to the idle vCPU, set current == idle.  Full
>>> +         * context switch happens if/when sync_local_execstate() is called.
>>> +         */
>>> +        set_current(next);
>>>          local_irq_enable();
>>
>> The comment is misleading as far as the first half of the if() condition goes:
>> No further switching is going to happen in that case, aiui.
> 
> Right, I should clarify that comment: this is either a lazy context
> switch, or the return from a lazy state to the previously running
> vCPU.
> 
>>>      }
>>>      else
>>>      {
>>> -        __context_switch();
>>> +        /*
>>> +         * curr_vcpu will always point to the currently loaded vCPU context, as
>>> +         * it's not updated when doing a lazy switch to the idle vCPU.
>>> +         */
>>> +        struct vcpu *prev_ctx = per_cpu(curr_vcpu, cpu);
>>> +
>>> +        if ( prev_ctx != current )
>>> +        {
>>> +            /*
>>> +             * Doing a full context switch to a non-idle vCPU from a lazy
>>> +             * context switched state.  Adjust current to point to the
>>> +             * currently loaded vCPU context.
>>> +             */
>>> +            ASSERT(current == idle_vcpu[cpu]);
>>> +            ASSERT(!is_idle_vcpu(next));
>>> +            set_current(prev_ctx);
>>
>> This feels wrong, as in "current" then not representing what it should represent,
>> for a certain time window. I may be dense, but neither comment not description
>> clarify to me why this might be needed. I can see that it's needed to please the
>> ASSERT() you add to __context_switch(), yet then I might ask why that assertion
>> is put there.
> 
> This is done so that when calling __context_switch() current ==
> curr_vcpu, and map_domain_page() can be used without getting into an
> infinite sync_local_execstate() recursion loop.

Yet it's the purpose of __context_switch() to bring curr_vcpu in sync
with current. IOW both matching up is supposed to be an exit condition
of the function, not an entry one.

Plus, as indicated when we were talking this through yesterday, the
set_current() here make "current" no longer point at what - from the
scheduler's perspective - is (supposed to be) the current vCPU.

Aiui this adjustment is the reason for ...

>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -2232,8 +2232,6 @@ void __init trap_init(void)
>>>  
>>>  void activate_debugregs(const struct vcpu *curr)
>>>  {
>>> -    ASSERT(curr == current);
>>> -
>>>      write_debugreg(0, curr->arch.dr[0]);
>>>      write_debugreg(1, curr->arch.dr[1]);
>>>      write_debugreg(2, curr->arch.dr[2]);
>>
>> Why would this assertion go away? If it suddenly triggers, the parameter name
>> would now end up being wrong.
> 
> Well, at the point where activate_debugregs() gets called (in
> paravirt_ctxt_switch_to()), current == previous as a result of this
> change, so the assert is no longer true on purpose on that call
> path.

... this behavior. Which, as said, feels wrong the latest when "curr" was
renamed to no longer suggest it actually is cached "current". At that point
it'll be dubious whose ->arch.dr[] are actually written into the CPU
registers.

Also let's not forget that there's a 2nd call here, where I very much hope
it continues to be "current" that's being passed in.

Jan

