Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC4943396
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 17:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768919.1179813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBUk-0005Xg-MU; Wed, 31 Jul 2024 15:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768919.1179813; Wed, 31 Jul 2024 15:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBUk-0005Vm-Js; Wed, 31 Jul 2024 15:44:06 +0000
Received: by outflank-mailman (input) for mailman id 768919;
 Wed, 31 Jul 2024 15:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZBUj-0005Vg-7u
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 15:44:05 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6d7db63-4f53-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 17:44:04 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso783832966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 08:44:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4148fsm788933166b.121.2024.07.31.08.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 08:44:03 -0700 (PDT)
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
X-Inumbo-ID: b6d7db63-4f53-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722440643; x=1723045443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgTIFZOHRUbrMCKnO5D/cbVRsie+VUmcQ4aJx/ncCMg=;
        b=PFQ4EuQFAcZsw8If9H3aDVjsZT+QuhQakw2sX1b05h4B9XopafykMLvXC5ZqyUR+3C
         vBuMOcWyYhzV3Lf5NUFMHfnFw1BzPauePE4pYqSo2y4lXhqVa6ptj5bhMRiCwh34uGKq
         HO15aI5Cps0zqOGdQ24hXuPMGuaYN0hEkeq3JKMYusR/YUneX5JQa5ixdcou3n8gCNV+
         bH1xNm6Fv5ONaKaWf2C2yfLOwFTG2vNyF5Y3/+tBMR/YUO+kN/ccHxeQuhI31GMetfBZ
         YhFEGh0+3FE7Nc0v7MO9YIqoDG4tgnAvNLnejhh1s2RcexYXEQm5VTNUnw9yml3GuBtB
         u2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722440643; x=1723045443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgTIFZOHRUbrMCKnO5D/cbVRsie+VUmcQ4aJx/ncCMg=;
        b=k1cFGBZYvf8uYy6J1YAdlAP1SOJC1Og8XuxrHhkqt5k4bFP21vMbLlN4C/nmlhniu5
         DreEUnjI503XHinZjoC4KMCnuS0XDZDvrqiuqbtPr6RFdK/ER3bMiuFlc0JTo8ygoFHA
         MeCiXB38GfzJZif1bj8YLW1rUxq87vRAgvNrZAFrAtRzH03z+mbbOZbU8pxGk73HQjNf
         eiz8c6RJ/xT3yESfD/w1p130olymDR575PAY+kV/GEp/1VDMTKYLVTaBgb91Y3nBMJhS
         SjSX0KlgPGGxjHnOOlsRGyx1rzmPrmQQoiGcAnuhtKiDSUCwoJKKZqfr/+KnTN/0KWIZ
         Bgxw==
X-Forwarded-Encrypted: i=1; AJvYcCV+KL0FXVTB+br0LZE5ntKPz70iI2FKklDa1V7sQyfQNExQdOiFqQ5vRtYprGxkDp973p46O0MJcTjaiYDRal3nWQWyfVE2shSYbUdYLzA=
X-Gm-Message-State: AOJu0YwezmRhL78nioTIN1qMSdMzA9gJHAkT5NHwEMl7lBJRmv75tTWF
	lDra4vIxY04Mh9f6CV0UcegTxianUI2FehDhSvlB3TcmQ8rUigiJ7vLPInlFfQ==
X-Google-Smtp-Source: AGHT+IE9lStrC5aFJrk4ikT9NskQIGOp+AKHvA4j91J64OnLRP7JRcrHfSaXGUSYTkByQZ+LCcgZCA==
X-Received: by 2002:a17:907:3f1e:b0:a7a:be06:d8dc with SMTP id a640c23a62f3a-a7d40165fcemr1215930366b.48.1722440643593;
        Wed, 31 Jul 2024 08:44:03 -0700 (PDT)
Message-ID: <01ba1e6c-f609-47ef-9fb0-8bf77a6cb68b@suse.com>
Date: Wed, 31 Jul 2024 17:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix build issue for bullseye-riscv64 container
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240731150708.122778-1-oleksii.kurochko@gmail.com>
 <46b16a0d-b6f3-4a1c-aae6-c42d7e365e6f@citrix.com>
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
In-Reply-To: <46b16a0d-b6f3-4a1c-aae6-c42d7e365e6f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2024 17:37, Andrew Cooper wrote:
> On 31/07/2024 4:07 pm, Oleksii Kurochko wrote:
>> Address compilation error on bullseye-riscv64 container:
>>    undefined reference to `guest_physmap_remove_page`
>>
>> Since there is no current implementation of `guest_physmap_remove_page()`,
>> a stub function has been added.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Usually we do Fixes/Reported-by tags first.  (We try to do tags in
> chronological/logical order).
> 
> I've confirmed this fixes the issue, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>
> 
> Having tried a different approach,
> 
> user@3c393ef3b4c0:/build/xen$ make
>   UPD     include/xen/compile.h
> Xen 4.20-unstable
> make[1]: Nothing to be done for 'include'.
> make[1]: 'arch/riscv/include/asm/asm-offsets.h' is up to date.
>   CC      common/version.o
>   LD      common/built_in.o
>   CC      arch/riscv/setup.o
>   LD      arch/riscv/built_in.o
>   LD      prelink.o
>   LDS     arch/riscv/xen.lds
> riscv64-linux-gnu-ld      -T arch/riscv/xen.lds -N prelink.o \
>     ./common/symbols-dummy.o -o ./.xen-syms.0
> riscv64-linux-gnu-ld: prelink.o: in function `register_keyhandler':
> /build/xen/common/keyhandler.c:106: undefined reference to
> `guest_physmap_remove_page'
> riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
> `guest_physmap_remove_page' isn't defined
> riscv64-linux-gnu-ld: final link failed: bad value
> make[2]: *** [arch/riscv/Makefile:15: xen-syms] Error 1
> make[1]: *** [build.mk:90: xen] Error 2
> make: *** [Makefile:610: xen] Error 2
> user@3c393ef3b4c0:/build/xen$ find . -name \*.o | while read F; do nm $F
> | grep guest_physmap_remove_page && echo $F; done
>                  U guest_physmap_remove_page
> ./common/memory.o
>                  U guest_physmap_remove_page
> ./common/built_in.o
>                  U guest_physmap_remove_page
> ./prelink.o
> 
> 
> despite the linker fingering keyhandler.c (very likely a toolchain bug),
> it's memory.o which has the undefined reference.
> 
> Looking at memory.i, there are calls in guest_remove_page(),
> memory_exchange(), and do_memory_op(), and no obvious way to DCE any of
> them.
> 
> However, with bookworm, while memory.i does still have the same calls,
> the resulting object file has no undefined references, so clearly
> something has DCE'd them.

The many stubs that have just BUG() in them result in a lot of DCE
according to my checking (many functions or basic blocks end - somewhat
confusingly - in a function call leading to such a stub). But apparently
not enough with the older compiler version.

Jan

