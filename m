Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC5FCB04B6
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 15:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181789.1504787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSylw-00088Q-V1; Tue, 09 Dec 2025 14:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181789.1504787; Tue, 09 Dec 2025 14:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSylw-00086U-RA; Tue, 09 Dec 2025 14:33:00 +0000
Received: by outflank-mailman (input) for mailman id 1181789;
 Tue, 09 Dec 2025 14:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSylu-00086O-W6
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 14:32:59 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3e2d81a-d50b-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 15:32:57 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-656b4881f55so3272755eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 06:32:57 -0800 (PST)
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
X-Inumbo-ID: f3e2d81a-d50b-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765290775; x=1765895575; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrEbIcaFUlerglvu1z8XnSK4ozsVICy6q92ovgflphE=;
        b=ltB/yNnwnWdpgYLWtgkPeCrTVEF0h1cuDaegUz4R21pYCKe78t42NPRGLCS8ADAKxE
         o2snhO0zY1mVzlzWQInhDgAyDM617UmOJdIUTMIs3/FROyi19MS/VJODw/wSR5oi0TFZ
         JnMSGqjI5jyYm9KuWVLQunBXaiPFEX1q2G/tEMFd5gtOjdOR7RO6ylARUhH2mMEnpwfJ
         BcN+ARzjIoO2GPMIiUL5A3u03Bpr3V2GfEdXWvqfN31vME2GRebIONhfXNVGqLd9eyE+
         CH5iSzHSDN/98WO43dtUHbstWRm7oXeu8wuFHlrC0seYa7n+QODcZV6Zw9wRXHTkmree
         c/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290775; x=1765895575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MrEbIcaFUlerglvu1z8XnSK4ozsVICy6q92ovgflphE=;
        b=oktyvWst/qHMaBAaGZQVM1CCybFCNM4u5yl/5MEjD7RArIN9ZEStjbKipPTrCSptAZ
         2RcraKHfbM1l+2bhg61oBgPzOAMfWppZoaiuDoTVV9c+cYz8pBAL9gb8uJzq1kYf78Y7
         pjpECt4GLOz4+OmgGigEGB3NNxxmhTerUuEKliqZFoOcVm/akQrCQc7Se++/5ghIvvuu
         yFvWQP+GEbxft0VyCD7G+gioGFQKsdzGhPjufQy+HSrdkupbcExyeTbf9vgffGcFzFQt
         XrIvDk8KDhWox9Xq6FFd3MYkC0WJTNpAgEnLIqR+Lvt8RogsYdDxgS2ipJs4dEKxreCC
         UUSg==
X-Gm-Message-State: AOJu0YzrtaT8z4TQmpqJRlU+eBYOM/QyfifwAO4NxrCbjg+30wFvFF6H
	7OdnHjdyZ5wn/nRwd5VmjBw46P261zpXUfZg+pGfpMWDivnAo2FkLsP7tPcW2v8QW5TMwz8sue1
	eh5E0ooWfNZNuy8ZlmURG/lBOnoy5d55euKJhd+ea4w==
X-Gm-Gg: ASbGncsjNgsdBdgpYcLJuULTCIFEPuhLcHquZbxzWW3gpKp2nDAHbMaPV7qCrl2dKSH
	mkz+Bp7TFxrQQ6306b6Zezxd+fDxLBxg5oLJu62efWlsyK2NgRBmnud+DTkzDvbZiDqrOE/lcTQ
	QKLj+WBxaaSfRB3V+GYn/OL9lZ29KdAs41muET2qxhFJP94KP9cds59rvEQyiwYjuO6tv9tPJW4
	VQ2z3lbsBgnTpLCQFkQ7VY5h8H5xbE8K0tEKeA2GiQAFRlmxXC5959obWOJL5LzJusW++HPbJZ4
	GHXvlHoPC/WZM+TW2G+mCPx5nyTFO4ddQs+3hNDQkuDi/oGxwIBbtpeBX15s9Q==
