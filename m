Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDC87160F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 07:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688595.1072953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOdG-00058x-5t; Tue, 05 Mar 2024 06:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688595.1072953; Tue, 05 Mar 2024 06:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOdG-00056V-36; Tue, 05 Mar 2024 06:50:34 +0000
Received: by outflank-mailman (input) for mailman id 688595;
 Tue, 05 Mar 2024 06:50:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhOdF-00056P-4w
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 06:50:33 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a766c30c-dabc-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 07:50:29 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a458850dbddso124124566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 22:50:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bx16-20020a170906a1d000b00a4588098c5esm1000025ejb.132.2024.03.04.22.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 22:50:28 -0800 (PST)
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
X-Inumbo-ID: a766c30c-dabc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709621429; x=1710226229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+Hc3NpL4EVdaoxSZAfYJmZIkH8tu05K+0x9uZCYy/M=;
        b=Xvp/FmD0+cWSW+iBwddeAaUmqJXoA4aZ9EaG1vSqz1LL4ZkncEH/ELE2VvyoF3EGY/
         WgyymIvYKbvUsz4Y1Yn0nZytwiWrj9UJqYJxv6CcKd/zp9Gm6YT0cer7J033UT8OB1HZ
         BHMqSZ+jXVmsYnRo5tYxTSudtmyORFERdeAHNdL0xfP4JCcl/+o39koyXs0FijUfG22G
         OjB2im41+PASVv/BSda/x+Dt6H21IlWyDMurlLCh7xqoEhGs6a0RPSwCvRG1ll1wgHQ0
         5TCOI9wW9I+8ZTZp2tED2nx5pgG2Z7vfe8NcEalKnPQFpmvayc78ScZQxrhd9Y6vAkox
         2xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709621429; x=1710226229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Hc3NpL4EVdaoxSZAfYJmZIkH8tu05K+0x9uZCYy/M=;
        b=GeA+cjgBdped2GJn7hUpjRUZn+C+EPBCKlPOtV/eLi2b30t+j/uDzPVkdKfhI6e2ya
         2jQoFw9j3CqhQ7xsciOQVRUxVjI1MOB811vnUdfcAFPsOsw7I3g8sSsCo0ZkdUWHTnL4
         2scgIpm8ZP8Rr9YaJah3f9gog3h98hPFwHQN3E8FrbBxi0CvgIYvbn5cQ/Qr9sKv8wyG
         6A35Y+y2YLX9Js/72bAdBuJzHZaHH30FWqor9vUnmk+vQMOxgOpx3mnubkIfj3k51Tqh
         gaJW/IRYFFZAexRPFCK4eJCv6CMRlQSViaIApxmDeKMeKsuoAAM/7hp5HhlCA1uDpjnx
         s55A==
X-Forwarded-Encrypted: i=1; AJvYcCXj3JJN+/2+msB6qgAudpSlv/Fqr/WRBe/ReFDSQXI1ltvaO29lZ9jRFipIWVoheV4CSbeY2hmJNZKMJ0ny2do1fh/crC3USV4KPGoKbA0=
X-Gm-Message-State: AOJu0Yxax+3yHY7Shw+QAEp5TjADso+ouKcamEZ43CCREoJ7biUbht2u
	+Bs1KGqxi9nlmfAM4UpNjA82bAJ0cxqdcYKmGLaaHRbgvJGvmzz6cGMRgSDMeg==
X-Google-Smtp-Source: AGHT+IE9sS21fKKsW3AcgGexRHRnIC4aVMegjqjAVS5JVm6OOYsKeZBQjfc4nV7eSlenSSxXOY9Row==
X-Received: by 2002:a17:906:4a55:b0:a44:978b:534a with SMTP id a21-20020a1709064a5500b00a44978b534amr6892079ejv.64.1709621428803;
        Mon, 04 Mar 2024 22:50:28 -0800 (PST)
Message-ID: <c36d5408-37b8-4429-bad9-8090e0b3f910@suse.com>
Date: Tue, 5 Mar 2024 07:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>, roberto.bagnara@bugseng.com
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
 <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
 <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
 <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop>
 <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com>
 <da1446d6-b248-4c68-8302-2179dbe09987@bugseng.com>
 <7747cb81-8fdb-4a5f-bfd1-c6c9bdb6039a@suse.com>
 <a2a90115-762a-497c-8de3-95b6d14ab9e2@bugseng.com>
 <8e5d4c48-558d-40e2-851a-3eb6bfa5dbfe@suse.com>
 <alpine.DEB.2.22.394.2403041748150.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403041748150.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2024 02:49, Stefano Stabellini wrote:
