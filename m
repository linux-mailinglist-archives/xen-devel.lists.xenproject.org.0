Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35041B393B3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097526.1451809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVwz-0001Ci-Fv; Thu, 28 Aug 2025 06:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097526.1451809; Thu, 28 Aug 2025 06:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urVwz-0001An-DF; Thu, 28 Aug 2025 06:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1097526;
 Thu, 28 Aug 2025 06:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urVwx-0001Ag-V4
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:17:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc83b06-83d6-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:17:29 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so71104766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 23:17:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe9494b011sm641567766b.39.2025.08.27.23.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 23:17:28 -0700 (PDT)
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
X-Inumbo-ID: acc83b06-83d6-11f0-ae26-e363de0e7a9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756361849; x=1756966649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iGT0GH6uxLc9Avte45xwvNZ7VhIMt12PaOFame/Au3U=;
        b=IVVZZhzq/Li0gciLahsxOT1UrDCUpVv55i2b9rQZfJfoAg4TOIFNdvkewGJOjSJKe6
         pP2za+bJEkgVZHT8VSiLtdTDCPeGJDcVTSHKxdDFMhlIuPtz56LVaed9cOmAcL6Y684X
         kD50/2ySLXjg1Ffz0khN+KuNvdYry4Q3a0MCG2q9oCfCIYPZ8EWbZOEDu2TgUElpiCiH
         Ay9XziyPXc4YqBqJJ5bhB/V9oKbtJ930nk+1HQEsTnQITye7nq/KhmuxcFfqk6fMrDIU
         XleYB8l0/K5IBF63GsHAcz75ovBm1vpuUA8uNy/28NSJuXAtRrSaUpL0zy98GAU8hi+Y
         DVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756361849; x=1756966649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGT0GH6uxLc9Avte45xwvNZ7VhIMt12PaOFame/Au3U=;
        b=EGzjqRRsHjLpA5zRimdp4IhCxge2My2UJOEDa5xT9Riq5dZg+Sl+67UR1P6O7V0l43
         n5AvpQPzmX/PFJVzKczrmk75VfBrSqotam7xzfjMuAar0pFT2d1WFKJsk9KxqF6w+vzs
         t3NQ9UnN/ADvy5/uoSQoaXjj2LUbwOkSN9DolvVKRuY55awP2oBV9A2CTbz2L9yqQ04Q
         tAWKHBYzNOrqGbxsI4pirzyI/bVa0c68yOMbCwm3PcApvYh6toPrJch0zJgNUH8KdvJk
         fSAsz7jPhwM1kuizUFYBLhZucfC1WUOVkUSNyYq5AOMMV06ngouVaffdDB1DAp0jyyxE
         fjNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIb3yknsgfAl7KJnh90VJawxa0psiM/5VZIfcKktKEYlS9HMB668VGuZOAOTKKa0oDe/wmSW2y4Rw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHV8H7+Tc5ghhgG3YExM0ScTI92SgJ1Pwj5FwroPaMv2kdLMqO
	+cIBb8UMwlB+xDpYOQbuaSJ0pqJwo3fpxFLWrwdeUcfChtrocVJq3XtPRH/VIJFTXA==
X-Gm-Gg: ASbGnctYWmQxc7bBBB08kH13tcPWMZ9OE+hKNpKPkIX7KPsUq4yheciJ/4M85bMqPHm
	0OReQeikZyAwvbwUzlPksTBVw7rCatw541XfSF5zDsNRX5TwhbLQ2yLPC9r0jOlgbObGO6u9lqf
	JBqKDw4hW0PLDTMBTpZK65gvxXcbW/p0UkMwry6LBnfFtMqBxgUdyLYUGUMNW7FRXC6rkfgIPLJ
	0mDXpdRMUUS+UxN2ALglJp4dcy/682t0oKNMvZBuSbxgox8ZV+SUsfQgumrkYtDyxsyZyOQIblT
	bvq2m3Gk6z7OXZlHbUzzrkZaxIzXqvqiu2bX5ec0BZmldIB+c5d8BTvxIS0Eu7CHQz4GtlIqHyE
	k6EW151UCFFbNhPvvNWOZNeaI7tp4UxvBTf7EFrW5LzmE+4Nz9rhRHcZWO4eYkCGfy5Qqj1CEzk
	VrWBxyvZzTD0IchvbGNw==
