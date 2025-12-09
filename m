Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F32CB005F
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181670.1504697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxU9-0001LZ-11; Tue, 09 Dec 2025 13:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181670.1504697; Tue, 09 Dec 2025 13:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxU8-0001JN-Tg; Tue, 09 Dec 2025 13:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1181670;
 Tue, 09 Dec 2025 13:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSxU7-0001J1-6J
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:10:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f6f3b60-d500-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 14:10:29 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso74237585e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 05:10:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6fa0f6sm38928475e9.4.2025.12.09.05.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 05:10:28 -0800 (PST)
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
X-Inumbo-ID: 6f6f3b60-d500-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765285829; x=1765890629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HA3FsU1C68XXvu26OhGXA8OMdBn4esbuJPYmDzoaLv8=;
        b=IJSDO2cWkW8gat3mVGXPOPSOiFGhZYR8cAWCTws+69BiE2be34k4AAE6UQ9DJylCxh
         owQKuC4euPZpdeo89Hm20TEmfa/hYWDqrVLMkoeCI7A/MufjckHi7b6Pq3KkuYu0s3UO
         bgU/G8XVkoGUeCWA00qhzbpKxBlMT6UX/ETwFvync8kRWdtwzy1Nchge8LVjrHdW/RWF
         muD8/GG8HQAXpRHZXO1HdBkcDhASwBTnPDE9YMK7iXpPnXOVVMxMaHSgNjoGPoOrIuVs
         o8IH2ovc9HgEfSZAJsGYI0TjXhruNYaDWhKYA1YhaWbPVCWi7Rdwzs/GAaI3joXQ7Cif
         mAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765285829; x=1765890629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA3FsU1C68XXvu26OhGXA8OMdBn4esbuJPYmDzoaLv8=;
        b=PAPxvuwoc9RcbtBvq7aqJRRl5Odys7Y0m0z9MtBGwFBVonR6KOW475GKbPQn2WNTEn
         OC+ovQCaAxisCUfoRrJmCfuDEbnsv96pqZv92qD888JOdr5E9Kzhy86TTTpvRLcKoozn
         Z3dTeh87lpkaHBNpGn4ooIn2tm+MY8Butq3EwTHjPpEPJUkfohwtwO/BoHk99b9pdeNt
         wZuiNmr7AvQ8ms3n8MyG8dl/F7lr6+boF9t5Yu7JZdDS19IgiIzZ29SL/lN3CcqgHXOu
         SUC3voqhYENgkWZJU7bkEuSCPqyVjfRodgOKOK+kZmYyY2vctSIyJ75rmQlaqGJ8LWl4
         y1Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVzhhiz623sTWaldr7L7ej8Q+sbU+ZnAi8ffhz/jAh17C2sQoIyHeTO6Wd2sn9U6ijZQ1cXT4cDKyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzWZTTIRyGjRa6hjEunt/oF/p3G5mjZAigBQiVVJJjdwUgvHIg
	G8HFCauM1dcSjp2PA+gYyWGC6GlgugnCNnfjTNbpruiNUrU+QyWFFC2OE78VY7s2uQ==
X-Gm-Gg: ASbGncu3iz38Tjswmr5hAbnkBklKfbNBE3Vc7ZZJS4fBtD4UWYJshzy0c4eLiWqxKtx
	x/Kpyd7AxbKTcWTEy8qEWp6aRvUoQr4O7MEpp+cEz+vt21aJHgcLXP3UjswR97BYrAuFIIQuyKX
	Kf/hMDlEeQ3lpfO/7b6xLeto7RVmm8gfGRK7xbpITGuYIVcXE81ir3gobtT4NuYyDAVKoSfOWpw
	xSpbXcrQ9cij77IJH8MGZHv9LK49W/CTNYGDx+gQcKb66JWv/w2em9DpO2LI+U8bGrRcgdEFw85
	3m/F5OPEBgUHjiyS8Ry3DU76UOc3C0/IW5YBGX/JGwwA7jDC88mFaCLYAttnsF4i17LNEZ1dt2Z
	dAiBbbXn5kBuBDJfTOniN0K+jHRsT/kDxFwuYNLdP6JSU5hrrLdJ14NX5mv25k5snQwD7RRPR6G
	py+Pm/LbORTLyg5v+GSVxIrJNldmBXAV4/E0TCEL7/qkIjq/Uhz74s0DRx0UHyp2zEUMlUg2RhF
	Ms=
