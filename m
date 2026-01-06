Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B2BCF9325
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 16:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196295.1514154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd9QH-0005G5-Ay; Tue, 06 Jan 2026 15:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196295.1514154; Tue, 06 Jan 2026 15:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd9QH-0005D9-7u; Tue, 06 Jan 2026 15:56:41 +0000
Received: by outflank-mailman (input) for mailman id 1196295;
 Tue, 06 Jan 2026 15:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd9QG-0005D3-1k
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 15:56:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48e0eda0-eb18-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 16:56:38 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so7645575e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 07:56:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ff1e9sm5387608f8f.41.2026.01.06.07.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 07:56:37 -0800 (PST)
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
X-Inumbo-ID: 48e0eda0-eb18-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767714998; x=1768319798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ebd+bkqBU1tfghm0vHLMcZDmdzfTwmFGQGb6MBYMJ0k=;
        b=aa26EJEJps2H1E8jF6BwimpFMtrnV8vXPpbTC5F5p4Zx02A+QqwUHhs4IfpCKlUZbr
         on1aPbavuh/YEBI/g5PzLySCIhR+DXoV1q8PEBcxkUhlk1iNEQ8sdtftj5HgE/If4h25
         dnCJFYEorbKGD+ZSSc6hH5AYFn28NtgWpLD8tmxgdt6O2v2g/bM9FIlpM/eIrmSnQnYj
         5IqfvdBbBnB3eKOP7iat1omR9+gELMAZog4iC8rXMeKZcsIfMGvXGXeZWIbDKviMpy7I
         nPIDBMn1jHqC5i2xdxdcQzmj5xzfDcnmWs9w5UIU6qg6OBnvudF4mq12bQaNBkLDNFKY
         RJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714998; x=1768319798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebd+bkqBU1tfghm0vHLMcZDmdzfTwmFGQGb6MBYMJ0k=;
        b=wOBBvraBy5294Z4UJhiXlc1abE4QRAvQhaCDrG1R2/4M6m6WKq02XPvGFLaXNQmCrf
         dB5lv0pQanmDl1S49jit+pVoIOPN5g28y8iLgmCku5TMSUDuc/gpfqjl1x0tE6F3cHy6
         qCbB11BESAl1o9fPdI7NAgGBTzcwhha7AklwGjfBV4BsS7JBjK45cU6N4yASv313O6UY
         D9w8Nw2pbiqmF9oemQ0f7JJ1kTjszrRxPgnwe3Jl6mlUwRT2b/VSDrIWuA5al68Ijq5i
         6UmfRtEQWiPfNpyaqRHRV6KI1mjNK3/CIW3HpslRsZmnj51sbB0OMz/vt0xCSFYK3KFL
         lEMA==
X-Forwarded-Encrypted: i=1; AJvYcCWI4M+6M/PgaYZcoxOr4llgkLX1iklhbRoZutXR1CIbLOgoDKwS2r/p4z+vDMZTIkswU21iIClIV0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN/aWKLCd7GUQbQYaH8yoiptVUJz8z0SEGCxTYYIVZfl7nMtYw
	PIPAHodJye8e3+70rwpskRhx3yVRFZMuz9/E0YF4+bBX7r/vHCoRSr4+OaEAc7X6Ig==
X-Gm-Gg: AY/fxX5yL7zMd7TD8OtYBz6n/COwWUJZFhVP2onMw/pS1zGgXud2xc0H5+4S44dCTHc
	OiwarsyLRlgKaprnaWmXBD0VicIdpaNyjN7OGdpLgLu0ywzkzF3917Eu5BFfYfkrao7Mtp7WoCh
	wvmma/hFn8l7OveaB6SgKS0YAY2NZR+s+qFhswrNqhcwth4XNvPzApxDILZR71nJnotX9tYViUz
	Iyk2RegCZZ7rHpb6ijxDYZmqlTsQcIEE8/qE7lH7k8FleUcl2hxmwQjZq11TqLfH7Hj8oYl9Isz
	NqemhnI/iZe1Q/2sD7La0xg0rMtFki3bnkN1+JFpVCf+1vk/H3CuDpT2uVaPBcUaXmCib2ERj0u
	0Sa4+wyIDqoQUdY/u8TMIg1VGQLom6x/nvVQ+RzelDA91e508QQQaraZayAWp4QjbcVP1sTF62e
	OvDYZRsPbaOHHiYPdigVa3Ahal3h62JtZfvh0JLEJ025q+6C4IqN08GfpVeENv8mTLbMy4iqS8c
	bM=
