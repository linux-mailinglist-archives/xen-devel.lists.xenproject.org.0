Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PEz7Lch6jWng3AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:01:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15212AD24
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 08:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228399.1534578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqQga-00043C-5T; Thu, 12 Feb 2026 07:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228399.1534578; Thu, 12 Feb 2026 07:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqQgZ-00040b-Vb; Thu, 12 Feb 2026 07:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1228399;
 Thu, 12 Feb 2026 07:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5O3t=AQ=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vqQgY-000403-MV
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 07:00:22 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eadf16d-07e0-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 08:00:20 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3870cbd6c40so10671861fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 23:00:20 -0800 (PST)
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
X-Inumbo-ID: 7eadf16d-07e0-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770879620; cv=none;
        d=google.com; s=arc-20240605;
        b=Wssv3nUY28sMmmFYDK1ZHIqSPzVEvsEpzGx6WN6P/sG4r2a/6eix8pP2w3wQerBCPs
         LQNI65NXrkrbm7eFn+L/b+8Rokehya8er50t2yI/94xYe1/0OwuZgSAyXq+XQiKSp5zQ
         TpWfzKhTweNsGOJ4wuotLG7p6kF9ZP+RYOVuCEeHZJDxkTLEQgtFin78+BPSilLpqn0a
         ItvEPDCQpShu3CJA3s7AAQOvMxBGMV31OougNqS49LnohGpDBKO8ZHrx+wvtKVX5bo8A
         7Md8a0f8DjCDxk0J/hdVCXkR/tZ6HqHhZ+wGDFt5ZGGSD8oK8WYduNmQhYD24uu1tui6
         gI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1rlXMFCHPokxGDykZFjevkec0zeDy42tWXHLcUNUvFE=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=Ll37S09WNG3jo/D1O5KsXrxOcKV9IsUptiJ7UehBsBlCk9tJqzEIuVrhKBMe8fsM+B
         +EPZQzMm05jhHe+f9Eftn7Csiw4XRiVGQfn9P7IdJHr9HAkNBtTTcgQf/pg5qec1yJNY
         gmM6QPRL22hDJRFYfUrkir38kRZMN3wuey0Bi2Qrkb0oXvYnB2wExLCUj4ikICjVqF9Q
         YNOyG2RKpQ+wcvbQjUr84ZtYoN7jKDbKPo4937m/ctvb+B4flWb3XmHaZ62LcQE2+siO
         g1paWvQJBqpkvhRwTfUsL6fdZ2xx9vyughr8kYLG2l9qsQvPDhq215clGCmjghzZ17At
         DDSA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770879620; x=1771484420; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rlXMFCHPokxGDykZFjevkec0zeDy42tWXHLcUNUvFE=;
        b=caPHOziiF9U5ojXKcE7ABsTcwXnxw1a8uBoSCMCYb+aUqp5Ym90N0t9ptN7o+hHaOb
         sE2HII4wkyad1Fb4GVet4oQeJRbzzmpMWEyDNlikJRYR9KB/RTHLPxqPdpm+7p8sPXoC
         j5EgoCLdKg493WZcE1dABPHFSCXLG9CoYSucqz/TwpYLnYVLhYKApvnbWbSTna1X0fmX
         7L+lssOgSZQJl2cwu+YtVXK3UOQQ/S4QrPc+8SVNmB4gRepzE48krWG8GqyjE5+lUr9r
         YcSo90cLPKMvyPDjs7lrc89uIBWK8DF3CECpvRiC3vV3EwIsb+G/DqZaKwFaIxMXVP5a
         P2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770879620; x=1771484420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1rlXMFCHPokxGDykZFjevkec0zeDy42tWXHLcUNUvFE=;
        b=nLzhsf3u4g7PyjnoWKP0MSGa6/qfZnqD5oCJGdAuxJJcHWhI2t0fasuENz0RWWh+zM
         TTp58E0huCvsVUYND2m/bf5HRdS+ZnYA8EHcdjxZ1EKqZaxE1KOx0z/4Xwdy0+WueTxP
         RdzzjKADkht3l+Gf12n4shRLynWZjxlstzQAOR7AtDJFK4s0lV2IpDT1keKajR498r8N
         61z+Zr6+ah9xon80kUuswUhbCOOC5H5hHMqEoUciTZSWCL3kItV4Pez48H0S49rJOkd0
         bE42eKtMQMLRtgJ1GKEI6DILWOF+Kv+AcPeEqqqRp+/zzx1z0ZLcCgOzbp6abcWLkTSf
         vdyw==
