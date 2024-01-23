Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CF838FFE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 14:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670468.1043262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGrQ-0000jR-1S; Tue, 23 Jan 2024 13:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670468.1043262; Tue, 23 Jan 2024 13:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSGrP-0000hH-Tx; Tue, 23 Jan 2024 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 670468;
 Tue, 23 Jan 2024 13:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSGrO-0000h8-Qx
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 13:30:38 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98262be6-b9f3-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 14:30:37 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cf161b5eadso5541961fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 05:30:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m11-20020a056e020deb00b003625add635csm2104077ilj.5.2024.01.23.05.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 05:30:36 -0800 (PST)
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
X-Inumbo-ID: 98262be6-b9f3-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706016637; x=1706621437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4ULTVFwnm6r1auzaNW8I9JXIMdGI+fPznSvcFRMZXk=;
        b=HjCR8mmGoZM5Nqpkg/IUoB7PrVtMZ/7YgxMhxVqb7qbmyMTCSvNKeknq4IcJ0ZiYoP
         vTIPQUMl9LfLJJOv9reuuKgs3JizOU7N/cf0lVXU/YdA+CbzVP+iGM4gjZUeRhH5MUJZ
         RtAmy0Ft6vtZGIVvaoqy0ljsQMXGotc4ObWR+28I6h+HuCrRoKf0qMwkoXS0y7OfvJ2L
         PDfjv4NV1c14U+2gwwZw8AIuIENBUb8qNSFcrgFBMngCT93IVOKtCH7oOkWxYGWQI5Qc
         tHq0JyRABDMYERlXe8BG/v/wa7O5cw8GKLG9zmMt/+K37TuEnhIczeZNwaA+Hf3oj00+
         zocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706016637; x=1706621437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4ULTVFwnm6r1auzaNW8I9JXIMdGI+fPznSvcFRMZXk=;
        b=fj3ZQlqSGyYR+JRDTRi2Wui1W14rEuYeLGE4IPq43LH0C3OoJNnBxZqKCq8FseiEut
         WndEMRnH1eYjqJKdneIVaZiCT4NchyAAC1DlHQYwaGlAOL/MBxzNRvOv3O27ikV0aaxe
         7CI5ITdSpI78A82TgLA8r/LXa/4EviTATcfni3BP624FAjjVQu1TZfMf1Np4zsXEUdcD
         S8B0DpsSzuIZ2OPszNVGqTJSi1I+ua6bFIXjKbKeo48LvzdaPqcoQryp4n6djVqhVR/Z
         IARfa0hNZqaiFcksFQ1MVrCeDuWgtZyr1c+XH5y/qQzcDNTaRq3ck+qR1Z3R9aKedq6H
         sVqg==
X-Gm-Message-State: AOJu0YwMVq+dMGCGD+gGmsXIlfQvotC4m82x2KxMJegkMUP4pzSj5vB8
	O0IFf/dwGzenOksFgmFXsqF0bCI8dcCw1GKvgT8Ly0WBt6Xrhs68VIKVPnZuZQ==
X-Google-Smtp-Source: AGHT+IF6iE9ZNqhm820y1SH7c9XJoEi1xH80jU57KZmBjqV1/ajRJLS/DYWWPh3qsrev7hLEJKiKyA==
X-Received: by 2002:a2e:3015:0:b0:2cf:1a11:ea87 with SMTP id w21-20020a2e3015000000b002cf1a11ea87mr151419ljw.39.1706016637262;
        Tue, 23 Jan 2024 05:30:37 -0800 (PST)
Message-ID: <d33fe182-8283-4552-bc0e-3eac90f20d31@suse.com>
Date: Tue, 23 Jan 2024 14:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
 <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
 <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
 <d7f89e6f4aae5c8cfa5215bd893b62a3d542ce4c.camel@gmail.com>
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
In-Reply-To: <d7f89e6f4aae5c8cfa5215bd893b62a3d542ce4c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 13:24, Oleksii wrote:
> On Tue, 2024-01-23 at 11:30 +0100, Jan Beulich wrote:
>> On 23.01.2024 11:21, Oleksii wrote:
>>> On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
>>>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/include/asm/fence.h
>>>>> @@ -0,0 +1,13 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>> +#ifndef _ASM_RISCV_FENCE_H
>>>>> +#define _ASM_RISCV_FENCE_H
>>>>> +
>>>>> +#ifdef CONFIG_SMP
>>>>> +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
>>>>> +#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
>>>>> +#else
>>>>> +#define RISCV_ACQUIRE_BARRIER
>>>>> +#define RISCV_RELEASE_BARRIER
>>>>> +#endif
>>>>
>>>> Do you really care about the !SMP case? On x86 at least we
>>>> stopped
>>>> special-
>>>> casing that configuration many years ago (the few cases where for
>>>> typically
>>>> build reasons it matters, using CONFIG_NR_CPUS is sufficient). If
>>>> you
>>>> care
>>>> about it, there needs to be somewhere you actually #define
>>>> CONFIG_SMP.
>>> Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?
>>
>> You can. Question is whether there's a point in doing so. Do you
>> expect people to actually want to run Xen on single-CPU systems?
>> They're generally not overly well suited for virtualization ...
> Just to clarify.
> 
> Do you mean physically single based CPU?
> Then I don't expect to run Xen on such systems and it is not nesessary
> to define *_BARRIER in this case. Should we have to add build error
> notification that we don't support single-CPU systems in this header?
> 
> If you are speaking about we have ,let it be, 4 CPUs and only 1 CPU is
> currently supported by Xen then it still makes sense.

No, that's still not what I mean. The question is: Is it useful for you
to _special case_ the NR_CPUS=1 case? Or is it instead simpler to handle
NR_CPUS=1 the same as NR_CPUS>1 (accepting less than ideal performance,
on the basis that in reality nobody's expected to use such in production
anyway)?

Jan

