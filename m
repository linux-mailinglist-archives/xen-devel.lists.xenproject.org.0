Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F81B22467
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078571.1439602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulm5C-0002ka-SL; Tue, 12 Aug 2025 10:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078571.1439602; Tue, 12 Aug 2025 10:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulm5C-0002i7-Pi; Tue, 12 Aug 2025 10:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1078571;
 Tue, 12 Aug 2025 10:18:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulm5B-0002i1-M8
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:18:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d8206b-7765-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 12:18:15 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6157b5d0cc2so7593069a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 03:18:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e820asm2171596266b.90.2025.08.12.03.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 03:18:14 -0700 (PDT)
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
X-Inumbo-ID: a8d8206b-7765-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754993895; x=1755598695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0kFcV+NcazyEifvDfRHHFQbJFULeJ1PAGtn767ZVWxE=;
        b=Q3eNgTT7NyHU+0sdZgmbfxEWwJmj06QY2N+WibSTvrTgXLSo2Lh8iu7gor/4v1e7pw
         gowlXeSPP3vtCfkJ/Tplqw7MFTyjO9y/52bjYbA538V5QHIEUUhHJ72OBH2AfHElPJB3
         jZpS7FoPfdypYDazmcatDWWje0WjnAiag8XUxDDwq+LjC/teawyq4HZmdC6/N+ws/I/N
         7HDQce632+UHgTD80bJb6hRxqzQgG5HyFlMoicyTWPoGmDBJAFIrH7iUEYkFcirMA7pS
         RYSq3rZFW2bsHhPGpqXy0HnMPCUwZJ/y50lEq/9EDY08juaduFxXs2jcvJp9POVQ6AS3
         Y+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993895; x=1755598695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kFcV+NcazyEifvDfRHHFQbJFULeJ1PAGtn767ZVWxE=;
        b=vQJyPGXNTjAvaZ8rVXBMJttdCZg8zX75dpV4e7ZlOBM3jFSRYBDMpWcA3EdT//W/+i
         2hgo2uu4GtrasZZZ4XHmD96tDCjNdohLQ3RLRTVppH2kCakVYoQ6AmUQYAK0RH23UYql
         RbeZFtBCk1vnA1LP9kB7wgxcFkE4bxStH0Jg5LLMfLd0k1mBBmVAI7telCacoYd0kJV0
         gTqp4kc84BRg80VDbg9lMfHmW7YZ6IFxlAQe5Zyi+HiiK/R3oBte8OH/NjScIVrMAkah
         hFPTJLwXdwgV4a0b5i5y07SjHRsTuF4am0zhBT3hIDa06Qv23VFD4/oUeNYLwaMYJ+78
         cd+g==
X-Gm-Message-State: AOJu0YwmZEhNpKSaTTvyn9nvQS10xoGoudHG8DusfivuYJJUY5kbEIuT
	QSayaSucOce4Jerr4gpKN95KNrnBP5/pHRMWc/BSse+34O3Yu1wKddku9KWujKLliA==
X-Gm-Gg: ASbGncvtCdMvbM5jP6v/iQlqf3UqDSZkZYNLZG8dGbSIrHzNU9b+M3cnOT2/iRY4oLS
	X2XLA1hlg57sQPE8ptBgV9tYPQXl0CpxPu18w+9vfU/lZsrkDD+KC2dXyAkLHXLNzGZwvT04kGa
	1U01nYCoezbQls3hH99FdyJ6U8mSdODyKDbJlPjRhdxtpLPCISjB1nAAMWF1pnItNRB1Py4h5y6
	YiZ+Te5wIhcnWD/j9uZ3S1t3o/cVNY027nyoQngzmFsl6EWPscFaNZhz9RFYzkiSyqktc0SfKGq
	/Cb/ZPvCtcQqmXCh+roxYQf5MikxE9ZxbJuB5JuSoJqFCkp9qQq9O7VuzSz2zLQtBd4s+ZOt6OP
	ebVR0/59CaqmyIWdGzts2RjsTiBfXJqjbTmeVE+NlZtUKHkRQtTtP8dHQdv5xikpLJNcLk3cz0t
	nSHASaAog=
X-Google-Smtp-Source: AGHT+IF0PLJ9+u/Xkl+Z1PWmMBEEXFOoav8kTziVFaVu2GO2Ac9IeePlC/qip3mXuXI7J+pxSK3GqQ==
X-Received: by 2002:a17:906:3ace:b0:af9:21cb:23d4 with SMTP id a640c23a62f3a-af9c64f456emr1232755666b.36.1754993895129;
        Tue, 12 Aug 2025 03:18:15 -0700 (PDT)
Message-ID: <17cfd168-e54f-4cba-b2c2-5118bfbb8ca9@suse.com>
Date: Tue, 12 Aug 2025 12:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add ASSERT_UNREACHABLE() in default clauses
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <7cd71ed21383c189fedb3250ddde54a593f7f98b.1754944131.git.dmytro_prokopchuk1@epam.com>
 <a318ef2d5cad37d2fda0bb4a52c90964@bugseng.com>
 <c7f118a9-aea8-4f3a-8072-1bfa128d56b8@suse.com>
 <8ce96224f88513e4041d33248456fab3@bugseng.com>
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
In-Reply-To: <8ce96224f88513e4041d33248456fab3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 11:55, Nicola Vetrini wrote:
> On 2025-08-12 09:25, Jan Beulich wrote:
>> On 11.08.2025 23:25, Nicola Vetrini wrote:
>>> On 2025-08-11 22:30, Dmytro Prokopchuk1 wrote:
>>>> --- a/xen/arch/arm/decode.c
>>>> +++ b/xen/arch/arm/decode.c
>>>> @@ -178,6 +178,9 @@ static int decode_thumb(register_t pc, struct
>>>> hsr_dabt *dabt)
>>>>          case 3: /* Signed byte */
>>>>              update_dabt(dabt, reg, 0, true);
>>>>              break;
>>>> +        default:
>>>> +            ASSERT_UNREACHABLE();
>>>> +            break;
>>>>          }
>>>>
>>>
>>> I think this is fine, and there should be no problems with the break
>>> being unreachable in some configs due to the call property for
>>> ASSERT_UNREACHABLE
>>>
>>> -doc_begin="Calls to function `__builtin_unreachable()' in the 
>>> expansion
>>> of macro
>>> `ASSERT_UNREACHABLE()' are not considered to have the `noreturn'
>>> property."
>>> -call_properties+={"name(__builtin_unreachable)&&stmt(begin(any_exp(macro(name(ASSERT_UNREACHABLE)))))",
>>> {"noreturn(false)"}}
>>> -doc_end
>>
>> Did you also see Julien's reply? Imo, to address a complaint from one
>> rule, another rule is then being violated: The "default" label itself
>> is unreachable here.
> 
> Unfortunately only after sending my reply, however the point here is 
> that ASSERT_UNREACHABLE() is now considered as if it was not actually a 
> source of unreachability for any statement below (which is the case only 
> in configurations where NDEBUG is undefined iirc). This was done mainly 
> to allow stubs for Rule 2.1 so that their return statement just after an 
> ASSERT_UNREACHABLE() is not seen as a problem, but given that the 
> configuration to obtain that is global it influences treatment for other 
> rules as well, and its addition is relatively recent compared to the 
> text written in rules.rst.

I understand the special treatment of ASSERT_UNREACHABLE(). Yet even if that
wasn't there, both the default: label and the break; statement would be
unreachable here.

Jan

