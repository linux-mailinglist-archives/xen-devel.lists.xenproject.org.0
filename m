Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93720A2E918
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884541.1294256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQtq-0001uF-R7; Mon, 10 Feb 2025 10:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884541.1294256; Mon, 10 Feb 2025 10:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thQtq-0001ri-OA; Mon, 10 Feb 2025 10:20:22 +0000
Received: by outflank-mailman (input) for mailman id 884541;
 Mon, 10 Feb 2025 10:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thQtq-0001rc-2R
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:20:22 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1166919-e798-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:20:19 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5de5a8a96abso3276396a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 02:20:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de63a89b6asm3771957a12.46.2025.02.10.02.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:20:18 -0800 (PST)
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
X-Inumbo-ID: a1166919-e798-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739182819; x=1739787619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=no7BnQY2k2OEZ/xP9kzJM8Z4JwzySduTvqCsL/kZl5o=;
        b=CnKOqKSTnIhXCQFDFgvzrRL7H5dwZIJTpZIVmDwUSKiT//uITHjTceutcTLeRmj3aD
         D6PhWwomJHVAjLW70hA2tVEtfnIZHZouFYq2ZadZlp6TetXtC92CQAjaa/2PCx0q0VQa
         lHhgNb7cDi5iNLt9qA9JZ3oV/jL7rm8m4n0osCnW6KnLzbXpVpdKxNFOkcOY6hAWCaZ3
         5jDaDcH7hsR70FsuItziLNtZbUOEF1KPSqJQPZxZSLF0wm3+PHrC5TkF6b5no268wYCi
         cXCfcnhiNyJcApuBU6gaw42YcET7+VsgdpTs7hRrvGHDKfSMe3KUZejY6wc+/zBsIxEr
         sfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182819; x=1739787619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no7BnQY2k2OEZ/xP9kzJM8Z4JwzySduTvqCsL/kZl5o=;
        b=LHUNBV6Rk1at667fM8GhVDJ+MHj2WWlvmhh/zePxaP1Y7qgrWPbQdqp5Duq/ntNK/z
         CgQf+YzEhrnCAGjsmOTIAW+OGs3Br0UyO/NTh6Gc42bf3z9yh+4mY6FFBKe1MNtbKvxb
         OliXk7gjvfIugZncW+vPQq0MDeFXZJugrxAMPqZSDA46x3HfCwjR07tQUSTAqBM45gcI
         YrIt9pUYjUQqN0CWlmGvh+TyhxUhBPAIYRvMjJNxvtJGy92xEFmUVDwqVy1fxWVz/1o1
         +P1BQvJxm5cw3XuqqoRQ0N34IF4QgQQkQQ4qRLDbXcMibVz1LLHeC0yK8G7AbyV67740
         a3qQ==
X-Gm-Message-State: AOJu0YzVrvNmNxLCSxU7b1hSNbantUpRHcgBtN7bartM8Is8BzJtEywY
	Gp3cdiuGmMuII+clsjvXPZqK0Y/m8ajtLb/3CKdbJG3BEj8duo2gpHMj9qetnA==
X-Gm-Gg: ASbGnct9Vm+QVbg0vfjAtsrthWtu+Nr7wQloGkewkbEhGx8XPqeQFPlxND3JS++cu/H
	RM8LVKMr8bR/cXt6dz/V2WDkQGDGzX3mTHgk+/Hk5D9adYwPuLagfJbp2AGa6fypSqjIH7sato1
	Wj/2sgstS/m1akj7tYxn1/9vxthCL34zXUOvEXHpggRUopgX5uQ2znaWLV0trLS3SFlvWifPvQ+
	pAKU1GWm8zdHae8vc8hU+P2oJRGFIJXZrGdGp3zbnvbpEYtWaOqYlYX/frur8l5vE8r7pM0OT14
	qKWUZpNr9ELylmYuLWNJ4LDd4quWFm1pM/nmXSej6Q50LEYU9jStmpHpRr56kQCnE6aSJA+yxB4
	L
X-Google-Smtp-Source: AGHT+IG6kKiA0Az8kqaD+c9tr4zkYpqPbwGcks5lLJmu9NkwZykare5QVye+reNozAqzsO+pQ9zNeg==
X-Received: by 2002:a05:6402:194b:b0:5dc:a44e:7644 with SMTP id 4fb4d7f45d1cf-5de44fe95c1mr35645972a12.2.1739182819181;
        Mon, 10 Feb 2025 02:20:19 -0800 (PST)
