Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD769D988B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 14:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843745.1259355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvd5-0000CL-6Z; Tue, 26 Nov 2024 13:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843745.1259355; Tue, 26 Nov 2024 13:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFvd5-0000AQ-3x; Tue, 26 Nov 2024 13:29:23 +0000
Received: by outflank-mailman (input) for mailman id 843745;
 Tue, 26 Nov 2024 13:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFvd4-0000AK-7h
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 13:29:22 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c61c7e-abfa-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 14:29:19 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa549f2f9d2so327306866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 05:29:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b3426f3sm593519766b.87.2024.11.26.05.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 05:29:18 -0800 (PST)
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
X-Inumbo-ID: 70c61c7e-abfa-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcwYzYxYzdlLWFiZmEtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjI3NzU5LjU1NTgyNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732627759; x=1733232559; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g2rbhV4mFP9sJuLroiEfu3GffwJWWkyiE/7UXor4wC8=;
        b=cKXDvyW5HSHEMZzKAO0jhLLhHprmonW+NpR0NsWtl1SnMM4w457Cffhbk8d846IsJ+
         WyXOX8POfjoVaJFWaKIwhGl/IEF2tBbdHGZeUkcqruC412dhCMeychHuIYnnLZBvo90u
         XNiJce6zoAJv9m6gZvragcT/PH58knhb4NMZVgbRwAaROAbmm/bjw3/bZtiw9AgyykZb
         87s15Y1iXE2k0GNnH2rVd6TS7Hj8dljcMfG5ydHflFtIF+7wcpq7pPU2iQAuQWaJbpE4
         aiti0x64QGYM25E1V0q/Jemgx/dxhB/J9iHl0ul0XQsKRLJj1Aohid0F8efVi8Fdl73G
         OBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732627759; x=1733232559;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2rbhV4mFP9sJuLroiEfu3GffwJWWkyiE/7UXor4wC8=;
        b=dGhd04suCDnmFUwMbyBiAS1e8PlZR3+3Jb/GtEB1I3Xsfm0sCKYgXWZMKXGtg7B/Yi
         uiCUE5VAFUGT0A/C/xuHVVLQK5knCzoKy2ROolmYEQ/cLMKRx/qlta8vWVrQmIJS874G
         Y9sLrwmtD10NXBXkh/3Fe8HRIvHhEcDqSZ5WqJJTtOoCC6ivP8uXeTFf5wk0U5xOI/R+
         Kh6a0JTKy0bHYSsOGD/8M/Useddo2V55eRyTKhP+cfoKRtZOSbGR+clwCVZ1SSgbrYDH
         QUapkERUvAuzu/0mIw5FIqnHGGdfgetnBFDPDadjLPDFRs/uax/I5+ydPln2GtWCwYmC
         zlWA==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ39KQN6oPcYGbi7K9U7uxqEadt0xn8tonmLViaKdhrbiwXVRkv6epcniG6rFEwPdYufLGMdyDeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIWdLGYRXNcmZ3UJeo4zry0UBXZ+M2zcK8micUSDgZcU2U3z7p
	L9nUUVIL7OsqUluxUAFZzZ1RKpp2UXNiuBnPcWxkXAXR3TBlaGTiNU+enveModk7YCYu6nu0HDw
	=
X-Gm-Gg: ASbGncvQXRwmfGCkfxYAedd4xSnbRLl3rR2ihlJfKx8AnqbDtq/XugdfSDz5aiKrIbK
	dHfojY42YYRLE5wJO3v7UCBL3GsFzL0tqj/HZVpJr9bE1PpIhWcuEP8us+wl6xOe09mr0CxUb41
	q5QWzSSiBtGdJabdjdaXJgFM9p33IMZGsm9U4rRj9QZrS4TnY0x06aRlzkJe+kTYUFX1/4fPxwv
	Rq2v1zBBuEobd0ytwKJ/0/zfKBkdxPg7M6nexfOn0zKIYlGGx2cFgbmzK54kt/Y3W36XNwm61Vv
	A2lrA+kGoqY1eK3jiw4fkCNG61M7/0RU8is=
X-Google-Smtp-Source: AGHT+IFNNNXWuknww/qnw1xvHI3E+VvD9tcuBIHulnC0NVykiUdhflPznf8i1Gh0DgUh1ZIL9f46Cw==
X-Received: by 2002:a17:906:30ce:b0:aa5:26ac:18d6 with SMTP id a640c23a62f3a-aa526ac1a4bmr1263690466b.43.1732627758993;
        Tue, 26 Nov 2024 05:29:18 -0800 (PST)
Message-ID: <7cc9ad6f-e5f6-444f-994c-b176a93cfb29@suse.com>
Date: Tue, 26 Nov 2024 14:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
 <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
 <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
 <7761CEB9-2304-4588-9ADE-C81B9A5E536C@arm.com>
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
In-Reply-To: <7761CEB9-2304-4588-9ADE-C81B9A5E536C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 14:25, Luca Fancellu wrote:
>> This reads better, thanks. Follow-on question: Is what is statically
>> configured for the heap guaranteed to never overlap with anything passed
>> to init_domheap_pages() in those places that you touch?
> 
> I think so, the places of the check are mainly memory regions related to boot modules,
> when we add a boot module we also do a check in order to see if it clashes with any
> reserved regions already defined, which the static heap is part of.
> 
> Could you explain me why the question?

Well, if there was a chance of overlap, then parts of the free region would
need to go one way, and the rest the other way.

>>>>> --- a/xen/include/xen/bootfdt.h
>>>>> +++ b/xen/include/xen/bootfdt.h
>>>>> @@ -132,7 +132,6 @@ struct bootinfo {
>>>>> #ifdef CONFIG_STATIC_SHM
>>>>>    struct shared_meminfo shmem;
>>>>> #endif
>>>>> -    bool static_heap;
>>>>> };
>>>>>
>>>>> #ifdef CONFIG_ACPI
>>>>> @@ -157,6 +156,10 @@ struct bootinfo {
>>>>>
>>>>> extern struct bootinfo bootinfo;
>>>>>
>>>>> +#ifdef CONFIG_STATIC_MEMORY
>>>>> +extern bool static_heap;
>>>>> +#endif
>>>>
>>>> Just to double check Misra-wise: Is there a guarantee that this header will
>>>> always be included by page-alloc.c, so that the definition of the symbol
>>>> has an earlier declaration already visible? I ask because this header
>>>> doesn't look like one where symbols defined in page-alloc.c would normally
>>>> be declared. And I sincerely hope that this header isn't one of those that
>>>> end up being included virtually everywhere.
>>>
>>> I’ve read again MISRA rule 8.4 and you are right, I should have included bootfdt.h in
>>> page-alloc.c in order to have the declaration visible before defining static_heap.
>>>
>>> I will include the header in page-alloc.c
>>
>> Except that, as said, I don't think that header should be included in this file.
>> Instead I think the declaration wants to move elsewhere.
> 
> Ok sorry, I misunderstood your comment, I thought you were suggesting to have the
> declaration visible in that file since we are defining there the variable.
> 
> So Julien suggested that file, it was hosted before in common/device-tree/device-tree.c,
> see the comment here:
> https://patchwork.kernel.org/project/xen-devel/patch/20241115105036.218418-6-luca.fancellu@arm.com/#26125054
> 
> Since it seems you disagree with Julien, could you suggest a more suitable place?

Anything defined in page-alloc.c should by default have its declaration in
xen/mm.h, imo. Exceptions would need justification.

Obviously a possible alternative is to move the definition, not the declaration.

Jan

