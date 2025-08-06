Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE4B1CA10
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 18:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072018.1435344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhQ5-0000VC-T4; Wed, 06 Aug 2025 16:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072018.1435344; Wed, 06 Aug 2025 16:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhQ5-0000SB-P7; Wed, 06 Aug 2025 16:55:17 +0000
Received: by outflank-mailman (input) for mailman id 1072018;
 Wed, 06 Aug 2025 16:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ssa7=2S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ujhQ4-0000Ro-7m
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 16:55:16 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e5d9688-72e6-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 18:55:13 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2ea080f900cso51112fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 09:55:13 -0700 (PDT)
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
X-Inumbo-ID: 1e5d9688-72e6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754499312; x=1755104112; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjbskpErG6PF/ZvhhithjCRUhu3rhx1mLWKD+ahTvaw=;
        b=tNmcVsIG9lbAfYXsAJ8F40GGzZ/a6xPgNJSN+Gu2FbFDvCLXXqpT0kd1de/3ncOapx
         CumY/4qywzRBk2BYjJx4wBoBTHuXQCk+ftFUdXun/CHI7Igi+QoO4JUpVDgCNPnaT43j
         8e3hLQ1kKrDSf52NC0WZGhxQTcaPXm3Hg7d+Y1ILgVephE/syKR6wK7LcD/O/OkXuESB
         FNHqQWxE/OuTKVLblw4PckheZDweyQkRGxMIpzI3NFU174OxfxwPFYrht81VQ26auIQ2
         fNOK7XoMQ49LsUAlI8nWTHEHjT9Che0mg2mh/tvuaUHbTkODPtcQm1Z621y0eBna+LyA
         cdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754499312; x=1755104112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjbskpErG6PF/ZvhhithjCRUhu3rhx1mLWKD+ahTvaw=;
        b=qJhW+1GxlbyBrWlBZCQrtClXNtSj6rxWC5cZDX+XSPcIHGQzZeooDppZAFnHZ6cYaZ
         NWqFlxqmeAFzeq4gmRkXDBGsB2MqiSiN/5gMhTQrQM/20WZBG76o45L8MiBwPTE0ntpa
         DmJwV6C6Be7EO7aKl9Wb/1i8RdOu6jjMpfWkCPr7ATq7EocXH9WpSEpVEWqbzrO6QYbL
         3a6oyo164zGjzopGZq1SwPTRZeZj3LgNuKZTrsvEDpN769M0nVRdzr9NncYZLF3BaP9M
         9Q7fiiT5ypQFiMCdmZApAQFSw3rtdlpZDBjGTRXgaJN+wd9Yt8Ik5l1mroCrTqiXTb6i
         RgFw==
X-Gm-Message-State: AOJu0YyAo1bmu8gaGbgW9z+DwH38pyPL3yHt7GEe5MZ9bG/AVuC0yVsR
	l32LczQdwGnj3bkY/ENJ8xoLRUtfc1JcG6sx3Pm8qfm84JvS0pw88kJC+QZoyWfcymY1D18uGMd
	j6/D7lIqQpFo5leIunHpC0t4ummOX4GqcgfE8YATTXw==
X-Gm-Gg: ASbGnctaIFJNKeRakH6FzX0AD1km/ziCK3KShYCPcr96owqKHHFaWHWj0UCHRz87n4J
	ZqQ3QwgJ2nkCSAsCGuW1MDlNFZ18Zd48VbcBNZb7LpKLgWZAZJQRI8pYGmwwr8VEqbEwX80IY09
	5GlcA94dLphpQJOa5ldE0I5ECwg3Zsvcxl61yUv7gwmMRs9KjXovqN4JGQMuxGrULV0d+CrdcVd
	Pz+E3Fnxg==
