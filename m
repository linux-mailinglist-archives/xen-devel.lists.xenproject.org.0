Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E750AA5087
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973778.1361828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9X3-0004vd-Sy; Wed, 30 Apr 2025 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973778.1361828; Wed, 30 Apr 2025 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9X3-0004tb-Pu; Wed, 30 Apr 2025 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 973778;
 Wed, 30 Apr 2025 15:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA9X2-0004tV-Hw
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:39:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e7e2229-25d9-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:39:30 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so1475595566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:39:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6aed0sm939586666b.135.2025.04.30.08.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:39:29 -0700 (PDT)
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
X-Inumbo-ID: 4e7e2229-25d9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746027570; x=1746632370; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ0FLs3fbIZrV2Du2vPVcS0e7BbfqxRd3da7bpVYfhw=;
        b=JsOlPoCB7aI5Ap2SO21IyVflqi59xwq+dggJ20p68wFRHZjUAe1zDnEcX7qwz7lS+1
         932OOsrT+nOfAZhMpBxVmrFpDlen3EEdH9ctLbYEkCcUPjHD1swW7nRyCi6ImKwvVJIm
         gnzjQtAVFwen8dj+ERbKgv/Z9I+RI5+/0qiA6EF0OnnOOd9zTH5Rl/XYSOfz7vOGf2DE
         5+orreR6RGo+bzOkYJGyTlveBUeuObMJuqC+8Z2RE/pCAxOTrCRTLoiOJ2nyvyINv2o3
         7dlpH0AhCpDsK7H1YNVM0qwnSrJ4t/O1OVMDwhy3Cl2Ggn1r4tC/CuL8WKBRV03e/QRY
         2bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027570; x=1746632370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ0FLs3fbIZrV2Du2vPVcS0e7BbfqxRd3da7bpVYfhw=;
        b=pq/rmAyn5fuBEf0GMa/O2tNkIbqHDmk46QPbDCUg0dMM142sA6lala/NQ7eCLqaHbq
         Q18fqeOKuZCJFJSO/7OngkCgSP4bdPFtkvMETEBQaRtpt/7h7x+TDE0CGKr0jWDzq/vo
         V+H3BjY/QsTY3En0GfJ6UttreIjWevKsiUmmMCBBx2MphZrI/zG84o9Bc60c1qAgxxXe
         s07qAwA1eWFictN1/1+uuf/fXkQ2FlwCU1b8DqQ30UQZnUybRgqdZdDhko1fHhLkKbhR
         +utCfaE4y5I1Lf1HzHS2f6ra5l1DxLz6AT4R6bxgqHPh2einICjc8BIorum9wK9TxOaZ
         i9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCKysReORQM3FVvRf8fxBV+rsQRCodx15zsh5pB/d8GrQfYLD2Oel2RJjBNr9DFWHT3TLRGbfRRTU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOyuvb+MvH9TISvf8v1IqMfVwYSfFJgyftGF8uSeddmTX3cjPi
	oNGIm5382WOmhg9ikK8Ue9GxxuIG7SFPTsjNtZ/64Xv/UQWQjhh9my4bjJdsdA==
X-Gm-Gg: ASbGnctW9PBJejuuZqThgMxjnPY0aZ+0e33ygCG+b/y7EAtBA5XBZ9L6U8V8AOO9oRL
	SQKvbD1BX0qafr9gHLIFC/cfp2W7LH4KfmtBisksHAaTNZ543J6jTbD6haObsssgl31ZeRAgreV
	9nq1p1jIs+6msc+Ia03jXT4SToU/juXdwg4qYFdEoChX4us1xAUcphJqYUQSKhy3+bDcsWeUd6o
	e82NDZyzY91yBM+P7U62ug0B1+7SArDKENMLPJ5KjEA+iFgLXnZvuYW/55LJPH1RbylZhS+EHte
	qAtOOY+t0glG75AhcNTXKVpYYSDcb3zqEMiCaRYeKJQFPnTct0jTFjFaWjONnzXiC7F899ah6KL
	U4lXxm8VNkLMjIgN0lS52xCfxNw==
X-Google-Smtp-Source: AGHT+IHtlhH+lQgTniT5lCXgwPE32Sg8vCNtLBz1cc7O/sfEzfqXpnLvaFOrqOBsQHdBewsHFLYn8w==
X-Received: by 2002:a17:907:c22:b0:aca:a35e:59fe with SMTP id a640c23a62f3a-acedc5944e2mr415156466b.1.1746027569980;
        Wed, 30 Apr 2025 08:39:29 -0700 (PDT)
Message-ID: <7f0b957d-e519-48f0-b15b-68f7880eece7@suse.com>
Date: Wed, 30 Apr 2025 17:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] xen/riscv: initialize interrupt controller
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <cb730a1293f14dd7fd58f98f5ecda4e2523b2d90.1744126720.git.oleksii.kurochko@gmail.com>
 <bcffc56a-5518-4bcc-9124-d49a98ae727a@suse.com>
 <4851cd30-73a5-4d97-b506-850d67c285d7@gmail.com>
 <ee057161-6f24-44f2-a009-fec5885c6f11@gmail.com>
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
In-Reply-To: <ee057161-6f24-44f2-a009-fec5885c6f11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2025 17:34, Oleksii Kurochko wrote:
> 
> On 4/17/25 12:11 PM, Oleksii Kurochko wrote:
>>
>>
>> On 4/15/25 5:59 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> Call intc_init() to do basic initialization steps for APLIC and IMISC.
>>>>
>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> Acked-by: Jan Beulich<jbeulich@suse.com>
>>> yet ...
>>>
>>>> --- a/xen/arch/riscv/setup.c
>>>> +++ b/xen/arch/riscv/setup.c
>>>> @@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>>   
>>>>       intc_preinit();
>>>>   
>>>> +    intc_init();
>>>> +
>>>>       printk("All set up\n");
>>>>   
>>>>       machine_halt();
>>> ... this being everything here I wonder if this can't be folded with the
>>> patch where the function is introduced.
>> Sure, it can be folded. I will do that to reduce patch series.
> 
> I doubled checked and, at the moment, when intc_init() is introduced:
> void __init intc_init(void)
> {
>      ASSERT(intc_hw_ops);
> 
>      if ( intc_hw_ops->init() )
>          panic("Failed to initialize the interrupt controller drivers\n");
> }
> 
> intc_hw_ops isn't registered as they are registered in the next two patches after
> intriduction of intc_hw_ops.

Which then feels wrong anyway; you're then merely leveraging that the function
has no caller, which (as said elsewhere) shouldn't be the case at the very least
for Misra's sake. So I expect some re-ordering to be necessary. Or you may want
to introduce the function empty and add the intc_hw_ops uses as intc_hw_ops is
introduced.

Jan

