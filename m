Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E7D1FDA1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203354.1518583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2yb-0000RI-1e; Wed, 14 Jan 2026 15:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203354.1518583; Wed, 14 Jan 2026 15:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg2ya-0000MO-Un; Wed, 14 Jan 2026 15:40:04 +0000
Received: by outflank-mailman (input) for mailman id 1203354;
 Wed, 14 Jan 2026 15:40:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vg2yZ-0008RW-Gb
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:40:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 499af745-f15f-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 16:40:00 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8719aeebc8so564174566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 07:40:00 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56c552sm2549735266b.68.2026.01.14.07.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:39:59 -0800 (PST)
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
X-Inumbo-ID: 499af745-f15f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405200; x=1769010000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juOoVOK9r6SjPvJOndnWvwaTG3b5iooY6F0TbDYVZ1o=;
        b=F2RglWTCbK4NG2EdRdpJ8QZ5UMa38LruHKIbR53+gk1F8VNPbJXLbLi0CC+rC10514
         PHLOouwQpJGqaxZ7tw/rdLlNAYxRXqCmXT2XOFXOAxqCIAIbGqslnYVdvh8u3XekdTW9
         fHAYi1tfGOmPGB5t184kVyNSqR4tOiWNctXXss/hVvilJbwIAWhFQyWeJ4oTgyr8AZ7+
         /QUCuH42HesAc+rDP4coLUPe5jo8mmOkcW4vrr15SyqYDJmtxnoRqWWTAKB+MYQcda6l
         4ay7FJk0Uur3mlE7ozFfOR8FEjsTD3Qfl7e+hIutOCG1LIM5wrW97B4fkRCtK9f2FIiT
         jZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405200; x=1769010000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juOoVOK9r6SjPvJOndnWvwaTG3b5iooY6F0TbDYVZ1o=;
        b=dtgkUkXjgwfw964HjwSJq87k5OFLuAhdy2176qOE25Ychya5PSE4Hqj0CjOujCxOh/
         QWiSlbVgT08WyhstSMR7g8ii1VKO9jkDdA+S+eEWQsZjS3DINDKcYf76JWI1pKjACQG6
         TP6FO/l8tG8oFbBuq6t2cSPEtagGA8+bKDEKtk6va0doc0yGNS1H3e75R65MnRpXsUC2
         F101FhrFfteH7XwguF8uxX8Irb2AtgbXUxZ3FQc9eOs8VVlBeFiS5MIN+wyNHBOCLErB
         O8rAlrOsmFchaozZ3daQfj1IFLnBgxjvLjQTmDE41dv4x8VsxcCdAzFZW757VKpjNObX
         4Uww==
X-Forwarded-Encrypted: i=1; AJvYcCUoEIm0zQOga5bkFfWl0DXwPtu9HX2RYwA/fv7DhRcaOfizv1C2EvGtfdExuMDWPn4sT5HAi/CuoOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbgoO8r8s05NUkOOVz3wVsHF5Dn+c//kt8S7rIdJ6dVZRhE13a
	EtARJZC5nKSgf/bfLkYVrJN1C3+pi1Ewb1CqzDPUercu5WgeOMcxI5j+
X-Gm-Gg: AY/fxX55XFIu9kYoQ7UiLUdjVqY+jM7+leevi+SF0rRpT0WKnonP7EG1qxaGkqY2LiV
	G3/b1XeVgKrt7dHw41zU7VejcNkHmFZgXDGFrMwr5/uBoWjJ88i5h1m3su5C8hYUj33mFip1fJV
	Smx2uJMPwU3ANPlGW4Nh4I3PTwj91vuor10nDNs4oVZv98gLx71n1D0TV/LP7oudy+FFbh415PO
	+IPkZEvG4v22abKRlsmDjgxMfHha1i8vmInFpfCWLjXouw8rukCGDsx+8mP+QxbjOzgXFIUAzSz
	G3eWaw6RQWGVFFcSLr6t4dOWaJ6YlUPnU4an6vZDXZ1uHWVfgjPdFglYHEmJQkTH3OGLYfdd4jj
	1l2do+8c7DAiyJPI8E79VLCsZ7tlfJXXsgpRLVT2XOMQebp9qMhimLy4yKczUaVviP4Al4rLAGu
	oJrDCh3LbeOLl+J7qSK3h3lgTsE4EoUOT03ABt3rRtJPvej9zp+n/4zeQsRihUPP4=
