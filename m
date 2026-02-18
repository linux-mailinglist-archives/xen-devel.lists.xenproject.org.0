Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sESXHimjlWmaSwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD08155E94
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235481.1538464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfmS-0005BT-4P; Wed, 18 Feb 2026 11:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235481.1538464; Wed, 18 Feb 2026 11:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfmS-00058m-14; Wed, 18 Feb 2026 11:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1235481;
 Wed, 18 Feb 2026 11:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsfmQ-00046b-Lo
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 11:31:42 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64a3dd40-0cbd-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 12:31:40 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59dea72099eso6035913e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 03:31:40 -0800 (PST)
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
X-Inumbo-ID: 64a3dd40-0cbd-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1771414300; cv=none;
        d=google.com; s=arc-20240605;
        b=a0OxnV3d1knZ0cgI1LgVsGR512KR3u5NVmQi/10pT2qcnrAIUww+99AHoceOp7CY6m
         O9DKqclrPi0Sd4JkP0UzNySZhUihsC4u4tv4nfzSQt2RXD8VTFTJHF5wLiHIZPH0/PKS
         kjsSOeS+xcolqQLYkW4SnAn6dTamgJ1GKqW/VtrMSLuUyfJb5/UhX2WOEmi0V7g/tUW/
         GfU1cboEHZHnbygZ6uS0oLTyYVsCWY8ECDOCbitCJxF9A/G5ItteIhfPVqn6YfD68aoM
         PCcANxv6+Lv1Mw2MCmyj6wwkuh0iP10kfeOUq0Tqd5RrOwG3sE+/Jmo+enZzEyk7iPNE
         AqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qdV1rJUCcIrxXpqW6qfFzl0CgGX72K5P92RL6h50K2E=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=lj62gYPJduvai57dQcn//d+33xFEZA+1K2JJao1gyWEnE9YIl0Ei4P/Ru0+M+vaanr
         AZPy7ok0F5reVH13Y6XFtEfZgXY+MPAAioe5K0ZuV3bZ9bCPpmRvBv7Jvsqj184bvcaz
         xgPhkQ7pv+c5a2QOkFnyu6cLWv1bAyiAxpfJf+ZEJuLQGv1Ig9n7vbXDJB3IVXQklMMX
         7K+rc3MfenOdO6ATTLvzZwNdKGwYNNfaspudJZDWJ855tNlPJogjd5skXMZf6K6MHA83
         Ekqxx9sNQ4uC3a+U65irRsJdmjH2uQUmm836ZYiMIvbFSVnxeNam2GhqYtgXQhxCTKRG
         LFCA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771414300; x=1772019100; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdV1rJUCcIrxXpqW6qfFzl0CgGX72K5P92RL6h50K2E=;
        b=Ab/Fcb9s9vpPmLu6tyobRyIe1ODVdMe+YsvuZhmB3w2JdXr7clR4Mo1FHMKpLvjPgq
         liX1FIfXgA/Lk3DTW3tw4hdAnfvZNPLmS0YCq7L6r/uOyz8HYp/w05FBQURar0oFBndi
         rEAbxFTg4xLekihx+6Qyrm4w5DTpPeWcN9jxtwHDEJlvM5Ew2PpY2yAMAw3N7fk8VYms
         AM1Tto/ewedqM63wL5PoCJpF4dXmW4tb38RBU9q/pEAim1DDTtVZGMF8FK8pJTjR3r+o
         ATULQgKO9uVygNSSjCTXxKKmTdGzg2LHxvzu0h94qRZAF51os20vlzBrfPGn3QR4twG8
         ByBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414300; x=1772019100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdV1rJUCcIrxXpqW6qfFzl0CgGX72K5P92RL6h50K2E=;
        b=kvXxgzZ/MeAAX70kD4H0k4OE3lZWexk5jOaa2JnyqgsW4cR/iCz7nW/4aX1GpZ1A3M
         Y91G1Z2VTQQ2f2rYK6PVNKwC1VzCWyBtQur/vXiVHXeQUZdov184ScqR+NZ3H440tEMf
         ARqH75euvCPV5eoNjd0v5sIb6magpvM4KtXGn7DQqPZLOHFwql0haXaZHp6hz6lBOg0h
         FvOv4zcGEqbv1e7WUdEXY7SYUO13XnPTZasLjhXPPIIjxSYb+7SrNd99nEuxdUDpb0Gd
         NsM9O9ia9ZQSplcJQgAHYC0EPnKJOy5Xb34LOOgyCzsxTVV5EwWimVd81G70D7lHvOj1
         2eHw==
X-Gm-Message-State: AOJu0Yy8mXMaI+EahXq11rqMyq4ohBm6xOKle5BRjKn7mvNQijA+AKll
	Zv2fb/I43sxd1DbQ+Lm2qFpdZcnQ5Ust3GVB9iRQPTW+W71pF1FsKnpnDWbfUNF2tZSP4kIIdJQ
	okf0YW6Weoob0Wz8TIoRzRAUc9j2DsRA=
