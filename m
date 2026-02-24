Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH6uBrqPnWlKQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:47:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18A1868AF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:47:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239930.1541334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqsE-0001Uh-B8; Tue, 24 Feb 2026 11:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239930.1541334; Tue, 24 Feb 2026 11:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqsE-0001TA-7v; Tue, 24 Feb 2026 11:46:42 +0000
Received: by outflank-mailman (input) for mailman id 1239930;
 Tue, 24 Feb 2026 11:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YgY=A4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vuqsC-0001T4-QJ
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:46:40 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a8ce3c-1176-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 12:46:37 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-480706554beso65352975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:46:37 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9feasm26126981f8f.6.2026.02.24.03.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:46:36 -0800 (PST)
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
X-Inumbo-ID: 79a8ce3c-1176-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933597; x=1772538397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBpDW2UZJ+AEKjoK35PVxqs6sEnhdcangKbKOTA4mFA=;
        b=Pu+RirOzN7Vvitz4wCb0XVY4dmnLngS6iOb0YW9dA5EgNg4YuS+rY/+BxJ6Og7MEQ3
         6WB6GIY9W3V6z/6NCSVk2UFDWazWtf7hZXQNAEkYkPFsbRz8nfxObIItPvVCESgUWtK1
         UuHM0Yzx2lbIsNQVvkv2wcfFdx75Pt5YDjvtSiLQW7Ltd8mpYEQpPYx/gPNpQOexF82u
         6mPuk5bUn2Sj+gPHsFr0WGrdOyaha/jNDTOoXudo9F05aHLs+XGMNyZzkbLkBwpCxQpg
         nZCeVdtQr22pJbftnfJz/wyk/J/kG8VJRa9jbN/aQckLMpP/xNoXm/NA9DcBdmDbcmJD
         K1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933597; x=1772538397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBpDW2UZJ+AEKjoK35PVxqs6sEnhdcangKbKOTA4mFA=;
        b=ZXMbr9jffV4RM4hhZx3r25rNPcnxGYGiIiU2wgjEgBOPQu1XKk7bvHPNDYqBmi+RMZ
         pXdMqKXwF1APZJhiYGXdh3tXsrzV+NlVza1Vvd0TjDXP4N7AmhjNGQ8xUE3loeozBFZA
         /8VI5+a9i+45n5mr/YOHxhiR+cqNQsmyaVyz3roYU9fZk1PYugqCMNuET6seloii4M8B
         Jml6U2fYU3BVnAsvXc3joUTRRAtbZIgJhNLsi6cRD+YnNDodVOAeCqu/eFAi2rFppwoz
         czxE5Fhk4i1yAWXytvn6YIYqCgpdBxpXUR2Xgnve5BpO2s/jMDKjnT1HrvdxQcO/Took
         y2iw==
X-Forwarded-Encrypted: i=1; AJvYcCUkjj4OzmBO24j4fADnzQH/jWyzB2jKgJNCXhOqEmzq9SVSV9ebRnZaxkQi4KzHl+2ome8PcMSzv7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg2xYv5pTShcahvQwbYcREJEJaPzotsQTjcmSfykcVw3le6td0
	qwMGuhSiUnTfpnkXg9iIM8GWPTGLmjY5dg2VHRAjFLTzquEejn/O3Bdg
X-Gm-Gg: AZuq6aL4SnW5nOBfJwU2BViv1vnO/YMSZCCq2wOK0Aryfg8B433uxGZwuVjcwzjydIM
	qD3AnzOlmrLoAjZNZBwlkl2UwygQyGXsJKTV+C9/oP8GuEYW/VDPkNG9c9Gqz/Ik4whCkpPpp5S
	PdkEr3mJqPAUPznh4mQUESNHNWnEb5IMiNTNSQIggo85FmBhac2sOgDd/dADRB1/a9eL5L6zc9f
	tQ3oMRNSUotKASq0ctpXMpqTCZ2fC/7GpBfIhtYUwPMnAg0Lu6k7aQiluUHtJ6P12WqfqqUnPot
	EtFAC2rbT4ONqUdAjv6XiBg0iMEQYWPAW9ns9v5P7fp2K5XdN/0hJn6tAMaEAftHLHpoKQY532x
	lNA4KKZR9rwzGCotAMaKoD94kZlDsh2mcjh9XDkuKl/UpZAXXhNUhjDJilHA+7OVRzWvWaFQbt8
	w1fuwbKsB1YOSjnQmasxXQ25hHYpNhrP5HPnoLNUDjhy6wI+t3XeGrv6JLvK4j3l/ktP5cl6BQp
	FE=
X-Received: by 2002:a05:600c:34d3:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-483a962e175mr209312965e9.18.1771933596368;
        Tue, 24 Feb 2026 03:46:36 -0800 (PST)
