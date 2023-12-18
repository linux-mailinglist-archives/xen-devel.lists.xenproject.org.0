Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B757C81780E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656280.1024352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGzH-0007cV-GM; Mon, 18 Dec 2023 17:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656280.1024352; Mon, 18 Dec 2023 17:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGzH-0007aJ-DT; Mon, 18 Dec 2023 17:01:03 +0000
Received: by outflank-mailman (input) for mailman id 656280;
 Mon, 18 Dec 2023 17:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFGzG-0007aD-0b
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:01:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03355cc7-9dc7-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 18:00:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33660cf2296so2180469f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:00:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d4d01000000b003365aa39d30sm8621816wrt.11.2023.12.18.09.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:00:56 -0800 (PST)
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
X-Inumbo-ID: 03355cc7-9dc7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702918857; x=1703523657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EB4vKva2re38fCTcPQNUzCEqrIaP3A1NndBf9laXjwY=;
        b=CafhR9b5a1ZIwdABFfnl4atx4YXPS23CiSEtpo2X8rHsyCIp/XAzetP9hpVq0m8NmU
         mJvKlyLeAV1yCVDJvKQlGg1GktiwXQ1qTOkqi4Fgb+7yswr3KAU4wasZ8d2i2i8zKUx4
         d1BYWA3UpNecUXwkYXNNPJjA2zfVZNFh46yt9Xs0zqD7un7FnajyEVwBy4OdgF+wA3aP
         M74qLoa5xZ5IaY6cYhkUmb6+VjzOWClcvM2IfDi1pIRavZzU/ISJUeCZtHykD9ACEuLJ
         VdGeO/B/x/qsCv+DEXDcYSzro+qvmlKzSm/NYrPFIasKR9USJdz6M4/YgP2W4K20xlPq
         Ar+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702918857; x=1703523657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EB4vKva2re38fCTcPQNUzCEqrIaP3A1NndBf9laXjwY=;
        b=faJj0w1dW4373ujGYsgxlFrclnA1kspjWumvVUE3kxHJw9ulOYs9xn6GG6F9cXU8Ll
         lmJHpBqEVDAHFJcTWAoJyQlzOkWo99XS+HGomDsiEZvA/HY470UJuyvGzpUnfTzfefGO
         mukN3TEpxs/BgJ6VjjuBD9TF9d/GvG2nbxx1hS4i6+SZ1U4vzpA5osjhPXd3TKETRusG
         XPwUKVDkzp1Dtk2PBVW4eF4mDVx3qZUtsG+vEH5Ts3y+jx4airk5Y7HYD4/+jmO4ctKE
         xw62B7t7AQhz7YO2AUrujibNrNwF6uR+LstEGEd6iPbTDCCqrEIkTq/zt3j48pKatTPD
         GcrQ==
X-Gm-Message-State: AOJu0Yw4WFY2cbatulajiqqBAIys8yBtWXmtmJ+NMUOgx5u5sJYbQ+7h
	RziMIenXQKEgbtqLOpupMBdS
X-Google-Smtp-Source: AGHT+IEUEv349ddJq8xTlqlK2uCmIcMtpfi2iV7qXoAqY7Aj7+ObD0i5zWFlqYdoK9D9Fq5oif9BbQ==
X-Received: by 2002:a5d:5382:0:b0:336:6045:3c37 with SMTP id d2-20020a5d5382000000b0033660453c37mr1986242wrv.92.1702918856838;
        Mon, 18 Dec 2023 09:00:56 -0800 (PST)
Message-ID: <f52b19eb-7633-48df-85b9-c6a545dc4232@suse.com>
Date: Mon, 18 Dec 2023 18:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/39] xen/rirscv: add minimal amount of stubs to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,19 +1,23 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bug.h>
>  #include <xen/cache.h>
>  #include <xen/compiler.h>
>  #include <xen/init.h>
>  #include <xen/kernel.h>
>  #include <xen/macros.h>
> +#include <xen/mm.h>
>  #include <xen/pfn.h>
>  
>  #include <asm/early_printk.h>
>  #include <asm/csr.h>
>  #include <asm/current.h>
> -#include <asm/mm.h>
>  #include <asm/page.h>
>  #include <asm/processor.h>
>  
> +unsigned long frametable_base_pdx __read_mostly;
> +unsigned long frametable_virt_end __read_mostly;

Nit (style):

unsigned long __read_mostly frametable_base_pdx;
unsigned long __read_mostly frametable_virt_end;

(i.e. attributes generally between type and identifier). Plus
__read_mostly or __ro_after_init?

