Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29EFB53809
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120479.1465403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjR6-0000bn-HA; Thu, 11 Sep 2025 15:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120479.1465403; Thu, 11 Sep 2025 15:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjR6-0000Yx-EQ; Thu, 11 Sep 2025 15:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1120479;
 Thu, 11 Sep 2025 15:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwjR5-0000XT-36
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:42:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e01a9e9a-8f25-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 17:42:08 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62ed3e929d1so450017a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 08:42:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33ac2c7sm1344908a12.13.2025.09.11.08.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 08:42:07 -0700 (PDT)
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
X-Inumbo-ID: e01a9e9a-8f25-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757605328; x=1758210128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1LfVpQMa8EqWRGQECfp1CNnRonRO/NJ7wxd71Gbpnak=;
        b=XgJ0wsoEvn9VV4incs+6CPu4na0P+IKeA/+wKQHpF9JA/DgAUiTH4fS18MMSaXCi+f
         Xvlks76Yywa2zKOSseVPOznBJjxEfnq+ma1C7IsmgMko8wavC1NvZdyuViVD+wKUzzOE
         5jyYMKPCJPjoyHXgzzFBG1iE3ze1qtogDF+54Am1us3clJ4pJdGcP0szkgAar3cqa2kk
         sr+1B2tNsSl8GWYQPTHKDWtd4pfjrZ0ByEu9WEZlPuo9jOW9WIfCeRjA2ZQWyRX4iRDO
         D5yRDa949418PCFj4VRiLblCNbu4IPTpbEZ5yHQMqd2g7ySbU/8f8POIcQs9KmjcHetb
         DvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605328; x=1758210128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LfVpQMa8EqWRGQECfp1CNnRonRO/NJ7wxd71Gbpnak=;
        b=b27fVAPo3M6y3I2CZ5fe8PtfvNCrz0mgo8ceuSczaD5eYWCJihLj62GieEjTzp6CeN
         FxY8pbXpnwiKOXopFIyGnld3OQ66z1R1TsafNr+GUPNA+j97+EfMeoXCi7ckPQi9lTb3
         boW5FujWplteGPevAE2Am3pb9U6HhlBXvQ9MI5F2O8BemfZYKoPOTL6/Ula6HiD03ss5
         HzArNcjyT5xD3nXt4wQrfOeNn0ivaemFxZ8ryYaI4cA+FFjl90VnmvMbyU9za4fwzCAt
         yV+IdGf4mjp4mAFL0X2I9Uqukw7m5GABB1mVKtSHIfDImxRZcZ35W781sMYf+las6qHn
         pSbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGcX5w8z+XAWx13mSK6HxUICAqwATbFbTjURnny17p6L99q/WiPD3IeAwMCAm2/xe35/CGJxF5hGQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywuu85gN6TkQE5u90nEBfR2SnxZJYrMLU5fWl4t1fCLFVMVxV82
	Nu6VEnb/uEartvoNVsM5zmj+VaKuB8VV5hLiVj0mJRky+HFxpB5fdlGpuYD4tWLi18Gjx0HsSRt
	phps=
X-Gm-Gg: ASbGnctj1k48277Fj6LIfcDPz0YxbHw2np+oeBGr6W0ypMyp5+8GSM6MDE8w4bmHrVg
	CugU+/KCx4R/AjcUZ4NzBhxIULmx8EGI+kgrnykzp36dnQMenNSBAGqTwa2Zdtsc54kvWRD8THz
	YiSVPeJvrV5GaRs0TAMhH9cNtxbSMaoU16S6M1uUaTFO9SxOyWYAH7lGQ+xdJ4DqBZbjQSFFfxH
	+3FMbByoqA4WtNOld85nV5fmaDf0lLr59rYOZk+Ka9bqso6rpTM/TUh08bcM16leTyG72Psz+tn
	4+pDOAPHWHdWxHzW3gCE+XEZsoyQ+fVm7IKtpxgwJsmTWjkWZzQinAnBXj3526KvFxfFf5e+ZH9
	RLz+1wICIMUUmoccSMBW6E46QuZSg4zh5CUg+NAnpbnjSGcAfH8NDKrb9QbkY1nTYQgkTFNUuPD
	EYihCyXWZ1s/ouuFiILw==