Message-ID: <b89d5998-c037-495f-8c25-0513587261ee@gmail.com>
Date: Tue, 24 Feb 2026 12:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/14] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1771590794.git.oleksii.kurochko@gmail.com>
 <8c2259991754f219ba030606f39d629eb365b01c.1771590794.git.oleksii.kurochko@gmail.com>
 <17c88ded-48cd-4642-91a4-03fc4575a7ea@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <17c88ded-48cd-4642-91a4-03fc4575a7ea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7E18A1868AF
X-Rspamd-Action: no action


On 2/24/26 11:54 AM, Jan Beulich wrote:
> On 20.02.2026 17:18, Oleksii Kurochko wrote:
>> Based on Linux kernel v6.16.0.
>> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
>> we want to guarantee that if a bit in irqs_pending_mask is obversable
>> that the correspondent bit in irqs_pending is observable too.
>>
>> Add lockless tracking of pending vCPU interrupts using atomic bitops.
>> Two bitmaps are introduced:
>>   - irqs_pending — interrupts currently pending for the vCPU
>>   - irqs_pending_mask — bits that have changed in irqs_pending
>>
>> The design follows a multi-producer, single-consumer model, where the
>> consumer is the vCPU itself. Producers may set bits in
>> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
>> performed only by the consumer via xchg(). The consumer must not write
>> to irqs_pending and must not act on bits that are not set in the mask.
>> Otherwise, extra synchronization should be provided.
>>
>> On RISC-V interrupts are not injected via guest registers, so pending
>> interrupts must be recorded in irqs_pending (using the new
>> vcpu_{un}set_interrupt() helpers) and flushed to the guest by updating
>> HVIP before returning control to the guest. The consumer side is
>> implemented in a follow-up patch.
>>
>> A barrier between updating irqs_pending and setting the corresponding
>> mask bit in vcpu_set_interrupt()/vcpu_unset_interrupt() guarantees
>> that if the consumer observes a mask bit set, the corresponding pending
>> bit is also visible. This prevents missed interrupts during the flush.
>>
>> It is possible that a guest could have pending bit in the hardware
>> register without being marked pending in irq_pending bitmap as:
>>    According to the RISC-V ISA specification:
>>      Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
>>      interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
>>      is an alias (writable) of the same bit in hvip.
>>    Additionally:
>>      When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
>>      zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
>>      hie.VSSIE.
>> This means the guest may modify vsip.SSIP, which implicitly updates
>> hip.VSSIP and the bit being written with 1 would also trigger an interrupt
>> as according to the RISC-V spec:
>>    These conditions for an interrupt trap to occur must be evaluated in a
>>    bounded   amount of time from when an interrupt becomes, or ceases to be,
>>    pending in sip,  and must also be evaluated immediately following the
>>    execution of an SRET  instruction or an explicit write to a CSR on which
>>    these interrupt trap conditions expressly depend (including sip, sie and
>>    sstatus).
>> What means that IRQ_VS_SOFT must be synchronized separately, what is done
>> in vcpu_sync_interrupts(). Note, also, that IRQ_PMU_OVF would want to be
>> synced for the similar reason as IRQ_VS_SOFT, but isn't sync-ed now as
>> PMU isn't supported now.
>>
>> For the remaining VS-level interrupt types (IRQ_VS_TIMER and
>> IRQ_VS_EXT), the specification states they cannot be modified by the guest
>> and are read-only because of:
>>    Bits hip.VSEIP and hie.VSEIE are the interrupt-pending and interrupt-enable
>>    bits for VS-level external interrupts. VSEIP is read-only in hip, and is
>>    the logical-OR of these interrupt sources:
>>      • bit VSEIP of hvip;
>>      • the bit of hgeip selected by hstatus.VGEIN; and
>>      • any other platform-specific external interrupt signal directed to
>>        VS-level.
>>    Bits hip.VSTIP and hie.VSTIE are the interrupt-pending and interrupt-enable
>>    bits for VS-level timer interrupts. VSTIP is read-only in hip, and is the
>>    logical-OR of hvip.VSTIP and any other platform-specific timer interrupt
>>    signal directed to VS-level.
>> and
>>    When bit 10 of hideleg is zero, vsip.SEIP and vsie.SEIE are read-only zeros.
>>    Else, vsip.SEIP and vsie.SEIE are aliases of hip.VSEIP and hie.VSEIE.
>>
>>    When bit 6 of hideleg is zero, vsip.STIP and vsie.STIE are read-only zeros.
>>    Else, vsip.STIP and vsie.STIE are aliases of hip.VSTIP and hie.VSTIE.
>> and also,
>>    Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level external interrupts. If implemented, SEIP is
>>    read-only in sip, and is set and cleared by the execution environment,
>>    typically through a platform-specific interrupt controller.
>>
>>    Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level timer interrupts. If implemented, STIP is
>>    read-only in sip, and is set and cleared by the execution environment
>> Thus, for these interrupt types, it is sufficient to use vcpu_set_interrupt()
>> and vcpu_unset_interrupt(), and flush them during the call of
>> vcpu_flush_interrupts() (which is introduced in follow up patch).
>>
>> vcpu_sync_interrupts(), which is called just before entering the VM,
>> slightly bends the rule that the irqs_pending bit must be written
>> first, followed by updating the corresponding bit in irqs_pending_mask.
>> However, it still respects the core guarantee that the producer never
>> clears the mask and only writes to irqs_pending if it is the one that
>> flipped the corresponding mask bit from 0 to 1.
>> Moreover, since the consumer won't run concurrently because
>> vcpu_sync_interrupts() and the consumer path are going to be invoked
>> sequentially immediately before VM entry, it is safe to slightly relax
>> this ordering rule in vcpu_sync_interrupts().
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v5:
>>   - Update the commit message().
>>   - Rename c to curr.
>>   - Update vcpu_set_interrupt() to use test_and_set_bit() for irqs_pending
>>     bitmask too.
>>   - Move #ifdef CONFIG_RISCV_32 above the comment in vcpu_sync_interrupts().
>> ---
>> Changes in v4:
>>   - Update the commit message.
>>   - Update the comments in vcpu_(un)set_interrupt() and add the the  comment
>>     above smp_wmb() barrier.
>>   - call vcpu_kick() only if the pending_mask bit going from 0 to 1.
>>   - Code style fixes.
>>   - Update defintion of RISCV_VCPU_NR_IRQS to cover potential RV128 case and
>>     the case if AIA isn't used.
>>   - latch current into a local variable in check_for_pcpu_work().
>> ---
>> Changes in v3:
>>   - Use smp_wb() instead of smp_mb__before_atomic().
>>   - Add explanation of the change above in the commit message.
>>   - Move vcpu_sync_interrupts() here to producers side.
>>   - Introduce check_for_pcpu_work() to be clear from where vcpu_sync_interrupts()
>>     is called.
>> ---
>> Changes in V2:
>>   - Move the patch before an introduction of vtimer.
>>   - Drop bitmap_zero() of irqs_pending and irqs_pending_mask bitmaps as
>>     vcpu structure starts out all zeros.
>>   - Drop const for irq argument of vcpu_{un}set_interrupt().
>>   - Drop check "irq < IRQ_LOCAL_MAX" in vcpu_{un}set_interrupt() as it
>>     could lead to overrun of irqs_pending and irqs_pending_mask bitmaps.
>>   - Drop IRQ_LOCAL_MAX as there is no usage for it now.
>> ---
>>   xen/arch/riscv/domain.c             | 75 +++++++++++++++++++++++++++++
>>   xen/arch/riscv/include/asm/domain.h | 23 +++++++++
>>   xen/arch/riscv/traps.c              |  4 ++
>>   3 files changed, 102 insertions(+)
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index c9494db0fbe7..335c41f3e5a1 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -6,6 +6,7 @@
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/riscv_encoding.h>
>> @@ -140,6 +141,80 @@ void arch_vcpu_destroy(struct vcpu *v)
>>       vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
>>   }
>>   
>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    bool kick_vcpu;
>> +
>> +    /* We only allow VS-mode software, timer, and external interrupts */
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
>> +
>> +    kick_vcpu = !test_and_set_bit(irq, v->arch.irqs_pending);
>> +
>> +    /*
>> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
>> +     * which is used in consumer part (vcpu_flush_interrupts()).
>> +     */
>> +    smp_wmb();
>> +
>> +    kick_vcpu |= !test_and_set_bit(irq, v->arch.irqs_pending_mask);
>> +
>> +    if ( kick_vcpu )
>> +        vcpu_kick(v);
>> +
>> +    return 0;
>> +}
>> +
>> +int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    /* We only allow VS-mode software, timer, external interrupts */
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
>> +
>> +    clear_bit(irq, v->arch.irqs_pending);
>> +    /*
>> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
>> +     * which is used in consumer part (vcpu_flush_interrupts()).
>> +     */
>> +    smp_wmb();
>> +    set_bit(irq, v->arch.irqs_pending_mask);
>> +
>> +    return 0;
>> +}
>> +
>> +void vcpu_sync_interrupts(struct vcpu *v)
>> +{
>> +    unsigned long hvip;
>> +
>> +    /* Read current HVIP and VSIE CSRs */
>> +    v->arch.vsie = csr_read(CSR_VSIE);
> What is this needed for, btw? There's no consumer of the field, and the register
> can change right after re-entering the guest.

I missed to clean up that and introduce later.

I am going to use it in the function which will verify if vCPU has interrupts and
so it would be nice to update v->arch.vsie each time (and not only when context
switch is happening) we are in hypervisor to avoid csr_read(CSR_VSIE) each time
and have up to date value.

For now it could be dropped.

>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -54,8 +54,26 @@ struct arch_vcpu {
>>       register_t hideleg;
>>       register_t henvcfg;
>>       register_t hstateen0;
>> +    register_t hvip;
>>   
>>       register_t vsatp;
>> +    register_t vsie;
> Somewhat dependent upon the question above, might hvip and vsie also better
> sit close together?

I will take that into account when vsie will be re-introduced.

Thanks.

~ Oleksii


