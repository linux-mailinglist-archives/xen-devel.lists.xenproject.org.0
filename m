Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D9B54D3B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 14:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121902.1465901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux2kU-0007lj-0u; Fri, 12 Sep 2025 12:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121902.1465901; Fri, 12 Sep 2025 12:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux2kT-0007iw-Tg; Fri, 12 Sep 2025 12:19:29 +0000
Received: by outflank-mailman (input) for mailman id 1121902;
 Fri, 12 Sep 2025 12:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ux2kR-0007iq-OT
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 12:19:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b89a7495-8fd2-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 14:19:25 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b07c38680b3so123672066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 05:19:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ee1fd6c0fsm1400841a12.5.2025.09.12.05.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:19:21 -0700 (PDT)
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
X-Inumbo-ID: b89a7495-8fd2-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757679565; x=1758284365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah9BmBT3PRBdzAisUp3GUqiyxcVdWnMdjbSEzd+vKNI=;
        b=fTbBrC/2y7kplqO7F4szVFrLVhbC3p9LEn4sVOV/g+T0BQJIrUcR+KyuWVKuNA6hKT
         eLBKE4SSrIEBJNP274y8M/1FRs3mzwFvJ48EKnmZJA9f47vPlaeOek+0wwcdU6Kq96K3
         /uV0mW0MSg38a4IEkOn2bRzmkade4/BAqXaife4q5E0ZT1bS6s0OuwfKvTdCFxp8Q4Nv
         sG6en8LKc5rSjPBEYbUPfqKS2Xa6iN0Wl3bM3Lk5BECZhyib7P+J3eWcnp1m1c4Mpmvw
         MqPYZc2bQgo8MFgDIaLsfptc5g/jj1QOwY12TqbdZG2D7cF9yjo7UP/99IYOS/TEDuJl
         u7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679565; x=1758284365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah9BmBT3PRBdzAisUp3GUqiyxcVdWnMdjbSEzd+vKNI=;
        b=acxT7riFlnRsF0pV7OwM52pDq07eXc5Gxj8juDGfT762Bq6R+kH+PzIxX1Wkyo3ebm
         Xb6tjTkNE1L/cIi4q/dYXwYPVYSVJqHQOmh8pmr0+DSR7hu1FziKyqePzB9fwaCOlZbg
         IyI4jbppdRVZbVz/aEq4MEgvQfK56hhUR8zYGEedg9CBrrmrY0mQhuUgBc1QY2NnAXFI
         sFHlDIluQQg1fzY4tX4A4sw2sIyfxYQYwxUEl2n25awrt3SxWNrRuvNCEQ4fKk8Ldzei
         ZeYl3glH1SMJMuiES/fbK0cf+TIIEjxOPZi54UIuoHXM1TSs03QTCk7LBhWjIUU1yypV
         MoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcQerSlaMX3aSRbASH5umeQwiQ/Cvl7on5eLrpcCPHsWMxZmFtFVIRkI/84q5KfGpmIJYSRX4TtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5VJJUnIwZDx4iEAHiZZwaZuA02hSFbPRyI4NBmFokgg/Eh3oH
	ZyGQbD4xXQ393TUgwbIjvy/2rJ4rbXpeuDe5+ytd6I6D6NLy4fmGFZYFqZBl3wzfKg==
X-Gm-Gg: ASbGncsAclIx25lC9sVoI0yshfrHvj/ZMG48ErmzzoUcs4iSEDcZ1NJ8GnpjZr39q20
	WS5X/L2NNw+CEyG105wJvtnT2ehmCj5lvxR9phH3i9bzyVNAoDh31IVeSAsNq2tlusB5PMSrg6t
	K6eJMhx9DFvg9gyW/7rZH8Bybyy9ft0t6rxLGN4KLPdfz5Bl5biCLCFWyskSv43IuDd4bMbnrLY
	P9XqM3Fz/8C27a70VxnLlhsFW0P/FGaxKbV18hzz6hWJ9d6OQk6NfSvn8GlHKcN32mXblVU4Fdb
	mlM0+nSS5WTY91JW+PTT+/8LFWgIyNjXMl5FrE1xVNrueABSsecucLMMN47kX9Q+qf6E7jCsjQS
	e0+/TyDEjPGlU16uH6J5Pu33ijwGKwUvtqNGa6GfGjfWm4kF80ot5aFvrUtFsmntyR7xSN2/ORi
	cnFO3cBDHVbQArWT2feA==
