Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJZbFt1KsWlCtAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:58:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2505262A85
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251010.1548328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0HGl-0005uZ-3W; Wed, 11 Mar 2026 10:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251010.1548328; Wed, 11 Mar 2026 10:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0HGl-0005sA-0V; Wed, 11 Mar 2026 10:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1251010;
 Wed, 11 Mar 2026 10:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0HGi-0005s4-TZ
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 10:58:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 388611d6-1d39-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 11:58:22 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so9663335f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 03:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f13c3sm6599708f8f.25.2026.03.11.03.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 03:58:21 -0700 (PDT)
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
X-Inumbo-ID: 388611d6-1d39-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773226702; x=1773831502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4J5pUkRSyaUBU43apUgBScWFcUPwmMaVtMcIjcgu9RE=;
        b=W1qCKcpmCTtscorUEkB805EVHakx2SERWyNg7UldzVvuek/NDTwUVnHQb/auKcGLH/
         ya7wuKZ9nTHPhpGq7wc1hSh7U9j9UmGTwYG/J5SfIHjKdlXDUrwBZqAxNVzs3O/QqdT6
         +BQdLHRb9CBK0QNcZTsXxFu53Jq24lJxi45x+kZurKG+LoxPsmGoHkT8e2g4eRW/acf/
         lzyUHaiL1YaZkJQb7DNRk9dCIR0iFlFoh40VqepTpHOkGFfMrAs6zJqKFbQOp/H2nt8D
         IcRXoOf4QIC/JGgG2AguEhNx9cqXf6hEsDqFrjwmuBNH23sLytxB/xw3unmaMDaA4QOt
         Rdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226702; x=1773831502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5pUkRSyaUBU43apUgBScWFcUPwmMaVtMcIjcgu9RE=;
        b=LoWvsAtEDa3X+kSjJ7WDwua82FoNCift9R0hHi1JHuhCF245YenKJfhimmqNZXpBhr
         0/v/uSfax8ydcSdyC+6BQegVxNrQbUuiMFc0nA1j2HSK9uRtxsfvTUFckEBCbIO/YWTm
         FsRQnsh+EyH1FgWUPcQBrHfDYSqeYKl29ReU59FLxiPhJ/Ftvg66AeDalePOUvZdLXhk
         ZQqlDQl9mY2ZbYFn+CQKD6CVpnEDo+vIH66lwulI08GNnY9IGu4SBZfLLNmme2peX3UU
         2cSNJ7C8CIpCXTBtiFUkaXLpeu+dbpciAp1VhZT7OMJBAGZImRKVNYI4LYTy2WL+VbGv
         XUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4M/0vXl+/MNbxEAKKooJKw3+qYvJLVb49Y8qYVtlWAdAPChcJjDvlurSJLnTeqkKJT65PTfRwhkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHG6pnMCCpCqhM5PKht6cAsE8hL8ZeXmqLNXilOYfuhkjqp2qc
	rDhUYEQtGefc+ABrQ0N8Yn3Z9uR0VkLUr7u/TqW/Rmvpopb/wm8R3hkHDYxlXx+lWw==
X-Gm-Gg: ATEYQzwfM69On3t+6ed/cpbdZ6hSCWdRtQHygxhILyM++KPbySsFXtqvAYeeHsM2UXZ
	ZVwV81nKdtyyoicPJIMYfLoVEkl/c7zS2l89pFBm90RHY9ZcThNtSAlkUt558ECJLIZ0AKkQf4Y
	poSb+GxFti5X0Ml/MhloRWkV84PCwzfULIr9s/nX5mH9erN0ZbLY473N8kLEvWuMDlBr28/Jmxe
	dyEQA2NE2lJv3jMCzk3/ZO+GnP/9kr9Wal8Bn48z3Y4HpnYs3s6TziG1TLJHGCZcuiwp7s6Cfc+
	VRXvNzvyHvzQ/bupRMwtD3gsfn3RWIdXvUVkaPjEAdai2WbiCJguC5esHFywz/ag2vgIl+iQ3sd
	scbZKuNpCYVbxrQwnEku4Sm7zj3jtC8MQCyT4TzJMX0jdUiH7nWSQHz6sxGgnBIr71bbjJs9JzN
	lEKYkJBonHMTQFVcCu0MnnS0gwedZx7xYiZq5jooKbSlGep/k62iSl0AxP7/gA+aU7PTwX6KFd8
	/8igiNqcey/82Q=
