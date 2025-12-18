Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F1CCC1B9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 14:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189639.1510358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEQP-00031P-6q; Thu, 18 Dec 2025 13:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189639.1510358; Thu, 18 Dec 2025 13:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWEQP-0002ye-3u; Thu, 18 Dec 2025 13:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1189639;
 Thu, 18 Dec 2025 13:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWEQN-0002yY-JC
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 13:52:11 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb389da9-dc18-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 14:52:02 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so427472f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 05:52:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324493fd73sm5154331f8f.13.2025.12.18.05.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:52:01 -0800 (PST)
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
X-Inumbo-ID: bb389da9-dc18-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766065922; x=1766670722; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8KQEzeDMBB4G5Mt9Ktn5ugA5PE7RnTwgZmI3MUCJ24s=;
        b=UJIQRq8i+AWUfML86FEr072oEDiLr5FpJnB5yac4REvICcd/j8eo5OO7ziACF183xF
         rRORkj56lbr8YfIo2Ot84myJl4c6dmVIygYVyqYSzW3lfRakhobS0yikNvv+7MS/bTZ9
         uJT+J+0KLVtqd1Wi9zGWT1an16PjPQ3F7pcaE1oumFPKNC5rMZBR7O3h/oxBKG/qyv+8
         xMwPpmOrVeStJcUIAcoxyXn8lkuDSM+kCT3aorUD3HeTQF92xuv4A2bJmnEPnFrYVWMY
         mI0W7n+ZUuxpyuLAxpGwxd5vMQiz6bWfNzOvv6fcm0hhqFkMzoOtkVZI7kPkYS9zxkkd
         aekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065922; x=1766670722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KQEzeDMBB4G5Mt9Ktn5ugA5PE7RnTwgZmI3MUCJ24s=;
        b=sah0zVhMi858bphFBUPUFk1YGdTBOlHYwlUDu2JNJSaj/FUf2sd+113Ds1eDy/FHps
         A5btRScMfDP2UCCkrjz/FJjpCE5T/JlRzQDDLDkhX1yYAp5bAYMt3xIfnduKegsFvJHs
         zemt9iPMK1yEjHh7gFKukUaokdE9oHvO/S7CPFFBYY5Btbs6WmLa41bHJMZHkVUxvh1z
         x8WkdODgf72AOKipQK67U8y+jg2sjEpvv6Fgnefn7/an8PD3pfkjSQ4BIY3RrtUKJxC/
         WWgHdnUAERkD/INTLmJd8xRKhcvyHr/0PV4dRxXFX4wsEuJIyG2IrMus7vBq3mixVlt9
         6QEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRvcp/WQPTVLth5+FXQTMFtlQdQx8kLv7zawnjPcr1O9Wk8GEfo29qWLihEpLFUdPoa8iE0lK3RZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDxNR0B4qOvvzkltSUtCC+B+v+CZbkB0T6fNdw2YL5HyoEjDVJ
	HzrsH7CY17zpHro1NaKx9AO9sAUovAMkPi6YixZdcgpIZcIJCLyGcuTRkR2ps+rr5g==
X-Gm-Gg: AY/fxX4RGflgFdwhrohjvMhqcNCcvTDxO0AeFPvyNOOVDJNiJkLQTdIt5KaBL6MfWbo
	vucsSbKPuc5MGdRjd0sLRbYUGSX2L5qwZ/EF4KrDP+OyKSSZg5XKr2FIFohDXJuEf+gm5dZLaNk
	sIVQJemQr9FgGzjpBhEJP5ezWuOZ3glKc8qzhoF8HAhVuB2Tgag+eIVVnekGRX6pFF9wWdElRaQ
	Pf9AngiFveyW9EBhFdjf7VbuPUXmfNbpFFc558DxebLjJ9GpJb3pqooE+wB9KiWrwJ6pf6h3iM8
	hF2CezJOliYp+szEGdvCQfZPAGN0hBXduhHS0NAY5ASQQtkFTaShPXcnqNYhOZfqxFPj3+pFjT7
	NyDH9erJ73bl+4lBY5dggmykFckM60ZYR8RzyvOTYIp391loyDRB0RmaT8kkotnwdlI5rOs+4tP
	3X1nQ1KxH7pBiQUJV5QhUgjEqgLDEhPdO3WNtcpqZYZH3OXYaZX5TNu7JE1kQgXJ0etm2IelVI8
	nQ=
X-Google-Smtp-Source: AGHT+IG4SJ+CatxaCIUEG95Hw0jTP0pfOx5/SlNwLmuvpU2MkAkOqxUbR85bjLUU/IM+LMlxmUnmVw==
X-Received: by 2002:a05:6000:2486:b0:431:8f8:7f2b with SMTP id ffacd0b85a97d-43108f880f1mr8685967f8f.37.1766065922200;
        Thu, 18 Dec 2025 05:52:02 -0800 (PST)
Message-ID: <870f4a16-eda3-48ae-9d67-f496cf6493b1@suse.com>
Date: Thu, 18 Dec 2025 14:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce vSBI extension framework
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
 <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.12.2025 17:54, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/vsbi/core.c
> @@ -0,0 +1,56 @@
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

Like here, ...

> +            if ( !(a->eid_end < b->eid_start || b->eid_end < a->eid_start) )
> +                panic("EID range overlap detected: "
> +                      "%s:[#%#lx..#%#lx] vs %s:[#%#lx..#%#lx]\n",
> +                      a->name, a->eid_start, a->eid_end,
> +                      b->name, b->eid_start, b->eid_end);
> +}
> +
> +const struct vsbi_ext *vsbi_find_extension(unsigned long eid)
> +{
> +    const struct vsbi_ext *ext;
> +
> +    for ( ext = _svsbi_exts; ext != _evsbi_exts; ext++ )

... declare "ext" inside the for()?

> +        if ( (eid >= ext->eid_start) && (eid <= ext->eid_end) )
> +            return ext;
> +
> +    return NULL;
> +}
> +
> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
> +{
> +    const unsigned long eid = regs->a7;
> +    const unsigned long fid = regs->a6;
> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
> +    int ret;
> +
> +    if ( ext )
> +        ret = ext->handler(vcpu, eid, fid, regs);
> +    else
> +    {
> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);

As before - anything guest triggered must not cause log spam issues.
Minimally you want to use XENLOG_GUEST in such cases, but I think you
really mean gprintk() here.

A connected question then arises: Why is "vcpu" being passed in, when
the sole caller only ever passes "current"? (The connection here is
that gprintk() also uses current, and hence would be wrong to use when
vcpu != current.) Same question goes for the ->handler() hook.

Jan

