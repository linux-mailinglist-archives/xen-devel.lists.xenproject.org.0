Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54098D2360B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204410.1519081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJQi-0003Y6-7H; Thu, 15 Jan 2026 09:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204410.1519081; Thu, 15 Jan 2026 09:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJQi-0003WD-4H; Thu, 15 Jan 2026 09:14:12 +0000
Received: by outflank-mailman (input) for mailman id 1204410;
 Thu, 15 Jan 2026 09:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgJQg-0003W7-KM
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:14:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0d1079-f1f2-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:14:05 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8718187eb6so98817966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:14:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd007fsm1539531366b.31.2026.01.15.01.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:14:03 -0800 (PST)
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
X-Inumbo-ID: 8a0d1079-f1f2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768468444; x=1769073244; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqUg99QjD548h0aCZ23XVdeCBRhKMsL9njyo8YPDMSw=;
        b=i4zQKjlxyDgq2aRsY5AoCJf/XnZt/T+n/nbC8v8dZgnwWtk+v6UVdZY31zX/h2K2+s
         OH2jWzXcGt58thB1vlkwlM2WK6s2BElxfsuomKehDLmTY+b1aIHM9o46Te9AU1CMkT1b
         +DwCw0gV+KCgboiEu5eSBBVtnFemhiPNiNTsYuItVCuLrZ81ITEyeCf1lGbnGrsgfVBe
         DOcs01CeG7lza76vHJlUJPLWYEnhkU47DR38IU50vNTUCmSryo4yZcEyKTQkheur93df
         jFNtZOAR22+aPi+TV8xjSm6hm5SZF9sIpXVefBg0f0g7OUAE7qfO3Qd3b1nWl2CmdHbU
         8mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468444; x=1769073244;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqUg99QjD548h0aCZ23XVdeCBRhKMsL9njyo8YPDMSw=;
        b=reKyLXDE+KVoiOijYqTNHxw3dtqzP6GodsLLn87oBjoz59CYNukxAgJfXLok0zlc7O
         AGkCpag1EW0gpz0mTy8nEOxWIIcn04gEa+pCKnqI2RQ5XZTffoV5tBLA6pFkDOmOanRG
         JbNPAZHRgsEUiDmoKeDrJR1ThgsnH/cPj2Qs4cbxDHRkMI44gdF5E1LDuSJLlyJcNFyG
         6LDz+0+uqKF1WxkWH97wKSBAE9O8x/rofTcXzIN1+ZLq/8g3J2y0laD7s2i4WHHVkAYk
         g72ONzu9P35bxOvWjTGBVBkSGoCJXI4qMVUZ+MvGibSb/wxvWKLiGJ18A7hM0Kz/UeZX
         aj+w==
X-Forwarded-Encrypted: i=1; AJvYcCVLY4uHiB7qFkOylURNVqCfqoyH88qdaHoIPA9ZFiIvMY1BaWuUbHR/9UjMe6DGZt7Ot5g5xU/pkE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbVb/FdmUb7TfJGRIU0AoyvoXv9AgEOoOl3xrhb9RYu8TQtbed
	6aDDhgXQK7WJm2bMXWw0drLNWsc69/fheuhyt8WrAiwm2p+//+1Fjvrd
X-Gm-Gg: AY/fxX4FXgrRGIH5xih/El2RKdU5UZ8FSHgZqIKZ+1IsYY1voS9YNxwoofso/NpUAcM
	A2AE8wRyGfhjU/89pTyDlo/ZCPGQg54sn3LjPI3HoWOxOzHcmyqqvro8m9td5sb95HvataRYy13
	r1SCViFwu7vr4dmEcOcOslxRkbTYiSW5p/PAgR3Ff/pXQOQvveoRf9M2U2E6hj9jkJJjQsYVLPG
	uf+WjGHOZr4vSm9FrQ9lFxCSt8V0of27dyy16Yp+f4rtDUmPx3WdUZVK6Xut/URRBz05EifXQrS
	8vVkIxMsu/PzoiK1p0fj/RXGiQwWQeb47af/pwYsynxQIIkuksoiCBVfitjIPr9MuXURNZEuejy
	IMg3w8iRilFADpLosBLEforBayNaAPXLkh8kXoZWw4X4qi3StEybfI0SlbkzeKpKOtJlC1YYg6W
	mQnn56YaQJP4TMWUFICAZXvTlBSTiJd7XCeG9DHRWuBxm5I5shOFxOUi7f4fL3bxk=