X-Received: by 2002:a05:6000:18a8:b0:439:c81f:b96d with SMTP id ffacd0b85a97d-439f8224ef8mr4107841f8f.51.1773226701890;
        Wed, 11 Mar 2026 03:58:21 -0700 (PDT)
Message-ID: <2e471f54-1885-4615-8a23-c33ce683158f@suse.com>
Date: Wed, 11 Mar 2026 11:58:21 +0100
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
In-Reply-To: <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C2505262A85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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

On 11.03.2026 10:54, Oleksii Kurochko wrote:
> On 3/10/26 10:15 AM, Jan Beulich wrote:
>> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>>> --- a/automation/scripts/qemu-smoke-riscv64.sh
>>> +++ b/automation/scripts/qemu-smoke-riscv64.sh
>>> @@ -7,7 +7,7 @@ rm -f smoke.serial
>>>   
>>>   export TEST_CMD="qemu-system-riscv64 \
>>>       -M virt,aia=aplic-imsic \
>>> -    -cpu rv64,svpbmt=on \
>>> +    -cpu rv64,svpbmt=on,sstc=off \
>>>       -smp 1 \
>>>       -nographic \
>>>       -m 2g \
>> How does this fit with you panic()ing when SSTC isn't available (i.e. the
>> register cannot be read)? I must be missing something, likely a result of
>> me not being able to really understand the description.
> 
> When SSTC isn't available my panic() won't occur and then will continue to
> be executed. Otherwise, when SSTC is enabled (it is enabled by QEMU by default)
> my panic will occur.

Oh, I notice I misread the condition around the panic(), mainly because of
the misleading / ambiguous message passed to it: "SSTC isn't supported\n"
can mean unsupported by Xen or unsupported by the platform.

Anyway, to me this is entirely bogus: Why would we panic() because there is
a certain extension available?

