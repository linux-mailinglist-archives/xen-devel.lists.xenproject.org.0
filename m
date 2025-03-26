Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7847A726EE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 00:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928292.1331023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZxd-00070I-G4; Wed, 26 Mar 2025 23:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928292.1331023; Wed, 26 Mar 2025 23:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZxd-0006yB-Bf; Wed, 26 Mar 2025 23:15:01 +0000
Received: by outflank-mailman (input) for mailman id 928292;
 Wed, 26 Mar 2025 23:15:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txZxc-0006y5-31
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 23:15:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZxb-00A04m-2V;
 Wed, 26 Mar 2025 23:14:59 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZxb-000eJH-0q;
 Wed, 26 Mar 2025 23:14:59 +0000
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
	bh=LiGqJlGieHJg/gacdXCf5mo8vhCD8X7u4HF+xe5ceYw=; b=v65o8qTA0O3h1Q8tEtecV+aCR5
	nXx9DhMgykEmLfj6xr3eSc74YRlochUoFeKRAOYSO+mc4cMntf2VbhW8RStr8oGfcV0B+c3vCH8tW
	vw5o87SMyrZanienHG+XjZiv1/XT376pWu353+fZQMKL80RzFTLGcTXjV+RCY8rnF/jw=;
Message-ID: <338d8982-0a2e-4a40-a9a2-bed8f50d81e1@xen.org>
Date: Wed, 26 Mar 2025 23:14:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

I didn't dig in the spec and neither some of the callers. So I will 
mainly focus on the implementation from Xen PoV.

On 24/03/2025 13:53, Bertrand Marquis wrote:
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
> 
> When VM to VM is activated, Xen will be tainted as Insecure and a
> message is displayed to the user during the boot as there is no
> filtering of VMs in FF-A so any VM can communicate or see any other VM
> in the system.
> 
> WARNING: There is no filtering for now and all VMs are listed !!
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - properly handle SPMC version 1.0 header size case in partinfo_get
> - switch to local counting variables instead of *pointer += 1 form
> - coding style issue with missing spaces in if ()
> Changes in v3:
> - break partinfo_get in several sub functions to make the implementation
>    easier to understand and lock handling easier
> - rework implementation to check size along the way and prevent previous
>    implementation limits which had to check that the number of VMs or SPs
>    did not change
> - taint Xen as INSECURE when VM to VM is enabled
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>    a variable d pointing to the current domain and it must not be
>    shadowed.
> ---
>   xen/arch/arm/tee/Kconfig        |  11 ++
>   xen/arch/arm/tee/ffa.c          |  12 ++
>   xen/arch/arm/tee/ffa_partinfo.c | 274 +++++++++++++++++++++-----------
>   xen/arch/arm/tee/ffa_private.h  |  12 ++
>   4 files changed, 218 insertions(+), 91 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>   
>   	  [1] https://developer.arm.com/documentation/den0077/latest
>   
> +config FFA_VM_TO_VM
> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> +    default n
> +    depends on FFA
> +    help
> +      This option enables to use FF-A between VMs.
> +      This is experimental and there is no access control so any
> +      guest can communicate with any other guest.
> +
> +      If unsure, say N.
> +
>   endmenu
>   
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..e41ab5f8ada6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -464,6 +464,18 @@ static bool ffa_probe(void)
>       printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>              FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>   
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /*
> +         * When FFA VM to VM is enabled, the current implementation does not
> +         * offer any way to limit which VM can communicate with which VM using
> +         * FF-A.
> +         * Signal this in the xen console and taint the system as insecure.
> +         * TODO: Introduce a solution to limit what a VM can do through FFA.
> +         */
> +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure !!\n");
> +        add_taint(TAINT_MACHINE_INSECURE);
> +    }
>       /*
>        * psci_init_smccc() updates this value with what's reported by EL-3
>        * or secure world.
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
> index c0510ceb8338..406c57b95f77 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -63,9 +63,156 @@ static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
>       return ret;
>   }
>   
> -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> +{
> +    uint32_t src_size;
> +
> +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLAG,
> +                                  sp_count, &src_size);
> +}
> +
> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> +                                   void *dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
>   {
>       int32_t ret;
> +    uint32_t src_size, real_sp_count;
> +    void *src_buf = ffa_rx;
> +    uint32_t count = 0;
> +
> +    /* Do we have a RX buffer with the SPMC */
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    /* We need to use the RX buffer to receive the list */
> +    spin_lock(&ffa_rx_buffer_lock);
> +
> +    ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> +    if ( ret )
> +        goto out;
> +
> +    /* We now own the RX buffer */
> +
> +    /* We only support a 1.1 firmware version */
> +    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_release;
> +    }
> +
> +    for ( uint32_t sp_num = 0; sp_num < real_sp_count; sp_num++ )

