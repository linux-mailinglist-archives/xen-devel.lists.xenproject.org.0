Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35068B1D482
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 10:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072661.1435662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwRT-0003Dm-4P; Thu, 07 Aug 2025 08:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072661.1435662; Thu, 07 Aug 2025 08:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwRT-0003B8-1p; Thu, 07 Aug 2025 08:57:43 +0000
Received: by outflank-mailman (input) for mailman id 1072661;
 Thu, 07 Aug 2025 08:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujwRR-0003B2-Ph
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 08:57:41 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd51110-736c-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 10:57:28 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-604bff84741so1422335a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 01:57:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe79a0sm11479181a12.39.2025.08.07.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 01:57:27 -0700 (PDT)
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
X-Inumbo-ID: 8bd51110-736c-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754557048; x=1755161848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ryQl9WcoqwSsOiqVdb6BTb/4D5XKgurS1IVsplIN86w=;
        b=Vx24esgc9Yvmsy/fnxVN/ItcOpT4g6gvmYBnPbUtH8AO5DPblE14W0gFaXcPjv5upM
         87QR/jWU3GGyHZWN9epb4bOm8PjQnyO90T1ihSxInFBU16yIo/JghL8nJGrCGgS1NzfO
         kaQgtMoT9+uQQOILtajLfPf0+iuEUGon0kpZTSiUCABf2peexJ7A8wlqkCEqelKR8IMy
         gkEMXjzpvjSdPRyjPuzWg/gzPkR7+FV+3wd3aYKG7PHmZ1nCIE1R+nVA1sgysHRbrA+1
         xzqJ41THgrn2d/bsGUL3NDPG3c6lW4bCq1yvLswB5NvBLIDPs28n5BTOXtmW9p4Bomvp
         JmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754557048; x=1755161848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryQl9WcoqwSsOiqVdb6BTb/4D5XKgurS1IVsplIN86w=;
        b=sjT0nACnnRfkMDGIlFcw+FqoJ1SfmAvLgRUgS3ZWP9BNCj8ZIU8cSbiU8VsF+PTkgk
         B0v8iHbgBuzSifi8dcyb/aFNPUABLEX8DuZo5Yr/bZSgQuI2X2UUfXdXI9qSnHMT9BRZ
         K8dqm7PUfi9mbRXoK1XscJWdvmRB8hrZpPQMayRb9cJmfeNw2nTiE5xf42VbtijzbpZY
         WYxZJgaKbovSR9neR6YxhlQFL/V9tZXNmjhV1LcLhTfc9Peij4Uwtcamq0xECb+vvLI6
         UluQf4qWAH0tOnEQH4wCDz0kH8OVTDmLo72pG3UzsK7TAHmO9+i2txeINF7vKLMcM3+S
         1oMg==
X-Gm-Message-State: AOJu0Ywng/am0Pc7oRmpwPbwSXBLHvI6Co0ZKOgXPrY5LTFlB73WTnza
	DIaxbSRB/QgiDSEIeNKmSWy7lfmEft8F8cuzm/Ftl3/M36fghvtj7qdzjT8ETlHEaw==
X-Gm-Gg: ASbGncvqF6su9HXINBp7iscyOpGZoJFM6JoQ+Q/FycSF+50lCRYTHmF53jlT5JWjFqC
	GcHF4ghbwn4eR2WCkQDxLNhib0PULuhWRWU+I3psws1Lat3mtNLOV1IRBimdaY1gUv6qlCSYoij
	aThOlW1FTgrYhomOTgjSByPxuhNAGeKwYW63Z9VrGRbBHp0/p3yiGUIy9Y1qGUeMRAY4M9WKVqX
	8TCOZX4rBHso6iN7TTqYdRVt3aXC2FJAHixpP5vppAPhbHMIL1Ten4KS1E2+pvDVPWZKVb5kxyE
	XTkFaRPkdD0GvvQmy7gVbK19RcK3dCI0eKeD8UWBtALPMLJO3+kQlcukIcKyKL3baaq1r6eI9NG
	askyaLs31gQgtWMNRyzNR3IdvkBsjHVRMwuC2Zw7OkKjj/oMDDR3skWdFfyKPaV/6T+0KXy1WIX
	8jPbg+pBs=
