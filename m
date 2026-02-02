Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ0JDZKBgGnE8wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:50:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6FCB363
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 11:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218522.1527272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmrVk-0004ow-5N; Mon, 02 Feb 2026 10:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218522.1527272; Mon, 02 Feb 2026 10:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmrVk-0004mQ-2h; Mon, 02 Feb 2026 10:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1218522;
 Mon, 02 Feb 2026 10:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lssc=AG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vmrVj-0004mK-HE
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 10:50:27 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae46601-0024-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 11:50:25 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso44114925e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 02:50:25 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce93sm42225697f8f.24.2026.02.02.02.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 02:50:24 -0800 (PST)
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
X-Inumbo-ID: fae46601-0024-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770029425; x=1770634225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XB7C+bBBKninZ5RutK3rjkSLfIYqe3jHctKo7KTIFd8=;
        b=BD5JUtqcB5fi7JGWtDMg6QfH/hEPA1nIScK0wfg8O1lMOCeaLHTy1/bRGxwlh8Vvig
         XD8XPzjVqh9Y5OaIsWAH+1mZaBSdJCQJnY99hhNZ9D+orpCLxLOz/llsibSiuSAiilNp
         j3PvjyHnwYU2xnA2fmqd8OPQX8jUm4Y6II09f8oey4n1MNEIas26AHPX4CRhEwwMxGH/
         32yUUPiHOpf1Ef3dPtm9hm6/u6I6EfyRxoFVfIMm6q/e+PPfYXjU59t9zTVi+bPIxIpd
         bPy5sfKWV7ZFkyrEItcHSg7K+pghzzT1B66BnKeVr0T3xfK+tLYJIb7wLXb0CxrZ+HG4
         Brwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029425; x=1770634225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB7C+bBBKninZ5RutK3rjkSLfIYqe3jHctKo7KTIFd8=;
        b=otIoZ3nzU7pGBY4C6eQy95u8mFC2eNRhBhMza6ILLiHpX6QMcqNfDnBg/schwnvjvB
         0t7il40vCUMC0+dMFjg7pwLVkn78HnLfvJWwW1+JIg3D3qBEJl71eBLWjEBgiXoxJL7W
         hGv79vErMoeocskFQ+AjZIZTObEMtwDA01aHmY2XtzXLBYhvJkf2oA0TLIk9vvp33deD
         nzKqsE3ZPYPqjS7x/gUdrzhqoDJkPM/IFfcjA6pU3IrF3pmHouMzSqkDutEQpJhMLBlu
         EIKjps3Wiy2CLPHTWbGGyW1cSihF0/XEeiM2Ez82moQvobDCYa9Zqh0jLlmrHQMFf6ot
         eohg==
X-Forwarded-Encrypted: i=1; AJvYcCUbOENKyoseA8IgVswI0XMDhR8cjrIRAZt/sp4HgyoY4apqThYqZJRoG9cxI1Am0BsZHq6iIxQaqc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOdBLME10hQMkrK2pSHQXC5+YwN49y+A1PTO77/ZlHnNQ4EUnU
	jQ0KeyRT7U6YlokhfM3WwYU17DLSdQ5B0smH45mmZjy07OKyk9uRikvNOXhzyw==
X-Gm-Gg: AZuq6aL/3jDpo/LRjA5vK9YvRbbKBEhslpBby6E7d3wDDp/oRAihdxnWZmMVLuO96LK
	aVY1qXjdP8u/G1b+YsCha+LD6Akpb8vsFPlWR1Sirm3PwgjQI1igt2bcZbXOAaVlxZzYe6ueULD
	4BTQNJLqgkoW7mrcdZhoCRQJ8LdNJE3dWrOW1TVbkKbdsKAqVG/68ppcFs07FvXADPlltCzD402
	AsKvLckMzwj775SGqlMOI7zSafSyhD+DqQtFPJ9AP1YRdW/kgJLAbobOWfxBU7DdHj2mbOGrKcE
	kI+0YfXwzreL9rdy4ciMz8St8eqqrOVF78zfNYjhYh7gHmib0Y/LpTTnDnScWGbNIzIUYHFI1zs
	9T/GhtBnCchZ/zEd5Z1X1BfIKr6s+glxr9QmfqRtVqhzokt8cRq37H2oOCnZUpHz6azo3/aH2XD
	tpyjY2/7RbA4mBTveXQPsoP9X+docLM+qZuhTPZlgX0X9eZlWU9q8rUyGkNxthEDY=
X-Received: by 2002:a05:600c:4ec7:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-482db46b3eemr136869525e9.13.1770029424665;
        Mon, 02 Feb 2026 02:50:24 -0800 (PST)
Message-ID: <5fd2bbce-7d27-4f54-8eed-5bee0d2a6dd2@gmail.com>
Date: Mon, 2 Feb 2026 11:50:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 2
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <58a7723ec48d84b91fd4730fe3ae653f55a0fd99.1769099885.git.oleksii.kurochko@gmail.com>
 <1bd0726d-20d8-4506-bb8e-849fd8b091a7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1bd0726d-20d8-4506-bb8e-849fd8b091a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81E6FCB363
X-Rspamd-Action: no action


