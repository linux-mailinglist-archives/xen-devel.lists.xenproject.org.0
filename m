Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D383CFEDDA
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196885.1514590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWOe-0007wL-G8; Wed, 07 Jan 2026 16:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196885.1514590; Wed, 07 Jan 2026 16:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdWOe-0007tv-DB; Wed, 07 Jan 2026 16:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1196885;
 Wed, 07 Jan 2026 16:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdWOc-0007tp-WA
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:28:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e102a924-ebe5-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:28:20 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so16261275e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:28:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d870e80bbsm16894815e9.5.2026.01.07.08.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 08:28:19 -0800 (PST)
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
X-Inumbo-ID: e102a924-ebe5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767803300; x=1768408100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3gzaOUTQA/yKZ/1ly4yxWQSVsO9Rv2BUC+NQ1VBNjk4=;
        b=FckyRK2R18gVGxoyU72xsL7ypg9YICnb6t0T+FwyOCTy/Z669gqQNmaV2UUYxe09hg
         jteZVe4t2w5VtC/k4tZnT72aFm3xRbf+h59D9VzplZqDXP3K/GlwzbkMgAL8QasCFvwT
         PZGAwCU4kCT4EXyt322Cac4YPwAgia6b6an2pCgPpCwwLAkAltYrPiVsik15w2O6wjKV
         Q8teufbU0bsHcPLwpWolSisjgbgV9OEkUltDQ2XmcO/nkvvAvc644ljY49D8pGQUYPLb
         E+cogwtbT/R183MnmxKbPQIjmGmndYg2LOcFMNu/UsRQfO+sag2xbA36dSBefczN0eR+
         9tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803300; x=1768408100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gzaOUTQA/yKZ/1ly4yxWQSVsO9Rv2BUC+NQ1VBNjk4=;
        b=h94I7+AQ2yjD9JkloAod9WquA8LuFWDfNpGBBJiLo/ThZp66t7fxuC1rlp1Qq/XDxG
         eA90Jk3gRgg5pilBfyZLZ+nKWh4rzMXT6gyuKovL3EAcBFqbXc5muY7Z4CoXLd/C9+2E
         ZSFNW7NwJapu+7NdZI8EKf17n45Be2SKDMmJ+nm/7xXpERrmZ94TmMuSnbvhEonREoxw
         IKVuixLaqT/OKSl2RwW2f4CNs3Vs8PvB5+BUVZOkzNQXEFfCk5Ub+s6Pc+w537cQSs3y
         iHT+usxEONCqS6KvvxDAzQxPIKmC78YKo/Vg3pqSv7bg3e5afaU/Jj9UI79VokqTOSc1
         beqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNGzSPiBQY1qR2VaWinq205jwCFD05zwgHBHrtlqHH+zMjqnrDukdod8RU8K9BENJ8e/VFT7nJooM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtCYLRR10YD9qZ2dbOBbQ890E9vpiUt8abH/ubdSjXJRcrxvx3
	+nKEm0O9vz99ujWnMegwkEDgMt2/mPdq0kHD2KCUPUxlhgVOldMydZ2nxOOSBAvnfA==
X-Gm-Gg: AY/fxX6hOMCLS2PnOdtz9nLvhq1HeGNgtZ4q/jwLGvlElo31Y16ehYGplpAn4lkheFd
	0naAzwZezYvYgT+/jhIBYE4PFqWcPAFF135nVxNmropYCWmrgsqVHOa1MOE5l6WU6qoczGPvy2F
	5jVo+T1RdNTmuIme5d1Sac3XFjJQ+97ec1BhqwE5GzwJdl09Mk253R60DvyH/5hPiJ0jq9iAROf
	84K2QJd0fKQsHCtqeKhY441Nkb5nvI5mjV6+8liZXmj7+enNHMNj5b02oVIsKi9FHNGjkEpkAhy
	mUNzg5eL91ZWradzatyjQLgmXi8aApTT522rOaDFE94z+nJCT1t5wItQ2R6DkRxI73yv+tijGnP
	4QBx7LLJxBEektLcxPWU+jrg/JpXHWDGket9s2zgnEDvBvNetKhPIQVh/+LabPijymgOf1bJv20
	525wb7dVd9CZrA+DPOg0GyIRumVo+9tS/Ju2ABBL+w2zI6jI3FospIjQD7VDvBJIudjrpXJcXse
	Dg=
X-Google-Smtp-Source: AGHT+IEOxDP0XsKJu3h3qZD7xvHeD/udVr5+QFWpqzO8YpL4NzXihGBHfInEOZBFEp6XQWbP639sqw==
X-Received: by 2002:a05:600c:3b19:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47d84b3b645mr37738785e9.21.1767803299921;
        Wed, 07 Jan 2026 08:28:19 -0800 (PST)
