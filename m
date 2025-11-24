Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF7C8054A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170393.1495458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVGQ-0005j7-6h; Mon, 24 Nov 2025 12:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170393.1495458; Mon, 24 Nov 2025 12:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVGQ-0005hg-3y; Mon, 24 Nov 2025 12:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1170393;
 Mon, 24 Nov 2025 12:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVGO-0005gH-JA
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:01:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58097bcf-c92d-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:01:43 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso17678415e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:01:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3af0ecsm193617465e9.9.2025.11.24.04.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:01:42 -0800 (PST)
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
X-Inumbo-ID: 58097bcf-c92d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763985703; x=1764590503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AbrKimLx9ctqJiYlm0m6klda1+roeMbXzMTUqTSdaRY=;
        b=MxZ/C6Glp7NMs7MxEeH/3PyEG4dJTp9pegub8aplDMq77spsgptmKTFgik1gGuf5hh
         wj5r6DKZOk/vsyFtcVsjaRkStTDkVLIg7o+HCkBTzUnZvX/qGR0EvXUfH6GpoC4HxepM
         wHNOIoiMbehd9faX+YzvSfwBLph++ez58NA7FAy5XdbEWdYTJlAZ4caPFBc+AOnjhReg
         cZ5/lZZoTWCa6vSpd+YKXoqjYISHArtzed1q6J69yrn2KeApR7pkICAgu2+A5nn0SJor
         pp+IEuymvCe1zIRPxdLIj1wa37U+hkjKWO5Vnu5yVtESTo+p+NCeR4BNqreuvB5OMdSa
         PdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985703; x=1764590503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbrKimLx9ctqJiYlm0m6klda1+roeMbXzMTUqTSdaRY=;
        b=skFy+YXLliKn7Qp5ozpCq6LMSNBs/SIX0cazeClEmJer4Gx+zxOfJpPhtVF0YlLSPF
         I6CGfy68xwDPCvVvyz/Jqngqici2ijwUkeuG4kIfm4uYUvqDBluoXFJdl8BvkiKE+he5
         GMkKqJ8OkIUo/hyyo1q2EQjF/K70Xlzop8Trevgt/TZSGLxf6qPquhc3QYYLHGEAtLg2
         A+99HzIPUtFf9CXLdUy4q0MQnxSY8kNm1j/q4hX4jkbJC6yvfxcR0/paByXJ+uQXY8/6
         GgYQQPcXFvl9Lv4P63/cCW+RDx024/deZHd9M43/J5AgKbEXyv/1ui4vEP1HkAcEQbVr
         U8WA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9tGFPfWt46UesSdhKP2FF19sGqGUfREVxr/YIRC2kJ2wsWTpnESTftOgbNlvl0hdiHrPRmAVBsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPvm/6LCxjBg0Nm9icEaZ3aRXllpBNQjb/cCXywrmcru1YVEqr
	o7rlMGecKeBeoXPLng8scale674PHbZNwQA357eO4POfdnsS6TNzcDY3pFaNrfUw/wHXmwkCP8X
	YGAY=
X-Gm-Gg: ASbGncvVTV0NDeGG1XN/8yK4ent6/4/kiSWEeHzxDrcGH6ElXVtaV+Hq6JGIe+B3zbs
	rCgzu9nv+PxTmGl8Is1kqmAH3Uk80JFdxJ9EIBaZmScJRS5MrWpGaxHcWO6dRlZq1Udr/vVH0od
	V7aalDRVKUWCWAUZ5YBI1r2GzjMdOQKQEN5jKKt7fGZRRv4n0vORGmg77Be7x4El9F7yD5LbTTL
	8brweg7hxfvZiTl4NS6R5QS6ER3+x47zQWbgP4W0U17UA8kdE/Zh4f6xSyi35yOchifN1rOLgb1
	H4psIHug4W3Kjo7IMYzPXx8dvZhnJ9+iAhrkrxEiTD6IHPYcbhq4KIXVq+FUS8lLr0nZGSMzYy4
	ByTuf8mllCP/o2cl2ekTsprxTmRwmOCsVm5f1wHFhgtzWqjhapt5mIFGcvjt8tGYohs9Nk6ATgt
	G0SH4v/q3frf5rAk/uJ53KYXSSBn7Dqs49P4cCwuzQMKaWgrhfW2M9Ku+LtvClokDMm/dH+FkFG
	Fg=
X-Google-Smtp-Source: AGHT+IEPX0fcsEJ1+lMmf1nsI28vHBBTWfeCOJUNOLJoEbWlkRA60zTzJWYVQxY0Ze8xLdqic43Hww==
X-Received: by 2002:a05:600c:4e87:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-477c01ebc76mr112131745e9.30.1763985702768;
        Mon, 24 Nov 2025 04:01:42 -0800 (PST)
