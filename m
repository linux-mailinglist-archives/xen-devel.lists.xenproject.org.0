Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B863B8988BF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 15:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700880.1094644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN6P-0004LI-S4; Thu, 04 Apr 2024 13:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700880.1094644; Thu, 04 Apr 2024 13:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsN6P-0004JC-OM; Thu, 04 Apr 2024 13:26:01 +0000
Received: by outflank-mailman (input) for mailman id 700880;
 Thu, 04 Apr 2024 13:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsN6O-0004J2-BN
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 13:26:00 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00dcc8e-f286-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 15:25:59 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d6a1ad08b8so11336321fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 06:25:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v17-20020adfe291000000b0034174566ec4sm20058406wri.16.2024.04.04.06.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 06:25:58 -0700 (PDT)
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
X-Inumbo-ID: e00dcc8e-f286-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712237159; x=1712841959; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3ruTvW2jddiHy2QMPP7F8yT1XslXJijghzUTUU5pZw=;
        b=KWU+6XUfOx9hbRU2SK9xWutS9Ttme1+n4YZy4gUr60IG5ae09Bn9pGGQUyIRRI8qW/
         J04ORYoqfYGh9qB3disLZrne1ksjV+5kJHAvhLHQZ1xPmgEF+PE63cRq9VAsy0vfR9oV
         1ZFS9jS3XYgEf9RdSotIoo9aUIvTCzU2pt1fq9PIiJ0rVt/istoEKLbkMKmD/A5T6aLN
         IiMAJoHhAM1MANbYmrVtBqR9sILpk1ehkBJM1id+ckujlnXHsXt7El2t4yPch8WMuAfa
         kSnvEjioxLNNpWDYKFByMe38xpW7R7cBW3illSQnQ3N+fGM9MWBFtYXQKBia9FlUivhy
         d/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237159; x=1712841959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W3ruTvW2jddiHy2QMPP7F8yT1XslXJijghzUTUU5pZw=;
        b=Ywyde6ihKJjsoEFN9njVVfRc6LK5C+CmEJliQ5cdEVEKYXHebVenuX546yDJyUpd1e
         NpoiLUkPxOUtsVyjMQdgGwAq5usi0Qola7t3s+eUVeQiFH0CSH1Uv8IY3fhizxayEgGG
         ibmJx94IWm0YlCFxakiq34UN6kYxVZ2Cd+JBnqzPRcvBcps9OzJASoUd5zkj5ctAc4v8
         q5ZMk8tIztmuITMXL0g7/N8CRqspcyf2zbyfNpOu4GTzm76Ir1zyaMPn2nJXWqXwupP2
         BySDW9olaO1HSSO7vB3NoKkU+ZcU09Cy6aLjrmY3/wRefE3TZMVkb8TeyX0hKfe2rTAI
         5wMA==
X-Forwarded-Encrypted: i=1; AJvYcCWmvEKspS5zYxZTEmWI8OcQsH/g5848UgqMi1EDA18INhvV4iW5Rd3geVLwu9E0gi2R96SwdUL1dg7m9HgOAfZR0AJPItQFW/cINya6M9g=
X-Gm-Message-State: AOJu0YwF8tE7HLHOgHRFn7QrAmgGfr8X46a19ALcLK/0yZ3y4pTR4VFo
	dwyrwSwf/XXXQ+0pKEsW+OGVbzHS13RRC+lQFE6lTiVE9zVs3+oj4gDnrXZ/l4tT0IX1Xt6o43g
	=
X-Google-Smtp-Source: AGHT+IHBwO1uEU+deNb29MsKyK6dmSmWLP5NxPcvcB6mxvWQtCsvkqhIn+v4pPtwe/kZNs3LWfuZ7g==
X-Received: by 2002:a2e:a371:0:b0:2d8:4c9f:ed94 with SMTP id i17-20020a2ea371000000b002d84c9fed94mr2036150ljn.34.1712237158899;
        Thu, 04 Apr 2024 06:25:58 -0700 (PDT)
Message-ID: <a7f8d41f-b4ca-4d96-95e3-4509287dd54e@suse.com>
Date: Thu, 4 Apr 2024 15:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
 <f922e7af-9415-44dd-8c05-6eb093080ed6@suse.com>
 <f3d829870e8f673f21106b8d062eb29f@bugseng.com>
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
In-Reply-To: <f3d829870e8f673f21106b8d062eb29f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 14:59, Nicola Vetrini wrote:
> On 2024-03-28 11:25, Jan Beulich wrote:
>> On 11.07.2023 18:40, Roberto Bagnara wrote:
>>> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
>>> overlapping object) is directly targeted at two undefined behaviors,
>>> one of which is the subject of 6.5.16.1p3, namely:
>>>
>>>    If the value being stored in an object is read from another object
>>>    that overlaps in any way the storage of the first object, then the
>>>    overlap shall be exact and the two objects shall have qualified or
>>>    unqualified versions of a compatible type; otherwise, the behavior
>>>    is undefined.
>>
>> I'd like to come back to this, for two reasons:
>>
>> 1) In the description of -fstrict-aliasing, gcc 13.2 doc says "Even 
>> with
>> -fstrict-aliasing, type-punning is allowed, provided the memory is 
>> accessed
>> through the union type." We even build with -fno-strict-aliasing, yet
>> misra/rules.rst has no mention at all of type punning being permitted.
>>
>> 2) With us using -fno-strict-aliasing, I wonder in how far e.g. commit
>> 7225f13aef03 ("x86: avoid Misra Rule 19.1 violations") wasn't 
>> pointless, as
>> imo the "compatible types" part of the C spec clause then can be 
>> treated as
>> irrelevant.
>>
>> To me both simply mean we're relying on another compiler extension 
>> that's
>> not exactly spelled out as such.
>>
>> Opinions?
> 
> Regardless of whether the compiler will do the right thing or not, 
> Mandatory guidelines can't be deviated.

Are you suggesting then that we need to build with -fstrict-aliasing,
sorting out all the issues that there may be? And avoid type-punning
as well?

Jan

