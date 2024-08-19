Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF539565A2
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 10:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779362.1189099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfxm4-0007wi-9D; Mon, 19 Aug 2024 08:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779362.1189099; Mon, 19 Aug 2024 08:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfxm4-0007u2-6H; Mon, 19 Aug 2024 08:30:00 +0000
Received: by outflank-mailman (input) for mailman id 779362;
 Mon, 19 Aug 2024 08:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfxm2-0007tw-Dz
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 08:29:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 366a3372-5e05-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 10:29:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso547819766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 01:29:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6975sm606113366b.41.2024.08.19.01.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 01:29:54 -0700 (PDT)
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
X-Inumbo-ID: 366a3372-5e05-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724056195; x=1724660995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HhK5LmhLJrjxqPJMGiybz52HfegyVbi8scbd5zKGW9w=;
        b=Z7RlrH6dgr6p5BmnoFOdQRyk8aeDZrgKP3sw21RIL8RTXEreo0IpcaLo+4PyJOTFIz
         gu0Wkrd6lcTgWR6xC+t7nyO01U3AG2AqrU/LayoReUVUVzBxuQrMHLSM5GXHY6jADkRS
         byqGIRVJe0DdMyM8lwlqco43NJW/VSSQ2AbylJ5xnZcjo0RoEDCIEEG69aRc5oP9kcJ/
         GT3lMyp3Qs1DoCEcnH/AQo3qsYQl/4sZ+HxGwGQhBKyMVYOr411JPcnAQIv3kV+yc+ch
         OZDgUbEzSANrnC7pUizp8MXNpgiiKpkKClqtGm9CEW6ToZiygfutY02xj4rRywbvHIzV
         dp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056195; x=1724660995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhK5LmhLJrjxqPJMGiybz52HfegyVbi8scbd5zKGW9w=;
        b=ESw+x/XCZizOOy/TqW5r/IXyWeo262gUtXDS3QCwhfaaCagMdGKTMj57Zmcg55ZcKS
         2IMdFv+Upr+/0x9VXNgt0o395OXjrAdemc9VvZMx4R1Ay67tNzFKUXrIzjI4KApsqLwX
         UwZt4D0JldRSmXHjxwSRtOemUqXVNiwFPBighhqCdlhG+7VirDJdXDuN8T4X4W0XD3R0
         4zIk3h+hiJODqt9OJjSQ+hm/dHKzvK0YyA4GthO597XVpHlXx7M5m4oTTvbsTdJlAvFL
         Ff/6iZ6D14UxXaLLM5dYce12VWnj+debCUoyBBwRgPecmTZ9Kb0xoSx8ntZG//pMQP9z
         RDEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ShyBw57naEfRJvfvRSOIO+0hR5CzeggDBbwWoQNkH7QqpyUbZeK1pE/1TKH2pvA4LPGl7lUJByI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzU1gXTZLUaIg3MC8PMn+oLnVJUyvf2/WqK0a6zsSDloGf+9x54
	eTNbsbR+XhWwHtXZCRKnrUrMaCF1n8p81jFoN5oQipab2QDXrkC7gJ8nPU/qkQ==
X-Google-Smtp-Source: AGHT+IFcnvCPLLYA6YkTVzTK+K6pSWLhYBs/S9v7rxRHWxNlzIY3tiuK90KQ1hgn+n+R8bw1S4WfEQ==
X-Received: by 2002:a17:907:d2cf:b0:a7a:9f78:fef with SMTP id a640c23a62f3a-a83929f1229mr788493166b.45.1724056194692;
        Mon, 19 Aug 2024 01:29:54 -0700 (PDT)
Message-ID: <3f216f24-f89c-4060-9fbe-045bfd6a90ee@suse.com>
Date: Mon, 19 Aug 2024 10:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86/hvm: use a per-pCPU monitor table in HAP mode
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-14-roger.pau@citrix.com>
 <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>
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
In-Reply-To: <D3HJ80ZGO0MR.2JCGJIV5JPYQP@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 20:02, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
>> Instead of allocating a monitor table for each vCPU when running in HVM HAP
>> mode, use a per-pCPU monitor table, which gets the per-domain slot updated on
>> guest context switch.
>>
>> This limits the amount of memory used for HVM HAP monitor tables to the amount
>> of active pCPUs, rather than to the number of vCPUs.  It also simplifies vCPU
>> allocation and teardown, since the monitor table handling is removed from
>> there.
>>
>> Note the switch to using a per-CPU monitor table is done regardless of whether
> 
> s/per-CPU/per-pCPU/

While this adjustment is probably fine (albeit I wouldn't insist), ...

>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -104,6 +104,54 @@ static const char __initconst warning_hvm_fep[] =
>>  static bool __initdata opt_altp2m_enabled;
>>  boolean_param("altp2m", opt_altp2m_enabled);
>>  
>> +DEFINE_PER_CPU(root_pgentry_t *, monitor_pgt);
>> +
>> +static int allocate_cpu_monitor_table(unsigned int cpu)
> 
> To avoid ambiguity, could we call these *_pcpu_*() instead?

... I can spot only very few functions with "pcpu" in their names, and I
think we're also pretty clear in distinguishing vcpu from cpu. Therefore
I'd rather not see any p-s added to function names.

Jan

