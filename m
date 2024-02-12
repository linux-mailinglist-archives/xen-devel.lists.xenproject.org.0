Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8010850F03
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 09:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679327.1056763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRuB-0001Gf-Ru; Mon, 12 Feb 2024 08:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679327.1056763; Mon, 12 Feb 2024 08:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRuB-0001ER-Ny; Mon, 12 Feb 2024 08:43:11 +0000
Received: by outflank-mailman (input) for mailman id 679327;
 Mon, 12 Feb 2024 08:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZRu9-0001EL-OX
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 08:43:09 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf1bdfc8-c982-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 09:43:08 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso1587073f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 00:43:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z7-20020adfe547000000b0033b55186901sm6119983wrm.94.2024.02.12.00.43.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 00:43:07 -0800 (PST)
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
X-Inumbo-ID: bf1bdfc8-c982-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707727388; x=1708332188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aP9fMsgUKGvnPVDMOXT2RWnzWCXiUjjPupGL0ruEJok=;
        b=OEs06w8696q6zbVnykyY6wUnOOmykvl6Q0RFA8Zv6AQscM+ehczVTJUBho4+acyE/M
         GZaXE11M+D7CCGXazwdFli2hQwZ1NK+899hRhrTmn4+yE4HyJzcaFtt9NvI5RCmWvy3X
         K2t1I8OKX5qikO6Sybo7htBv6Rt3gKP8g2GVJxDX/y1UDBZEAeZsmx0Ls5uT+Kp5d9ZQ
         S7rzx/d28RgFZU2J44DzZ5Y5vaCcOU0/wME0aW42yOtzxS5iI7nfOMBk/EZUhZynvyLH
         v+KuBQr1lDzZJ7uGEA1I7P+PrKW4D1Kcc3fssiCL7fJCD7RH357DdczeeK9StZh6xpQE
         hIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707727388; x=1708332188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP9fMsgUKGvnPVDMOXT2RWnzWCXiUjjPupGL0ruEJok=;
        b=JhmvKNI26wGIcAIuhgR1y57CaNGauLigz4pneBXQo7T/eQlI7VpM2CyWxpW3vSBDic
         xHbxT0m48lSr2qF5L1fOW93Mnr9xCSBX+fhwXulItyPLAIJIkW7RLxXR3J/mCsbwppWM
         MMtb2U+apHIbsGivUVtm9cKQ1dWeH7g1zLmU4QlUcnTHLGFMOQo3SNshENBhA3EjY+Y3
         w6qSgbewdbEGkpJzNVv988C0TDWAzYKzsRgn2PLU0AsECW6+CHxUHgfJsKD2N+KGrY3N
         k14K19GdFy/ApZSfzEO1dxwkIV0hBn4mewzbgOaHlOMHbXSWMvaXaIIuwToY+3RjUguM
         sYYw==
X-Forwarded-Encrypted: i=1; AJvYcCXBRiYO5LZmvM46TxaWf7RY8nS4Q8xrQbpqIPeTxEXCuwEB1wMjDJg/aGouJIaJPZYJX0CxlnJpKs34lTpV2pu2lJRL2kDsqtApc0qIAQw=
X-Gm-Message-State: AOJu0YwwaCKBDd2aN0DJMeeU8GBYX3mmrZ4jJ3Qb++8aAi962WUG71ZV
	hyzO6bx17J7bd83z/M1Xvt7QEHSNdmcopXhFZqNwUV0zHkztz/a7ez8eyyfxzw==
X-Google-Smtp-Source: AGHT+IHVEIk+VyenrCqwitaE1FENGrLleeO9PJxWGbYUNFeyNM9StYvxwHtzruCUzHMHVOcwUM1QWg==
X-Received: by 2002:a5d:43c6:0:b0:33b:4ac6:f73b with SMTP id v6-20020a5d43c6000000b0033b4ac6f73bmr3521268wrr.23.1707727387975;
        Mon, 12 Feb 2024 00:43:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBbEbAD4fECDi7VesOnTlg2bnYtcMwNvYr7gntLWaQa4l6RoUJ02tLg8vO8Saq+XSMGf2cNBOmvYYL/rREYlBYJl+S85wr/yw6AsQMp/y0XhK2BmFUS4K8G2Upvt5LHUykY3UZBvRHyTJsu7t/B1Vg+PjXFWo+ewGnZXI1OIRaYS67NGpZvk4GwXDIIxvSCPRBhwRaefUQlGnT/nXpqJiRSc/0
