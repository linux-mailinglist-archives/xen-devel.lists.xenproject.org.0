Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA8A64752
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916401.1321511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6nD-0002wz-PT; Mon, 17 Mar 2025 09:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916401.1321511; Mon, 17 Mar 2025 09:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6nD-0002uT-Me; Mon, 17 Mar 2025 09:29:55 +0000
Received: by outflank-mailman (input) for mailman id 916401;
 Mon, 17 Mar 2025 09:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu6nD-0002LT-08
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:29:55 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b078c7-0312-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 10:29:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso12477455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:29:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df339asm14191210f8f.3.2025.03.17.02.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:29:52 -0700 (PDT)
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
X-Inumbo-ID: 61b078c7-0312-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742203792; x=1742808592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2piYgSeDKuwGsdvn8urJApsPYVNu0fy+ikgriBNEfV4=;
        b=KrlqIKq9WxMHsk6xD12eQaa2sqOx1x2dPxDiGVk3A+Z1fM73IGKBwinvF/sCCMGJxF
         UGLCVDhoQdfmrVdpSebN/RsBtISU3UL1ZPMG7l28yBhrUnDCUxFyZHrRVpY67b5VrR+o
         oGNhYbVQg22yviHnXhGfb1vf2/Gw3zAEaG6/lqvIXzZru9ICTJcAxDF0G/FUmNkQ0bXP
         mfAwgyHVOts6VdloM9udwfKuV6iBGiVfHDRO5SC5S98gbDCjg7y7hIVyBT4NXFYvyamJ
         aRZRxrezRuqwoo6iIJTFY+s7lOFqRHPfNCVAiPT0acdUgYOaY7LxxENlbJWIg8tUJn7C
         7MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203792; x=1742808592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2piYgSeDKuwGsdvn8urJApsPYVNu0fy+ikgriBNEfV4=;
        b=ExoEfWvnMsDgZIa5i1S2+DCd7H7bV/A+5k8aIjV7M61YDXhG715zxMD9+s1f82egBR
         RASspBH06CKkfP2z9Ccoocfd6dLp8PYKDNzl1T3cwhEYyIThE43iqMavnYtKOo/oXNM0
         H6JdhfSO7Id4v3ggaS474XOhpFY6D9unNX5Z/f1eBYzmdkGbO+FT0BeMudxqoUUfEl+k
         oEgqQXGYik37rr22AHKx464/bENvfvygEVxN5x3KHhmeDJZ5gqh4G765SrfpyoMxXPs6
         2lRDWj//SE96w6sX/NvkVSMHcvgBsAiEQPwlMVdYmLCJnQ5CF0w0oUrNHbDkc3OXAvYd
         Dj1A==
X-Gm-Message-State: AOJu0YxGZr060bNzDbzS7FoXBXoiU/bonFS1cAU8Xkw6Qp3X1NitDNUF
	FDYJtWlaOfD4XnWhRoSgDgSKPBU86pO0ZdsCExXLBtIlNasmOvZFo0m93UMBLQ==
X-Gm-Gg: ASbGncunxUlxL2e7xWpv9EgwPJJjz6xx16nFUjA31yKw9au9Q10w94RA5d550+jLFM0
	zJBo79pCHXmOvZtxIMaH0Pu6G4b84eLzyTnjekpbwofq7D5fWGBA6FdzMf0n2juGE2obxa+Dpks
	jz5loMkKbUfgebJF+KkTTL+KJdCZnHLMUvPOIic5qa/x7B2jzPBXStjl9+g69YLxauxEzWhqN3B
	ryB9kJyggGcO/MGDLsaldC/qAwImnI4QM6J8HRTOcSfAm/M5kxuSSOeFeoqd6RH6MJ6RhmPqxCc
	mrN8mravz6qlNmdTMA8aGXR/6orvspp0Z33i2P3ygtRXfEwtB8ryHvJtJ7tMhn+D+VbZb/UA/4H
	UuZSb9nB/GWWvc18SsLyQbY+2c7s8cC9Pn8GGm7T/
X-Google-Smtp-Source: AGHT+IHqAK+rj+Bue2jOH6He+Q7Dab6KuuLFM/W9wxmE/FL0tUSrji5l5PsdH7uXTmmBeU87UPuOnA==
X-Received: by 2002:a05:6000:25f8:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3971e592812mr13199335f8f.32.1742203792544;
        Mon, 17 Mar 2025 02:29:52 -0700 (PDT)
Message-ID: <98bf4aa4-b896-4240-b13a-80a0f964a8b1@suse.com>
Date: Mon, 17 Mar 2025 10:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
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
In-Reply-To: <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 10:19, Alejandro Vallejo wrote:
> Hi,
> 
> I'm surprised this isn't already possible. Neat!
> 
> On Mon, 17 Mar 2025, 07:19 Sergiy Kibrik, <Sergiy_Kibrik@epam.com> wrote:
> 
>> Add config option HVM_VIRIDIAN that covers viridian code within HVM.
>> Calls to viridian functions guarded by is_viridian_domain() and related
>> macros.
>> Having this option may be beneficial by reducing code footprint for systems
>> that are not using Hyper-V.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>>  xen/arch/x86/Kconfig                  |  5 +++++
>>  xen/arch/x86/hvm/Makefile             |  2 +-
>>  xen/arch/x86/hvm/hvm.c                | 27 ++++++++++++++++++---------
>>  xen/arch/x86/hvm/vlapic.c             | 11 +++++++----
>>  xen/arch/x86/include/asm/hvm/domain.h |  4 ++--
>>  xen/arch/x86/include/asm/hvm/hvm.h    |  3 ++-
>>  xen/arch/x86/include/asm/hvm/vcpu.h   |  3 ++-
>>  7 files changed, 37 insertions(+), 18 deletions(-)
>>
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 6e41bc0fb4..34f9b79d98 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -348,6 +348,11 @@ config HYPERV_GUEST
>>
>>  endif
>>
>> +config HVM_VIRIDIAN
>> +       bool "Viridian enlightenments support" if EXPERT
>> +       depends on HVM
>> +       default y
>> +
>>
> 
> 
> I don't see why this should be gated by EXPERT, provided a
> suitable (now absent) help message was to exist explaining
> what it does in plain simple words.
> 
> For the title, I'd say it needs to properly state it refers to
> enlightenments for guests, rather than enlightenments for
> Xen itself when running under Hyper-V. As it is, it sounds
> ambiguous (Maybe "Hyper-V enlighnments for guests"?).

I'm slightly puzzled: Here you're worried about ambiguity, yet then ...

> On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
> rather redundant, and I think just VIRIDIAN works just as well
> while being shorter.

... you suggest to introduce ambiguity here. I'd expect VIRIDIAN alone
to cover whatever enlightenments Xen might want to use itself, when
run on top of Viridian.

Jan

