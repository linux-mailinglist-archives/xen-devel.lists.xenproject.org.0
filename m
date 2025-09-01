Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D6B3DE5B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104246.1455342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0nx-0007VG-00; Mon, 01 Sep 2025 09:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104246.1455342; Mon, 01 Sep 2025 09:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0nw-0007TZ-T4; Mon, 01 Sep 2025 09:26:24 +0000
Received: by outflank-mailman (input) for mailman id 1104246;
 Mon, 01 Sep 2025 09:26:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ut0nv-0007TT-9r
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:26:23 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8bed9bc-8715-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 11:26:21 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f68d7a98aso2538014e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:26:21 -0700 (PDT)
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
X-Inumbo-ID: b8bed9bc-8715-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756718781; x=1757323581; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGeHWtWNgO705oxiOYsA+gyhdLCj4bABvxrJX/jN1iE=;
        b=SGhdvh0CFU1+RYkJkXP8mMeKdPp0RUfYxkRbPWyWl5TWhK6YHUXnerhYsYRPKYAZYU
         q1gLTn5tO9O6HjE4JCdi+W0BMpnM4Sy3vEgAtb5WBOy4PNTuKKMm4VUKZQ6pzB9UMGar
         3olpmfXjx7qZoo1HpCPCTk5AQMFZHLRn4AtV6R+/RrrT3JTKOME1FAjDcCfw7Fp0AQ8v
         oZ/+SuQL4J7zutYG5EocvsTQLBuCryOuGDPJF8HqX0nYUs5qvoY0ND1mDkdzZIdVfDrG
         1tGBWpMlCTGpqDBOfjZCZ0uJ5crLmV59TujJPqgJneFiNfO4ZsVjj/zgdvxPU/FqxKJb
         KWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718781; x=1757323581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGeHWtWNgO705oxiOYsA+gyhdLCj4bABvxrJX/jN1iE=;
        b=io1GmJP93Pdw3ctQyeeDefmKCbwtBH4sus61SNSAOZ1VqTCF++zqjF3YmFUDJ+4GSS
         1GekbEaVMOwc/zLzdfiRnqv0IA1bUH57XBA758WvLp9ole5FnZDnkv6t7XaUnUEqU7CB
         WCraWGRS1F0rjRDBTFz8mexocApySwVfUZmk1qLVNI5V1ulmHNIVhJKzwOEkltJ/yo03
         aeOy2MmGWafll6plvSwvZnbIqRdz/JCCeM5sFBWvEw6Ko12Sw+YNEgpd3ffVDc7wFhRt
         6TN6Wkt4IBd1fNGyGGcMpKiCfJmCMV/Sto7TRzzYuy7SBF5HfvcLpS8eg3331r2Ojnug
         n2TQ==
X-Gm-Message-State: AOJu0YwMRLme/E1gE4jzP+hRkkTwEs0263jzUz7ULwdpzwAoSo/FfYA5
	7p4PwDRWMmYCmtF7LkrqSnU+csuldLMgDtERgA0i21ZWHZizJLyQ+pyfDGM1alGNwgtaORhu+XI
	1yn2tkq+bCJ+QN1UtB9HiPDYRaJRTwDI=
X-Gm-Gg: ASbGncsS49+PI/qvtVUd7CC1SUKILwklP59Ek6EhrsM50WsdZjk5kIMe5UftxVzBLXL
	8VprGb6dKSUdQSKymH1kvK2LE2qoY364FdT57i9OLqQ+m54JBydBQyJ29xlZmqZnEMm5Ui34i3t
	+RV8x/UJIbpNZtGoynkw6PMT+8ka5I0w6JfDbxA6eA7GIvvmGU69ZMOYoSljZnmgx1dbNlUOFtM
	KPC+w==
X-Google-Smtp-Source: AGHT+IHvj0G5XcfwMnlDShmploLpRGYG/6mk1osr+cYNn99IYvrY68a8j5nnANOO0I8Sx3cAkD7ozSig6dJKZQq+gXM=
X-Received: by 2002:a05:6512:4002:b0:55f:3e8f:ac10 with SMTP id
 2adb3069b0e04-55f709886f7mr2136762e87.49.1756718780307; Mon, 01 Sep 2025
 02:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
In-Reply-To: <24567cc1630b1577c33939ff71d67fb2ebe5572f.1754491424.git.dmytro_firsov@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 1 Sep 2025 12:26:08 +0300
X-Gm-Features: Ac12FXzz9oOK_kMxsFAmUfOYLAVi4KEd0wCbmt5TdL3flZ47esYmFJvD2IcE-N4
Message-ID: <CAGeoDV-xqTe7LckqMKoCuJ0ApDdayAZ9s7w7i=BCG9jJEMayrw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
To: Dmytro Firsov <Dmytro_Firsov@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmytro,