X-Google-Smtp-Source: AGHT+IG5KnhJCVDpPBgRLioBUywQ9XXFIzULmJLIcsvYU033i85c91vnohpF2gi+08seAzOILxBRfA==
X-Received: by 2002:a05:6402:27d1:b0:615:aec5:b5bc with SMTP id 4fb4d7f45d1cf-61795fb9277mr4545017a12.0.1754557048084;
        Thu, 07 Aug 2025 01:57:28 -0700 (PDT)
Message-ID: <b948a9ab-e6b6-4096-954b-c364c16f198e@suse.com>
Date: Thu, 7 Aug 2025 10:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <afe942916b8a2408f575d2acda49699f74718161.1753991597.git.dmytro_prokopchuk1@epam.com>
 <a3ac54d4fa69bfde695a55791a89eab6@bugseng.com>
 <148c16be-03c0-43cd-a394-2b37088f4383@epam.com>
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
In-Reply-To: <148c16be-03c0-43cd-a394-2b37088f4383@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 18:56, Dmytro Prokopchuk1 wrote:
> On 8/1/25 01:32, Nicola Vetrini wrote:
>> On 2025-07-31 22:43, Dmytro Prokopchuk1 wrote:
>>> MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro 
>>> names".
>>>
>>> Update ECLAIR configuration to deviate clashes: specify the macros that
>>> should be ignored. Update deviations.rst and rules.rst accordingly.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # ECLAIR
>>
>>> ---
>>> Changes in v4:
>>> - fixed formatting (aligned length chars per line)
>>> - set 'ignored_macros' as a regex expression
>>> - set a deviation restriction on xen/common/grant_table.c
>>> - s/ensures/to ensure/
>>> - fixed grammar errors
>>>
>>> Link to v3:
>>> https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fpatchew.org%2FXen%2Fe681e0c083d945f48e6d0add1aee32af16be224e.1753911247.git.dmytro._5Fprokopchuk1%40epam.com%2F&data=05%7C02%7Cdmytro_prokopchuk1%40epam.com%7Ce9d60ddeef764dfa381208ddd0823178%7Cb41b72d04e9f4c268a69f949f367c91d%7C1%7C0%7C638895979778846477%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=n0QPvqr8O8gos%2BYMpZ%2BMOG0spC46A7T56Vpz44wutlw%3D&reserved=0
>>>
>>> Test CI pipeline:
>>> https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fgitlab.com%2Fxen- 
>>> project%2Fpeople%2Fdimaprkp4k%2Fxen%2F- 
>>> %2Fpipelines%2F1960066579&data=05%7C02%7Cdmytro_prokopchuk1%40epam.com%7Ce9d60ddeef764dfa381208ddd0823178%7Cb41b72d04e9f4c268a69f949f367c91d%7C1%7C0%7C638895979778869002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=z8DtrlxxN8nyrMNRXXW8IktFaru4f3f8N99iirhnbw0%3D&reserved=0
>>> ---
>>>  .../eclair_analysis/ECLAIR/deviations.ecl     | 10 +++++++++
>>>  docs/misra/deviations.rst                     | 22 +++++++++++++++++++
>>>  docs/misra/rules.rst                          | 17 ++++++++++++++
>>>  3 files changed, 49 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/ 
>>> automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 483507e7b9..ab3400fc89 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -117,6 +117,16 @@ it defines would (in the common case) be already 
>>> defined. Peer reviewed by the c
>>>  -config=MC3A2.R5.5,reports+={deliberate, 
>>> "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset|| 
>>> memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\ 
>>> \.h$)))"}
>>>  -doc_end
>>>
>>> +-doc_begin="Clashes between bitops functions and macro names are 
>>> deliberate.
>>> +These macros are needed for input validation and error handling."
>>> +-config=MC3A2.R5.5,ignored_macros+="^(__)?(test|set|clear|change| 
>>> test_and_(set|clear|change))_bit$"
>>> +-doc_end
>>> +
>>> +-doc_begin="Clashes between grant table functions and macro names in 
>>> 'xen/common/grant_table.c' are deliberate.
>>> +These macros address differences in argument count during compile- 
>>> time, effectively discarding unused parameters to avoid warnings or 
>>> errors related to them."
>>> +-config=MC3A2.R5.5,ignored_macros+="name(update_gnttab_par|| 
>>> parse_gnttab_limit)&&loc(file(^xen/common/grant_table\\.c$))"
>>> +-doc_end
>>> +
>>>  -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
>>>  depending on the guest."
>>>
>>> - 
>>> config=MC3A2.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index e78179fcb8..4c64a8be62 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -142,6 +142,28 @@ Deviations related to MISRA C:2012 Rules:
>>>         memmove.
>>>       - Tagged as `deliberate` for ECLAIR.
>>>
>>> +   * - R5.5
>>> +     - Clashes between bitops ('__test_and_set_bit', 
>>> '__test_and_clear_bit',
>>> +       '__test_and_change_bit', 'test_bit', 'set_bit', 'clear_bit', 
>>> 'change_bit',
>>> +       'test_and_set_bit', 'test_and_clear_bit', 'test_and_change_bit')
>>> +       functions and macro names are intentional. These are necessary 
>>> for error
>>> +       handling and input validation to ensure that the size of the 
>>> object being
>>> +       referenced by the memory address (passed as an argument to the 
>>> macro)
>>> +       meets the minimum requirements for the bit operation. This 
>>> prevents unsafe
>>> +       operations on improperly sized data types that could lead to 
>>> undefined
>>> +       behavior or memory corruption. The macros encapsulate this 
>>> conditional
>>> +       logic into a single, reusable form, simplifying the code and 
>>> avoiding
>>> +       function call overhead. Also this bit operations API was 
>>> inherited from
>>> +       Linux and should be kept for familiarity.
>>> +     - ECLAIR has been configured to ignore these macros.
>>> +
>>> +   * - R5.5
>>> +     - Clashes between grant table ('update_gnttab_par', 
>>> 'parse_gnttab_limit')
>>> +       functions and macro names are intentional. These macros address
>>> +       differences in argument count during compile-time, effectively 
>>> discarding
>>> +       unused 2nd and 3rd parameters to avoid warnings or errors 
>>> related to them.
>>> +     - ECLAIR has been configured to ignore these macros.
>>> +
>>>     * - R5.6
>>>       - The type ret_t is deliberately defined multiple times 
>>> depending on the
>>>         type of guest to service.
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 3e014a6298..cba15933fe 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -196,6 +196,23 @@ maintainers if you want to suggest a change.
>>>             #define f(x, y) f(x, y)
>>>             void f(int x, int y);
>>>
>>> +       Clashes between bitops functions and macro names are allowed
>>> +       because they are used for input validation and error handling.
>>> +       Example::
>>> +
>>> +           static inline void set_bit(int nr, volatile void *addr)
>>> +           {
>>> +               asm volatile ( "lock btsl %1,%0"
>>> +                              : "+m" (ADDR) : "Ir" (nr) : "memory");
>>> +           }
>>> +           #define set_bit(nr, addr) ({                            \
>>> +               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
>>> +               set_bit(nr, addr);                                  \
>>> +           })
>>> +
>>> +       Clashes between grant table functions and macro names are allowed
>>> +       because they are used for discarding unused parameters.
>>> +
>>>     * - `Rule 5.6 <https://eur01.safelinks.protection.outlook.com/? 
>>> url=https%3A%2F%2Fgitlab.com%2FMISRA%2FMISRA-C%2FMISRA- 
>>> C-2012%2FExample-Suite%2F- 
>>> %2Fblob%2Fmaster%2FR_05_06.c&data=05%7C02%7Cdmytro_prokopchuk1%40epam.com%7Ce9d60ddeef764dfa381208ddd0823178%7Cb41b72d04e9f4c268a69f949f367c91d%7C1%7C0%7C638895979778883822%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=crVYwr4A0vyXcUXfQ2%2FJ5EObWfr0XGLgaQ0%2FLH9pMnM%3D&reserved=0>`_
>>>       - Required
>>>       - A typedef name shall be a unique identifier
> 
> Hello Jan, Nicola.
> 
> Do you have any comments regarding this patch?
> Does it require updates/fixes?

Hmm, you have Nicola's R-b, so it's not clear to me what else you need from
him. In its present shape I'm okay for the patch to go in with somebody
else's ack (after all it's not just me who can legitimately ack it); I'm not
happy enough with the patch to give an ack myself, even if I can't offer a
good suggestion towards improvements.

Sorry, Jan

