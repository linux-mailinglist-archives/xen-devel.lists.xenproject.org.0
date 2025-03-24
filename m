Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D3A6D842
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925286.1328160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweyy-0007Bv-Ga; Mon, 24 Mar 2025 10:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925286.1328160; Mon, 24 Mar 2025 10:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tweyy-00078q-Dk; Mon, 24 Mar 2025 10:24:36 +0000
Received: by outflank-mailman (input) for mailman id 925286;
 Mon, 24 Mar 2025 10:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9GC=WL=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1tweyw-00078i-WC
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:24:35 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d22935a-089a-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:24:33 +0100 (CET)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3f556b90790so1325958b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:24:33 -0700 (PDT)
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
X-Inumbo-ID: 2d22935a-089a-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742811872; x=1743416672; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/pUKODn2+hwGi+4N2ezSS6ELThbK7tnU1hURWL5eeo=;
        b=zvkEae6GkOPhm10+wec0rmLiRrtkLtYOYUV3T+GXcpCGw65fdCR5vwnNBM2yAuMUlx
         j1Z9MnpBSGMXM4SSdyOgaZn90BjQGMm7ipZ2Hw7nd1ZjlPcrS2xJpjT3+psmEU8oANva
         WdqeyCShm5PBfBbJbNvBOlaWeF3q6TmHdsd5YveDyWmfbKsxYsKN+McjIC5/xNNWpQZ5
         1ZRzp7vgXIYmErrTuJDt7DkbbmFX26AhogCWUiQ1Nb7Vh2IRzQxCugxAo3OVrwIEraDY
         syvq3Q2wrbztNxj4boRo5ruliz4HAp6n7f1XZ2bDKND/irbEyXEfqBJ6yoNizTQ9Ku1e
         frwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742811872; x=1743416672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/pUKODn2+hwGi+4N2ezSS6ELThbK7tnU1hURWL5eeo=;
        b=vyBqCXdPuvfCbCLmVhfHPhCvtoOPfxp2lulDsJwR8tzGQFT4d1QNE2yMTB+MaMoICy
         3M+d4MSzrFnhHsgjovgq5/0wxEJshGlsYJdIbvMkaz8AXKa4RUDI7k87Hu5v6hl1Yi5E
         qg0aMXiXMMbKfHXfuPR2m11LlsrhRULKermYem+4TQ80WBnPxQzbRZt3gOJ4PZ6GNCJy
         KOI14eMxKqNX+vlFTs4pKZ30jczToMib8/JrLwv9G3fDtCKggrsvs2f5w55GxxFiyr7t
         EBvbBIUL7ILCXt9SJvAU6coGl4meqFoJLVYzFUdB+bC06po4NaR8MQRqrfDmOLoVP9cc
         gVug==
X-Gm-Message-State: AOJu0Yx0/C2M0rvcpxXlhBCuNxidRr69KwrFEMj4iejvtjFHrWBTMR9F
	fBRB6iesxOyQ86h3WckjNilG52pYP5oTTFXt2Af+a72N8Q2vVNOaGfC+o5yiWAymQuPw0GJnIjb
	ctTy0xmwfkwtvMNaTcntiOqD8deobVuE5CwljHQ==
X-Gm-Gg: ASbGncucJ70nxioKhemyfhi0+YwuMA+VRzofaUd+H7l4JHBMr5/TOdVUhm+hDVyHLwO
	Fc2wEUIHue6oQA9Gb1K42oOd64/XxF2kFOApRdD1RzaePU3V2E8sTv4V35GrLQ8M+U3uUoQ6Xkn
	28fn9Y+MQSWEZwkkissChrzbvpoZs=
X-Google-Smtp-Source: AGHT+IHhHFezeD9YppmiEul82Nb/VWyXCGgiJvtneu1NTpd6rQmm8OjnwORy+XwWC2XObCPQbKtHqaFd/weDtX9PaNc=
X-Received: by 2002:a05:6808:e89:b0:3f8:889e:c13c with SMTP id
 5614622812f47-3febf6f0d39mr8812101b6e.1.1742811871547; Mon, 24 Mar 2025
 03:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742570590.git.bertrand.marquis@arm.com> <5fbf7b0e48a652bfe1f7cd041105cb4992924990.1742570590.git.bertrand.marquis@arm.com>
