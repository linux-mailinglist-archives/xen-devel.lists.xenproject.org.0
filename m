Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E659E8B374E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712762.1113590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Kl1-00048i-Tt; Fri, 26 Apr 2024 12:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712762.1113590; Fri, 26 Apr 2024 12:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Kl1-00046A-Qm; Fri, 26 Apr 2024 12:32:51 +0000
Received: by outflank-mailman (input) for mailman id 712762;
 Fri, 26 Apr 2024 12:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0Kl0-00045u-06
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:32:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1767ca0b-03c9-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 14:32:48 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-572229f196bso2607108a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 05:32:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906319000b00a5544063372sm10574896ejy.162.2024.04.26.05.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 05:32:48 -0700 (PDT)
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
X-Inumbo-ID: 1767ca0b-03c9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714134768; x=1714739568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjfQilT6ESuU80FQRco/TRep7F2BwjAaQhB4SaPyup4=;
        b=I4ziyxvH0oOfqpoNDodLo+ci3MGrxVKN69rnGvxCWfEqvniGa8ZTdRi1y5D1Ie/a5G
         zxU4cdSTnM5JTsMMto1HBSpmAC4ymGqgxwOFFOfW/AOx6mOC4slyEGp2ID0ikhWpGOaU
         bt2X86S6GLZfqUGvOqLbWkGRfeRjd3EkbUAFhwg2sBSjJb5FbbsEW4aIhTPM30ASHthp
         stpPda1b6Mk0H6fhXFxgiMMGbLP26vkwalsy8YeWgaYMtmoEusFzkoJvARwS0UblffCS
         qGNadTW1EcK6c5UmMsbTzQAwZQISaqhxRUfHL36UMKLQOcfeDVwYH0ArgUhlwpfXSv3z
         2vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134768; x=1714739568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjfQilT6ESuU80FQRco/TRep7F2BwjAaQhB4SaPyup4=;
        b=T8OHFSG1tLKzBKAgLAR0vlFRY6At5E2NlxkZghwaPBIGc2RvcsU/BadQb/wooKQGwq
         NoeuNvtAogOIZeG7JNlTd7d4ZDYpc/CXcOKhbkRKJsvCv4LtZju3yC0ZtMm1WawY6Le7
         +Clu2Q/4ysQ/VCb3jFJs1/NTPJRn5rv7Vl82QBGr1n71N0DgAV/ZURyx2dnPtIEnforq
         NkIPOAbfLcH1FSaygsYlOfJnOox8NfkVaxEmShQEm8CpFLXiUPskg53oRdgFAy/9tIdj
         1MJYB3NIitCSPe/EtIX8nTZ/UtFM8WVsjXiV7p3XCnGkjsCNWwkkG88shO2CE65nNLsr
         Wjow==
X-Forwarded-Encrypted: i=1; AJvYcCVHKYsYRFF0zULzQlydEkHCzIhniQT/9Nt0kBrbfpxAg55ELP1f7Lg9zrj60NEx400y7s0B8YtkETLASJmq9nMhegeACso6SDoPysmYg+k=
X-Gm-Message-State: AOJu0Yw7pvrkgi9e31VzXxfKADyUSsWF5r3JRo6fZ6sNdTTPiEOZ9Q9l
	XAiMn0Y04ZXhoaAEeQ4R0neX5OZQKMaZ9twDxKtVsWp7cG0gvJSoWfsZIJDsgA==
X-Google-Smtp-Source: AGHT+IE8FVL0rn1RafIM0LgDvX9yHWanV17Nw3bHP+SSYhPEDslnCL+LYezHYU3a/G0PSOYmh0VLIA==
X-Received: by 2002:a17:906:3e0c:b0:a55:6407:c0c7 with SMTP id k12-20020a1709063e0c00b00a556407c0c7mr1583682eji.17.1714134768344;
        Fri, 26 Apr 2024 05:32:48 -0700 (PDT)
Message-ID: <045f4fa3-cd1b-441d-9246-0c1528679cac@suse.com>
Date: Fri, 26 Apr 2024 14:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
 <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
 <fb1a228b1bd58d17d7836c3413d3b0a8a9602978.camel@gmail.com>
 <d1f546dc-35bd-47f9-89be-582660d23ec1@suse.com>
 <17f0b05b2f2da1b13e8ca3ab4e20b210aa0f8480.camel@gmail.com>
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
In-Reply-To: <17f0b05b2f2da1b13e8ca3ab4e20b210aa0f8480.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2024 14:09, Oleksii wrote:
> On Fri, 2024-04-26 at 12:51 +0200, Jan Beulich wrote:
>> On 26.04.2024 10:21, Oleksii wrote:
>>> On Thu, 2024-04-25 at 17:44 +0200, Jan Beulich wrote:
>>>> On 17.04.2024 12:04, Oleksii Kurochko wrote:
>>>>> Return type was left 'int' because of the following compilation
>>>>> error:
>>>>>
>>>>> ./include/xen/kernel.h:18:21: error: comparison of distinct
>>>>> pointer
>>>>> types lacks a cast [-Werror]
>>>>>        18 |         (void) (&_x == &_y);            \
>>>>>           |                     ^~
>>>>>     common/page_alloc.c:1843:34: note: in expansion of macro
>>>>> 'min'
>>>>>      1843 |         unsigned int inc_order = min(MAX_ORDER,
>>>>> flsl(e
>>>>> - s) - 1);
>>>>
>>>> Apart from this I'm okay with this patch, assuming Andrew's won't
>>>> change in
>>>> any conflicting way. As to the above - no, I don't see us having
>>>> ffs() / ffsl()
>>>> returning unsigned int, fls() / flsl() returning plain int. Even
>>>> more
>>>> so that,
>>>> given the LHS variable's type, an unsigned quantity is really
>>>> meant
>>>> in the
>>>> quoted code.
>>> If I understand you correctly, it's acceptable for fls() / flsl()
>>> to
>>> return 'int'. Therefore, I can update the commit message by
>>> removing
>>> the part mentioning the compilation error, as it's expected for
>>> fls() /
>>> flsl() to return 'int'. Is my understanding correct?
>>
>> No. I firmly object to ffs() and fls() being different in their
>> return
>> types. I'm sorry, I realize now that my earlier wording was ambiguous
>> (at least missing "but" after the comma).
> Thanks for clarifying.
> 
> I can change return type of fls() / flsl() to 'unsingned int' to be the
> same as return type of ffs() / ffsl(), but then it will be needed to
> add a cast in two places:

Except that no, it doesn't really need casts there.

>    --- a/xen/common/page_alloc.c
>    +++ b/xen/common/page_alloc.c
>    @@ -1842,7 +1842,7 @@ static void _init_heap_pages(const struct
>    page_info *pg,
>              * Note that the value of ffsl() and flsl() starts from 1
>    so we need
>              * to decrement it by 1.
>              */
>    -        unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
>    +        unsigned int inc_order = min((unsigned int)MAX_ORDER,
>    flsl(e - s) - 1);

The preferred course of action would want to be to simply make MAX_ORDER
expand to an unsigned constant. Depending on the amount of fallout, an
alternative would be to use _AC(MAX_ORDER, U) here. Yet another
alternative would be to use MAX_ORDER + 0U here, as iirc we do in a few
other places, for similar purposes.

Avoiding a cast here is not only shorter, but - see statements elsewhere -
generally preferable.

Jan

