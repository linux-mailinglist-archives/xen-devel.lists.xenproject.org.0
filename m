Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C7AD3101
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010615.1388757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOum7-00062z-Vj; Tue, 10 Jun 2025 08:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010615.1388757; Tue, 10 Jun 2025 08:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOum7-00060t-T9; Tue, 10 Jun 2025 08:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1010615;
 Tue, 10 Jun 2025 08:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTBY=YZ=bounce.vates.tech=bounce-md_30504962.6847f31e.v1-4d88861d8e4d4309b4dc06de647e39be@srs-se1.protection.inumbo.net>)
 id 1uOum6-00060m-CJ
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:56:06 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba6aed90-45d8-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 10:55:59 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4bGjLk28S4zlfcLy
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:55:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4d88861d8e4d4309b4dc06de647e39be; Tue, 10 Jun 2025 08:55:58 +0000
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
X-Inumbo-ID: ba6aed90-45d8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749545758; x=1749815758;
	bh=V10wIIOg7o3xtwDUxgAJUC+V4RnqVBdqbqkJ2Fwxos0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aGgDY2wutJwZabvk2xLksN1DMa3m2Vsr0ICdqZsoHmojXw0pxm3V3Zhq0xfIQXdYH
	 0gYdVza3KVNZlR/PtElHNVLvDqFB+0jBj1XwtVEN27d7zs8Plx+Dy23BW6lvZ0LFIH
	 PTKGdZOhld1Jc+F9NtZaRUn3sDXAp8im+IRyL0WWPUyYIylWmLb5Wb/w1R6DbBN2V6
	 FJKhrq/4m34CJ1Ka+bIxglSVp7s0LF8i0M4ONLAAufS3X7hPjoRV0QMMdabUgPGU7A
	 SYOl+v8sQUT7lupL2+n5d43sgqx9A1As5DHn0yyLtMXhYLVFKT5gEtbG9KRxDKnMZ0
	 oeMe/tMTOLMqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749545758; x=1749806258; i=teddy.astie@vates.tech;
	bh=V10wIIOg7o3xtwDUxgAJUC+V4RnqVBdqbqkJ2Fwxos0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K0pB7iOokLZLhXJZZzaIbpac/aaxEwehAvB66508S91AMMWStzCV2AMIooJi9+gwq
	 HE60uKsenBrdIxzCzfWvQNpeJGAdAZ77DxLWXlJXKV5pbIsSg/uAGrX0PR3IZZuhhN
	 fXAjDVvdLrOHeg0oi0N3QTyDScKeif3ls79ompov0gwedlDywu1NtNie96qKTb20qL
	 AiaH99ZFpEWAyM85ura2CtwzwuCnUooaX3xJOAsdb24OgVqB03VrJ1S7xUlTy5c/h1
	 AtAK1x7xnwSD80SXlsN4Sy21bbYTbZTZNPghr7EWN+8NiMHAoiUjHa/US6ze4A0ZuR
	 ndxpacsV3TW1w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6]=20xen/domain:=20rewrite=20emulation=5Fflags=5Fok()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749545755259
Message-Id: <c45d0a55-fe95-4216-a82f-481bb381b753@vates.tech>
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250610004216.3012253-1-dmukhin@ford.com>
In-Reply-To: <20250610004216.3012253-1-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4d88861d8e4d4309b4dc06de647e39be?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250610:md
Date: Tue, 10 Jun 2025 08:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 10/06/2025 =C3=A0 02:45, dmkhn@proton.me a =C3=A9crit=C2=A0:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Rewrite emulation_flags_ok() to simplify future modifications.
> 
> No functional change intended.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

