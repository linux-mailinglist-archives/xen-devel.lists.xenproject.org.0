Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1849717E6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794345.1203183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncio-00014u-9p; Mon, 09 Sep 2024 11:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794345.1203183; Mon, 09 Sep 2024 11:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncio-00011v-6u; Mon, 09 Sep 2024 11:38:18 +0000
Received: by outflank-mailman (input) for mailman id 794345;
 Mon, 09 Sep 2024 11:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sncin-00011p-6K
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:38:17 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d61ee2-6ea0-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:38:16 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so452744366b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:38:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d87sm330560066b.6.2024.09.09.04.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:38:15 -0700 (PDT)
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
X-Inumbo-ID: 00d61ee2-6ea0-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725881896; x=1726486696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JGYFTOruaqxeSIsOQ1P0oJHxSlyDAPxebc/GbBpM2rQ=;
        b=d5U5YBXmQpifQ7UgUsd2IPddcuP5cix/VRrbYapKv8qqlIPW8JF9SoXtNcgdwRzjgG
         CPpJXX+AnnKoRZDQATRdIpozI2vgvOmPFLCqcHJRB947l8tZEJgooh3JFmbSN44t4Emc
         Un+k8/P7sEIpB3V0HklRYHn5QxsEUUA/1lDX6bSWYciNfr+M9Bl3wYOjC9950h3wMKbI
         ORJ8kXSe0PLEcm6mM1AP8LlFAQQ/IFtUbKIRiBKagTEthxvyo7+rnoHnSIgXyvJJpovR
         J8eTt2CIJf1oTzlZEJMeyb6hA19+bs4iP+ilbniI9bRwN4lJM/Fa/+3hkAYLWoGuBt5x
         hR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725881896; x=1726486696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGYFTOruaqxeSIsOQ1P0oJHxSlyDAPxebc/GbBpM2rQ=;
        b=hQA9ngpG5f2nM0ZFL/nFo3IIeNgrFZwVtUNHOzO3hibdXLQEfR5lJi/fdtNczALFJP
         hrw5/JKUyiLLAliD7ox9DSNAA7ZbMZQhurtanjZniE3XGfAZg98d84JTvHx88rVvpHt2
         uGgpwYFrbEGI+UPW++G1ByVvqCS4RVjAkr1uUcnMjoqnGa23RpWEWCfnGaGqtSkJEufA
         RPaQ0KlcBxFnPTdpxVgT8MHkv7Z+rPcl2MyNOV1/Tta50pnCj+k/Af0tktfV7CD22LsQ
         Rmz1lKzZjZC0PHQu7YBLzLxlcbh64/g8IAuvJNfcZexlKaqYkpDIWGahJ7g4DP6wQLZy
         LvJA==
X-Forwarded-Encrypted: i=1; AJvYcCXojPxXUfgis+n/cB9B5oac1s0fU4vJ5NlTfaLwGL8PfTrLTnqiuQznW2kVRvLrhcKngXrVDS1ovi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1g/aALQpYr50EU8lS47wdhUHHPZjnulYPdMIrvUgcFzvlcmuZ
	WFOsTkqBACrnkDO+7/jFwFKtzQToecC+5jXAIMr0j2exDW8Hm64P+s96ZqA6cw==
X-Google-Smtp-Source: AGHT+IGTlx1ckYQu4BEid7eqPG3sJQtZoL4XNRnWI2Ax3IsgX4F8iyKy5TaBB5rL1DhJWFulufB3wA==
X-Received: by 2002:a17:907:e2d8:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a8b70ee9498mr631474466b.39.1725881895560;
        Mon, 09 Sep 2024 04:38:15 -0700 (PDT)
Message-ID: <2062b9b8-943e-431f-85cf-7f1c689ccc50@suse.com>
Date: Mon, 9 Sep 2024 13:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Define and use UINT64_C and INT64_C
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
 <abe1c3a2-2838-4756-a06f-f347e4fcd78e@suse.com>
 <d905a9fa-faba-4f10-8851-a532847433d6@citrix.com>
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
In-Reply-To: <d905a9fa-faba-4f10-8851-a532847433d6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 13:09, Andrew Cooper wrote:
> On 09/09/2024 11:38 am, Jan Beulich wrote:
>> On 09.09.2024 12:08, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1384,9 +1384,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>          }
>>>  
>>>          if ( e > min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>>> -                     1UL << (PAGE_SHIFT + 32)) )
>>> +                     UINT64_C(1) << (PAGE_SHIFT + 32)) )
>>>              e = min(HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START,
>>> -                    1UL << (PAGE_SHIFT + 32));
>>> +                    UINT64_C(1) << (PAGE_SHIFT + 32));
>> I disagree - we're dealing with virtual addresses here, which better
>> wouldn't use fixed-width quantities.
>>
>> While not always virtual addresses, I similarly disagree for most or all
>> I've left in context further up: If the underlying type to deal with is
>> unsigned long, constants should match.
> 
> This is the same problem I ran into with fixmap mappings.
> 
> GB() and friends used in config.h are ULL constants, and promote the
> underlying variables from UL.
> 
> 64bit mostly copes (give or take some printk formatting), but 32bit
> fails to compile.

Yet the code above is never built as 32-bit.

Jan

