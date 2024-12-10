Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F879EB104
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852266.1266108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzWT-0001GW-4H; Tue, 10 Dec 2024 12:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852266.1266108; Tue, 10 Dec 2024 12:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzWT-0001DZ-1Q; Tue, 10 Dec 2024 12:39:29 +0000
Received: by outflank-mailman (input) for mailman id 852266;
 Tue, 10 Dec 2024 12:39:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKzWR-0001DT-Cc
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:39:27 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6fd7da-b6f3-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 13:39:26 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3862d161947so2672682f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:39:26 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434eba653a0sm115534275e9.22.2024.12.10.04.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 04:39:25 -0800 (PST)
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
X-Inumbo-ID: ca6fd7da-b6f3-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733834366; x=1734439166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nQnCOqjD9HNe0OPZOevfaMkGzBLAhpg7NAJMwx3emW4=;
        b=OXKBnyWpwJAKvnMsgggCvsr9X82qhJwsp7MScXbQsk6Uvo+r8/nvMInOyU0AS0P86i
         sX9UMntYm1Nw1UyquZaFK9DtISpUliClapEbn8oj9fLIvd2Ea2bGyN4+sC0l/YgUdL0D
         tdw0KiikaMVXU6Siq1Our4F9No3Jr0y6adE0BtkmwJ3s3VlOQh6ct1iHm5TSaHfjixnt
         vw+6H9Zo9gpM8WA1pH9Pjbs8/QYhixG5widFlC3hhsFGKYRophmAxd9dw5V7F/wfVNTP
         mhox8tBp3ZKNZTTUxQreW7Yf7IMdE7WH75Mh//mvlEwQKZriONhuMY9ngU71zvqIUe6B
         Z7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834366; x=1734439166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQnCOqjD9HNe0OPZOevfaMkGzBLAhpg7NAJMwx3emW4=;
        b=QDieXVsUwATto+fUgcUmibv36EXZKFYq9Sq7GqpZX353nwBRonmony1UQHENZ341Zo
         nyI6gJXFYagKZ9xfSvUtI3isk8f05Hq6jukjPmPBvhI2vIsRW0g9wKd72BDV+5jeZ8NN
         6WLG05n6dd96FdNbl0si5MuDkCcRcgyvOMh19crmwMl1/E63DljvyZadVMyLtjpUHCd0
         D5BNTOy1ZM3a+3u8UUyywHmgXiGS4v/XQvNFnCcRi8TF42GLfYuQoUZzJOhbCYQiqUfD
         /7EVtlP5U26IicnvD64XelTXblePJBm8QjIVoPh+zY3TSSk4nHSEv6+sp+CmXiCIhALH
         RS7g==
X-Forwarded-Encrypted: i=1; AJvYcCXOg4Yyup+axYVTepIx3axnC4vR7t8AILyC6tKqBA1oPiXmNivuIy+V0rDVyhWdPyCNFtO1IFatHrA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyBHGVgYxcg4CdGCnpnbWiRJE5dkRY2Ow7Pe3L4pLcREHzogq1
	B6AT2di11vLQoY8PJt2nxfezrelRF0qH1LfQt2k/Rvfi7xKwGGN7chfQFOLjWA==
X-Gm-Gg: ASbGncv3avOIz8uOpmEeR7fShT65Y2DvK63gJ0E+0tFY2y6egR7yypxQ1Iur5NsUft3
	TfSdlm3FYx6k5laApeGUUkvR+wqXP9nIOaqNtRuwJ6JgrCX9Z8RRogfr2/oDmmzm8Wuq6tnFYuV
	UrsaG/d45lx0ETZ/a6rOU0eWmqbmwnZV4wZ1Jc3pwat1zQzD0YvmljqTTqwedN9PxLz3TTu8Yto
	v7F2U89Rnx4/Y94OuYzOtTkQR/D0kP/DDe8+x/zadTawMG/NW424gbGiDFft7Wg5ndAkhP7x5A0
	BYiSh0CyEpmER08jPvsKiujcyJLNdjiFe3nPUnGDvJEA+I3aOmD/efLIIhI33o1MCbeaWvSzzWJ
	NsAkflPM0XA==
X-Google-Smtp-Source: AGHT+IF08IQmU458koaI7BcoexpauYQv3EpG09qh+uRyfrLGzT1+7z4olE/29xgJfIrmB+HYaza1rw==
X-Received: by 2002:a05:6000:4028:b0:386:4acd:4d77 with SMTP id ffacd0b85a97d-3864acd502amr548041f8f.44.1733834365671;
        Tue, 10 Dec 2024 04:39:25 -0800 (PST)
