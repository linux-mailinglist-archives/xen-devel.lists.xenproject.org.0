Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9588C32C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 14:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698077.1089395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6eQ-0001oh-2K; Tue, 26 Mar 2024 13:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698077.1089395; Tue, 26 Mar 2024 13:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp6eP-0001nA-Vo; Tue, 26 Mar 2024 13:15:37 +0000
Received: by outflank-mailman (input) for mailman id 698077;
 Tue, 26 Mar 2024 13:15:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp6eO-0001n4-FI
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 13:15:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed526455-eb72-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 14:15:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46ba938de0so739281666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 06:15:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a27-20020a170906191b00b00a46bd891b5bsm4221340eje.225.2024.03.26.06.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 06:15:32 -0700 (PDT)
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
X-Inumbo-ID: ed526455-eb72-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711458933; x=1712063733; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VDQ7ue7i5LpVN9CFjhO5zilWhINPYQ7Zsi1e5bbjbo=;
        b=d9qVkhqEdylHjrlFaYTaMdJ+9ZkgX5KwSK83I9b0cci8SrxPS69bAFOEiMP2boE6Js
         GuYNPnuGK0TAhP9UfUEaaCdGzd56bMB9IYRsDX7RQMXzgyRpriaQ5lZdv4eaovoq39hp
         R6B1wIWRalm172yAZIC4u10UphKRuclF2K4SMHawkvZjLniEBMfIMuHuRFckWXq/FM4t
         9k+Ly/3EBbARKPTZ6UBA0xBvyU+qo1z2dYnT+Se20RFpv4LbU3O1Hro5V67L0QZlwlqx
         0keXGmAGWrAcHMu6JlBTJyUVLg4oNctr4bQCfEfPEAVnxKq57UATwbvzTouUnmVTkxaz
         v/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711458933; x=1712063733;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VDQ7ue7i5LpVN9CFjhO5zilWhINPYQ7Zsi1e5bbjbo=;
        b=h9voY4DaAg8T///2bM9YR8nB8KjE55aK6nXaOWlAng78TYiz7uTILsIF3ekoQFGeoG
         r2YT/NHKK53M1BDABtMp+s0A5ascSu1UJzfM3V6sLERHjKabF2BiybWMyd7FramhjEra
         WGvjlCJnn6siQHnRm9QSg3gLcGU7vK/c4CwsUfVRigRtYVzbXSN61JsKeSigYKxqymNF
         6QOfwV0/ZN8CMqyqvnNlshUl4BH8en93ePaO/yWQ7pBPgPon0hRRZjyJuiYPw+VhTCMM
         xVSeHBhANSBZ0XClhSalEiCsUIBGUxjVC8dS3ZJLK3k/T5wloOI8Y1qkjl/CEl/LA1RS
         vrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWieY9jt9fuMYWKC1tlFueeO6g9SaQuIjObtbRhZm4pMcOF+kcD74fSnYlO9hKV2qqKQxXFpGn1L6EuImZyoDpyp570f9iEGJooSXrMkmA=
X-Gm-Message-State: AOJu0YxPHZxGCF0u5oQ4ytgTr/rGaQZvHQ2Vfp7Qz8g5KMYC0f+enHg4
	qNJplXUTqQTik95IAeHOtWVNHkQuRu2RZWYthsUb8SS8NgwHEfxIMa1oxoQ1dw==
X-Google-Smtp-Source: AGHT+IHRK/jG/ZDVJ3AkFWkq1Sg7y1PT3UU2fxtVpo2cMsbGXSm1/Ft7Qu8L5nRq0KB1/kuBKqk/hQ==
X-Received: by 2002:a17:906:15c2:b0:a47:35c6:910c with SMTP id l2-20020a17090615c200b00a4735c6910cmr1896643ejd.22.1711458933033;
        Tue, 26 Mar 2024 06:15:33 -0700 (PDT)
