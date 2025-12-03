Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5456C9F054
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 13:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176721.1501182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmIn-0005PV-A5; Wed, 03 Dec 2025 12:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176721.1501182; Wed, 03 Dec 2025 12:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQmIn-0005MQ-7G; Wed, 03 Dec 2025 12:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1176721;
 Wed, 03 Dec 2025 12:49:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQmIl-0005MK-4z
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 12:49:47 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad241ab-d046-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 13:49:45 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7c77ed036c3so558251a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 04:49:45 -0800 (PST)
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
X-Inumbo-ID: 8ad241ab-d046-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764766184; x=1765370984; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF0bfxopm4snbSo6SQU0d0WHzw8H5rUDxqdwkGIDAd8=;
        b=MRO3tDwVTRQlk1gRQsP+o94gCIlcjzb7xt7+GJaLnetCCnafTfW86ztqSutYEv1aPZ
         FfvY7MUbgoWW5cKgw8JbhWxG1nsLKQ0NMoTpQyYd8umBXDKw3liwYwqG7Xed6OiWtZQ3
         OGo8n+l+fzdJ2mqAeODuStva6g7aVozZto0Z7+Y0IMpM28pCMOJQITfQT1o8ASLdb8Lg
         G5z0c+zBl9fK7UT/bhKnax1o9EfT7yRPldN9r4EKi7jni8yH2SFRWoOp3YNMp0yAmeIh
         KpjXqX5kCPaXzEV2PAuXlG0bcSstE9iOJ+Z/HHa/9zqfQWPAJCC6m8VxLSgEQyeHeqF/
         msdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764766184; x=1765370984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wF0bfxopm4snbSo6SQU0d0WHzw8H5rUDxqdwkGIDAd8=;
        b=VVKVbtlM8HcMe6y6TYaf/GOWInHdZDgExOqy1ZUvm7QNY3JAU7GfalXMAAafvVkuJ7
         fEZPq4wAufuTFa+hWTCvSIRiSBFZaLz7YrVdlYPN1IndKuwTccpqaeP1fZBZhS9f5Um2
         6IGhTfS67+4b6vewmiJML5vL5mwVwAzBBu4O+PfgexaBmLQFyXdrRruJPZVaMCnvTW8E
         ADB+42XiLBB3ppBNt042oRKVaoADiq6XoCySDOWniVKuyL6kM/TKF5IBHhTJFWUeGxzS
         4tOOs34s7tqifhjIDwBYfwS+LHx1Y0vKFguK85eOcKtXRA8+fswjGcEmIW/lItEttPXq
         1Prw==
X-Gm-Message-State: AOJu0YzMVai/L33MivhlRrh5ZBQ9Wmm8YW0yPxeQBxLWnnTLzceOAD+t
	0BG3K5XzoMEKxGYQe9nPVZjIX7aaJ6+fsGfizT2FOJl3hv2l47AMwZ8Mgq6nhXuyW8+E7yv/eQC
	2HXY3DQ3riK1V6Q3AAVk+ilyUgxbtsbQThpbfdI7HPA==
X-Gm-Gg: ASbGncukTnfUJILS/bfKTwxQ6X8XXio5T03WJK1qd8DOsaJlh28uWnofrG3D6ehBW3S
	Yyv2duOeIv521TwHnC7aXSOS1N7akJvSeaUSO623EjDZIieY/QMvKKF7CLkeRhH2piApExrYUb4
	CqOe8M8F7TaOBg0FjFdxmYDv7i4U/lCI9rfHh00QTT8Z298DYsrSHIXXSUl6QvOJnF8nwzG5rbS
	lHJx9nz2MRcnOcNeFJGgbMlSrPKZqiZ2wDJtBnE7nbX6kqf7I0ly5KqEHZVKv56F703OTkwJ6es
	O1qjMMZb6vCyz1odlI1rqMZgiw==
