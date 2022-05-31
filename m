Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E402538CD5
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339235.564060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxBQ-00076e-HS; Tue, 31 May 2022 08:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339235.564060; Tue, 31 May 2022 08:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxBQ-000749-E3; Tue, 31 May 2022 08:24:56 +0000
Received: by outflank-mailman (input) for mailman id 339235;
 Tue, 31 May 2022 08:24:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nvxBP-000743-Bi
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:24:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvxBO-00079a-LH; Tue, 31 May 2022 08:24:54 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nvxBO-0004pR-Bp; Tue, 31 May 2022 08:24:54 +0000
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
	bh=Du5xHSul6RTd8t8x6Gk6tSf9s/tzR3JxR6fxZf5RDbM=; b=ngY16bBDFMdCl8L2LeBWdpK8Up
	4gln1o5OL43QSekO2/QtCOqPrMUqVA5eyCIVk/LqaKZF4F9fSMU6/JFAG5eexUiMfSdyct2h3Jnw9
	pJSsUR/bbinOchwVEGYmQHtcIQidurY2jYpyoFpnHaEjD0Cm91nkvXVrByXeDBMfv7NU=;
Message-ID: <767b6984-8b35-4aff-a0e4-4b16dadf228e@xen.org>
Date: Tue, 31 May 2022 09:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/6] xen/riscv: Add necessary headers and definitions
 to build xen.
To: Xie Xun <xiexun162534@gmail.com>, xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross <jgross@suse.com>
References: <cover.1653977696.git.xiexun162534@gmail.com>
 <e1a82be152f9e7e344032bd253aadca502a01ab6.1653977696.git.xiexun162534@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e1a82be152f9e7e344032bd253aadca502a01ab6.1653977696.git.xiexun162534@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xie,

Thank you for the contribution.

On 31/05/2022 07:57, Xie Xun wrote:
> Target xen and xen-syms can be built with:
> 
> $ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- tiny64_defconfig
> $ make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu-
> 
> It can be tested with Qemu.
> 
> $ qemu-system-riscv64 -machine virt -m 1G -kernel xen
> 
> Xen will jump into an infinite loop and there will be no output.

I will answer here what you wrote in the cover letter:

"There are some problems though. The first patch of this series is
very large, but it seems most of the code is necessary for building
xen. I am trying my best to remove some code but it still has more
than 8000 lines of code."

I think it would be beneficial to split this patch in smaller logical 
one even they don't build one by one. Briefly looking through the 
series, it looks like some code (such as the atomic) was imported from 
another project.

So you could move them in one (or multiple) separate patch.

Also, if you took code from other project, it would be good to specify 
where this coming from and what was the baseline. This will help to 
re-sync the code in the future.

