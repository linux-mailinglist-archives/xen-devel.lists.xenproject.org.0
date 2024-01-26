Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E383D6CB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 10:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671895.1045413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIp2-0003f3-Ff; Fri, 26 Jan 2024 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671895.1045413; Fri, 26 Jan 2024 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTIp2-0003cm-Cc; Fri, 26 Jan 2024 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 671895;
 Fri, 26 Jan 2024 09:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rTIp1-0003cQ-CA
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 09:48:27 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cfd965f-bc30-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 10:48:25 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf206e4d56so1494171fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 01:48:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x66-20020a0294c8000000b0046f1bf4e994sm224779jah.24.2024.01.26.01.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 01:48:24 -0800 (PST)
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
X-Inumbo-ID: 0cfd965f-bc30-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706262505; x=1706867305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phcuuLWXShAVPjQKUhUaBwj74e8U0OiTTbSMIlFzxTg=;
        b=O5iRLACIY92VrFPuF7Uz3pZW92GarK7KeakZA3IGvsQ9A7wSxRTOPjbL7+J8y74Zu3
         Tnu0/zGsNhbGxu1oMbm1Z50iVqV0RajyQh17FMZXSeMIhoIZ24+HliEOQWsf5587GnL4
         vwO8KVOFxJa+gkEO61XWzgVXgmV9z3wiMZKcasVSINCatPktmXAnZHLWIRfmGzeL1gMv
         XDrlXYA61T4gAcoj24s29fFVzWdRKyT/t44a+he48h+ZoZYDWV+eOw/IaXGRQuTvbAqD
         hhizTmha2yMdWcdG87KslAnbwCGkJq+3nVhXCOcckmFOQ0tLi6N5Lkfwg7vDg2aGzCGe
         uO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706262505; x=1706867305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phcuuLWXShAVPjQKUhUaBwj74e8U0OiTTbSMIlFzxTg=;
        b=v4c16jCS7UPS5FrU1w68/fG8iwKk4Jf/S1iORai9KtQf4eHKgF43LQyxtTI8GRVM0t
         n/AbfGAtDgX7wYbo/ovy/YxpSahJLUawUomC7UF9jLBWyMVIZnFjVgsxF24Pny8im0Ve
         C9r763yR/TmHkbx4pN1wVWa8GI45Gn31io4+n2xYO5djBoPFjQpU27SohRYLm1jxaxaC
         FdaPaCV53/ZyDgnjchCUBUR3cd/GjJKIcawiXrZNK90ZuHqwcH8j2Fhli92uLj6IqM2j
         d9Bm4Rni+8GEvBBVIJAycQfMgky1kNBPVykTV7aX/Z0LPyHdKUgfVE2pO06cyky8evhZ
         aJww==
X-Gm-Message-State: AOJu0YwtcHng5eMR8f394D4FKqNOj5+OdgF1L2HhNiz2ABUGynZvvRd2
	memuakcYIMS8Ir1yLFGo9OTjWKh/37fRtXGhgwgOVgeaCgfJlJZbXwAiolLJAQ==
X-Google-Smtp-Source: AGHT+IFtifITsPSmoQ4uK1Gd1660zX5zHfOw0XbMGuL5XlfvYbEmHtwy6JHyhNJ1zojuiUcwiWrgvA==
X-Received: by 2002:a05:651c:168d:b0:2cf:34a1:400e with SMTP id bd13-20020a05651c168d00b002cf34a1400emr387962ljb.17.1706262505404;
        Fri, 26 Jan 2024 01:48:25 -0800 (PST)
Message-ID: <e6d7806a-56c8-4b1e-965d-57685d856d98@suse.com>
Date: Fri, 26 Jan 2024 10:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/34] xen/lib: introduce generic find next bit
 operations
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
 <81e5cac4-90f0-4fff-b891-53ca73c61832@suse.com>
 <05d685b0b7ccd329454a336b20351979bdf91ea4.camel@gmail.com>
 <8e60f998-aeb4-4648-a3e9-d083bb8eefde@suse.com>
 <c899f039185d02ea49db29641ff5ca46a29008dd.camel@gmail.com>
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
In-Reply-To: <c899f039185d02ea49db29641ff5ca46a29008dd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.01.2024 10:44, Oleksii wrote:
> On Tue, 2024-01-23 at 14:37 +0100, Jan Beulich wrote:
>> On 23.01.2024 13:34, Oleksii wrote:
>>> On Tue, 2024-01-23 at 12:14 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
>>>>>  config GENERIC_BUG_FRAME
>>>>>  	bool
>>>>>  
>>>>> +config GENERIC_FIND_NEXT_BIT
>>>>> +	bool
>>>>
>>>> There's no need for this, as ...
>>>>
>>>>> --- a/xen/lib/Makefile
>>>>> +++ b/xen/lib/Makefile
>>>>> @@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
>>>>>  lib-y += bsearch.o
>>>>>  lib-y += ctors.o
>>>>>  lib-y += ctype.o
>>>>> +lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find-next-bit.o
>>>>
>>>> ... you're moving this to lib/. Or have you encountered any issue
>>>> with building this uniformly, and you forgot to mention this in
>>>> the description?
>>> I didn't check. My intention was to provide opportunity to check if
>>> an
>>> architecture want to use generic version or not. Otherwise, I
>>> expected
>>> that we will have multiple definiotion of the funcion.
>>>
>>> But considering that they are all defined under #ifdef...#endif we
>>> can
>>> remove the declaration of the config GENERIC_FIND_NEXT_BIT.
>>
>> What #ifdef / #endif would matter here? Whats in lib/ is intended to
>> be
>> generic anyway. And what is in the resulting lib.a won't be used by
>> an
>> arch if it has an arch-specific implementation. Problems could arise
>> if
>> an arch had an inline function colliding with the out-of-line one.
>> But
>> that's about the old case where I could see a need to make the
>> building
>> of one of the objects conditional. And you'll note that withing this
>> Makefile there are pretty few conditionals.
> We will have such issue with PPC:
> ...
> static inline unsigned long find_next_bit(const unsigned long *addr,
>                                           unsigned long size,
>                                           unsigned long offset)
> ...
> 
> It looks like an introduction of new config for find_next_bit is
> needed.
> 
> Does a better option exist? Would making find_next_bit non inline non
> inline for PPC better?

Isn't that generic code anyway? If so, that also wants replacing by
the generic library function(s). Shawn - I have to admit I have a
hard time seeing why this was introduced as inline functions in the
first place.

Jan

