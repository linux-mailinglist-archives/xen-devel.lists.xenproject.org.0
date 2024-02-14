Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13238854A39
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 14:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680748.1058846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF6v-0000f0-2h; Wed, 14 Feb 2024 13:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680748.1058846; Wed, 14 Feb 2024 13:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raF6u-0000cx-VT; Wed, 14 Feb 2024 13:15:36 +0000
Received: by outflank-mailman (input) for mailman id 680748;
 Wed, 14 Feb 2024 13:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raF6t-0000cX-8N
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 13:15:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21ffd7b5-cb3b-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 14:15:33 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33cddf4b4b5so1133841f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 05:15:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u14-20020a056000038e00b0033ce40eee9fsm2480791wrf.58.2024.02.14.05.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 05:15:32 -0800 (PST)
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
X-Inumbo-ID: 21ffd7b5-cb3b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707916532; x=1708521332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6C0PY+0B/eU5cH4iEmzlZHG2r8SQ67nXHcdU7UpiIc=;
        b=Uo2ohDe9olc0H30zJXOR4eyjx/0TWyYNkDlkYdp5Njq2xYcMZMfqN0DJUc1eB0E414
         2rFUKRbomymgkx1DRkAy/14JzOUFO8EJ1NzZBgWabeXshdWmumLaqoSohH+0nQoOiAom
         RvfkSucXip8n2v2fNAiwIMtEd2qpC19W9NUv8CI7Szb9aBt60wSU0Kom/C3C8+ft46wm
         WXHuxa9/BtKp836qRwc1Qmo/5a9ACjBoaQJhOl+dlN9khXx6zlo4hKL6Zd9q5XV2zc7J
         7TI2BjC4m8gGVbQI+bo9ewWj/6bAGTVnZerMDmTadRFeJ1K5ZnXSsN7pA++MWg91nZ1Q
         P/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916532; x=1708521332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6C0PY+0B/eU5cH4iEmzlZHG2r8SQ67nXHcdU7UpiIc=;
        b=JS7amntXNn3OfSIDnrDUNxdOJJvwiHx7jo1QUEvDzJp3b+OFmodZpxdWVWQURYFGqq
         vTAcVY0/w8WjUsrY99IzYYcIcCdif5iuSA8UQqfT/3dcrCuQYtqnhLn3ItgUtobq+sLc
         bGXmflZs/DUFWjVbZvjg60E5wRjS+69wJQ+aiOQQVFWdc/t0jISumnjlxEMgz7x6mqQ/
         Tjd2dZLdjMsGg9dMMhBfm82gCgmelgybDZAVBxJBwzBQeQdVEI0vDV5Hrs5TgVNlTFj1
         2ytoFQpIRqviLvMRenXz9dxzNnmPjQIkpne/wmrRQA0B77l/VRrAiYRu2hklF7IqYDnh
         JzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVsSAF2c0SP61nWU5ndLD6f49s9x5MaF3OLmOMeOI8yS+5gPqFPgMroDemDoSNpbw1YKrRpyaf/5QHzTz+cwNj0avNxYptj0EzPb+tK6M=
X-Gm-Message-State: AOJu0YzmplKyCiH2xR2yWx2UZc34t93bltS9BWIHo0jfmbjdbmcDlAGd
	zSsG+cGrCNW7BVofsicxP7KoRKGhsuOj6CiwlaTcNnzVji1hLJAiTsAJ3dlMIg==
X-Google-Smtp-Source: AGHT+IETcjpYO34DCIQMnCwd3dcohCnHjfiabDEyWguteJHFU/1oc9WLVjCVx15tzM05d31Q94hxBA==
X-Received: by 2002:a5d:51c7:0:b0:33b:7d9b:4592 with SMTP id n7-20020a5d51c7000000b0033b7d9b4592mr2017179wrv.5.1707916532491;
        Wed, 14 Feb 2024 05:15:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnBSHL+PgeDPoIK1o7DgQ+w8jxB50essMLshAyXMIKxv84cLdLxu08JpZ4DfrOJOkvB5XeLDVlAbQoTkOg2NCHI7pw223r3112dHXS1Lo5q+zQEXR+AOKDiDw9S0uofvKNGCoh6tGB3vwsqtsbqoDLgjFJe1Gp3X5smkmHPrz/fW5VHK4UvRGx1cPh3UcIX3By0RsGlevLaR863pEhBveHUvHxUD3SnWpZPWG/tDC4IV265NIQCLsrmyKi185ih7X5ezzdekdbQj3+5n+72gcAGokX29jyEG1J8V2qxfdK7pg=
Message-ID: <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
Date: Wed, 14 Feb 2024 14:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>, roberto.bagnara@bugseng.com
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
 <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
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
In-Reply-To: <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.02.2024 12:27, Federico Serafini wrote:
> On 14/02/24 09:28, Jan Beulich wrote:
>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>>   docs/misra/rules.rst | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index c185366966..931158b354 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>          headers (xen/include/public/) are allowed to retain longer
>>>          identifiers for backward compatibility.
>>>   
>>> +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>> +     - Required
>>> +     - Identifiers shall be distinct from macro names
>>> +     - Clashes between function-like macros and non-callable entities
>>> +       are allowed. The pattern #define x x is also allowed.
>>
>> Just for me to know what exactly is covered (hence also a question
>> to Roberto as to [to be] implemented Eclair behavior): Even when
>> the above would be sufficient (and imo better) people frequently
>> write
>>
>> #define a(x, y) b(x, y)
>>
>> which, transformed to the specific case here, would then be
>>
>> #define a(x, y) a(x, y)
>>
>> I'd assume such ought to also be covered, but that's not clear
>> from the spelling above.
> 
> I list what happens in some different situations,
> then we can find the right words for the documentation and/or
> refine the configuration:
> 
> If you
> #define x x
> and then use `x' as identifier,
> the resulting violation is deviated (allowed pattern).
> 
> If you
> #define a(x, y) a(x, y)
> and then use `a' as identifier for a non-callable entity,
> the resulting violation is deviated (no clash with non-callable
> entities).
> If you use identifier `a' for a callable entity, the resulting violation
> is reported: the allowed pattern covers only macros expanding to their
> own name, in this case the macro name is considered to be
> `a' only, not a(x, y).
> 
> If you
> #define a(x, y) b(x, y)
> and then use `a' as identifier for a non-callable entity,
> the resulting violation is deviated (no clash with non-callable
> entities).

I'm afraid I don't see what violation there is in this case, to
deviate. As a result I'm also not sure I correctly understand the
rest of your reply.

> If you use `a' as identifier for a callable entity,
> this is not a violation because after the preprocessing phase,
> identifier `a' no longer exists.
> 
> As far as I know, this is what was agreed upon in one of the recent
> MISRA meetings.

That was my fear (of being what I'd call a wrong [insufficient]
interpretation of what was meant).

Jan

