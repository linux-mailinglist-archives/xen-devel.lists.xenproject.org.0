Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8CB266AE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 15:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081696.1441711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXno-0002Ip-9w; Thu, 14 Aug 2025 13:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081696.1441711; Thu, 14 Aug 2025 13:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umXno-0002Gq-6v; Thu, 14 Aug 2025 13:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1081696;
 Thu, 14 Aug 2025 13:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umXnm-0002Gh-Bw
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 13:15:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfc75241-7910-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 15:15:29 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6188b733bbaso1774506a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 06:15:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6188837fd10sm1932644a12.14.2025.08.14.06.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 06:15:28 -0700 (PDT)
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
X-Inumbo-ID: bfc75241-7910-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755177329; x=1755782129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W0gRqDnYXQqvEFikVN77LAnV99f3gklCrW52SFXBwNo=;
        b=LQG9Ite0jYpeYCtQ5uSN6vd/whDm+wd1WweYWtCDVGR871uD4A380WZZFqiG1aRZkh
         VDBBda+DCKe0XXPMCbt3Phga9RpMh9r9bYjBnGsGxEESz98hMmy5Cx8sWy7r3TWS2O5B
         g+hQZOo+fE+kzvzQzQujC9c8L0lPH05/QpOATxyUpL5UT5MUpW6yQ7YRWZp+80JQXm4s
         sukjloZMj5Fb4NztmGMMnhm0OdqCHsqlDHh2devvYjytoEyubjGMORrZLV3CCwQG50GW
         jPUS0ODUTZhVkPaGC2ibokKllWw1jyHpRwcsXvspZKEjjwJh+7RK+jTw0qCB68tUshCR
         gwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177329; x=1755782129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0gRqDnYXQqvEFikVN77LAnV99f3gklCrW52SFXBwNo=;
        b=twiytATNRoUHJf9lTTYYLW5+Tfpl2RQRuvBHYD/vgJol6khfAZpQENgfm0CQr/Cs5j
         xo2yS7+yjspzpqU31Arr6ooF+c8iXxZbZ8upzBdSDTofMMgPcCzkQoeQ/9FiWiCr7c3Y
         OAMUpEeBnFrYXbwjqPVlNdwLxiGKLjimo+ZCuP07MdyTeRW8NFQi6CYA8DEARykinfeR
         6t5MjYsDjZkd7ST8c1ePOq5+j/q5rOtR6CKD8DMdYOn4hHY77ArTVJfrEoVZOU7mFR99
         n1+oVv89rDtksBaXWR/5cE9w4px/HqAvupCWaHqA/HUEoJsvFlfddJGJBHzdvh5mB7Qk
         o34A==
X-Forwarded-Encrypted: i=1; AJvYcCWv2WFgyPrWxCdfOVTczvrOrOukzm2NS/SVO2J+nRK0AUyhb4syrGtrJ+h7Dz5aGqBKItuugmAjvy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/IxR26ODM66Vlk8Ub/SOFLRWFZu2WCTM+9dJ7WjU6OuhIt5jK
	F2jQRJlle4+y16CV37QVjmeOgUCrYioQiCMYdtn39J+/THXh55J9fc9XvpWX+r4ASw==
X-Gm-Gg: ASbGncv1SslbzjgxEc+9Sla3RIYn48hgopomhTQ+QSlhl0LMfUyGrbih+4bVEjB9hGW
	+msLoHsA5sMYpMYWJqpticlQEZxJ4Ur4JqEtJ3tfZFp4ucZ6mG8BuIqe5PIXmp2H8cU24AVLu1r
	so7XTdN6SZwUJrtwRNcg9jT45rzzwZPeAH7pGqm5UCbStjhlJpLBtf4XYzJokwMtxGqWyrNQqzF
	0agQ5ojQc/tKeg4Wo23YGncQajdC1z0JAIgFEm2PQ/1/kZvXKfYIc9WAmn9EnB4JzsRIZdpsHFz
	OheF2sSNMfcYw3yiBUGG7+Q2Uq8+mlAWXxjYL3IKzmt055eJyWGgnalrqsgusRvuycVsPI24ulb
	TOHisrMQV+zwHp/rb/9MB1zt6Qr5dHiIQKoCsIbVKyulKxqcFHxD+GiDbbwNcc/NZ968ZRtZyXr
	ezyP+VwRc=
