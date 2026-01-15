Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62CD24470
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 12:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204921.1519432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLni-0000vf-98; Thu, 15 Jan 2026 11:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204921.1519432; Thu, 15 Jan 2026 11:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgLni-0000uD-5E; Thu, 15 Jan 2026 11:46:06 +0000
Received: by outflank-mailman (input) for mailman id 1204921;
 Thu, 15 Jan 2026 11:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgLng-0000u7-Lb
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 11:46:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e2aac8-f207-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 12:46:03 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b8712507269so124652966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 03:46:03 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd08b2sm1611040666b.25.2026.01.15.03.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 03:46:01 -0800 (PST)
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
X-Inumbo-ID: c4e2aac8-f207-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768477562; x=1769082362; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBDntRF5odkNRAOPBPSdTMmWZ0IZJrCgtKbD4q2DrxI=;
        b=kM5QvSLlSF0ggntnkvxiB0u9Or4WD0O2p5BLO8dY47Z5bvC76xqATlk/OfjlvTRpLg
         NOefgnEq/RIswXj9yGW7kT4R6vZOMj0I7ID4FyDUEvf7SGSH8Ck/LzFPP9zLdnLvbdlJ
         E2eU2bCjDC9Vj1S1VlH4QPVx/zbHTuh8d8DZWMLh5YWH0li27ntBO2HZCsYeR0JMxF4Y
         XOC5WkmEZ21Sq+LUPqHy8u67zIZyRQyHxpGMjWZhIIbd/ok+3aPjug3FYxO7dOyLjTdI
         HZyw2f6gqc2L8Hy2CNMy18rbAG0aOzmksyPUnAnjvmjvCaaEJpuEYBEO+0yFamPjOxbv
         5jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477562; x=1769082362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBDntRF5odkNRAOPBPSdTMmWZ0IZJrCgtKbD4q2DrxI=;
        b=oXEYVvkYK9eIMRKPe2DG2bJy9hueG1Im7o6y+WqPBVRJnTn9oMgpzdiZutOK7sWP+k
         66aAJGYSvhHuAi1NS/qKx/qkSHxfPBaZ7Aa/nwp/lrAa9Ep45sEwOrLOx3BqxKJz12N1
         dMNZYaV+Qg3VyPay1VZh7xYnOHx1qu1rcmutgAT2/pKPHNtit0UAG9jlwWzxzg1DJT3y
         7oPyTp4QFzNSQ4APfjGTVmaenwrviq89t/Xuop2gqLT0PfJPNc4pZw8aiYgJHK+G0X4D
         YG21qZcJ/VZrQb0MBJMrGf03NsfWbeUjsQW2siw77TZIWx3WCxymGhP1S9aRVFCFdyOB
         GP5w==
X-Forwarded-Encrypted: i=1; AJvYcCU0+JmpOO5tytjTDIn8Y0jVLx1mRft9Gx2wmhsh2qHKxwhZM+9f0SuqeDSeLZ9/wA8cp3iYNPKJL3k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmPg24rJqsrEniV2dKZb1kIjyV+YMlaw9ntNHRhsoa1MiNHNJ3
	cOdp1EaRa+yiXU7xQhgoChJY/m3YIjtAyPHAU7x6y2Rx2cr9aePjsIiz
X-Gm-Gg: AY/fxX76d6uR9edZVHlGdr3nEZJd/DSueddUWECE6oKRnfWFHZjwTLuyR7LCamtdOJ7
	Sq7N+K5bGuqqBVF+0bstdasA8z/p5755k0U2qmii1Z/Ued095dI7L/XVipdqVBfBNDQHO/aC1Xu
	UbJrE6DOLP/0Zh3LUv+E5QLxUOcVyk11kN4Maa1TLAOst/RuDHdZxIHap9Bl8HqdQP4s2JtL1cX
	7ARCLLuY5MfjtPimhaHxehbGd8j9kzDrMGcaMFR8dnO4NDUDc5718s4pc/0QuoTRcSZCAG8M1Yb
	KyiBOLn2hMU1U4IV6GBt7rhG8M8KRTYnorvaucJn3RzpNBVeybJIXib1XLzRfdFOO3x6j+EtaiE
	JtELE7n/vnDQ/lZRjy2sKJOXtl7q81n7sXNGAVIX5w5BqG1aBkChHRW4RwVH26Vvr8mHj+YUvgb
	jT6ek9Ia17XRREjXNXsaVpo0yUHIJuUxrmy3ODj3e3h32RLRq/dGESRlpEFVC1E0A=
X-Received: by 2002:a17:907:80b:b0:b86:f3d2:efae with SMTP id a640c23a62f3a-b87612a489bmr535889666b.35.1768477562273;
        Thu, 15 Jan 2026 03:46:02 -0800 (PST)
