Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B78B3FE5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 21:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713077.1114060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QuX-0000bY-Cw; Fri, 26 Apr 2024 19:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713077.1114060; Fri, 26 Apr 2024 19:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0QuX-0000ZV-8y; Fri, 26 Apr 2024 19:07:05 +0000
Received: by outflank-mailman (input) for mailman id 713077;
 Fri, 26 Apr 2024 19:07:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s0QuW-0000ZP-1n
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 19:07:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0QuV-00063W-JN; Fri, 26 Apr 2024 19:07:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0QuV-00047S-9P; Fri, 26 Apr 2024 19:07:03 +0000
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
	bh=Zhr+bC1rBOPH/0vi7Hy2RY+K0QXyy4CL6/oBUsg6k4o=; b=v7KzhvYCTVsWkGJoXR1UlCvR/P
	UMj4cQKuBe3N8+tr1UTk0jArpOZAl4JZTny9ZNjSZ2FrmBLvBpZEGAnHT/sqpcwphBJMXR4QrzIu1
	+2k3b3qfUO3Yzk/F6+S6Wlkv9/lKXj4A/ShGJoM/AKnBOErOT003h9WB7MbvMQAVjRh8=;
Message-ID: <c7a672a7-02f8-4d24-b87e-1b8439d7eb4c@xen.org>
Date: Fri, 26 Apr 2024 20:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240426084723.4149648-6-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 26/04/2024 09:47, Jens Wiklander wrote:
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index d7306aa64d50..5224898265a5 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -155,7 +155,7 @@ void __init init_IRQ(void)
>       {
>           /* SGIs are always edge-triggered */
>           if ( irq < NR_GIC_SGI )
> -            local_irqs_type[irq] = DT_IRQ_TYPE_EDGE_RISING;
> +            local_irqs_type[irq] = IRQ_TYPE_EDGE_RISING;

This changes seems unrelated to this patch. This wants to be separate 
(if you actually intended to change it).

>           else
>               local_irqs_type[irq] = IRQ_TYPE_INVALID;
>       }
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index f0112a2f922d..7c0f46f7f446 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) += ffa.o
>   obj-$(CONFIG_FFA) += ffa_shm.o
>   obj-$(CONFIG_FFA) += ffa_partinfo.o
>   obj-$(CONFIG_FFA) += ffa_rxtx.o
> +obj-$(CONFIG_FFA) += ffa_notif.o
>   obj-y += tee.o
>   obj-$(CONFIG_OPTEE) += optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5209612963e1..912e905a27bd 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,6 +39,9 @@
>    *   - at most 32 shared memory regions per guest
>    * o FFA_MSG_SEND_DIRECT_REQ:
>    *   - only supported from a VM to an SP
> + * o FFA_NOTIFICATION_*:
> + *   - only supports global notifications, that is, per vCPU notifications
> + *     are not supported
>    *
>    * There are some large locked sections with ffa_tx_buffer_lock and
>    * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> @@ -194,6 +197,8 @@ out:
>   
>   static void handle_features(struct cpu_user_regs *regs)
>   {
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.tee;
>       uint32_t a1 = get_user_reg(regs, 1);
>       unsigned int n;
>   
> @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *regs)
>           BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
>           ffa_set_regs_success(regs, 0, 0);
>           break;
> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +
> +    case FFA_NOTIFICATION_BIND:
> +    case FFA_NOTIFICATION_UNBIND:
> +    case FFA_NOTIFICATION_GET:
> +    case FFA_NOTIFICATION_SET:
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>       default:
>           ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>           break;
> @@ -305,6 +334,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
>                                                        get_user_reg(regs, 1)),
>                                      get_user_reg(regs, 3));
>           break;
> +    case FFA_NOTIFICATION_BIND:
> +        e = ffa_handle_notification_bind(regs);
> +        break;
> +    case FFA_NOTIFICATION_UNBIND:
> +        e = ffa_handle_notification_unbind(regs);
> +        break;
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        ffa_handle_notification_info_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_GET:
> +        ffa_handle_notification_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_SET:
> +        e = ffa_handle_notification_set(regs);
> +        break;
>   
>       default:
>           gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -322,6 +367,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
>   static int ffa_domain_init(struct domain *d)
>   {
>       struct ffa_ctx *ctx;
> +    int ret;
>   
>       if ( !ffa_version )
>           return -ENODEV;
> @@ -345,10 +391,11 @@ static int ffa_domain_init(struct domain *d)
>        * error, so no need for cleanup in this function.
>        */
>   
> -    if ( !ffa_partinfo_domain_init(d) )
> -        return -EIO;
> +    ret = ffa_partinfo_domain_init(d);
> +    if ( ret )
> +        return ret;
>   
> -    return 0;
> +    return ffa_notif_domain_init(d);
>   }
>   
>   static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
> @@ -423,6 +470,7 @@ static int ffa_domain_teardown(struct domain *d)
>           return 0;
>   
>       ffa_rxtx_domain_destroy(d);
> +    ffa_notif_domain_destroy(d);
>   
>       ffa_domain_teardown_continue(ctx, true /* first_time */);
>   
> @@ -502,6 +550,7 @@ static bool ffa_probe(void)
>       if ( !ffa_partinfo_init() )
>           goto err_rxtx_destroy;
>   
> +    ffa_notif_init();
>       INIT_LIST_HEAD(&ffa_teardown_head);
>       init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
>   
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> new file mode 100644
> index 000000000000..6bb0804ee2f8
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -0,0 +1,378 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +static bool __ro_after_init notif_enabled;
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d = current->domain;
> +    uint32_t src_dst = get_user_reg(regs, 1);
> +    uint32_t flags = get_user_reg(regs, 2);
> +    uint32_t bitmap_lo = get_user_reg(regs, 3);
> +    uint32_t bitmap_hi = get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( flags )    /* Only global notifications are supported */
> +        return FFA_RET_DENIED;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sender
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_hi,
> +                           bitmap_lo);
> +}
> +
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d = current->domain;
> +    uint32_t src_dst = get_user_reg(regs, 1);
> +    uint32_t bitmap_lo = get_user_reg(regs, 3);
> +    uint32_t bitmap_hi = get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the
> +     * destination endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_hi,
> +                            bitmap_lo);
> +}
> +
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.tee;
> +    bool pending_global;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    spin_lock(&ctx->notif.lock);
> +    pending_global = ctx->notif.secure_pending;
> +    ctx->notif.secure_pending = false;
> +    spin_unlock(&ctx->notif.lock);
> +
> +    if ( pending_global )
> +    {
> +        /* A pending global notification for the guest */
> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm_id(d),
> +                     0, 0, 0, 0);
> +    }
> +    else
> +    {
> +        /* Report an error if there where no pending global notification */
> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> +    }
> +}
> +static void notif_irq_handler(int irq, void *data)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_NOTIFICATION_INFO_GET_64,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int id_pos;
> +    unsigned int list_count;
> +    uint64_t ids_count;
> +    unsigned int n;
> +    int32_t res;
> +
> +    do {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        res = ffa_get_ret_code(&resp);
> +        if ( res )
> +        {
> +            if ( res != FFA_RET_NO_DATA )
> +                printk(XENLOG_ERR "ffa: notification info get failed: error %d\n",
> +                       res);
> +            return;
> +        }
> +
> +        ids_count = resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> +        list_count = ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) &
> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> +
> +        id_pos = 0;
> +        for ( n = 0; n < list_count; n++ )
> +        {
> +            unsigned int count = ((ids_count >> 2 * n) & 0x3) + 1;
> +            struct domain *d;
> +
> +            d = ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_pos));

