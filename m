Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD0899781
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 10:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701150.1095323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rseZS-0004de-K3; Fri, 05 Apr 2024 08:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701150.1095323; Fri, 05 Apr 2024 08:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rseZS-0004bA-HU; Fri, 05 Apr 2024 08:05:10 +0000
Received: by outflank-mailman (input) for mailman id 701150;
 Fri, 05 Apr 2024 08:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rseZR-0004b4-CF
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 08:05:09 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3748f5fe-f323-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 10:05:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso1335703f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 01:05:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d64cd000000b00343e97150d6sm816967wri.32.2024.04.05.01.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 01:05:06 -0700 (PDT)
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
X-Inumbo-ID: 3748f5fe-f323-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712304307; x=1712909107; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUyuYo8eq7lShdMd3gEN5JzIisDgK/cz/+s2NudCoeM=;
        b=GQvn/9H8mL9c9FucZ7MpWH2X/Yo9ZlHqhqR1NLOhE41OtJu0F+Z2dAl/Mvles0FfaU
         UnCPfJZ3bQ+BTl0LNDmp3J2+pFUO98fbmMXfv7ASCki5YPEhkuYBYNWBm5JdnR6WT7Qg
         WZRawmfmpNJc6Sa6/VELihpA2XApm3a0NVw458z+aa3QJOQUNGtBoSgXYVc61/gvVq/+
         fbf1ILGwMyH3QlXnC2zt8EJlesRmL6Ft7+Onl+4YTCAqultxabQ0mLLnqx92+dbcZi7s
         qW3tyX2tNXLcNOlWC600ApOaotI/ClYKE9t1DIWwkMtNokq0V8V70pvnso7Zh1Ya2Ruw
         HF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712304307; x=1712909107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUyuYo8eq7lShdMd3gEN5JzIisDgK/cz/+s2NudCoeM=;
        b=QEoTXWGTptuKEYV/TUHJs3GAWq+na79ABNU6X/H0ez+/WVOOLVjC2HM2mLaVXFMrOF
         Ye70Zs9Y2SH/hNU2rnH0nbEssBsYYJIOu2jQ5ekuTC6POhu/Z/a714IiaiK63orTKsRv
         yA9hjysctMsWsRbaSUpN7LgVUqWoBk/xY6O34OvDbiPP6z+BYf6hDBNUdVDlCdj9xd1R
         G9kHlJPDbH74Wr7abs4GNZ9pVfM+5Z5lE7z7Vg6Ma2nL7ukue+itIiSQ2+w85M4Noish
         46p4KjWpTCH1J4N3GZKeVf2ekPWcRy3UewK0PTEseIZYIpo83Ynb6OmLpWvJDyy+bDAd
         OMOg==
X-Forwarded-Encrypted: i=1; AJvYcCVjLC+p2yOp9wxihRoXhSTV+QNkkEcinf5xgQ6Ja2DVp++qVAg3gIf5w/8NJQqDJGNMnrnlw+XCAfyNOeVyWbfrGP/h6EYgMJa2M9rFZqg=
X-Gm-Message-State: AOJu0YzAyJyyLL247fgiNezFY/rvjYYPRvkGjpT7HH4QAuOUC5f7D2Ef
	lHOFpSERVD9b5NlBXWT+fLi2/8UFWJguOfbC/1cQV/ht1GVSXCYuCjHCZEm3hg==
X-Google-Smtp-Source: AGHT+IFkupX+i/lefvoXqoixKnkLARUzB4CBc/uB3G5NtpnfuSVE/oHW7kWEI5toGBMjVDY3BKUaWA==
X-Received: by 2002:a5d:4bc5:0:b0:33e:737f:9363 with SMTP id l5-20020a5d4bc5000000b0033e737f9363mr522525wrt.70.1712304306677;
        Fri, 05 Apr 2024 01:05:06 -0700 (PDT)
Message-ID: <fda609e5-3ceb-432c-aaae-80b712013a6c@suse.com>
Date: Fri, 5 Apr 2024 10:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
 <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
 <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
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
In-Reply-To: <024957c9a5347b38639aa859d316dce7492f1eef.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.04.2024 09:56, Oleksii wrote:
> On Fri, 2024-04-05 at 08:11 +0200, Jan Beulich wrote:
>> On 04.04.2024 18:24, Oleksii wrote:
>>> On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
>>>> On 04.04.2024 17:45, Oleksii wrote:
>>>>> On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
>>>>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/include/xen/bitops.h
>>>>>>> +++ b/xen/include/xen/bitops.h
>>>>>>> @@ -65,10 +65,164 @@ static inline int
>>>>>>> generic_flsl(unsigned
>>>>>>> long
>>>>>>> x)
>>>>>>>   * scope
>>>>>>>   */
>>>>>>>  
>>>>>>> +#define BITOP_BITS_PER_WORD 32
>>>>>>> +/* typedef uint32_t bitop_uint_t; */
>>>>>>> +#define bitop_uint_t uint32_t
>>>>>>
>>>>>> So no arch overrides permitted anymore at all?
>>>>> Not really, I agree that it is ugly, but I expected that arch
>>>>> will
>>>>> use
>>>>> undef to override.
>>>>
>>>> Which would be fine in principle, just that Misra wants us to
>>>> avoid
>>>> #undef-s
>>>> (iirc).
>>> Could you please give me a recommendation how to do that better?
>>>
>>> The reason why I put this defintions before inclusion of
>>> asm/bitops.h
>>> as RISC-V specific code uses these definitions inside it, so they
>>> should be defined before asm/bitops.h; other option is to define
>>> these
>>> definitions inside asm/bitops.h for each architecture.
>>
>> Earlier on you had it that other way already (in a different header,
>> but the principle is the same): Move the generic definitions
>> immediately
>> past inclusion of asm/bitops.h and frame them with #ifndef.
> It can be done in this way:
> xen/bitops.h:
>    ...
>    #include <asm/bitops.h>
>    
>    #ifndef BITOP_TYPE
>    #define BITOP_BITS_PER_WORD 32
>    /* typedef uint32_t bitop_uint_t; */
>    #define bitop_uint_t uint32_t
>    #endif
>    ...
>    
> But then RISC-V will fail as it is using bitop_uint_t inside
> asm/bitops.h.
> So, at least, for RISC-V it will be needed to add asm/bitops.h:
>    #define BITOP_BITS_PER_WORD 32
>    /* typedef uint32_t bitop_uint_t; */
>    #define bitop_uint_t uint32_t
>    
> 
> It seems to me that this breaks the idea of having these macro
> definitions generic, as RISC-V will redefine BITOP_BITS_PER_WORD and
> bitop_uint_t with the same values as the generic ones.

I don't follow. Right now patch 7 has

#undef BITOP_BITS_PER_WORD
#undef bitop_uint_t

#define BITOP_BITS_PER_WORD BITS_PER_LONG
#define bitop_uint_t unsigned long

You'd drop the #undef-s and keep the #define-s. You want to override them
both, after all.

A problem would arise for _another_ arch wanting to use these (default)
types in its asm/bitops.h. Which then could still be solved by having a
types-only header. Recall the discussion on the last summit of us meaning
to switch to such a model anyway (perhaps it being xen/types/bitops.h and
asm/types/bitops.h then), in a broader fashion? IOW for now you could use
the simple approach as long as no other arch needs the types in its
asm/bitops.h. Later we would introduce the types-only headers, thus
catering for possible future uses.

Jan

