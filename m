Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CEC9038BF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 12:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738244.1144934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGycH-0008Is-9T; Tue, 11 Jun 2024 10:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738244.1144934; Tue, 11 Jun 2024 10:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGycH-0008H5-6o; Tue, 11 Jun 2024 10:20:37 +0000
Received: by outflank-mailman (input) for mailman id 738244;
 Tue, 11 Jun 2024 10:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGycG-0008Gz-8O
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 10:20:36 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d8e234a-27dc-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 12:20:35 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so116198666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 03:20:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0d20a616sm411470366b.30.2024.06.11.03.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 03:20:34 -0700 (PDT)
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
X-Inumbo-ID: 3d8e234a-27dc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718101235; x=1718706035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a7M4NIhbu347nb7OvoNmNePCXq7KJFFbaaV9wMmnR7Y=;
        b=DKYdvYiLHauOvdXuUhWpqEo1El0qzqrgjQEKZWesbdfUXQP+0eZinl3v58SGsPOQPv
         wc7b3i95LgYOAnr1FjhzT/BdKivZ71y5X8RaefmZDSsVNFUxpBQZ0lA+7D+gdSbkCnyF
         EXuExp7ildsNkzYCdUNQSz4iUocWWp1OAR6IjtxMk0/9YUkSw6zSbuIOwHh7e9LAQ3cd
         Ml/DYdv1xMHiSOv5Mo+EtRxjLKJzA2qINoLXIID2c03HHgB9147COyEBcb6tMlPtTBcc
         E55RHVKkkA9daR4yXJYXQljv4BXQv7wpJArCzMUVZP1GfMCbKkZzDYKVoShisLd4suYQ
         DpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718101235; x=1718706035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7M4NIhbu347nb7OvoNmNePCXq7KJFFbaaV9wMmnR7Y=;
        b=o0oFv6LqMTeRE5Zzsj5/X5IgtPzLeqh2jsTeIasDArmyrcXZ1VjuzmrMX2sfSRlf41
         M63THHTrgMvFH0t/6RinFAqVLITs4gwFsBBSNXRwXYZDT5+dfa80QdlcYUfK1ISZSY35
         oGVlaAjr/i76lFJ4zqFV0qFuas+4M5HhTBFqboDgbV/0VZKSsmbZ+UK4NamufMUc8z5L
         a3OfhL25r8su6K7d6wFqQCCLxGoZfFCURo6ZsPZ5WBrCs/1UmJMlJdFww/mxGqxsbpkp
         5vW35PWIgFbM9A+AX/3lMYR0PB2nQ1oShiSJt4mhS69800lffwG7EWaSrwOlN8niU/UG
         HVlg==
X-Forwarded-Encrypted: i=1; AJvYcCVrSPhGTUTXRXTFLMe3YDXDBBmLQHNe0G5TkOms4++dysWFkENtekHKbB71rXWLbVk2fZG5RaLBZRfd03oqiswj5OuBs9ylpTHRWUUeGlQ=
X-Gm-Message-State: AOJu0YzsXsSVN9dGdO8GO1RsHII/WycIf04C4lsN3unaNzvIGbKBbaRZ
	SGbJj4t2D2RUkUQ30wMW2ENuLJYOelW28unjhoFT7jjkda6tMuzHgF9Jvohzbw==
X-Google-Smtp-Source: AGHT+IEiG0IN2v4mmTWyppDinQxyQygJB7SAFBygCuWSh3dfPP/JexRCm78SyhxtaMT0WBI00tv7/w==
X-Received: by 2002:a17:906:16d9:b0:a6f:a54:1598 with SMTP id a640c23a62f3a-a6f0a541702mr646991666b.49.1718101234586;
        Tue, 11 Jun 2024 03:20:34 -0700 (PDT)
Message-ID: <b2e8eed9-1df8-442b-ae7e-401c406eaef8@suse.com>
Date: Tue, 11 Jun 2024 12:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] x86/irq: restrict CPU movement in
 set_desc_affinity()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-5-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> If external interrupts are using logical mode it's possible to have an overlap
> between the current ->arch.cpu_mask and the provided mask (or TARGET_CPUS).  If
> that's the case avoid assigning a new vector and just move the interrupt to a
> member of ->arch.cpu_mask that overlaps with the provided mask and is online.

What I'm kind of missing here is an explanation of why what _assign_irq_vector()
does to avoid unnecessary migration (very first conditional there) isn't
sufficient.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -837,19 +837,38 @@ void cf_check irq_complete_move(struct irq_desc *desc)
>  
>  unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
>  {
> -    int ret;
> -    unsigned long flags;
>      cpumask_t dest_mask;
>  
>      if ( mask && !cpumask_intersects(mask, &cpu_online_map) )
>          return BAD_APICID;
>  
> -    spin_lock_irqsave(&vector_lock, flags);
> -    ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);
> -    spin_unlock_irqrestore(&vector_lock, flags);
> +    /*
> +     * mask input set can contain CPUs that are not online.  To decide whether
> +     * the interrupt needs to be migrated restrict the input mask to the CPUs
> +     * that are online.
> +     */
> +    if ( mask )
> +        cpumask_and(&dest_mask, mask, &cpu_online_map);
> +    else
> +        cpumask_copy(&dest_mask, TARGET_CPUS);

Why once &cpu_online_map and once TARGET_CPUS?

> -    if ( ret < 0 )
> -        return BAD_APICID;
> +    /*
> +     * Only move the interrupt if there are no CPUs left in ->arch.cpu_mask
> +     * that can handle it, otherwise just shuffle it around ->arch.cpu_mask
> +     * to an available destination.
> +     */

"an available destination" (singular) gives the impression that it's only
ever going to be a single CPU. Yet cpu_mask_to_apicid_flat() and
cpu_mask_to_apicid_x2apic_cluster() can produce sets of multiple CPUs.
Therefore maybe "an available destination / the (sub)set of available
destinations"? Or as that's getting longish "(an) available destination(s)"?

> +    if ( !cpumask_intersects(desc->arch.cpu_mask, &dest_mask) )
> +    {
> +        int ret;
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&vector_lock, flags);
> +        ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);

Why not pass dest_mask here, as you now calculate that up front? The
function will skip offline CPUs anyway.

> @@ -862,6 +881,7 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
>          cpumask_copy(&dest_mask, desc->arch.cpu_mask);
>      }
>      cpumask_and(&dest_mask, &dest_mask, &cpu_online_map);
> +    ASSERT(!cpumask_empty(&dest_mask));
>  
>      return cpu_mask_to_apicid(&dest_mask);

I wonder whether the assertion wouldn't better live in cpu_mask_to_apicid()
itself (the macro, not the backing functions).

Jan

