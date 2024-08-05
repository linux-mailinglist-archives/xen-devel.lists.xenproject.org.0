Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB289947E64
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772260.1182708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazqM-0008Ge-Rw; Mon, 05 Aug 2024 15:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772260.1182708; Mon, 05 Aug 2024 15:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazqM-0008E0-Ol; Mon, 05 Aug 2024 15:41:54 +0000
Received: by outflank-mailman (input) for mailman id 772260;
 Mon, 05 Aug 2024 15:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sazqL-0008Du-CS
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:41:53 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3baaa5d5-5341-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 17:41:51 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a91cdcc78so569772766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:41:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5baff14989fsm2446690a12.55.2024.08.05.08.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 08:41:50 -0700 (PDT)
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
X-Inumbo-ID: 3baaa5d5-5341-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722872510; x=1723477310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=whlPeet9tumQdwGZh3kKRJwNp4fjd104vNOWSO00Izo=;
        b=cD9kdfsaSXwcPq7CYmDzfTqdZro7Yr0J5LiYD1wscJR6davo3M0zIYupJ/e1TSf2e/
         0mM5BrTrbBkMkMhzhHsWfVi7z7airsskXzh5Lwt+K14oaurvSobb6c2aaw34Gu0H82DH
         V6mWzVXXRokFbqcHOt2oCb/+AsbWCV1o8jJ+XscqbSp3jsJ0tOGFRRNMyzqilG/KIrhX
         fbrzKeJ2yTEhhPB7XqssSfQLSr/w9SyDpGmPuLVkyDZqyzERGAZx2czaC15Qb6c3cEi3
         lnsWzMZ/Y79DcSrTthBa9kLqMSMekinLrdU5cyZBbELTCKEoAAfJjOz3GfsztIla8XM8
         0yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872510; x=1723477310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whlPeet9tumQdwGZh3kKRJwNp4fjd104vNOWSO00Izo=;
        b=lA+cOk0fDltsiGOHc7TnCLkDPm8nkRjZYBERP443/gjQZv+2ls4sUiYqUVa+B6Qo1q
         gfVvQMm2qPpQbfSfZxmLhPCS9+xN/v8z1L6om0KRtTyO+UyYy95qLti+9UA/9gdRvfdm
         7aSPc8xHjEQuTmXIg2Bo8z9wON54N5CTl04lA925dN6ylpfkWPUHBbFTHgrFbwzO7QDQ
         zu5zsG5SdrTFXJaVjNCt2hGwpZuaFQq8bSD994M5fP9lFeySTbeHNhX2lFZZzSDuzkQ7
         WHviT82wTu0m3VJrKhyOFjEVVt+4kvfTg70syVVOP4fph0rhTCMypfhZTdMmXafnzAQh
         ddDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKahZb1RYfsS2001XDKwC4iHcRRip+nv1nQP568L96BQ9jbugR74lM2w4/HVm0burXimjvQsnsA60NdssH+Lj8oyod30Ppee8fdE3wI0=
X-Gm-Message-State: AOJu0YyHuSb0kx7rWEAffZwqHf2LDyjbfrONdi3j4NVkb/QXQ58sLZwk
	ZV1w+7lpXijeAmS60lhpiGnEGgEfyZTnLcQTsdQH9ZxNjQuqCGBxzp+ebrIz9Q==
X-Google-Smtp-Source: AGHT+IHnj9s28UqsmVG+caybjitodkmU0CItj/80rhMoOkjyjkq+ajN7bpuRF1b6wisPagLH3syf8g==
X-Received: by 2002:a05:6402:1657:b0:5a1:4f76:1a1b with SMTP id 4fb4d7f45d1cf-5b7f3ad8779mr10437536a12.15.1722872510347;
        Mon, 05 Aug 2024 08:41:50 -0700 (PDT)
Message-ID: <0245feaa-6cf2-4f44-843f-38cdcc6b7a42@suse.com>
Date: Mon, 5 Aug 2024 17:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/3] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1722605952.git.oleksii.kurochko@gmail.com>
 <3d507ce45606d22e9fa07dd6087870c16b5c4a4e.1722605952.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d507ce45606d22e9fa07dd6087870c16b5c4a4e.1722605952.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 15:54, Oleksii Kurochko wrote:
> Enable GENERIC_BUG_FRAME to support BUG(), WARN(), ASSERT,
> and run_in_exception_handler().
> 
> The 0x0000 opcode is used for BUG_INSTR, which, when macros from
> <xen/bug.h> are used, triggers an exception with the
> ILLEGAL_INSTRUCTION cause.
> This opcode is encoded as a 2-byte instruction and is invalid if
> CONFIG_RISCV_ISA_C is enabled or not.

Yes, but there's a caveat: Without the C extension instructions have
to be aligned on 32-bit boundaries. You can't just go and insert a
16-bit item there. When RISCV_ISA_C is not set, I think you want to
insert two such 16-bit zeroes. Beware of an alignment handling bug
in the assembler - don't think of using an alignment directive here.

> Update the commit above the definition of INS_LENGTH_MASK as ebreak

s/commit/comment/?

> --- a/xen/arch/riscv/include/asm/bug.h
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -9,7 +9,11 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#define BUG_INSTR "ebreak"
> +#include <xen/stringify.h>
> +
> +#define BUG_OPCODE  0x0000

You don't really use this other than ...

> +#define BUG_INSTR ".hword " __stringify(BUG_OPCODE)

... here - does this really warrant a separate #define _and_ inclusion of
stringify.h?

Furthermore you want to avoid using .hword (or any data generating
directive), to avoid disturbing disassembly. Please use .insn if at all
possible. I understand though that in certain cases you won't be able to
use .insn. Yet for the common case (more recent binutils) you'd still
better avoid .hword or alike, imo.

> @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  
>  void do_trap(struct cpu_user_regs *cpu_regs)
>  {
> -    do_unexpected_trap(cpu_regs);
> +    register_t pc = cpu_regs->sepc;
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    switch ( cause )
> +    {
> +    case CAUSE_ILLEGAL_INSTRUCTION:
> +        if ( do_bug_frame(cpu_regs, pc) >= 0 )
> +        {
> +            if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
> +            {
> +                printk("Something wrong with PC: %#lx\n", pc);
> +                die();
> +            }
> +
> +            cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
> +
> +            break;
> +        }
> +
> +    default:

The falling-through here wants annotating, preferably with the pseudo-
keyword.

Jan

> +        do_unexpected_trap(cpu_regs);
> +        break;
> +    }
>  }


