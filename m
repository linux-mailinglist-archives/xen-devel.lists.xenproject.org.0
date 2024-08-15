Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0E952B05
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 11:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777926.1187985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWN7-0004Qf-Ra; Thu, 15 Aug 2024 09:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777926.1187985; Thu, 15 Aug 2024 09:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWN7-0004Nh-Oh; Thu, 15 Aug 2024 09:02:17 +0000
Received: by outflank-mailman (input) for mailman id 777926;
 Thu, 15 Aug 2024 09:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seWN6-0004Nb-5k
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 09:02:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1007e140-5ae5-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 11:02:13 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso105698166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 02:02:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935a8bsm69447366b.103.2024.08.15.02.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 02:02:12 -0700 (PDT)
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
X-Inumbo-ID: 1007e140-5ae5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723712533; x=1724317333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8rK+u4xaq5WQKdSHelH5gnA/txa0Bz1Jt6EvrQupLg4=;
        b=DJCOhR/yJlbls6JUEs7GLnGKgaj7Sxl3FCnwu2RIDNzTRB69iZcdhrPyWiBZGpeNme
         /ceDZsh456Nfh0uWeixM2u3QvCxXTYaS6xFGLr9x5CfMHhaqLJHlBpUlpmnMWeTb6beJ
         9Aa4qcJU+bDOKCB1OvgQCp0uj7CAQxq7H6/nkN41pxuvxaRHYfjc5aPzOo2PgQmcdDAJ
         Y+deUlHIGt4OD9nvLVR4f6k+fOV+ODUpifGeCRIeXowP0hPraFd9+xhnVg6gHrhR86E1
         JiU04abJavQxC/8f7rvngqYCTDFDz9u3330LU2//VD9SqS71Nqn5X2iW6No9gi5UxDEM
         Ibzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723712533; x=1724317333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rK+u4xaq5WQKdSHelH5gnA/txa0Bz1Jt6EvrQupLg4=;
        b=eglma9D8mmvEKEfOIyizzVZKxjlDdyJqu5ejwLO//lDMH1IHSg3pnXMA7a9wLAE1E2
         6Q7hCmsxcb4tqkeQMMQmMcT84BuF9a+wv8cECRfoTF9l8JTuAvbB54HbNKM0ryVlz4z2
         yBLNoHVI3Si17gpQ1oOkI7sfKRU/2QWFE9vFq6OJ6UTXdtjXJSCaeyL/wQHYqCUpv9+T
         C0sKMNNo35sl+khur4ZoXNniPvax3SkWmtii8NKHF91t6DuTapqN0ICXUImWXGEpVZqa
         TFfhR9skwFP3YxuNJ1aVQa2SopQ8yqP+3y0sditlYo9qlG9BzGiXddC5WkFTrjtr+X9H
         bbbw==
X-Forwarded-Encrypted: i=1; AJvYcCWamp5pmdBBG1oXMq+b5KJHHdJCkYl4rHIlpV2UPhgR+w2bNtMgg6mkC3smo38VcbNSo4uHDoNtaJiSoeO25lo8VJkQN1Cbw4OuVORgBsQ=
X-Gm-Message-State: AOJu0Yz6tCFVuRoAgFrRHEGiP+gx35YyxQv7XTDCOK0DLVo/E94FPLn1
	3+CZfuMD5hXPsFYNSW07876HQiz50H8+VASd8Nn1qre5c5tOZy6XIFMF2k2CcA==
X-Google-Smtp-Source: AGHT+IHVNoakDpK+X3aM42kkBHcwXpksi15uhPFG0DWn9WhIQbxYjR151gncuwIVANyEGNL2Aljxrw==
X-Received: by 2002:a17:906:6a1e:b0:a7a:bbbb:623d with SMTP id a640c23a62f3a-a83670c0032mr351414066b.66.1723712532806;
        Thu, 15 Aug 2024 02:02:12 -0700 (PDT)
Message-ID: <94a72d20-07c8-4fd6-9759-5bf31d56c860@suse.com>
Date: Thu, 15 Aug 2024 11:02:11 +0200
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
In-Reply-To: <2184097c00f84f707fabadff240f977827a3c927.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2024 10:55, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-08-14 at 17:22 +0200, Jan Beulich wrote:
>> On 14.08.2024 16:45, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
>>>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/riscv/smp.c
>>>>> @@ -0,0 +1,4 @@
>>>>> +#include <xen/smp.h>
>>>>> +
>>>>> +/* tp points to one of these per cpu */
>>>>> +struct pcpu_info pcpu_info[NR_CPUS];
>>>>
>>>> And they all need setting up statically? Is there a plan to make
>>>> this
>>>> dynamic (which could be recorded in a "fixme" in the comment)?
>>> I didn't plan to make allocation of this array dynamic. I don't
>>> expect
>>> that NR_CPUS will be big.
>>
>> What is this expectation of yours based on? Other architectures
>> permit
>> systems with hundreds or even thousands of CPUs; why would RISC-V be
>> different there?
> Based on available dev boards. ( what isn't really strong argument )
> 
> I checked other architectures and they are using static allocation too:
>    struct cpuinfo_x86 cpu_data[NR_CPUS];
>    
>    u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
>    	{ [0 ... NR_CPUS-1] = BAD_APICID };
>    
>    ... /* Arm */
>    
>    struct cpuinfo_arm cpu_data[NR_CPUS];
> 
> I wanted to check to understand which one API should be used to
> allocate this array dynamically. xmalloc?

As of a few days ago xvmalloc() (or friends thereof), as long as ...

> And I am curious how I can use xmalloc() at this stage if page
> allocator (?) should be initialized what isn't true now.

... this happens late enough in the boot process. Indeed ...

> Or just to allocate pcpu_info only for boot cpu and for other then use
> xmalloc()?

... statically allocating space for the boot CPU only is another option.

>>> I can add "fixme" but I am not really
>>> understand what will be advantages if pcpu_info[] will be allocated
>>> dynamically.
>>
>> Where possible it's better to avoid static allocations, of which on
>> some systems only a very small part may be used. Even if you put
>> yourself
>> on the position that many take - memory being cheap - you then still
>> waste cache and TLB bandwidth. Furthermore as long as struct
>> pcpu_info
>> isn't big enough (and properly aligned) for two successive array
>> entries
>> to not share cache lines, you may end up playing cacheline ping-pong
>> when a CPU writes to its own array slot.
> Why the mentioned issues aren't work for dynamic memory? We still
> allocating memory for sizeof(pcpu_info) * NR_CPUS

Why NR_CPUS? At runtime you know how may CPUs the system has you're
running on. You only need to allocate as much then. Just like e.g.
dynamically allocated CPU mask variables (cpumask_var_t) deliberately
use less than NR_CPUS bits unless on really big iron.

Jan

> and when this
> allocated memory access it will go to cache, CPU/MMU still will use TLB
> for address translation for this region and without a proper alignment
> of pcpu_info size it still could be an issue with cache line sharing.
> 
> ~ Oleksii
> 


