Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B39D1FFA8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203388.1518612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3E7-0003E8-SC; Wed, 14 Jan 2026 15:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203388.1518612; Wed, 14 Jan 2026 15:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3E7-0003BK-OH; Wed, 14 Jan 2026 15:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1203388;
 Wed, 14 Jan 2026 15:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81wl=7T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vg3E6-0002sf-KY
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:56:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e24e71-f161-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 16:56:04 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso81965915e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 07:56:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee117e607sm25736935e9.3.2026.01.14.07.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:56:03 -0800 (PST)
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
X-Inumbo-ID: 87e24e71-f161-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768406164; x=1769010964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq0HkgowQW0ezh21tXvT7v+YFZV0uMQYL63s9WUWcq4=;
        b=VvRQzvaYOmJMupQoD4yXFHvf+q0E9QF5NP2U3XSx0cB4b130pQ+Mq851MzfM7rqTfa
         phqbPdi+KSsmRqDkiUfW2Vxfo+ZlUWJOZuqRZaRRKIskdiJ/G59v6jmXb1lmOWejuB3J
         fbADNzGKkVh5t/h+AorqWosTl06y3OrwSRwxbWp61E2XHpOygcBGhIoVPXyufMl4j3Vn
         JDuSd9d/j0boEtjKYYph19madxX8BeTPBwA01Nw1jNPorI2ZDJma4JhpRJ8QtdFPkz/p
         Otj8zyAWYRnL7xcY2boIrfKXzR1MYj7NukooGVfHNcOytFToJJ1sDnROYq0c8fGqGQ24
         WsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406164; x=1769010964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq0HkgowQW0ezh21tXvT7v+YFZV0uMQYL63s9WUWcq4=;
        b=dL8jEOwlP2FnJ11jR0BqledK5DgVW9Sk9i0+g3HM/rkrvgTtwNVIogH/qie6wQL/5z
         mXv7Tp2LIEil13mnIh8/jQWI9ZcQp9pXEXkvw2Aak298XE1XPSRM8gseNMYMC9PP86Ah
         n7sMmueCBMlDFxQU8T4qpETzY2nJh/4dYV/4vNI3KxWtgYqX+xZ+M24P+e8Z9pHQo7qT
         5z4v6YKg7mBb1Wupd7itr8uKEd0ZNLZv2xaUXk3tuwSkxJgFbkcT5ouSqhQGUMx8BicF
         tw8bpI/xr2l/ZCACEKXmODRoVYmlP9nUU7m5hTkruF63NtHnrqgyHODrtN9u73kfONPv
         Tssg==
X-Forwarded-Encrypted: i=1; AJvYcCUJp7DeeRK6XhofktTpIPls7603YuOi/3P6El+n7g81aqqFIPEhtphF9AkLH29JEj/sKyuSLtSgaX8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1H+5l6qAQandE03Z2yxl3ISHgc9dFDL5pWCSWkXJyx+3QqO23
	WGa9macnPz/xWvFxSsmPCkKW685jX6UteGSmhCCEYRfBdbOU+T/C2WQ/REyErZdFHg==
X-Gm-Gg: AY/fxX4j1EbzJSLNnW+p2YIuErmQqCPcIq72uTbv4/7oqwR8iV6yAQ0fPL2ydoJAaK8
	uMIhrED5osnhZ65riI5srMc6MQzydLUMZQhukCz0jaY0Y+jkxtnc4bIMRTx77shlBi0Uv1C/iqe
	9s0esRSCqGwKtV5gQKhL3g/9U5Hut2DZVoqQXGQE2raJaFmSIMDv9w9KgH+E4Q+TtH4mfwlceF9
	dmtF19wXHm2tmuJC7VHbBip1G45/mJNfe6gixv5yzmhKfHRlz3QxRxxUXyA+EhPtgv/S2KV86Uh
	FHn0xjCsWCMnj013DVpAOP9pSf7tN7lXIoi3I7KYttA4pZgL/AlnpWWDoWC4htOol/LUHOPHhka
	eo5XeKDF00jPygXyr92TWCl62DJJ1TCRdKxDPLZboWVUBZQb7IL+D/+TjfxXgVi5X4wLafkNFol
	wJaKV/wAFijxg3fD9vaAoi/s+MfMYKFKEeIBm7ueXF94tYcRBC/0JshXsw3HyPNCvQtQaz8Dc2O
	n0=
X-Received: by 2002:a05:600c:1549:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-47ee9816cafmr9058165e9.27.1768406163563;
        Wed, 14 Jan 2026 07:56:03 -0800 (PST)
