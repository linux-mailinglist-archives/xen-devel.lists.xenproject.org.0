Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A633B3B438
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100717.1454049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtWU-0002YE-Mk; Fri, 29 Aug 2025 07:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100717.1454049; Fri, 29 Aug 2025 07:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtWU-0002WW-K7; Fri, 29 Aug 2025 07:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1100717;
 Fri, 29 Aug 2025 07:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urtWS-0002F8-Ea
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:27:44 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74ad251-84a9-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:27:44 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b793d21so2260069a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:27:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbbd1sm1271860a12.34.2025.08.29.00.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 00:27:42 -0700 (PDT)
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
X-Inumbo-ID: a74ad251-84a9-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756452463; x=1757057263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wT4+tbh3hnCrTgNUHjzogDJ0KlBuJ96eRsuoPBIr29A=;
        b=U/gQ6gZ+CZtg6Bl60hooy5rHydbn01Zc+jb8fuyoeFfy1VHkrzW0LA7pyuaSuU0qtf
         4x0o+n7Sw29xa0X4KJ5GZ0xBMEN9+yxhQfr/KMOw0NRyh2shi2utXq9laOlDrCwnJnWE
         PXY8UKmFOfCii7MV08n5kiq5oRK5EinZN+zExcYd1JMyH34EcYXKcLpMwgnOKveuUMWe
         CrfYhbj6S+joTbEBX2Pq9b1T1xEk7fMKPsIcJK4MBabbjuyw3yyTHcE+r2m7I9gmInVZ
         3/1JROKqLm+yIpC8SDsovQVnx7VNWyHehWU3u4y6RFv4HzZSZZV4Mryp151GUAIWwFkG
         GpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756452463; x=1757057263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT4+tbh3hnCrTgNUHjzogDJ0KlBuJ96eRsuoPBIr29A=;
        b=jr2Eh3EHx2bFMKVGbiVE3KmEl4qQuT8GQ+2bRIa4KBW8MhndLND2k+6YFhhWSeflBt
         FC+KiSVh0lZHdJLiVT1+/q0UL7XT9aE43Vf/s0ciaZFrFr1nsCoGeB+JmNKg4EDrSQlo
         UbEk5ty6bKkSnMfAgzSv24SvupY4xvpB3p3NSJVYo4t7TuOqj3ss9onEEZ3Tft79WXg9
         dlXP6hKHk1RqtePf9cn4GOEaie2GQDMO08H5MZKiKhQK+beUdz+KtXp4QGAdjZaNeJtL
         bDtMhWmbgLzLPDXrLD4VdG5LYQMRdY/Kpcb/mDEnMhDLB4P8Hgzltw3V9L8vTOJ8b5f3
         jO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPFCYdmPiNuhKsbEPEp3b9zrI2ZgQ3dY7bJYcJRLgNmV7XOufo7KGxvqkpeBGbxD3bvoVJBcmPqYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwV9ETswQ5U47r4We7YrQNg+l2j4+8m9uucOaOGuOkDIn/VDkXX
	iNhxpmBXESKnUWWYtg8eQzHwRXGqs6bW4xVHT1kXePDojY/pHSMksjXbuBmzLPFUrQ==
X-Gm-Gg: ASbGncs8IAo1XQk+pwawg3WedxST2mDRWt+fyiYnsQOmgwUNluJPMn+Aoz/397y5GNi
	yYqXQwgbyo4KR/LuA6zRrhacOjBPOKrXvRVdo8nwAUsh3XRTgvuFVQLqG29XOgolu1cwX6nDkOQ
	k9gl0OLWG6OdtkMnvxxHcXnOiCaNzISNDfV5vMkZcbDsL8zEkQRuWarpWIJxNq7ISTQeYtowaZI
	dSSSWiPre65qRdP56BMPgbnaFQ33HktRZrjaJU4EFV8JFCblHET6FSRtQGNZilaifcja7psW1Jp
	sLd4ZAObT2AR3D1iZQ2HC9pjHImNbItYVt5TvvtNLRbTWk+YutAV0k4vD+2sDQk9BY0vvLBNABV
	rSUklESrYYi1Ine8hYjL1VN06NoQY73Cl1apSitRhduIg5GMUqfp5T0gAFIXV1ETSOnE7SxiMOD
	abWH/LZAXp3BtofWKF4A==
X-Google-Smtp-Source: AGHT+IEZRLsseeSPQ82ONMm1DkesSe7zmP6HGlpKTI8zKqMr32rgEvI7THfta1HJcyuUJwz9RUuRQw==
X-Received: by 2002:a05:6402:52cb:b0:61c:fa7d:a4d6 with SMTP id 4fb4d7f45d1cf-61cfa7da95bmr2358733a12.24.1756452463217;
        Fri, 29 Aug 2025 00:27:43 -0700 (PDT)
