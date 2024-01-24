Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43F83AD86
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:39:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671117.1044292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfLE-0003V6-Fo; Wed, 24 Jan 2024 15:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671117.1044292; Wed, 24 Jan 2024 15:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfLE-0003TM-CZ; Wed, 24 Jan 2024 15:39:04 +0000
Received: by outflank-mailman (input) for mailman id 671117;
 Wed, 24 Jan 2024 15:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSfLD-0003TC-Kv
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:39:03 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2679247-bace-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:39:01 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf2adac1ccso6369801fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 07:39:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c14-20020a056602334e00b007bc102fb67asm7117305ioz.10.2024.01.24.07.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 07:39:00 -0800 (PST)
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
X-Inumbo-ID: b2679247-bace-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706110741; x=1706715541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJdTcsHHmhCivDIdfqM2GogOA2EJXp4CKFcm36Ko+K8=;
        b=bbIZZG8XRg/VT273W+J52s9HuiIubxORneyhalRbs+ejGj5d1hdNMuRz+3NJ63+J0h
         ekluC1mqNH+RCuqwG52VC3D2+suF8PdDv/xHe1ca2MKIw+Z+Zxv/xcbrF3veok+NOpJo
         fCyOydRnvm+F0pKJp/STGtGg2ZQSAslr4oiXmOEmffVPVUYcnLHstGVMl5L6wQbGAe12
         B/VV55rLu9myvzU2tPmxDEY7dAy6yiwl0L02ojL7Ek3Evmly/DGyZTfjtLqE1Wi9hwVs
         yX1cE5JxEhnsPHiKmeU/DwRFe5MNmT23LEJ9CW+RnkEyYg/rsF/yGceSoi7M73H1NUgw
         jNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110741; x=1706715541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJdTcsHHmhCivDIdfqM2GogOA2EJXp4CKFcm36Ko+K8=;
        b=xQfexLQ3Tfkzpu7ZbnR7RoVE9EXdBrZUtOnNOPFafSa04q1OuF84ROKlLghrnishM4
         z7eNiADI5sXe9i6LHdS5JEFgcxNPscaasphEGSphtIi1ECYszWA/Pktsr6drkLAJ985a
         Y/SrWWtr6hEJgG+F3gqgTFL4EmuVetsvEPMBvYVk8IDXzaOfYg0WrYecSz1RyV7XUNvf
         xBYbRYi/ESgZpL5Ha5xzDkHvi0U7/miCGjE/t5PaUEp2vuDUzgHGFcNVVKL6YuvNWCwZ
         xwYiyesfrXLg1osadzG+Cwv9yALbrwf/ScTey+3G1KE1U00Of3HXyckLw62jN8+eWv5m
         Ns8w==
X-Gm-Message-State: AOJu0Yxjhv2kFNrSEo++quSOJE/Lfbpi/AA4Ze1/W6tuHS3Qxk25RL5H
	0FcMEO7j8rg0jre1Jdms1W7GE9KKE85zWNYEtrZa5R2LCymEdZ4Q4BORDt9vog==
X-Google-Smtp-Source: AGHT+IEdr1koSfnRHgSWbfNM5XoNg93TyHuftmK1c3Fnbm82Plfy98cT1NN+u+W7dQHqGjkum697pA==
X-Received: by 2002:a2e:9911:0:b0:2cd:633c:55b6 with SMTP id v17-20020a2e9911000000b002cd633c55b6mr865359lji.46.1706110740974;
        Wed, 24 Jan 2024 07:39:00 -0800 (PST)
Message-ID: <4a64f394-2c01-44a9-be5b-ffdcb3616cc6@suse.com>
Date: Wed, 24 Jan 2024 16:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
 <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
 <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
 <b8f47c93-43c4-4c61-a569-7d07e811c6ab@suse.com>
 <22a0c2444201262202cd60d6d5a1cdff62c236bf.camel@gmail.com>
 <5f6c35ed-de1f-4a47-897d-33ed979b28db@suse.com>
 <3ae77a2a9c37f0ea68ec7641f72f931ffc92f304.camel@gmail.com>
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
In-Reply-To: <3ae77a2a9c37f0ea68ec7641f72f931ffc92f304.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 16:33, Oleksii wrote:
> On Wed, 2024-01-24 at 12:27 +0100, Jan Beulich wrote:
>> On 24.01.2024 11:12, Oleksii wrote:
>>> On Wed, 2024-01-24 at 09:19 +0100, Jan Beulich wrote:
>>>> On 23.01.2024 18:08, Oleksii wrote:
>>>>> On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
>>>>>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>>>>>> @@ -53,6 +56,18 @@ struct cpu_user_regs
>>>>>>>      unsigned long pregs;
>>>>>>>  };
>>>>>>>  
>>>>>>> +/* TODO: need to implement */
>>>>>>> +#define cpu_to_core(cpu)   (0)
>>>>>>> +#define cpu_to_socket(cpu) (0)
>>>>>>> +
>>>>>>> +static inline void cpu_relax(void)
>>>>>>> +{
>>>>>>> +    /* Encoding of the pause instruction */
>>>>>>> +    __asm__ __volatile__ ( ".insn 0x100000F" );
>>>>>>
>>>>>> binutils 2.40 knows "pause" - why use .insn then?
>>>>> I thought that for this instruction it is needed to have
>>>>> extension
>>>>> ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and
>>>>> to
>>>>> cover
>>>>> older version.
>>>>
>>>> Well, of course you'll need to enable the extension then for gas.
>>>> But
>>>> as long as you use the insn unconditionally, that's all fine and
>>>> natural. Another thing would be if you meant to also run on
>>>> systems
>>>> not supporting the extension: Then the above use of .insn would
>>>> need
>>>> to become conditional anyway.
>>> Then it makes sense to use "pause". 
>>> Let's assume that for now we are running only on systems which
>>> support
>>> the extension until we won't face compilation issue for some
>>> system.
>>
>> Gives me the impression that you still don't properly separate the
>> two
>> aspects: One is what systems Xen is to run on, and other is what's
>> needed to make Xen build properly. The first needs documenting (and
>> ideally at some point actually enforcing), while the latter may
>> require
>> e.g. compiler command line option adjustments.
> I understand that it will be required update "-march=..._zihintpause"
> and it should be a check that this extension is supported by a
> toolchain.
> 
> But I am not sure that I know how can I enforce that a system should
> have this extension, and considering Linux kernel implementation which
> uses always pause instruction, it looks like all available systems
> support this extension.

Which is why I said documenting will suffice, at least for now.

Jan

