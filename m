Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401D859E6C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682694.1061800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbz8B-0007Jl-8z; Mon, 19 Feb 2024 08:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682694.1061800; Mon, 19 Feb 2024 08:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbz8B-0007H3-5p; Mon, 19 Feb 2024 08:36:07 +0000
Received: by outflank-mailman (input) for mailman id 682694;
 Mon, 19 Feb 2024 08:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbz89-0007GX-S3
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:36:05 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8863a4-cf01-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 09:36:03 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50eac018059so5692809e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:36:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b00412572f5175sm7537277wmq.23.2024.02.19.00.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:36:02 -0800 (PST)
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
X-Inumbo-ID: ea8863a4-cf01-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708331763; x=1708936563; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rq+/CIZ7YDFXLRD5xeoGENi7ZdsPDuO+JPh6bmdQqoM=;
        b=cTbDTmrSHSZAZY7ww8Mn8iEYTvEPp/hvKuvKOrTfaYtRkvd10TAdYak884HkIitGxH
         SAX26BirLKCFH7wtQDJxx3eFhs9YJQHQv3YI5TD2AAoddVD7T+j0K+5L+YGT1Nl7+Oja
         gP6XydNrJry3dMBpOq+uE9ebvqqQGqDmh5s6c80uS4WasU3kYfK0JS5qVt/mbrvYa5eQ
         uWkl/h7fwK349hXFpt2+n908BRxo8VhqXUdd2NcZheCp7RmdMb+GX8UbsxIULlpt8Bot
         8cTxAHR9UIoBcIhaB+2Vlgm7wK1NHTn4nwXYrZQnEAkepg4AprkAROQQXRSjsU9cNKot
         Zk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331763; x=1708936563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rq+/CIZ7YDFXLRD5xeoGENi7ZdsPDuO+JPh6bmdQqoM=;
        b=CMeBqF6Pa04vlf6Mx8Z09Ea6gvviPle8lJNIIb/mF+5EIuMaBugELPDo/RBamaUhNu
         hPNwOd2dCAFF59p4pVRUignJft+oOJnHh+S8W8sz3mev0fNVaePrZLbRk58xyt8XWD98
         uQpYNNfe0Gu/o4+pjKK14it0s7AjdZqQUaGpMrAs+rxhJjjYw/rXT7tXZcmWbeYMpfrI
         9Z9Dob95+ZhUPWUz/QfSpYeCU1NflR29vY7wibIYaB8ccYN2ydLWHv6uC/qTR1CKvBQO
         +b+G+EySypyksMPk3aWHNK1i++sxqw94I8RROSR+ZdKxAdPvmowP7XLFS+v3aA5/nJ/3
         boPw==
X-Forwarded-Encrypted: i=1; AJvYcCWA/T76m3102HbCHB3JRepuRmIa+7X9AuEIg32vYVZFyaUzxqmcqaIcjxChOu1HEW+jF5YJebVVb7LXWARh3u2aptQa+zVOJBRYT3hAslY=
X-Gm-Message-State: AOJu0Ywtm8iqrGnUiPfyeHg7ZwIs9teVJit24knK+Ox6JvMCf5pBYJu3
	j4jabh5/FAcY+gOqCTCl43o2hUpyQS9BeoRERcYwEDqP2ERmNzt5Ia8XVWL0NQ==
X-Google-Smtp-Source: AGHT+IFYvWXQjajVhWSFDIXVBpUl2rR+jfdNqMbZKjm44Ose4degvssMScZLNDO4kAN949ONOK4B/Q==
X-Received: by 2002:a05:6512:519:b0:511:76ff:32bc with SMTP id o25-20020a056512051900b0051176ff32bcmr7287896lfb.2.1708331763164;
        Mon, 19 Feb 2024 00:36:03 -0800 (PST)
Message-ID: <826829ab-28c1-4138-8ecb-32ec6dbb96e6@suse.com>
Date: Mon, 19 Feb 2024 09:36:03 +0100
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
 <2fe68b26-87c3-43bf-ba11-f261c81c6373@suse.com> <Zc8-TNOMG7ljNCj1@macbook>
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
In-Reply-To: <Zc8-TNOMG7ljNCj1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.02.2024 11:51, Roger Pau Monné wrote:
> On Fri, Feb 16, 2024 at 11:04:46AM +0100, Jan Beulich wrote:
>> On 15.02.2024 18:23, Roger Pau Monné wrote:
>>> On Thu, Feb 15, 2024 at 05:22:00PM +0100, Jan Beulich wrote:
>>>> On 15.02.2024 17:08, Roger Pau Monné wrote:
>>>>> On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
>>>>>> --- a/xen/Rules.mk
>>>>>> +++ b/xen/Rules.mk
>>>>>> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
>>>>>>  PHONY := __build
>>>>>>  __build:
>>>>>>  
>>>>>> --include $(objtree)/include/config/auto.conf
>>>>>> +ifneq ($(obj),tools)
>>>>>> +ifneq ($(obj),tools/kconfig)
>>>>>> +include $(objtree)/include/config/auto.conf
>>>>>> +endif
>>>>>> +endif
>>>>>
>>>>> Trying to understand this, I assume it's to avoid an infinite
>>>>> dependency loop that generating include/config/auto.conf requires some
>>>>> tools that are build using xen/Rules.mk?
>>>>
>>>> The file has dependencies only in xen/Makefile. This is about the
>>>> file simply not being there when initially building. Perhaps the
>>>> patch description helps that I've written in the meantime:
>>>>
>>>> "Because of using "-include", failure to (re)build auto.conf (with
>>>>  auto.conf.cmd produced as a secondary target) won't stop make from
>>>>  continuing the build. Arrange for it being possible to drop the - from
>>>>  Rules.mk, requiring that the include be skipped for tools-only targets.
>>>
>>> Wouldn't it be more reliable if we skipped the include for any paths
>>> in $(obj) that start with 'tools', rather than hardcoding 'tools' and
>>> 'tools/kconfig'?
>>
>> I was first meaning to do so, but the expression would end up more
>> complex than I'd like (for it needing to be an exact match of "tools"
>> and a prefix match of "tools/"). Thinking of it,
>>
>> ifneq ($(obj),tools)
>> ifneq ($(patsubst tools/%,$(obj)),)
>>
>> might do (and not be as complex as I first thought, when intending to
>> put all in a single "if").
> 
> Would something like the rune below work?
> 
> ifneq ($(word 1, $(subst /, ,$(obj))),tools)
> 
> That should allow to have a single condition, and should match both
> 'tools' and 'tools/*'

Hmm, yes, that works. $(subst ...) is something I usually try to avoid,
in favor of $(patsubst ...).

Jan

