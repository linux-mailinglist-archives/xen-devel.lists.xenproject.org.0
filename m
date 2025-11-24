Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D3C809A6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:55:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170843.1495868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW5g-0002bV-98; Mon, 24 Nov 2025 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170843.1495868; Mon, 24 Nov 2025 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNW5g-0002Z7-60; Mon, 24 Nov 2025 12:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1170843;
 Mon, 24 Nov 2025 12:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNW5e-0002Z1-Py
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:54:46 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c07e6252-c934-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:54:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47755de027eso22416835e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:54:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f3635bsm28669765f8f.17.2025.11.24.04.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:54:44 -0800 (PST)
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
X-Inumbo-ID: c07e6252-c934-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763988885; x=1764593685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U6n+P4Ju046QP9wktWA/2tj+Yp3pglOFZjgJrArj4Lk=;
        b=LvF+uDwhiVPM4JiHqmnQvlaspJyisya1Tceho4cVb2yf1pPTqAfWSz57SrZCRXTvKP
         lyyf4SqFHfDPa+0fhM2aYabBSP/gvwy57669C6Lq7cR8XrUcVlBeoNVFTKslJWvcvOFb
         EeOlwm9krkSGZM04X9T8WiSR+2D2wPvfZNQndoqonWZVN0/zMp7WqbWZYKyuiSq0dZV9
         dTRxMZdGMwZ9mhCm2MUPkyn4aloGTsgbm2jKhvjhnCGjStYQijjyHvP/gDVPgyAH5vDD
         ErH2YfkX8cwfpk51KwTNfbrVzKBeAFJ4FbwzuD8OZt4EEyHwoi/hHnntYZ40joVDCK/A
         /edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988885; x=1764593685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6n+P4Ju046QP9wktWA/2tj+Yp3pglOFZjgJrArj4Lk=;
        b=IRbwBGOiuO2+YzX050K8uvg7zC0/FG5r0D13f+vwzollfjS/3XD8l3k7iUX6buDcCr
         Y3YO0tAo9MQlOGHZgTRxkyc5lnlJrJ2gEKY400EHURddD5cyHNGo3dBIAzN7BRDldi7h
         voy+HalSoj0U37yUBGcbO3tj2zT/NpgbhlmXTrwLInQjVlaoZLIZfeawY2k16b2vWpoy
         4czR56NS+cVqoGgOc6y22aD1pIxBm7gnGLa+fN4IznfsdDlkwyTddYqj0MqAQJiSePAq
         C6bSfJkTgmOMyErypd22FeyrvofjFLkCSFNpk1/cnJpFGhpWFPMh6aW8hPrcRB6j61fG
         VfNA==
X-Forwarded-Encrypted: i=1; AJvYcCV2UVnfiSYsNnSz5Vjwxkrmoi/qIk7iJxyq5DEmcV1Z39bFkea5v5chzyLw1vVZDoyZiitNae4dI0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKrfyCfPUKnlTGF4Cd8vZg1x6l+9AMTBx1LENsfd++8+BTMs2L
	Xn7dKKs7ZPyxOHZ/Yc/l0Jpisj6PblPQaWv9t5Mk1VS0zq189MBH+xbvCtfCKOiwcg==
X-Gm-Gg: ASbGncuOH+Xe5AnL2KBEQyYT+t131vxMeQFB31nESICuCrGstk9mPH56UuAqibonsTE
	OWmNX3oa0IP6TWcsqD1VN/wdAGccp3cvZHZjpk9wvCQ4PCl/3NahpZA+TZ8uxLK9/1Lwwn5VjeV
	21qs/HmU3zWneLCJm6qJ2M/TFeaA0MslevAWfnGL5k240cqj8GFE9P38taOO6+RMUJUF9eiX7uf
	eJhL7IEdsP4CA7uYthpwHIVnvC1eHV/vCMhHu35fqIQnt6qpVMWKovNOJT7+0aNS5pYdtwdLWt3
	veMPeNrtmG9qVyuHmVGG2L/GTq2i9bNxunQEKcqHYoAn5fVmVj+fLCSChSkoEeZM64KMJZCEbuY
	LoumBJOatGMrxtWEaLf9l9vAWcIK0y/tz3TE1ldoj8L7Z7RmuY5S4Qefi7xSHvp9vDZ2pzo0Y0c
	FWrOaDvWigFxEIieIIhKX7EBdrLutf6mdvnuEMQQaquIqgEDXaVCG5QzS2MyKj010JJcjIBsBEX
	bk=
