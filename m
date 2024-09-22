Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E497E093
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 10:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801490.1211458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssHst-0005g0-GP; Sun, 22 Sep 2024 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801490.1211458; Sun, 22 Sep 2024 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssHst-0005e1-DK; Sun, 22 Sep 2024 08:23:59 +0000
Received: by outflank-mailman (input) for mailman id 801490;
 Sun, 22 Sep 2024 08:23:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ssHsr-0005dv-L6
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 08:23:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssHsq-0007LE-W4; Sun, 22 Sep 2024 08:23:56 +0000
Received: from 90-181-218-29.rco.o2.cz ([90.181.218.29] helo=[10.5.48.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssHsq-00037w-J6; Sun, 22 Sep 2024 08:23:56 +0000
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
	bh=Cchc2852JVtXAoUG7JuDfw3mpWwG7HoS+hG/pWVnlfk=; b=VBzUZC9kCKztF0Yzhct/UUeP+U
	cdfJctQsLwfI+4PcWJU5sfBHmMSxXiWBHx61cl73qAgs8YM8SskMzDpQf2bErxk3sOk2OlWoWFu49
	kncoUTKc2XGO0PK6v7amUgQpsPQz+tyOgOfZ3lp2LkIFLb6aF6sweKatl4W1GMm48chA=;
Message-ID: <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
Date: Sun, 22 Sep 2024 10:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen: move per-cpu area management into common code
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/09/2024 17:59, Oleksii Kurochko wrote:
> Centralize per-cpu area management to reduce code duplication and
> enhance maintainability across architectures.
> 
> The per-cpu area management code, which is largely common among
> architectures, is moved to a shared implementation in
> xen/common/percpu.c. This change includes:
>   * Add arch_percpu_area_init_status() and arch_cpu_percpu_callback()
>     functions to address architecture-specific variations.
>   * Remove percpu.c from the Arm architecture.
>   * For x86, percpu.c now only defines arch_percpu_area_init_status()
>     and arch_cpu_percpu_callback(), and INVALID_PERCPU_AREA.
>   * Drop the declaration of __per_cpu_offset[] from stubs.c in
>     PPC and RISC-V to facilitate the build of the common per-cpu code.
> 
> No functional changes.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/arm/Makefile             |   1 -
>   xen/arch/arm/percpu.c             |  85 --------------------
>   xen/arch/ppc/stubs.c              |   1 -
>   xen/arch/riscv/stubs.c            |   1 -
>   xen/arch/x86/include/asm/Makefile |   1 -
>   xen/arch/x86/include/asm/percpu.h |  18 +++++
>   xen/arch/x86/percpu.c             |  92 ++--------------------
>   xen/common/Makefile               |   1 +
>   xen/common/percpu.c               | 127 ++++++++++++++++++++++++++++++
>   xen/include/asm-generic/percpu.h  |   8 ++
>   10 files changed, 159 insertions(+), 176 deletions(-)
>   delete mode 100644 xen/arch/arm/percpu.c
>   create mode 100644 xen/arch/x86/include/asm/percpu.h
>   create mode 100644 xen/common/percpu.c
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..e4ad1ce851 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -39,7 +39,6 @@ obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>   obj-y += mm.o
>   obj-y += monitor.o
>   obj-y += p2m.o
> -obj-y += percpu.o
>   obj-y += platform.o
>   obj-y += platform_hypercall.o
>   obj-y += physdev.o
> diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
> deleted file mode 100644
> index 87fe960330..0000000000
> --- a/xen/arch/arm/percpu.c
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <xen/percpu.h>
> -#include <xen/cpu.h>
> -#include <xen/init.h>
> -#include <xen/mm.h>
> -#include <xen/rcupdate.h>
> -
> -unsigned long __per_cpu_offset[NR_CPUS];
> -#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
> -#define PERCPU_ORDER (get_order_from_bytes(__per_cpu_data_end-__per_cpu_start))
> -
> -void __init percpu_init_areas(void)
> -{
> -    unsigned int cpu;
> -    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
> -        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> -}
> -
> -static int init_percpu_area(unsigned int cpu)
> -{
> -    char *p;
> -    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
> -        return -EBUSY;
> -    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
> -        return -ENOMEM;
> -    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
> -    __per_cpu_offset[cpu] = p - __per_cpu_start;
> -    return 0;
> -}
> -
> -struct free_info {
> -    unsigned int cpu;
> -    struct rcu_head rcu;
> -};
> -static DEFINE_PER_CPU(struct free_info, free_info);
> -
> -static void _free_percpu_area(struct rcu_head *head)
> -{
> -    struct free_info *info = container_of(head, struct free_info, rcu);
> -    unsigned int cpu = info->cpu;
> -    char *p = __per_cpu_start + __per_cpu_offset[cpu];
> -    free_xenheap_pages(p, PERCPU_ORDER);
> -    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> -}
> -
> -static void free_percpu_area(unsigned int cpu)
> -{
> -    struct free_info *info = &per_cpu(free_info, cpu);
> -    info->cpu = cpu;
> -    call_rcu(&info->rcu, _free_percpu_area);
> -}
> -
> -static int cpu_percpu_callback(
> -    struct notifier_block *nfb, unsigned long action, void *hcpu)
> -{
> -    unsigned int cpu = (unsigned long)hcpu;
> -    int rc = 0;
> -
> -    switch ( action )
> -    {
> -    case CPU_UP_PREPARE:
> -        rc = init_percpu_area(cpu);
> -        break;
> -    case CPU_UP_CANCELED:
> -    case CPU_DEAD:
> -        free_percpu_area(cpu);
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return notifier_from_errno(rc);
> -}
> -
> -static struct notifier_block cpu_percpu_nfb = {
> -    .notifier_call = cpu_percpu_callback,
> -    .priority = 100 /* highest priority */
> -};
> -
> -static int __init percpu_presmp_init(void)
> -{
> -    register_cpu_notifier(&cpu_percpu_nfb);
> -    return 0;
> -}
> -presmp_initcall(percpu_presmp_init);
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index bdb5f8c66d..fff82f5cf3 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -141,7 +141,6 @@ void smp_send_state_dump(unsigned int cpu)
>   /* domain.c */
>   
>   DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> -unsigned long __per_cpu_offset[NR_CPUS];
>   
>   void context_switch(struct vcpu *prev, struct vcpu *next)
>   {
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 2aa245f272..5951b0ce91 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -133,7 +133,6 @@ void smp_send_state_dump(unsigned int cpu)
>   /* domain.c */
>   
>   DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> -unsigned long __per_cpu_offset[NR_CPUS];
>   
>   void context_switch(struct vcpu *prev, struct vcpu *next)
>   {
> diff --git a/xen/arch/x86/include/asm/Makefile b/xen/arch/x86/include/asm/Makefile
> index daab34ff0a..2c27787d31 100644
> --- a/xen/arch/x86/include/asm/Makefile
> +++ b/xen/arch/x86/include/asm/Makefile
> @@ -1,3 +1,2 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   generic-y += div64.h
> -generic-y += percpu.h
> diff --git a/xen/arch/x86/include/asm/percpu.h b/xen/arch/x86/include/asm/percpu.h
> new file mode 100644
> index 0000000000..0f9efba27a
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/percpu.h
> @@ -0,0 +1,18 @@
> +#ifndef __X86_PERCPU_H__
> +#define __X86_PERCPU_H__
> +
> +#include <asm-generic/percpu.h>
> +
> +/*
> + * Force uses of per_cpu() with an invalid area to attempt to access the
> + * middle of the non-canonical address space resulting in a #GP, rather than a
> + * possible #PF at (NULL + a little) which has security implications in the
> + * context of PV guests.
> + */
> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
> +
> +#define ARCH_PERCPU_AREA_CHECK
> +
> +#define ARCH_CPU_PERCPU_CALLBACK
> +
> +#endif /* __X86_PERCPU_H__ */
> diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
> index 3205eacea6..33bded8cac 100644
> --- a/xen/arch/x86/percpu.c
> +++ b/xen/arch/x86/percpu.c
> @@ -1,79 +1,19 @@
> -#include <xen/percpu.h>
>   #include <xen/cpu.h>
> -#include <xen/init.h>
> -#include <xen/mm.h>
> -#include <xen/rcupdate.h>
> -
> -unsigned long __per_cpu_offset[NR_CPUS];
> -
> -/*
> - * Force uses of per_cpu() with an invalid area to attempt to access the
> - * middle of the non-canonical address space resulting in a #GP, rather than a
> - * possible #PF at (NULL + a little) which has security implications in the
> - * context of PV guests.
> - */
> -#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned long)__per_cpu_start)
> -#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
> -
> -void __init percpu_init_areas(void)
> -{
> -    unsigned int cpu;
> -
> -    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
> -        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> -}
> +#include <xen/percpu.h>
> +#include <xen/smp.h>
>   
> -static int init_percpu_area(unsigned int cpu)
> +int arch_percpu_area_init_status(void)

I understand that Arm and x86 are returning a different value today. But 
now that we are provising a common implementation, I think we need to 
explain the difference. This is probably a question for the x86 folks.

>   {
> -    char *p;
> -
> -    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
> -        return 0;
> -
> -    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
> -        return -ENOMEM;
> -
> -    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
> -    __per_cpu_offset[cpu] = p - __per_cpu_start;
> -
>       return 0;
>   }
>   
> -struct free_info {
> -    unsigned int cpu;
> -    struct rcu_head rcu;
> -};
> -static DEFINE_PER_CPU(struct free_info, free_info);
> -
> -static void cf_check _free_percpu_area(struct rcu_head *head)
> -{
> -    struct free_info *info = container_of(head, struct free_info, rcu);
> -    unsigned int cpu = info->cpu;
> -    char *p = __per_cpu_start + __per_cpu_offset[cpu];
> -
> -    free_xenheap_pages(p, PERCPU_ORDER);
> -    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> -}
> -
> -static void free_percpu_area(unsigned int cpu)
> -{
> -    struct free_info *info = &per_cpu(free_info, cpu);
> -
> -    info->cpu = cpu;
> -    call_rcu(&info->rcu, _free_percpu_area);
> -}
> -
> -static int cf_check cpu_percpu_callback(
> -    struct notifier_block *nfb, unsigned long action, void *hcpu)
> +int arch_cpu_percpu_callback(struct notifier_block *nfb,
> +                             unsigned long action, void *hcpu)
>   {
>       unsigned int cpu = (unsigned long)hcpu;
> -    int rc = 0;
>   
>       switch ( action )
>       {
> -    case CPU_UP_PREPARE:
> -        rc = init_percpu_area(cpu);
> -        break;
>       case CPU_UP_CANCELED:
>       case CPU_DEAD:
>       case CPU_RESUME_FAILED:
> @@ -86,27 +26,5 @@ static int cf_check cpu_percpu_callback(
>           break;
>       }
>   
> -    return notifier_from_errno(rc);
> -}
> -
> -static struct notifier_block cpu_percpu_nfb = {
> -    .notifier_call = cpu_percpu_callback,
> -    .priority = 100 /* highest priority */
> -};
> -
> -static int __init cf_check percpu_presmp_init(void)
> -{
> -    register_cpu_notifier(&cpu_percpu_nfb);
> -
>       return 0;
>   }
> -presmp_initcall(percpu_presmp_init);
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */

This needs to stay.

> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index fc52e0857d..f90bb00d23 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -31,6 +31,7 @@ obj-y += notifier.o
>   obj-$(CONFIG_NUMA) += numa.o
>   obj-y += page_alloc.o
>   obj-y += pdx.o
> +obj-y += percpu.o
>   obj-$(CONFIG_PERF_COUNTERS) += perfc.o
>   obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>   obj-y += preempt.o
> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> new file mode 100644
> index 0000000000..3837ef5714
> --- /dev/null
> +++ b/xen/common/percpu.c
> @@ -0,0 +1,127 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/percpu.h>
> +#include <xen/cpu.h>
> +#include <xen/init.h>
> +#include <xen/mm.h>
> +#include <xen/rcupdate.h>
> +
> +unsigned long __per_cpu_offset[NR_CPUS];
> +
> +#ifndef INVALID_PERCPU_AREA
> +#define INVALID_PERCPU_AREA (-(long)__per_cpu_start)
> +#endif
> +
> +#ifndef ARCH_PERCPU_AREA_CHECK
> +inline int arch_percpu_area_init_status(void)

This wants to be static. No need for inline as the compiler is free to 
ignore it...

> +{
> +    return -EBUSY;

See my question above about the difference between x86 and the rest.

> +}
 > +#endif> +
> +#ifndef ARCH_CPU_PERCPU_CALLBACK
> +inline int arch_cpu_percpu_callback(struct notifier_block *nfb,
> +                                    unsigned long action, void *hcpu)

I am not entirely sure we should introduce arch_cpu_percpu_callback. It 
seems there are some redundant work. Looking at the x86 implementation 
the differences are:
   * The additional checks
   * Extra actions (e.g CPU_RESUME_FAILED/CPU_REMOVE).

I think the extra actions also make sense for other architectures. For 
the additional checks, the parking feature is implemented in common/*.

So is there any way we could avoid introduce arch_cpu_percpu_callback()?

> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +
> +    switch ( action )
> +    {
> +    case CPU_UP_CANCELED:
> +    case CPU_DEAD:
> +        free_percpu_area(cpu);
> +        break;
> +    }
> +
> +    return 0;
> +}
> +#endif
> +
> +#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
> +
> +void __init percpu_init_areas(void)
> +{
> +    unsigned int cpu;
> +
> +    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
> +        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> +}
> +
> +static int init_percpu_area(unsigned int cpu)
> +{
> +    char *p;
> +
> +    if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
> +        return arch_percpu_area_init_status();
> +
> +    if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
> +        return -ENOMEM;
> +
> +    memset(p, 0, __per_cpu_data_end - __per_cpu_start);
> +    __per_cpu_offset[cpu] = p - __per_cpu_start;
> +
> +    return 0;
> +}
> +
> +struct free_info {
> +    unsigned int cpu;
> +    struct rcu_head rcu;
> +};
> +static DEFINE_PER_CPU(struct free_info, free_info);
> +
> +static void cf_check _free_percpu_area(struct rcu_head *head)
> +{
> +    struct free_info *info = container_of(head, struct free_info, rcu);
> +    unsigned int cpu = info->cpu;
> +    char *p = __per_cpu_start + __per_cpu_offset[cpu];
> +
> +    free_xenheap_pages(p, PERCPU_ORDER);
> +    __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
> +}
> +
> +void free_percpu_area(unsigned int cpu)
> +{
> +    struct free_info *info = &per_cpu(free_info, cpu);
> +
> +    info->cpu = cpu;
> +    call_rcu(&info->rcu, _free_percpu_area);
> +}
> +
> +static int cf_check cpu_percpu_callback(
> +    struct notifier_block *nfb, unsigned long action, void *hcpu)
> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_UP_PREPARE:
> +        rc = init_percpu_area(cpu);
> +        break;
> +    default:
> +        arch_cpu_percpu_callback(nfb, action, hcpu);
> +    }
> +
> +    return notifier_from_errno(rc);
> +}
> +
> +static struct notifier_block cpu_percpu_nfb = {
> +    .notifier_call = cpu_percpu_callback,
> +    .priority = 100 /* highest priority */
> +};
> +
> +static int __init cf_check percpu_presmp_init(void)
> +{
> +    register_cpu_notifier(&cpu_percpu_nfb);
> +
> +    return 0;
> +}
> +presmp_initcall(percpu_presmp_init);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
> index 60af4f9ff9..c0373b1ad9 100644
> --- a/xen/include/asm-generic/percpu.h
> +++ b/xen/include/asm-generic/percpu.h
> @@ -12,6 +12,14 @@ extern const char __per_cpu_data_end[];
>   extern unsigned long __per_cpu_offset[NR_CPUS];
>   void percpu_init_areas(void);
>   
> +void free_percpu_area(unsigned int cpu);
> +
> +int arch_percpu_area_init_status(void);
> +
> +struct notifier_block;
> +int arch_cpu_percpu_callback(struct notifier_block *nfb,
> +                             unsigned long action, void *hcpu);
> +

I believe this belong to include/xen/percpu.h. asm-generic is more for 
common definition that can be overriden by arch specific header.

Cheers,

-- 
Julien Grall