Thinking a bit more about the question from Bertrand about 
get_domain_id() vs rcu_lock_domain_by_id(). I am actually not sure 
whether either are ok here.

If I am not mistaken, d->arch.tee will be freed as part of the domain 
teardown process. This means you can have the following scenario:

CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)

CPU1: call domain_kill()
CPU1: teardown is called, free d->arch.tee (the pointer is not set to NULL)

d->arch.tee is now a dangling pointer

CPU0: access d->arch.tee

This implies you may need to gain a global lock (I don't have a better 
idea so far) to protect the IRQ handler against domains teardown.

Did I miss anything?

> +
> +            if ( d )
> +            {
> +                struct ffa_ctx *ctx = d->arch.tee;
> +
> +                spin_lock(&ctx->notif.lock);
> +                ctx->notif.secure_pending = true;
> +                spin_unlock(&ctx->notif.lock);


AFAICT, the spinlock is used with IRQ enabled (see 
ffa_handle_notification_info_get()) but also in an IRQ handler. So to 
prevent deadlock, you will want to use spin_lock_irq* helpers.

That said, I don't think you need a spin_lock(). You could use atomic 
operations instead. For the first hunk, you could use 
test_and_clear_bool(). E.g.:

if ( test_and_clear_bool(ctx.notif.secure_pending) )

For the second part, it might be fine to use ACCESS_ONCE().

> +
> +                /*
> +                 * Since we're only delivering global notification, always
> +                 * deliver to the first vCPU. It doesn't matter which we
> +                 * chose, as long as it's available.

What if vCPU0 is offlined?

> +                 */
> +                vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID,
> +                                true);
> +
> +                put_domain(d);
> +            }
> +
> +            id_pos += count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}

