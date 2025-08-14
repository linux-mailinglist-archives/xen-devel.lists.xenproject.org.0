Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FCB25C18
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 08:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080751.1440962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRj8-0004wN-VS; Thu, 14 Aug 2025 06:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080751.1440962; Thu, 14 Aug 2025 06:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRj8-0004u5-SG; Thu, 14 Aug 2025 06:46:18 +0000
Received: by outflank-mailman (input) for mailman id 1080751;
 Thu, 14 Aug 2025 06:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umRj7-0004tz-6N
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 06:46:17 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f7c32a5-78da-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 08:46:15 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so833353a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 23:46:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm23273099a12.57.2025.08.13.23.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:46:14 -0700 (PDT)
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
X-Inumbo-ID: 5f7c32a5-78da-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755153974; x=1755758774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D51Dl1Hui5oW/P3mi1h17sLsDXKyeUTd6NjKaNWBmuw=;
        b=QLOfCcdR7415rU6gJMyHxjtRi8a+zfq50rcvW/cY3ospoN4eoQvOfOfA+ZUKSCR9KH
         Wbi0CuOMBvTPhFMnzhIsahIzCir2E6Q31uNNz0y5Ug8+rngd9V8d7Wenf0gjYPDhyQ2d
         guEykSJKoKnXbap1Z458wZfVskOjshTPQzcm8tCqQtLjWE19CnWloV2BYu5V4eZ37DFH
         650s8ZNqSLJuDY3aAqUEJf2L4ldRTPl0yK8T+5HI5EYtqebF3xCqVtJ1TeCwDBghiOQq
         nLerssnGiLWaZok9C5qsaKIN5oIsHYKN8Gb2e2CPY54R3oj6vrwyzuLJoY7VXejeTVKV
         w5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755153974; x=1755758774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D51Dl1Hui5oW/P3mi1h17sLsDXKyeUTd6NjKaNWBmuw=;
        b=lGtKgqpnR40yaWWWW6frNBXJD3LOPLFnD52SRsUCExGyIdA1BR5ZDu+zemMI1TnXWR
         e680YuS4pkSMCVzHsqjWZpH/rAMfxHJOLGcyFfTBw756LtIz300vdwNtMU3pCAcyXTWI
         73ETA6EErex18F5KBXNy4LPzDuGOsgIMG0PTS+m6eH7dEW2/7KDxj7GRT4vS4BQ1elPQ
         1Vh7L3JTbFFZTy7Hz5Yw0+Hsu4OWmQDMjFSef1TJP/WoeetWa1unSMYLEv4K6m6n3wpR
         zZzH01RKG/ay4O5a1S8+bFBQmURWP4t7/qT4wxQcUtNuec1UVHbIGbBvzFEtk/IAGgQ7
         IojQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwHBAX3qA10lsrJyCMbAqtt/Am8HOlK+tkJ3YdxFutCjdFW4fN2SYLe3V7OhB0F9rt2qTOepdVYN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVoGYqM13/tv0MsBq0LeeV0oYn0JRLz9z7NOz3uU3osjZBIYW5
	zFov1/QHmA2fbrEB8ZA+0/V2u38J/qEaYE7tpgSA7jz5x1AduOOcoxAaJIMdYVMw+A==
X-Gm-Gg: ASbGncuidHvMzUQGAm+l9HuJuj25Sz173MBLaSiO80BDeuNnxxflZ/pxPBAvQEMXeFj
	YvuP3EXBAMOO61MHWYzKYwgANdR398WOrfSjr5HC4bXHxbFnF9qHdQZf0G7E4mzhA7/idDRZReR
	6WpKKAU7FHvyJIBJmsOgWCRu51S5wcrbo+fJy2h0gceFF+wEp5Yvl/mlfHo91JJx7xz9fZ17jm7
	twIyturyMRSpRZgv9YemtMe4rG02bFSpnsu+Nx3B+rnoYeSgeJETDiSuYEK1A89ytvBscEP5DIX
	e+nAi4eUF765lrpZu+IePZrPe1dmXfsAL1R3leibtlRaGAAMKR84JvExQ9xYOKZcNM2KbMSXy0k
	NyMFTHQ6RT+aeRXj9HJqd7I8V5lzLROn/wuSIKOM6KAlcwlB5VGL1I2eVdKMiULLMTdmz+57cyu
	v51dBdyAjlIPC6mPahMQ==