X-Google-Smtp-Source: AGHT+IEnk/AE7ZVaHib0lpAwHSkRelpaGXymI6aDcMDf/pSD9Gj2sIqHZUgdoE5ivbyYaGiacg+zAw==
X-Received: by 2002:a17:907:96a9:b0:afa:1d2c:2dc7 with SMTP id a640c23a62f3a-b07c3a7a7d2mr286829666b.57.1757679564614;
        Fri, 12 Sep 2025 05:19:24 -0700 (PDT)
Message-ID: <b53b394d-a3b3-4a6f-8b4c-fd8cb1bc5adc@suse.com>
Date: Fri, 12 Sep 2025 14:19:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
 <20250911162336.23887-2-alejandro.garciavallejo@amd.com>
 <4b958afe-dfcd-4ac0-bc09-468e2b9b2710@suse.com>
 <DCQPUZE9QUU9.1R2NRUOT3952H@amd.com>
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
In-Reply-To: <DCQPUZE9QUU9.1R2NRUOT3952H@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2025 11:32, Alejandro Vallejo wrote:
> On Fri Sep 12, 2025 at 8:40 AM CEST, Jan Beulich wrote:
>> On 11.09.2025 18:23, Alejandro Vallejo wrote:
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
>>> Fixes: 087543338924("hvmloader: limit CPUs exposed to guests")
>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>
>> In principle:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Cheers,
> 
>>
>> However, ...
>>
>>> --- a/tools/libacpi/mk_dsdt.c
>>> +++ b/tools/libacpi/mk_dsdt.c
>>> @@ -231,6 +231,20 @@ int main(int argc, char **argv)
>>>      stmt("Store", "ToBuffer(PRS), Local0");
>>>      for ( cpu = 0; cpu < max_cpus; cpu++ )
>>>      {
>>> +        if ( cpu )
>>> +        {
>>> +            /*
>>> +             * Check if we're still within the MADT bounds
>>> +             *
>>> +             * LLess() takes one byte, but LLessEqual() takes two. Increase
>>> +             * `cpu` by 1, so we can avoid it. It does add up once you do it
>>> +             * 127 times!
>>> +             */
>>> +            push_block("If", "LLess(\\_SB.NCPU, %d)", 1 + cpu);
>>> +            stmt("Return", "One");
>>
>> ... if you already care about size bloat in the conditional, why are the two
>> bytes per instance that this extra return requires not relevant? They too
>> add up, and they can be avoided by wrapping the If around the rest of the
>> code. I didn't count it, but I expect the If encoding to grow by at most one
>> byte, perhaps none at all.
> 
> I don't mind either way. Removing the "return" statement and the pop_block()
> would save 254 bytes in tota at most. I don't think the conditional would grow
> because the there wouldn't be that much contained within, but regardless the
> early return is in the spirit of not going through 127 conditionals on every
> GPE handle when you typically only have a handful of CPUs. The sooner we drop
> out of AML, the better.
> 
> In due time I want to shrink this to be an AML loop in dsdt.asl so it can
> be taken out of mk_dsdt.c. That will both shrink the DSDT (a ton) and accelerate
> GPE handling, but I don't have time to do it at the moment.
> 
> Do you have a preference in table size vs execution-time?

Personally I'd favor table size. The AML interpreter is slow anyway.

Jan

