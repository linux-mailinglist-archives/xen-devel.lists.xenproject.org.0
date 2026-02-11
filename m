Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP4fGJI+jGlyjwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:32:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F23122434
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227071.1533401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5dj-0005uk-C1; Wed, 11 Feb 2026 08:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227071.1533401; Wed, 11 Feb 2026 08:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5dj-0005tJ-8R; Wed, 11 Feb 2026 08:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1227071;
 Wed, 11 Feb 2026 08:32:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uigq=AP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vq5dh-0005tD-Cr
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:32:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21ff8645-0724-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 09:31:59 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-59de77e2e30so6858073e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:31:59 -0800 (PST)
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
X-Inumbo-ID: 21ff8645-0724-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770798719; cv=none;
        d=google.com; s=arc-20240605;
        b=X2/aC4lHH5Do69NUHJlabSOOs25+gbzMKae3B9M1ERwHPpTwXB2k1N9g74eNQXo9ll
         biMoa/ET5e/Isbp2StJ5BLC2lY2TOZKHPTXvaczpZQzYncUsgRWdzVT5CDs2eGD67WyG
         t9g1MsEShdlzL12EfIJUKLfG5cNcxE9eduTH4vbuvTlL+5LltyXaKGd3zvywyiOpj4t6
         pLy39DSWTBXlMS+AFPqXEdy8XNmfUWELdZ68Wu6BeyF8us6kAZbWhIErMlX7804m39PO
         bQ5OM4dDszIGTJ5DdDxF/4dFOlAoObtXE/Ueoa5nAcv0rX3ph7fwA/raRzu7Pl7N0BS5
         FYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gziD7I6zNZ1668QO63Xo1tzH9/Hqg49593Cc+O40vWA=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=jyVqi1lBTgrKE1kpMniehQUJugI9gZ2RNZExrIBRHouf4JmaXuVdgofF46tVNk95oy
         HlJ/cLGjBmWNMQ85mTrpZ/SPdLftmBV1+MSP/Y0gCVo4u+qiZSxT+ip/FiqOifFcC2eY
         /6uhPFSXwqYk5vkr1RTjQDPsKV5km2fFe7N9aS2vHc07ifrSp4/dXzQkKQYceK+jT7sg
         GRIoMEYpDB3FkjUhfJjCRb+jcEWqfnVo6C5qzRl8xZqwMKJu2e1wcX0ItOUBbnew+U3I
         +OI0ti8Pript4f1Efny5PyMlJJmmV04uNyvc9Y17kmunMQpoDqr3uLWnQ8QAKWFpLZPF
         tmhw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798719; x=1771403519; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gziD7I6zNZ1668QO63Xo1tzH9/Hqg49593Cc+O40vWA=;
        b=E9t7cm2prWrmTqS0RP+dDKNtDKUnUoW7PkL2spgcQ0tfywxzRN+B9eobPhkQadTAOH
         VIdCPztOZKNHkpDNlGVf7JHVmeaBVbAQCjfkIRtSGRovNiI6CJQTVitpYJ0MPI2K1IKb
         NzZm/IuKILGL5t5jmYWwC4PLmLeeUp/u//t8EAPDS5nbG3pAnjoNtSWp4otw+sd709zU
         yYicGYB4//0zGkPZL/AWKmjslgo+1aVH/ug47qljGz+cdg36UiF1MR1kH+QA/1FpCO4+
         KEmHiqT6uo/aqdNsGNxrm4ntzQBTyr+FGuhz0ro+RNuWSD+ghrgBozY6g6NBi3mpxzL1
         CDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798719; x=1771403519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gziD7I6zNZ1668QO63Xo1tzH9/Hqg49593Cc+O40vWA=;
        b=GszZTZc9hgvgTP+q5hMCC4fxt1Hugjv8mjX5EMrRFs/AWit3HdK4WQ87XPrGZQkvly
         S6om6skcjapE3D5He6jCZntVtVP7BsewuBNEjzX55drgKw4TkbOWkrklgXIVaEtck6HY
         movovhr5Tz5gIURGMT0GxnWztR+96eL0zDw2wGaUK0hOYUdWL2FKio/gjN5MYAS5ZhSo
         h0iiAugeWllD7nPWHBN7CSN3SlHeDuzBpq+Wei7vzJ04X1skQaHlmaQE0X3sJij2eCl4
         /klUDhocrOuesGk7gcubxMfnUgtTGWV4MR4eY6wOwmL7QVTn+YOTEK7oPumBIm9ST2ce
         jVFg==
