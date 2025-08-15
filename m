Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3AB28033
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 14:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083438.1443040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtuk-0008Jc-LS; Fri, 15 Aug 2025 12:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083438.1443040; Fri, 15 Aug 2025 12:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umtuk-0008GY-IA; Fri, 15 Aug 2025 12:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1083438;
 Fri, 15 Aug 2025 12:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umtuj-0008GO-G2
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 12:52:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74b0bf3-79d6-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 14:52:08 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso273513266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 05:52:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfccd5asm139720066b.78.2025.08.15.05.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 05:52:07 -0700 (PDT)
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
X-Inumbo-ID: a74b0bf3-79d6-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755262328; x=1755867128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N8FHr1vhiR0jND9evinEbLEIxAdTX/Hp3G4MjsUktRs=;
        b=Z+E8Rpj6oBkxZFPH+iO/JKDwGBKX8pmrPfxjnaFADfdfp1HWCWNoEQHg168+5TKQpW
         0edOxJf7H7WZWFCxzdHfO519goT2aMXGuxUj539j5XxNHdXWkcR+2lxivxkoTPhxNRuq
         fVZ2R7Yrk0TzlGQpCRZyCRJGZyb6v1K0Orfp5EhJLSBuMEETKlhMjO61m8KS9CFHesfe
         1YZ8jgPP4TpSpqVgRo5L2sDzXvehHCvro7cJmRecrUYEnGh93HQfx+ncrR+Lh0RUaCkJ
         ZXDu4UCGjgnuip0QaVAbTDTMSD24XzcQg/htyh8+C0rujbxanNyPaiFO9oJLGQkl5ZqH
         tbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755262328; x=1755867128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8FHr1vhiR0jND9evinEbLEIxAdTX/Hp3G4MjsUktRs=;
        b=c3ehER25qonMXqOIkY8zpcnlQfiUZm9wLAiltYCmYoOJJKdJtxr+7FqGwHzrmVE6m7
         TZ1UZhZCQ0E1BolHglZtiArlq5cRQmybHAjZNJJFf904VE8r5bck0BMorTUpaQWCylLi
         r9GEfLwWSZU4rYgPHOsyetNj9nIRtlTadBohXrn0gMdfp7lLdwahenPg6NKLms4jhZQo
         J4p1MnZhu/hSkzpFdnoC7+LO29e3bvVOyLELqJ7WuN3D9rEYYnXL8gP6KVRKBCdlzy4V
         ClA9QPc7kSWgkcAWACD/gMiyxndDvAAKW1USosx2NqSv8rfflTZVs9EEyLUU1CbAuKDZ
         SHOw==
X-Forwarded-Encrypted: i=1; AJvYcCUysIzKC5Sjf/tU3zXzfIGUaCQCXa2mEWTf9sumV7+cbJoMHv4B+XceZTzYUUeoYqMvCqP6+jIlIQI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3JRZvsJ38isgFFuaMCtJmgECejtfn4Fj6K3qYa8zUeqJcUx93
	Ma/PMHLdgTMW6tP19PIiulfBW586174Ew0jIhjXRNyxMZIKZGOH9sYwxpg7RWnx48w==
X-Gm-Gg: ASbGncstsQDROKgknKmRd7J01MwcebMglH3yI2H6R4wBvZpRtBN17GMybv6GFxsdTDG
	VuI2aakYPjhoOp8YgRpNYdw5/ZLed47dv7sytxmfJBFE8SpnCgifNGWz5xc9RjKQ4wzGgXCCovs
	xfkB4177XhEyZ5LkR7lcrbcw4+pwscoye+/t48HRiIt3Cl2IZm7KnC/uTU2xKcxAtd3ljc2xtUD
	vln45uuq7+WG45+y4VWspQmeSsdySE64JpCof+pmtA6wHGEqTKdTVa6alM6qcLfYZbCJgB5+S3m
	CdpFEa15VFjrsqVLMQce4XCp1Nag+iwtMGbWkSi5unqNsFjIRwdNfvmY7fpYZa4i9sUwjVeQWvv
	8vBOJR6TK9Db4bdersET78mEUhrSaMqAti1sEkPIjdYifZE9g/yJgvMuc0XTXFkUyF8QYutH6ec
	22pXsVaYc=
X-Google-Smtp-Source: AGHT+IGIfmZhOJyYo/FB1eNMAHKoHKuq7bFJhO9xTt5dx6+Bo61Pph9jCgGvH26PSmPAkiZnidHFgw==
X-Received: by 2002:a17:907:78d:b0:aec:76c6:6ef6 with SMTP id a640c23a62f3a-afcdc3e975fmr175947966b.50.1755262328140;
        Fri, 15 Aug 2025 05:52:08 -0700 (PDT)
Message-ID: <cdbea749-6c40-4ed6-96c4-f4d8c665b79f@suse.com>
Date: Fri, 15 Aug 2025 14:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
 <99171678-71a2-4cec-a6dc-343993108a37@suse.com>
 <b8aff698-fbc8-4fc6-a616-fbe14c7538d7@epam.com>
 <124fbf42-c521-4185-b9e2-a92e7b54a5a4@epam.com>
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
In-Reply-To: <124fbf42-c521-4185-b9e2-a92e7b54a5a4@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 14:42, Dmytro Prokopchuk1 wrote:
> On 8/15/25 13:30, Dmytro Prokopchuk wrote:
>> On 8/15/25 11:42, Jan Beulich wrote:
>>> On 15.08.2025 09:00, Dmytro Prokopchuk1 wrote:
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -95,7 +95,8 @@ Deviations related to MISRA C:2012 Rules:
>>>>          the absence of reports that do not have an impact on safety, 
>>>> despite
>>>>          being true positives.
>>>>          Xen expects developers to ensure code remains safe and 
>>>> reliable in builds,
>>>> -       even when debug-only assertions like `ASSERT_UNREACHABLE() 
>>>> are removed.
>>>> +       even when debug-only assertions like `ASSERT_UNREACHABLE()` 
>>>> are removed.
>>>> +     - ECLAIR has been configured to ignore those statements.
>>>
>>> Mind me asking why one form of quoting is used here (using back-tick), 
>>> while ...
>>>
>>>> --- a/docs/misra/rules.rst
>>>> +++ b/docs/misra/rules.rst
>>>> @@ -124,7 +124,7 @@ maintainers if you want to suggest a change.
>>>>              they are used to generate definitions for asm modules
>>>>            - Declarations without initializer are safe, as they are not
>>>>              executed
>>>> -         - Functions that are no-return due to calls to the 
>>>> `ASSERT_UNREACHABLE()'
>>>> +         - Functions that are no-return due to calls to the 
>>>> 'ASSERT_UNREACHABLE()'
>>>
>>> ... another is used here (single quotes)?
>>>
>>> Jan
>>
>> Good question...
>> I'll align a style.
>>
>> Dmytro.
> 
> Well, the deviations.rst and rules.rst files have a mixed style.
> Sometimes file names are in '', and sometimes in ``.
> The same inconsistency applies to referring to code.
> 
> Any style suggestions?

That depends on how both quoting styles are treated by Sphinx. Which is
something I don't know. I merely noticed the inconsistency within this
single patch.

Jan

