Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643359457EA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770146.1181073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlPO-00027a-Qp; Fri, 02 Aug 2024 06:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770146.1181073; Fri, 02 Aug 2024 06:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlPO-00024l-NT; Fri, 02 Aug 2024 06:04:58 +0000
Received: by outflank-mailman (input) for mailman id 770146;
 Fri, 02 Aug 2024 06:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZlPN-00024f-OP
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:04:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 249f4f61-5095-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 08:04:56 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so978343066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 23:04:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec727esm57001266b.197.2024.08.01.23.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:04:55 -0700 (PDT)
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
X-Inumbo-ID: 249f4f61-5095-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722578696; x=1723183496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BJdR8UlgH022Xk2viPR1cQw/vL8as1dX7BdU+jDvN6o=;
        b=S5qWMsoHzvzhUz5dJO+709sR++5zomAtfNZa7xsxB93t1g650iZmCy7lSq2p+rH0lT
         0YV0mlnSl6IEeDBpEqT4qTFXEJXGM1M7k/qJ9WJj1wbgIo+jaKStTlk40nWr+4I58bjG
         9VMGl5tGLo+Dx+6idZdWAPU72GIXorBnaf2fqenwHw6OWPNYizSlvCfFH+Z2TeZnX/mc
         8VqEbFvo6taAhw+8VFD8SjOqk+pVUvejT0CQf7YtLK1SR8Glk0uCf1z5+1Fa7x8K3CUa
         K0rorysJqMaUNwbEBF8z+6FUv+d87m9crR//O/ljVoJkrbkTBwraNcu1NUGWCqo+CvQO
         ZTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722578696; x=1723183496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJdR8UlgH022Xk2viPR1cQw/vL8as1dX7BdU+jDvN6o=;
        b=TIVnhIWjEqkkxQ2nDRTzQWJ4jz0FZWlzTOZThRXKz65lh4mH5rIO+Ny6zMfl9cchmm
         SpJjEuv0HpysMV5By0F4VTNWiuprJplYaWLBI0iOnl3CJrYG9nDLDE703lwJXBPrvLQU
         Fnc3ed5m5kuhSBWbxjtwqFcxP2YQc7gIdLJgUBl6vdUnHJXktoo1N3p7wuaF+j47I/l7
         j6j9A5rLi2ADlB6UuICTb27bsL/DPnS9kP7VvyoKqpYJq8vc/8mr2q1vQ/H90Uw9kL7k
         Y74NM3t+A6qQUOiFiK2PEezTMvfKT8Fj/4HGdmT4DcFUc0nTJzUXopomiLNS7H9q/i92
         SJRA==
X-Forwarded-Encrypted: i=1; AJvYcCUMW0/Bl1FOI9vvxWM9LqvzCKL5ejtevnsdFnGiqbWDUuku4RuKxvtNeNy18/Av+Eme7dsKXQlPliX4Ff6ukJNz0HLlyLdmnjIahJ/HHD0=
X-Gm-Message-State: AOJu0Yw8b7LJzfqmPj3/t6hwumvQUQVLWeyCY/kR1KAOefLB3vSDQw3m
	AST8axn3adrJkHnuoTtsQLqgKhJkx82MNTGA5t6v4ICttWdiuERBli4FVp2akmxl1s6dS9ISbI0
	=
X-Google-Smtp-Source: AGHT+IEHnZfkUden+bNOzCnmuX4gokZ7N0CaV9pjDhrFWAjINaAoTOSHqXiu3AO2xC8vgYeFj6zC5Q==
X-Received: by 2002:a17:906:bc0f:b0:a7a:c812:36c5 with SMTP id a640c23a62f3a-a7dc509f924mr180718066b.46.1722578696021;
        Thu, 01 Aug 2024 23:04:56 -0700 (PDT)
