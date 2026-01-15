Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AE3D2472C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 13:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205010.1519498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMPc-0000Tx-EQ; Thu, 15 Jan 2026 12:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205010.1519498; Thu, 15 Jan 2026 12:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgMPc-0000RN-Bd; Thu, 15 Jan 2026 12:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1205010;
 Thu, 15 Jan 2026 12:25:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgMPb-0000RH-BK
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 12:25:15 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b19afe-f20d-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 13:25:04 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-65378ba2ff7so1474398a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 04:25:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209ce83sm2331670a12.32.2026.01.15.04.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 04:25:03 -0800 (PST)
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
X-Inumbo-ID: 38b19afe-f20d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768479904; x=1769084704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOmpfRbO7PuUQLpFyvG5O9PMahXJ89Q3CjedLYzFIzg=;
        b=HxIgBjPrVS9rJVqCVLgO6G+6pR493SXg35lawQHAAK1qmOPiKvGKnabEjxG0nF1Jxg
         vgajCi4yi3UUx2h42IGTkEDmLKM1p9I3tBmmubrTq0ogzwOvziaHuvPVvAEoukFMX2fm
         8pDZtDpgTBaFAOOZd1ddZACIOI4UQxwrxONpbRB5QZuMwMGh4iQT6xPJF0dyG8et1HgI
         fITjnO3jc6wXfZCCBIyXrStEXu8zeg70RhVhHrGtzxT/+ldi+FAybbkEPt3UUDUKB/Q/
         VmmhtRlg0TqUlZExC9JKJiFINNSE/3YLv5gMA/QRQZD48qBaqGLni9ZphI12PlLySdd6
         PTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479904; x=1769084704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOmpfRbO7PuUQLpFyvG5O9PMahXJ89Q3CjedLYzFIzg=;
        b=rwhuN65pbdesJ4M00oxSGAJH6BB/9jM4j1Z7HmtwB4LMH8XgUzyn0BGez5eZiOql/q
         FD+BFyVIi22lKrNczMypstJvZsCbMfn+LETH40W3EiOn6XWyxVTZvJfrkeE6rbeiMkjy
         nv2HVqbLM7N6Q2qDlMmBlzXQnawhsevH7qB1TowSNOl/hDFTVPGHL71w9x3UYDgiosqs
         3BdXtKUiDoHwuUC3cZz+IPK07y9Me/yUygMS4LkCK5XaJAligbJ9Fp+MK5iRXbs1GhQe
         IsP2aj5j+sIduRPd5bjjrkgTC51YxaejbX6iRj9H3q9NZx369rb5toGn6crJBCE1NrtE
         rtDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJqCjgn6AtvRSeWgHKWYhJS+0TiGHXA5H8gxGpg263ieoOl7WK5X9pj7DJKiJteF1/PUmfi82w2q8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyybRy1YQBdI4ALkcGkOXGU4XbihdssKz0yRYs/MSrC2/e6Yt7E
	UiUWhM95FX1L7Zai2lLoVFuJNU6+9UkrZBtxxhG2/dqGUNcu4FuSZQmY
X-Gm-Gg: AY/fxX4fAYiU5wLuIQlOr785yES/RVpvg0yPGq21cGaOzIrRCCzOUKdovWfdXsJp94Z
	hdYwqXUkXEWi8VHjCTRKWYwKYSmv8H0TGQqmRNqs5RtYM3znz5BaPMiKBCG4WELNKAuRRdi/LkF
	3OI1P5lkRtKaoYO62NbWOiyv/M2HwL4EqRkMXcSGaKiMMjaiLFb/gnFtMw/IcQfZySqjhvhoLAA
	IU1W+fZXCkJRC5QAB50sGb/3BHqZ2AFY63k1F7Vs71viHkwSeC/ZYizkwe42N25KWLXFmMzFxDU
	u2PZyZ2mzTh5jgCT66ZnlrRcUi/PCYXtW6cKmfwW+3jKvSfy72RyHuKg/1MgkPlf3Jo50WL5Vek
	VA75tumHmlig4M7V0JtTaFFJqMBlgYdHci4k6Dyjnf+6yVHBdVF20LKBgDW2LZYylt71ZxCibV1
	IS32KnRMFZrz8pY5YgZYY30wXOxr4W6s6qHujNkqD02ao0ZrIbH/5JsQtcA3S+x1JAdv7dJ9Vxl
	g==
X-Received: by 2002:a05:6402:2804:b0:650:891f:1c06 with SMTP id 4fb4d7f45d1cf-653ec115969mr5063648a12.12.1768479904161;
        Thu, 15 Jan 2026 04:25:04 -0800 (PST)
