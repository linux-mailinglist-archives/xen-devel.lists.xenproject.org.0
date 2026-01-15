Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8FD2407E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 11:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204797.1519361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgL0r-0007Sn-Un; Thu, 15 Jan 2026 10:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204797.1519361; Thu, 15 Jan 2026 10:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgL0r-0007Qx-Ra; Thu, 15 Jan 2026 10:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1204797;
 Thu, 15 Jan 2026 10:55:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgL0r-0007Qr-0c
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 10:55:37 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b76ddba5-f200-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 11:55:35 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-65089cebdb4so1170495a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 02:55:34 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654120840dfsm2230564a12.27.2026.01.15.02.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 02:55:33 -0800 (PST)
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
X-Inumbo-ID: b76ddba5-f200-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768474533; x=1769079333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C12moZQp1Jlz4eDJh1Ln6w399/SbVfOuWsYDoQk6hyY=;
        b=QzB0SOu7v+NHkBmbLht6NcNwggRDG28OZ1J7WfAuRetDpi0zEv5xxNAAVp8LXoMNsX
         Pw4bz/Mq7ORknKzYdhrSdCMOw0uS7HYW5jtrZtgXZgS47zU8//NKHRi+4FV7DBVyB1De
         TXLh98+zYVlv8Kyn+XwVWco1OzSD6exNro+NEWwX08IrNdmieDg/R1hnavhL7yvNECXO
         BCu2EJYfWLkFnJIBGVJPi1Dqm5HOgpetqagJoADWGcYzVuFwHFEzHdM1sFFJG1jqkHwG
         oy5bZqma0H83ZEiekfBTXDv5V5CbSijwVALzojzDHoyrzHJ2hCzbONiwFkTx+UTFgzIJ
         YolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768474533; x=1769079333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C12moZQp1Jlz4eDJh1Ln6w399/SbVfOuWsYDoQk6hyY=;
        b=XgqIfgHlmmhmZsNpIY/2l6pAkHbRHa8jUK5fw0JAgpOFquVaqLNWNZgAET1ofdt0yn
         aUjsEzycowaR+tfBeGdRUhYI2fvO1ABXA5n1stu9aP31k8eTKLoVxWeDRskTWAjfByjB
         jZxUoxFzlkaR1LinwTayzLFTDeLmj3Qb7pylvedoH6HP/aSko9tRZbAJGDwPTamM11UA
         zfT4Qp1GBKoW3/FkFxrPzoQOpoEho4/S8dhgs5CCqqXHYp25dgEmbLkwPK2Vv3v3TB0i
         B/pJa6R5FACvD4Uvfl1uc9n28CwSAvKbEeSlFEFAVznE7m4btIyyz3JZ995GX288/16F
         Auyw==
X-Forwarded-Encrypted: i=1; AJvYcCVxd9WgTkKb2x6KKNxf515pS/IKWfLOyc1Bm85A6+zfDzzSZrrn7KMdOaGMeulcBKvtOLYthQrZiEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYUdnBLBE30C1WWR2mobG3jteXftTHjcBt6kd+jCnq4lLrGoOZ
	wvw/M4Y0wuXia5ZSg/jDD1DTocmaG/pqBq8TrR/caoQBLTiqyx1+Z8hC
X-Gm-Gg: AY/fxX6hAw35dPauAemdmj0h9MtWxmK8pRbGRUlR911x+64vRR30HNM7IE2VUevxiwr
	HPR8i6MEA/2pkblbS3P4EoO+PKWi1muA9wHydc9QuGX+uCy31+vmnPa+HzOM8FxR9aTYiYJ3eL1
	niTUlFRwORn4n6rELZ95f00+EJIPeF3fq5Z0upc1T+amDjjJ9Xb6pdhx6h+JfxhHEM/Xk1UAqkh
	naB66oKniVjotccfLO/22u3fvBQPCksmCOitz2T/h3crUXL/lpRvIJs8QAFMokyBenj1BnHq5sq
	5+uOKA6iWUq1339IybtbrNxmTxaEl0nq9sJRejV2srfds9UBQ8cPsk26jx0NYS5bF/7S5TYgy3B
	HAfYMFjzEHNEQiAkMok8q/rvQGBMWJ18lpKw8xpNw5MQBd/hfMsaBkWEthlY5yfM6YN3dLQ8lMe
	mHDrAnNSFVcAmm7C2JjMs6Y53DSTYneoNom44Ne1ZEvx6jnT1jo/vpohJ/1sWACKJggmNosiCsc
	w==
X-Received: by 2002:aa7:c50e:0:b0:650:8a2c:43de with SMTP id 4fb4d7f45d1cf-653ec4744f0mr3393130a12.29.1768474533311;
        Thu, 15 Jan 2026 02:55:33 -0800 (PST)
Message-ID: <a80a50c0-eefc-4ee3-8d49-145698d45297@gmail.com>
Date: Thu, 15 Jan 2026 11:55:32 +0100
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
 <7a90cc1b-b053-4b9f-91f1-d32064b1ec29@gmail.com>
 <c0d5104b-52ec-484e-ac40-8901ae298fa8@suse.com>
 <b6d9eb9d-24a1-4d11-aa74-c76fd96a2c96@gmail.com>
 <fc3d92fe-e04e-48df-a0ed-c74b3bb7d3ba@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <fc3d92fe-e04e-48df-a0ed-c74b3bb7d3ba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/15/26 10:52 AM, Jan Beulich wrote:
> On 15.01.2026 10:14, Oleksii Kurochko wrote:
>> On 1/14/26 4:56 PM, Jan Beulich wrote:
>>> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>>>> On 1/13/26 2:54 PM, Jan Beulich wrote:
>>>>> On 13.01.2026 13:51, Oleksii Kurochko wrote:
>>>>>> On 1/7/26 5:28 PM, Jan Beulich wrote:
>>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> By maintaining irqs_pending_mask, you can detect “this bit changed
>>>>>> recently,” even if the final state is 0.
>>>>>>
>>>>>> Also, having irqs_pending_mask allows to flush interrupts without lock:
>>>>>> if ( ACCESS_ONCE(v->arch.irqs_pending_mask[0]) )
>>>>>> {
>>>>>> mask = xchg(&v->arch.irqs_pending_mask[0], 0UL);
>>>>>> val = ACCESS_ONCE(v->arch.irqs_pending[0]) & mask;
>>>>>>
>>>>>> *hvip &= ~mask;
>>>>>> *hvip |= val;
>>>>>> }
>>>>>> Without it I assume that we should have spinlcok around access to irqs_pending.
>>>>> Ah yes, this would indeed be a benefit. Just that it's not quite clear to
>>>>> me:
>>>>>
>>>>>        *hvip |= xchg(&v->arch.irqs_pending[0], 0UL);
>>>>>
>>>>> wouldn't require a lock either
>>>> Because vCPU's hvip (which is stored on the stack) can't be changed concurrently
>>>> and it's almost the one place in the code where vCPU->hvip is changed. Another
>>>> place it is save_csrs() during context switch but it can't be called in parallel
>>>> with the vcpu_sync_interrupts() (look below).
>>>>
>>>>> . What may be confusing me is that you put
>>>>> things as if it was normal to see 1 -> 0 transitions from (virtual)
>>>>> hardware, when I (with my x86 background) would expect 1 -> 0 transitions
>>>>> to only occur due to software actions (End Of Interrupt), unless - see
>>>>> above - something malfunctioned and an interrupt was lost. That (the 1 ->
>>>>> 0 transitions) could be (guest) writes to SVIP, for example.
>>>>>
>>>>> Talking of which - do you really mean HVIP in the code you provided, not
>>>>> VSVIP? So far I my understanding was that HVIP would be recording the
>>>>> interrupts the hypervisor itself has pending (and needs to service).
>>>> HVIP is correct to use here, HVIP is used to indicate virtual interrupts
>>>> intended for VS-mode. And I think you confused HVIP with the HIP register
>>>> which supplements the standard supervisor-level SIP register to indicate
>>>> pending virtual supervisor (VS-level) interrupts and hypervisor-specific
>>>> interrupts.
>>>>
>>>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>>>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>>>> they are aliasis of HVIP) bits will be updated. And that is why we need
>>>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>>> +{
>>>> +    unsigned long hvip;
>>>> +
>>>> +    /* Read current HVIP and VSIE CSRs */
>>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>>> +
>>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>>>> +    hvip = csr_read(CSR_HVIP);
>>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>>> +    {
>>>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>>>> +        {
>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>> +                                   &v->arch.irqs_pending_mask) )
>>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>> +        }
>>>> +        else
>>>> +        {
>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>> +                                   &v->arch.irqs_pending_mask) )
>>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>> +        }
>>>> +    }
>>> I fear I don't understand this at all. Why would the guest having set a
>>> pending bit not result in the IRQ to be marked pending?
>> Maybe it is wrong assumption but based on the spec:
>>     Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
>>     bits  for supervisor-level software interrupts. If implemented, SSIP is
>>     writable in sip and may also be set to 1 by a platform-specific interrupt
>>     controller.
>> and:
>>     Interprocessor interrupts are sent to other harts by implementation-specific
>>     means, which will ultimately cause the SSIP bit to be set in the recipient
>>     hart’s sip register.
>>
>> Meaning that sending an IPI to self by writing 1 to sip.SSIP is
>> well-defined. The same should be true of vsip.SSIP while in VS mode.
> I can't read that out of the text above. To the contrary, "will ultimately cause
> the SSIP bit to be set" suggests to me that the bit is not to be set by writing
> the CSR. Things still may work like this for self-IPI, but that wouldn't follow
> from the quotation above.

Why not that wouldn't follow from the quotation above?

The first quotation tells that we can do self-IPI so VSSIP.SSIP will set to 1
what we could miss SSIP bit if won't explicitly try to read h/w HVIP (or VSSIP,
or whatever other alias of the SSIP bit) and sync with what we have cached
in hypervisor.

The second quotation tells that if another CPU send IPI to CPUx then CPUx.SIP will
have SSIP bit set to 1 and again hypervisor won't know that without explicit
reading of HVIP (or VSSIP, or whatever other alias of the SSIP bit).


>
>>>    You can't know
>>> whether that guest write happened before or after you last touched
>>> .irqs_pending{,mask}[]?
>> Yes, I think you are right.
>>
>> On the other hand, if we are in hypervisor when vcpu_sync_interrupts() is
>> called it means that pCPU on which vCPU is ran and for which
>> vcpu_sync_interrupts() is called now executes some hypervisor things, so
>> guest won't able to update VSIP.SSIP for this pCPU. So nothing else will
>> change VSIP.SSIP and so h/w HVIP won't be changed by something and it is
>> okay to sync .irqs_pending{,mask} with what h/w in its HVIP.
> That is, vcpu_sync_interrupts() is called on every entry to the hypervisor?
> Not just during context switch?

It is called each time before exit from the hypervisor to a guest.

~ Oleksii