X-Google-Smtp-Source: AGHT+IEmx5E0qmi2WfCJXnpTEpTk+Fo5zzBDOq2OyfP93GTxBf9EwA0LYFSRXigQx1VaN6s8VsgUQ6aB5z8DIaDuUMc=
X-Received: by 2002:a05:6808:4a47:10b0:44d:be91:afe9 with SMTP id
 5614622812f47-4535d3f3a10mr2793901b6e.27.1764766183568; Wed, 03 Dec 2025
 04:49:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <c8fe1053ae135387da8f75f96054f3a6eae3b00b.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <c8fe1053ae135387da8f75f96054f3a6eae3b00b.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 13:49:32 +0100
X-Gm-Features: AWmQ_bmvL4y_Hrag0J3dVjocdlgpDuSsnv7TxmtgImHnfnOiBtK-IXPQ05lvxRQ
Message-ID: <CAHUa44E=+yX5uW_7mkZk_n13GDwP42HGoba2AZesuFEjU8BFkg@mail.gmail.com>
Subject: Re: [PATCH 06/10] xen/arm: ffa: add UUID helpers for partition info
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
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
>  xen/arch/arm/tee/ffa_partinfo.c | 206 ++++++++++++++++++++------------
>  xen/arch/arm/tee/ffa_private.h  |  21 ++++
>  2 files changed, 152 insertions(+), 75 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index 3f4a779f4146..4adbe2736c94 100644
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
> +    arg.a1 =3D uuid.val[0] & 0xFFFFFFFFU;
> +    arg.a2 =3D (uuid.val[0] >> 32) & 0xFFFFFFFFU;
> +    arg.a3 =3D uuid.val[1] & 0xFFFFFFFFU;
> +    arg.a4 =3D (uuid.val[1] >> 32) & 0xFFFFFFFFU;

You were switching to GENMASK in the previous patches, so we should
probably use that here too.

With that fixed:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

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
> @@ -144,69 +161,89 @@ out:
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
>      struct ffa_ctx *curr_ctx =3D current->domain->arch.tee;
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
> +    if ( curr_ctx->guest_vers >=3D FFA_VERSION_1_2 )
> +    {
> +        /* Add caller VM information */
> +        info.id =3D curr_ctx->ffa_id;
> +        info.execution_context =3D curr_ctx->num_vcpus;
> +        info.partition_properties =3D FFA_PART_VM_PROP;
> +        if ( curr_ctx->is_64bit )
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
> -
> -            if  ( dst_buf > (end_buf - dst_size) )
> -            {
> -                ret =3D FFA_RET_NO_MEMORY;
> -                goto out;
> -            }
> +            /* Ignore the caller entry as it was already added */
> +            if ( dest_ctx =3D=3D curr_ctx )
> +                continue;
>
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
> @@ -217,16 +254,17 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> @@ -259,10 +297,23 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> +            if ( ctx->guest_vers < FFA_VERSION_1_2 )
> +                ffa_vm_count -=3D 1;
> +        }
>
>          goto out;
>      }
> @@ -290,17 +341,15 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> @@ -309,7 +358,13 @@ out:
>      if ( ret )
>          ffa_set_regs_error(regs, ret);
>      else
> +    {
> +        /* Size should be 0 on count request and was not supported in 1.=
0 */
> +        if ( flags || ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +            dst_size =3D 0;
> +
>          ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size=
);
> +    }
>  }
>
>  static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> @@ -450,6 +505,7 @@ bool ffa_partinfo_init(void)
>      uint32_t count;
>      int32_t e;
>      void *spmc_rx;
> +    struct ffa_uuid nil_uuid =3D { .val =3D { 0ULL, 0ULL } };
>
>      if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
>           !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
> @@ -459,7 +515,7 @@ bool ffa_partinfo_init(void)
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
> index 9cae238f972c..c1dac09c75ca 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -306,6 +306,10 @@ struct ffa_mem_region {
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
> @@ -567,4 +571,21 @@ static inline bool ffa_fw_supports_fid(uint32_t fid)
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

