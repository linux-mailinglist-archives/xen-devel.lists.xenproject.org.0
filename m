Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B061B7F9F71
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 13:20:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642043.1001126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7abV-0003Pi-0v; Mon, 27 Nov 2023 12:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642043.1001126; Mon, 27 Nov 2023 12:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7abU-0003NR-TV; Mon, 27 Nov 2023 12:20:44 +0000
Received: by outflank-mailman (input) for mailman id 642043;
 Mon, 27 Nov 2023 12:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fT1m=HI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r7abT-000337-Fr
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 12:20:43 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61a13687-8d1f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 13:20:41 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507962561adso6294329e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 04:20:41 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b00332fbc183ebsm4408459wrt.76.2023.11.27.04.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 04:20:41 -0800 (PST)
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
X-Inumbo-ID: 61a13687-8d1f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701087641; x=1701692441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6akbFpLdxaKlRjrO9SU0wPhQjuo7P5u8rY6OCLb2Xtc=;
        b=L9mgE3+TDkeNYNQFt+9aQveDqyI/14UIzXiy+yZGKzpRgVtZ7eoQ47e5ZtzIRRPRa0
         8rhGat8icuhDAr7aih66ZzAelM+pbj+khbtq5eqghpLlXEb5yIjs54Ep7YuZ9IxhGod2
         U7gl5F/1VxD7OwDbwE2u1OAzyELmPRefnJ30k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701087641; x=1701692441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6akbFpLdxaKlRjrO9SU0wPhQjuo7P5u8rY6OCLb2Xtc=;
        b=tJUcYL2fqoUCHkCvrduil8mTRbWzcpA4SMIXrPFvCEZmw8/BQCkdNeN9Nx4wRHu7MH
         dofNPHm62SSAp7BI5UXZhhCSdq2SnOyrmnk/91aQ4j6ND5N9PHT5ce7YujMFXUsnDL8f
         iewLvHr7Ep4btgLHn24dr0iU0rV6dSs0KIAfN5Smxk37D5iraNvWvHxdhtlm2YPVdFUS
         MfmPeMU49xuyATmrH6NlmVP7MPR8mx+PamyYaeDM0oy8t4oP+vwxClbrvIHire+LDQbh
         GITqLyTIifmhukCTcjQ+xQXrSpDdVJXQrr72VhsXXLr4RgFbh9i0I2UIMFyjNYx5aqAK
         oBww==
X-Gm-Message-State: AOJu0YxYH18izLydcBS8M3FbGL1zLzPyLeFywetRizVZPLDcvAlw3DFC
	Y4zXoWtlsI2onQXPF1rrjFesFA==
X-Google-Smtp-Source: AGHT+IFDurqD1AD+zNB5HK2mbwGV5LmNXkAZ/7RxxIjZ56w1lXGErCvehU3wkIu2slEbwW9qyymZ+A==
X-Received: by 2002:a05:6512:5cf:b0:50b:acfd:c523 with SMTP id o15-20020a05651205cf00b0050bacfdc523mr2854033lfo.31.1701087641328;
        Mon, 27 Nov 2023 04:20:41 -0800 (PST)
Message-ID: <d302d638-6fd4-4c26-b2e1-4db68180ba20@citrix.com>
Date: Mon, 27 Nov 2023 12:20:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <e96e7f7b-d2d5-496a-9a2b-e8da2017a282@citrix.com>
 <f028ce00-207a-41b7-b2b2-dff25d7fe7c2@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f028ce00-207a-41b7-b2b2-dff25d7fe7c2@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2023 12:08 pm, Alejandro Vallejo wrote:
> On 24/11/2023 22:05, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>> index 5cb87f8649..cd4701c5a2 100644
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -1061,13 +1061,26 @@ static const struct hvm_mmio_ops
>>> vlapic_mmio_ops = {
>>>       .write = vlapic_mmio_write,
>>>   };
>>>   +static uint32_t x2apic_ldr_from_id(uint32_t id)
>>> +{
>>> +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
>>> +}
>>> +
>>>   static void set_x2apic_id(struct vlapic *vlapic)
>>>   {
>>
>> const struct vcpu *v = vlapic_vcpu(vlapic);
>>
>> seeing as you've got the expression used twice already.
>>
>> With that, the following logic is shorter too; you can get away with
>> dropping the vcpu_id variable as v->vcpu_id is the more common form to
>> use in Xen.
>
> Twice? I can see a vague raison-d'etre in lapic_load_fixup(), but
> there's a single occurence here.

It's hidden in the vlapic_domain(), which is vlacpi_vcpu()->domain.

>
>>
>>>   We must preserve LDRs so new vCPUs use consistent
>>> +         * derivations and existing guests, which may have already
>>> read the
>>> +         * LDR at the source host, aren't surprised when interrupts
>>> stop
>>> +         * working the way they did at the other end.
>>>            */
>>> -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
>>> -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
>>> -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
>>> -                   vlapic_vcpu(vlapic), id);
>>> -        set_x2apic_id(vlapic);
>>> -    }
>>> -    else /* Undo an eventual earlier fixup. */
>>> -    {
>>> -        vlapic_set_reg(vlapic, APIC_ID, id);
>>> -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
>>> -    }
>>> +        vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
>>> +    else
>>> +        printk(XENLOG_G_WARNING
>>> +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected
>>> ldr=%#x)\n",
>>
>> %pv: bogus loaded x2APIC ID %#x, LDR %#x, expected LDR %#x\n
>>
>> If you properly capitalise x2APIC, you should capitalise ID and LDR.
>> The other changes are matter of taste, but make for a less cluttered log
>> message IMO.
>>
>
> "bogus x2APIC loaded" is meant to be a sentence followed by key-value
> pairs. Uppercasing the keys is fine (albeit unnecessary, IMO), but you
> choice of word order feels backwards.

The grammar is awkward either way.

How about "bogus x2APIC record: "

?

That is much clearer I think.

~Andrew