X-Google-Smtp-Source: AGHT+IEZl3nhPK6suSZgpiA+bC5fQ6mZJu15Q6fzEKT4jdSYJLYO8FfQPGY8delqSFqebAuWmgQAT9HEZJ1iISGQnRI=
X-Received: by 2002:a05:6870:468f:b0:2c2:2f08:5e5b with SMTP id
 586e51a60fabf-30be2983277mr2335258fac.13.1754499311833; Wed, 06 Aug 2025
 09:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752754016.git.bertrand.marquis@arm.com> <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
In-Reply-To: <50224eb7cca4eaef2646ad8e33f689d912704733.1752754016.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 6 Aug 2025 17:54:59 +0100
X-Gm-Features: Ac12FXwDURYqXpcZPcIZeA29tjB94yKMv1P7wM1YMTXDv5_rVokA_CPNgi1SCvI
Message-ID: <CAHUa44Fg-0uxVTa+9Zt_Sb4C2AHzf=STvHU-wThbn0AgScmVpw@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Jul 17, 2025 at 1:11=E2=80=AFPM Bertrand Marquis
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
> negociated allowing to create the partinfo results for VMs in parallel

negotiated

> by using rwlock which only ensure addition/removal of entries are
> protected.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v7:
> - protect ffa_ctx list with a rw lock to allow several partinfo_get in
>   parallel but protect adding/removing entries.
> Changes in v6:
> - remove ACCESS_ONCE for guest_vers access and take the context lock
>   before modifying it
> - move guest_vers in context declaration to fields protected by the
>   context lock and add a comment to state that lock in only needed when
>   modifying it
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
>  xen/arch/arm/tee/Kconfig        |  11 +++
>  xen/arch/arm/tee/ffa.c          |  47 +++++++++++++
>  xen/arch/arm/tee/ffa_partinfo.c | 100 ++++++++++++++++++++++++---
>  xen/arch/arm/tee/ffa_private.h  | 117 ++++++++++++++++++++++++++------
>  4 files changed, 245 insertions(+), 30 deletions(-)
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
> index 3bbdd7168a6b..be71eda4869f 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -118,6 +118,13 @@ void *ffa_tx __read_mostly;
>  DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>  DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>
> +struct list_head ffa_ctx_head;
> +/* RW Lock to protect addition/removal and reading in ffa_ctx_head */
> +rwlock_t ffa_ctx_list_rwlock;
> +
> +#ifdef CONFIG_FFA_VM_TO_VM
> +atomic_t ffa_vm_count;
> +#endif
>
>  /* Used to track domains that could not be torn down immediately. */
>  static struct timer ffa_teardown_timer;
> @@ -151,6 +158,7 @@ static void handle_version(struct cpu_user_regs *regs=
)
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t vers =3D get_user_reg(regs, 1);
> +    uint32_t old_vers;
>
>      /*
>       * Guest will use the version it requested if it is our major and mi=
nor
> @@ -160,10 +168,23 @@ static void handle_version(struct cpu_user_regs *re=
gs)
>       */
>      if ( FFA_VERSION_MAJOR(vers) =3D=3D FFA_MY_VERSION_MAJOR )
>      {
> +        spin_lock(&ctx->lock);
> +        old_vers =3D ctx->guest_vers;
> +
>          if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
>              ctx->guest_vers =3D FFA_MY_VERSION;
>          else
>              ctx->guest_vers =3D vers;
> +        spin_unlock(&ctx->lock);
> +
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !old_vers )
> +        {
> +            /* One more VM with FF-A support available */
> +            inc_ffa_vm_count();
> +            write_lock(&ffa_ctx_list_rwlock);
> +            list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
> +            write_unlock(&ffa_ctx_list_rwlock);
> +        }
>      }
>      ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
>  }
> @@ -345,6 +366,10 @@ static int ffa_domain_init(struct domain *d)
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
> @@ -421,6 +446,14 @@ static int ffa_domain_teardown(struct domain *d)
>      if ( !ctx )
>          return 0;
>
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ctx->guest_vers )
> +    {
> +        dec_ffa_vm_count();
> +        write_lock(&ffa_ctx_list_rwlock);
> +        list_del(&ctx->ctx_list);
> +        write_unlock(&ffa_ctx_list_rwlock);
> +    }
> +
>      ffa_rxtx_domain_destroy(d);
>      ffa_notif_domain_destroy(d);
>
> @@ -464,6 +497,18 @@ static bool ffa_probe(void)
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
> @@ -538,6 +583,8 @@ static bool ffa_probe(void)
>
>      ffa_notif_init();
>      INIT_LIST_HEAD(&ffa_teardown_head);
> +    INIT_LIST_HEAD(&ffa_ctx_head);
> +    rwlock_init(&ffa_ctx_list_rwlock);
>      init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
>
>      return true;
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index dfa0b23eaf38..fa56b1587e3b 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -150,6 +150,73 @@ out:
>      return ret;
>  }
>
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
> +    struct ffa_ctx *dest_ctx;
> +    uint32_t count =3D 0;
> +    int32_t ret =3D FFA_RET_OK;
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
> +    read_lock(&ffa_ctx_list_rwlock);
> +    list_for_each_entry(dest_ctx, &ffa_ctx_head, ctx_list)
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
> +                ret =3D FFA_RET_NO_MEMORY;
> +                goto out;
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
> +out:
> +    read_unlock(&ffa_ctx_list_rwlock);
> +
> +    return ret;
> +}
> +
>  void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
>  {
>      int32_t ret =3D FFA_RET_OK;
> @@ -164,7 +231,7 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
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
> @@ -191,15 +258,18 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> @@ -224,9 +294,19 @@ void ffa_handle_partition_info_get(struct cpu_user_r=
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
> @@ -235,7 +315,7 @@ out:
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
> index 0a9c1082db28..1a1dcabcdc28 100644
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
> @@ -297,36 +309,72 @@ struct ffa_ctx_notif {
>  };
>
>  struct ffa_ctx {
> -    void *rx;
> -    const void *tx;
> -    struct page_info *rx_pg;
> -    struct page_info *tx_pg;
> +    /*
> +     * Chain list of all FF-A contexts.
> +     * As we might have several read from the list of context through pa=
rallel
> +     * partinfo_get but fewer additions/removal as those happen only dur=
ing a
> +     * version negociation or guest shutdown, access to this list is pro=
tected

negotiation

With these two typos fixed, please apply:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> +     * through a rwlock (addition/removal with write lock, reading throu=
gh a
> +     * read lock).
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
> +    struct ffa_ctx_notif notif;
> +
> +    /*
> +     * Global data accessed with lock locked.
> +     */
> +    spinlock_t lock;
> +    /*
> +     * FF-A version negociated by the guest, only modifications to
> +     * this field are done with the lock held as this is expected to
> +     * be done once at init by a guest.
> +     */
> +    uint32_t guest_vers;
>      /* Number of 4kB pages in each of rx/rx_pg and tx/tx_pg */
>      unsigned int page_count;
> -    /* FF-A version used by the guest */
> -    uint32_t guest_vers;
> -    bool rx_is_free;
> -    /* Used shared memory objects, struct ffa_shm_mem */
> -    struct list_head shm_list;
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
> @@ -336,6 +384,12 @@ extern spinlock_t ffa_rx_buffer_lock;
>  extern spinlock_t ffa_tx_buffer_lock;
>  extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>
> +extern struct list_head ffa_ctx_head;
> +extern rwlock_t ffa_ctx_list_rwlock;
> +#ifdef CONFIG_FFA_VM_TO_VM
> +extern atomic_t ffa_vm_count;
> +#endif
> +
>  bool ffa_shm_domain_destroy(struct domain *d);
>  void ffa_handle_mem_share(struct cpu_user_regs *regs);
>  int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
> @@ -368,6 +422,29 @@ int ffa_handle_notification_set(struct cpu_user_regs=
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