X-Gm-Message-State: AOJu0YxTWRT0vxrW8iGcpfYYadJTy1svUf4ZWUZMwdoIAZRIgM2z6sU/
	bfovlnFpaHA/+EIx+T01KCfOblaF3uxJey3lc0xm7kW4Z0+qf9Bk8j9A9Uc5lbkaJOPVWAcTg5T
	ZsyZXLZtiOC6tpdG/nTuNEi2aIftb6W8=
X-Gm-Gg: AZuq6aIgTP85tu9GW5Vam4xkL3eCbq1D89DKsFXl5mgQeKu/4+K9rReiWVzFUHc8/gq
	SvsNAp48PDl2nKgb2/zm5TsNeFqyWeaDFklBduQShXXopUSOkS+Mw8aXTdrWJR6gBMwB2g0MN9d
	NR374jaWtNI++eROpVEzdBg2gUqJFyPbAfkJvPAu7ZLI3iexEWItOIfbbHxeP4xITvguxqbFbLT
	SdeEyAftgRE8Eh3PK0Q1JrkzuMPLvwFQaKFR18KOywBSU7vZz2dG0BemdxD8jgWvIloRna3K6wi
	77wQ
X-Received: by 2002:a05:6512:39d3:b0:59d:d7d5:9026 with SMTP id
 2adb3069b0e04-59e5e23eae2mr436583e87.49.1770798718774; Wed, 11 Feb 2026
 00:31:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <a821c49c7ba01f777546b0f7ab161d969a653b8b.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <a821c49c7ba01f777546b0f7ab161d969a653b8b.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 11 Feb 2026 10:31:46 +0200