X-Google-Smtp-Source: AGHT+IHiobKkY7fCBuQitA2RiQnqTF7KXWMAZACMNdx2dLRUsD0vNB9JSe0pH+0g6+SDNuyzD2qnEA==
X-Received: by 2002:a05:6402:51c6:b0:617:cd9d:e1b1 with SMTP id 4fb4d7f45d1cf-6188c21c4abmr2558160a12.30.1755177328757;
        Thu, 14 Aug 2025 06:15:28 -0700 (PDT)
Message-ID: <f707d57e-73f3-43c4-a005-f2b93ad3d1cf@suse.com>
Date: Thu, 14 Aug 2025 15:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pdx: cast PAGE_SIZE value ahead of shifting
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250813125538.78174-1-roger.pau@citrix.com>
 <e644c968-ab68-49f4-801e-0f161fd85f2e@suse.com>
 <aJ26UmemwxyyTioE@macbook.local>
 <3fbdd1fc-e739-42cf-892b-a561910a5693@suse.com>
 <aJ3eRFc7CCwVi5WE@macbook.local>
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
In-Reply-To: <aJ3eRFc7CCwVi5WE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 15:01, Roger Pau Monné wrote:
> On Thu, Aug 14, 2025 at 12:45:40PM +0200, Jan Beulich wrote:
>> On 14.08.2025 12:28, Roger Pau Monné wrote:
>>> On Thu, Aug 14, 2025 at 09:18:45AM +0200, Jan Beulich wrote:
>>>> On 13.08.2025 14:55, Roger Pau Monne wrote:
>>>>> --- a/xen/common/pdx.c
>>>>> +++ b/xen/common/pdx.c
>>>>> @@ -288,7 +288,7 @@ bool __init pfn_pdx_compression_setup(paddr_t base)
>>>>>  
>>>>>      pfn_pdx_hole_shift  = hole_shift;
>>>>>      pfn_pdx_bottom_mask = (1UL << bottom_shift) - 1;
>>>>> -    ma_va_bottom_mask   = (PAGE_SIZE << bottom_shift) - 1;
>>>>> +    ma_va_bottom_mask   = ((paddr_t)PAGE_SIZE << bottom_shift) - 1;
>>>>
>>>> Given
>>>>
>>>> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>>>>
>>>> this shouldn't be needed, except maybe for Arm32. There, however, ...
>>>>
>>>>>      pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
>>>>
>>>> ... this and the shift immediately ahead would also be a problem afaict,
>>>> which makes me conclude this isn't what Coverity has looked at. I expect
>>>> the problem is with the toolstack side definition of PAGE_SIZE, which imo
>>>> would rather be addressed there. (And yes, I'm pretty averse to arbitrary
>>>> casts like this being introduced.)
>>>
>>> As I've realized while looking at this, wouldn't ma_va_bottom_mask
>>> also better be of type paddr_t, since it's not operating on pfns, but
>>> physical addresses.  I didn't adjust the type of ma_va_bottom_mask,
>>> but I would be happy to do it if you agree.
>>
>> No, as its name says it's also used on virtual addresses (really: offsets
>> into the direct map). It hence would better not have any bits set outside
>> of the range that VAs can cover.
> 
> It's confusing that it's sometimes used against a paddr_t or an
> unsigned long type.  The logic itself already limits the shift so it's
> below the width of unsigned long AFAICT.

Well, the variable simply doesn't need to be wider than the narrowest type
it's used with.

>> With that, imo the cast (if any) also
>> should have been to unsigned long, not paddr_t. Yet as said, im the cast
>> would better not be there in the first place. Just that meanwhile I've
>> learned that this was committed already.
> 
> Sorry, I should have waited for your opinion.
> 
> I think you would prefer the patch below.

Yes.

>  I can send this formally,
> not sure whether you would prefer a formal revert of the previous
> patch, plus the new fix applied, or doing the revert in the new patc
> (like below) is fine.

Acked-by: Jan Beulich <jbeulich@suse.com>

I don't see a strong need for an outright revert.

Jan

