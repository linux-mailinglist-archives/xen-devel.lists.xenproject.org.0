Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E6A46608
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896968.1305718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJvF-00086e-7b; Wed, 26 Feb 2025 16:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896968.1305718; Wed, 26 Feb 2025 16:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJvF-00083X-4f; Wed, 26 Feb 2025 16:06:09 +0000
Received: by outflank-mailman (input) for mailman id 896968;
 Wed, 26 Feb 2025 16:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnJvD-00083R-Qy
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:06:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95bb4b9d-f45b-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 17:06:06 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3983158f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:06:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86c9ccsm6054157f8f.21.2025.02.26.08.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:06:05 -0800 (PST)
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
X-Inumbo-ID: 95bb4b9d-f45b-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740585966; x=1741190766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Me1pND1fbSmjoNPcObkBWZvvjGT0mDvWhAVJ6lbXiWw=;
        b=HObJhHBBs5bXfKVobHIKEcNAq73dpJM9VQnVY2HInwu8iZ4K8poUaYFt7s2+GMSyAa
         0dwsFqTlDG4lHvzN9ccm/tZe6b7GOVEwKslXntjf3XM+q5nHd2JOSz033Bx/LNBrBNZZ
         ycML2H9/R3W47S+VmWM/Vwp+8ngmiEuMh2zp3ywAXYmKJ4wZ70lyqXmnAspnGJBrndKD
         DAw2dk1DRLA9gzBCM+8+P1vt8aw3KL4ryBkPKaJ3ktIeX+J9CKSvf8t1lf2FmEwf8C+H
         NafteI0iQOXgr6P8DythoP+GKVEqlkQXUdDJ84CZSWhqh1zEpO0N6ll1bccv/A3nZNny
         cvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585966; x=1741190766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me1pND1fbSmjoNPcObkBWZvvjGT0mDvWhAVJ6lbXiWw=;
        b=YdhgHbH9SOZmjpZcCNfIX2e99fdsVr8riQ1+fgcFtknpLB/iS9+oLAXwXTF8Q7WW8M
         jDCTtME+1IPILuw7mINglYvy9MJ2MjnncNJPUrgFHPSYhe/DZCGVkii/kXo88eyjYyKq
         nLPxrh8Qq3RFMYpUGc+ly6KRwI6jVL5SJQMXA5bXM5wVDrJvnh93tDAAp1ADQh+zM+yY
         s26WcBxcQKXrck1zUV/xPqJD4cVsGwtdfabDmUpJTItJ6/PPvTpvd82FutRBvQI7iS0L
         4wcBlQFWRa1IT7Jpz+x1SwI9Ql8csNC01VgdiokfdV2mCGy2JEcTaD4RkHleCNyAhjAg
         mq0w==
X-Gm-Message-State: AOJu0YxgeXdX67aOWz64g4dyqG/YsxGDElTKf17uJURqj3KRcW5mEvRL
	tl0zvUAV3XSoJknzYZNV9Yfkd0pI7xdMCaeMgWdbbcaIXBX7zUDpTCjPPLygvVA14lqWcVAdAqs
	=
X-Gm-Gg: ASbGnctK06XcQPqIggMVYqqAdDxWR6oC5S4PLdPjhumjPtuX/N9OU9a2tG4dwvHiQ3z
	XbaHCz53f19Mo0MNz498GE8DSOqlzATT710enTNYD9gFwPsCWsak/r69ZCYVfpmmCRR0FEWjG5A
	6XB+pBL4Itl7OzyDoKq6a/IZHLQPswEzoAJiOi+OhO01AXN555FtRroGw3Tb5zkOZx3fvXFxFn+
	oR/SdCipE0su6shiMQW1i5SLY7JZj44t9ZvafOBzcdKdm1IaXs3fjtW/Rs1RelyxD379pkx12xV
	5x/ewvpUOpo/6dtPd/p5bqYV+BeHB/2F+lmKHMcfg1rAk6h9sJnY6GWzlczJ3IRsGxQk2sZVAXe
	XQsLhNedvWAo=
X-Google-Smtp-Source: AGHT+IGW0rljwSBvdH0cG+afmR1gzghAaPmRD0XGCq+FZ2uPm5fvop1HKareDpGBZtsxDh9Cdj7e9A==
X-Received: by 2002:adf:ffc8:0:b0:38f:4d91:c123 with SMTP id ffacd0b85a97d-390cc60cf53mr5194381f8f.32.1740585965809;
        Wed, 26 Feb 2025 08:06:05 -0800 (PST)