[..]

> +struct ffa_ctx_notif {
> +    bool enabled;
> +
> +    /* Used to serialize access to the rest of this struct */
> +    spinlock_t lock;

Regardless what I wrote above, I can't seem to find a call to 
spin_lock_init(). You will want it to initialize.

Also, it would be best if we keep the two booleans close to each other 
so we limit the amount of padding in the structure.

> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending global notifications.
> +     */
> +    bool secure_pending;
> +};
>   
>   struct ffa_ctx {
>       void *rx;
> @@ -228,6 +265,7 @@ struct ffa_ctx {
>       struct list_head shm_list;
>       /* Number of allocated shared memory object */
>       unsigned int shm_count;
> +    struct ffa_ctx_notif notif;
>       /*
>        * tx_lock is used to serialize access to tx
>        * rx_lock is used to serialize access to rx
> @@ -257,7 +295,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs);
>   int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
>   
>   bool ffa_partinfo_init(void);
> -bool ffa_partinfo_domain_init(struct domain *d);
> +int ffa_partinfo_domain_init(struct domain *d);
>   bool ffa_partinfo_domain_destroy(struct domain *d);
>   int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
>                                         uint32_t w4, uint32_t w5, uint32_t *count,
> @@ -271,12 +309,28 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>   uint32_t ffa_handle_rxtx_unmap(void);
>   int32_t ffa_handle_rx_release(void);
>   
> +void ffa_notif_init(void);
> +int ffa_notif_domain_init(struct domain *d);
> +void ffa_notif_domain_destroy(struct domain *d);
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs);
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
> +int ffa_handle_notification_set(struct cpu_user_regs *regs);
> +
>   static inline uint16_t ffa_get_vm_id(const struct domain *d)
>   {
>       /* +1 since 0 is reserved for the hypervisor in FF-A */
>       return d->domain_id + 1;
>   }
>   
> +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
> +{

Is this expected to be called with vm_id == 0? If not, then I would 
consider to add an ASSERT(vm_id != 0). If yes, then I please add a 
runtime check and return NULL.

> +    /* -1 to match ffa_get_vm_id() */
> +    return get_domain_by_id(vm_id - 1);
> +}
> +
>   static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
>                                   register_t v1, register_t v2, register_t v3,
>                                   register_t v4, register_t v5, register_t v6,

Cheers,

-- 
Julien Grall

