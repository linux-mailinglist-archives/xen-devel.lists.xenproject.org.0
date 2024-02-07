Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22984CDF1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677768.1054596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjnH-0000un-JN; Wed, 07 Feb 2024 15:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677768.1054596; Wed, 07 Feb 2024 15:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjnH-0000rw-Fq; Wed, 07 Feb 2024 15:24:59 +0000
Received: by outflank-mailman (input) for mailman id 677768;
 Wed, 07 Feb 2024 15:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXjnF-0000rq-9x
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:24:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c402d19-c5cd-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 16:24:56 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea86so491883f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:24:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 9-20020a05600c234900b0040fccf7e8easm5479789wmq.36.2024.02.07.07.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 07:24:55 -0800 (PST)
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
X-Inumbo-ID: 0c402d19-c5cd-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707319495; x=1707924295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdHBKMdgeAhwXxCrB96lMAYx4N2sOhdnLI6MGOgTijk=;
        b=ABcrKEfiHVditMCpoBP5vBRmjqIuY8+Dp+ketAm7qCZuKltIsJFNeWtIoRwFgEJ62o
         WonIT2cTxzPOc38IAAl3E2eEgBGNrP6NoiLsYO8g4B7w4Y3U/TMeJeJxF43Rq/+SiRVV
         h54gDV23CmneJaLBDD3mvEWjmQ5WM8cULZm7QULce6wppil/ilq8yKA/2aDmE/XBujNi
         DrWXYVj9tnS+T7uU9qyCzc61DbWNJmdmdoybcSkYab6zK6+gGV29rlPR3SmzxqqY6rc3
         +0Ttg13W6HT8XTzoh76eYG5QuTdcnUhmiyWUhSzU6WXlM/KKSPkwGw/jpUrSHN7asneR
         TbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707319495; x=1707924295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdHBKMdgeAhwXxCrB96lMAYx4N2sOhdnLI6MGOgTijk=;
        b=WerfaO2Hh5wKURjosAe084lwiYofj9Co2xGoAnGfwq6+4fhEOWeMTzTlf7/rJsswmC
         yN6gvE5AXC4tJy75KQuH/NALNr48LpDIRtX/FZNiCtZ0Z7XvV++NoU91LQcRzC/51lEH
         /IN7k6TmDeQ8kbZy3oPx9qpAOSRn6Nq9GG8EnqbkKiXEUtBp3SrGEWYZFSviTBevSW7U
         5Cxx068aYfvvWhRkZrQXxqK4GyzI8I6+b5qVHXO9sprosmK9oqjVoWFMFK+LQUpCVBPz
         FG55lPcp4HE1IaWb9wVfFhhV43vOQGJ6FNK6CV4M3NkYiF5QmrXrTEKnWguN/KE7KldW
         Bueg==
X-Forwarded-Encrypted: i=1; AJvYcCVqQ5Rv+P9Q0DvaVS8yivStzKwxYkeVaR5N+QfMOE5XGAqSnf40/8IWeX8AtBvOUbBrWAAWkqJs33aDs3UofjoGscUdx5YbzDRWXDzwv8w=
X-Gm-Message-State: AOJu0YyZGN0+C7wFEJP6eLFC9q+CrpTtp5KPg3LEVaENZa7W8F3uxPlK
	7bgpEkXJMpIsp1mDstl16aohrl7ScCA3TDgZdH1Vo0Iqd18g++R6PvtA+yFihQ==
X-Google-Smtp-Source: AGHT+IH3QFYSNj8AXL/icdI5j0lqVAZqHW19RzZ5QoYqXcaaamLbaL639Ac1QZhDOx4Z73cHM++YIw==
X-Received: by 2002:adf:f450:0:b0:33b:4d27:6303 with SMTP id f16-20020adff450000000b0033b4d276303mr2037353wrp.12.1707319495485;
        Wed, 07 Feb 2024 07:24:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuSbTDSsh1iuvlS01Vj3cu3TGi9aYr6QPGWkG+wisW6iTTVg8jRMJrHlF5GcbzCJ0HM2lDZ14BHkxBcggyDeOVnFB4/cPca1OuV2wOg5yqQlsl1BHCxbzDYkrpbo/87nmA3B12VLIUF9VIdkxZiBQVkDl31E8xkXc3FupBQ3L7CXmMBtGV+yptHOLmp71yI/PP+/2IkVITFOYF5nCI0p5Xfdl4
