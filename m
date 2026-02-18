Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPn0CwCjlWmaSwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DF155E7E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 12:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235460.1538434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfku-0003qv-9I; Wed, 18 Feb 2026 11:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235460.1538434; Wed, 18 Feb 2026 11:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsfku-0003oQ-5e; Wed, 18 Feb 2026 11:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1235460;
 Wed, 18 Feb 2026 11:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsfks-0003bf-6F
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 11:30:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc865fe-0cbd-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 12:30:04 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-59e0d5c446cso5622570e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 03:30:04 -0800 (PST)
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
X-Inumbo-ID: 2bc865fe-0cbd-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771414204; cv=none;
        d=google.com; s=arc-20240605;
        b=Pgzf3bFV0w8ytvW4AyvzjdU55/Uno2IE4ZWmT+7yD/WDLfbQgpzz214GvxHdCZnywQ
         2JR02M60eTqe9QJMKeuJAyQJQ+pGWU/QaRng/LMnyEmvOmThs90/MXiZ2HSB/YRKrK+w
         iHx3lHScK4+fAxQ+ee6PgdGtGrzlc2mlW5LmDW2igp+7/rzi+LAb0l3+Eb5MNxH92yJI
         LpMlsPYTTiqSNGIaxq53p1iKYmEDeCN8P0boXvM9xygAHHGhgacTG0aRKizLR5EhgPpq
         Ia7zRnVgjN00+qJjUNvO6Vrn5pOsX6Mr3D7mgDbJE93vlEIbzwULN3og4yNm+UYEZ25h
         6uZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SM1GDmGSwQ55wea39cT22PRcVz0PHhUgIiluB5jxPKo=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=fGWz384vRwJz3nXu+qBea/ijHlc5jN78yyLgXsl5k/WJMUlvV9lyoH4yeGugYHWCgL
         EnaDDwuuK6qo7yUWOL4kyDgw7X92/MIysxBWlAvl0l9Shxr6adTqjiSgDAxa7OJOgb9h
         m052olkSdhUoNcaX64wLVYzSlWQTk2aMdYyEITXUh8H0g/+nfh8ZnSMlSbQ/WrLjykwz
         +I8Qf8mxTgBW3ZfnJtFS0G2dJsvcbkTDdM3ekF4JOwHOgoBRNhoef7pNvFvn/2QwP+s6
         Z0OGTKFsezyRVyt+VT87GASiSgE4Lvqqfim0sLqXxrPxJHAZ+pv7ImJsRdwd0KUhHn65
         zcww==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771414204; x=1772019004; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM1GDmGSwQ55wea39cT22PRcVz0PHhUgIiluB5jxPKo=;
        b=EnlM+BzDmtZe0VUq1doddqKDeKj2ExNBxGgzB9mn8igx7BlKJpjLeGIgrbnLjxrrP0
         Eb1yBeYsMbpOd+Vs0IKi1tXxbl5W5jCcBVwQJqP3ZlbvgxM9VeFZzhNJkue7CrM0PbTP
         AulKGqtNhvtdS4dsemBE95Q9UX5txmxHIQ7g46JjZnvad94ay1u1GndKjhw8StoCaOgA
         nzLhOSsmarmpPYhaxZUt0DDmnzTSC3nfdHlpOA/elUoj2WDKRytjnBTJeqtDQ6hsLdNx
         0qLYL05gZNsbmcsM7nsS+47DfejfZ3Ccon/+XU9bXfGaB8rLvhRBJPjy/Lj+JfOmG/dA
         bFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771414204; x=1772019004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SM1GDmGSwQ55wea39cT22PRcVz0PHhUgIiluB5jxPKo=;
        b=AGCKfcAU9lqk5nTWweDo2cIltAS+aQN4PQ/cwOVmkJvbYta4BwxQJIstkuaPqH4mDA
         dK9bmxlI9BzJf2IQ9yQrnZ+OMKDfe87MKtvSl/+kI7srEkUlwnQPJK6BT/edX1XOiK/k
         jh8cuRBUl9Fv0t95Fo1eeD95dkwHEN4uaL5t/QZUr32U0KAbdurINbQAFh3xp3Ys4+7u
         drw30PimUhV2nPAwASUHMUPSXiiXTImsJ/GdgPbB+3/4DVAtyXzDRYcWjGsfRVQGrjoC
         qfqgEaPFhvrrR7Rf68+Def0crE9zic9/POoub5pPFnmO2rgfzmHf65ZMkqj9UFIdOxxE
         aPng==
