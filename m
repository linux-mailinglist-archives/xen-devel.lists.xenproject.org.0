Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C757BABF85B
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992015.1375800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkqX-0004c3-C0; Wed, 21 May 2025 14:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992015.1375800; Wed, 21 May 2025 14:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHkqX-0004ZN-8t; Wed, 21 May 2025 14:55:05 +0000
Received: by outflank-mailman (input) for mailman id 992015;
 Wed, 21 May 2025 14:55:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPXp=YF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1uHkqV-0004ZH-Lb
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:55:03 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9258843a-3653-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 16:55:02 +0200 (CEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-604f0d27c24so3655278eaf.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:55:02 -0700 (PDT)
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
X-Inumbo-ID: 9258843a-3653-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747839301; x=1748444101; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLe/VFOV+IGfsar9eaNwR5XIUVZBcoWh0JazlUMDS3g=;
        b=u3r92UEG61gqc+LTRH3K93/uLxnMKOu+M+mOvc3xJyNysmtrhJHPN/iPar4NK5rBsJ
         +DFEPRcq5uAIseFslj8oJwYt4Nnb3JU4VzATB6HhF+0RKH9+RMTv76c3sY+WJqc33HJH
         +W9IHeDkgYQZribZ9pS5NbuYhTXP++yGJCvKnZ6eGKk1YSsEe9SqruTlCvwrX7WzA2B8
         7PXqstX35vTM4kdZ/nZItNmytyDMyu4k3zxOuY4caxp4DD89QiXnNtXj3b1M1Z8anu2a
         714slngfAPl6BE2uEhyYKv32fdyNnGQjft5aSmws7z6ZEm2Vr3dkCfRbtCeSJYwUfiQA
         IsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839301; x=1748444101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLe/VFOV+IGfsar9eaNwR5XIUVZBcoWh0JazlUMDS3g=;
        b=rc+IxEmFZzHcPmyL54hPcMJVRIvClKETX+1ViBZ6rHruwGOiJRfKxvEfsRTiOUGaPe
         ejUc+hHAQHgIrXu/qSpVUPyRTQQn0SZV0SnQAYabszfhJoUmfbXJQAbrGJPGT3YNSgwM
         3THkVXIY9E8BTmAgaUPB2OiUnMD1u3sEe9mU27uj9PIlSQwvxbjo63n+EefEDn88QFiM
         NqyDI7m3Y/48jHEh/hAon5js7djsuFMbIo7+uC/URk/SnGhW+L3prtwawLK70PzTkWcw
         Pv+N6HIKcMU/WBJ+eivAzuDfyE9W86MKrm80yy5TTEo510CH34+IJeWhEdQSzXjSieYs
         V5sg==
X-Gm-Message-State: AOJu0Yw2D2YeZqiLvVYJgIBeOWrcVNkb0wQjW6PsBu72Qg6uLI4dD6Kv
	H3IcPngctRYK7bDCp61aQjwD4WAofpNZw/isb5xlZGdiwg2caUSZALHAarYrVzobV+Nu66tWpe6
	+ANfXctiPSYxSWUeDjFBPHK+NB6nODuhUAYKXPZ3suw==
X-Gm-Gg: ASbGncuR/8p70wysUD4Vt8vv1R1muiie/QKfgKNslHvMDn68B3jSyL3PEm9rMiCaEMI
	r9O3tTcpu8nhD1eE+MFyBCBu7cX5CPcPmL6LwtbFC4vwfmx9upmTxKK6c7apD6IFtb/G2ZewzoO
	s+L+NeTM5q1eiw7tIOadvyP3TbLDrg2yiacA==
X-Google-Smtp-Source: AGHT+IEo1PpFCKo90cnsuy5cZCEtznjaKaZNU0yrwFfKwUSppTsca4zVUQ/OOnUg0JlHolE9CqWZ95DZMNqQVMdbfNc=
X-Received: by 2002:a4a:ec49:0:b0:607:dd61:9c33 with SMTP id
 006d021491bc7-609f48646b0mr11736797eaf.1.1747839300425; Wed, 21 May 2025
 07:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787720.git.bertrand.marquis@arm.com> <f6c67adcae192bcbe9c7612fda1bef31c40bb9a0.1744787720.git.bertrand.marquis@arm.com>
In-Reply-To: <f6c67adcae192bcbe9c7612fda1bef31c40bb9a0.1744787720.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 21 May 2025 16:54:48 +0200
X-Gm-Features: AX0GCFsmxtGpIi5ZdXIRj2BMuQlwA0VWsivBb-tOdfpmLD04eqyGLTVgTlYi9wQ
Message-ID: <CAHUa44HsTzvXtNGv+iSRP5X0JX00phu4yP08CWudU3zxWA-bsg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Wed, Apr 16, 2025 at 9:40=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
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
> This patch is reorganizing the ffa_ctx structure to make clear which
> lock is protecting what parts.
>
> This patch is introducing a chain list of the ffa_ctx with a FFA Version
> negociated allowing to create the partinfo results for VMs without
> taking a lock on the global domain list in Xen.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v5:
> - remove invalid comment about 1.1 firmware support
> - rename variables from d and dom to curr_d and dest_d (Julien)
> - add a TODO in the code for potential holding for long of the CPU
>   (Julien)
> - use an atomic global variable to store the number of VMs instead of
>   recomputing the value each time (Julien)
> - add partinfo information in ffa_ctx (id, cpus and 64bit) and create a
>   chain list of ctx. Use this chain list to create the partinfo result
>   without holding a global lock to prevent concurrency issues.
> - Move some changes in a preparation patch modifying partinfo for sps to
>   reduce this patch size and make the review easier
> Changes in v4:
> - properly handle SPMC version 1.0 header size case in partinfo_get
> - switch to local counting variables instead of *pointer +=3D 1 form
> - coding style issue with missing spaces in if ()
> Changes in v3:
> - break partinfo_get in several sub functions to make the implementation
>   easier to understand and lock handling easier
> - rework implementation to check size along the way and prevent previous
>   implementation limits which had to check that the number of VMs or SPs
>   did not change
> - taint Xen as INSECURE when VM to VM is enabled
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>   a variable d pointing to the current domain and it must not be
>   shadowed.
> ---
>  xen/arch/arm/tee/Kconfig        |  11 ++++
>  xen/arch/arm/tee/ffa.c          |  47 +++++++++++++-
>  xen/arch/arm/tee/ffa_partinfo.c |  95 ++++++++++++++++++++++++---
>  xen/arch/arm/tee/ffa_private.h  | 112 ++++++++++++++++++++++++++------
>  4 files changed, 233 insertions(+), 32 deletions(-)
>
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>
>           [1] https://developer.arm.com/documentation/den0077/latest
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
>  endmenu
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..c1c4c0957091 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
>  DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>  DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>
> +struct list_head ffa_ctx_head;
> +/* Lock to protect addition/removal in ffa_ctx_head */
> +DEFINE_SPINLOCK(ffa_ctx_list_lock);
> +
> +#ifdef CONFIG_FFA_VM_TO_VM
> +atomic_t ffa_vm_count;
> +#endif
>
>  /* Used to track domains that could not be torn down immediately. */
>  static struct timer ffa_teardown_timer;
> @@ -160,10 +167,21 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>       */
>      if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
>      {
> +        uint32_t old_vers =3D ACCESS_ONCE(ctx->guest_vers);
> +
>          if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
> -            ctx->guest_vers =3D FFA_MY_VERSION;
> +            ACCESS_ONCE(ctx->guest_vers) =3D FFA_MY_VERSION;
>          else
> -            ctx->guest_vers =3D vers;
> +            ACCESS_ONCE(ctx->guest_vers) =3D vers;

What is the ACCESS_ONCE() scheme intended for?

> +
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )

If handle_version() is called concurrently on two CPUs, it might be
possible for a context to be added twice.
How about a separate flag to indicate whether a context has been added
to the list?

Cheers,
Jens

> +        {
> +            /* One more VM with FF-A support available */
> +            inc_ffa_vm_count();
> +            spin_lock(&ffa_ctx_list_lock);
> +            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> +            spin_unlock(&ffa_ctx_list_lock);
> +        }
>      }
>      ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
>  }
> @@ -345,6 +363,10 @@ static int ffa_domain_init(struct domain *d)
>      ctx->teardown_d =3D d;
>      INIT_LIST_HEAD(&ctx->shm_list);
>
> +    ctx->ffa_id =3D ffa_get_vm_id(d);
> +    ctx->num_vcpus =3D d->max_vcpus;
> +    ctx->is_64bit =3D is_64bit_domain(d);
> +
>      /*
>       * ffa_domain_teardown() will be called if ffa_domain_init() returns=
 an
>       * error, so no need for cleanup in this function.
> @@ -421,6 +443,14 @@ static int ffa_domain_teardown(struct domain *d)
>      if ( !ctx )
>          return 0;
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ACCESS_ONCE(ctx->guest_vers)=
 )
> +    {
> +        dec_ffa_vm_count();
> +        spin_lock(&ffa_ctx_list_lock);
> +        list_del(&ctx->ctx_list);
> +        spin_unlock(&ffa_ctx_list_lock);
> +    }
> +
>      ffa_rxtx_domain_destroy(d);
>      ffa_notif_domain_destroy(d);
>
> @@ -464,6 +494,18 @@ static bool ffa_probe(void)
>      printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>             FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /*
> +         * When FFA VM to VM is enabled, the current implementation does=
 not
> +         * offer any way to limit which VM can communicate with which VM=
 using
> +         * FF-A.
> +         * Signal this in the xen console and taint the system as insecu=
re.
> +         * TODO: Introduce a solution to limit what a VM can do through =
FFA.
> +         */
> +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure =
!!\n");
> +        add_taint(TAINT_MACHINE_INSECURE);
> +    }
>      /*
>       * psci_init_smccc() updates this value with what's reported by EL-3
>       * or secure world.
> @@ -538,6 +580,7 @@ static bool ffa_probe(void)
>
>      ffa_notif_init();
>      INIT_LIST_HEAD(&ffa_teardown_head);
> +    INIT_LIST_HEAD(&ffa_ctx_head);
>      init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
>
>      return true;
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index e524445c6fb8..66ea1860e97a 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -149,6 +149,68 @@ out:
>      spin_unlock(&ffa_rx_buffer_lock);
>      return ret;
>  }
> +
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
> +    struct ffa_ctx *dest_ctx, *tmp;
> +    uint32_t count =3D 0;
> +
> +    /*
> +     * There could potentially be a lot of VMs in the system and we coul=
d
> +     * hold the CPU for long here.
> +     * Right now there is no solution in FF-A specification to split
> +     * the work in this case.
> +     * TODO: Check how we could delay the work or have preemption checks=
.
> +     */
> +    list_for_each_entry_safe(dest_ctx, tmp, &ffa_ctx_head, ctx_list)
> +    {
> +        /*
> +         * Do not include an entry for the caller VM as the spec is not
> +         * clearly mandating it and it is not supported by Linux.
> +         */
> +        if ( dest_ctx !=3D curr_ctx )
> +        {
> +            /*
> +             * We do not have UUID info for VMs so use
> +             * the 1.0 structure so that we set UUIDs to
> +             * zero using memset
> +             */
> +            struct ffa_partition_info_1_0 info;
> +
> +            if  ( dst_buf > (end_buf - dst_size) )
> +            {
> +                return FFA_RET_NO_MEMORY;
> +            }
> +
> +            /*
> +             * Context might has been removed since we go it or being re=
moved
> +             * right now so we might return information for a VM not exi=
sting
> +             * anymore. This is acceptable as we return a view of the sy=
stem
> +             * which could change at any time.
> +             */
> +            info.id =3D dest_ctx->ffa_id;
> +            info.execution_context =3D dest_ctx->num_vcpus;
> +            info.partition_properties =3D FFA_PART_VM_PROP;
> +            if ( dest_ctx->is_64bit )
> +                info.partition_properties |=3D FFA_PART_PROP_AARCH64_STA=
TE;
> +
> +            memcpy(dst_buf, &info, MIN(sizeof(info), dst_size));
> +
> +            if ( dst_size > sizeof(info) )
> +                memset(dst_buf + sizeof(info), 0,
> +                       dst_size - sizeof(info));
> +
> +            dst_buf +=3D dst_size;
> +            count++;
> +        }
> +    }
> +    *vm_count =3D count;
> +
> +    return FFA_RET_OK;
> +}
> +
>  void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>  {
>      int32_t ret =3D FFA_RET_OK;
> @@ -163,7 +225,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>      };
>      uint32_t dst_size =3D 0;
>      void *dst_buf, *end_buf;
> -    uint32_t ffa_sp_count =3D 0;
> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>
>      /*
>       * If the guest is v1.0, he does not get back the entry size so we m=
ust
> @@ -190,15 +252,18 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          }
>
>          if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +        {
>              ret =3D ffa_get_sp_count(uuid, &ffa_sp_count);
> +            if ( ret )
> +                goto out;
> +        }
>
> -        goto out;
> -    }
> +        /*
> +         * Do not count the caller VM as the spec is not clearly mandati=
ng it
> +         * and it is not supported by Linux.
> +         */
> +        ffa_vm_count =3D get_ffa_vm_count() - 1;
>
> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -    {
> -        /* Just give an empty partition list to the caller */
> -        ret =3D FFA_RET_OK;
>          goto out;
>      }
>
> @@ -223,9 +288,19 @@ void ffa_handle_partition_info_get(struct cpu_user_r=
egs *regs)
>          goto out_rx_release;
>      }
>
> -    ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
> -                              dst_size);
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> +    {
> +        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_bu=
f,
> +                                  dst_size);
> +
> +        if ( ret )
> +            goto out_rx_release;
> +
> +        dst_buf +=3D ffa_sp_count * dst_size;
> +    }
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        ret =3D ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst=
_size);
>
>  out_rx_release:
>      if ( ret )
> @@ -234,7 +309,7 @@ out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
>      else
> -        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
> +        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
>  }
>
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 0a9c1082db28..52c1078b06f4 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -195,6 +195,18 @@
>   */
>  #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
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
>  /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
>  #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
>  #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> @@ -297,36 +309,66 @@ struct ffa_ctx_notif {
>  };
>
>  struct ffa_ctx {
> -    void *rx;
> -    const void *tx;
> -    struct page_info *rx_pg;
> -    struct page_info *tx_pg;
> -    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> -    unsigned int page_count;
> +    /*
> +     * Chain list of all FF-A contexts, to prevent locking access to thi=
s list,
> +     * all "unlocked" data from the structure must be set before adding =
an
> +     * entry in the list and an entry must be removed from the list befo=
re
> +     * freeing a context.
> +     */
> +    struct list_head ctx_list; /* chain list of all FF-A contexts */
> +
> +    /*
> +     * Data access unlocked (mainly for part_info_get in VM to VM).
> +     * Those should be set before the ctx is added in the list.
> +     */
> +    /* FF-A Endpoint ID */
> +    uint16_t ffa_id;
> +    uint16_t num_vcpus;
> +    bool is_64bit;
> +
> +    /*
> +     * Global data accessed atomically or using ACCES_ONCE.
> +     */
>      /* FF-A version used by the guest */
>      uint32_t guest_vers;
> -    bool rx_is_free;
> -    /* Used shared memory objects, struct ffa_shm_mem */
> -    struct list_head shm_list;
> +    struct ffa_ctx_notif notif;
> +
> +    /*
> +     * Global data accessed with lock locked.
> +     */
> +    spinlock_t lock;
> +    /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
> +    unsigned int page_count;
>      /* Number of allocated shared memory object */
>      unsigned int shm_count;
> -    struct ffa_ctx_notif notif;
> +    /* Used shared memory objects, struct ffa_shm_mem */
> +    struct list_head shm_list;
> +
>      /*
> -     * tx_lock is used to serialize access to tx
> -     * rx_lock is used to serialize access to rx_is_free
> -     * lock is used for the rest in this struct
> +     * Rx buffer, accessed with rx_lock locked.
> +     * rx_is_free is used to serialize access.
>       */
> -    spinlock_t tx_lock;
>      spinlock_t rx_lock;
> -    spinlock_t lock;
> -    /* Used if domain can't be torn down immediately */
> +    bool rx_is_free;
> +    void *rx;
> +    struct page_info *rx_pg;
> +
> +    /*
> +     * Tx buffer, access with tx_lock locked.
> +     */
> +    spinlock_t tx_lock;
> +    const void *tx;
> +    struct page_info *tx_pg;
> +
> +
> +    /*
> +     * Domain teardown handling if data shared or used by other domains
> +     * do not allow to teardown the domain immediately.
> +     */
>      struct domain *teardown_d;
>      struct list_head teardown_list;
>      s_time_t teardown_expire;
> -    /*
> -     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> -     * notified that this guest is being destroyed.
> -     */
> +    /* Keep track of SPs that should be notified of VM destruction */
>      unsigned long *vm_destroy_bitmap;
>  };
>
> @@ -334,8 +376,15 @@ extern void *ffa_rx;
>  extern void *ffa_tx;
>  extern spinlock_t ffa_rx_buffer_lock;
>  extern spinlock_t ffa_tx_buffer_lock;
> +extern spinlock_t ffa_ctx_list_lock;
>  extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>
> +extern struct list_head ffa_ctx_head;
> +
> +#ifdef CONFIG_FFA_VM_TO_VM
> +extern atomic_t ffa_vm_count;
> +#endif
> +
>  bool ffa_shm_domain_destroy(struct domain *d);
>  void ffa_handle_mem_share(struct cpu_user_regs *regs);
>  int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
> @@ -368,6 +417,29 @@ int ffa_handle_notification_set(struct cpu_user_regs=
 *regs);
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
>  int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
>
> +#ifdef CONFIG_FFA_VM_TO_VM
> +static inline uint16_t get_ffa_vm_count(void)
> +{
> +    return atomic_read(&ffa_vm_count);
> +}
> +
> +static inline void inc_ffa_vm_count(void)
> +{
> +    atomic_inc(&ffa_vm_count);
> +}
> +
> +static inline void dec_ffa_vm_count(void)
> +{
> +    ASSERT(atomic_read(&ffa_vm_count) > 0);
> +    atomic_dec(&ffa_vm_count);
> +}
> +#else
> +/* Only count the caller VM */
> +#define get_ffa_vm_count()  ((uint16_t)1UL)
> +#define inc_ffa_vm_count()  do {} while(0)
> +#define dec_ffa_vm_count()  do {} while(0)
> +#endif
> +
>  static inline uint16_t ffa_get_vm_id(const struct domain *d)
>  {
>      /* +1 since 0 is reserved for the hypervisor in FF-A */
> --
> 2.47.1
>