X-Received: by 2002:a17:907:6e86:b0:b87:3280:6003 with SMTP id a640c23a62f3a-b87677e21c5mr178755266b.49.1768405199940;
        Wed, 14 Jan 2026 07:39:59 -0800 (PST)
Message-ID: <7a90cc1b-b053-4b9f-91f1-d32064b1ec29@gmail.com>
Date: Wed, 14 Jan 2026 16:39:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <dd10f076-cf91-426d-b2c0-2fa3056fb54f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/13/26 2:54 PM, Jan Beulich wrote:
> On 13.01.2026 13:51, Oleksii Kurochko wrote:
>> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>> @@ -85,6 +85,22 @@ struct arch_vcpu
>>>>        register_t vstval;
>>>>        register_t vsatp;
>>>>        register_t vsepc;
>>>> +
>>>> +    /*
>>>> +     * VCPU interrupts
>>>> +     *
>>>> +     * We have a lockless approach for tracking pending VCPU interrupts
>>>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>>>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>>>> +     * in irqs_pending.
>>> And hence a set immediately followed by an unset is then indistinguishable
>>> from just an unset (or the other way around).
>> I think it is distinguishable with the combination of irqs_pending_mask.
> No. The set mask bit tells you that there was a change. But irqs_pending[]
> records only the most recent set / clear.
>
>>>    This may not be a problem, but
>>> if it isn't, I think this needs explaining. Much like it is unclear why the
>>> "changed" state needs tracking in the first place.
>> It is needed to track which bits are changed, irqs_pending only represents
>> the current state of pending interrupts.CPU might want to react to changes
>> rather than the absolute state.
>>
>> Example:
>>    - If CPU 0 sets an interrupt, CPU 1 needs to notice “something changed”
>>      to inject it into the VCPU.
>>    - If CPU 0 sets and then clears the bit before CPU 1 reads it,
>>      irqs_pending alone shows 0, the transition is lost.
> The fact there was any number of transitions is recorded in _mask[], yes,
> but "the transition" was still lost if we consider the "set" in your
> example in isolation. And it's not quite clear to me what's interesting
> about a 0 -> 0 transition. (On x86, such a lost 0 -> 1 transition, i.e.
> one followed directly by a 1 -> 0 one, would result in a "spurious
> interrupt": There would be an indication that there was a lost interrupt
> without there being a way to know which one it was.)

IIUC, in this reply you are talking about when the contents written to the
irq_pending and irqs_pending_mask bitmaps are flushed to the hardware
registers.

Originally, I understood your question to be about the case where
vcpu_set_interrupt() is called and then vcpu_unset_interrupt() is called.

I am trying to understand whether such a scenario is possible.

Let’s take the vtimer as an example. vcpu_set_interrupt(t->v, IRQ_VS_TIMER)
is not called again until vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) and
set_timer() are called in vtimer_set_timer().

The opposite situation is not possible: it cannot happen that
vcpu_set_interrupt(t->v, IRQ_VS_TIMER) is called and then immediately
vcpu_unset_interrupt(t->v, IRQ_VS_TIMER) is called, because
vcpu_unset_interrupt() and set_timer() are only invoked when the guest
has handled the timer interrupt and requested a new one.

So if no interrupt flush is happening, the vcpu_set_interrupt() →
vcpu_unset_interrupt() sequence will only update the irq_pending and
irqs_pending_mask bitmaps, without touching the hardware registers,
so no spurious interrupt will occur. And if an interrupt flush does
happen, it is not possible to have a 1 -> 0 transition due to the call
sequence I mentioned in the last two paragraphs above.

>
>> By maintaining irqs_pending_mask, you can detect “this bit changed
>> recently,” even if the final state is 0.
>>
>> Also, having irqs_pending_mask allows to flush interrupts without lock:
>> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>> {
>> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>>
>> *hvip &= ~mask;
>> *hvip |= val;
>> }
>> Without it I assume that we should have spinlcok around access to irqs_pending.
> Ah yes, this would indeed be a benefit. Just that it's not quite clear to
> me:
>
>      *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);
>
> wouldn't require a lock either

Because vCPU's hvip (which is stored on the stack) can't be changed concurrently
and it's almost the one place in the code where vCPU->hvip is changed. Another
place it is save_csrs() during context switch but it can't be called in parallel
with the vcpu_sync_interrupts() (look below).

> . What may be confusing me is that you put
> things as if it was normal to see 1 -> 0 transitions from (virtual)
> hardware, when I (with my x86 background) would expect 1 -> 0 transitions
> to only occur due to software actions (End Of Interrupt), unless - see
> above - something malfunctioned and an interrupt was lost. That (the 1 ->
> 0 transitions) could be (guest) writes to SVIP, for example.
>
> Talking of which - do you really mean HVIP in the code you provided, not
> VSVIP? So far I my understanding was that HVIP would be recording the
> interrupts the hypervisor itself has pending (and needs to service).

HVIP is correct to use here, HVIP is used to indicate virtual interrupts
intended for VS-mode. And I think you confused HVIP with the HIP register
which supplements the standard supervisor-level SIP register to indicate
pending virtual supervisor (VS-level) interrupts and hypervisor-specific
interrupts.

If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
to SVIP, for example." then the correspondent HVIP (and HIP as usually
they are aliasis of HVIP) bits will be updated. And that is why we need
vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
+void vcpu_sync_interrupts(struct vcpu *v)
+{
+    unsigned long hvip;
+
+    /* Read current HVIP and VSIE CSRs */
+    v->arch.vsie = csr_read(CSR_VSIE);
+
+    /* Sync-up HVIP.VSSIP bit changes does by Guest */
+    hvip = csr_read(CSR_HVIP);
+    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
+    {
+        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
+        {
+            if ( !test_and_set_bit(IRQ_VS_SOFT,
+                                   &v->arch.irqs_pending_mask) )
+                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+        }
+        else
+        {
+            if ( !test_and_set_bit(IRQ_VS_SOFT,
+                                   &v->arch.irqs_pending_mask) )
+                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
+        }
+    }
+
+    /* Sync-up AIA high interrupts */
+    vcpu_aia_sync_interrupts(v);
+
+    /* Sync-up timer CSRs */
+    vtimer_sync(v);
+}

