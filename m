Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E8B986414
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 17:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804350.1215300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUEr-0002lt-8a; Wed, 25 Sep 2024 15:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804350.1215300; Wed, 25 Sep 2024 15:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUEr-0002iG-5K; Wed, 25 Sep 2024 15:47:37 +0000
Received: by outflank-mailman (input) for mailman id 804350;
 Wed, 25 Sep 2024 15:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stUEq-0002iA-K8
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:47:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bdabc24-7b55-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:47:35 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5365928acd0so3785134e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:47:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f78a1sm220428466b.161.2024.09.25.08.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 08:47:34 -0700 (PDT)
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
X-Inumbo-ID: 7bdabc24-7b55-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727279255; x=1727884055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVA8TJTvZLhqMGXgTX8eKmfau69SvtUGqmGTgYMJFh8=;
        b=ZQJbfo7SzhgMUhYbVddffEeT5SsPHqTn4n2uDWxC4uA0CveX9n4yDs8k/TspLnjbJm
         sdWhLuQIYqzk1B8z/GFnkOPogSirsExv0LvyWtFBEec72KL4E6WBHHZMZ9/SGP1iPA0D
         XuqIPG9gS81r/qDElrFpzb2enga3WveUIvd9dGm9LD+UgN81EbVtqOG27SC1F5wexKIq
         9DuDN+3RUopc/TrpdLTSbkfyBGadOFzEN2TRbGyfQXps1CNKdefqA8atlB8m3XpXsP33
         MRqhvKWWSbgM0NxsSAW7MdT5WXo60UXTnNyePPE7AQBWFwHJsz212ZetwfJ6ZJhijQYx
         Cubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279255; x=1727884055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVA8TJTvZLhqMGXgTX8eKmfau69SvtUGqmGTgYMJFh8=;
        b=nF1sT8+Lkb4O6t5VbGuj9vPGxXlcMryRm6dhqOVc+YlBVowBLdc7WSI1NAhl/XiBHN
         i2m9zGwvhXKM3wB350Uzfm+T/GxUj6xKBh+a47WBJ0hTLZWALnu5bD9BQ7FJtvfTKsSP
         9PV9iecxvwJQ77b4dvMD6HPDvPqBizjQSK+bJLnW6HPnMW1YGz/z2W2sRs1Oi8hikafM
         +mtE46uzV3AJ/oCMOjjnMPCpUZiAKfYMcPELSluRmXeFi8OIetCTRFJaqvrtyceFShfZ
         byr7MWbYX5How8iPKLKGo0Ag3TvOwsjga1c2d8hqQBuF0VwHhIgWx699pYqFWG7+X0+X
         sFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoobq5dI0+e6WQx2pLOTqDBlqPgA0+wGTzxsgOWQbYVT7QpK0cjxG2eK1N0PjbyXLSdnCTU1UmwIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqD6bPVJKaQ7xWRE/weYSprmnFVA/+31vrQyTTlK5sLeQYBpks
	uUcjDWJU4H70WzyULxVQmYqswwfS3pMneOPqeY6GB5bC80/usp8LmaVFvhhXbw==
X-Google-Smtp-Source: AGHT+IET3PffK9p7wTzR65BB0OJUJL+ugMHOvvW8dPvh/cIqhUVgryZ8eGQhTtJDB1LrOcf/QZtEHg==
X-Received: by 2002:a05:6512:3b25:b0:536:57fd:f307 with SMTP id 2adb3069b0e04-5387048bb99mr2214799e87.7.1727279254676;
        Wed, 25 Sep 2024 08:47:34 -0700 (PDT)
