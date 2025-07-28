Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C9B13E64
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061724.1427312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPpW-00075E-7S; Mon, 28 Jul 2025 15:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061724.1427312; Mon, 28 Jul 2025 15:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPpW-00073e-4k; Mon, 28 Jul 2025 15:31:58 +0000
Received: by outflank-mailman (input) for mailman id 1061724;
 Mon, 28 Jul 2025 15:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugPpU-00073U-EB
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:31:56 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd3a2e03-6bc7-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 17:31:54 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so1253536f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:31:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403c16fa8dsm19208925ad.156.2025.07.28.08.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:31:52 -0700 (PDT)
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
X-Inumbo-ID: fd3a2e03-6bc7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753716713; x=1754321513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ3fFFAYB7HLt2ulgM1AlZmlip+HlUz2nT0LUj9MaF4=;
        b=a3jRmOtV2IEaDoudiS3ms2BEPZWRbFIX/B2Iv+8Z1AETN+pr+lG4zhENVgBgjk+QLF
         Q10VG803t99/ldeMWju7tQe0psmdP8RJb1Hu0/+2iE9XlInqeCNuIha5tvz01jTJ/iWq
         KK4meQ2xtGHw1zSYObhzZIP5lvPVHifjeFhHHqBU2nNsIMQ3pb+YSIUK9nUk6pGdPbFn
         hIM/Gldd+TXxpucg/Qzge0ErcaesPQfbBP6kO+eQzfgBlIDJbztplytG0ealMJxzeAsE
         AGHyOZHfByAkblWOscVQd+l9xlMxJw0pgSsMRKdcJVOrjiBMuJSEgkyvyWA9IdhtCMGq
         UdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753716713; x=1754321513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQ3fFFAYB7HLt2ulgM1AlZmlip+HlUz2nT0LUj9MaF4=;
        b=lB0LUM0yWEOHAqBOf0qdtiNUCSBq7ffONLy1E4f2HIVCryKs2DLvBl2fdhphaSVfUZ
         e6fCC0zh+jOHJ0o4yzZcFmLe80FjhxsD6ScG3zfatIM63oiIUn9ZSnB8keM3EFRb6KJr
         XtCj2LWCVuXqftbND+t+iAQGQMxPUD0kW7QSFiHloT6t/BRsS8/SOOgOGg5hCt+4lJRb
         +vDDIHtP4KZnPPeTFBdhaAjxWsumiTIHP98mSC6+aV32XcAlwOi7e5t6M9rMzH6CywdS
         rruAGn16vNCgPYPty0/5VbicT5hIDCWVv63PKYafksADF2sGlfnkJ2vtd/OLih/PMA86
         xi4g==
X-Forwarded-Encrypted: i=1; AJvYcCVpdwmLTBszl3NlxNTst7LFsyPrwJefZp6ZELntNsKFcNp7/rM4Xtp4+xsR4QwC98QNHohuPRWYN0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHdPBTLMGksQ+OHrI9/gydiFqLJKugowt6KM1HxcGyGmhQB4Oe
	7t4ehzx3D+Ui2B+vLrisFbWct2SSlRrRU8BAr2KTo1vWbdY4vWAYNL4Z6WHmQ5F5Cw==
X-Gm-Gg: ASbGncviamVaS/gUlDwru194OiRc8EqtadMJ3HLbDC5Kkf2ipJYNv5y9yLrlHA8jUV7
	yHXNKqrpWagQqJn/MUm6JuwktfEDV2Z2/48YkTX69BuuuyHLNMwbXjNkQB5igGbHBb+/qufkYqG
	EmnIr3epzOS86D6rtAVlPqpQBoVCQXd5E6giX2R7y4aT9pFZfh8xah2nTrIWHiFdWLp+dfmz+Yg
	b/uggHKXBiuWKuyhHdAiNE/RJwyqW0mvayydgpBog5hNO2XeGLk6KdwGoE9SMcjKLBCGCPh4OEv
	Pw3hxipbLm8tLfV2nyuuEp8SnRssTFTT6jjpULb4ojLBFjbZ9Uli4KQnEVk005aL6+5pYZocSLs
	AYLxa7qmS2ENdryLNoI02UedlPuQ1LDUxA9MGKdXFqtwd/8zAn6oM1UpCg/DjbO0i6kWjhwT57p
	iD/z1jEXg=
X-Google-Smtp-Source: AGHT+IHes4jzaYG4GaB4wDfpl1KzTV3ummSHfku/S/0DHZanp9Q1xwVpBHAuNY7izQEpxj9kOBDChg==
X-Received: by 2002:a05:6000:25c8:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b7765ed05dmr9144073f8f.14.1753716713289;
        Mon, 28 Jul 2025 08:31:53 -0700 (PDT)
