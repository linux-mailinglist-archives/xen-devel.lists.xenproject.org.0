Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59889BA2E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 10:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701839.1096360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkL4-0004Km-B3; Mon, 08 Apr 2024 08:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701839.1096360; Mon, 08 Apr 2024 08:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkL4-0004IE-80; Mon, 08 Apr 2024 08:26:50 +0000
Received: by outflank-mailman (input) for mailman id 701839;
 Mon, 08 Apr 2024 08:26:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtkL2-0004HU-R2
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 08:26:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdeb77e8-f581-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 10:26:48 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so1744385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 01:26:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b004163ee3922csm7532760wmb.38.2024.04.08.01.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 01:26:47 -0700 (PDT)
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
X-Inumbo-ID: bdeb77e8-f581-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712564808; x=1713169608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08lPNccoAYKM3CMRxZXuGnRUc1Ja0Bn78mY788v3SoQ=;
        b=GWY7BnaBBHrFQh7/LyBWBIGv+b2iidhlfTu9AHlKZ9oPrpGOnCdbxgoeQEVONZ+QHm
         ZQEiLhnhYQrWFY6esHX/gY4kVb7Gzo1L9JpUZTkExL0mgVbVT60JHCsgbCvhRBe1C39P
         gDQjRpEVkdHDdQc6G/PA894UTm24bb06fcNNyWhiFPKBsrT6YcpJgPxSUXMdlpGwYvuc
         SKfTbUYS5PHBFdEZhi8etHC2OmMv4s6tZolj3WNquyPhn+ruIlhT1KzjvcuH+sBJTbKV
         6g30ZtPjtF6yCPHO/ncjZxXiyP2MFLbiQu/7RUdTsb9U21NTVnTqQvYNqapN73Zhk+Y+
         ZGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564808; x=1713169608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08lPNccoAYKM3CMRxZXuGnRUc1Ja0Bn78mY788v3SoQ=;
        b=QBtwdn/OMISn+Sz/OdEFHeJE50Rx/tfjL748ewGzIZECAG9q6RjRRq3sz1H+cLOE0C
         RFobfM8YSTDgB+jDa9roSxQOdt+BzQYkchGKrayKNOFFO60zXuvXaHlcGm+DBV7t44yK
         hDmQusK29MkJgiYm2tlMzWumy3LlKC0ZCfrlqmkwdMQM/FPFmiVSjCYUdUzPxgvPpTkB
         BiqVrMcIYz4guLpRpUN0DUKOhvnE+W3h8sdqHeADM0I4TXqG7uSHli85UViNqr5O7aIK
         M4kxnKpbkag7OEAMv6ujiZmurdbw2Ab1OeIKIGi9as8JpkFN+Z9LpuGB2TKVBRPcaBz8
         kWAg==
X-Forwarded-Encrypted: i=1; AJvYcCWqU7DF3I+TAyiEzcNmqKFycdZKjc8dzCRgT2wjd+AUERPMITyaHQGUs58Ho+Gi8OG4TRY/0Nn4YnpWFxh9PIxXnPY19ikJIvCGBZI0EKQ=
X-Gm-Message-State: AOJu0YzXLO7ozC7bl1Onzve96D5SD2yocoklFmCUkFctCQ8+pP9u1UbZ
	daVSSf+B8pDVqiWZST+buucSLUUlKzfG+hl/M/eEXFqCjJ8lnoMBqx3P9jWWXg==
X-Google-Smtp-Source: AGHT+IHonkkYUp9TfskBIf+66AWju8rJyFY/XKuzVooccQyEZkfhZiWNnN7Wj/w5HPGYxYqMu4/6KA==
X-Received: by 2002:a05:600c:45c9:b0:416:2674:1938 with SMTP id s9-20020a05600c45c900b0041626741938mr7749613wmo.15.1712564807698;
        Mon, 08 Apr 2024 01:26:47 -0700 (PDT)