X-Google-Smtp-Source: AGHT+IGbHFcbggvvLy4qFZqYsquqeJ2GR/w46U6BTcQ0srKK4rd1Wu6GmfB4fYrOeQzuj8j7YvRaZTRxmFvaFI7TkCs=
X-Received: by 2002:a4a:e841:0:b0:659:9a49:907d with SMTP id
 006d021491bc7-6599a982eabmr4999773eaf.72.1765290775416; Tue, 09 Dec 2025
 06:32:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <480cc4c4c0a46fc7a812de5c7aa6365af220e9f2.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <480cc4c4c0a46fc7a812de5c7aa6365af220e9f2.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 15:32:42 +0100
X-Gm-Features: AQt7F2puSVpAcq80FxNVk28f4msX_3iID7w2FHQSJsmWjZecPOh-FDpwI0AjyvI
Message-ID: <CAHUa44GHiSB0KQXsjsRfdO3moBqmxWJDYb2WCTRH8hdMsHKmjQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] xen/arm: ffa: add UUID helpers for partition info
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Introduce struct ffa_uuid together with nil/equality/set helpers, and
> use it end-to-end in the partition-info plumbing.
>
> The SP and VM enumeration paths now build UUIDs from the guest
> registers, call a new ffa_copy_info() helper and ensure non-nil UUID
> queries only return matching SP entries, relying on firmware UUID
> filtering. VM entries are skipped because we do not track per-VM UUIDs.
>
> Count requests and subscriber initialisation are updated accordingly so
> firmware is always called with an explicit UUID. This keeps count and
> listing requests aligned with the FF-A v1.1 rules while preserving the
> Linux compatibility workaround for v1.2 requesters.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - Use GENMASK in ffa_partition_info_get instead of explicit values.
> - Use ACCESS_ONCE to read guest_vers
> - use is_64bit_domain to get current domain 32/64 bit support
> ---
>  xen/arch/arm/tee/ffa_partinfo.c | 209 ++++++++++++++++++++------------
>  xen/arch/arm/tee/ffa_private.h  |  21 ++++
>  2 files changed, 154 insertions(+), 76 deletions(-)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index c9faf5415853..bf906ed0c88f 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -33,7 +33,7 @@ static uint16_t subscr_vm_created_count __read_mostly;
>  static uint16_t *subscr_vm_destroyed __read_mostly;
>  static uint16_t subscr_vm_destroyed_count __read_mostly;
>
> -static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
> +static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t fla=
gs,
>                                        uint32_t *count, uint32_t *fpi_siz=
e)
>  {
>      struct arm_smccc_1_2_regs arg =3D {
> @@ -41,15 +41,12 @@ static int32_t ffa_partition_info_get(uint32_t *uuid,=
 uint32_t flags,
>          .a5 =3D flags,
>      };
>      struct arm_smccc_1_2_regs resp;
> -    uint32_t ret;
> +    int32_t ret;
>
> -    if ( uuid )
> -    {
> -        arg.a1 =3D uuid[0];
> -        arg.a2 =3D uuid[1];
> -        arg.a3 =3D uuid[2];
> -        arg.a4 =3D uuid[3];
> -    }
> +    arg.a1 =3D uuid.val[0] & GENMASK(31, 0);
> +    arg.a2 =3D (uuid.val[0] >> 32) & GENMASK(31, 0);
> +    arg.a3 =3D uuid.val[1] & GENMASK(31, 0);
> +    arg.a4 =3D (uuid.val[1] >> 32) & GENMASK(31, 0);
>
>      arm_smccc_1_2_smc(&arg, &resp);
>
> @@ -63,7 +60,26 @@ static int32_t ffa_partition_info_get(uint32_t *uuid, =
uint32_t flags,
>      return ret;
>  }
>
> -static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> +static int32_t ffa_copy_info(void **dst, void *dst_end, const void *src,
> +                             uint32_t dst_size, uint32_t src_size)
> +{
> +    uint8_t *pos =3D *dst;
> +    uint8_t *end =3D dst_end;
> +
> +    if ( pos > end - dst_size )
> +        return FFA_RET_NO_MEMORY;
> +
> +    memcpy(pos, src, MIN(dst_size, src_size));
> +
> +    if ( dst_size > src_size )
> +        memset(pos + src_size, 0, dst_size - src_size);
> +
> +    *dst =3D pos + dst_size;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count=
)
>  {
>      uint32_t src_size;
>
> @@ -71,8 +87,8 @@ static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_=
t *sp_count)
>                                    sp_count, &src_size);
>  }
>
> -static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> -                                   void *dst_buf, void *end_buf,
> +static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_co=
unt,
> +                                   void **dst_buf, void *end_buf,
>                                     uint32_t dst_size)
>  {
>      int32_t ret;
> @@ -120,17 +136,18 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, =
uint32_t *sp_count,
>          /* filter out SP not following bit 15 convention if any */
>          if ( FFA_ID_IS_SECURE(fpi->id) )
>          {
> -            if ( dst_buf > (end_buf - dst_size) )
> -            {
> -                ret =3D FFA_RET_NO_MEMORY;
> -                goto out;
> -            }
> +            /*
> +             * If VM is 1.0 but firmware is 1.1 we could have several en=
tries
> +             * with the same ID but different UUIDs. In this case the VM=
 will
> +             * get a list with several time the same ID.
> +             * This is a non-compliance to the specification but 1.0 VMs=
 should
> +             * handle that on their own to simplify Xen implementation.
> +             */
>
> -            memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
> -            if ( dst_size > src_size )
> -                memset(dst_buf + src_size, 0, dst_size - src_size);
> +            ret =3D ffa_copy_info(dst_buf, end_buf, src_buf, dst_size, s=
rc_size);
> +            if ( ret )
> +                goto out;
>
> -            dst_buf +=3D dst_size;
>              count++;
>          }
>
> @@ -144,69 +161,90 @@ out:
>      return ret;
>  }
>
> -static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
> -                                   void *end_buf, uint32_t dst_size)
> +static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t *vm_co=
unt,
> +                                   void **dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
>  {
> -    struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *curr_ctx =3D d->arch.tee;
>      struct ffa_ctx *dest_ctx;
>      uint32_t count =3D 0;
>      int32_t ret =3D FFA_RET_OK;
> +    /*
> +     * We do not have UUID info for VMs so use the 1.0 structure so that=
 we set
> +     * UUIDs to zero using memset
> +     */
> +    struct ffa_partition_info_1_0 info;
>
>      /*
> -     * There could potentially be a lot of VMs in the system and we coul=
d
> -     * hold the CPU for long here.
> -     * Right now there is no solution in FF-A specification to split
> -     * the work in this case.
> -     * TODO: Check how we could delay the work or have preemption checks=
.
> +     * We do not have protocol UUIDs for VMs so if a request has non Nil=
 UUID
> +     * we must return an empty list.
>       */
> -    read_lock(&ffa_ctx_list_rwlock);
> -    list_for_each_entry(dest_ctx, &ffa_ctx_head, ctx_list)
> +    if ( !ffa_uuid_is_nil(uuid) )
> +    {
> +        *vm_count =3D 0;
> +        return FFA_RET_OK;
> +    }
> +
> +    /*
> +     * Workaround for Linux FF-A Driver not accepting to have its own
> +     * entry in the list before FF-A v1.2 was supported.
> +     * This workaround is generally acceptable for other implementations
> +     * as the specification was not completely clear on wether or not
> +     * the requester endpoint information should be included or not
> +     */
> +    if ( ACCESS_ONCE(curr_ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> +    {
> +        /* Add caller VM information */
> +        info.id =3D curr_ctx->ffa_id;
> +        info.execution_context =3D curr_ctx->num_vcpus;
> +        info.partition_properties =3D FFA_PART_VM_PROP;
> +        if ( is_64bit_domain(d) )
> +            info.partition_properties |=3D FFA_PART_PROP_AARCH64_STATE;
> +
> +        ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size, sizeof(=
info));
> +        if ( ret )
> +            return ret;
> +
> +        count++;
> +    }
> +
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
>      {
>          /*
> -         * Do not include an entry for the caller VM as the spec is not
> -         * clearly mandating it and it is not supported by Linux.
> +         * There could potentially be a lot of VMs in the system and we =
could
> +         * hold the CPU for long here.
> +         * Right now there is no solution in FF-A specification to split
> +         * the work in this case.
> +         * TODO: Check how we could delay the work or have preemption ch=
ecks.
>           */
> -        if ( dest_ctx !=3D curr_ctx )
> +        read_lock(&ffa_ctx_list_rwlock);
> +        list_for_each_entry(dest_ctx, &ffa_ctx_head, ctx_list)
>          {
> -            /*
> -             * We do not have UUID info for VMs so use
> -             * the 1.0 structure so that we set UUIDs to
> -             * zero using memset
> -             */
> -            struct ffa_partition_info_1_0 info;
> +            /* Ignore the caller entry as it was already added */
> +            if ( dest_ctx =3D=3D curr_ctx )
> +                continue;
>
> -            if  ( dst_buf > (end_buf - dst_size) )
> -            {
> -                ret =3D FFA_RET_NO_MEMORY;
> -                goto out;
> -            }
> -
> -            /*
> -             * Context might has been removed since we go it or being re=
moved
> -             * right now so we might return information for a VM not exi=
sting
> -             * anymore. This is acceptable as we return a view of the sy=
stem
> -             * which could change at any time.
> -             */
>              info.id =3D dest_ctx->ffa_id;
>              info.execution_context =3D dest_ctx->num_vcpus;
>              info.partition_properties =3D FFA_PART_VM_PROP;
>              if ( dest_ctx->is_64bit )
>                  info.partition_properties |=3D FFA_PART_PROP_AARCH64_STA=
TE;
>
> -            memcpy(dst_buf, &info, MIN(sizeof(info), dst_size));
> -
> -            if ( dst_size > sizeof(info) )
> -                memset(dst_buf + sizeof(info), 0,
> -                       dst_size - sizeof(info));
> +            ret =3D ffa_copy_info(dst_buf, end_buf, &info, dst_size,
> +                                sizeof(info));
> +            if ( ret )
> +            {
> +                read_unlock(&ffa_ctx_list_rwlock);
> +                return ret;
> +            }
>
> -            dst_buf +=3D dst_size;
>              count++;
>          }
> +        read_unlock(&ffa_ctx_list_rwlock);
>      }
> -    *vm_count =3D count;
>
> -out:
> -    read_unlock(&ffa_ctx_list_rwlock);
> +    *vm_count =3D count;
>
>      return ret;
>  }
> @@ -217,17 +255,18 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      uint32_t flags =3D get_user_reg(regs, 5);
> -    uint32_t uuid[4] =3D {
> -        get_user_reg(regs, 1),
> -        get_user_reg(regs, 2),
> -        get_user_reg(regs, 3),
> -        get_user_reg(regs, 4),
> -    };
> +    struct ffa_uuid uuid;
>      uint32_t dst_size =3D 0;
>      size_t buf_size;
>      void *dst_buf, *end_buf;
>      uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>
> +    ffa_uuid_set(&uuid,
> +             get_user_reg(regs, 1),
> +             get_user_reg(regs, 2),
> +             get_user_reg(regs, 3),
> +             get_user_reg(regs, 4));
> +
>      /*
>       * If the guest is v1.0, he does not get back the entry size so we m=
ust
>       * use the v1.0 structure size in the destination buffer.
> @@ -260,10 +299,23 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>          }
>
>          /*
> -         * Do not count the caller VM as the spec is not clearly mandati=
ng it
> -         * and it is not supported by Linux.
> +         * We do not have protocol UUIDs for VMs so if a request has non=
 Nil
> +         * UUID we must return a vm_count of 0
>           */
> -        ffa_vm_count =3D get_ffa_vm_count() - 1;
> +        if ( ffa_uuid_is_nil(uuid) )
> +        {
> +            ffa_vm_count =3D get_ffa_vm_count();
> +
> +            /*
> +             * Workaround for Linux FF-A Driver not accepting to have it=
s own
> +             * entry in the list before FF-A v1.2 was supported.
> +             * This workaround is generally acceptable for other impleme=
ntations
> +             * as the specification was not completely clear on wether o=
r not
> +             * the requester endpoint information should be included or =
not
> +             */
> +            if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
> +                ffa_vm_count -=3D 1;
> +        }
>
>          goto out;
>      }
> @@ -290,17 +342,15 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs)
>
>      if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>      {
> -        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_bu=
f,
> +        ret =3D ffa_get_sp_partinfo(uuid, &ffa_sp_count, &dst_buf, end_b=
uf,
>                                    dst_size);
>
>          if ( ret )
>              goto out_rx_release;
> -
> -        dst_buf +=3D ffa_sp_count * dst_size;
>      }
>
> -    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> -        ret =3D ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst=
_size);
> +    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
> +                              dst_size);
>
>  out_rx_release:
>      if ( ret )
> @@ -309,7 +359,13 @@ out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
>      else
> +    {
> +        /* Size should be 0 on count request and was not supported in 1.=
0 */
> +        if ( flags || ACCESS_ONCE(ctx->guest_vers) =3D=3D FFA_VERSION_1_=
0 )
> +            dst_size =3D 0;
> +
>          ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
> +    }
>  }
>
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> @@ -450,6 +506,7 @@ bool ffa_partinfo_init(void)
>      uint32_t count;
>      int32_t e;
>      void *spmc_rx;
> +    struct ffa_uuid nil_uuid =3D { .val =3D { 0ULL, 0ULL } };
>
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
>           !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
> @@ -459,7 +516,7 @@ bool ffa_partinfo_init(void)
>      if (!spmc_rx)
>          return false;
>
> -    e =3D ffa_partition_info_get(NULL, 0, &count, &fpi_size);
> +    e =3D ffa_partition_info_get(nil_uuid, 0, &count, &fpi_size);
>      if ( e )
>      {
>          printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index a18e56b05bbb..d883114948b1 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -307,6 +307,10 @@ struct ffa_mem_region {
>      struct ffa_address_range address_range_array[];
>  };
>
> +struct ffa_uuid {
> +    uint64_t val[2];
> +};
> +
>  struct ffa_ctx_notif {
>      /*
>       * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> @@ -580,4 +584,21 @@ static inline bool ffa_fw_supports_fid(uint32_t fid)
>      return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
>  }
>
> +static inline bool ffa_uuid_is_nil(struct ffa_uuid id)
> +{
> +    return id.val[0] =3D=3D 0 && id.val[1] =3D=3D 0;
> +}
> +
> +static inline bool ffa_uuid_equal(struct ffa_uuid id1, struct ffa_uuid i=
d2)
> +{
> +    return id1.val[0] =3D=3D id2.val[0] && id1.val[1] =3D=3D id2.val[1];
> +}
> +
> +static inline void ffa_uuid_set(struct ffa_uuid *id, uint32_t val0,
> +                                uint32_t val1, uint32_t val2, uint32_t v=
al3)
> +{
> +    id->val[0] =3D ((uint64_t)val1 << 32U) | val0;
> +    id->val[1] =3D ((uint64_t)val3 << 32U) | val2;
> +}
> +
>  #endif /*__FFA_PRIVATE_H__*/
> --
> 2.51.2
>

