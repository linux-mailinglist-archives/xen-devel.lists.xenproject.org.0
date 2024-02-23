Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8874086116C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684847.1065025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUba-0005mP-Hj; Fri, 23 Feb 2024 12:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684847.1065025; Fri, 23 Feb 2024 12:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUba-0005jP-Du; Fri, 23 Feb 2024 12:24:42 +0000
Received: by outflank-mailman (input) for mailman id 684847;
 Fri, 23 Feb 2024 12:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdUbY-0005jD-OI
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:24:40 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 831c6e53-d246-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:24:38 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5643ae47cd3so891108a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:24:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q29-20020a50cc9d000000b00563a3ff30basm6806208edi.59.2024.02.23.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 04:24:37 -0800 (PST)
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
X-Inumbo-ID: 831c6e53-d246-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708691078; x=1709295878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4I9sZOXJcqzreICLCN3hytYAXvuabcNleeaVNRUsbI=;
        b=bHDZMfdUkxgkX4TffbTVl573m4sYD7zU2ifIsrqIvziOs6sS7/ZMeuMTZxMrH/VdUr
         63Vq5Qj8boBl5+8ERUTXQ611mbEftLGs4/2SGfpHGhuijFbCQ+EfFiUKPnvGZAhLN1O0
         A7vF76lKnvZMgsztkDMY4MiO5lTdESVLYdrvCrZUC9iXUOCb/Eo5VM/xPrWkS53IMFV9
         nf5G4r5uEfx4JiSQzi6sugJx0F7+z5idz+og6dcZJefc+8/2qyn32J1QilAOpPYwAOQS
         v7QsSC1AvWheouzr4COLq+0J+xvpTN67natc6pV5D3tvEHv/oW//gi20HiGOJRr2Xrve
         p+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708691078; x=1709295878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4I9sZOXJcqzreICLCN3hytYAXvuabcNleeaVNRUsbI=;
        b=iD2c64L4wEBMtOcu4Eiygq7YKgsxdzCwZ2iwO2ptgotrQ8tOmbLxcYnd9hTlABEvEK
         9MCvH3c0X52KTvDbJHCIJmyTCnvAa7Yx/w5cjhHTLxOBuRbHkspNE5mvJOW/F7fUqIn7
         sVItN9tjevtbJZdth1K7Vd7isq5IwPWC6mhr1nhEFY3h/2Y1hrb1N2aUylBN1cAFtDY+
         I2hiPW64AmkIc7RusFFkfQOe5ZIQZeHS0y8OCnUq1tzGiHS4L9iF87jgUuOEpxpgLjcJ
         g9dw2xlCzN1538+RnQCnrEdyDAC/MblUlpOfhET/x7Uvs255HQ8W+WKneze9CMnUazYM
         qKuA==
X-Forwarded-Encrypted: i=1; AJvYcCV+fSEizMW8k/HV1c1ATSW5EaaVSnk3S7oPMsyaFka48LPFOwrDEHHqdoIetgT3N9Fof0LrZFQkDlb12956qxPdIBe43m3C2VOraUSjPNU=
X-Gm-Message-State: AOJu0YxCLj8j6Wn7HamnNQ3G/1dnKmCqWQZNo5kXj8gfZzttruOv19Sk
	ivkQF+dHzu9iJuQsPtEmWamgU9g6r+rrp6yEy6VznkbM/iuDLN4UcG4MIuVx0g==
X-Google-Smtp-Source: AGHT+IEqiazWVbPH8vIlUohZwm2+g5dBndk+3IyGp9Ma66OsdTPaK0lu7KlAqN/37lZg0rHIEsxJ2w==
X-Received: by 2002:a05:6402:254c:b0:565:7114:ef37 with SMTP id l12-20020a056402254c00b005657114ef37mr1438498edb.12.1708691078043;
        Fri, 23 Feb 2024 04:24:38 -0800 (PST)
