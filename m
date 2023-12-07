Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4C808228
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 08:48:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649584.1014259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB972-0007mA-Dq; Thu, 07 Dec 2023 07:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649584.1014259; Thu, 07 Dec 2023 07:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB972-0007jo-B7; Thu, 07 Dec 2023 07:48:00 +0000
Received: by outflank-mailman (input) for mailman id 649584;
 Thu, 07 Dec 2023 07:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rB970-0007ji-OD
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 07:47:58 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efdcaabb-94d4-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 08:47:57 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so730561f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 23:47:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0033342978c93sm713599wru.30.2023.12.06.23.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 23:47:56 -0800 (PST)
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
X-Inumbo-ID: efdcaabb-94d4-11ee-98e6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701935277; x=1702540077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBB8FvOq2MJQaMZFEOO70JQhLaQiLbhU8hcD7e3RF28=;
        b=X9Q5yPGTaujmKVdneXgDbj0i9jG0Kb5tPv9S9VwXyECQeCodgFEzQ0zP3HHHFP3Cl4
         j8Gu+I+p4n8XKnVibMxZOM62Okz5JKuLwWfLW26mJ0g/DNtJruUSFvhervOBpV7w7ULc
         xQ1SYQDSzY93TkFSODKT0JoxOSCIO+47zCbvrNE+txSnHi98uBeom3l/tZoRHePntI3x
         /01Pz6V4fgu3tZiq1PsDb/hqUGxL3bFiHl5i6BTGMHA4VZlv2qS7D0IO4rea2Sm2Cunb
         Ic8gfXZVk72cfaD4jJHvkq/H7beRz0aS4WruOvODUo5qjTE7oByqSD2pnF6Qq5JDmZ4g
         bKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935277; x=1702540077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBB8FvOq2MJQaMZFEOO70JQhLaQiLbhU8hcD7e3RF28=;
        b=xMQV61F15Q1ijXV/LOVkp1xnGo5/5V04TLQugjS7iMIMG8iLFEDFLwCb3K/ixh3nUn
         qiGgl9GED7CWtyydS/Y+INAFlgg4FtF2kGm+YZzT1+fa9DU2HihLRrE0/kUpiOwsh1Ja
         DhKXjTx4SEPohVO8G+ucjbbmGzg0tHjeZpLJVs4UlXOv6DLjQ0EYWSpqRJGblVi8ReCs
         2rjagfYiaXZEXI9qzX+7k+ZQB/ADOdCCedE1RlWL7gKajM4bU0HCA0p1qIb3jvwcTfyH
         rZMozRF7HVmeTF+YnHB7GDV/46TvKp0E98imXUQAwSchldSSc+iIX9gEX6dHY/hxAbAE
         E/ow==
X-Gm-Message-State: AOJu0YyW2R7vyd95TVLP4yhvMCsd2kmhHeNNwftMWE0sp8Db8r0+5CDS
	SVWrhS7tlNkGFk2TIuOjaF2s
X-Google-Smtp-Source: AGHT+IFvKNC2I6CchoZYZqi6CN5ztwchgL0bwLi86eUcnwz4WUnnphK67l5G7Kf3rHXG5vFPcWRh9Q==
X-Received: by 2002:a05:6000:243:b0:333:4ac2:fe34 with SMTP id m3-20020a056000024300b003334ac2fe34mr995147wrz.112.1701935276936;
        Wed, 06 Dec 2023 23:47:56 -0800 (PST)
Message-ID: <12c7da9c-245e-48b7-98f9-2bf0f29b7621@suse.com>
Date: Thu, 7 Dec 2023 08:47:55 +0100
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
In-Reply-To: <alpine.DEB.2.22.394.2312061819090.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.12.2023 03:42, Stefano Stabellini wrote:
> On Wed, 6 Dec 2023, Jan Beulich wrote:
>> On 06.12.2023 04:02, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
>>>  
>>>         while(0) and while(1) and alike are allowed.
>>>  
>>> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
>>> +     - Required
>>> +     - An unconditional break statement shall terminate every
>>> +       switch-clause
>>> +     - In addition to break, also other flow control statements such as
>>> +       continue, return, goto are allowed.
>>> +
>>>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>>>       - Required
>>>       - A switch-expression shall not have essentially Boolean type
>>>       -
>>>  
>>> +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
>>> +     - Required
>>> +     - The features of <stdarg.h> shall not be used
>>> +     -
>>
>> Did we really accept this without any constraint (warranting mentioning
>> here)?
> 
> We agreed that in certain situations stdarg.h is OK to use and in those
> cases we would add a deviation. Would you like me to add something to
> that effect here? I could do that but it would sound a bit vague.  Also
> if we want to specify a project-wide deviation it would be better
> documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
> a note.

I can see your point, and I don't have a good suggestion on possible text.
Still I wouldn't feel well ack-ing this in its present shape.

>>> @@ -478,12 +490,24 @@ maintainers if you want to suggest a change.
>>>         have an explicit return statement with an expression
>>>       -
>>>  
>>> +   * - `Rule 17.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_05.c>`_
>>> +     - Advisory
>>> +     - The function argument corresponding to a parameter declared to
>>> +       have an array type shall have an appropriate number of elements
>>> +     -
>>> +
>>>     * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
>>>       - Mandatory
>>>       - The declaration of an array parameter shall not contain the
>>>         static keyword between the [ ]
>>>       -
>>>  
>>> +   * - `Rule 17.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_07.c>`_
>>> +     - Required
>>> +     - The value returned by a function having non-void return type
>>> +       shall be used
>>> +     -
>>
>> Same question here.
> 
> Here I was also thinking it might be good to add a comment. Maybe we could
> add:
> 
>      - Please beware that this rule has many violations in the Xen
>        codebase today, and its adoption is aspirational. However, when
>        submitting new patches please try to decrease the number of
>        violations when possible.

Yea, I think this would be good to add.

Jan

