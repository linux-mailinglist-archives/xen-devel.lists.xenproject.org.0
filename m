Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E904EA7F46D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 07:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941376.1340880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u21tY-0004Cs-7L; Tue, 08 Apr 2025 05:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941376.1340880; Tue, 08 Apr 2025 05:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u21tY-0004At-4b; Tue, 08 Apr 2025 05:53:12 +0000
Received: by outflank-mailman (input) for mailman id 941376;
 Tue, 08 Apr 2025 05:53:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u21tV-0004Aj-SD
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 05:53:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7d57523-143d-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 07:52:56 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so3134642f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 22:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300968c4sm13960675f8f.9.2025.04.07.22.52.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 22:52:55 -0700 (PDT)
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
X-Inumbo-ID: b7d57523-143d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744091575; x=1744696375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qTsJDkuDhWPBVq6ZjquOkDnlJYaELR6SwOAyima/J7A=;
        b=WrIT0Tg0+1DHKOaqaizjQdc2mBXXDZyMxsJnjfMtSut+o2W4OMOOgUP6efAD1TAekQ
         SaSb6xHDwit6z3moLTF95UiKOMZrLBycY790scexzoGQcFlcCxEhpLA1voyx1eJBVzgv
         Iye0O4PybrW+lCqQa9rw7EK3xMvXB5n4waUxr6gCE/Vto9YpJ7ePd3ru0Hy7CtMjdjYg
         M8U4Ndu0gm+3P9zmpws7VI4K1uXFAY7ajXxcKSwEhLKM1h7zo2e8cp9BQwSidsAT/OTG
         LlzdU8gWABzf0BbII0cWCYuvWUIQevaMeltDqx9getdrbeJLkSxVllsOdfZWeZFpXV14
         ZhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091575; x=1744696375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTsJDkuDhWPBVq6ZjquOkDnlJYaELR6SwOAyima/J7A=;
        b=iyRwbR5253vKya2XmI3eOxmiiXshl53edApFkukrX5mWnltWHBouXb9WVveiHetUmU
         MVVs2oAfHgvFU+Tw9iQOz5c9yRPmRuqCXOX7NEWzBxj5hp6fJxybsXPPJif7wBaOEqFi
         H4mwA4unYPuh3zWlvMNGQ7wQi/PcYU75LgdmoA25c4E37WU3V7Xf8czUX96tCuDBdOXs
         xIQotvVESQaRoKZah2ojWFWoBLe+6mP8w9EHHxe/iCWSNNVM2pVncWPxG9nT49FZFBKm
         aschtm9Oa4PLbBUK3mQbDSrOK1+OMl4RQBcB9sB7kADLpUdbFkqEp1Ipq2veKSWOs95j
         PCnw==
X-Forwarded-Encrypted: i=1; AJvYcCUQzw+hncsC9IWBHkZ6nh3pW7npoW4Iosmq4pecsZer2jCDz/COoNeHHHRnIRxm5cbDSIdanwrsypU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOUc0sAB7QwEnWzUlWI5x4yWzqPvauErVEJiwDXFDnCqunXc2A
	peKjHFsLFtPK94FF2mB70bsQxUYsgHd8R2Yy8P2GVN6Mw2wG5XYsNvUTwnT/Ng==
X-Gm-Gg: ASbGncu+TIY2bxO8Zs4odp5zOzbNUU1HGqWuVfpfxauLBFBVv6LG4oPaSniTqm7AwIh
	VMcGLZsxv6tTLTqn6BVFAVldQOZuYesJXeIe3jHAmp7vQrDXMjyqIXDUDjzy+mnZiOWdFPeFBzJ
	TUhwXMBvCCrvLTD9AGyf2lRyaBnnXsuR2gMImDf1OedUAvlwzb+KlL6DmqCamRsTns8PGVkkd5r
	ubcimkr6R3Uu9a/f/ghVXjHCkkv0yJQwXX8N6HoWcbcB7RtnbO8fEBcju6g6KnI6PP/tbtpjWpr
	xRVodOk6QjpNTwFrV+4u1ar39WUlcONbC70TVXkLpvbdy9TnHgNlzk5RLLzQZrtIsB85c7wnx7S
	ix55l3rb9KW5q4zpUwds8Sq815V0YXA==
X-Google-Smtp-Source: AGHT+IHoj10Jr7/EKr+Bq3mIqvGzHse6olJQ58nRof+sd2bJBYvGiYgy3KbzaYbLsOx2cQAMUTsYPg==
X-Received: by 2002:a5d:64aa:0:b0:391:2f71:bbb3 with SMTP id ffacd0b85a97d-39cba9332f2mr13272847f8f.46.1744091575338;
        Mon, 07 Apr 2025 22:52:55 -0700 (PDT)
Message-ID: <8c5ab3fc-1e29-48f9-a7c6-bfda789e36f7@suse.com>
Date: Tue, 8 Apr 2025 07:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250403214608.152954-1-jason.andryuk@amd.com>
 <20250403214608.152954-2-jason.andryuk@amd.com>
 <332e0afc-9c43-4602-9bc0-dfe4ddd1b107@suse.com>
 <64f6bf18-d3e4-4392-b924-4b779dbe5d69@amd.com>
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
In-Reply-To: <64f6bf18-d3e4-4392-b924-4b779dbe5d69@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.04.2025 20:16, Jason Andryuk wrote:
> On 2025-04-04 03:38, Jan Beulich wrote:
>> On 03.04.2025 23:46, Jason Andryuk wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>
>>> Add and use a new internal create domain flag to specify the hardware
>>> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>>>
>>> This allows more flexibility with domain creation.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v3:
>>> Or-in CDF_hardware for late hwdom case
>>
>> Except that ...
>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -820,13 +820,18 @@ struct domain *domain_create(domid_t domid,
>>>       d->is_privileged = flags & CDF_privileged;
>>>   
>>>       /* Sort out our idea of is_hardware_domain(). */
>>> -    if ( domid == 0 || domid == hardware_domid )
>>> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
>>>       {
>>>           if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>>>               panic("The value of hardware_dom must be a valid domain ID\n");
>>>   
>>> +        /* late_hwdom is only allowed for dom0. */
>>> +        if ( hardware_domain && hardware_domain->domain_id )
>>> +            return ERR_PTR(-EINVAL);
>>> +
>>>           old_hwdom = hardware_domain;
>>>           hardware_domain = d;
>>> +        flags |= CDF_hardware;
>>>       }
>>
>> ... this isn't quite enough. You're only modifying what will go out of scope
>> when returning from the function. What's at least equally important to OR into
>> is d->cdf.
> 
> Yes, thanks for catching that.
> 
> I'll move d->cdf assignment to after here instead of or-ing in a second 
> time.

Not sure that'll be good to do - intermediate code (in particular passing
d to other functions) may need to have that set already. And even if not
now, then maybe going forward.

> With that, it seems like it should also be removed from old_hwdom?
> 
> old_hwdom->cdf &= ~CDF_hardware

Oh, indeed. Thanks in turn for catching this further aspect.

Jan

