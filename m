Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C69D19305
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 14:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201725.1517299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfer4-0004Ck-Uv; Tue, 13 Jan 2026 13:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201725.1517299; Tue, 13 Jan 2026 13:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfer4-0004AH-Ri; Tue, 13 Jan 2026 13:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1201725;
 Tue, 13 Jan 2026 13:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfer3-0004AB-EY
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 13:54:41 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675aa815-f087-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 14:54:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso55875945e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 05:54:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e175csm43887878f8f.14.2026.01.13.05.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 05:54:38 -0800 (PST)
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
X-Inumbo-ID: 675aa815-f087-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768312479; x=1768917279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5fmgD9pYTMjmLHabb3x41OsejSd/WIRlxeSMMp34Cpg=;
        b=OCTld1O8/kUrsNJXBviXniPP0IwETppZdYjYjNwSXl1t/N9QDK+6ghFUdcFNnt+ASc
         GCz38gMBNcC1SN3E5s9vc46zKu5z2tI9JFmn+YHxjMPjUGYl99dtDJknhReAJIdzZ9os
         d8GnUYlzYFoBiUUXpjIHuo+qOmclYsJBwUGHIEBCA+0woBHYl/JJn7yZJTO9qV6bKr9o
         7G8QA+w5GB9Fy9iACHg1yE77rir9h9y/YCe2larlBIOBMP4RojHCAg1tAOZP6sCy8LDt
         lTRLrQcDXhCssg98YEVYL5Budu5UCIfX1piUf+dPVl2C2NG5bN38N/QtrTk21rpD0Db/
         mnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312479; x=1768917279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fmgD9pYTMjmLHabb3x41OsejSd/WIRlxeSMMp34Cpg=;
        b=i0J4/IZQJ+t1W+hUvybpPUmEYZT8DURbfPKSjmt3umsPXQ/A7ZMslEEqguO0sJDfOg
         tGoBkLq5i4tqq4yr5RQz4LZeco4O6b50KAo66k9pvJyVw2fd6XQfjXOQNDk6lahJWA3A
         NVVHVGpx2GU0Hfsx0Kt7jLFr8CgCZxY4mx5xNp7OMI/aKc2hGGCk5Wz6EJRiu7h9UqPR
         X5r1hj3MFvW/etcpFfzm1gqmKTJQ2oiX5bhwwslaIzrwkSZkxBieJM1sWltvEa3mf21c
         oqOS9Fre7E1R139kRdNYvCDrH8IvGIq9BYtNrDhYVYimDOB6PydqBI3gQa/KZvsYQfdI
         /u8g==
X-Forwarded-Encrypted: i=1; AJvYcCXUy2bzasNSmVA6+jGF8hfS8qDdlWSfVSFLkp86RnkluFDveQWLITJJyQwdsC64twkwYyJMu3EdOgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5Ika3iz9PaIdKCrykdwWP0AXEBprYtI7mwhX6J1Wh0DSPasPp
	EJ4JJ0Utoy4GYSho4SISusd5KJaX49iymUnuA99jTVoVhl9u/KZuG066x/NiMesOAg==
X-Gm-Gg: AY/fxX4I2rhr5ZCWLHStGrzpgDQ/3Bk3KqaUUuJST0O5hLv1tb93r/tDgkq5vw9ABmt
	Ziun5BrvTYn/jTdTwW40ljoIDSgbCB7j9iq7wBTOeL1fTSoDjdri7drXQILF8wmfQJCaECm/Rj/
	JctK1mbS9gywiwjPsGmPQbY9EQjxr/2VigmYzfc0BAwN55EOrWQ6b5GXmSOXfp5GeNSsi9tE2Hk
	t/uj1ElVXLcZdyMgLCqDFd+vOk+U1NhcX+HUzHXcPzabTZiwQS8eC2IlZ7CoqzaEfN2TzNIYi/A
	XzWjqTR0YWApZkVgO3Z0VNBJSCVWUYPcXPonedbcpXpgrSIhKI/KDDj02KPxLX95Zlejvl1irso
	jXaaIo8AM4GC6JozKkinaiy6mFMOlH2bpThihRq0bs5QXObOkuCP1X8ud/K871PhNzR661PXR0m
	mLcjcUGAe3TzKU0GCp61M/5y7kkhjhdrW3hd/9H7X3gCOVri2pdc/C8PYfYil9Xduc2bqIW2S3J
	oY=
X-Received: by 2002:a05:600c:1410:b0:47b:d5ab:3ce2 with SMTP id 5b1f17b1804b1-47ed7c52049mr27560625e9.18.1768312478825;
        Tue, 13 Jan 2026 05:54:38 -0800 (PST)
