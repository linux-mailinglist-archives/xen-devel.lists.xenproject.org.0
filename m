Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3DA8B94C1
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715558.1117282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q50-0000zt-PE; Thu, 02 May 2024 06:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715558.1117282; Thu, 02 May 2024 06:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Q50-0000y0-MP; Thu, 02 May 2024 06:38:06 +0000
Received: by outflank-mailman (input) for mailman id 715558;
 Thu, 02 May 2024 06:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Q4z-0000xu-2h
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:38:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8729118e-084e-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 08:38:04 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41bca450fa3so37820505e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:38:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020adfe34c000000b00343d6c7240fsm431229wrj.35.2024.05.01.23.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:38:03 -0700 (PDT)
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
X-Inumbo-ID: 8729118e-084e-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714631883; x=1715236683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgNSONZvYMrYXUmiqnhAKX2GzQFE5R07z74If2PXkfM=;
        b=cbH3wfqY/TZi5k7gydIiDSmpmqkbRe7MVCw9rFoPENFbwevLfPM1LkhPopylw11J3W
         s+2zBLYUJPLdZhF2gqsjeA9wohGXlB5HI7oBZN6xKt3lWqteH7GfY7g45N8lHvzV84BW
         kQF5ND7Vt+MbgpmRixGiTMojK5KXPsf+4c4AzXmdPH+6UoLJ5ELLD/dr/JLI1rYmyLfn
         s7JzgS2yVKi0o+Zjq69V4vPXPd7jkayRxv8QdNpjjkZsBb45qISQTe+1BBuhAcIZYwps
         qV+GPNbJmrvEIQJ67YGz/s4x6mSOzTtjNwtmUMob0gSRP9c9TDYLgPZ92uLVu4uzs4SW
         qUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714631883; x=1715236683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgNSONZvYMrYXUmiqnhAKX2GzQFE5R07z74If2PXkfM=;
        b=BV3OIGL0Y8UPYeQZqHYcydzqwATz0QjupCliNd0ElPCTJ/ajcPhiyUbncURtEqmuNS
         lIZSqf9YVl6S3o3bvH/W6ENscTW5cX0MwFVk8xur378piDRKxpd/xnFr1HgjZc+ko8mb
         9cRSmVzHhP+er/Xlm2MhwcqsHcppzzdVy5Giw5ZjaWO8mKXWjOjiv7s76r9sSNM2YiBZ
         aRWMfMJMsX6fVYKu9F4cLfM+mZ8i8YmeMv8SAa2WEFhTzlcPyYeN+MLgSQ54z33ehGq3
         6J0q+yFDDb543qIewlUwlaDVYphoGioCnGGpbMVnPWSDgbA4opfgiiv/KkDk05My/2Q+
         N1lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOyCa3ZpiovAbCJh0fJXlmIBkBdwuo/KP2F9awNfUzGdidNLfToDCRd4NB1cLjcU74Owdn9olOrWaKRO+MChNnRHWRFY2Qw9ZkfgemnTM=
X-Gm-Message-State: AOJu0YzaVPjCPxENS3ypvGrDvmL+4rcX7dHb27BjVZnFyzBfcRFKqXeZ
	bC5QaXyVYe2dNEKEssi1Qb+UkXJ5Y48c28o/IQ0RZTLuPEfOekzBPTCKNlZGhw==
X-Google-Smtp-Source: AGHT+IE3u5DmjeLLM+wW/7k4BjXiZZGTxrUm+IOyXWWfZyBnK1EaG9KUyOrQ6S/jkv7k7vVZxbJyvQ==
X-Received: by 2002:a05:600c:1ca6:b0:41b:f979:e359 with SMTP id k38-20020a05600c1ca600b0041bf979e359mr3280074wms.38.1714631883548;
        Wed, 01 May 2024 23:38:03 -0700 (PDT)
Message-ID: <26d11f73-8359-4ab7-9ac2-71b632fe3ef9@suse.com>
Date: Thu, 2 May 2024 08:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-2-luca.fancellu@arm.com>
 <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
 <2AB02E85-2746-4DD6-A821-B858E52A6954@arm.com>
 <16815d66-ffe7-45e9-8311-5d4ed8754d2f@suse.com>
 <C6F3416D-785A-4C1F-96B9-1C7A53B927EA@arm.com>
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
In-Reply-To: <C6F3416D-785A-4C1F-96B9-1C7A53B927EA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.05.2024 08:23, Luca Fancellu wrote:
> 
> 
>> On 2 May 2024, at 07:09, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.05.2024 08:54, Luca Fancellu wrote:
>>>> On 30 Apr 2024, at 12:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 30.04.2024 13:09, Luca Fancellu wrote:
>>>>> --- a/xen/include/xen/kernel.h
>>>>> +++ b/xen/include/xen/kernel.h
>>>>> @@ -54,6 +54,27 @@
>>>>>        typeof_field(type, member) *__mptr = (ptr);             \
>>>>>        (type *)( (char *)__mptr - offsetof(type,member) );})
>>>>>
>>>>> +/**
>>>>> + * __struct_group() - Create a mirrored named and anonyomous struct
>>>>> + *
>>>>> + * @TAG: The tag name for the named sub-struct (usually empty)
>>>>> + * @NAME: The identifier name of the mirrored sub-struct
>>>>> + * @ATTRS: Any struct attributes (usually empty)
>>>>> + * @MEMBERS: The member declarations for the mirrored structs
>>>>> + *
>>>>> + * Used to create an anonymous union of two structs with identical layout
>>>>> + * and size: one anonymous and one named. The former's members can be used
>>>>> + * normally without sub-struct naming, and the latter can be used to
>>>>> + * reason about the start, end, and size of the group of struct members.
>>>>> + * The named struct can also be explicitly tagged for layer reuse, as well
>>>>> + * as both having struct attributes appended.
>>>>> + */
>>>>> +#define __struct_group(TAG, NAME, ATTRS, MEMBERS...) \
>>>>> +    union { \
>>>>> +        struct { MEMBERS } ATTRS; \
>>>>> +        struct TAG { MEMBERS } ATTRS NAME; \
>>>>> +    } ATTRS
>>>>
>>>> Besides my hesitance towards having this construct, can you explain why
>>>> ATTR needs using 3 times, i.e. also on the wrapping union?
>>>
>>> The original commit didn’t have the third ATTRS, but afterwards it was introduced due to
>>> this:
>>>
>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231120110607.98956-1-dmantipov@yandex.ru/#25610045
>>
>> Hmm. Since generally packing propagates to containing compound types, I'd
>> say this cannot go without a code comment, or at the very least a mention
>> in the description. But: Do we use this old ABI in Xen at all? IOW can we
>> get away without this 3rd instance?
> 
> Yes, I think it won’t be a problem for Xen, is it something that can be done on commit?

Don't know, maybe. First you need an ack, and I remain unconvinced that we
actually need this construct.

Jan

> Anyway in case of comments on the second patch, I’ll push the change also for this one.
> 
> Cheers,
> Luca
> 


