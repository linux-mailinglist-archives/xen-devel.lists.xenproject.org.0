Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC41876489
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 13:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690281.1076138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZgQ-0002EW-Vm; Fri, 08 Mar 2024 12:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690281.1076138; Fri, 08 Mar 2024 12:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riZgQ-0002Bh-Sg; Fri, 08 Mar 2024 12:50:42 +0000
Received: by outflank-mailman (input) for mailman id 690281;
 Fri, 08 Mar 2024 12:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riZgQ-0002Bb-7t
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 12:50:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7806bd19-dd4a-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 13:50:40 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-565b434f90aso2547308a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 04:50:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b20-20020a0564021f1400b00567fa27e75fsm2482656edb.32.2024.03.08.04.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 04:50:39 -0800 (PST)
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
X-Inumbo-ID: 7806bd19-dd4a-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709902240; x=1710507040; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duzkN5rCJViDoOmFyMREhl5qpHFckjUcy257VC1+gdc=;
        b=LpV9RuAYEnYAx5yzI5MUFTCRFN9b3p39hQjbWtEenWmSMlbdr1+2rgreawFQ0A3rw4
         CzAsVCd1+YAgdH/+k27QyHXZNgEsMWq9JRSli3VEmDnE+Fs7BdWV4x7VLIqrCoKJTsNP
         T2/0FDeathBVFmYq6Bv30IiGEJL5C27RFm4MIYQouY8bMRIOHjARgHoaZJq/MjbpgEMd
         4zG4eahpuh5OqJskNmENRlLk8T5hYzrorwgXRreWOj3Xd60sF0VIqrVFP5B/AE5mnkRk
         dReUhVRGwjUFoOIBLznd6Ev8ikfcUTECt6kPWq+SrrdupJKbxRCnwcOQoElNEVA4+Z07
         QEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709902240; x=1710507040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duzkN5rCJViDoOmFyMREhl5qpHFckjUcy257VC1+gdc=;
        b=LRSQ+SIuGI3qCv26tdE9M48YBYL8TCCsm7l6DmlgoTXExhvKS9dUMM6qzR4+L9KwsM
         7ZLt4tOcxMObs6LW3QPQCI/xIlrJQEJoRlxXCyminULgw8DAhxO1ak1LJzl90IVOHa9x
         gf/RYUVCcWgY1RzqXo78OEaYI7pQ5UycSfGYmFMYPHs7HEXJ43yyF+tciLev9g6WYzsc
         Axz09Z/qGRSEFCn6DLkNpar8qvmBWiRUWwjqiaRZ63KP1dgWoySx8esAs/uHW9dLF9Dx
         Bxb4/SeYXgDTh1NVzBpHZ4Yy3dSci4PJdLHNWj2unwFUFeYPANqkQXgVM10I/EjcoscN
         p8xg==
X-Forwarded-Encrypted: i=1; AJvYcCVKF/khoKRvUkT+r/RjHyH0JiiwlmdPaOHGgpg1mMPBXTekvb89a65sMTV2Y581tmeGJWqfVrcrRpzvDGWOBQwZTc0DB87nb41q16WUKRM=
X-Gm-Message-State: AOJu0Yxb+qi/RKlZs+xpnV6qalv+l755kkZDZIZrJFPsUre9F2iWrCst
	qLPWiqz1QdyKg+eIvJafxD/NZVDKlPbX0PAZWJV2/Q+04xtVgif7WnjtvkAN6w==
X-Google-Smtp-Source: AGHT+IE92XOU3yNL3vBUbUHGVVXTypYopKNsx/UVaHJT57kpGrMFzqZwYBIwQEvzz0nr4LscsiuXfA==
X-Received: by 2002:a50:8e1e:0:b0:566:9437:c89c with SMTP id 30-20020a508e1e000000b005669437c89cmr1937406edw.22.1709902240089;
        Fri, 08 Mar 2024 04:50:40 -0800 (PST)