Message-ID: <2fa4f84e-3773-4bab-9be1-ef068a1cce36@suse.com>
Date: Mon, 10 Feb 2025 11:20:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/shutdown: offline APs with interrupts disabled
 on all CPUs
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <20250206150615.52052-2-roger.pau@citrix.com>
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
In-Reply-To: <20250206150615.52052-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 16:06, Roger Pau Monne wrote:
> The current shutdown logic in smp_send_stop() will disable the APs while
> having interrupts enabled on the BSP or possibly other APs. On AMD systems
> this can lead to local APIC errors:
> 
> APIC error on CPU0: 00(08), Receive accept error
> 
> Such error message can be printed in a loop, thus blocking the system from
> rebooting.  I assume this loop is created by the error being triggered by
> the console interrupt, which is further stirred by the ESR handler
> printing to the console.
> 
> Intel SDM states:
> 
> "Receive Accept Error.
> 
> Set when the local APIC detects that the message it received was not
> accepted by any APIC on the APIC bus, including itself. Used only on P6
> family and Pentium processors."
> 
> So the error shouldn't trigger on any Intel CPU supported by Xen.
> 
> However AMD doesn't make such claims, and indeed the error is broadcasted
> to all local APICs when an interrupt targets a CPU that's already offline.
> 
> To prevent the error from stalling the shutdown process perform the
> disabling of APs and the BSP local APIC with interrupts disabled on all
> CPUs in the system, so that by the time interrupts are unmasked on the BSP
> the local APIC is already disabled.  This can still lead to a spurious:
> 
> APIC error on CPU0: 00(00)
> 
> As a result of an LVT Error getting injected while interrupts are masked on
> the CPU, and the vector only handled after the local APIC is already
> disabled.

Isn't this bogus, too? As in: Error interrupt without any ESR bits set? Since
I can already see our QA folks report this as another issue, can we perhaps
somehow amend the log message in that case, indicating we think it's bogus?

> Note the NMI crash path doesn't have such issue, because disabling of APs
> and the caller local APIC is already done in the same contiguous region
> with interrupts disabled.  There's a possible window on the NMI crash path
> (nmi_shootdown_cpus()) where some APs might be disabled (and thus
> interrupts targeting them raising "Receive accept error") before others APs
> have interrupts disabled.  However the shutdown NMI will be handled,
> regardless of whether the AP is processing a local APIC error, and hence
> such interrupts will not cause the shutdown process to get stuck.
> 
> Remove the call to fixup_irqs() in smp_send_stop(), as it doesn't achieve
> the intended goal of moving all interrupts to the BSP anyway, because when
> called the APs are still set as online in cpu_online_map.

This is a little too little for my taste: The fact the APs are still online
was, after all, intended to be covered by passing cpumask_of(cpu).

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I suppose there simply is no "good" commit to blame here with a Fixes: tag.

> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -345,6 +345,11 @@ void __stop_this_cpu(void)
>  
>  static void cf_check stop_this_cpu(void *dummy)
>  {
> +    const bool *stop_aps = dummy;
> +
> +    while ( !*stop_aps )
> +        cpu_relax();
> +
>      __stop_this_cpu();
>      for ( ; ; )
>          halt();
> @@ -357,16 +362,25 @@ static void cf_check stop_this_cpu(void *dummy)
>  void smp_send_stop(void)
>  {
>      unsigned int cpu = smp_processor_id();
> +    bool stop_aps = false;
> +
> +    /*
> +     * Perform AP offlining and disabling of interrupt controllers with all
> +     * CPUs on the system having interrupts disabled to prevent interrupt
> +     * delivery errors.  On AMD systems "Receive accept error" will be
> +     * broadcasted to local APICs if interrupts target CPUs that are offline.
> +     */
> +    if ( num_online_cpus() > 1 )
> +        smp_call_function(stop_this_cpu, &stop_aps, 0);
> +
> +    local_irq_disable();

With the extensive comment I think this is going to be okay. Just one grammar
thing (and I'm curious myself), mainly to Andrew as a native speaker (or any
other native speakers who read this): While I can find the form you use even
in things calling themselves dictionaries, I've still been under the impression
that it is "be broadcast". (If so, also somewhere in the description then.)

Jan

