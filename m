Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C6903DEF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738443.1145205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1tf-0002S4-B2; Tue, 11 Jun 2024 13:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738443.1145205; Tue, 11 Jun 2024 13:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1tf-0002Pn-7d; Tue, 11 Jun 2024 13:50:47 +0000
Received: by outflank-mailman (input) for mailman id 738443;
 Tue, 11 Jun 2024 13:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH1td-0002PK-Ht
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:50:45 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 993ceb9d-27f9-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:50:44 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57c61165af6so4826751a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 06:50:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c61155622sm7034544a12.5.2024.06.11.06.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 06:50:43 -0700 (PDT)
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
X-Inumbo-ID: 993ceb9d-27f9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718113844; x=1718718644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pzlFqip9Fy1ra5YP2sJX1mQ40a+ZGo8+KGnVcl0gd+Y=;
        b=CYPzC2DxeSE4OVtoweyQhY6s4mMuqXNUsVuDaYwnKBr/5JQnIWmQ+5W0+61jhOAe8v
         fMd7aW+2pzzgOhRlcH9lF1rz3CdA0lagND+OqlRPkA7/n8F4zRXZGXY/3v8ghnNG6akY
         McsCBDDNOmDHSK2VEMXxrveeVcjuL/KoF6l9VXiJxd5MYDRVc7thFCdGCdPyAwj8SSoo
         d4vOKmbv5pfK3ciZwrUtNSgYAGhuVCsmx05eS82yzVnzpJM8ylkJkOjZkz7/PtyW7MLA
         jZsUk8RTlUcTUWFanxTC6Lz1NV2l+usVPzVrWXWL8FvkbbegzipiNxuZ8rpZ8xEc+sDH
         nBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718113844; x=1718718644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzlFqip9Fy1ra5YP2sJX1mQ40a+ZGo8+KGnVcl0gd+Y=;
        b=kOpBN1Egp7CgfbMv4OktI68z9OKnOehD0LbWyVaKfUQDPD9XJSPLiwnF31D064Huly
         IiuJ+0RlWhGAB0s+Ja5e5TKSL1HJMLMEfe9TXxshHCbyHWtk2NUpPOY1F+vxdy1fDQZk
         x7psHIInAaUR97qZLpFd+7nRAI0C3mRE4UCZw23MwC3DHLGVW9a3RVeub9pdUUTT8bA8
         +T8q/c+N/3UKRplIt8HMDdoBENR2b982jl4yGJBRweQjuU6Sjd7rxJwUBylxZiaykO15
         10Cn0zaWNhfp3S5Pkwt5nIERdG0KeQfrDbJFJRwetjpOo9+VIjWTOA/8C0jA3GDbzhXn
         ZjcA==
X-Forwarded-Encrypted: i=1; AJvYcCXN1iwInoKEToJgJlUzaDPbAVGPhuEAguFkZd+ntwlC83YMqFSdASYpuKxbzGYFW0FCV9rdKIug6NHV0VBWuQDLi2UTsR8DaD7bIMfTHhM=
X-Gm-Message-State: AOJu0YxrNSwJ+JHcNXXXngGBXIGjGGkZEIIpDf6pj0tyoGzez37wIm4e
	jxEYp6mbq9ZcTFpryqDCmOUjgT9lBdiiBy9g4vD2SCnVobdME0hJt/5/EXIlPQ==
X-Google-Smtp-Source: AGHT+IExe6cNH0vRheyeUdlgTbw2gG902SXKuwCRdzt2J/gSzHpN9VG6iysKKRO3kCe8ujMDk0zNAg==
X-Received: by 2002:a50:c31b:0:b0:57c:74ea:8d24 with SMTP id 4fb4d7f45d1cf-57c74ea8f6amr4344767a12.18.1718113843853;
        Tue, 11 Jun 2024 06:50:43 -0700 (PDT)
