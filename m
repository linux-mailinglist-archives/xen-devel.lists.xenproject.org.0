Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1EA500BB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 14:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902273.1310223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoxn-0001g7-50; Wed, 05 Mar 2025 13:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902273.1310223; Wed, 05 Mar 2025 13:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpoxn-0001d1-2K; Wed, 05 Mar 2025 13:39:07 +0000
Received: by outflank-mailman (input) for mailman id 902273;
 Wed, 05 Mar 2025 13:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpoxl-0001cv-7L
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 13:39:05 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33dec19a-f9c7-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 14:39:04 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43bbd711eedso30857495e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 05:39:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c5b33sm18427745e9.22.2025.03.05.05.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 05:39:02 -0800 (PST)
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
X-Inumbo-ID: 33dec19a-f9c7-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741181943; x=1741786743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GAkrCJCWJW5Yucify05iHBmALCa3LG/Uwk4xU+X4LTw=;
        b=BB8yDkCScw2K6JivjazfEDXOJ4D87jHL7DgFxt/Z9A2PcN8y91sjLMK+1K1we3OW/n
         VTpD/19aqLqA5HjYC3+xbXM/Dxz69hgfOnHfa0KCzfI3GNs6YhHmT+ftNn5bSqmXB90n
         iPeE0BtSo7bZpV53e8YYJES+WLLGLrC7fk2YwUSXiU1zfUr5sbrtMttr7IaHBuqPiZw7
         vDPsEySzo3v65XmvkZKE4Ym8MvqaBHFtSZNJiCGs96KdxtjeEG0ampTH4eA0UXl56HLx
         bAfJObSmBqY8vBxpo9FSZmpzgZxZYHcnQwmRqBHEU93IXtHfVGFZVO7tRngGDZKlrCV8
         YaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181943; x=1741786743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAkrCJCWJW5Yucify05iHBmALCa3LG/Uwk4xU+X4LTw=;
        b=j0Ecq+WbnvM5oboo8nqNLhl+ZZTpMKSsEfiIKk2yor9url1ZpGUr39/mQT7DhbqxXJ
         sL4PLaoCA/EPv8sgtLqiKSJFUDKIFt+D78JvqTv29qncCpl1c03flCtEbC6knXlrQ7al
         9PonWhBDUVIle1PxFC0RhBbWjAC/72xaE1bSGw5KcS2i5UuYsu0cn8j9qo5w9SFZDrS7
         1Czvqrb4Weakb/R37HjBfaBQ/o1rDI9ce7QDna5OYnxrOqCSUvAGn6FvBCXFBLY/xqMz
         MwVE38ZJFmaaEP7MpAmnEPXONIJC0E2IxzAdXWHwdtRTzx/YDH7dHK9HwavJXn2g/Ndx
         GoFA==
X-Forwarded-Encrypted: i=1; AJvYcCVkA7sGNElhU1phTG8532MEZ6SWkXm92fxTyC5gx0xGFcyDZ49nS8JInQAGilII9WKiIh6k8rQBE7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxU9O+RXTEeyTRxL10v8mgAv7ESd5K0CBY2m0Y3012Bcy/GgSON
	xgg3phPQbtiBXnn2te+tDbfyAuyMtsciG0z1PhbDofOJsCG5P1JN5ApIyctvYA==
X-Gm-Gg: ASbGncvNnf9LY9gS/G961psEFzcMAgId4ObzAcCiUGSCBkGIkYfy4l1Z9v8hd3615u+
	AK2KQ2QgXcgWyErF+I7NXAgtOhrFkGDLnL4tunK+zI0yHjPwadssuZB4jyE2pFKsZws2WuHoT9E
	LhLLlWMsbSELEJjDAO5MEHiv2ziaYp/WejlAXwZZ4jErvReHPJ3EumvSi3fwRIS7pE35780ng4L
	LtqTpYIypZfnDtutfvkTlbPgUWTxhahAMhDZeAkCymTJHx6UDS0hQxmYEZa0T/FIfFIsOSpYZ4b
	UUxhdUoYnfnYdDCucdC3ORBbwBwSzWDvMu78LAmke+aweWyuNDQMSdxEqXk1EJbtnx73QV0tG0K
	YrbCikbaKtWhc7qeerU9BT3LQ7hysrQ==
