Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E7D18ECB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:51:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201687.1517257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdro-0004Lz-1G; Tue, 13 Jan 2026 12:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201687.1517257; Tue, 13 Jan 2026 12:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdrn-0004KL-US; Tue, 13 Jan 2026 12:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1201687;
 Tue, 13 Jan 2026 12:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i8AK=7S=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vfdrm-0004KC-BP
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:51:22 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 898f5082-f07e-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 13:51:11 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-653781de668so591107a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 04:51:11 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm303503166b.67.2026.01.13.04.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 04:51:10 -0800 (PST)
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
X-Inumbo-ID: 898f5082-f07e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308671; x=1768913471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rc+00Iz/VNwj12qtx2UFz2wSnCxu9Xw7NrDdCTd38hM=;
        b=DeJVhnNBnj7OmRpn+QEt9qhrZIG1KO67yLF45dhgIdqG6M6zATQBXIOE4Tu6GSy6fQ
         mY+hmPU+XeQyL14ERQEmaF9BmIQmE6oLw2Ohfg6KEECie4kvcab85dM4dIerhNoVCKDg
         76/ZJrYZHJwqr2NNrYXD2ciaB8wdDwpJWcKQuDRVRObVdGmNlEto0v+x3NZJ+x8znUcr
         JmyDE2JGzMSIHT02QpB/81rq46xFv5+VJC0WWkI3kO7eQwazUdpJFj9Uhr3J7XoaPYlx
         Y3BKEuEzbm6XicuSMtc6qT++Cn/Qzp3n14tLm2p4No1J88sRNVzQhWLG5U5QOd16KrbR
         jvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308671; x=1768913471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc+00Iz/VNwj12qtx2UFz2wSnCxu9Xw7NrDdCTd38hM=;
        b=nlEZTlnknZkqQhtYn/1hBLc4E8r/+JDyLazbKObedQ2QqbRdmf63zSf5xDegW7fCa3
         AhSrdAELaD0pQoeIQ2LKSv25Ht1vECjVoD4FU5MIdI800dV5amH3rlwEWCMF11ALmyut
         UkM4GKZKBvwHCTBW7hBJBWyCu36svmsBgNOYf7nNdEpupZOp4kPEJBHz7dUPU9D9Cq6U
         YaE0nKz4CmR78qnGwC6NUAau3bRwW57d43/woa1bN1LJjtkN3WpA9xe9AOhVPGdAV+lI
         k7F620QMsRIR15sNDWolk5fZ80bJCcfA/XL5JZR9a+rj3RXkGv/ZZtwx6pg/Xw1mcIn0
         MRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWngFdc70rNXFRR0IChNhGhgNOTZDACjPGvnqVChMDmI12wp4/2dVxIC4cXqD0NpXH8jCGvv64hZx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8+yZqmLeVbQ7LAxuUPo9c1//UIeGLPquU1otYyTs7fajxJRfp
	b9M2b0/156up/VTnHt6jSnIekMdvDKDfsWQdkmLlQ0rrgduAPDelb7Z9
X-Gm-Gg: AY/fxX7xrqdiYgdoNhBj8GIdfAJPkJyFsKMCk660EPWEXHF6wcy2rMJdqd5Ddj7BGka
	27uVW8l9SUIgeYlnhRQm4ypVKqSBotKww7p9OyKLoWFhJcCK6VwOKTY2O9nPsl0IXQfs+zEBxxx
	+ldCK/YGnoaCNAgjenE1RKaKrf+QNWDEj+T/TceWLskdm+y/PK6E6NiNzNeho7QDgqCsk574KeP
	DhUIfRHVaxuPgNMK2IZTLH7UvPxleiD0y4p2FgSBQ2EoE1by+BYLFZxcbbaDuBZA9i7/lMssas0
	5clz/7PFM2J3YSG2g9bZbyEDLhxw4X1/0IFw/fkUQKwmn2/xrWjTP5i2TUbsarJDNzLxNA84+sU
	ehsj+iVDiqqzOSztPOXDQeIWPrPlp1MmX01SbCauoMLOimGxhK1Hk11Vw7DqJkl33w+c7QQ6Gwm
	r7iw7wEI6s4WxydLHF7ilnQoDaMumYHwOrnJXZ3PCORgy20d3pzlg/0hVe7muuqnA=