Message-ID: <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
Date: Wed, 7 Feb 2024 16:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] x86/uaccess: replace __{get,put}_user_bad()
 with STATIC_ASSERT_UNREACHABLE()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
 <e28bb23a12fae3c8630f943b469137d367f20022.1706259490.git.federico.serafini@bugseng.com>
 <ec849d3a-4f6a-4afd-a7c4-418906eb909a@suse.com>
 <alpine.DEB.2.22.394.2402061707520.1925432@ubuntu-linux-20-04-desktop>
 <22ee2311-1e6b-4f2e-86e4-12d20b5ba4a2@suse.com>
 <6451696b-0366-4069-b82b-094e63eced8d@bugseng.com>
 <0b0b5a50-7692-4500-baa4-68df8f1c5d7a@suse.com>
 <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
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
In-Reply-To: <d7812cd9-7d06-493b-b8a8-d2353f148e8b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 16:08, Federico Serafini wrote:
> On 07/02/24 15:16, Jan Beulich wrote:
>> On 07.02.2024 14:51, Federico Serafini wrote:
>>> On 07/02/24 08:38, Jan Beulich wrote:
>>>> On 07.02.2024 02:08, Stefano Stabellini wrote:
>>>>> On Tue, 6 Feb 2024, Jan Beulich wrote:
>>>>>> On 26.01.2024 11:05, Federico Serafini wrote:
>>>>>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>>>>>        case 8:                                                                \
>>>>>>>            put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>>>>>            break;                                                             \
>>>>>>> -    default: __put_user_bad();                                             \
>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>        }                                                                      \
>>>>>>>        clac();                                                                \
>>>>>>>    } while ( false )
>>>>>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>>>>>        case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>>>>>        case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>>>>>        case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>>>>>> -    default: __get_user_bad();                                             \
>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>        }                                                                      \
>>>>>>>        clac();                                                                \
>>>>>>>    } while ( false )
>>>>>>
>>>>>> Related to my remark on patch 1 - how is one to know the macro this was
>>>>>> invoked from, when seeing the resulting diagnostic?
>>>>>
>>>>> I am not sure what do you mean here... we do get an error like the
>>>>> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
>>>>>
>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>
>>>> Right - and how do I know what _user_ of the macro actually triggered
>>>> it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
>>>> __FUNCTION__ here, for that specific purpose ...
>>>
>>> To test the macro and its diagnostics,
>>> I modified the first "git grep" occurrence of ASSERT_UNREACHABLE()
>>> on the x86 code with STATIC_ASSERT_UNREACHABLE(),
>>> that is in file arch/x86/alternative.c, line 312,
>>> function _apply_alternatives().
>>>
>>> What I got is the following build error:
>>>
>>> ...
>>> arch/x86/alternative.c: Assembler messages:
>>> arch/x86/alternative.c:312: Error: static assertion failed: unreachable
>>>     CC      arch/x86/copy_page.o
>>> make[2]: *** [Rules.mk:247: arch/x86/alternative.o] Error 1
>>
>> But that's not what my request was about. Here sufficient context is
>> given, even if it would be nice if the function was also visible right
>> away. But that's not the same as the case above, where the new macro
>> is used inside another macro.
> 
> An example of that is the get_unsafe_size() macro,
> whose body uses STATIC_ASSERT_UNREACHABLE().
> A wrong use of get_unsafe_size() at line n
> leads to a build error pointing to the line n,
> isn't this the desired behavior?

Aiui this would point to the line in the header file, when what you need
to spot the bad use of the macro is the line in the source file actually
using the macro. Quoting from an earlier mail of yours:

./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable

Compare this with what we have today, where the linker will point out
the function it found the bad use in. Of course this could also be
solved by better assembler diagnostics, but I'm not sure compiler output
would actually lend itself to that. Specifically we'd then rely on the
.type directive always preceding the actual function. Plus while it may
be reasonably possible to change gas, I'm not as sure about Clang's
integrated assembler. Plus changing gas and then getting it into use by
people will take quite a bit of time.

Jan

