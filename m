Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB5CD9E3D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 17:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192655.1511788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4qs-0008LT-FV; Tue, 23 Dec 2025 16:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192655.1511788; Tue, 23 Dec 2025 16:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY4qs-0008J4-Cf; Tue, 23 Dec 2025 16:03:10 +0000
Received: by outflank-mailman (input) for mailman id 1192655;
 Tue, 23 Dec 2025 16:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY4qr-0008Iy-1W
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 16:03:09 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9e7b8ce-e018-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 17:02:59 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so26735055e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 08:02:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b1b1sm28230244f8f.3.2025.12.23.08.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 08:02:57 -0800 (PST)
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
X-Inumbo-ID: d9e7b8ce-e018-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766505778; x=1767110578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/bfVXbB8kQZhoL4RMELUcwCbnZ0xL5uYCFSerBP/wPQ=;
        b=IKx67pXwviVP+P3BCyNBEJ6YQk9fNMCKovQp+yc0r3Cl/jNOmo8WzfDG47cx5Lrh1j
         7vaTWLQY43tLJ4msTFN09qOebTYAbxcUPt3qcjWf6Zd7LLzZDeY/xKsYF+VFL2JGt+XR
         6qEj/LK827pFoNUmiq+r6UsS8UYltZ3nT8pdwvAhDRNmKSHCWzrAAcwkN0v24bDHb6WK
         BmoEyihmw4bWjRAyufVj4U6Ejvsoh2p0Tz15Ze1p4yAg3S08ylgt+5eV3O41OTJk2Pg/
         OJN9UU7lPH/K6iTYFsdgT0VsBJ4AI4eVsHnnZMyuX0pXQh5id3UdcFDcTZbZgpmpcuB9
         duoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766505778; x=1767110578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bfVXbB8kQZhoL4RMELUcwCbnZ0xL5uYCFSerBP/wPQ=;
        b=f+F7+oT2b4fb5o+znnJmFx4oJHjMvT+r34aFxApJxyO5s0/82ja+TdlPdjItEF/Gqu
         BKE1/hLHHCWoodRm68OKDvqeTqH7lnIVpZozmvY7f0XoEdNBcUrVmAIUJwPExI3BbdrV
         8irzuAHVLFYwlXdulyUgQEaZAgiyHUTdmoJpVKDjZkDOlL98drkovT7c/P/GACqcxBtX
         BgymYiq3chLZVFlKWNxiPm39TVcYZqxiHpz41HQXI99wWtCv20z1xtG05yNyPoBnDeL+
         FaeXsdBb/ysKuduWGoLzkoDn7Nz7yL+lCXjpE30gbToOqz0jhACJ6ytRlFT/cglEGy48
         G4Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXJhuxLDFPP3zVzCs0aKV+KP5DxbmhQkibyDI2Z+9UjrbHRSbxumnYNCyhripVsUTpuZCaZwoQyZx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yziwe08Jtxydvs6uTeVQ1kfZy8UaMdttvCSagcR64lUDRmSqb8J
	bXq6f+ypS7SEQjZHtuSEivMJOPZGY+Pny5uARk61aLAiA9L4KFF/yq0j9fwyBBMnoA==
X-Gm-Gg: AY/fxX59J/GM+FxaVsfnTrQoTq67jbPXTkO8cyaXY9stEyz8N6j/rxm52Gp92SY3wIH
	pLrCXgQxhbKMWlGa+QX1HzPk1g3qwBlRymUgAa+4IQh/y0NInIM4p7CVAwvzC7Cz9o6kQrXj9AD
	kCru7nJyBoSVG3CWTUF559lnXyjSx8PwZROCyZwZP2kCgYdDHrXLvJ6nisjPtyCOrY11w3cmezi
	8l8hHg4VUV2SmcTyxEqF3M1DHuyqnqx3cNfXjX0zQ7PtCJb2UM7YW5LIHZotR+QK7i03HHMLpK+
	RpFfYyBj/hMMh3wfVkzJ/f/ZVV0vrR8r36vYC4VEo0tfDXFJWEZDZFiey0D+sN/SaoVmK6Jr5CC
	XWTAo3zKsedHNtWbkJof9HxwcIJp+cw/kTHo4/CnLl4iF/wOd0WYOru7He/aMMLTNdOVsUmliYm
	uagPVJ0ZeYQeONDh3S4UkYoMcCMbo5RSNzZMhMaX1mD7pIttay4eGVT65YeAoKRdNLX8Wxk+DRl
	GM=