Message-ID: <7e090e00-2061-4ef1-a0a4-b45ac86c5ee6@suse.com>
Date: Tue, 11 Jun 2024 15:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] x86/irq: forward pending interrupts to new
 destination in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-8-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> fixup_irqs() is used to evacuate interrupts from to be offlined CPUs.  Given
> the CPU is to become offline, the normal migration logic used by Xen where the
> vector in the previous target(s) is left configured until the interrupt is
> received on the new destination is not suitable.
> 
> Instead attempt to do as much as possible in order to prevent loosing
> interrupts.  If fixup_irqs() is called from the CPU to be offlined (as is
> currently the case) attempt to forward pending vectors when interrupts that
> target the current CPU are migrated to a different destination.
> 
> Additionally, for interrupts that have already been moved from the current CPU
> prior to the call to fixup_irqs() but that haven't been delivered to the new
> destination (iow: interrupts with move_in_progress set and the current CPU set
> in ->arch.old_cpu_mask) also check whether the previous vector is pending and
> forward it to the new destination.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Rename to apic_irr_read().
> ---
>  xen/arch/x86/include/asm/apic.h |  5 +++++
>  xen/arch/x86/irq.c              | 37 ++++++++++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> index d1cb001fb4ab..7bd66dc6e151 100644
> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -132,6 +132,11 @@ static inline bool apic_isr_read(uint8_t vector)
>              (vector & 0x1f)) & 1;
>  }
>  
> +static inline bool apic_irr_read(unsigned int vector)
> +{
> +    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
> +}
> +
>  static inline u32 get_apic_id(void)
>  {
>      u32 id = apic_read(APIC_ID);
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 54eabd23995c..ed262fb55f4a 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2601,7 +2601,7 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>  
>      for ( irq = 0; irq < nr_irqs; irq++ )
>      {
> -        bool break_affinity = false, set_affinity = true;
> +        bool break_affinity = false, set_affinity = true, check_irr = false;
>          unsigned int vector, cpu = smp_processor_id();
>          cpumask_t *affinity = this_cpu(scratch_cpumask);
>  
> @@ -2649,6 +2649,25 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>               !cpumask_test_cpu(cpu, &cpu_online_map) &&
>               cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
>          {
> +            /*
> +             * This to be offlined CPU was the target of an interrupt that's
> +             * been moved, and the new destination target hasn't yet
> +             * acknowledged any interrupt from it.
> +             *
> +             * We know the interrupt is configured to target the new CPU at
> +             * this point, so we can check IRR for any pending vectors and
> +             * forward them to the new destination.
> +             *
> +             * Note the difference between move_in_progress or
> +             * move_cleanup_count being set.  For the later we know the new
> +             * destination has already acked at least one interrupt from this
> +             * source, and hence there's no need to forward any stale
> +             * interrupts.
> +             */

I'm a little confused by this last paragraph: It talks about a difference,
yet ...

> +            if ( apic_irr_read(desc->arch.old_vector) )
> +                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
> +                              desc->arch.vector);

... in the code being commented there's no difference visible. Hmm, I guess
this is related to the enclosing if(). Maybe this could be worded a little
differently, e.g. starting with "Note that for the other case -
move_cleanup_count being non-zero - we know ..."?

> @@ -2689,11 +2708,27 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>          if ( desc->handler->disable )
>              desc->handler->disable(desc);
>  
> +        /*
> +         * If the current CPU is going offline and is (one of) the target(s) of
> +         * the interrupt signal to check whether there are any pending vectors
> +         * to be handled in the local APIC after the interrupt has been moved.
> +         */

After reading this a number of times, I think there wants to be a comma between
"interrupt" and "signal". Or am I getting wrong what is being meant?

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
> +
>          if ( desc->handler->enable )
>              desc->handler->enable(desc);
>  

Down from here, after the loop, there's a 1ms window where latched but not
yet delivered interrupts can be received. How's that playing together with
the changes you're making? Aren't we then liable to get two interrupts, one
at the old and one at the new source, in unknown order?

Jan