On Wed, Aug 6, 2025 at 5:59=E2=80=AFPM Dmytro Firsov <Dmytro_Firsov@epam.co=
m> wrote:
>
> According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
> SMMU(s) that is/are non-coherent to the PE (processing element). In such
> cases, memory accesses from the PE should be either non-cached or be
> augmented with manual cache maintenance. SMMU cache coherency is reported
> by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
> Xen driver. However, the current implementation is not aware of cache
> maintenance for memory that is shared between the PE and non-coherent
> SMMUs. It contains dmam_alloc_coherent() function, that is added during
> Linux driver porting. But it is actually a wrapper for _xzalloc(), that
> returns normal writeback memory (which is OK for coherent SMMUs).
>
> During Xen bring-up on a system with non-coherent SMMUs, the driver did
> not work properly - the SMMU was not functional and halted initialization
> at the very beginning due to a timeout while waiting for CMD_SYNC
> completion:
>
>   (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
>   (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout

Thank you for your patch.

I have encountered the same issue while testing other Xen functionality
on the Orange Pi 5 board (SoC RK3588S):

(XEN) [ 0.040350] SMMUv3: /iommu@fc900000: ias 48-bit, oas 48-bit
(features 0x00001c0f)
(XEN) [ 0.043164] SMMUv3: /iommu@fc900000: allocated 524288 entries for cmd=
q
(XEN) [ 0.048505] SMMUv3: /iommu@fc900000: allocated 524288 entries for evt=
q
(XEN) [ 1.099335] SMMUv3: /iommu@fc900000: CMD_SYNC timeout

This patch resolves the problem.

Tested-by: Mykola Kvach <mykola_kvach@epam.com>

>
> To properly handle such scenarios, add the non_coherent flag to the
> arm_smmu_queue struct. It is initialized using features reported by the
> SMMU HW and will be used for triggering cache clean/invalidate operations=
.
> This flag is not queue-specific (it is applicable to the whole SMMU), but
> adding it to arm_smmu_queue allows us to not change function signatures
> and simplify the patch (smmu->features, which contains the required flag,
> are not available in code parts that require cache maintenance).
>
> Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
>  xen/drivers/passthrough/arm/smmu-v3.h |  7 +++++++
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 5e9e3e048e..bf153227db 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -346,10 +346,14 @@ static void queue_write(__le64 *dst, u64 *src, size=
_t n_dwords)
>
>  static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
>  {
> +       __le64 *q_addr =3D Q_ENT(q, q->llq.prod);
> +
>         if (queue_full(&q->llq))
>                 return -ENOSPC;
>
> -       queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
> +       queue_write(q_addr, ent, q->ent_dwords);
> +       if (q->non_coherent)
> +               clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_a=
ddr));
>         queue_inc_prod(&q->llq);
>         queue_sync_prod_out(q);
>         return 0;
> @@ -365,10 +369,15 @@ static void queue_read(u64 *dst, __le64 *src, size_=
t n_dwords)
>
>  static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
>  {
> +       __le64 *q_addr =3D Q_ENT(q, q->llq.cons);
> +
>         if (queue_empty(&q->llq))
>                 return -EAGAIN;
>
> -       queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
> +       if (q->non_coherent)
> +               invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof=
(*q_addr));
> +
> +       queue_read(ent, q_addr, q->ent_dwords);
>         queue_inc_cons(&q->llq);
>         queue_sync_cons_out(q);
>         return 0;
> @@ -463,6 +472,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_de=
vice *smmu)
>         struct arm_smmu_queue *q =3D &smmu->cmdq.q;
>         u32 cons =3D readl_relaxed(q->cons_reg);
>         u32 idx =3D FIELD_GET(CMDQ_CONS_ERR, cons);
> +       __le64 *q_addr =3D Q_ENT(q, cons);
>         struct arm_smmu_cmdq_ent cmd_sync =3D {
>                 .opcode =3D CMDQ_OP_CMD_SYNC,
>         };
> @@ -489,11 +499,14 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_=
device *smmu)
>                 break;
>         }
>
> +       if (q->non_coherent)
> +               invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof=
(*q_addr));
> +
>         /*
>          * We may have concurrent producers, so we need to be careful
>          * not to touch any of the shadow cmdq state.
>          */
> -       queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
> +       queue_read(cmd, q_addr, q->ent_dwords);
>         dev_err(smmu->dev, "skipping command in error state:\n");
>         for (i =3D 0; i < ARRAY_SIZE(cmd); ++i)
>                 dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)c=
md[i]);
> @@ -504,7 +517,10 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_d=
evice *smmu)
>                 return;
>         }
>
> -       queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
> +       queue_write(q_addr, cmd, q->ent_dwords);
> +
> +       if (q->non_coherent)
> +               clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_a=
ddr));
>  }
>
>  static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 *=
cmd)
> @@ -1634,6 +1650,9 @@ static int __init arm_smmu_init_one_queue(struct ar=
m_smmu_device *smmu,
>         q->q_base |=3D FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
>
>         q->llq.prod =3D q->llq.cons =3D 0;
> +
> +       q->non_coherent =3D !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
> +
>         return 0;
>  }
>
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthro=
ugh/arm/smmu-v3.h
> index f09048812c..db936b9bd4 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -522,6 +522,13 @@ struct arm_smmu_queue {
>
>         u32 __iomem                     *prod_reg;
>         u32 __iomem                     *cons_reg;
> +
> +       /*
> +        * According to SMMU spec section 3.16, some systems may have
> +        * SMMUs, that are non-coherent to PE (processing elements).
> +        * In such case manual cache management is needed.
> +        */
> +       bool                            non_coherent;
>  };
>
>  struct arm_smmu_cmdq {
> --
> 2.50.1
>

Best regards,
Mykola

