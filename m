Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2938271C0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663559.1033520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMquE-0001KH-FR; Mon, 08 Jan 2024 14:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663559.1033520; Mon, 08 Jan 2024 14:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMquE-0001Ii-BK; Mon, 08 Jan 2024 14:47:10 +0000
Received: by outflank-mailman (input) for mailman id 663559;
 Mon, 08 Jan 2024 14:47:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMquD-0001GW-49
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:47:09 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb7c7c4b-ae34-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 15:47:07 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cd56dac1adso10353441fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:47:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dp37-20020a0566381ca500b0046b4976c3ccsm2222810jab.138.2024.01.08.06.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 06:47:06 -0800 (PST)
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
X-Inumbo-ID: cb7c7c4b-ae34-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704725227; x=1705330027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBXcbuxcbGslj3Eq8Kn1uWjpLhwG0M/KZtqzHxQOPP0=;
        b=a3oQgdCNfLr+pTjmNHeNyqGFk+9slPPgwcpuIrpXwYhD1rv7Ic2bhboyH729Mfads5
         HvHm83udwT0NwWzxza5tX0jmxBAvD5FmS51Ty4G7+GsNKFfXylzkIPnJJmkoiTzMkDZS
         Ld7WpJ1h0g/I1uQQ9VSOO3gHG2kRaWkjsmRsXRiD8hY/bdeRNVgtypPxYAnxGCVwf/QN
         xRMZ+PpO37NgkdIQy3g261kIv5yqRfUHMtd/tJ4hgv99yLBKbCDBClYyPq94D+GnXbwO
         6mQ5cEbAbDRdf+1KuSWcb86AiVmCaSkqoYtFrzOosIz5tmd2qVnXL/0OsDwr2f4qyDUk
         3ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725227; x=1705330027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBXcbuxcbGslj3Eq8Kn1uWjpLhwG0M/KZtqzHxQOPP0=;
        b=qfij6RjSNqO32BY9cyrkzQzXbLWLQ52+rsfMt0qUTx0gRY5Z3WX5VwPOWv5N+MFIRu
         lzVcsp97jhFrY8XB9PN7d0hNqC9B6fi7eJ2ohLDk371WYqzyWUhTmb2iRQhflSOlsGiN
         +w+CX14bsKICSNm1vCKzYwrY4Ih+ixmB1Y6URVXU4GYPTpgnTQ3dlX/4Md37dwifvYMr
         xX+z4yVJAJttHYf/Sn63dyeximbVYW4KBmtlle66mfszQ3B9okgzQsVg9/Z52XVUaZ/p
         PwCcMESHaR/4bWP/8G9NeukKcI6E2m1sKsBdb3Iyb5JsrAGuuREJCC20YJtcbmLhnNWR
         HKMg==
X-Gm-Message-State: AOJu0Yx00iYt9uqP6y+iN+K99FpVeWRBUS528tzSguKlgXGwNV51pL8r
	CbR3IToiRUVKrJtocM5EFyUBU3fRP65qk0LILUnyH7hNWQ==
X-Google-Smtp-Source: AGHT+IHiL/URIUOYDElLOx9ZdJFlomqnatzcJgkeedN/mfVIrMybyfc6yqnfgh77ZWPwAXEANjMKbA==
X-Received: by 2002:a2e:8710:0:b0:2cc:a7ee:ce68 with SMTP id m16-20020a2e8710000000b002cca7eece68mr1891332lji.67.1704725226735;
        Mon, 08 Jan 2024 06:47:06 -0800 (PST)
Message-ID: <6889e19d-c6d4-43f0-9752-738d2a54e311@suse.com>
Date: Mon, 8 Jan 2024 15:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: limit first_valid_mfn exposure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
 <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
 <0872306a-fefb-424b-b27a-b67ba21828c7@suse.com>
 <829125ea-c220-47e9-a9f4-343126787f27@xen.org>
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
In-Reply-To: <829125ea-c220-47e9-a9f4-343126787f27@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 15:13, Julien Grall wrote:
> Hi Jan,
> 
> On 08/01/2024 11:43, Jan Beulich wrote:
>> On 08.01.2024 12:37, Julien Grall wrote:
>>> On 08/01/2024 11:31, Jan Beulich wrote:
>>>> Address the TODO regarding first_valid_mfn by making the variable static
>>>> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
>>>> x86).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Julien suggests something like
>>>>
>>>> STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;
>>>>
>>>> but I view this as non-scalable (or at least I can't see how to
>>>> implement such in a scalabale way) and hence undesirable to introduce.
>>>
>>> I don't really see the scalability problem. Can you explain a bit more?
>>
>> Well, when seeing your original suggestion, I first considered it quite
>> reasonable. But when thinking how to implement it, I couldn't see what
>>
>> #define STATIC_IF(cfg)
>>
>> should expand to. That's simply because a macro body cannot itself have
>> pre-processor directives. Hence all I could think of was
>>
>> #ifdef CONFIG_NUMA
>> # define static_if_CONFIG_NUMA static
>> #else
>> # define static_if_CONFIG_NUMA
>> #endif
>> #define STATIC_IF(cfg) static_if_ ## cfg
>>
>> And I think it is easy to see how this wouldn't scale across CONFIG_xyz.
>> Plus that that point STATIC_IF() itself would be pretty much redundant.
>> But maybe I'm simply overlooking the obvious ...
> 
> You can use the same trick as for IS_ENABLED. The code below will select 
> static or nothing:
> 
> #define static_enabled(cfg) _static_enabled(cfg)
> #define _static_enabled(value) __static_enabled(__ARG_PLACEHOLDER_##value)
> #define __static_enabled(arg1_or_junk) ___static_enabled(arg1_or_junk 
> static,)
> #define ___static_enabled(__ignored, val, ...) val
> 
> #define STATIC_IF(option) static_enabled(option)
> 
> I have tested both with CONFIG_NUMA and !CONFIG_NUMA to confirm the 
> visibility of the variable will be correct.

Hmm, okay. Then my 2nd scalability concern, in another dimension: What
if static-ness ends up depending on two (or more) CONFIG_*?

Jan

