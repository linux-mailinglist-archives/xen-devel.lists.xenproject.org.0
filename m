Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A284CF2E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 17:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677823.1054696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkyu-0003hp-Dc; Wed, 07 Feb 2024 16:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677823.1054696; Wed, 07 Feb 2024 16:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkyu-0003fD-AK; Wed, 07 Feb 2024 16:41:04 +0000
Received: by outflank-mailman (input) for mailman id 677823;
 Wed, 07 Feb 2024 16:41:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXkyt-0003f7-Os
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 16:41:03 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae079667-c5d7-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 17:41:02 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41008ab427fso7734765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 08:41:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b7-20020a05600010c700b0033b459e8f60sm1853630wrx.18.2024.02.07.08.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:41:01 -0800 (PST)
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
X-Inumbo-ID: ae079667-c5d7-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707324062; x=1707928862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wzTALPGPQx+krgy++JH7ll+8zWoYZ429HdJyi3Km34=;
        b=MkfSlsr3OtIVopV6auKmETRmEs6lj/ArexgEQRGltEfUx9hEb2ql1cU7tC3So6Y/fr
         cKX935yLjqux6PESRqXq7a86dF+rF6xNDVQS5y+5vBZU2bwNOgJcq7SQHcZwEXf7sQSr
         +mPWirpfFUBP3CfszHrEcOLl7yacLkopwsdg4UPcFunVcqYAiqTpkX5IOgi25bvlcHjS
         fKLpNZEfzfPxdi9kaSN1Y4hj0gjRsnc2pGABpwKRKGVQz2Dry8/GiP4Y32hzz0P4z/l1
         GRDBcvSGO/icIA8MKsp++/vrC7SppwxRdt/7DPx//Bo66b4oXK9ot8MzbJYB1OBFdPhJ
         iisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707324062; x=1707928862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wzTALPGPQx+krgy++JH7ll+8zWoYZ429HdJyi3Km34=;
        b=MJYUGYUFRaHsgQzaUjwq++WcZ1jYF4dgrEobxsdnVrOKuNbr1QwhfDnIro7b4h7FJO
         nhZpdiqJe/d/7FrgIj0tl4obqq8WLHE8gbAlVmYXPgHq/wESj3WesRgUP8u4z3hzCPny
         KnmLAiYJm7g32p0Y7nz0MyimZRMPKW6aKxGwN1V37Ueas983QSAAzizIDq5iYgb7duNO
         GHvkGNs0Y1HonnWyDNHH/9k65lWGcwqqeKuMui2WAoDAYzhiWfR0dgJcVm/jHYmPR/5l
         V/8Tackh2omF2kze32OJ3VwG1vRl8XX0iCCPMrs7VP8s1JF5UYgvwavc/qwkwjmzeVn0
         3oCg==
X-Forwarded-Encrypted: i=1; AJvYcCVutMTMm89mfomheZa4JSZj/dvS7jn1VpfR8zGB7RNouxXTr1ecEQlX3NDdprYkqWKS/eWr4wUfwS9D64JxH6iZvGVOigloQa3yrrTSvzw=
X-Gm-Message-State: AOJu0YxthC4edrrHQRwlUVrZCKUtiIa97/y0EphDp3om/FFbv6MxbTRo
	NxJ2rsywJdQYCGGMnhoW1j+YlIB3mrIX/49q2AI4J9tww1vNdEG9JqMd2Tapkg==
X-Google-Smtp-Source: AGHT+IGgj565s8RiXjL+ftfCBRVIoOOftoII7/Hw5eBGyE8NOE86vIs7J2TV19rM35GkSj2+muGtTw==
X-Received: by 2002:a5d:55c8:0:b0:33b:17c5:dcc8 with SMTP id i8-20020a5d55c8000000b0033b17c5dcc8mr3719679wrw.43.1707324061790;
        Wed, 07 Feb 2024 08:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuh540rcao5EbXC3FOFiXKswUT41gOigIelHZ4uMpfaVY7Vy0So+8lrQIN5gKb6gvZ7IuFsTD/VdeHh9MkVfyrj+rP8Bc9BoBzFCOn1oFacawkbfAFy7j/DEP/1Uy/STRNx/XgEqpUAlV2Ex/mKQ+72AJZUv2Dci8cu2GsBG/6k30cxzWKgrY8ZM4=
