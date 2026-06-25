Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oKkCLFVPPWpZ1AgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:55:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CF6C7316
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 17:55:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DxVXqsUq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345754.1604498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmPT-0004rt-U1; Thu, 25 Jun 2026 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345754.1604498; Thu, 25 Jun 2026 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcmPT-0004qO-Qp; Thu, 25 Jun 2026 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1345754;
 Thu, 25 Jun 2026 15:54:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcmPS-0004q2-QG
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:54:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcmPS-005snI-18
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 17:54:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d4f2a-5cb7-0a2a0a5109dd-0a2a450bafaa-14
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:54:33 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3d4f39-ac48-0a2a450b0019-d155a72eade2-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 17:54:33 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so2972699e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 08:54:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9bbc49a6sm2169165e87.76.2026.06.25.08.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 08:54:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782402873; x=1783007673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=prGqf45KMotqct1Fbj9ZpgPV+/IL1f0q9EviHV0+SCo=;
        b=DxVXqsUq/dfGCAgVDBwBuqLwsd7I8yqIOTxd4/4ssfKB3aAZefs3TXCdGz+jwqVAlA
         2YTYkBY86NXUJ1/1V6iFbn92hcEeXzHijAJWii5mTr6j1wVt+QqjVOyrxVt0IZ5tjJZt
         RnpajpfSqYCOF6Gx62dk/y+3fxhumbP2B6OslENpxMlTvf/VfE9LWSic3HUwt/Ai5LCk
         TP/71I9Pf63veMsPCEOOvVOMWwg/e9j9EkRX8uFoGZVzHYpzdUh443qCa4xlDwF+VLj7
         k0eLq4BEip0uQoGgUdoAA/C2INBHtXoErob3qpkwavHkF7Rep+q3dzAdoCQMTKDmyLJR
         95FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402873; x=1783007673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prGqf45KMotqct1Fbj9ZpgPV+/IL1f0q9EviHV0+SCo=;
        b=FczissqXIOsj+u8CTPn6tFu315Dp7lefacTmJgjqn91DFeKL6PonS6UNYItmr+wuHs
         sgRkVFjARsa3KXsmWxyNgrKi61IKRf1Db9cDQh9l6tz5b7j9ijvp6xwOXF12cvjCXWk0
         9fxrM4+nSVYm/tA26Mr4iQN66MFmhMlw93cpfnSjfO8L9rFKlnDhUZvPXxYfgPL1C9J+
         GhtQ2HVb5d63IVzwS9OgkdRVkrpKwF4/diLpChLtcayxbxcraKOCjKTDFGUfVkU/OirF
         SIu0AAKdqYfKu8UAqEnGkNbhupjkYg34u39vut/qGqXyNlJfHon4/qt1K8dlv5VUBtjW
         frmg==
X-Forwarded-Encrypted: i=1; AHgh+RrS8o8qCE/a8A3P3wq4Z8IFqqGH15nc2VvGwwIJNpxzWl7fn37XEAKjeHFreJibz15BIXcqvMeEBGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylUh1ZtwwJU/rptA33SL9BQIPF4o9nkoSaCoNhXH1lKFMJvOtP
	8juhAWV3/exjqKCrxahUuabmm4iQ0/0XE3RKIYMhaP9xHYHbbufVtOBh
X-Gm-Gg: AfdE7clHNvHa+vrwCiFTykUMIe1xGAieMeQeXLJWIlcSWHpozo6QiF3iQkpTriitrSc
	kKmcz+N+bTOzS9OTJf7o+n1xZ92Dw1KOBmXBY7JgR8K0bvqqPKiurBFX/6KFrCzOJIGIr+CtOsM
	7Fei7xSLKO0xqFhegKIlg3GfSYFCcubPjput2NUVtPbPaQtRVuDsqPJcDDZvrJmCJZElQCZQ/3H
	X5ql1FDqZqjQE96tOUBe8E/aiaTud1RnTdBWG76kxC1UVXG0LatGxNbVkLges2qMsf4AvnizfSo
	KHHxpkYuT3gX4u2S94hLyzgwlmro6cPsD0B1mfm2MaIfxvYu3GJPjzW8vOdvO5Jym9CDam71vxp
	oHT1Qg3LPryR/zMu3wY4uARcZhuongRdHc6/65oMphQircUhBmKgFCsV8moIMVs7sTUToZlT/5A
	J2Ro4d9rvXA00TTzCC6WlTKQBm6rmWq7ckWB/jpiUmtzCb5l+BJOPbDf+VHqYaUWDPuzc=
X-Received: by 2002:ac2:4bce:0:b0:5aa:6db6:537 with SMTP id 2adb3069b0e04-5aea1f41d4emr1306588e87.16.1782402872870;
        Thu, 25 Jun 2026 08:54:32 -0700 (PDT)
