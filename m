Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4BAA42EB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973314.1361463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0cC-00036F-BZ; Wed, 30 Apr 2025 06:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973314.1361463; Wed, 30 Apr 2025 06:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0cC-00033j-7a; Wed, 30 Apr 2025 06:08:16 +0000
Received: by outflank-mailman (input) for mailman id 973314;
 Wed, 30 Apr 2025 06:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA0cA-00033d-5w
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:08:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7ee91e-2589-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 08:08:08 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso1492521566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 23:08:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41b80fsm879602466b.9.2025.04.29.23.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 23:08:07 -0700 (PDT)
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
X-Inumbo-ID: 7c7ee91e-2589-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745993287; x=1746598087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQZVuljIUcHxMiVEORoKzitdgT4s298uHQ8Ty6t2KTA=;
        b=PkejfPkFBgY1h3HtOcz2fVzGiZZcMn4Z2vazHSPTtWSxw8Y8Um+/dzLas8MclUnd7Q
         Y+w/UJYVK86hdryYEABB80AeUOuxE2aqnbqZrnaKz0AkmYJDlH4n9j6W3xyY9TthXvf6
         WCKznErTjuj7FV6RXxIHlsgTZdaxO4It9/niuQqJIrgTZdZm4u78YzgYp53+P20VRGcH
         DuKWobTmDVCrTWbnyZUMNElCXdQk3DqHYc6bNIJ3rEFm08kC4eAigfnnOatNS0tgPbK5
         fEJvngtPjDlNYgOOw4P5p/VW0xJAhDolrCCFt9K9H1ASXNz24KV9yVURMb498SiukVfe
         F+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993287; x=1746598087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQZVuljIUcHxMiVEORoKzitdgT4s298uHQ8Ty6t2KTA=;
        b=nWE8pP1yKb9FuTOI3Bs4m1s3ixAMJxnzrxXsPoUwmyOeicHNfbIIFC/WRCY9pDpWNe
         FW/xDOvaix5txLdx5dfiSfdiZ3qC/i3dvGJrarqcD/4/dFBGjltAU8kH1lXrTpklem8w
         J7lwcCQ9eTzn8C4Tc6WDXR9Re3XhNbQtQSMkFEUYPJqGKL7AdpBy0YvCu0qCDt8NUQvH
         hYDEhvXUoxezpcmEm5QUMIiByI+SEFPCkC3vGzOKzgqCXCiSL6GtEly1ZVwldZVuUJrs
         0PJ+xs0VUaMmKmMwjmezM7xyAjEgwW1Ao5c4gwJyJAcHQpS9RnN90e1eUAuqhYnYzp60
         K2ng==
X-Forwarded-Encrypted: i=1; AJvYcCXtmc9vzvaW6pCJQjxlx5BrlBK9+lhCLrrntDA/X3B7lqZBPtwsCr+2y423dEoEuuqbMdoVIK3aLIw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYiL6kK+v6mqBWj9ypTf+/BXD0exWOHavnpV5WGGObErgRtpcw
	lZR/k7mU2xO+vEkkTuKGVCyjOmB8pvFNy+wscGRzAsU+aFjQjtL9jRlifZipAQ==
X-Gm-Gg: ASbGncuIlwTguqPeyFNMoRDv4TG108xd77+BdyNMKPmSM7+SJA7VONUHb+V82drcGWp
	OcCm8aQ2UTUGy9J20Y3nY1DyNPq5cxxPTRwhRVGsxe5xLEJd6GynuNUBueljw+JX0wwBRt9EKIM
	bQJrfRtPoeAQVrQygvczIkmKL2YCqwufZLvXZwgIOw8p7yXc+SzC/siHUYRqlg2ilXme+qXdgQV
	4OUMQ7xXFQ0EEjLLVXG60h3D17OvZggIsfZ9d4ak6OZNmlCnpCJh00Zmn2cHA/CELQ5GG5KRea+
	aL+c4CYj5VE2iIoszs1F9x/9j+CIKsYoj7lpI8onmz1vofwevof93PLtcCSH/1gjhtqpGIyUFAC
	SFaLMP8xtJTT/StpA96y3PRHMCQ==
