Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Du3DHKfjWkH5gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:37:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880412BEC4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 10:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228569.1534719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT8o-0004qX-CK; Thu, 12 Feb 2026 09:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228569.1534719; Thu, 12 Feb 2026 09:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqT8o-0004nu-8u; Thu, 12 Feb 2026 09:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1228569;
 Thu, 12 Feb 2026 09:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqT8m-0004nl-SU
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 09:37:41 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789cd9d0-07f6-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 10:37:39 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8f7a30515aso194770166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 01:37:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6f96573dsm137202566b.2.2026.02.12.01.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 01:37:37 -0800 (PST)
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
X-Inumbo-ID: 789cd9d0-07f6-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770889059; x=1771493859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lti3Q4mDJraMDDpMeyfq2mxrj3EjYc2hjF2kVPl2KgM=;
        b=irQWK0H/enAF5GfwdgggeLskgy9GMNaSCKaJpbkNul1QxFoYWVKwZYjcqw7UbXlCUk
         xlTviS7HQFpk2ItJDXnthIvpF6eVRsj4fsehseOKh4YZcWsniaMtVXqnw5Ziak3DoeU3
         mZQk5nGJplHksxrTZ5tzK017Spk9IAyKC0xJ7gWv8igAnbkOMcy10hrdDor29+uAAYhx
         lusmX69BqDnkI/oVKwyqLD0jiEa8lxLYe6ZhyjXKDt9dYT631RPFdTrO+uLmkjSOVBuj
         ECruvrpfPfiPKlAFZKqIVgvjBdQ+Rjo08+VrKSyxJww50PtXjpa3HaxUZXUwtCEsl3+P
         rVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889059; x=1771493859;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lti3Q4mDJraMDDpMeyfq2mxrj3EjYc2hjF2kVPl2KgM=;
        b=vynph9tTOpIw1yWRsqMyRFpibSL1p8jxQ4AoiQ7TIaPLo9BCFH7LkYrBTxajMJML5w
         UCfBrlbsNHgzCEQmIhQVecjIJN5ugm2KcLVc0ZmBPVD1bgfKKh7lrfN8CKcuarGZaQfh
         wWLKalRYNkkc4OKjiSsGG3tchtDAULAtPDn6651gFCg1YlSeGFmG8eJT1MFuxl3q8kwu
         Jw+oPbBUbmHz3OatwD5FZm2s49esZ3/XCQt6UH05gFeaolVA3yM6HbRxs+EdLdY1mihq
         Nq8LMzfL6RbTf8wm64PTrvYBj8/JzimWRjNsIyYlj5AdcuIuJ5S7a6GmcUOerSU6z0Nh
         UitA==
X-Forwarded-Encrypted: i=1; AJvYcCWdvSW/7HKvnSd/rVu4KCxknSCikTcerG3U2IjwwrcbpD8+owIN8uKkpVJCtkFwi7Z8sAtJq5T9FDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtyrnhK9g66Z4hrE2b+cqbS5D2OEAaSkUqRD9hzWhFwuS9DDp3
	MqUVED7SrrSL2Xnor8oqn2tpmyJzRHDDp1QahTM26+VcAlH/yvIB3ii6vTJKe22t
X-Gm-Gg: AZuq6aLwYDbV/HKFLZK8Cep5BtEswW51O2cdfLccg6wbQhxKT5Dp1+Mcm5EUZ11z5vV
	KUyH1dJUY0rJfhfbY4stmEqnh/RKY+H6w3zsDskCF5XE9LXawfG2K6G0Wp2mKmlDufVPd1AMVgS
	l61OgBmak/aziYIX150ap91yZXKu/8I6By4BslWvUiRX2Qw6ibE5SuT5uJoIl996yo81k4IP7pO
	LS+xTWPO/rfB+FS7KkLzYVezeu0tjpblCxmO0UYOr1tlY7JvOddtKGuK1NKMT4BHMPcJHUFgffK
	ghRlsoacHgnlRalazDPTS7gr63wlXyhO7SOLqsyU1OFy52nW/CLN7+Wc/pgGjZFUx6itVnYLh1n
	yGhfWKGQiJ+ML1SJ2YOq+81WXd+4juNioCRzXYWIo4UyJy3M0i5EGWHK3PRgt6EK7dVpyez8U9s
	Ao+v7t9cji8+jLJ4ZCG9dNwWXPB0DZ/FK+khlE3V90QsEVew9lfaA78MDSmi6xkIE5L4JJ33uTZ
	bw=
X-Received: by 2002:a17:906:c147:b0:b87:25a7:3ea0 with SMTP id a640c23a62f3a-b8f8f3ce302mr125774266b.25.1770889058170;
        Thu, 12 Feb 2026 01:37:38 -0800 (PST)