X-Google-Smtp-Source: AGHT+IFcuBWkErPL8McMvOrvh0UDAPXRH1NnRq9qrF5d3VpNbxNTY/oXCW5Gb5o096DI1gPWGdE1HQ==
X-Received: by 2002:a05:600c:3b27:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d7f0a1804mr40155165e9.34.1767714997801;
        Tue, 06 Jan 2026 07:56:37 -0800 (PST)
Message-ID: <2e7ab738-6b5d-4ac4-a46b-1eef1cd09fb1@suse.com>
Date: Tue, 6 Jan 2026 16:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/15] xen/riscv: implement
 arch_vcpu_{create,destroy}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <be49a360ad584edf5fd9891e5f4534a2c2586048.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <be49a360ad584edf5fd9891e5f4534a2c2586048.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(some or even all of the comments may also apply to present Arm code)

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/domain.c
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +
> +static void continue_new_vcpu(struct vcpu *prev)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> +
> +int arch_vcpu_create(struct vcpu *v)
> +{
> +    int rc = 0;
> +
> +    BUILD_BUG_ON(sizeof(struct cpu_info) > STACK_SIZE);

I fear you're in trouble also when == or when only a few bytes are left on
the stack. IOW I'm unconvinced that this is a useful check to have.

> +    v->arch.stack = alloc_xenheap_pages(STACK_ORDER, MEMF_node(vcpu_to_node(v)));
> +    if ( !v->arch.stack )
> +        return -ENOMEM;

You don't really need contiguous memory, do you? In which case why not
vmalloc()? This would then also use the larger domheap.

> +    v->arch.cpu_info = (struct cpu_info *)(v->arch.stack
> +                                           + STACK_SIZE
> +                                           - sizeof(struct cpu_info));

Why the cast?

> +    memset(v->arch.cpu_info, 0, sizeof(*v->arch.cpu_info));
> +
> +    v->arch.xen_saved_context.sp = (register_t)v->arch.cpu_info;
> +    v->arch.xen_saved_context.ra = (register_t)continue_new_vcpu;
> +
> +    printk("Create vCPU with sp=%#lx, pc=%#lx, cpu_info(%#lx)\n",
> +           v->arch.xen_saved_context.sp, v->arch.xen_saved_context.ra,
> +           (unsigned long)v->arch.cpu_info);

Please don't, as this is going to get pretty noisy. (And if this wanted
keeping, use %p for pointers rather than casting to unsigned long.)

> +    /* Idle VCPUs don't need the rest of this setup */
> +    if ( is_idle_vcpu(v) )
> +        return rc;
> +
> +    /*
> +     * As the vtimer and interrupt controller (IC) are not yet implemented,
> +     * return an error.
> +     *
> +     * TODO: Drop this once the vtimer and IC are implemented.
> +     */
> +    rc = -EOPNOTSUPP;
> +    goto fail;
> +
> +    return rc;
> +
> + fail:
> +    arch_vcpu_destroy(v);
> +    return rc;
> +}
> +
> +void arch_vcpu_destroy(struct vcpu *v)
> +{
> +    free_xenheap_pages(v->arch.stack, STACK_ORDER);
> +}

Better to use FREE_XENHEAP_PAGES() here, I think, to make the function
idempotent.

> --- a/xen/arch/riscv/include/asm/current.h
> +++ b/xen/arch/riscv/include/asm/current.h
> @@ -21,6 +21,12 @@ struct pcpu_info {
>  /* tp points to one of these */
>  extern struct pcpu_info pcpu_info[NR_CPUS];
>  
> +/* Per-VCPU state that lives at the top of the stack */
> +struct cpu_info {
> +    /* This should be the first member. */
> +    struct cpu_user_regs guest_cpu_user_regs;
> +};

You may want to enforce what the comment says by way of a BUILD_BUG_ON().

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -49,6 +49,9 @@ struct arch_vcpu
>          register_t ra;
>      } xen_saved_context;
>  
> +    struct cpu_info *cpu_info;
> +    void *stack;

Do you really need both fields, when one is derived from the other?

Jan

