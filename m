Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFD8BAA6A
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 11:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716323.1118447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2phY-0003f7-4J; Fri, 03 May 2024 09:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716323.1118447; Fri, 03 May 2024 09:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2phY-0003cm-1K; Fri, 03 May 2024 09:59:36 +0000
Received: by outflank-mailman (input) for mailman id 716323;
 Fri, 03 May 2024 09:59:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s2phW-0003cT-Lo
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 09:59:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2phV-0001SC-Sv; Fri, 03 May 2024 09:59:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s2phV-0005oK-Mq; Fri, 03 May 2024 09:59:33 +0000
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
	bh=dcybJbfBlY7UIodb/FocVxDnAnLFfxC08d+QFS8S/58=; b=cIeM4ya/LW+vGoxdTy+eJzQ49z
	D6J6iGxOXxE7SwyZneXfTRnAfDzkSUCqrrIjJZKARQXb46HGMORvMmYxtvAEGFjV03bJ25lHe5TRN
	Fq59+nQXicv4OhUw6/gpAmokqnxoY4lmEhcEpPk9exZ0UU8zhoEHM+ekTs+UDJ1njRRg=;
Message-ID: <935e3947-53ee-48c5-a10c-5fa7f572ae65@xen.org>
Date: Fri, 3 May 2024 10:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
 <20240502145645.1201613-6-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240502145645.1201613-6-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 02/05/2024 15:56, Jens Wiklander wrote:
> -static bool ffa_probe(void)
> +static int __init ffa_init(void)
>   {
>       uint32_t vers;
>       unsigned int major_vers;
> @@ -460,16 +511,16 @@ static bool ffa_probe(void)
>           printk(XENLOG_ERR
>                  "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
>                  smccc_ver, ARM_SMCCC_VERSION_1_2);
> -        return false;
> +        return 0;
>       }
>   
>       if ( !ffa_get_version(&vers) )
> -        return false;
> +        return 0;
>   
>       if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>       {
>           printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
> -        return false;
> +        return 0;
>       }
>   
>       major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
> @@ -492,26 +543,33 @@ static bool ffa_probe(void)
>            !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>            !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>            !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> -        return false;
> +        return 0;
>   
>       if ( !ffa_rxtx_init() )
> -        return false;
> +        return 0;
>   
>       ffa_version = vers;
>   
>       if ( !ffa_partinfo_init() )
>           goto err_rxtx_destroy;
>   
> +    ffa_notif_init();
>       INIT_LIST_HEAD(&ffa_teardown_head);
>       init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
>   
> -    return true;
> +    return 0;
>   
>   err_rxtx_destroy:
>       ffa_rxtx_destroy();
>       ffa_version = 0;
>   
> -    return false;
> +    return 0;
> +}
> +presmp_initcall(ffa_init);
I would rather prefer if tee_init() is called from presmp_initcall(). 
This would avoid FFA to have to try to initialize itself before all the 
others.

This is what I had in mind with my original request, but I guess I 
wasn't clear enough. Sorry for that.

[...]

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
> +            uint16_t vm_id = get_id_from_resp(&resp, id_pos);
> +            struct domain *d;
> +
> +            /*
> +             * vm_id == 0 means a notifications pending for Xen itself, but
> +             * we don't support that yet.
> +             */
> +            if (vm_id)
> +                d = ffa_rcu_lock_domain_by_vm_id(vm_id);

I am still unconvinced that this is sufficient. This will prevent 
"struct domain *" to be freed. But ...

> +            else
> +                d = NULL;
> +
> +            if ( d )
> +            {
> +                struct ffa_ctx *ctx = d->arch.tee;

... I don't think it will protect d->arch.tee to be freed as this is 
happening during teardorwn. You mostly need some other sort of locking 
to avoid d->arch.tee been freed behind your back.

> +                struct vcpu *v;
> +
> +                ACCESS_ONCE(ctx->notif.secure_pending) = true;
> +
> +                /*
> +                 * Since we're only delivering global notification, always
> +                 * deliver to the first online vCPU. It doesn't matter
> +                 * which we chose, as long as it's available.
> +                 */
> +                for_each_vcpu(d, v)
> +                {
> +                    if ( is_vcpu_online(v) )
> +                    {
> +                        vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
> +                                        true);
> +                        break;
> +                    }
> +                }
> +                if ( !v )
> +                    printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n");
> +
> +                rcu_unlock_domain(d);
> +            }
> +
> +            id_pos += count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}

[...]

> +static int ffa_setup_irq_callback(struct notifier_block *nfb,
> +                                  unsigned long action, void *hcpu)
> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    struct notif_irq_info irq_info = { };
> +
> +    switch ( action )
> +    {
> +    case CPU_ONLINE:

Can't you execute the notifier in CPU_STARTING? This will be called on 
the CPU directly, so you should be able to use request_irq(...).

> +        /*
> +         * The notifier call is done on the primary or initiating CPU when
> +         * the target CPU have come online, but the SGI must be setup on
> +         * the target CPU.
> +         *
> +         * We make an IPI call to the target CPU to setup the SGI. The call
> +         * is executed in interrupt context on the target CPU, so we can't
> +         * call request_irq() directly since it allocates memory.
> +         *
> +         * We preallocate the needed irqaction here and pass it via the
> +         * temporary struct notif_irq_info. The call is synchronous in the
> +         * sense that when on_selected_cpus() returns the callback
> +         * notif_irq_enable() has done the same on the target CPU.
> +         *
> +         * We deal with two errors, one where notif_irq_enable() hasn't
> +         * been called for some reason, that error is logged below. The
> +         * other where setup_irq() fails is logged in the callback. We must
> +         * free the irqaction in both cases since it has failed to become
> +         * registered.
> +         *
> +         * Failures leads to a problem notifications, the CPUs with failure
> +         * will trigger on the SGI indicating that there are notifications
> +         * pending, while the SPMC in the secure world will not notice that
> +         * the interrupt was lost.
> +         */
> +        irq_info.action = xmalloc(struct irqaction);
> +        if ( !irq_info.action )
> +        {
> +            printk(XENLOG_ERR "ffa: setup irq %u failed, out of memory\n",
> +                   notif_sri_irq);
> +            return -ENOMEM;
> +        }
> +
> +        *irq_info.action = (struct irqaction){
> +            .handler = notif_irq_handler,
> +            .name = "FF-A notif",
> +            .free_on_release = 1,
> +        };
> +
> +        on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info, 1);
> +        if (!irq_info.called)
> +            printk(XENLOG_ERR "ffa: on_selected_cpus(cpumask_of(%u)) failed\n",
> +                   cpu);
> +        /*
> +         * The irqaction is unused and must be freed if irq_info.action is
> +         * non-NULL at this stage.
> +         */
> +        XFREE(irq_info.action);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return 0;
> +}

Cheers,

-- 
Julien Grall

