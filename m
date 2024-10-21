Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76A9A6891
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 14:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823487.1237493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2rbJ-0007BW-RU; Mon, 21 Oct 2024 12:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823487.1237493; Mon, 21 Oct 2024 12:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2rbJ-00079i-NR; Mon, 21 Oct 2024 12:33:33 +0000
Received: by outflank-mailman (input) for mailman id 823487;
 Mon, 21 Oct 2024 12:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2rbH-0006wG-VY
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 12:33:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad931931-8fa8-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 14:33:30 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c99be0a4bbso5996878a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 05:33:30 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6603sm199106266b.35.2024.10.21.05.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 05:33:29 -0700 (PDT)
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
X-Inumbo-ID: ad931931-8fa8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729514010; x=1730118810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tzjdZeSIcmuqtlIDEl9oyOSeF8Of1W9c6v+eUL6c6AA=;
        b=b1SygCOAAZ7th/M/W8LKKH6MGtgWxpNeXbpnqzGLNdycxb0JgWedsI52CyegWN8ebb
         TvNQZt5TylWPJa8oqx/NsFXYtpRA3ritAGPAgkbAcnWt6EsJtK8zyBdm4mmGuax70sXe
         YGeiz/IlrBm8vjF5/QizXo5BL77uL2T6n5Gys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514010; x=1730118810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzjdZeSIcmuqtlIDEl9oyOSeF8Of1W9c6v+eUL6c6AA=;
        b=w6+4v2oSGTs0Blkkg1YAO1sqTWeH2JDwo3w09EI2JdGQTCILHpAzrz+35asco7XZ71
         nOXPLK5bknwYn3ZrftQyB7nZQ38WIvEIP7RXEkE7M3G3LqWcTiE4kPlaeOdK2Ssew7P6
         bBrme3MvYoveminQMiXKBoC1iLuHex2IE2eG8o7ViMJ1i4/9M4MrQ0HtVuc8XDiq+Zpx
         /hGRGb+jGM9AAja1y0pw3pXu+C8h0J/JJi7qrLS5Ni5PeRKpdqrKYBNE14DCVqQCKdvJ
         WG072dMEM6ahi+g8ZG3Sv1xUMYi9SnS84oJ1LqCgw4314raxz3rFQiNxm/mHofsQ3WMM
         zuhg==
X-Gm-Message-State: AOJu0Yy5t9CjdNgXBjehYfGufT3i7UsChJED0Hb/0HFwqmc8yjCfbM2V
	QLAPzKBnhW7DWHnJJXGLm+DQqjyAFvz1gok4H2ptRANHUqhyT7aO0GHMmg5QUpGyPNLmAbTgO8g
	2
X-Google-Smtp-Source: AGHT+IFnNktbPxVUYA5meS1UBt0a+O5rMFKUMFqUvrT0+RtvPQX5tdJqFZleRCf2b7A5zAkjAJBbrg==
X-Received: by 2002:a17:907:9490:b0:a9a:3718:6d6 with SMTP id a640c23a62f3a-a9a69cdaea8mr1216931966b.58.1729514009544;
        Mon, 21 Oct 2024 05:33:29 -0700 (PDT)
Message-ID: <f60d6bde-d694-4f26-8405-9d8cefcebd80@citrix.com>
Date: Mon, 21 Oct 2024 13:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi interrupt
 remapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Willi Junga <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <ZxZBocLV7eJUxK50@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZxZBocLV7eJUxK50@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 12:57 pm, Roger Pau Monné wrote:
> On Mon, Oct 21, 2024 at 12:10:14PM +0100, Andrew Cooper wrote:
>> On 18/10/2024 9:08 am, Roger Pau Monne wrote:
>>> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
>>> repurposed to contain part of the offset into the remapping table.  Previous to
>>> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
>>> table would match the vector.  Such logic was mandatory for end of interrupt to
>>> work, since the vector field (even when not containing a vector) is used by the
>>> IO-APIC to find for which pin the EOI must be performed.
>>>
>>> Introduce a table to store the EOI handlers when using interrupt remapping, so
>>> that the IO-APIC driver can translate pins into EOI handlers without having to
>>> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
>>> unconditionally when interrupt remapping is enabled, even if strictly it would
>>> only be required for AMD-Vi.
>>>
>>> Reported-by: Willi Junga <xenproject@ymy.be>
>>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>>> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Yet more fallout from the multi-MSI work.  That really has been a giant
>> source of bugs.
>>
>>> ---
>>>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 47 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>>> index e40d2f7dbd75..8856eb29d275 100644
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>>>  
>>>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>>>  
>>> +/*
>>> + * Store the EOI handle when using interrupt remapping.
>>> + *
>>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
>>> + * format repurposes the vector field to store the offset into the Interrupt
>>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
>>> + * longer matches the contents of the RTE vector field.  Add a translation
>>> + * table so that directed EOI uses the value in the RTE vector field when
>>> + * interrupt remapping is enabled.
>>> + *
>>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
>>> + * when using the remapped format, but use the translation table uniformly in
>>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
>>> + */
>>> +static unsigned int **apic_pin_eoi;
>> I think we can get away with this being uint8_t rather than unsigned
>> int, especially as we're allocating memory when not strictly necessary.
>>
>> The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
>>
>> Vector 0xff is strictly SPIV and not allocated for anything else, so can
>> be reused as a suitable sentinel here.
> The coding style explicitly discourages using fixed width types unless
> it's strictly necessary, I assume the usage here would be covered by
> Xen caching a value of a hardware register field that has a
> fixed-width size.

I'm >< this close to reverting that too.  It's not even self-consistent
as written, nonsense in some cases, and is being used as a whipping
stick to reject otherwise-ok patches, which is pure toxicity in the
community.

Not to mention that this rule is in contradiction to MISRA, and there's
no progress being made in that direction.


All variables should be of an appropriate type.

Sometimes that's a fixed width type, and sometimes it's not.  (And this
is what is impossible to dictate in CODING_STYLE.)

In this case, we're talking about a quantity which is strictly in the
range 0x10-0xfe, plus one sentinel.  There is a 4x difference in memory
allocated between unsigned int and uint8_t.

Given that part of the justification here is "allocate memory
unconditionally to simplify things", then a 4x reduction in allocated
memory is definitely a good thing.
>>> +        if ( apic_pin_eoi )
>>> +            apic_pin_eoi[apic][pin] = e.vector;
>>>      }
>>>      else
>>>          iommu_update_ire_from_apic(apic, pin, e.raw);
>>> @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>>>      /* Prefer the use of the EOI register if available */
>>>      if ( ioapic_has_eoi_reg(apic) )
>>>      {
>>> +        if ( apic_pin_eoi )
>>> +            vector = apic_pin_eoi[apic][pin];
>>> +
>>>          /* If vector is unknown, read it from the IO-APIC */
>>>          if ( vector == IRQ_VECTOR_UNASSIGNED )
>>> +        {
>>>              vector = __ioapic_read_entry(apic, pin, true).vector;
>>> +            if ( apic_pin_eoi )
>>> +                /* Update cached value so further EOI don't need to fetch it. */
>>> +                apic_pin_eoi[apic][pin] = vector;
>>> +        }
>>>  
>>>          *(IO_APIC_BASE(apic)+16) = vector;
>>>      }
>>> @@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
>>>  
>>>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
>>>  
>>> +    if ( iommu_intremap )
>> MISRA requires this to be iommu_intremap != iommu_intremap_off.
>>
>> But, if this safe on older hardware?  iommu_intremap defaults to on
>> (full), and is then turned off later on boot for various reasons.
> I think it's fine because setup_IO_APIC_irqs() is strictly called
> after iommu_setup(), so the value of iommu_intremap by that point
> should reflect whether IR is enabled.

Ok.  Can you note this in a comment?

~Andrew

