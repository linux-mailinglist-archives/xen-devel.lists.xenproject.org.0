Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CFB13B39
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061490.1427087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNhc-0003SA-A9; Mon, 28 Jul 2025 13:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061490.1427087; Mon, 28 Jul 2025 13:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNhc-0003QQ-6x; Mon, 28 Jul 2025 13:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1061490;
 Mon, 28 Jul 2025 13:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugNha-0003QI-H2
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:15:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ce0640-6bb4-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:15:36 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso47223605e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:15:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfbf7asm5579273b3a.75.2025.07.28.06.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:15:34 -0700 (PDT)
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
X-Inumbo-ID: f2ce0640-6bb4-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753708535; x=1754313335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r8DDnESho8M1ycUF/V8fmV4PwWoruHDJb20HDfgIAF8=;
        b=f5NCjh6hcg4zFOewxy5iFayKgflR2rhioDeTfVZA1UOZePK7pi+O49NGhXykVBfG2t
         ePgetyGUTsD7sn7ppGdVpLsHRjyI+DxDQxR6nnPEsLUeHY8DhAjEtHe4JM4EbSaraNuT
         p1tHkCKxzJ4lWEzSKxKff0Hue2oP8O+r5JXxtPwSCXKaMXamCMyznSWXUFKVI03xA/L+
         PqWpAl3Q/OB4X4wsmMy+N1S1COqNzzhbw/5tGBm75fg5H6/5Z0G3kLHnG4vMda185jZ1
         AZQierPnAd6uSCFzU6+1DSXxtgEn/nyAVJV2D5a93gqMxV3xsW1Ne8Y9R1Wr9zN7YCQA
         nPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708535; x=1754313335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8DDnESho8M1ycUF/V8fmV4PwWoruHDJb20HDfgIAF8=;
        b=qepDOs0DqkCd80zAgqpUeHe2lf4t5H+U+BzTuK8O1uC+lc8nMtfs/MUB7Q8OsKhg7V
         w310Qy5aeH92yQC8ZZKTbJr3zvqKtKPR7jOhAJ3ydk9wGEA7RGtTXT1FcL2GetLKGT2b
         RpAk0+gAVTrobwskjc7av4lq1ygft9VH8YSfjomq6vZ7NCYiOKya1VHE4q/IZZhE4PuO
         lm+iBVamTZkseghP2c9gQ3eS7jW00ph9XKNao7vB0Qgid43g5z8JCz9ZSoYLPtiLyuWW
         WjIPARiKp/5PCiAy0c+oz0BNIXxuadqwLFhcoVM5vLsF2iMT+56eUzY9YmrD19UPbpvo
         5f/g==
X-Forwarded-Encrypted: i=1; AJvYcCUQr2AmFdSgeAsbSkXU3JLkaU4wTJy2f2cGZMJpDdEIcui44OGGaHwAsFgRBkDsucMbc7hJUna0yM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkvlnoRoAHQolhLVyIEBf0Q9g106tSgpJuIiI3/gbsTdqlA+Wa
	NRcxhllkWL4EFkyGnOw1QM6WToSk0G/5nVf95/VK5tmTVrCpvRZ1f7ZJQbHQal2swQ==
X-Gm-Gg: ASbGncs9HAJgvsMHQtHmzs03/gSAyLtFmoZJO7uz5arYoSMV4jexPPnM8SVcuG7TWsY
	uUO2iUziAqxVCW6NYrXNnRI+pqjCC5dL7594uF8LQG3t/occkCCGk1b+ffQugUreeXr541Z/JRE
	1TwCndfNPr4mpESq4vLyoFXaNS7etZCxHB615kSdAIszEYGyMhWs62NTWUfpGkkejoWpVJbw0lM
	oeRrIGqMajNcDG3u7XEnrDLk4F0UxrWAYPXbh0ek0gfJBnSkySdKa6kq5M8AFH+zcePCUgYDD/x
	SrjtTeyswLY9vvOmVZ56cFrF3kXZ30cS55hyhrX6oxGH0ur8A+H7xErLOYmzf2b9yV5qgeNyrbn
	Pk4VLpXDW1um91LbqDdR6ca6lOT9KylAbon3LY4uWpzJ2EH93GlvyIjvf0lE8ptU9fktSvHRDCp
	g4SXulxZGkXk7qZ/uBAg==
