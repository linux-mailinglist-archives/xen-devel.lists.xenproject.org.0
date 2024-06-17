Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8690AF56
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742279.1149040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCS7-0003X9-L1; Mon, 17 Jun 2024 13:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742279.1149040; Mon, 17 Jun 2024 13:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCS7-0003Vt-IJ; Mon, 17 Jun 2024 13:31:19 +0000
Received: by outflank-mailman (input) for mailman id 742279;
 Mon, 17 Jun 2024 13:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCS6-0003VU-4H
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:31:18 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df37b9a9-2cad-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 15:31:15 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo537460466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:31:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed359bsm517544966b.137.2024.06.17.06.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:31:14 -0700 (PDT)
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
X-Inumbo-ID: df37b9a9-2cad-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718631075; x=1719235875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pp1K9s1hMstswjLeUFQ3jILwvALrqQKbc0WAq7+jK4U=;
        b=S5wrSeM56ecCo8LMCAek8OWACSGX38H4E8YPGNUfb6WQfggI309oFkOYy5Kb8FMGRg
         DdXa6+KZA0o570v39ZN0Ie/BH0jy1/MAu3Y1VS3VZuknhjTkmGOcCMPf6NF97N+p9Dvh
         KpPD0t19FUVOmQvkDgcL4JZqZcA/tl0yZ6apVcnSQ2+gmko9uHss6+T7cQmvQwswGlPu
         2FZSJR7SjAAaXxIbdMDj02Ej4I+7zsmr0qTANti5/dFKtWnCUjL3tdogpAoKIYEQj10h
         TK+J+j0T6N5OBNRzWTlmqw3zSTQh4kp1b57nW3g0NlTUNivPU3gPWhL3sWuwC3/MAVNS
         3K+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631075; x=1719235875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pp1K9s1hMstswjLeUFQ3jILwvALrqQKbc0WAq7+jK4U=;
        b=Efth9PEXIJB3njlb9KI0y4Muq7j1fspl6S8/F5jFTVxNRvWO70VWn3m+fsOcd2Ilxa
         jLU7BGt4ZEQ01rdFGKxhxjMK7Ehkkf+SPqFRn9cjUjxafW92wjtICCYTm9FpnoCJSyBP
         obvE9vuEsCqOw03HwZ/U27vJ5moosJDO5nKJddRI8Oh7mzR3yR1XoFtxjdUPV+O2V/U2
         tpW8Eh6TV08dxPBJ7ilCvN9nHxO8ZCL+sWe/8Q8hX4HJ3D3VftxTCUb9pLw9U64EgwBC
         dXlWiX4ekDdtyA7GHDvlaIJN4P5VzHRx7lu9sdj4jZg0AtKSfb9aYIrD/fR6JEhxFA1y
         Y1uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfdeHURUl3fttiz6Vn1jWXIsD1dhKiDsLJmssEKOYdM8a6Ol5xe8GqNmhCjBw+PKNsDOozDv+6rqBMqu0rX1GpdhE6dtHiVRE9+xSdfmU=
X-Gm-Message-State: AOJu0YyTtZ1LHmBIzOHEb1cZdajKsYkGHeqQ1Czl3/38cJExUlZ9NEHy
	+opSBc9kuggrYayGkQAgZdi2MFykeCQs0FLka02KeBvBZYz+Bkff5fzZkxHdvQ==
X-Google-Smtp-Source: AGHT+IEjgg0aIMSIJD23O9mK/uJQj2OftbuoLDJj//ut0gOdqetyjnRGXUseLz1C/Tb0jJj7QJbFVg==
X-Received: by 2002:a17:906:2c45:b0:a6f:4c39:8aeb with SMTP id a640c23a62f3a-a6f60dc7fe3mr584457366b.50.1718631075220;
        Mon, 17 Jun 2024 06:31:15 -0700 (PDT)
Message-ID: <f263d178-3a06-4c65-a6c0-a77f85c559b6@suse.com>
Date: Mon, 17 Jun 2024 15:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.19 2/3] x86/irq: handle moving interrupts in
 _assign_irq_vector()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-3-roger.pau@citrix.com>
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
In-Reply-To: <20240613165617.42538-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 18:56, Roger Pau Monne wrote:
> Currently there's logic in fixup_irqs() that attempts to prevent
> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
> interrupts from the CPUs not present in the input mask.  The current logic in
> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
> 
> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
> to deal with interrupts that have either move_{in_progress,cleanup_count} set
> and no remaining online CPUs in ->arch.cpu_mask.
> 
> If _assign_irq_vector() is requested to move an interrupt in the state
> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
> CPUs that could be used as fallback, and if that's the case do move the
> interrupt back to the previous destination.  Note this is easier because the
> vector hasn't been released yet, so there's no need to allocate and setup a new
> vector on the destination.
> 
> Due to the logic in fixup_irqs() that clears offline CPUs from
> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
> shouldn't be possible to get into _assign_irq_vector() with
> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
> ->arch.old_cpu_mask.
> 
> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
> longer part of the affinity set, move the interrupt to a different CPU part of
> the provided mask and keep the current ->arch.old_{cpu_mask,vector} for the
> pending interrupt movement to be completed.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -544,7 +544,58 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
>      }
>  
>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
> -        return -EAGAIN;
> +    {
> +        /*
> +         * If the current destination is online refuse to shuffle.  Retry after
> +         * the in-progress movement has finished.
> +         */
> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
> +            return -EAGAIN;
> +
> +        /*
> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
> +         * ->arch.old_cpu_mask.
> +         */
> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
> +
> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
> +        {
> +            /*
> +             * Fallback to the old destination if moving is in progress and the
> +             * current destination is to be offlined.  This is only possible if
> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
> +             * in the 'mask' parameter.
> +             */
> +            desc->arch.vector = desc->arch.old_vector;

I'm a little puzzled that you use desc->arch.old_vector here, but ...

> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
> +
> +            /* Undo any possibly done cleanup. */
> +            for_each_cpu(cpu, desc->arch.cpu_mask)
> +                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
> +
> +            /* Cancel the pending move and release the current vector. */
> +            desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> +            cpumask_clear(desc->arch.old_cpu_mask);
> +            desc->arch.move_in_progress = 0;
> +            desc->arch.move_cleanup_count = 0;
> +            if ( desc->arch.used_vectors )
> +            {
> +                ASSERT(test_bit(old_vector, desc->arch.used_vectors));
> +                clear_bit(old_vector, desc->arch.used_vectors);

... old_vector here. Since we have the latter, uniformly using it might
be more consistent. I realize though that irq_to_vector() has cases where
it wouldn't return desc->arch.old_vector; I think, however, that in those
case we can't make it here. Still I'm not going to insist on making the
adjustment. Happy to make it though while committing, should you agree.

Also I'm not happy to see another instance of this pattern appear. In
x86-specific code this is inefficient, as {set,clear}_bit resolve to the
same insn as test_and_{set,clear}_bit(). Therefore imo more efficient
would be

                if (!test_and_clear_bit(old_vector, desc->arch.used_vectors))
                    ASSERT_UNREACHABLE();

(and then the two if()s folded).

I've been meaning to propose a patch to the other similar sites ...

Jan