Message-ID: <454e633b-2de6-4a04-a711-36bb8b2c8c00@gmail.com>
Date: Thu, 25 Jun 2026 17:54:31 +0200
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
 <04195c2e-0cb1-45a2-9844-2ce802692704@gmail.com>
 <9640e0eb-ea38-41ba-b99c-aafa6c6d7bc7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9640e0eb-ea38-41ba-b99c-aafa6c6d7bc7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782402873-38942220-2AE34C84/10/73395122804
X-purgate-type: spam
X-purgate-size: 8848
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 152CF6C7316



On 6/25/26 1:14 PM, Jan Beulich wrote:
> On 25.06.2026 11:48, Oleksii Kurochko wrote:
>> On 6/25/26 8:08 AM, Jan Beulich wrote:
>>> On 24.06.2026 17:21, Oleksii Kurochko wrote:
>>>> On 6/22/26 5:57 PM, Jan Beulich wrote:
>>>>> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>>>>>> --- a/xen/arch/riscv/include/asm/intc.h
>>>>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>>>>> @@ -13,6 +13,7 @@ enum intc_version {
>>>>>>     };
>>>>>>     
>>>>>>     struct cpu_user_regs;
>>>>>> +struct domain;
>>>>>>     struct irq_desc;
>>>>>>     struct kernel_info;
>>>>>>     struct vcpu;
>>>>>> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>>>>>>         /* hw_irq_controller to enable/disable/eoi host irq */
>>>>>>         const struct hw_interrupt_type *host_irq_type;
>>>>>>     
>>>>>> +    /* hw_irq_controller to enable/disable/eoi guest irq */
>>>>>> +    const struct hw_interrupt_type *guest_irq_type;
>>>>>
>>>>> It's likely my limited RISC-V knowledge that I find this extremely odd:
>>>>> Separate struct hw_interrupt_type-s for host and guest?
>>>>
>>>> The guest and host interrupt controllers may handle some
>>>> hw_irq_controller operations differently, even though the operations
>>>> themselves are conceptually the same. The hw_irq_controller interface
>>>> provides fairly abstract interrupt controller operations, but the
>>>> underlying implementation may differ depending on whether the controller
>>>> is used by the host or a guest.
>>>>
>>>> As an example, the Arm code already follows this approach:
>>>>
>>>> /* XXX different for level vs edge */
>>>> static hw_irq_controller gicv2_host_irq_type = {
>>>>        .typename     = "gic-v2",
>>>>        .startup      = gicv2_irq_startup,
>>>>        .shutdown     = gicv2_irq_shutdown,
>>>>        .enable       = gicv2_irq_enable,
>>>>        .disable      = gicv2_irq_disable,
>>>>        .ack          = gicv2_irq_ack,
>>>>        .end          = gicv2_host_irq_end,
>>>>        .set_affinity = gicv2_irq_set_affinity,
>>>> };
>>>>
>>>> static hw_irq_controller gicv2_guest_irq_type = {
>>>>        .typename     = "gic-v2",
>>>>        .startup      = gicv2_irq_startup,
>>>>        .shutdown     = gicv2_irq_shutdown,
>>>>        .enable       = gicv2_irq_enable,
>>>>        .disable      = gicv2_irq_disable,
>>>>        .ack          = gicv2_irq_ack,
>>>>        .end          = gicv2_guest_irq_end,
>>>>        .set_affinity = gicv2_irq_set_affinity,
>>>> };
>>>>
>>>> These implementations reuse almost all interrupt controller operations,
>>>> differing only in the .end callback.
>>>
>>> Which I'm having trouble with as well. Interrupts are handled by Xen. What
>>> guests get to see are virtualized interrupts (no matter how much HW
>>> acceleration may be in use). Hence I'm having difficulty to see such a
>>> split justified.
>>
>> I think that I don't fully understand what is wrong with splitting. If
>> there are cases exist when I need such separation for virtual interrupt
>> controller operations then it looks fine to introduce such separation,
>> right?
>>
>> Lets take an example of PLIC.
>>
>> For each source the PLIC has a "gateway":
>> 1. Claim (read CONTEXT_CLAIM): returns the pending IRQ id and closes the
>> gateway for that source, it will not forward that source to any context
>> again until completed.
>> 2. Complete (write the id back to CONTEXT_CLAIM): reopens the gateway.
>> If the device line is still asserted (level high), the PLIC immediately
>> re-marks it pending and delivers it again.
>>
>> The "closed gateway" between claim and complete is effectively the
>> hardware masking the source while it's being serviced.
>>
>> Then if we will handle guest interrupt in the following way:
>> 1. Passthrough device asserts its line (level stays high).
>> 2. Xen takes the physical IRQ, claims (gateway closes), completes
>> (gateway reopens), injects a virtual IRQ into the guest's vPLIC.
>> 3. The guest hasn't run yet, it hasn't touched the device's registers,
>> so the device line is still high.
>> 4. The PLIC sees the source still asserted with an open gateway -> marks
>> pending -> fires another physical interrupt into Xen -> ... -> repeat.
>>
>> So we get a storm of physical interrupts for a device the guest hasn't
>> even begun servicing. The device line only drops when the guest driver
>> writes the device's own registers, which happens long after, and on the
>> guest's schedule.
>>
>> So the solution is that the physical complete must wait until the guest
>> has actually quiesced the device. The only signal Xen gets for "guest is
>> done" is the guest writing its virtual complete to the emulated vPLIC. So:
>> 1. guest_irq->ack: the claim already happened (the readl(CONTEXT_CLAIM)
>> in plic_handle_interrupt); ack just records which context claimed it.
>> The gateway stays closed - good, the source is masked while the guest works.
>> 2. inject vIRQ → guest services the device (line drops) -> guest writes
>> vPLIC complete.
>> 3. guest_irq->end: now do the physical complete, reopening the gateway.
>> Device is quiet -> no spurious re-trigger; if it's a new legitimate
>> assertion, it fires once, correctly.
>>
>> Is it clear enough now?
> 
> Well, yes and no. On x86 we have to deal with the situation you describe as
> problematic anyway, as IRQs have priorities associated with them, and higher
> prio ones block equal/lower prio ones until they are "completed" (in the
> terminology you use). 

