Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828E8B08AA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 13:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711352.1111253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbAL-0003Vm-SQ; Wed, 24 Apr 2024 11:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711352.1111253; Wed, 24 Apr 2024 11:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbAL-0003UG-Pi; Wed, 24 Apr 2024 11:51:57 +0000
Received: by outflank-mailman (input) for mailman id 711352;
 Wed, 24 Apr 2024 11:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzbAK-0003UA-JS
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 11:51:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c325426-0231-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 13:51:55 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41af670185fso6513675e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 04:51:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jg3-20020a05600ca00300b0041affdeeb99sm1930354wmb.39.2024.04.24.04.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 04:51:54 -0700 (PDT)
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
X-Inumbo-ID: 0c325426-0231-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713959515; x=1714564315; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaDhe/761gfbnKC64HJdDksjjTowgIpQ4bXmuv7L4qM=;
        b=RaiGuQysHg794nSnxoq6EfX7VliM+QiRvDowrn2VWXOeOxzYDI7IVYv68u1aSCrhAi
         UWXWj31U79IGmXGqHPNRyVo4WgGdtfzUngtasPWxDvQNJOeabawjitvCRLAmQ2SeaY4C
         CGAPQ0rKzXu1RJ8ePHFLdetEU8RqseAUcmS01bTKPiCMihceOkTswzaZPOHjiQ9apNm0
         IowYX9boHYofmiJsO1R5ZZFq/Koji6qP7cHlqiXXzBht6EcC7Ps4Lks3JstELcrHcTvu
         nF7ptYPFM8FjTAnfItYkZzw3t++2CRjaFud+K1M7vuRA7mpgXK//vG32xJgsFtIVkUvP
         xbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713959515; x=1714564315;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CaDhe/761gfbnKC64HJdDksjjTowgIpQ4bXmuv7L4qM=;
        b=HJyPdJa86sWUADcEZe3XA3qFfSyljLIH/2GYsAWm+MVCYO+6PLhciZjXikEzv/cg9+
         QqgXeX/9ffSuWMVP2kvlkBJt7p09pqYJiZM2tqq/OuS8RZLzEs2j7Ca6s/C3MCypZsMD
         kI2gNWgedYnEz6GGHpU1XL05ZrhN6QvkUjADbNVFFI0f3u398NeU4Buiygo0pGaDoTt8
         rcPKzA8m3GTu20FV2SBGIpw0CpslISuF6QitjD92hWV1H8Y3/noJQpiGe40eNeEQ6Qyy
         X6/ajXjR9goG7Q4hYOJRR7b8F2RyjHc+C0WhpctLK1G0VuMcXgCXZbM21BxQKjO+qFFZ
         pbjA==
X-Forwarded-Encrypted: i=1; AJvYcCXe0AzmLWCn+Hm3IkEmCxEx6T/1Ncnz0Kf2xh6JUesuJXaBC8iqezaQMr8Qy0o5jnMA64VOlzFCI5/C4ExNzeFI2YAMy3tKHLieUuU1Bdo=
X-Gm-Message-State: AOJu0YzRzXOJp0maVNAY97G6Uvme7QqrJTf3pI0Bh2VvWYmPl+YCHsFU
	4uFfmXyjdR1se3609SEp7cdiJ/hpCXHh2zQhIrZMP1Gwo2ky/f5/av9yhcUbbg==
X-Google-Smtp-Source: AGHT+IHs7hMMYIENrlo7Hwr7WvkJNOZgQHtQmNURUdOYdaiQCOFkm1/TIBpkmqJuowZHxfcJIkrNZQ==
X-Received: by 2002:a05:600c:46cc:b0:418:ed13:302d with SMTP id q12-20020a05600c46cc00b00418ed13302dmr1778369wmo.26.1713959514794;
        Wed, 24 Apr 2024 04:51:54 -0700 (PDT)
Message-ID: <96513dca-e6c4-4dcc-9e0b-be5a92c06d11@suse.com>
Date: Wed, 24 Apr 2024 13:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <310e1dac8ecf2a85f1c552dbdad9093b1cfdcb98.1713946892.git.federico.serafini@bugseng.com>
 <891c21cf-695a-4b1d-b10b-53f23199380f@suse.com>
 <70252c73-e93b-4006-8acd-1e760db5aab7@bugseng.com>
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
In-Reply-To: <70252c73-e93b-4006-8acd-1e760db5aab7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 11:00, Federico Serafini wrote:
> On 24/04/24 10:30, Jan Beulich wrote:
>> On 24.04.2024 10:25, Federico Serafini wrote:
>>> Update ECLAIR configuration to take into account the deviations
>>> agreed during MISRA meetings for Rule 16.4.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>   automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>>>   docs/misra/deviations.rst                        | 13 +++++++++++++
>>>   2 files changed, 21 insertions(+)
>>>
>>
>> So what has changed here from v1? It looks all the same to me, with it still
>> remaining unclear what exactly ...
>>
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -334,6 +334,19 @@ Deviations related to MISRA C:2012 Rules:
>>>            - /\* Fallthrough \*/
>>>            - /\* Fallthrough. \*/
>>>   
>>> +   * - R16.4
>>> +     - Switch statements having a controlling expression of enum type
>>> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
>>> +       which warns (and breaks the build as we use -Werror) if one of the enum
>>> +       labels is missing from the switch.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>> +
>>> +   * - R16.4
>>> +     - A switch statement with a single switch clause and no default label may
>>> +       be used in place of an equivalent if statement if it is considered to
>>> +       improve readability.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>> +
>>>      * - R16.6
>>>        - A switch statement with a single switch clause and no default label may
>>>          be used in place of an equivalent if statement if it is considered to
>>
>> ... a "switch clause" is.
> 
> I would define a switch clause as:
> "the non-empy list of statements which follows a non-empty list of
> case/default labels".
> If you agree, I will place it near the occurrences of the term
> "switch clause".

I'm afraid I don't (quite) agree, and I had hoped that I would have got my
point across that such a definition wants to be in terms used by the C spec.
"statement" is too broad here, as that in particular includes
"labeled-statement" as well. Ordinary labels are (aiui) okay to have in
there, so entirely excluding "labeled-statement" wouldn't be quite right
either.

Jan

