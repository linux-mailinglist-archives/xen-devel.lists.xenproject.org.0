Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343B83A79B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670929.1044016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbI1-00005v-LS; Wed, 24 Jan 2024 11:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670929.1044016; Wed, 24 Jan 2024 11:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbI1-0008Ur-ID; Wed, 24 Jan 2024 11:19:29 +0000
Received: by outflank-mailman (input) for mailman id 670929;
 Wed, 24 Jan 2024 11:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSbI0-0008US-7A
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:19:28 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e832405-baaa-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 12:19:25 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf2b218c62so3166281fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 03:19:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a02a486000000b0046ee34b8c3dsm1701094jam.91.2024.01.24.03.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 03:19:24 -0800 (PST)
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
X-Inumbo-ID: 6e832405-baaa-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706095165; x=1706699965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYv/Gq1mIK3LsdtOqhgxy2t9sdd0gLhNDzDEjkxW9xg=;
        b=KfxYBZ83jWDHzSsWmtl5H0PgJ/gZoyqSSkgaVa7TJt7wwaUHzoEniEDuUwGvFJjXnv
         fMJi9JNPrB+fsOz4X7Bh8AHbH+qiX0IkTaYtRzJ9ZrDNfPAh9msI5ruhgWMT+tYZM5ey
         uWnFXnvrpCVnWgDqLZwXZMxXvo5QR8AONJBG+K7RO0AJl16oAervC33U7MVHNjJCRr0I
         BfMFcNa4xByib7FhVzFkoVWerutZ39NKqrw+8vnmMZm1DdKTGXfMsqk2e29r7QgMq4xE
         Roq59iVIl6t8iToMged2aqpwCKy8HZLdb/WAECElRUvOhaw++uMQccx/oOXYuyrtIGHw
         schg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706095165; x=1706699965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYv/Gq1mIK3LsdtOqhgxy2t9sdd0gLhNDzDEjkxW9xg=;
        b=gCsln87TDTRspR5+c0w94oydyTVPpgTBmSfUAgr9HMg8FRJNdroFSYVoFzx8JkP1wk
         H5lwJfcnf/oPN8mqZO6Aryg6TUYnyiyx9FnLz8s6qRGraC2xXzCKCJmaSkJLbYozqZ+2
         d4Hi/IwJl0cEhm3e1CFgPpheZUgR5diYZiUC/YWtMhJ0zDZ6aw6kwObTPqQ1Hsw2IJgG
         4Dh1bHZiJbmZsiig4KrLJtZ1Hjda2WD4Km97hm58qE/I1UWixnX/xNjuIkzuM8ynLUow
         vl2FZHrC674h/Ravqz9iqVnRijRpw3MGx9cE6pxXaaeeh6ij3tN/eT81RDSb61yfvbzx
         +fmQ==
X-Gm-Message-State: AOJu0YyY18gLZdzed6y7SC0dUi2owUwg8TjUFjMb4KzqR/dMhg2ZuLBZ
	iwVQ6ZhVmUdYXDHG/JpMHUR0A3h0Ne1ymp22XY9m287bz9E0kAi3ruOsKbFjDw==
X-Google-Smtp-Source: AGHT+IGmsflNCczXUS5NbCuKayw6OhxzwnNk6VRqwfwwU/qurRS6d4kKlrbwwJK2FHzlWfvUVlQIxQ==
X-Received: by 2002:a2e:3c05:0:b0:2cf:2db4:cd7e with SMTP id j5-20020a2e3c05000000b002cf2db4cd7emr33507lja.203.1706095165237;
        Wed, 24 Jan 2024 03:19:25 -0800 (PST)
Message-ID: <e15ab025-d677-429b-abc4-9de23546b32c@suse.com>
Date: Wed, 24 Jan 2024 12:19:20 +0100
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
 <d33fe182-8283-4552-bc0e-3eac90f20d31@suse.com>
 <b0c23db4b8162e5859347a582b43050c1601c10b.camel@gmail.com>
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
In-Reply-To: <b0c23db4b8162e5859347a582b43050c1601c10b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.01.2024 10:23, Oleksii wrote:
> On Tue, 2024-01-23 at 14:30 +0100, Jan Beulich wrote:
>> On 23.01.2024 13:24, Oleksii wrote:
>>> On Tue, 2024-01-23 at 11:30 +0100, Jan Beulich wrote:
>>>> On 23.01.2024 11:21, Oleksii wrote:
>>>>> On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
>>>>>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/arch/riscv/include/asm/fence.h
>>>>>>> @@ -0,0 +1,13 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>>>> +#ifndef _ASM_RISCV_FENCE_H
>>>>>>> +#define _ASM_RISCV_FENCE_H
>>>>>>> +
>>>>>>> +#ifdef CONFIG_SMP
>>>>>>> +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
>>>>>>> +#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
>>>>>>> +#else
>>>>>>> +#define RISCV_ACQUIRE_BARRIER
>>>>>>> +#define RISCV_RELEASE_BARRIER
>>>>>>> +#endif
>>>>>>
>>>>>> Do you really care about the !SMP case? On x86 at least we
>>>>>> stopped
>>>>>> special-
>>>>>> casing that configuration many years ago (the few cases where
>>>>>> for
>>>>>> typically
>>>>>> build reasons it matters, using CONFIG_NR_CPUS is
>>>>>> sufficient). If
>>>>>> you
>>>>>> care
>>>>>> about it, there needs to be somewhere you actually #define
>>>>>> CONFIG_SMP.
>>>>> Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?
>>>>
>>>> You can. Question is whether there's a point in doing so. Do you
>>>> expect people to actually want to run Xen on single-CPU systems?
>>>> They're generally not overly well suited for virtualization ...
>>> Just to clarify.
>>>
>>> Do you mean physically single based CPU?
>>> Then I don't expect to run Xen on such systems and it is not
>>> nesessary
>>> to define *_BARRIER in this case. Should we have to add build error
>>> notification that we don't support single-CPU systems in this
>>> header?
>>>
>>> If you are speaking about we have ,let it be, 4 CPUs and only 1 CPU
>>> is
>>> currently supported by Xen then it still makes sense.
>>
>> No, that's still not what I mean. The question is: Is it useful for
>> you
>> to _special case_ the NR_CPUS=1 case? Or is it instead simpler to
>> handle
>> NR_CPUS=1 the same as NR_CPUS>1 (accepting less than ideal
>> performance,
>> on the basis that in reality nobody's expected to use such in
>> production
>> anyway)?
> NR_CPUS=1 sometimes is useful for debugging. At least, at the start I
> used that several times, but ITBO I don't remember when I used that
> case after SMP support was added and context_switch() was fixed.

And "sometimes is useful for debugging" warrants introducing special
cases? I've not suggested disallowing that configuration. I'm merely
asking whether it isn't easier to have the barriers there at all
times. Just like on x86 we now leave the LOCK prefixes in place at
all times.

> Probably, I misunderstand the real idea of NR_CPUS. Does NR_CPUS
> represent a number of logical CPUs which can be different from physical
> amount of CPU?

No.

Jan