Just for my understand what is the problem here that until "completed" 
isn't done for this high priority interrupt all other will just wait so 
basically responsiveness of the system in general will be bad? Or some 
other problem is hidden?

> If you don't have anything similar in RISC-V, then
> you may indeed get somewhat simpler code overall with such a split.

IIUC, if the word "block" above is used correctly I would say that 
behavior on RISC-V is different, at least, for PLIC as basically, if we 
have three IRQs and let's say `irq1` has the highest priority.

`irq2` and `irq3` may become pending in the PLIC core, but they will not 
be visible to the CPU until `irq1` is CLAIMed, even if `irq1` is never 
completed (i.e., if you fail to write back to the CLAIM/COMPLETE register).

When the hart reads the CLAIM/COMPLETE register, the PLIC core 
atomically retrieves the ID of the highest-priority pending interrupt 
(`irq1`) and clears its Interrupt Pending (IP) bit in the PLIC core.

Once the IP bit for `irq1` is cleared, the PLIC core immediately 
re-evaluates all remaining pending interrupts. If `irq2` and `irq3` are 
pending, `irq2` (the next-highest-priority interrupt) becomes the 
highest-priority pending interrupt.

The PLIC core will continue to signal the hart (by asserting the `MEIP` 
or `SEIP` bits) as long as there is any pending and enabled interrupt 
whose priority exceeds the hart's threshold.

So the IRQ handler can run for irq2 and irq3 before irq1 is COMPLETED.

So irqs are blocked only until they are claimed.

  Yet if
> there's nothing like that in RISC-V, you can get (almost) arbitrarily deeply
> nested interrupts, which in turn would be a problem you need to deal with.
> IOW I suspect the architecture has something to limit nesting depth.

The trap handler, where the IRQ handler is called, starts with 
interrupts disabled, so nested interrupts cannot really occur at that point.

Therefore, I'm not sure this is what you meant by, "IOW, I suspect the 
architecture has something to limit nesting depth."

Other than interrupts automatically being disabled on trap entry, I 
don't see any additional architectural mechanism that limits nesting 
depth. Therefore, it seems that any further limitation would need to be 
implemented at the software level what is a separate case to implement 
if someone will enable interrupts during trap handler.

Instead of full preemption, interrupt controller handlers often use a 
loop to check for the next highest-priority interrupt before exiting. 
This allows a handler to service irq2, irq1 (mentioned above) 
immediately after finishing the critical work for irq1 without the 
overhead of a full trap entry/exit sequence. Something like:
https://elixir.bootlin.com/linux/v7.1.1/source/drivers/irqchip/irq-sifive-plic.c#L382
https://elixir.bootlin.com/linux/v7.1.1/source/drivers/irqchip/irq-riscv-aplic-direct.c#L138

As an option if nested interrupts are really needed probably they could 
be implemented as increasing interrupt controller threshold register 
each nested trap so at some point interrupts will be stopped to 
occur/visible to CPU. But I think nested interrupts shouldn't be a 
discussion for now.

~ Oleksii