Message-ID: <9c0fd87d-a953-4728-ad31-93e50fa47bea@gmail.com>
Date: Thu, 15 Jan 2026 13:25:02 +0100
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
 <a80a50c0-eefc-4ee3-8d49-145698d45297@gmail.com>
 <ffbedb0f-f992-45b1-aa7a-a2f7e5f2b1e4@suse.com>
 <fed7075c-4c1f-4aa5-ad29-c5fba0442b47@gmail.com>
 <caae4d06-fc26-4f96-8029-2747fea52d3b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <caae4d06-fc26-4f96-8029-2747fea52d3b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/15/26 1:09 PM, Jan Beulich wrote:
> On 15.01.2026 12:46, Oleksii Kurochko wrote:
>> On 1/15/26 11:59 AM, Jan Beulich wrote:
>>> On 15.01.2026 11:55, Oleksii Kurochko wrote:
>>>> On 1/15/26 10:52 AM, Jan Beulich wrote:
>>>>> On 15.01.2026 10:14, Oleksii Kurochko wrote:
>>>>>> On 1/14/26 4:56 PM, Jan Beulich wrote:
>>>>>>> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>>>>>>>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>>>>>>>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>>>>>>>> they are aliasis of HVIP) bits will be updated. And that is why we need
>>>>>>>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>>>>>>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>>>>>>> +{
>>>>>>>> +    unsigned long hvip;
>>>>>>>> +
>>>>>>>> +    /* Read current HVIP and VSIE CSRs */
>>>>>>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>>>>>>> +
>>>>>>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>>>>>>>> +    hvip = csr_read(CSR_HVIP);
>>>>>>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>>>>>>> +    {
>>>>>>>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>>>>>>>> +        {
>>>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>>>> +        }
>>>>>>>> +        else
>>>>>>>> +        {
>>>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>>>> +        }
>>>>>>>> +    }
>>>>>>> I fear I don't understand this at all. Why would the guest having set a
>>>>>>> pending bit not result in the IRQ to be marked pending?
>>>>>> Maybe it is wrong assumption but based on the spec:
>>>>>>       Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
>>>>>>       bits  for supervisor-level software interrupts. If implemented, SSIP is
>>>>>>       writable in sip and may also be set to 1 by a platform-specific interrupt
>>>>>>       controller.
>>>>>> and:
>>>>>>       Interprocessor interrupts are sent to other harts by implementation-specific
>>>>>>       means, which will ultimately cause the SSIP bit to be set in the recipient
>>>>>>       hart’s sip register.
>>>>>>
>>>>>> Meaning that sending an IPI to self by writing 1 to sip.SSIP is
>>>>>> well-defined. The same should be true of vsip.SSIP while in VS mode.
>>>>> I can't read that out of the text above. To the contrary, "will ultimately cause
>>>>> the SSIP bit to be set" suggests to me that the bit is not to be set by writing
>>>>> the CSR. Things still may work like this for self-IPI, but that wouldn't follow
>>>>> from the quotation above.
>>>> Why not that wouldn't follow from the quotation above?
>>>>
>>>> The first quotation tells that we can do self-IPI so VSSIP.SSIP will set to 1
>>>> what we could miss SSIP bit if won't explicitly try to read h/w HVIP (or VSSIP,
>>>> or whatever other alias of the SSIP bit) and sync with what we have cached
>>>> in hypervisor.
>>> The bit being writable doesn't imply that it being written with 1 would also
>>> trigger an interruption. If that's indeed the behavior, it surely is being
>>> said elsewhere.
>> According to the spec it will trap to S-mode (VS-mode in our context) if both of
>> the following are true: (a) either the current privilege mode is S and the SIE
>> bit in the sstatus register is set, or the current privilege mode has less
>> privilege than S-mode; and (b) bit i is set in both sip and sie.
> That's still not it. Here is the relevant quote:
>
> "These conditions for an interrupt trap to occur must be evaluated in a bounded
>   amount of time from when an interrupt becomes, or ceases to be, pending in sip,
>   and must also be evaluated immediately following the execution of an SRET
>   instruction or an explicit write to a CSR on which these interrupt trap
>   conditions expressly depend (including sip, sie and sstatus)."
>
> Note in particular the "explicit write to a CSR". (Sorry, I did read that before,
> but I didn't memorize it. Else I wouldn't have asked the original question.)

Guest can do:
   csr_write(CSR_SIP, SSIP);
what is an explicit write to a CSR. Or it the quote it means a different CSR?

~ Oleksii


