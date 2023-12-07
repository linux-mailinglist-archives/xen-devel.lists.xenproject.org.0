Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE158081EF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 08:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649568.1014219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8ny-0002D0-0V; Thu, 07 Dec 2023 07:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649568.1014219; Thu, 07 Dec 2023 07:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB8nx-0002Ae-TX; Thu, 07 Dec 2023 07:28:17 +0000
Received: by outflank-mailman (input) for mailman id 649568;
 Thu, 07 Dec 2023 07:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rB8nw-0002AW-VL
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 07:28:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2edb479d-94d2-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 08:28:14 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c236624edso7039755e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 23:28:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b004083729fc14sm982931wmq.20.2023.12.06.23.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 23:28:13 -0800 (PST)
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
X-Inumbo-ID: 2edb479d-94d2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701934094; x=1702538894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDou7IQ0nw8mNqs69CK2ggGJ2NClNUfmIySopQWoXA8=;
        b=g6n+lcx81CMj02e8ieXaJYa9RYqjh74aLqndTPvDk9onyCtgIyM0avUNEzLeBO40ls
         WIKOPmeBI9Souu+T5UJERS8hpR06aC1PHLCAxjy8OKEucINaaSVLEg40dmioxCD8Tu4n
         N5Wg30YurntvNpJ1+F3TcN+cH2AVXst5GQeFxE/oUQoeQP7w0Jh7s8I3aup1q/1d6TSN
         FFmYLjL6FjX6ekaSMGKbBdps1hQ0R+3RJ36bPiq29iLO6N+NhKBkPKRuvzZ0AervurbB
         z3G1EFx5bTuCNIRb3CRRmHjqEf/5qSsgo5S4ubqrlOt8+nu/ltjbvpsaT6jeXW2Ar3wr
         8wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701934094; x=1702538894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dDou7IQ0nw8mNqs69CK2ggGJ2NClNUfmIySopQWoXA8=;
        b=nhKoHt9yxaeHsZWpR4s9A0xCalFol5I9eUWjl9ypOv8Q0t/9k9y46ubk48VKg/HyQ8
         fTbpIxZ1EQ8TlrI3JLOxq/+HUm3GT6KSx0x9W6tx6hzhZGTXzpApWWv6HyQ9WBT2hf6v
         BldAty33APC3DL2UgpZi1IXiMp4V2OAYJAOP1Rk3LzyFjL4dQ6CLzXQm+RbiSreOuESq
         rns0CZ/0kIsS2k9cRRwl9I2rcGqnphnaxTYWR5MdGlCrmWuS5lPNcIS0TBs5ZzBGF+2/
         AAa9RodGwNkrlblFyoAREzc5bwMumdCOwnNMPBixRFzUUc5jTSsJDJCNJpFpQDWSM6xy
         /g+A==
X-Gm-Message-State: AOJu0YxVostcxfEWAv5AyKLlbt1ysLRzCNdb+6pC+gy4CuWD4hgBDJC2
	+Z8etGPHr/TZvVERKj1mesaG
X-Google-Smtp-Source: AGHT+IEbPZ5X/oLj6CoUyYTZROh9MOziv6TfTeutiPb8y9unqs0LDUbM2ZSBDGkHT6gM+bnsmfca6w==
X-Received: by 2002:a05:600c:22c8:b0:40c:23e7:6e2a with SMTP id 8-20020a05600c22c800b0040c23e76e2amr868501wmg.76.1701934094042;
        Wed, 06 Dec 2023 23:28:14 -0800 (PST)
Message-ID: <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com>
Date: Thu, 7 Dec 2023 08:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clang-format configuration discussion - pt 2
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@cloud.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
 <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
 <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
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
In-Reply-To: <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2023 18:55, Julien Grall wrote:
> On 06/12/2023 02:32, George Dunlap wrote:
>> On Tue, Dec 5, 2023 at 2:07 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 05.12.2023 14:46, Luca Fancellu wrote:
>>>> In my opinion, I don’t know of any tool that can address all the flexibility the Xen codestyle allows, yet the use of automatic
>>>> checkers would improve the review time, allow more new contributors to approach the community without being put down by
>>>> the amount of code-style comments,
>>>
>>> Since this argument is being repeated: I find it odd. No-one needs to even
>>> fear any amount of style comments if they simply follow the written down
>>> policy plus a tiny bit of common sense. According to my observation, (some)
>>> newcomers don't even care to look at what is being said about our style.
>>> It's not like you and I haven't been through this. When I started working
>>> with GNU toolchain, I had to adopt to their style. When I later started to
>>> work with Linux, I had to also adopt there. And then for Xen. And all of
>>> that already past closed source projects I had been working on before.
> 
> I am not sure I get the point. With this argument, we are not only 
> putting load on the contributors but also on the reviewers because we 
> have to check the style manually while reviewing the code.
> 
> Do you really think this is a good use of our time? Personally I don't 
> think so and definitely there are more unwritten rule than you let 
> transpire above.
> 
> A good example is the "_" vs "-". If even a maintainer can't guess it, 
> then how can a contributor know it?

I didn't even hint at anything unwritten, did I? I certainly agree that
things would better be written down.

>> Most modern languages, including golang (and I think rust) have
>> built-in style correctors (`go fmt` is go's official one).  If you
>> haven't worked with an automatic style checker / fixer, you don't know
>> how much time, hassle, and emotional energy you're saving.  I don't
>> think I know anyone who, after using one, wants to go back to not
>> using one any more.
>>
>> In general, I'm in favor of making changes to our style such that we
>> can make clang's style checker official.  The only reason I would vote
>> against it is if one of the style requirements was really intolerable;
>> but I find that pretty unlikely.
> 
> +1
> 
>>
>> And as I've said before, the main reservation I have going forward
>> with this discussion is that I can't see clearly what it is that I'm
>> agreeing to.
> 
> +1
> 
> I found the way we dealt with MISRA rules quite helpful. We had a weekly 
> meeting to discuss some of the rules and then the outcome was posted on 
> the ML. Maybe we should do the same here? Any other suggestion how to move?

I have mixed feelings with meetings like the Misra ones. That's probably
unavoidable because of it being a goal to move fast. I'm not sure the
same applies here. But first of all - see also what George said - there
needs to be a coherent proposal of what aspects of style to change in
which way. The more heavy the changes, the harder it may be for long
time contributors to adapt; whether that's a worthwhile price to pay is
yet to be determined.

Jan

