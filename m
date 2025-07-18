Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D6B0A059
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048341.1418555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci16-0000nM-FW; Fri, 18 Jul 2025 10:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048341.1418555; Fri, 18 Jul 2025 10:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uci16-0000lp-Cm; Fri, 18 Jul 2025 10:08:36 +0000
Received: by outflank-mailman (input) for mailman id 1048341;
 Fri, 18 Jul 2025 10:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uci14-0000lZ-FH
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:08:34 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28bcea8b-63bf-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 12:08:32 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1754819f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:08:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3d4esm10217945ad.23.2025.07.18.03.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:08:30 -0700 (PDT)
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
X-Inumbo-ID: 28bcea8b-63bf-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752833312; x=1753438112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz9FX+mzA5KJpBzrN5vhjIN6bixi99nh8Bi4W3LFF+U=;
        b=b/pvy1y9S2AK8flOXcmFRow9qWVN4czR9YcTb4D8CbDsmfI0rE1hhXl7m7y0htO2pf
         Aja9u5A5F5L/geyna6embcIYmXazyayIEThkgueZ8dFYP0SayH/cKMyIoeop8n65HD1X
         k8K9W4MFb1xHBtaXG06H3FniwZjQvrnzuj+YFv7jMrn5ctjLA1djQtPYNdOMHP+cyss4
         i7X/86o/hs8wa5ocgn4Hb6X86lGy4ufQ3zsa/60TJ3TPWpHMu7zqizpxl9uslnz9DZ9f
         20EeEvNEhGEQ8WmI47IrSyFL0TnY+MzyCPuWnREkbK91a4BT4AGuyKLaarHp0pXORM9H
         V1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752833312; x=1753438112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz9FX+mzA5KJpBzrN5vhjIN6bixi99nh8Bi4W3LFF+U=;
        b=X6jUD/FP9QWdk+nItrxaR3bfhkfTIvGawsBtckJVImAfEj9GDP8esshaH+llBcbvOf
         EmIa5ZONesmd874MLhrBjEReJOUCZLOC7mQ5yYnfdlE9nbC+DRDcvt/sh6Lq6iCLi5Oi
         dXmHdyYDy6QsbzrL7spXGpqBo6i1peuiuCcMmXoNqb3rqZCHgbKvG4Ne5SjM4eMDL1lu
         N8yERpnvR383b6ufIEvQJijxy8fG8GooeE0yIz22ISHtQ/NhF2BPCACb7xs9CRjKxgqt
         JTxAFiMvG7cdhPb70ZG4xZFlUVxiGQXPB+kWSbab25Ugo6LqY0F59SkNmu1iLyG9XGiq
         Fsdw==
X-Gm-Message-State: AOJu0Yxd6sghBlUZ1Vx58FORl23lYRUNFcc1kbfFWhhL2mB2nJSeyoye
	cGO4dy6QiWuAF7yiKHDC8Jj16CwL1n2miPYiXBCLAG0gQ2NApRviCoqlCftj4qvlqJo64uJr6E1
	WMrU=
X-Gm-Gg: ASbGncu2Ju/cyhTWpylrXoQEswRZmMXRmQK97MRiWJRlhTfSQppRSaqCfja4jmkfG6n
	9e2oi82IqMEcHgjXbnFNepGTkzfzdXrUGgAJzIBrSy3qv1b00AcAfm9TWYKYKR22M2sLpMigGPy
	oR5jkXT/GxLB7iJLw+cTgeGwg8f3+3tTWKvO0K+nNyzIKx1KLI4qa8LvpEQR24q5EwnurXym1KH
	zTRhhiiX/K6Mj4FYgo1g/a4XyYx9ZTfadp63KdUbuFd3wnYgzCcdP4Q3RrnW8cQeH8s4bPUTeBP
	Agg31jvniXhUDcDM1vs4qBihkyS5bKXuo+5tSLLjSPcs0+ndI1mL/x+rljnm15E/gU+KYkna+bc
	TAvpW6fkrLSVBVZzssQvzZQ/crG1/PA6qdF7NDiqBnn1zcLY5lggknt4FHg3v9Ql65rfTc/2j//
	PYIuUCt1k=
X-Google-Smtp-Source: AGHT+IFF8MbKcr9E4wTx7ZpSXFoamO2NZZdbnUuU1aw3RRwIT9O7REucy5/eo/vjdOlDT98ZLNSEog==
X-Received: by 2002:a05:6000:2008:b0:3b6:db:74a7 with SMTP id ffacd0b85a97d-3b60dd4aa9dmr8304406f8f.4.1752833311539;
        Fri, 18 Jul 2025 03:08:31 -0700 (PDT)
Message-ID: <9bd632e5-19aa-43d7-b0ed-e051f64e5917@suse.com>
Date: Fri, 18 Jul 2025 12:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "victorm.lira@amd.com" <victorm.lira@amd.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f1d1dbe4-5b62-4540-a480-afa6045d9622@epam.com>
 <39114395-5aa0-4c4a-a0b9-f151c6976674@suse.com>
 <078093af-1581-44e8-97f0-82561bfd06a5@epam.com>
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
In-Reply-To: <078093af-1581-44e8-97f0-82561bfd06a5@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.07.2025 11:17, Dmytro Prokopchuk1 wrote:
> On 7/18/25 08:31, Jan Beulich wrote:
>> On 17.07.2025 22:47, Dmytro Prokopchuk1 wrote:
>>> I tried to play with Rule 21.1 deviations.
>>>
>>> After applying the following configurations:
>>>
>>> -config=MC3A2.R21.1,macros+={safe, "^offsetof$ || ^(is|to)[a-z]+$ ||
>>> name(NULL) || name(bool) || name(true) || name(false)"}
>>> -config=MC3A2.R21.1,macros+={safe,
>>> "loc(file(^xen/include/xen/inttypes\\.h$))"}
>>> -config=MC3A2.R21.1,macros+={safe, "loc(file(^xen/include/xen/types\\.h$))"}
>>> -config=MC3A2.R21.1,macros+={safe, "^str[a-z]+$ || ^(v)?sprintf$ ||
>>> ^va_[a-z]+$"}
>>
>> Can you spell these out in words? I can only vaguely interpret these Eclair
>> patterns, sorry.
> Yes, sure.
> 
> That means to deviate the following macros:
> - offsetof
> - begin with either ‘is’ or ‘to’ followed by a lowercase letters 
> (islower, isdigit, tolower, toupper, etc.)
> - NULL
> - bool
> - true
> - false
> - all PRI/SCN macros for printing/scanning format specifiers from header 
> file xen/include/xen/inttypes.h
> - all macros from header file xen/include/xen/types.h (limits: 
> UINT8_MAX, INT_MAX, LONG_MIN, etc.)
> - begin with 'str' followed by a lowercase letters (string functions)
> - sprintf/vsprintf
> - begin with 'va_' followed by a lowercase letters (va_copy, va_start, 
> va_end, va_arg)

That's all stuff the library defines, when there is an (external) library.
I Xen we have (or should I say "we are") the library. Why are we not
permitted to define what a library is expected to define? How would one
go about dealing with an actual library implementation, when it is not
allowed to define anything a library is expected to define?

Jan