X-Gm-Features: AZwV_QjQu-ZwcX5v6NVPUuzSfVeGWjjym7tpXb48z3RX2grXHMh_D-uU27J7Ojs
Message-ID: <CAGeoDV8mUfRt3roKeWp3A=NugMszD_3wjp=jai-fuc+kN+r3RA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/19] arm/gicv4-its: Add VLPI map/unmap operations
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1F23122434
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> For VLPI to be injected into a guest, it needs to be mapped or moved to
> a corresponding VPE first. Add a struct to handle the info about the
> VLPI mapping and a flag indicating whether the IRQ is tied to a HW one.
>
> Implement mapping/unmapping of VLPIs to VPEs, also handle moving. Tie
> them to emulated MAPTI/MOVI/DISCARD commands.
>
> Add GIC_IRQ_GUEST_FORWARDED IRQ status flag to keep track of which LPIs
> are mapped to virtual ones.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c             |  14 ++
>  xen/arch/arm/gic-v4-its.c             | 292 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic_v3_its.h |  20 ++
>  xen/arch/arm/include/asm/gic_v4_its.h |  20 ++
>  xen/arch/arm/include/asm/vgic.h       |   5 +
>  xen/arch/arm/vgic-v3-its.c            |  42 +++-
>  6 files changed, 387 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/arm/gic-v4-its.c
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 25c07eb861..25889445f5 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -315,6 +315,20 @@ int its_send_cmd_inv(struct host_its *its,
>      return its_send_command(its, cmd);
>  }
>
> +int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
> +                         uint32_t eventid)
> +{
> +    uint64_t cmd[4];
> +    uint32_t deviceid =3D dev->host_devid;
> +
> +    cmd[0] =3D GITS_CMD_DISCARD | ((uint64_t)deviceid << 32);
> +    cmd[1] =3D (uint64_t)eventid;
> +    cmd[2] =3D 0x00;
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
>  /* Set up the (1:1) collection mapping for the given host CPU. */
>  int gicv3_its_setup_collection(unsigned int cpu)
>  {
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> new file mode 100644
> index 0000000000..9bbd0d96b7
> --- /dev/null
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -0,0 +1,292 @@
> +/*
> + * xen/arch/arm/gic-v4-its.c
> + *
> + * ARM Generic Interrupt Controller support v4 version
> + * based on xen/arch/arm/gic-v3-its.c and kernel GICv4 driver
> + *
> + * Copyright (C) 2023 - ARM Ltd
> + * Penny Zheng <penny.zheng@arm.com>, ARM Ltd ported to Xen
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/spinlock.h>
> +#include <asm/gic_v3_defs.h>
> +#include <asm/gic_v3_its.h>
> +#include <asm/gic_v4_its.h>
> +#include <asm/vgic.h>
> +
> +
> +static int its_send_cmd_vsync(struct host_its *its, uint16_t vpeid)
> +{
> +    uint64_t cmd[4];
> +
> +    cmd[0] =3D GITS_CMD_VSYNC;
> +    cmd[1] =3D (uint64_t)vpeid << 32;
> +    cmd[2] =3D 0x00;
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
> +static int its_send_cmd_vmapti(struct host_its *its, struct its_device *=
dev,
> +                               uint32_t eventid)
> +{
> +    uint64_t cmd[4];
> +    uint32_t deviceid =3D dev->host_devid;
> +    struct its_vlpi_map *map =3D &dev->event_map.vlpi_maps[eventid];
> +    uint16_t vpeid =3D map->vm->vpes[map->vpe_idx]->vpe_id;
> +    uint32_t vintid =3D map->vintid;
> +    uint32_t db_pintid;
> +
> +    if ( map->db_enabled )
> +        db_pintid =3D map->vm->vpes[map->vpe_idx]->vpe_db_lpi;
> +    else
> +        db_pintid =3D INVALID_LPI;

If we want to disable the doorbell, the VMAPTI encoding should use
Dbell_pINTID =3D 1023.

Arm IHI 0069H.b, section 5.3.20 VMAPTI states:
- If Dbell_pINTID is 1023, then no physical interrupt is generated.
- It is an error if Dbell_pINTID is not a valid doorbell INTID, where
a valid INTID is either:
  * 1023, or
  * within the supported range for LPIs.

So using 1023 is the architected way to represent =E2=80=9Cno doorbell=E2=
=80=9D.

> +
> +    cmd[0] =3D GITS_CMD_VMAPTI | ((uint64_t)deviceid << 32);
> +    cmd[1] =3D eventid | ((uint64_t)vpeid << 32);
> +    cmd[2] =3D vintid | ((uint64_t)db_pintid << 32);
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
> +static bool pirq_is_forwarded_to_vcpu(struct pending_irq *pirq)
> +{
> +    ASSERT(pirq);
> +    return test_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
> +}
> +
> +bool event_is_forwarded_to_vcpu(struct its_device *dev, uint32_t eventid=
)
> +{
> +    struct pending_irq *pirq;
> +
> +    /* No vlpi maps at all ? */
> +    if ( !dev->event_map.vlpi_maps)
> +        return false;
> +
> +    pirq =3D dev->event_map.vlpi_maps[eventid].pirq;
> +    return pirq_is_forwarded_to_vcpu(pirq);
> +}
> +
> +static int its_send_cmd_vmovi(struct host_its *its, struct its_vlpi_map =
*map)
> +{
> +    uint64_t cmd[4];
> +    struct its_device *dev =3D map->dev;
> +    uint32_t eventid =3D map->eventid;
> +    uint32_t deviceid =3D dev->host_devid;
> +    uint16_t vpeid =3D map->vm->vpes[map->vpe_idx]->vpe_id;
> +    uint32_t db_pintid;
> +
> +    if ( map->db_enabled )
> +        db_pintid =3D map->vm->vpes[map->vpe_idx]->vpe_db_lpi;
> +    else
> +        db_pintid =3D INVALID_IRQ;

Same point as above: if the intention is =E2=80=9Cno doorbell=E2=80=9D, the=
 architected
encoding is Dbell_pINTID =3D 1023.

Per Arm IHI 0069H.b, section 5.3.21 VMOVI, an error is generated only when
D =3D=3D 1 and Dbell_pINTID is not a valid doorbell INTID (valid values are
1023 or an INTID within the supported LPI range). When D =3D=3D 0, Dbell_pI=
NTID
is ignored.

> +
> +    cmd[0] =3D GITS_CMD_VMOVI | ((uint64_t)deviceid << 32);
> +    cmd[1] =3D eventid | ((uint64_t)vpeid << 32);
> +    cmd[2] =3D (map->db_enabled ? 1UL : 0UL) | ((uint64_t)db_pintid << 3=
2);
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
> +static int gicv4_its_vlpi_map(struct its_vlpi_map *map)
> +{
> +    struct its_device *dev;
> +    struct host_its *its;
> +    uint32_t eventid;
> +    int ret;
> +
> +    if ( !map )
> +        return -EINVAL;
> +    dev =3D map->dev;
> +    its =3D map->dev->hw_its;
> +    eventid =3D map->eventid;
> +
> +    spin_lock(&dev->event_map.vlpi_lock);
> +
> +    if ( !dev->event_map.vm )
> +    {
> +        struct its_vlpi_map *maps;
> +
> +        maps =3D xzalloc_array(struct its_vlpi_map, dev->event_map.nr_lp=
is);
> +        if ( !maps )
> +        {
> +            ret =3D -ENOMEM;
> +            goto err;

nit: goto out;

> +        }
> +
> +        dev->event_map.vm =3D map->vm;
> +        dev->event_map.vlpi_maps =3D maps;
> +    }
> +    else if ( dev->event_map.vm !=3D map->vm )
> +    {
> +        ret =3D -EINVAL;
> +        goto err;
> +    }
> +
> +    /* Get our private copy of the mapping information */
> +    dev->event_map.vlpi_maps[eventid] =3D *map;
> +
> +    if ( pirq_is_forwarded_to_vcpu(map->pirq) )
> +    {
> +        struct its_vlpi_map *old =3D &dev->event_map.vlpi_maps[eventid];
> +        uint32_t old_vpeid =3D old->vm->vpes[old->vpe_idx]->vpe_id;

Nit/bug?: old_vpeid is read after vlpi_maps[eventid] has been overwritten
with *map, so it=E2=80=99s not the old mapping anymore.
Should old_vpeid be captured before the assignment?

> +
> +        /* Already mapped, move it around */
> +        ret =3D its_send_cmd_vmovi(dev->hw_its, map);
> +        if ( ret )
> +            goto err;
> +
> +        /*
> +         * ARM spec says that If, after using VMOVI to move an interrupt=
 from
> +         * vPE A to vPE B, software moves the same interrupt again, a VS=
YNC
> +         * command must be issued to vPE A between the moves to ensure c=
orrect
> +         * behavior.
> +         * So each time we issue VMOVI, we VSYNC the old VPE for good me=
asure.
> +         */
> +        ret =3D its_send_cmd_vsync(dev->hw_its, old_vpeid);
> +    }
> +    else
> +    {
> +        /* Drop the original physical mapping firstly */
> +        ret =3D its_send_cmd_discard(its, dev, eventid);
> +        if ( ret )
> +            goto err;
> +
> +        /* Then install the virtual one */
> +        ret =3D its_send_cmd_vmapti(its, dev, eventid);
> +        if ( ret )
> +            goto err;
> +
> +        /* Increment the number of VLPIs */
> +        dev->event_map.nr_vlpis++;
> +    }
> +
> +    goto out;
> +
> + err:
> +    xfree(dev->event_map.vlpi_maps);

1. Bug?: unconditionally frees dev->event_map.vlpi_maps, but it=E2=80=99s o=
nly
newly allocated on the !dev->event_map.vm path. If called with an existing
vm/maps, this can free live state and cause UAF.
2. Prefer XFREE(dev->event_map.vlpi_maps); it frees and NULLs the pointer.

> + out:
> +    spin_unlock(&dev->event_map.vlpi_lock);
> +    return ret;
> +}

nit: add new line between functions

> +int gicv4_its_vlpi_unmap(struct pending_irq *pirq)
> +{
> +    struct its_vlpi_map *map =3D pirq->vlpi_map;
> +    struct its_device *dev =3D map->dev;
> +    int ret;
> +    uint32_t host_lpi;
> +
> +    spin_lock(&dev->event_map.vlpi_lock);
> +
> +    if ( !dev->event_map.vm || !pirq_is_tied_to_hw(pirq) )
> +    {
> +        ret =3D -EINVAL;
> +        goto out;
> +    }
> +
> +    /* Drop the virtual mapping */
> +    ret =3D its_send_cmd_discard(dev->hw_its, dev, map->eventid);
> +    if ( ret )
> +        goto out;
> +
> +    /* Restore the physical one */
> +    clear_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
> +    host_lpi =3D dev->host_lpi_blocks[map->eventid / LPI_BLOCK] +
> +               (map->eventid % LPI_BLOCK);
> +    /* Map every host LPI to host CPU 0 */
> +    ret =3D its_send_cmd_mapti(dev->hw_its, dev->host_devid, map->eventi=
d,
> +                             host_lpi, 0);
> +    if ( ret )
> +        goto out;
> +
> +    lpi_write_config(lpi_data.lpi_property, host_lpi, 0xff, LPI_PROP_ENA=
BLED);

Are we intentionally resetting host LPI priority here (same as allocation p=
ath)?
If yes, worth documenting.

> +
> +    ret =3D its_inv_lpi(dev->hw_its, dev, map->eventid, 0);
> +    if ( ret )
> +        goto out;
> +
> +    xfree(map);
> +    /*
> +     * Drop the refcount and make the device available again if
> +     * this was the last VLPI.
> +     */
> +    if ( !--dev->event_map.nr_vlpis )
> +    {
> +        dev->event_map.vm =3D NULL;
> +        xfree(dev->event_map.vlpi_maps);
> +    }
> +
> +out:
> +    spin_unlock(&dev->event_map.vlpi_lock);
> +    return ret;
> +}
> +
> +int gicv4_assign_guest_event(struct domain *d, paddr_t vdoorbell_address=
,
> +                             uint32_t vdevid, uint32_t eventid,
> +                             struct pending_irq *pirq)
> +
> +{
> +    int ret =3D ENODEV;
> +    struct its_vm *vm =3D d->arch.vgic.its_vm;
> +    struct its_vlpi_map *map;
> +    struct its_device *dev;
> +
> +    spin_lock(&d->arch.vgic.its_devices_lock);
> +    dev =3D get_its_device(d, vdoorbell_address, vdevid);
> +    if ( dev && eventid < dev->eventids )
> +    {
> +        /* Prepare the vlpi mapping info */
> +        map =3D xzalloc(struct its_vlpi_map);
> +        if ( !map )
> +            goto out;
> +        map->vm =3D vm;
> +        map->vintid =3D pirq->irq;
> +        map->db_enabled =3D true;
> +        map->vpe_idx =3D pirq->lpi_vcpu_id;
> +        map->properties =3D pirq->lpi_priority |
> +                          (test_bit(GIC_IRQ_GUEST_ENABLED, &pirq->status=
) ?
> +                          LPI_PROP_ENABLED : 0);
> +        map->pirq =3D pirq;
> +        map->dev =3D dev;
> +        map->eventid =3D eventid;
> +
> +        ret =3D gicv4_its_vlpi_map(map);
> +        if ( ret )
> +        {
> +            xfree(map);
> +            goto out;
> +        }
> +
> +        pirq->vlpi_map =3D map;
> +    }
> +
> + out:
> +    spin_unlock(&d->arch.vgic.its_devices_lock);
> +    return ret;
> +}
> +
> +int gicv4_its_vlpi_move(struct pending_irq *pirq, struct vcpu *vcpu)
> +{
> +    struct its_vlpi_map *map =3D pirq->vlpi_map;
> +    struct its_device *dev =3D map->dev;

map is dereferenced before it=E2=80=99s validated

> +
> +    if ( !dev->event_map.vm || !map )
> +        return -EINVAL;
> +
> +    map->vpe_idx =3D vcpu->vcpu_id;
> +    return gicv4_its_vlpi_map(map);
> +}
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index 9f0ea9ccb1..75c91c0426 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -116,6 +116,9 @@
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling over=
head. */
>  #define LPI_BLOCK                       32U
>
> +#ifdef CONFIG_GICV4
> +#include <asm/gic_v4_its.h>
> +#endif
>  /*
>   * Describes a device which is using the ITS and is used by a guest.
>   * Since device IDs are per ITS (in contrast to vLPIs, which are per
> @@ -135,6 +138,9 @@ struct its_device {
>      uint32_t eventids;                  /* Number of event IDs (MSIs) */
>      uint32_t *host_lpi_blocks;          /* Which LPIs are used on the ho=
st */
>      struct pending_irq *pend_irqs;      /* One struct per event */
> +#ifdef CONFIG_GICV4
> +    struct event_vlpi_map event_map;
> +#endif
>  };
>
>  /* data structure for each hardware ITS */
> @@ -184,6 +190,8 @@ extern struct __lpi_data lpi_data;
>
>  extern struct list_head host_its_list;
>
> +int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
> +                         uint32_t eventid);
>  int its_send_cmd_inv(struct host_its *its, uint32_t deviceid, uint32_t e=
ventid);
>  int its_send_cmd_clear(struct host_its *its, uint32_t deviceid, uint32_t=
 eventid);