> 
> Signed-off-by: Xie Xun <xiexun162534@gmail.com>
> ---
>   xen/arch/riscv/Kconfig                      |   2 +
>   xen/arch/riscv/Makefile                     |  51 ++
>   xen/arch/riscv/Rules.mk                     |  57 ++
>   xen/arch/riscv/delay.c                      |  14 +
>   xen/arch/riscv/domain.c                     | 191 ++++
>   xen/arch/riscv/domctl.c                     |  52 ++
>   xen/arch/riscv/guestcopy.c                  |  59 ++
>   xen/arch/riscv/include/asm/acpi.h           |   9 +
>   xen/arch/riscv/include/asm/altp2m.h         |  39 +
>   xen/arch/riscv/include/asm/asm.h            |  76 ++
>   xen/arch/riscv/include/asm/atomic.h         | 375 ++++++++
>   xen/arch/riscv/include/asm/bitops.h         | 397 ++++++++
>   xen/arch/riscv/include/asm/bug.h            |  67 ++
>   xen/arch/riscv/include/asm/byteorder.h      |  16 +
>   xen/arch/riscv/include/asm/cache.h          |  24 +
>   xen/arch/riscv/include/asm/cmpxchg.h        | 382 ++++++++
>   xen/arch/riscv/include/asm/config.h         | 149 ++-
>   xen/arch/riscv/include/asm/cpufeature.h     |  68 ++
>   xen/arch/riscv/include/asm/csr.h            |  81 ++
>   xen/arch/riscv/include/asm/current.h        |  41 +
>   xen/arch/riscv/include/asm/debugger.h       |  15 +
>   xen/arch/riscv/include/asm/delay.h          |  28 +
>   xen/arch/riscv/include/asm/desc.h           |  12 +
>   xen/arch/riscv/include/asm/device.h         |  93 ++
>   xen/arch/riscv/include/asm/div64.h          |  23 +
>   xen/arch/riscv/include/asm/domain.h         |  80 ++
>   xen/arch/riscv/include/asm/event.h          |  42 +
>   xen/arch/riscv/include/asm/fence.h          |  12 +
>   xen/arch/riscv/include/asm/flushtlb.h       |  56 ++
>   xen/arch/riscv/include/asm/grant_table.h    |  93 ++
>   xen/arch/riscv/include/asm/guest_access.h   | 125 +++
>   xen/arch/riscv/include/asm/guest_atomics.h  |  62 ++
>   xen/arch/riscv/include/asm/hardirq.h        |  27 +
>   xen/arch/riscv/include/asm/hypercall.h      |  12 +
>   xen/arch/riscv/include/asm/init.h           |  42 +
>   xen/arch/riscv/include/asm/io.h             | 283 ++++++
>   xen/arch/riscv/include/asm/iocap.h          |  16 +
>   xen/arch/riscv/include/asm/iommu.h          |  46 +
>   xen/arch/riscv/include/asm/iommu_fwspec.h   |  68 ++
>   xen/arch/riscv/include/asm/irq.h            |  62 ++
>   xen/arch/riscv/include/asm/mem_access.h     |  35 +
>   xen/arch/riscv/include/asm/mm.h             | 320 +++++++
>   xen/arch/riscv/include/asm/monitor.h        |  65 ++
>   xen/arch/riscv/include/asm/nospec.h         |  25 +
>   xen/arch/riscv/include/asm/numa.h           |  41 +
>   xen/arch/riscv/include/asm/p2m.h            | 307 +++++++
>   xen/arch/riscv/include/asm/page-bits.h      |  14 +
>   xen/arch/riscv/include/asm/page.h           | 319 +++++++
>   xen/arch/riscv/include/asm/paging.h         |  16 +
>   xen/arch/riscv/include/asm/pci.h            |  31 +
>   xen/arch/riscv/include/asm/percpu.h         |  35 +
>   xen/arch/riscv/include/asm/processor.h      | 176 ++++
>   xen/arch/riscv/include/asm/random.h         |   9 +
>   xen/arch/riscv/include/asm/regs.h           |  42 +
>   xen/arch/riscv/include/asm/riscv_encoding.h | 960 ++++++++++++++++++++
>   xen/arch/riscv/include/asm/setup.h          |  23 +
>   xen/arch/riscv/include/asm/smp.h            |  69 ++
>   xen/arch/riscv/include/asm/softirq.h        |  16 +
>   xen/arch/riscv/include/asm/spinlock.h       |  13 +
>   xen/arch/riscv/include/asm/string.h         |  28 +
>   xen/arch/riscv/include/asm/system.h         |  98 ++
>   xen/arch/riscv/include/asm/time.h           |  81 ++
>   xen/arch/riscv/include/asm/trace.h          |  12 +
>   xen/arch/riscv/include/asm/traps.h          |  30 +
>   xen/arch/riscv/include/asm/types.h          |  73 ++
>   xen/arch/riscv/include/asm/vm_event.h       |  63 ++
>   xen/arch/riscv/include/asm/xenoprof.h       |  12 +
>   xen/arch/riscv/irq.c                        | 126 +++
>   xen/arch/riscv/lib/Makefile                 |   1 +
>   xen/arch/riscv/lib/find_next_bit.c          | 285 ++++++

This is a copy from the Arm version, right? If so, please move the Arm 
one in common/lib/ so you can re-use it.

>   xen/arch/riscv/mm.c                         | 409 +++++++++
>   xen/arch/riscv/p2m.c                        |  97 ++
>   xen/arch/riscv/percpu.c                     |  84 ++
>   xen/arch/riscv/platforms/Kconfig            |  31 +
>   xen/arch/riscv/riscv64/Makefile             |   2 +-
>   xen/arch/riscv/riscv64/asm-offsets.c        |  39 +
>   xen/arch/riscv/riscv64/head.S               |  13 +-
>   xen/arch/riscv/setup.c                      |  65 ++
>   xen/arch/riscv/shutdown.c                   |  24 +
>   xen/arch/riscv/smp.c                        |  38 +
>   xen/arch/riscv/smpboot.c                    |  78 ++
>   xen/arch/riscv/sysctl.c                     |  31 +
>   xen/arch/riscv/time.c                       |  69 ++
>   xen/arch/riscv/traps.c                      |  87 ++
>   xen/arch/riscv/vm_event.c                   |  51 ++
>   xen/arch/riscv/xen.lds.S                    | 274 ++++++
>   xen/include/public/arch-riscv.h             | 182 ++++
>   xen/include/public/arch-riscv/hvm/save.h    |  39 +
>   xen/include/public/hvm/save.h               |   2 +
>   xen/include/public/io/protocols.h           |   3 +
>   xen/include/public/pmu.h                    |   2 +
>   xen/include/public/xen.h                    |   2 +

