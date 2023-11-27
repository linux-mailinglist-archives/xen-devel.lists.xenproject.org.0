Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD97FA0FB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642088.1001216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bc6-0003lB-Jy; Mon, 27 Nov 2023 13:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642088.1001216; Mon, 27 Nov 2023 13:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bc6-0003jQ-H7; Mon, 27 Nov 2023 13:25:26 +0000
Received: by outflank-mailman (input) for mailman id 642088;
 Mon, 27 Nov 2023 13:25:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7bc5-0003jK-Iw
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:25:25 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b184186-8d28-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 14:25:23 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso2751411f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 05:25:23 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d5652000000b00332f6ad2ca8sm6225621wrw.36.2023.11.27.05.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 05:25:22 -0800 (PST)
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
X-Inumbo-ID: 6b184186-8d28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701091523; x=1701696323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eitqmP1c/gOwGr5LPKnhc7eP29Juw/q2Px8hQR5DYZ4=;
        b=bEYJkmzGWPL5DjEeRCEn0LKIMeMMQxUPPuOx9BdenPRwwQgiBdnc9woGghUVV/ovpq
         Cw4A62dbH6+UbMGF2qTZ6mw0ZRMri2cbPjZ7sQwpgMA3PxJMWpIUkUA/PLS+pKKbj4wG
         FEbPPx1sAaoFnrHO5xmDEkbv1mowBIUQ3ja6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701091523; x=1701696323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eitqmP1c/gOwGr5LPKnhc7eP29Juw/q2Px8hQR5DYZ4=;
        b=GjvfgmLBWDnSTqRYcZR4NLA1vEo4dx/o4RGVClitQiSAMoKpOm/cfrYFRIKIpyZMdZ
         +a8FNy5D4NuUKc4lj4Sp4CWeXxI97MNnK2o/62JJ5fURjcuIFY0UH8OLllJI/bhcUZpp
         vaK9Lf0F8rEO8wXG/dN22ptUf01FPWH0v0bOY6anjf+PmWMsjPgJG1ZcWYziciSR2Mus
         jCyDY7zKNrPxUm6LKvh6cqt8Kgi+dx51kXYIP8hYu3BWu3xa/Es/DunbNdJS9IA8DNzn
         4phljjXefym5o2MBWeECvPG8bgb8J5e4SumoPf3gE8E6xdklwjiFnnwmpD0SoYKifYps
         5BvQ==
X-Gm-Message-State: AOJu0YxubUSuijlsBI+1pSxIyI+dR7azmKAWnRecL6bIKySjDyf8cE+h
	+jCr+hUcIao/X2OY37aCZwdOgw==
X-Google-Smtp-Source: AGHT+IG7nCnJLy7C9G8aXtyYRUr4eAgo65XwNs2OR3Oy2XFswZZa93tQcTXC9iuGQceOuGe2Y952tQ==
X-Received: by 2002:adf:ef4e:0:b0:332:dc6e:ae0d with SMTP id c14-20020adfef4e000000b00332dc6eae0dmr7948164wrp.24.1701091522701;
        Mon, 27 Nov 2023 05:25:22 -0800 (PST)
Message-ID: <ce23aa2a-5747-4b43-916b-11e35f06cb13@cloud.com>
Date: Mon, 27 Nov 2023 13:25:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <e96e7f7b-d2d5-496a-9a2b-e8da2017a282@citrix.com>
 <f028ce00-207a-41b7-b2b2-dff25d7fe7c2@cloud.com>
 <d302d638-6fd4-4c26-b2e1-4db68180ba20@citrix.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <d302d638-6fd4-4c26-b2e1-4db68180ba20@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2023 12:20, Andrew Cooper wrote:
> On 27/11/2023 12:08 pm, Alejandro Vallejo wrote:
>> On 24/11/2023 22:05, Andrew Cooper wrote:
>>>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>>>> index 5cb87f8649..cd4701c5a2 100644
>>>> --- a/xen/arch/x86/hvm/vlapic.c
>>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>>> @@ -1061,13 +1061,26 @@ static const struct hvm_mmio_ops
>>>> vlapic_mmio_ops = {
>>>>        .write = vlapic_mmio_write,
>>>>    };
>>>>    +static uint32_t x2apic_ldr_from_id(uint32_t id)
>>>> +{
>>>> +    return ((id & ~0xf) << 12) | (1 << (id & 0xf));
>>>> +}
>>>> +
>>>>    static void set_x2apic_id(struct vlapic *vlapic)
>>>>    {
>>>
>>> const struct vcpu *v = vlapic_vcpu(vlapic);
>>>
>>> seeing as you've got the expression used twice already.
>>>
>>> With that, the following logic is shorter too; you can get away with
>>> dropping the vcpu_id variable as v->vcpu_id is the more common form to
>>> use in Xen.
>>
>> Twice? I can see a vague raison-d'etre in lapic_load_fixup(), but
>> there's a single occurence here.
> 
> It's hidden in the vlapic_domain(), which is vlacpi_vcpu()->domain.
> 
>>
>>>
>>>>    We must preserve LDRs so new vCPUs use consistent
>>>> +         * derivations and existing guests, which may have already
>>>> read the
>>>> +         * LDR at the source host, aren't surprised when interrupts
>>>> stop
>>>> +         * working the way they did at the other end.
>>>>             */
>>>> -        if ( GET_xAPIC_ID(id) != vlapic_vcpu(vlapic)->vcpu_id * 2 ||
>>>> -             id != SET_xAPIC_ID(GET_xAPIC_ID(id)) )
>>>> -            printk(XENLOG_G_WARNING "%pv: bogus APIC ID %#x loaded\n",
>>>> -                   vlapic_vcpu(vlapic), id);
>>>> -        set_x2apic_id(vlapic);
>>>> -    }
>>>> -    else /* Undo an eventual earlier fixup. */
>>>> -    {
>>>> -        vlapic_set_reg(vlapic, APIC_ID, id);
>>>> -        vlapic_set_reg(vlapic, APIC_LDR, vlapic->loaded.ldr);
>>>> -    }
>>>> +        vlapic_domain(vlapic)->arch.hvm.bug_x2apic_ldr_vcpu_id = true;
>>>> +    else
>>>> +        printk(XENLOG_G_WARNING
>>>> +               "%pv: bogus x2APIC loaded id=%#x ldr=%#x (expected
>>>> ldr=%#x)\n",
>>>
>>> %pv: bogus loaded x2APIC ID %#x, LDR %#x, expected LDR %#x\n
>>>
>>> If you properly capitalise x2APIC, you should capitalise ID and LDR.
>>> The other changes are matter of taste, but make for a less cluttered log
>>> message IMO.
>>>
>>
>> "bogus x2APIC loaded" is meant to be a sentence followed by key-value
>> pairs. Uppercasing the keys is fine (albeit unnecessary, IMO), but you
>> choice of word order feels backwards.
> 
> The grammar is awkward either way.
> 
> How about "bogus x2APIC record: "
> 
> ?
> 
> That is much clearer I think.
> 
> ~Andrew

LGTM.

Do you want me to send a v5 with it all?

Cheers,
Alejandro

Cheers,
Alejandro

