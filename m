Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMDDAfSGjWkZ3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:53:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD512B084
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228446.1534629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRVN-00046E-LM; Thu, 12 Feb 2026 07:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228446.1534629; Thu, 12 Feb 2026 07:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqRVN-00044h-IE; Thu, 12 Feb 2026 07:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1228446;
 Thu, 12 Feb 2026 07:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5O3t=AQ=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vqRVM-00044Z-9T
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:52:52 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d5aa62-07e7-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 08:52:49 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-59e64657f0cso574264e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:52:49 -0800 (PST)
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
X-Inumbo-ID: d3d5aa62-07e7-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770882769; cv=none;
        d=google.com; s=arc-20240605;
        b=JIZRc7EjkkJhuJrKKGkoHo5+0omaGK/JA9HCZuQyb21K7Hd9XKcb2vPJHMMSD2v9Xg
         ArvsExScxGC0/CI7x9DamJOOTLtugUbcAV1sJ32rJ/Quj5WUXTuMoJs7jAhYIr/IBy89
         VIBkS/43rEufoRtb7R5lnsvkPPmUIMCzZ93y2vu7ett70vI4rlOpJvMBxtVuWzr/2Lzx
         6GKqYWztSF+hIGOVX7i+wApUmFUus7a/OqIUuYrDHJe9kPnLT1qFlnHGdw3efDZ6s6Uu
         6tdiHci8LfJvyszHisT9yG+g4ZvMNQwuMor2Nl1fPIlU5tJF+MdydBkRuAV36KLkaXWK
         wS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oQxLgOT+6uVtcmlP+XfYaCm8tOIv/Xb7o58kWfnpXUU=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=Itj1XXeX6jLjq63lcek01cu9MAJwT8D63ICldf/7xgdDxC2QG7fYAmSa/YHnrA9jk0
         LlmMWjkyNM1vG+B+q6AT6BP33zNEW/BC0mG71NYz2SvI/ICAP2e69yWUeNICAWaZa1ux
         1hZbTmYuZ8WEKIwxOfTgsYRQeu+8Vx5ST6dBg83Li5CgftxhPOD/h+wlPSNJd5EbAJG7
         fMou9u2ITc27pANvTNhPM6OHoiT9wIUSiHKsKzhYIb4yxbAoryiwcBH55qMCUyskSvM1
         U2pYwTGdAC3/GhN5MV2pqklDdmQXHXSwLN+q6wWCnDsToDw8/Xuj5H+k+/aU9wAiWx+J
         oyZA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770882769; x=1771487569; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQxLgOT+6uVtcmlP+XfYaCm8tOIv/Xb7o58kWfnpXUU=;
        b=EP30ggJ3sAmOHLxIxRgCyysy419YHDfFG92Ba78bkYiV/A0hA798wxee/nMudOyVBz
         wu4zTweos4BVdldS2gkJubLkslMpxCgzFfyLmZnEL1uI/4Cwq5SZVNW7GZZqATO+8IGK
         DfdHE8vuHyiOFPcpjHLSl37b8CDMgOA1hYgESakKY1l9pucztclmrrD6tExkzQAxU06m
         jc9J9eJmI4RzOAW1owLXTKwyO32IBJhwbPPmt7qAE26MqJ2ue59OSiUa6vKuCiOqdSOP
         EgdvD4jq50NMrUmOhXyMeKQn8wU1dBGeb30zCX6oTCxzwLErnTH+Eoa33UM+V5wG7z4L
         9tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770882769; x=1771487569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oQxLgOT+6uVtcmlP+XfYaCm8tOIv/Xb7o58kWfnpXUU=;
        b=RbLjnl6KmI/T9e0b5B0qBtp/je5omXoyTjlLJClZlH9NBudhVURjWQPx/ODZPZH8nf
         coJHsvluY65Al3lUCRvTRt16BQ4O253GqTaWcatAy/OAj+ofaoShzybGEUvMTO1rHxd/
         4k/gLEXwL6ZGpM1dnfuFsCstZaEH0qIn0O2Pa+kpM48V20S+ns8otmhwC00oo+ZtlLAS
         Cjxqqe6s6AjADcjFj2eVNrp+2T7gg3NXETXil+ii42UYSi38XcKQfFQDnL8m1wp4U8K+
         WLNe4oXYqUNxH3IAb0e3/aJBGmPP5rV6xQLU7nohLuRfJvDyjbKGUtJI9ZweCAhTzLWd
         S89Q==