X-Gm-Message-State: AOJu0YyuMlsjFSphqUKR5hpBi3i0mAdAk5piKOyWALoxO4EAbHjP2EmX
	G/fg8e7XBsrTH9967fGnSD8ManuB3EElVN6I4lg0olFrD+azg4hpS51Kp9NU/qNXFD9ZH+FqOY2
	2OvI6b6Zz/khYQ0bc3UQyS/eQkidHNP8=
X-Gm-Gg: AZuq6aIy0mj1VI2f2p7vRpde9dEq6Tb76OPIjcX/4f7YCxIcdp1sunjHj1My/2sQz10
	ivwleZqqWnYem8a3YsXMbTdXxGD3fPQlupOdq5x0iOVQE5D926JbQLOOzO/M3OgEV3iu1DYwt67
	Gjc0Da4GVkSvpaIkt/uhyeJn6/3c7o5KD+8bliK3+cOVdHgjv6HxRxlmoP6u/Z9EcGpFlonqhI9
	NCEibaXCkuAyA3MutcgtzRa4xCAt5DikKpwf5XmXR40RWQp2EugPdXtck3x8QbvfTpXJXS96tjz
	zW0ang==
X-Received: by 2002:a05:6512:3d03:b0:59e:39af:a70c with SMTP id
 2adb3069b0e04-59f83bc21cfmr537720e87.46.1771414203773; Wed, 18 Feb 2026
 03:30:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <6eee1cbcbfc221b0a6af00f7ec5ccc52f8bd5b75.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <6eee1cbcbfc221b0a6af00f7ec5ccc52f8bd5b75.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 13:30:00 +0200
