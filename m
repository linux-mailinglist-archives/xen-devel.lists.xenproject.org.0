Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8CCAD70A
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180723.1503855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScBO-0005BB-9X; Mon, 08 Dec 2025 14:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180723.1503855; Mon, 08 Dec 2025 14:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScBO-000591-6h; Mon, 08 Dec 2025 14:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1180723;
 Mon, 08 Dec 2025 14:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vScBM-00058v-LT
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:25:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6ac556e-d441-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 15:25:42 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b32ff5d10so3534655f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 06:25:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8a7bsm26010698f8f.4.2025.12.08.06.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 06:25:40 -0800 (PST)
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
X-Inumbo-ID: c6ac556e-d441-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765203941; x=1765808741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lfVKsbp0wK2PJxxs3skaIh9UqgiIuP9AliwNsROAmH8=;
        b=HJ6sFtBwkwa35jCZjJr69j6Jsc5Lp2MtIE7FQ0gx6Fi8wgjKGXv0uiL+MdLoKpFdx8
         AowlyCNt0+l20kWbE5SBr9idH/sadbfwp+Qkeey0B6crLTEj7qefK0QQsDsOKoAXkUPv
         9ICFR+poh/YY/gl+K0QrjsEpgJDSjhv5C4NLW66SCn8InWFxAlTbal+3fJBRNo2Sba3u
         fsW9SaRAkA8Sx8jiKJaeHbrOYXRebyFCzBba5Dzt+vUr3p7Y0NeBAlQ8YiO424LQ25TE
         V3XNK+CmDZ6FkMXsxFMTrAvqk/Ox/Gu0I0gq0IGkokm+fSgXtgu7kmwW2LkSGkn1Wsds
         ijiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203941; x=1765808741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfVKsbp0wK2PJxxs3skaIh9UqgiIuP9AliwNsROAmH8=;
        b=wmzWRACyXY2aNUuy2YMRXePrE7h05FsIImFnqdZk+9BYsn4tto5kWTtZA1GsIgtP3E
         484KnJBFhG56MF6ScGEHJWjGOXRg7d/JYzapaiElioezFmN5kEKXI8aNIJOdGgUO2hfS
         bO24MSJ7+sqPbVTM4A0v4taddwyB2w1egvsN/8vtujPPWCF/m3QBWqtrj/r0U3a8AJh7
         6c/ycEz5bMNIIC2UWzRhhH+3lhU2oQ8PMbzWnHy/Sif4GRCYvrZpxLr7AZa8/SLqSmw9
         khN197Bt1EPfrkY9FbOyBh2W+ZA6bhaocCH8stsjmxlOaD9B55z+e21NN6luMJPFYTjL
         vk5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaaoGlknySiXRZqUvCF9kWhVZoXp/e+L8vvEv8zQ60/RqdjFyEQJRP/VK288s6Y+yvY1WNkwDrPVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6kZ0eOc8NJGQSBcwYAVewKyLYWgqpWrj6QU9f2Ra6vWx7W+BQ
	PYKdVhvHbuxDCtfquNU8zqMVFvrLkGOYrCWYGb5Y74uPdctHWqMhumPS6uPIv1xJYw==
X-Gm-Gg: ASbGncvfwmZHTGtq2TQsrVcigUp++sSV32DkzFvrcs4MVvDVVJrJ4aXnIUamEoCBpL9
	STagwe8m+QKC6VixKWRiUdq2xS0n+k0UTcCl8uG/grRrDnDPjJ9RIz2e0P26iaHsvGWHj8oXQk4
	t05RZ/QJROYqsxjNEzKCRhHBeavllWhjeVQmUeWCWKlFBZY1hmdutKGAhqmcOxTx0KNP4Y1xnQ+
	sdJeHpdwU6B9pV8X7VrIwr3VRB5EzZExPpx03EanRl5SrSEL2m1YAulV38dVtbIGg/cvXCus0xn
	pyZw44SFrzvyySJoUt4Nq4M3dmZl/rQG6VhSFWR1YaSj3kly8MN/+xGorGlfo3ESVh2P1EcaMaG
	jvscZlWPYFmtQQYlIPnkZ86N3adNiko1f4BKYw4mpLLmjYSHtiyRTQ7P6SXyddMJ4RVncUm3aN7
	bOj580q23RWSPR3T888ppFHvVqhhAOG8jPsphXuKdsotOCGRWc+Yjxe9fQwNbVbYinnMVRbRYPc
	eo=
X-Google-Smtp-Source: AGHT+IHp4+cvwzEkLLOPf+wXXHEaeKUL6oPdZsPAZCLt/VXqQwtFJd3F0LSuLUMZIntN5ERT4S+iag==
X-Received: by 2002:a5d:5d01:0:b0:3ea:6680:8fb9 with SMTP id ffacd0b85a97d-42f89eafa46mr9696387f8f.3.1765203941385;
        Mon, 08 Dec 2025 06:25:41 -0800 (PST)
Message-ID: <df316e2f-9eb0-4bb8-96cd-e5e0c42d123e@suse.com>
Date: Mon, 8 Dec 2025 15:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce vSBI extension framework
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.12.2025 11:24, Oleksii Kurochko wrote:
> This commit introduces support for handling virtual SBI extensions in Xen.
> 
> The changes include:
> - Added new vsbi.c and vsbi.h files to implement virtual SBI extension
>   handling.
> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>   vsbi_handle_ecall() when the trap originates from VS-mode.
> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>   extension data.
> - Updated Makefile to include the new vsbi/ directory in the build.
> - Add hstatus register to struct cpu_user_regs as it is needed for
>   a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.