Message-ID: <d9cbddc0-cb5c-4ce9-9bda-be0b97719799@suse.com>
Date: Fri, 2 Aug 2024 08:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/5] xen/riscv: introduce decode_cause() stuff
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 xen-devel@lists.xenproject.org
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <335b0b49720b3524b6c89c5ce62d3377a4bb1fb8.1721731887.git.oleksii.kurochko@gmail.com>
 <a2ad6557-8162-4f06-84c6-b79c049cb326@suse.com>
 <44b01293f3e318b6f4d1c3aff3f1b38349676bc0.camel@gmail.com>
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
In-Reply-To: <44b01293f3e318b6f4d1c3aff3f1b38349676bc0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 22:05, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-08-01 at 13:44 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>> The patch introduces stuff needed to decode a reason of an
>>> exception.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V11:
>>>  - Nothing changed. Only rebase.
>>> ---
>>> Changes in V10:
>>>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Changes in V9:
>>>  - This patch was reverted as breaks both release and randconfig
>>> builds.
>>>    I don't see the failures now. ( probably it was because of
>>> printk usage
>>>    which was not ready at that moment ).
>>>  - drop inclusion of <asm/csr.h> and <asm/early_printk.h>
>>>  - add <asm/riscv_encoding.h> for CAUSE_* in decode_trap_cause().
>>> ---
>>> Changes in V8:
>>>   - fix typo in return string from decode_reserved_interrupt_cause
>>>   - add Acked-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> Changes in V7:
>>>  - Nothing changed. Only rebase.
>>> ---
>>> Changes in V6:
>>>  - Remove usage of LINK_TO_LOAD() due to the MMU being enabled
>>> first.
>>>  - Change early_printk() to printk()
>>> ---
>>> Changes in V5:
>>>   - Remove <xen/error.h> from riscv/traps/c as nothing would
>>> require
>>>     inclusion.
>>>   - decode_reserved_interrupt_cause(), decode_interrupt_cause(),
>>> decode_cause, do_unexpected_trap()
>>>     were made as static they are expected to be used only in
>>> traps.c
>>>   - use LINK_TO_LOAD() for addresses which can be linker time
>>> relative.
>>> ---
>>> Changes in V4:
>>>   - fix string in decode_reserved_interrupt_cause()
>>> ---
>>> Changes in V3:
>>>   - Nothing changed
>>> ---
>>> Changes in V2:
>>>   - Make decode_trap_cause() more optimization friendly.
>>>   - Merge the pathc which introduces do_unexpected_trap() to the
>>> current one.
>>> ---
>>>  xen/arch/riscv/traps.c | 80
>>> +++++++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 79 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>>> index 5415cf8d90..37cec40dfa 100644
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -9,13 +9,91 @@
>>>  #include <xen/sched.h>
>>>  
>>>  #include <asm/processor.h>
>>> +#include <asm/riscv_encoding.h>
>>>  #include <asm/traps.h>
>>>  
>>> -void do_trap(struct cpu_user_regs *cpu_regs)
>>> +static const char *decode_trap_cause(unsigned long cause)
>>> +{
>>> +    static const char *const trap_causes[] = {
>>> +        [CAUSE_MISALIGNED_FETCH] = "Instruction Address
>>> Misaligned",
>>> +        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
>>> +        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
>>> +        [CAUSE_BREAKPOINT] = "Breakpoint",
>>> +        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
>>> +        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
>>> +        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
>>> +        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
>>> +        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
>>> +        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
>>> +        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
>>> +        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
>>> +        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
>>> +        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
>>> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page
>>> Fault",
>>> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
>>> +        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction
>>> Fault",
>>> +        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page
>>> Fault",
>>> +    };
>>> +
>>> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
>>> +        return trap_causes[cause];
>>> +    return "UNKNOWN";
>>> +}
>>
>> While I committed this as-is, two more points: First, as soon any any
>> such array access becomes potentially reachable because of guest
>> activity, it wants to use array_access_nospec() or alike.
> Could you please explain why ( specifically ) guest activity affects if
> array access becomes potentially reachable? 

Anything the guest can affect wants to be as immune as possible towards
the guest trying to drive speculation the wrong way, and thus be able
to infer information from resulting internal state of the CPU. I'm sure
you're aware of at least the fact that there was a multitude of such
issues over the last several years.

Jan

