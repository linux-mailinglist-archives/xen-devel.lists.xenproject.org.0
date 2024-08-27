Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2BC960B33
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783974.1193319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivol-0002Ln-Eg; Tue, 27 Aug 2024 13:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783974.1193319; Tue, 27 Aug 2024 13:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivol-0002JT-Bo; Tue, 27 Aug 2024 13:01:03 +0000
Received: by outflank-mailman (input) for mailman id 783974;
 Tue, 27 Aug 2024 13:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sivok-0002JL-5v
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:01:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e2a0fc-6474-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:01:01 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c0a9ae3665so2534485a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:01:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d329sm107017366b.108.2024.08.27.06.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:01:00 -0700 (PDT)
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
X-Inumbo-ID: 68e2a0fc-6474-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724763660; x=1725368460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/Y37xa5dmOu2WJNrgkdELJh6zKVgnLEPOXYENeQDW8=;
        b=alm9qkL3ad0ZgRTWmlR0tPpeTgbHI0qk7scOfK5NOyxPMOvaUbC8YrSBrFkI37ArlW
         DIi0btLLg69E0HjxsirGjlwQ3Q3LEKXV73IIMadP7AhWt0IOpec1w+NyBkuu8lBrJAfK
         wz++VnQyjhoG//0K2D6+560g5hrouICvIed44okbzjwbr4mggsY9+dW9MxXHEfbvZhHQ
         rH8hAOkQLX17m6/duL6iVnBBwyQrKOgzAiGgT6UiLhOLEvUA8ruAkgo249w7hCgtS40O
         0tM0uFngf3gHiYPKWsoVovePwQ99b3wjXZ8O24PLC2W40Ksf7aE8CSsBTKqharhgw4rk
         VdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763660; x=1725368460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/Y37xa5dmOu2WJNrgkdELJh6zKVgnLEPOXYENeQDW8=;
        b=A6fCK6yxvq3+LYKXOdkW3UnLIEw9OeVFdWIgD0hkLogycr/dsXxg5gwRHajLImbVXy
         gjOrUVmZDj2aMRstgdrpdSBfROe4Sk42IA0tSPbb3lv936fiQWmvAEZjisFqprtpKaCQ
         oKVYVmLt7uoN6TgfaS3AIRXimt9XXAIWz0FVo5rs5TkU4Ya0jS8VGoaGXIkqNs+9x33l
         OGAvqgrmltJDhutJBABaEGM1eW1OTqyKBn3r3d1DPFs8uLsnQzW/erLYNTweb1XaxYjh
         eVtI9OXEG/BMTDbPJsk09e+wJz+i/KwnlU7REmaIV9+PPDobEnfudfJuIZwtiENiBbDt
         2wJA==
X-Forwarded-Encrypted: i=1; AJvYcCWSwNqv9WlQSEQfUvnmY1bJPS9czBiBXlSVSQ6lJIQyiwfzPlXUi8pRYdfuIAGgncGnQd0/xuBFEkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/fTjCPsXfAKn2PgPbnjOsu42tFsF/q9Ysj/IftK5yAv3+oNZO
	8oobr+HTY3iex6t6UKGuKGlTaGSh+S6Pq1mLNAyB8vUVHZubFknlNxsyfbOOQg==
X-Google-Smtp-Source: AGHT+IESf0thDUfvLP26gREXEAlfFn24pb5NvaQ1mPmSsNHUi4m5dfhfHIwE7gGBVTCGpycn6D7dCw==
X-Received: by 2002:a17:907:ea5:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a86e39dcb21mr192839766b.26.1724763660324;
        Tue, 27 Aug 2024 06:01:00 -0700 (PDT)
Message-ID: <73309650-3912-418b-b2e6-a60676519911@suse.com>
Date: Tue, 27 Aug 2024 15:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-8-andrew.cooper3@citrix.com>
 <11da1350-095f-49c8-bdf0-f5c83e9f0d39@suse.com>
 <70047ef7-ca22-4eeb-9510-09ccdf0871c0@citrix.com>
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
In-Reply-To: <70047ef7-ca22-4eeb-9510-09ccdf0871c0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 13:50, Andrew Cooper wrote:
> On 26/08/2024 12:55 pm, Jan Beulich wrote:
>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -302,6 +302,14 @@ static always_inline __pure unsigned int hweightl(unsigned long x)
>>>  #endif
>>>  }
>>>  
>>> +static always_inline __pure unsigned int hweight64(uint64_t x)
>>> +{
>>> +    if ( BITS_PER_LONG == 64 )
>>> +        return hweightl(x);
>>> +    else
>>> +        return hweightl(x >> 32) + hweightl(x);
>> This assume BITS_PER_LONG == 32, which of course is true right now, but
>> doesn't need to be in general. Better add an explicit cast to uint32_t
>> (or masking by 0xffffffffU)?
> 
> This is part of the point of putting in the self-tests.  They're
> intended to catch things like this in new build environments.

I don't think I saw any testcase where the result would be wrong if
this split didn't truncate x to the low 32 bits on the rhs of the +.

> Although, I think we've got enough cases which will #error on
> BITS_PER_LONG not being 32 or 64.

My take on this is: Such checks (#error or whatever else precaution)
should like in every single place where violating the assumptions
made would matter. Or else - how do you locate all the places that
need changing?

> Again, this is modelled after f[fl]s64() which have the same
> expectations about the BITS_PER_LONG != 64 case.

Both of them are fine afaict. fls64() has an explicit intermediate
variable of type uint32_t, and ffs64() has a (uint32_t)x as part
of the conditional expression achieving the intended effect.

Anyway, why not use hweight32() instead of hweightl() here? That'll
make things very explicit.

Jan

