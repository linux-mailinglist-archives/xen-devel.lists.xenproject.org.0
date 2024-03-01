Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE286DCAE
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687551.1071166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxuQ-0006ZW-AY; Fri, 01 Mar 2024 08:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687551.1071166; Fri, 01 Mar 2024 08:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxuQ-0006XL-7u; Fri, 01 Mar 2024 08:06:22 +0000
Received: by outflank-mailman (input) for mailman id 687551;
 Fri, 01 Mar 2024 08:06:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgAT=KH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfxuP-0006XF-5r
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:06:21 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95909928-d7a2-11ee-afd8-a90da7624cb6;
 Fri, 01 Mar 2024 09:06:19 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a43f922b2c5so223395266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 00:06:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cu5-20020a170906ba8500b00a440ec600e3sm1445287ejd.121.2024.03.01.00.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 00:06:18 -0800 (PST)
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
X-Inumbo-ID: 95909928-d7a2-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709280378; x=1709885178; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vu98p8LnTxmb+1I39q3SzcyfjUa4FkllL1OT0SWSmtw=;
        b=MYmjL/Cs/oWFMrL1N3dOa1nqZ6lE3xAZpDUfgc7eqE2yDmNSeRpiHmeBGaD6m6W3Cv
         84JwxzN3fx26zZksVM1PlNlkJO6Bhk9AjYmw2wPWXDkqtZsikUE8Hk8D8VIOs3PVTYtE
         Sg6kqNO76E6lsIniWtvIcWw3mRPNrmMC3HyoWzPPDirg9i7/plvJEyRnJuDJtg1x4zwT
         +vRJJY/KN9jIlCt8Z+qtqHJ4qgJbw06A58Ie02cqKMP5kePytvL9g2z2qMDSZ5oiqbUz
         07hqhGWfedxaYPQi+8kxsOjBQPerD7UlcEt7xjqKEjpop4TPwFl5ZC4kzCSuBtSLiHqX
         orlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709280378; x=1709885178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu98p8LnTxmb+1I39q3SzcyfjUa4FkllL1OT0SWSmtw=;
        b=dFXpU++O4HAhJUbMvSEp8UTF7lF9FVt/8cmS3QXJEpiWkykg3jpeJcIJBBJPS/c6Tj
         TfX2r+Nv/eW+0vxo1DHOBNnc1+0AE+XFZwDDNbA4hgYOd+WKjZpicQZgp6OeLqs6dOFu
         B6c++g41cngWytmrt1u1Q0VDLXzM7cOM/LiBV7zxaVl9T+HnI6YNI8GJcr8XJYAv2nU5
         5bvtaiyYDFuUNhhs1fFNDyJST0Ge7COTlYvp6MLgPe1k3gr/ze6SSmB4TUzw9RNG/4lz
         o9hIfMbOX5+T9PmqX3UtlCfaAjf+w3fAJlyE8JU5769OE/kh7jgb75wvP+1xndwwf3R0
         K59w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/WA6/yUeSTK9ICUGb0RdQwoe785km3PpU1/ZVrHpsJiL6j+S588/vDvW9qdd4q54zfOKhq38Wzs0XDqeyXUPp4Um/XX0NRpDQvtX8sk=
X-Gm-Message-State: AOJu0Yy3SDahnODX+1bqRadU/2ryPdlIVK7y3XUUd9y/YlUPy6q0KVaI
	h94atzqVmh5d9b7E+gvJWvcjTrH2m8YxVH3EULAMRf1FAhHjioQWRtxHMTb8nQ==
X-Google-Smtp-Source: AGHT+IF84/UStCCiSLAbR1Go0njvKa2HICQ7eRYzVP+6TOrTGka5O/04+X8wb7KC/aCw/6Cuwlu3Mw==
X-Received: by 2002:a17:906:ca55:b0:a44:7a25:736e with SMTP id jx21-20020a170906ca5500b00a447a25736emr703911ejb.27.1709280378482;
        Fri, 01 Mar 2024 00:06:18 -0800 (PST)
Message-ID: <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com>
Date: Fri, 1 Mar 2024 09:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
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
In-Reply-To: <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 00:28, Stefano Stabellini wrote:
> On Wed, 14 Feb 2024, Federico Serafini wrote:
>> On 14/02/24 14:15, Jan Beulich wrote:
>>> On 14.02.2024 12:27, Federico Serafini wrote:
>>>> On 14/02/24 09:28, Jan Beulich wrote:
>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>> ---
>>>>>>    docs/misra/rules.rst | 6 ++++++
>>>>>>    1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>>> index c185366966..931158b354 100644
>>>>>> --- a/docs/misra/rules.rst
>>>>>> +++ b/docs/misra/rules.rst
>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>>>           headers (xen/include/public/) are allowed to retain longer
>>>>>>           identifiers for backward compatibility.
>>>>>>    +   * - `Rule 5.5
>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>>> +     - Required
>>>>>> +     - Identifiers shall be distinct from macro names
>>>>>> +     - Clashes between function-like macros and non-callable entities
>>>>>> +       are allowed. The pattern #define x x is also allowed.
>>>>>
>>>>> Just for me to know what exactly is covered (hence also a question
>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>>>> the above would be sufficient (and imo better) people frequently
>>>>> write
>>>>>
>>>>> #define a(x, y) b(x, y)
>>>>>
>>>>> which, transformed to the specific case here, would then be
>>>>>
>>>>> #define a(x, y) a(x, y)
>>>>>
>>>>> I'd assume such ought to also be covered, but that's not clear
>>>>> from the spelling above.
>>>>
>>>> I list what happens in some different situations,
>>>> then we can find the right words for the documentation and/or
>>>> refine the configuration:
>>>>
>>>> If you
>>>> #define x x
>>>> and then use `x' as identifier,
>>>> the resulting violation is deviated (allowed pattern).
>>>>
>>>> If you
>>>> #define a(x, y) a(x, y)
>>>> and then use `a' as identifier for a non-callable entity,
>>>> the resulting violation is deviated (no clash with non-callable
>>>> entities).
>>>> If you use identifier `a' for a callable entity, the resulting violation
>>>> is reported: the allowed pattern covers only macros expanding to their
>>>> own name, in this case the macro name is considered to be
>>>> `a' only, not a(x, y).
>>>>
>>>> If you
>>>> #define a(x, y) b(x, y)
>>>> and then use `a' as identifier for a non-callable entity,
>>>> the resulting violation is deviated (no clash with non-callable
>>>> entities).
>>>
>>> I'm afraid I don't see what violation there is in this case, to
>>> deviate. As a result I'm also not sure I correctly understand the
>>> rest of your reply.
>>
>> #define a(x, y) b(x, y)
>>
>> int a; // Violation of Rule 5.5.
>>
>> The macro name `a' that exist before the preprocessing phase,
>> still exists after the preprocessing phase as identifier for the integer
>> variable and this is a violation.
>>
>>>> If you use `a' as identifier for a callable entity,
>>>> this is not a violation because after the preprocessing phase,
>>>> identifier `a' no longer exists.
>> I correct myself:
>> if you use `a' as identifier for a *function*,
>> it is not a violation because after the preprocessing phase
>> the identifier `a' no longer exists, for example:
>>
>> #define a(x, y) b(x, y)
>>
>> void a(int x, int y); // Ok.
> 
> Federico, do you have a better wording suggestion for this rule?
> 
> Jan, any further requests here? What would you like to see as next step?

A more concise wording proposal would probably help.

Jan

