Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26150AD2E24
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 08:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010510.1388618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsrE-0008SA-8g; Tue, 10 Jun 2025 06:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010510.1388618; Tue, 10 Jun 2025 06:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOsrE-0008Q4-5U; Tue, 10 Jun 2025 06:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1010510;
 Tue, 10 Jun 2025 06:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOsrC-0008Py-UZ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 06:53:14 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945d98be-45c7-11f0-a305-13f23c93f187;
 Tue, 10 Jun 2025 08:53:14 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso47235415e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jun 2025 23:53:14 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f07dsm11558364f8f.79.2025.06.09.23.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 23:53:13 -0700 (PDT)
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
X-Inumbo-ID: 945d98be-45c7-11f0-a305-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749538393; x=1750143193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SfvW4Xlh/9Vx6YPL9vMgWdJg+jlNLW7lnjHTKilal9M=;
        b=G2RNDD/eDU6qnBRBKDkycS1RoqV5OCY4KB9BA66dZwM+H0sAp1QnMgS5tT4OuSdiFA
         D5JaHjO22T4VfpBGbpY/dIX2MOmmb2aKrRIinAl/hoKJL5U+qinDild8aid4OuGVoh3E
         YKTzQlDVdGbiekBWwOh0gwIWFkZu8Wj/zz9sw/aFEVa/qJ57mDTYoKIVJ0Mp44wL+OgK
         zDyScvMwwOnIqs2wD0KH78KkgW3kwNlz1BaM6VgYQVUNzate7IWdEAhhtbXmJUDZEH55
         CQQgjGtEUiYuY+iQDfpOTvCDXhwKiSLk8guMoWSRZUiwVyDrBrkPJjzhoR93+euuubIs
         YW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538393; x=1750143193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfvW4Xlh/9Vx6YPL9vMgWdJg+jlNLW7lnjHTKilal9M=;
        b=FSLOvbn6OvHj1I/SRGYnJ8SFmygEuDSrhvCnmnxA0XMSYCJwmxDvRjeMifgpxSjNuU
         yGRVoQyzRBbw/0ZIINTdLgMg2HE00KCJTHeBaE4sKDL0pNlYY+zsolzfLj6OJ3om9nVy
         1I0DDB3F2ecwW8RD5KNaPbxxsQ3bWlYaWndKYQCv0m/x/qO+MU52rXh1DshtYX/1+fct
         a+hcH/X4i87vGhdok1wBrjFsRjaY2d8BPvPG1uVflzZNz6vb/F7ywSxtDDiKV2+21A+c
         GDWgVmpWWqRlsj3AqSmBBe+nzD0A3QCBevbyOgm8w0kNAa3LHb1z9W432h2puWd/pWq4
         cKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHiazW4+v/juF9SbtOOZfDyK1hPIaTj+pB8qVTdy8O4imjnMiEkXgfy3J2tMMJnk6ypABORuSS7d0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1oe8YWneZ4tT/2gNkMN4K2nXZJsfopaEDTow00b+Xei3sId5o
	vNzlAsWrWZWExPIBk6yxFOcYN60gzs1nkzXYJ17t9g9da7pS5BNa9y+dlMFS4P0w+w==
X-Gm-Gg: ASbGncvYDR7dUwVpikAfV2kZwvqR9rqv/9GQNYLcI/M1M5KqAZIzLrWqbXeAElBQ4Sv
	NsNCF+7hhvwStKvGMw48LGZT8RUAuRqFccSS3ZqkZ7lr53S0p8GTI6wDtYwGZCKMpc1BC/1ppPk
	/hQHVi2VLUkPsK1b4kOC+B092om7nzCYe12uDwFRAZm/GSL++4+HO2uiB4LK65AeSnkAeoWv49N
	K5rrf0r4JdMX34T6QLkulKyCMjouocuIvuzgtXP5EVjAp3fe4sc0xoVaphtCZqWoarKtGrbjzq4
	raoVYDtZrPsSwPSW2JFzLRLpkeGB8rI+mitTWRztxgb0tpR3tpcmazH7Cl7tcb0rNM0m5OV8KO9
	0bjAixHhRhYopY1kJ+9JtOqnpktzP7V2qlzC/WscWZP1qN6qzVXWmYEvys1Jm2Mpz0P7yjDmk2j
	D3y5meeCzy9FtnMSLE1JIG