X-Received: by 2002:a17:907:3e26:b0:b87:20eb:a66d with SMTP id a640c23a62f3a-b8761431e0amr382469466b.65.1768468443975;
        Thu, 15 Jan 2026 01:14:03 -0800 (PST)
Message-ID: <b6d9eb9d-24a1-4d11-aa74-c76fd96a2c96@gmail.com>
Date: Thu, 15 Jan 2026 10:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Jan Beulich <jbeulich@suse.com>
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
 <c0d5104b-52ec-484e-ac40-8901ae298fa8@suse.com>
Content-Language: en-US
In-Reply-To: <c0d5104b-52ec-484e-ac40-8901ae298fa8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/26 4:56 PM, Jan Beulich wrote:
> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>> On 1/13/26 2:54 PM, Jan Beulich wrote:
>>> On 13.01.2026 13:51, Oleksii Kurochko wrote:
>>>> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>>>> @@ -85,6 +85,22 @@ struct arch_vcpu
>>>>>>         register_t vstval;
>>>>>>         register_t vsatp;
>>>>>>         register_t vsepc;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * VCPU interrupts
>>>>>> +     *
>>>>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>>>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>>>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>>>>> +     * in irqs_pending.
>>>>> And hence a set immediately followed by an unset is then indistinguishable
>>>>> from just an unset (or the other way around).
>>>> I think it is distinguishable with the combination of irqs_pending_mask.
>>> No. The set mask bit tells you that there was a change. But irqs_pending[]
>>> records only the most recent set / clear.
>>>
>>>>>     This may not be a problem, but
>>>>> if it isn't, I think this needs explaining. Much like it is unclear why the
>>>>> "changed" state needs tracking in the first place.
>>>> It is needed to track which bits are changed, irqs_pending only represents
>>>> the current state of pending interrupts.CPU might want to react to changes
>>>> rather than the absolute state.
>>>>
>>>> Example:
>>>>     - If CPU 0 sets an interrupt, CPU 1 needs to notice “something changed”
>>>>       to inject it into the VCPU.
>>>>     - If CPU 0 sets and then clears the bit before CPU 1 reads it,
>>>>       irqs_pending alone shows 0, the transition is lost.
>>> The fact there was any number of transitions is recorded in _mask[], yes,
>>> but "the transition" was still lost if we consider the "set" in your
>>> example in isolation. And it's not quite clear to me what's interesting
>>> about a 0 -> 0 transition. (On x86, such a lost 0 -> 1 transition, i.e.
>>> one followed directly by a 1 -> 0 one, would result in a "spurious
>>> interrupt": There would be an indication that there was a lost interrupt
>>> without there being a way to know which one it was.)
>> IIUC, in this reply you are talking about when the contents written to the
>> irq_pending and irqs_pending_mask bitmaps are flushed to the hardware
>> registers.
>>
>> Originally, I understood your question to be about the case where
>> vcpu_set_interrupt() is called and then vcpu_unset_interrupt() is called.
> I was actually asking in more abstract terms. And I was assuming there
> would be pretty direct ways for the guest to have vcpu_{,un}set_interrupt()
> invoked. Looks like ...
>
>> I am trying to understand whether such a scenario is possible.
>>
>> Let’s take the vtimer as an example. vcpu_set_interrupt(t->v, IRQ_VS_TIMER)
>> is not called again until vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) and
>> set_timer() are called in vtimer_set_timer().
>>
>> The opposite situation is not possible: it cannot happen that
>> vcpu_set_interrupt(t->v, IRQ_VS_TIMER) is called and then immediately
>> vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) is called, because
>> vcpu_unset_interrupt() and set_timer() are only invoked when the guest
>> has handled the timer interrupt and requested a new one.
>>
>> So if no interrupt flush is happening, the vcpu_set_interrupt() →
>> vcpu_unset_interrupt() sequence will only update the irq_pending and
>> irqs_pending_mask bitmaps, without touching the hardware registers,
>> so no spurious interrupt will occur. And if an interrupt flush does
>> happen, it is not possible to have a 1 -> 0 transition due to the call
>> sequence I mentioned in the last two paragraphs above.
> ... that wasn't a correct assumption. (Partly attributed to the patch
> series leaving out a number of relevant things, which makes it hard to
> guess what else is left out.)

Then it makes sense to introduce second part of pending interrupts tracking
as part of this patch series in the next version.

