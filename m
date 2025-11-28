Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B21C9114F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 08:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174524.1499484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtOG-0002KX-Fi; Fri, 28 Nov 2025 07:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174524.1499484; Fri, 28 Nov 2025 07:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOtOG-0002Ho-Ck; Fri, 28 Nov 2025 07:59:40 +0000
Received: by outflank-mailman (input) for mailman id 1174524;
 Fri, 28 Nov 2025 07:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOtOE-0002Hh-Bi
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 07:59:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7fef35-cc30-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 08:59:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso12913105e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 23:59:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc39csm143084085e9.14.2025.11.27.23.59.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 23:59:35 -0800 (PST)
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
X-Inumbo-ID: 2e7fef35-cc30-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764316775; x=1764921575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6cYXkCxwds7AF/ksIpqi8jVejz3Y99uODHetY6ZuE68=;
        b=EKj13LhIJS2SJ+5FK6f3/8qlbJe/z2yjwpLG0ji19rTKNo/nT1c8LtW4Wroc2VvO64
         BIK7MaRnVkaaqhzPlBlvDCzOUlmpzVvW5wNlcfRdyltMTmJBVwZlHkaPLjeIcayA/RY6
         EEegmuowxCsWByzh+n3lQCC08QnPZq8sJt+ELsEp4gvH/3WjKMbZcWb/zRRTFhS0dBHm
         EZx5dZaIQJMBW0aRHCHWxEzSIYET43jA3tv/HIz4gm5mDCGLG7gH3ouWsq8XrcS1zzVi
         d31+ohgMOQLpgF2ESQ32feEYVQzEMtlURi2xlmKUlp+1+/EbdYqx1OHthe8EmM5xEHNN
         zviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764316775; x=1764921575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cYXkCxwds7AF/ksIpqi8jVejz3Y99uODHetY6ZuE68=;
        b=HVDvxgsNRd2Mtni3nw8TLSRr2eA1GFsWdhrJBmYpMIglwAEoA7C4um15jnzfqyvr6L
         mqh7wTJO7I/mStKWTubZvd5qKXMEi8HjeoFA8OtgDWPAYdvhWwCLRneZEEQ8c0S9lgul
         EuO1UqVLJI9jEk3ZIJeISbM1VBpz6mlJ05/NAgXDmKuVU34BaKol+RX1PIocRlinA+qb
         hYGjxYgaP5QFpf2lqMsUap/1rY7AoTREyYFNse9QEXbbmz+wMV+uXOJaWSjkAf+oz3m+
         JSzI5ZeQ0B2pM6QA0uqCriX4nqqPubxbmeMf4GlNm2Fbvqw6ATxb0cJAdix/0AYyvlOa
         8uDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRBggO6rQ8nx+Z2YlCC6lqljn56AIBj2cKYyTy4ZeyD0i2SjIiY2EkgrgM6tYNviDBLA9RGgtuj3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvDjZHRhdRYjLw4I1F2SHPQpXAIzHJGZM/MtPl38w4DJo+UkB+
	wqwuwfTUnMjfGonj8QGer2ngu5yNn6oWhfoudu1jlPzzI6XKcJIX+ZcgZyKZ6dPIgw==
X-Gm-Gg: ASbGncu1aOzfUZn7QoB3X8YkqRMb7iFtzdL0CDsIXpm8xi5s3JJavlpF3F3shtHSafm
	QfZAy9JekHraBIeVjzhB+53MDlUZ/YEkWhuPAaxjVVqbPsFbuB2su8zV6De3/qyDzkofq99Zl92
	hwIaYr9FAvKH/UUcwJ6ghxu//+ti1ztQB/0zmgqwQUdnbkNTdZGcS/p3aGgBltUY6jj1cVZHm+V
	ema/5/Q6yiMzdnXckeZs/Y59GKuQwGj6XJeBhqOs4byTM2H0WGUfhmqZPvtJbn8GThDoZ56dwH6
	9rSa+8grAXyYYe8veQpCZN2Ggtf0lPOhtlTdVtAdxM6NWgWtfyJJ/jauqrt5+egsdglPxsI5OMi
	QiLuPAcMs1FwC5a7ZgOybTeN0FZRv9wHfQC7dtGSQL2DConOC4izdI71ZLeRlKTlkAVCmtxe/YA
	Hs4nm6Owhuv3PDsFPIQCOlp2pOp8gtEamdu4LM7K1OTCcRxDEDP5PY4YFlvwWAHYV4aPVhkvZse
	Y4=
X-Google-Smtp-Source: AGHT+IFiVJKHUM1IU2T5YsI9MGRL7Z74diQXksji8MjoVPDidemcc3dx1vmyoqjQZHxgcSjN7uFIfg==
X-Received: by 2002:a05:600c:1909:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-477c020137fmr263651435e9.34.1764316775416;
        Thu, 27 Nov 2025 23:59:35 -0800 (PST)
Message-ID: <f5821053-b89c-4323-97e5-296cc928910f@suse.com>
Date: Fri, 28 Nov 2025 08:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251127221244.3747918-1-grygorii_strashko@epam.com>
 <20251127221244.3747918-4-grygorii_strashko@epam.com>
 <26f448be-4a7f-4346-928f-8185ca8ba222@citrix.com>
Content-Language: en-US
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <26f448be-4a7f-4346-928f-8185ca8ba222@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2025 00:09, Andrew Cooper wrote:
> On 27/11/2025 10:12 pm, Grygorii Strashko wrote:
>> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
>> index 17ca6666a34e..128115442ecc 100644
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -619,9 +619,11 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
>>  
>>  extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>>  
>> -void domain_set_alloc_bitsize(struct domain *d);
>> -unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
>> +#ifdef CONFIG_PV32
>> +unsigned int domain_clamp_alloc_bitsize(const struct domain *d,
>> +                                        unsigned int bits);
> 
> Do not convert this, or any other domains/vcpus you see, to const.  I
> realise you have been given conflicting information on this point, but
> the maintainers as a whole agreed to not const pointers to complex
> objects in the general case because of the churn it creates, and the
> repeated examples of MISRA violations people have inserted to work
> around the fact it shouldn't have been a const pointer to start with.

While moot here when indeed converted to a macro, as you suggest below,
I don't recall "maintainers as a whole agreed" on this. For one there
are predicate-like functions where I think even you agreed their
parameters can be pointer-to-const. The case here isn't very far from
predicate-like, in particular ...

> That aside, I think clamp wants to be a static inline here.  (Except it
> can't be, so it needs to be a macro).
> 
> It's currently a concrete function call to very simple piece of logic,
> where the callers have options to eliminate it entirely in the d = NULL
> case if they could only see in.
> 
> #define domain_clamp_alloc_bitsize(d, bits)                             \
>     (((d) && (d)->arch.pv.physaddr_bitsize)                             \
>      ? min_t(uint32_t, (d)->arch.pv.physaddr_bitsize, bits) : bits)

... this representation alone demonstrates that what d points to is only
ever read.

Yes, there are cases where the situation is more complex, and where I can
see how my pov may not be shared by others. Yet still - can you point me
to a written form of the supposed agreement among maintainers? Imo
something like this, which has been controversial for a long time, really
needs recording in ./CODING_STYLE or docs/process/coding-best-practices.pandoc.
And then preferably in a shape acceptable to everyone (i.e. no outright
"never").

Jan