In-Reply-To: <5fbf7b0e48a652bfe1f7cd041105cb4992924990.1742570590.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 24 Mar 2025 11:24:20 +0100
X-Gm-Features: AQ5f1JrpFAfrc9uQcuuxYP0VAxqyg3gEPNV-6K8kONx-KJ8aUxaZX0skXqo8gYY
Message-ID: <CAHUa44HNZ7V4sLj78zzdaK5AfYhC1-9S6uN5yfUB3kSPTmnbTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:15=E2=80=AFAM Bertrand Marquis
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
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
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
>  xen/arch/arm/tee/Kconfig        |  11 ++
>  xen/arch/arm/tee/ffa.c          |  12 ++
>  xen/arch/arm/tee/ffa_partinfo.c | 270 +++++++++++++++++++++-----------
>  xen/arch/arm/tee/ffa_private.h  |  12 ++
>  4 files changed, 214 insertions(+), 91 deletions(-)
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
> index 3bbdd7168a6b..e41ab5f8ada6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -464,6 +464,18 @@ static bool ffa_probe(void)
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
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index c0510ceb8338..93847b36cf2f 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -63,9 +63,152 @@ static int32_t ffa_partition_info_get(uint32_t *uuid,=
 uint32_t flags,
>      return ret;
>  }
>
> -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> +{
> +    uint32_t src_size;
> +
> +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLA=
G,
> +                                  sp_count, &src_size);
> +}
> +
> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> +                                   void *dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
>  {
>      int32_t ret;
> +    uint32_t src_size, real_sp_count;
> +    void *src_buf =3D ffa_rx;
> +
> +    *sp_count =3D 0;
> +
> +    /* Do we have a RX buffer with the SPMC */
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    /* We need to use the RX buffer to receive the list */
> +    spin_lock(&ffa_rx_buffer_lock);
> +
> +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> +    if ( ret )
> +        goto out;
> +
> +    /* We now own the RX buffer */
> +
> +    /* We only support a 1.1 firmware version */
> +    if ( src_size !=3D sizeof(struct ffa_partition_info_1_1) )

Before this change, we supported firmware version 1.0. It looks like
the code below should work with "src_size < sizeof(struct
ffa_partition_info_1_0)" as we had before.

> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_release;
> +    }
> +
> +    for ( uint32_t sp_num =3D 0; sp_num < real_sp_count; sp_num++ )
> +    {
> +        struct ffa_partition_info_1_1 *fpi =3D src_buf;
> +
> +        /* filter out SP not following bit 15 convention if any */
> +        if ( FFA_ID_IS_SECURE(fpi->id) )
> +        {
> +            if ( dst_buf + dst_size > end_buf )
> +            {
> +                ret =3D FFA_RET_NO_MEMORY;
> +                goto out_release;
> +            }
> +
> +            memcpy(dst_buf, src_buf, dst_size);
> +            dst_buf +=3D dst_size;
> +            *sp_count +=3D 1;

This is subtle and easily misunderstood. Normally you'd use the ++
operator when incrementing by one, but that doesn't work as intended
unless written as (*sp_count)++. I prefer using a local variable and
updating *sp_count with a normal assignment when the loop is done. If
you agree, please update ffa_get_vm_partinfo() too since it has the
same pattern.

Cheers,
Jens

> +        }
> +
> +        src_buf +=3D src_size;
> +    }
> +
> +out_release:
> +    ffa_hyp_rx_release();
> +out:
> +    spin_unlock(&ffa_rx_buffer_lock);
> +    return ret;
> +}
> +
> +static uint32_t ffa_get_vm_count(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct domain *dom;
> +    uint32_t vm_count =3D 0;
> +
> +    /* Count the number of VM with FF-A support */
> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain( dom )
> +    {
> +        struct ffa_ctx *vm =3D dom->arch.tee;
> +
> +        if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
> +            vm_count++;
> +    }
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    return vm_count;
> +}
> +
> +static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> +                                   void *end_buf, uint32_t dst_size)
> +{
> +    struct domain *d =3D current->domain;
> +    struct domain *dom;
> +    int32_t ret =3D FFA_RET_OK;
> +
> +    *vm_count =3D 0;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +    for_each_domain( dom )
> +    {
> +        struct ffa_ctx *vm =3D dom->arch.tee;
> +
> +        /*
> +         * we do not add the VM calling to the list and only VMs with
> +         * FF-A support
> +         */
> +        if ( dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0 )
> +        {
> +            /*
> +             * We do not have UUID info for VMs so use
> +             * the 1.0 structure so that we set UUIDs to
> +             * zero using memset
> +             */
> +            struct ffa_partition_info_1_0 srcvm;
> +
> +            if  ( dst_buf + dst_size > end_buf )
> +            {
> +                ret =3D FFA_RET_NO_MEMORY;
> +                goto out;
> +            }
> +
> +            srcvm.id =3D ffa_get_vm_id(dom);
> +            srcvm.execution_context =3D dom->max_vcpus;
> +            srcvm.partition_properties =3D FFA_PART_VM_PROP;
> +            if ( is_64bit_domain(dom) )
> +                srcvm.partition_properties |=3D FFA_PART_PROP_AARCH64_ST=
ATE;
> +
> +            memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
> +
> +            if ( dst_size > sizeof(srcvm) )
> +                memset(dst_buf + sizeof(srcvm), 0,
> +                       dst_size - sizeof(srcvm));
> +
> +            dst_buf +=3D dst_size;
> +            *vm_count +=3D 1;
> +        }
> +    }
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
> +    int32_t ret =3D FFA_RET_OK;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t flags =3D get_user_reg(regs, 5);
> @@ -75,9 +218,9 @@ void ffa_handle_partition_info_get(struct cpu_user_reg=
s *regs)
>          get_user_reg(regs, 3),
>          get_user_reg(regs, 4),
>      };
> -    uint32_t src_size, dst_size;
> -    void *dst_buf;
> -    uint32_t ffa_sp_count =3D 0;
> +    uint32_t dst_size =3D 0;
> +    void *dst_buf, *end_buf;
> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>
>      /*
>       * If the guest is v1.0, he does not get back the entry size so we m=
ust
> @@ -89,118 +232,63 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>      else
>          dst_size =3D sizeof(struct ffa_partition_info_1_1);
>
> -    /*
> -     * FF-A v1.0 has w5 MBZ while v1.1 allows
> -     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> -     *
> -     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
> -     * rxtx buffer so do the partition_info_get directly.
> -     */
> -    if ( flags =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
> -         ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> +    /* Only count requested */
> +    if ( flags )
>      {
> +        /*
> +         * FF-A v1.0 has w5 MBZ while v1.1 allows
> +         * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +         */
> +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 ||
> +                flags !=3D FFA_PARTITION_INFO_GET_COUNT_FLAG )
> +        {
> +            ret =3D FFA_RET_INVALID_PARAMETERS;
> +            goto out;
> +        }
> +
>          if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -            ret =3D ffa_partition_info_get(uuid, flags, &ffa_sp_count,
> -                                        &src_size);
> -        else
> -            ret =3D FFA_RET_OK;
> +        {
> +            ret =3D ffa_get_sp_count(uuid, &ffa_sp_count);
> +            if ( ret )
> +                goto out;
> +        }
>
> -        goto out;
> -    }
> +        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +            ffa_vm_count =3D ffa_get_vm_count();
>
> -    if ( flags )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out;
> -    }
> -
> -    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
> -    {
> -        /* Just give an empty partition list to the caller */
> -        ret =3D FFA_RET_OK;
>          goto out;
>      }
>
> +    /* Get the RX buffer to write the list of partitions */
>      ret =3D ffa_rx_acquire(d);
>      if ( ret !=3D FFA_RET_OK )
>          goto out;
>
>      dst_buf =3D ctx->rx;
> +    end_buf =3D ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
>
> -    if ( !ffa_rx )
> +    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
> -        ret =3D FFA_RET_DENIED;
> -        goto out_rx_release;
> -    }
> -
> -    spin_lock(&ffa_rx_buffer_lock);
> -
> -    ret =3D ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
> +        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_bu=
f,
> +                                  dst_size);
>
> -    if ( ret )
> -        goto out_rx_hyp_unlock;
> +        if ( ret )
> +            goto out_rx_release;
>
> -    /*
> -     * ffa_partition_info_get() succeeded so we now own the RX buffer we
> -     * share with the SPMC. We must give it back using ffa_hyp_rx_releas=
e()
> -     * once we've copied the content.
> -     */
> -
> -    /* we cannot have a size smaller than 1.0 structure */
> -    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
> -    {
> -        ret =3D FFA_RET_NOT_SUPPORTED;
> -        goto out_rx_hyp_release;
> -    }
> -
> -    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
> -    {
> -        ret =3D FFA_RET_NO_MEMORY;
> -        goto out_rx_hyp_release;
> +        dst_buf +=3D ffa_sp_count * dst_size;
>      }
>
> -    if ( ffa_sp_count > 0 )
> -    {
> -        uint32_t n, n_limit =3D ffa_sp_count;
> -        void *src_buf =3D ffa_rx;
> -
> -        /* copy the secure partitions info */
> -        for ( n =3D 0; n < n_limit; n++ )
> -        {
> -            struct ffa_partition_info_1_1 *fpi =3D src_buf;
> -
> -            /* filter out SP not following bit 15 convention if any */
> -            if ( FFA_ID_IS_SECURE(fpi->id) )
> -            {
> -                memcpy(dst_buf, src_buf, dst_size);
> -                dst_buf +=3D dst_size;
> -            }
> -            else
> -                ffa_sp_count--;
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +        ret =3D ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst=
_size);
>
> -            src_buf +=3D src_size;
> -        }
> -    }
> -
> -out_rx_hyp_release:
> -    ffa_hyp_rx_release();
> -out_rx_hyp_unlock:
> -    spin_unlock(&ffa_rx_buffer_lock);
>  out_rx_release:
> -    /*
> -     * The calling VM RX buffer only contains data to be used by the VM =
if the
> -     * call was successful, in which case the VM has to release the buff=
er
> -     * once it has used the data.
> -     * If something went wrong during the call, we have to release the R=
X
> -     * buffer back to the SPMC as the VM will not do it.
> -     */
> -    if ( ret !=3D FFA_RET_OK )
> +    if ( ret )
>          ffa_rx_release(d);
>  out:
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
> index c4cd65538908..bd6877d8c632 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -187,6 +187,18 @@
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
> --
> 2.47.1
>