Message-ID: <24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com>
Date: Wed, 7 Feb 2024 17:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/9] x86/smp: drop x86_cpu_to_apicid, use
 cpu_data[cpu].apicid instead
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
 <b85ecee7-65ce-47f0-8e9d-cdc056d337fb@xen.org>
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
In-Reply-To: <b85ecee7-65ce-47f0-8e9d-cdc056d337fb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 19:11, Julien Grall wrote:
> Hi,
> 
> On 14/11/2023 17:50, Krystian Hebel wrote:
>> Both fields held the same data.
>>
>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>> ---
>>   xen/arch/x86/boot/x86_64.S           |  8 +++++---
>>   xen/arch/x86/include/asm/asm_defns.h |  2 +-
>>   xen/arch/x86/include/asm/processor.h |  2 ++
>>   xen/arch/x86/include/asm/smp.h       |  4 ----
>>   xen/arch/x86/numa.c                  | 15 +++++++--------
>>   xen/arch/x86/smpboot.c               |  8 ++++----
>>   xen/arch/x86/x86_64/asm-offsets.c    |  4 +++-
>>   7 files changed, 22 insertions(+), 21 deletions(-)
>>
>> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
>> index b85b47b5c1a0..195550b5c0ea 100644
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -20,15 +20,17 @@ ENTRY(__high_start)
>>           jz      .L_stack_set
>>   
>>           /* APs only: get stack base from APIC ID saved in %esp. */
>> -        mov     $-1, %rax
>> -        lea     x86_cpu_to_apicid(%rip), %rcx
>> +        mov     $0, %rax
>> +        lea     cpu_data(%rip), %rcx
>> +        /* cpu_data[0] is BSP, skip it. */
>>   1:
>>           add     $1, %rax
>> +        add     $CPUINFO_X86_sizeof, %rcx
>>           cmp     $NR_CPUS, %eax
>>           jb      2f
>>           hlt
>>   2:
>> -        cmp     %esp, (%rcx, %rax, 4)
>> +        cmp     %esp, CPUINFO_X86_apicid(%rcx)
>>           jne     1b
>>   
>>           /* %eax is now Xen CPU index. */
> 
> As mentioned in an earlier patch, I think you want to re-order the 
> patches. This will avoid to modify twice the same code within the same 
> series (it is best to avoid if you can).

I second this request. Even more so that there's an unexplained move
from starting at $-1 to starting at $0 (in which case you really want
to use xor, not mov).

>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -54,14 +54,13 @@ bool __init arch_numa_unavailable(void)
>>   /*
>>    * Setup early cpu_to_node.
>>    *
>> - * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
>> - * and apicid_to_node[] tables have valid entries for a CPU.
>> - * This means we skip cpu_to_node[] initialisation for NUMA
>> - * emulation and faking node case (when running a kernel compiled
>> - * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
>> - * is already initialized in a round robin manner at numa_init_array,
>> - * prior to this call, and this initialization is good enough
>> - * for the fake NUMA cases.
>> + * Populate cpu_to_node[] only if cpu_data[], and apicid_to_node[]

You mean cpu_physical_id() here, and then this change wants doing when
switching to that, imo.

>> + * tables have valid entries for a CPU. This means we skip
>> + * cpu_to_node[] initialisation for NUMA emulation and faking node
>> + * case (when running a kernel compiled for NUMA on a non NUMA box),
>> + * which is OK as cpu_to_node[] is already initialized in a round
>> + * robin manner at numa_init_array, prior to this call, and this
>> + * initialization is good enough for the fake NUMA cases.
>>    */

Also if you're already re-wrapping this comment, please make better use
of line width.

>> --- a/xen/arch/x86/x86_64/asm-offsets.c
>> +++ b/xen/arch/x86/x86_64/asm-offsets.c
>> @@ -159,7 +159,9 @@ void __dummy__(void)
>>       OFFSET(IRQSTAT_softirq_pending, irq_cpustat_t, __softirq_pending);
>>       BLANK();
>>   
>> -    OFFSET(CPUINFO_features, struct cpuinfo_x86, x86_capability);
>> +    OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
> 
> The rename seems to be unrelated to this patch. Can you clarify?

I agree some renaming wants doing, but separately. That's because we
use CPUINFO_ as a prefix for two entirely different structure's offsets
right now. I'm not convinced of CPUINFO_X86_ as the new prefix though:
Uses are against cpu_data[], so CPUDATA_ may be better. Might be good
if Andrew and/or Roger could voice their view.

Jan

>> +    OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
>> +    DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
>>       BLANK();
>>   
>>       OFFSET(MB_flags, multiboot_info_t, flags);
> 
> Cheers,
> 