X-Google-Smtp-Source: AGHT+IHQ6/LxzRf/tS+ri4Jz39XxuAbsZkqhvwrm+bDr2KCbQKGASWXl7SEj7RTIOC/9rMz5t9l30Q==
X-Received: by 2002:a05:6402:274d:b0:618:2733:1a52 with SMTP id 4fb4d7f45d1cf-6188b9a43f1mr1467986a12.8.1755153974363;
        Wed, 13 Aug 2025 23:46:14 -0700 (PDT)
Message-ID: <2d93e9a7-abef-4ef6-bcbc-9081661edb58@suse.com>
Date: Thu, 14 Aug 2025 08:46:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
 <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
 <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
 <9f9f24f0-c16a-4f55-b3c2-a3f4b485c403@apertussolutions.com>
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
In-Reply-To: <9f9f24f0-c16a-4f55-b3c2-a3f4b485c403@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 02:29, Daniel P. Smith wrote:
> On 8/12/25 02:12, Jan Beulich wrote:
>> On 12.08.2025 02:19, Daniel P. Smith wrote:
>>> On 7/23/25 09:39, Jan Beulich wrote:
>>>> Use the more "modern" form, thus doing away with effectively open-coding
>>>> xmalloc_array() at the same time. While there is a difference in
>>>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>>>> code really cared about such higher than default alignment, it should
>>>> request so explicitly.
>>>
>>> While I don't object to the change itself, I think this description is a
>>> bit over simplification of the change. If the allocation is under
>>> PAGE_SIZE, then they are equivalent, but if it is over the page size
>>> there are a few more differences than just cache alignment. It
>>> completely changes the underlying allocator. I personally also find it a
>>> bit of a stretch to call xmalloc_bytes(size) an open coded version of
>>> xmalloc_array(char, size).
>>
>> My take is that xmalloc_bytes() should never have existed. Hence why I
>> didn't add xzmalloc_bytes() when introducing that family of interfaces.
> 
> Right, which would be a valid argument for replacing it with 
> xmalloc_array(). Though, I would note that there is an xzalloc_bytes(). 
> My concern was that you stated there was an open coding, which had me 
> expecting there was a line of the form, xmanlloc_bytes(count * 
> size_of_something bigger), being replaced by 
> xvmalloc_arryay(something_bigger, count).

Both fir this and ...

> IMHO, while the C spec does specify char as 1 byte and thus 
> interchangeable, I would agree that from a contextual perspective, 
> xmalloc_array() is the more appropriate call. The use of the allocation 
> is a character array and not a chunk of bytes for an arbitrary buffer.

... for this: Hence my wording using "effectively".

>>> With a stronger description of the change,
>>
>> So what exactly do you mean by "stronger"? I can add that in the unlikely
>> event that one of the allocations is (near) PAGE_SIZE or larger, we now
>> wouldn't require contiguous memory anymore. Yet based on your comment at
>> the top I'm not quite sure if that's what you're after and/or enough to
>> satisfy your request.
> 
> The phrasing stronger was meant to be more clear on the change/effect, 
> specifically that the underlying allocator is being changed when the 
> allocation is greater than a PAGE_SIZE. Not necessarily a long 
> explanation, just the fact that the allocation will be coming from the 
> dom heap allocator as opposed to the xen heap allocator. There are 
> implications to changing the allocater, e.g.,  at a minimum the 
> allocation order and nonphysical vs. physically contiguous effects. 
> Having it noted in the commit makes it more obvious what this change is 
> actually doing. Which may not be obvious when seeing the simple line 
> changes occurring in the diff. Later, if there is an unexpected 
> consequence caused by this change, a stronger commit will be helpful 
> with the bisection investigations.

First: I don't think each and every such change (there are going to be many)
should re-explain the switch to the xvmalloc() family of functions. This is
already stated clearly at the top of xvmalloc.h: Over time, the entire code
base is meant to be switched.

Beyond that, to achieve the stronger wording you're after, would it perhaps
suffice to have the first sentence say "..., thus also doing away ..."?
Otherwise, may I ask that you please make a more concrete suggestion?

Jan

