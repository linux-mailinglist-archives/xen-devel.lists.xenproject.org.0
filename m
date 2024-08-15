Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A895371C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 17:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778154.1188189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secLU-0001F3-Bo; Thu, 15 Aug 2024 15:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778154.1188189; Thu, 15 Aug 2024 15:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secLU-0001Cq-92; Thu, 15 Aug 2024 15:25:00 +0000
Received: by outflank-mailman (input) for mailman id 778154;
 Thu, 15 Aug 2024 15:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1secLS-0001CH-SB
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 15:24:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87603dec-5b1a-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 17:24:57 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso153014266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 08:24:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396c695sm115651866b.201.2024.08.15.08.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 08:24:56 -0700 (PDT)
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
X-Inumbo-ID: 87603dec-5b1a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723735496; x=1724340296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FzT6iUaKspeW1WldLkRAw60hO311ITga+/GOoLem5Es=;
        b=BpniIajvn5KWQHWUfrdpqM3GSfKDpo5czCemPnel1xdgv6h2dsf6VSTvK8wakxYX1a
         BGnpJhWaHsW846FAi2tcSY9fpKJQf9mdANjcE9yk7UGbhpFoRAVyHA9oinAeMIq7akEM
         e4kkOU+KtcTfpKICGkvzTlSRCgUKwSooahWwdXGs3l5dnwchb/NRNgprnYDEA/vRm2GX
         IuABU2klgUh9bRiqJ+AHCj0YG+CeDUfp1FQ9n0huEuQbEKq5n1z2zXTedpjxzC9bakzc
         PdetkwqrPR2KxHn/n9Qsqk5cpGUlJsuSsmYWJ7bFBAxYLcRIwDE3B79DbKYNOfFXZegz
         WZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735496; x=1724340296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzT6iUaKspeW1WldLkRAw60hO311ITga+/GOoLem5Es=;
        b=O9x42g1ytYWr8zjLOv9i8xqVUPiNdRRbNKpSqkHH1oiIBh1/3dRKPFnTSsgD9sNTC2
         9BJBPhdN9yJfDSTz38l9liDV5QHooHm/KBEcTFwYbkbAK16LcQjL/+p09ec+bA/nQH0V
         NGYlh779JYc7pCCKytRQAfCHVpp6a8YzkEh7DCQ6SYnaO6oi5tnOe7G4KCyUgaV2No8l
         e4e1YY7gjt3Ztvg4xrdo31fqIB/GC7EHdL2h82tz1D6fCvYvhRnVFfXH/IZ1FfaG8AKt
         wXAe8SL1mPm81kJ6UxZuwABbR7/6ltefgwFp04eq4aMUv/uAvgbov52KyXVZAcazPF3O
         pXcw==
X-Forwarded-Encrypted: i=1; AJvYcCWGve4qc8TgHRHjyiPINoCz6vhzM+9YZkZNK3l2zy2owDfIGLPfeZlCeJfnBUrWFzWEE7f7zK1Rx9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8f3k7gF4/IIe31DbZpko1I/41RyJUWk/72oBMysfOq2MUT0G4
	t7nSuLk5Pp8Pa3OVL++YT5vvpUoDo0wFy2MUbVwgDm288FTKa3YILBYAH9j7Rg==
X-Google-Smtp-Source: AGHT+IGLYTWRZTfi459e3oxLie8w69DrItn6LEuVRp0fwBhmt9qw12KuKDHRiUD6Np7dmXSFk2UGHw==
X-Received: by 2002:a17:907:2cc6:b0:a7c:d284:4f1d with SMTP id a640c23a62f3a-a837cd582d8mr276887766b.28.1723735496431;
        Thu, 15 Aug 2024 08:24:56 -0700 (PDT)