What's the upper limit of real_sp_count? Asking just in case we need to 
handle preemption.

> +    {
> +        struct ffa_partition_info_1_1 *fpi = src_buf;
> +
> +        /* filter out SP not following bit 15 convention if any */
> +        if ( FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            if ( dst_buf + dst_size > end_buf )

Can "dst_buf + dst_size" overflow?

Also, NIT: can you add parenthese to make clear about precedence?

> +            {
> +                ret = FFA_RET_NO_MEMORY;
> +                goto out_release;
> +            }
> +
> +            memcpy(dst_buf, src_buf, MIN(src_size, dst_size));

What's the maximum size of src_size and dst_size?

> +            if ( dst_size > src_size )
> +                memset(dst_buf + src_size, 0, dst_size - src_size);
> +
> +            dst_buf += dst_size;
> +            count++;
> +        }
> +
> +        src_buf += src_size;
> +    }
> +
> +    *sp_count = count;
> +
> +out_release:
> +    ffa_hyp_rx_release();
> +out:
> +    spin_unlock(&ffa_rx_buffer_lock);
> +    return ret;
> +}
> +
> +static uint32_t ffa_get_vm_count(void)

Is this meant to be called often? If so, can we instead have a counter 
that will be incremented when the vTEE is first initialized and then 
decremented when the VM is destroyed?

> +{
> +    struct domain *d = current->domain;
 > +    struct domain *dom;

NIT: "d" and "dom" are a bit too close. Could we rename "d" with "curr_d"?

> +    uint32_t vm_count = 0;
> +
> +    /* Count the number of VM with FF-A support */

This comment implies this is including the current VM. But ...

> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain( dom )
> +    {
> +        struct ffa_ctx *vm = dom->arch.tee;
> +
> +        if ( dom != d && vm != NULL && vm->guest_vers != 0 )

... here you are excluding it. Also, it sounds like this is support by 
the OS rather than the VM itself. Is that correct?

 > +            vm_count++;> +    }
> +    rcu_read_unlock(&domlist_read_lock);
 > +> +    return vm_count;

OOI, I guess this value is just used as an hint? Asking because the 
number of domains can change at any point.

> +}
> +
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct domain *d = current->domain;
> +    struct domain *dom;
> +    int32_t ret = FFA_RET_OK;
> +    uint32_t count = 0;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain( dom )

We can have quite a lot of domains in the system. So how can we ensure 
this is not hogging a pCPU?

I would be ok to delay the work, but we need a TODO so we remember to 
address it before this is security supported.