X-Google-Smtp-Source: AGHT+IFMdoV5hov1I1PvPMbvhYKBY0+NBbOl1v3GZ0H9t0rilDVsajXxjxVm5sFCC1EEImwPixQFhA==
X-Received: by 2002:a05:6000:2dc4:b0:3b7:61e5:a8a5 with SMTP id ffacd0b85a97d-3b77667879amr8297278f8f.47.1753708535363;
        Mon, 28 Jul 2025 06:15:35 -0700 (PDT)
Message-ID: <091fc447-93cd-4f48-8f5f-e2b7996aa8bf@suse.com>
Date: Mon, 28 Jul 2025 15:15:25 +0200
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
In-Reply-To: <f9a7884b-d58e-4ae7-b5ca-ce751ca70245@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2025 14:28, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/28/25 13:59, Andrew Cooper wrote:
>> On 28/07/2025 11:38 am, Nicola Vetrini wrote:
>>> On 2025-07-28 11:36, Jan Beulich wrote:
>>>> On 25.07.2025 18:24, Dmytro Prokopchuk1 wrote:
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>          memmove.
>>>>>        - Tagged as `deliberate` for ECLAIR.
>>>>>
>>>>> +   * - R5.5
>>>>> +     - Clashes between bitops functions and macros names are
>>>>> deliberate and are
>>>>> +       needed for input validation and error handling, ensures that
>>>>> the size of
>>>>> +       the object being pointed to by 'addr' meets the minimum
>>>>> requirements for
>>>>> +       the bit operation, preventing unsafe operations on
>>>>> improperly sized data
>>>>> +       types that could lead to undefined behavior or memory
>>>>> corruption.
>>>>> +       The macros encapsulate this conditional logic into a single,
>>>>> reusable form;
>>>>> +       which simplifies the code, avoids redundant function call.
>>>>> +     - Specified macros should be ignored.
>>>>
>>>> At the risk of going too far with nitpicking: Who are "specified
>>>> macros" here? The
>>>> text doesn't mention any names. In fact, the way it's written it
>>>> could be taken to
>>>> mean all macros there, including any that are yet to be added. I
>>>> don't think such
>>>> is appropriate for a deviation.
>>>>
>>>
>>> I agree with Jan here. Either you make a single deviation record
>>> encompassing all deviated macros or you have one per deviation (e.g.,
>>> one for irq.h, one for grant_table.h and one for bitops.h) listing the
>>> macros that are considered. For bitops it might be a concern the
>>> actual functions going out of sync, but in that case you could just
>>> spell out the deviation and say "all pairs functions/macros in file
>>> <file> that are defined using the same identifier" or something similar.
>>
>> Honestly, while these examples might be deliberate, they're also bad code.
>>
>> I do not intent to let the bitops aliases survive the cleanup/fixes I
>> have planned, but I also don't have any idea when I'll get to that work.
>>
>> What we really want to express is "these are begrudgingly accepted in
>> the short term.  don't copy this pattern, and if you can fix it, please do".
>>
>> ~Andrew
> 
> Hi Andrew!
> 
> Perhaps I can try to fix these names clashes.
> 
> For clarity.
> I would like to rename macros names with capital letters.
> Like this:
> -#define __test_and_change_bit(nr, addr) ({              \
> +#define TEST_AND_CHANGE_BIT(nr, addr) ({              \
>       if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>       __test_and_change_bit(nr, addr);                    \
>   })
> 
> Are you OK with such approach?

And then change all use sites of the macro to those upper-case forms? When
everyone's used to using the lower-case ones?

Jan

