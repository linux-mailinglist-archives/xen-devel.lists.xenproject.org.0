Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE623A35845
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888506.1297863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqYL-0007JD-Q9; Fri, 14 Feb 2025 07:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888506.1297863; Fri, 14 Feb 2025 07:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqYL-0007Gj-NU; Fri, 14 Feb 2025 07:56:01 +0000
Received: by outflank-mailman (input) for mailman id 888506;
 Fri, 14 Feb 2025 07:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiqYK-0007Gd-M6
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:56:00 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20a1bde5-eaa9-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:55:59 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5de38c3d2acso2856432a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:55:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4483sm2495651a12.25.2025.02.13.23.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:55:58 -0800 (PST)
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
X-Inumbo-ID: 20a1bde5-eaa9-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739519758; x=1740124558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCGh84ZN2xXKk/UyoXbMjlWvMV+1BtvDjcadgg3L+bE=;
        b=CX4zj+2bdpR+B6Y2zGRnASlUS+YfAhp5pzdMVp+zpMPeW000/brbvNoUh6QFbHi9c8
         VazcgnPcelRrm2UG50G7kJJ8+Gdc/AgDbH6U3g4Kfz1A9dRdM9aaVrZPKxspZZpLYKdb
         Id+pNMiltaDMQOcCNCCviGGlgR5/ddca14aaBC1GRX/c6COay0OqklTFthYojkQgCo0u
         xkmKD7F8tDVBqVJbjIoyEMBa4lE+wh0ehecsxlCCwHpFBcjYq+hu2ROsQgIphS9hrioG
         YyE/xhNanTYlkzuITWmGEAXm0CBBvRqZlJukGDMO0z1nChR0GKoXvXI+5MCc8DR8xWlE
         KXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739519758; x=1740124558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCGh84ZN2xXKk/UyoXbMjlWvMV+1BtvDjcadgg3L+bE=;
        b=aH9iUrWFk6PZ/Kvo9CfD52NPHhYw55OtG01pxN6IsJXt2Vvi9UgfnyC+OXT9Z/3IOI
         oRuGkx7FLQuO9q+7z4HK1+zGFshIXNsAXqe17OSgNnn/qODy0huwjpV9oNbWvLw1iFrI
         KDLQnDbxm8DyAttMzn+itokRLu/oOWocARkOINd3vwJ/V5IJ3DaJyhXGfaFNNdjuw+Iw
         i7QazTVfS/bAyeHdqrBqHhpBPOO4LnQwuPLEsbFO0LOSCRPRpzaTagmhBN/oOEB4ciig
         E4KGKajAgjibXepEWuatOdenPMwYCLlKr4+FHuMyKUfPFcn+iky1o73NO6m2jFFavqT+
         9IgA==
X-Forwarded-Encrypted: i=1; AJvYcCXKmMKhgNJPX0z2hN2O7hkxiY22UwODyriclS7H0yAiYmKjX6khw9yadrdE0O6g3xoCctGKrGyRclo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEHvT9ZJjFizI2Da+vjLeDuMtMwqf+DE83Kz28JwKJSpBo39cP
	0keJHO4QMVFf1O/x7sPUsAPcz7kTfo/9Tp1mZSBVsp6H0usmr2Y41kahcJzlKA==
X-Gm-Gg: ASbGnctTBJsAT7LmidOAkgPREKAacngJGqgefGb5lS3yIUDgD3mBrPwKggbIRkVJCOp
	e7NCYeXZnudmabunqTdJZbQ8xPa7i7rYeFbP6jUBxAwPHu9j3g9uGQqlAtQg0hROkf2EkPFg6tf
	mhRUHSf0RFAIAhU8YvhMe5DSzzh5SNV5SLPkaZ4NhsBSuF12iPJW8g1/4YWkrjfCKV23+oJFfOA
	P+gScZjeweF5gWCBP64qRQoKDGo+Jvi1vy0maaJYJ5OOg7mVVUxHhwofsEk3CD/SkkCbmQ5n5Yq
	5vvWM5fq10cIKx0W+3sU9J1+f+Vo7kGe+n6ambv5nm3S5l0ogxycgx2EobFBH4kP0cq31VMbjmP
	x
X-Google-Smtp-Source: AGHT+IH6JEkrcue2ZNnkarn1/5bZyvIKnuCtWASpoayR+VuV/+LohxRWTVGhuZNpxT8sgrgx3anpCg==
X-Received: by 2002:a05:6402:35c4:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5deadd7b82bmr8026977a12.1.1739519758548;
        Thu, 13 Feb 2025 23:55:58 -0800 (PST)
Message-ID: <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
Date: Fri, 14 Feb 2025 08:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
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
In-Reply-To: <3c883b4587d750c2723637a037fb46b4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2025 08:46, Nicola Vetrini wrote:
> On 2025-02-14 04:00, Stefano Stabellini wrote:
>> On Thu, 13 Feb 2025, Stefano Stabellini wrote:
>>>>> diff --git a/xen/arch/x86/cpu/mcheck/mctelem.h b/xen/arch/x86/cpu/mcheck/mctelem.h
>>>>> index f4c5ff848d..2ccd490e5d 100644
>>>>> --- a/xen/arch/x86/cpu/mcheck/mctelem.h
>>>>> +++ b/xen/arch/x86/cpu/mcheck/mctelem.h
>>>>> @@ -52,7 +52,7 @@
>>>>>   * the element from the processing list.
>>>>>   */
>>>>>
>>>>> -typedef struct mctelem_cookie *mctelem_cookie_t;
>>>>> +typedef uint64_t *mctelem_cookie_t;
>>>>
>>>> Yet that makes it possible to de-reference the pointer. Which, as Andrew
>>>> explained, is intended to be impossible. If this could be properly
>>>> replaced (not exactly what Andrew indicated by "file it in /dev/null"),
>>>> fine. Truly purging the code (i.e. as Andrew suggests) may still be an
>>>> option, with appropriate justification. But simply adjusting the type
>>>> and then moving on is too little, imo. Even if you used void * (to make
>>>> de-referencing impossible) I'd view it as largely papering over an issue;
>>>> then converting to other pointers (without explicit cast, and hence
>>>> without making apparent the badness of doing so) would become possible.
>>>
>>> What about converting to uintptr_t (not a pointer)?
>>>
>>>
>>> In general, there are quite a few MISRA rules that we could mark as
>>> blocking (clean) in our GitLab scan with just a few code changes like
>>> this one. My goal is to make these rules blocking as soon as possible.
>>> If I can improve the code in the process, that is even better, but it 
>>> is
>>> not mandatory. And I would rather spend one more hour marking a second
>>> rule as blocking instead.
>>>
>>> What I mean is that I believe it would be acceptable to make some
>>> compromises and accept non-perfect changes to the code if it helps us
>>> enforce more rules as blocking in GitLab CI.
>>
>> After briefly speaking with Andrew about this, and re-reading Jan's
>> email above, I think it is best to resolve this as a deviation.
>>
>> Would this deviation work for you? Please suggest a better wording if
>> you prefer.
>>
>> Nicola, in reality I think it would be better to use deviations.rst
>> because the SAF comment below would need to be replicated at every call
>> side, if I am not mistaken.
>>
> 
> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?

If it did, COOKIE2ID and ID2COOKIE would likely need including as well.

Jan

> In that case, that is a simple configuration tweak which then will be 
> justified in deviations.rst.
> 
> Thanks,
>   Nicola


