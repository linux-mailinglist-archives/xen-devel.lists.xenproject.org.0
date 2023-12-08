Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A0809CE7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 08:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650381.1015881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBUuE-0001ou-Bw; Fri, 08 Dec 2023 07:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650381.1015881; Fri, 08 Dec 2023 07:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBUuE-0001ma-8i; Fri, 08 Dec 2023 07:04:14 +0000
Received: by outflank-mailman (input) for mailman id 650381;
 Fri, 08 Dec 2023 07:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBUuC-0001mT-Uk
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 07:04:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0e6157-9597-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 08:04:08 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so9916015e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 23:04:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003feae747ff2sm4185247wms.35.2023.12.07.23.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 23:04:07 -0800 (PST)
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
X-Inumbo-ID: fb0e6157-9597-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702019047; x=1702623847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fQ/vFFGBMyhhGUsF8otvgdMnn6ABtLlkUsIwSfouUQ=;
        b=UYiZMCtb6QCw1Ag1OeqCMpHAWean12cAt7CZvE98JBuDLm9cEqCLi6sANyk8/N2oUF
         e0VLh4cNYDUb6tmEyxs1Aak+LWtZNtQYXbKsEPhlg9VOXkxeQvwXYghjuR/aR0F+g9Pw
         Zfiicj0F58Si+07d65GIDmqNc9fiB2N9lV+cevH21QS7GC5JrtiXrU0BH8arxYQCBxXN
         1z7i3/Ve2LIwTV8Es6x+aZ1WCynDBP779sUG7C1HtmWnC1zxfLl+9bdS6gGTc22s4v5L
         G8A6daYYAIRKsEQTldr0cQHMqwpQ/Bt6pos/GSnRiTpv9TGAm8vRMrkgly2IFTGHxcws
         WQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019047; x=1702623847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fQ/vFFGBMyhhGUsF8otvgdMnn6ABtLlkUsIwSfouUQ=;
        b=HI3FT4v2kLQxoNTotDKfdKDahtRmy/mERu86NsiyY78Cr9LEd8DaQS/YnUStqp8vh6
         u8tgFCnzQV9VA3I1S2XGTcOl3AdUDFlVeuqJ6YoWLMTgm4vZrwnTp62TKO68ScB/0hR9
         NEqHGeGZM8uAUHMY1L/m0lX1QMrET2oCf1pkRcau8VlvMI4uI7JUMUt+tykD1li93sbi
         H4DRLcpQZEGjVvfAdH8+8EuizTIcD0eW6yNvkDjFDv0VhtBib5u2jH32yWmZse2Hd6vM
         80dRrS54iETmtH/ElINBoYRwuLKWPabVAvmSLbuVgHbkWAUXz/DBkdY9JuAzX5uaUPsY
         kxTg==
X-Gm-Message-State: AOJu0YwGbc5ji8vGPmNNdwXZpX2azoc3/aVl3wvvqJ3IW8lZxtnnQq1/
	u1SnAoNVy/Q8XwJjJ0s+7TKI
X-Google-Smtp-Source: AGHT+IEhj1Wqomn64A5J2Qbx0BmXKJGDApzvdKiXA9S0xDBCplB8Hu5rMG7Vuy2bogcYH9P7n9gCQQ==
X-Received: by 2002:a05:600c:470f:b0:40b:5e4a:2351 with SMTP id v15-20020a05600c470f00b0040b5e4a2351mr182377wmo.83.1702019047556;
        Thu, 07 Dec 2023 23:04:07 -0800 (PST)
Message-ID: <9572a7a2-67b4-40a8-a04b-3caf4d617a6a@suse.com>
Date: Fri, 8 Dec 2023 08:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra/rules.rst: add more rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com, federico.serafini@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop>
 <ccdbe84d-24ca-41f0-bc1f-fb9499c73880@suse.com>
 <alpine.DEB.2.22.394.2312061819090.1265976@ubuntu-linux-20-04-desktop>
 <12c7da9c-245e-48b7-98f9-2bf0f29b7621@suse.com>
 <alpine.DEB.2.22.394.2312071606000.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071606000.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:08, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Jan Beulich wrote:
>> On 07.12.2023 03:42, Stefano Stabellini wrote:
>>> On Wed, 6 Dec 2023, Jan Beulich wrote:
>>>> On 06.12.2023 04:02, Stefano Stabellini wrote:
>>>>> --- a/docs/misra/rules.rst
>>>>> +++ b/docs/misra/rules.rst
>>>>> @@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
>>>>>  
>>>>>         while(0) and while(1) and alike are allowed.
>>>>>  
>>>>> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
>>>>> +     - Required
>>>>> +     - An unconditional break statement shall terminate every
>>>>> +       switch-clause
>>>>> +     - In addition to break, also other flow control statements such as
>>>>> +       continue, return, goto are allowed.
>>>>> +
>>>>>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>>>>>       - Required
>>>>>       - A switch-expression shall not have essentially Boolean type
>>>>>       -
>>>>>  
>>>>> +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
>>>>> +     - Required
>>>>> +     - The features of <stdarg.h> shall not be used
>>>>> +     -
>>>>
>>>> Did we really accept this without any constraint (warranting mentioning
>>>> here)?
>>>
>>> We agreed that in certain situations stdarg.h is OK to use and in those
>>> cases we would add a deviation. Would you like me to add something to
>>> that effect here? I could do that but it would sound a bit vague.  Also
>>> if we want to specify a project-wide deviation it would be better
>>> documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
>>> a note.
>>
>> I can see your point, and I don't have a good suggestion on possible text.
>> Still I wouldn't feel well ack-ing this in its present shape.
> 
> What about:
> 
>      - It is understood that in some limited circumstances <stdarg.h> is
>        appropriate to use, such as the implementation of printk. Those
>        cases will be dealt with using deviations as usual, see
>        docs/misra/deviations.rst and
>        docs/misra/documenting-violations.rst.

Looks okay. Would also look okay if it was just the first sentence.

Jan