X-Google-Smtp-Source: AGHT+IHRyjl/pL0jCqc5oJxVLG+lVhQd+d1qD9lpw0wDqsQwglk/3LHTQsWnQjqsvGSnekN49J8a6A==
X-Received: by 2002:a05:600c:a409:b0:43b:c2d7:44d with SMTP id 5b1f17b1804b1-43bd2adb09dmr20099965e9.21.1741181943126;
        Wed, 05 Mar 2025 05:39:03 -0800 (PST)
Message-ID: <6070a7b3-4d1d-4db9-a812-5887de129aa1@suse.com>
Date: Wed, 5 Mar 2025 14:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
 <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
 <D83AY7ZBKC81.3NBCLVK3DX833@cloud.com>
 <f50d8ee7-a00f-4f4f-99f6-4313af7a4fdc@suse.com>
 <D88D5732H4EQ.3770M7EIO3TW1@cloud.com>
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
In-Reply-To: <D88D5732H4EQ.3770M7EIO3TW1@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 14:22, Alejandro Vallejo wrote:
> On Wed Mar 5, 2025 at 10:49 AM GMT, Jan Beulich wrote:
>> On 27.02.2025 15:36, Alejandro Vallejo wrote:
>>> On Wed Feb 26, 2025 at 2:05 PM GMT, Jan Beulich wrote:
>>>> On 24.02.2025 15:49, Alejandro Vallejo wrote:
>>>>> Open question to whoever reviews this...
>>>>>
>>>>> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
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
>>>>>
>>>>> While this matches the previous behaviour, do we _really_ want it? It's weird,
>>>>> quirky, and it hard to extend to NUMA-aware claims (which is something in
>>>>> midway through).
>>>>>
>>>>> Wouldn't it make sense to fail the allocation (earlier) if the claim has run
>>>>> out? Do we even expect this to ever happen this late in the allocation call
>>>>> chain?
>>>>
>>>> This goes back to what a "claim" means. Even without any claim, a domain may
>>>> allocate memory. So a claim having run out doesn't imply allocation has to
>>>> fail.
>>>
>>> Hmmm... but that violates the purpose of the claim infra as far as I understand
>>> it. If a domain may overallocate by (e.g) ballooning in memory it can distort the
>>> ability of another domain to start up, even if it succeeded in its own claim.
>>
>> Why would that be? As long as we hold back enough memory to cover the claim, it
>> shouldn't matter what kind of allocation we want to process. I'd say that a PV
>> guest starting ballooned ought to be able to deflate its balloon as far as
>> there was a claim established for it up front.
> 
> The fact a domain allocated something does not mean it had it claimed before. A
> claim is a restriction to others' ability to allocate/claim, not to the domain
> that made the claim.

Yes and no. No in so far as the target's "ability to allocate" may or may not
be meant to extend beyond domain creation.

> e.g:
> 
>   0. host is idle. No domU.
>   1. dom1 is created with a claim to 10% of host memory and max_mem of 80% of
>      host meomory.
>   2. dom1 balloons in 70% of host memory.
>   3. dom1 ballons out 70% of host memory.
>   4. dom1 now holds a a claim to 80% of host memory.

Sure, this shouldn't be the result. Yet that may merely be an effect of claim
accounting being insufficient.

> It's all quite perverse. Fortunately, looking at adjacent claims-related code
> xl seems to default to making a claim prior to populating the physmap and
> cancelling the claim at the end of the meminit() hook so this is never a real
> problem.
> 
> This tells me that the logic intent is to force early failure of
> populate_physmap and nothing else. It's never active by the time ballooning or
> memory exchange matter at all.

Ah yes, this I find more convincing. (Oddly enough this is all x86-only code.)

> Xen ought to cancel the claim by itself though, toolstack should not NEED to do
> it.

Fundamentally yes. Except that the toolstack can do it earlier than Xen could.

Jan

