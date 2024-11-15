Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2C9CDA30
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 09:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836942.1252855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrKQ-0003jS-Bn; Fri, 15 Nov 2024 08:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836942.1252855; Fri, 15 Nov 2024 08:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBrKQ-0003hZ-8X; Fri, 15 Nov 2024 08:05:18 +0000
Received: by outflank-mailman (input) for mailman id 836942;
 Fri, 15 Nov 2024 08:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBrKO-0003hT-Oq
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 08:05:16 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57792a5a-a328-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 09:05:13 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4315eac969aso8431815e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 00:05:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d478511dsm73731035e9.0.2024.11.15.00.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 00:05:12 -0800 (PST)
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
X-Inumbo-ID: 57792a5a-a328-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMjkiLCJoZWxvIjoibWFpbC13bTEteDMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU3NzkyYTVhLWEzMjgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjU3OTEzLjYwMDg3LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731657913; x=1732262713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P8Hrw8EAqrC07Vd7mEbJ7oOBP+Bco3sPPhzDL5SOPr4=;
        b=Xw4YaztDY2JN+zOrjQoYa1vHiL2d+ubT8DBN6CQfptCca27MmdnkiOAx64rQxHNRE7
         pbItETLAiDCg56cBZtKWnyfI+S5tl5+Zz6I+rnh+AYyPm2lf7NSTnYALNZ69/sizW2jY
         DNK9IYBtQDwJ0fZFk8EXHAREr5B4ivJPBup9kJK3gToQ8lnnkMIlC7+FO2HxzcZhycTH
         90u9Aifv1JjQP2GBhlJKFnE5bLVhfaxep4GN2EoEiBKBO8lGCawR9KKl0PfURKHaVi+R
         mT48Fq4kMwVpz7k2G4Ml7SoUyFSd9AqH8wH22QJk5udgwBoqbc2RdHIoKiTaMJQ4XaTm
         qBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731657913; x=1732262713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8Hrw8EAqrC07Vd7mEbJ7oOBP+Bco3sPPhzDL5SOPr4=;
        b=h8EvmJGT0g91XMAAASIZ9ob/cY77TZu7Z2ZQZgfz0GBd+wYlzk29Hz36OadiwX2ESF
         xyJPdy3/q7cXtBdZKrD7lEsxzD3ujxIQ0yzMzrjuTzOCZMBYqpsnM/MjCpUA9WGcCGNX
         fn9eZ/cLgDLLOG8SqaQmtZIN2KWOivIgXk79WiHYm9HAl1ZbJY+J+xWfTJ8FtE7YFkM9
         DYg6LkfuegHqxQnPWFX0ls/m5r4sKizUJop9S+xQxwgrSwt67/h4O0lWt4iftS+MvA7s
         sZyURvDvy3ANHIz/xkcjxTUhhb68kSFCQgwiZL8ifK8l0UQt7vT0DNXpVC6Fo1vR3it1
         wqrw==
X-Forwarded-Encrypted: i=1; AJvYcCUU8uCDUQg3CB4f3233GrU5bG4ymQH703UhbSpvdiThSXP1dX8ZCE55LZFYJ4semi87XP2icYK3GPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS9+YjlRZYCcyXEl44p0m0wybDgehQTk3hT/yVL21PRx2k/nwY
	zdup0ZPrmW/fYjDT06KHSJZ5TkGw2YpAqoUzbuvUI9/0jdKIzXUu4zek4cqtXQ==
X-Google-Smtp-Source: AGHT+IERJewGmhbRQcV3zIs0BU6x9oYGUbEWoW+DjDanDHhB/Hh/kLAwIn6H32ITagk7RFcIws9jvQ==
X-Received: by 2002:a05:600c:4685:b0:431:47e7:9f45 with SMTP id 5b1f17b1804b1-432d9762455mr56348735e9.11.1731657912902;
        Fri, 15 Nov 2024 00:05:12 -0800 (PST)
