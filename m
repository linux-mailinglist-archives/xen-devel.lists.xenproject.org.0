Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE789B81A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701753.1096180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtj2h-0004yA-Ch; Mon, 08 Apr 2024 07:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701753.1096180; Mon, 08 Apr 2024 07:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtj2h-0004vi-A0; Mon, 08 Apr 2024 07:03:47 +0000
Received: by outflank-mailman (input) for mailman id 701753;
 Mon, 08 Apr 2024 07:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtj2g-0004vV-4P
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:03:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23dbb767-f576-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:03:45 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-415515178ceso26051105e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:03:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c35d300b004163345d2b4sm9363315wmq.36.2024.04.08.00.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:03:44 -0700 (PDT)
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
X-Inumbo-ID: 23dbb767-f576-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712559825; x=1713164625; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5g+VPhkS89uw+FEHglbWymtmFE2GunrOspYR2mQppQ=;
        b=Rx3IE960jbR1FIxpQwOVfcBVRmkitp8ufRa4ZLzQHlcZ3UMTN3wu1e5N3CuDdqvi1I
         /H028TLrKmY5vRaSnC7BL97daRdafVKcGujF1fUboN1gGBktyLeucox+MadONYo0u+MF
         838zIrXfwdr+9CdeaVDKvfPybCg7L38oSvZq8iXYV31pqZmjWD2MiQQOqZF2sYki+X9K
         rjlnM9enwh5FwOS/k+iQYaMB/qLevtvdWVBKtQRx7NOXjCZlDHjYvorcU+7Pqy/UvaV+
         eN8ubHGB8N+KWz8Im0+JKYtTNoeqt0bbgDUZNTSR01S16GMD8LrEPnWXYDf6JowxJNPy
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559825; x=1713164625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5g+VPhkS89uw+FEHglbWymtmFE2GunrOspYR2mQppQ=;
        b=oniXdiunH5pA+H+3CJkRQP7cVs7p9S37dAGvE4POxGz7cehSOWcIYvtnlf/I7zWbCO
         iS4crPvrDgqUomUC8dy+2iFXOlY3dC81dJmV3Xsl0MnXUVGsmBDTWc/MUKCohLyy/D2X
         ptnrEGZDwa1bsdXGCxMWvMa1t/4pV5Ztgg+/7j95PVCfm+OEgRk24fmUdffSUlfJbC94
         U8aKFR5R90k2fkfpIxB7iymUCad6ChemyfVj9RC2UG2Sk6pSkLtqDvjq88e7mB9hFEGY
         7Aj25TerTItn05LqvsVVJ87KgzDcmrW+jyA3h8wnycwA/jVg06grtsvsG40LTwTgL1OC
         eDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWw/sGIwKcM8X0pMopV5UZ1hBIknp5x5jRKOWrpm4K8mLEQqySXpX896coCEXWVyErN3t4neF2dB5HKj6hsNohxyyZfTVGVmdhX6ikOg8=
X-Gm-Message-State: AOJu0Yz5DYUv5ubI1Qcr4nOL0dZm5RD5r+mMyShNQ3hIcV4swGuq6GvZ
	uV5pmgRs90trvlQKo7lzbx+QLmjU2YfnCDIx7B1NOhJAYcuBDnb/RwUwdr3BQMiQByL/TTryMik
	=
X-Google-Smtp-Source: AGHT+IH6TJo43wA0xuL5ZKyAYcUcAeWnyp7Fwx7H9v8EKhAd7djxt1StcMjCFxpDfGf+tPAg2lvH1g==
X-Received: by 2002:a05:600c:a42:b0:413:38c6:2c7a with SMTP id c2-20020a05600c0a4200b0041338c62c7amr6159741wmq.22.1712559824773;
        Mon, 08 Apr 2024 00:03:44 -0700 (PDT)
Message-ID: <0a28ce70-6c71-43da-8aa1-3b9909e2d152@suse.com>
Date: Mon, 8 Apr 2024 09:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding
 GUEST_MAGIC_BASE in init-dom0less
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-5-xin.wang2@amd.com>
 <e9167c39-187f-4a66-b9a4-8b3a6ae3000b@suse.com>
 <09cc419a-cdf6-4cda-90f1-c0e1ae83ad47@amd.com>
 <951cc6ba-c971-4b5b-9cfc-bc79245a9549@suse.com>
 <9518c19a-eb97-4d68-97bc-fcae56aa8093@amd.com>
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
In-Reply-To: <9518c19a-eb97-4d68-97bc-fcae56aa8093@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2024 08:59, Henry Wang wrote:
> Hi Jan,
> 
> On 4/8/2024 2:22 PM, Jan Beulich wrote:
>> On 08.04.2024 05:19, Henry Wang wrote:
>>> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>>> --- a/xen/include/public/memory.h
>>>>> +++ b/xen/include/public/memory.h
>>>>> @@ -41,6 +41,11 @@
>>>>>    #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>>    /* Flag to indicate the node specified is virtual node */
>>>>>    #define XENMEMF_vnode  (1<<18)
>>>>> +/*
>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>> + * or static allocation.
>>>>> + */
>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>> As before, a separate new sub-op would look to me as being the cleaner
>>>> approach, avoiding the need to consume a bit position for something not
>>>> even going to be used on all architectures.
>>> Like discussed in v2, I doubt that if introducing a new sub-op, the
>>> helpers added to duplicate mainly populate_physmap() and the toolstack
>>> helpers would be a good idea.
>> I'm curious what amount of duplication you still see left. By suitably
>> adding a new parameter, there should be very little left.
> 
> The duplication I see so far is basically the exact 
> xc_domain_populate_physmap(), say 
> xc_domain_populate_physmap_heap_alloc(). In init-dom0less.c, We can 
> replace the original call xc_domain_populate_physmap_exact() to call the 
> newly added xc_domain_populate_physmap_heap_alloc() which evokes the new 
> sub-op, then from the hypervisor side we set the alias MEMF flag and 
> share the populate_physmap().
> 
> Adding a new parameter to xc_domain_populate_physmap() or maybe even 
> xc_domain_populate_physmap_exact() is also a good idea (thanks). I was 
> just worrying there are already too many use cases of these two 
> functions in the existing code: there are 14 for 
> xc_domain_populate_physmap_exact() and 8 for 
> xc_domain_populate_physmap(). Adding a new parameter needs the update of 
> all these and the function declaration. If you really insist this way, I 
> can do this, sure.

You don't need to change all the callers. You can morph
xc_domain_populate_physmap() into an internal helper, which a new trivial
wrapper named xc_domain_populate_physmap() would then call, alongside with
the new trivial wrapper you want to introduce.

Jan