Message-ID: <a599a06b-afcb-46f3-bdb9-0536c45907ba@suse.com>
Date: Tue, 10 Dec 2024 13:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] xen/riscv: introduce cache management operations
 (CMO)
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <1310a2fb3b9824ae66f850600925127fdfdb44fa.1732709650.git.oleksii.kurochko@gmail.com>
 <9d49befe-4592-4e71-ad0b-9a0af34253f5@suse.com>
 <a85319ab-b6bb-4be4-be6c-032feceede7c@gmail.com>
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
In-Reply-To: <a85319ab-b6bb-4be4-be6c-032feceede7c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 13:19, Oleksii Kurochko wrote:
> 
> On 12/9/24 3:38 PM, Jan Beulich wrote:
>> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/Kconfig
>>> +++ b/xen/arch/riscv/Kconfig
>>> @@ -14,6 +14,9 @@ config ARCH_DEFCONFIG
>>>       string
>>>       default "arch/riscv/configs/tiny64_defconfig"
>>>   +config HAS_CMO # Cache Management Operations
>>> +    bool
>> Hmm, and nothing ever sets this, and hence ...
>>
>>> @@ -148,9 +149,24 @@ static inline bool pte_is_mapping(pte_t p)
>>>       return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>>>   }
>>>   +#ifndef HAS_CMO
>>> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
>>> +{
>>> +    return -EOPNOTSUPP;
>>> +}
>>> +
>>> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
>>> +{
>>> +    return -EOPNOTSUPP;
>>> +}
>>> +#else
>>> +int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size);
>>> +int clean_dcache_va_range(const void *p, unsigned long size);
>>> +#endif
>> ... all you really provide are stubs and declarations, but no
>> definition anywhere?
> 
> Yes, this was done intentionally because:
> - I don't have hardware with the CMO extension, so I can't test it. ( QEMU doesn't model cache and so
>   there is no need for CMO extension emulation IIUC )
> - The instructions used for these functions may be hardware-specific and exist only for particular devices.
> 
> It seems useful to have something similar to Linux:
> https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135 <https://elixir.bootlin.com/linux/v6.6.64/source/arch/riscv/include/asm/errata_list.h#L135>
> (There are also custom instructions for THEAD above this macro.)
> 
> We could use|ALT_CMO_OP(...)| inside|clean_and_invalidate_dcache_va_range()| and|clean_dcache_va_range()|.
> However, I think it would be better to introduce or implement these functions when|HAS_CMO| is set to|y| someday.
> 
> As an alternative, we could implement these functions as|panic("need to be implemented\n")| in case when HAS_CMO=y.

I think this would be well in line with various other stubs you have.

> Another option is to drop|HAS_CMO| entirely for now and keep the current implementation (|return -EOPNOTSUPP|).
> However, with this approach, there's a risk of encountering hard-to-debug issues on platforms with the CMO extension.
> And necessity of implementation of these could be missed because there is no any notification...

Well, callers ought to check return values?

>>>   static inline void invalidate_icache(void)
>>>   {
>>> -    BUG_ON("unimplemented");
>>> +    asm volatile ( "fence.i" ::: "memory" );
>>>   }
>> That's a separate extension, Zifencei, which I don't think you can just
>> assume to be present?
> 
> Based on the specification:
> ```
> Chapter 34. RV32/64G Instruction Set Listings
> One goal of the RISC-V project is that it be used as a stable software development target. For this
> purpose, we define a combination of a base ISA (RV32I or RV64I) plus selected standard extensions
> (IMAFD, Zicsr, Zifencei) as a "general-purpose" ISA, and we use the abbreviation G for the
> IMAFDZicsr_Zifencei combination of instruction-set extensions. This chapter presents opcode maps
> and instruction-set listings for RV32G and RV64G
> ```

Hmm, indeed. That's well hidden in a place I didn't expect it to live at.
Maybe worth a sentence in the description?

> and that G is needed to boot Linux kernel ( and so Xen ) I make an assumption that Zifencei will be always
> present.

I'd be a little careful here. Xen may be used in Linux-free environments.
I notice arch.mk specifies rv64g, yet I'm uncertain we shouldn't relax
that at some point.

> And based on Linux code (https://elixir.bootlin.com/linux/v6.12.4/source/arch/riscv/kernel/cpufeature.c#L676 )
> when 'i' is present in riscv,isa property zifencei is present unconditionally.

That looks questionable to me. I don't think Zifencei can be inferred from
I. Historically it was, and imo that's what the comment there says. Plus
it is dependent upon acpi_disabled.

Jan

