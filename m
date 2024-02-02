Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A08847723
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 19:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675164.1050392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVy0m-0006ct-4x; Fri, 02 Feb 2024 18:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675164.1050392; Fri, 02 Feb 2024 18:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVy0m-0006aU-2E; Fri, 02 Feb 2024 18:11:36 +0000
Received: by outflank-mailman (input) for mailman id 675164;
 Fri, 02 Feb 2024 18:11:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVy0l-0006aO-9n
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 18:11:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVy0j-0006LV-CG; Fri, 02 Feb 2024 18:11:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVy0j-0004Up-54; Fri, 02 Feb 2024 18:11:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=k4ujF5wibe8ZZB+NW0LDju939U6RrWnDNvZLBP9Nx2U=; b=T3SGgQltgNMXhy4lMRLa5Au7ob
	qyHxwvlETDlvS5CSEDdwkvS6vN3yDvwkf3FYsvS0X8d6gJe7Emcln8qcSQymCs4yYUzPheVcQirY1
	1/D1cV5vcXxjbJXUOWW5rZ53ZffPcTiat1K+AEJ0MDYrHpDVc5CfnwGP1dScPlDvWoBA=;
Message-ID: <b85ecee7-65ce-47f0-8e9d-cdc056d337fb@xen.org>
Date: Fri, 2 Feb 2024 18:11:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/9] x86/smp: drop x86_cpu_to_apicid, use
 cpu_data[cpu].apicid instead
To: Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2023 17:50, Krystian Hebel wrote:
> Both fields held the same data.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> ---
>   xen/arch/x86/boot/x86_64.S           |  8 +++++---
>   xen/arch/x86/include/asm/asm_defns.h |  2 +-
>   xen/arch/x86/include/asm/processor.h |  2 ++
>   xen/arch/x86/include/asm/smp.h       |  4 ----
>   xen/arch/x86/numa.c                  | 15 +++++++--------
>   xen/arch/x86/smpboot.c               |  8 ++++----
>   xen/arch/x86/x86_64/asm-offsets.c    |  4 +++-
>   7 files changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index b85b47b5c1a0..195550b5c0ea 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -20,15 +20,17 @@ ENTRY(__high_start)
>           jz      .L_stack_set
>   
>           /* APs only: get stack base from APIC ID saved in %esp. */
> -        mov     $-1, %rax
> -        lea     x86_cpu_to_apicid(%rip), %rcx
> +        mov     $0, %rax
> +        lea     cpu_data(%rip), %rcx
> +        /* cpu_data[0] is BSP, skip it. */
>   1:
>           add     $1, %rax
> +        add     $CPUINFO_X86_sizeof, %rcx
>           cmp     $NR_CPUS, %eax
>           jb      2f
>           hlt
>   2:
> -        cmp     %esp, (%rcx, %rax, 4)
> +        cmp     %esp, CPUINFO_X86_apicid(%rcx)
>           jne     1b
>   
>           /* %eax is now Xen CPU index. */

As mentioned in an earlier patch, I think you want to re-order the 
patches. This will avoid to modify twice the same code within the same 
series (it is best to avoid if you can).

> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
> index baaaccb26e17..6b05d9d140b8 100644
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -158,7 +158,7 @@ register unsigned long current_stack_pointer asm("rsp");
>   #endif
>   
>   #define CPUINFO_FEATURE_OFFSET(feature)           \
> -    (CPUINFO_features + (cpufeat_word(feature) * 4))
> +    (CPUINFO_X86_features + (cpufeat_word(feature) * 4))
>   
>   #else
>   
> diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
> index b0d2a62c075f..8345d58094da 100644
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -92,6 +92,8 @@ struct x86_cpu_id {
>   extern struct cpuinfo_x86 cpu_data[];
>   #define current_cpu_data cpu_data[smp_processor_id()]
>   
> +#define cpu_physical_id(cpu)	cpu_data[cpu].apicid
> +
>   extern bool probe_cpuid_faulting(void);
>   extern void ctxt_switch_levelling(const struct vcpu *next);
>   extern void (*ctxt_switch_masking)(const struct vcpu *next);
> diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
> index c0b5d7cdd8dd..94c557491860 100644
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -39,10 +39,6 @@ extern void (*mtrr_hook) (void);
>   
>   extern void zap_low_mappings(void);
>   
> -extern u32 x86_cpu_to_apicid[];
> -
> -#define cpu_physical_id(cpu)	x86_cpu_to_apicid[cpu]
> -
>   #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
>   extern void cpu_exit_clear(unsigned int cpu);
>   extern void cpu_uninit(unsigned int cpu);
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 39e131cb4f35..91527be5b406 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -54,14 +54,13 @@ bool __init arch_numa_unavailable(void)
>   /*
>    * Setup early cpu_to_node.
>    *
> - * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
> - * and apicid_to_node[] tables have valid entries for a CPU.
> - * This means we skip cpu_to_node[] initialisation for NUMA
> - * emulation and faking node case (when running a kernel compiled
> - * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
> - * is already initialized in a round robin manner at numa_init_array,
> - * prior to this call, and this initialization is good enough
> - * for the fake NUMA cases.
> + * Populate cpu_to_node[] only if cpu_data[], and apicid_to_node[]
> + * tables have valid entries for a CPU. This means we skip
> + * cpu_to_node[] initialisation for NUMA emulation and faking node
> + * case (when running a kernel compiled for NUMA on a non NUMA box),
> + * which is OK as cpu_to_node[] is already initialized in a round
> + * robin manner at numa_init_array, prior to this call, and this
> + * initialization is good enough for the fake NUMA cases.
>    */
>   void __init init_cpu_to_node(void)
>   {
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index de87c5a41926..f061486e56eb 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -61,10 +61,8 @@ unsigned int __read_mostly nr_sockets;
>   cpumask_t **__read_mostly socket_cpumask;
>   static cpumask_t *secondary_socket_cpumask;
>   
> -struct cpuinfo_x86 cpu_data[NR_CPUS];
> -
> -u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
> -	{ [0 ... NR_CPUS-1] = BAD_APICID };
> +struct cpuinfo_x86 cpu_data[NR_CPUS] =
> +        { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
>   
>   static int cpu_error;
>   static enum cpu_state {
> @@ -81,7 +79,9 @@ void *stack_base[NR_CPUS];
>   
>   void initialize_cpu_data(unsigned int cpu)
>   {
> +    uint32_t apicid = cpu_physical_id(cpu);

It would be probably worth it to add a comment explaining why you save 
apicid. What about?

/* The APIC ID is saved in cpu_data[cpu] which will be overriden below. */

Coding style: Newline after the declaration.

>       cpu_data[cpu] = boot_cpu_data;
> +    cpu_physical_id(cpu) = apicid;
>   }
>   
>   static bool smp_store_cpu_info(unsigned int id)
> diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
> index 57b73a4e6214..e881cd5de0a0 100644
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -159,7 +159,9 @@ void __dummy__(void)
>       OFFSET(IRQSTAT_softirq_pending, irq_cpustat_t, __softirq_pending);
>       BLANK();
>   
> -    OFFSET(CPUINFO_features, struct cpuinfo_x86, x86_capability);
> +    OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);

The rename seems to be unrelated to this patch. Can you clarify?

> +    OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
> +    DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
>       BLANK();
>   
>       OFFSET(MB_flags, multiboot_info_t, flags);

Cheers,

-- 
Julien Grall