Message-ID: <486d3e0d-b99a-4420-89e8-832493c4f2a8@suse.com>
Date: Mon, 28 Jul 2025 17:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
 <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
 <4db06b93173be64963d8fca547f1f0e6@bugseng.com>
 <5b4106be-bca9-4c82-bd55-41ada84c3b1f@citrix.com>
 <f9a7884b-d58e-4ae7-b5ca-ce751ca70245@epam.com>
 <091fc447-93cd-4f48-8f5f-e2b7996aa8bf@suse.com>
 <7a4b6733-13c3-4f92-9899-f71ac780cf7b@epam.com>
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
In-Reply-To: <7a4b6733-13c3-4f92-9899-f71ac780cf7b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 17:29, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/28/25 16:15, Jan Beulich wrote:
>> On 28.07.2025 14:28, Dmytro Prokopchuk1 wrote:
>>>
>>>
>>> On 7/28/25 13:59, Andrew Cooper wrote:
>>>> On 28/07/2025 11:38 am, Nicola Vetrini wrote:
>>>>> On 2025-07-28 11:36, Jan Beulich wrote:
>>>>>> On 25.07.2025 18:24, Dmytro Prokopchuk1 wrote:
>>>>>>> --- a/docs/misra/deviations.rst
>>>>>>> +++ b/docs/misra/deviations.rst
>>>>>>> @@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>>           memmove.
>>>>>>>         - Tagged as `deliberate` for ECLAIR.
>>>>>>>
>>>>>>> +   * - R5.5
>>>>>>> +     - Clashes between bitops functions and macros names are
>>>>>>> deliberate and are
>>>>>>> +       needed for input validation and error handling, ensures that
>>>>>>> the size of
>>>>>>> +       the object being pointed to by 'addr' meets the minimum
>>>>>>> requirements for
>>>>>>> +       the bit operation, preventing unsafe operations on
>>>>>>> improperly sized data
>>>>>>> +       types that could lead to undefined behavior or memory
>>>>>>> corruption.
>>>>>>> +       The macros encapsulate this conditional logic into a single,
>>>>>>> reusable form;
>>>>>>> +       which simplifies the code, avoids redundant function call.
>>>>>>> +     - Specified macros should be ignored.
>>>>>>
>>>>>> At the risk of going too far with nitpicking: Who are "specified
>>>>>> macros" here? The
>>>>>> text doesn't mention any names. In fact, the way it's written it
>>>>>> could be taken to
>>>>>> mean all macros there, including any that are yet to be added. I
>>>>>> don't think such
>>>>>> is appropriate for a deviation.
>>>>>>
>>>>>
>>>>> I agree with Jan here. Either you make a single deviation record
>>>>> encompassing all deviated macros or you have one per deviation (e.g.,
>>>>> one for irq.h, one for grant_table.h and one for bitops.h) listing the
>>>>> macros that are considered. For bitops it might be a concern the
>>>>> actual functions going out of sync, but in that case you could just
>>>>> spell out the deviation and say "all pairs functions/macros in file
>>>>> <file> that are defined using the same identifier" or something similar.
>>>>
>>>> Honestly, while these examples might be deliberate, they're also bad code.
>>>>
>>>> I do not intent to let the bitops aliases survive the cleanup/fixes I
>>>> have planned, but I also don't have any idea when I'll get to that work.
>>>>
>>>> What we really want to express is "these are begrudgingly accepted in
>>>> the short term.  don't copy this pattern, and if you can fix it, please do".
>>>>
>>>> ~Andrew
>>>
>>> Hi Andrew!
>>>
>>> Perhaps I can try to fix these names clashes.
>>>
>>> For clarity.
>>> I would like to rename macros names with capital letters.
>>> Like this:
>>> -#define __test_and_change_bit(nr, addr) ({              \
>>> +#define TEST_AND_CHANGE_BIT(nr, addr) ({              \
>>>        if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>>        __test_and_change_bit(nr, addr);                    \
>>>    })
>>>
>>> Are you OK with such approach?
>>
>> And then change all use sites of the macro to those upper-case forms?
> Yes.
>> When everyone's used to using the lower-case ones?
> Well, user habits vs. Misra compliance, clear code.
> I like second one.
> Let me repeat.
> I can prepare patch (it will touch many places in code base), and let 
> maintainers decide what to do with it.
> 
> While patch with deviations will be like spare plan.
> 
> Jan, Andrew,
> are you agree with this?

No, I object to the renaming you intend to do. I don't think it is a useful
use of anyone's time to make or review such a change.

Jan

