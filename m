Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC78B94EE
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715583.1117323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QOL-0006af-3c; Thu, 02 May 2024 06:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715583.1117323; Thu, 02 May 2024 06:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QOK-0006YA-VT; Thu, 02 May 2024 06:58:04 +0000
Received: by outflank-mailman (input) for mailman id 715583;
 Thu, 02 May 2024 06:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2QOJ-0006Y4-J3
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:58:03 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ea51e6-0851-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:58:01 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2dd6c14d000so92822761fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:58:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c4e9400b0041b5500e438sm845449wmq.23.2024.05.01.23.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:58:00 -0700 (PDT)
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
X-Inumbo-ID: 50ea51e6-0851-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714633081; x=1715237881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HCOzvp6QxP/hXwE5Y9W1gwdgfBsEHmk7xOXrbcEFRKA=;
        b=Sg31uRkya5gB7IDV98peiQ4MTUaHd3ukBCf4uboZ+Wh3j3+1G8WLn57O/GaTIHkmss
         5/3wQHlxurELZMASrky42G/+AOgZw2f7ODzBXj1e6awF5LcdTb2e7zvS0gnGuGoOdaz8
         hk4y5nLmZqI6rvI4b7WogElis97HZzt4BmZHHnd5ewiBIYX/wFoxkNBVoj1Pq27PIw3H
         SmBfgApLunmrniIonF55LJEpV+/mZ5V1RbpfAb8ozseYgbTHFQ+i6YM0a/77Hp+E2v1H
         cMQBtZapYkTH7hrbeMjLczTk4yECnggbEnzpVnssXJwENOpTgtmrCcqN+EaOpPDem5Gi
         cVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633081; x=1715237881;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCOzvp6QxP/hXwE5Y9W1gwdgfBsEHmk7xOXrbcEFRKA=;
        b=q6bfmER6bpl5IviD6k0md4LeUUTPPFa96ZfPoD+AyHmvw6h/NFfRbAh8oIyfRNeP91
         e2PdlkmAwpTx9iGfI9BlViec4+8TXEA5+A/rCAQM8MYcgPnK923i/XWy59UM/mdG1S3d
         2vIOl4PrMPTv3aLVd0R2e9+Tyj1rgNvPJLpRvJ/3kWGSTp1VZK9DLxhsnA1gJZWjAZ2a
         yHXIjxDc9eCI8P22sK4UoLV4HBjwLESFqmzhipA9lhpzBxh/GztKYNdE3KcDIP61AerY
         YZTj00dIyNf7OXU/5wedYg5aV65vBNQLKUS23q3u0PZ57NHUwrWNo5Sqc6L1YR4bR81j
         GfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNrcS9cXIItVEwhpPngj8etOlsWPRBY+ogb+/ESjS28bnUbDI7ZR1c3+1SY8+ULJyUSCL5Mp8FYJM+HHFm6cHXSfwY/R+Vewih/FTN+A=
X-Gm-Message-State: AOJu0YxzO2qpHhDOxDRIk4GxbpuEebu2RkNA07kGBMxlU62lfCx8KdJr
	o1R9aIWrN4lhwEXdhjK8NKZrS1+Ah6OK8hxBulgFw83EujvEGShNX7gnyqtwAA==
X-Google-Smtp-Source: AGHT+IGwPphjtRzMFFKpSGhz7HxpTDjRFtdYxYlL7qSEyU5FvCZejfBTg8NTO8bOdoVhk1zzJ6MWig==
X-Received: by 2002:a2e:9d8d:0:b0:2d8:5b46:788c with SMTP id c13-20020a2e9d8d000000b002d85b46788cmr621431ljj.17.1714633081011;
        Wed, 01 May 2024 23:58:01 -0700 (PDT)
Message-ID: <4a280eab-81f7-4a87-b531-3633311a4c4a@suse.com>
Date: Thu, 2 May 2024 08:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
 <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
 <e0963ddd-c3b7-44dd-a3b7-67811f3e9d7a@cloud.com>
 <52741b69-8bcb-492f-a8bc-f035b2747fe8@suse.com>
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
In-Reply-To: <52741b69-8bcb-492f-a8bc-f035b2747fe8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 08:55, Jan Beulich wrote:
> On 01.05.2024 18:35, Alejandro Vallejo wrote:
>> Hi,
>>
>> On 26/03/2024 16:41, Jan Beulich wrote:
>>> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>>>> --- a/xen/lib/x86/policy.c
>>>> +++ b/xen/lib/x86/policy.c
>>>> @@ -2,15 +2,78 @@
>>>>  
>>>>  #include <xen/lib/x86/cpu-policy.h>
>>>>  
>>>> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>>>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>>>>  {
>>>>      /*
>>>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>>>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>>>> -     *       until all infra is in place to retrieve or derive the initial
>>>> -     *       x2APIC ID from migrated domains.
>>>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>>>> +     * the next topological scope. For example, assuming a system with 2
>>>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>>>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>>>> +     * the number of threads in a module.
>>>> +     *
>>>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>>>> +     * level (cores/complex, etc) so we can return it as-is.
>>>>       */
>>>> -    return vcpu_id * 2;
>>>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>>>> +        return p->topo.subleaf[lvl].nr_logical;
>>>
>>> Is "!= Intel" really appropriate here? I'd rather see this being "AMD || Hygon".
>>
>> Sure, I don't particularly mind, but why? As far as we know only Intel
>> has this interpretation for the part counts. I definitely haven't seen
>> any non-Intel CPUID dump in which the part count is the total number of
>> threads (Centaur/Zhaoxin are not multithreaded, and don't expose leaves
>> 1f or e26, as far as I could see).
> 
> Because of x86'es origin and perhaps other historical aspects, cloning
> Intel behavior is far more likely. The fact that Hygon matches AMD is
> simply because they took AMD's design wholesale.

Perhaps: See how many dead ends AMD have created, i.e. stuff they proudly
introduced into the architecture, but then gave up again (presumably for
diverging too far from Intel, and hence lacking long term acceptance):
3DNow!, LWP, and XOP just to name those that come to mind right away.

Jan