On 1/29/26 6:01 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> This patch is based on Linux kernel 6.16.0.
>>
>> Add the consumer side (vcpu_flush_interrupts()) of the lockless pending
>> interrupt tracking introduced in part 1 (for producers). According, to the
>> design only one consumer is possible, and it is vCPU itself.
>> vcpu_flush_interrupts() is expected to be ran (as guests aren't ran now due
>> to the lack of functionality) before the hypervisor returns control to the
>> guest.
>>
>> Producers may set bits in irqs_pending_mask without a lock. Clearing bits in
>> irqs_pending_mask is performed only by the consumer via xchg() (with aquire &
>> release semantics). The consumer must not write to irqs_pending and must not
>> act on bits that are not set in the mask. Otherwise, extra synchronization
>> should be provided.
>> The worst thing which could happen with such approach is that a new pending
>> bit will be set to irqs_pending bitmap during update of hvip variable in
>> vcpu_flush_interrupt() but it isn't problem as the new pending bit won't
>> be lost and just be proceded during the next flush.
>>
>> It is possible a guest could have pending bit not result in the hardware
>> register without to be marked pending in irq_pending bitmap as:
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
>> as according to the RISC-V spec:
>>    These conditions for an interrupt trap to occur must be evaluated in a
>>    bounded   amount of time from when an interrupt becomes, or ceases to be,
>>    pending in sip,  and must also be evaluated immediately following the
>>    execution of an SRET  instruction or an explicit write to a CSR on which
>>    these interrupt trap conditions expressly depend (including sip, sie and
>>    sstatus).
>> What means that IRQ_VS_SOFT must be synchronized separately, what is done
>> in vcpu_sync_interrupts().
> And this function is going to be used from where? Exit from guest into the
> hypervisor? Whereas vcpu_flush_interrupt() is to be called ahead of re-
> entering the guest?

Both of them are called before returning control to a guest (missed to mention
that in the commit message) in do_trap() at the end:

static void check_for_pcpu_work(void)
{
     ...

     vcpu_flush_interrupts(current);

     vcpu_sync_interrupts(current);
}

void do_trap(struct cpu_user_regs *cpu_regs)
{
     ...
     if ( cpu_regs->hstatus & HSTATUS_SPV )
         check_for_pcpu_work();
}

>
> I ask because vcpu_sync_interrupts() very much looks like a producer to me,
> yet the patch here supposedly is the consumer side.

Yes, vcpu_sync_interrupts() should be in producer side, I'll move it to the prev.
patch.

>
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -171,3 +171,68 @@ int vcpu_unset_interrupt(struct vcpu *v, unsigned int irq)
>>   
>>       return 0;
>>   }
>> +
>> +static void vcpu_update_hvip(struct vcpu *v)
> Pointer-to-const?
>
>> +{
>> +    csr_write(CSR_HVIP, v->arch.hvip);
>> +}
>> +
>> +void vcpu_flush_interrupts(struct vcpu *v)
>> +{
>> +    register_t *hvip = &v->arch.hvip;
>> +
>> +    unsigned long mask, val;
> These are used ...
>
>> +    if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>> +    {
>> +        mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>> +        val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>> +
>> +        *hvip &= ~mask;
>> +        *hvip |= val;
> ... solely in this more narrow scope.

I'll declare them inside the if().

>
>> +    }
>> +
>> +    /*
>> +     * Flush AIA high interrupts.
>> +     *
>> +     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
>> +     * now.
>> +     */
>> +#ifdef CONFIG_RISCV_32
>> +#   error "Update hviph"
>> +#endif
>> +
>> +    vcpu_update_hvip(v);
> Why would bits for which the mask bit wasn't set be written here?

This function inside uses only v->arch.hvip which is updated above according to
the mask.


>
>> +void vcpu_sync_interrupts(struct vcpu *v)
>> +{
>> +    unsigned long hvip;
>> +
>> +    /* Read current HVIP and VSIE CSRs */
>> +    v->arch.vsie = csr_read(CSR_VSIE);
>> +
>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
> Nit: s/does/done/ ?
>
>> +    hvip = csr_read(CSR_HVIP);
>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>> +    {
>> +        if ( !test_and_set_bit(IRQ_VS_SOFT,
>> +                               &v->arch.irqs_pending_mask) )
> Why two separate, nested if()s?

Do you mean that it could be:
   if ( !test_and_set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending_mask) && (hvip & BIT(IRQ_VS_SOFT, UL))
?

>
>> +        {
>> +            if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>> +            else
>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>> +        }
> In the previous patch you set forth strict ordering rules, with a barrier in
> the middle. All of this is violated here.

It still respects the rule that the producer (|vcpu_sync_interrupts()| which
should be in the producer path) never clears the mask and only writes to
|irqs_pending| if it is the one that flipped the corresponding mask bit from 0
to 1.

Considering that the consumer cannot be called concurrently in this case
(since|vcpu_flush_interrupts()| and|vcpu_sync_interrupts()| are only invoked
sequentially in|check_for_pcpu_work()|, as mentioned above), nothing can
clear a bit in the mask in between. Therefore, I think it is acceptable to
slightly bend (and it should be explained in the comment above the
function or in the commit message) the rule that the|irqs_pending| bit must
be written first, followed by updating the corresponding bit in
|irqs_pending_mask() specifically for |vcpu_sync_interrupts().

>
>> +    }
>> +
>> +    /*
>> +     * Sync-up AIA high interrupts.
>> +     *
>> +     * It is necessary to do only for CONFIG_RISCV_32 which isn't supported
>> +     * now.
>> +     */
>> +#ifdef CONFIG_RISCV_32
>> +#   error "Update vsieh"
>> +#endif
> Here you mean the register or the struct vcpu field? It may be helpful to
> disambiguate; assuming it's the latter, simply spell out v->arch.vsieh?
> (Same then for the similar code in vcpu_flush_interrupts().)

Agree, it would be better.

Thanks.

~ Oleksii