Message-ID: <f937d942-c5c5-46d1-a677-3e28a824aa1c@suse.com>
Date: Wed, 25 Sep 2024 17:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-13-roger.pau@citrix.com>
 <c30b14a4-3fb2-4e2f-bdcc-81f587540811@suse.com>
 <ZvQQxijykD3cJNaJ@macbook.local>
 <49bd385d-f27a-4ca6-b0d2-56a458b44a84@suse.com>
 <ZvQr-n2gwWnWiJEW@macbook.local>
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
In-Reply-To: <ZvQr-n2gwWnWiJEW@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 17:27, Roger Pau Monné wrote:
> On Wed, Sep 25, 2024 at 04:03:04PM +0200, Jan Beulich wrote:
>> On 25.09.2024 15:31, Roger Pau Monné wrote:
>>> On Wed, Aug 14, 2024 at 12:10:56PM +0200, Jan Beulich wrote:
>>>> On 26.07.2024 17:21, Roger Pau Monne wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -2387,7 +2387,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
>>>>>  
>>>>>  ### spec-ctrl (x86)
>>>>>  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
>>>>> ->              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
>>>>> +>              {msr-sc,rsb,verw,{ibpb,bhb}-entry,asi}=<bool>|{pv,hvm}=<bool>,
>>>>
>>>> Is it really appropriate to hide this underneath an x86-only option? Even
>>>> of other architectures won't support it right away, they surely will want
>>>> to down the road? In which case making as much of this common right away
>>>> is probably the best we can do. This goes along with the question whether,
>>>> like e.g. "xpti", this should be a top-level option.
>>>
>>> I think it's better placed in spec-ctrl as it's a speculation
>>> mitigation.
>>
>> As is XPTI.
> 
> But XPTI predates the introduction of spec-ctrl option, I assumed
> that's why xpti is not part of spec-ctrl.
> 
>>>  I can see your point about sharing with other arches,
>>> maybe when that's needed we can introduce a generic parser of
>>> spec-ctrl options?
>>
>> Not sure how much could be generalized there.
> 
> Oh, so your point was not about sharing the parsing code, but sharing
> the command line documentation about it, sorry, I missed that.

My point was really to share as much as possible, if this was a top-level
option. Of course ...

> Along the lines of:
> 
> asi= boolean | { pv, hvm, hwdom }
> 
> Or similar?
> 
> Even then sub-options would likely be different between architectures.

... the sub-options wouldn't all be generalizable.

>>>>> @@ -143,6 +148,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
>>>>>              opt_unpriv_mmio = false;
>>>>>              opt_gds_mit = 0;
>>>>>              opt_div_scrub = 0;
>>>>> +
>>>>> +            opt_asi_pv = 0;
>>>>> +            opt_asi_hwdom = 0;
>>>>> +            opt_asi_hvm = 0;
>>>>>          }
>>>>>          else if ( val > 0 )
>>>>>              rc = -EINVAL;
>>>>
>>>> I'm frequently in trouble when deciding where the split between "=no" and
>>>> "=xen" should be. opt_xpti_* are cleared ahead of the disable_common label;
>>>> considering the similarity I wonder whether the same should be true for ASI
>>>> (as this is also or even mainly about protecting guests from one another),
>>>> or whether the XPTI placement is actually wrong.
>>>
>>> Hm, that's a difficult one.  ASI is a Xen implemented mitigation, so
>>> it should be turned off when spec-ctrl=no-xen is used according to the
>>> description of the option:
>>>
>>> "spec-ctrl=no-xen can be used to turn off all of Xen’s mitigations"
>>
>> Meaning (aiui) mitigations to protect Xen itself.
> 
> So that would speculation attacks that take place in Xen context,
> which is what ASI would protect against?
> 
> I don't have a strong opinion, but I also have a hard time seeing what
> should `no-xen` disable.

I wonder whether Andrew knows of a clear way of expressing where that line
is intended to be drawn.

>>>>> @@ -378,6 +410,13 @@ int8_t __ro_after_init opt_xpti_domu = -1;
>>>>>  
>>>>>  static __init void xpti_init_default(void)
>>>>>  {
>>>>> +    ASSERT(opt_asi_pv >= 0 && opt_asi_hwdom >= 0);
>>>>> +    if ( (opt_xpti_hwdom == 1 || opt_xpti_domu == 1) && opt_asi_pv == 1 )
>>>>
>>>> There is a separate opt_asi_hwdom which isn't used here, but only ...
>>>
>>> opt_asi_pv (and opt_asi_hvm) must be set for opt_asi_hwdom to also be
>>> set.  XPTI is sligtly different, in that XPTI could be set only for
>>> the hwdom by using `xpti=dom0`.
>>
>> Hmm, I didn't even notice this oddity (as it feels to me) in parsing.
>> From the doc provided it wouldn't occur to me that e.g. "asi=pv" won't
>> affect a PV Dom0. That's (iirc) specifically why "xpti=" has a "hwdom"
>> sub-option.
> 
> It seems to be like that for all spec-ctrl options, see `bhb-entry`
> for example.

Hmm, indeed.

Jan

