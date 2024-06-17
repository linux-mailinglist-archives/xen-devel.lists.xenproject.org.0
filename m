Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336290AFB0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742292.1149062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCbm-0006A1-Os; Mon, 17 Jun 2024 13:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742292.1149062; Mon, 17 Jun 2024 13:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCbm-00067D-KH; Mon, 17 Jun 2024 13:41:18 +0000
Received: by outflank-mailman (input) for mailman id 742292;
 Mon, 17 Jun 2024 13:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCbl-000677-DT
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:41:17 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 449743ff-2caf-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 15:41:15 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso484785666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:41:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f427a5sm509162366b.180.2024.06.17.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:41:14 -0700 (PDT)
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
X-Inumbo-ID: 449743ff-2caf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718631675; x=1719236475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3RrjWoN4LNZjIiRgyoaKWvDVkeibzlX7t9ypKotessc=;
        b=WoBLhAgzcf6rW4oaDUoNyMjESrMESomcraYSAOrFQFg+Fo4SFtWpL9vd+K2XHDmOIV
         Dqn1IACAAl5b1s+93Xreg6/Nl35NSc3HBeR6gS1V1xMlYSzGGfWJB5amRfXeNF3y224i
         K7GgwAq4EDj9d5oKF8/bqELqUEdufDRssZzeEEaHQrgQL+C9B9j7XbXyR7ob7WCleyPr
         sRNely8MviG5ygmoFaIX545bU6IZTO23yqDXi16vOgbZdq3GX/7E7aA8SWA1DGe83wFN
         UV2T8HCVzxMe0r3CO2mCp8TE0o1YWrqe2YfaEEu8BVLt5jLxY4vMmC/FSFP05BFMopaF
         fegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631675; x=1719236475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RrjWoN4LNZjIiRgyoaKWvDVkeibzlX7t9ypKotessc=;
        b=cWeyFg1t3C9ENoWQaU/BOdn7g38WoTkBRNexEswXQVoL5iNanm4KgKd2wwuvKLWWw/
         A2SkROPTAUKV2Rrn9noOQZocrozh1mmyd7eZozETH8EBRbTNU3rAD9hfy+jD4Z5lS8eG
         +csokis2DRK2QjnJkaODOFcUYfoYDKhCmTKgEKyYOpE3mBYx7XQXJPIVufOseZ9UJTtG
         /Jl7Mdf94VSYfQaWE2HXQ/5u6xB7Aio2i3L2WMWih+jGUasGmjwvNskQQX+7GfqFFWVU
         hUKtrLLeYCLg0QkZGhFLE9JzSd0JzAy1tVu39iWMGvTb4c7m05yamNZrIkW+UOQWh22P
         TLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUzTbk283M4szMwAz8kjQEH2mHSmYPnGpVBsKP8pQqj/NU5V/P/mCmB8hfAX76a4u1hhv/+/RWAH6X3iIWatgQgiczI/+CCPjIsw/rGDLs=
X-Gm-Message-State: AOJu0Yyuc81HPKdqma6ojEt8ecILV5qusDMJAtq0plKve+F8gmKCQ2Yy
	sWILEwN5XsWLkP+dBFtgOCBpbcZC9w8mnzegzNqbWUvr0GDDCITeFs40f+mpTw==
X-Google-Smtp-Source: AGHT+IEAxQrUW+f8PTtqixOQ6f0lZv/OBjKQw8OEEcA2Ik3oz9d5W+dBQnROFgHipoNOML18n8TzWQ==
X-Received: by 2002:a17:907:7f26:b0:a6f:50ae:e09 with SMTP id a640c23a62f3a-a6f60cefc4emr912807066b.4.1718631674759;
        Mon, 17 Jun 2024 06:41:14 -0700 (PDT)
Message-ID: <e3912334-4dbe-40e9-aed4-8b47e1570cc7@suse.com>
Date: Mon, 17 Jun 2024 15:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240613165617.42538-1-roger.pau@citrix.com>
 <20240613165617.42538-4-roger.pau@citrix.com>
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
In-Reply-To: <20240613165617.42538-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 18:56, Roger Pau Monne wrote:
> fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> the CPU is to become offline, the normal migration logic used by Xen where the
> vector in the previous target(s) is left configured until the interrupt is
> received on the new destination is not suitable.
> 
> Instead attempt to do as much as possible in order to prevent loosing
> interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> currently the case)

Except (again) for smp_send_stop().

> attempt to forward pending vectors when interrupts that
> target the current CPU are migrated to a different destination.
> 
> Additionally, for interrupts that have already been moved from the current CPU
> prior to the call to fixup_irqs() but that haven't been delivered to the new
> destination (iow: interrupts with move_in_progress set and the current CPU set
> in ->arch.old_cpu_mask) also check whether the previous vector is pending and
> forward it to the new destination.
> 
> This allows us to remove the window with interrupts enabled at the bottom of
> fixup_irqs().  Such window wasn't safe anyway: references to the CPU to become
> offline are removed from interrupts masks, but the per-CPU vector_irq[] array
> is not updated to reflect those changes (as the CPU is going offline anyway).
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>[...]
> @@ -2686,11 +2705,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>          if ( desc->handler->disable )
>              desc->handler->disable(desc);
>  
> +        /*
> +         * If the current CPU is going offline and is (one of) the target(s) of
> +         * the interrupt, signal to check whether there are any pending vectors
> +         * to be handled in the local APIC after the interrupt has been moved.
> +         */
> +        if ( !cpu_online(cpu) && cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
> +            check_irr = true;
> +
>          if ( desc->handler->set_affinity )
>              desc->handler->set_affinity(desc, affinity);
>          else if ( !(warned++) )
>              set_affinity = false;
>  
> +        if ( check_irr && apic_irr_read(vector) )
> +            /*
> +             * Forward pending interrupt to the new destination, this CPU is
> +             * going offline and otherwise the interrupt would be lost.
> +             */
> +            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> +                          desc->arch.vector);

Hmm, IRR may become set right after the IRR read (unlike in the other cases,
where new IRQs ought to be surfacing only at the new destination). Doesn't
this want moving ...

>          if ( desc->handler->enable )
>              desc->handler->enable(desc);

... past the actual affinity change?

Jan

