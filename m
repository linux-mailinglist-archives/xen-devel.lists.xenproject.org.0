Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08788911B50
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 08:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745034.1152162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXaJ-00017W-GA; Fri, 21 Jun 2024 06:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745034.1152162; Fri, 21 Jun 2024 06:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKXaJ-00014f-Cy; Fri, 21 Jun 2024 06:17:19 +0000
Received: by outflank-mailman (input) for mailman id 745034;
 Fri, 21 Jun 2024 06:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKXaI-00014Z-2w
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 06:17:18 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7db64ca-2f95-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 08:17:16 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so18366861fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 23:17:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706512549f1sm631391b3a.122.2024.06.20.23.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 23:17:14 -0700 (PDT)
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
X-Inumbo-ID: e7db64ca-2f95-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718950635; x=1719555435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rqC3zgvUttbWYziRuiKxsu06lEb9STwqNvJSXaDHAIk=;
        b=NSBQWUi7eB2l3k8+P0/NiqwEXswXaU3dGwETB+GhvS7l38IvhfjR55ldhTc6GF8Slp
         m1oEpyVjRnR1X1SYa1KuhXhBQo8BXf0IMvO5zKLeL+FB1IU0zaGCqbt66/dWx8npUiz+
         ucaAJAOq9P9X+KiqRJf29WHVo4YxmIariQuAEKvqip7znAB62YHBdJTtR61T6nZgUPR4
         PJwdVoD9qALvNXmmxdvmddUI/6bRRSyW2ocYLXPgH708KuYH6XqGVnIs2GTgyv3GVPY5
         0oQJr0NqCjVJj/S3jcirfcdgmV9tqvECGLzqqVV2q+rnQXt849+bNiRMSiNwCC8vkeBm
         ZYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718950635; x=1719555435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqC3zgvUttbWYziRuiKxsu06lEb9STwqNvJSXaDHAIk=;
        b=Zj7Kc105DVvdUsuKsvpyd4SzXry3U7GwhWXRXCddhi7cIJMfSekYzYzoiS6tewPliX
         KNtL0EqJt68zXjfEvHXEb5ZqWs00GLhSRtPMU6U8tyOfZ0qsrej94LpHE9f2/Gly2YHm
         DPCPOd0ePuxEw9F8Iw42hIUgEdjW9ZX08l4NPKiDuAuWYMKGGK/BfX9fpBRH658AUg2Q
         WBnO9Im7W1co+4kGbu7NoW86lJyAgRq95dKCB8zWW2V6Qi8GitOrHxw5a5btqt8aCami
         q3aGoXIPXPlk7Y9fL7OQ/mCHMTYTi+Ga9Oehf+sjApMfQXvlFTNK02UIX4SGVUcqXIsf
         GybA==
X-Forwarded-Encrypted: i=1; AJvYcCVxYeFL9QE7XBQyLgQL9iwkq44H4Sp9ojcR4zygkt+TBkpe6vLjwdqy0Xmz4I9PRMlMjPspx62m/2B5Skzu92+8EuP0xBF8BdW/frJzOYE=
X-Gm-Message-State: AOJu0Yw28nhkOsOKWlaPLMJKBqJJSR5eit1Vi5WSHozTtUzeholTW8si
	H6XfcQ69r3z45bA27I4S8qt38Qvbkm+j+Wym4eFJ96XHemEE1WhU8Nu+t2BlWPOHD6ommkSdP/U
	=
X-Google-Smtp-Source: AGHT+IHmzxsofj+tqEa9rW41ypM1AckdKzp7Fu/1jdhR/QH4se2eDZPcNk14fEB7o93EDfURJVQ1KQ==
X-Received: by 2002:a2e:9dc1:0:b0:2ec:4d48:75ec with SMTP id 38308e7fff4ca-2ec4d487811mr5514001fa.22.1718950635238;
        Thu, 20 Jun 2024 23:17:15 -0700 (PDT)
Message-ID: <650b7946-ddb5-4428-b6d9-d8f6e0b0f8b9@suse.com>
Date: Fri, 21 Jun 2024 08:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule 21.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
 <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com>
 <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com>
 <alpine.DEB.2.22.394.2406201758490.2572888@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406201758490.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 03:02, Stefano Stabellini wrote:
> On Thu, 20 Jun 2024, Jan Beulich wrote:
>> On 19.06.2024 19:09, Alessandro Zucchelli wrote:
>>> Rule 21.2 reports identifiers reserved for the C and POSIX standard
>>> libraries: all xen's translation units are compiled with option
>>> -nostdinc, this guarantees that these libraries are not used, therefore
>>> a justification is provided for allowing uses of such identifiers in
>>> the project.
>>> Builtins starting with "__builtin_" still remain available.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>> ---
>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 447c1e6661..9fa9a7f01c 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
>>>  # Series 21.
>>>  #
>>>  
>>> +-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
>>> +standard libraries: if these libraries are not used there is no reason to avoid such
>>> +identifiers. All xen's translation units are compiled with option -nostdinc,
>>> +this guarantees that these libraries are not used. Some compilers could perform
>>> +optimization using built-in functions: this risk is partially addressed by
>>> +using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
>>> +still remain available."
>>
>> While the sub-section "Reserved Identifiers" is part of Section 7,
>> "Library", close coordination is needed between the library and the
>> compiler, which only together form an "implementation". Therefore any
>> use of identifiers beginning with two underscores or beginning with an
>> underscore and an upper case letter is at risk of colliding not only
>> with a particular library implementation (which we don't use), but
>> also of such with a particular compiler implementation (which we cannot
>> avoid to use). How can we permit use of such potentially problematic
>> identifiers?
> 
> Alternative question: is there a way we can check if there is clash of
> some sort between a compiler implementation of something and a MACRO or
> identifier we have in Xen? An error or a warning from the compiler for
> instance? That could be an easy way to prove we are safe.

Well. I think it is the default for the compiler to warn when re-#define-
ing a previously #define-d (by the compiler or by us) symbol, so on that
side we ought to be safe at any given point in time, yet we're still
latently unsafe (as to compilers introducing new pre-defines). For
built-in declarations, though, there's nothing I'm aware of that would
indicate collisions.

> Also, can we use the fact that the compiler we use is the same compiler
> used to compile Linux, and Linux makes extensive use of identifiers and
> macros starting with underscores as one of the reason for being safe
> from clashes?

I think we could, but I don't think we should.

Jan

