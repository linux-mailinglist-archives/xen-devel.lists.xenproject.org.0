Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGhxAyhmsWnsugIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:55:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D467263EB3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 13:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251110.1548381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0J5M-0004yU-13; Wed, 11 Mar 2026 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251110.1548381; Wed, 11 Mar 2026 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0J5L-0004wS-U3; Wed, 11 Mar 2026 12:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1251110;
 Wed, 11 Mar 2026 12:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0J5K-0004wM-AU
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 12:54:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a19ce25-1d49-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 13:54:44 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so36785325e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 05:54:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66e3f8sm48934515e9.14.2026.03.11.05.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 05:54:43 -0700 (PDT)
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
X-Inumbo-ID: 7a19ce25-1d49-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773233684; x=1773838484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5ulGpwPGUeubOHrOFQJRstkDUZXs/VLi5V3Py6WIZE=;
        b=F3qfc0fW60rB261Eoyhmuqpk72nv9zDAMcqPqeO013RRZ71vOMcYVM2fe0gzbv06R3
         t3e3o37knb/gFfBUvZv04QlwEWaQDIE25YgK05ZiBNnqWGmkr39a0r5N3GANTNnOzELW
         PuAluxIufCGx1rmTXvLxH2jnx+yT1OBjPb4KLU7n+nJWBL2rYwHJ/QrFlSFatw8dvJBd
         iGEfZ0GX9iSwiuLeQSZRjMcxWeiNBU2yFtRLeBSlwfx1JxROYMyqpqogQL/pRSGmrfOj
         eu5j6HzG+zK21VK5wz1ZRVblH8XPXRSZk7RMiHxkg0SIZe9IJLa0/Ks+flv33fgJvJP6
         hPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233684; x=1773838484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5ulGpwPGUeubOHrOFQJRstkDUZXs/VLi5V3Py6WIZE=;
        b=ead6s4OmnB+0KJJ/GnBh0VjuH+LZ2TesWBvbq7+g1dgUGSwuP6SF7Zv9V7jCVy5Ujq
         wuq8vvWHaSvTJ9J8Cp3BUeFthIiQUmAPJWK2BZg1/+3e7SFdR4MDR9Pr31IGeYSOvvKX
         /2lZmnH4aQrBwBmI1L9mHIjXy75zfH50xdKUKEDEWD2eXa2fV1V3X63uOKIapkoWi1Zu
         RxPEqsf1LuZbkKv/qNAd88fACPWRYCaUGHtFN3qjBbm0H3IQLtHpdtbdp8l16vR4FvfS
         hImyV9GAJjpRcAIkU6o8mOd2HR+gA0lII7CiTyYoUuYaas173U3XXEMLByhDy7S97L6W
         Kobw==
X-Forwarded-Encrypted: i=1; AJvYcCVvZg5Fj4qCBY56/veGoX0koqPgMDld/tes/4yX9CN42nS4m/AuMmyWo/OppMIbDUm/2EC6btE2854=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwHP0lJopixWsXiWnsHrTBb7s5lvE2b4nPK+gMhFZiKKN9hNVm
	MkQz8ctItkWKCPe8qJe6ZjCtwIYfoyb/HBHlSye6s7u45sdAOv9FOaxrrXbb/fDt7w==
X-Gm-Gg: ATEYQzyrFvqUn6zFYBKDRNILGrWWgPtjdUW/LF4LjRDF4cqxl5Lu7EvzoFosfvyJFia
	XiBp7ramOB+5mXmwyumyARGHaphhB3WegjacP9BRbn08E25D5qUXrKt8HimhsECno//An1O7wG3
	uP970NAkK7HA2ugWcwZkABudXEpKrpGE97VSMe9B3E9nqyl1ONrTnVSLGdHWPO72GYq15nPyKXs
	PNn1DAjMS0FSV/JAhw+w+nsZ/Zh184nw0TRcYAdUfC1cUruXZw+tLndJ7Qe9h93wkOqjevR5zCZ
	dBgPlaURGyBZ1fkng7B362s7zf++3JXcrvJ9GDqm3a1vfq5NOkO8nhTizeWJfo88NPK9SIffoXP
	RaXQEWmOSN0BHRz8X+Op/j8akYYsMBXvrKRB+mgZz+wYGz4eCvpEV6GSBRm4PGP3AkUwKIEsBqH
	Genb+WoZMfrovNIltJSoD2AMYqRjjnXJo7+PDK007jwNOo0yMmVm8GqT2S7UveMQoLAEU+ZjBpi
	Bssd5NXKM11MJE=
X-Received: by 2002:a05:600c:4693:b0:485:481c:e7bb with SMTP id 5b1f17b1804b1-4854b1009d9mr37946765e9.20.1773233683850;
        Wed, 11 Mar 2026 05:54:43 -0700 (PDT)
