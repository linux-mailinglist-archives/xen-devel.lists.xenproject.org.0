Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gf14GoD5PGoPvQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:48:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29796C4644
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:48:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GOBxZP1s;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345389.1604258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcghC-0006BR-7g; Thu, 25 Jun 2026 09:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345389.1604258; Thu, 25 Jun 2026 09:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcghC-00069C-4s; Thu, 25 Jun 2026 09:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1345389;
 Thu, 25 Jun 2026 09:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcghA-000696-L3
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcghA-00D1qr-1g
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:48:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cf958-e002-0a2a0a5209dd-0a2a4506e94c-30
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:48:27 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cf96b-08de-0a2a45060019-d155dd2bb02c-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:48:27 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4633193af19so1567854f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 02:48:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caad603b3sm12022186f8f.7.2026.06.25.02.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 02:48:26 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380907; x=1782985707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcZVkgIfnS1r3cU/3cQU3TYngiPnLUDeDIw/8YNG78s=;
        b=GOBxZP1sfyw8clZ/g3bcfghbBB+bgT5aXTXj3S+FmkfKt83Wkz4wSvngmjiPR7QkgL
         4x3ohpoJAvHbkjjPHNYw/d5+aPTkEi6daFzPwwHM5bLHmfpGOj+eAhrc0hXnVuruOhVc
         6ynEB4iO20d9jA1u4GdHkC+znCIVAIPdU55TlIQVu1MMN0cvBcAEObvIGTgFH5WrOvvl
         8vdnXuvW/yxWZoYd76Btpj9mhWGml9PznAsHY59TuMJ0Rm+3LtyElRDV4Q7qJ9UjZoKp
         g46QAGVXDPFUl/x9zQFZ2nDNRgjvBaMecpQfCg5vlRLj9FKopXx6N4AAuLjK8KSdFUGD
         Wp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380907; x=1782985707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XcZVkgIfnS1r3cU/3cQU3TYngiPnLUDeDIw/8YNG78s=;
        b=gssYS27Rr6pSLK/u0mTa0s2lXAX+MpVbVOamzeG0uXWDq2efO/CpZ87yUzAcmfdEV6
         9LBmtFLYOHchf5Vo9T21lm1wm5zDPAMzRuE+UUmXN6H/Sy+Zmiy3J69W9nBEO6N4mpMZ
         FOHkH3btHPOp7rqMLfS3yZw0voV3ZmkkJYU7A9UKdvoZfGxXxFjAhb8Wz9JGDXeU4Fob
         LcN1x/BgtizNxZ9lMn3QLx9eT6qYNtzu9LKARt/aAE79kSBFDa2P0AD8G3wtzk6zPB1L
         U+3cz2duaM3GAErP5daJqZpVFjdNBkfdBKpPv4UKmIem6W7UUCym59nJHsgu5v9IAz6q
         HLOw==
X-Forwarded-Encrypted: i=1; AHgh+RpMySywhlbSFTrosaURxHXX/JEPMDHdQQFziUq6NdwbtezzhokJLxxCdH5X89f183XYrYp6YAyPWaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8MAMtj8PKKWPUgejnFIkiSc1JKr92/NFm2vfoUwwZYcswTsfC
	iCpo/9WwUSEQHL84WSioxs9mHnMyTCeeAZQ3ts9FhTOh2o5I2TFpdMuf
X-Gm-Gg: AfdE7cl8QASv3nD2/YTrru5ljKV9ky5AHqgnnA1+i/m93T4m5u6w0KkHDUes1rpQoO2
	dfOdocyJ2krUnZNj+XjbO3MIxoZX8CwClx2qNtBIATLQohClLeALFlykJw4uxZtBMmyr2ZvJV7M
	RMhSWX7hE+6xw3zcFRs6RyJM2plTjGw3wEV2WqrjjxcdL/2FbvcFpsLJC++kPsgK3bAoyriAcAr
	ekDJ9hV+/r0THRKM57+5ze3gQMk0+cl8Sb3gmPNiASky5ZRmMp165Rwow2s59tolbN4vmoZcRIr
	J1xSKycVxKvQMV1TaEoGWVbLzay93ehS4F/hwtQOShnra/keBkiNnsLZ15G8kc1LOcrD7nJuogT
	iAEsEwwzG4ZsnLpdup6YHDUBII8zGRc5WQDyFvFytqJSFqgMcOxz2oahTbLRgudpQGnfCELibMn
	cjk9qwhdbMbkhNT6/o0lC3Y4tsE+/HI+p6pmFlygQWmqkE2J/4rIzGKKaX7KjgkxLbAMM=
X-Received: by 2002:a05:6000:230d:b0:461:d369:ece6 with SMTP id ffacd0b85a97d-46dc11e3059mr2600381f8f.30.1782380907140;
        Thu, 25 Jun 2026 02:48:27 -0700 (PDT)