X-Google-Smtp-Source: AGHT+IH98oz9ihGv5MTZmoNh3ue+YYeuK4xkI3WoQNVGTRlR0+KgM/BWkJdSbLgHJoyjlbrC0AuZkQ==
X-Received: by 2002:a05:6000:40cc:b0:42b:4267:83e9 with SMTP id ffacd0b85a97d-42cc1ac91e1mr12152024f8f.2.1763988884747;
        Mon, 24 Nov 2025 04:54:44 -0800 (PST)
Message-ID: <692056b6-889e-4b75-a3ea-be748269cc5c@suse.com>
Date: Mon, 24 Nov 2025 13:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] x86/irq: convert irq_desc old_cpu_mask field to
 integer
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <20251120095826.25782-6-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -115,7 +115,7 @@ static void release_old_vec(struct irq_desc *desc)
>      unsigned int vector = desc->arch.old_vector;
>  
>      desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> -    cpumask_clear(desc->arch.old_cpu_mask);
> +    desc->arch.old_cpu = CPU_INVALID;

With this, ...

> @@ -221,10 +220,10 @@ static void _clear_irq_vector(struct irq_desc *desc)
>      {
>          /* If we were in motion, also clear desc->arch.old_vector */
>          old_vector = desc->arch.old_vector;
> -        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
>  
> -        for_each_cpu(cpu, tmp_mask)
> +        if ( cpu_online(desc->arch.old_cpu) )

... you pretty certainly want to guard against the value making it here (even
if just accidentally), and thus triggering the assertion in cpumask_check().
(Again possibly elsewhere as well.)

> @@ -581,16 +575,16 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
>               * in the 'mask' parameter.
>               */
>              desc->arch.vector = desc->arch.old_vector;
> -            desc->arch.cpu = cpumask_any(desc->arch.old_cpu_mask);
> +            desc->arch.cpu = desc->arch.old_cpu;
>  
>              /* Undo any possibly done cleanup. */
>              per_cpu(vector_irq, desc->arch.cpu)[desc->arch.vector] = irq;
>  
>              /* Cancel the pending move and release the current vector. */
>              desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
> -            cpumask_clear(desc->arch.old_cpu_mask);
> +            desc->arch.old_cpu = CPU_INVALID;
>              desc->arch.move_in_progress = 0;
> -            desc->arch.move_cleanup_count = 0;
> +            desc->arch.move_cleanup =  false;

Nit: Excess blank.

> @@ -2003,7 +1994,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>                             ~irq, CPUMASK_PR(desc->affinity),
>                             /* TODO: handle hipri vectors nicely. */
>                             CPUMASK_PR(get_cpumask(desc->arch.cpu)),
> -                           CPUMASK_PR(desc->arch.old_cpu_mask),
> +                           CPUMASK_PR(get_cpumask(desc->arch.old_cpu)),

I should have asked on the previous patch already: Does it actually make sense
to still print these in mask form? Without that you wouldn't need get_cpumask(),
and as a result you also wouldn't need cpumask_none.

> @@ -2685,12 +2664,9 @@ void fixup_irqs(void)
>               * per-cpu vector table will no longer have ->arch.old_vector
>               * setup, and hence ->arch.old_cpu_mask would be stale.
>               */
> -            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
> -            if ( cpumask_empty(desc->arch.old_cpu_mask) )
> -            {
> -                desc->arch.move_in_progress = 0;
> -                release_old_vec(desc);
> -            }
> +            desc->arch.old_cpu = CPU_INVALID;
> +            desc->arch.move_in_progress = 0;

As you touch the line anyway, switch to using "false"?

Jan