Message-ID: <87a75956-dcc5-4bbd-90ff-b0b891c23859@suse.com>
Date: Fri, 15 Nov 2024 09:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
 <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
 <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
 <7aaa8eea-247f-43f5-9777-2a3431e0c1a0@suse.com>
 <b71986cbc487b68a8d6b31162bcefb8b3b7c2648.camel@gmail.com>
 <7555444c768edccee597dbb837edfe54a539722c.camel@gmail.com>
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
In-Reply-To: <7555444c768edccee597dbb837edfe54a539722c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.11.2024 17:49, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-11-14 at 17:30 +0100, oleksii.kurochko@gmail.com wrote:
>> On Thu, 2024-11-14 at 10:49 +0100, Jan Beulich wrote:
>>>>>> @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t
>>>>>> fdt_paddr)
>>>>>>  
>>>>>>      return fdt_virt;
>>>>>>  }
>>>>>> +
>>>>>> +vaddr_t __ro_after_init directmap_virt_start =
>>>>>> DIRECTMAP_VIRT_START;
>>>>>> +
>>>>>> +struct page_info *__ro_after_init frametable_virt_start =
>>>>>> frame_table;
>>>>>> +
>>>>>> +#ifndef CONFIG_RISCV_32
>>>>>> +
>>>>>> +/* Map a frame table to cover physical addresses ps through
>>>>>> pe
>>>>>> */
>>>>>> +static void __init setup_frametable_mappings(paddr_t ps,
>>>>>> paddr_t
>>>>>> pe)
>>>>>> +{
>>>>>> +    static mfn_t __initdata frametable_mfn_start =
>>>>>> INVALID_MFN_INITIALIZER;
>>>>>> +
>>>>>> +    paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>>>>>> +    paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>>>>>> +    unsigned long nr_mfns = PFN_DOWN(aligned_pe -
>>>>>> aligned_ps);
>>>>>> +    unsigned long frametable_size = nr_mfns *
>>>>>> sizeof(*frame_table);
>>>>>> +    mfn_t base_mfn;
>>>>>> +
>>>>>> +    if ( mfn_eq(frametable_mfn_start, INVALID_MFN) )
>>>>>> +    {
>>>>>> +        frametable_mfn_start = maddr_to_mfn(aligned_ps);
>>>>>> +
>>>>>> +        frametable_virt_start -= paddr_to_pfn(aligned_ps);
>>>>>> +    }
>>>>>> +    else
>>>>>> +        panic("%s shouldn't be called twice\n", __func__);
>>>>>
>>>>> As said on the v4 thread - I don't think this is needed. Aiui
>>>>> Misra
>>>>> would
>>>>> actually dislike it, as it's unreachable code. Just to re-
>>>>> iterate: My
>>>>> complaint there wasn't about this missing check, but about the
>>>>> function
>>>>> partly giving the impression of expecting to be called more
>>>>> than
>>>>> once.
>>>> I’ll revert this check, then. Would it be better—and
>>>> sufficient—to
>>>> add
>>>> a comment before setup_frametable_mappings() indicating that this
>>>> function should only be called once, to avoid any impression that
>>>> it
>>>> might be expected to be called multiple times?
>>>
>>> You can add such a comment if you like, we we have many functions
>>> of
>>> this
>>> kind. The important aspect - as said before - is that the function
>>> should
>>> not - nowhere - give the impression of possibly expecting to be
>>> called
>>> more than once.
>> Then I am not 100% sure how to deal with this impression specifically
>> in the case of setup_frametable_mapping() which should be called
>> once.
>>
>> The only options I have in my head are:
>>    Option 1:
>>        static void __init setup_frametable_mappings(paddr_t ps,
>> paddr_t
>>       pe)
>>        {
>>       +    static bool __read_mostly once;
>>       +
>>            paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>>            paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>>            unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
>>            unsigned long frametable_size = nr_mfns *
>>       sizeof(*frame_table);
>>            mfn_t base_mfn;
>>        
>>       +    ASSERT(!once);
>>       +
>>       +    once = true;
>>       +
>>            frametable_virt_start -= paddr_to_pfn(aligned_ps);
>>        
>>            if ( frametable_size > FRAMETABLE_SIZE )
>>
>>
>>    Option 2:
>>    
>>       -struct page_info *__ro_after_init frametable_virt_start =
>>       frame_table;
>>       +struct page_info *__ro_after_init frametable_virt_start;
>>        
>>        #ifndef CONFIG_RISCV_32
>>        
>>       @@ -442,7 +442,9 @@ static void __init
>>       setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>            unsigned long frametable_size = nr_mfns *
>>    sizeof(*frame_table);
>>            mfn_t base_mfn;
>>        
>>       -    frametable_virt_start -= paddr_to_pfn(aligned_ps);
>>       +    ASSERT(!frametable_virt_start);
>>       +
>>       +    frametable_virt_start = frame_table -
>>    paddr_to_pfn(aligned_ps);
>>        
>>            if ( frametable_size > FRAMETABLE_SIZE )
>>                panic("The frametable cannot cover [%#"PRIpaddr",
>>       %#"PRIpaddr")\n",
>>    
> Or your intention was that I can drop any check at all in
> setup_frametable_mappings():
>    static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>    {
>        paddr_t aligned_ps = ROUNDUP(ps, PAGE_SIZE);
>        paddr_t aligned_pe = ROUNDDOWN(pe, PAGE_SIZE);
>        unsigned long nr_mfns = PFN_DOWN(aligned_pe - aligned_ps);
>        unsigned long frametable_size = nr_mfns * sizeof(*frame_table);
>        mfn_t base_mfn;
>    
>        frametable_virt_start -= paddr_to_pfn(aligned_ps);
>    
>    ...
>    }
>    
> and it should be enough as this function by its nature shouldn't be called
> twice.

Indeed, that's what I was after.

Jan