X-Gm-Message-State: AOJu0YwjVX9q0o45nN3hPbFGlLx9akKcgf5HIlw5y4xpI/Gdb7mg6gx+
	RkASotT0TtOmBmpkmpnNdTBvwDupnf2c4uukHqWgL/LskmQLbLONRsJw2GyYqtsWiSJkm9lpwyU
	VOHKSk7uNY2EiAfDO/3YFjFxJvBdWsiE=
X-Gm-Gg: AZuq6aLF66Wb1dtQLMvcqwSSaprcNK75lfEi7J46Z8FADbg08eUI5wMrpbsjrfSG+HG
	fN9Zijk6MLeWGL3iRhUl4U+nyblmxkDS1QVY0a/7Pol/8otl7mSOrzwNNiRbKU+c7Udaa4/UBa5
	ivQK9oy8FOPQf0D0fcRbwKnAfoMnTIMfWlESvnmeO9MsZzfachY2sOcONWE1RQRrRb8DiOuC1m0
	56nxuzf3ZRY3THYVLJ0fOIPnsDhJvOsyW6MPq694MoCQdS5ekl+owGsrZvTTAfgUXR9jI/+ZnlM
	BTKgNg==
X-Received: by 2002:a2e:a80f:0:b0:385:da34:5182 with SMTP id
 38308e7fff4ca-38710f42be6mr5317481fa.13.1770879619465; Wed, 11 Feb 2026
 23:00:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <2687fa1a798f002b3126cdc851812be86c4cd8f1.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <2687fa1a798f002b3126cdc851812be86c4cd8f1.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 12 Feb 2026 09:00:00 +0200
