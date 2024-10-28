Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E09B2DE0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826383.1240617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NWZ-0003PW-OJ; Mon, 28 Oct 2024 11:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826383.1240617; Mon, 28 Oct 2024 11:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NWZ-0003MJ-Kt; Mon, 28 Oct 2024 11:03:03 +0000
Received: by outflank-mailman (input) for mailman id 826383;
 Mon, 28 Oct 2024 11:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5NWY-0003Lr-HM
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:03:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3249564e-951c-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 12:03:00 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0472306cso569762366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:03:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a08477bsm363585266b.201.2024.10.28.04.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:02:59 -0700 (PDT)
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
X-Inumbo-ID: 3249564e-951c-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730113380; x=1730718180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WAByFXb3f7Hl3lkdanUntb4yVXIKNls1xWl2QUuTnTc=;
        b=WVxxtGh5sIBeb71bJAWxKSFXLOsvDPwMcgRJibs7uBvhQx0GBOjcIXQt/wMup37BOG
         2iI9RJbmXmaiW3r0DxBtyi0QikDH4R6iR56bwi97FOMM2m76cRLuvkJxeOIHPcAhRmsu
         2x6P7jW28qzDm/hsPUuNwlxv2rQhzBa//uXbbkKJZE8trq4BANiPBv5iY86r0CTvT49n
         wuXeFdQkUHU6HJCQVDxnRT0v1Z34p2+JULFusVxPe18hFJBMP6+F1OtY7J6ei0k79f+a
         Qj9h4/EBBZLYD+m0GvVRWlpLFUWXUpqD8NymHIl+y4M8FkRUM6YkTjTMBSbz5Ov8432m
         jCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113380; x=1730718180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAByFXb3f7Hl3lkdanUntb4yVXIKNls1xWl2QUuTnTc=;
        b=CrP46h+bzGjTqSSPtvWjyvq3W6tBFU9pjfTgqIP6GrqzxoSR+4vWlgtiVesLhGB4Dc
         LwnJV+9gpAOXwZ+QSqzYJUqxWZrKYdZMkJ887/PngPJzYZRUzz36ZKQPA9e77qzJo7re
         niUitgMGpNU9G/dLJybmLvX1islQNVdIlPklEKrKc4/3+1r+tRGkGsjjTemRklEqf4Dn
         Lh/TazA8cNClCg/tb3hk1bHFFhnOwN+OWFqWoO4asmRJnj4TJJB9rzYjGIhRxpR6eEqn
         bhT3vaGXi9RLdNak0DfbXkI0RmkiIYoJKxzf6zThqYtJRgW+gXt9FJs8RiuDfm6aBGtr
         NS2A==
X-Gm-Message-State: AOJu0Yyyy/jMhgRXU5Oq/mijzD8oXkuUgXq+NObOejst+Fto+IpKFvRG
	CO9NLgUPvtZdwoAqSYgYZKlmvx7ISb6U6/vE5300kAc5twPn6F2HVNeEXTl0cA==
X-Google-Smtp-Source: AGHT+IG48sEgbqHIeDPZxMM014Qi/e5HgJ0fVwUzOQ5MGW5bsi/gglRFehYa6zpGOUj2Jm7N+yj5Zw==
X-Received: by 2002:a17:906:dc8f:b0:a9a:6dc:b39d with SMTP id a640c23a62f3a-a9de619e644mr660807666b.41.1730113380168;
        Mon, 28 Oct 2024 04:03:00 -0700 (PDT)
Message-ID: <b4f64b33-0ab9-4713-a722-687d393ed34f@suse.com>
Date: Mon, 28 Oct 2024 12:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Willi Junga <xenproject@ymy.be>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <ZxZBocLV7eJUxK50@macbook.local>
 <f60d6bde-d694-4f26-8405-9d8cefcebd80@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <f60d6bde-d694-4f26-8405-9d8cefcebd80@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2024 14:33, Andrew Cooper wrote:
> On 21/10/2024 12:57 pm, Roger Pau Monné wrote:
>> On Mon, Oct 21, 2024 at 12:10:14PM +0100, Andrew Cooper wrote:
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
>> The coding style explicitly discourages using fixed width types unless
>> it's strictly necessary, I assume the usage here would be covered by
>> Xen caching a value of a hardware register field that has a
>> fixed-width size.

Use "short" then?

> I'm >< this close to reverting that too.  It's not even self-consistent
> as written, nonsense in some cases, and is being used as a whipping
> stick to reject otherwise-ok patches, which is pure toxicity in the
> community.

I don't really mind reverting that part, if only ...

> Not to mention that this rule is in contradiction to MISRA, and there's
> no progress being made in that direction.
> 
> 
> All variables should be of an appropriate type.
> 
> Sometimes that's a fixed width type, and sometimes it's not.  (And this
> is what is impossible to dictate in CODING_STYLE.)

... "appropriate" was definable in some way. Prior to this addition to
the style it was easily possible (and happening increasingly often, iirc)
for two people to disagree about what's appropriate, blocking progress.
I'm therefore also not really happy with you describing this as "dictate".

Jan

