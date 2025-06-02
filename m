Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDEACACFB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003193.1382688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM32F-0007rl-9D; Mon, 02 Jun 2025 11:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003193.1382688; Mon, 02 Jun 2025 11:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM32F-0007qA-6U; Mon, 02 Jun 2025 11:08:55 +0000
Received: by outflank-mailman (input) for mailman id 1003193;
 Mon, 02 Jun 2025 11:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM32E-0007q4-9r
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:08:54 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76d0e65-3fa1-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:08:52 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a3771c0f8cso2573775f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 04:08:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2ecebb5cf4sm5319150a12.63.2025.06.02.04.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 04:08:51 -0700 (PDT)
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
X-Inumbo-ID: f76d0e65-3fa1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748862532; x=1749467332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=96Jm4u7S2nACcTkv3aiaQogQWrM493OmL6c8k6PLNIY=;
        b=LeN9Pyr2lkXb7L54xlbpzqubjJkYzwd3dvZEMYc2R/jHrJf6jkAQHkVJCmL2iJt8KG
         8zV8bdaBxCKNWvYViBE3xDvi7WhfC210PvJrTQA2b+O7itset7FgDca237swiXvQhBJB
         iGRgp4Kd/imHIrIC3gH1mqyjbUq17vTcSAfVFgrCT6iuTs+/Q6qguwv7Z3OR7+QUUzEn
         J+qiBLU8C2gqTeEi00dUNZK6s6fM6ehRo0fwwhLfJnjp/ZtMwvbDxGWYZdVDu1E8vcRE
         buE5QQOgL1L0GFpO5iP1WWXuWbfnMrx6hH6o3i9T7TFM+oy9ZgREK8xyz3ImWt1pOrDZ
         zc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862532; x=1749467332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96Jm4u7S2nACcTkv3aiaQogQWrM493OmL6c8k6PLNIY=;
        b=G1rdYe0tbXk478E1i3cP3WiNDjjSO3nIrX9scd2Ai0WbdsLIwOWejrAVyTwNTmZyM2
         sfdFQye25/5ID4Q3PE40BP5x5u3TC91JNe2lm2arOErU8cCKguMT36Rr7YuhapWuw8lg
         gwrNmj5e1f01Qp5J32tY9ysE53Y18tXBNx633KlpqpO20QTOBQgHpi7dUIJyduVEA5s8
         EjTsDBXer2uXxzqRqqDOsEJInevzDzxDqUN3KGjhrQrkI59wGe8buGVZ6hS7XkWDN6kn
         lJjChMcSvLIzldsdEKRomh0Hykp3fDkp92iBgIyVdFS1ua5rznLsY0osXk5JM9n8WMab
         1Oug==
X-Forwarded-Encrypted: i=1; AJvYcCUU/DOVjK2yA+qTjOz0fyC/puLYaePIwPNdahCpt++sFsHWeSgsBapwLHa6amrA+L/ds9lr/VZeW+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfhR7SqEygk9FKq1uNOAVwW6giCXdF10EAR0v2/11rlVu/38AQ
	impGszgJpUMaW8K8AGAYgFIEXhrcSPTmrfTYc3uUOOQBlPrQ4d17ytA/p6Ir32WeVg==
X-Gm-Gg: ASbGncu4YgKemcu7R6F0f/yJZFFF2jUPc/Sbvfq3lzuTULnBJK4Ty2qKSDLRINKWni2
	+NvmYgOkOxaiPvrF7zbVs4BbPYXr8TcflEMUEhDQnx5gK8c0AARwajzlGXnsDKBxuoXM+baD/kZ
	uWgxgDoTXIQqTt6QRFRCLjZupkx450EBUH27eH4FwSuQYqhZA3xiStoAupRyZglY1apjhGlZvuD
	3nGvk+I7xl4W3Azt5C2neW6LBsXQ3YLhSQoaT86ZFXyGnPK6Ojx2kDXZ78W7tvufyI2YHZO/50y
	4s5x/xU8+MZW2UzoJAdaztqevszLwmqZ+SOpd9snsPlpQl6XtYo1P0Z9lq2SOsKaE68Kx/wh2nG
	Q0TvPuBXa3L+yjpnr+dgyBb9MwWiRCzRKgpJr
X-Google-Smtp-Source: AGHT+IE17IcbAk117yb+VazU9R8BhdlB8O38D4gJtLMbLIrTkj3SMvh5OlDER/EzWMVNqE31xHfVcQ==
X-Received: by 2002:a5d:5f88:0:b0:3a3:7bbc:d959 with SMTP id ffacd0b85a97d-3a4f89a89f7mr9349113f8f.18.1748862531641;
        Mon, 02 Jun 2025 04:08:51 -0700 (PDT)