Message-ID: <04195c2e-0cb1-45a2-9844-2ce802692704@gmail.com>
Date: Thu, 25 Jun 2026 11:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
 <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
 <b4770ce2-9456-4dae-a322-c8e3f9239472@gmail.com>
 <d0b60963-6711-44ed-833d-83ac9de50aa9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d0b60963-6711-44ed-833d-83ac9de50aa9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1782380907-C573868D-98597690/10/73395122804
X-purgate-type: spam
X-purgate-size: 9877
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C29796C4644



On 6/25/26 8:08 AM, Jan Beulich wrote:
> On 24.06.2026 17:21, Oleksii Kurochko wrote:
>> On 6/22/26 5:57 PM, Jan Beulich wrote:
>>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/include/asm/intc.h
>>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>>> @@ -13,6 +13,7 @@ enum intc_version {
>>>>    };
>>>>    
>>>>    struct cpu_user_regs;
>>>> +struct domain;
>>>>    struct irq_desc;
>>>>    struct kernel_info;
>>>>    struct vcpu;
>>>> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>>>>        /* hw_irq_controller to enable/disable/eoi host irq */
>>>>        const struct hw_interrupt_type *host_irq_type;
>>>>    
>>>> +    /* hw_irq_controller to enable/disable/eoi guest irq */
>>>> +    const struct hw_interrupt_type *guest_irq_type;
>>>
>>> It's likely my limited RISC-V knowledge that I find this extremely odd:
>>> Separate struct hw_interrupt_type-s for host and guest?
>>
>> The guest and host interrupt controllers may handle some
>> hw_irq_controller operations differently, even though the operations
>> themselves are conceptually the same. The hw_irq_controller interface
>> provides fairly abstract interrupt controller operations, but the
>> underlying implementation may differ depending on whether the controller
>> is used by the host or a guest.
>>
>> As an example, the Arm code already follows this approach:
>>
>> /* XXX different for level vs edge */
>> static hw_irq_controller gicv2_host_irq_type = {
>>       .typename     = "gic-v2",
>>       .startup      = gicv2_irq_startup,
>>       .shutdown     = gicv2_irq_shutdown,
>>       .enable       = gicv2_irq_enable,
>>       .disable      = gicv2_irq_disable,
>>       .ack          = gicv2_irq_ack,
>>       .end          = gicv2_host_irq_end,
>>       .set_affinity = gicv2_irq_set_affinity,
>> };
>>
>> static hw_irq_controller gicv2_guest_irq_type = {
>>       .typename     = "gic-v2",
>>       .startup      = gicv2_irq_startup,
>>       .shutdown     = gicv2_irq_shutdown,
>>       .enable       = gicv2_irq_enable,
>>       .disable      = gicv2_irq_disable,
>>       .ack          = gicv2_irq_ack,
>>       .end          = gicv2_guest_irq_end,
>>       .set_affinity = gicv2_irq_set_affinity,
>> };
>>
>> These implementations reuse almost all interrupt controller operations,
>> differing only in the .end callback.
> 
> Which I'm having trouble with as well. Interrupts are handled by Xen. What
> guests get to see are virtualized interrupts (no matter how much HW
> acceleration may be in use). Hence I'm having difficulty to see such a
> split justified.

I think that I don't fully understand what is wrong with splitting. If 
there are cases exist when I need such separation for virtual interrupt 
controller operations then it looks fine to introduce such separation, 
right?

Lets take an example of PLIC.

For each source the PLIC has a "gateway":
1. Claim (read CONTEXT_CLAIM): returns the pending IRQ id and closes the 
gateway for that source, it will not forward that source to any context 
again until completed.
2. Complete (write the id back to CONTEXT_CLAIM): reopens the gateway. 
If the device line is still asserted (level high), the PLIC immediately 
re-marks it pending and delivers it again.

The "closed gateway" between claim and complete is effectively the 
hardware masking the source while it's being serviced.

Then if we will handle guest interrupt in the following way:
1. Passthrough device asserts its line (level stays high).
2. Xen takes the physical IRQ, claims (gateway closes), completes 
(gateway reopens), injects a virtual IRQ into the guest's vPLIC.
3. The guest hasn't run yet, it hasn't touched the device's registers, 
so the device line is still high.
4. The PLIC sees the source still asserted with an open gateway -> marks 
pending -> fires another physical interrupt into Xen -> ... -> repeat.

So we get a storm of physical interrupts for a device the guest hasn't 
even begun servicing. The device line only drops when the guest driver 
writes the device's own registers, which happens long after, and on the 
guest's schedule.

So the solution is that the physical complete must wait until the guest 
has actually quiesced the device. The only signal Xen gets for "guest is 
done" is the guest writing its virtual complete to the emulated vPLIC. So:
1. guest_irq->ack: the claim already happened (the readl(CONTEXT_CLAIM) 
in plic_handle_interrupt); ack just records which context claimed it. 
The gateway stays closed - good, the source is masked while the guest works.
2. inject vIRQ → guest services the device (line drops) -> guest writes 
vPLIC complete.
3. guest_irq->end: now do the physical complete, reopening the gateway. 
Device is quiet -> no spurious re-trigger; if it's a new legitimate 
assertion, it fires once, correctly.

