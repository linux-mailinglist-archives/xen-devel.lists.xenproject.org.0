Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF99CBE3D3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187086.1508506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Nt-00053w-TF; Mon, 15 Dec 2025 14:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187086.1508506; Mon, 15 Dec 2025 14:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9Nt-00051r-Qg; Mon, 15 Dec 2025 14:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1187086;
 Mon, 15 Dec 2025 14:17:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV9Nt-00051l-5I
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:17:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc848ca8-d9c0-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:17:07 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so27039075e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 06:17:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f38a455sm186533825e9.1.2025.12.15.06.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 06:17:05 -0800 (PST)
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
X-Inumbo-ID: bc848ca8-d9c0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765808226; x=1766413026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7xVD0Xnb81MH+uApkWmpkt4aDsnULLzH8Qt19fhs1Uc=;
        b=RRM9EDNJTLUgJSflne472p7wKSVykOZFEbDa0bJKQsH5fAppGxEXZ7YCWKPIldLN2V
         0sGQ1+/1qbaFjMPUPukUKa3AyQ5+R45TPYnH3rgNHnuY0qgusb4MtCXIBNJOQw8ZD4AR
         ynHuj5Kx7wyK4EBeGFe5ldxpTzeGA0xazXKg5syJn7/3lyP0v3rfpCEI+t7bPuC4KVWn
         oqH/cIsPqhagq7NXOwkQAP+soTDeWti+UpjJWBokySDOLi+Z0etrssh4RSUUGsafgH+z
         mXDiqDywhz8ZvT1+FM72oelRLOs4Bum/u7eG+Q5cB5GwYDo/uY8XiNbM30lz8kxCSzN9
         et0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808226; x=1766413026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xVD0Xnb81MH+uApkWmpkt4aDsnULLzH8Qt19fhs1Uc=;
        b=krw8TIq9R4dZHkzXUwN2WNqFyycbYonBrbrkbkgxOqfvzEHsLSFkURnrhJTOAlccMU
         O6Wak5f4ROwSif13n35mTRK77Syf/adFlnUDhwUJ2opiwkc1rOudcO0kAWXKvWrmyrAX
         gQNV9KSrJ0ct7z+Mje8pAaXvhy/RWIPQ7TpgwxSGcCKUhOaNxRQLC2eIrL/dFhwkhBQZ
         LVxSPIy+pwKIw+xaN3uvPEL9FBAkxhZk1EIwz7a9M7MxAbfLglML9Y6a7Rup1IWWNkio
         6qXG1Lb1U+pHJxq5dfZTEaPWtd1c/uU/D5S+Hd3Kcf3aXHYY5LmPyxq1mM3CZA5rOmhh
         0ITQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2TqJ6cfI4xKHStsVKS6Nn85SkplvQv6V7jwayWH5Wv9Wjm0YLoWSkPPq6u4eUJDcZ8LPv3E3uNuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCeTYHG2BVF6VwmGQU7CVc6jyS7ZZGewI8lHsJjaVTgzpiGlWN
	da6FHPgfb6lR7BCqeVdruCPF5Cp19oWMvNcsib5Q9EBZyb7fIa7W7e0ydXXK7OVCfg==
X-Gm-Gg: AY/fxX6F+0eupmqgvZGYTrEeeci+cFUEQyyTcY2kvq7g0m+CKOeJN6qs/xcMQwwlRMY
	NldnFTsjytsQA/Bnslnn1+jxGhpquW2yzreY55vMhGvjEa4wPTMKkp3XgtnxMx8Csm5P+tuRgDt
	ZybxanUEv8IgMr5P3pOWsF3HitYoVAkYw9LQ4dTWyMHCYXHheTW8j3MhTHQ61p8Tq2WU7h9+DwT
	7uITSzy/F1wBHLjxRan8obJtPcFYL998zn8HOw3GDqk/okVie3yV32r23NcAKKY/xAY4lDnAKps
	2ovfzUpTjNtdVZElHdnD/wsREOJWuIFDYLvGEtBKpsvYzHhSxSx2n7TOYZIGomTnjUfc/YXbk35
	POW2FcBlDwU348SSNqsTY35gsPTDRLtMxcGurZKIrMt+g0wUMAU+XNvVms2HMyKubDR/PRcgyZG
	lCI7Ms4jdSIc8miB72K9MH9dcuJNiHdDbaRD9WH43G0D5hD4jefhL6d+aqeFwarFVScBTnnLQWl
	m0=