>  int its_send_cmd_mapti(struct host_its *its, uint32_t deviceid,
> @@ -254,6 +262,18 @@ int its_send_command(struct host_its *hw_its, const =
void *its_cmd);
>
>  struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
>                                    uint32_t vdevid);
> +/* GICv4 functions */
> +int gicv4_assign_guest_event(struct domain *d, paddr_t vdoorbell_address=
,
> +                             uint32_t vdevid, uint32_t eventid,
> +                             struct pending_irq *pirq);
> +int gicv4_its_vlpi_move(struct pending_irq *pirq, struct vcpu *vcpu);
> +#ifndef CONFIG_GICV4
> +#define event_is_forwarded_to_vcpu(dev, eventid) ((void)dev, (void)event=
id, false)
> +#else
> +bool event_is_forwarded_to_vcpu(struct its_device *dev, uint32_t eventid=
);
> +void its_vpe_mask_db(struct its_vpe *vpe);
> +#endif
> +int gicv4_its_vlpi_unmap(struct pending_irq *pirq);
>
>  /* ITS quirks handling. */
>  uint64_t gicv3_its_get_cacheability(void);
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> index f48eae60ad..722247ec60 100644
> --- a/xen/arch/arm/include/asm/gic_v4_its.h
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -29,6 +29,26 @@
>  #define GITS_CMD_VINVALL                 0x2d
>  #define GITS_CMD_INVDB                   0x2e
>
> +/* Describes the mapping of a VLPI */
> +struct its_vlpi_map {
> +    struct its_vm       *vm;
> +    unsigned int        vpe_idx;    /* Index of the VPE */
> +    uint32_t            vintid;     /* Virtual LPI number */
> +    bool                db_enabled; /* Is the VPE doorbell to be generat=
ed? */
> +    uint8_t             properties;
> +    struct pending_irq  *pirq;
> +    struct its_device   *dev;
> +    uint32_t            eventid;
> +};
> +
> +struct event_vlpi_map {
> +    unsigned int            nr_lpis;
> +    spinlock_t              vlpi_lock;
> +    struct its_vm           *vm;
> +    struct its_vlpi_map     *vlpi_maps;
> +    unsigned int            nr_vlpis;
> +};
> +
>  #endif
>
>  /*
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 77323b2584..360f8a968e 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -70,6 +70,7 @@ struct pending_irq
>       * LPI with the same number in an LR must be from an older LPI, whic=
h
>       * has been unmapped before.
>       *
> +     * GIC_IRQ_GUEST_FORWARDED: the IRQ is forwarded to a VCPU(GICv4 onl=
y)
>       */
>  #define GIC_IRQ_GUEST_QUEUED   0
>  #define GIC_IRQ_GUEST_ACTIVE   1
> @@ -77,6 +78,7 @@ struct pending_irq
>  #define GIC_IRQ_GUEST_ENABLED  3
>  #define GIC_IRQ_GUEST_MIGRATING   4
>  #define GIC_IRQ_GUEST_PRISTINE_LPI  5
> +#define GIC_IRQ_GUEST_FORWARDED     6
>      unsigned long status;
>      struct irq_desc *desc; /* only set if the irq corresponds to a physi=
cal irq */
>      unsigned int irq;
> @@ -95,6 +97,9 @@ struct pending_irq
>       * vgic lock is not going to be enough. */
>      struct list_head lr_queue;
>      bool hw;                    /* Tied to HW IRQ */
> +#ifdef CONFIG_GICV4
> +    struct its_vlpi_map *vlpi_map;
> +#endif
>  };
>
>  #define NR_INTERRUPT_PER_RANK   32
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 576e7fd4b0..94f7dd7d90 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -589,6 +589,14 @@ static int its_discard_event(struct virt_its *its,
>      if ( vlpi =3D=3D INVALID_LPI )
>          return -ENOENT;
>
> +    p =3D gicv3_its_get_event_pending_irq(its->d, its->doorbell_address,
> +                                        vdevid, vevid);
> +    if ( unlikely(!p) )
> +        return -EINVAL;
> +
> +    if ( pirq_is_tied_to_hw(p) )
> +        if ( gicv4_its_vlpi_unmap(p) )
> +            return -EINVAL;
>      /*
>       * TODO: This relies on the VCPU being correct in the ITS tables.
>       * This can be fixed by either using a per-IRQ lock or by using
> @@ -751,6 +759,27 @@ static int its_handle_mapti(struct virt_its *its, ui=
nt64_t *cmdptr)
>
>      vgic_init_pending_irq(pirq, intid, gic_is_gicv4());
>
> +    pirq->lpi_vcpu_id =3D vcpu->vcpu_id;

pirq->lpi_vcpu_id =3D vcpu->vcpu_id; is assigned twice (here and again belo=
w).
Can we drop the earlier assignment and keep only the one after the
mapping/setup, unless something in between relies on it?

> +
> +    if ( pirq_is_tied_to_hw(pirq) )
> +        /*
> +         * If on GICv4, we could let the VLPI being directly injected
> +         * to the guest. To achieve that, the VLPI must be mapped using
> +         * the VMAPTI command.
> +         */
> +        if ( gicv4_assign_guest_event(its->d, its->doorbell_address, dev=
id,
> +                                      eventid, pirq) )
> +            goto out_remove_mapping;

1. looks like we should jump to "out_remove_host_entry" here, to roll back
the host mapping created by gicv3_assign_guest_event().
2. missing GICv4 rollback on error path: need gicv4_its_vlpi_unmap() before
removing host mapping


Best regards,
Mykola


> +
> +    if ( pirq_is_tied_to_hw(pirq) )
> +        set_bit(GIC_IRQ_GUEST_FORWARDED, &pirq->status);
> +    else
> +        /*
> +         * Mark this LPI as new, so any older (now unmapped) LPI in any =
LR
> +         * can be easily recognised as such.
> +         */
> +        set_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &pirq->status);
> +
>      /*
>       * Now read the guest's property table to initialize our cached stat=
e.
>       * We don't need the VGIC VCPU lock here, because the pending_irq is=
n't
> @@ -761,12 +790,6 @@ static int its_handle_mapti(struct virt_its *its, ui=
nt64_t *cmdptr)
>          goto out_remove_host_entry;
>
>      pirq->lpi_vcpu_id =3D vcpu->vcpu_id;
> -    /*
> -     * Mark this LPI as new, so any older (now unmapped) LPI in any LR
> -     * can be easily recognised as such.
> -     */
> -    set_bit(GIC_IRQ_GUEST_PRISTINE_LPI, &pirq->status);
> -
>      /*
>       * Now insert the pending_irq into the domain's LPI tree, so that
>       * it becomes live.
> @@ -824,6 +847,13 @@ static int its_handle_movi(struct virt_its *its, uin=
t64_t *cmdptr)
>      if ( unlikely(!p) )
>          goto out_unlock;
>
> +    if ( pirq_is_tied_to_hw(p) )
> +    {
> +        ret =3D gicv4_its_vlpi_move(p, nvcpu);
> +        if ( ret )
> +            goto out_unlock;
> +    }
> +
>      /*
>       * TODO: This relies on the VCPU being correct in the ITS tables.
>       * This can be fixed by either using a per-IRQ lock or by using
> --
> 2.51.2

