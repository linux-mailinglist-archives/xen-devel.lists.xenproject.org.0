Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954999B5F0A
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827958.1242732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65D2-0003Yn-P4; Wed, 30 Oct 2024 09:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827958.1242732; Wed, 30 Oct 2024 09:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65D2-0003Vx-MZ; Wed, 30 Oct 2024 09:41:48 +0000
Received: by outflank-mailman (input) for mailman id 827958;
 Wed, 30 Oct 2024 09:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t65D1-0003Vr-0Z
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:41:47 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b7dc9b6-96a3-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 10:41:42 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so61470265e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 02:41:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e9145sm15878755e9.1.2024.10.30.02.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 02:41:41 -0700 (PDT)
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
X-Inumbo-ID: 2b7dc9b6-96a3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiN2RjOWI2LTk2YTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjgxMzAyLjc1ODUyOSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730281302; x=1730886102; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FDt6JJuERNz3Ufs7fDs7RchX0F5IPwSJ6EzAs3vx4ms=;
        b=SbOklfCsqW15ZUQ1a+NAPFezU2yUEkZrW6+clRtACxfDanXOeg5JKNv8Z2N3Af54+n
         QGqHMEry0kGjrxe3hGhR0+NyZtXw4870QVVz+VtRmwJAW95+gOfKbxxVWCV1tdMbJyk3
         +s0msGsPKYMVpOR0Wi9rcM6JvhmbcfdjEK9ygpg5X3YRdzZcunuM31wMK8BkCms9Ry/L
         P44RMCR1vYPKqhBdFBv/461eghzcMisSxDZP2a8Bjg4pmWhQcPhaFxZAF2UjmKx0K+ou
         DtUGokhBH3HG14d6oOuHX8GaziWb6Xa2/B8j3lICNzjO1wCvx5hnev9a81tP7JcJPJ+Y
         XoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281302; x=1730886102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt6JJuERNz3Ufs7fDs7RchX0F5IPwSJ6EzAs3vx4ms=;
        b=BmY0EYbKqYwZgrbtSRmKy/n3AxLBSdbAZu/IuHsDsUfYUNPkratfE4pdEebRaHZ1Ka
         fioyW/hAQKVaTjg0ukyMjzmcQHe3MvbJShHelBHP2WUCQkgqpYUUbUGiMiycGPYlPH5G
         VS0ubA8fDq3XpOPz8Oq8AYREBVwl+NNEQQ4g/bcDLLqVj/vQGLZS+cXNs8U39eNEs3Ku
         LQJEfrw9z4IKSkeVEaPpF09NErUFLelH+gkhIhHglK21Wmn+tZvV+m6MYhiU50c3+eDy
         HA9gVdyM8bp8oO5FhL7F3Gpa+ia/snMtgL4+/tLNRf043Fc4uQDQEID/UwGhnXWBdd2n
         Ys3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpp6DVNr9SZbDAid2Gg40YwmfMC8prsduz042GvcXgNVb+MLdnJsRuy/KxAq1DYOhr2D3D9AadI3g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMXGaPWADiyyBifBPv5SAhy5Oc5jfOfZS5fo4wYBTiOGHQ7yT3
	EY2bvfPOXdGYwSWzHYTjhpX17mzUd1xtYZ1DNcOKcLIz6qC1B27KXD0XdSusUw==
X-Google-Smtp-Source: AGHT+IE+uZUUB2wOFcZmLwikecK9P+euTTC35AcFTM2ntt5Ay83c0M088+ksTo3e4ZRHVmQsJfV3Iw==
X-Received: by 2002:a05:600c:4f85:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-4319ac7408dmr131947425e9.2.1730281302065;
        Wed, 30 Oct 2024 02:41:42 -0700 (PDT)
Message-ID: <d03f58f0-5b93-4b23-85cb-dc2c18a4eb41@suse.com>
Date: Wed, 30 Oct 2024 10:41:40 +0100
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
In-Reply-To: <ZyEf8hK-XyGn6Kp8@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2024 18:48, Roger Pau Monné wrote:
> On Tue, Oct 29, 2024 at 05:43:24PM +0100, Jan Beulich wrote:
>> On 29.10.2024 12:03, Roger Pau Monne wrote:
>> Plus with what you said
>> earlier about vector vs EOI handle, and with the code using "vector" all over the
>> place, their (non-)relationship could also do with clarifying (perhaps better in
>> a code comment in __io_apic_eoi()).
> 
> I've attempted to clarify the relation between vector vs EOI handle in
> the first paragraph, and how that applies to AMD-Vi.  I can move
> (part?) of that into the comment in __ioapic_write_entry(), maybe:
> 
> /*
>  * Might be called before io_apic_pin_eoi is allocated.  Entry will be
>  * updated once the array is allocated and there's a write against the
>  * pin.
>  *
>  * Note that the vector field is only cached for raw RTE writes when
>  * using IR.  In that case the vector field might have been repurposed
>  * to store something different than the target vector, and hence need
>  * to be cached for performing EOI.
>  */

