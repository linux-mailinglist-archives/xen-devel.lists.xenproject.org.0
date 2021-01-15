Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449D2F86A4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 21:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68615.122838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Vg0-00027S-47; Fri, 15 Jan 2021 20:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68615.122838; Fri, 15 Jan 2021 20:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Vfz-000270-W6; Fri, 15 Jan 2021 20:26:31 +0000
Received: by outflank-mailman (input) for mailman id 68615;
 Fri, 15 Jan 2021 20:26:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Vfz-00026u-1N
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 20:26:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Vfx-0003t5-OX; Fri, 15 Jan 2021 20:26:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Vfx-00033B-72; Fri, 15 Jan 2021 20:26:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=v1fxyCEg0TtMn7EY2jEBLz3+PLBYMoO2+NT77yp9ucA=; b=C0RJumKxi4saMlmnTwhg6SgeWE
	T6oNC8a5w8IBJos8QmKZuXGnuZ5WblA6g0ntKe6VZBgX5c73EgGoTZ5NDqTRieecD9E5XBcJSWZyE
	Qz+/kp63QP2dBqEjcmybeiABiI7IIAsWMEuymFsGbMT6uESd8DbNsXCWRipNk65ncY4E=;
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
Date: Fri, 15 Jan 2021 20:26:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 18cafcd..8f55aba 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -15,6 +15,7 @@
>   #include <xen/guest_access.h>
>   #include <xen/hypercall.h>
>   #include <xen/init.h>
> +#include <xen/ioreq.h>
>   #include <xen/lib.h>
>   #include <xen/livepatch.h>
>   #include <xen/sched.h>
> @@ -696,6 +697,10 @@ int arch_domain_create(struct domain *d,
>   
>       ASSERT(config != NULL);
>   
> +#ifdef CONFIG_IOREQ_SERVER
> +    ioreq_domain_init(d);
> +#endif
> +
>       /* p2m_init relies on some value initialized by the IOMMU subsystem */
>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>           goto fail;
> @@ -1014,6 +1019,10 @@ int domain_relinquish_resources(struct domain *d)
>           if (ret )
>               return ret;
>   
> +#ifdef CONFIG_IOREQ_SERVER
> +        ioreq_server_destroy_all(d);
> +#endif

The placement of this call feels quite odd. Shouldn't this moved in case 0?

> +
>       PROGRESS(xen):
>           ret = relinquish_memory(d, &d->xenpage_list);
>           if ( ret )
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index ae7ef96..9814481 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -16,6 +16,7 @@
>    * GNU General Public License for more details.
>    */
>   
> +#include <xen/ioreq.h>
>   #include <xen/lib.h>
>   #include <xen/spinlock.h>
>   #include <xen/sched.h>
> @@ -23,6 +24,7 @@
>   #include <asm/cpuerrata.h>
>   #include <asm/current.h>
>   #include <asm/mmio.h>
> +#include <asm/hvm/ioreq.h>

Shouldn't this have been included by "xen/ioreq.h"?

>   
>   #include "decode.h"
>   
> @@ -123,7 +125,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>   
>       handler = find_mmio_handler(v->domain, info.gpa);
>       if ( !handler )
> -        return IO_UNHANDLED;
> +    {
> +        int rc;
> +
> +        rc = try_fwd_ioserv(regs, v, &info);
> +        if ( rc == IO_HANDLED )
> +            return handle_ioserv(regs, v);
> +
> +        return rc;
> +    }
>   
>       /* All the instructions used on emulated MMIO region should be valid */
>       if ( !dabt.valid )
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> new file mode 100644
> index 0000000..3c4a24d
> --- /dev/null
> +++ b/xen/arch/arm/ioreq.c
> @@ -0,0 +1,213 @@
> +/*
> + * arm/ioreq.c: hardware virtual machine I/O emulation
> + *
> + * Copyright (c) 2019 Arm ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/domain.h>
> +#include <xen/ioreq.h>
> +
> +#include <asm/traps.h>
> +
> +#include <public/hvm/ioreq.h>
> +
> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
> +{
> +    const union hsr hsr = { .bits = regs->hsr };
> +    const struct hsr_dabt dabt = hsr.dabt;
> +    /* Code is similar to handle_read */
> +    uint8_t size = (1 << dabt.size) * 8;
> +    register_t r = v->io.req.data;
> +
> +    /* We are done with the IO */
> +    v->io.req.state = STATE_IOREQ_NONE;
> +
> +    if ( dabt.write )
> +        return IO_HANDLED;
> +
> +    /*
> +     * Sign extend if required.
> +     * Note that we expect the read handler to have zeroed the bits
> +     * outside the requested access size.
> +     */
> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    {
> +        /*
> +         * We are relying on register_t using the same as
> +         * an unsigned long in order to keep the 32-bit assembly
> +         * code smaller.
> +         */
> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> +        r |= (~0UL) << size;
> +    }

Looking at the rest of the series, this code is going to be refactored 
in patch #19 and then hardened. It would have been better to do the 
refactoring first and then use it.

This helps a lot for the review and to reduce what I would call churn in 
the series.

I am OK to keep it like that for this series.

> +
> +    set_user_reg(regs, dabt.reg, r);
> +
> +    return IO_HANDLED;
> +}
> +
> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                             struct vcpu *v, mmio_info_t *info)
> +{
> +    struct vcpu_io *vio = &v->io;
> +    ioreq_t p = {
> +        .type = IOREQ_TYPE_COPY,
> +        .addr = info->gpa,
> +        .size = 1 << info->dabt.size,
> +        .count = 1,
> +        .dir = !info->dabt.write,
> +        /*
> +         * On x86, df is used by 'rep' instruction to tell the direction
> +         * to iterate (forward or backward).
> +         * On Arm, all the accesses to MMIO region will do a single
> +         * memory access. So for now, we can safely always set to 0.
> +         */
> +        .df = 0,
> +        .data = get_user_reg(regs, info->dabt.reg),
> +        .state = STATE_IOREQ_READY,
> +    };
> +    struct ioreq_server *s = NULL;
> +    enum io_state rc;
> +
> +    switch ( vio->req.state )
> +    {
> +    case STATE_IOREQ_NONE:
> +        break;
> +
> +    case STATE_IORESP_READY:
> +        return IO_HANDLED;

With the Arm code in mind, I am a bit confused with this check. If 
vio->req.state == STATE_IORESP_READY, then it would imply that the 
previous I/O emulation was somehow not completed (from Xen PoV).

If you return IO_HANDLED here, then it means the we will take care of 
previous I/O but the current one is going to be ignored. So shouldn't we 
use the default path here as well?

> +
> +    default:
> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
> +        return IO_ABORT;
> +    }
> +
> +    s = ioreq_server_select(v->domain, &p);
> +    if ( !s )
> +        return IO_UNHANDLED;
> +
> +    if ( !info->dabt.valid )
> +        return IO_ABORT;
> +
> +    vio->req = p;
> +
> +    rc = ioreq_send(s, &p, 0);
> +    if ( rc != IO_RETRY || v->domain->is_shutting_down )
> +        vio->req.state = STATE_IOREQ_NONE;
> +    else if ( !ioreq_needs_completion(&vio->req) )
> +        rc = IO_HANDLED;
> +    else
> +        vio->completion = VIO_mmio_completion;
> +
> +    return rc;
> +}
> +
> +bool arch_ioreq_complete_mmio(void)
> +{
> +    struct vcpu *v = current;
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +    const union hsr hsr = { .bits = regs->hsr };
> +    paddr_t addr = v->io.req.addr;
> +
> +    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
> +    {
> +        advance_pc(regs, hsr);
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +bool arch_vcpu_ioreq_completion(enum vio_completion completion)
> +{
> +    ASSERT_UNREACHABLE();
> +    return true;
> +}
> +
> +/*
> + * The "legacy" mechanism of mapping magic pages for the IOREQ servers
> + * is x86 specific, so the following hooks don't need to be implemented on Arm:
> + * - arch_ioreq_server_map_pages
> + * - arch_ioreq_server_unmap_pages
> + * - arch_ioreq_server_enable
> + * - arch_ioreq_server_disable
> + */
> +int arch_ioreq_server_map_pages(struct ioreq_server *s)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
> +{
> +}
> +
> +void arch_ioreq_server_enable(struct ioreq_server *s)
> +{
> +}
> +
> +void arch_ioreq_server_disable(struct ioreq_server *s)
> +{
> +}
> +
> +void arch_ioreq_server_destroy(struct ioreq_server *s)
> +{
> +}
> +
> +int arch_ioreq_server_map_mem_type(struct domain *d,
> +                                   struct ioreq_server *s,
> +                                   uint32_t flags)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
> +                                              struct ioreq_server *s,
> +                                              uint32_t flags)
> +{
> +}
> +
> +bool arch_ioreq_server_destroy_all(struct domain *d)
> +{
> +    return true;
> +}
> +
> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
> +                                     const ioreq_t *p,
> +                                     uint8_t *type,
> +                                     uint64_t *addr)
> +{
> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
> +        return false;
> +
> +    *type = (p->type == IOREQ_TYPE_PIO) ?
> +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
> +    *addr = p->addr;
> +
> +    return true;
> +}
> +
> +void arch_ioreq_domain_init(struct domain *d)
> +{
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 22bd1bd..036b13f 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -21,6 +21,7 @@
>   #include <xen/hypercall.h>
>   #include <xen/init.h>
>   #include <xen/iocap.h>
> +#include <xen/ioreq.h>
>   #include <xen/irq.h>
>   #include <xen/lib.h>
>   #include <xen/mem_access.h>
> @@ -1385,6 +1386,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
>   #ifdef CONFIG_HYPFS
>       HYPERCALL(hypfs_op, 5),
>   #endif
> +#ifdef CONFIG_IOREQ_SERVER
> +    HYPERCALL(dm_op, 3),
> +#endif
>   };
>   
>   #ifndef NDEBUG
> @@ -1956,6 +1960,9 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>               case IO_HANDLED:
>                   advance_pc(regs, hsr);
>                   return;
> +            case IO_RETRY:
> +                /* finish later */
> +                return;
>               case IO_UNHANDLED:
>                   /* IO unhandled, try another way to handle it. */
>                   break;
> @@ -2254,6 +2261,12 @@ static void check_for_vcpu_work(void)
>   {
>       struct vcpu *v = current;
>   
> +#ifdef CONFIG_IOREQ_SERVER
> +    local_irq_enable();
> +    vcpu_ioreq_handle_completion(v);
> +    local_irq_disable();
> +#endif
> +
>       if ( likely(!v->arch.need_flush_to_ram) )
>           return;
>   
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 6819a3b..c235e5b 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -10,6 +10,7 @@
>   #include <asm/gic.h>
>   #include <asm/vgic.h>
>   #include <asm/vpl011.h>
> +#include <public/hvm/dm_op.h>

May I ask, why do you need to include dm_op.h here?

>   #include <public/hvm/params.h>
>   
>   struct hvm_domain
> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> +#define has_vpci(d)    ({ (void)(d); false; })
> +
>   #endif /* __ASM_DOMAIN_H__ */
>   
>   /*
> diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
> new file mode 100644
> index 0000000..19e1247
> --- /dev/null
> +++ b/xen/include/asm-arm/hvm/ioreq.h

Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ as 
the IOREQ is now meant to be agnostic?

> @@ -0,0 +1,72 @@
> +/*
> + * hvm.h: Hardware virtual machine assist interface definitions.
> + *
> + * Copyright (c) 2016 Citrix Systems Inc.
> + * Copyright (c) 2019 Arm ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_ARM_HVM_IOREQ_H__
> +#define __ASM_ARM_HVM_IOREQ_H__
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                             struct vcpu *v, mmio_info_t *info);
> +#else
> +static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
> +                                          struct vcpu *v)
> +{
> +    return IO_UNHANDLED;
> +}
> +
> +static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                                           struct vcpu *v, mmio_info_t *info)
> +{
> +    return IO_UNHANDLED;
> +}
> +#endif
> +
> +bool ioreq_complete_mmio(void);
> +
> +static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
> +{
> +    /*
> +     * TODO: For Arm64, the main user will be PCI. So this should be
> +     * implemented when we add support for vPCI.
> +     */
> +    ASSERT_UNREACHABLE();
> +    return true;
> +}
> +
> +static inline void msix_write_completion(struct vcpu *v)
> +{
> +}
> +
> +/* This correlation must not be altered */
> +#define IOREQ_STATUS_HANDLED     IO_HANDLED
> +#define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
> +#define IOREQ_STATUS_RETRY       IO_RETRY
> +
> +#endif /* __ASM_ARM_HVM_IOREQ_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
> index 8dbfb27..7ab873c 100644
> --- a/xen/include/asm-arm/mmio.h
> +++ b/xen/include/asm-arm/mmio.h
> @@ -37,6 +37,7 @@ enum io_state
>       IO_ABORT,       /* The IO was handled by the helper and led to an abort. */
>       IO_HANDLED,     /* The IO was successfully handled by the helper. */
>       IO_UNHANDLED,   /* The IO was not handled by the helper. */
> +    IO_RETRY,       /* Retry the emulation for some reason */
>   };
>   
>   typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
> 

-- 
Julien Grall

