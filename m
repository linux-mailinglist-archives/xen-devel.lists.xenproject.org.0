Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9CB101DC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055330.1423745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqQt-0007g8-SA; Thu, 24 Jul 2025 07:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055330.1423745; Thu, 24 Jul 2025 07:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqQt-0007eF-P1; Thu, 24 Jul 2025 07:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1055330;
 Thu, 24 Jul 2025 07:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueqQt-0007e9-17
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:32:03 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a074e3d-6860-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:32:01 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so401175f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:32:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45870532b5asm8974835e9.5.2025.07.24.00.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 00:32:00 -0700 (PDT)
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
X-Inumbo-ID: 4a074e3d-6860-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753342321; x=1753947121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jQz8OwBR3OesvDMCiMkmmXehvfMiPg8AOZRNf0baFPk=;
        b=FaEL6fl90Z+sPuTlDis0BqqY1CubAJdWzOnTK2nfdYcL3/Wam2IdIKVaWUQl4uJe9u
         3amkAE0zyItBg2HVuf5yJ6DYAEP+Nexh/Py/cde4QFfcZLobOlVALK+2j/xLM2n8lztp
         J3mWKR6mioSz1Y4k3yI2XaI9kHhbxqzAZIk3aHahAxmtR3fa0ElIH6DhKSXrRikYykDz
         3LRQ2+jSEbvxs18zi+czEBH/T0PxFvrbC1QOaSPFeMsitnAGGy/tm6Xv7eL33TCRQX0D
         bhHIXmiz7CJ2ZIXGP34roSVNXc8GhjkzUMNRHV6EeCGgVAX1j1GWZumFW7eOQfODC954
         /XMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342321; x=1753947121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQz8OwBR3OesvDMCiMkmmXehvfMiPg8AOZRNf0baFPk=;
        b=Y3tjZgkMb2BECvwMY1GFHxZMSO0ycYKfpZCrte7SomPZcP97ANJEuiAL8TvWzUWzYq
         tvkIwNeNs+Sz01bT/GlUuOUOCSLkA5nACoJ1Iktu0IeFc5Q0ZdL4LD8qbtT8vnX658Ex
         Foe8CEyp6FPNoBMRPM7fr8+ZeXh1XZ7wwKeuMnG/pKmvQq0lzmCYEL3bNflLdB8DL+7n
         MKOulHv1AofFIipi0a7nse2/tSoN8J/2r8tRCyrEFI+GGMqLlvGCe5BQncPcC9v1DyLX
         FhPmLYbbkGBOZ2pKrdyfzKVBxyBuimamc+YCiPEYHURQ+8u9aur/9ntJ1pu+g491IYq2
         92Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUV+o+3PJ4tm52MiGP3w9wyzELYwluEKQ0m+9LG3O4oN/rX3VYVZ0p0Rf9fEHj0oDWlCcmtxdb6nMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLMladlHhIvOD0i7J6VssYOt2V0FcZQpHBW3syQitfd6XCQ23j
	eOg82Qv7S3ByFFzrZUUnBLzwOj622d/hIaFJh68J4hcDQR8s266n939o2g7cLzBzhg==
X-Gm-Gg: ASbGnctYw/cANX7zd0WZ5hw4JOZ/SBTuI9QmBNYI+n8NavsAgkvyZcFxZwoCt5WAvEA
	iZnZdpJA9lm4tFlzGKSQ+juSaURr+V5WR4wKUEBuwCGY+sX8tDXMJuLZSjCllGmwdJLULGJFBlL
	HCNSsMTYXLNaDizXz0/M4ovXHAh88FejW02VOCJs2Bhz0reYs2SQp/o7+/8Q+tOgzCYyEPBkpQM
	E3Njw2Rv0uHBPPRBxB4NOV30ZDAj9boprm8k1KQcCeWDEfDnjbIAdX8vHWBUGLoG6KihK0yx5el
	WsXeJii57rC4woAv5vtWgVJ46SPM3JOCjhissBlk9l35MQKLcAQdEm+/Lx9crdLFrsvyyNEIHVE
	uPzVg77MlAspIAr2jOMaWbfLp4/4Uoez92eafkLqG0/3v7OKytWDNSEbJW5mBBvSKflzkm5YAJ/
	t6l2aOfoY=
