Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5C8C7211
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:32:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722840.1127185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Vb1-0007rM-VH; Thu, 16 May 2024 07:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722840.1127185; Thu, 16 May 2024 07:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Vb1-0007of-Sb; Thu, 16 May 2024 07:32:11 +0000
Received: by outflank-mailman (input) for mailman id 722840;
 Thu, 16 May 2024 07:32:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Vb0-0007oG-TT
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:32:10 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 670981c6-1356-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 09:32:08 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so597239e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:32:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5734d4cf324sm9367897a12.24.2024.05.16.00.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:32:08 -0700 (PDT)
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
X-Inumbo-ID: 670981c6-1356-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715844728; x=1716449528; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6J6MYFMpo/ba/j/SxvlVyzLvMneb53SH9bFhZT4yIw=;
        b=QxFRud024Abx/uUmhAOP3K6eqjT+znQRfc71lwqX19AZA2+yLCyNFGWYUmmOyoadJS
         eOQ6YGJxZHLuJijB8Y6IX35vWzfSoPnAX0qMCk+9I7IJ3Sv0ebreC44ZZZpyGdemamYB
         sTblA4Duzr5d7USIRZCMscCENd2OoRX+uonDkOkw3uzY91Hbjz+Zxxgsa+Yf6GFC8+LN
         NYb4t4VDnVwZ4PxupENXd2gfMRqYtQSEm0D87KrAwTNtDlJZ0y+GSCSGe2NzsWw6kXbx
         heCdq39SlJoQO4IkJM4xA7j4COqBxqZMsDUKzibrDU1e4Etvo1ZcUEFB/XWGxHy+TkWk
         Oz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715844728; x=1716449528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6J6MYFMpo/ba/j/SxvlVyzLvMneb53SH9bFhZT4yIw=;
        b=NlfUWxsfR4U+CLqhddDJxFVXqxvm9ZAM/3FVBUcWeZbhLIJFun3EsDZUf49s5eobSW
         go5ClyYB3dSBGlQUn/D7d61Pzg9WUjQKcHumr6ZWw6SpMOEyBF59fieA/XwAqRGdebaU
         FwbFnS256pqwT96TzZ74G5JsWZiLstX8RjJZM8p273kRTVJF/CPO6zTEQH4o71aqGHW/
         UmIAn16Dm74TOYvF4MTvl4SWjaYc2mDzGbXfWbf2oR8QhkaD11FCS4pj2jQw8TDiaVPZ
         oVuP7x+R4PhsoO/CfIr5q3kFKsoRo36d/D4i5lrADhLjAQDScOkWvsrG+REOuxAFEVSV
         nOyw==
X-Gm-Message-State: AOJu0YxwKHSUWnUQnPRvnPgncUqqlq0JH5J/hPvQzi9AVX06Zb3GMdCu
	9PmSke7iCpSqZdFI56ezhvNlJcv7G//i3z+EOSSkJYPm3U20vRvAZS0qW5o4tA==
X-Google-Smtp-Source: AGHT+IFMQvrr4tsJQRejO7bHoPNJVPUa+rldU1D7kE7VI2rMLjkAQdTAiwEOcXtyxzjNO3XScG4rCQ==
X-Received: by 2002:a19:9119:0:b0:51b:afe0:3f4c with SMTP id 2adb3069b0e04-5220ff70bafmr11345373e87.48.1715844728440;
        Thu, 16 May 2024 00:32:08 -0700 (PDT)
Message-ID: <4f2c1486-1b58-4c8d-a74e-ad83bf9cc4c7@suse.com>
Date: Thu, 16 May 2024 09:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 12/15] x86/vmx: guard access to cpu_has_vmx_* in
 common code
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151748080.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151748080.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:50, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> There're several places in common code, outside of arch/x86/hvm/vmx,
>> where cpu_has_vmx_* get accessed without checking if VMX present first.
>> We may want to guard these macros, as they read global variables defined
>> inside vmx-specific files -- so VMX can be made optional later on.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> ---
>> Here I've tried a different approach from prev.patches [1,2] -- instead of
>> modifying whole set of cpu_has_{svm/vmx}_* macros, we can:
>>  1) do not touch SVM part at all, because just as Andrew pointed out they're
>> used inside arch/x86/hvm/svm only.
>>  2) track several places in common code where cpu_has_vmx_* features are
>> checked out and guard them using cpu_has_vmx condition
>>  3) two of cpu_has_vmx_* macros being used in common code are checked in a bit
>> more tricky way, so instead of making complex conditionals even more complicated,
>> we can instead integrate cpu_has_vmx condition inside these two macros.
>>
>> This patch aims to replace [1,2] from v1 series by doing steps above.
>>
>>  1. https://lore.kernel.org/xen-devel/20240416064402.3469959-1-Sergiy_Kibrik@epam.com/
>>  2. https://lore.kernel.org/xen-devel/20240416064606.3470052-1-Sergiy_Kibrik@epam.com/
> 
> I am missing some of the previous discussions but why can't we just fix
> all of the cpu_has_vmx_* #defines in vmcs.h to also check for
> cpu_has_vmx?
> 
> That seems easier and simpler than to add add-hoc checks at the invocations?

I'd like to take the question on step further: Following 0b5f149338e3
("x86/HVM: hide SVM/VMX when their enabling is prohibited by firmware"),
is this change needed at all? IOW is there a path left where cpu_has_vmx
may be false, by any cpu_has_vmx_* may still yield true?

Jan

