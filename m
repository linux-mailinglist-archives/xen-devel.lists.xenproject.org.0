Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAA18748F1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 08:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689650.1074841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri8Oq-0007TO-9H; Thu, 07 Mar 2024 07:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689650.1074841; Thu, 07 Mar 2024 07:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri8Oq-0007Rs-6F; Thu, 07 Mar 2024 07:42:44 +0000
Received: by outflank-mailman (input) for mailman id 689650;
 Thu, 07 Mar 2024 07:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ri8Oo-0007Rm-ON
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 07:42:42 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46f2d9c3-dc56-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 08:42:41 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so708933a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 23:42:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bx18-20020a170906a1d200b00a44f07e55d2sm5451506ejb.41.2024.03.06.23.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 23:42:40 -0800 (PST)
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
X-Inumbo-ID: 46f2d9c3-dc56-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709797361; x=1710402161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7e0DzqJ9/uRKDP87LkRLRn6M/3mWXMP2NGC8Tah1to=;
        b=HXsLoU64Yw2KCcJo9xjKm6kqxkeBe3TG+MBuZHLkpZYYkRC/lfVXb6+Hlya4A7vHeO
         ah2LwWH+3YBt//FeMWznHTAXCMZGGRUMD82j6m6dYLp+0CluPHokAeX2zbL+OdO3OJyv
         oSl2oTSa+2ltVZml/sS4VqcgUmkviXh3vtmRlKYMEljmUdejvvY0T9BlwbmQY2+dcMes
         NPL8DWTsBcEXlUrnVuXcop9i3KCyb9RO9hQtgxEyhxS4ul/IQx2kL9M4ejVETAQzNEbA
         MiZ61nax2TByHwSGpQVU3nF2NIAAGSHXtPULVafcXDiH/qOM6tUSZBF7u45UaOEKiRS2
         q+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709797361; x=1710402161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7e0DzqJ9/uRKDP87LkRLRn6M/3mWXMP2NGC8Tah1to=;
        b=kPZFb+N9ABn7dnzVzfTUtCqz4NLyLb7Wv6iVri65v65Lh9WCT8OO39ud+IUYnsuBKD
         OkAyoeQSxBJe44tt40wlWxU0dbpWlaXwPQnlq6dZ4wmQTB9N3R63F9v8iwzce0GjlSqe
         p9wWqdCXEZv7Yu/YXMAb+311RC1pLbqLncM/PXKZfh/AnRtwBNZm8EC5CYV7UGjsNPOQ
         ur0XlkB+E9M7zyc7uaeNtJbcdN9pU86GS7KxH2uJu4mXJl6g1TGNwlPeiR0b4hh3IT0i
         xQDDyqO4xA/3iEu1w1u4+QUmRm1qBZQBl1Ruv3PKuP5fpEhFpRNTeVF2HhIVkBW2NztM
         JN+w==
X-Gm-Message-State: AOJu0Yx08nUr/j8/qneq21mSxacjaACHr1Cq+hrsIqwzLNZKfJbUaEr7
	GIkZCEdXyMu5ko/2FWPdzl3mOGtn7m+6qmzTqIyINVoRUpy4zsKTzyM6ZSjsOg==
X-Google-Smtp-Source: AGHT+IFFfp5sdqSVprdZh4oUG96In2rreu5flL0V9IhEIa9ot30sZbv0hPKWPa2D9jKPKVKTTA1q6w==
X-Received: by 2002:a17:906:b7c9:b0:a3f:1055:28b7 with SMTP id fy9-20020a170906b7c900b00a3f105528b7mr10180167ejb.63.1709797360659;
        Wed, 06 Mar 2024 23:42:40 -0800 (PST)
Message-ID: <c09db98c-2d04-428f-93a7-6a6900032054@suse.com>
Date: Thu, 7 Mar 2024 08:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
 <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
 <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop>
 <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com>
 <alpine.DEB.2.22.394.2403041756140.853156@ubuntu-linux-20-04-desktop>
 <fe15bab2-3a48-4243-b50c-6d9854c218c2@suse.com>
 <alpine.DEB.2.22.394.2403061734250.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403061734250.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2024 02:39, Stefano Stabellini wrote:
> On Tue, 5 Mar 2024, Jan Beulich wrote:
>> On 05.03.2024 03:03, Stefano Stabellini wrote:
>>> On Mon, 4 Mar 2024, Jan Beulich wrote:
>>>> On 02.03.2024 02:37, Stefano Stabellini wrote:
>>>>> On Fri, 1 Mar 2024, Jan Beulich wrote:
>>>>>> On 29.02.2024 23:57, Stefano Stabellini wrote:
>>>>>>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>>>>>>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>>>>>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>>>>>>> macro definitions should gain additional parentheses to ensure that all
>>>>>>>> current and future users will be safe with respect to expansions that
>>>>>>>> can possibly alter the semantics of the passed-in macro parameter.
>>>>>>>>
>>>>>>>> No functional change.
>>>>>>>>
>>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>>
>>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>>>
>>>>>> You did see the discussion on earlier patches, though? I don't think
>>>>>> any of the parentheses here are needed or wanted.
>>>>>
>>>>> We need to align on this. Currently if we go by what's written in
>>>>> docs/misra/deviations.rst, then rhs should have parentheses.
>>>>
>>>> Quoting the actual patch again:
>>>
>>> [...]
>>>
>>>> What rhs are you talking about in light of this change? The only rhs I
>>>> can spot here is already parenthesized.
>>>
>>> Yes you are right. I replied here as an overall comment about our
>>> approach to 20.7, although this patch is not a good example. My reply
>>> was meant in the context of https://marc.info/?l=xen-devel&m=170928051025701
>>
>> I'm still confused: The rhs is being parenthsized there. It's the _lhs_
>> which isn't and ...
>>
>>>>> Can we safely claim that rhs parentheses are never needed? If so, then
>>>>> great, let's add it to deviations.rst and skip them here and other
>>>>> places in this patch series (e.g. patch #8). When I say "never" I am
>>>>> taking for granted that the caller is not doing something completely
>>>>> unacceptably broken such as: 
>>>>>
>>>>>      WRITE_SYSREG64(var +, TTBR0_EL1)
>>>>
>>>> I'm afraid I can't associate this with the patch here either. Instead in
>>>> the context here a (respective) construct as you mention above would simply
>>>> fail to build.
>>>
>>> Fair enough it will break the build. I was trying to clarify that when I
>>> wrote "the rhs parentheses are never needed" I meant "never" within
>>> reason. One can always find ways to break the system and I tried to make
>>> an example of something that for sure would break rhs or lhs without
>>> parentheses.
>>>
>>> I meant to say, if we don't account for exceptionally broken cases, can
>>> we safety say we don't need parentheses for rhs?
>>
>> ... doesn't need to, unless - as you say - one contrives examples. Yet to
>> clarify here as well: I assume you mean "we don't need parentheses for lhs".
> 
> Yes. Far clarity, we are all aligned that lhs does not need parentheses
> and in fact it is even already deviated in docs/misra/deviations.rst.
> 
> Now back to this specific patch.
> 
> The problem is that the comma ',' doesn't need parenthesis for the
> parameters. However, the way we wrote the deviation in
> docs/misra/deviations.rst doesn't cover the case this patch is dealing
> with. docs/misra/deviations.rst only speaks of functions and macros
> arguments.
> 
> Should we rephrase docs/misra/deviations.rst in terms of ',' instead ?

That's what I've requested elsewhere, yes.

> Can ECLAR deal with it?

I seem to vaguely recall Nicola saying it can, but if not then it surely
can be made to do so.

Jan