X-Gm-Features: AZwV_QgeVlFkLrWgYdX-KzHFARPfMqKPD07LMryFaSJAlC-ZHvN6vB6_p-TDU5U
Message-ID: <CAGeoDV9kNdi7kPnp4cXjEkpysVRP62TOrTkQZdSs0pX9Szpa8g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/19] arm/gic: Keep track of GIC features
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
X-Rspamd-Queue-Id: 0C15212AD24
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Different versions of GICv4 may support different features. Record them
> and provide functions to check for their availability.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/gic-v3.c                  | 175 ++++++++++++++++++++-----
>  xen/arch/arm/include/asm/gic.h         |   2 +
>  xen/arch/arm/include/asm/gic_v3_defs.h |   9 ++
>  xen/arch/arm/include/asm/vgic.h        |   9 ++
>  4 files changed, 162 insertions(+), 33 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 9b8b87078b..14852d18c2 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -100,6 +100,38 @@ static struct {
>
>  static struct gic_info gicv3_info;
>
> +#ifdef CONFIG_GICV4
> +/* Global state */
> +static struct {
> +    bool has_vlpis;
> +    bool has_direct_lpi;
> +    bool has_vpend_valid_dirty;
> +    bool has_rvpeid;
> +} gicv4 =3D { .has_vlpis =3D true, .has_direct_lpi =3D true,
> +            .has_vpend_valid_dirty =3D true, .has_rvpeid =3D true, };
> +
> +
> +bool gic_support_directLPI(void)
> +{
> +    return gicv4.has_direct_lpi;
> +}
> +
> +bool gic_support_vptValidDirty(void)
> +{
> +    return gicv4.has_vpend_valid_dirty;
> +}
> +
> +bool gic_has_v4_1_extension(void)
> +{
> +    return gicv4.has_rvpeid;
> +}
> +
> +bool gic_is_gicv4(void)
> +{
> +    return gicv4.has_vlpis;

gicv4.has_vlpis indicates vLPI/direct-injection support, not the GIC
architecture revision. A GICv4 implementation may have no vLPIs (only
pLPIs), so gic_is_gicv4() can return a false negative. If the intent
is to check the arch version, please use GICD_PIDR2/GICR_PIDR2.ArchRev
(e.g. ArchRev=3D=3D4).

> +}
> +#endif
> +
>  /* per-cpu re-distributor base */
>  static DEFINE_PER_CPU(void __iomem*, rbase);
>
> @@ -914,7 +946,8 @@ static bool gicv3_enable_lpis(void)
>      return true;
>  }
>
> -static int __init gicv3_populate_rdist(void)
> +static int __init gic_iterate_rdists(int (*fn)(struct rdist_region *,
> +                                               void __iomem *))
>  {
>      int i;
>      uint32_t aff;
> @@ -958,40 +991,16 @@ static int __init gicv3_populate_rdist(void)
>
>              if ( (typer >> 32) =3D=3D aff )
>              {
> +                int ret;
> +
>                  this_cpu(rbase) =3D ptr;
>
> -                if ( typer & GICR_TYPER_PLPIS )
> -                {
> -                    paddr_t rdist_addr;
> -                    unsigned int procnum;
> -                    int ret;
> -
> -                    /*
> -                     * The ITS refers to redistributors either by their =
physical
> -                     * address or by their ID. Which one to use is an IT=
S
> -                     * choice. So determine those two values here (which=
 we
> -                     * can do only here in GICv3 code) and tell the
> -                     * ITS code about it, so it can use them later to be=
 able
> -                     * to address those redistributors accordingly.
> -                     */
> -                    rdist_addr =3D gicv3.rdist_regions[i].base;
> -                    rdist_addr +=3D ptr - gicv3.rdist_regions[i].map_bas=
e;
> -                    procnum =3D (typer & GICR_TYPER_PROC_NUM_MASK);
> -                    procnum >>=3D GICR_TYPER_PROC_NUM_SHIFT;
> -
> -                    gicv3_set_redist_address(rdist_addr, procnum);
> -
> -                    ret =3D gicv3_lpi_init_rdist(ptr);
> -                    if ( ret && ret !=3D -ENODEV )
> -                    {
> -                        printk("GICv3: CPU%d: Cannot initialize LPIs: %u=
\n",
> -                               smp_processor_id(), ret);
> -                        break;
> -                    }
> -                }

nit: if we call the v4 capability update here we can avoid the extra
RD iteration and most of the diff
#ifdef CONFIG_GICV4
    gicv4_update_lpi_properties()
#endif

> -
> -                printk("GICv3: CPU%d: Found redistributor in region %d @=
%p\n",
> -                        smp_processor_id(), i, ptr);
> +                ret =3D fn(gicv3.rdist_regions + i, ptr);
> +                if ( ret )
> +                    return ret;
> +
> +                printk("GICv3: CPU%d: Found redistributor @%p\n",

nit: maybe better to print correct version of GIC
      the same applies to other prints

> +                       smp_processor_id(), ptr);
>                  return 0;
>              }
>
> @@ -1010,11 +1019,107 @@ static int __init gicv3_populate_rdist(void)
>          } while ( !(typer & GICR_TYPER_LAST) );
>      }
>
> +    return -ENODEV;
> +}
> +
> +static int __init __gicv3_populate_rdist(struct rdist_region *region,
> +                                         void __iomem *ptr)
> +{
> +    uint64_t typer;
> +
> +    typer =3D readq_relaxed(ptr + GICR_TYPER);
> +    if ( typer & GICR_TYPER_PLPIS )
> +    {
> +        paddr_t rdist_addr;
> +        unsigned int procnum;
> +        int ret;
> +
> +        /*
> +         * The ITS refers to redistributors either by their physical
> +         * address or by their ID. Which one to use is an ITS
> +         * choice. So determine those two values here (which we
> +         * can do only here in GICv3 code) and tell the
> +         * ITS code about it, so it can use them later to be able
> +         * to address those redistributors accordingly.
> +         */
> +        rdist_addr =3D region->base;
> +        rdist_addr +=3D ptr - region->map_base;
> +        procnum =3D (typer & GICR_TYPER_PROC_NUM_MASK);
> +        procnum >>=3D GICR_TYPER_PROC_NUM_SHIFT;
> +
> +        gicv3_set_redist_address(rdist_addr, procnum);
> +
> +        ret =3D gicv3_lpi_init_rdist(ptr);
> +        if ( ret && ret !=3D -ENODEV )
> +        {
> +            printk("GICv3: CPU%d: Cannot initialize LPIs: %d\n",
> +                   smp_processor_id(), ret);
> +            printk("%s %d\n", __func__, __LINE__);
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int __init gicv3_populate_rdist(void)
> +{
> +    int ret =3D gic_iterate_rdists(__gicv3_populate_rdist);
> +    if ( ret =3D=3D 0)
> +        return 0;
> +
>      dprintk(XENLOG_ERR, "GICv3: CPU%d: mpidr 0x%"PRIregister" has no re-=
distributor!\n",
>              smp_processor_id(), cpu_logical_map(smp_processor_id()));
> +    return -ENODEV;
> +}
> +
> +#ifdef CONFIG_GICV4
> +static int __init __gicv4_update_vlpi_properties(struct rdist_region *re=
gion,

nit: the function updates more than vLPI properties (it also sets
has_direct_lpi),
     so maybe rename it to include =E2=80=9Clpi=E2=80=9D rather than =E2=80=
=9Cvlpi=E2=80=9D.

> +                                                 void __iomem *ptr)
> +{
> +    uint64_t typer;
> +
> +    typer =3D readq_relaxed(ptr + GICR_TYPER);
> +    gicv4.has_vlpis &=3D !!(typer & GICR_TYPER_VLPIS);

Might be worth documenting that we treat these RD capabilities as global:
if any Redistributor lacks a feature, we disable it system-wide.

> +    gicv4.has_rvpeid &=3D !!(typer & GICR_TYPER_RVPEID);
> +    /* RVPEID implies some form of DirectLPI. */
> +    gicv4.has_direct_lpi &=3D (!!(typer & GICR_TYPER_DirectLPIS) ||

It was not clear to me from the comment above why we use RVPEID here:

> +                             !!(typer & GICR_TYPER_RVPEID));

Looking at Arm IHI 0069H.b, the invalidate/sync registers are mandatory not
only when GICR_TYPER.Direct* is set, but also when GICR_CTLR.IR =3D=3D 1, a=
nd
also whenever GICv4.1 is implemented. See 12.11.20 *GICR_INVLPIR*,
=E2=80=9CAccessing the GICR_INVLPIR=E2=80=9D.

RVPEID is a GICv4.1-only field, and it does not directly describe the
presence of the DirectLPI/invalidate registers. My understanding from the
GICR_VPENDBASER layout is that the v4.1 encoding uses a vPEID field, while
the v4.0 encoding uses a VPT physical address. If that interpretation is
correct, then RVPEID would always be set when GICv4.1 is present, which
makes the current check somewhat redundant (and it would be good to explain
that in the comment).

For reference, the GIC-700 / GIC-700AE TRMs describe RVPEID as indicating
whether GICR_VPENDBASER records the index (vPEID) into the vPE configuratio=
n
table (i.e. whether GICv4.1 support is present).

Given the above, I think it would be better to also include GICR_CTLR.IR
here (as the Linux kernel does), and add a short comment explaining the use
of RVPEID.
---

nit: we can just use gicv4.has_rvpeid here

> +    gicv4.has_vpend_valid_dirty &=3D !!(typer & GICR_TYPER_DIRTY);
> +
> +    /* Detect non-sensical configurations */
> +    if ( gicv4.has_rvpeid && !gicv4.has_vlpis )
> +    {
> +        gicv4.has_direct_lpi =3D false;
> +        gicv4.has_vlpis =3D false;

nit: 'gicv4.has_vlpis =3D false' is redundant here since the condition
already has '!gicv4.has_vlpis'

> +        gicv4.has_rvpeid =3D false;
> +    }
> +
> +    printk("GICv4: CPU%d: %sVLPI support, %sdirect LPI support, %sValid+=
Dirty support, %sRVPEID support\n",

nit: Xen may run on GICv3 even with CONFIG_GICV4 code enabled; please
avoid hardcoding "GICv4"

> +           smp_processor_id(), !!(typer & GICR_TYPER_VLPIS) ? "" : "no "=
,
> +           (!!(typer & GICR_TYPER_DirectLPIS) ||
> +            !!(typer & GICR_TYPER_RVPEID)) ? "" : "no ",
> +           !!(typer & GICR_TYPER_DIRTY) ? "" : "no ",
> +           !!(typer & GICR_TYPER_RVPEID) ? "" : "no ");
> +
> +    return 0;
> +}
> +
> +static int __init gicv4_update_vlpi_properties(void)
> +{
> +    int ret =3D gic_iterate_rdists(__gicv4_update_vlpi_properties);
> +
> +    if ( ret =3D=3D 0 )
> +        return 0;
>
>      return -ENODEV;
>  }
> +#else
> +static int __init gicv4_update_vlpi_properties(void)
> +{
> +    return 0;
> +}
> +#endif
>
>  static int gicv3_cpu_init(void)
>  {
> @@ -1024,6 +1129,10 @@ static int gicv3_cpu_init(void)
>      if ( gicv3_populate_rdist() )
>          return -ENODEV;
>
> +    ret =3D gicv4_update_vlpi_properties();
> +    if ( ret )
> +        return ret;
> +
>      if ( gicv3_enable_redist() )
>          return -ENODEV;
>
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gi=
c.h
> index 8e713aa477..afb1cc3751 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -235,6 +235,8 @@ enum gic_version {
>      GIC_INVALID =3D 0,    /* the default until explicitly set up */
>      GIC_V2,
>      GIC_V3,
> +    GIC_V4,
> +    GIC_V4_1,
>  };
>
>  DECLARE_PER_CPU(uint64_t, lr_mask);
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/includ=
e/asm/gic_v3_defs.h
> index c373b94d19..3a7d18ef59 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -93,6 +93,12 @@
>
>  #define GICD_TYPE_LPIS               (1U << 17)
>
> +#define GICD_TYPER2                  0x000c
> +
> +#define GICD_TYPER2_VIL              (1U << 7)
> +#define GICD_TYPER2_VID              GENMASK(4, 0)
> +#define GICD_TYPER2_nASSGIcap        (1U << 8)
> +

nit: GICD_TYPER2 and related bit definitions are not used anywhere in this
     series.


Best regards,
Mykola

>  #define GICD_CTLR_RWP                (1UL << 31)
>  #define GICD_CTLR_ARE_NS             (1U << 4)
>  #define GICD_CTLR_ENABLE_G1A         (1U << 1)
> @@ -149,7 +155,10 @@
>
>  #define GICR_TYPER_PLPIS             (1U << 0)
>  #define GICR_TYPER_VLPIS             (1U << 1)
> +#define GICR_TYPER_DIRTY             (1U << 2)
> +#define GICR_TYPER_DirectLPIS        (1U << 3)
>  #define GICR_TYPER_LAST              (1U << 4)
> +#define GICR_TYPER_RVPEID            (1U << 7)
>  #define GICR_TYPER_PROC_NUM_SHIFT    8
>  #define GICR_TYPER_PROC_NUM_MASK     (0xffff << GICR_TYPER_PROC_NUM_SHIF=
T)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 360f8a968e..f12d736808 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -405,6 +405,15 @@ extern bool vgic_migrate_irq(struct vcpu *old, struc=
t vcpu *new, unsigned int ir
>  extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
>                                               unsigned int rank, uint32_t=
 r);
>
> +/* GICV4 functions */
> +#ifdef CONFIG_GICV4
> +bool gic_support_vptValidDirty(void);
> +bool gic_is_gicv4(void);
> +#else
> +#define gic_support_vptValidDirty() (false)
> +#define gic_is_gicv4() (false)
> +#endif
> +
>  #endif /* !CONFIG_NEW_VGIC */
>
>  /*** Common VGIC functions used by Xen arch code ****/
> --
> 2.51.2

