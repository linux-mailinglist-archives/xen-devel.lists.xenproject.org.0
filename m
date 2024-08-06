Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705B9492E5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 16:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772909.1183350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbL68-0001QI-0R; Tue, 06 Aug 2024 14:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772909.1183350; Tue, 06 Aug 2024 14:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbL67-0001OW-Td; Tue, 06 Aug 2024 14:23:35 +0000
Received: by outflank-mailman (input) for mailman id 772909;
 Tue, 06 Aug 2024 14:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbL67-0001OQ-0E
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 14:23:35 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7657badc-53ff-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 16:23:34 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a1f9bc80e3so337584a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 07:23:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839b2b96bsm6017951a12.23.2024.08.06.07.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 07:23:32 -0700 (PDT)
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
X-Inumbo-ID: 7657badc-53ff-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722954213; x=1723559013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Or5KMDJPnWhnjeiGi70Y2ulkd7njF+gdNZa2YENPn+0=;
        b=IxcAwKRw/wNEF9iANTSPiDDBv/dv3b0iHtmv+Vu2io4BENXDqST7Mx5JistthOdOFu
         r7SOn9C1NuD/ep0FzbA3ZrbPMra838HC4LgBySRCc55nJJL5tfmB7ItGSgjKdpauFgO8
         uz+bh2wwleVNewR/Wky4iot2KWm6lXnkX1Q0/qrft3Onrg+brVvxy02d9log4smKzHgr
         XeTHPZlc5Mj4RI02iMVSBtbHAQAyWIT1zp+3ABBtnieUtFSnFr9K4/dBaXu2WJ5cCWN7
         9mMovBFvvtHBevFew8/j5mHk4KuIqb6p3djZJif8M6B8g+gNnrg6HBqVz/iWb0uvWhrJ
         j4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722954213; x=1723559013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or5KMDJPnWhnjeiGi70Y2ulkd7njF+gdNZa2YENPn+0=;
        b=ug7sJUbfK1iQmEfE0W+b9vC6IMy2CGhE3pw5WgHBVl/zyZ9Fx4yKqRbhDcoRIFQySq
         6uNl/Uc7JyE7dR6egaAcJ9qOgRQ6KZn4oA0hNrfQ+l5UjuniZ84X+85Tc4SJr/AM84ED
         djQAmt/ciEYUMMeAf/ZRxfIuEYNLZj3CQJZoUOgGe+ZsYamOS6ADkf8JhUcVFZCrF7pj
         Gf/zP0Mw5lYBvfSBijiYQRD9s1P3Wg0bb3yauYXASc8VfdaXsDXrwXrfXEeXG2GFf3ZC
         E6sbvsr8cE9+2FYBi2FOhEu2pTTvVN98WA7BCbM/BzSoVNmFVgRT0uf3RmolTUZG+ABe
         oSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgD6Emm5LcC4cPYOLnbUzfHw4kxiE/vWNG7Hxln7j0DkmJv7SyRrENsLYYf5bDTdu/UgmofFib1fmPABD0F2X4PZyMKRyYLff5dSmSOyk=
X-Gm-Message-State: AOJu0Yxdv0clmtmqCwZ2m9+hEGdjQEajKHgsDh2DWP4IV/HQ8yEvd9AK
	nyyoGvAuJUPcNtdBNwej7Jbe5p81/+BUacZarP2NBa0GdXbAM//+7El1HJPaVDNsvKFKagl6l48
	=
X-Google-Smtp-Source: AGHT+IENlHB0cvVqyXkGZgpGzu1jJA9yVQlWrz6sZ6oUgnahqpGuMGlH43v5WVpev6R5GSB/csdhHQ==
X-Received: by 2002:aa7:cad6:0:b0:5a2:80f:a6dd with SMTP id 4fb4d7f45d1cf-5b7f3ad811bmr14197828a12.14.1722954213184;
        Tue, 06 Aug 2024 07:23:33 -0700 (PDT)
