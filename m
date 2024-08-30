Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDDA9661D4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 14:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786426.1196015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0pq-0000gR-65; Fri, 30 Aug 2024 12:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786426.1196015; Fri, 30 Aug 2024 12:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk0pq-0000dC-3G; Fri, 30 Aug 2024 12:34:38 +0000
Received: by outflank-mailman (input) for mailman id 786426;
 Fri, 30 Aug 2024 12:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2fe=P5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sk0pn-0000d6-V9
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 12:34:35 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36072538-66cc-11ef-99a1-01e77a169b0f;
 Fri, 30 Aug 2024 14:34:33 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso1667645a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 05:34:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a445sm1852061a12.11.2024.08.30.05.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 05:34:32 -0700 (PDT)
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
X-Inumbo-ID: 36072538-66cc-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725021273; x=1725626073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8CoqEr+B5m2uk0VUEu3Zy0oIm3v9e/PhpTGOAL5GA0M=;
        b=P9edKPCw0ZxGJnV1XWYKmE6MEKNu6n/GZgIWZgHlkcjrpDlh3QKfovK812KgmdTp6A
         inThqnBRtcI1t6Byh63JkyUTR8UAH5cYqQU7YAQN/V/0Uc1gRLu0CBbF94Gekk6qIxOM
         od3OrXAj9tnoR4dspHuSxi8rZ/mU7GlCGuqLil2/2boJEybF9Vp+ED8JDdICix4deAF/
         nQgqgq1v07cNeXxO615vTxHQ4pkTvLGqPQbNOSKcI1K45FF2qO6ZQUWSWcSZQOes1CaU
         PxgE+j3IJmc+ZxzDjzvi31vmNup9DU9SsdX3gL+CSSnvxQoQ396bxpVShV5NwMBuo63B
         t42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725021273; x=1725626073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CoqEr+B5m2uk0VUEu3Zy0oIm3v9e/PhpTGOAL5GA0M=;
        b=OLxs0ulHDGhOxK8btAiHXEMpto7qfwV/4Puab1DzTxU4WwFrSGBuJErkz3UvcDXWhp
         tUxOucpLoPGh7paWHgb/GjCboLE2hsVQTb24zNkNtlvSyOubNFt3sFLEGUmUEUgrBmbF
         lFH31Qr7SpP2QnhI90FnNMxgdGDsqbnsSVYeA6AJG1RRIDiWoSN6PUM6DTsf18f7+G4p
         QcNk3p3eqjcIA69xCbNChZ8MC6wWlTLdej0RjiMaJDejkaw/JDBqu8uShaWgFsK85d9S
         kEoWjTWeGNUcw4dTPAcK8FWttgXmrOcmxGgYGn1KR9AFceFPIm7x/fiFkT0W1Di68uVl
         ft5A==
X-Forwarded-Encrypted: i=1; AJvYcCVFUWpEmGzrMXUp4LJzmavfsYuqAQzwakMrqek5NZcwdn+Oed+c/5VeJYMwKoOk9AWJptTKaDtuFa8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiVu+W0JE+FFTV9Jbfn8ISl0vo3EMIhuIjbgIAEkpXmyWqLSCo
	WeaezQIVxDY+IzeQ9fDZcJZhWyDHznvjBxnlJBK/vv2F0dyMhrRVxmdRVmV4yg==
X-Google-Smtp-Source: AGHT+IFZ+NmdslnP8SEkRSePHnCFW5ZEOA87ZHnhm/pwe0R4SkVoPAY5yIJRqGMMRsIZCNNUsEykGA==
X-Received: by 2002:a05:6402:401f:b0:5c0:ab2d:334c with SMTP id 4fb4d7f45d1cf-5c21eda0c76mr5338117a12.32.1725021273075;
        Fri, 30 Aug 2024 05:34:33 -0700 (PDT)
Message-ID: <fe68201e-96cb-4a4f-811a-1cbcc9090aa7@suse.com>
Date: Fri, 30 Aug 2024 14:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] xen/riscv: set up fixmap mappings
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <57e892d5b2c526dd44b68d4976796a25c0feca20.1724256027.git.oleksii.kurochko@gmail.com>
 <4b9cfa7e-546a-4dbb-a3de-4267849be13a@suse.com>
 <66cb014343699b74b2539b61b25e2285092b4aff.camel@gmail.com>
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
In-Reply-To: <66cb014343699b74b2539b61b25e2285092b4aff.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.08.2024 13:55, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-27 at 12:29 +0200, Jan Beulich wrote:
>>> @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned
>>> long mfn, bool sync_icache)
>>>       BUG_ON("unimplemented");
>>>   }
>>>   
>>> +/* Write a pagetable entry. */
>>> +static inline void write_pte(pte_t *p, pte_t pte)
>>> +{
>>> +    write_atomic(p, pte);
>>> +}
>>> +
>>> +/* Read a pagetable entry. */
>>> +static inline pte_t read_pte(pte_t *p)
>>> +{
>>> +    return read_atomic(p);
>>
>> This only works because of the strange type trickery you're playing
>> in
>> read_atomic(). Look at x86 code - there's a strict expectation that
>> the
>> type can be converted to/from unsigned long. And page table accessors
>> are written with that taken into consideration. Same goes for
>> write_pte()
>> of course, with the respective comment on the earlier patch in mind.
>>
>> Otoh I see that Arm does something very similar. If you have a strong
>> need / desire to follow that, then please at least split the two
>> entirely separate aspects that patch 1 presently changes both in one
>> go.
> I am not 100% sure that type trick could be dropped easily for RISC-V:
> 1. I still need the separate C function for proper #ifdef-ing:
>    #ifndef CONFIG_RISCV_32
>        case 8: *(uint32_t *)res = readq_cpu(p); break;
>    #endif
>    
> 2. Because of the point 1 the change should be as following:
>    -#define read_atomic(p) ({                                   \
>    -    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \
>    -    read_atomic_size(p, x_.c, sizeof(*(p)));                \
>    -    x_.val;                                                 \
>    +#define read_atomic(p) ({                                 \
>    +    unsigned long x_;                                     \
>    +    read_atomic_size(p, &x_, sizeof(*(p)));               \
>    +    (typeof(*(p)))x_;                                     \
>     })
>    But after that I think it will be an error: "conversion to non-scalar
>    type requested" in the last line as *p points to pte_t.
>    
>    and we can't just in read_pte() change to:
>    static inline pte_t read_pte(pte_t *p)
>    {
>        return read_atomic(&p->pte);
>    }
>    As in this cases it started it will return unsigned long but function
>    expects pte_t.

Of course.

> As an option read_pte() can be updated to:
>    /* Read a pagetable entry. */
>    static inline pte_t read_pte(pte_t *p)
>    {
>        return (pte_t) { .pte = read_atomic(&p->pte) };
>    }

That's what's needed.

>    But I am not sure that it is better then just have a union trick inside
>    read_atomic() and then just have read_atomic(p) for read_pte().

It's largely up to you. My main request is that things end up / remain
consistent. Which way round is secondary, and often merely a matter of
suitably justifying the choice made.

Jan

