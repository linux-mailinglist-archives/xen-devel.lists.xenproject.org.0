Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485939399D9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 08:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762637.1172853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW9AU-0001rR-41; Tue, 23 Jul 2024 06:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762637.1172853; Tue, 23 Jul 2024 06:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW9AU-0001pw-1H; Tue, 23 Jul 2024 06:38:38 +0000
Received: by outflank-mailman (input) for mailman id 762637;
 Tue, 23 Jul 2024 06:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rd17=OX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sW9AS-0001pl-Si
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 06:38:36 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f5c1ec4-48be-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 08:38:34 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so2385166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 23:38:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c917fd1sm501789366b.151.2024.07.22.23.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 23:38:33 -0700 (PDT)
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
X-Inumbo-ID: 2f5c1ec4-48be-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721716714; x=1722321514; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JvsPOLHO4JZdXg1CzUSHXhI3NoYqUBa7NCaPlCwzZT0=;
        b=ItvYW0Bsz5ZH85anZWZMwmXIb9QJBy5TFvUR8DaWuiSooNRfEA3kG1GmXX/LLlIb7u
         3q7GN5jddY6CyYPIOMggVAV00gCzogWX9IL1sSCMwTS9G7UEK4y3dlYJl66v7G5Tugsc
         wsnE115zwVczeN4W/7lkeRiKnqME3Yb4DtKWW3AfaUlWWwe4Rwf6/EUYyxl+z5PVqF9I
         JG3B76OMlD7R9cPe0KwsTY6bKc88bVR3I8sFpBJw2AaPTZIy2kzhkTa84ddo/e6rQLgP
         sCmPSatOYixBP/iU0pmfhMdSDQ3Unywub6UFJUmv9NjLkYqyzQOH3QBVj/h8HPJJX1mV
         xWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721716714; x=1722321514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvsPOLHO4JZdXg1CzUSHXhI3NoYqUBa7NCaPlCwzZT0=;
        b=Y5UeJoFjm0XPElE1rmKdRApVxlwDqdtFH1/M/tv4esMHmyDDBf+LHSNiEIV5ETGd1t
         c5Xj6HY58eA40abpL4fgadZHxSm7l4d34Ns9uPZiKwWFxxLp0J/9r0oyoMA6p6YXbxkJ
         zRcBZy9W5wOc7JzgczLXziaxXSQk95kcrDOFwWRryldSbUfcrGYz889PJE2M+A9ab2/H
         YnVFpii0oV/tM4XdjZMujIcIowSKhIy69PATkSsI9BFYOxhwZb0f42Uwu6AyZ9gpijEF
         5G/IAUCVtFNoVxnT6nIm1gioHIEfZqusp6kTWwmKs6lR9bj3sMtNh6bC8b/dxmxqeDJi
         /yaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDeYjMMwbKd0diFKIATic3S6XcLy6hYgkSmvJybINQCvqD6fnUY34ExtvmnTZtuPCXvWqu2GPG22h1W/5YLGGjc768UihnSCnkw5mkCKk=
X-Gm-Message-State: AOJu0YycQJ5BuGXhOblxkcpztzYpZzZl4JYveJmRbiZQig93FixN5/GR
	/6i3da03tBzyjjipe1aPVCogDadFT3AmT4SmGYIu9kqZ9gJASjk+MDgBNcfafg==
X-Google-Smtp-Source: AGHT+IHhyY7fMS5olQyGKrXxy1DBuLtT+jw+VOxIaKdieC+D/pg+XCf8vQN7daXH6PO7PrWuf5tfgg==
X-Received: by 2002:a17:907:3f1e:b0:a72:50f7:3c6f with SMTP id a640c23a62f3a-a7a87c841c9mr144124666b.14.1721716714245;
        Mon, 22 Jul 2024 23:38:34 -0700 (PDT)
Message-ID: <89c3a016-11ea-4c05-95c9-3941fd194fb6@suse.com>
Date: Tue, 23 Jul 2024 08:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arch/domain: Clean up the idle domain remnants in
 arch_domain_create()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
 <20240718215744.3892072-5-andrew.cooper3@citrix.com>
 <be94ac73-cb8f-4bb3-a529-4c3b47a939b3@suse.com>
 <e3f64d67-75eb-4c7b-97fb-ca39edb5ddb9@citrix.com>
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
In-Reply-To: <e3f64d67-75eb-4c7b-97fb-ca39edb5ddb9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 19:46, Andrew Cooper wrote:
> On 22/07/2024 8:23 am, Jan Beulich wrote:
>> On 18.07.2024 23:57, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -791,23 +791,6 @@ int arch_domain_create(struct domain *d,
>>>  
>>>      spin_lock_init(&d->arch.e820_lock);
>>>  
>>> -    /* Minimal initialisation for the idle domain. */
>>> -    if ( unlikely(is_idle_domain(d)) )
>>> -    {
>>> -        arch_init_idle_domain(d);
>>> -
>>> -        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>> This line looks to be lost in the process. Already in an earlier patch it
>> should move to arch_init_idle_domain(), shouldn't it? With that adjustment
>> for the entire series:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> It was semi-intentional.  cpu_policy is just one of many pointers, and I
> don't see a good reason for it to be treated specially.
> 
> It's been around for years now, and never one triggered, not to mention
> the fact that there's a dwindling set of machines where a dereference of
> 0 isn't instantly fatal anyway.

Okay, yet would you mind mentioning this removal as intentional then in
the description?

Jan

