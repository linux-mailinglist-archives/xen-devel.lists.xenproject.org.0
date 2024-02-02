Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1BC847753
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 19:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675169.1050402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVyDV-00009A-91; Fri, 02 Feb 2024 18:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675169.1050402; Fri, 02 Feb 2024 18:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVyDV-000079-6L; Fri, 02 Feb 2024 18:24:45 +0000
Received: by outflank-mailman (input) for mailman id 675169;
 Fri, 02 Feb 2024 18:24:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVyDT-000073-Fp
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 18:24:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVyDR-0006Zc-Ot; Fri, 02 Feb 2024 18:24:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVyDR-00051G-Ff; Fri, 02 Feb 2024 18:24:41 +0000
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
	bh=yt8GOwOCT3ePosG6LIt5BLmiN7sipz1LPFk9gjL90tY=; b=Az8WqVad/yL2/z8I9FNvPzjy50
	rtcGmPq8oqze56gIs92/7g14zEosRd5oIjAptSXd++Et41jdvZ+68oDE4wox3SVa5F93QTHuAOFzl
	tXZueDKKmaRK5NIZnrXkIMrFSAiZynMaLFZDD+cHIxYo7CpU7G8buqVMOs/xE5oKDAzs=;
Message-ID: <d0fc568a-f54e-4480-a903-6407f4e3a5b6@xen.org>
Date: Fri, 2 Feb 2024 18:24:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] x86/smp: move stack_base to cpu_data
Content-Language: en-GB
To: Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2023 17:50, Krystian Hebel wrote:
> This location is easier to access from assembly. Having it close to
> other data required during initialization has also positive (although
> rather small) impact on prefetching data from RAM.

I understand your goal but...

> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> ---
>   xen/arch/x86/boot/x86_64.S            |  5 ++---
>   xen/arch/x86/include/asm/cpufeature.h |  1 +
>   xen/arch/x86/include/asm/smp.h        |  2 +-
>   xen/arch/x86/setup.c                  |  6 +++---
>   xen/arch/x86/smpboot.c                | 25 +++++++++++++------------
>   xen/arch/x86/traps.c                  |  4 ++--
>   xen/arch/x86/x86_64/asm-offsets.c     |  1 +
>   xen/include/xen/smp.h                 |  2 --
>   8 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index 195550b5c0ea..8d61f270761f 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -33,9 +33,8 @@ ENTRY(__high_start)
>           cmp     %esp, CPUINFO_X86_apicid(%rcx)
>           jne     1b
>   
> -        /* %eax is now Xen CPU index. */
> -        lea     stack_base(%rip), %rcx
> -        mov     (%rcx, %rax, 8), %rsp
> +        /* %rcx is now cpu_data[cpu], read stack base from it. */
> +        mov     CPUINFO_X86_stack_base(%rcx), %rsp
>   
>           test    %rsp,%rsp
>           jnz     1f
> diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
> index 06e1dd7f3332..ff0e18864cc7 100644
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h

... cpufeature.h feels a rather odd place for storing the stack. I am 
not entirely sure where else to place. Andrew, Jan, Roger?

> @@ -37,6 +37,7 @@ struct cpuinfo_x86 {
>       unsigned int phys_proc_id;         /* package ID of each logical CPU */
>       unsigned int cpu_core_id;          /* core ID of each logical CPU */
>       unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
> +    void *stack_base;

AFAICT, this means there will be a padding before stack_base and ...

>       unsigned short x86_clflush_size;

... another one here. Is there any particular reason the new field 
wasn't added at the end?

>   } __cacheline_aligned;
>   
> diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.h
> index 94c557491860..98739028a6ed 100644
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -69,7 +69,7 @@ extern cpumask_t **socket_cpumask;
>    * by certain scheduling code only.
>    */
>   #define get_cpu_current(cpu) \
> -    (get_cpu_info_from_stack((unsigned long)stack_base[cpu])->current_vcpu)
> +    (get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base)->current_vcpu)
>   
>   extern unsigned int disabled_cpus;
>   extern bool unaccounted_cpus;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index a19fe219bbf6..b2c0679725ea 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -798,7 +798,7 @@ static void __init noreturn reinit_bsp_stack(void)
>       /* Update SYSCALL trampolines */
>       percpu_traps_init();
>   
> -    stack_base[0] = stack;
> +    cpu_data[0].stack_base = stack;
>   
>       rc = setup_cpu_root_pgt(0);
>       if ( rc )
> @@ -1959,8 +1959,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>               /* Set up node_to_cpumask based on cpu_to_node[]. */
>               numa_add_cpu(i);
>   
> -            if ( stack_base[i] == NULL )
> -                stack_base[i] = cpu_alloc_stack(i);
> +            if ( cpu_data[i].stack_base == NULL )
> +                cpu_data[i].stack_base = cpu_alloc_stack(i);
>           }
>   
>           for_each_present_cpu ( i )
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index f061486e56eb..8ae65ab1769f 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -75,13 +75,15 @@ static enum cpu_state {
>   } cpu_state;
>   #define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
>   
> -void *stack_base[NR_CPUS];
> -
>   void initialize_cpu_data(unsigned int cpu)
>   {
>       uint32_t apicid = cpu_physical_id(cpu);
> +    void *stack = cpu_data[cpu].stack_base;
> +
>       cpu_data[cpu] = boot_cpu_data;
> +
>       cpu_physical_id(cpu) = apicid;
> +    cpu_data[cpu].stack_base = stack;
>   }
>   
>   static bool smp_store_cpu_info(unsigned int id)
> @@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
>           printk("Booting processor %d/%d eip %lx\n",
>                  cpu, apicid, start_eip);
>   
> -    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
> -