Message-ID: <fed7075c-4c1f-4aa5-ad29-c5fba0442b47@gmail.com>
Date: Thu, 15 Jan 2026 12:46:00 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ffbedb0f-f992-45b1-aa7a-a2f7e5f2b1e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/15/26 11:59 AM, Jan Beulich wrote:
> On 15.01.2026 11:55, Oleksii Kurochko wrote:
>> On 1/15/26 10:52 AM, Jan Beulich wrote:
>>> On 15.01.2026 10:14, Oleksii Kurochko wrote:
>>>> On 1/14/26 4:56 PM, Jan Beulich wrote:
>>>>> On 14.01.2026 16:39, Oleksii Kurochko wrote:
>>>>>> If a guest will do "That (the 1 -> 0 transitions) could be (guest) writes
>>>>>> to SVIP, for example." then the correspondent HVIP (and HIP as usually
>>>>>> they are aliasis of HVIP) bits will be updated. And that is why we need
>>>>>> vcpu_sync_interrupts() I've mentioned in one of replies and sync VSSIP:
>>>>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>>>>> +{
>>>>>> +    unsigned long hvip;
>>>>>> +
>>>>>> +    /* Read current HVIP and VSIE CSRs */
>>>>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>>>>> +
>>>>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>>>>>> +    hvip = csr_read(CSR_HVIP);
>>>>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>>>>> +    {
>>>>>> +        if ( hvip & BIT(IRQ_VS_SOFT, UL) )
>>>>>> +        {
>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>> +        }
>>>>>> +        else
>>>>>> +        {
>>>>>> +            if ( !test_and_set_bit(IRQ_VS_SOFT,
>>>>>> +                                   &v->arch.irqs_pending_mask) )
>>>>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>>>>> +        }
>>>>>> +    }
>>>>> I fear I don't understand this at all. Why would the guest having set a
>>>>> pending bit not result in the IRQ to be marked pending?
>>>> Maybe it is wrong assumption but based on the spec:
>>>>      Bits sip.SSIP and sie.SSIE are the interrupt-pending and interrupt-enable
>>>>      bits  for supervisor-level software interrupts. If implemented, SSIP is
>>>>      writable in sip and may also be set to 1 by a platform-specific interrupt
>>>>      controller.
>>>> and:
>>>>      Interprocessor interrupts are sent to other harts by implementation-specific
>>>>      means, which will ultimately cause the SSIP bit to be set in the recipient
>>>>      hart’s sip register.
>>>>
>>>> Meaning that sending an IPI to self by writing 1 to sip.SSIP is
>>>> well-defined. The same should be true of vsip.SSIP while in VS mode.
>>> I can't read that out of the text above. To the contrary, "will ultimately cause
>>> the SSIP bit to be set" suggests to me that the bit is not to be set by writing
>>> the CSR. Things still may work like this for self-IPI, but that wouldn't follow
>>> from the quotation above.
>> Why not that wouldn't follow from the quotation above?
>>
>> The first quotation tells that we can do self-IPI so VSSIP.SSIP will set to 1
>> what we could miss SSIP bit if won't explicitly try to read h/w HVIP (or VSSIP,
>> or whatever other alias of the SSIP bit) and sync with what we have cached
>> in hypervisor.
> The bit being writable doesn't imply that it being written with 1 would also
> trigger an interruption. If that's indeed the behavior, it surely is being
> said elsewhere.

According to the spec it will trap to S-mode (VS-mode in our context) if both of
the following are true: (a) either the current privilege mode is S and the SIE
bit in the sstatus register is set, or the current privilege mode has less
privilege than S-mode; and (b) bit i is set in both sip and sie.

Even without a triggering an interrupt I think it we can still lose set bit in
VSSIP register (if Im not mistaken something). If we won't do a sync of cached
hvip and h/w hvip then it could lead to the issue we lost a real SSIP bit value.
For example, guest before entering hypervisor set VSSIP.SSIP to 1 what
means what means that hip.VSSIP will be also set to 1 as:
   When bit 2 of hideleg is zero, vsip.SSIP and vsie.SSIE are read-only zeros.
   Else, vsip.SSIP and vsie.SSIE are aliases of hip.VSSIP and hie.VSSIE.
And so hvip.SSIP will be set to 1 as:
   Bits hip.VSSIP and hie.VSSIE are the interrupt-pending and interrupt-enable
   bits for VS-level software interrupts. VSSIP in hip is an alias (writable)
   of the same bit in hvip.
And then if we don't sync cached hvip with h/w hvip, it could lead to then
when we will put cached hvip (which has .VSSIP set to 0) overwrite h/w hvip.VSSIP
which was set to 1.

~ Oleksii