Message-ID: <c0d5104b-52ec-484e-ac40-8901ae298fa8@suse.com>
Date: Wed, 14 Jan 2026 16:56:02 +0100
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
 <dd10f076-cf91-426d-b2c0-2fa3056fb54f@suse.com>
 <7a90cc1b-b053-4b9f-91f1-d32064b1ec29@gmail.com>
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
In-Reply-To: <7a90cc1b-b053-4b9f-91f1-d32064b1ec29@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.01.2026 16:39, Oleksii Kurochko wrote:
> On 1/13/26 2:54 PM, Jan Beulich wrote:
>> On 13.01.2026 13:51, Oleksii Kurochko wrote:
>>> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>>> @@ -85,6 +85,22 @@ struct arch_vcpu
>>>>>        register_t vstval;
>>>>>        register_t vsatp;
>>>>>        register_t vsepc;
>>>>> +
>>>>> +    /*
>>>>> +     * VCPU interrupts
>>>>> +     *
>>>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>>>> +     * in irqs_pending.
>>>> And hence a set immediately followed by an unset is then indistinguishable
>>>> from just an unset (or the other way around).
>>> I think it is distinguishable with the combination of irqs_pending_mask.
>> No. The set mask bit tells you that there was a change. But irqs_pending[]
>> records only the most recent set / clear.
>>
>>>>    This may not be a problem, but
>>>> if it isn't, I think this needs explaining. Much like it is unclear why the
>>>> "changed" state needs tracking in the first place.
>>> It is needed to track which bits are changed, irqs_pending only represents
>>> the current state of pending interrupts.CPU might want to react to changes
>>> rather than the absolute state.
>>>
>>> Example:
>>>    - If CPU 0 sets an interrupt, CPU 1 needs to notice “something changed”
>>>      to inject it into the VCPU.
>>>    - If CPU 0 sets and then clears the bit before CPU 1 reads it,
>>>      irqs_pending alone shows 0, the transition is lost.
>> The fact there was any number of transitions is recorded in _mask[], yes,
>> but "the transition" was still lost if we consider the "set" in your
>> example in isolation. And it's not quite clear to me what's interesting
>> about a 0 -> 0 transition. (On x86, such a lost 0 -> 1 transition, i.e.
>> one followed directly by a 1 -> 0 one, would result in a "spurious
>> interrupt": There would be an indication that there was a lost interrupt
>> without there being a way to know which one it was.)
> 
> IIUC, in this reply you are talking about when the contents written to the
> irq_pending and irqs_pending_mask bitmaps are flushed to the hardware
> registers.
> 
> Originally, I understood your question to be about the case where
> vcpu_set_interrupt() is called and then vcpu_unset_interrupt() is called.

I was actually asking in more abstract terms. And I was assuming there
would be pretty direct ways for the guest to have vcpu_{,un}set_interrupt()
invoked. Looks like ...

> I am trying to understand whether such a scenario is possible.
> 
> Let’s take the vtimer as an example. vcpu_set_interrupt(t->v, IRQ_VS_TIMER)
> is not called again until vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) and
> set_timer() are called in vtimer_set_timer().
> 
> The opposite situation is not possible: it cannot happen that
> vcpu_set_interrupt(t->v, IRQ_VS_TIMER) is called and then immediately
> vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) is called, because
> vcpu_unset_interrupt() and set_timer() are only invoked when the guest
> has handled the timer interrupt and requested a new one.
> 
> So if no interrupt flush is happening, the vcpu_set_interrupt() →
> vcpu_unset_interrupt() sequence will only update the irq_pending and
> irqs_pending_mask bitmaps, without touching the hardware registers,
> so no spurious interrupt will occur. And if an interrupt flush does
> happen, it is not possible to have a 1 -> 0 transition due to the call
> sequence I mentioned in the last two paragraphs above.

... that wasn't a correct assumption. (Partly attributed to the patch
series leaving out a number of relevant things, which makes it hard to
guess what else is left out.)

>>> By maintaining irqs_pending_mask, you can detect “this bit changed
>>> recently,” even if the final state is 0.
>>>
>>> Also, having irqs_pending_mask allows to flush interrupts without lock:
>>> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>>> {
>>> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>>> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>>>
>>> *hvip &= ~mask;
>>> *hvip |= val;
>>> }
>>> Without it I assume that we should have spinlcok around access to irqs_pending.
>> Ah yes, this would indeed be a benefit. Just that it's not quite clear to
>> me:
>>
>>      *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);
>>
>> wouldn't require a lock either
> 
> Because vCPU's hvip (which is stored on the stack) can't be changed concurrently
> and it's almost the one place in the code where vCPU->hvip is changed. Another
> place it is save_csrs() during context switch but it can't be called in parallel
> with the vcpu_sync_interrupts() (look below).
> 
>> . What may be confusing me is that you put
>> things as if it was normal to see 1 -> 0 transitions from (virtual)
>> hardware, when I (with my x86 background) would expect 1 -> 0 transitions
>> to only occur due to software actions (End Of Interrupt), unless - see
>> above - something malfunctioned and an interrupt was lost. That (the 1 ->
>> 0 transitions) could be (guest) writes to SVIP, for example.
>>
>> Talking of which - do you really mean HVIP in the code you provided, not
>> VSVIP? So far I my understanding was that HVIP would be recording the
>> interrupts the hypervisor itself has pending (and needs to service).
> 
> HVIP is correct to use here, HVIP is used to indicate virtual interrupts
> intended for VS-mode. And I think you confused HVIP with the HIP register
> which supplements the standard supervisor-level SIP register to indicate
> pending virtual supervisor (VS-level) interrupts and hypervisor-specific
> interrupts.
> 
> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
> to SVIP, for example." then the correspondent HVIP (and HIP as usually
> they are aliasis of HVIP) bits will be updated. And that is why we need
> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
> +void vcpu_sync_interrupts(struct vcpu *v)
> +{
> +    unsigned long hvip;
> +
> +    /* Read current HVIP and VSIE CSRs */
> +    v->arch.vsie = csr_read(CSR_VSIE);
> +
> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
> +    hvip = csr_read(CSR_HVIP);
> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
> +    {
> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
> +        {
> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
> +                                   &v->arch.irqs_pending_mask) )
> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
> +        }
> +        else
> +        {
> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
> +                                   &v->arch.irqs_pending_mask) )
> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
> +        }
> +    }

I fear I don't understand this at all. Why would the guest having set a
pending bit not result in the IRQ to be marked pending? You can't know
whether that guest write happened before or after you last touched
.irqs_pending{,mask}[]? Yet that pair of bit arrays is supposed to be
tracking the most recent update (according to how I understood earlier
explanations of yours).

As an aside - the !test_and_set_bit() can be pulled out, to the outermost
if().

Jan

