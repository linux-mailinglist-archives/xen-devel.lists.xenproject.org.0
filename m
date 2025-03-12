Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0BA5D807
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 09:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910035.1316824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHKz-0005K9-Bk; Wed, 12 Mar 2025 08:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910035.1316824; Wed, 12 Mar 2025 08:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsHKz-0005HT-6w; Wed, 12 Mar 2025 08:21:13 +0000
Received: by outflank-mailman (input) for mailman id 910035;
 Wed, 12 Mar 2025 08:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsHKx-0005HN-EW
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 08:21:11 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f352a89b-ff1a-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 09:21:09 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3592315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 01:21:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a731031sm13755495e9.7.2025.03.12.01.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Mar 2025 01:21:08 -0700 (PDT)
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
X-Inumbo-ID: f352a89b-ff1a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741767668; x=1742372468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4NJ9uLAM4FJMJWZEMsiQkdE4qRovreYd7G6RZmWThOY=;
        b=Rsdv0KljISoUsWTr4m10//hS4lagCWBqtS5b/iFpRtv5FfXOJ43fxqVQaoT3qonqVC
         MF6RcVQxIXg/OoNE4rZs9FCcUQWtSjOMYlpxwPQtXwoUToQhAJeV2kaqoh4vRgoTT86J
         +7ZtSgJegutOZBysmkPaUylqdvW4Gaw4Z5OnjN2LOMGgNuBIyVBX2ucrHOJpynCO5jEo
         ASND+HQwuaW0AJCbUDEmdh4CQWURyrJdHBlC1JkZ6i/Y0MTUlNaiOf5B3IRuxhESgCea
         QMo/HNwYMtK1lHFNE2yIwqtw0hL1WHFBMVsZsNA/YBZzsBf083OP2Bwx/QAOsDmmswQg
         VDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741767668; x=1742372468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NJ9uLAM4FJMJWZEMsiQkdE4qRovreYd7G6RZmWThOY=;
        b=hq2ygM33ouKOetM4V/nQuhrNJ+a8cu8yjnyLoMoJ82PK6CcHpaVPDchH5IbbUAmZAr
         /0iPFeZLy4Eh9VFWVabFESRdsI+OABkDtR2XvHrfU9ZloUl+Mk5kq2MQWURkrWadJpXP
         oEhNeDpM7htGYA2tKDWR6ECTHEl1B3utJkCsCzOPpO+oicKKcRv+G4AQz7Cu7SNWtQH2
         yiOOhw2XfwZoVq9/2YjNEUHB84yh3Z75cuAPfQ7/yspGNRW5VYlUXurts864cM1TV2/E
         ZB93n/X/CjEYp93KjuXJMdY0BPd+lKJXRGGw2zchDhFnt+GES6QAPnReuJ4h0P7L1EoR
         MPjQ==
X-Gm-Message-State: AOJu0Yx6TgkKoPkc9vPnYpA2kynX5C4VQ9+hkHvDDi//QEergT/BOlKe
	FgvfD/3mGqDdzPH9mRMkpfeIv+MREXn1UjXp2Y9hcLuBu6xJBxm+Mv+lkc3LVw==
X-Gm-Gg: ASbGncsKfDWRU7931nf+Tv+vAKFLV6vBjsx3uSlG7ZArVf3tW7jsiEa/HygLU1AQ4od
	JkXJZdPXK5Snqq+cDJgycx285l3BRzGxxmp92diKadhBXTDNkHAQUDvP9Cp1qei/BK0eX4IVA/P
	kg8H7FyhW97NP+ouo6B5zFWl3Iugq6lIOKAMZszBUMa68v/a27KjNvtwS+Px8XUYXLlHzyyfbK7
	LsJAnMkJzE1yfEXdlqPUYJ+3A1MFD9aiEQV56wlqCdB7hAdfuyYJiEIeWlZTgWBH5O4/zLAPSrJ
	18C/ZJkvJS3CsVU5EzVv7rXYzLuT8RzMmo8YBS1wSYFFG7jzCiGXasHvIJDo6yOzeZipvymrb6l
	AqZxUQSo/Z5w+lT74/1K0tuvOvYYPPA==
X-Google-Smtp-Source: AGHT+IEFeZC6yMMqn9k/VmEcCy5cqcGk7jsSETgRI48IxW7TL9kO+6hBAnWsG42tBfNxLkemQM9rlA==
X-Received: by 2002:a05:600c:1551:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-43d01d39b5cmr59947555e9.12.1741767668369;
        Wed, 12 Mar 2025 01:21:08 -0700 (PDT)
Message-ID: <52918859-3922-4b2d-b432-162a9de2b554@suse.com>
Date: Wed, 12 Mar 2025 09:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local> <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
 <Z9BZ-V8fWHOAwMJ7@macbook.local>
 <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>
 <D8DNJHDNZNRD.1XOJK139C5PEI@cloud.com>
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
In-Reply-To: <D8DNJHDNZNRD.1XOJK139C5PEI@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 19:35, Alejandro Vallejo wrote:
> On Tue Mar 11, 2025 at 3:45 PM GMT, Jan Beulich wrote:
>> On 11.03.2025 16:42, Roger Pau Monné wrote:
>>> On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
>>>> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monné wrote:
>>>>> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
>>>>>> The logic has too many levels of indirection and it's very hard to
>>>>>> understand it its current form. Split it between the corner case where
>>>>>> the adjustment is bigger than the current claim and the rest to avoid 5
>>>>>> auxiliary variables.
>>>>>>
>>>>>> Add a functional change to prevent negative adjustments from
>>>>>> re-increasing the claim. This has the nice side effect of avoiding
>>>>>> taking the heap lock here on every free.
>>>>>>
>>>>>> While at it, fix incorrect field name in nearby comment.
>>>>>>
>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>>>
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Thanks.
>>>>
>>>>> I think it would be nice to also ensure that once the domain is
>>>>> finished building (maybe when it's unpaused for the first
>>>>> time?) d->outstanding_pages is set to 0.  IMO the claim system was
>>>>> designed to avoid races during domain building, and shouldn't be used
>>>>> once the domain is already running.
>>>>>
>>>>> Thanks, Roger.
>>>>
>>>> As a matter of implementation that's already the case by toolstack being "nice"
>>>> and unconditionally clearing claims after populating the physmap.
>>>
>>> I see.  Another option would be to refuse the unpause a domain if it
>>> still has pending claims.  However I don't know how that will work out
>>> with all possible toolstacks.
>>>
>>>> However, I agree the hypervisor should do it on its own. I didn't find a
>>>> suitable place for it. 
>>>
>>> You could do it in arch_domain_creation_finished().
>>
>> Except that better wouldn't be arch-specific.
> 
> Why would it have to be arch-specific though? As far as the hypervisor is
> concerned, it doesn't seem to be.

Together with Roger's earlier clarification on his original remark, I fear
I don't understand the question: I asked that it not be arch-specific. And
Roger clarified that he also didn't mean it to be.

Jan