Message-ID: <989cb6e1-553f-4de6-9808-21194c6f1acd@suse.com>
Date: Thu, 15 Aug 2024 17:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
 <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
 <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
 <dfb4678f-0b2d-4d1c-be02-10c4720e57b2@suse.com>
 <2184097c00f84f707fabadff240f977827a3c927.camel@gmail.com>
 <94a72d20-07c8-4fd6-9759-5bf31d56c860@suse.com>
 <a3c60570bfe4a29e2b3cfa5ab572fb505038a6d3.camel@gmail.com>
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
In-Reply-To: <a3c60570bfe4a29e2b3cfa5ab572fb505038a6d3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 15:29, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-15 at 11:02 +0200, Jan Beulich wrote:
>> On 15.08.2024 10:55, oleksii.kurochko@gmail.com wrote:
>>> On Wed, 2024-08-14 at 17:22 +0200, Jan Beulich wrote:
>>>> On 14.08.2024 16:45, oleksii.kurochko@gmail.com wrote:
>>>>> On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
>>>>>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>>>>>> --- /dev/null
>>>>>>> +++ b/xen/arch/riscv/smp.c
>>>>>>> @@ -0,0 +1,4 @@
>>>>>>> +#include <xen/smp.h>
>>>>>>> +
>>>>>>> +/* tp points to one of these per cpu */
>>>>>>> +struct pcpu_info pcpu_info[NR_CPUS];
>>>>>>
>>>>>> And they all need setting up statically? Is there a plan to
>>>>>> make
>>>>>> this
>>>>>> dynamic (which could be recorded in a "fixme" in the
>>>>>> comment)?
>>>>> I didn't plan to make allocation of this array dynamic. I don't
>>>>> expect
>>>>> that NR_CPUS will be big.
>>>>
>>>> What is this expectation of yours based on? Other architectures
>>>> permit
>>>> systems with hundreds or even thousands of CPUs; why would RISC-V
>>>> be
>>>> different there?
>>> Based on available dev boards. ( what isn't really strong argument
>>> )
>>>
>>> I checked other architectures and they are using static allocation
>>> too:
>>>    struct cpuinfo_x86 cpu_data[NR_CPUS];
>>>    
>>>    u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
>>>    	{ [0 ... NR_CPUS-1] = BAD_APICID };
>>>    
>>>    ... /* Arm */
>>>    
>>>    struct cpuinfo_arm cpu_data[NR_CPUS];
>>>
>>> I wanted to check to understand which one API should be used to
>>> allocate this array dynamically. xmalloc?
>>
>> As of a few days ago xvmalloc() (or friends thereof), as long as ...
>>
>>> And I am curious how I can use xmalloc() at this stage if page
>>> allocator (?) should be initialized what isn't true now.
>>
>> ... this happens late enough in the boot process. Indeed ...
>>
>>> Or just to allocate pcpu_info only for boot cpu and for other then
>>> use
>>> xmalloc()?
>>
>> ... statically allocating space for the boot CPU only is another
>> option.
>>
>>>>> I can add "fixme" but I am not really
>>>>> understand what will be advantages if pcpu_info[] will be
>>>>> allocated
>>>>> dynamically.
>>>>
>>>> Where possible it's better to avoid static allocations, of which
>>>> on
>>>> some systems only a very small part may be used. Even if you put
>>>> yourself
>>>> on the position that many take - memory being cheap - you then
>>>> still
>>>> waste cache and TLB bandwidth. Furthermore as long as struct
>>>> pcpu_info
>>>> isn't big enough (and properly aligned) for two successive array
>>>> entries
>>>> to not share cache lines, you may end up playing cacheline ping-
>>>> pong
>>>> when a CPU writes to its own array slot.
>>> Why the mentioned issues aren't work for dynamic memory? We still
>>> allocating memory for sizeof(pcpu_info) * NR_CPUS
>>
>> Why NR_CPUS? At runtime you know how may CPUs the system has you're
>> running on. You only need to allocate as much then. Just like e.g.
>> dynamically allocated CPU mask variables (cpumask_var_t) deliberately
>> use less than NR_CPUS bits unless on really big iron.
> I thought that NR_CPUS tells me how many CPU the system has.

Oh, no, that not what it says (and it really can't, being a compile time
constant) - it says how many CPUs the specific build of Xen is going to
support at most.

Jan