Message-ID: <45f82faf-cd70-4da8-bcbf-cffde6ab9d93@suse.com>
Date: Fri, 8 Mar 2024 13:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
 <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
 <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
 <a64b84d6759cb7daa48af5c6680e0011ed6bb113.camel@gmail.com>
 <b8822a77-57e6-4f72-bace-c23045fcb377@suse.com>
 <4343336e663ec5de6c8f322485fb65032a7c0585.camel@gmail.com>
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
In-Reply-To: <4343336e663ec5de6c8f322485fb65032a7c0585.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.03.2024 13:01, Oleksii wrote:
> On Fri, 2024-03-08 at 09:22 +0100, Jan Beulich wrote:
>> On 07.03.2024 18:08, Oleksii wrote:
>>> On Fri, 2023-12-22 at 12:09 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 10:39, Oleksii wrote:
>>>>> On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
>>>>>> On 08.08.2023 12:18, Andrew Cooper wrote:
>>>>>>> On 08/08/2023 10:46 am, Jan Beulich wrote:
>>>>>>>> There's no need for every arch to define its own
>>>>>>>> identical
>>>>>>>> copy.
>>>>>>>> If down
>>>>>>>> the road an arch needs to customize it, we can add
>>>>>>>> #ifndef
>>>>>>>> around
>>>>>>>> the
>>>>>>>> common #define.
>>>>>>>>
>>>>>>>> To be on the safe side build-breakage-wise, change a
>>>>>>>> couple
>>>>>>>> of
>>>>>>>> #include
>>>>>>>> <asm/cache.h> to the xen/ equivalent.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> Could we find a better place to put this?
>>>>>>>
>>>>>>> __read_mostly is just a section.  It's relationship to the
>>>>>>> cache is
>>>>>>> only
>>>>>>> microarchitectural, and is not the same kind of information
>>>>>>> as
>>>>>>> the
>>>>>>> rest
>>>>>>> of cache.h
>>>>>>>
>>>>>>> __ro_after_init is only here because __read_mostly is here,
>>>>>>> but
>>>>>>> has
>>>>>>> absolutely nothing to do with caches whatsoever.
>>>>>>>
>>>>>>> If we're cleaning them up, they ought to live elsewhere.
>>>>>>
>>>>>> I would be considering init.h (for having most other
>>>>>> __section()
>>>>>> uses,
>>>>>> and for also needing __read_mostly), but that's not a great
>>>>>> place
>>>>>> to
>>>>>> put these either. In fact I see less connection there than
>>>>>> for
>>>>>> cache.h.
>>>>>> So the primary need is a good suggestion (I'm hesitant to
>>>>>> suggest
>>>>>> to
>>>>>> introduce section.h just for this).
>>>>> Andrew sent some suggestions here:
>>>>> https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57d39@citrix.com/
>>>>>
>>>>> Will that work for you?
>>>>
>>>> I still need to properly look at the suggested options.
>>> Have you had a chance to review the suggested options?
>>
>> I'm sure you've seen
>>
>> https://lists.xen.org/archives/html/xen-devel/2024-01/msg00145.html
>>
>> To add to that - xen/linkage.h is for assembly code only right now.
>> While
>> I'd be happy to add C stuff there, there's an (imo) obvious issue
>> with
>> code churn then: All C files using __read_mostly would then need to
>> be
>> changed to include xen/linkage.h. And no, I don't view including the
>> file
>> once in a "central" other header file as a viable solution: That's
>> where
>> some of our really bad header dependency issues come from. Plus a
>> goal
>> ought to be (imo) that touching a header like this one would better
>> not
>> result in a full re-build of everything, when doing incremental
>> builds.
>>
>> Same obviously goes for the case of introducing xen/sections.h, i.e.
>> the
>> other proposed alternative.
>>
>> Bottom line: Given the state of our tree, I still view my proposed
>> placement as the least bad one for the time being. To change my view,
>> I'd still expect a _viable_ alternative proposal to be made.
> Based on your replies, I can conclude that there is no good place for
> __read_mostly and __ro_after_init.

No, no, I'd be happy with xen/linkage.h, if there wasn't the need to
then add perhaps many dozens of #include-s throughout the tree.

> Not related to my words above, here is a little remark about the patch
> changes. Does it make sense to wrap the definition of __read_mostly()
> by "#ifndef __read_mostly" in case architecture decides to redefine it?

I'd say not ahead of there actually arising such a need.

Jan