X-Google-Smtp-Source: AGHT+IFDHi+S1Yhxpm0uC7t6pV9GvEVh/xV66TGSImK1BpM9n/sDudrJwujBC62Qa9UqNeHAEFqqRg==
X-Received: by 2002:a05:600c:154c:b0:453:b44:eb69 with SMTP id 5b1f17b1804b1-4530b44f1acmr68227515e9.13.1749538393374;
        Mon, 09 Jun 2025 23:53:13 -0700 (PDT)
Message-ID: <30c01c78-5a5e-435f-9b1c-faca3af04a76@suse.com>
Date: Tue, 10 Jun 2025 08:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
To: Julien Grall <julien@xen.org>, dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
 <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
 <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
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
In-Reply-To: <a4c860d7-1fa0-43f4-8ae1-af59b7c6506f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2025 23:29, Julien Grall wrote:
> Hi Denis,
> 
> On 05/06/2025 23:05, Julien Grall wrote:
>> Hi Denis,
>>
>> On 28/05/2025 23:50, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmkhn@proton.me>
>>>
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Remove the hardcoded domain ID 0 allocation for hardware domain and replace it
>>> with a call to get_initial_domain_id() (returns the value of hardware_domid on
>>> Arm).
>>
>> I am not entirely why this is done. Are you intending to pass a different domain ID? If so...
>>
>>>
>>> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id()
>>> ID is skipped during domain ID allocation to cover domU case in dom0less
>>> configuration. That also fixes a potential issue with re-using ID#0 for domUs
>>> when get_initial_domain_id() returns non-zero.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v8:
>>> - rebased
>>> ---
>>>   xen/arch/arm/domain_build.c             | 4 ++--
>>>   xen/common/device-tree/dom0less-build.c | 9 +++------
>>>   xen/common/domain.c                     | 4 ++--
>>>   3 files changed, 7 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index e9d563c269..0ad80b020a 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)
>>
>> ... naming like create_dom0() probably wants to be renamed.
>>
>> That said, I am not convinced a domain other than 0 should have full privilege by default. So I would argue it should stay as ...
>>
>>>       if ( !llc_coloring_enabled )
>>>           flags |= CDF_directmap;
>>> -    domid = domid_alloc(0);
>>> +    domid = domid_alloc(get_initial_domain_id());
>>
>> ... 0.
> 
> Looking at the implementation of get_initial_domain_id(), I noticed the behavior was changed for x86 by [1].
> 
> Before, get_initial_domain_id() was returning 0 except for the PV shim.
> But now, it would could return the domain ID specified on the command line (via hardware_dom).
> 
> From my understanding, the goal of the command line was to create the hardware domain *after* boot. So initially we create dom0 and then initialize the hardware domain. With the patch below, this has changed.
> 
> However, from the commit message, I don't understand why. It seems like we broke late hwdom?
> 
> For instance, late_hwdom_init() has the following assert:
> 
>     dom0 = rcu_lock_domain_by_id(0);
>     ASSERT(dom0 != NULL);
> 
> Jan, I saw you were involved in the review of the series. Any idea why this was changed?

I simply overlooked this aspect when looking at the change. You're right, things
were broken there. Unless a simple and clean fix can be made relatively soon, I
think this simply needs reverting (which may mean to revert any later commits
that depend on that). I can't help noting that in this console rework there were
way too many issues, and I fear more than just this one may have slipped
through. I therefore wonder whether taken as a whole this was/is worth both the
submitter's and all the reviewers' time.

Jan

> [1] https://lore.kernel.org/all/20250306075819.154361-1-dmkhn@proton.me/
> 