Message-ID: <dfadb4d5-cbf9-4b99-b389-34cb290a2229@suse.com>
Date: Fri, 29 Aug 2025 09:27:41 +0200
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
 <5f5ba1dd-1252-4740-8c64-e4fcd8a7ac32@suse.com>
 <alpine.DEB.2.22.394.2508281632020.8757@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508281632020.8757@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 01:41, Stefano Stabellini wrote:
> On Thu, 28 Aug 2025, Jan Beulich wrote:
>> On 28.08.2025 02:52, Stefano Stabellini wrote:
>>> On Wed, 27 Aug 2025, Jan Beulich wrote:
>>>> On 27.08.2025 02:33, Stefano Stabellini wrote:
>>>>> --- a/xen/include/xen/domain.h
>>>>> +++ b/xen/include/xen/domain.h
>>>>> @@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
>>>>>  
>>>>>  int arch_vcpu_reset(struct vcpu *v);
>>>>>  
>>>>> +#ifdef CONFIG_SYSCTL
>>>>>  bool domctl_lock_acquire(void);
>>>>>  void domctl_lock_release(void);
>>>>> +#else
>>>>> +static inline bool domctl_lock_acquire(void)
>>>>> +{
>>>>> +    return false;
>>>>
>>>> ... this will break x86'es HVM_PARAM_IDENT_PT handling. That is, in
>>>> principle I would agree that returning false here is appropriate. But
>>>> for the specific case there it's wrong.
>>>
>>> Uhm, that is a good point actually. And while in principle "false"
>>> sounds appropriate, in practice there is no domctl.c to worry about
>>> concurrency so "true" is what we want.
>>
>> Except that, as said, conceptually "true" is the wrong value to use in
>> such a stub.
>>
>>>> As said on the call yesterday, until what you call MGMT_HYPERCALLS is
>>>> completely done, the option needs to be prompt-less, always-on.
>>>
>>> I do not think this is a good idea, because we would be unable to test
>>> the configuration. Although we have been accepting code without tests,
>>> that is not a good principle. At least with the current approach we can
>>> run manual tests if automated tests are not available. If we make it
>>> silent, we risk introducing broken code, or code soon-to-become broken.
>>>
>>> In my view, we need to make gradual progress toward the goal. In this
>>> case, we should move incrementally toward compiling out all the
>>> "management" hypercalls. Also the alternative of waiting until all
>>> patches are ready before committing them is not feasible. An incremental
>>> approach reduces risk, preserves testability, and makes regressions
>>> easier to identify.
>>
>> If that's your view, then why did you not comment on the SYSCTL series,
>> when I asked the prompt to appear last?
> 
> I am not trying to be obtuse, but I am not sure what you mean by this.
> In any case, I do not recall reading a specific email on this topic. I
> try my best to follow other review comments, but I may have overlooked
> this one.

Originally Penny introduced the option with prompt, very early in the
series. It became clear very quickly that this way she introduced
randconfig issues, for the case where randconfig could have chosen to
turn the option off. Hence why I asked that the option be introduced
prompt-less, then all #ifdef-ary be added, and then the option would
gain a prompt.

>>> An extreme example is that I could write:
>>>
>>> static inline bool domctl_lock_acquire(void)
>>> {
>>>     obviously broken
>>> }
>>>
>>> and no tests would catch it.
>>
>> Tests would catch it at the point the prompt is added. Much like it was
>> with the SYSCTL series (and why, with the prompt removed, the rest of
>> the series can stay in).
> 
> In my opinion, this is a no-go. The code must function correctly, and
> that is my top priority, certainly above conceptual issues, such as the
> return value of domctl_lock_acquire. With your suggestion, there is no
> guarantee the code works and there is no way to test it.

The code working correctly will be tested at the point the option gains
the prompt.

>>>> Adding
>>>> a prompt was necessary to be the last thing on the SYSCTL series, and
>>>> it'll need to be last on the follow-on one masking out further
>>>> hypercalls. IOW my take is that 34317c508294 and 568f806cba4c will
>>>> need reverting (the latter being what caused the regression, and the
>>>> former depending on the latter), to allow to cleanly continue that
>>>> work after the rename. If we don't do the reverts now (and take either
>>>> Penny's patch or what you propose), imo we'll need to do them later.
>>>> Else we're risking to introduce new randconfig breakages while the
>>>> further conversion work is ongoing.
>>>
>>> My suggestion remains to go forward with 2 patches:
>>> 0) keep both 568f806cba4c and 34317c508294
>>> 1) rename CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
>>> 2) this patch with return true from domctl_lock_acquire
>>>
>>> I am open to reverting 568f806cba4c but I don't think it would improve
>>> things. I definitely don't think we should revert 34317c508294. We need
>>> 34317c508294 otherwise this patch doesn't fix the build.
>>
>> If "this patch" is the one outlined here, then with the reverts we wouldn't
>> need it at all. The reverts alone will fix the build issue, according to my
>> understanding.
> 
> The reverts you are suggesting do not fix the issue; they only hide it.
> The Kconfig option can no longer be disabled, which renders the entire
> patch series ineffective.

Yes, hence why we wouldn't need a revert of the entire series.

Jan

