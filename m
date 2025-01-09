Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2FA07090
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867877.1279415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoOa-0000mW-FD; Thu, 09 Jan 2025 09:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867877.1279415; Thu, 09 Jan 2025 09:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVoOa-0000jB-Bs; Thu, 09 Jan 2025 09:00:04 +0000
Received: by outflank-mailman (input) for mailman id 867877;
 Thu, 09 Jan 2025 09:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVoOY-0000Sn-Vd
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:00:02 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b5712ba-ce68-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 10:00:00 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so4924555e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:00:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dcc8ddddsm52410165e9.0.2025.01.09.00.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 00:59:59 -0800 (PST)
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
X-Inumbo-ID: 1b5712ba-ce68-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736413200; x=1737018000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xNWEARFJyosFvLsb8p1NXDbZUZslPRuGjAlrl83QDuw=;
        b=Jud5stoHmuT1v1pYMfpBLcgXwftLf7IbnYUK5tKfi/ZSWHxD9Rp0GQ4x1I/1CGObIN
         OZhRT75JnFoPkumHXr0l9Z/vwEdnwCtAR4FzDMAHaLWMuPPP/DeuuBI2YfcmwByMJK4V
         oS45WjkcM0h7fLTWjQPJlyhUAQ+kX1nrdRy3y2GGWijMIbHpSaz7eqSMvf+jVdhr5wjl
         WyOveaIKXlz+fAKzkGYLXUEduN9MoSdFLN6qtEpK4ppMlUH6qj4Lh+d2dVbXM+7pGTN+
         qDq99OGC+yXNirR7C7yLCcLUvNcg3Ii/UKhy2YuY0nzae8pu0vTgjmJ1ddW3AjjNEjB0
         6GlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413200; x=1737018000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNWEARFJyosFvLsb8p1NXDbZUZslPRuGjAlrl83QDuw=;
        b=a3+XeL1ZNw0m7bPVYQP2z2sunwCsMWZUSprWbx1J38KoaURwG5RJR6tx6MzUm/M/ZN
         inxAhR9cyX9av1T8mWvdYB7rdglclpGkH1gk1EIod9cxLWK/92PUgsgobn36nPcn9wym
         CMIV+VgAjzjS8kOpH7/qgW2FdmsIofgc8OXREL2NU9hD2UvOWKX6lp67hu3K1T/8ehQi
         g3IyE8423gWYYwWb9Blo3aRauqmyCZlDXUVTTlPnHmUWkOPPuVphsk83kUBN6dd8iQin
         ZIcZnNFQq2G9ZJ4y13VMDKXWKan8wK+rqfSAjZd3/pUmtiOAUnvAD5HYA+MDL3rgcwEC
         Zq6g==
X-Forwarded-Encrypted: i=1; AJvYcCUSIhR+S4zlg++aZiSQyvftaoyQ7H/bdmHidtFmLwVHKWGpAqzIkMG1nw63JPBYe0xOaflvfJameI4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhxFKBrztK92djtXZGq52C44Xcg2G1yTN2lYTBCmieK8KNNwI1
	kZSiW6IW2RrXB5BAhBqYrO3RJh5h3AegqETja3QDovA8+UCupUiBnKtB6ai0Jg==
X-Gm-Gg: ASbGncvVK7lHRVONy4U/58iSyX716JWxpnlmZa2dCURtay/xN6gU9LlCmkqk8xOCaSH
	iGqypdjLqIjSeNfj2k8UTAzOccd/So02kH9/jn37fpDg+jA0LOKJ94XejLIyB7qj8O9h232JdRc
	LPEZZW/x6JMteNX9N/dlTI4jB8dRhZwJ7ekf0wozjIgnkt+Wa/+hOIEY8fcrnzHLS0kGtjEqLRX
	JXIYV9RdZUatmU3x2A797Ryi+vrlPMDFm5iTcsj1dj232DLBsZDuZ4NoA1CCYftym4dahDh+knt
	dS/PHmVroa8bod2jf1oJSe2ohkpIjXh2xW3ih+RUhw==
X-Google-Smtp-Source: AGHT+IHQn/lYVHHIyMCRqNgr13HmVW8etbALTzx21tRu2SYve2/OgM3AmKcWGaQefJYhjTjCwem1og==
X-Received: by 2002:a05:600c:4f47:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-436e2684dfcmr47162035e9.6.1736413200013;
        Thu, 09 Jan 2025 01:00:00 -0800 (PST)
Message-ID: <46cb0ee0-ea9f-4515-abac-058a9aa846e4@suse.com>
Date: Thu, 9 Jan 2025 09:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
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
In-Reply-To: <20250108142659.99490-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 15:26, Roger Pau Monne wrote:
> On x86 Xen will perform lazy context switches to the idle vCPU, where the
> previously running vCPU context is not overwritten, and only current is updated
> to point to the idle vCPU.  The state is then disjunct between current and
> curr_vcpu: current points to the idle vCPU, while curr_vcpu points to the vCPU
> whose context is loaded on the pCPU.
> 
> While on that lazy context switched state, certain calls (like
> map_domain_page()) will trigger a full synchronization of the pCPU state by
> forcing a context switch.  Note however how calling any of such functions
> inside the context switch code itself is very likely to trigger an infinite
> recursion loop.
> 
> Attempt to limit the window where curr_vcpu != current in the context switch
> code, as to prevent and infinite recursion loop around sync_local_execstate().
> 
> This is required for using map_domain_page() in the vCPU context switch code,
> otherwise using map_domain_page() in that context ends up in a recursive
> sync_local_execstate() loop:

Question is whether it's a good idea in the first place to start using
map_domain_page() from the context switch path. Surely there are possible
alternatives.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1982,16 +1982,16 @@ static void load_default_gdt(unsigned int cpu)
>      per_cpu(full_gdt_loaded, cpu) = false;
>  }
>  
> -static void __context_switch(void)
> +static void __context_switch(struct vcpu *n)
>  {
>      struct cpu_user_regs *stack_regs = guest_cpu_user_regs();
>      unsigned int          cpu = smp_processor_id();
>      struct vcpu          *p = per_cpu(curr_vcpu, cpu);
> -    struct vcpu          *n = current;
>      struct domain        *pd = p->domain, *nd = n->domain;
>  
>      ASSERT(p != n);
>      ASSERT(!vcpu_cpu_dirty(n));
> +    ASSERT(p == current);
>  
>      if ( !is_idle_domain(pd) )
>      {
> @@ -2036,6 +2036,18 @@ static void __context_switch(void)
>  
>      write_ptbase(n);
>  
> +    /*
> +     * It's relevant to set both current and curr_vcpu back-to-back, to avoid a
> +     * window where calls to mapcache_current_vcpu() during the context switch
> +     * could trigger a recursive loop.
> +     *
> +     * Do the current switch immediately after switching to the new guest
> +     * page-tables, so that current is (almost) always in sync with the
> +     * currently loaded page-tables.
> +     */
> +    set_current(n);
> +    per_cpu(curr_vcpu, cpu) = n;

The latter paragraph of the comment states something that so far wasn't intended,
and imo also shouldn't be going forward. It's curr_vcpu which wants to be in sync
with the loaded page tables. (Whether pulling ahead its updating is okay is a
separate question. All of these actions used to be be very carefully placed they
way they are. Which isn't to say that I can exclude things having gone stale ...)
And yes, that has always meant that mapcache_current_vcpu()'s condition for
calling sync_local_execstate() was building upon the fact that it won't be called
from context switching contexts.

Did you consider updating that condition (evaluating curr_cpu) instead?

> @@ -2048,8 +2060,6 @@ static void __context_switch(void)
>      if ( pd != nd )
>          cpumask_clear_cpu(cpu, pd->dirty_cpumask);
>      write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
> -
> -    per_cpu(curr_vcpu, cpu) = n;
>  }
>  
>  void context_switch(struct vcpu *prev, struct vcpu *next)
> @@ -2081,16 +2091,36 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>  
>      local_irq_disable();
>  
> -    set_current(next);
> -
>      if ( (per_cpu(curr_vcpu, cpu) == next) ||
>           (is_idle_domain(nextd) && cpu_online(cpu)) )
>      {
> +        /*
> +         * Lazy context switch to the idle vCPU, set current == idle.  Full
> +         * context switch happens if/when sync_local_execstate() is called.
> +         */
> +        set_current(next);
>          local_irq_enable();

The comment is misleading as far as the first half of the if() condition goes:
No further switching is going to happen in that case, aiui.

>      }
>      else
>      {
> -        __context_switch();
> +        /*
> +         * curr_vcpu will always point to the currently loaded vCPU context, as
> +         * it's not updated when doing a lazy switch to the idle vCPU.
> +         */
> +        struct vcpu *prev_ctx = per_cpu(curr_vcpu, cpu);
> +
> +        if ( prev_ctx != current )
> +        {
> +            /*
> +             * Doing a full context switch to a non-idle vCPU from a lazy
> +             * context switched state.  Adjust current to point to the
> +             * currently loaded vCPU context.
> +             */
> +            ASSERT(current == idle_vcpu[cpu]);
> +            ASSERT(!is_idle_vcpu(next));
> +            set_current(prev_ctx);

This feels wrong, as in "current" then not representing what it should represent,
for a certain time window. I may be dense, but neither comment not description
clarify to me why this might be needed. I can see that it's needed to please the
ASSERT() you add to __context_switch(), yet then I might ask why that assertion
is put there.

> +        }
> +        __context_switch(next);
>  
>          /* Re-enable interrupts before restoring state which may fault. */
>          local_irq_enable();
> @@ -2156,15 +2186,23 @@ int __sync_local_execstate(void)
>  {
>      unsigned long flags;
>      int switch_required;
> +    unsigned int cpu = smp_processor_id();
> +    struct vcpu *p;
>  
>      local_irq_save(flags);
>  
> -    switch_required = (this_cpu(curr_vcpu) != current);
> +    p = per_cpu(curr_vcpu, cpu);
> +    switch_required = (p != current);
>  
>      if ( switch_required )
>      {
> -        ASSERT(current == idle_vcpu[smp_processor_id()]);
> -        __context_switch();
> +        ASSERT(current == idle_vcpu[cpu]);
> +        /*
> +         * Restore current to the previously running vCPU, __context_switch()
> +         * will update current together with curr_vcpu.
> +         */
> +        set_current(p);

Similarly here.

> +        __context_switch(idle_vcpu[cpu]);
>      }
>  
>      local_irq_restore(flags);
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2232,8 +2232,6 @@ void __init trap_init(void)
>  
>  void activate_debugregs(const struct vcpu *curr)
>  {
> -    ASSERT(curr == current);
> -
>      write_debugreg(0, curr->arch.dr[0]);
>      write_debugreg(1, curr->arch.dr[1]);
>      write_debugreg(2, curr->arch.dr[2]);

Why would this assertion go away? If it suddenly triggers, the parameter name
would now end up being wrong.

Jan