X-Gm-Features: AaiRm52xyBeRm91RyPK0I2h_h6RAGSKr83z1z4zK6_QrSWXpdscmc0pKtt9OcXo
Message-ID: <CAGeoDV9Piac4yXQ9NH6simkFeD1867C+_Vq7TkRESgQXZ57YOw@mail.gmail.com>
Subject: Re: [RFC PATCH 13/19] arm/gic: VPE scheduling
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: 853DF155E7E
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> GICv4 needs to know which VCPU is currently scheduled to be able to
> deliver VLPIs. Implement switching of VPEs on VCPU context switch by
> extending the existing save/restore mechanism used for GICv2 and GICv3.
>
> Scheduling a VPE is done by setting up the VPENDBASER and VPROPBASER
> registers to the appropriate tables for the currently running VCPU. When
> scheduling out, preserve the IDAI and PendingLast bits from VPENDBASER.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v2.c                  |   2 +-
>  xen/arch/arm/gic-v3.c                  |   9 +-
>  xen/arch/arm/gic-v4-its.c              | 138 +++++++++++++++++++++++++
>  xen/arch/arm/gic-vgic.c                |   6 ++
>  xen/arch/arm/include/asm/gic.h         |   2 +-
>  xen/arch/arm/include/asm/gic_v3_defs.h |   6 ++
>  xen/arch/arm/include/asm/gic_v4_its.h  |   9 ++
>  xen/arch/arm/include/asm/vgic.h        |   2 +
>  8 files changed, 170 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 0cd41eac12..c16fa5d67e 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -181,7 +181,7 @@ static void gicv2_save_state(struct vcpu *v)
>      writel_gich(0, GICH_HCR);
>  }
>
> -static void gicv2_restore_state(const struct vcpu *v)
> +static void gicv2_restore_state(struct vcpu *v)
>  {
>      int i;
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index d4af332b0e..07736179db 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -133,7 +133,7 @@ bool gic_is_gicv4(void)
>  #endif
>
>  /* per-cpu re-distributor base */
> -static DEFINE_PER_CPU(void __iomem*, rbase);
> +DEFINE_PER_CPU(void __iomem*, rbase);
>
>  #define GICD                   (gicv3.map_dbase)
>  #define GICD_RDIST_BASE        (this_cpu(rbase))
> @@ -475,13 +475,15 @@ static void gicv3_save_state(struct vcpu *v)
>       * are now visible to the system register interface
>       */
>      dsb(sy);
> +    if ( gic_is_gicv4() )
> +        vgic_v4_put(v, false);
>      gicv3_save_lrs(v);
>      save_aprn_regs(&v->arch.gic);
>      v->arch.gic.v3.vmcr =3D READ_SYSREG(ICH_VMCR_EL2);
>      v->arch.gic.v3.sre_el1 =3D READ_SYSREG(ICC_SRE_EL1);
>  }
>
> -static void gicv3_restore_state(const struct vcpu *v)
> +static void gicv3_restore_state(struct vcpu *v)
>  {
>      register_t val;
>
> @@ -510,6 +512,9 @@ static void gicv3_restore_state(const struct vcpu *v)
>      restore_aprn_regs(&v->arch.gic);
>      gicv3_restore_lrs(v);
>
> +    if ( gic_is_gicv4() )
> +        vgic_v4_load(v);
> +
>      /*
>       * Make sure all stores are visible the GIC
>       */
> diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
> index fac3b44a94..6a550a65b2 100644
> --- a/xen/arch/arm/gic-v4-its.c
> +++ b/xen/arch/arm/gic-v4-its.c
> @@ -18,6 +18,7 @@
>   * GNU General Public License for more details.
>   */
>
> +#include <xen/delay.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>  #include <xen/spinlock.h>
> @@ -44,6 +45,21 @@ void __init gicv4_its_vpeid_allocator_init(void)
>          panic("Could not allocate VPEID bitmap space\n");
>  }
>
> +static void __iomem *gic_data_rdist_vlpi_base(unsigned int cpu)
> +{
> +    /*
> +     * Each Redistributor defines two 64KB frames in the physical addres=
s map.
> +     * In GICv4, there are two additional 64KB frames.
> +     * The frames for each Redistributor must be contiguous and must be
> +     * ordered as follows:
> +     * 1. RD_base
> +     * 2. SGI_base
> +     * 3. VLPI_base
> +     * 4. Reserved
> +     */
> +    return GICD_RDIST_BASE_CPU(cpu) + SZ_128K;
> +}
> +
>  static int __init its_alloc_vpeid(struct its_vpe *vpe)
>  {
>      int id;
> @@ -571,3 +587,125 @@ int its_send_cmd_vinv(struct host_its *its, struct =
its_device *dev,
>
>      return gicv3_its_wait_commands(its);
>  }
> +
> +static uint64_t read_vpend_dirty_clean(void __iomem *vlpi_base,
> +                                       unsigned int count)
> +{
> +    uint64_t val;
> +    bool clean;
> +
> +    do {
> +        val =3D gits_read_vpendbaser(vlpi_base + GICR_VPENDBASER);
> +        /* Poll GICR_VPENDBASER.Dirty until it reads 0. */
> +        clean =3D !(val & GICR_VPENDBASER_Dirty);
> +        if ( !clean )
> +        {
> +            count--;
> +            cpu_relax();
> +            udelay(1);
> +        }
> +    } while ( !clean && count );
> +
> +    if ( !clean )
> +    {
> +        printk(XENLOG_WARNING "ITS virtual pending table not totally par=
sed\n");
> +        val |=3D GICR_VPENDBASER_PendingLast;
> +    }
> +
> +    return val;
> +}
> +
> +/*
> + * When a vPE is made resident, the GIC starts parsing the virtual pendi=
ng
> + * table to deliver pending interrupts. This takes place asynchronously,
> + * and can at times take a long while.
> + */
> +static void its_wait_vpt_parse_complete(void __iomem *vlpi_base)
> +{
> +    if ( !gic_support_vptValidDirty() )
> +        return;
> +
> +    read_vpend_dirty_clean(vlpi_base, 500);
> +}
> +
> +static uint64_t its_clear_vpend_valid(void __iomem *vlpi_base, uint64_t =
clr,
> +                                      uint64_t set)
> +{
> +    unsigned int count =3D 1000000;    /* 1s! */

The 1s timeout looks too large for a context=E2=80=91switch path.
Consider a much smaller bound (or async handling) and warn on
timeout, rather than potentially stalling the scheduler.

> +    uint64_t val;
> +
> +    /*
> +     * Clearing the Valid bit informs the Redistributor that a context
> +     * switch is taking place.
> +     */
> +    val =3D gits_read_vpendbaser(vlpi_base + GICR_VPENDBASER);
> +    val &=3D ~GICR_VPENDBASER_Valid;
> +    val &=3D ~clr;
> +    val |=3D set;
> +    gits_write_vpendbaser(val, vlpi_base + GICR_VPENDBASER);
> +
> +    return read_vpend_dirty_clean(vlpi_base, count);
> +}
> +
> +static void its_make_vpe_resident(struct its_vpe *vpe, unsigned int cpu)
> +{
> +    void __iomem *vlpi_base =3D gic_data_rdist_vlpi_base(cpu);
> +    uint64_t val;
> +
> +    /* Switch in this VM's virtual property table. */
> +    val  =3D virt_to_maddr(vpe->its_vm->vproptable) & GENMASK(51, 12);
> +    val |=3D gicv3_its_get_cacheability() << GICR_VPROPBASER_INNER_CACHE=
ABILITY_SHIFT;
> +    val |=3D gicv3_its_get_shareability() << GICR_VPROPBASER_SHAREABILIT=
Y_SHIFT;
> +    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_VPROPBASER_OUTER_CACHEA=
BILITY_SHIFT;

Nit: cacheability/shareability are taken from a global ITS quirk.
If different ITSes can report different attributes, we would need
per=E2=80=91ITS values here. Otherwise, a short note that Xen assumes
homogeneous ITS attributes would help.

> +    val |=3D (HOST_LPIS_NRBITS - 1) & GICR_VPROPBASER_IDBITS_MASK;
> +    gits_write_vpropbaser(val, vlpi_base + GICR_VPROPBASER);

The VPROPBASER value is constant per VM. We could precompute
and store it in struct its_vm at init, then just write the
cached value here instead of recomputing each time.

> +
> +    /* Switch in this VCPU's VPT. */
> +    val  =3D virt_to_maddr(vpe->vpendtable) & GENMASK(51, 16);
> +    val |=3D gicv3_its_get_cacheability() << GICR_VPENDBASER_INNER_CACHE=
ABILITY_SHIFT;
> +    val |=3D gicv3_its_get_shareability() << GICR_VPENDBASER_SHAREABILIT=
Y_SHIFT;
> +    val |=3D GIC_BASER_CACHE_SameAsInner << GICR_VPENDBASER_OUTER_CACHEA=
BILITY_SHIFT;
> +    /*
> +     * When the GICR_VPENDBASER.Valid bit is written from 0 to 1,
> +     * this bit is RES1.
> +     */
> +    val |=3D GICR_VPENDBASER_PendingLast;
> +    val |=3D vpe->idai ? GICR_VPENDBASER_IDAI : 0;
> +    val |=3D GICR_VPENDBASER_Valid;
> +    gits_write_vpendbaser(val, vlpi_base + GICR_VPENDBASER);
> +
> +    its_wait_vpt_parse_complete(vlpi_base);
> +}
> +
> +static void its_make_vpe_non_resident(struct its_vpe *vpe, unsigned int =
cpu)
> +{
> +    void __iomem *vlpi_base =3D gic_data_rdist_vlpi_base(cpu);
> +    uint64_t val;
> +
> +    val =3D its_clear_vpend_valid(vlpi_base, 0, 0);
> +    vpe->idai =3D val & GICR_VPENDBASER_IDAI;
> +    vpe->pending_last =3D val & GICR_VPENDBASER_PendingLast;
> +}
> +
> +void vgic_v4_load(struct vcpu *vcpu)
> +{
> +    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
> +
> +
> +    if ( vpe->resident )

gicv3_restore_state() call vgic_v4_load when
gic_is_gicv4() is true, even if its_vpe is NULL.

The same story about vgic_v4_put.

> +        return;
> +
> +    its_make_vpe_resident(vpe, vcpu->processor);
> +    vpe->resident =3D true;
> +}
> +
> +void vgic_v4_put(struct vcpu *vcpu, bool need_db)

nit: unused need_db

> +{
> +    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
> +
> +    if ( !vpe->resident )
> +        return;
> +
> +    its_make_vpe_non_resident(vpe, vcpu->processor);
> +    vpe->resident =3D false;
> +}
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index ea48c5375a..44db142dbd 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -377,6 +377,12 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
>          }
>      }
>
> +#ifdef CONFIG_GICV4
> +    if ( gic_is_gicv4() )
> +        if ( v->arch.vgic.its_vpe->pending_last )

