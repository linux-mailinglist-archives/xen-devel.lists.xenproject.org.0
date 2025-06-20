Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA1AE13A8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020600.1396734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSV3q-0000Ye-NN; Fri, 20 Jun 2025 06:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020600.1396734; Fri, 20 Jun 2025 06:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSV3q-0000Vs-KQ; Fri, 20 Jun 2025 06:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1020600;
 Fri, 20 Jun 2025 06:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSV3p-0000Vm-8T
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:17:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336ea476-4d9e-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:17:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1315509f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:17:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a226fe4sm3395639a91.2.2025.06.19.23.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:17:10 -0700 (PDT)
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
X-Inumbo-ID: 336ea476-4d9e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750400231; x=1751005031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E+IpF9D+V6/NZPnUseyfSOmXd8So1XbMkvzT9T24fh0=;
        b=MSdeSqFPz+HsYqvB7zeDEp+5q8XDEB6Zb8e5Eq2/X4Tmwkvr8Jwo4CMD1jq6X6JZhq
         jLjrsXbAIQ4Flb/7+Aqa85fsBIBJQB3dqbEdjCEGsDmS2TihGn6nBSB98Vh41NtfG/7i
         nuByoHrZOqLpkUo6XS3gFicAtNtqhq4RAGCe0vI8QNA4wklpnTqGbHqQvKOFolsM0g+q
         NFTlT2yYBjWrpj9LKW7+3Fnjfbl8rSne6f2j+aLndlf15kRbSHW69xE2qAweTvTF5sGn
         lICCWUnnwTngErhTfgaF/QLd2ua6C18RkoBrBzj4WK53fpUFOOct6xZgl74xcgs++ty6
         pxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750400231; x=1751005031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+IpF9D+V6/NZPnUseyfSOmXd8So1XbMkvzT9T24fh0=;
        b=Ud6RotS/c9srcuTzWIFTJj04+Ro8ZLV0hPT8+Kd7d9K9vW/OQD8GORxDEQcsdjUAYq
         2uauvFpA8uedMHRRp7rgVQPF+dLxehwTmwviTDUOTwKD3S1F37gssKKr5sgULk2U0/WB
         70Twji+hK3rnfT1orBYSwGH6IPlDU+a8rUjOk5EerX0PafXHdAisNW5cmTrQNe41GB4O
         1slxnOio7S8qaNKsLQGeXvFbUEywR32AtS3Z9rdpreTlEtQxfBTTP+bkCtgORQ0DRgcQ
         VxkQUur7nDPy7G9jnQ2tuYQ8stoiwXDd8VIPj26JLxAIdGbXh7wbac8KOk2TYmRL0Ljd
         ucDw==
X-Forwarded-Encrypted: i=1; AJvYcCUrRsnzdjLcL9da6EFsgtV/b6ONRo+xdtoKmN2GjZlCG6uIwmJH2JNbbpc/YMI01lC6eVbD/wwgZic=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQfWAOZNSj7rBRUi2UMjAxfxjCbTCcXUBSv8PqzbdPSmCEyOTV
	Y/V2WOp7r9nCxsUyDscMToKGsPLVd8qIDk9Vlud/q4gpvvmf5m/UY//aMx/YKMUPqw==
X-Gm-Gg: ASbGncvIlIY+Om66QwMaSxFpK0mGXOd9U6ZrOKppu8ftk8xUpLF5zOOpkopKjSwrnuq
	FoGjR21vSNoJB1BnvP1CCYPYNCJimSFA83PwFzExL5cGWJcaEZnj4Rje/8pfCjuUueX+6uchLao
	Ngf0xl1e3rZtUZ3K8A6H/icmwjCyaii3O4PIugMsOFitABftYX8wOUAREyCnmRv8/NcFbSc3wRL
	Z5yrtpskyDY5bHnujlLGRzT/1qFEqm6F1ihZqz2mUBGEbq0D11qQ6VlJpncGd1dFxkXAyJs/Ixy
	e3Y+zRfbdCDNW10mI7wIRu/Byv5cbXVOOxtMlClqNN/zqDW1dk7kRidtQEcOiflvdb41PKLhyN+
	8TAX6bf6WZGiMcO50yvGqXU8XTiGpUBTfKRtwW5rd5mSsQIc=
X-Google-Smtp-Source: AGHT+IFanpRNy+HD3R36kIiiHYC0C5zePnvN7u+bgA4Yc7+wQNXWjh+wHq8h55G6LRmLUIqv5T4xSg==
X-Received: by 2002:a05:6000:2002:b0:3a5:783f:528a with SMTP id ffacd0b85a97d-3a6d12fc180mr1229789f8f.59.1750400230608;
        Thu, 19 Jun 2025 23:17:10 -0700 (PDT)
Message-ID: <1d0fc483-d008-4745-8e27-0a2f6fab6b0d@suse.com>
Date: Fri, 20 Jun 2025 08:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
 <20250606212712.1901838-2-victorm.lira@amd.com>
 <20250606212712.1901838-3-victorm.lira@amd.com>
 <aFLYtSgt5b4lQwgv@macbook.local>
 <220ccb5869914c44cc2b1f7a152ee933@bugseng.com>
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
In-Reply-To: <220ccb5869914c44cc2b1f7a152ee933@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.06.2025 18:16, Nicola Vetrini wrote:
> On 2025-06-18 17:18, Roger Pau Monné wrote:
>> On Fri, Jun 06, 2025 at 02:27:09PM -0700, victorm.lira@amd.com wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs *regs, 
>>> bool show_remote)
>>>            (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT 
>>> CONTEXT");
>>>  }
>>>
>>> -void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
>>> +void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs 
>>> *regs)
>>>  {
>>>      fatal_trap(regs, false);
>>>  }
>>> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
>>> index c77f304bb0..8460a4a1ae 100644
>>> --- a/xen/arch/x86/x86_64/traps.c
>>> +++ b/xen/arch/x86/x86_64/traps.c
>>> @@ -293,7 +293,7 @@ void show_page_walk(unsigned long addr)
>>>             l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
>>>  }
>>>
>>> -void asmlinkage do_double_fault(struct cpu_user_regs *regs)
>>> +void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
>>
>> Does noreturn matter for functions called from assembly (asmlinkage
>> ones)?  In that case the hint is not useful for code generation, since
>> it's hand written assembly already?  (it's arguably useful for the
>> developer writing the code)
>>
>> Might be worth mentioning in the commit message if the above is
>> accurate.  For example by adding to the commit message: "noreturn is
>> not relevant for functions called from assembly, but can be used as a
>> hint for the developers writing the code".
> 
> Yes, it is relevant because the rule considers only the single function, 
> not the context where it is called (that is orders of magnitude more 
> difficult to check automatically). For my part, I'm ok with your 
> suggestion.

Right. In fact for non-static functions the attribute normally would go
on the declaration. The need to have it on the definition in the two
cases above is an aspect that may also want to go into the amended
description.

Jan

