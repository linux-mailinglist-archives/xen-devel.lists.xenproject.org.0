Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45EA86730F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685478.1066266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZA6-0001l6-QP; Mon, 26 Feb 2024 11:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685478.1066266; Mon, 26 Feb 2024 11:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reZA6-0001ih-Mz; Mon, 26 Feb 2024 11:28:46 +0000
Received: by outflank-mailman (input) for mailman id 685478;
 Mon, 26 Feb 2024 11:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reZA5-0001ib-Gk
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:28:45 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 327043c7-d49a-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:28:43 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-564a53b8133so2121824a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:28:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020a056402128e00b00563d03030e8sm2249831edv.55.2024.02.26.03.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 03:28:42 -0800 (PST)
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
X-Inumbo-ID: 327043c7-d49a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708946923; x=1709551723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcAAXH9D0FYnXXIjBHNn8QUKLCPqYFEsIPKcPDxSGrA=;
        b=QWsO0syq46AmxvRKLR51IVqc5Ky6jsTQHjbct0TCsb3rU/LwZ86xMmpbpOEvpo5UkE
         ipv1oHTie7+G6vI/zkGsrS2e9/N9J9kKqIfTNAekor7nG8iIxPXPVMumqZM2MzRlni1u
         GQcGkg0wbtno/rdrNwSzHMNepARS0KKcQz8i0qBBVB88L3RmiGi9lVl4m81QHk8ie4fa
         xS6Iaxc1BmQY7JqIdlbqVIILxWDoou3kNE0sh8y9AzFVSpQyymIvxBFizhlMHM2Jr/78
         1M+QKfvYxiB6PX71cJaSvk6/ggtzMTPKYSxouxgDm0sHXNI6gPw+Fy/xQrDBfqwfCWQf
         7oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946923; x=1709551723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcAAXH9D0FYnXXIjBHNn8QUKLCPqYFEsIPKcPDxSGrA=;
        b=EEl4+rfTP4slBWD+EOLjhINqDO2oGCGAYPZXOgQ86B1Zo9S8kE57j9CdcTc4Vk4Wh8
         hxKe1QV0MjZ52waShSGomyqW60a06iuom0SZFwFqMAtp3ngCy4F0vLdrnlGnPoc1ePBj
         hsO3L9g3L0vu/eqRGo0T4ZDFlgn8PMwZV4gm1GFH94nEbIowVz6ch+0TiQrTBo0BvpdO
         qlF6Pvbdy4+n53I+bpuGt4xMwuzKZinfv9sfHI1Up5+p0NTtTGGScAXxftMTv2OdMOis
         BKAwJlkylZxM351bdpdWY/G4kd9WOPfIqmcoNAOZNNhLyOTDADCO0YkT/Qh0iSVUMK+c
         dTsA==
X-Forwarded-Encrypted: i=1; AJvYcCUup7osBBQOB0VTeqrFzVYD4uV5NFI/YEeXdfJvR7CvdeK/P2WxYqh801JXDJ3UwGQKylqYelH+OV3Gbvqi6HY/S5Kr4JdPIOKmxEn2Mag=
X-Gm-Message-State: AOJu0Yz26z0HUI4AlghhZ4gv60YCE0ly0DtwAjSBhDVZhuYWHjbSRAEb
	wwDV1RXVjLnzWTB7cHBMhM6t6EVmCrfih3P10eiQ2/wcGmoR8UYoReJ2RlfgMw==
X-Google-Smtp-Source: AGHT+IHLJLAbt1wQWjYza/EgrHSAgA+wlVcyBkFLny/N+2t1f8xi4gMlVgzuXgcDUDgvzySR2WTzLw==
X-Received: by 2002:a05:6402:1606:b0:565:ffa5:becd with SMTP id f6-20020a056402160600b00565ffa5becdmr1268102edv.37.1708946922791;
        Mon, 26 Feb 2024 03:28:42 -0800 (PST)