X-Google-Smtp-Source: AGHT+IFHkcE5qSMZaVPbjH4WX/W2U0DKY3qbqyvrzpNm2W3f+hZFGcURIVFLi+uZiss6ZSwderPwHQ==
X-Received: by 2002:a17:907:1c84:b0:acb:b966:3a7c with SMTP id a640c23a62f3a-acedc733da7mr196961466b.47.1745993287374;
        Tue, 29 Apr 2025 23:08:07 -0700 (PDT)
Message-ID: <2be0b5a8-50ee-4c3c-9299-0f065ac5aa05@suse.com>
Date: Wed, 30 Apr 2025 08:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C
 Rule 19.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
 <914e3157-736a-4890-9c91-e93fcc260bb0@suse.com>
 <alpine.DEB.2.22.394.2504281625240.785180@ubuntu-linux-20-04-desktop>
 <350d447e-7316-4d54-8468-68f78675cc8d@suse.com>
 <alpine.DEB.2.22.394.2504291510120.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504291510120.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 00:54, Stefano Stabellini wrote:
> On Tue, 29 Apr 2025, Jan Beulich wrote:
>> On 29.04.2025 03:27, Stefano Stabellini wrote:
>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>> On 26.04.2025 01:42, victorm.lira@amd.com wrote:
>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> Rule 19.1 states: "An object shall not be assigned or copied
>>>>> to an overlapping object". Since the "call" and "compat_call" are
>>>>
>>>> Was this taken from patch 2 without editing?
>>>>
>>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>>> @@ -526,9 +526,19 @@ static inline void put_loop_count(
>>>>>           */                                                             \
>>>>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>>>>>          {                                                               \
>>>>> +            uint64_t tmp;                                               \
>>>>> +                                                                        \
>>>>>              _regs.r(cx) = 0;                                            \
>>>>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
>>>>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
>>>>> +            if ( extend_si )                                            \
>>>>> +            {                                                           \
>>>>> +                tmp = _regs.esi;                                        \
>>>>> +                _regs.r(si) = tmp;                                      \
>>>>> +            }                                                           \
>>>>> +            if ( extend_di )                                            \
>>>>> +            {                                                           \
>>>>> +                tmp = _regs.edi;                                        \
>>>>> +                _regs.r(di) = tmp;                                      \
>>>>> +            }                                                           \
>>>>
>>>> See commit 7225f13aef03 for how we chose to address similar issues elsewhere
>>>> in the emulator. I think we want to be consistent there. This will then also
>>>> eliminate ...
>>>>
>>>>> @@ -2029,7 +2039,12 @@ x86_emulate(
>>>>>          switch ( op_bytes )
>>>>>          {
>>>>>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
>>>>> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
>>>>> +        case 4:
>>>>> +            {
>>>>> +                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
>>>>> +                _regs.r(ax) = tmp;
>>>>> +                break; /* cwde */
>>>>> +            }
>>>>
>>>> ... the odd brace placement here, as well as the inconsistency in the types
>>>> you used for the temporary variables (both really could have been unsigned
>>>> int; no need for a fixed-width type).
>>>
>>> Is this what you have in mind?
>>
>> No, and that's also not what the referenced commit did in a similar situation.
>>
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>>>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>>>          {                                                               \
>>>              _regs.r(cx) = 0;                                            \
>>> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
>>> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
>>> +            if ( extend_si ) _regs.r(si) = (uint64_t)_regs.esi;         \
>>> +            if ( extend_di ) _regs.r(di) = (uint64_t)_regs.edi;         \
>>
>>             if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);       \
>>             if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);       \
>>
>> After all what the rule requires is that we use _the same_ field on both sides.
> 
> I see, thanks Jan. Yes I did try this version and worked as expected.

Except that ...

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -527,8 +527,8 @@ static inline void put_loop_count(
>          if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
>          {                                                               \
>              _regs.r(cx) = 0;                                            \
> -            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
> -            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
> +            if ( extend_si ) _regs.r(si) = (uint32_t)_regs.r(si);        \
> +            if ( extend_di ) _regs.r(di) = (uint32_t)_regs.r(di);        \
>          }                                                               \
>          goto complete_insn;                                             \
>      }                                                                   \
> @@ -2029,7 +2029,7 @@ x86_emulate(
>          switch ( op_bytes )
>          {
>          case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
> -        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
> +        case 4: _regs.r(ax) = (int16_t)_regs.r(ax); break; /* cwde */

... the change in casts here renders this wrong now, afaict. We'd sign-
extend from 16 to 64 bits, rather than sign-extending to 32 bits and
then zero-extending to 64.

Jan

