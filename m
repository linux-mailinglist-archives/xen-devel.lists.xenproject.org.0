Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C59B769E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 09:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828476.1243361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6QgR-0001BI-HB; Thu, 31 Oct 2024 08:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828476.1243361; Thu, 31 Oct 2024 08:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6QgR-00018u-Ec; Thu, 31 Oct 2024 08:37:35 +0000
Received: by outflank-mailman (input) for mailman id 828476;
 Thu, 31 Oct 2024 08:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6QgQ-00018o-DA
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 08:37:34 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da68267-9763-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 09:37:30 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so636445e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 01:37:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d6852c3sm17071585e9.38.2024.10.31.01.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 01:37:29 -0700 (PDT)
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
X-Inumbo-ID: 5da68267-9763-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVkYTY4MjY3LTk3NjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzYzODUwLjIyODg4NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730363849; x=1730968649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DweqSoc2+xeO9frtw7UMPvB3jd1GLOMseumyZSAPWrw=;
        b=QB1d5gK1lQOP/aWmQ1zH+AobbY2BPWLGe9cZ0xpQEj/r8PkRJYt7Y5irPRxlQaTvRV
         yVTys3rpcBRXRzvtcuswZG8L/CPo1B/zeqQEJT3T241OigcnT+nS/ttI5BRlNYAyk9Jg
         dz1B8BUjzOfxWNgvklnqBALXLb8vVMkykw6du3ELBRgpNakMoT44Vf71367Q/SluSuzY
         9hj+z6nue8iU8iyDDYyew843Xv0PaPyb5OZfrStF5vc9EWB2NOmrvyn284H6wkXHAV6W
         875BgO/Jg0+elUSyAcqp5bbHvyYIciArrzd8/kFXqm9eJzlSHp66lW9IH5oDYOZtkeei
         JScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730363849; x=1730968649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DweqSoc2+xeO9frtw7UMPvB3jd1GLOMseumyZSAPWrw=;
        b=SJA5oIHiQB9EECDO3AaMUHUjkXafI5ImoBO5kSWD3nEl2C4gjlUnYbpn1ps2MPcUBd
         HoWD2xjI+Jpx3qb9poRGRUfbIV6tmeuoNGkX24qb5sUFAcUQruXqrhe121vpG2nd0myu
         LaphTN/5VQhcoTxK4rkaznsCmFUDm/XOrkunG67GXn7j3IWTUycCBHtZpFYSMp3lC87r
         AcAJRvQy/GlyGJKGV8g0bq3Y7P17zUBDSfvf9Ouj1xhllwvknt3W3keczqcgZC+/X/Rp
         kxnWsGmQejHYVBlxmvcJJZTuyf30K3Hm8GX5CzIj7EL8KjTq+6TTb0kRd58B4TYppf9B
         4kRw==
X-Forwarded-Encrypted: i=1; AJvYcCXOePuKajhln80mHFJW2cit4ROWRSc2tvDtPYElr0iQpMfMEQoa02GytzflVv45F5D6qPUW/hATPmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyU0XaX/PVtl/yC+Gob4NxYJgqBkgdiIA+zISVm9LBmvX9XIqpG
	DyxXJLajMzWtMyAhuAYm/pTuzQmSejEy2bvdzauomGsMKjeCHLr+5QbjJ0AzAw==
X-Google-Smtp-Source: AGHT+IFTXjSUWO/dQB0f65M6SLyPAWnTWlIG0fXf0drDNkJqFr02wvIxAX4WVWYi3CIZCPYeetEBSQ==
X-Received: by 2002:a05:6512:1188:b0:539:fc26:74bd with SMTP id 2adb3069b0e04-53b3490ee7dmr8646968e87.27.1730363849428;
        Thu, 31 Oct 2024 01:37:29 -0700 (PDT)