Message-ID: <fd3e6d0f-897b-490f-937f-5127a5c13636@suse.com>
Date: Fri, 23 Feb 2024 13:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Matthew Grooms <mgrooms@shrew.net>, xen-devel@lists.xenproject.org
References: <20240222164455.67248-1-roger.pau@citrix.com>
 <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com> <ZdhjDBlHRtO4MIhM@macbook>
 <b62f223d-8baa-4d5b-aeba-9890c101b28c@suse.com> <ZdiNJHErP1V-3CIi@macbook>
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
In-Reply-To: <ZdiNJHErP1V-3CIi@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 13:18, Roger Pau Monné wrote:
> On Fri, Feb 23, 2024 at 11:43:14AM +0100, Jan Beulich wrote:
>> On 23.02.2024 10:19, Roger Pau Monné wrote:
>>> On Thu, Feb 22, 2024 at 05:55:00PM +0100, Jan Beulich wrote:
>>>> On 22.02.2024 17:44, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>>> @@ -167,9 +167,25 @@ extern void alternative_branches(void);
>>>>>  #define ALT_CALL_arg5 "r8"
>>>>>  #define ALT_CALL_arg6 "r9"
>>>>>  
>>>>> +#ifdef CONFIG_CC_IS_CLANG
>>>>> +/*
>>>>> + * Use an union with an unsigned long in order to prevent clang from skipping a
>>>>> + * possible truncation of the value.  By using the union any truncation is
>>>>> + * carried before the call instruction.
>>>>> + * https://github.com/llvm/llvm-project/issues/82598
>>>>> + */
>>>>
>>>> I think it needs saying that this is relying on compiler behavior not
>>>> mandated by the standard, thus explaining why it's restricted to
>>>> Clang (down the road we may even want to restrict to old versions,
>>>> assuming they fix the issue at some point). Plus also giving future
>>>> readers a clear understanding that if something breaks with this, it's
>>>> not really a surprise.
>>>
>>> What about:
>>>
>>> Use a union with an unsigned long in order to prevent clang from
>>> skipping a possible truncation of the value.  By using the union any
>>> truncation is carried before the call instruction.
>>
>> ..., in turn covering for ABI-non-compliance in that the necessary
>> clipping / extension of the value is supposed to be carried out in
>> the callee.
>>
>>>  Note this
>>> behavior is not mandated by the standard, and hence could stop being
>>> a viable workaround, or worse, could cause a different set of
>>> code-generation issues in future clang versions.
>>>
>>> This has been reported upstream at:
>>> https://github.com/llvm/llvm-project/issues/82598
>>>
>>>> Aiui this bug is only a special case of the other, much older one, so
>>>> referencing that one here too would seem advisable.
>>>
>>> My report has been resolved as a duplicate of:
>>>
>>> https://github.com/llvm/llvm-project/issues/43573
>>>
>>> FWIW, I think for the context the link is used in (altcall) my bug
>>> report is more representative, and readers can always follow the trail
>>> into the other inter-related bugs.
>>
>> While true, the comment extension suggested above goes beyond that
>> territory, and there the other bug is quite relevant directly. After all
>> what your change does is papering over a knock-on effect of them not
>> following the ABI. And that simply because it is pretty hard to see how
>> we could work around the ABI non-conformance itself (which btw could
>> bite us if we had any affected C function called from assembly).
>>
>> 43537 looks to be a newer instance of 12579; funny they didn't close
>> that as a duplicate then, too.
> 
> So would you be OK with the following:

Yes, ...

> Use a union with an unsigned long in order to prevent clang from
> skipping a possible truncation of the value.  By using the union any
> truncation is carried before the call instruction, in turn covering
> for ABI-non-compliance in that the necessary clipping / extension of
> the value is supposed to be carried out in the callee.
> 
> Note this behavior is not mandated by the standard, and hence could
> stop being a viable workaround, or worse, could cause a different set
> of code-generation issues in future clang versions.
> 
> This has been reported upstream at:
> https://github.com/llvm/llvm-project/issues/12579

... yet perhaps still list your new bug report here as well.

Jan