X-Google-Smtp-Source: AGHT+IFn3ByWj22LbrrkHtGuFUFZRdTaG72UeJuwXlKrWry1B9n4728g5eQXGmZcIis2wgWQXeyl9w==
X-Received: by 2002:a05:600c:a013:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-47939c8bc7dmr127482135e9.0.1765285829365;
        Tue, 09 Dec 2025 05:10:29 -0800 (PST)
Message-ID: <e5f14ae4-da8f-4897-9cb5-99fe40ed28ca@suse.com>
Date: Tue, 9 Dec 2025 14:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
 <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
 <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
 <f0da7ce3-1846-4865-8e66-bc3e50f78390@epam.com>
 <85cdb866-0be2-4204-b106-f66e2b15f841@citrix.com>
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
In-Reply-To: <85cdb866-0be2-4204-b106-f66e2b15f841@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 13:44, Andrew Cooper wrote:
> On 09/12/2025 12:24 pm, Grygorii Strashko wrote:
>> On 09.12.25 10:59, Jan Beulich wrote:
>>> On 08.12.2025 20:21, Grygorii Strashko wrote:
>>>> On 08.12.25 14:44, Jan Beulich wrote:
>>>>> On 28.11.2025 16:22, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/pv/domain.c
>>>>>> +++ b/xen/arch/x86/pv/domain.c
>>>>>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>>>>>                goto undo_and_fail;
>>>>>>        }
>>>>>>    -    domain_set_alloc_bitsize(d);
>>>>>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
>>>>>
>>>>> You mention the change in condition in the revlog (but not in the
>>>>> description),
>>>>
>>>> The updated chunk was based on snippet from Andrew [1], which
>>>> used incorrect condition - I've changed it and noted in change log
>>>>
>>>> [1] https://patchwork.kernel.org/comment/26680551/
>>>>
>>>>> and I'm having trouble to follow why ...
>>>>>
>>>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>>>> @@ -1119,26 +1119,6 @@ unmap:
>>>>>>        return ret;
>>>>>>    }
>>>>>>    -void domain_set_alloc_bitsize(struct domain *d)
>>>>>> -{
>>>>
>>>> The domain_set_alloc_bitsize() inlined in  switch_compat() and x86
>>>> PV domain
>>>> always created as 64bit domain.
>>>>
>>>> At the beginning of switch_compat() there is:
>>>>
>>>>    ( is_pv_32bit_domain(d) )
>>>>           return 0;
>>>> [2]
>>>> above ensures that switch_compat() can be actually called only once
>>>> (at least it can reach
>>>> point [2] only once, because there is no way to reset PV domain
>>>> state 32bit->64bit
>>>>
>>>> this is original condition which says:
>>>>>> -    if ( !is_pv_32bit_domain(d) ||
>>>>
>>>> do nothing if !is_pv_32bit_domain(d)
>>>>    - for inlined code is_pv_32bit_domain(d) == true, so
>>>> is_pv_32bit_domain(d) can be ignored
>>>>
>>>>>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
>>>>
>>>> do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
>>>>     - inlinded code should proceed if this condition is opposite
>>>>       (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)
>>>>
>>>>>> -         d->arch.physaddr_bitsize > 0 )
>>>>
>>>> do nothing if d->arch.physaddr_bitsize > 0 (already set)
>>>>     - inlined code will be executed only once, so
>>>> (d->arch.physaddr_bitsize ==/!= 0)
>>>>       can be ignored
>>>
>>> This is the crucial point: It being executed only once isn't spelled out
>>> anywhere in the description, and it's not entirely obvious why that
>>> would
>>> be. Yes, nowadays it is. Originally (iirc) one could switch the guest
>>> back
>>> to 64-bit mode, then again to 32-bit.
> 
> I changed it in 02e78311cdc6
> 
>>
>> I'll update description.
>>
>> Or can add it back as !d->arch.physaddr_bitsize to be safe and avoid
>> confusions?
> 
> Please update the description.  The function really is singleshot now.

+1

Jan