Message-ID: <1bd59e0a-0468-4944-b9bb-d9aae5fe55b5@suse.com>
Date: Tue, 6 Aug 2024 16:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/3] xen/riscv: enable GENERIC_BUG_FRAME
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
 <3d507ce45606d22e9fa07dd6087870c16b5c4a4e.1722605952.git.oleksii.kurochko@gmail.com>
 <0245feaa-6cf2-4f44-843f-38cdcc6b7a42@suse.com>
 <89d6b01ac85899c85f1dbfdaa907435e12de75c2.camel@gmail.com>
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
In-Reply-To: <89d6b01ac85899c85f1dbfdaa907435e12de75c2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2024 12:11, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-08-05 at 17:41 +0200, Jan Beulich wrote:
>> On 02.08.2024 15:54, Oleksii Kurochko wrote:
>>> Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
>>> and run_in_exception_handler().
>>>
>>> The 0x0000 opcode is used for BUG_INSTR, which, when macros from
>>> <xen/bug.h> are used, triggers an exception with the
>>> ILLEGAL_INSTRUCTION cause.
>>> This opcode is encoded as a 2-byte instruction and is invalid if
>>> CONFIG_RISCV_ISA_C is enabled or not.
>>
>> Yes, but there's a caveat: Without the C extension instructions have
>> to be aligned on 32-bit boundaries. You can't just go and insert a
>> 16-bit item there. When RISCV_ISA_C is not set, I think you want to
>> insert two such 16-bit zeroes. Beware of an alignment handling bug
>> in the assembler - don't think of using an alignment directive here.
> Then probably it will be better to define BUG_INSTR as:
>  #define BUG_INSTR "UNIMP"
> and let compiler to provide proper opcode.
> 
> Or define BUG_INSTRT always as 0x00000000 will be better?

I don't know.

>>> --- a/xen/arch/riscv/include/asm/bug.h
>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>> @@ -9,7 +9,11 @@
>>>  
>>>  #ifndef __ASSEMBLY__
>>>  
>>> -#define BUG_INSTR "ebreak"
>>> +#include <xen/stringify.h>
>>> +
>>> +#define BUG_OPCODE  0x0000
>>
>> You don't really use this other than ...
>>
>>> +#define BUG_INSTR ".hword " __stringify(BUG_OPCODE)
>>
>> ... here - does this really warrant a separate #define _and_
>> inclusion of
>> stringify.h?
>>
>> Furthermore you want to avoid using .hword (or any data generating
>> directive), to avoid disturbing disassembly. Please use .insn if at
>> all
>> possible. I understand though that in certain cases you won't be able
>> to
>> use .insn. Yet for the common case (more recent binutils) you'd still
>> better avoid .hword or alike, imo.
>>
>>> @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct
>>> cpu_user_regs *regs)
>>>  
>>>  void do_trap(struct cpu_user_regs *cpu_regs)
>>>  {
>>> -    do_unexpected_trap(cpu_regs);
>>> +    register_t pc = cpu_regs->sepc;
>>> +    unsigned long cause = csr_read(CSR_SCAUSE);
>>> +
>>> +    switch ( cause )
>>> +    {
>>> +    case CAUSE_ILLEGAL_INSTRUCTION:
>>> +        if ( do_bug_frame(cpu_regs, pc) >= 0 )
>>> +        {
>>> +            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
>>> +            {
>>> +                printk("Something wrong with PC: %#lx\n", pc);
>>> +                die();
>>> +            }
>>> +
>>> +            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
>>> +
>>> +            break;
>>> +        }
>>> +
>>> +    default:
>>
>> The falling-through here wants annotating, preferably with the
>> pseudo-
>> keyword.
> What kind of pseudo-keyword? I though about /* goto default */ to
> underline that CAUSE_ILLEGAL_INSTRUCTION should be close to "default:".

In compiler.h we define "fallthrough" specifically for purposes like
this.

Jan

