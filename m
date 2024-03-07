Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257848754FB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689978.1075555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHJx-0002c2-1l; Thu, 07 Mar 2024 17:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689978.1075555; Thu, 07 Mar 2024 17:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHJw-0002a1-V9; Thu, 07 Mar 2024 17:14:16 +0000
Received: by outflank-mailman (input) for mailman id 689978;
 Thu, 07 Mar 2024 17:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riHJv-0002Zl-I4
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:14:15 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1de6a0a2-dca6-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 18:14:12 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-567fbbd723cso1399741a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 09:14:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gq13-20020a170906e24d00b00a45621ded4bsm4460517ejb.146.2024.03.07.09.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 09:14:11 -0800 (PST)
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
X-Inumbo-ID: 1de6a0a2-dca6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709831651; x=1710436451; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5FzSgLdAWYaoILd8r6pOp9cL4FDfyhV7+g5Vlst+zBU=;
        b=NwVTi6ERmIFgaCV2LFG+3ji3TOYTEPT81mAC48fKlm4siHikgESDTNY9agb+D8ufvV
         fUolxhIfpjzDpRRAucvwlDXBf01s7dVn6cxWrFJ0qwPXGK4hS7ffjIlBSu7hQmLlxi4C
         Y24gjuZQEYBwgh2vJVi3n0wBK5n9OnJmLCBOqeFDpoTUGmdM7ruEo99NUqknY75axfZh
         NADDxN9ummCCzdyp5eLpf+rGnjiHlFBU5nLmmGX16AghS9QQAUXFEbgjpGzJmEfydJXi
         V5DTffBETrYAvy9oLpbjD9usqOhPEWzfBIURkFDYiv6uY0zPl/O/Vm/Y0q5sC2lab8VM
         +WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709831651; x=1710436451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FzSgLdAWYaoILd8r6pOp9cL4FDfyhV7+g5Vlst+zBU=;
        b=n7q1AKVrqA6q7YOf246AaLObB09uaOoIcdF9qvq6QuR/24Y6ovsNG9eEUJnQNSX2FV
         Pb9h+HoHZ8oBY9deBhiG+ldsYwr86ATD9GcWTi2e9tSiuh4uCi/50CFXQ/6dS64m3/Go
         YN61NLL0Wxhr+8HP1+qckwdVnCAlPHT7iloQHEqjn5knQeKEQv/xdo1yoNjXHga8+qOL
         r/bKVZ+Xb5js4pGBFW8zLvaKc6N2G0aA3T+2UB4jPlVDR0VcXsmXveDwWwAg0zEpihm2
         7a6oNDdYU0/GafaKBqQHHoSAto3K4WPt0PQ53jPZRy1GzFTD3F2loRFruFi2UeqxHJg8
         ASvw==
X-Forwarded-Encrypted: i=1; AJvYcCXpaEpnNoUj0qVG4OYyJzltCIh/OXj6deOVyeqkUh+QDIKJWYtG973VhTW7eIs/bRPOUUyAFTyogapudWQMmEYiqM4PR40b/rAF06EyN/c=
X-Gm-Message-State: AOJu0YwJtDXEmfNUXIW0Yfpu62w2Tq7YIq4ltPx+P8ZN7H6ej8+XAfbm
	kPb3QsVsaq3f/4w5v+KORG+Uplgsjrj7+nwFQKdKZ1Dye30kL9C3n/x3OtfGjA==
X-Google-Smtp-Source: AGHT+IHBgPIBJXAb8p9LS15ZVwJ2Ii5yz/Zko3U4SVv68bIIIjgO2vY+v259rSmUKbXH47soK6YPng==
X-Received: by 2002:a17:906:3798:b0:a3f:bd94:4d80 with SMTP id n24-20020a170906379800b00a3fbd944d80mr13101311ejc.76.1709831651474;
        Thu, 07 Mar 2024 09:14:11 -0800 (PST)
Message-ID: <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
Date: Thu, 7 Mar 2024 18:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
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
In-Reply-To: <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 17:21, Oleksii wrote:
> On Thu, 2024-03-07 at 16:32 +0100, Jan Beulich wrote:
>> On 07.03.2024 14:44, Oleksii wrote:
>>> On Thu, 2024-03-07 at 14:24 +0100, Jan Beulich wrote:
>>>> On 07.03.2024 14:01, Oleksii wrote:
>>>>> On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
>>>>>>> +/* Generic IO read/write.  These perform native-endian
>>>>>>> accesses.
>>>>>>> */
>>>>>>> +static inline void __raw_writeb(uint8_t val, volatile void
>>>>>>> __iomem
>>>>>>> *addr)
>>>>>>> +{
>>>>>>> +    asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r"
>>>>>>> (addr) );
>>>>>>> +}
>>>>>>
>>>>>> I realize this is like Linux has it, but how is the compiler
>>>>>> to
>>>>>> know
>>>>>> that
>>>>>> *addr is being access here? 
>>>>> Assembler syntax told compiler that. 0(%1) - means that the
>>>>> memory
>>>>> location pointed to by the address in register %1.
>>>>
>>>> No, the compiler doesn't decompose the string to figure how
>>>> operands
>>>> are used. That's what the constraints are for. The only two
>>>> things
>>>> the
>>>> compiler does with the string is replace % operators and count
>>>> line
>>>> separators.
>>> It looks like I am missing something.
>>>
>>> addr -> a some register ( because of "r" contraint ).
>>> val -> is also register ( because of "r" contraint ).
>>>
>>> So the compiler will update instert an instruction:
>>>  sb reg1, 0(reg2)
>>>
>>> what means *(uint_8 *)reg2 = (uint8_t)reg1.
>>>
>>> What am I missing?
>>
>> The fact that the compiler will not know that *(uint_8 *)reg2
>> actually
>> changes across this asm(). It may therefore continue to hold a cached
>> value in a register, without knowing that its contents went stale.
> Then it makes sense to me. Thanks.

FTAOD similar considerations apply to memory reads. The compiler may need
to know that values held in registers first need writing back to memory
before an asm() can be invoked.

> It explains why it is needed +Q, but
> I don't understand why constraint 'o' isn't used for __raw_writew, but
> was used for __raw_writeb:
> 
>    static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>    {
>            asm volatile("strb %1, %0"
>                         : "+Qo" (*(volatile u8 __force *)addr)
>                         : "r" (val));
>    }
>    
>    static inline void __raw_writew(u16 val, volatile void __iomem *addr)
>    {
>            asm volatile("strh %1, %0"
>                         : "+Q" (*(volatile u16 __force *)addr)
>                         : "r" (val));
>    } 
>    
> If I understand correctly 'o' that the address is offsettable, so why
> addr can not be offsettable for everyone case?

I don't know; there may be peculiarities in RISC-V specific constraints.

> And one more thing, in Xen constraint "+" is used, but in Linux it was
> dropped:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1426958753-26903-1-git-send-email-peter@hurleysoftware.com/
> 
> To me it looks like constraints should be always "+Qo".

For plain writes it should at least be "=Qo" then, yes. To me making those
input operands on Arm can't have been quite right.

Jan

