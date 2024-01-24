Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEA83A436
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670786.1043785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYhr-00006A-6t; Wed, 24 Jan 2024 08:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670786.1043785; Wed, 24 Jan 2024 08:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYhr-0008W9-3x; Wed, 24 Jan 2024 08:33:59 +0000
Received: by outflank-mailman (input) for mailman id 670786;
 Wed, 24 Jan 2024 08:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYhp-0008W3-H9
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:33:57 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f919803-ba93-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:33:55 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso30421131fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:33:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r12-20020a02c84c000000b0046eda09d55esm2032632jao.179.2024.01.24.00.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:33:54 -0800 (PST)
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
X-Inumbo-ID: 4f919803-ba93-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706085235; x=1706690035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4itC0/tZEuJvr9+EnBUlbZyPDZ+08fGFmkYm3tJ3z8=;
        b=C0v4+eWbXhkovKR/EeDh4HKA0bNWOqIzOJAtTbdpM9y4nZw3WUtxWcJad5AQk3pqJo
         iJoOtzZOJb4EIu1H9bWTw8wna3Zg5pVFaUdYGdu5CUy0c/K7IuTApJuKyd8L27Gd+GwL
         0tLLAVBrXz600/9j576FI5wqHHy7yiz66SPtnUxA8TP+as1fAni9j12ILt42x+0hppbn
         MX8XQRTP6F3C/xmuM9/orBB5K4FB9JYtV2NK4Uwg0brPqFIHqYD+iCLdcDDCVuCrYlC/
         0tkBZfixJrQcOUN8N8DgOvLb8q1DRQuYkxl5RTbeoNP6fKAv+kC4gObWHrPdjcGUxiq2
         NfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706085235; x=1706690035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4itC0/tZEuJvr9+EnBUlbZyPDZ+08fGFmkYm3tJ3z8=;
        b=PVLRnV7i+KiskRdt/RqQtI1qQMucxKcUYwhqYQtWLL/ob+uty81t6fhTPZk1f0uhz/
         MzAyBBWURRnPXX/ifXu3Gps5ZFhCJ8xiO2OsMe2ke4w/D/4OeHegtkQWCf0+hcT9eiFH
         /R/eFQLuc9Hund628Hz5gF6LVjyM4i9j1skClwJBpMUxYby7R2x8SIr+hPN1TxQkZzKC
         Xfx+t+QiLG2/ewsxfo3FA7rcY5HW6xrm9yXVsht/0Jtls4m56VUdifb4D72OQyWWAEEI
         RBc464rBsJFby0mY27GDbeM6IlTyxOsuCY1yX/C5Z2w2cuIcO1FLjWvZQ5CVOLB9zheS
         BVbg==
X-Gm-Message-State: AOJu0Yx+LntSMHn5Sn8OUjCfhWnsGwZEgtIIK9gpwzL/qJ2NcdDmz+oE
	aHylOATITS6jng7G4GTnXtOOgnUHHwEUbkxZPlLqIsZk87rHbW9PwXA35CaGSg==
X-Google-Smtp-Source: AGHT+IH105wsbQyuHQgtSWwCTXuy/ooq90Uks6Q92kak+9YmSpmUKZ6rqVA7fqY0hVVTYRvVMz/+1Q==
X-Received: by 2002:a2e:a784:0:b0:2cd:e935:ea02 with SMTP id c4-20020a2ea784000000b002cde935ea02mr766937ljf.20.1706085234901;
        Wed, 24 Jan 2024 00:33:54 -0800 (PST)
Message-ID: <652d50ad-33a4-42cd-bf88-e06cc53ffd7f@suse.com>
Date: Wed, 24 Jan 2024 09:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] xen: introduce static_assert_unreachable()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1705930767.git.federico.serafini@bugseng.com>
 <01c57c7e5131d699cf622be96fea7cd8e03c23f9.1705930767.git.federico.serafini@bugseng.com>
 <d4e5b1c0-bb44-4482-b86f-ff9f0947f338@suse.com>
 <11660006-7651-4562-9e14-0d7b22788feb@bugseng.com>
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
In-Reply-To: <11660006-7651-4562-9e14-0d7b22788feb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 09:20, Federico Serafini wrote:
> On 22/01/24 15:02, Jan Beulich wrote:
>> On 22.01.2024 14:48, Federico Serafini wrote:
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -64,6 +64,14 @@
>>>   # define fallthrough        do {} while (0)  /* fallthrough */
>>>   #endif
>>>   
>>> +/*
>>> + * Add the following macro to check that a program point is considered
>>> + * unreachable by the static analysis performed by the compiler,
>>> + * even at optimization level -O0.
>>> + */
>>> +#define static_assert_unreachable() \
>>> +    asm(".error \"unreachable program point reached\"");
>>
>> Did you check the diagnostic that results when this check actually
>> triggers? I expect it will be not really obvious from the message
>> you introduce where the issue actually is. I expect we will want
>> to use some of __FILE__ / __LINE__ / __FUNCTION__ to actually
>> supply such context.
> 
> The assembler error comes with file and line information, for example:
> 
> ./arch/x86/include/asm/uaccess.h: Assembler messages:
> ./arch/x86/include/asm/uaccess.h:377: Error: unreachable program point 
> reached
> 
> At line 377 there is an use of get_unsafe_size() where I passed a wrong
> size as argument. Is that clear enough?

Hmm, yes, looks like it might be sufficient. Mentioning __FUNCTION__ may
still add value, though. But I see now that __FILE__ / __LINE__ are
already covered for.

> What do you think about modifying the message as follows:
> "unreachability static assert failed."

I'm okay-ish with the original text, and I like it slightly better than
this new suggestion. If we want "static assert" in the output, then maybe
"static assertion failed: unreachable".

>> Also: Stray semicolon and (nit) missing blanks.
> 
> It is not clear to me where are the missing blanks.

Just like for other keywords:

    asm ( ".error \"unreachable program point reached\"" )

Jan

