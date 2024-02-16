Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA18579DF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 11:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682093.1061132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rav5R-0006PR-0k; Fri, 16 Feb 2024 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682093.1061132; Fri, 16 Feb 2024 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rav5Q-0006Mv-UG; Fri, 16 Feb 2024 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 682093;
 Fri, 16 Feb 2024 10:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rav5P-0006Mp-6M
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 10:04:51 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1211488-ccb2-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 11:04:48 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4125296400cso904935e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 02:04:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 co3-20020a0560000a0300b0033cf9e35b13sm1796564wrb.72.2024.02.16.02.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:04:47 -0800 (PST)
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
X-Inumbo-ID: d1211488-ccb2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708077887; x=1708682687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVt+Hm/7gTEmh+6OtNrEJ1A9UUR0Y+pgKDaSGK2e/jk=;
        b=abyAyoO643nUvVphHepI9wx5Zt+4B6KjSkEf+5FWSyUJ7Tzn9nQGdcRUvyPfOzhfLt
         N662dp7+wmKjxqasluGi+bio8QSyX+yG4mm8j8QPJZ7C5ud0JQkif2wYGacbcSZb4Uf3
         aPpzXrR4QwVPeFqZxXLmAYy+XFf9tJ0LUZf8yL23EiifnZMGJFAqOUyB2aNkqaEBmEpk
         IFhVM4rJcpypy68++PuT44xyC5OBxmbqC3FOUnZ4oAtg/W4fQnq3tZj3S1cPnaIKeI5q
         8wZQBfuLB0uYvceOfNAZJLx5BFzuoMeq4KBj50P7iAz+fhpQe3L+rsZHcYudvvmx9fH5
         MMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708077887; x=1708682687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVt+Hm/7gTEmh+6OtNrEJ1A9UUR0Y+pgKDaSGK2e/jk=;
        b=OeVfz1a0YtH/XzMBui/Hj7Rp0/YJd4YyvB03njrgKAL063Fxjlvs6AfXfLkqHyL9lg
         Gn6p1dAEogWBkchr/+vzQ3NFwtlrkuyu/DFf8GN3W/7EoRfSmH8TtcgiHTx8FhcrHrqL
         9ZBRGetDo0zG7A+sWzpHPeNftsaAJ3zL+UQuC3WOkPLs3NoXy7gLJxfKfcEG6tYSdfv0
         9VxJy/q5oQFyUQs2S2WpqVBI1FKGOmPA0nuNYxN4882Ln4646lpYnT7o3X3vpS5THJ1U
         1J/1OZ6uBExMIVicy7DTnQuK7UF6PxcfydrTRiKrH/vll+d3p9fKBk4f3VWiyJPrz7hc
         tQTw==
X-Forwarded-Encrypted: i=1; AJvYcCXA7ZHrgNkmsQdg5870oFHFZZU0J8gpCYFFyKsgMbnJRIgysxOFq7Vdzg+3UDlAJjQe3Xo4hnptaWThm4us8DRBktetCVg5XIn5XrpFxQI=
X-Gm-Message-State: AOJu0YyRhYRUKKXzbz+qJbeeX7gb9pv+EXrdnmFCaqfgNh4wRCPKt8XV
	oQkYybml9wsw0LyurxbzTUFnuIT8sphEpHIZV2eF87+UG+Lqyalr/6DuCADTYA==
X-Google-Smtp-Source: AGHT+IE1RtzZeRnmQNQ05C0/fYx//I2rkKKD7tKUfXSnr4QqZDsujzG5wQivJXZhKZ/WseW/RHjukg==
X-Received: by 2002:a05:600c:5006:b0:412:1ccd:d7a4 with SMTP id n6-20020a05600c500600b004121ccdd7a4mr2841196wmr.14.1708077887613;
        Fri, 16 Feb 2024 02:04:47 -0800 (PST)
Message-ID: <2fe68b26-87c3-43bf-ba11-f261c81c6373@suse.com>
Date: Fri, 16 Feb 2024 11:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com> <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com> <Zc3v20RKMssbaDsl@macbook>
 <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com> <Zc428VMDoYnPw1zo@macbook>
 <d545cc6c-d213-43da-af31-1768af32aba0@suse.com> <Zc5Io3dkAlGSt3on@macbook>
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
In-Reply-To: <Zc5Io3dkAlGSt3on@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 18:23, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 05:22:00PM +0100, Jan Beulich wrote:
>> On 15.02.2024 17:08, Roger Pau Monné wrote:
>>> On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
>>>> --- a/xen/Rules.mk
>>>> +++ b/xen/Rules.mk
>>>> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
>>>>  PHONY := __build
>>>>  __build:
>>>>  
>>>> --include $(objtree)/include/config/auto.conf
>>>> +ifneq ($(obj),tools)
>>>> +ifneq ($(obj),tools/kconfig)
>>>> +include $(objtree)/include/config/auto.conf
>>>> +endif
>>>> +endif
>>>
>>> Trying to understand this, I assume it's to avoid an infinite
>>> dependency loop that generating include/config/auto.conf requires some
>>> tools that are build using xen/Rules.mk?
>>
>> The file has dependencies only in xen/Makefile. This is about the
>> file simply not being there when initially building. Perhaps the
>> patch description helps that I've written in the meantime:
>>
>> "Because of using "-include", failure to (re)build auto.conf (with
>>  auto.conf.cmd produced as a secondary target) won't stop make from
>>  continuing the build. Arrange for it being possible to drop the - from
>>  Rules.mk, requiring that the include be skipped for tools-only targets.
> 
> Wouldn't it be more reliable if we skipped the include for any paths
> in $(obj) that start with 'tools', rather than hardcoding 'tools' and
> 'tools/kconfig'?

I was first meaning to do so, but the expression would end up more
complex than I'd like (for it needing to be an exact match of "tools"
and a prefix match of "tools/"). Thinking of it,

ifneq ($(obj),tools)
ifneq ($(patsubst tools/%,$(obj)),)

might do (and not be as complex as I first thought, when intending to
put all in a single "if").

Yet then it's not entirely impossible that we might gain a build tool
which is actually to be built after .config was (re)generated, i.e.
in the know of the target configuration. Thoughts?

Jan

