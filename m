Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A685D645
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 12:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683964.1063599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckLE-0006i1-O3; Wed, 21 Feb 2024 11:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683964.1063599; Wed, 21 Feb 2024 11:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rckLE-0006ep-Kw; Wed, 21 Feb 2024 11:00:44 +0000
Received: by outflank-mailman (input) for mailman id 683964;
 Wed, 21 Feb 2024 11:00:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rckLC-0006ei-HC
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 11:00:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73520f18-d0a8-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 12:00:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3f4464c48dso50047366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 03:00:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709067c8800b00a3e9ea30a95sm2806625ejo.5.2024.02.21.03.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 03:00:39 -0800 (PST)
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
X-Inumbo-ID: 73520f18-d0a8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708513240; x=1709118040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k9wBkQspzqmzlIJCcBa4X8dSTnv3wOlrmhWnq465fmQ=;
        b=L3SeMVM/lode/aLwqbLIpuIUBUoDkG4X94dSPoUd+jrw2WrJ3eoI54Stoon5yGa1+T
         EWpyvfz4BlQKHIqZY9BOzFRynLGfoYxAmuzzvA02US8xsRM1OziZaOeG99IUFupUSmHp
         5Ne4QpNNfYdchZqxKCO823y1/F9TrXY5pWIeeyCKNppXmuTjMu8XKq5QreITt/Djrz6l
         Rom+XAnoL4W+Q4IzyU1Mr9jChPPJM0ckknwcqn+u+wiUCheUsfn2OgpjJPgbcLRSLDfI
         /QDfkZAJZswiqySB2FHprGaohP/Y1W1yW/pXiJWmyIVjZs+71Prc3h5Yyrv//iDjzBfa
         KXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708513240; x=1709118040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9wBkQspzqmzlIJCcBa4X8dSTnv3wOlrmhWnq465fmQ=;
        b=k6LEeyIOPJppl64kE8Sj3vhlPLaVRiMkIifjn8X0DNOpmMJo8Z6MIEIRzP3F7w0iBn
         sY0KOfkDCVw+IFXhMSjQjNTcou/E3R+ztBxy0hQErBhb+xicIRZSTzJr7zERV/mNHiqV
         0kax4btwRiM7oLrhvPtpkMPfpoCm1rrNm4FdDwbfbZLbmcVCQHB1qPGAMzzhOtaJK35a
         cizTx1BGpb4t1BOipSIJnlgOmdKjioLzNkhzYiCsW594OMByRo8nIWaROhHz9sJf6qTO
         R7NLPbN5kqCkykCL7FUHSO0PCvWXbo+BSKW5dodyhd8Psc1AZRgVn8K28O5VRRivtu4m
         kRBg==
X-Forwarded-Encrypted: i=1; AJvYcCWrp/uHfJKc9cMZLUwasBSWwlJKKO/NUpfm1mK7+uZ9JWNyl8IEGv54ijE2K4eyJOU8pmZTqFAH2ztv9CMPp75PzaDTG60bZj007QHFyi8=
X-Gm-Message-State: AOJu0YyaNYUvBmL6ZYq2If1CszDW3oZkODUTA4xyvZzG7cqhBoEQLnBy
	+4th7g9cMXiAWsHsQ5lIdNmx2ecwlB49ZOQeOJd/h+lgM/D438WXxf+38noHCA==
X-Google-Smtp-Source: AGHT+IFMpZZn29jRiyCr9qtxWDYgM4DPbZMmmtYKB36ZhzPLJcWyP3RyWcveKJemYCcmquBpQksakQ==
X-Received: by 2002:a17:906:488c:b0:a3f:7bc:7278 with SMTP id v12-20020a170906488c00b00a3f07bc7278mr3368845ejq.31.1708513239887;
        Wed, 21 Feb 2024 03:00:39 -0800 (PST)
Message-ID: <a6394d8a-63d0-42bf-8ed7-a7722cb7e71c@suse.com>
Date: Wed, 21 Feb 2024 12:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
 <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
 <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
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
In-Reply-To: <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 21:30, Oleksii wrote:
> On Mon, 2024-02-19 at 13:18 +0100, Jan Beulich wrote:
>> On 19.02.2024 12:59, Oleksii wrote:
>>> Hi Julien,
>>>
>>> On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> Title: Typo s/introdure/introduce/
>>>>
>>>> On 05/02/2024 15:32, Oleksii Kurochko wrote:
>>>>> The <asm/nospec.h> header is similar between Arm, PPC, and
>>>>> RISC-V,
>>>>> so it has been moved to asm-generic.
>>>>
>>>> I am not 100% convinced that moving this header to asm-generic is
>>>> a
>>>> good 
>>>> idea. At least for Arm, those helpers ought to be non-empty, what
>>>> about 
>>>> RISC-V?
>>> For Arm, they are not taking any action, are they? There are no
>>> specific fences or other mechanisms inside
>>> evaluate_nospec()/block_speculation() to address speculation.
>>
>> The question isn't the status quo, but how things should be looking
>> like
>> if everything was in place that's (in principle) needed.
>>
>>> For RISC-V, it can be implemented in a similar manner, at least for
>>> now. Since these functions are only used in the grant tables code (
>>> for
>>> Arm and so for RISC-V ), which is not supported by RISC-V.
>>
>> Same here - the question is whether long term, when gnttab is also
>> supported, RISC-V would get away without doing anything. Still ...
>>
>>>> If the answer is they should be non-empty. Then I would consider
>>>> to
>>>> keep 
>>>> the duplication to make clear that each architecture should take
>>>> their 
>>>> own decision in term of security.
>>>>
>>>> The alternative, is to have a generic implementation that is safe
>>>> by 
>>>> default (if that's even possible).
>>> I am not certain that we can have a generic implementation, as each
>>> architecture may have specific speculation issues.
>>
>> ... it's theoretically possible that there'd be an arch with no
>> speculation issues, maybe simply because of not speculating.
> 
> I am not sure that understand your and Julien point.
> 
> For example, modern CPU uses speculative execution to reduce the cost
> of conditional branch instructions using schemes that predict the
> execution path of a program based on the history of branch executions.
> 
> Arm CPUs are vulnerable for speculative execution, but if to look at
> the code of evaluate_nospec()/block_speculation() functions they are
> doing nothing for Arm.

Which, as I understood Julien say, likely isn't correct. In which case
this header shouldn't be dropped, using the generic one instead. The
generic headers, as pointed out several times before, should imo be used
only if their use results in correct behavior. What is acceptable is if
their use results in sub-optimal behavior (e.g. reduced performance or
lack of a certain feature that another architecture maybe implements).

Jan

