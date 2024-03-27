Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E086C88E2FB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698535.1090312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTUN-0001SM-Tb; Wed, 27 Mar 2024 13:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698535.1090312; Wed, 27 Mar 2024 13:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTUN-0001P9-Pn; Wed, 27 Mar 2024 13:38:47 +0000
Received: by outflank-mailman (input) for mailman id 698535;
 Wed, 27 Mar 2024 13:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpTUL-0001NX-Ox
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:38:45 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 544539e4-ec3f-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 14:38:43 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56c0a249bacso4465110a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 06:38:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q16-20020a170906389000b00a46a643b6fbsm5541812ejd.15.2024.03.27.06.38.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 06:38:42 -0700 (PDT)
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
X-Inumbo-ID: 544539e4-ec3f-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711546723; x=1712151523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uUmin0KeCmk79N0Qye7ojgvhlwlJRFIwI/Z9TBSx4QA=;
        b=Nt90FTvnxQpMqFawB1B0TllAb272njSNXFlbminWSUsD1hUDE9G044ilgFXM5U0TLC
         Z6JCHIBwg65E427Yg0dj6x2dnO2eO+hz+mkFgu0B5UmGCfZ6HebHPbc1xg7w8KxePpJg
         Ka9Q653MgIgxCbo1NN9LupTXNqacMOHnv6brG6OY6f3uu1HdCpoG+ZevRV6gftaLtQX6
         Ez+Fsk1h1m7lugECnSF0mcLO1TIcwrSqkL14C5l2ou+6SgLzBQUfnkKgDV+P2Niw9njy
         Vgf0xVBV3COLG2hTm0o2S9hpGgKr1SsAaIdDKog2021n+LcF1Vc6l2XjrHwtMPRf3NJM
         i0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546723; x=1712151523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUmin0KeCmk79N0Qye7ojgvhlwlJRFIwI/Z9TBSx4QA=;
        b=qB/6+UY5VwCAqgU99jVQkApcavGgv7KoVD77HBbXsnRVT9g93ccxZe/uRbrc/lEE04
         ERS+4JAHEEw7nbGRpZ67gLgGsg1E1wYAfS1xlLPOd+2OMXSGT2DiAkIe1wNhL4dZgsxL
         e2dp/Yz8dGGCTz3ueXiehN7rOGjQvvIlEmo8zQn53CF8NSLgSoNplJuCVRENqmdZVMBA
         Ycbm29D1z8e1WMyrC61BhRdlHCU+4lLEhktL4qOfyg3y2LtL8FKvXZmZ5VjKwvwWS4kI
         Bz2aZNPx5C2qcmXgcc+WTTbSElxpdLWndu1w6JQFTesAfhpyEj45dNUsz9Zca6hf9PRe
         FG6w==
X-Forwarded-Encrypted: i=1; AJvYcCVqX0H4JxdVyCzX5QwV+5zFybdOxbt2InHZfvaWTTaguk0GB0FeMAJ2CSSyWXW0iHn40Y5cgZEUSrjM2RYOt8b4Dn1wdPsNqt4oXm41rAI=
X-Gm-Message-State: AOJu0YwgVX6U4g2O+QFRoK/Ap1DatV0m7/TjTAuaoJsstiCk9ORWO0kc
	2UuK2t+JgBMvE1axO63C2rx3XQIoEfSNIoSqiIgwDZta0182MpeyPuw3upHgHA==
X-Google-Smtp-Source: AGHT+IGe2fmggLZTVfGQtYqtvXX+zl3Pwthf2wm5kE+k5y5ORxQNWlhdmkw/G6OCcn5Y94yKy6CrOQ==
X-Received: by 2002:a17:906:16c5:b0:a47:3526:2e0f with SMTP id t5-20020a17090616c500b00a4735262e0fmr843890ejd.75.1711546723186;
        Wed, 27 Mar 2024 06:38:43 -0700 (PDT)
Message-ID: <fe433260-c8c9-419d-8b05-50e2cc50d127@suse.com>
Date: Wed, 27 Mar 2024 14:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-9-carlo.nonato@minervasys.tech>
 <3f615066-a792-493f-ba33-7667a6557c23@xen.org>
 <9e0f7ff3-5457-41e4-a1e4-bf75804fb900@xen.org>
 <255be735-f9fe-4e39-a24e-2f6aff91acc5@suse.com>
 <CAG+AhRWMh2quv3SNPJQ61au=e6gtdXUO7j-XVYV6chDmktqkvA@mail.gmail.com>
 <3427132d-9458-4447-b667-d2ef3c1f0569@suse.com>
 <CAG+AhRXE7cMNnDNxZeF=o7wBXKUtwvMj6Y5oRy-UrpDyAfM5Cw@mail.gmail.com>
 <f7bde6a7-1e48-4074-b8f5-094fa0d6a593@suse.com>
 <fbc17f7a-b07d-4508-902f-9fc021bc9a19@xen.org>
 <CAG+AhRW2=kaxsAJ6JO+j6xy4C8Mv81j9hb=muZKT30O+Zdp0Vw@mail.gmail.com>
 <54156e94-3630-49b1-8a22-5cd4206d565f@xen.org>
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
In-Reply-To: <54156e94-3630-49b1-8a22-5cd4206d565f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 14:28, Julien Grall wrote:
> Hi Carlo,
> 
> On 27/03/2024 11:10, Carlo Nonato wrote:
>> Hi guys,
>>
>>> Question is: How would you justify such a change? IOW I'm not convinced
>>> (yet) this wants doing there.
>>
>> You mean in this series?
>>
>>> Looking at the code, the flag is originally set in
>>> alloc_domheap_pages(). So I guess it would make sense to do it in
>>> free_domheap_pages().
>>
>> We don't hold the heap_lock there.
> Regardless of the safety question (I will answer below), count_info is 
> not meant to be protected by heap_lock. The lock is protecting the heap 
> and ensure we are not corrupting them when there are concurrent call to 
> free_heap_pages().
> 
>  > Is it safe to change count_info without it?
> 
> count_info is meant to be accessed locklessly. The flag PGC_extra cannot 
> be set/clear concurrently because you can't allocate a page that has not 
> yet been freed.
> 
> So it would be fine to use clear_bit(..., ...);

Actually we hardly ever use clear_bit() on count_info. Normally we use
ordinary C operators. Atomic (and otherwise lockless) updates are useful
only if done like this everywhere.

Jan