> @@ -294,3 +298,49 @@ unsigned long __init calc_phys_offset(void)
>      phys_offset = load_start - XEN_VIRT_START;
>      return phys_offset;
>  }
> +
> +void put_page(struct page_info *page)
> +{
> +    assert_failed(__func__);
> +}
> +
> +unsigned long get_upper_mfn_bound(void)
> +{
> +    /* No memory hotplug yet, so current memory limit is the final one. */
> +    return max_page - 1;
> +}
> +
> +void arch_dump_shared_mem_info(void)
> +{
> +    WARN();
> +}
> +
> +int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
> +{
> +    assert_failed(__func__);
> +    return -1;
> +}

Whats the pattern between picking WARN(), assert_failed() (which I don't
think you should be using anyway; if an assertion, then ASSERT_UNREACHABLE())
and BUG() (as used earlier in stubs living in header files)?

> --- /dev/null
> +++ b/xen/arch/riscv/stubs.c
> @@ -0,0 +1,426 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/cpumask.h>
> +#include <xen/domain.h>
> +#include <xen/irq.h>
> +#include <xen/nodemask.h>
> +#include <xen/time.h>
> +#include <public/domctl.h>
> +#include <public/vm_event.h>

I think I can see why you need the former of these last two, but do you
really need the latter?

> +#include <asm/current.h>
> +
> +/* smpboot.c */
> +
> +cpumask_t cpu_online_map;
> +cpumask_t cpu_present_map;
> +cpumask_t cpu_possible_map;
> +
> +/* ID of the PCPU we're running on */
> +DEFINE_PER_CPU(unsigned int, cpu_id);
> +/* XXX these seem awfully x86ish... */
> +/* representing HT siblings of each logical CPU */
> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
> +/* representing HT and core siblings of each logical CPU */
> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
> +
> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
> +
> +/* time.c */
> +
> +unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
> +
> +s_time_t get_s_time(void)
> +{
> +    BUG();
> +}
> +
> +int reprogram_timer(s_time_t timeout)
> +{
> +    BUG();
> +}
> +
> +void send_timer_event(struct vcpu *v)
> +{
> +    BUG();
> +}
> +
> +void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
> +{
> +    BUG();
> +}
> +
> +/* shutdown.c */
> +
> +void machine_restart(unsigned int delay_millisecs)
> +{
> +    BUG();
> +}
> +
> +void machine_halt(void)
> +{
> +    BUG();
> +}
> +
> +/* vm_event.c */
> +
> +void vm_event_fill_regs(vm_event_request_t *req)
> +{
> +    BUG();
> +}
> +
> +void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
> +{
> +    BUG();
> +}
> +
> +void vm_event_monitor_next_interrupt(struct vcpu *v)
> +{
> +    /* Not supported on RISCV. */
> +}
> +
> +void vm_event_reset_vmtrace(struct vcpu *v)
> +{
> +    /* Not supported on RISCV. */
> +}
> +
> +/* domctl.c */
> +
> +long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    BUG();
> +}
> +
> +void arch_get_domain_info(const struct domain *d,
> +                          struct xen_domctl_getdomaininfo *info)
> +{
> +    BUG();
> +}
> +
> +void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> +{
> +    BUG();
> +}
> +
> +/* monitor.c */
> +
> +int arch_monitor_domctl_event(struct domain *d,
> +                              struct xen_domctl_monitor_op *mop)
> +{
> +    BUG();
> +}
> +
> +/* smp.c */
> +
> +void arch_flush_tlb_mask(const cpumask_t *mask)
> +{
> +    BUG();
> +}
> +
> +void smp_send_event_check_mask(const cpumask_t *mask)
> +{
> +    BUG();
> +}
> +
> +void smp_send_call_function_mask(const cpumask_t *mask)
> +{
> +    BUG();
> +}
> +
> +/* irq.c */
> +
> +struct pirq *alloc_pirq_struct(struct domain *d)
> +{
> +    BUG();
> +}
> +
> +int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
> +{
> +    BUG();
> +}
> +
> +void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
> +{
> +    BUG();
> +}
> +
> +void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> +{
> +    BUG();
> +}
> +
> +static void ack_none(struct irq_desc *irq)
> +{
> +    BUG();
> +}
> +
> +static void end_none(struct irq_desc *irq)
> +{
> +    BUG();
> +}

Much like I said for PPC - I don't think you need the two, as ...

> +hw_irq_controller no_irq_type = {
> +    .typename = "none",
> +    .startup = irq_startup_none,
> +    .shutdown = irq_shutdown_none,
> +    .enable = irq_enable_none,
> +    .disable = irq_disable_none,
> +    .ack = ack_none,
> +    .end = end_none

... there's nothing right now to invoke these hooks.

Jan