The public headers could be moved separately.

[...]

> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> index 468e250c86..e8c9ae6219 100644
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -1,5 +1,7 @@
>   config RISCV
>   	def_bool y
> +        select HAS_PDX
> +        select HAS_DEVICE_TREE

The indentation looks incorrect to me. Kconfig is using hard tab rather 
than soft tab.

[...]

> diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
> index e69de29bb2..85e0cc5e64 100644
> --- a/xen/arch/riscv/Rules.mk
> +++ b/xen/arch/riscv/Rules.mk
> @@ -0,0 +1,57 @@
> +########################################
> +# riscv-specific definitions
> +
> +#
> +# If you change any of these configuration options then you must
> +# 'make clean' before rebuilding.
> +#
> +
> +CFLAGS += -I$(BASEDIR)/include
> +
> +$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +$(call cc-option-add,CFLAGS,CC,-Wnested-externs)
> +$(call cc-option-add,CFLAGS,CC,-mstrict-align)
> +$(call cc-option-add,CFLAGS,CC,-mtune=size)
> +
> +EARLY_PRINTK := n
> +
> +ifeq ($(CONFIG_DEBUG),y)
> +
> +# See docs/misc/arm/early-printk.txt for syntax
> +
> +EARLY_PRINTK := 8250,0x1c021000,2

Is the UART standardized in RISCv?

> +
> +ifneq ($(EARLY_PRINTK_$(CONFIG_EARLY_PRINTK)),)

On Arm, we converted the early printk to Kconfig. I would recommend to 
do the same because otherwise the user would have to specify the option 
on most of "make" options.

This lead to quite a few errors on the Arm side.

> diff --git a/xen/arch/riscv/delay.c b/xen/arch/riscv/delay.c
> new file mode 100644
> index 0000000000..4a712e97e8
> --- /dev/null
> +++ b/xen/arch/riscv/delay.c
> @@ -0,0 +1,14 @@
> +void __delay(unsigned long cycles)

This doesn't seem to be used in the common code. How did you decide what 
was needed?

I am asking that because I think it would be good to avoid adding 
helpers that will never get used.

