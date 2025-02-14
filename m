Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC99A357FD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888434.1297793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqIJ-0000ke-5Q; Fri, 14 Feb 2025 07:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888434.1297793; Fri, 14 Feb 2025 07:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqIJ-0000jC-2F; Fri, 14 Feb 2025 07:39:27 +0000
Received: by outflank-mailman (input) for mailman id 888434;
 Fri, 14 Feb 2025 07:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqIH-0000j6-Jk
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:39:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cffdddd3-eaa6-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:39:24 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso303192966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:39:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d96dsm286201866b.153.2025.02.13.23.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:39:23 -0800 (PST)
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
X-Inumbo-ID: cffdddd3-eaa6-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739518764; x=1740123564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8rCWxaVIZFSBDuBVkEj7l1v/IsQcdzLce2cjtusYlw=;
        b=ThFDKQWuGzPu6zLbhC+VcSNgM1Hv6c8WnDtUj69tTuUAbQy9geul5BNchEAuG/daGh
         o9MkwgcuivA43BO8UspbR3Uoo8oy4h3j/CM+Op9Zv1vI/HVRQz7U7gosjVSYsETs+Wj1
         qNaIDMt8gBmD/agbrO/+qUm3LdemG0h+ia2PJVA0zMxNvnbJF2qfXkJq8xyrjkZmbcU/
         RX7zIBD8AUKpPsw7cUq9lmZCsm8yGCU+DxyQAqqXzXHcIU262OeHnCxVmZPzunL1dN1W
         CWmcQMdjrdDA/BlMHuwfRHB8nxpUP46J273tRBsbdfEp6GbDOVKz4mg0NJQk97n3D19c
         3OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518764; x=1740123564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8rCWxaVIZFSBDuBVkEj7l1v/IsQcdzLce2cjtusYlw=;
        b=lSkzyp/Vuula4O3YvMoSwvteD3hDnfRP4h5J6FDRarRJ7OI0VjvBKgqKe6F4FgdZJm
         4a1lbIjBuwqRnM8Js0qMEBfvRg56ypqRZkK13wTZo4QAYxxbOfRYAwKulHU52M4U27tG
         Q9G2kt7KSQqj6qUdYKNOzuPiyERH3Qk0CIk57x/YPyjZqFvKLJb+WI6smKjWN0aNTOHe
         EOpsvrN74XIzeqid54xr1zTJ0IYpI+rE1pdX5ABrE00Eh5PXSmzeBn2KDBXE9aq/KaU4
         rT4tZLlPZtTebYb8PlSryBRiP8wsLrGf5iwXYipooleKmPlNhztw+Ub9lpFXK+lPzWqS
         Maxg==
X-Forwarded-Encrypted: i=1; AJvYcCX677aEiLYmSrjuu0RGTyw2S3pezlYz3oSgQuPPoWB6QgKF6FwFQ8fSLbqVRkYGC97/HmeSss6QzYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+CCowKVFGg5eH4/gAcYf8+RjX6rXelgi4OZmJs4oVFt8KYkj4
	Y3g7rFkAK2jyjK0s8Ir6mTfId4bvBKUPhIIVNeZqA7VSzaRi9Ju4V94o0BBY9A==
X-Gm-Gg: ASbGnctsSLBq/qF8uSe2QB+VqaH5VvzW/Z85sNLguY4ZoHyBo/QYCdk/Ow8PqyqFkBF
	hzb6qawdRYCTS8zDvzG+Stc42vwH6D0z20dDP7aWgCgUZ8wtepQ1RQiCjE3NThl4HX/Bphb2bxe
	wTBwtF+cm3aUaDQzfo69lXummsrI9Acusl1AdxWzeQUGaU8QfhQeP9tTwFcM90GmkVG3tl6iCB7
	45ZTn1GC76NkhiAjj+k5DIccp9nX17zpNhePJ8E0EHzmsBuoNcQa6wDhV7QU4WblCTcwo9z195S
	10ttVzDR3StlB9c9BzAuItpVuGXd9u3ZPYwdvodrRCbexCuHKObYFdcFCqfDYGqlEY+hLbVy7oQ
	G
X-Google-Smtp-Source: AGHT+IHotd4GbHrXlkfd9CvSyLwOcyrJbNh+knbt9TFPjhD1+Sr+hHvve+8BclByxEcTcLFR7dmFpg==
X-Received: by 2002:a17:906:c14c:b0:ab6:362c:a8ab with SMTP id a640c23a62f3a-ab7f33f651fmr1027479466b.29.1739518764183;
        Thu, 13 Feb 2025 23:39:24 -0800 (PST)
Message-ID: <c2e8a794-d7a0-47b8-b93a-a65a72f7a89b@suse.com>
Date: Fri, 14 Feb 2025 08:39:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, nicola.vetrini@bugseng.com
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2025 04:00, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Stefano Stabellini wrote:
>>>> diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
>>>> index f4c5ff848d..2ccd490e5d 100644
>>>> --- a/xen/arch/x86/cpu/mcheck/mctelem.h
>>>> +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
>>>> @@ -52,7 +52,7 @@
>>>>   * the element from the processing list.
>>>>   */
>>>>  
>>>> -typedef struct mctelem_cookie *mctelem_cookie_t;
>>>> +typedef uint64_t *mctelem_cookie_t;
>>>
>>> Yet that makes it possible to de-reference the pointer. Which, as Andrew
>>> explained, is intended to be impossible. If this could be properly
>>> replaced (not exactly what Andrew indicated by "file it in /dev/null"),
>>> fine. Truly purging the code (i.e. as Andrew suggests) may still be an
>>> option, with appropriate justification. But simply adjusting the type
>>> and then moving on is too little, imo. Even if you used void * (to make
>>> de-referencing impossible) I'd view it as largely papering over an issue;
>>> then converting to other pointers (without explicit cast, and hence
>>> without making apparent the badness of doing so) would become possible.
>>
>> What about converting to uintptr_t (not a pointer)?
>>
>>
>> In general, there are quite a few MISRA rules that we could mark as
>> blocking (clean) in our GitLab scan with just a few code changes like
>> this one. My goal is to make these rules blocking as soon as possible.
>> If I can improve the code in the process, that is even better, but it is
>> not mandatory. And I would rather spend one more hour marking a second
>> rule as blocking instead. 
>>
>> What I mean is that I believe it would be acceptable to make some
>> compromises and accept non-perfect changes to the code if it helps us
>> enforce more rules as blocking in GitLab CI.
> 
> After briefly speaking with Andrew about this, and re-reading Jan's
> email above, I think it is best to resolve this as a deviation.
> 
> Would this deviation work for you? Please suggest a better wording if
> you prefer.

Sounds reasonable to me; one nit below.

> Nicola, in reality I think it would be better to use deviations.rst
> because the SAF comment below would need to be replicated at every call
> side, if I am not mistaken.

If replication indeed would be needed, I agree doing it the other way
might be better.

> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -92,6 +92,14 @@
>          },
>          {
>              "id": "SAF-11-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.2"
> +            },
> +            "name": "Rule 11.2: purposely impossible to dereference",
> +            "text": "Certain pointers points to incomplete types purposely so that they are impossible to dereference."

Nit: s/ points / point /

Jan