Message-ID: <f0eb123a-c756-4eec-944f-cc7804c7c6a0@suse.com>
Date: Tue, 26 Mar 2024 14:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/spec-ctrl: Support for SRSO_US_NO and SRSO_MSR_FIX
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240325181830.638680-1-andrew.cooper3@citrix.com>
 <c03d96b2-ad9c-4fa7-b7bb-fb453dbb9c5e@suse.com>
 <78be9d6c-2b3d-43ad-92fe-23d58767e2d6@citrix.com>
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
In-Reply-To: <78be9d6c-2b3d-43ad-92fe-23d58767e2d6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 12:33, Andrew Cooper wrote:
> On 26/03/2024 9:13 am, Jan Beulich wrote:
>> On 25.03.2024 19:18, Andrew Cooper wrote:
>>> +	/* Avoid reading BP_CFG if we don't intend to change anything. */
>>> +	if (!new)
>>>  		return;
>>>  
>>>  	rdmsrl(MSR_AMD64_BP_CFG, val);
>>>  
>>> -	if (val & chickenbit)
>>> +	if ((val & new) == new)
>>>  		return;
>> Since bits may also need turning off:
>>
>> 	if (!((val ^ new) & (BP_CFG_SPEC_REDUCE | (1 << 5))))
>> 		return;
>>
>> and the !new early-out dropped, too? Looks like this wasn't quite right
>> before, either. 
> 
> That's adding unnecessary complexity.  It's unlikely that we'll ever
> need to clear bits like this.

Okay. Half a sentence in a comment would be nice, to make clear the
behavior is intended to only ever set bits.

>>> @@ -1078,22 +1082,41 @@ static void __init ibpb_calculations(void)
>>>           * Confusion.  Mitigate with IBPB-on-entry.
>>>           */
>>>          if ( !boot_cpu_has(X86_FEATURE_BTC_NO) )
>>> -            def_ibpb_entry = true;
>>> +            def_ibpb_entry_pv = def_ibpb_entry_hvm = true;
>>>  
>>>          /*
>>> -         * Further to BTC, Zen3/4 CPUs suffer from Speculative Return Stack
>>> -         * Overflow in most configurations.  Mitigate with IBPB-on-entry if we
>>> -         * have the microcode that makes this an effective option.
>>> +         * Further to BTC, Zen3 and later CPUs suffer from Speculative Return
>>> +         * Stack Overflow in most configurations.  Mitigate with IBPB-on-entry
>>> +         * if we have the microcode that makes this an effective option,
>>> +         * except where there are other mitigating factors available.
>>>           */
>> Hmm, is "Zen3 and later" really appropriate?
> 
> Yes.
> 
> SRSO isn't fixed until SRSO_NO is enumerated.

IOW even on Zen5 that's going to be only by ucode update?

>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -304,7 +304,9 @@ XEN_CPUFEATURE(FSRSC,              11*32+19) /*A  Fast Short REP SCASB */
>>>  XEN_CPUFEATURE(AMD_PREFETCHI,      11*32+20) /*A  PREFETCHIT{0,1} Instructions */
>>>  XEN_CPUFEATURE(SBPB,               11*32+27) /*A  Selective Branch Predictor Barrier */
>>>  XEN_CPUFEATURE(IBPB_BRTYPE,        11*32+28) /*A  IBPB flushes Branch Type predictions too */
>>> -XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulenrable to Speculative Return Stack Overflow */
>>> +XEN_CPUFEATURE(SRSO_NO,            11*32+29) /*A  Hardware not vulnerable to Speculative Return Stack Overflow */
>>> +XEN_CPUFEATURE(SRSO_US_NO,         11*32+30) /*A  Hardware not vulnerable to SRSO across the User/Supervisor boundary */
>> Can we validly expose this to 64-bit PV guests, where there's no CPL
>> boundary? Or else isn't my "x86/PV: issue branch prediction barrier
>> when switching 64-bit guest to kernel mode" needed as a prereq?
> 
> Based on uarch details, if BP-SPEC-REDUCE is active, we can advertise
> SRSO_US_NO to PV guests.

Which would make it at best !A, for the PV exposure then depending on
the HVM side choice.

Jan