X-Gm-Gg: AZuq6aJtWv6nP5ww9hcpFTGPWflupP5bndS8ZYwApFQgvXDButNmgPXUXc+qSzIlRu1
	JTk2rbaHFo7DEQ+EPbS/S1gJ470P82Z49hY8MKxDI0ZTYTGLhbOJIFiItnYVh+nUXd3KXgQYa3+
	YE1/jE1gYMolFXThM/NIQVk6J8EefFIwjSx2HVjQuTZZOHivh9Xrs+EF9En81RyUKSftPO+7d5V
	qQdbHPvGg1phGfuAmywRktvx1BnLoXBiOurRS0xkUWf2YxEoZdbH9Lgb+BlgJwyZwGO6GzsCDQD
	W5pTbA==
X-Received: by 2002:a05:6512:250b:b0:59f:8173:f0b9 with SMTP id
 2adb3069b0e04-59f8173f2d7mr1103127e87.52.1771414299117; Wed, 18 Feb 2026
 03:31:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <1e37aecc73c38669c1f3d41a4a829a5a5b54f836.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <1e37aecc73c38669c1f3d41a4a829a5a5b54f836.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 13:30:00 +0200
X-Gm-Features: AaiRm50UDIzBfUaeIoVD_xNuZeWBgCal9aDMFO_taxs3XLr73HLJazNwofz0cB4
Message-ID: <CAGeoDV_46-5RsobA8LEdKS1JnNJfef2-CTq3ugRGfgyJ40ZaAw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/19] arm/its: Add ITS VM and VPE allocation/teardown
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,hlpi.data:url];
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
X-Rspamd-Queue-Id: BFD08155E94
X-Rspamd-Action: no action

Hi Mykyta,

Thank you for the patch!

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Do necessary allocations for GICv4 VLPI injection.
> When creating a domain allocate its_vm and property tables.
> For each VCPU allocate a VPe with a unique vpe id and separate pending ta=
ble.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c             | 157 ++++++++++++----
>  xen/arch/arm/gic-v3-lpi.c             |  61 +++++-
>  xen/arch/arm/gic-v3.c                 |  18 ++
>  xen/arch/arm/gic-v4-its.c             | 259 ++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/gic_v3_its.h |  17 ++
>  xen/arch/arm/include/asm/gic_v4_its.h |   1 +
>  xen/arch/arm/include/asm/vgic.h       |   3 +
>  xen/arch/arm/vgic.c                   |  25 ++-
>  8 files changed, 496 insertions(+), 45 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 2328595a85..fb1d2709be 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -31,6 +31,8 @@
>  LIST_HEAD(host_its_list);
>
>
> +unsigned int nvpeid =3D 16;
> +
>  /*
>   * It is unlikely that a platform implements ITSes with different quirks=
,
>   * so assume they all share the same.
> @@ -228,7 +230,7 @@ int gicv3_its_wait_commands(struct host_its *hw_its)
>      return -ETIMEDOUT;
>  }
>
> -static uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu,
> +uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu,
>                                uint64_t reg)
>  {
>      reg &=3D ~GENMASK(51, 16);
> @@ -443,6 +445,54 @@ struct its_baser *its_get_baser(struct host_its *hw_=
its, uint32_t type)
>      return NULL;
>  }
>
> +bool its_alloc_table_entry(struct its_baser *baser, uint32_t id)
> +{
> +    uint64_t reg =3D baser->val;
> +    bool indirect =3D reg & GITS_BASER_INDIRECT;
> +    unsigned int idx;
> +    __le64 *table;
> +    unsigned int entry_size =3D GITS_BASER_ENTRY_SIZE(reg);
> +
> +    /* Don't allow id that exceeds single, flat table limit */
> +    if ( !indirect )
> +        return (id < (baser->table_size / entry_size));
> +
> +    /* Compute 1st level table index & check if that exceeds table limit=
 */