Message-ID: <dd10f076-cf91-426d-b2c0-2fa3056fb54f@suse.com>
Date: Tue, 13 Jan 2026 14:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
 <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
 <f707899a-3200-4467-a827-2195351f1226@gmail.com>
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
In-Reply-To: <f707899a-3200-4467-a827-2195351f1226@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 13:51, Oleksii Kurochko wrote:
> On 1/7/26 5:28 PM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/domain.h
>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>> @@ -85,6 +85,22 @@ struct arch_vcpu
>>>       register_t vstval;
>>>       register_t vsatp;
>>>       register_t vsepc;
>>> +
>>> +    /*
>>> +     * VCPU interrupts
>>> +     *
>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>> +     * in irqs_pending.
>> And hence a set immediately followed by an unset is then indistinguishable
>> from just an unset (or the other way around).
> 
> I think it is distinguishable with the combination of irqs_pending_mask.

No. The set mask bit tells you that there was a change. But irqs_pending[]
records only the most recent set / clear.

>>   This may not be a problem, but
>> if it isn't, I think this needs explaining. Much like it is unclear why the
>> "changed" state needs tracking in the first place.
> 
> It is needed to track which bits are changed, irqs_pending only represents
> the current state of pending interrupts.CPU might want to react to changes
> rather than the absolute state.
> 
> Example:
>   - If CPU 0 sets an interrupt, CPU 1 needs to notice “something changed”
>     to inject it into the VCPU.
>   - If CPU 0 sets and then clears the bit before CPU 1 reads it,
>     irqs_pending alone shows 0, the transition is lost.

The fact there was any number of transitions is recorded in _mask[], yes,
but "the transition" was still lost if we consider the "set" in your
example in isolation. And it's not quite clear to me what's interesting
about a 0 -> 0 transition. (On x86, such a lost 0 -> 1 transition, i.e.
one followed directly by a 1 -> 0 one, would result in a "spurious
interrupt": There would be an indication that there was a lost interrupt
without there being a way to know which one it was.)

> By maintaining irqs_pending_mask, you can detect “this bit changed
> recently,” even if the final state is 0.
> 
> Also, having irqs_pending_mask allows to flush interrupts without lock:
> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
> {
> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
> 
> *hvip &= ~mask;
> *hvip |= val;
> }
> Without it I assume that we should have spinlcok around access to irqs_pending.

Ah yes, this would indeed be a benefit. Just that it's not quite clear to
me:

    *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);

wouldn't require a lock either. What may be confusing me is that you put
things as if it was normal to see 1 -> 0 transitions from (virtual)
hardware, when I (with my x86 background) would expect 1 -> 0 transitions
to only occur due to software actions (End Of Interrupt), unless - see
above - something malfunctioned and an interrupt was lost. That (the 1 ->
0 transitions) could be (guest) writes to SVIP, for example.

Talking of which - do you really mean HVIP in the code you provided, not
VSVIP? So far I my understanding was that HVIP would be recording the
interrupts the hypervisor itself has pending (and needs to service).

>>> Our approach is modeled around multiple producer
>>> +     * and single consumer problem where the consumer is the VCPU itself.
>>> +     *
>>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>>> +     * on RV32 host.
>>> +     */
>>> +#define RISCV_VCPU_NR_IRQS 64
>>> +    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
>>> +    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
>>>   }  __cacheline_aligned;
>>>   
>>>   struct paging_domain {
>>> @@ -123,6 +139,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
>>>   
>>>   static inline void arch_vcpu_block(struct vcpu *v) {}
>>>   
>>> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq);
>>> +int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq);
>> Why the const-s?
> 
> As irq number isn't going to be changed inside these functions.

You realize though that we don't normally use const like this? This
use of qualifiers is meaningless to callers, and of limited meaning to
the function definition itself. There can be exceptions of course, when
it is important to clarify that a parameter must not change throughout
the function.

>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>> @@ -91,6 +91,7 @@
>>>   #define IRQ_M_EXT			11
>>>   #define IRQ_S_GEXT			12
>>>   #define IRQ_PMU_OVF			13
>>> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
>> MAX together with "+ 1" looks wrong. What is 14 (which, when MAX is 14,
>> must be a valid interrupt)? Or if 14 isn't a valid interrupt, please use
>> NR or NUM.
> 
> I didn’t fully understand your idea. Are you suggesting having|IRQ_LOCAL_NR|?
> That sounds unclear, as it’s not obvious what it would represent.
> Using|MAX_HART| seems better, since it represents the maximum number allowed
> for a local interrupt. Any IRQ below that value is considered local, while
> values above it are implementation-specific interrupts.

Not quite. If you say "max", anything below _or equal_ that value is
valid / covered. When you say "num", anything below that value is
valid / covered. That is, "max" is inclusive for the upper bound of
the range, while "num" is exclusive. Hence my question whether 14 is
a valid local interrupt.

Jan