Message-ID: <3edafece-f15e-4a28-9f17-a4b08d3e0215@suse.com>
Date: Mon, 12 Feb 2024 09:43:08 +0100
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
 <a5d9b91d-4e56-4512-9b15-d6868a383923@suse.com>
 <04a2c7b2-07e5-46fd-835e-42b3c6307547@bugseng.com>
 <a4c2f7c0-66bc-436f-bc99-8f8ba4ec822e@suse.com>
 <fffaa145-16ff-4969-bf4c-cfe0be98b66a@bugseng.com>
 <2117bb4e-94a3-4990-945b-6fb141ae1e63@suse.com>
 <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
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
In-Reply-To: <3ed651c3-4ed3-4237-bf57-3a99a790df1a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 10:50, Federico Serafini wrote:
> On 08/02/24 12:14, Jan Beulich wrote:
>> On 08.02.2024 11:45, Federico Serafini wrote:
>>> On 07/02/24 17:19, Jan Beulich wrote:
>>>> On 07.02.2024 16:58, Federico Serafini wrote:
>>>>> On 07/02/24 16:24, Jan Beulich wrote:
>>>>>> On 07.02.2024 16:08, Federico Serafini wrote:
>>>>>>> On 07/02/24 15:16, Jan Beulich wrote:
>>>>>>>> On 07.02.2024 14:51, Federico Serafini wrote:
>>>>>>>>> On 07/02/24 08:38, Jan Beulich wrote:
>>>>>>>>>> On 07.02.2024 02:08, Stefano Stabellini wrote:
>>>>>>>>>>> On Tue, 6 Feb 2024, Jan Beulich wrote:
>>>>>>>>>>>> On 26.01.2024 11:05, Federico Serafini wrote:
>>>>>>>>>>>>> @@ -208,7 +205,7 @@ do {                                                                       \
>>>>>>>>>>>>>           case 8:                                                                \
>>>>>>>>>>>>>               put_unsafe_asm(x, ptr, grd, retval, "q",  "", "ir", errret);       \
>>>>>>>>>>>>>               break;                                                             \
>>>>>>>>>>>>> -    default: __put_user_bad();                                             \
>>>>>>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>>>>>>           }                                                                      \
>>>>>>>>>>>>>           clac();                                                                \
>>>>>>>>>>>>>       } while ( false )
>>>>>>>>>>>>> @@ -227,7 +224,7 @@ do {                                                                       \
>>>>>>>>>>>>>           case 2: get_unsafe_asm(x, ptr, grd, retval, "w", "=r", errret); break; \
>>>>>>>>>>>>>           case 4: get_unsafe_asm(x, ptr, grd, retval, "k", "=r", errret); break; \
>>>>>>>>>>>>>           case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
>>>>>>>>>>>>> -    default: __get_user_bad();                                             \
>>>>>>>>>>>>> +    default: STATIC_ASSERT_UNREACHABLE();                                  \
>>>>>>>>>>>>>           }                                                                      \
>>>>>>>>>>>>>           clac();                                                                \
>>>>>>>>>>>>>       } while ( false )
>>>>>>>>>>>>
>>>>>>>>>>>> Related to my remark on patch 1 - how is one to know the macro this was
>>>>>>>>>>>> invoked from, when seeing the resulting diagnostic?
>>>>>>>>>>>
>>>>>>>>>>> I am not sure what do you mean here... we do get an error like the
>>>>>>>>>>> following (I added a STATIC_ASSERT_UNREACHABLE for case 4):
>>>>>>>>>>>
>>>>>>>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>>>>>>>
>>>>>>>>>> Right - and how do I know what _user_ of the macro actually triggered
>>>>>>>>>> it? ISTR suggesting to use one or more of __FILE__ / __LINE__ /
>>>>>>>>>> __FUNCTION__ here, for that specific purpose ...
>>>>>>>>>
>>>>>>>>> To test the macro and its diagnostics,
>>>>>>>>> I modified the first "git grep" occurrence of ASSERT_UNREACHABLE()
>>>>>>>>> on the x86 code with STATIC_ASSERT_UNREACHABLE(),
>>>>>>>>> that is in file arch/x86/alternative.c, line 312,
>>>>>>>>> function _apply_alternatives().
>>>>>>>>>
>>>>>>>>> What I got is the following build error:
>>>>>>>>>
>>>>>>>>> ...
>>>>>>>>> arch/x86/alternative.c: Assembler messages:
>>>>>>>>> arch/x86/alternative.c:312: Error: static assertion failed: unreachable
>>>>>>>>>        CC      arch/x86/copy_page.o
>>>>>>>>> make[2]: *** [Rules.mk:247: arch/x86/alternative.o] Error 1
>>>>>>>>
>>>>>>>> But that's not what my request was about. Here sufficient context is
>>>>>>>> given, even if it would be nice if the function was also visible right
>>>>>>>> away. But that's not the same as the case above, where the new macro
>>>>>>>> is used inside another macro.
>>>>>>>
>>>>>>> An example of that is the get_unsafe_size() macro,
>>>>>>> whose body uses STATIC_ASSERT_UNREACHABLE().
>>>>>>> A wrong use of get_unsafe_size() at line n
>>>>>>> leads to a build error pointing to the line n,
>>>>>>> isn't this the desired behavior?
>>>>>>
>>>>>> Aiui this would point to the line in the header file, when what you need
>>>>>> to spot the bad use of the macro is the line in the source file actually
>>>>>> using the macro. Quoting from an earlier mail of yours:
>>>>>>
>>>>>> ./arch/x86/include/asm/uaccess.h:262: Error: static assertion failed: unreachable
>>>>>
>>>>> It points to the header file uaccess.h because at line 262 there is
>>>>> an intentional wrong use of put_guest_size(), within the body of
>>>>> __copy_to_guest_pv() function.
>>>>
>>>> Yet that's again only a helper function being inlined into the ultimate
>>>> caller. That ultimate caller is what wants identifying in the diag. Not
>>>> the least because of ...
>>>>
>>>>> This example can be misleading because {get,put}_unsafe_size() are
>>>>> defined in the same file but the diagnostics is doing the
>>>>> right thing.
>>>>
>>>> ... this. And really __copy_to_guest_pv() is the wrong place to put a
>>>> wrong put_guest_size() in, to try out how diagnostics would look like
>>>> in reality: That function falls back to copy_to_guest_ll() for all
>>>> cases it can't handle directly. You want to place a bogus put_guest()
>>>> somewhere in a .c file to see what results.
>>>
>>> I added a bogus call to put_guest() at line 387 of
>>> file xen/arch/x86/mm.c, inside function page_is_ram_type().
>>> Assuming I did not choose another wrong place,
>>> the diagnostic seems appropriate:
>>>
>>> arch/x86/mm.c: Assembler messages:
>>> arch/x86/mm.c:387: Error: static assertion failed: unreachable
>>
>> Oh, okay, this looks appropriate then as to identifying where the
>> source construct is. However, we then still don't know where the
>> assertion in question is (there could be multiple in what the
>> original construct expands to). So I'm still inclined to ask that
>> __FILE__ / __LINE__ and/or the name of the invoking construct
>> (macro or function) be made visible in the diagnostic.
> 
> Any use of __FILE__ and __LINE__ results in obtaining
> the same information already reported by the assembler error message.

Hmm, yes, since put_guest() is itself a macro.

> We could add an argument to the new macro to manually add some context
> at every use of the macro, but I think this would be annoying.

That's a last resort. An alternative would be to see about converting
from macros to inline functions, where this would make a difference
here.

Jan

