Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BFA77B6C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934082.1335889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbBl-0004zZ-TD; Tue, 01 Apr 2025 12:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934082.1335889; Tue, 01 Apr 2025 12:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbBl-0004x9-P0; Tue, 01 Apr 2025 12:57:57 +0000
Received: by outflank-mailman (input) for mailman id 934082;
 Tue, 01 Apr 2025 12:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzbBk-0004pc-3j
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:57:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed440d88-0ef8-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 14:57:54 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so39324925e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 05:57:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d900009e5sm155663555e9.34.2025.04.01.05.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 05:57:53 -0700 (PDT)
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
X-Inumbo-ID: ed440d88-0ef8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743512274; x=1744117074; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q074qb7siEiV1o4yxk63IddYLBieZ8FtwGsqz4h3YHY=;
        b=OqsAdtU+OCYXpa6uGYSg02a8cN1YCgq6abVa8xzkiLYoM38OW7V79vR09LcWemS2bS
         I7A7lnX/L1j/lo9Kw+F8+Q2IIGXXW00+KrnwyTvicrU1uFDZk9lDIOhdwmfxtmUZmFV8
         iaDZWiLHXx97KQFsAWZvaMGoo+Ekc7xYROsuGPgi6skgGr2+LLmb7WN0LupVbSVjLt/0
         TdCTxQUkCgv6xwTYuiPPCIkLKOGPg8+n6xg9zushv92OaC3UkbWWSpAUGQq/XwGH0X0i
         I2ezaQjOq52fziu3O8yDUs9t+gEL8KIoHSB6o5kzFIWKeh8ejhTKPrseseQz2Jc04ot6
         E2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512274; x=1744117074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q074qb7siEiV1o4yxk63IddYLBieZ8FtwGsqz4h3YHY=;
        b=WzzWlMZU2Ji7fGlcNla7s7MYYu+zinUlaGt+9JsBf+uS8RAUjiRwaVVGAbzlP2kCf7
         pNoCKTPJp9y9+mVKCe7Qe4jcFUmA5v9ex5oFH25sxI/EF6bDBjUiONXMvXaELDyUps/v
         bTc27MDri8ANEdC3WkxbwS4rDel5tvxikjAYsf5L+Myhoin/s+nBURDUFvuC/JxOy5b7
         pNLy2XHBNoxIEFTa2+6F+TaRb0SLP01m3ZDaqscXlU3efqnbfwO6TstDmUhidY+a0FtF
         ACqjdDbf7GSHtYdNL1PTiMPn3ParoY/XQTZ3JbsRkRDHcJpn2s0n03LDkWIAGx4serYd
         1ITw==
X-Forwarded-Encrypted: i=1; AJvYcCVESeJxUMn7ufmDC3/KYgSEebt6oR4+DOOIfc9WQ3k9EU8r9pRvX8HUQ2e+e0D4BPQqWr0Dud/0Fwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbat7tYhRqTlcs+JYp6GfsGbAbke1wTx5ITSDVRGrVEDMRRXoH
	H0fjqjupglKV20huyFu5nPB0d3YwZ9z+ZLlyWH9J4tHd+mQDZyShUnkPpn0vcA==
X-Gm-Gg: ASbGnctcS6/iccy8d5mRufbSTEXnSz6Da4SyGHLrZiMOODoIlRUa0CSLV59EvjbvP+S
	UIzO+qztHQNpXrjJ/LLcqver/c/vUo2b+QSz94R6bfbH0+kLxksKxB7nzuswwAE8evNlkb70y2u
	wTM1YD2Bmb1rFrRiwVkSGx2OY6RntQKvp3Wf+0fgMHCDbDSTg1zeQhWnkO7v2EmbGh2/mVTa026
	pxffXFo+rFyw2P1/Bn1b9eb2VRcDW6XowM5602bK1Au7Hd9CbHWlUQQcYojGOlvOOi3lq438yhW
	kqGpiUf2NhrHo3AjFQXjHnsNr8hkhYp3JaTTtBclAivOQqh+b1fRskS3ugFwibibqog9BHRG7xo
	ql/CuTfrSet8Dv44Jc7HKFyLTgrOfMxtEaSTQ51Fe
X-Google-Smtp-Source: AGHT+IE4qDfwSqYhvUPsg20lVl1XLQvtK5/FUxQ6+XuocmM3vNJXioVZwwF3VMZ/LwjtMTKye2Ddqg==
X-Received: by 2002:a05:600c:c86:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43db61d1becmr114374365e9.11.1743512273987;
        Tue, 01 Apr 2025 05:57:53 -0700 (PDT)
Message-ID: <8f1df169-247e-4a15-8830-27ed47efd103@suse.com>
Date: Tue, 1 Apr 2025 14:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen: introduce hardware domain create flag
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
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-2-jason.andryuk@amd.com>
 <049a2acc-09a9-43b8-9937-960ce2b99fda@suse.com>
 <d2f986dc-db9c-43ab-9e46-702b4f94af31@amd.com>
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
In-Reply-To: <d2f986dc-db9c-43ab-9e46-702b4f94af31@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 14:39, Jason Andryuk wrote:
> On 2025-04-01 08:00, Jan Beulich wrote:
>> On 31.03.2025 23:43, Jason Andryuk wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -820,11 +820,15 @@ struct domain *domain_create(domid_t domid,
>>>       d->is_privileged = flags & CDF_privileged;
>>>   
>>>       /* Sort out our idea of is_hardware_domain(). */
>>> -    if ( domid == 0 || domid == hardware_domid )
>>> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
>>
>> Since it's || here ...
>>
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
>>>       }
>>
>> ... doesn't this code then also need to set CDF_hardware if it's unset
>> in the function argument?
> 
> I don't think it matters today - later construction depends on the value 
> of hardware_domain.  Which is also used for the check underlying 
> is_hardware_domain().
> 
> But I agree that it makes sense to set it here in case the use of 
> CDF_hardware expands in the future.

If we don't do this now, it'll be quite likely that it'll be forgotten
later. Hardly anyone actually tests late-hwdom these days, afaict. It
may also matter if someone looks at e.g. a dump of Xen after a crash.

Jan