>
>>>> Our approach is modeled around multiple producer
>>>> +     * and single consumer problem where the consumer is the VCPU itself.
>>>> +     *
>>>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>>>> +     * on RV32 host.
>>>> +     */
>>>> +#define RISCV_VCPU_NR_IRQS 64
>>>> +    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
>>>> +    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
>>>>    }  __cacheline_aligned;
>>>>    
>>>>    struct paging_domain {
>>>> @@ -123,6 +139,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
>>>>    
>>>>    static inline void arch_vcpu_block(struct vcpu *v) {}
>>>>    
>>>> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq);
>>>> +int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq);
>>> Why the const-s?
>> As irq number isn't going to be changed inside these functions.
> You realize though that we don't normally use const like this? This
> use of qualifiers is meaningless to callers, and of limited meaning to
> the function definition itself. There can be exceptions of course, when
> it is important to clarify that a parameter must not change throughout
> the function.
>
>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>> @@ -91,6 +91,7 @@
>>>>    #define IRQ_M_EXT			11
>>>>    #define IRQ_S_GEXT			12
>>>>    #define IRQ_PMU_OVF			13
>>>> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
>>> MAX together with "+ 1" looks wrong. What is 14 (which, when MAX is 14,
>>> must be a valid interrupt)? Or if 14 isn't a valid interrupt, please use
>>> NR or NUM.
>> I didn’t fully understand your idea. Are you suggesting having|IRQ_LOCAL_NR|?
>> That sounds unclear, as it’s not obvious what it would represent.
>> Using|MAX_HART| seems better, since it represents the maximum number allowed
>> for a local interrupt. Any IRQ below that value is considered local, while
>> values above it are implementation-specific interrupts.
> Not quite. If you say "max", anything below _or equal_ that value is
> valid / covered. When you say "num", anything below that value is
> valid / covered. That is, "max" is inclusive for the upper bound of
> the range, while "num" is exclusive. Hence my question whether 14 is
> a valid local interrupt.

14 is architecturally classified as a local interrupt, but its specific
function is currently reserved.

Intention was to cover standard portion (bits 15:0) of sip for which bits
15 and 14 are 0 as they are reserved, so it seems like NUM could be used here.

~ Oleksii