X-Gm-Message-State: AOJu0YxHMgNwlVIzJWbnPPUll7amZbU8X11WoMCkeWydLO09Qk01F8X6
	pO9M6la5+lIp8lnRh2bQHBWd4HJfV60XtBvBWXy8yBaxo4igXpDSFxgLd81p3QHOvTzfbwetMw6
	/L60OunEbkFBI29zDJBTd2Cpr/T734xU=
X-Gm-Gg: AZuq6aIlOC+/o/spZSUnHkYWld5+V7OWMWBESbvzcUXagNfrZoHUVL0ouyUnZGZ3PNF
	TxFSfQ1ZFGTMgwwCuXR39NMqfVf1kceFntb5ABIIGn8H0c0n5VJ0gbtO/aFNT1d8rL6/jSWQeFN
	q+X7tCRCl75PF3g2ua8nUZg4h/UXiueyzp4cnevv1QWwKt+Ro8aKioQyvmD9SeUG0SxcSYhuEJE
	vuvzMYIXJh/m4ueirLXJinWhU1L86j9CyJBJv/ARDgWom25V5LzbGZLtWUICd0hk1Ae8kg0a40I
	qEbMVQ==
X-Received: by 2002:a05:6512:1590:b0:59d:dd44:37ee with SMTP id
 2adb3069b0e04-59e64149382mr656626e87.43.1770882768928; Wed, 11 Feb 2026
 23:52:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <cc8390af73d86c72d5274e6cc3c314fe018a2c8d.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cc8390af73d86c72d5274e6cc3c314fe018a2c8d.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 12 Feb 2026 09:52:37 +0200