X-Google-Smtp-Source: AGHT+IEDJHuI3aMjFbiFbMzEXWDGD3i5k0Bi11AkQ83+lxaZ5Qx9ZlW7NYdZKGTnQ13/Dw0rDNVRBw==
X-Received: by 2002:a17:907:8689:b0:aec:5478:9697 with SMTP id a640c23a62f3a-afe29046f2dmr1942443166b.34.1756361848853;
        Wed, 27 Aug 2025 23:17:28 -0700 (PDT)
Message-ID: <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com>
Date: Thu, 28 Aug 2025 08:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
 <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com>
 <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com>
 <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com>
 <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
 <cc8724b6-bb31-4482-a459-156366b7b433@suse.com>
 <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508271442410.580734@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 02:52, Stefano Stabellini wrote:
> On Wed, 27 Aug 2025, Jan Beulich wrote:
>> On 27.08.2025 02:33, Stefano Stabellini wrote:
>>> So I ran a test and the appended change, which is based on [1] and
>>> renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
>>> build issue.
>>>
>>> For 4.21, I suggest we go with two patches:
>>> 1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
>>> 2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS
>>>
>>> Jan, are you OK with this?
>>
>> Naming if the option aside, no, I fear I dislike the stubbing. What's
>> worse though, ...
>>
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
>>>  
>>>  int arch_vcpu_reset(struct vcpu *v);
>>>  
>>> +#ifdef CONFIG_SYSCTL
>>>  bool domctl_lock_acquire(void);
>>>  void domctl_lock_release(void);
>>> +#else
>>> +static inline bool domctl_lock_acquire(void)
>>> +{
>>> +    return false;
>>
>> ... this will break x86'es HVM_PARAM_IDENT_PT handling. That is, in
>> principle I would agree that returning false here is appropriate. But
>> for the specific case there it's wrong.
> 
> Uhm, that is a good point actually. And while in principle "false"
> sounds appropriate, in practice there is no domctl.c to worry about
> concurrency so "true" is what we want.

Except that, as said, conceptually "true" is the wrong value to use in
such a stub.

>> As said on the call yesterday, until what you call MGMT_HYPERCALLS is
>> completely done, the option needs to be prompt-less, always-on.
> 
> I do not think this is a good idea, because we would be unable to test
> the configuration. Although we have been accepting code without tests,
> that is not a good principle. At least with the current approach we can
> run manual tests if automated tests are not available. If we make it
> silent, we risk introducing broken code, or code soon-to-become broken.
> 
> In my view, we need to make gradual progress toward the goal. In this
> case, we should move incrementally toward compiling out all the
> "management" hypercalls. Also the alternative of waiting until all
> patches are ready before committing them is not feasible. An incremental
> approach reduces risk, preserves testability, and makes regressions
> easier to identify.

If that's your view, then why did you not comment on the SYSCTL series,
when I asked the prompt to appear last?

> An extreme example is that I could write:
> 
> static inline bool domctl_lock_acquire(void)
> {
>     obviously broken
> }
> 
> and no tests would catch it.

Tests would catch it at the point the prompt is added. Much like it was
with the SYSCTL series (and why, with the prompt removed, the rest of
the series can stay in).

>> Adding
>> a prompt was necessary to be the last thing on the SYSCTL series, and
>> it'll need to be last on the follow-on one masking out further
>> hypercalls. IOW my take is that 34317c508294 and 568f806cba4c will
>> need reverting (the latter being what caused the regression, and the
>> former depending on the latter), to allow to cleanly continue that
>> work after the rename. If we don't do the reverts now (and take either
>> Penny's patch or what you propose), imo we'll need to do them later.
>> Else we're risking to introduce new randconfig breakages while the
>> further conversion work is ongoing.
> 
> My suggestion remains to go forward with 2 patches:
> 0) keep both 568f806cba4c and 34317c508294
> 1) rename CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
> 2) this patch with return true from domctl_lock_acquire
> 
> I am open to reverting 568f806cba4c but I don't think it would improve
> things. I definitely don't think we should revert 34317c508294. We need
> 34317c508294 otherwise this patch doesn't fix the build.

If "this patch" is the one outlined here, then with the reverts we wouldn't
need it at all. The reverts alone will fix the build issue, according to my
understanding.

Jan