> +    idx =3D id / (baser->pagesz / entry_size);
> +    if ( idx >=3D (baser->pagesz / GITS_LVL1_ENTRY_SIZE) )
> +        return false;
> +
> +    table =3D baser->base;
> +
> +    /* Allocate memory for 2nd level table */
> +    if (!table[idx])
> +    {
> +        unsigned int page_size =3D baser->pagesz;
> +        void *buffer;
> +
> +        buffer =3D alloc_xenheap_pages(get_order_from_bytes(page_size),
> +                                     gicv3_its_get_memflags());
> +        if ( !buffer )
> +            return -ENOMEM;

returns -ENOMEM from a bool function, so OOM looks like
success.
---

does not zero the new L2 table before publishing it.

See, Arm IHI 0069H.b, 5.2.1 The ITS tables:

Behavior is UNPREDICTABLE if:
- Memory that is used for the level 2 tables does not contain zeros at
  the time of the new allocation for use by the ITS.
---

The L2 tables allocated here are never freed. If this is
intended as =E2=80=9Callocate once for ITS lifetime=E2=80=9D, please add a =
short
comment stating that, to avoid the appearance of a leak.

> +
> +        /* Flush Lvl2 table to PoC if hw doesn't support coherency */
> +        if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
> +            clean_and_invalidate_dcache_va_range(buffer, page_size);
> +
> +        table[idx] =3D cpu_to_le64(virt_to_maddr(buffer) | GITS_VALID_BI=
T);

Before writing virt_to_maddr(buffer) into the L1 entry, should
we validate that the physical address is encodable?

> +
> +        /* Flush Lvl1 entry to PoC if hw doesn't support coherency */
> +        if ( gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC )
> +            clean_and_invalidate_dcache_va_range(table + idx,
> +                                                 GITS_LVL1_ENTRY_SIZE);
> +
> +        /* Ensure updated table contents are visible to ITS hardware */
> +        dsb(sy);
> +    }
> +
> +    return true;
> +}
> +
>  static int its_map_baser(void __iomem *basereg, uint64_t regc,
>                           unsigned int nr_items, struct its_baser *baser)
>  {
> @@ -737,13 +787,75 @@ static int gicv3_its_map_host_events(struct host_it=
s *its,
>              return ret;
>      }
>
> -    /* TODO: Consider using INVALL here. Didn't work on the model, thoug=
h. */
> +    return 0;
> +}
> +
> +static bool its_alloc_device_table(struct host_its *hw_its, uint32_t dev=
_id)
> +{
> +    struct its_baser *baser;
> +
> +    baser =3D its_get_baser(hw_its, GITS_BASER_TYPE_DEVICE);
> +    if ( !baser )
> +        return false;
> +
> +    return its_alloc_table_entry(baser, dev_id);
> +}
> +
> +struct its_device *its_create_device(struct host_its *hw_its,
> +                                     uint32_t host_devid, uint64_t nr_ev=
ents)
> +{
> +    void *itt_addr =3D NULL;
> +    struct its_device *dev =3D NULL;
> +    int ret;
> +
> +    /* Sanitise the provided hardware values against the host ITS. */
> +    if ( host_devid >=3D BIT(hw_its->devid_bits, UL) )
> +        return NULL;
> +
> +    dev =3D xzalloc(struct its_device);
> +    if ( !dev )
> +        return NULL;
> +
> +    /* An Interrupt Translation Table needs to be 256-byte aligned. */
> +    dev->itt_order =3D get_order_from_bytes(nr_events * hw_its->itte_siz=
e);
> +    itt_addr =3D alloc_xenheap_pages(dev->itt_order, gicv3_its_get_memfl=
ags());
> +    if ( !itt_addr )
> +        goto fail_dev;
> +
> +    clean_and_invalidate_dcache_va_range(itt_addr,
> +                                         nr_events * hw_its->itte_size);

clean_and_invalidate_dcache_va_range() is unconditional.
Should this be guarded by
gicv3_its_get_cacheability() <=3D GIC_BASER_CACHE_nC
as in other paths?
It avoids a redundant flush on coherent systems.

> +
>
> -    ret =3D its_send_cmd_sync(its, 0);
> +    if ( !its_alloc_device_table(hw_its, host_devid) )
> +        goto fail_itt;
> +
> +    ret =3D its_send_cmd_mapd(hw_its, host_devid, max(fls(nr_events - 1)=
, 1U),
> +                            virt_to_maddr(itt_addr), true);
>      if ( ret )
> -        return ret;
> +        goto fail_itt;
>
> -    return gicv3_its_wait_commands(its);
> +    dev->itt_addr =3D itt_addr;
> +    dev->hw_its =3D hw_its;
> +    dev->host_devid =3D host_devid;
> +    dev->eventids =3D nr_events;
> +
> +    return dev;
> +
> +fail_itt:
> +    free_xenheap_pages(itt_addr, dev->itt_order);
> +fail_dev:
> +    xfree(dev);
> +
> +    return NULL;
> +}
> +
> +static void its_free_device(struct its_device *dev)
> +{
> +    xfree(dev->host_lpi_blocks);

does not release host LPI blocks via
gicv3_free_host_lpi_block().

> +    xfree(dev->itt_addr);

uses xfree() for itt_addr, but it comes from
alloc_xenheap_pages().

> +    if ( dev->pend_irqs )

nit: xfree checks if the provided pointer is equal to NULL

> +        xfree(dev->pend_irqs);
> +    xfree(dev);
>  }
>
>  /*
> @@ -758,12 +870,10 @@ int gicv3_its_map_guest_device(struct domain *d,
>                                 paddr_t guest_doorbell, uint32_t guest_de=
vid,
>                                 uint64_t nr_events, bool valid)
>  {
> -    void *itt_addr =3D NULL;
>      struct host_its *hw_its;
>      struct its_device *dev =3D NULL;
>      struct rb_node **new =3D &d->arch.vgic.its_devices.rb_node, *parent =
=3D NULL;
>      int i, ret =3D -ENOENT;      /* "i" must be signed to check for >=3D=
 0 below. */