Message-ID: <66a4763e-6d98-4919-b3d5-350c4d23fc32@suse.com>
Date: Wed, 11 Mar 2026 13:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/riscv: Disable SSTC extension and add
 trap-based CSR probing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
 <9ff93ad1-0151-4f37-a6c2-f7dd4197ca84@suse.com>
 <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
 <2e471f54-1885-4615-8a23-c33ce683158f@suse.com>
 <87eb8fb1-aa50-436c-8e2e-050981af4d1b@gmail.com>
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
In-Reply-To: <87eb8fb1-aa50-436c-8e2e-050981af4d1b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D467263EB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 11.03.2026 12:38, Oleksii Kurochko wrote:
> On 3/11/26 11:58 AM, Jan Beulich wrote:
>> On 11.03.2026 10:54, Oleksii Kurochko wrote:
>>> On 3/10/26 10:15 AM, Jan Beulich wrote:
>>>> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>>>>> --- a/automation/scripts/qemu-smoke-riscv64.sh
>>>>> +++ b/automation/scripts/qemu-smoke-riscv64.sh
>>>>> @@ -7,7 +7,7 @@ rm -f smoke.serial
>>>>>    
>>>>>    export TEST_CMD="qemu-system-riscv64 \
>>>>>        -M virt,aia=aplic-imsic \
>>>>> -    -cpu rv64,svpbmt=on \
>>>>> +    -cpu rv64,svpbmt=on,sstc=off \
>>>>>        -smp 1 \
>>>>>        -nographic \
>>>>>        -m 2g \
>>>> How does this fit with you panic()ing when SSTC isn't available (i.e. the
>>>> register cannot be read)? I must be missing something, likely a result of
>>>> me not being able to really understand the description.
>>> When SSTC isn't available my panic() won't occur and then will continue to
>>> be executed. Otherwise, when SSTC is enabled (it is enabled by QEMU by default)
>>> my panic will occur.
>> Oh, I notice I misread the condition around the panic(), mainly because of
>> the misleading / ambiguous message passed to it: "SSTC isn't supported\n"
>> can mean unsupported by Xen or unsupported by the platform.
>>
>> Anyway, to me this is entirely bogus: Why would we panic() because there is
>> a certain extension available?
> 
> It is bogus because then we need also add support of SSTC for a guest what isn't
> done now thereby if it is detected that SSTC is available that it is dangerous
> to continue about full support (guest part) of it.
> 
> I thought about the case to let Xen use SSTC and just don't tell Linux that SSTC
> is available by dropping from riscv,isa property the mentioning of SSTC, so then
> Linux will still continue to use SBI set timer call to Xen and the will just
> safely reprogram (if it is needed) a timer using SSTC instructions. But if to do
> in this way still nothing will prevent a guest to test if SSTC is available by
> reading CSR_STIMECMP and nothing will prevent to access CSR_VSTIMECMP by guest
> what could also lead to some misleading behavior.
> Likely we could set henvcfg.STCE to zero and it will forbid guest to access SSTC
> registers but I am not sure that we really want such behavior when Xen is using
> SSTC to setup a timer, but guest isn't allowed.

I don't see what's wrong with Xen using an extension that isn't made available
to guests.

> It seems it will be better just
> support SSTC extension fully and not to support it only for now.

If at all, an ack for such from me would be pretty reluctantly given.

>>>>> +    register unsigned long ret = 0; \
>>>>> +    unsigned long flags; \
>>>>> +    ((struct trap_info *)(trap))->scause = 0; \
>>>> "trap" would better be of the correct type. Don't use casts like this, please.
>>>>
>>>> Further, wouldn't you better set the field to a guaranteed invalid value? 0 is
>>>> CAUSE_MISALIGNED_FETCH, after all.
>>> I don't see that such an invalid value exist for scause. I think we have to reserved
>>> a value from region 24-31 or 48-63 as they are designated for custom use.
>> Not sure that's possible. "Custom use" may mean "custom" from hw perspective.
>> I was rather thinking of picking something pretty high in the reserved range,
>> like (1 << (MXLEN-1)) - 1 or 1 << (MXLEN-2).
> 
> Agree, it could be an option.
> 
>>
>>>>> +    local_irq_save(flags); \
>>>>> +    asm volatile ( \
>>>>> +        ".option push\n" \
>>>>> +        ".option norvc\n" \
>>>> Shouldn't this come later?
>>> Do you mean before where SSTC csr is really tried to be read ("csrr %[ret], %[csr]\n")?
>> Yes.
>>
>>> Does it really matter in such small inline assembler?
>> Yes, if nothing else then to not raise questions. Plus (depending on the
>> specific operands used), the ADD (MV) could e.g. be representable by a C insn.
>>
>>>> And why set ttmp in the first place, when
>>>> that's what do_expected_trap() writes to?
>>> To force the compiler to materialize tinfo in register a4 (ttmp) before the
>>> trap handler runs as handler will use a4 as temporary register.
>> ??? I don't understand what you mean with "materialize".
> 
> Mean forcing the compiler to load the variable into the specific hardware
> register (a4) before the potentially trapping instruction executes, so the
> trap handler can safely use that register.

I fear there's some misunderstanding on inline assembly here. An output-only
variable doesn't need "pre-loading". But anyway, all of this is gong to be
moot here (but potentially relevant elsewhere in the future) when this
becomes a mere clobber.

>>>>> +        "csrr %[ret], %[csr]\n" \
>>>>> +        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
>>>>> +        ".option pop" \
>>>>> +        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \
>>>> tinfo isn't modified, is it?
>>> It is modified by handler.
>> Where? It's only used as the address of the two stores.
> 
> There are to updates of tinfo in the do_expected_trap():
> 
> FUNC(do_expected_trap)
>          ...
>          REG_S   a4, RISCV_TRAP_SEPC(a3)
>          ...
>          REG_S   a4, RISCV_TRAP_SCAUSE(a3)
>          ...
> END(do_expected_trap)

a3 is used there twice, yes, but neither use modifies the register. If the
first use modified it, the 2nd use would be broken.

Jan