Message-ID: <f30a8fcf-5bb2-41ff-bc9f-25e421665ab2@suse.com>
Date: Wed, 26 Feb 2025 17:06:04 +0100
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
 <292f8373-705a-4405-bbdb-af750eb5f0ac@suse.com>
 <Z787fHY6L0ssFDjG@macbook.local>
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
In-Reply-To: <Z787fHY6L0ssFDjG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2025 17:04, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 03:36:33PM +0100, Jan Beulich wrote:
>> On 26.02.2025 15:28, Roger Pau Monné wrote:
>>> On Wed, Feb 26, 2025 at 03:08:33PM +0100, Jan Beulich wrote:
>>>> On 26.02.2025 14:56, Roger Pau Monné wrote:
>>>>> On Mon, Feb 24, 2025 at 01:27:24PM +0000, Alejandro Vallejo wrote:
>>>>>> --- a/xen/common/page_alloc.c
>>>>>> +++ b/xen/common/page_alloc.c
>>>>>> @@ -490,13 +490,11 @@ static long outstanding_claims; /* total outstanding claims by all domains */
>>>>>>  
>>>>>>  unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>>  {
>>>>>> -    long dom_before, dom_after, dom_claimed, sys_before, sys_after;
>>>>>> -
>>>>>>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>>>>>>      d->tot_pages += pages;
>>>>>>  
>>>>>>      /*
>>>>>> -     * can test d->claimed_pages race-free because it can only change
>>>>>> +     * can test d->outstanding_pages race-free because it can only change
>>>>>>       * if d->page_alloc_lock and heap_lock are both held, see also
>>>>>>       * domain_set_outstanding_pages below
>>>>>>       */
>>>>>> @@ -504,17 +502,16 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
>>>>>>          goto out;
>>>>>
>>>>> I think you can probably short-circuit the logic below if pages == 0?
>>>>> (and avoid taking the heap_lock)
>>>>
>>>> Are there callers passing in 0?
>>>
>>> Not sure, but if there are no callers expected we might add an ASSERT
>>> to that effect then.
>>>
>>>>>>      spin_lock(&heap_lock);
>>>>>> -    /* adjust domain outstanding pages; may not go negative */
>>>>>> -    dom_before = d->outstanding_pages;
>>>>>> -    dom_after = dom_before - pages;
>>>>>> -    BUG_ON(dom_before < 0);
>>>>>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>>>>>> -    d->outstanding_pages = dom_claimed;
>>>>>> -    /* flag accounting bug if system outstanding_claims would go negative */
>>>>>> -    sys_before = outstanding_claims;
>>>>>> -    sys_after = sys_before - (dom_before - dom_claimed);
>>>>>> -    BUG_ON(sys_after < 0);
>>>>>> -    outstanding_claims = sys_after;
>>>>>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>>>>>> +    if ( pages > 0 && d->outstanding_pages < pages )
>>>>>> +    {
>>>>>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>>>>>> +        outstanding_claims -= d->outstanding_pages;
>>>>>> +        d->outstanding_pages = 0;
>>>>>> +    } else {
>>>>>> +        outstanding_claims -= pages;
>>>>>> +        d->outstanding_pages -= pages;
>>>>>
>>>>> I wonder if it's intentional for a pages < 0 value to modify
>>>>> outstanding_claims and d->outstanding_pages, I think those values
>>>>> should only be set from domain_set_outstanding_pages().
>>>>> domain_adjust_tot_pages() should only decrease the value, but never
>>>>> increase either outstanding_claims or d->outstanding_pages.
>>>>>
>>>>> At best the behavior is inconsistent, because once
>>>>> d->outstanding_pages reaches 0 there will be no further modification
>>>>> from domain_adjust_tot_pages().
>>>>
>>>> Right, at that point the claim has run out. While freeing pages with an
>>>> active claim means that the claim gets bigger (which naturally needs
>>>> reflecting in the global).
>>>
>>> domain_adjust_tot_pages() is not exclusively called when freeing
>>> pages, see steal_page() for example.
>>
>> Or also when pages were allocated. steal_page() ...
>>
>>> When called from steal_page() it's wrong to increase the claim, as
>>> it assumes that the page removed from d->tot_pages is freed, but
>>> that's not the case.  The domain might end up in a situation where
>>> the claim is bigger than the available amount of memory.
>>
>> ... is a case that likely wasn't considered when the feature was added.
>>
>> I never really liked this; I'd be quite happy to see it ripped out, as
>> long as we'd be reasonably certain it isn't in active use by people.
> 
> What do you mean with 'it' in the above sentence, the whole claim
> stuff?

Yes.

>  Or just getting rid of allowing the claim to increase as a
> result of pages being removed from a domain?

No.

Jan

