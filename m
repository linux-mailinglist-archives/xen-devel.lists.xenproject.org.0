Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAbNOoeelGmrFwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 17:59:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF314E758
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 17:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235213.1538259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsOPR-00043j-BF; Tue, 17 Feb 2026 16:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235213.1538259; Tue, 17 Feb 2026 16:58:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsOPR-00040Y-66; Tue, 17 Feb 2026 16:58:49 +0000
Received: by outflank-mailman (input) for mailman id 1235213;
 Tue, 17 Feb 2026 16:58:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTcl=AV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsOPP-00040S-9K
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 16:58:47 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebca3b22-0c21-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 17:58:45 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so41771085e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 08:58:45 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371998777sm414896815e9.1.2026.02.17.08.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 08:58:44 -0800 (PST)
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
X-Inumbo-ID: ebca3b22-0c21-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771347525; x=1771952325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8SHnESTZGUEZYIkY5KGwkmLTx52wxQpL74mXy5hNT0=;
        b=Xvwm2LS8s1m5d4PeUdc87dehDH6NDeQ7308E3Hkztec96sAKO54hUF9fMFhCakiiN0
         ubBQ38oGH4UXuLSHMtg7kTUPu+P15mgsvlnh0yV/XRzECxgmObVYec2+8TZuzi4cKUAQ
         QQAboM3U955zoKFGVuW0fOCZ5ELSkpJ0UiX2CAeunr40FEp5LVDBRrcDkh/iPeIDisUt
         Hx6tTNsqeWz6eUG2DE2h8Y2hMlmCuPJJcQ0EMpj3XO8n0Wd1LjSw5j91nEFCyyI12rBm
         /jJcXVjB05dED+o0mmg9i0n0CHrvc16NEzUXTQl6/QipTqqfsQ27MYbiDTE8HNITyrbF
         IiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771347525; x=1771952325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8SHnESTZGUEZYIkY5KGwkmLTx52wxQpL74mXy5hNT0=;
        b=xMgSnN8F0ZRamlqkfnpKIzTdxue2CwH8iupCzLhLna8ctLWTOnh5TgiQp32NOi06rK
         DRoHOv9Fu+ABMR3evCQTqUjVOIDGFbAqJzFv2dPf9VHu8sEYtF47IAqCPM4y/jwiVNPl
         h3w4kU/VU979aQhXClronynnUyvgcwvb7mfG0zzQ0luyFezBZJbHorS6dYa+IlEpIY8Y
         SqTAV7/5pKgDjsaVtHRiQWi9Gs41uPE3DqExoDORqiFsVVJLHk6iMh+JYIuTlMuQ7C8p
         0zIPK0jywjOmsmDTXGCH3qoFWadABUcSkmwbZLuIPXe8enNvaiArSel82ytce6POikI3
         s4cw==
X-Forwarded-Encrypted: i=1; AJvYcCX3/QpQ85YFlWGpfaDZeWMnK1xk3LYbp1Fs3xoULLkVUS4lsMReLqrrygUeSNoeB5DamIwtE9aNcN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGMAQkE6cwV9Zn066sZAe9xBiEURXJ1QxKWDtzNS0Fj8NagDF2
	ltaI0NQTBW/DC0eFUyFLgWnqy7+qawUym8HeJEZuQ4o97YSUvSxONGX0
X-Gm-Gg: AZuq6aLlKnzd6xoVvmxHpdCXQhvkGwGQp6ic4PSa3GmZJcyCDLVvT30qPH60tZOoeef
	ZQkGW6kc75eMwgVeeGEABY7F+GHLMKDv82iA3IJRtIqq3wb62jjKFnjVHou++avnnyOEfLqzLIz
	+Xz4Z2tq9bwM/jXBs8Ozi+/MYOqVojQN8QhSDOAVIKXuUrb7xXv4rOOmqbAr0MmLifAKqoGdjbe
	7nxtXAAzluxKssGYUzYQAkmniRnFJ6sEZ+ix7YKzFZZCyAD/tW1SPUvtVX4M6EKi2OK1Qz02NPP
	iNTytCE7UNlnMBy9OMeSfZqc000wWmtFdr4nC/ytktS5RoUo+HASw2JQLBHAayTkDH4ysLqU+Y2
	Fm1EpycQbb51BGVnQQBw7try3JQW4TyXxde7/+8C6GngevgYCjKnI595eTgDP6MlwISwRwII6VX
	E1mDrt5scsr/o9a2yIpwuCOVt3REtgt9T9Ut3dpUJqZqgi7rRoA5J5ZOm7CR7kVV3Dpk5OoePEs
	KH0sHu2ouDBUA==