Message-ID: <f012a5f5-7526-4d41-b8eb-6f1208991b71@gmail.com>
Date: Thu, 12 Feb 2026 10:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 05/16] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1770650552.git.oleksii.kurochko@gmail.com>
 <ced640968434a67c150eff90437f83d3b460a36c.1770650552.git.oleksii.kurochko@gmail.com>
 <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
Content-Language: en-US
In-Reply-To: <d73424e2-84f4-497b-a1f4-f3eea5cdeeb3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9880412BEC4
X-Rspamd-Action: no action


On 2/11/26 3:16 PM, Jan Beulich wrote:
> On 09.02.2026 17:52, Oleksii Kurochko wrote:
>> Based on Linux kernel v6.16.0.
>> Note that smp_wmb() is used instead of smp_mb__before_atomic() as what
>> we want to guarantee that if a bit in irqs_pending_mask is obversable
>> that the correspondent bit in irqs_pending is observable too.
> And the counterpart of this barrier is the one encoded implicitly in
> xchg()? Could do with making more explicit, e.g. by way of adding a
> code comment there.

I thought it would be clear from the paragraph below where xchng_acquire()
is mentioned. I'll update the comment to make it more explicit.

>> Add lockless tracking of pending vCPU interrupts using atomic bitops.
>> Two bitmaps are introduced:
>>   - irqs_pending — interrupts currently pending for the vCPU
>>   - irqs_pending_mask — bits that have changed in irqs_pending
>>
>> The design follows a multi-producer, single-consumer model, where the
>> consumer is the vCPU itself. Producers may set bits in
>> irqs_pending_mask without a lock. Clearing bits in irqs_pending_mask is
>> performed only by the consumer via xchg_acquire().
> What is xchg_acquire() in Xen? I can't spot anything like this.

Rudiment from Linux. I'll change to xchng().

>> The consumer must not
>> write to irqs_pending and must not act on bits that are not set in the
>> mask. Otherwise, extra synchronization should be provided.
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
>> It is possible a guest could have pending bit not result in the hardware
>> register without to be marked pending in irq_pending bitmap as:
> Are there some words missing in this sentence? I find it hard to follow
> the way it is.

Agree, something is wrong with this sentence. I'll rephrase it to:
   It is  possible that a guest could have pending bit in the hardware register
   without being marked pending in irq_pending bitmap as:
   ...


>>    According to the RISC-V ISA specification:
>>      Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and
>>      interrupt-enable  bits for VS-level software interrupts. VSSIP in hip
>>      is an alias (writable) of the same bit in hvip.
>>    Additionally:
>>      When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only
>>      zeros. Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and
>>      hie.VSSIE.
>> This means the guest may modify vsip.SSIP, which implicitly updates
>> hip.VSSIP and the bit being writable with 1 would also trigger an interrupt
> s/writable/written/ ?
>
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
>> and are read-only:
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
> In what you quote there is something being said about bits being r/o in hip,
> but I can't conclude the "cannot be modified by the guest" that is being said
> ahead of the quotation.

I think it would be good then to add:
   When bit 10 of hideleg is zero, vsip.SEIP and vsie.SEIE are read-only zeros.
   Else, vsip.SEIP and vsie.SEIE are aliases of hip.VSEIP and hie.VSEIE.

   When bit 6 of hideleg is zero, vsip.STIP and vsie.STIE are read-only zeros.
   Else, vsip.STIP and vsie.STIE are aliases of hip.VSTIP and hie.VSTIE.
As they are aliases VS* counterparts can't be writable and also:
   Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
   bits for supervisor-level external interrupts. If implemented, SEIP is
   read-only in sip, and is set and cleared by the execution environment,
   typically through a platform-specific interrupt controller.

   Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
   bits for supervisor-level timer interrupts. If implemented, STIP is
   read-only in sip, and is set and cleared by the execution environment

as SIP = VSIP for guest then guest can't update these bits too.

I will update the comment with extra information.

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
>> equentially immediately before VM entry, it is safe to slightly relax
>> this ordering rule in vcpu_sync_interrupts().
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
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
>>   xen/arch/riscv/domain.c             | 70 +++++++++++++++++++++++++++++
>>   xen/arch/riscv/include/asm/domain.h | 24 ++++++++++
>>   xen/arch/riscv/traps.c              |  8 ++++
>>   3 files changed, 102 insertions(+)
>>
>> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
>> index af9586a4eb0d..4513f778cdc4 100644
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -5,6 +5,7 @@
>>   #include <xen/sched.h>
>>   #include <xen/vmap.h>
>>   
>> +#include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/riscv_encoding.h>
>> @@ -124,3 +125,72 @@ void arch_vcpu_destroy(struct vcpu *v)
>>   {
>>       vfree((char *)v->arch.cpu_info + sizeof(struct cpu_info) - STACK_SIZE);
>>   }
>> +
>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    /*
>> +     * We only allow VS-mode software, timer, and external
>> +     * interrupts when irq is one of the local interrupts
>> +     * defined by RISC-V privilege specification.
>> +     */
> What is "when irq is one ..." intended to be telling me? There's no ...
>
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
> ... corresponding code (anymore), afaict.