X-Google-Smtp-Source: AGHT+IEBP2Q46RzHGMHgABBFVwnVzVa1ELRQtgUNT/CfiNyKt39PcEcMlYz5BoTVM1NMs6Ke5fXs8w==
X-Received: by 2002:a05:600c:a009:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47a8f8c4b8emr117469695e9.13.1765808226155;
        Mon, 15 Dec 2025 06:17:06 -0800 (PST)
Message-ID: <1ce5a050-929c-48e4-8645-7310a07279cc@suse.com>
Date: Mon, 15 Dec 2025 15:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: overlapping XENMAPSPACE_gmfn_range requests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7d254163-ac13-4c58-bcb5-aaff2e892e15@suse.com>
 <8038ba8e-ea1f-4005-94ab-56e4ab5f7062@citrix.com>
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
In-Reply-To: <8038ba8e-ea1f-4005-94ab-56e4ab5f7062@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2025 13:46, Andrew Cooper wrote:
> On 15/12/2025 11:22 am, Jan Beulich wrote:
>> Overlapping requests may need processing backwards, or else the intended
>> effect wouldn't be achieved (and instead some pages would be moved more
>> than once).
>>
>> Also covers XEN_DMOP_relocate_memory, where the potential issue was first
>> noticed.
>>
>> Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course an alternative would be to simply reject overlapping requests.
>> Then we should reject all overlaps though, I think. But since the code
>> change didn't end up overly intrusive, I thought I would go the "fix it"
>> route first.
>>
>> In-place moves (->idx == ->gpfn) are effectively no-ops, but we don't look
>> to short-circuit them for XENMAPSPACE_gmfn, so they're not short-circuited
>> here either.
> 
> Maybe we should short-circuit them.  I can't think of anything good that
> will come of having redundant TLB/IOTLB flushing.  At the best it's a
> waste of time, and at the worst it covers up bugs.

I can do so (in a prereq change). In fact I first had the short-circuiting,
but then remembered that in (somewhat) similar situations elsewhere you
didn't like me doing such.

>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -849,7 +849,7 @@ int xenmem_add_to_physmap(struct domain
>>                            unsigned int start)
>>  {
>>      unsigned int done = 0;
>> -    long rc = 0;
>> +    long rc = 0, adjust = 1;
>>      union add_to_physmap_extra extra = {};
>>      struct page_info *pages[16];
>>  
>> @@ -884,8 +884,25 @@ int xenmem_add_to_physmap(struct domain
>>          return -EOVERFLOW;
>>      }
>>  
>> -    xatp->idx += start;
>> -    xatp->gpfn += start;
>> +    /*
>> +     * Overlapping ranges need processing backwards when destination is above
>> +     * source.
>> +     */
>> +    if ( xatp->gpfn > xatp->idx &&
>> +         unlikely(xatp->gpfn < xatp->idx + xatp->size) )
>> +    {
>> +        adjust = -1;
>> +
>> +        /* Both fields store "next item to process". */
>> +        xatp->idx += xatp->size - start - 1;
>> +        xatp->gpfn += xatp->size - start - 1;
>> +    }
>> +    else
>> +    {
>> +        xatp->idx += start;
>> +        xatp->gpfn += start;
>> +    }
> 
> These fields get written back during continuations.

I double-checked yet again, but no, I don't think so.

> XEN_DMOP_relocate_memory will corrupt itself, given the expectation that
> 'done' only moves forwards.

This, otoh, I really need to fix.

Jan