Or for now not introduce tracking of pending vCPU interrupts and implement
vtimer expired handler as:
	csr_set(CSR_HVIP, IRQ_VS_TIMER);
	vcpu->hvip = csr_read(CSR_HVIP);


>>>> By maintaining irqs_pending_mask, you can detect “this bit changed
>>>> recently,” even if the final state is 0.
>>>>
>>>> Also, having irqs_pending_mask allows to flush interrupts without lock:
>>>> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>>>> {
>>>> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>>>> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>>>>
>>>> *hvip &= ~mask;
>>>> *hvip |= val;
>>>> }
>>>> Without it I assume that we should have spinlcok around access to irqs_pending.
>>> Ah yes, this would indeed be a benefit. Just that it's not quite clear to
>>> me:
>>>
>>>       *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);
>>>
>>> wouldn't require a lock either
>> Because vCPU's hvip (which is stored on the stack) can't be changed concurrently
>> and it's almost the one place in the code where vCPU->hvip is changed. Another
>> place it is save_csrs() during context switch but it can't be called in parallel
>> with the vcpu_sync_interrupts() (look below).
>>
>>> . What may be confusing me is that you put
>>> things as if it was normal to see 1 -> 0 transitions from (virtual)
>>> hardware, when I (with my x86 background) would expect 1 -> 0 transitions
>>> to only occur due to software actions (End Of Interrupt), unless - see
>>> above - something malfunctioned and an interrupt was lost. That (the 1 ->
>>> 0 transitions) could be (guest) writes to SVIP, for example.
>>>
>>> Talking of which - do you really mean HVIP in the code you provided, not
>>> VSVIP? So far I my understanding was that HVIP would be recording the
>>> interrupts the hypervisor itself has pending (and needs to service).
>> HVIP is correct to use here, HVIP is used to indicate virtual interrupts
>> intended for VS-mode. And I think you confused HVIP with the HIP register
>> which supplements the standard supervisor-level SIP register to indicate
>> pending virtual supervisor (VS-level) interrupts and hypervisor-specific
>> interrupts.
>>
>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>> they are aliasis of HVIP) bits will be updated. And that is why we need
>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>> +void vcpu_sync_interrupts(struct vcpu *v)
>> +{
>> +    unsigned long hvip;
>> +
>> +    /* Read current HVIP and VSIE CSRs */
>> +    v->arch.vsie = csr_read(CSR_VSIE);
>> +
>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>> +    hvip = csr_read(CSR_HVIP);
>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>> +    {
>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>> +        {
>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>> +                                   &v->arch.irqs_pending_mask) )
>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>> +        }
>> +        else
>> +        {
>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>> +                                   &v->arch.irqs_pending_mask) )
>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>> +        }
>> +    }
> I fear I don't understand this at all. Why would the guest having set a
> pending bit not result in the IRQ to be marked pending?

Maybe it is wrong assumption but based on the spec:
   Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
   bits  for supervisor-level software interrupts. If implemented, SSIP is
   writable in sip and may also be set to 1 by a platform-specific interrupt
   controller.
and:
   Interprocessor interrupts are sent to other harts by implementation-specific
   means, which will ultimately cause the SSIP bit to be set in the recipient
   hart’s sip register.

Meaning that sending an IPI to self by writing 1 to sip.SSIP is
well-defined. The same should be true of vsip.SSIP while in VS mode.

And so in this case if SSIP handling was delegated by hypervisor to guest by
setting hedeleg[2] = 1 we won't have an interrupt in hypervsor, and so nothing
will set a pending bit in bitmap or update hvip register from hypervisor.

( All bits except SSIP in the sip register are read-only. )


>   You can't know
> whether that guest write happened before or after you last touched
> .irqs_pending{,mask}[]?

Yes, I think you are right.

On the other hand, if we are in hypervisor when vcpu_sync_interrupts() is
called it means that pCPU on which vCPU is ran and for which
vcpu_sync_interrupts() is called now executes some hypervisor things, so
guest won't able to update VSIP.SSIP for this pCPU. So nothing else will
change VSIP.SSIP and so h/w HVIP won't be changed by something and it is
okay to sync .irqs_pending{,mask} with what h/w in its HVIP.

~ Oleksii

> Yet that pair of bit arrays is supposed to be
> tracking the most recent update (according to how I understood earlier
> explanations of yours).
>
> As an aside - the !test_and_set_bit() can be pulled out, to the outermost
> if().

