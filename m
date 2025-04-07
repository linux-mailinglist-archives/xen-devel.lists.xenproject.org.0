Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68503A7D519
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 09:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939223.1339409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gdJ-0002gE-VX; Mon, 07 Apr 2025 07:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939223.1339409; Mon, 07 Apr 2025 07:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gdJ-0002eC-Sk; Mon, 07 Apr 2025 07:11:01 +0000
Received: by outflank-mailman (input) for mailman id 939223;
 Mon, 07 Apr 2025 07:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1gdI-0002e4-Gb
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 07:11:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7289745d-137f-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 09:10:55 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so2399859f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 00:10:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b69fdsm11067085f8f.48.2025.04.07.00.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 00:10:54 -0700 (PDT)
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
X-Inumbo-ID: 7289745d-137f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744009855; x=1744614655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y2tiYaQn5wC2xSUhm0UgcvZ/zfnOF3MHfRs4kCW/ekI=;
        b=JOHHNTmpsP4H11qpLwYVx1D6S9464IOexRkqbQYB5+nL/NiueZ12dMfmuFp2xpqAdr
         C6MIkkUTd0ZrBn5hywdmUpyN5Ak56a1OEho9C0AY25BbcRIErlZ4KA4VtcLDHvtfxcz4
         IsUzIBnz9ewWn6LOHJPV6bCnRsHBaFlvI3qKN0aRGYTLoAooyxze78REf+JbSKb/JaOo
         ScKemqyz7Y9+8nCqV66DXp8hMlE6/xXkfWueEEs9JdiNVFL4A93Xk8bjFMLLhhbdDjgE
         Ase2f4x1RbNI/nLP3w4OPMuAXkQbWnVFTX1O/qO4bBU/MIwkhtA7UY3Px+fv1a7Dh/jI
         kLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009855; x=1744614655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2tiYaQn5wC2xSUhm0UgcvZ/zfnOF3MHfRs4kCW/ekI=;
        b=G0+oJIeh8gIAjOUBsAQuuOYhoqXnKdDMPV/0ECuq8JnjQMFuObgH2Eu5rNPdQBeY9J
         nym1twp1TMndiHzi+nHoe7ylgAvgQE8b0TQ3PGgL12c60VnGzo6HaTgtgleRRUA2RXr9
         H+thakfd7TIuKbve/9rC3ePH+e8MupXIKJIMuiT8wC2XT5FPEM6LDOl1y6ugqKK7cDCA
         kLIokjBEOMCM31fxmdYozyeEVfq+NcXKH8SXpqMSmJBR6o87boIUhX2QJqp6OJD29N7l
         j+ClWrk8SkUe3cLjQs2r9WLStc/C6epj2Ib/vZRpTFhF6Zu7yfk/Xx969loW+d6sr9Fh
         dRSw==
X-Forwarded-Encrypted: i=1; AJvYcCV3yWihA6OZViZndiWkTYDDqCSs85a/PXiI6SvwBdkkgAFZfu8uDdRT2OJINLYvhHmSXKJ1neG9oDM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJSzZZKV3IDRVsWuNz+a1+StDiENsThlBjkQpCI71KWmdOPXz/
	oYnzeKPJfqEjfgWrpw+Gfo7Ansxu90dQ8rUlaaxuzP2P3QBJTacyFk+ZiRQB/w==
X-Gm-Gg: ASbGncsh9XfW6e3RNt8U5UQHu68Upl2FRNS8hvQ7w1D1TEnXCduv9uyMgUAmpG4S3gm
	sCC2ql24S9lzv51QYCIGF/eWB1RKIeZf8EN3tb9n/MvammEY0Q+6DyuAfHjJocwMsKhBGfXBdx2
	i2VqOsa4gxLrxDWYN/5zGyeqAo/Xr1QrBAMYX3YnQUCmKniKeyn/gFrnJasqry7u6CvRW0jtv9m
	vibfNfInVrjKSKRPF/z0s+qlOSS5gd9wESqrS/nU3+1ptRhxymcDQgihFVxpvLtSGZir6H9NwzR
	9ErgnlzVbZZ8o+oGIy3zV1bTKEw0MnsTQ7gALV90KDc/L/CEjGkMDVAyaxcOPJpljuYqM8qzGe5
	7qMssdngfsmsYmZnETqTzx8ORGMc/qQ==
X-Google-Smtp-Source: AGHT+IGKsJc6ISgXDeWMa0K/nqEBFOz6BpibQ/t8srWDVAjArUn6tby22XDa2K5HC1DvHm4eGe5ppg==
X-Received: by 2002:a05:6000:1787:b0:391:1806:e23f with SMTP id ffacd0b85a97d-39cb3596ea9mr9765795f8f.17.1744009854720;
        Mon, 07 Apr 2025 00:10:54 -0700 (PDT)
Message-ID: <72d3e83d-cb99-41b7-bf0d-b98b3927076e@suse.com>
Date: Mon, 7 Apr 2025 09:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-2-dpsmith@apertussolutions.com>
 <2e02b7d6-fe71-4ed8-a09d-5bde7438718c@suse.com>
 <4aa999f4-48d3-400c-9dc4-21d3f31f3d78@apertussolutions.com>
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
In-Reply-To: <4aa999f4-48d3-400c-9dc4-21d3f31f3d78@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2025 02:04, Daniel P. Smith wrote:
> On 1/30/25 08:45, Jan Beulich wrote:
>> On 26.12.2024 17:57, Daniel P. Smith wrote:
>>> @@ -596,9 +597,10 @@ int __init dom0_setup_permissions(struct domain *d)
>>>       return rc;
>>>   }
>>>   
>>> -int __init construct_dom0(struct boot_info *bi, struct domain *d)
>>> +int __init construct_dom0(struct boot_domain *bd)
>>
>> Pointer-to-const? Domain construction should only be consuming data
>> supplied, I expect.
>>
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/bootdomain.h
>>
>> Maybe boot-domain.h? Or was that suggested before and discarded for
>> whatever reason?
>>
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright (c) 2024 Apertus Solutions, LLC
>>> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>>> + */
>>> +
>>> +#ifndef __XEN_X86_BOOTDOMAIN_H__
>>> +#define __XEN_X86_BOOTDOMAIN_H__
>>> +
>>> +struct boot_domain {
>>> +    struct boot_module *kernel;
>>> +    struct boot_module *ramdisk;
>>
>> "ramdisk" is Linux-centric, I think. Can we name this more generically?
>> "module" perhaps, despite it then being the same name as we use for the
>> modules Xen is passed?
> 
> Ramdisk is not a linux-centric, take OpenBSD for example [1]. Calling 
> the field "module" is a recipe for confusion. Especially considering 
> that we are more or less providing a lightweight version of the 
> toolstack interface which use the name ramdisk.
> 
> [1] https://openbsd.fandom.com/wiki/Creating_a_custom_OpenBSD_RAM_disk

Just one other OS also using such a concept doesn't mean much. In fact, "ramdisk"
isn't quite appropriate a term for Linux nowadays anymore anyway. An initrd can
consist of multiple pieces now, not all of which end up taken as "ramdisk". I
wouldn't insist on "module" as a name, but I continue to think "ramdisk" is
inappropriate. The fact that the toolstack uses the term has historical reasons;
it doesn't mean new code in Xen needs to continue to use that term.

Jan