> +    {
> +        struct ffa_ctx *vm = dom->arch.tee;
> +
> +        /*
> +         * we do not add the VM calling to the list and only VMs with
> +         * FF-A support
> +         */
> +        if ( dom != d && vm != NULL && vm->guest_vers != 0 )
> +        {
> +            /*
> +             * We do not have UUID info for VMs so use
> +             * the 1.0 structure so that we set UUIDs to
> +             * zero using memset
> +             */
> +            struct ffa_partition_info_1_0 srcvm;
 > +> +            if  ( dst_buf + dst_size > end_buf )

Same question as the other similar check.

> +            {
> +                ret = FFA_RET_NO_MEMORY;
> +                goto out;
> +            }
> +
> +            srcvm.id = ffa_get_vm_id(dom);
> +            srcvm.execution_context = dom->max_vcpus;
> +            srcvm.partition_properties = FFA_PART_VM_PROP;
> +            if ( is_64bit_domain(dom) )
> +                srcvm.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
> +
> +            memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
> +
> +            if ( dst_size > sizeof(srcvm) )
> +                memset(dst_buf + sizeof(srcvm), 0,
> +                       dst_size - sizeof(srcvm));
> +
> +            dst_buf += dst_size;
> +            count++;
> +        }
> +    }
> +    *vm_count = count;
> +
> +out:
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    return ret;
> +}
> +
> +
> +void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +{
> +    int32_t ret = FFA_RET_OK;
>       struct domain *d = current->domain;
>       struct ffa_ctx *ctx = d->arch.tee;
>       uint32_t flags = get_user_reg(regs, 5);
> @@ -75,9 +222,9 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>           get_user_reg(regs, 3),
>           get_user_reg(regs, 4),
>       };
> -    uint32_t src_size, dst_size;
> -    void *dst_buf;
> -    uint32_t ffa_sp_count = 0;
> +    uint32_t dst_size = 0;
> +    void *dst_buf, *end_buf;
> +    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
>   
>       /*
>        * If the guest is v1.0, he does not get back the entry size so we must
> @@ -89,118 +236,63 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>       else
>           dst_size = sizeof(struct ffa_partition_info_1_1);
>   
> -    /*
> -     * FF-A v1.0 has w5 MBZ while v1.1 allows
> -     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> -     *
> -     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> -     * rxtx buffer so do the partition_info_get directly.
> -     */
> -    if ( flags == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> -         ctx->guest_vers == FFA_VERSION_1_1 )
> +    /* Only count requested */
> +    if ( flags )
>       {
> -        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -            ret = ffa_partition_info_get(uuid, flags, &ffa_sp_count,
> -                                        &src_size);
> -        else
> -            ret = FFA_RET_OK;
> +        /*
> +         * FF-A v1.0 has w5 MBZ while v1.1 allows
> +         * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +         */
> +        if ( ctx->guest_vers == FFA_VERSION_1_0 ||
> +                flags != FFA_PARTITION_INFO_GET_COUNT_FLAG )
> +        {
> +            ret = FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
>   
> -        goto out;
> -    }
> +        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +        {
> +            ret = ffa_get_sp_count(uuid, &ffa_sp_count);
> +            if ( ret )
> +                goto out;
> +        }
>   
> -    if ( flags )
> -    {
> -        ret = FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +            ffa_vm_count = ffa_get_vm_count();
>   
> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -    {
> -        /* Just give an empty partition list to the caller */
> -        ret = FFA_RET_OK;
>           goto out;
>       }
>   
> +    /* Get the RX buffer to write the list of partitions */
>       ret = ffa_rx_acquire(d);
>       if ( ret != FFA_RET_OK )
>           goto out;
>   
>       dst_buf = ctx->rx;
> +    end_buf = ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
>   
> -    if ( !ffa_rx )
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>       {
> -        ret = FFA_RET_DENIED;
> -        goto out_rx_release;
> -    }
> -
> -    spin_lock(&ffa_rx_buffer_lock);
> -
> -    ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> -
> -    if ( ret )
> -        goto out_rx_hyp_unlock;
> +        ret = ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
> +                                  dst_size);
>   
> -    /*
> -     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_hyp_rx_release()
> -     * once we've copied the content.
> -     */
> +        if ( ret )
> +            goto out_rx_release;
>   
> -    /* we cannot have a size smaller than 1.0 structure */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> -    {
> -        ret = FFA_RET_NOT_SUPPORTED;
> -        goto out_rx_hyp_release;
> +        dst_buf += ffa_sp_count * dst_size;
>       }
>   
> -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> -    {
> -        ret = FFA_RET_NO_MEMORY;
> -        goto out_rx_hyp_release;
> -    }
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        ret = ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst_size);
>   
> -    if ( ffa_sp_count > 0 )
> -    {
> -        uint32_t n, n_limit = ffa_sp_count;
> -        void *src_buf = ffa_rx;
> -
> -        /* copy the secure partitions info */
> -        for ( n = 0; n < n_limit; n++ )
> -        {
> -            struct ffa_partition_info_1_1 *fpi = src_buf;
> -
> -            /* filter out SP not following bit 15 convention if any */
> -            if ( FFA_ID_IS_SECURE(fpi->id) )
> -            {
> -                memcpy(dst_buf, src_buf, dst_size);
> -                dst_buf += dst_size;
> -            }
> -            else
> -                ffa_sp_count--;
> -
> -            src_buf += src_size;
> -        }
> -    }
> -
> -out_rx_hyp_release:
> -    ffa_hyp_rx_release();
> -out_rx_hyp_unlock:
> -    spin_unlock(&ffa_rx_buffer_lock);
>   out_rx_release:
> -    /*
> -     * The calling VM RX buffer only contains data to be used by the VM if the
> -     * call was successful, in which case the VM has to release the buffer
> -     * once it has used the data.
> -     * If something went wrong during the call, we have to release the RX
> -     * buffer back to the SPMC as the VM will not do it.
> -     */
> -    if ( ret != FFA_RET_OK )
> +    if ( ret )
>           ffa_rx_release(d);
>   out:
>       if ( ret )
>           ffa_set_regs_error(regs, ret);
>       else
> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size);
>   }
>   
>   static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
> index c4cd65538908..bd6877d8c632 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -187,6 +187,18 @@
>    */
>   #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>   
> +/*
> + * Partition properties we give for a normal world VM:
> + * - can send direct message but not receive them
> + * - can handle indirect messages
> + * - can receive notifications
> + * 32/64 bit flag is set depending on the VM
> + */
> +#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
> +                             FFA_PART_PROP_INDIRECT_MSGS | \
> +                             FFA_PART_PROP_RECV_NOTIF | \
> +                             FFA_PART_PROP_IS_PE_ID)
> +
>   /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
>   #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
>   #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)

Cheers,

-- 
Julien Grall


