Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278E8303CB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668372.1040526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3Ns-0006LI-Oe; Wed, 17 Jan 2024 10:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668372.1040526; Wed, 17 Jan 2024 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3Ns-0006Jj-M0; Wed, 17 Jan 2024 10:43:00 +0000
Received: by outflank-mailman (input) for mailman id 668372;
 Wed, 17 Jan 2024 10:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ3Nr-0006Jc-3g
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:42:59 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d045206-b525-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 11:42:56 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so119866491fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:42:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z15-20020a6bc90f000000b007bf05f618f3sm3548526iof.55.2024.01.17.02.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 02:42:56 -0800 (PST)
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
X-Inumbo-ID: 2d045206-b525-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705488176; x=1706092976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTquu/nci3a9YyU16W8yowwYX69uyLpF8pBSNkNIKQ=;
        b=gaGc1ALyYm82NSfzIRvewnXl+jecxIr4miJSfxKb7Y47jrvnAjdodbEeqAaeavyhkF
         vneIAyS4LAd8H4zrxz/yRpvjv/U3XQ5uQODydNzHn6uITyAzATcbUpk/ZgJAjXpwXyiX
         XQF87FaSQ8QUwQlMHVNtUaPmJz67vlSNNzv8uxWQBfwkppAMrq7QLtSNNmMG+LQm/h3H
         IFGMfdvZVlBemscKjQhbxDBfZxvoL4myM6twLHxHE7szMLIDv+Bok7UYRr1fXIYHs7N7
         uCNPEOO0WbADkDQfTCB9lK07Gx1Fl91+c92KBYK7WGgRQeysvRMioghcY7VLRCe93HyK
         /k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705488176; x=1706092976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTquu/nci3a9YyU16W8yowwYX69uyLpF8pBSNkNIKQ=;
        b=OKo08M9ChglHTUDnjDNmrEqPWVmhHpdI58oy06gWUC1CyA89tVwsGLLiowvxZ2XbGQ
         4urqGBF5ImpiG9fhDO4iwiH4G52mghXe7or/tmY3Ln4A23wFb83lF336fs284bSHpDaV
         q/kpU+9jI5NAkG6nI4rNj5i59jY/CSfNxPQn59RmkPlRd/TgmzMcAgaOR7B9SRKB/3Iz
         JYJ0bvefDj9hs43AqdGGjWAQJz+3JUtXc8brhbUz97GxVA+iUSZfZ1vXaRpsI4bEAsI0
         yJXhEQVGxiBiqzHOf7GJsOAxOem7Dp36qYAgbEOYUdi5n96itBaoE/+GG7uaXo/4vMrJ
         dMMQ==
X-Gm-Message-State: AOJu0YyHAjxwvYQjO7KyRe/kGpM1whp6OkPpaYPV0zI/0DprkO/1/uxY
	I5rufMxsTW98F4C/VLLwFX6x9hw9MWux
X-Google-Smtp-Source: AGHT+IFBe11GNB/3WvfBRwJJyzPYHi1LUYnAeePno6uS8Us8ZIzYyUx0d4anjI1D4OvDnL+3BaaGNQ==
X-Received: by 2002:a2e:7e0a:0:b0:2cd:65f9:575e with SMTP id z10-20020a2e7e0a000000b002cd65f9575emr3637502ljc.107.1705488176530;
        Wed, 17 Jan 2024 02:42:56 -0800 (PST)
Message-ID: <de31c22f-6cb8-40dd-bb00-1e523fc3e9be@suse.com>
Date: Wed, 17 Jan 2024 11:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: Dom0 "broken ELF" reporting adjustments
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>
 <ZaerAAt1EnFAZpo3@macbook>
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
In-Reply-To: <ZaerAAt1EnFAZpo3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 11:25, Roger Pau Monné wrote:
> On Wed, Jan 17, 2024 at 09:53:26AM +0100, Jan Beulich wrote:
>> elf_load_binary() isn't the primary source of brokenness being
>> indicated. Therefore make the respective log message there conditional
>> (much like PV has it), and add another instance when elf_xen_parse()
>> failed (again matching behavior in the PV case).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
>>      if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
>>      {
>>          printk("Unable to parse kernel for ELFNOTES\n");
>> +        if ( elf_check_broken(&elf) )
>> +            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
> 
> I would rather use "%pd: kernel broken ELF: %s\n", in case this gets
> used for loading more than dom0 in the dom0less case.  The 'Xen'
> prefix is IMO useless here (I know it was here before).

Can do. But if I do, I'd like to bring PV in sync with this as well,
right in the same patch. I hope you don't mind that.

Jan

