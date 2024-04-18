Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130D8A9C76
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708398.1107290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSYm-000440-9f; Thu, 18 Apr 2024 14:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708398.1107290; Thu, 18 Apr 2024 14:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxSYm-00041f-6R; Thu, 18 Apr 2024 14:16:20 +0000
Received: by outflank-mailman (input) for mailman id 708398;
 Thu, 18 Apr 2024 14:16:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxSYj-000407-Td
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:16:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35fc743e-fd8e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 16:16:13 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so12095355e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 07:16:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b00418d6cf9f61sm2963698wmq.8.2024.04.18.07.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:16:12 -0700 (PDT)
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
X-Inumbo-ID: 35fc743e-fd8e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713449772; x=1714054572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX6XzzG/xh61IcACE2+L+IWC4ivMbjGDkwc8UZo4xRE=;
        b=PV/dPhx6di6yrZKRfABvC6rgfAsfUeHifYpkY70m7P2PdUgD+gNkfRzZe9zsEhb6DQ
         0NG66PXu4tJBc7avh/HI/E/Qhz9nFIqzmc7vqS9gJdMZgePEFEtWMxhiZcdr1b4AtmTz
         ULJyOJJh7h0EBPg4XN0mKTiU+xyyq4bDzNQaAhsPvjy5zdyPyCmhzwJjHz7x6vTjQxn9
         tXgDXvGVYa8ve2Z/jtMhg09a4+7ydq+C+F9TGwlsPk315+SOddChEGe3kl/TnRWM8rae
         kQg/jddqdomlcL8k5TAF+WKVdhIz2q7FB1yO/WO579Q1vHDw9v8idwAc/W4Yy9oVneIl
         ogow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449772; x=1714054572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX6XzzG/xh61IcACE2+L+IWC4ivMbjGDkwc8UZo4xRE=;
        b=s8nRav15dqQUKH1a1tMW0GJKbqI1si/JU3bPc9/E9SgVGFhuzi+sRJv09N4eTuQoD5
         dPCTkQYDPhg8XVaPFfH+BcUIAAXD09GItiuMvlGFBUEiuppZ8hE4bS4AATq/vTkBoAbI
         y5D75ztGqTUKtfIFy/KpmZDZaojgvm47NsuzB3UFYJKBWWozyB6It1z5xLl4s1J+NY9M
         2PdQ/OOQqCZqsqG09n444RnPKnC9zH2menE33PdQyulPJhRDNm7AFqt2eP6J+Y/d2qt+
         9Yy5TD8PvDXxR+1VJBB8kRl/PGcfLea/1OKAhjbJxaRAiycTUQFky+hFHpzVMwExHsaD
         jKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXedrViabWfioESnO4yyWHVFaUqgy1dREMYjPI2CeEdTIPWGNqRicrA0ewl2a/0wczkaWtHYRz6PjBSc2eFAhUiJZt66G5cRcMvisE0MBM=
X-Gm-Message-State: AOJu0YxnI4lshx8OYhpWFU+8R/JLr1xdhcXe9u8tn459px6Fr8wMlAbN
	eWGMYddv6T3z6/Cp8wzHOeQraUcULXb4Fgk2k0prDbgsAJWb5ymFct41P+dEtA==
X-Google-Smtp-Source: AGHT+IENZADmxs7ZctY5syyQFruL0pnBogop2rmdni9vcZZR2bXxPIXDHHm2d0lATZMZjv9jr+VcVw==
X-Received: by 2002:a05:600c:c19:b0:418:de31:7148 with SMTP id fm25-20020a05600c0c1900b00418de317148mr1964248wmb.3.1713449772379;
        Thu, 18 Apr 2024 07:16:12 -0700 (PDT)
Message-ID: <c457b406-1ba0-41c3-ae0b-f0512560a9f6@suse.com>
Date: Thu, 18 Apr 2024 16:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: check whether the assembler has Zbb extension
 support
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <10816604a8625b5052f134e54c406fb4e7b6c898.1712649614.git.oleksii.kurochko@gmail.com>
 <0f1c2960-2443-4afd-811a-7182cc0ccbd5@suse.com>
 <3acf272c5950ea5e980cb40ae4ee3ec5698b26ae.camel@gmail.com>
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
In-Reply-To: <3acf272c5950ea5e980cb40ae4ee3ec5698b26ae.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.2024 15:09, Oleksii wrote:
> On Thu, 2024-04-18 at 12:00 +0200, Jan Beulich wrote:
>> On 09.04.2024 10:00, Oleksii Kurochko wrote:
>>> Update the argument of the as-insn for the Zbb case to verify that
>>> Zbb is supported not only by a compiler, but also by an assembler.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> While technically all if fine here, I'm afraid I have a couple of
>> nits:
>>
>>> --- a/xen/arch/riscv/arch.mk
>>> +++ b/xen/arch/riscv/arch.mk
>>> @@ -11,7 +11,8 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       :=
>>> $(riscv-march-y)c
>>>  
>>>  riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
>>>  
>>> -zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
>>> +zbb_insn := "andn t0, t0, t0"
>>
>> As can be seen on the following line (as-insn, riscv-generic-flags)
>> we
>> prefer dashes over underscores in new variables' names. (Another
>> question is
>> whether the variable is needed in the first place, but that's pretty
>> surely
>> personal taste territory.)
> 
> It seems to me that we need it; otherwise, if we don't use the variable
> and put everything directly:
>   zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"andn t0, t0,
> t0",_zbb)
> Then as-insn will receive incorrect arguments because of the ',' used
> in the instruction. It will parse it as 3 separete arguments ("and, t0
> and t0"), which will lead to a compilation error:
>    /bin/sh: -c: line 1: unexpected EOF while looking for matching `''
>    /bin/sh: -c: line 2: syntax error: unexpected end of file
> 
> Probably I am missing something and it can be done in a different way.

Well, as said - this is perhaps largely personal taste. Yet technically
it isn't needed, assuming you're aware of the "comma" and "space" macros
that we have at the top of ./Config.mk. You'll find $(comma) used for
similar purposes in x86.

Jan