X-Google-Smtp-Source: AGHT+IExhBGwpZ026ZujCQssWoPaKsNBORzFnXSeFyTYdRF5DcYIog8Ykns1hF1a7hIX+C70mGlFGw==
X-Received: by 2002:a05:6000:22c3:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3b768ef96b0mr4690969f8f.24.1753342321116;
        Thu, 24 Jul 2025 00:32:01 -0700 (PDT)
Message-ID: <89b615e1-3ed4-4cc9-9222-4149b5a27e2e@suse.com>
Date: Thu, 24 Jul 2025 09:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: move getdomaininfo() to domain.c
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250722050410.853783-1-Penny.Zheng@amd.com>
 <0939219f-1c06-4d0d-a427-6b95b5943513@suse.com>
 <alpine.DEB.2.22.394.2507221738090.7043@ubuntu-linux-20-04-desktop>
 <f75df6d6-ede6-41a6-9412-1a9b073902b5@suse.com>
 <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507231327280.7043@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 22:30, Stefano Stabellini wrote:
> On Wed, 23 Jul 2025, Jan Beulich wrote:
>> On 23.07.2025 02:46, Stefano Stabellini wrote:
>>> On Tue, 22 Jul 2025, Jan Beulich wrote:
>>>> On 22.07.2025 07:04, Penny Zheng wrote:
>>>>> Function getdomaininfo() is not only invoked by domctl-op, but also sysctl-op,
>>>>> so it shall better live in domain.c, rather than domctl.c. Which is also
>>>>> applied for arch_get_domain_info(). Style corrections shall be applied at
>>>>> the same time while moving these functions, such as converting u64 to
>>>>> uint64_t.
>>>>>
>>>>> The movement could also fix CI error of a randconfig picking both SYSCTL=y
>>>>> and PV_SHIM_EXCLUSIVE=y results in sysctl.c being built, but domctl.c not
>>>>> being built, which leaves getdomaininfo() undefined, causing linking to fail.
>>>>>
>>>>> Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
>>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>>>
>>>> I'm not convinced of this approach. In the longer run this would mean wrapping
>>>> everything you move in "#if defined(CONFIG_SYSCTL) || defined(CONFIG_DOMCTL)",
>>>> which I consider undesirable. Without DOMCTL, the usefulness of
>>>> XEN_SYSCTL_getdomaininfolist is at least questionable. Therefore adding more
>>>> isolated "#ifdef CONFIG_DOMCTL" just there may be an option. Similarly, as
>>>> mentioned on the other thread, having SYSCTL depend on DOMCTL is an approach
>>>> which imo wants at least considering. And there surely are further options.
>>>>
>>>> As indicated elsewhere, my preference goes towards reverting the final one or
>>>> two patches of that series. They can be re-applied once the dependencies were
>>>> properly sorted, which may (as per above) involve properly introducing a
>>>> DOMCTL Kconfig setting first.
>>>
>>> I don't think this is a good idea.
>>
>> And implicitly you say that what I put under question in the first paragraph
>> is a good way forward?
> 
> I think it is OK.
> 
> I also think "having SYSCTL depend on DOMCTL" is certainly worth
> thinking about. In terms of privilege and potential for interference
> with other domains sysctl and domctl don't seem different so it is
> unlikely one would want to disable one but not the other.
> 
> Another idea is to have a single kconfig for both SYSCTL and DOMCTL: we
> don't necessarily need to offer individual kconfig for every feature.
> From a safety point of view, we want to disable them both.

Then again (and going against the thought of making SYSCTL depend on DOMCTL)
there may be a desire to query / alter certain properties of the system as
a whole, without also having that need for individual domains. But yes,
covering both with a single control also is an option to consider.

Jan

