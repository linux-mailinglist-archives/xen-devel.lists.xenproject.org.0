Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9A8845917
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674433.1049330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXI5-0007Ms-Hx; Thu, 01 Feb 2024 13:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674433.1049330; Thu, 01 Feb 2024 13:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXI5-0007K2-EL; Thu, 01 Feb 2024 13:39:41 +0000
Received: by outflank-mailman (input) for mailman id 674433;
 Thu, 01 Feb 2024 13:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXI3-0007If-8T
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:39:39 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5807a138-c107-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:39:38 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55f2b0c5ae9so1187399a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:39:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e6-20020a50ec86000000b0055fbc52457fsm415569edr.30.2024.02.01.05.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 05:39:37 -0800 (PST)
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
X-Inumbo-ID: 5807a138-c107-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706794778; x=1707399578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxXKa9rZUl8KpqDrwZu8AgUKl5L3iDiVhgOfVsooojw=;
        b=elFg1tMGExKhVZIY52162xXonEH9dbsp0d3WhHbDc+/zqsGP1jIeyXg6vHfK8B9jio
         ivD+aICmCPXzhImNBUYujlH/6VACqxbFDuWnbMxnjReJAWMkB5oxWFsRMftWj49WsgnI
         1keqCfSE5sqiRBL4/cS47NCMXsP7PM4VRYv7jpIzCzTazeYhnrvNGoC2WX0ABbBcSl5h
         nvqUk9y/RNV2/YETIyZNdzFScwTudUz6Ou0/2DUapx74g5JLEu2sLPP66mxDMmv0ChCz
         pgT9ahzCqZs09c7T1+S3b+4qmuV2TGooczIOe19312sycIGwKGm4wYk8LCI8zDtvk2gu
         iY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794778; x=1707399578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxXKa9rZUl8KpqDrwZu8AgUKl5L3iDiVhgOfVsooojw=;
        b=q00IMasrLI1x/OwM5f/os7Yp27NvpAkHiCa3UUfCd3/D53skJTirvFMtmLWjJxF2n/
         I3Q7+NFri+z5W0Q4sPfQXo5MmJCCUD/CHI6q39Ean8+P4HdQtQ77SxHkbjn0VwtBgBAj
         yTouZlWnxw4L3qbpVQysJcdDEjnyW3dhIVsPrFXNFyqP8RmjRL3J7s5dKq6JM4+v8SgP
         gwUep5Uoi888zxaCcNOY4tz3p01OODK6tCLPDSl0BEdh+9C2jnMQsWxdHu1YV7RFIZ3E
         VGLvCFQs9Rrsc348y0ivk30D+NaoEM7RducVx0GOeflZEQ9CsYWuWkVDFIjTjEMBDDUp
         vzag==
X-Gm-Message-State: AOJu0Yx2ZSqhVmtMXq2AlLSlieBj91EEdUzQ4qBZImOAoy+oZBsACxlx
	laE/xPY+UAGVrD8BWmMjdpZhqh85jbBiDMdS/vsNxNMSQy+QfloV2jNLqxeORQ==
X-Google-Smtp-Source: AGHT+IGECh5aNBsOigEpT3v2t8BrUbtPJKPmkXoF3D02N6X817HjuwqShtttIA0jixaptbd4Ahmznw==
X-Received: by 2002:aa7:d386:0:b0:55f:64ca:5a6e with SMTP id x6-20020aa7d386000000b0055f64ca5a6emr3120308edq.12.1706794777653;
        Thu, 01 Feb 2024 05:39:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVngAvbmO7RP9zivsg+O4UQGLFVvLk02FwXI2a/EG1PyOocMEwhB2trjeybxR1RWKQ5RUqqCVq0B4T+x5z9druc/i4xRXubtgBdwbI4k5El1fawvvNPN+lzrRZvr68WM0h/MYbMmBrsdYY3JtMbyAngNL184PljLmCyJ5DogdG2XcYC+YzlRz1Yu4QjhrnGYnc7iPBGqEpTBbwNfzyeQ+c2G4vHDzxWVTxVYm4YXDeGEAoVvju/shVdxOJS0fuigYGMJbTWSorfPKB2jyy5VaFoD4KXTw/3034xLI4njBax9l8xawNsT+bILoQPTFQ1Br/PkrHUH/rikyV1oeilbfOJ234PjBwHkCqTO3wpMPV1U4aRGJf0Rnzmm7B2pHe0+B9KYX1FB678fcSxFWLDknz4
Message-ID: <02b2905d-cc83-4c39-bc29-2ac8351bfc37@suse.com>
Date: Thu, 1 Feb 2024 14:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech>
 <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
 <12b2d25a-ff80-45d8-ad3e-fca6684508df@xen.org>
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
In-Reply-To: <12b2d25a-ff80-45d8-ad3e-fca6684508df@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 14:35, Julien Grall wrote:
> Hi Jan,
> 
> On 01/02/2024 13:30, Jan Beulich wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> Add a command line parameter to allow the user to set the coloring
>>> configuration for Dom0.
>>> A common configuration syntax for cache colors is introduced and
>>> documented.
>>> Take the opportunity to also add:
>>>   - default configuration notion.
>>>   - function to check well-formed configurations.
>>>
>>> Direct mapping Dom0 isn't possible when coloring is enabled, so
>>> CDF_directmap flag is removed when creating it.
>>
>> What implications does this have?
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>   
>>>   Specify a list of IO ports to be excluded from dom0 access.
>>>   
>>> +### dom0-llc-colors
>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>> +
>>> +> Default: `All available LLC colors`
>>> +
>>> +Specify dom0 LLC color configuration. This options is available only when
>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>>> +colors are used.
>>
>> Even Arm already has a "dom0=" option. Is there a particular reason why
>> this doesn't become a new sub-option there?
>>
>> As to meaning: With just a single <integer>, that's still a color value
>> then (and not a count of colors)? Wouldn't it make sense to have a
>> simpler variant available where you just say how many, and a suitable
>> set/range is then picked?
>>
>> Finally a nit: "This option is ...".
>>
>>> @@ -2188,10 +2190,16 @@ void __init create_dom0(void)
>>>               panic("SVE vector length error\n");
>>>       }
>>>   
>>> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
>>> +    if ( !llc_coloring_enabled )
>>> +        flags |= CDF_directmap;
>>> +
>>> +    dom0 = domain_create(0, &dom0_cfg, flags);
>>>       if ( IS_ERR(dom0) )
>>>           panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>>>   
>>> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
>>> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
>>
>> As for the earlier patch, I find panic()ing here dubious. You can continue
>> quite fine, with a warning and perhaps again tainting the system.
> There are arguments for both approach.

In which case - perhaps allow for both? With a Kconfig-established
default and a command line option to override?

> I agree that you can continue but 
> technically this is not the configuration you asked. Someone may not 
> notice the tainting until it is too late (read they have done 
> investigation).
> 
> Bear in mind that the user for cache coloring will be in very 
> specialized environment.

s/will/may/ I suppose. People may enable the option without being in
any specialized environment.

> So if you can't enable cache coloring in 
> production, then something really wrong has happened and continue to 
> boot is probably not right.
> 
> This matches the approach for Arm we have been using since the 
> beginning. And I will strongly argue to continue this way.

I'm okay with this, and here (for Arm-specific code) it may even be okay
to do so without further justification. But in the earlier patch where
common code is affected, I'll insist on at least justifying this behavior.

Jan