X-Google-Smtp-Source: AGHT+IHncNc7a6dHmmle2NYf3jdUgD++hEj21S6BYblCjzvDgJdMqacZXYG0KQa4v42TaZpHeL3wlw==
X-Received: by 2002:a17:907:a4a:b0:b7c:e320:5228 with SMTP id a640c23a62f3a-b84451bf352mr1919554766b.22.1768308670414;
        Tue, 13 Jan 2026 04:51:10 -0800 (PST)
Message-ID: <f707899a-3200-4467-a827-2195351f1226@gmail.com>
Date: Tue, 13 Jan 2026 13:51:09 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/26 5:28 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> This patch is based on Linux kernel 6.16.0.
>>
>> Introduce a lockless mechanism for tracking pending vCPU interrupts using
>> atomic bit operations. The design follows a multi-producer, single-consumer
>> model where the consumer is the vCPU itself.
>>
>> Two bitmaps are added:
>>   - irqs_pending — represents interrupts currently pending
>>   - irqs_pending_mask — represents bits that have changed in irqs_pending
>>
>> Introduce vcpu_(un)set_interrupt() to mark an interrupt in irqs_pending{_mask}
>> bitmap(s) to notify vCPU that it has or no an interrupt.
> It's not becoming clear how these are going to be used. It's also not clear
> to me whether you really need to record these in software: Aren't there
> (virtual) registers where they would be more naturally tracked, much like
> hardware would do?

Guest (virtual) registers are not used to inject interrupts on RISC-V; for that
purpose, the HVIP register is provided. Even without considering HVIP, using guest
(virtual) registers has a downside: if a bit in hideleg is zero, the corresponding
bit in VSIP is read-only zero. During a context_switch(), when CSRs are saved,
this means we would not obtain correct values, since some VSIP bits may read as
zero during csr_read().

In fact, this is one of the reasons why we want to track interrupts to be
injected separately. For example, a vtimer may expire while the vCPU is running
on a different pCPU, so we update vCPU->hvip while the vCPU is active elsewhere.
When the vCPU is later switched in during a context_switch(), we would lose the
fact that vCPU->hvip.vtimer was set to 1, because the CSR save function will do:
   vCPU->hvip = csr_read(CSR_HVIP);
and the pending interrupt state would be overwritten.

>
> Furthermore, since you're dealing with two bitmaps, there's no full
> atomicity here anyway. The bitmaps are each dealt with atomically, but
> the overall update isn't atomic. Whether that's going to be okay can only
> be told when also seeing the producer side.

You're correct that the two-bitmap update isn't fully atomic, but this design
is intentional. Here [1], other  is the part 2 of introduction of pending vCPU interrupts
and as it requires more stuff to introduce (for example, [2]) I decided not to
introduce it now with some stubs and introduce it when all will be ready for it.

If a producer is interrupted between updating the two bitmaps the worst case is:
vCPU might process stale state for one cycle, this is resolved on the next flush when
the mask indicates the bit changed. No interrupt is permanently lost or spuriously
generated.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/31022d515789a032fd994f9ca90965db089dbbd5
void vcpu_flush_interrupts(struct vcpu *v)
{
register_t *hvip = &v->arch.hvip;

unsigned long mask, val;

if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
{
mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;

*hvip &= ~mask;
*hvip |= val;
}

/* Flush AIA high interrupts */
vcpu_aia_flush_interrupts(v);

vcpu_update_hvip(v);
}


void vcpu_sync_interrupts(struct vcpu *v)
{
unsigned long hvip;

/* Read current HVIP and VSIE CSRs */
v->arch.vsie = csr_read(CSR_VSIE);

/* Sync-up HVIP.VSSIP bit changes does by Guest */
hvip = csr_read(CSR_HVIP);
if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
{
if ( hvip & BIT(IRQ_VS_SOFT, UL) )
{
if ( !test_and_set_bit(IRQ_VS_SOFT,
&v->arch.irqs_pending_mask) )
set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
}
else
{
if ( !test_and_set_bit(IRQ_VS_SOFT,
&v->arch.irqs_pending_mask) )
clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
}
}

/* Sync-up AIA high interrupts */
vcpu_aia_sync_interrupts(v);

/* Sync-up timer CSRs */
vtimer_sync(v);
}


[2] https://gitlab.com/xen-project/people/olkur/xen/-/commit/1c06b8b1d1eadfe009a4d6b1a1902fac64d080e9