Message-ID: <7cab68d1-9bdf-4ea1-b49a-cce1e4af4692@suse.com>
Date: Mon, 26 Feb 2024 12:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
 <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
 <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
 <56ae27d003b8763af34864ae56433691685c3661.camel@gmail.com>
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
In-Reply-To: <56ae27d003b8763af34864ae56433691685c3661.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 12:18, Oleksii wrote:
> On Mon, 2024-02-26 at 10:45 +0100, Jan Beulich wrote:
>> On 23.02.2024 13:23, Oleksii wrote:
>>>>
>>>>>>> As 1- and 2-byte cases are emulated I decided that is not
>>>>>>> to
>>>>>>> provide
>>>>>>> sfx argument for emulation macros as it will not have to
>>>>>>> much
>>>>>>> affect on
>>>>>>> emulated types and just consume more performance on acquire
>>>>>>> and
>>>>>>> release
>>>>>>> version of sc/ld instructions.
>>>>>>
>>>>>> Question is whether the common case (4- and 8-byte accesses)
>>>>>> shouldn't
>>>>>> be valued higher, with 1- and 2-byte emulation being there
>>>>>> just
>>>>>> to
>>>>>> allow things to not break altogether.
>>>>> If I understand you correctly, it would make sense to add the
>>>>> 'sfx'
>>>>> argument for the 1/2-byte access case, ensuring that all
>>>>> options
>>>>> are
>>>>> available for 1/2-byte access case as well.
>>>>
>>>> That's one of the possibilities. As said, I'm not overly worried
>>>> about
>>>> the emulated cases. For the initial implementation I'd recommend
>>>> going
>>>> with what is easiest there, yielding the best possible result for
>>>> the
>>>> 4- and 8-byte cases. If later it turns out repeated
>>>> acquire/release
>>>> accesses are a problem in the emulation loop, things can be
>>>> changed
>>>> to explicit barriers, without touching the 4- and 8-byte cases.
>>> I am confused then a little bit if emulated case is not an issue.
>>>
>>> For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and
>>> aqcuire
>>> version of xchg barries are used.
>>>
>>> The similar is done for cmpxchg.
>>>
>>> If something will be needed to change in emulation loop it won't
>>> require to change 4- and 8-byte cases.
>>
>> I'm afraid I don't understand your reply.
> IIUC, emulated cases it is implemented correctly in terms of usage
> barriers. And it also OK not to use sfx for lr/sc instructions and use
> only barriers.
> 
> For 4- and 8-byte cases are used sfx + barrier depending on the
> specific case ( relaxed, acquire, release, generic xchg/cmpxchg ).
> What also looks to me correct. But you suggested to provide the best
> possible result for 4- and 8-byte cases. 
> 
> So I don't understand what the best possible result is as the current
> one usage of __{cmp}xchg_generic for each specific case  ( relaxed,
> acquire, release, generic xchg/cmpxchg ) looks correct to me:
> xchg -> (..., ".aqrl", "", "") just suffix .aqrl suffix without
> barriers.
> xchg_release -> (..., "", RISCV_RELEASE_BARRIER, "" ) use only release
> barrier
> xchg_acquire -> (..., "", "", RISCV_ACQUIRE_BARRIER ), only acquire
> barrier
> xchg_relaxed ->  (..., "", "", "") - no barries, no sfx

So first: While explicit barriers are technically okay, I don't follow why
you insist on using them when you can achieve the same by suitably tagging
the actual insn doing the exchange. Then second: It's somewhat hard for me
to see the final effect on the emulation paths without you actually having
done the switch. Maybe no special handling is necessary there anymore
then. And as said, it may actually be acceptable for the emulation paths
to "only" be correct, but not be ideal in terms of performance. After all,
if you use the normal 4-byte primitive in there, more (non-explicit)
barriers than needed would occur if the involved loop has to take more
than one iteration. Which could (but imo doesn't need to be) avoided by
using a more relaxed 4-byte primitive there and an explicit barrier
outside of the loop.

Jan

