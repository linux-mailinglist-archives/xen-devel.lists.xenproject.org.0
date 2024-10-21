Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C69299A70F0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 19:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823876.1237957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2w5n-0003Kr-7O; Mon, 21 Oct 2024 17:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823876.1237957; Mon, 21 Oct 2024 17:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2w5n-0003I3-48; Mon, 21 Oct 2024 17:21:19 +0000
Received: by outflank-mailman (input) for mailman id 823876;
 Mon, 21 Oct 2024 17:21:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2w5m-0003Hx-32
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 17:21:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1503996-8fd0-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 19:21:16 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so5839551a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 10:21:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91578129sm231220166b.186.2024.10.21.10.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 10:21:16 -0700 (PDT)
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
X-Inumbo-ID: e1503996-8fd0-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729531276; x=1730136076; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttHRPKCEufgYnbrjF1RktWen+MRJjtRBCUpJjtMLEsg=;
        b=j66rJFLhZG3ttmO1AbokxmaaKiy0S2R0/18RVA6RtRUviko3pko43cArtR2zG1KU3a
         pf/XIDB0Tunnf94S2BM8M5kdBa8EIoy38x1JatH96BnWIkQLsGRcSgDGmrH9QiKrho0I
         ljxQWZHyYkOcHLLQ6udi8VHNdZ0if4JKk3Olc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729531276; x=1730136076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttHRPKCEufgYnbrjF1RktWen+MRJjtRBCUpJjtMLEsg=;
        b=juvdq1hkEcdHQJkLjrbOdYUdXqcL7LhG8SOzfn6XXZ1BQdT1fHu906TleYdzBRBYnE
         vWvF/cyL7wjZOXc2omu+m0TjTBUHowCpfrPrqIxzWXxtOYCP0K51f83cEhgbsQnBzZuA
         SpF9ctrvPx8hdK+mkJK/oC7gf5nxTlll2ojcsjjB0eg0GFiM+D62gAStJeuzIxO6gn29
         O1gc9VafmLUOxY40abwyboDHIVX/a4/tQYosdNc4uEl13r3Bd7vuuKz5L6mUgjnuTtpe
         dg/DF0elhsRBwuZNIhlT6JCRKWT3as+zoPvOwJ5IakN83cwgW9GsxbZLI66g53b1KeGT
         PJWA==
X-Gm-Message-State: AOJu0Yzvq1Mb4BDk/d9TflX36KADNj8+AJGSwH4ByvVX8wh5h2JwIjts
	+f0zHltCe/+GGIi0JuulcuJb50nPcGaJEVmkSjwWNIRylHxoKCVVK0QLKDKDdG8=
X-Google-Smtp-Source: AGHT+IEZ1M6TSUb+PuEjO1tRaP6rIBN9qobuuOfBXeepQl3qh8uSzYfZXl2iN+zmWEqccWLnkia2qw==
X-Received: by 2002:a17:907:94d4:b0:a99:f56e:ce40 with SMTP id a640c23a62f3a-a9a69c9e9c1mr1482575466b.47.1729531276568;
        Mon, 21 Oct 2024 10:21:16 -0700 (PDT)
Message-ID: <eddf8637-ebbf-46b0-b2f9-8592464acf76@citrix.com>
Date: Mon, 21 Oct 2024 18:21:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Willi Junga <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>
 <ZxaImxbGOg2uxR3x@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZxaImxbGOg2uxR3x@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 6:00 pm, Roger Pau Monné wrote:
> On Mon, Oct 21, 2024 at 12:38:13PM +0100, Andrew Cooper wrote:
>> On 21/10/2024 12:10 pm, Andrew Cooper wrote:
>>> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>>>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>>>> repurposed to contain part of the offset into the remapping table.  Previous to
>>>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>>>> table would match the vector.  Such logic was mandatory for end of interrupt to
>>>> work, since the vector field (even when not containing a vector) is used by the
>>>> IO-APIC to find for which pin the EOI must be performed.
>>>>
>>>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>>>> that the IO-APIC driver can translate pins into EOI handlers without having to
>>>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>>>> unconditionally when interrupt remapping is enabled, even if strictly it would
>>>> only be required for AMD-Vi.
>>>>
>>>> Reported-by: Willi Junga <xenproject@ymy.be>
>>>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>>>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Yet more fallout from the multi-MSI work.  That really has been a giant
>>> source of bugs.
>>>
>>>> ---
>>>>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 47 insertions(+)
>>>>
>>>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>>>> index e40d2f7dbd75..8856eb29d275 100644
>>>> --- a/xen/arch/x86/io_apic.c
>>>> +++ b/xen/arch/x86/io_apic.c
>>>> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>>>>  
>>>>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>>>>  
>>>> +/*
>>>> + * Store the EOI handle when using interrupt remapping.
>>>> + *
>>>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
>>>> + * format repurposes the vector field to store the offset into the Interrupt
>>>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
>>>> + * longer matches the contents of the RTE vector field.  Add a translation
>>>> + * table so that directed EOI uses the value in the RTE vector field when
>>>> + * interrupt remapping is enabled.
>>>> + *
>>>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
>>>> + * when using the remapped format, but use the translation table uniformly in
>>>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
>>>> + */
>>>> +static unsigned int **apic_pin_eoi;
>>> I think we can get away with this being uint8_t rather than unsigned
>>> int, especially as we're allocating memory when not strictly necessary.
>>>
>>> The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
>>>
>>> Vector 0xff is strictly SPIV and not allocated for anything else, so can
>>> be reused as a suitable sentinel here.
>> Actually, vectors 0 thru 0x0f are also strictly invalid, and could be
>> used as sentinels.  That's probably better than trying to play integer
>> promotion games between IRQ_VECTOR_UNASSIGNED and uint8_t.
> I've been giving some thought about this further, and I don't think
> the above is accurate.  While vectors 0 thru 0x0f are strictly
> invalid, the EOI handle in AMD-Vi is not a vector, but an offset into
> the IR table.  Hence the range of valid handles is 0 to 0xff.

Yeah, that occurred to me after sending.  With IR active, it's no longer
an architectural vector, and can have any 8-bit value.

> So the type of apic_pin_eoi needs to account for 0 to 0xff plus one
> sentinel.  We could use uint16_t or int16_t, but at that point it
> might be better to just use unsigned int?

Either of those are still half the allocated memory vs unsigned int, so
worth it IMO.

~Andrew