You remove this line because I can't quite figure out where stack_start 
is now set. This is used...

>       /* This grunge runs the startup process for the targeted processor. */
>   
>       set_cpu_state(CPU_STATE_INIT);
> @@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
>   
>       /* Install direct map page table entries for stack, IDT, and TSS. */
>       for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
> -        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
> +        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
>   
>       if ( !rc )
>           rc = clone_mapping(idt_tables[cpu], rpt);
> @@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>           FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>           FREE_XENHEAP_PAGE(idt_tables[cpu]);
>   
> -        if ( stack_base[cpu] )
> +        if ( cpu_data[cpu].stack_base )
>           {
> -            memguard_unguard_stack(stack_base[cpu]);
> -            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
> +            memguard_unguard_stack(cpu_data[cpu].stack_base);
> +            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
>           }
>       }
>   }
> @@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>       if ( node != NUMA_NO_NODE )
>           memflags = MEMF_node(node);
>   
> -    if ( stack_base[cpu] == NULL &&
> -         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
> +    if ( cpu_data[cpu].stack_base == NULL &&
> +         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
>               goto out;
>   
> -    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
> +    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);

... here.

>       info->processor_id = cpu;
>       info->per_cpu_offset = __per_cpu_offset[cpu];
>   
> @@ -1156,7 +1156,8 @@ void __init smp_prepare_cpus(void)
>       boot_cpu_physical_apicid = get_apic_id();
>       cpu_physical_id(0) = boot_cpu_physical_apicid;
>   
> -    stack_base[0] = (void *)((unsigned long)stack_start & ~(STACK_SIZE - 1));
> +    cpu_data[0].stack_base = (void *)
> +             ((unsigned long)stack_start & ~(STACK_SIZE - 1));
>   
>       set_nr_sockets();
>   
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index e1356f696aba..90d9201d1c52 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -611,9 +611,9 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
>       unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
>       unsigned long esp_top, esp_bottom;
>   
> -    if ( _p(curr_stack_base) != stack_base[cpu] )
> +    if ( _p(curr_stack_base) != cpu_data[cpu].stack_base )
>           printk("Current stack base %p differs from expected %p\n",
> -               _p(curr_stack_base), stack_base[cpu]);
> +               _p(curr_stack_base), cpu_data[cpu].stack_base);
>   
>       esp_bottom = (esp | (STACK_SIZE - 1)) + 1;
>       esp_top    = esp_bottom - PRIMARY_STACK_SIZE;
> diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
> index e881cd5de0a0..d81a30344677 100644
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -161,6 +161,7 @@ void __dummy__(void)
>   
>       OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
>       OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
> +    OFFSET(CPUINFO_X86_stack_base, struct cpuinfo_x86, stack_base);
>       DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
>       BLANK();
>   
> diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
> index 0a9219173f0f..994fdc474200 100644
> --- a/xen/include/xen/smp.h
> +++ b/xen/include/xen/smp.h
> @@ -67,8 +67,6 @@ void smp_send_call_function_mask(const cpumask_t *mask);
>   
>   int alloc_cpu_id(void);
>   
> -extern void *stack_base[NR_CPUS];
> -
>   void initialize_cpu_data(unsigned int cpu);
>   int setup_cpu_root_pgt(unsigned int cpu);
>   

Cheers,

-- 
Julien Grall