Message-ID: <5ce4c4a6-8e2e-4b4e-9cec-03a78d1d0173@suse.com>
Date: Mon, 2 Jun 2025 13:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: construct the P2M pages pool for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <c9c60bb73fcae0b72d3bc18c10f5ca6cccc5a676.1746805907.git.oleksii.kurochko@gmail.com>
 <b0b4348e-38e5-4138-9e0b-3378f1207bfe@suse.com>
 <4a6136c3-4146-48e6-85d5-4a6f30bc9920@gmail.com>
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
In-Reply-To: <4a6136c3-4146-48e6-85d5-4a6f30bc9920@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2025 12:27, Oleksii Kurochko wrote:
> On 5/20/25 4:38 PM, Jan Beulich wrote:
>> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -1,4 +1,12 @@
>>>   #include <xen/domain_page.h>
>>> +/*
>>> + * Because of general_preempt_check() from xen/sched.h which uses
>>> + * local_events_need_delivery() but latter is declared in <asm/event.h>.
>>> + * Thereby it is needed to icnlude <xen/event.h> here before xen/sched.h.
>>> + *
>>> + * Shouldn't be xen/event.h be included in <xen/sched.h>?
>>> + */
>>> +#include <xen/event.h>
>> The question doesn't belong here; such could be put in the post-commit-
>> message area. And the answer depends on what dependency you found missing.
> 
> It is needed for local_events_need_delivery() which is used by general_preempt_check()
> in p2m_set_allocation(). Otherwise, the following issue will occur:
> 
> In file included from ././include/xen/config.h:17,
>                   from <command-line>:
> arch/riscv/p2m.c: In function 'p2m_set_allocation':
> ./include/xen/sched.h:941:36: error: implicit declaration of function 'local_events_need_delivery' [-Werror=implicit-function-declaration]
>    941 |         (!is_idle_vcpu(current) && local_events_need_delivery())    \
>        |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ./include/xen/compiler.h:26:43: note: in definition of macro 'unlikely'
>     26 | #define unlikely(x)   __builtin_expect(!!(x),0)
>        |                                           ^
> arch/riscv/p2m.c:244:27: note: in expansion of macro 'general_preempt_check'
>    244 |         if ( preempted && general_preempt_check() )
>        |                           ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

In which case my answer to your question is "No". Others may take a different
perspective. (xen/sched.h being included virtually everywhere, imo we want to
avoid adding dependencies there which aren't strictly necessary to keep things
building.)

>>> @@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
>>>   
>>>       return 0;
>>>   }
>>> +
>>> +/*
>>> + * Set the pool of pages to the required number of pages.
>>> + * Returns 0 for success, non-zero for failure.
>>> + * Call with d->arch.paging.lock held.
>>> + */
>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>> +{
>>> +    struct page_info *pg;
>>> +
>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>> +
>>> +    for ( ; ; )
>>> +    {
>>> +        if ( d->arch.paging.p2m_total_pages < pages )
>>> +        {
>>> +            /* Need to allocate more memory from domheap */
>>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>>> +            if ( pg == NULL )
>>> +            {
>>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>> +                d->arch.paging.p2m_total_pages + 1;
>> Looks like you copied this from Arm, but this code is bogus: Using
>> ACCESS_ONCE() just on the lhs is pretty pointless. Once also used on the
>> rhs the expression can easily become
>>
>>                  ACCESS_ONCE(d->arch.paging.p2m_total_pages) += 1;
>>
>> or even
>>
>>                  ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>
>> .
>>
>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>> +        }
>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>> +        {
>>> +            /* Need to return memory to domheap */
>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>> +            if( pg )
>>> +            {
>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
>>> +                    d->arch.paging.p2m_total_pages - 1;
>> Same here then, obviously.
>>
>>> +                free_domheap_page(pg);
>>> +            }
>>> +            else
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +        }
>>> +        else
>>> +            break;
>>> +
>>> +        /* Check to see if we need to yield and try again */
>>> +        if ( preempted && general_preempt_check() )
>> While it's this way on both Arm and x86, I wonder how useful it is
>> to check on every iteration, especially when freeing pages back to the
>> buddy allocator.
> 
> IIUC, but a preemption request could happen for both cases. And destroying of
> a domain could also consume long time and so not to block hypervisor if something
> more urgent should be handled it could be also have this check for the case of
> freeng pages back to the buddy allocator.

The question wasn't whether to check, but how frequently. The check itself is
consuming processing time, too, so one generally wants to balance the number
of checks against the size of the resulting time window without any check.

Jan