> -    unsigned int order;
>
>      hw_its =3D gicv3_its_find_by_doorbell(host_doorbell);
>      if ( !hw_its )
> @@ -823,23 +933,12 @@ int gicv3_its_map_guest_device(struct domain *d,
>      if ( !valid )
>          goto out_unlock;
>
> -    ret =3D -ENOMEM;
> -
> -    /* An Interrupt Translation Table needs to be 256-byte aligned. */
> -    order =3D get_order_from_bytes(max(nr_events * hw_its->itte_size, 25=
6UL));
> -    itt_addr =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> -    if ( !itt_addr )
> -        goto out_unlock;
> -
> -    memset(itt_addr, 0, PAGE_SIZE << order);
> -
> -    clean_and_invalidate_dcache_va_range(itt_addr,
> -                                         nr_events * hw_its->itte_size);
> -
> -    dev =3D xzalloc(struct its_device);
> +    dev =3D its_create_device(hw_its, host_devid, nr_events);
>      if ( !dev )
>          goto out_unlock;
>
> +    ret =3D -ENOMEM;
> +
>      /*
>       * Allocate the pending_irqs for each virtual LPI. They will be put
>       * into the domain's radix tree upon the guest's MAPTI command.
> @@ -860,14 +959,6 @@ int gicv3_its_map_guest_device(struct domain *d,
>      if ( !dev->host_lpi_blocks )
>          goto out_unlock;
>
> -    ret =3D its_send_cmd_mapd(hw_its, host_devid, fls(nr_events - 1),
> -                            virt_to_maddr(itt_addr), true);
> -    if ( ret )
> -        goto out_unlock;
> -
> -    dev->itt_addr =3D itt_addr;
> -    dev->itt_order =3D order;
> -    dev->hw_its =3D hw_its;
>      dev->guest_doorbell =3D guest_doorbell;
>      dev->guest_devid =3D guest_devid;
>      dev->host_devid =3D host_devid;
> @@ -920,13 +1011,7 @@ out_unlock:
>
>  out:
>      if ( dev )
> -    {
> -        xfree(dev->pend_irqs);
> -        xfree(dev->host_lpi_blocks);
> -    }
> -    if ( itt_addr )
> -        free_xenheap_pages(itt_addr, order);
> -    xfree(dev);
> +        its_free_device(dev);
>
>      return ret;
>  }
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index c029d5d7a4..3c2649b695 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -58,6 +58,7 @@ static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redis=
t);
>
>  #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
>  #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
> +uint32_t lpi_id_bits;
>
>  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
>  {
> @@ -202,14 +203,11 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi,=
 int domain_id,
>      write_u64_atomic(&hlpip->data, hlpi.data);
>  }
>
> -static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
> +struct page_info *lpi_allocate_pendtable(void)
>  {
>      void *pendtable;
>      unsigned int order;
>
> -    if ( per_cpu(lpi_redist, cpu).pending_table )
> -        return -EBUSY;
> -
>      /*
>       * The pending table holds one bit per LPI and even covers bits for
>       * interrupt IDs below 8192, so we allocate the full range.
> @@ -219,20 +217,34 @@ static int gicv3_lpi_allocate_pendtable(unsigned in=
t cpu)
>      order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (u=
nsigned long)SZ_64K));
>      pendtable =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
>      if ( !pendtable )
> -        return -ENOMEM;
> +        return NULL;
>
>      memset(pendtable, 0, PAGE_SIZE << order);
>      /* Make sure the physical address can be encoded in the register. */
>      if ( virt_to_maddr(pendtable) & ~GENMASK(51, 16) )
>      {
>          free_xenheap_pages(pendtable, order);
> -        return -ERANGE;
> +        return NULL;
>      }
>      clean_and_invalidate_dcache_va_range(pendtable,
>                                           lpi_data.max_host_lpi_ids / 8);
>
> -    per_cpu(lpi_redist, cpu).pending_table =3D pendtable;
> +    return virt_to_page(pendtable);
> +}
> +
> +static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
> +{
> +    struct page_info *pendtable;
> +
> +    if ( per_cpu(lpi_redist, cpu).pending_table )
> +        return -EBUSY;
> +
> +    pendtable =3D lpi_allocate_pendtable();
> +    if ( !pendtable )
> +        return -EINVAL;
>
> +    per_cpu(lpi_redist, cpu).pending_table =3D page_to_virt(pendtable);
> +
>      return 0;
>  }
>
> @@ -274,6 +286,38 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdi=
st_base)
>      return 0;
>  }
>
> +void *lpi_allocate_proptable(void)

Since this helper is used to allocate the table programmed via
GICR_VPROPBASER (vLPI configuration table), it may be clearer to
name it lpi_allocate_vproptable() (and lpi_free_vproptable()) to avoid
confusion with the physical PROPBASER path.

