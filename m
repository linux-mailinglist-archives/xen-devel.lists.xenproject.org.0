Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6B82690D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 09:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663210.1033050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMkaZ-0007Ta-Fz; Mon, 08 Jan 2024 08:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663210.1033050; Mon, 08 Jan 2024 08:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMkaZ-0007Qi-DB; Mon, 08 Jan 2024 08:02:27 +0000
Received: by outflank-mailman (input) for mailman id 663210;
 Mon, 08 Jan 2024 08:02:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMkaX-0007Qa-8a
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 08:02:25 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa5da62-adfc-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 09:02:21 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7dd8bce8so1565205e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 00:02:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ck14-20020a056e02370e00b003608a649906sm929332ilb.43.2024.01.08.00.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 00:02:19 -0800 (PST)
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
X-Inumbo-ID: 3fa5da62-adfc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704700940; x=1705305740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IP0J/gc1cKkC2WQdgSoJCEL9qdkY5gJvuh1HTYVz+48=;
        b=ZiASWElWoLRql8ZQxUqBmDxSFMLfJ2K1X94u7eY3i3mJxRb9QY5SLDMMNCaqztDEhV
         ZfHFBrcHdgyDMFvjGC4tIkopwyLyK8+dR+xVY0M+RbrJJ57uMlFRcdroRuNYSyr8JahK
         eOLaqZeln7WT61lVAXdRdYSX9V7/Kq9pxR/HwPyjh5w9Ww+i2XbZshnueoEbNKYxd6IS
         KNcy7fIoGlmbUXN+ir1a3dGfMf9G8KbF1+8dwO28UsU98/j2r1f+mjHU0hJUK7LDxwky
         odBKbDrLZML6ak7I9XlNHYnLXU94XZHqSiA+7Wws1mK8wItkiqTg9VK0iZu+f4l9hm0Q
         VtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704700940; x=1705305740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP0J/gc1cKkC2WQdgSoJCEL9qdkY5gJvuh1HTYVz+48=;
        b=BHD8KxUkdVWSFcH/gr7PxZisym6umVD2U2PQq7xm8+lz0J4aBFoYD6N9gM0v0shuYz
         RavNLY2B21Njri2vndWDIOCayswIiNI+sPkxqt7aO6mfFERuk7rBlEcia6UruR7kkXIC
         171Ssp5n0t2rU+/il7mfKkLJ8qjfbNCvGfTfFVAh1+FHL+OsEDV/FbjKOe1fe+8uwfNU
         cc77cs62BXIOSn5MUGAZ9PpPoizQyGo5NtdzMURMRBMkzghM+mtv4MIZek2O0gynWeys
         fszhdDExSoTgoz3qWb2nN3KKwIkQUNnnVU0qK+9jZfYpmlmUpeiQRZrkAm4KBFycG8El
         kpDA==
X-Gm-Message-State: AOJu0YzcnZz3i4bBTTssUU/0s9sy/e66gavq9bAtmDG7swaJmU1z01Jk
	4jbAoZ16RTVh08mNpG46E7XemtKfzwQj
X-Google-Smtp-Source: AGHT+IGjm6de7jJJXXe98z19VxmQOH9enykjklk+L2VFo8TI48OyGZQhYPa0+tXALcMHo+6KYZ2QWA==
X-Received: by 2002:a19:6556:0:b0:50e:b413:400f with SMTP id c22-20020a196556000000b0050eb413400fmr1127758lfj.49.1704700940097;
        Mon, 08 Jan 2024 00:02:20 -0800 (PST)
Message-ID: <192c393a-3702-4cc3-af60-e2711098ec6d@suse.com>
Date: Mon, 8 Jan 2024 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
 <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
 <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com>
 <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
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
In-Reply-To: <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.01.2024 17:19, Federico Serafini wrote:
> Hello everyone,
> 
> On 21/12/23 13:41, Jan Beulich wrote:
>> On 21.12.2023 13:01, Nicola Vetrini wrote:
>>> Hi Andrew,
>>>
>>> On 2023-12-21 12:03, Andrew Cooper wrote:
>>>> On 21/12/2023 10:58 am, Jan Beulich wrote:
>>>>> On 21.12.2023 11:53, Federico Serafini wrote:
>>>>>> Remove declarations of __put_user_bad() and __get_user_bad()
>>>>>> since they have no definition.
>>>>>> Replace their uses with a break statement to address violations of
>>>>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>>>>>> terminate every switch-clause").
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>> ---
>>>>>> Several violations of Rule 16.3 come from uses of macros
>>>>>> get_unsafe_size() and put_unsafe_size().
>>>>>> Looking at the macro definitions I found __get_user_bad() and
>>>>>> __put_user_bad().
>>>>>> I was wondering if instead of just adding the break statement I can
>>>>>> also remove
>>>>>> such functions which seem to not have a definition.
>>>>> No, you can't. Try introducing a caller which "accidentally" uses the
>>>>> wrong size. Without your change you'll observe the build failing (in
>>>>> a somewhat obscure way, but still), while with your change bad code
>>>>> will silently be generated.
>>>>
>>>> The construct here is deliberate.  It's a build time assertion that bad
>>>> sizes aren't used.
>>>>
>>>> __bitop_bad_size() and __xsm_action_mismatch_detected() are the same
>>>> pattern in other areas of code too, with the latter being more explicit
>>>> because of how it's wrapped by LINKER_BUG_ON().
>>>>
>>>>
>>>> It is slightly horrible, and not the most obvious construct for
>>>> newcomers.  If there's an alternative way to get a build assertion, we
>>>> could consider switching to a new pattern.
>>>
>>> would you be in favour of a solution with a BUILD_BUG_ON in the default
>>> branch followed by a break?
>>>
>>> default:
>>>       BUILD_BUG_ON(!size || size >=8 || (size & (size - 1)));
>>>       break;
>>
>> I don't think this would compile - BUILD_BUG_ON() wants a compile-time
>> constant passed.
> 
> What do you think about adding the following macro to compiler.h:
> 
> #define static_assert_unreachable(identifier) \
>      asm("unreachable " #identifier " reached")
> 
> It expands to an invalid assembly instruction that will lead to a
> customizable error message generated by the assembler instead of the
> linker (anticipating the error detection).
> 
> The use of this macro will indicate a program point considered
> unreachable (and as such removed) by the static analysis performed by 
> the compiler, even at an optimization level -O0.
> 
> An example of use is in the default case of put_unsafe_size():
> 
> default: static_assert_unreachable(default);
> 
> In case a wrong size will be used, the following message will be
> generated:
> 
> ./arch/x86/include/asm/uaccess.h: Assembler messages:
> ./arch/x86/include/asm/uaccess.h:257: Error: no such instruction: 
> `unreachable default reached'

Nice idea. To take it one step further, why not simply use the .error
assembler directive then?

> Note that adopting the macro and discussing its definition are two
> separate things:
> I think we can all agree on the fact that the use of such macro improves
> readability, so I would suggest its adoption.
> Whereas for its definition, if you don't like the invalid asm
> instruction, we could discuss for a different solution, for example,
> the following is something similar to what you are doing now:
> 
> #define static_assert_unreachable(identifier) \
>      extern void identifier(void);             \
>      identifier()
> 
> 
> Note also that the problem of the missing break statement (that violates
> Rule 16.3) is still present, it could be addressed by adding the break
> or deviating for such special cases, do you have any preferences?

Amend the new macro's expansion by unreachable()?

Jan

