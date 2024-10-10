Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B0C997EA3
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815651.1229636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo8z-0002ki-2S; Thu, 10 Oct 2024 08:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815651.1229636; Thu, 10 Oct 2024 08:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo8y-0002hX-Va; Thu, 10 Oct 2024 08:03:32 +0000
Received: by outflank-mailman (input) for mailman id 815651;
 Thu, 10 Oct 2024 08:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syo8y-0002hR-De
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:03:32 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 232d392d-86de-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:03:30 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c896b9b4e0so758481a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:03:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7f35e18sm50914666b.90.2024.10.10.01.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 01:03:29 -0700 (PDT)
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
X-Inumbo-ID: 232d392d-86de-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728547410; x=1729152210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ubZGI2YfwRe7yH9tlhRCZrl93uTdEJwxHa1fjUjt1YE=;
        b=aBsURBb7DIzUc9Gfke77UUYZ/BrA8s9JReSxoNyzEYg6BZmI0sDBG4PtW/kMe5zsmF
         McuYP6zIkTVUw2m/kix1kC3f3wFHnYakEr0C+3/GGKF5j4gcvCm4DuHLyjqi7aiIKwjM
         Q+Pj1jVLmh1PuDfyp0mcLSHRdjgsJHNII9VJVJhvVef4+YVQpt5WU5398hYcG9u5RRfg
         XoT48oUODL/arY/bxmS42fY3bGrnbvkQV5RPoyhKlga1gveJVsZ1XQ9TbwOGlcP8e3Ci
         TetLdpIXiMG9cNaBzxGKGRPWsqrdKn0v2PsMvotjbvqHngC/xiGJVw+OR25q/gLORdxQ
         yOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728547410; x=1729152210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubZGI2YfwRe7yH9tlhRCZrl93uTdEJwxHa1fjUjt1YE=;
        b=gB1XW7PkOk5kaIQerSIpzyP3OizOd8sw3+8ZUPadeeAPQK2mdM1IbaLmpGObe7AWq7
         0HOMipj2Sbo/zwafgNHrVIqyyiK36Y30EmyXBEvw+j6ETRzmEUNLeA70DDjR5PxEkFf5
         nOX0lNkwK+X+aOOWJhPqcJsse4G0Yry0+vRn/DXbaWJs3SPDY3dsiBlDCxbFhXzgLqWt
         N6P7XyBCXO7fJtV2YkGtQx0cAJFRSxwqReEH5mewKGUu8wohDLrSwfbbCCquf95d93jy
         oKy4++RKPhkw9vcMtpZ8dn+VMZozL5/lGezh2aouN04zdWKxP6VdcspRLL1WzoDfLrPr
         fzIg==
X-Forwarded-Encrypted: i=1; AJvYcCUqCsIM/knv38UhuCfnrSPMYJAx5ovgg1v3zKsRCVH9WQhrjZIurQO2QlnaYIQgakaGGqxCTTAKprI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCGfAKZGIWLVxx/9BmIPFiynTYqXiYM3MYosRPD4gYmmlUWmQ8
	vxHyB+u6AOFVQtzA8fj/RA2B0CgASmsuaz0FKVxbITX0tAisNfJ96m+TrFgVkA==
X-Google-Smtp-Source: AGHT+IESffypITbUP+NGKJEW+MqBawuutNzrkPL0ZrhuNsqFi/dTS9wf4AUB3o2vKdcW4RFSczLszA==
X-Received: by 2002:a17:907:8686:b0:a99:5881:c6a0 with SMTP id a640c23a62f3a-a998d21a132mr482222866b.36.1728547409799;
        Thu, 10 Oct 2024 01:03:29 -0700 (PDT)
Message-ID: <e68ea3c0-f454-4773-89b1-affbc0d347a3@suse.com>
Date: Thu, 10 Oct 2024 10:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/44] x86/boot: convert create_dom0 to use boot info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-26-dpsmith@apertussolutions.com>
 <1bc18234-2e50-467d-875a-3968165f5570@amd.com>
 <70d98462-8006-4ae2-9774-f21152be2362@apertussolutions.com>
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
In-Reply-To: <70d98462-8006-4ae2-9774-f21152be2362@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.10.2024 01:02, Daniel P. Smith wrote:
> On 10/8/24 12:52, Jason Andryuk wrote:
>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>> This commit changes create_dom0 to no longer take the individual 
>>> components and
>>> take struct boot_info instead. Internally, it is changed to locate the 
>>> kernel
>>> and ramdisk details from struct boot_info.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/arch/x86/setup.c | 25 ++++++++++++++++---------
>>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>> index 0d2ee19998aa..c2bcddc50990 100644
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -946,10 +946,8 @@ static unsigned int __init copy_bios_e820(struct 
>>> e820entry *map, unsigned int li
>>>       return n;
>>>   }
>>> -static struct domain *__init create_dom0(const module_t *image,
>>> -                                         unsigned long headroom,
>>> -                                         module_t *initrd, const char 
>>> *kextra,
>>> -                                         const char *loader)
>>> +static struct domain *__init create_dom0(const struct boot_info *bi,
>>> +                                         const char *kextra)
>>>   {
>>>       static char __initdata cmdline[MAX_GUEST_CMDLINE];
>>> @@ -964,9 +962,21 @@ static struct domain *__init create_dom0(const 
>>> module_t *image,
>>>               .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED 
>>> : 0,
>>>           },
>>>       };
>>> +    int headroom, mod_idx = first_boot_module_index(bi, 
>>> BOOTMOD_RAMDISK);
>>
>> I think headroom should stay unsigned long, which matches struct 
>> boot_module.
> 
> Yes, that was not intentional. Will preserve the size.

And just to mention, with what was said on another patch mod_idx also
shouldn't be plain int.

Jan