>>> --- a/xen/arch/riscv/include/asm/csr.h
>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>> @@ -9,6 +9,7 @@
>>>   #include <asm/asm.h>
>>>   #include <xen/const.h>
>>>   #include <asm/riscv_encoding.h>
>>> +#include <asm/traps.h>
>>>   
>>>   #ifndef __ASSEMBLER__
>>>   
>>> @@ -78,6 +79,37 @@
>>>                              : "memory" );                        \
>>>   })
>>>   
>>> +/*
>>> + * Some functions inside asm/system.h requires some of the macros above,
>>> + * so this header should be included after the macros above are introduced.
>>> + */
>>> +#include <asm/system.h>
>>> +
>>> +#define csr_read_allowed(csr_num, trap) \
>>> +({ \
>>> +    register unsigned long tinfo asm("a3") = (unsigned long)trap; \
>> Why can't this variable be of the correct (pointer) type? This would then
>> at the same time serve as a compile-time check for the caller to have
>> passed an argument of the correct type.
> 
> Good point it could be an option.
> 
>>> +    register unsigned long ttmp asm("a4"); \
>>> +    register unsigned long stvec = (unsigned long)&do_expected_trap; \
>> Fiddling with stvec may be okay-ish very early during boot. NMIs, for
>> example, do exist in principle on RISC-V, aiui. There must be a way for them
>> to be dealt with by other than just M-mode.
> 
> Do I understand correct that your concern is about that if NMIs will be handled
> in HS-mode that switching stvec in this way could be dangerous as do_expected_trap()
> doesn't know how to handle NMIs?

Yes.

> If yes, then NMIs should be handled by M-mode as:
>    Non-maskable interrupts (NMIs) are only used for hardware error conditions, and
>    cause an immediate jump to an implementation-defined NMI vector running in M-mode
>    regardless of the state of a hart’s interrupt enable bits
> and:
>    The non-maskable interrupt is not made visible via the mip register as its
>    presence is implicitly known when executing the NMI trap handler.
> 
> So standard delegation registers like mideleg do not apply to NMIs because NMIs
> are not visible in the mip register.
> 
> I haven't found in OpenSBI how they are explicitly handling NMIs, but it looks
> like if they happen in (H)S-mode or (V)U-mode then they will be just redirected
> to (H)S-mode or V(U)-mode:
>    https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_trap.c#L361
> And then do_expected_trap() will fail to handle them...
> 
> Interesting that other hypervisors are using the similar approarch (with temporary
> updating of stvec) and they haven't faced such issue with NMIs yet...

Well, NMIs may be rare to occur? And hence very unlikely to occur in this small
a window?

>>> +    register unsigned long ret = 0; \
>>> +    unsigned long flags; \
>>> +    ((struct trap_info *)(trap))->scause = 0; \
>> "trap" would better be of the correct type. Don't use casts like this, please.
>>
>> Further, wouldn't you better set the field to a guaranteed invalid value? 0 is
>> CAUSE_MISALIGNED_FETCH, after all.
> 
> I don't see that such an invalid value exist for scause. I think we have to reserved
> a value from region 24-31 or 48-63 as they are designated for custom use.

Not sure that's possible. "Custom use" may mean "custom" from hw perspective.
I was rather thinking of picking something pretty high in the reserved range,
like (1 << (MXLEN-1)) - 1 or 1 << (MXLEN-2).

>>> +    local_irq_save(flags); \
>>> +    asm volatile ( \
>>> +        ".option push\n" \
>>> +        ".option norvc\n" \
>> Shouldn't this come later?
> 
> Do you mean before where SSTC csr is really tried to be read ("csrr %[ret], %[csr]\n")?

Yes.

> Does it really matter in such small inline assembler?

Yes, if nothing else then to not raise questions. Plus (depending on the
specific operands used), the ADD (MV) could e.g. be representable by a C insn.

>> And why set ttmp in the first place, when
>> that's what do_expected_trap() writes to?
> 
> To force the compiler to materialize tinfo in register a4 (ttmp) before the
> trap handler runs as handler will use a4 as temporary register.

??? I don't understand what you mean with "materialize".

>>> +        "csrr %[ret], %[csr]\n" \
>>> +        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
>>> +        ".option pop" \
>>> +        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \
>> tinfo isn't modified, is it?
> 
> It is modified by handler.

Where? It's only used as the address of the two stores.

>>> +          [ttmp] "+&r" (ttmp), [ret] "=&r" (ret) \
>> ttmp isn't initialized (in C), so the compiler could legitimately complain
>> about the use of an uninitialized variable here (due to the use of + where
>> = is meant).
> 
> ttmp is modified by handler too.

Of course, but just to repeat - you mean "=&r" there.

>> Whereas for ret the situation is the other way around - you initialize the
>> variable, just to then tell the compiler that it can drop this
>> initialization, as - supposedly - the asm() always sets it (which it doesn't
>> when the csrr faults).
> 
> It was done in that way as when csrr will lead to a fault, handler will jump
> over the csrr instruction and so ret won't be set at all. For that case it was
> set to 0.

And again - this is meaningless if the constraint is "=&r".

>>> +        : [csr] "i" (csr_num) \
>>> +        : "memory" ); \
>>> +    local_irq_restore(flags); \
>>> +    ret; \
>>> +})
>> A macro of this name would better return an indicator of what it is checking,
>> rather than the CSR value (which the sole user of this macro doesn't even
>> care about).
> 
> With the current one use case it doesn't care but generally I think that someone
> will want to use this macro just to get CSR value. I don't have a speicifc example
> but still it could be used in this way.

Well, if you want to keep it doing so, make the name match what it does (and
in particular what it returns).

>> Ideally such would also be an inline function.
> 
> I thought about that but I had difficulties with csr* instruction and their second
> operand which expects to have immediate. But if I will have inline function that
> csr_num will be in register.

Only if the function wouldn't be inlined, I expect? Which hence you may need
to force, by using always_inline.

Jan