Message-ID: <2d73f0d0-abed-4fa8-ab26-e0e4c712a108@suse.com>
Date: Mon, 8 Apr 2024 10:26:49 +0200
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
 <0a28ce70-6c71-43da-8aa1-3b9909e2d152@suse.com>
 <e5b8e385-6d72-4102-bd0a-47f868535b90@amd.com>
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
In-Reply-To: <e5b8e385-6d72-4102-bd0a-47f868535b90@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2024 10:12, Henry Wang wrote:
> Hi Jan,
> 
> On 4/8/2024 3:03 PM, Jan Beulich wrote:
>> On 08.04.2024 08:59, Henry Wang wrote:
>>> Hi Jan,
>>>
>>> On 4/8/2024 2:22 PM, Jan Beulich wrote:
>>>> On 08.04.2024 05:19, Henry Wang wrote:
>>>>> On 4/4/2024 5:38 PM, Jan Beulich wrote:
>>>>>> On 03.04.2024 10:16, Henry Wang wrote:
>>>>>>> --- a/xen/include/public/memory.h
>>>>>>> +++ b/xen/include/public/memory.h
>>>>>>> @@ -41,6 +41,11 @@
>>>>>>>     #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
>>>>>>>     /* Flag to indicate the node specified is virtual node */
>>>>>>>     #define XENMEMF_vnode  (1<<18)
>>>>>>> +/*
>>>>>>> + * Flag to force populate physmap to use pages from domheap instead of 1:1
>>>>>>> + * or static allocation.
>>>>>>> + */
>>>>>>> +#define XENMEMF_force_heap_alloc  (1<<19)
>>>>>> As before, a separate new sub-op would look to me as being the cleaner
>>>>>> approach, avoiding the need to consume a bit position for something not
>>>>>> even going to be used on all architectures.
>>>>> Like discussed in v2, I doubt that if introducing a new sub-op, the
>>>>> helpers added to duplicate mainly populate_physmap() and the toolstack
>>>>> helpers would be a good idea.
>>>> I'm curious what amount of duplication you still see left. By suitably
>>>> adding a new parameter, there should be very little left.
>>> The duplication I see so far is basically the exact
>>> xc_domain_populate_physmap(), say
>>> xc_domain_populate_physmap_heap_alloc(). In init-dom0less.c, We can
>>> replace the original call xc_domain_populate_physmap_exact() to call the
>>> newly added xc_domain_populate_physmap_heap_alloc() which evokes the new
>>> sub-op, then from the hypervisor side we set the alias MEMF flag and
>>> share the populate_physmap().
>>>
>>> Adding a new parameter to xc_domain_populate_physmap() or maybe even
>>> xc_domain_populate_physmap_exact() is also a good idea (thanks). I was
>>> just worrying there are already too many use cases of these two
>>> functions in the existing code: there are 14 for
>>> xc_domain_populate_physmap_exact() and 8 for
>>> xc_domain_populate_physmap(). Adding a new parameter needs the update of
>>> all these and the function declaration. If you really insist this way, I
>>> can do this, sure.
>> You don't need to change all the callers. You can morph
>> xc_domain_populate_physmap() into an internal helper, which a new trivial
>> wrapper named xc_domain_populate_physmap() would then call, alongside with
>> the new trivial wrapper you want to introduce.
> 
> Thanks for the good suggestion. Would below key diff make sense to you 

Yes.

> (naming can be further discussed)?

Personally I wouldn't use xc_ on internal helpers. But for guidance on
naming in the libraries the maintainer(s) would need consulting.

> Also by checking the code, if we go 
> this way, maybe we can even simplify the 
> xc_domain_decrease_reservation() and xc_domain_increase_reservation()? 
> (Although there are some hardcoded hypercall name in the error message 
> and some small differences between the memflags)

There may be room for improvement there, but as you say, some care would
need applying.

Jan