X-Google-Smtp-Source: AGHT+IFfREY3YMPGFUf6v3NIwBsFeakci6Bwj7AF01bscagOls90NqJtTVZYpWS9BZmvUpK5wNVOBA==
X-Received: by 2002:a05:600c:1d1d:b0:477:632a:fd67 with SMTP id 5b1f17b1804b1-47d19546487mr155798055e9.12.1766505778260;
        Tue, 23 Dec 2025 08:02:58 -0800 (PST)
Message-ID: <8efecc2a-a5c4-4918-acd7-ed7007fb03c5@suse.com>
Date: Tue, 23 Dec 2025 17:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce vSBI extension framework
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <61c84c3e296ab53f57d090c6ba3a533aa7049088.1766399205.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <61c84c3e296ab53f57d090c6ba3a533aa7049088.1766399205.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:37, Oleksii Kurochko wrote:
> This commit introduces support for handling virtual SBI extensions in Xen.
> 
> The changes include:
> - Added new vsbi/core.c and vsbi.h files to implement virtual SBI extension
>   handling.
> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>   vsbi_handle_ecall() when the trap originates from VS-mode.
> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>   extension data.
> - Updated Makefile to include the new vsbi/ directory in the build.
> - Add hstatus register to struct cpu_user_regs as it is needed for
>   a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
>   Also, add storing/restoring of hstatus register in handle_trap().
> - Introduce vsbi_find_extension() to check if vsbi extension is supported
>   by Xen. For now it is called only inside vsbi/core.c, but in future
>   it is going to be called from other files.
> - Introduce check_vsbi_ext_ranges() to check if there EIDs ranges
>   overlapping between extensions.
> 
> The implementation allows for registration and handling of SBI
> extensions via a new vsbi_ext structure and ".vsbi.exts" section,
> enabling extensible virtual SBI support for RISC-V guests.
> 
> Note: All EIDs are printed in the format #%#lx and all FIDs in #%lu, as
> the SBI spec uses these formats. Printing them this way makes it easier
> to search for them in the SBI spec.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd like to note though that ...

> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/core.c
> @@ -0,0 +1,57 @@
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
> +void __init check_vsbi_ext_ranges(void)
> +{
> +    for ( const struct vsbi_ext *a = _svsbi_exts; a != _evsbi_exts; a++ )
> +        for ( const struct vsbi_ext *b = a + 1; b != _evsbi_exts; b++ )
> +            if ( !(a->eid_end < b->eid_start || b->eid_end < a->eid_start) )
> +                panic("EID range overlap detected: "
> +                      "%s:[#%#lx..#%#lx] vs %s:[#%#lx..#%#lx]\n",
> +                      a->name, a->eid_start, a->eid_end,
> +                      b->name, b->eid_start, b->eid_end);
> +}
> +
> +const struct vsbi_ext *vsbi_find_extension(unsigned long eid)
> +{
> +    for ( const struct vsbi_ext *ext = _svsbi_exts;
> +          ext != _evsbi_exts;
> +          ext++ )
> +        if ( (eid >= ext->eid_start) && (eid <= ext->eid_end) )
> +            return ext;
> +
> +    return NULL;
> +}
> +
> +void vsbi_handle_ecall(struct cpu_user_regs *regs)
> +{
> +    const unsigned long eid = regs->a7;
> +    const unsigned long fid = regs->a6;
> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
> +    int ret;
> +
> +    if ( ext )
> +        ret = ext->handler(eid, fid, regs);
> +    else
> +    {
> +        gprintk(XENLOG_ERR, "Unsupported Guest SBI EID #%#lx, FID #%lu\n",
> +                eid, regs->a1);

... I still consider this too verbose. Before switching RISC-V into "supported"
status, changing this and alike to gdprintk() may want considering.

Jan

