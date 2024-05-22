Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FA68CBCBE
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 10:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727324.1131797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9h8J-0006HT-4b; Wed, 22 May 2024 08:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727324.1131797; Wed, 22 May 2024 08:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9h8J-0006Ec-0Y; Wed, 22 May 2024 08:15:35 +0000
Received: by outflank-mailman (input) for mailman id 727324;
 Wed, 22 May 2024 08:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9h8G-0006EU-Um
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 08:15:32 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74f4dbcb-1813-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 10:15:31 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a387fbc9so979434066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 01:15:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8a55f2e8sm1054428466b.126.2024.05.22.01.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 01:15:31 -0700 (PDT)
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
X-Inumbo-ID: 74f4dbcb-1813-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716365731; x=1716970531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I07GPXVjk/wNjF5w8+JeEg5eMFs3z+5p0J67OkCSbm8=;
        b=OUriiPb7Qblw97E4UFZFTvvx8Iu/PeQg+NiVnUKs9DitjmRFjpyRdQHeX4VRvrWOKT
         mm4ttd3jzdSxAgAeU9x0Ua0UEauy9Ks+YWVlpefZUKWwpA8XTv8+UcO1/WeDSKOWIEHc
         G5GTa1xKILYx07Y/auBFQZcFXWSJCTXPg4aU+TkDE2rSrgz4P805WcdxDDPog++VMzdR
         bkLWGsLj4+i+DOPur2YrosFqv55FoRXsQOF0/IKb9a2DQl1LAt4HcG3K5ujjcfa0msq6
         SIltmd7T7aqJ5Hc3alHDW9ETd9LBVbNQP20hi13YMzJ0tGy1sVuGSlrbedujLD7VMpLv
         NP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716365731; x=1716970531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I07GPXVjk/wNjF5w8+JeEg5eMFs3z+5p0J67OkCSbm8=;
        b=EKsmEEQ5cmjF9yivolHnrSd4y+IB+HRrnouLjUBZWwNrO/EUULZF6rg6Ux14epCmBn
         2BYHDAt2is7325KgQRKTJ7oDFiXL4EoPHxhTS4AQ07Nv5XhhiW5+kW+JqpYocsrY0mEW
         PUJSIjGyVLAJgaglsv8A7ZG6XCp2CAxKoqPYZRK/uXil9Oin4gCs3D/yBKahb+tWtJn5
         VoOK27/2/LJ55BPPzJgvBBVe5CMDl4Lf2kDaA0AQxko/uOON97/Qu6FrGHv2vvkTJ7xz
         ZTWh+kVa1nxiOPtrIr/ef1BdVDMlkIs5iiGGVa7dGSeWo5CSOoU5CpGgDu4b93EUmIxP
         O7lA==
X-Forwarded-Encrypted: i=1; AJvYcCUzLR5QGeOHjOqMzgJbKX6o4xfauLJVW6Kqezl+S9+rSQuHvINj06jslN7VrwaA582kq/EcMyyHRVdcKm16SGPI/D7Voua8Q+FoFkBkHm8=
X-Gm-Message-State: AOJu0YzSL5Xi8fO3Um3TiFLHjZWaWv0KHsXl5+YL3AJrd/iu/cvSnK2L
	+3ceIg4thNy9Pt1M0fVcLg5MrYopXgfdmG/F4eCdEttui1f+iSRPx0bMSmXdLg==
X-Google-Smtp-Source: AGHT+IEq9vhuF6IA/pC+hMVG6JtiF5y6XQnWVQDsV7lejdlkTWk+JfCp/li40vC7FB0+k4P0zExyWA==
X-Received: by 2002:a17:906:c302:b0:a59:b8e2:a0c5 with SMTP id a640c23a62f3a-a6228143abfmr61026666b.51.1716365731340;
        Wed, 22 May 2024 01:15:31 -0700 (PDT)
Message-ID: <df910cf3-b784-48a6-a0af-32527302fb9f@suse.com>
Date: Wed, 22 May 2024 10:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/14] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
 <d26a4033-8cd1-4a9c-8549-49a36b7d52fb@suse.com>
 <9e59da99eb87a7d3fcd8cc6a3c6d6ef2753736af.camel@gmail.com>
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
In-Reply-To: <9e59da99eb87a7d3fcd8cc6a3c6d6ef2753736af.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 09:37, Oleksii K. wrote:
> On Tue, 2024-05-21 at 13:18 +0200, Jan Beulich wrote:
>> On 17.05.2024 15:54, Oleksii Kurochko wrote:
>>> To avoid the compilation error below, it is needed to update to
>>> places
>>> in common/page_alloc.c where flsl() is used as now flsl() returns
>>> unsigned int:
>>>
>>> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer
>>> types lacks a cast [-Werror]
>>>        18 |         (void) (&_x == &_y);            \
>>>           |                     ^~
>>>     common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>>>      1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e
>>> - s) - 1);
>>>
>>> generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is
>>> 0,
>>> the result in undefined.
>>>
>>> The prototype of the per-architecture fls{l}() functions was
>>> changed to
>>> return 'unsigned int' to align with the generic implementation of
>>> these
>>> functions and avoid introducing signed/unsigned mismatches.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  The patch is almost independent from Andrew's patch series
>>>  (
>>> https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t
>>> )
>>>  except test_fls() function which IMO can be merged as a separate
>>> patch after Andrew's patch
>>>  will be fully ready.
>>
>> If there wasn't this dependency (I don't think it's "almost
>> independent"),
>> I'd be offering R-b with again one nit below.
> 
> Aren't all changes, except those in xen/common/bitops.c, independent? I
> could move these changes in xen/common/bitops.c to a separate commit. I
> think it is safe to commit them ( an introduction of common logic for
> fls{l}() and tests ) separately since the CI tests have passed.

Technically they might be, but contextually there are further conflicts.
Just try "patch --dry-run" on top of a plain staging tree. You really
need to settle, perhaps consulting Andrew, whether you want to go on top
of his change, or ahead of it. I'm not willing to approve a patch that's
presented one way but then is (kind of) expected to go in the other way.

Jan

