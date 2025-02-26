Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BBA46305
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896753.1305509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIWb-0006hO-6y; Wed, 26 Feb 2025 14:36:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896753.1305509; Wed, 26 Feb 2025 14:36:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnIWb-0006ff-3g; Wed, 26 Feb 2025 14:36:37 +0000
Received: by outflank-mailman (input) for mailman id 896753;
 Wed, 26 Feb 2025 14:36:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnIWa-0006fZ-2e
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:36:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1419100f-f44f-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 15:36:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so43029145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:36:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b591sm24475015e9.6.2025.02.26.06.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:36:34 -0800 (PST)
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
X-Inumbo-ID: 1419100f-f44f-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740580594; x=1741185394; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IjKqxD6G3KD6g5YrviTD+8jL/Tf+30e9/VjAQuiPHG8=;
        b=dwP1SUQzrHPL6UxwEqAwaMNEETPYDwSaFw+bCFgf1t8KO9X1AIV2d9JU//YojMrI0W
         ZHW2XReI2vFJmwX1B4lQIZRIzkoeBOfKuRqSMIn3FuWbbBiE1BYcD6LbJBP3IA1xs0Ce
         tT2sNMzLavpABi09UNycGi8MGZtAf/O+HUe0CUA6ExxWOnwxPRyz0tRwQeiXH2nh3/6E
         ma4ORVLwmKQn8LP13LHHQGmcYGkLdz7rX3IKzZbRELP705LiY/igOrkaBWekuXe/Zovh
         sYH92YWxRremMCFanWTv2U/1WngQ6cIfSE3jcWWl/P9Vs9jN5o516hFKTwS1VlLf6y0v
         V3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580594; x=1741185394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjKqxD6G3KD6g5YrviTD+8jL/Tf+30e9/VjAQuiPHG8=;
        b=Jw152cxHhKpDhZAdWv1P9M5jXLSCS6lCIj6N1egiQji7s5VIvKAAG3i96kL5xxb84E
         wf3kSTuj1mgc56lVOwwwLdm5Ot93H9gf3NA2Bl3tWpcW+oZEr1oP5X0tIyG0G73ELFRB
         kKu5F6L7FFRaqHEK5lUM5uBZ4HO3zOBXOPT8SVLKG3kpY7RNzokzSkmSFPaktc/KbbMM
         z3luY9ZSNIfAhmafsvjP2LG9NCBoZGTPw4PFTI2e5xmkmHc87jEn4X+5k8lSZFg+FRWp
         JVA/qrx9eZ54fU/UBtegJbxgdJE7NDUvye42MTh6EBr24/huqRqWDjKSugs7Ec+GXhKL
         iZPw==
X-Gm-Message-State: AOJu0Yx4NZkAGqyCf3HwOQC7v892CeK/6s/T3gISmDBs+ASn+3QRuDtx
	8uqCY+2KZp761fHSiXcNzJjiBdPP8k+yG2TK9Wf/KBfT17FNgzdzHeqhHMDpyQ==
X-Gm-Gg: ASbGncvN3jc5keJtJgw4B/Avil2MVQPZoeKGQiCAyBk4wn2Zi4QWa7oUZMKI27RTDu7
	vFG4iAt+9woU1qLJMhvQc8HaXFqsLUmL59h1hIceSaAy38Avh+aVu4/D2WtJk2XLhuPSRPjGIWQ
	rVUeYuMrS/r4zxJadN1SZQ11Bq/67QB9gxdVC6uBm0mPSWadVcb7+cHi2RT+i8V6mGlC0Yj668Q
	CXGU6mLkfYeXh1UWU9WZzCLrnMFxot3bQpRFIRZ45pqUkQPjZDBWvH82ZGLd1ELz1p+VTh2awPq
	05PeBbXBiGk87ptBmwRhmHit8CtlHnOofAUfmnKn3QvEFZd03HBvL86+fBH1Jx17nHYyoxxrlaL
	aW6Va33wIsag=
X-Google-Smtp-Source: AGHT+IHL55gaBL0DdF2pxtoq64HZs+4zzY67oKFp94IXWc/gtgxLj6Y3NMgbbtTst4bR3I+Hx6V+Tg==
X-Received: by 2002:a05:600c:5487:b0:439:9863:e876 with SMTP id 5b1f17b1804b1-43ab75011bbmr38650155e9.24.1740580594348;
        Wed, 26 Feb 2025 06:36:34 -0800 (PST)
Message-ID: <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>
Date: Wed, 26 Feb 2025 15:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <Z78djoAU7vjGepjr@macbook.local>
 <a9d4384c-770b-4947-b099-cf4bba1583a5@suse.com>
 <Z78lJfzqH9btDMrM@macbook.local>
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
In-Reply-To: <Z78lJfzqH9btDMrM@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 15:28, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
>> On 26.02.2025 14:56, Roger Pau Monné wrote:
>>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>>>>  
>>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>  {
>>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
>>>> -
>>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>>>>      d->tot_pages += pages;
>>>>  
>>>>      /*
>>>> -     * can test d->claimed_pages race-free because it can only change
>>>> +     * can test d->outstanding_pages race-free because it can only change
>>>>       * if d->page_alloc_lock and heap_lock are both held, see also
>>>>       * domain_set_outstanding_pages below
>>>>       */
>>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>          goto out;
>>>
>>> I think you can probably short-circuit the logic below if pages == 0?
>>> (and avoid taking the heap_lock)
>>
>> Are there callers passing in 0?
> 
> Not sure, but if there are no callers expected we might add an ASSERT
> to that effect then.
> 
>>>>      spin_lock(&heap_lock);
>>>> -    /* adjust domain outstanding pages; may not go negative */
>>>> -    dom_before = d->outstanding_pages;
>>>> -    dom_after = dom_before - pages;
>>>> -    BUG_ON(dom_before < 0);
>>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>>> -    d->outstanding_pages = dom_claimed;
>>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>>> -    sys_before = outstanding_claims;
>>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>>> -    BUG_ON(sys_after < 0);
>>>> -    outstanding_claims = sys_after;
>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>>> +    {
>>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>>>> +        outstanding_claims -= d->outstanding_pages;
>>>> +        d->outstanding_pages = 0;
>>>> +    } else {
>>>> +        outstanding_claims -= pages;
>>>> +        d->outstanding_pages -= pages;
>>>
>>> I wonder if it's intentional for a pages < 0 value to modify
>>> outstanding_claims and d->outstanding_pages, I think those values
>>> should only be set from domain_set_outstanding_pages().
>>> domain_adjust_tot_pages() should only decrease the value, but never
>>> increase either outstanding_claims or d->outstanding_pages.
>>>
>>> At best the behavior is inconsistent, because once
>>> d->outstanding_pages reaches 0 there will be no further modification
>>> from domain_adjust_tot_pages().
>>
>> Right, at that point the claim has run out. While freeing pages with an
>> active claim means that the claim gets bigger (which naturally needs
>> reflecting in the global).
> 
> domain_adjust_tot_pages() is not exclusively called when freeing
> pages, see steal_page() for example.

Or also when pages were allocated. steal_page() ...

> When called from steal_page() it's wrong to increase the claim, as
> it assumes that the page removed from d->tot_pages is freed, but
> that's not the case.  The domain might end up in a situation where
> the claim is bigger than the available amount of memory.

... is a case that likely wasn't considered when the feature was added.

I never really liked this; I'd be quite happy to see it ripped out, as
long as we'd be reasonably certain it isn't in active use by people.

Jan