> ---
> Changes since v5:
> - optimized `configs[]` table - just one record for PV case
> - sorted entries in `configs[]` table by domain type: PV, then PVH, then =
HVM
>    entries
> - addressed `caps` initializaton
>   
> Link to v5: https://lore.kernel.org/xen-devel/20250602191717.148361-3-dmu=
khin@ford.com/
> Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines=
/1861382846/
> ---
>   xen/arch/x86/domain.c | 86 ++++++++++++++++++++++++++++++++++---------
>   1 file changed, 68 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 7536b6c871..82b126351b 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -743,32 +743,82 @@ int arch_sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>       return 0;
>   }
>   
> +/*
> + * Verify that the domain's emulation flags resolve to a supported confi=
guration.
> + *
> + * This ensures we only allow a known, safe subset of emulation combinat=
ions
> + * (for both functionality and security). Arbitrary mixes are likely to =
cause
> + * errors (e.g. null pointer dereferences).
> + *
> + * NB: use the internal X86_EMU_XXX symbols, not the public XEN_X86_EMU_=
XXX
> + * symbols.
> + */
>   static bool emulation_flags_ok(const struct domain *d, uint32_t emflags=
)
>   {
> +    enum {
> +        CAP_PV          =3D BIT(0, U),
> +        CAP_HVM         =3D BIT(1, U),
> +        CAP_HWDOM       =3D BIT(2, U),
> +        CAP_DOMU        =3D BIT(3, U),
> +    };
> +    static const struct {
> +        unsigned int caps;
> +        uint32_t min;
> +        uint32_t opt;
> +    } configs[] =3D {
> +#ifdef CONFIG_PV
> +        /* PV dom0 and domU */
> +        {
> +            .caps   =3D CAP_PV | CAP_HWDOM | CAP_DOMU,
> +            .min    =3D X86_EMU_PIT,
> +        },
> +#endif /* #ifdef CONFIG_PV */
> +
> +#ifdef CONFIG_HVM
> +        /* PVH dom0 */
> +        {
> +            .caps   =3D CAP_HVM | CAP_HWDOM,
> +            .min    =3D X86_EMU_LAPIC | X86_EMU_IOAPIC | X86_EMU_VPCI,
> +        },
> +
> +        /* PVH domU */
> +        {
> +            .caps   =3D CAP_HVM | CAP_DOMU,
> +            .min    =3D X86_EMU_LAPIC,
> +        },
> +
> +        /* HVM domU */
> +        {
> +            .caps   =3D CAP_HVM | CAP_DOMU,
> +            .min    =3D X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)=
,
> +            /* HVM PIRQ feature is user-selectable. */
> +            .opt    =3D X86_EMU_USE_PIRQ,
> +        },
> +#endif /* #ifdef CONFIG_HVM */
> +    };
> +    unsigned int i;
> +    unsigned int caps =3D (is_pv_domain(d) ? CAP_PV : CAP_HVM) |
> +                        (is_hardware_domain(d) ? CAP_HWDOM : CAP_DOMU);
> +
> +    /*
> +     * NB: PV domain can have 0 in emulation_flags.
> +     * See qemu-alpine-x86_64-gcc CI job.
> +     * Inject fake flag to keep the code checks simple.
> +     */
> +    if ( (caps & CAP_PV) && emflags =3D=3D 0 )
> +        emflags |=3D X86_EMU_PIT;
> +
>   #ifdef CONFIG_HVM
>       /* This doesn't catch !CONFIG_HVM case but it is better than nothin=
g */
>       BUILD_BUG_ON(X86_EMU_ALL !=3D XEN_X86_EMU_ALL);
>   #endif
>   
> -    if ( is_hvm_domain(d) )
> -    {
> -        if ( is_hardware_domain(d) &&
> -             emflags !=3D (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC=
) )
> -            return false;
> -        if ( !is_hardware_domain(d) &&
> -             /* HVM PIRQ feature is user-selectable. */
> -             (emflags & ~X86_EMU_USE_PIRQ) !=3D
> -             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
> -             emflags !=3D X86_EMU_LAPIC )
> -            return false;
> -    }
> -    else if ( emflags !=3D 0 && emflags !=3D X86_EMU_PIT )
> -    {
> -        /* PV or classic PVH. */
> -        return false;
> -    }
> +    for ( i =3D 0; i < ARRAY_SIZE(configs); i++ )
> +        if ( (caps & configs[i].caps) =3D=3D caps &&
> +             (emflags & ~configs[i].opt) =3D=3D configs[i].min )
> +            return true;
>   
> -    return true;
> +    return false;
>   }
>   
>   void __init arch_init_idle_domain(struct domain *d)


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