> +{
> +    void *table;
> +    int order;
> +
> +    /* The property table holds one byte per LPI. */
> +    order =3D get_order_from_bytes(lpi_data.max_host_lpi_ids);

Do we really need to allocate one byte per *ID* here?

AFAIU for the (V)PROPBASER configuration table the entry for LPI N is
at (base + (N - 8192)), so the table needs only
(max_host_lpi_ids - 8192) bytes, not max_host_lpi_ids bytes.

Arm IHI 0069H.b, 5.1.1 "LPI Configuration tables" states:
  For any LPI N, the location of the table entry is defined by
  (base address + (N - 8192)).

Also see "GICv3 and GICv4 Software Overview" (DAI 0492B),
section "LPI Configuration table":

    Size in bytes =3D 2^(GICR_PROPBASER.IDbits+1) =E2=80=93 8192

The "extra bytes" are relevant for the *pending* table semantics, not
for the configuration table.  With the current allocation size, we also
init/flush only (max_host_lpi_ids - 8192) bytes, leaving a tail
uninitialized.  Either allocate the adjusted size, or init/flush the
full allocated range.
---

nit: VPROPBASER is VM-wide (vLPI configuration is global to all vPEs in
a VM). It may be worth making the chosen IDbits/table size an explicit
per-VM value, i.e. based on programmed value from VPROPBASER.

> +    table =3D alloc_xenheap_pages(order, gicv3_its_get_memflags());
> +    if ( !table )
> +        return NULL;
> +
> +    /* Make sure the physical address can be encoded in the register. */
> +    if ( (virt_to_maddr(table) & ~GENMASK(51, 12)) )
> +    {
> +        free_xenheap_pages(table, order);
> +        return NULL;
> +    }
> +    memset(table, GIC_PRI_IRQ | LPI_PROP_RES1, MAX_NR_HOST_LPIS);
> +    clean_and_invalidate_dcache_va_range(table, MAX_NR_HOST_LPIS);
> +
> +    return table;
> +}
> +
> +void lpi_free_proptable(void *vproptable)
> +{
> +    int order;
> +
> +    /* The property table holds one byte per LPI. */
> +    order =3D get_order_from_bytes(lpi_data.max_host_lpi_ids);
> +    free_xenheap_pages(vproptable, order);
> +}
> +
>  /*
>   * Tell a redistributor about the (shared) property table, allocating on=
e
>   * if not already done.
> @@ -314,7 +358,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdi=
st_base)
>      }
>
>      /* Encode the number of bits needed, minus one */
> -    reg |=3D fls(lpi_data.max_host_lpi_ids - 1) - 1;
> +    lpi_id_bits =3D fls(lpi_data.max_host_lpi_ids - 1);
> +    reg |=3D lpi_id_bits - 1;
>
>      reg |=3D virt_to_maddr(lpi_data.lpi_property);
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 14852d18c2..d4af332b0e 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -2083,6 +2083,22 @@ static bool gic_dist_supports_lpis(void)
>      return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
>  }
>
> +#ifdef CONFIG_GICV4
> +static void __init gicv4_init(void)
> +{
> +        gicv3_info.hw_version =3D GIC_V4;

We should derive the HW version from GICD/GICR/GITS_PIDR2 in the
common GICv3/4 init path instead of hard=E2=80=91coding GIC_V4 based on con=
fig.
That avoids config=E2=80=91dependent values and keeps version detection
consistent.

> +
> +
> +    gicv4_its_vpeid_allocator_init();
> +
> +}
> +#else
> +static void __init gicv4_init(void)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +#endif
> +
>  /* Set up the GIC */
>  static int __init gicv3_init(void)
>  {
> @@ -2157,6 +2173,8 @@ static int __init gicv3_init(void)
>
>      gicv3_hyp_init();
>
> +    if ( gic_is_gicv4() )
> +        gicv4_init();
>  out:
>      spin_unlock(&gicv3.lock);
>
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> index 358d0bffb9..fac3b44a94 100644
> --- a/xen/arch/arm/gic-v4-its.c
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -27,6 +27,83 @@
>  #include <asm/vgic.h>
>
>
> +/*
> + * VPE ID is at most 16 bits.
> + * Using a bitmap here limits us to 65536 concurrent VPEs.
> + */
> +static unsigned long *vpeid_mask;
> +
> +static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOCKED;
> +
> +void __init gicv4_its_vpeid_allocator_init(void)
> +{
> +    /* Allocate space for vpeid_mask based on MAX_VPEID */
> +    vpeid_mask =3D xzalloc_array(unsigned long, BITS_TO_LONGS(MAX_VPEID)=
);
> +
> +    if ( !vpeid_mask )
> +        panic("Could not allocate VPEID bitmap space\n");
> +}
> +
> +static int __init its_alloc_vpeid(struct its_vpe *vpe)

Several helpers in gic-v4-its.c are marked __init (e.g.
its_alloc_vpeid(), its_free_vpeid(), its_vpe_init(),
its_vpe_teardown()), but they are called from vcpu_vgic_init() via
vgic_v4_its_vpe_init(). This is not init-only code, and may cause
section mismatch warnings or runtime issues once init sections are
freed. Please drop __init for these functions.
---

vpe is unused

> +{
> +    int id;
> +
> +    spin_lock(&vpeid_alloc_lock);
> +
> +    id =3D find_first_zero_bit(vpeid_mask, MAX_VPEID);
> +
> +    if ( id =3D=3D MAX_VPEID )
> +    {
> +        id =3D -EBUSY;
> +        printk(XENLOG_ERR "VPEID pool exhausted\n");
> +        goto out;
> +    }
> +
> +    set_bit(id, vpeid_mask);
> +
> +out:
> +    spin_unlock(&vpeid_alloc_lock);
> +
> +    return id;
> +}
> +
> +static void __init its_free_vpeid(uint32_t vpe_id)
> +{
> +    spin_lock(&vpeid_alloc_lock);
> +
> +    clear_bit(vpe_id, vpeid_mask);
> +
> +    spin_unlock(&vpeid_alloc_lock);
> +}
> +
> +static bool __init its_alloc_vpe_entry(uint32_t vpe_id)
> +{
> +    struct host_its *hw_its;
> +
> +    /*
> +     * Make sure the L2 tables are allocated on *all* v4 ITSs. We
> +     * could try and only do it on ITSs corresponding to devices
> +     * that have interrupts targeted at this VPE, but the
> +     * complexity becomes crazy.
> +     */
> +    list_for_each_entry(hw_its, &host_its_list, entry)
> +    {
> +        struct its_baser *baser;
> +
> +        if ( !hw_its->is_v4 )
> +            continue;
> +
> +        baser =3D its_get_baser(hw_its, GITS_BASER_TYPE_VCPU);
> +        if ( !baser )
> +            return false;
> +
> +        if ( !its_alloc_table_entry(baser, vpe_id) )
> +            return false;
> +    }
> +
> +    return true;
> +}
> +
>  static int its_send_cmd_vsync(struct host_its *its, uint16_t vpeid)
>  {
>      uint64_t cmd[4];
> @@ -39,6 +116,188 @@ static int its_send_cmd_vsync(struct host_its *its, =
uint16_t vpeid)
>      return its_send_command(its, cmd);
>  }
>
> +static int its_send_cmd_vmapp(struct host_its *its, struct its_vpe *vpe,
> +                              bool valid)
> +{
> +    uint64_t cmd[4];
> +    uint16_t vpeid =3D vpe->vpe_id;
> +    uint64_t vpt_addr;
> +    int ret;
> +
> +    cmd[0] =3D GITS_CMD_VMAPP;
> +    cmd[1] =3D (uint64_t)vpeid << 32;
> +    cmd[2] =3D valid ? GITS_VALID_BIT : 0;
> +
> +    /* Unmap command */
> +    if ( !valid )
> +        goto out;
> +
> +    /* Target redistributor */
> +    cmd[2] |=3D encode_rdbase(its, vpe->col_idx, 0x0);
> +    vpt_addr =3D virt_to_maddr(vpe->vpendtable);
> +    cmd[3] =3D (vpt_addr & GENMASK(51, 16)) |
> +             ((HOST_LPIS_NRBITS - 1) & GENMASK(4, 0));
> +
> + out:
> +    ret =3D its_send_command(its, cmd);
> +
> +    return ret;
> +}
> +
> +static int its_send_cmd_vinvall(struct host_its *its, struct its_vpe *vp=
e)
> +{
> +    uint64_t cmd[4];
> +    uint16_t vpeid =3D vpe->vpe_id;
> +
> +    cmd[0] =3D GITS_CMD_VINVALL;
> +    cmd[1] =3D (uint64_t)vpeid << 32;
> +    cmd[2] =3D 0x00;
> +    cmd[3] =3D 0x00;
> +
> +    return its_send_command(its, cmd);
> +}
> +
> +static int its_map_vpe(struct host_its *its, struct its_vpe *vpe)
> +{
> +    int ret;
> +
> +    /*
> +     * VMAPP command maps the vPE to the target RDbase, including an
> +     * associated virtual LPI Pending table.
> +     */
> +    ret =3D its_send_cmd_vmapp(its, vpe, true);
> +    if ( ret )
> +        return ret;
> +
> +    ret =3D its_send_cmd_vinvall(its, vpe);
> +    if ( ret )
> +        return ret;
> +
> +    ret =3D its_send_cmd_vsync(its, vpe->vpe_id);
> +    if ( ret )
> +        return ret;

Error handling for ITS commands is minimal. If VMAPP succeeds and
VINVALL/VSYNC fails, we return without rollback or recovery.
Should we consider retrying (e.g. via CWRITER.Retry), or detect
error/stall via GITS_TYPER.SEIS / GITS_CREADR.Stalled and
unmap the VPE on failure?

> +
> +    return 0;
> +}
> +static int __init its_vpe_init(struct its_vpe *vpe)
> +{
> +    int vpe_id, rc =3D -ENOMEM;
> +    struct page_info *vpendtable;
> +    struct host_its *hw_its;
> +
> +    /* Allocate vpe id */
> +    vpe_id =3D its_alloc_vpeid(vpe);
> +    if ( vpe_id < 0 )
> +        return rc;
> +
> +    /* Allocate VPT */
> +    vpendtable =3D lpi_allocate_pendtable();
> +
> +    if ( !vpendtable )
> +        goto fail_vpt;
> +
> +    if ( !its_alloc_vpe_entry(vpe_id) )
> +        goto fail_entry;
> +
> +    rwlock_init(&vpe->lock);
> +    vpe->vpe_id =3D vpe_id;
> +    vpe->vpendtable =3D page_to_virt(vpendtable);
> +    /*
> +     * We eagerly inform all the v4 ITS and map vPE to the first
> +     * possible CPU
> +     */
> +    vpe->col_idx =3D cpumask_first(&cpu_online_map);
> +    list_for_each_entry(hw_its, &host_its_list, entry)
> +    {
> +        if ( !hw_its->is_v4 )
> +            continue;
> +
> +        if ( its_map_vpe(hw_its, vpe) )

If its_map_vpe() fails for a later ITS, we should unmap the
VPE on the ITSes already handled.  its_vpe_teardown() frees
SW allocations (vpe too) but does not undo prior VMAPPs,
leaving stale mappings behind.

> +            goto fail_entry;
> +    }
> +
> +    return 0;
> +
> + fail_entry:
> +    xfree(page_to_virt(vpendtable));

failure path frees vpendtable with xfree(),
but it was allocated with alloc_xenheap_pages().
---

The fail path frees vpendtable locally, and the caller then
calls its_vpe_teardown() on error. This risks double=E2=80=91free,
Please have a single owner for cleanup.

> + fail_vpt:
> +    its_free_vpeid(vpe_id);
> +
> +    return rc;
> +}
> +
> +static void __init its_vpe_teardown(struct its_vpe *vpe)
> +{
> +    unsigned int order;
> +
> +    order =3D get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (u=
nsigned long)SZ_64K));
> +    its_free_vpeid(vpe->vpe_id);
> +    free_xenheap_pages(vpe->vpendtable, order);
> +    xfree(vpe);
> +}
> +
> +int vgic_v4_its_vm_init(struct domain *d)
> +{
> +    unsigned int nr_vcpus =3D d->max_vcpus;
> +    int ret =3D -ENOMEM;
> +
> +    if ( !gicv3_its_host_has_its() )
> +        return 0;
> +
> +    d->arch.vgic.its_vm =3D xzalloc(struct its_vm);
> +    if ( !d->arch.vgic.its_vm )
> +        return ret;
> +
> +    d->arch.vgic.its_vm->vpes =3D xzalloc_array(struct its_vpe *, nr_vcp=
us);
> +    if ( !d->arch.vgic.its_vm->vpes )
> +        goto fail_vpes;
> +    d->arch.vgic.its_vm->nr_vpes =3D nr_vcpus;
> +
> +    d->arch.vgic.its_vm->vproptable =3D lpi_allocate_proptable();
> +    if ( !d->arch.vgic.its_vm->vproptable )
> +        goto fail_vprop;
> +
> +    return 0;
> +
> +fail_vprop:
> +    xfree(d->arch.vgic.its_vm->vpes)
> + fail_vpes:
> +    xfree(d->arch.vgic.its_vm);

use XFREE to cleanup the its_vm ptr too

> +
> +    return ret;
> +}
> +
> +void vgic_v4_free_its_vm(struct domain *d)
> +{
> +    struct its_vm *its_vm =3D d->arch.vgic.its_vm;
> +    if ( its_vm->vpes )

nit: no need to check the ptr it is done by xfree

> +        xfree(its_vm->vpes);
> +    if ( its_vm->vproptable )

nit: looks like it is safe to pass NULL ptr to lpi_free_proptable

> +        lpi_free_proptable(its_vm);

passes its_vm to lpi_free_proptable(), not
its_vm->vproptable.

> +}
> +
> +int vgic_v4_its_vpe_init(struct vcpu *vcpu)
> +{
> +    int ret;
> +    struct its_vm *its_vm =3D vcpu->domain->arch.vgic.its_vm;
> +    unsigned int vcpuid =3D vcpu->vcpu_id;
> +
> +    vcpu->arch.vgic.its_vpe =3D xzalloc(struct its_vpe);
> +    if ( !vcpu->arch.vgic.its_vpe )
> +        return -ENOMEM;
> +
> +    its_vm->vpes[vcpuid] =3D vcpu->arch.vgic.its_vpe;

its_vm->vpes[vcpuid] is assigned before its_vpe_init(). If
its_vpe_init() fails, the array keeps a stale pointer. Either
move the assignment after success, or clear it on failure.

> +    vcpu->arch.vgic.its_vpe->its_vm =3D its_vm;
> +
> +    ret =3D its_vpe_init(vcpu->arch.vgic.its_vpe);
> +    if ( ret )
> +    {
> +        its_vpe_teardown(vcpu->arch.vgic.its_vpe);
> +        return ret;
> +    }
> +    return 0;
> +}
> +
>  static int its_send_cmd_vmapti(struct host_its *its, struct its_device *=
dev,
>                                 uint32_t eventid)
>  {
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include=
/asm/gic_v3_its.h
> index bd2696f354..411beb81c8 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -77,6 +77,7 @@
>  #define GITS_BASER_ENTRY_SIZE_SHIFT     48
>  #define GITS_BASER_ENTRY_SIZE(reg)                                      =
 \
>                          ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f)=
 + 1)
