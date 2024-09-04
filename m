Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7996B877
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790053.1199759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnEj-0006Dr-Fg; Wed, 04 Sep 2024 10:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790053.1199759; Wed, 04 Sep 2024 10:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnEj-0006Ag-CP; Wed, 04 Sep 2024 10:27:41 +0000
Received: by outflank-mailman (input) for mailman id 790053;
 Wed, 04 Sep 2024 10:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slnEh-00066Q-DP
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:27:39 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e5f9055-6aa8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:27:37 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so4126786a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:27:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c24e8dee31sm4622690a12.37.2024.09.04.03.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:27:36 -0700 (PDT)
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
X-Inumbo-ID: 4e5f9055-6aa8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725445657; x=1726050457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C8gHeX1Loaqj+vhN0DnIbcz40IryHbxAPbWwx4Pos6Y=;
        b=borzj3f8t4YCJjYIS9jCWg2vZBGp4EwolyHx9e0znoKG15trL1PdmWdtsphiOmb6cd
         pAQhR78BL3hKWNWTeh11pRdRIIWnB2FccYhdPsYmB+dYYN3U3GTJeFpkA04B7T+Az6J2
         rWUx/cWKHVypffJNZeNpo+kqL6nhFgisrKZBLcrBPU1taUalGVxqYCJliyBn/QjReNFs
         d2ZIk8A9vg+gymIp4w1e3+Q+j0xjQlwPkFoSMAJ1tTMp9iFSfWgy2GnLWD1xzbY2nXow
         kI3cIssdYltqsO4cPO1Bt49sPMyN9K1eKLWAxEBsLkHIZTaxVOEWaeAhYPndNS3u7Ghg
         QNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445657; x=1726050457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8gHeX1Loaqj+vhN0DnIbcz40IryHbxAPbWwx4Pos6Y=;
        b=uXuGrXTdS75pndp5mDcjokY5rd4cUgWS0vT+msdRBeMahCMfbQRngy2ktqysDkOMX/
         wQejgbYPoGQX4bc0Bqf6ww8JK0Wdv/WnfplWjag+khwv0WkPN1kJDENTwi6i8au9VMi8
         +XpmyzuEx0nb+2bZDE5hdaua+FT0oOG4vPp2X1obGOwknfs8Jeg3VdmI//iBtzOFMlVM
         bIT6nGu/V2hNwuYg1MP7YZDjlLWYjWTEmbHJjT6ITh4rFAA2fHeza5mESXoJJdi+hfV5
         oeVoBx6ij7QRGuS9+nX7j+bB8l2fr0AwISa1XB3YQLpiwOCwp2GfI+gmTbkEwUQHVDDC
         75JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/OwTiqNaNXuyiYWxluj7ZWkB3o6yUwhfbneMXBSSA3q2lB6SeyNnMu7BleHXU2ljnr3W4KzLhbkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSYMBjNlIgYUtHuhYiGZRS1Y85m5RYX2V4UrNy2+lzlK2/xp1r
	ZuqpO33Ih1swAqOcvcGZeSRS8CxHXPVmUIlrHUuSJsz3dVOLMDs59gfBHA7S9g==
X-Google-Smtp-Source: AGHT+IHP44IEKIEkb7BFwR0Z2vBvnPVNzQoZkAMDLOsyjl/TxhP8TXp80ShMWITW7CjSZLjIxevCgw==
X-Received: by 2002:a05:6402:27cc:b0:5c2:769a:df79 with SMTP id 4fb4d7f45d1cf-5c2769adff2mr2062872a12.32.1725445656755;
        Wed, 04 Sep 2024 03:27:36 -0700 (PDT)
Message-ID: <626d17db-d91d-4e69-8412-bc3a7122d4c4@suse.com>
Date: Wed, 4 Sep 2024 12:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: fix UP build with gcc14
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6c7e29c6-eefa-48a2-9f02-e74b35d0438c@suse.com>
 <ed5504e5-072b-48ed-abb6-fde5f994626e@citrix.com>
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
In-Reply-To: <ed5504e5-072b-48ed-abb6-fde5f994626e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 12:24, Andrew Cooper wrote:
> On 04/09/2024 11:15 am, Jan Beulich wrote:
>> The complaint is:
>>
>> In file included from ././include/xen/config.h:17,
>>                  from <command-line>:
>> arch/x86/smpboot.c: In function ‘link_thread_siblings.constprop’:
>> ./include/asm-generic/percpu.h:16:51: error: array subscript [0, 0] is outside array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds=]
>>    16 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
>> ./include/xen/compiler.h:140:29: note: in definition of macro ‘RELOC_HIDE’
>>   140 |     (typeof(ptr)) (__ptr + (off)); })
>>       |                             ^~~
>> arch/x86/smpboot.c:238:27: note: in expansion of macro ‘per_cpu’
>>   238 |     cpumask_set_cpu(cpu2, per_cpu(cpu_sibling_mask, cpu1));
>>       |                           ^~~~~~~
>> In file included from ./arch/x86/include/generated/asm/percpu.h:1,
>>                  from ./include/xen/percpu.h:30,
>>                  from ./arch/x86/include/asm/cpuid.h:9,
>>                  from ./arch/x86/include/asm/cpufeature.h:11,
>>                  from ./arch/x86/include/asm/system.h:6,
>>                  from ./include/xen/list.h:11,
>>                  from ./include/xen/mm.h:68,
>>                  from arch/x86/smpboot.c:12:
>> ./include/asm-generic/percpu.h:12:22: note: while referencing ‘__per_cpu_offset’
>>    12 | extern unsigned long __per_cpu_offset[NR_CPUS];
>>       |                      ^~~~~~~~~~~~~~~~
>>
>> Which I consider bogus in the first place ("array subscript [0, 0]" vs a
>> 1-element array). Yet taking the experience from 99f942f3d410 ("Arm64:
>> adjust __irq_to_desc() to fix build with gcc14") I guessed that
>> switching function parameters to unsigned int (which they should have
>> been anyway) might help. And voilà ...
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Presumably we're going to pick this up very very rarely on RANDCONFIG
> now that someone regenerated the Tumbleweed containers ?

I expect so, yes.

Jan

