Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1C8A96DD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708176.1106829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOYs-0003Hi-JP; Thu, 18 Apr 2024 10:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708176.1106829; Thu, 18 Apr 2024 10:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxOYs-0003Ea-GC; Thu, 18 Apr 2024 10:00:10 +0000
Received: by outflank-mailman (input) for mailman id 708176;
 Thu, 18 Apr 2024 10:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxOYq-0003EB-JH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 10:00:08 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f48bf73-fd6a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 12:00:07 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2da0b3f7ad2so9606581fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 03:00:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c0a0900b00418916f5848sm2091377wmp.43.2024.04.18.03.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 03:00:06 -0700 (PDT)
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
X-Inumbo-ID: 6f48bf73-fd6a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713434406; x=1714039206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6h76wvZI94Si2CkDH7vzPaygxVoHVGkEb8tT+ckF/I=;
        b=ZuxPkECL/vrne0jHkRtuYY0JK1oVzODHMwKPqQtlrf4lPuqzX3SgbpYc4Qj/VAMA3Y
         6Ez9wjwywKRjtEMAgb4bxXziIo6Jlz6AfQIQm06oPtbc50LjiAzwZZF0DRuSCs2PxYOO
         t78NcxmqxjlAUq3wGHStpF4IIo5CkRPpuU8CBqWBv5Bc5ZghbFc6Yq5CB9opaRjULSYD
         nXJl5TbbGuO8w9GXVz/qmSJOd+5E8rRL/fV0f7iHTbIR8VtwZWFd8BXkCDs5OfqkKPbL
         ZCK+5rkSu5h3UYA6Al1HiukpPZ2SlI1MDqWzoD3tRzh+zZ7F6bnQdG20Izf1x9qE5Aq6
         Jw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713434406; x=1714039206;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6h76wvZI94Si2CkDH7vzPaygxVoHVGkEb8tT+ckF/I=;
        b=Gx80N+xgTu0it/PlVEZPDirn47Mrp3ChEqDYj+gKz7076WmH2iRZJwWXMyWyL3vUrv
         6XBBR4qLXFBKdbAUFearILf3cNswMYx/BLWz2pCojAg9t+hbUaCJJVRA+KC0/4QDMPw2
         U8XxwUjiORz0Hjk18axJLEWA9D9DCL4MzOzBJpBD5+MKOO2fqC8g1IQBXns/tT+JevVk
         0yTUNxGl3Itbt66raXZ2ZW9DzIiq1rcVSxgT2gTt4WtbKr8qf5SOD0IzA8oQG8cENsJQ
         3DuJPuDc/Lq161RZw/55DrEUmTcYy7dxcpHOLCnsMqqMXae831itiKmIaU9DRODzn4Ye
         EUkA==
X-Forwarded-Encrypted: i=1; AJvYcCWLmeyrz2YQ5Ggjbj+H/qvE+z6UC1vaLPFHqoSTiA/iOIJIqvrH95v+etlicZK5cGAgep0xSivSM77chA3NutsZ4m6GeUMqnCLWeIa8NFc=
X-Gm-Message-State: AOJu0YzyHTOEWgtAj8FZfpqA0dRYOz3TLHI19bNSLkTxVLoWC7cgvrgJ
	fb0PE3o1u2P2N1fD4ctZcDirsNmPJvNSRrYDxuLK8lE4//PBaySjNEyIPdpg1Q==
X-Google-Smtp-Source: AGHT+IFfuZfmf6/9AwVe7DL0mhDZDcPHN0zHIART1qCT9ZT4yFrdCQ3XCItrEHp9/QOl5ICMh9MqLA==
X-Received: by 2002:a2e:9185:0:b0:2da:4b38:4a28 with SMTP id f5-20020a2e9185000000b002da4b384a28mr1153942ljg.51.1713434406659;
        Thu, 18 Apr 2024 03:00:06 -0700 (PDT)
Message-ID: <0f1c2960-2443-4afd-811a-7182cc0ccbd5@suse.com>
Date: Thu, 18 Apr 2024 12:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: check whether the assembler has Zbb extension
 support
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <10816604a8625b5052f134e54c406fb4e7b6c898.1712649614.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <10816604a8625b5052f134e54c406fb4e7b6c898.1712649614.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2024 10:00, Oleksii Kurochko wrote:
> Update the argument of the as-insn for the Zbb case to verify that
> Zbb is supported not only by a compiler, but also by an assembler.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

While technically all if fine here, I'm afraid I have a couple of nits:

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -11,7 +11,8 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  
>  riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
>  
> -zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> +zbb_insn := "andn t0, t0, t0"

As can be seen on the following line (as-insn, riscv-generic-flags) we
prefer dashes over underscores in new variables' names. (Another question is
whether the variable is needed in the first place, but that's pretty surely
personal taste territory.)

Furthermore this extra variable suggests there's yet more room for
abstraction (as already suggested before).

> +zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,${zbb_insn},_zbb)

Why figure braces in one case when everywhere else we use parentheses for
variable references? There's no functional difference sure, but inconsistent
use specifically may raise the question for some future reader whether there
actually is one.

Jan