Message-ID: <cdefd959-5700-4cdc-8563-d4954be1e91e@suse.com>
Date: Wed, 7 Jan 2026 17:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/15] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 1
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c6bd40a9a40ae3194bcfcf90b9a71d4c190ab7f6.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> This patch is based on Linux kernel 6.16.0.
> 
> Introduce a lockless mechanism for tracking pending vCPU interrupts using
> atomic bit operations. The design follows a multi-producer, single-consumer
> model where the consumer is the vCPU itself.
> 
> Two bitmaps are added:
>  - irqs_pending — represents interrupts currently pending
>  - irqs_pending_mask — represents bits that have changed in irqs_pending
> 
> Introduce vcpu_(un)set_interrupt() to mark an interrupt in irqs_pending{_mask}
> bitmap(s) to notify vCPU that it has or no an interrupt.

It's not becoming clear how these are going to be used. It's also not clear
to me whether you really need to record these in software: Aren't there
(virtual) registers where they would be more naturally tracked, much like
hardware would do?

Furthermore, since you're dealing with two bitmaps, there's no full
atomicity here anyway. The bitmaps are each dealt with atomically, but
the overall update isn't atomic. Whether that's going to be okay can only
be told when also seeing the producer side.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -5,9 +5,11 @@
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  
> +#include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/system.h>
>  #include <asm/vtimer.h>
>  
>  static void vcpu_csr_init(struct vcpu *v)
> @@ -100,6 +102,9 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( is_idle_vcpu(v) )
>          return rc;
>  
> +    bitmap_zero(v->arch.irqs_pending, RISCV_VCPU_NR_IRQS);
> +    bitmap_zero(v->arch.irqs_pending_mask, RISCV_VCPU_NR_IRQS);

This is pointless, as struct vcpu starts out all zero.

> @@ -135,3 +140,45 @@ void vcpu_kick(struct vcpu *v)
>          smp_send_event_check_mask(cpumask_of(v->processor));
>      }
>  }
> +
> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq)
> +{
> +    /*
> +     * We only allow VS-mode software, timer, and external
> +     * interrupts when irq is one of the local interrupts
> +     * defined by RISC-V privilege specification.
> +     */
> +    if ( irq < IRQ_LOCAL_MAX &&

What use is this? In particular this allows an incoming irq with a huge
number to ...

> +         irq != IRQ_VS_SOFT &&
> +         irq != IRQ_VS_TIMER &&
> +         irq != IRQ_VS_EXT )
> +        return -EINVAL;
> +
> +    set_bit(irq, v->arch.irqs_pending);
> +    smp_mb__before_atomic();
> +    set_bit(irq, v->arch.irqs_pending_mask);

... overrun both bitmaps.

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -85,6 +85,22 @@ struct arch_vcpu
>      register_t vstval;
>      register_t vsatp;
>      register_t vsepc;
> +
> +    /*
> +     * VCPU interrupts
> +     *
> +     * We have a lockless approach for tracking pending VCPU interrupts
> +     * implemented using atomic bitops. The irqs_pending bitmap represent
> +     * pending interrupts whereas irqs_pending_mask represent bits changed
> +     * in irqs_pending.

And hence a set immediately followed by an unset is then indistinguishable
from just an unset (or the other way around). This may not be a problem, but
if it isn't, I think this needs explaining. Much like it is unclear why the
"changed" state needs tracking in the first place.

> Our approach is modeled around multiple producer
> +     * and single consumer problem where the consumer is the VCPU itself.
> +     *
> +     * DECLARE_BITMAP() is needed here to support 64 vCPU local interrupts
> +     * on RV32 host.
> +     */
> +#define RISCV_VCPU_NR_IRQS 64
> +    DECLARE_BITMAP(irqs_pending, RISCV_VCPU_NR_IRQS);
> +    DECLARE_BITMAP(irqs_pending_mask, RISCV_VCPU_NR_IRQS);
>  }  __cacheline_aligned;
>  
>  struct paging_domain {
> @@ -123,6 +139,9 @@ static inline void update_guest_memory_policy(struct vcpu *v,
>  
>  static inline void arch_vcpu_block(struct vcpu *v) {}
>  
> +int vcpu_set_interrupt(struct vcpu *v, const unsigned int irq);
> +int vcpu_unset_interrupt(struct vcpu *v, const unsigned int irq);

Why the const-s?

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -91,6 +91,7 @@
>  #define IRQ_M_EXT			11
>  #define IRQ_S_GEXT			12
>  #define IRQ_PMU_OVF			13
> +#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)

MAX together with "+ 1" looks wrong. What is 14 (which, when MAX is 14,
must be a valid interrupt)? Or if 14 isn't a valid interrupt, please use
NR or NUM.

Also, nit: Padding doesn't match with the earlier #define-s (even if in the
quoted text it appears otherwise).

Jan