Message-ID: <da4a0b83-a6a4-4e63-9f7a-1c9713cb5a1c@suse.com>
Date: Mon, 24 Nov 2025 13:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] x86/irq: convert irq_desc cpu_mask field to integer
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-5-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -310,9 +310,9 @@ static void cf_check hpet_msi_set_affinity(
>      struct msi_msg msg = ch->msi.msg;
>  
>      /* This really is only for dump_irqs(). */
> -    cpumask_copy(desc->arch.cpu_mask, mask);
> +    desc->arch.cpu = cpumask_any(mask);

Going from the comment, couldn't you use CPU_INVALID here? Then again, see
"x86/HPET: drop .set_affinity hook", where the function goes away anyway.

> @@ -337,7 +337,8 @@ static int __hpet_setup_msi_irq(struct irq_desc *desc)
>  {
>      struct msi_msg msg;
>  
> -    msi_compose_msg(desc->arch.vector, desc->arch.cpu_mask, &msg);
> +    msg.dest32 = cpu_physical_id(desc->arch.cpu);
> +    msi_compose_msg(desc->arch.vector, &msg);
>      return hpet_msi_write(desc->action->dev_id, &msg);
>  }

Setting msg.dest32 ahead of calling msi_compose_msg() feels odd. It makes things
look as if this was an input to the function, when by its name it rather would
want to be an output. Furthermore this is dead code right now, as the function
clears the entire structure first thing. Imo it being the function to fill the
field should be retained; instead of the CPU mask you'd once again make it a
scalar parameter. For the case where NULL was passed before, ...

> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -69,13 +69,9 @@ struct irq_desc;
>  struct arch_irq_desc {
>          int16_t vector;                  /* vector itself is only 8 bits, */
>          int16_t old_vector;              /* but we use -1 for unassigned  */
> -        /*
> -         * Except for high priority interrupts @cpu_mask may have bits set for
> -         * offline CPUs.  Consumers need to be careful to mask this down to
> -         * online ones as necessary.  There is supposed to always be a non-
> -         * empty intersection with cpu_online_map.
> -         */
> -        cpumask_var_t cpu_mask;
> +/* Special target CPU values. */
> +#define CPU_INVALID  ~0U

... you already make a suitable constant available. (Nit: The expansion wants
parenthesizing.)

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1112,8 +1112,7 @@ static void __init setup_IO_APIC_irqs(void)
>              if (platform_legacy_irq(irq))
>                  disable_8259A_irq(irq_to_desc(irq));
>  
> -            set_entry_dest(&entry,
> -                           cpu_mask_to_apicid(irq_to_desc(irq)->arch.cpu_mask));
> +            set_entry_dest(&entry, cpu_physical_id(irq_to_desc(irq)->arch.cpu));

I may as well mention this here: Looks like this patch removes all call sites
of cpu_mask_to_apicid(). That would leave the function unreachable, i.e. violating
a Misra rule, so I think the function needs dropping right here.

> @@ -2137,14 +2136,11 @@ int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int a
>          return vector;
>      entry.vector = vector;
>  
> -    if (cpumask_intersects(desc->arch.cpu_mask, TARGET_CPUS)) {
> -        cpumask_t *mask = this_cpu(scratch_cpumask);
> -
> -        cpumask_and(mask, desc->arch.cpu_mask, TARGET_CPUS);
> -        set_entry_dest(&entry, cpu_mask_to_apicid(mask));
> +    if (cpu_online(desc->arch.cpu)) {

Can CPU_INVALID make it here? If so, it needs guarding against. If not, an
assertion may be nice. (Same possibly elsewhere.)

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -156,8 +156,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
>  
>      if ( !cpu_online(cpu) )
>          return -EINVAL;
> -    if ( (desc->arch.vector == vector) &&
> -         cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> +    if ( (desc->arch.vector == vector) && cpu == desc->arch.cpu )

Please can you be consistent with parentheses on both sides of the &&?
(I'd prefer the excess ones to be dropped, but the alternative is also
okay.)

> @@ -684,8 +673,9 @@ next:
>          }
>          else if ( valid_irq_vector(old_vector) )
>          {
> -            cpumask_and(desc->arch.old_cpu_mask, desc->arch.cpu_mask,
> -                        &cpu_online_map);
> +            cpumask_clear(desc->arch.old_cpu_mask);
> +            if ( cpu_online(desc->arch.cpu) )
> +                cpumask_set_cpu(desc->arch.cpu, desc->arch.old_cpu_mask);

As mentioned for an earlier patch, to avoid the LOCK-ed update
cpumask_copy() may be better to use. Yet iirc like there, likely this
goes away again later in the series (by the title right in the next patch),
so perhaps not a big deal.

> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -16,6 +16,7 @@ unsigned int __read_mostly nr_cpumask_bits
>  const cpumask_t cpumask_all = {
>      .bits[0 ... (BITS_TO_LONGS(NR_CPUS) - 1)] = ~0UL
>  };
> +const cpumask_t cpumask_none;

This feels wasteful at least for larger NR_CPUS. And it's likely going to
violate some Misra rule on non-x86, for having no user. On x86, as long as
NR_CPUS <= 8 * PAGE_SIZE, you could (re-)use zero_page[] instead.

> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -507,7 +507,7 @@ static void cf_check set_x2apic_affinity(
>      if ( dest == BAD_APICID )
>          return;
>  
> -    msi_compose_msg(desc->arch.vector, NULL, &iommu->msi.msg);
> +    msi_compose_msg(desc->arch.vector, &iommu->msi.msg);
>      iommu->msi.msg.dest32 = dest;

With the outlined adjustment above, it looks like the explicit setting
of .dest32 would then not be needed here (and perhaps elsewhere) anymore.

Jan