Should we check its_vpe too?

> +            rc =3D 1;
> +#endif
> +
>  out:
>      spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>      return rc;
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index afb1cc3751..04a20bdca5 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -362,7 +362,7 @@ struct gic_hw_operations {
>      /* Save GIC registers */
>      void (*save_state)(struct vcpu *v);
>      /* Restore GIC registers */
> -    void (*restore_state)(const struct vcpu *v);
> +    void (*restore_state)(struct vcpu *v);
>      /* Dump GIC LR register information */
>      void (*dump_state)(const struct vcpu *v);
>
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index 3a7d18ef59..0db75309cf 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -257,6 +257,12 @@ struct rdist_region {
>      bool single_rdist;
>  };
>
> +/* per-cpu re-distributor base */
> +DECLARE_PER_CPU(void __iomem*, rbase);
> +
> +#define GICD_RDIST_BASE             (this_cpu(rbase))

looks like possible macro redefinition, see gic-v3.c

Best regards,
Mykola


> +#define GICD_RDIST_BASE_CPU(cpu)    (per_cpu(rbase, cpu))
> +
>  #endif /* __ASM_ARM_GIC_V3_DEFS_H__ */
>
>  /*
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> index ba81b25bde..37b6b92f0c 100644
> --- a/xen/arch/arm/include/asm/gic_v4_its.h
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -56,6 +56,15 @@ void gicv4_its_vpeid_allocator_init(void);
>  #define GICR_VPROPBASER                              0x0070
>  #define GICR_VPENDBASER                              0x0078
>
> +#define GICR_VPROPBASER_OUTER_CACHEABILITY_SHIFT         56
> +#define GICR_VPROPBASER_SHAREABILITY_SHIFT               10
> +#define GICR_VPROPBASER_SHAREABILITY_MASK                \
> +        (3UL << GICR_VPROPBASER_SHAREABILITY_SHIFT)
> +#define GICR_VPROPBASER_INNER_CACHEABILITY_SHIFT          7
> +#define GICR_VPROPBASER_INNER_CACHEABILITY_MASK           \
> +        (7UL << GICR_VPROPBASER_INNER_CACHEABILITY_SHIFT)
> +#define GICR_VPROPBASER_IDBITS_MASK                    0x1f
> +
>  #define GICR_VPENDBASER_Dirty                   (1UL << 60)
>  #define GICR_VPENDBASER_PendingLast             (1UL << 61)
>  #define GICR_VPENDBASER_IDAI                    (1UL << 62)
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 580310fec4..9ef667decb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -417,6 +417,8 @@ bool gic_is_gicv4(void);
>  int vgic_v4_its_vm_init(struct domain *d);
>  void vgic_v4_free_its_vm(struct domain *d);
>  int vgic_v4_its_vpe_init(struct vcpu *vcpu);
> +void vgic_v4_load(struct vcpu *vcpu);
> +void vgic_v4_put(struct vcpu *vcpu, bool need_db);
>  #endif /* !CONFIG_NEW_VGIC */
>
>  /*** Common VGIC functions used by Xen arch code ****/
> --
> 2.51.2