>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -5,9 +5,11 @@
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>>   
>> +#include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/riscv_encoding.h>
>> +#include <asm/system.h>
>>   #include <asm/vtimer.h>
>>   
>>   static void vcpu_csr_init(struct vcpu *v)
>> @@ -100,6 +102,9 @@ int arch_vcpu_create(struct vcpu *v)
>>       if ( is_idle_vcpu(v) )
>>           return rc;
>>   
>> +    bitmap_zero(v->arch.irqs_pending, RISCV_VCPU_NR_IRQS);
>> +    bitmap_zero(v->arch.irqs_pending_mask, RISCV_VCPU_NR_IRQS);
> This is pointless, as struct vcpu starts out all zero.
>
>> @@ -135,3 +140,45 @@ void vcpu_kick(struct vcpu *v)
>>           smp_send_event_check_mask(cpumask_of(v->processor));
>>       }
>>   }
>> +
>> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq)
>> +{
>> +    /*
>> +     * We only allow VS-mode software, timer, and external
>> +     * interrupts when irq is one of the local interrupts
>> +     * defined by RISC-V privilege specification.
>> +     */
>> +    if ( irq < IRQ_LOCAL_MAX &&
> What use is this? In particular this allows an incoming irq with a huge
> number to ...
>
>> +         irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
>> +
>> +    set_bit(irq, v->arch.irqs_pending);
>> +    smp_mb__before_atomic();
>> +    set_bit(irq, v->arch.irqs_pending_mask);
> ... overrun both bitmaps.

Agree, it would be better just to drop "irq < IRQ_LOCAL_MAX &&".

>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -85,6 +85,22 @@ struct arch_vcpu
>>       register_t vstval;
>>       register_t vsatp;
>>       register_t vsepc;
>> +
>> +    /*
>> +     * VCPU interrupts
>> +     *
>> +     * We have a lockless approach for tracking pending VCPU interrupts
>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>> +     * in irqs_pending.
> And hence a set immediately followed by an unset is then indistinguishable
> from just an unset (or the other way around).

I think it is distinguishable with the combination of irqs_pending_mask.

>   This may not be a problem, but
> if it isn't, I think this needs explaining. Much like it is unclear why the
> "changed" state needs tracking in the first place.

It is needed to track which bits are changed, irqs_pending only represents
the current state of pending interrupts.CPU might want to react to changes
rather than the absolute state.

Example:
  - If CPU 0 sets an interrupt, CPU 1 needs to notice “something changed”
    to inject it into the VCPU.
  - If CPU 0 sets and then clears the bit before CPU 1 reads it,
    irqs_pending alone shows 0, the transition is lost.
By maintaining irqs_pending_mask, you can detect “this bit changed
recently,” even if the final state is 0.

Also, having irqs_pending_mask allows to flush interrupts without lock:
if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
{
mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;

*hvip &= ~mask;
*hvip |= val;
}
Without it I assume that we should have spinlcok around access to irqs_pending.


>
>> Our approach is modeled around multiple producer
>> +     * and single consumer problem where the consumer is the VCPU itself.
>> +     *
>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>> +     * on RV32 host.
>> +     */
>> +#define RISCV_VCPU_NR_IRQS 64
>> +    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
>> +    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
>>   }  __cacheline_aligned;
>>   
>>   struct paging_domain {
>> @@ -123,6 +139,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
>>   
>>   static inline void arch_vcpu_block(struct vcpu *v) {}
>>   
>> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq);
>> +int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq);
> Why the const-s?

As irq number isn't going to be changed inside these functions.

>
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -91,6 +91,7 @@
>>   #define IRQ_M_EXT			11
>>   #define IRQ_S_GEXT			12
>>   #define IRQ_PMU_OVF			13
>> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
> MAX together with "+ 1" looks wrong. What is 14 (which, when MAX is 14,
> must be a valid interrupt)? Or if 14 isn't a valid interrupt, please use
> NR or NUM.

I didn’t fully understand your idea. Are you suggesting having|IRQ_LOCAL_NR|?
That sounds unclear, as it’s not obvious what it would represent.
Using|MAX_HART| seems better, since it represents the maximum number allowed
for a local interrupt. Any IRQ below that value is considered local, while
values above it are implementation-specific interrupts.

> Also, nit: Padding doesn't match with the earlier #define-s (even if in the
> quoted text it appears otherwise).

Thanks.

~ Oleksii