Sounds okay to me, yet I'd prefer a comment in __io_apic_eoi(), where it
may want wording a little differently.

>>> @@ -273,6 +293,13 @@ void __ioapic_write_entry(
>>>      {
>>>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>>>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
>>> +        /*
>>> +         * Called in clear_IO_APIC_pin() before io_apic_pin_eoi is allocated.
>>> +         * Entry will be updated once the array is allocated and there's a
>>> +         * write against the pin.
>>> +         */
>>> +        if ( io_apic_pin_eoi )
>>> +            io_apic_pin_eoi[apic][pin] = e.vector;
>>
>> The comment here looks a little misleading to me. clear_IO_APIC_pin() calls
>> here to, in particular, set the mask bit. With the mask bit the vector isn't
>> meaningful anyway (and indeed clear_IO_APIC_pin() sets it to zero, at which
>> point recording IRQ_VECTOR_UNASSIGNED might be better than the bogus vector
>> 0x00).
> 
> Note that clear_IO_APIC_pin() performs the call to
> __ioapic_write_entry() with raw == false, at which point
> __ioapic_write_entry() will call iommu_update_ire_from_apic() if IOMMU
> IR is enabled.  The cached 'vector' value will be the IOMMU entry
> offset for the AMD-Vi case, as the IOMMU code will perform the call to
> __ioapic_write_entry() with raw == true.
> 
> What matters is that the cached value matches what's written in the
> IO-APIC RTE, and the current logic ensures this.
> 
> What's the benefit of using IRQ_VECTOR_UNASSIGNED if the result is
> reading the RTE and finding that vector == 0?

It's not specifically the vector == 0 case alone. Shouldn't we leave
the latched vector alone when writing an RTE with the mask bit set?
Any still pending EOI (there should be none aiui) can't possibly
target the meaningless vector / index in such an RTE. Perhaps it was
wrong to suggest to overwrite (with IRQ_VECTOR_UNASSIGNED) what we
have on record.

Yet at the same time there ought to be a case where the recorded
indeed moves back to IRQ_VECTOR_UNASSIGNED.

> Looking at clear_IO_APIC_pin() - I think the function is slightly
> bogus.  If entry.trigger is not set, the logic to switch the entry to
> level triggered  will fetch the entry contents without requesting a
> raw RTE, at which point the entry.vector field can not be used as
> the EOI handle since it will contain the vector, not the IR table
> offset.  I will need to make a further patch to fix this corner
> case.

Is there actually a reason not to pass IRQ_VECTOR_UNASSIGNED there,
to have __io_apic_eoi() determine the vector? (But of course we can
also latch entry.vector from the earlier raw read.)

>>> @@ -298,9 +325,17 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
>>>      /* Prefer the use of the EOI register if available */
>>>      if ( ioapic_has_eoi_reg(apic) )
>>>      {
>>> +        if ( io_apic_pin_eoi )
>>> +            vector = io_apic_pin_eoi[apic][pin];
>>> +
>>>          /* If vector is unknown, read it from the IO-APIC */
>>>          if ( vector == IRQ_VECTOR_UNASSIGNED )
>>> +        {
>>>              vector = __ioapic_read_entry(apic, pin, true).vector;
>>
>> Related to my comment higher up regarding vector vs EOI handle: Here we're
>> doing a raw read, i.e. we don't really fetch the vector but the EOI handle
>> in the AMD case. Why is it that this isn't sufficient for directed EOI to
>> work (perhaps with the conditional adjusted)?
> 
> It is enough, but we don't want to be doing such read for each EOI,
> hence why we cache it in io_apic_pin_eoi.

Yet then the patch is to a fair part about improving performance, when the
functionality issue could be addressed with a far less intrusive change.
Which may in particular make a difference with backporting in mind. Plus
that may want at least mentioning in the description.

>> Then again - are we ever taking this path? Certainly not when coming from
>> clear_IO_APIC_pin(), hence ...
>>
>>> +            if ( io_apic_pin_eoi )
>>
>> ... I'm unconvinced this conditional is needed.
> 
> Hm, maybe.  I can adjust but seems more fragile to trigger a
> dereference for the extra cost of a conditional in what should be a
> non-common path anyway.

Well, I was thinking of transforming the if() into ASSERT().

Jan

