Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF989B4484
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827145.1241661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hpD-0002NF-Tk; Tue, 29 Oct 2024 08:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827145.1241661; Tue, 29 Oct 2024 08:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hpD-0002Lf-Qn; Tue, 29 Oct 2024 08:43:39 +0000
Received: by outflank-mailman (input) for mailman id 827145;
 Tue, 29 Oct 2024 08:43:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hpB-0002LZ-UU
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:43:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2b0672b-95d1-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 09:43:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so15079425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:43:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431935a5921sm139526675e9.28.2024.10.29.01.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:43:34 -0700 (PDT)
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
X-Inumbo-ID: e2b0672b-95d1-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730191415; x=1730796215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i6QmzbRI7XaCvLUuebd1zYFkXc94/3bjtZriEB/EvOg=;
        b=Pj01iIrbWepznPNINDpFHog61hmL07XwaF/vNcCOkFrzO8GKxXIrmwW/DD2149kVfi
         wquprRmJla1p0EbRFd6Ha+ZwvJsWjao2Y557TbxA628FoFxuoQnWBw12JQ8BIAJTZnCQ
         v2wfH3NXWNkqg4Zm+3WVz4q70fBe2+RH65EM75WlHpSKkLmdNj79sewCl2C8hlTX+bla
         tX0BIW+At2C1+C7k/xladAQ2sK3ZVTJUA6Z1si5wxPRUTUe6pkrOy7tBrINCrSqnQHqQ
         YNn6m6E7ydg5TMHFbxilGT1SEWJbB3XHyHcSHEr+svBtax2z5X64GfZ0aWqWvtDplWau
         bNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191415; x=1730796215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6QmzbRI7XaCvLUuebd1zYFkXc94/3bjtZriEB/EvOg=;
        b=uC8gJ2nbjIWw/AewQsm6ayz3MGoaVbgRWb9TeC7cmZZPU2VDNikL3RlZ/+9JpbWOVz
         vwrjVPIYFW7yJwPMO1xwSDtu0dhyHjkWgU8FEeqPGQwlj89Ut0rwAZX+wVlaQ+uaN9+k
         GjNxu05Of/jSMCfDEz4oSJvkqVwR2i/29GtOgY2z3/qnTqY+YxFV/JGhChNmO7k4kpve
         neOPpbsnHbNOlABidkpTty1hDdMzYN6vd3kp2YsYg4zssDAKqV6BGDNXn1FFKOOYPSP0
         4gUPKBD8x74MOwgSHbewcZfJQXXVE/f87W5wdB6DTAKGnQIcH/gyYqHLL9izcrXK0+s2
         iyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXrCjVwj2r47QbKJX1j+/D3yhob0KV7iPEq0vQlpvULUBs75dU/36zy8Ncxyv7zittq6O8XxaTfGcI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdRHCDYmqINAWbs9lOYzfp7hIrAbgNehnGtXXFdE+3L9wW/hnq
	UfHRd0yo2I8L2XN396cypnMsvM0DAs15de5wF/kAURziwFFj4bkm3VeTWOrKSg==
X-Google-Smtp-Source: AGHT+IFfhHOOOo/W1eBO4/ilcaIAoGiU1d8frPXK5D1gyPkaZo38CkhrSWSk2J0c3k0peAKlh8GtEw==
X-Received: by 2002:a05:600c:214d:b0:431:b42a:2978 with SMTP id 5b1f17b1804b1-431b42a2d0emr14803265e9.9.1730191415065;
        Tue, 29 Oct 2024 01:43:35 -0700 (PDT)