X-Google-Smtp-Source: AGHT+IFQhaENGZCXxoeYFng5B5MFF8qjfOY/nRI9OzP/MMktsTVOeXQSduRjOVooeVq9HKd1e/NEjQ==
X-Received: by 2002:a05:6402:23d5:b0:62b:e4d1:1192 with SMTP id 4fb4d7f45d1cf-62ed823facamr39569a12.4.1757605327938;
        Thu, 11 Sep 2025 08:42:07 -0700 (PDT)
Message-ID: <df2fe4ca-931a-4a4d-8b1b-f49415e7d8e8@suse.com>
Date: Thu, 11 Sep 2025 17:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <a62ce5aa-6f2e-457b-bf4b-49e6b7f6eb7a@suse.com>
 <DCQ2VHRX64BT.OC19LF2SJXFV@amd.com>
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
In-Reply-To: <DCQ2VHRX64BT.OC19LF2SJXFV@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 17:32, Alejandro Vallejo wrote:
> On Thu Sep 11, 2025 at 4:52 PM CEST, Jan Beulich wrote:
>> On 11.09.2025 13:53, Alejandro Vallejo wrote:
>>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
>>> by the device model. The GPE handler checks this and compares it against
>>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>>> related bit in the bitmap and adjusting the table's checksum.
>>>
>>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
>>> reaches 128, even if that overflows the MADT into some other (hopefully
>>> mapped) memory. The reading isn't as problematic as the writing though.
>>>
>>> If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
>>> then the bit where the "online" flag would be is flipped, thus
>>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>>> that happened outside its range. It's all terrible.
>>>
>>> Note that this corruption happens regardless of the device-model being
>>> present or not, because even if the bitmap holds 0s, the overflowed
>>> memory might not at the bits corresponding to the "online" flag.
>>>
>>> This patch adjusts the DSDT so entries >=NCPUS are skipped.
>>>
>>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
>>
>> The code in question originates from e5dc62c4d4f1 ("hvmloader: Fix CPU
>> hotplug notify handler in ACPI DSDT"), though. Before that there was a
>> different issue (as mentioned in the description).
> 
> As you mentioned elsewhere, it probably is 087543338924("hvmloader: limit CPUs
> exposed to guests") that matters. Until then the DSDT was correct.
> 
>>
>>> --- a/tools/libacpi/mk_dsdt.c
>>> +++ b/tools/libacpi/mk_dsdt.c
>>> @@ -239,7 +239,8 @@ int main(int argc, char **argv)
>>>          /* Extract current CPU's status: 0=offline; 1=online. */
>>>          stmt("And", "Local1, 1, Local2");
>>>          /* Check if status is up-to-date in the relevant MADT LAPIC entry... */
>>> -        push_block("If", "LNotEqual(Local2, \\_SB.PR%02X.FLG)", cpu);
>>> +        push_block("If", "And(LLess(%d, NCPU), LNotEqual(Local2, \\_SB.PR%02X.FLG))",
>>> +                   cpu, cpu);
>>
>> Don't we need to use \\_SB.NCPU here? From the other two uses it's not
>> quite clear; it might also be that the one using this form is actually
>> needlessly doing so. Yet here it may be better if only for consistency's
>> sake, as the LNotEqual() also operates on an absolute reference.
> 
> \SB.PMAT method does the same thing. I'll just change that too while at it.
> 
>> The other thing is that I'm not fluent in AML operand evaluation rules.
>> We want to avoid even the read access to FLG, and I'm unconvinced And()
>> will avoid evaluating its 2nd argument when the first one is 0. IOW this
>> may need to become a 2nd "If".
> 
> I don't think there are any rules, it's unspecified. While in practice it
> wouldn't matter a lot, it's indeed better not to rely on it not blowing up.
> 
> After sending this, I wondered about having a separate if with an early return.
> 
>>
>> I further think that strictly speaking you mean LAnd() here, not And()
>> (but the above concern remains; all the ASL spec says is "Source1 and
>> Source2 are evaluated as integers" for both And() and LAnd()).
> 
> I very definitely did mean LAnd! Nice catch. As for 
> 
>>
>> Jan
> 
> TL;DR: Will s/And/LAnd/ and move it to a separate If

Except that once you use a separate If, no And() or LAnd() will be needed
anymore.

Jan

