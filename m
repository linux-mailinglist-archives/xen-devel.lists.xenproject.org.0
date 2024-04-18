Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFDB8A9E22
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708473.1107420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTVn-0001Ce-KX; Thu, 18 Apr 2024 15:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708473.1107420; Thu, 18 Apr 2024 15:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxTVn-0001Ag-Gm; Thu, 18 Apr 2024 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 708473;
 Thu, 18 Apr 2024 15:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxTVm-0001AR-Mf
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:17:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc3bc24a-fd96-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 17:17:14 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418c979ddd2so7045245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 08:17:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c501100b00418ed55a4bcsm1951876wmr.23.2024.04.18.08.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 08:17:13 -0700 (PDT)
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
X-Inumbo-ID: bc3bc24a-fd96-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713453433; x=1714058233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auLWTFGYyGt9RYg45VIIjzCOl7935/ASIBzNrpmQd/I=;
        b=TUW2j8Du/e9IUtLABdHYzAR6EeJdpA1AYXaKAkkxrT8Kq25AmJpleT4E2+khhyISu0
         edZqcDpc6i0B4tWtducLPVsy/2zZqhX+HsDHGQ2bbm5jcn6tAvzfdPzC5Nm6r1WF9kpA
         TrLtnXvwOo6EbvRRQpk7y99X1sL+BOFSsVC3J/A9AA1ceYIg6EHyXGbeO/qyFlaM7RrD
         b0YqQQkfuSbGXrhkbQmJ7T+KW4zrN+Ox25f8uYBxpmQVKEvd6q6V1jf76NbCWo9z9FRc
         Esjq+iQLvcCIPkw86AmlZV2mGMXAGzaee2Mqe3hyCO9hASzs4GXa7UqSPT+tVesWpQVt
         wzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713453433; x=1714058233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auLWTFGYyGt9RYg45VIIjzCOl7935/ASIBzNrpmQd/I=;
        b=iRGKDhX20LnGs3csllfYLHmWxPG6tkoTjQ+NkOHLhzFcJm82xYJ6wgysKk0VPJnZrV
         t4R9fzxZaxTJjqXhMI9+HbkuUrgCWc6JdY56GOU+8WnnAOt2eDT9vXjQD2/E1eYLcXYi
         xhxXKJivVLmg+CJQT7ISdbYqh8mb3PyuuMcpF9iY/ImdE14l/cKH4UBadN5Rubcm9ZfI
         90wFaeTQcVBIf1t3bTSNIXS8JG9UJYo5Xan/u+bB6vKojQH7hoEJDq48IOQ5Irruy8SJ
         DDqmN0BAlPues9KlfpTrCOwGS2GQl3LG3Z+R4jJwIvW7YVjpk5vzr+vVEnwWPJcfQFF+
         23Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVSis45DbKIM7bqAPRx/vwrtI2aYtILwzDkztijP0SJDw1q3q6gKKBguwmlF1zRm497H5DTWDPhbbIFz8sQUza5nwX1aGzk/kyHtxYwkow=
X-Gm-Message-State: AOJu0YwK6DXWQvkN27N2nbCCoThzGySgPUOLY+UfSIhAJfiNClgUuhd3
	Xl0znwJRwFspacJZaTDdxb4puqBSXAphBugcaJxSwom80UqO4eX8/QFba76S9A==
X-Google-Smtp-Source: AGHT+IHW2QGWKRp76bIdxRFNlmIj/vggQXeBMk/aNBsungi8Bln1CXzdmwyQlr6EZ65N5UQhp96+vw==
X-Received: by 2002:a05:600c:3d93:b0:418:f991:8ad3 with SMTP id bi19-20020a05600c3d9300b00418f9918ad3mr492345wmb.41.1713453433564;
        Thu, 18 Apr 2024 08:17:13 -0700 (PDT)
Message-ID: <4e87e0bf-2507-4cad-a8d3-5094aee22b8a@suse.com>
Date: Thu, 18 Apr 2024 17:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240404212519.16401-1-jason.andryuk@amd.com>
 <20240404212519.16401-3-jason.andryuk@amd.com>
 <70ab0f9d-a451-44a5-8927-4200dbb96a08@suse.com>
 <13d1943e-6341-46de-a356-dc6b92945f3b@amd.com>
 <f4864450-0cba-4ff8-9a39-aad792aab026@suse.com>
 <4ad076f8-7553-4421-8da1-e482927ec1f7@amd.com>
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
In-Reply-To: <4ad076f8-7553-4421-8da1-e482927ec1f7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 16:34, Jason Andryuk wrote:
> On 2024-04-17 09:24, Jan Beulich wrote:
>> On 08.04.2024 18:56, Jason Andryuk wrote:
>>> On 2024-04-08 03:00, Jan Beulich wrote:
>>>> On 04.04.2024 23:25, Jason Andryuk wrote:
>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>> @@ -537,6 +537,111 @@ static paddr_t __init find_memory(
>>>>>        return INVALID_PADDR;
>>>>>    }
>>>>>    
>>>>> +static bool __init check_load_address(
>>>>> +    const struct domain *d, const struct elf_binary *elf)
>>>>> +{
>>>>> +    paddr_t kernel_start = (uintptr_t)elf->dest_base;
>>>>> +    paddr_t kernel_end = kernel_start + elf->dest_size;
>>>>> +    unsigned int i;
>>>>
>>>> While properly typed here, ...
>>>>
>>>>> +static paddr_t __init find_kernel_memory(
>>>>> +    const struct domain *d, struct elf_binary *elf,
>>>>> +    const struct elf_dom_parms *parms)
>>>>> +{
>>>>> +    paddr_t kernel_size = elf->dest_size;
>>>>> +    unsigned int align;
>>>>> +    int i;
>>>>
>>>> ... I must have missed when this was changed to plain int. It should have
>>>> been unsigned int here, too, ...
>>>>
>>>>> +    if ( parms->phys_align != UNSET_ADDR32 )
>>>>> +        align = parms->phys_align;
>>>>> +    else if ( elf->palign >= PAGE_SIZE )
>>>>> +        align = elf->palign;
>>>>> +    else
>>>>> +        align = MB(2);
>>>>> +
>>>>> +    /* Search backwards to find the highest address. */
>>>>> +    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
>>>>
>>>> ... with this suitably adjusted. However, I'm not going to change this while
>>>> committing, to avoid screwing up.
>>>
>>> I intentionally changed this.  Looping downwards, a signed int allows
>>> writing the check naturally with i >= 0.  I think it's clearer when
>>> written this way.
>>
>> Just to clarify: Is
>>
>>      for ( i = d->arch.nr_e820; i--; )
>>
>> any less clear?
> 
> It's not something I normally write, so I had to think about it more. If 
> you are already familiar with such a construct, then that isn't an issue 
> for you.
> 
> Your way is more subtle in my opinion because it relies on the post 
> decrement to ensure correct bounds within the loop body.  I prefer i >= 
> 0 because it clearly states the valid index values.
> 
> Is your main concern that you only want unsigned values as array indices?

Yes. Besides eliminating any concerns towards possible underruns, that also
often allows the compiler to produce better code.

Jan