Message-ID: <065f4fe3-8db4-402c-905f-cd109d90070d@suse.com>
Date: Tue, 29 Oct 2024 09:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Willi Junga
 <xenproject@ymy.be>, David Woodhouse <dwmw@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20241024154844.8652-1-roger.pau@citrix.com>
 <abadac24-0392-4051-b6a2-08967272f1a1@suse.com> <Zx_IZUyNL-Iw-nrL@macbook>
 <51cce7e9-97c5-4c7d-957b-bc17b616fba1@suse.com> <ZyCcLPkiQOeSIAHu@macbook>
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
In-Reply-To: <ZyCcLPkiQOeSIAHu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2024 09:26, Roger Pau Monné wrote:
> On Tue, Oct 29, 2024 at 08:40:26AM +0100, Jan Beulich wrote:
>> On 28.10.2024 18:22, Roger Pau Monné wrote:
>>> On Mon, Oct 28, 2024 at 12:33:42PM +0100, Jan Beulich wrote:
>>>> On 24.10.2024 17:48, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/io_apic.c
>>>>> +++ b/xen/arch/x86/io_apic.c
>>>>> @@ -71,6 +71,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
>>>>>  
>>>>>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
>>>>>  
>>>>> +/*
>>>>> + * Store the EOI handle when using interrupt remapping.
>>>>> + *
>>>>> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
>>>>> + * format repurposes the vector field to store the offset into the Interrupt
>>>>> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
>>>>> + * longer matches the contents of the RTE vector field.  Add a translation
>>>>> + * table so that directed EOI uses the value in the RTE vector field when
>>>>> + * interrupt remapping is enabled.
>>>>> + *
>>>>> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
>>>>> + * when using the remapped format, but use the translation table uniformly in
>>>>> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
>>>>> + *
>>>>> + * The matrix is accessed as [#io-apic][#pin].
>>>>> + */
>>>>> +static uint8_t **io_apic_pin_eoi;
>>>>
>>>> Wasn't the conclusion from the v1 discussion that this needs to be a signed
>>>> type wider than 8 bits?
>>>>
>>>>> @@ -298,6 +323,9 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>>>>>      /* Prefer the use of the EOI register if available */
>>>>>      if ( ioapic_has_eoi_reg(apic) )
>>>>>      {
>>>>> +        if ( io_apic_pin_eoi )
>>>>> +            vector = io_apic_pin_eoi[apic][pin];
>>>>> +
>>>>>          /* If vector is unknown, read it from the IO-APIC */
>>>>>          if ( vector == IRQ_VECTOR_UNASSIGNED )
>>>>>              vector = __ioapic_read_entry(apic, pin, true).vector;
>>>>
>>>> In addition to what Andrew said here, for this comparison the make sense
>>>> ...
>>>>
>>>>> @@ -1022,7 +1050,20 @@ static void __init setup_IO_APIC_irqs(void)
>>>>>  
>>>>>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
>>>>>  
>>>>> +    if ( iommu_intremap )
>>>>> +    {
>>>>> +        io_apic_pin_eoi = xzalloc_array(typeof(*io_apic_pin_eoi), nr_ioapics);
>>>>> +        BUG_ON(!io_apic_pin_eoi);
>>>>> +    }
>>>>> +
>>>>>      for (apic = 0; apic < nr_ioapics; apic++) {
>>>>> +        if ( iommu_intremap )
>>>>> +        {
>>>>> +            io_apic_pin_eoi[apic] = xzalloc_array(typeof(**io_apic_pin_eoi),
>>>>> +                                                  nr_ioapic_entries[apic]);
>>>>> +            BUG_ON(!io_apic_pin_eoi[apic]);
>>>>> +        }
>>>>
>>>> ... doesn't the array also need -1 (== IRQ_VECTOR_UNASSIGNED) filling,
>>>> rather than zero-filling?
>>>
>>> Replying here to both you and Andrews question.  My analysis is that
>>> a sentinel is not needed.  clear_IO_APIC_pin() is the only function
>>> that calls the EOI routine outside of the irq_desc handlers logic.
>>>
>>> It's used either by clear_IO_APIC(), which gets called before
>>> io_apic_pin_eoi is allocated,
>>
>> Or long after, from disable_IO_APIC().
>>
>>> or by check_timer() and/or
>>> unlock_ExtINT_logic() both of which will perform an
>>> ioapic_write_entry() before the clear_IO_APIC_pin() call.
>>
>> In unlock_ExtINT_logic() I see a call to ioapic_read_entry(), whereas the
>> call to ioapic_write_entry() happens only later. In check_timer() I'm also
>> uncertain a write would occur in _all_ cases. It certainly should occur,
>> or else chances are low that the timer interrupt would actually work. Yet
>> we surely want to avoid making hard to debug corner cases yet more subtle.
> 
> Didn't mention it here, but setup_IO_APIC_irqs() will also perform an
> __ioapic_write_entry() call for almost all pins.
> 
>>> I've done some XenRT testing with a modified patch that kept the
>>> io_apic_pin_eoi as unsigned int, used the sentinel as init value and
>>> added an assert in __io_apic_eoi() that the value in the array was
>>> never IRQ_VECTOR_UNASSIGNED when the io_apic_pin_eoi was allocated.
>>> This never triggered on any hardware XenRT tested on.
>>>
>>> Maybe this seems to fragile, and you both prefer to keep the sentinel
>>> just in case?
>>
>> Well, how certain are you that this testing in particular covered e.g. all
>> the quirk cases that check_timer() tries to deal with?
> 
> That indeed I cannot guarantee, as I don't have coverage figures for
> the XenRT runs.
> 
> Seeing as there's too much uncertainty about whether the array will be
> initialized, I will go back to the approach of having a sentinel.
> Andrew suggested to use a 16bit types, would you agree to that or do
> you prefer to use unsigned int as originally proposed?

I too prefer the more narrow type. I'm not overly fussed between int16_t
vs short.

Jan