> On Mon, 4 Mar 2024, Jan Beulich wrote:
>> On 04.03.2024 16:39, Federico Serafini wrote:
>>> On 04/03/24 15:17, Jan Beulich wrote:
>>>> On 04.03.2024 14:31, Federico Serafini wrote:
>>>>> On 01/03/24 09:06, Jan Beulich wrote:
>>>>>> On 01.03.2024 00:28, Stefano Stabellini wrote:
>>>>>>> On Wed, 14 Feb 2024, Federico Serafini wrote:
>>>>>>>> On 14/02/24 14:15, Jan Beulich wrote:
>>>>>>>>> On 14.02.2024 12:27, Federico Serafini wrote:
>>>>>>>>>> On 14/02/24 09:28, Jan Beulich wrote:
>>>>>>>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>>>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>      docs/misra/rules.rst | 6 ++++++
>>>>>>>>>>>>      1 file changed, 6 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>>>>>>>>> index c185366966..931158b354 100644
>>>>>>>>>>>> --- a/docs/misra/rules.rst
>>>>>>>>>>>> +++ b/docs/misra/rules.rst
>>>>>>>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>>>>>>>>>             headers (xen/include/public/) are allowed to retain longer
>>>>>>>>>>>>             identifiers for backward compatibility.
>>>>>>>>>>>>      +   * - `Rule 5.5
>>>>>>>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>>>>>>>>> +     - Required
>>>>>>>>>>>> +     - Identifiers shall be distinct from macro names
>>>>>>>>>>>> +     - Clashes between function-like macros and non-callable entities
>>>>>>>>>>>> +       are allowed. The pattern #define x x is also allowed.
>>>>>>>>>>>
>>>>>>>>>>> Just for me to know what exactly is covered (hence also a question
>>>>>>>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>>>>>>>>>> the above would be sufficient (and imo better) people frequently
>>>>>>>>>>> write
>>>>>>>>>>>
>>>>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>>>>>
>>>>>>>>>>> which, transformed to the specific case here, would then be
>>>>>>>>>>>
>>>>>>>>>>> #define a(x, y) a(x, y)
>>>>>>>>>>>
>>>>>>>>>>> I'd assume such ought to also be covered, but that's not clear
>>>>>>>>>>> from the spelling above.
>>>>>>>>>>
>>>>>>>>>> I list what happens in some different situations,
>>>>>>>>>> then we can find the right words for the documentation and/or
>>>>>>>>>> refine the configuration:
>>>>>>>>>>
>>>>>>>>>> If you
>>>>>>>>>> #define x x
>>>>>>>>>> and then use `x' as identifier,
>>>>>>>>>> the resulting violation is deviated (allowed pattern).
>>>>>>>>>>
>>>>>>>>>> If you
>>>>>>>>>> #define a(x, y) a(x, y)
>>>>>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>>>>>> entities).
>>>>>>>>>> If you use identifier `a' for a callable entity, the resulting violation
>>>>>>>>>> is reported: the allowed pattern covers only macros expanding to their
>>>>>>>>>> own name, in this case the macro name is considered to be
>>>>>>>>>> `a' only, not a(x, y).
>>>>>>>>>>
>>>>>>>>>> If you
>>>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>>>>>> entities).
>>>>>>>>>
>>>>>>>>> I'm afraid I don't see what violation there is in this case, to
>>>>>>>>> deviate. As a result I'm also not sure I correctly understand the
>>>>>>>>> rest of your reply.
>>>>>>>>
>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>>
>>>>>>>> int a; // Violation of Rule 5.5.
>>>>>>>>
>>>>>>>> The macro name `a' that exist before the preprocessing phase,
>>>>>>>> still exists after the preprocessing phase as identifier for the integer
>>>>>>>> variable and this is a violation.
>>>>>>>>
>>>>>>>>>> If you use `a' as identifier for a callable entity,
>>>>>>>>>> this is not a violation because after the preprocessing phase,
>>>>>>>>>> identifier `a' no longer exists.
>>>>>>>> I correct myself:
>>>>>>>> if you use `a' as identifier for a *function*,
>>>>>>>> it is not a violation because after the preprocessing phase
>>>>>>>> the identifier `a' no longer exists, for example:
>>>>>>>>
>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>>
>>>>>>>> void a(int x, int y); // Ok.
>>>>>>>
>>>>>>> Federico, do you have a better wording suggestion for this rule?
>>>>>>>
>>>>>>> Jan, any further requests here? What would you like to see as next step?
>>>>>>
>>>>>> A more concise wording proposal would probably help.
>>>>>
>>>>> What do you think about:
>>>>>
>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>> index 1e134ccebc..a975b9a85f 100644
>>>>> --- a/docs/misra/rules.rst
>>>>> +++ b/docs/misra/rules.rst
>>>>> @@ -181,6 +181,13 @@ maintainers if you want to suggest a change.
>>>>>           headers (xen/include/public/) are allowed to retain longer
>>>>>           identifiers for backward compatibility.
>>>>>
>>>>> +   * - `Rule 5.5
>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>> +     - Required
>>>>> +     - Identifiers shall be distinct from macro names
>>>>> +     - Macros expanding to their own name are allowed (e.g., #define x x).
>>>>> +       Clashes between names of function-like macros and identifiers of
>>>>> +       non-callable entities are allowed.
>>>>
>>>> Imo that still leaves open e.g. the
>>>>
>>>> #define a(x, y) a(x, y)
>>>>
>>>> case: Permitted ("own name") or not permitted ("a" pretty clearly is expected
>>>> to be a callable entity here, besides being a function-like macro)?
>>>
>>> I would not consider your example as a macro that expands to its own
>>> name, the macro name is considered to be `a' only.
>>
>> That's what I was assuming, and hence my asking back. I think the
>> above ought to be permitted just like "#define x x", and hence the
>> suggested text would need expanding, to ...
>>
>>> Rather, you example can be used to trigger the "callable-noncallable"
>>> part of the deviation, for example:
>>>
>>> #define a(x, y) a(x, y)
>>>
>>> void a(int x, int y); /* Not permitted (callable entity 'a'). */
>>
>> ... prevent this ("not permitted") from happening. I'm pretty sure
>> you've already found instances of this pattern in our code base.
> 
> Sorry Jan, purely asking as a clarification because I couldn't
> understand what you wrote.
> 
> You are asking for a clarification in the wording so that the following
> is explicitly allowed, right?
> 
> #define a(x, y) a(x, y)
> void a(int x, int y);

Yes. (Or, less desirable, unambiguously disallowed.)

Jan

