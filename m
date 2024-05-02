Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E98B94EA
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715577.1117313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QLl-0005ze-K2; Thu, 02 May 2024 06:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715577.1117313; Thu, 02 May 2024 06:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2QLl-0005wu-GD; Thu, 02 May 2024 06:55:25 +0000
Received: by outflank-mailman (input) for mailman id 715577;
 Thu, 02 May 2024 06:55:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2QLk-0005wo-EA
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:55:24 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f05bed-0850-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:55:22 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e01d666c88so48273551fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:55:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b0041be609b1c7sm4556592wmg.47.2024.05.01.23.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:55:21 -0700 (PDT)
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
X-Inumbo-ID: f1f05bed-0850-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714632922; x=1715237722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLW3A3W679+djf8LQqd0VGX3LYFdhxBCP7IKuy2SWvg=;
        b=YGTTSuQKK/KnPrycOojQfsF6TnXL1/bDCrMjo6vzGzeRhI8v8/H4I62KHhwVCO/LCX
         JFcqBmbIAg7BVGpqhMOnedIbNV/GMEif20JUYIGzaaNiTuhaeoS6GAFosOyRS0j/Bk9V
         Uu/qWjuuv4by1lH+NLR4SxbJiQ6ICHWTviSI581oRc7JKTc3186eEYbegIw+zVsQEn/X
         F76fqeCgtsLZBagUxRRDnO4AyTMxdx3fDxnw1zycTfuyLYtJrYlBBx7xQCAdjMsferLn
         9PbFofHoxX5uJBDG7r/qun6vokz+08WlJlnO/MRKosdsaO1RdULTzsJc7CpgxfJfZRGV
         8hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714632922; x=1715237722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLW3A3W679+djf8LQqd0VGX3LYFdhxBCP7IKuy2SWvg=;
        b=qDpuW4ygtZutFKr3+hMDESqS5fs/0CV6sSJ/75ttpR08G/KMJnHRikqpVHr8FPy2iD
         8Cn6qgQle4QPPog/X/M12tNRFu38SIQ0usXnNF+DVd8V48xCpyk2wdZMEqSdAfFT7Xu+
         +ZWVvLKm1lPY2kPn353mKRclwtZ8kzttgzCedv1MUmfZnCtkL1i1UWmXAw8hmCVMrdIJ
         wHmTN0xIwYtXcDY4PLfc6l9VQswqBGcD/g3Qc37OoYiXmkPWsZkMAo2rzTHD47czSsLr
         eMFt1eZOPhFHwKM/xIXeV+7NKSXdJ8fZoWLjFASs8kbh3EV54dzH8PXzrlaf4zARQl/C
         n6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXkEiaWEw1q3kMOsKY4/wAsCJZRWERJY6otzhScYygP9gCxFx4TL4c2zuOqSNuEYBWcDwbl9nEkKpOcQ2bO+0DJq8QSBY/dRaUlrgnjw9Y=
X-Gm-Message-State: AOJu0Yy603jRDobSv31KFaIJW6Q5bGuR9DwBI5w6RWfDi+Vxb3j0AqXX
	59N7OM1ljNAUs8SQv22UzBHxxRyrTofLVpVtKcgd8GxmuP0qfp4MH7OOM9Uu/Q==
X-Google-Smtp-Source: AGHT+IGVOyu6L11lfIuoIjTVmrfoxWNT36SdASpjj+MglQQnCkoeTOWrP664Kg7flhGmDPLfNg/LNA==
X-Received: by 2002:a05:651c:a10:b0:2df:c0b8:2dd6 with SMTP id k16-20020a05651c0a1000b002dfc0b82dd6mr3465809ljq.21.1714632921584;
        Wed, 01 May 2024 23:55:21 -0700 (PDT)
Message-ID: <52741b69-8bcb-492f-a8bc-f035b2747fe8@suse.com>
Date: Thu, 2 May 2024 08:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
 <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
 <e0963ddd-c3b7-44dd-a3b7-67811f3e9d7a@cloud.com>
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
In-Reply-To: <e0963ddd-c3b7-44dd-a3b7-67811f3e9d7a@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.2024 18:35, Alejandro Vallejo wrote:
> Hi,
> 
> On 26/03/2024 16:41, Jan Beulich wrote:
>> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>>> --- a/xen/lib/x86/policy.c
>>> +++ b/xen/lib/x86/policy.c
>>> @@ -2,15 +2,78 @@
>>>  
>>>  #include <xen/lib/x86/cpu-policy.h>
>>>  
>>> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>>>  {
>>>      /*
>>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>>> -     *       until all infra is in place to retrieve or derive the initial
>>> -     *       x2APIC ID from migrated domains.
>>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>>> +     * the next topological scope. For example, assuming a system with 2
>>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>>> +     * the number of threads in a module.
>>> +     *
>>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>>> +     * level (cores/complex, etc) so we can return it as-is.
>>>       */
>>> -    return vcpu_id * 2;
>>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>>> +        return p->topo.subleaf[lvl].nr_logical;
>>
>> Is "!= Intel" really appropriate here? I'd rather see this being "AMD || Hygon".
> 
> Sure, I don't particularly mind, but why? As far as we know only Intel
> has this interpretation for the part counts. I definitely haven't seen
> any non-Intel CPUID dump in which the part count is the total number of
> threads (Centaur/Zhaoxin are not multithreaded, and don't expose leaves
> 1f or e26, as far as I could see).

Because of x86'es origin and perhaps other historical aspects, cloning
Intel behavior is far more likely. The fact that Hygon matches AMD is
simply because they took AMD's design wholesale.

Jan

