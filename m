Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BBB1C593
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 14:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071713.1435121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcvX-0003PA-BT; Wed, 06 Aug 2025 12:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071713.1435121; Wed, 06 Aug 2025 12:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujcvX-0003NJ-8A; Wed, 06 Aug 2025 12:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1071713;
 Wed, 06 Aug 2025 12:07:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujcvV-0003ND-MY
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 12:07:25 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9b5c9ab-72bd-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 14:07:24 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-615c8ca53efso11129732a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 05:07:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e88desm1102581166b.71.2025.08.06.05.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 05:07:23 -0700 (PDT)
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
X-Inumbo-ID: e9b5c9ab-72bd-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754482044; x=1755086844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bg4Hlq8eMf5BBiYt+5Z1rb387mmQ1h5mlw/QsNfBPwA=;
        b=LhmmU4ocRuG9rDP6FVVSYeeLkPjUq8m8J0sfQ6ZJV6Qe1jdmM0C3j0VuX8FoJToEPU
         4nc8USUDJ5hyzP9OkQWmcWrTN2ppY14uBHZYZmNajWnhkHCPL9b2BZSpQYZD8GRl6qUH
         693q86R/mRC0+JHEMGkh6SAOTwJzIaslMoICqvPo8PwRmv/d51qMwd3I90Ff0/gDAZBy
         ZWvQIfNj8ipsii3FEN4kaKDzs00dWYrnBu7JLAxMmg+w+3Dll2QOPhJHAA+DVfYdlXlG
         eE/ILnZjmr61o0V6rPWH2Wd++NGlqhgQOKhx9o08FM5MyETtGU+z9p+gHiPZi4/SkslF
         WwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754482044; x=1755086844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg4Hlq8eMf5BBiYt+5Z1rb387mmQ1h5mlw/QsNfBPwA=;
        b=WHbddyopLK45/pMVx71sCrlzqgAIh3ExsIX9nKXvSh30fVg0M+cSJd2Pqtu5M+Ifg/
         ri/s4LJ2IgCugZhzSc8RDbVk6ByYeR/ETBzZTrVRhjKB3r9M6vqNhd4eW+WDE5oMpE54
         t4SrK6NhoKiFy/BtX5EESsp6avk68718GTRzk2HflDVJFYXar791AmhSv/HPG0sx3aab
         WocyvoIyyY/z/2LR8EsgWjaI+UjPcxn6+TtL5Z8nmzX25adcWaCULiIrcKyU3nnSHetJ
         EYm5nKGWGYBNThaeThrcgqh8jjwpiYWJ0rqB+5z884Rk2ukLFuMth+Nh1Pux8Mb3I3Ay
         kBBA==
X-Forwarded-Encrypted: i=1; AJvYcCXspONw95LeScaOEf62vS+ZpdmrKxS6A8bnEinRGDaQO3yfeToGQD4ZUGzUffbdWs1QcG92rVN99OU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyfUFGAdAvIMjlGZltK+4CmWGwDJHlQ21cv72SSj07yTwbN4Nt
	WfP0rbgFm3zrmKIZiGg+tjhmE+iy2FJcYfLtGleUO13fyE0OUkpbE+E/5U/rYyNkhQ==
X-Gm-Gg: ASbGncsfyWAQZ13tnn76KNdgALPkzDpNwYDj4iOLtQLjJwKoAdlH+GjQxr0HNydfAr8
	OXX6CAe03q+ykURX97PNupltgLWj34PoX3Bsn5ULyM5aU7giLL8WgG8+qJfCPNoiAqdRwqOqkDI
	vLWanlA/scoep6YdV1dRiAS4fq2zB6Hd7hRwTqvwjMW4rjm+ihdOBgyXzkTsyvBv02wcYh6GVhB
	xUf72JHct/QIvbIImcBZiz5Pn2rrceBpy2eKIsnhfChxnlKc8iLWCr5Dap6eXiHl+hom46DXwk0
	o7Fuz3dnJnDnAfECckNJkFQ/LNJNNTekc9v8ldyFEr4Yupq53Rwu2yLZNGv/bQqpIomWmrWDYnh
	GbJ0LTJsfDIqXn+KESypxZiwsznvlpKoxUw2Qfnsb/tQtL3ChhNSfR53zecK1B3trgfVVe9mL0R
	I26y9p/bg=
X-Google-Smtp-Source: AGHT+IHPGFnQZeqpL9f16JwmJfpa6q09n7SJJDYH/qO0dC8znAIUEz1CsAXcVbiQ3DGfD0Lt9qUIhQ==
X-Received: by 2002:a17:907:985:b0:af9:8438:de48 with SMTP id a640c23a62f3a-af9903547ffmr241733666b.48.1754482043885;
        Wed, 06 Aug 2025 05:07:23 -0700 (PDT)
Message-ID: <9f306465-48c0-4b76-8778-0ffc5ce0c444@suse.com>
Date: Wed, 6 Aug 2025 14:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <4e7de8ffc929c1bdfa28b40fdd31b814acef103c.1753973161.git.oleksii.kurochko@gmail.com>
 <ae570c32-e6d0-4131-af2b-d6984ff92750@suse.com>
 <858f52de-8ca4-4b93-b565-2e943523c526@gmail.com>
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
In-Reply-To: <858f52de-8ca4-4b93-b565-2e943523c526@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 14:01, Oleksii Kurochko wrote:
> 
> On 8/5/25 12:40 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> @@ -30,3 +34,18 @@ int p2m_init(struct domain *d)
>>>   
>>>       return 0;
>>>   }
>>> +
>>> +/*
>>> + * Set the pool of pages to the required number of pages.
>>> + * Returns 0 for success, non-zero for failure.
>>> + * Call with d->arch.paging.lock held.
>>> + */
>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>> Noticed only when looking at the subsequent patch: With this being ...
>>
>>> +{
>>> +    int rc;
>>> +
>>> +    if ( (rc = paging_freelist_init(d, pages, preempted)) )
>> ... a caller of this function, the "init" in the name feels wrong.
> 
> I thought about paging_freelist_alloc(), but it feels wrong too as it sounds like
> freelist is being allocated inside this functions, but what really happens that
> pages are allocated and just added/removed to/from freelist.
> 
> Maybe something like paging_freelist_resize() or *_adjust() would be better?

Yes; whichever of the two you like better.

Jan