Is it clear enough now?

I understand that it would be much easier if you had access to the 
PLIC/vPLIC code, but I don't see much benefit in introducing it at this 
point. Perhaps we could proceed with the proposed approach and revisit 
the design once the PLIC/vPLIC code that uses it is available.

> 
>>>> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
>>>> +    for ( ;; )
>>>> +    {
>>>> +        action = *action_ptr;
>>>> +        if ( !action )
>>>> +        {
>>>> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
>>>> +            spin_unlock_irqrestore(&desc->lock, flags);
>>>> +            return;
>>>> +        }
>>>> +
>>>> +        if ( action->dev_id == dev_id )
>>>> +            break;
>>>> +
>>>> +        action_ptr = &action->next;
>>>> +    }
>>>> +
>>>> +    /* Found it - remove it from the action list */
>>>> +    *action_ptr = action->next;
>>>> +#else
>>>> +    action = *action_ptr;
>>>> +    *action_ptr = NULL;
>>>> +#endif
>>>> +
>>>> +    /* If this was the last action, shut down the IRQ */
>>>> +    if ( !desc->action )
>>>> +    {
>>>> +        desc->handler->shutdown(desc);
>>>> +        __clear_bit(_IRQ_GUEST, &desc->status);
>>>> +    }
>>>> +
>>>> +    spin_unlock_irqrestore(&desc->lock,flags);
>>>> +
>>>> +    /* Wait to make sure it's not being used on another CPU */
>>>> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
>>>
>>> Can you explain to me what the purpose of this barrier is?
>>
>> if  do_IRQ() was called and:
>>       desc->status |= IRQ_INPROGRESS;
>> was called we have to wait while irq will be handled to avoid NULL
>> pointer derefenece caused by in do_IRQ():
>>       action = desc->action;
>>
>> So if release_irq() and do_irq() are called on different CPUs we want to
>> be sure that do_IRQ() make desc->status visiable for all CPUs.
> 
> For that you need smp_rmb(), not smp_mb(). And then it needs to be clear what
> the write-side counterpart is (presumably the spin-unlock in do_IRQ()).

Agree, smp_rmb() would be enough here. I will use it here and update the 
comment about write-side counterpart.

> 
>>>> +int release_guest_irq(struct domain *d, unsigned int virq)
>>>> +{
>>>> +    struct irq_desc *desc = irq_to_desc(virq);
>>>> +    struct irq_guest *info;
>>>> +    unsigned long flags;
>>>> +
>>>> +    spin_lock_irqsave(&desc->lock, flags);
>>>> +
>>>> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
>>>> +        goto unlock_err;
>>>> +
>>>> +    info = irq_get_guest_info(desc);
>>>> +    if ( d != info->d )
>>>> +        goto unlock_err;
>>>> +
>>>> +    spin_unlock_irqrestore(&desc->lock, flags);
>>>> +
>>>> +    release_irq(desc->irq, info);
>>>> +    xvfree(info);
>>>
>>> So you drop the lock keeping the info associated with desc in place. How
>>> do you know what you free here is the correct thing, and isn't in use
>>> elsewhere?
>>
>> The object freed is captured under desc->lock (info =
>> irq_get_guest_info(desc)), so it is by construction the dev_id of the
>> action attached to this desc, it can't be a stale or wrong pointer.
> 
> Why would this be? Another request_irq() (or whatever it is) can race this,
> can't it?

If an irq will be at that moment in use by guest it won't be mapped to 
guest because of the checks inside route_irq_to_guest():

         if ( test_bit(_IRQ_GUEST, &desc->status) )
         {
             struct domain *ad = irq_get_domain(desc);

             if ( d != ad )
             {
                 printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
                        irq, ad);
                 retval = -EBUSY;
             }
             else if ( irq_get_guest_info(desc)->virq != virq )
             {
                 printk(XENLOG_G_ERR
                        "%pd: IRQ %u is already assigned to vIRQ %u\n",
                        d, irq, irq_get_guest_info(desc)->virq);
                 retval = -EBUSY;
             }
         }

If route_irq_to_guest() will be called at the moment when release_irq() 
above was called but before xvfree() then it shouldn't be a problem as 
route_irq_to_guest() will allocate new info so for old info no users 
anymore. So at the moment when is executed ...:

+int release_guest_irq(struct domain *d, unsigned int virq)
+{
...
+    release_irq(desc->irq, info);
+    xvfree(info);
+    spin_unlock_irqrestore(&desc->lock, flags);

... release_guest_irq() is the exclusive owner of 'info' and so safe to 
tear down  + free.

The only fix I see that should be done it is set clear_bit(_IRQ_GUEST, 
&desc->status); before spin_unlock_irqrestore() to be sure that 
double-free of info isn't occured if release_guest_irq() will be called 
for the same virq. Perhpas it also make sense to add 
irq_set_guest_info(desc, NULL); just to be sure that desc->info is NULL.

~ Oleksii