I can spot the check, yes, but without the field ever being set how is one
to determine whether that check actually makes sense?

> The implementation allows for registration and handling of SBI
> extensions via a new vsbi_ext structure and ".vsbi.exts" section,
> enabling extensible virtual SBI support for RISC-V guests.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/Makefile                |  1 +
>  xen/arch/riscv/include/asm/processor.h |  1 +
>  xen/arch/riscv/include/asm/vsbi.h      | 31 +++++++++++++++++
>  xen/arch/riscv/traps.c                 |  8 +++++
>  xen/arch/riscv/vsbi/Makefile           |  1 +
>  xen/arch/riscv/vsbi/vsbi.c             | 46 ++++++++++++++++++++++++++

A file named identical to the directory it lives in raises the question of
why there is such a new sub-directory. Are you expecting moree files to
appear there? How's vsbi.c then be "special" compared to the others? Do
you perhaps mean someling like "core.c" or "common.c" here?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vsbi.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +
> +#ifndef ASM_RISCV_VSBI_H
> +#define ASM_RISCV_VSBI_H
> +
> +struct regs;

DYM struct cpu_user_regs?

> +struct vcpu;
> +
> +struct vsbi_ext {
> +    const char *name;
> +    unsigned long eid_start;
> +    unsigned long eid_end;
> +    int (*handle)(struct vcpu *vcpu, unsigned long eid,
> +                  unsigned long fid, struct cpu_user_regs *regs);

Nit: Maybe better "handler", as this isn't really a handle?

> +};
> +
> +#define VSBI_EXT_START(ext, extid_start, extid_end, extid_handle)   \

The extid_ prefixes aren't adding much value here, are they?

> +static const struct vsbi_ext vsbi_ext_##ext __used                  \
> +__section(".vsbi.exts") = {                                         \
> +    .name = #ext,                                                   \
> +    .eid_start = extid_start,                                       \
> +    .eid_end = extid_end,                                           \
> +    .handle = extid_handle,
> +
> +#define VSBI_EXT_END                                                \
> +};

There's no use here, and peeking ahead at the other two patches shows
no use where this odd split of the macros would be necessary. What is
this about?

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -15,6 +15,7 @@
>  #include <asm/processor.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/traps.h>
> +#include <asm/vsbi.h>
>  
>  /*
>   * Initialize the trap handling.
> @@ -114,6 +115,13 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>  
>      switch ( cause )
>      {
> +    case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
> +        if ( !(cpu_regs->hstatus & HSTATUS_SPV) )
> +            panic("CAUSE_VIRTUAL_SUPERVISOR_ECALL came not from VS-mode\n");

This might more naturally want to be BUG_ON()? Assuming of course the value
in question is exclusively under hypervisor control. Otherwise panic() would
also be wrong to use here.

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/vsbi.c
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/sched.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sbi.h>
> +#include <asm/vsbi.h>
> +
> +extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
> +
> +const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id)

static?

Also, again - is the ext_ prefix adding any value here?

> +{
> +    const struct vsbi_ext *vsbi_ext;
> +
> +    for ( vsbi_ext = _svsbi_exts; vsbi_ext != _evsbi_exts; vsbi_ext++ )
> +        if ( ext_id >= vsbi_ext->eid_start &&
> +             ext_id <= vsbi_ext->eid_end )
> +            return vsbi_ext;

What if multiple entries have overlapping EID ranges?

Also at the macro definition site please clarify (by way of a comment)
that these ramnges are inclusive (especially at the upper end).

> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
> +{
> +    const unsigned long eid = regs->a7;
> +    const unsigned long fid = regs->a6;
> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
> +    int ret;
> +
> +    if ( ext && ext->handle )
> +        ret = ext->handle(vcpu, eid, fid, regs);

Is a registration record NULL handler pointer actually legitimate / useful?
(If there was range overlap checking I could see a reason to permit such.)

> +    else
> +    {
> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);

Are the #-es ahead of the %-s adding value here? Is printing an ID as
decimal going to be useful, when the value is pretty much arbitrary?

> +        ret = SBI_ERR_NOT_SUPPORTED;
> +    }
> +
> +    /*
> +     * The ecall instruction is not part of the RISC-V C extension (compressed
> +     * instructions), so it is always 4 bytes long. Therefore, it is safe to
> +     * use a fixed length of 4 bytes instead of reading guest memory to
> +     * determine the instruction length.
> +     */

And ECALL is also the sole possible cause of CAUSE_VIRTUAL_SUPERVISOR_ECALL?

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -91,6 +91,13 @@ SECTIONS
>  
>      DT_DEV_INFO                       /* Devicetree based device info */
>  
> +    . = ALIGN(POINTER_ALIGN);
> +    DECL_SECTION(.vsbi.exts) {
> +        _svsbi_exts = .;
> +        *(.vsbi.exts)
> +        _evsbi_exts = .;
> +    } :text

Isn't this read-only data? In which case it wants to move up ahead of _erodata?

Jan