Message-ID: <e385c60d-b1ab-4b85-9908-e88345b4bb20@suse.com>
Date: Thu, 31 Oct 2024 09:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241029110351.40531-1-roger.pau@citrix.com>
 <53034f16-682e-4081-ab7e-81338c700f85@suse.com> <ZyEf8hK-XyGn6Kp8@macbook>
 <d03f58f0-5b93-4b23-85cb-dc2c18a4eb41@suse.com> <ZyIF5qYU8dC-yYNW@macbook>
 <62f917f4-ff63-46b3-9b7f-f8d467bfa2f3@suse.com> <ZyIl4azXy3ySD2SS@macbook>
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
In-Reply-To: <ZyIl4azXy3ySD2SS@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 13:26, Roger Pau Monné wrote:
> On Wed, Oct 30, 2024 at 11:57:39AM +0100, Jan Beulich wrote:
>> On 30.10.2024 11:09, Roger Pau Monné wrote:
>>> On Wed, Oct 30, 2024 at 10:41:40AM +0100, Jan Beulich wrote:
>>>> On 29.10.2024 18:48, Roger Pau Monné wrote:
>>>>> On Tue, Oct 29, 2024 at 05:43:24PM +0100, Jan Beulich wrote:
>>>>>> On 29.10.2024 12:03, Roger Pau Monne wrote:
>>>>>>> @@ -273,6 +293,13 @@ void __ioapic_write_entry(
>>>>>>>      {
>>>>>>>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>>>>>>>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
>>>>>>> +        /*
>>>>>>> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
>>>>>>> +         * Entry will be updated once the array is allocated and there's a
>>>>>>> +         * write against the pin.
>>>>>>> +         */
>>>>>>> +        if ( io_apic_pin_eoi )
>>>>>>> +            io_apic_pin_eoi[apic][pin] = e.vector;
>>>>>>
>>>>>> The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
>>>>>> here to, in particular, set the mask bit. With the mask bit the vector isn't
>>>>>> meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
>>>>>> point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
>>>>>> 0x00).
>>>>>
>>>>> Note that clear_IO_APIC_pin() performs the call to
>>>>> __ioapic_write_entry() with raw == false, at which point
>>>>> __ioapic_write_entry() will call iommu_update_ire_from_apic() if IOMMU
>>>>> IR is enabled.  The cached 'vector' value will be the IOMMU entry
>>>>> offset for the AMD-Vi case, as the IOMMU code will perform the call to
>>>>> __ioapic_write_entry() with raw == true.
>>>>>
>>>>> What matters is that the cached value matches what's written in the
>>>>> IO-APIC RTE, and the current logic ensures this.
>>>>>
>>>>> What's the benefit of using IRQ_VECTOR_UNASSIGNED if the result is
>>>>> reading the RTE and finding that vector == 0?
>>>>
>>>> It's not specifically the vector == 0 case alone. Shouldn't we leave
>>>> the latched vector alone when writing an RTE with the mask bit set?
>>>
>>> I'm not sure what's the benefit of the extra logic to detect such
>>> cases, just to avoid a write to the io_apic_pin_eoi matrix.
>>
>> Perhaps the largely theoretical concern towards having stale data
>> somewhere. Yet ...
>>
>>>> Any still pending EOI (there should be none aiui) can't possibly
>>>> target the meaningless vector / index in such an RTE. Perhaps it was
>>>> wrong to suggest to overwrite (with IRQ_VECTOR_UNASSIGNED) what we
>>>> have on record.
>>>>
>>>> Yet at the same time there ought to be a case where the recorded
>>>> indeed moves back to IRQ_VECTOR_UNASSIGNED.
>>>
>>> The only purpose of the io_apic_pin_eoi matrix is to cache what's
>>> currently in the RTE entry 'vector' field.  I don't think we should
>>> attempt to add extra logic as to whether the entry is valid, or
>>> masked.  Higher level layers should already take care of that.  The
>>> only purpose of the logic added in this patch is to ensure the EOI is
>>> performed using what's in the RTE vector field for the requested pin.
>>> Anything else is out of scope IMO.
>>>
>>> Another option, which would allow to make the matrix store uint8_t
>>> elements would be to initialize it at allocation with the RTE vector
>>> fields currently present, IOW: do a raw read of every RTE and set the
>>> fetched vector field in io_apic_pin_eoi.  Would that be better to you,
>>> as also removing the need to ever store IRQ_VECTOR_UNASSIGNED?
>>
>> ... yes, that may make sense (and eliminate my concern there).
>>
>> I wonder whether the allocation of the array then wouldn't better be
>> moved earlier, to enable_IO_APIC(), such that clear_IO_APIC_pin()
>> already can suitably update it. In fact, since that function writes
>> zero[1], no extra reads would then be needed at all, and the array could
>> simply start out all zeroed.
> 
> I agree with the suggestion to allocate and setup the io_apic_pin_eoi
> matrix in enable_IO_APIC().  However, I'm not sure I follow your
> suggestion about the matrix starting as all zeroes being a sane state.
> 
> I think we need to do the raw RTE reads in enable_IO_APIC() before
> calling clear_IO_APIC(), otherwise clear_IO_APIC_pin() can call
> __io_apic_eoi() before any __ioapic_write_entry() has been performed,
> and hence the state of the RTE.vector field could possibly be out of
> sync with the initial value in io_apic_pin_eoi, and the EOI not take
> effect.

Oh, you're right of course. That's a (side) effect of wanting to always
use the cached value in __io_apic_eoi(), and hence never reading the RTE
there.

Jan