X-Gm-Features: AZwV_QhdvtBl7ySu8yV3DEgJhAblkdhJSLqMQafMSzc0Ci4YFtmE13DSegyI3uE
Message-ID: <CAGeoDV8OeCcEvMhqJhoRMAu8AQpwtFgRLPf_NE9eFyezLqKHtw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/19] arm/its: Keep track of BASER regs
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6DCD512B084
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Keep all the info about BASER regs in host_its structure to be able to ea=
sily
> access it later.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c             | 36 +++++++++++++++++++++------
>  xen/arch/arm/include/asm/gic_v3_its.h | 14 +++++++++++
>  2 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index c628959f42..2328595a85 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -430,16 +430,32 @@ static void *its_map_cbaser(struct host_its *its)
>  /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
>  #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
>
> +struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type)
> +{
> +    unsigned int i;
> +
> +    for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
> +    {
> +        if (GITS_BASER_TYPE(hw_its->tables[i].val) =3D=3D type)
> +            return &hw_its->tables[i];
> +    }
> +
> +    return NULL;
> +}
> +
>  static int its_map_baser(void __iomem *basereg, uint64_t regc,
> -                         unsigned int nr_items)
> +                         unsigned int nr_items, struct its_baser *baser)
>  {
>      uint64_t attr, reg;
>      unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(regc);
> -    unsigned int pagesz =3D 2;    /* try 64K pages first, then go down. =
*/
> +    unsigned int page_size[4] =3D {SZ_4K, SZ_16K, SZ_64K, SZ_64K};
> +    unsigned int pagesz =3D 0;    /* try 64K pages first, then go down. =
*/

pagesz=3D0 looks like test leftover

>      unsigned int table_size;
>      unsigned int order;
>      void *buffer;
> +    uint32_t type;
>
> +    type =3D GITS_BASER_TYPE(regc);

nit: unused

>      attr  =3D gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SH=
IFT;
>      attr |=3D GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILI=
TY_SHIFT;
>      attr |=3D gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABIL=
ITY_SHIFT;
> @@ -479,6 +495,11 @@ retry:
>      writeq_relaxed(reg, basereg);
>      regc =3D readq_relaxed(basereg);
>
> +    baser->val =3D regc;
> +    baser->base =3D buffer;
> +    baser->table_size =3D table_size;
> +    baser->pagesz =3D page_size[pagesz];
> +
>      /* The host didn't like our attributes, just use what it returned. *=
/
>      if ( (regc & BASER_ATTR_MASK) !=3D attr )
>      {
> @@ -490,7 +511,7 @@ retry:
>          }
>          attr =3D regc & BASER_ATTR_MASK;
>      }
> -    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <=3D GIC_BASER_CACH=
E_nC )
> +    if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
>          clean_and_invalidate_dcache_va_range(buffer, table_size);
>
>      /* If the host accepted our page size, we are done. */
> @@ -568,26 +589,27 @@ static int gicv3_its_init_single_its(struct host_it=
s *hw_its)
>      {
>          void __iomem *basereg =3D hw_its->its_base + GITS_BASER0 + i * 8=
;
>          unsigned int type;
> +        struct its_baser *baser =3D hw_its->tables + i;
>
>          reg =3D readq_relaxed(basereg);
> -        type =3D (reg & GITS_BASER_TYPE_MASK) >> GITS_BASER_TYPE_SHIFT;
> +        type =3D GITS_BASER_TYPE(reg);
>          switch ( type )
>          {
>          case GITS_BASER_TYPE_NONE:
>              continue;
>          case GITS_BASER_TYPE_DEVICE:
> -            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, =
UL));
> +            ret =3D its_map_baser(basereg, reg, BIT(hw_its->devid_bits, =
UL), baser);
>              if ( ret )
>                  return ret;
>              break;
>          case GITS_BASER_TYPE_COLLECTION:
> -            ret =3D its_map_baser(basereg, reg, num_possible_cpus());
> +            ret =3D its_map_baser(basereg, reg, num_possible_cpus(), bas=
er);
>              if ( ret )
>                  return ret;
>              break;
>          /* In case this is a GICv4, provide a (dummy) vPE table as well.=
 */
>          case GITS_BASER_TYPE_VCPU:
> -            ret =3D its_map_baser(basereg, reg, 1);
> +            ret =3D its_map_baser(basereg, reg, 32, baser);

Since MAX_VPEID is introduced later in the series, could you use it here
instead of the hardcoded 32 (or reorder the patches so it=E2=80=99s availab=
le)?

Also, if the BASER ends up indirect, the L1 sizing should be recalculated
from MAX_VPEID.


Best regards,
Mykola

>              if ( ret )
>                  return ret;
>              break;
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index 973ca6acdd..bd2696f354 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -64,6 +64,7 @@
>  #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
>  #define GITS_BASER_TYPE_SHIFT           56
>  #define GITS_BASER_TYPE_MASK            (7ULL << GITS_BASER_TYPE_SHIFT)
> +#define GITS_BASER_TYPE(reg)            ((reg & GITS_BASER_TYPE_MASK) >>=
 GITS_BASER_TYPE_SHIFT)
>  #define GITS_BASER_OUTER_CACHEABILITY_SHIFT        53
>  #define GITS_BASER_TYPE_NONE            0UL
>  #define GITS_BASER_TYPE_DEVICE          1UL
> @@ -143,6 +144,17 @@ struct its_device {
>  #endif
>  };
>
> +/*
> + * The ITS_BASER structure - contains memory information, cached
> + * value of BASER register configuration.
> + */
> +struct its_baser {
> +    void            *base;
> +    uint64_t        val;
> +    unsigned int    table_size;
> +    unsigned int    pagesz;
> +};
> +
>  /* data structure for each hardware ITS */
>  struct host_its {
>      struct list_head entry;
> @@ -156,6 +168,7 @@ struct host_its {
>      spinlock_t cmd_lock;
>      void *cmd_buf;
>      unsigned int flags;
> +    struct its_baser tables[GITS_BASER_NR_REGS];
>  };
>
>  /* Map a collection for this host CPU to each host ITS. */
> @@ -259,6 +272,7 @@ struct pending_irq *gicv3_assign_guest_event(struct d=
omain *d,
>                                               uint32_t virt_lpi);
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                   uint32_t virt_lpi);
> +struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
>  void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
>                        uint8_t set);
>  int its_send_command(struct host_its *hw_its, const void *its_cmd);
> --
> 2.51.2

