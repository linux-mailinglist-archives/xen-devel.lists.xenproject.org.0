Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA0875F5C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690143.1075898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVV3-0003ru-NO; Fri, 08 Mar 2024 08:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690143.1075898; Fri, 08 Mar 2024 08:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVV3-0003pO-Jh; Fri, 08 Mar 2024 08:22:41 +0000
Received: by outflank-mailman (input) for mailman id 690143;
 Fri, 08 Mar 2024 08:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riVV2-0003pI-En
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:22:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0638e288-dd25-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 09:22:38 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a36126ee41eso252072566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 00:22:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wr8-20020a170907700800b00a4553c6d52csm5201299ejb.35.2024.03.08.00.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 00:22:37 -0800 (PST)
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
X-Inumbo-ID: 0638e288-dd25-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709886158; x=1710490958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IpdHhhuLFHbI0ErOEGqPbgvR+15c+WF3hb1fCx+t+c=;
        b=f32KlLiRN09wyBmXdySWCtlWYruc9TZxwkH09tIBMBnxJp4WoLTZLwKktqC+Q/+sdI
         Suu6KkvMXWDY539Qf+1lKdTrVTOSztzSwK6b2QFXJFvbHsLpI8Yc65JKU+yt3oG9TRvU
         FwUIrBTw0KTcRhEFUnvHMNV4gGuiG1PAXRIjrV9TC1Qm/Z+XRqIvNwYjnxZY97+cvpeR
         Xz1TRRFzSGZdERVdV5rUKJDHXCWPPwD+XRM2SafS4O6hv1DxS7Z1UP79xn724MHyHRre
         sEcVDm7CyO8WgWnDb1SR9fIlgPrfvnjEb4KhnwPzyPAXnapWbvP/rk3O8dQoXxTxOW5b
         42qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709886158; x=1710490958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IpdHhhuLFHbI0ErOEGqPbgvR+15c+WF3hb1fCx+t+c=;
        b=qZmWfvOypAeFQEevbHbQmIwxKsyOLRvZRDT/qWanGftnRPT6VXpaqufzd1TZwJWegU
         N5/S3Wkb8Ddc6uq+/gvQnKEvVHj+qkLjxNR/sfcEFXxKThs8/m+Ww9ZYPsCgTK6eJSt6
         Gw34pbDZ1IoWg7bSWCRiGJbsszXE103TxWjcIqGUYu3LYI9xqdp2zxemJvDIBV1l7hGL
         9seCCc+aIEd3JbfnvnEIvqoCs1kjaenuH/ngW/fV3C+QNEgHUMnBEu6LyUY6Z3qFEkEd
         5spOXxjNK0GUl7nwxFqP3zAlENwuobPkn6LxGb9p6T9zx5i9cUI2ptPfo2l6qLdsKYdR
         B8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVAmhunakTsiAl3SipAcC1M2b/2/dWym3oYOaxIevOp9py7A0WwtHHT8wo2r9RNZhTs4TjzuZIziR/nCQQ0pfndaK+Lj4D0eyWSYz9X2VE=
X-Gm-Message-State: AOJu0YxV6CDDZ35y5emuEeTI8etHLzLNIuRqcivjPavDcqqMYL6YE8bB
	FgXSYN2T7f8aw5aGxPh1Jn9dFTBcZXxoBvQL/L+ln/Ilz3IL0o0J0x/BkYkUdA==
X-Google-Smtp-Source: AGHT+IFA5QHAvAdYpC+IX2uv6ux1It03Owp9CCqvEm3JoaHolfElRBGR4N8AqrXbv5UatLBfU6NKUA==
X-Received: by 2002:a17:906:99d2:b0:a45:f352:73b0 with SMTP id s18-20020a17090699d200b00a45f35273b0mr398165ejn.65.1709886157920;
        Fri, 08 Mar 2024 00:22:37 -0800 (PST)
Message-ID: <b8822a77-57e6-4f72-bace-c23045fcb377@suse.com>
Date: Fri, 8 Mar 2024 09:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] move __read_mostly to xen/cache.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com>
 <b49777c7-c677-826f-01da-c6b5b67f5b85@citrix.com>
 <893a5ebf-54e2-f2b2-1365-2a6d36ed3a39@suse.com>
 <fb627eae0deb85569d3c3044154f1588e9202ec9.camel@gmail.com>
 <64466285-35b8-497c-a12b-60fe0c998ba6@suse.com>
 <a64b84d6759cb7daa48af5c6680e0011ed6bb113.camel@gmail.com>
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
In-Reply-To: <a64b84d6759cb7daa48af5c6680e0011ed6bb113.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 18:08, Oleksii wrote:
> On Fri, 2023-12-22 at 12:09 +0100, Jan Beulich wrote:
>> On 22.12.2023 10:39, Oleksii wrote:
>>> On Tue, 2023-08-08 at 12:32 +0200, Jan Beulich wrote:
>>>> On 08.08.2023 12:18, Andrew Cooper wrote:
>>>>> On 08/08/2023 10:46 am, Jan Beulich wrote:
>>>>>> There's no need for every arch to define its own identical
>>>>>> copy.
>>>>>> If down
>>>>>> the road an arch needs to customize it, we can add #ifndef
>>>>>> around
>>>>>> the
>>>>>> common #define.
>>>>>>
>>>>>> To be on the safe side build-breakage-wise, change a couple
>>>>>> of
>>>>>> #include
>>>>>> <asm/cache.h> to the xen/ equivalent.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Could we find a better place to put this?
>>>>>
>>>>> __read_mostly is just a section.  It's relationship to the
>>>>> cache is
>>>>> only
>>>>> microarchitectural, and is not the same kind of information as
>>>>> the
>>>>> rest
>>>>> of cache.h
>>>>>
>>>>> __ro_after_init is only here because __read_mostly is here, but
>>>>> has
>>>>> absolutely nothing to do with caches whatsoever.
>>>>>
>>>>> If we're cleaning them up, they ought to live elsewhere.
>>>>
>>>> I would be considering init.h (for having most other __section()
>>>> uses,
>>>> and for also needing __read_mostly), but that's not a great place
>>>> to
>>>> put these either. In fact I see less connection there than for
>>>> cache.h.
>>>> So the primary need is a good suggestion (I'm hesitant to suggest
>>>> to
>>>> introduce section.h just for this).
>>> Andrew sent some suggestions here:
>>> https://lore.kernel.org/xen-devel/3df1dad8-3476-458f-9022-160e0af57d39@citrix.com/
>>>
>>> Will that work for you?
>>
>> I still need to properly look at the suggested options.
> Have you had a chance to review the suggested options?

I'm sure you've seen

https://lists.xen.org/archives/html/xen-devel/2024-01/msg00145.html

To add to that - xen/linkage.h is for assembly code only right now. While
I'd be happy to add C stuff there, there's an (imo) obvious issue with
code churn then: All C files using __read_mostly would then need to be
changed to include xen/linkage.h. And no, I don't view including the file
once in a "central" other header file as a viable solution: That's where
some of our really bad header dependency issues come from. Plus a goal
ought to be (imo) that touching a header like this one would better not
result in a full re-build of everything, when doing incremental builds.

Same obviously goes for the case of introducing xen/sections.h, i.e. the
other proposed alternative.

Bottom line: Given the state of our tree, I still view my proposed
placement as the least bad one for the time being. To change my view,
I'd still expect a _viable_ alternative proposal to be made.

Jan