That part should be removed, there is no any sense for it anymore.

> Further, who are the prospected callers of this function and its sibling
> below? If they're all internal (i.e. not reachable via hypercalls or
> emulation on behalf of the guest), this may want to be assertions.

Considering your further reply:
   Having seen a use in patch 08, I should clarify the "reachable" part here:
   It's not the "reachable" alone, but whether the guest has control over the
   "irq" value passed. For the example in patch 08 this isn't the case.

I think I did not fully understand the part about “the guest has control over
the ‘irq’ value passed”, but at the moment I do not have any plans for the guest
to pass the irq value directly. (Do you have any examples where it should be
needed?).
All the use cases I have in mind are similar to the vtimer case: intercepting
the SBI call and then, inside the handler, calling vcpu_(un)set_interrupt().

>> +    set_bit(irq, v->arch.irqs_pending);
>> +    smp_wmb();
>> +    set_bit(irq, v->arch.irqs_pending_mask);
>> +
>> +    vcpu_kick(v);
> Shouldn't this be conditional upon the pending_mask bit going from 0 to
> 1?

It makes sense to do. I will do that in the following way:
   if ( !test_and_set_bit(irq, v->arch.irqs_pending_mask) )
       vcpu_kick(v);

>
>> +void vcpu_sync_interrupts(struct vcpu *v)
>> +{
>> +    unsigned long hvip;
>> +
>> +    /* Read current HVIP and VSIE CSRs */
>> +    v->arch.vsie = csr_read(CSR_VSIE);
>> +
>> +    /* Sync-up HVIP.VSSIP bit changes done by Guest */
>> +    hvip = csr_read(CSR_HVIP);
>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) &&
> Nit: Parentheses please around an & expression when used in an &&
> one.
>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -54,6 +54,25 @@ struct arch_vcpu {
>>       register_t henvcfg;
>>       register_t hideleg;
>>       register_t hstateen0;
>> +    register_t hvip;
>> +
>> +    register_t vsie;
>> +
>> +    /*
>> +     * VCPU interrupts
>> +     *
>> +     * We have a lockless approach for tracking pending VCPU interrupts
>> +     * implemented using atomic bitops. The irqs_pending bitmap represent
>> +     * pending interrupts whereas irqs_pending_mask represent bits changed
>> +     * in irqs_pending. Our approach is modeled around multiple producer
>> +     * and single consumer problem where the consumer is the VCPU itself.
>> +     *
>> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
>> +     * on RV32 host.
>> +     */
>> +#define RISCV_VCPU_NR_IRQS 64
> What is this 64 deriving from? IOW - can it be some kind of expression,
> helping the reader?

Originally it derives from the width of mideleg, mie, mvien, mvip, and mip (and
their counterpars for other modes) what means that RV32 will have no more then
32 local interrutps, but considering that RISC-V AIA spec tells ...:

   Table 2.1 lists both the CSRs added for machine level and existing machine-level
   CSRs whose size is changed by the Advanced Interrupt Architecture. Existing CSRs
   mie, mip, and mideleg are widended to 64 bits to support a total of 64 interrupt
   causes.
   For RV32, the high-half CSRs listed in the table allow access to the upper 32
   bits of registers mideleg, mie, mvien, mvip, and mip. The Advanced Interrupt
   Architecture requires that these high-half CSRs exist for RV32, but the bits they
   access may all be merely read-only zeros.

... that for RV32 it was widened to 64, so 64 appears here. I haven't used some AIA
specific name for constant 64 as in case if AIA isn't used it is more then enough
to cover PLIC case, for example.

>> --- a/xen/arch/riscv/traps.c
>> +++ b/xen/arch/riscv/traps.c
>> @@ -169,6 +169,11 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>       die();
>>   }
>>   
>> +static void check_for_pcpu_work(void)
>> +{
>> +    vcpu_sync_interrupts(current);
>> +}
> Is this really a helpful wrapper? Or is there going to be more stuff in here
> later on?

Yes, as you noticed in the further patches vcpu_sync_interrupts() won't be the only one
stuff to be called in it.

Thanks.

~ Oleksii


