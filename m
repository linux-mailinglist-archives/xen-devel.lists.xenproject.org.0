Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B228784A8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 17:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691536.1077584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiDQ-0001kW-GI; Mon, 11 Mar 2024 16:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691536.1077584; Mon, 11 Mar 2024 16:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjiDQ-0001i0-C9; Mon, 11 Mar 2024 16:09:28 +0000
Received: by outflank-mailman (input) for mailman id 691536;
 Mon, 11 Mar 2024 16:09:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjiDO-0001hu-B8
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 16:09:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bad487ce-dfc1-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 17:09:25 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a45ecef71deso361189166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 09:09:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a170906a19800b00a457a55b814sm2978213ejy.73.2024.03.11.09.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 09:09:24 -0700 (PDT)
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
X-Inumbo-ID: bad487ce-dfc1-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710173365; x=1710778165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJqpmJtgmVhNC95Vex/8VJRvWc2nAOnRuBlXFdHMVkA=;
        b=gXZ6rWUQ+psHO56DhDoDvMgBX2brOVtu/Yd3HJX3nlZFkiA0b0nRaoi6NxfJtm2p7A
         3TawN4SycR/X08qsWQxFnkjHTxQY8pQLLB9quAq3kS7LErhmkF6JZCQuKUFhkLHg6/Jn
         wd1LHIC6HmkEJEKdffaDfqiW80uu4W5J2pWrEWeUE+Un4XxbFU2G+VP+7oyPBnq89MZ2
         IGBHSn4qV/aQDt86/SF9b0Smrw5wrmDff/cC/4Y70jwR+UQM1p8yA08/cPipdtkdWZmG
         Nx6qBua1wtN7xOzhyUTfsyZmk8rObzUqhBgUwFUt44/qZSYd5Kjo4RLwDt3JWlofWpBj
         WP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173365; x=1710778165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJqpmJtgmVhNC95Vex/8VJRvWc2nAOnRuBlXFdHMVkA=;
        b=vurPfGsM7WHYm+3vPABmNgF9mGL02YNEoo01pxlW8ougtaPfKNrVJQgEq8zbt/0WZc
         se1eToe71PQD3hYELcw0NEg82ecnnjHLhWQ1IlFNjiMkfQ4/wSeFDOQ/SXGW8ApOS0wR
         mN8MxRiZPLydNUHwkt50Vvr6obn1EjazV8lGVZkE2XNJp0yPLKChDTT/ngMMi0ermq0O
         0AWvIhumPKyvOyBmXfNWAa70fLQTjXeml/wy3pVquadGQxl7tAvf2KT2gHl4vEPoI45D
         OGi03mvxkBmg9NO0/0A1qL1C85WxxQ5Ok1wW2WkuaLuWAXEs/e9EaifQOnG7ng5kag6L
         a87w==
X-Forwarded-Encrypted: i=1; AJvYcCUhhqK60mNNMFMrYexLB9P3CITcmNyR+Yp1jQ1d801qz0WbsKgoqX/qC4s8ViQr01f9qVaQK5UjO6Z+9D01lgBJH7QZdiY+khWIPUvm4EE=
X-Gm-Message-State: AOJu0YxR5dGxgdoMhF6VQda8JZeYx2GodteDkSTDMErIaZHI87MIc7WI
	xCUhLDdW+/F1Ah8kXtCjaY2fnqj07pGN+iqrG71k6xT88CmdKmanUhkJGO9JtrVXQnExo7z7AVg
	=
X-Google-Smtp-Source: AGHT+IGj3cDhbwfLVHu7QpyqTxjrR5MTEWR4A/Nly8OTgqnfr+qJyziQyA95owfAwJIsYClEmermrg==
X-Received: by 2002:a17:906:b7c6:b0:a46:2c22:7ec6 with SMTP id fy6-20020a170906b7c600b00a462c227ec6mr1792493ejb.35.1710173364751;
        Mon, 11 Mar 2024 09:09:24 -0700 (PDT)
Message-ID: <c011ca43-8f5c-47e0-bf54-cb811ef25b98@suse.com>
Date: Mon, 11 Mar 2024 17:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/compiler: deviate the inline macro for MISRA C
 Rule 20.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
 <6e2c0cb6-89de-4429-8f43-c4687a26cefe@suse.com>
 <81b1e9adc87618865c0134fe069d41cf@bugseng.com>
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
In-Reply-To: <81b1e9adc87618865c0134fe069d41cf@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 16:48, Nicola Vetrini wrote:
> On 2024-03-11 08:32, Jan Beulich wrote:
>> On 08.03.2024 09:10, Nicola Vetrini wrote:
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -28,6 +28,14 @@
>>>          },
>>>          {
>>>              "id": "SAF-3-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R20.4"
>>> +            },
>>> +            "name": "MC3R1.R20.4: allow the augmentation of the 
>>> inline keyword in some build configurations",
>>> +            "text": "The definition of this macro named inline allows 
>>> further checking in some build configurations that certain symbols end 
>>> up in the right sections."
>>> +        },
>>
>> With this wording the ID isn't going to be re-usable anywhere else. 
>> Even
>> if the exact same reasoning would apply.
>>
> 
> What about
> 
> "name": "MC3R1.R20.4: allow the definition of a macro with the same name 
> as a keyword in some special cases"
> 
> and
> 
> "text": "The definition of a macro with the same name as a keyword can 
> be useful in certain configurations to improve the guarantees that can 
> be provided by Xen. See docs/misra/deviations.rst for a precise 
> rationale for all such cases.
> 
> and then..
> 
>>> +        {
>>> +            "id": "SAF-4-safe",
>>>              "analyser": {},
>>>              "name": "Sentinel",
>>>              "text": "Next ID to be used"
>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>> index 16d554f2a593..e3d9f9fb8e4b 100644
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -82,6 +82,7 @@
>>>   * inline functions not expanded inline get placed in .init.text.
>>>   */
>>>  #include <xen/init.h>
>>> +/* SAF-3-safe MISRA C Rule 20.4: define the inline macro to perform 
>>> checks */
>>>  #define inline inline __init
>>>  #endif
>>
>> I don't think the definition is "to perform checks"; it's rather to 
>> make
>> sure checking elsewhere wouldn't (seemingly) randomly fail. 'Override
>> "inline" for section contents checks to pass when the compiler chooses
>> not to inline a particular function' perhaps? Albeit that's getting
>> long-ish, I fear.
> 
> put this message in deviations.rst
> 
> is this proposal more appealing?

I think so, yes.

Jan