> +#define GITS_LVL1_ENTRY_SIZE            8UL
>  #define GITS_BASER_SHAREABILITY_SHIFT   10
>  #define GITS_BASER_PAGE_SIZE_SHIFT      8
>  #define GITS_BASER_SIZE_MASK            0xff
> @@ -117,9 +118,19 @@
>  /* We allocate LPIs on the hosts in chunks of 32 to reduce handling over=
head. */
>  #define LPI_BLOCK                       32U
>
> +extern unsigned int nvpeid;
> +/* The maximum number of VPEID bits supported by VLPI commands */
> +#define ITS_MAX_VPEID_BITS      nvpeid
> +#define MAX_VPEID               (1UL << ITS_MAX_VPEID_BITS)
> +
>  #ifdef CONFIG_GICV4
>  #include <asm/gic_v4_its.h>
>  #endif
> +
> +extern uint32_t lpi_id_bits;
> +#define HOST_LPIS_NRBITS   lpi_id_bits
> +#define MAX_HOST_LPIS      BIT(lpi_id_bits, UL)
> +
>  /*
>   * Describes a device which is using the ITS and is used by a guest.
>   * Since device IDs are per ITS (in contrast to vLPIs, which are per
> @@ -169,6 +180,7 @@ struct host_its {
>      void *cmd_buf;
>      unsigned int flags;
>      struct its_baser tables[GITS_BASER_NR_REGS];
> +    bool is_v4;
>  };
>
>  /* Map a collection for this host CPU to each host ITS. */
> @@ -273,8 +285,13 @@ struct pending_irq *gicv3_assign_guest_event(struct =
domain *d,
>  void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                   uint32_t virt_lpi);
>  struct its_baser *its_get_baser(struct host_its *hw_its, uint32_t type);
> +bool its_alloc_table_entry(struct its_baser *baser, uint32_t id);
> +struct page_info *lpi_allocate_pendtable(void);
> +void *lpi_allocate_proptable(void);
> +void lpi_free_proptable(void *vproptable);
>  void lpi_write_config(uint8_t *prop_table, uint32_t lpi, uint8_t clr,
>                        uint8_t set);
> +uint64_t encode_rdbase(struct host_its *hw_its, unsigned int cpu, uint64=
_t reg);
>  int its_send_command(struct host_its *hw_its, const void *its_cmd);
>
>  struct its_device *get_its_device(struct domain *d, paddr_t vdoorbell,
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> index 722247ec60..fb0ef37bbe 100644
> --- a/xen/arch/arm/include/asm/gic_v4_its.h
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -49,6 +49,7 @@ struct event_vlpi_map {
>      unsigned int            nr_vlpis;
>  };
>
> +void gicv4_its_vpeid_allocator_init(void);
>  #endif
>
>  /*
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index f12d736808..580310fec4 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -414,6 +414,9 @@ bool gic_is_gicv4(void);
>  #define gic_is_gicv4() (false)
>  #endif
>
> +int vgic_v4_its_vm_init(struct domain *d);
> +void vgic_v4_free_its_vm(struct domain *d);
> +int vgic_v4_its_vpe_init(struct vcpu *vcpu);
>  #endif /* !CONFIG_NEW_VGIC */
>
>  /*** Common VGIC functions used by Xen arch code ****/
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 0da8c1a425..6baf870ad5 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -22,6 +22,7 @@
>
>  #include <asm/mmio.h>
>  #include <asm/gic.h>
> +#include <asm/gic_v3_its.h>
>  #include <asm/vgic.h>
>
>
> @@ -329,6 +330,15 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
>      for ( i =3D 0; i < NR_GIC_SGI; i++ )
>          set_bit(i, d->arch.vgic.allocated_irqs);
>
> +    if ( gic_is_gicv4() )
> +    {
> +        ret =3D vgic_v4_its_vm_init(d);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "GICv4 its vm allocation failed\n");
> +            return ret;
> +        }
> +    }
>      return 0;
>  }
>
> @@ -366,11 +376,14 @@ void domain_vgic_free(struct domain *d)
>  #endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
> +
> +    if ( gic_is_gicv4() )
> +        vgic_v4_free_its_vm(d);

vgic_v4_free_its_vm() on gic_is_gicv4() even when no
ITS, so its_vm can be NULL.


Best regards,
Mykola

>  }
>
>  int vcpu_vgic_init(struct vcpu *v)
>  {
> -    int i;
> +    int i, ret;
>
>      v->arch.vgic.private_irqs =3D xzalloc(struct vgic_irq_rank);
>      if ( v->arch.vgic.private_irqs =3D=3D NULL )
> @@ -389,6 +402,16 @@ int vcpu_vgic_init(struct vcpu *v)
>      INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
>      spin_lock_init(&v->arch.vgic.lock);
>
> +    if ( gic_is_gicv4() && gicv3_its_host_has_its())
> +    {
> +        ret =3D vgic_v4_its_vpe_init(v);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR "GICv4 its vpe allocation failed\n");
> +            return ret;
> +        }
> +    }
> +
>      return 0;
>  }
>
> --
> 2.51.2

