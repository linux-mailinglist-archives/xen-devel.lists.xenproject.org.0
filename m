Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FACEAF5C81
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031368.1405184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzC4-0003eQ-01; Wed, 02 Jul 2025 15:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031368.1405184; Wed, 02 Jul 2025 15:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzC3-0003dO-T9; Wed, 02 Jul 2025 15:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1031368;
 Wed, 02 Jul 2025 15:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWzC2-0003dH-Fx
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:16:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 762b3dd0-5757-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:16:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a522224582so3690949f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 08:16:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b7abdsm138404255ad.169.2025.07.02.08.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 08:15:59 -0700 (PDT)
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
X-Inumbo-ID: 762b3dd0-5757-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751469360; x=1752074160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb/Z5N52z9ROFWFSUeCpLnrUHoWnEkVHHV5PMlEB/YQ=;
        b=CK/3+e9LtZ/I8JEuEnJ58BIPzMRKiDyGP4taDks5hTp8vMl0SEwAlfzW2ehWwhuXdb
         mvNcRdyJHRpWgbl4BR6tEqbMCibWkTmCvHDQL/3zxTMbAZ+AaXYOxEoJ3bSsDfVGahzZ
         TAcxuvtrUbgsoMyYJW0kBImq4B2QGjMiEBQzMyQ4GAxXNWDEnUZM9gUTgF9ey8KWtTia
         Fn3R81Pd2HPUU+sCA/aWqINaM15IEeBKx+6aY5/mf7F9QiZ3hCqC25w5Jpl7hh0iJ6lr
         /f8HyZc9b9J5RaZz0d/p0rog3W0WzGlPJACLeSW5oq/5VK5h1TL/UvLgBWPa9x5egHz8
         9ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751469360; x=1752074160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb/Z5N52z9ROFWFSUeCpLnrUHoWnEkVHHV5PMlEB/YQ=;
        b=Qmjb4PF5xWExnieIAQPa2RpEzAkA207nOsKo9o3XPph5aZUB+lN4XUoG9/R0QtDYnm
         sb6dFJ9Z/6sNrCs/JG2htEmfzD57IvaeEoLGR1FQp/EvDHRLd4LyHz1YUppy9xpNH7bv
         yuDYKbcdOqO+wSSBfXlZ31HJ5f3IrjSi6cW/ow8Je+3p3NHmPqv/292GUB9OsIegZl19
         sQ6gKBZH2eCePkh3YAvQQs9gJISK5KHMAyrPuz/mmN5BV/DfqAzjombURXQFQQO22LR0
         gSvzrckqDJQvDwYSHnFVFy48xNE39cVLbgV49RJKTQG87HEAZZRl3Lakg46gvF1cUdoV
         H9BA==
X-Forwarded-Encrypted: i=1; AJvYcCWER13gA2czAOy+MT2zkmK0upQUCfLCuH20itUJUfSZ3kCWVYk60oOGEqWYQC5w63YPONAtzZXTrp8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz46VqISlH0VeaN4+8sT+HtMZRaA8rtVWsvwDLTMYt1S6qOCww9
	Ku2idTNvorlyNy3GsS7ynpGYNMWP2KO13NUq12DtMgu3tw2Ohv85EiBIYRY7ZOZU/Q==
X-Gm-Gg: ASbGnctrUaVzMR/6uOo/uy2bWAYHFRXdMdIVwVhdFUB1QeS4YUf8bHfBFbsEZWYUQlE
	W3ESM6rjdN+NSbAOWgF1as/wwD1bmGqw4iiy4pmEt+tSMk4blqtJBA6NmB+tF1W3D4UsgtBglsS
	+Wj5Ia5mOKPGUATlYAVueGeR0C0f748dGCYwyJJ/BR37wg9pMZ3nxXCKC6aLsCME9TGPo/x5Fky
	zYy2c4dG0HSInCtmVzPZSl9qwqfzcd0nZV5FuS7AsQbqctNbhaRyGk1/D1UC5LJeSviUR78O4KU
	78uPayY8QMAdx4LATo2Y+4Mm9G9OYHD5LUNELuOTWrH+Oq0KT2xzkIDMqTfv/gfakirJ/QavuQi
	VaF8K/3FUDyxjOB63dSm9jyLMI+W5IoFOuP3jVIb0VTAInSd1XF6owYW4TA==
X-Google-Smtp-Source: AGHT+IFzKZd89svO3zVqoL2IhCTY/9M6FrtNlAGZs62nTRFRfxcauSjZ6oi9HGQO9rrgXvb0JH6M6A==
X-Received: by 2002:a5d:5f83:0:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3b200f2156emr2900431f8f.47.1751469359903;
        Wed, 02 Jul 2025 08:15:59 -0700 (PDT)
Message-ID: <2a7dab07-9e52-4d4a-a80d-99229c9fe093@suse.com>
Date: Wed, 2 Jul 2025 17:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with the
 common one
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
 <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
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
In-Reply-To: <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 17:09, Alejandro Vallejo wrote:
> On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/include/asm/bootfdt.h
>>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>>> @@ -3,6 +3,12 @@
>>>  #define X86_BOOTFDT_H
>>>  
>>>  #include <xen/types.h>
>>> +#include <public/xen.h>
>>> +
>>> +struct arch_boot_domain
>>> +{
>>> +    domid_t domid;
>>> +};
>>>  
>>>  struct arch_boot_module
>>>  {
>>> [...]
>>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>>  
>>>      /* Create initial domain.  Not d0 for pvshim. */
>>> -    bd->domid = get_initial_domain_id();
>>> -    d = domain_create(bd->domid, &dom0_cfg,
>>> +    bd->arch.domid = get_initial_domain_id();
>>> +    d = domain_create(bd->arch.domid, &dom0_cfg,
>>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>>      if ( IS_ERR(d) )
>>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>>
>> This being the only place where the (now) arch-specific field is used, why
>> does it exist? A local variable would do? And if it's needed for
>> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
>> arch-specific? Daniel, Jason?
> 
> As for the arch-agnostic side of things, arm needs some extra work to be
> able to do it safely. dom0less currently constructs domains immediately after
> parsing them, which is problematic for cases where some domains have the prop
> and others don't. The domid allocation strategy may preclude further otherwise
> good domains from being created just because their domid was stolen by a domain
> that didn't actually care about which domid it got.
> 
> It'll eventually want to leave the arch-specific area, but I don't want to do
> that work now.

But if the domU field is fine to live in a common struct despite being unused
on x86, why can't the domid field live in a common struct too, despite being
unused on non-x86? Otherwise it'll be extra churn for no gain to later move it
there.

Jan