> +{

I am assuming this is going to be implemented at some point. At minimum, 
I would recommend to add a TODO.

But I would also consider to add ASSERT_UNREACHABLE() so anyone can 
notice when you use a function that has to be implemented.

This is less a problem for function like delay. However...


> +}
> +EXPORT_SYMBOL(__delay);
> +
> +void udelay(unsigned long usecs)
> +{
> +}
> +EXPORT_SYMBOL(udelay);
> +
> +void ndelay(unsigned long nsecs)
> +{
> +}
> +EXPORT_SYMBOL(ndelay);
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> new file mode 100644
> index 0000000000..c99023731f
> --- /dev/null
> +++ b/xen/arch/riscv/domain.c
> @@ -0,0 +1,191 @@
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/domain.h>
> +#include <xen/softirq.h>
> +#include <asm/traps.h>
> +#include <public/domctl.h>
> +#include <public/xen.h>
> +
> +DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> +
> +struct vcpu *alloc_dom0_vcpu0(struct domain *dom0)
> +{
> +    return vcpu_create(dom0, 0);
> +}
> +
> +void context_switch(struct vcpu *prev, struct vcpu *next)
> +{
> +    /* TODO */

... you may have hard time to debug some of those functions here.

> +}
> +
> +void idle_loop(void)
> +{
> +    /* TODO */
> +}
> +
> +void noreturn startup_cpu_idle_loop(void)
> +{
> +    struct vcpu *v = current;
> +
> +    ASSERT(is_idle_vcpu(v));
> +
> +    reset_stack_and_jump(idle_loop);
> +
> +    /* This function is noreturn */
> +    BUG();
> +}
> +
> +void continue_running(struct vcpu *same)
> +{
> +    /* TODO */
> +}
> +
> +void sync_local_execstate(void)
> +{
> +    /* TODO */
> +}
> +
> +void sync_vcpu_execstate(struct vcpu *v)
> +{
> +    /* TODO */
> +}
> +
> +unsigned long hypercall_create_continuation(
> +    unsigned int op, const char *format, ...)
> +{
> +	/* TODO */
> +
> +	return 0;
> +}
> +
> +struct domain *alloc_domain_struct(void)
> +{
> +    return NULL;
> +}
> +
> +void free_domain_struct(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +void dump_pageframe_info(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +{
> +    return 0;
> +}
> +
> +
> +int arch_domain_create(struct domain *d,
> +                       struct xen_domctl_createdomain *config,
> +                        unsigned int flags)
> +{
> +    return -ENOSYS;
> +}
> +
> +void arch_domain_destroy(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +void arch_domain_shutdown(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +void arch_domain_pause(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +void arch_domain_unpause(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +int arch_domain_soft_reset(struct domain *d)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +void arch_domain_creation_finished(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +int domain_relinquish_resources(struct domain *d)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +void arch_dump_domain_info(struct domain *d)
> +{
> +    /* TODO */
> +}
> +
> +long arch_do_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +void arch_dump_vcpu_info(struct vcpu *v)
> +{
> +    /* TODO */
> +}
> +
> +int arch_set_info_guest(
> +    struct vcpu *v, vcpu_guest_context_u c)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +/* taken from arm/domain.c */
> +struct vcpu *alloc_vcpu_struct(const struct domain *d)
> +{
> +    return NULL;
> +}
> +
> +void free_vcpu_struct(struct vcpu *v)
> +{
> +    /* TODO */
> +}
> +
> +int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +int arch_vcpu_reset(struct vcpu *v)
> +{
> +    /* TODO */
> +    return -ENOSYS;
> +}
> +
> +int arch_vcpu_create(struct vcpu *v)
> +{
> +    return -ENOSYS;
> +}
> +
> +void arch_vcpu_destroy(struct vcpu *v)
> +{
> +    /* TODO */
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/domctl.c b/xen/arch/riscv/domctl.c
> new file mode 100644
> index 0000000000..5024118662
> --- /dev/null
> +++ b/xen/arch/riscv/domctl.c
> @@ -0,0 +1,52 @@
> +/******************************************************************************
> + * Arch-specific domctl.c
> + *
> + * Copyright (c) 2012, Citrix Systems
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <xen/iocap.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xsm/xsm.h>
> +#include <public/domctl.h>
> +
> +void arch_get_domain_info(const struct domain *d,
> +                          struct xen_domctl_getdomaininfo *info)
> +{
> +    info->flags |= XEN_DOMINF_hap;
> +}
> +
> +long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    /* TODO */
> +
> +    switch ( domctl->cmd ) {
> +    case XEN_DOMCTL_cacheflush:
> +    case XEN_DOMCTL_bind_pt_irq:
> +    case XEN_DOMCTL_unbind_pt_irq:
> +    case XEN_DOMCTL_vuart_op:
> +    default:
> +        return 0;
> +    }
You are not implementing any of those domctl yet. So I think it would be 
better to print an error message (gprintk(XENLOG_ERR...) and return -ENOSYS.

> +
> +#define write_atomic(p, x) ({                                           \
> +    typeof(*p) __x = (x);                                               \
> +    switch ( sizeof(*p) ) {                                             \
> +    case 1: writeb((uint8_t)__x,  (uint8_t *)  p); break;              \
> +    case 2: writew((uint16_t)__x, (uint16_t *) p); break;              \
> +    case 4: writel((uint32_t)__x, (uint32_t *) p); break;              \
> +    case 8: writeq((uint64_t)__x, (uint64_t *) p); break;              \
> +    default: __bad_atomic_size(); break;                                \
> +    }                                                                   \
> +    __x;                                                                \
> +})
> +
> +/* TODO: Fix this */

What's the problem?

> +#define add_sized(p, x) ({                                              \
> +    typeof(*(p)) __x = (x);                                             \
> +    switch ( sizeof(*(p)) )                                             \
> +    {                                                                   \
> +    case 1: writeb(read_atomic(p) + __x, (uint8_t *)(p)); break;        \
> +    case 2: writew(read_atomic(p) + __x, (uint16_t *)(p)); break;       \
> +    case 4: writel(read_atomic(p) + __x, (uint32_t *)(p)); break;       \
> +    default: __bad_atomic_size(); break;                                \
> +    }                                                                   \
> +})

Cheers,

-- 
Julien Grall