X-Received: by 2002:a05:600c:4fd1:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-48373a259bbmr272847915e9.16.1771347524808;
        Tue, 17 Feb 2026 08:58:44 -0800 (PST)
Message-ID: <6dec6f2c-4c39-4a45-b1d0-c3d9db7757ff@gmail.com>
Date: Tue, 17 Feb 2026 17:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] xen/riscv: introduce tracking of pending vCPU
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
References: <cover.1770999383.git.oleksii.kurochko@gmail.com>
 <63661b60f5e1678c93f7ea34e5cf479ca28bc80d.1770999383.git.oleksii.kurochko@gmail.com>
 <fd62a140-ad87-4886-be8d-836dae298cb1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fd62a140-ad87-4886-be8d-836dae298cb1@suse.com>
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 51AF314E758
X-Rspamd-Action: no action


On 2/17/26 3:43 PM, Jan Beulich wrote:
> On 13.02.2026 17:28, Oleksii Kurochko wrote:
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
> "cannot be modified by the guest" is still meaning about anything. Aren't you
> intending to merely talk about their pending bits? Then all of ...

I will use the "the pending bits are read-only" instead of "cannot be modified
by guest" and keep only information about SEIP and STIP bits.


>
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
> ... this is largely irrelevant, while ...
>
>>    Bits sip.SEIP and sie.SEIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level external interrupts. If implemented, SEIP is
>>    read-only in sip, and is set and cleared by the execution environment,
>>    typically through a platform-specific interrupt controller.
>>
>>    Bits sip.STIP and sie.STIE are the interrupt-pending and interrupt-enable
>>    bits for supervisor-level timer interrupts. If implemented, STIP is
>>    read-only in sip, and is set and cleared by the execution environment
> ... this is important.
>
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
> Nit: There was an 's' lost at the start of the line.
>
>> @@ -127,3 +128,73 @@ void arch_vcpu_destroy(struct vcpu *v)
>>   {
>>       vfree((void *)&v->arch.cpu_info[1] - STACK_SIZE);
>>   }
>> +
>> +int vcpu_set_interrupt(struct vcpu *v, unsigned int irq)
>> +{
>> +    /* We only allow VS-mode software, timer, and external interrupts */
>> +    if ( irq != IRQ_VS_SOFT &&
>> +         irq != IRQ_VS_TIMER &&
>> +         irq != IRQ_VS_EXT )
>> +        return -EINVAL;
>> +
>> +    set_bit(irq, v->arch.irqs_pending);
>> +    /*
>> +     * The counterpart of this barrier is the one encoded implicitly in xchg()
>> +     * which is used in consumer part (vcpu_flush_interrupts()).
>> +     */
>> +    smp_wmb();
>> +    set_bit(irq, v->arch.irqs_pending_mask);
> Wasn't this meant to go away with ...
>
>> +    if ( !test_and_set_bit(irq, v->arch.irqs_pending_mask) )
> ... the introduction of this?

Yes, set_bit() should be dropped.


>
>> +      vcpu_kick(v);
> Nit: Bad indentation.
>
> As to the test_and_set_bit(): In isolation here this looks correct, but
> when taking ...
>
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
> ... this into account - what about vcpu_unset_interrupt() followed by
> vcpu_set_interrupt()? Shouldn't that also result in a kick? I.e.
> shouldn't the condition above be whether either of the two bits
> transitioned from 0 to 1?

Then it looks like it is enough to detect that pending bit in
irqs_pending bitmap transitioned from 0 to 1.

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
>> +#define RISCV_VCPU_NR_IRQS MAX(BITS_PER_LONG, 64)
> In the revlog you mention also taking care of "the case if AIA isn't used".
> I can't spot anything like this here.

I don't mention as all the cases are covered by such definition of
RISCV_VCPU_NR_IRQS.

~ Oleksii


