Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D765FFC88
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 00:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423616.670452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojq00-0000wr-9f; Sat, 15 Oct 2022 22:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423616.670452; Sat, 15 Oct 2022 22:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojq00-0000tw-5o; Sat, 15 Oct 2022 22:51:20 +0000
Received: by outflank-mailman (input) for mailman id 423616;
 Sat, 15 Oct 2022 22:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yrUq=2Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ojpzy-0000tq-TU
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 22:51:19 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df3e24c9-4cdb-11ed-91b4-6bf2151ebd3b;
 Sun, 16 Oct 2022 00:51:16 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 212975C0085;
 Sat, 15 Oct 2022 18:51:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Oct 2022 18:51:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Oct 2022 18:51:12 -0400 (EDT)
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
X-Inumbo-ID: df3e24c9-4cdb-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1665874274; x=
	1665960674; bh=lsI8o0/jCX1U87MykaqU47R3cuckKUOpHIcL/iH88/U=; b=l
	qTlx3V1TemcLGhEh+jRUhJmv9DgLttLKDTf+wxOAWk2yOgp9c7+iAu1cldyQdulp
	TeyIrGYtqdTqyoDlBHWrySGztzS1zHVQimg3yFIyT746OgQBlPvtIB04mc9jHaw/
	LHN603cRAeFQUZ76fji+y+M2TstfxTeVIIwVd55oe07hyYOK/Oaftd6FEzTBDGSO
	kODYRdDAUf1Q34zNPM38plVQEAjnhE8TpRg6O6Qu6NQzZrAWQmpSjdC0opilS5xp
	OtFBUnWGMZ1u5B5hTN5BUQleU+6jL45vSLva8jQcfDo46Fn/zk4eX7yBB0hgWM5M
	FwgwS3ECoWsjW9CSxOIGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665874274; x=1665960674; bh=lsI8o0/jCX1U87MykaqU47R3cuck
	KUOpHIcL/iH88/U=; b=jcWax2nmSOHREI/NPgclIDYqi+NClKoJ0DmsqiNhHENJ
	4dCXeaHymJO/GHnSJVa2Y5N+ZUxLk9DqV7gHwekvfnB2eoiCHO9bZbNxTiEyp/sp
	0GEKX8UEjK5SXfeaA01S9S+3NV9tPq0kxwELNX+gbciP8d2G7NZSIvsjAslxgFil
	38B+U3NxSjqXOVfBvki/XsM2NalrXXNUijtLboq14C5GyIznLTQlFz7t8BIZVXYi
	cbF416uPV2g2Sd5qG6NbXlVQi5e5uFgYXafp+ma595MGnG+7uaPSmTs5s0pHCZXb
	M3XR1BrTBuh9DYs+jTtLQeovfpXjdURvNB97HThEUQ==
X-ME-Sender: <xms:YTlLYwEbxxODFvhq8_MFM9hVj8DH8NuU3-gV12uCK4Fa_rhHIgRdfQ>
    <xme:YTlLY5WB61jNwKK7adDhRpI-gEgRBxaRGnam8Zk4CnARj1jWDAstazH9d50PvzlQJ
    a-xKGXZu0rlfw>
X-ME-Received: <xmr:YTlLY6JibhVD-xE4yEmigQ73ScjLeGQcJvTqKhVQF23w7m2UaIJn3uRD9nsxxJyIXOjG4S1HyxhLg2EiHyMsxV8iPJ_gtg2v80yZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekhedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:YTlLYyH32PoIDYfCaIy_rxQA9DnW4lXMW-kaWO230kZu-KhtRwBLPQ>
    <xmx:YTlLY2WjGGmVshP4L9FTJ7Rf23gGbASOYfJ1Gm8gIzeN8ujoF05ILQ>
    <xmx:YTlLY1PsTJo9CE3xq3zX1hvEpfH4A-h7_olCTCEnZaW_JE3ix5y-uw>
    <xmx:YjlLY_dxNFrEIG3MaAgogzviyGOHsUDxKWffWgdzY-qk2GYZMpXLDw>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 16 Oct 2022 00:51:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Message-ID: <Y0s5Xvr5PBQq5pVB@mail-itl>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K73I/ysDr9ud1QeM"
Content-Disposition: inline
In-Reply-To: <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>


--K73I/ysDr9ud1QeM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Oct 2022 00:51:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API

On Thu, Sep 29, 2022 at 03:33:12PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Re-use rmrr=3D parameter handling code to handle common device reserved
> memory.
>=20
> Move MAX_USER_RMRR_PAGES limit enforcement to apply only to
> user-configured ranges, but not those from internal callers.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Henry, can this be included in 4.17? The AMD counterpart went in
earlier, but due to late review on Intel part, this one didn't.=20

> ---
> Changes in v8:
> - move add_one_user_rmrr() function earlier
> - extend commit message
> Changes in v3:
> - make MAX_USER_RMRR_PAGES applicable only to user-configured RMRR
> ---
>  xen/drivers/passthrough/vtd/dmar.c | 196 +++++++++++++++++-------------
>  1 file changed, 114 insertions(+), 82 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough=
/vtd/dmar.c
> index 367304c8739c..78c8bad1515a 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -861,113 +861,136 @@ static struct user_rmrr __initdata user_rmrrs[MAX=
_USER_RMRR];
> =20
>  /* Macro for RMRR inclusive range formatting. */
>  #define ERMRRU_FMT "[%lx-%lx]"
> -#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
> +#define ERMRRU_ARG base_pfn, end_pfn
> =20
> -static int __init add_user_rmrr(void)
> +/* Returns 1 on success, 0 when ignoring and < 0 on error. */
> +static int __init add_one_user_rmrr(unsigned long base_pfn,
> +                                    unsigned long end_pfn,
> +                                    unsigned int dev_count,
> +                                    uint32_t *sbdf)
>  {
>      struct acpi_rmrr_unit *rmrr, *rmrru;
> -    unsigned int idx, seg, i;
> -    unsigned long base, end;
> +    unsigned int idx, seg;
> +    unsigned long base_iter;
>      bool overlap;
> =20
> -    for ( i =3D 0; i < nr_rmrr; i++ )
> +    if ( iommu_verbose )
> +        printk(XENLOG_DEBUG VTDPREFIX
> +               "Adding RMRR for %d device ([0]: %#x) range "ERMRRU_FMT"\=
n",
> +               dev_count, sbdf[0], ERMRRU_ARG);
> +
> +    if ( base_pfn > end_pfn )
>      {
> -        base =3D user_rmrrs[i].base_pfn;
> -        end =3D user_rmrrs[i].end_pfn;
> +        printk(XENLOG_ERR VTDPREFIX
> +               "Invalid RMRR Range "ERMRRU_FMT"\n",
> +               ERMRRU_ARG);
> +        return 0;
> +    }
> =20
> -        if ( base > end )
> +    overlap =3D false;
> +    list_for_each_entry(rmrru, &acpi_rmrr_units, list)
> +    {
> +        if ( pfn_to_paddr(base_pfn) <=3D rmrru->end_address &&
> +             rmrru->base_address <=3D pfn_to_paddr(end_pfn) )
>          {
>              printk(XENLOG_ERR VTDPREFIX
> -                   "Invalid RMRR Range "ERMRRU_FMT"\n",
> -                   ERMRRU_ARG(user_rmrrs[i]));
> -            continue;
> +                   "Overlapping RMRRs: "ERMRRU_FMT" and [%lx-%lx]\n",
> +                   ERMRRU_ARG,
> +                   paddr_to_pfn(rmrru->base_address),
> +                   paddr_to_pfn(rmrru->end_address));
> +            overlap =3D true;
> +            break;
>          }
> +    }
> +    /* Don't add overlapping RMRR. */
> +    if ( overlap )
> +        return 0;
> =20
> -        if ( (end - base) >=3D MAX_USER_RMRR_PAGES )
> +    base_iter =3D base_pfn;
> +    do
> +    {
> +        if ( !mfn_valid(_mfn(base_iter)) )
>          {
>              printk(XENLOG_ERR VTDPREFIX
> -                   "RMRR range "ERMRRU_FMT" exceeds "\
> -                   __stringify(MAX_USER_RMRR_PAGES)" pages\n",
> -                   ERMRRU_ARG(user_rmrrs[i]));
> -            continue;
> +                   "Invalid pfn in RMRR range "ERMRRU_FMT"\n",
> +                   ERMRRU_ARG);
> +            break;
>          }
> +    } while ( base_iter++ < end_pfn );
> =20
> -        overlap =3D false;
> -        list_for_each_entry(rmrru, &acpi_rmrr_units, list)
> -        {
> -            if ( pfn_to_paddr(base) <=3D rmrru->end_address &&
> -                 rmrru->base_address <=3D pfn_to_paddr(end) )
> -            {
> -                printk(XENLOG_ERR VTDPREFIX
> -                       "Overlapping RMRRs: "ERMRRU_FMT" and [%lx-%lx]\n",
> -                       ERMRRU_ARG(user_rmrrs[i]),
> -                       paddr_to_pfn(rmrru->base_address),
> -                       paddr_to_pfn(rmrru->end_address));
> -                overlap =3D true;
> -                break;
> -            }
> -        }
> -        /* Don't add overlapping RMRR. */
> -        if ( overlap )
> -            continue;
> +    /* Invalid pfn in range as the loop ended before end_pfn was reached=
=2E */
> +    if ( base_iter <=3D end_pfn )
> +        return 0;
> =20
> -        do
> -        {
> -            if ( !mfn_valid(_mfn(base)) )
> -            {
> -                printk(XENLOG_ERR VTDPREFIX
> -                       "Invalid pfn in RMRR range "ERMRRU_FMT"\n",
> -                       ERMRRU_ARG(user_rmrrs[i]));
> -                break;
> -            }
> -        } while ( base++ < end );
> +    rmrr =3D xzalloc(struct acpi_rmrr_unit);
> +    if ( !rmrr )
> +        return -ENOMEM;
> =20
> -        /* Invalid pfn in range as the loop ended before end_pfn was rea=
ched. */
> -        if ( base <=3D end )
> -            continue;
> +    rmrr->scope.devices =3D xmalloc_array(u16, dev_count);
> +    if ( !rmrr->scope.devices )
> +    {
> +        xfree(rmrr);
> +        return -ENOMEM;
> +    }
> =20
> -        rmrr =3D xzalloc(struct acpi_rmrr_unit);
> -        if ( !rmrr )
> -            return -ENOMEM;
> +    seg =3D 0;
> +    for ( idx =3D 0; idx < dev_count; idx++ )
> +    {
> +        rmrr->scope.devices[idx] =3D sbdf[idx];
> +        seg |=3D PCI_SEG(sbdf[idx]);
> +    }
> +    if ( seg !=3D PCI_SEG(sbdf[0]) )
> +    {
> +        printk(XENLOG_ERR VTDPREFIX
> +               "Segments are not equal for RMRR range "ERMRRU_FMT"\n",
> +               ERMRRU_ARG);
> +        scope_devices_free(&rmrr->scope);
> +        xfree(rmrr);
> +        return 0;
> +    }
> =20
> -        rmrr->scope.devices =3D xmalloc_array(u16, user_rmrrs[i].dev_cou=
nt);
> -        if ( !rmrr->scope.devices )
> -        {
> -            xfree(rmrr);
> -            return -ENOMEM;
> -        }
> +    rmrr->segment =3D seg;
> +    rmrr->base_address =3D pfn_to_paddr(base_pfn);
> +    /* Align the end_address to the end of the page */
> +    rmrr->end_address =3D pfn_to_paddr(end_pfn) | ~PAGE_MASK;
> +    rmrr->scope.devices_cnt =3D dev_count;
> =20
> -        seg =3D 0;
> -        for ( idx =3D 0; idx < user_rmrrs[i].dev_count; idx++ )
> -        {
> -            rmrr->scope.devices[idx] =3D user_rmrrs[i].sbdf[idx];
> -            seg |=3D PCI_SEG(user_rmrrs[i].sbdf[idx]);
> -        }
> -        if ( seg !=3D PCI_SEG(user_rmrrs[i].sbdf[0]) )
> -        {
> -            printk(XENLOG_ERR VTDPREFIX
> -                   "Segments are not equal for RMRR range "ERMRRU_FMT"\n=
",
> -                   ERMRRU_ARG(user_rmrrs[i]));
> -            scope_devices_free(&rmrr->scope);
> -            xfree(rmrr);
> -            continue;
> -        }
> +    if ( register_one_rmrr(rmrr) )
> +        printk(XENLOG_ERR VTDPREFIX
> +               "Could not register RMMR range "ERMRRU_FMT"\n",
> +               ERMRRU_ARG);
> =20
> -        rmrr->segment =3D seg;
> -        rmrr->base_address =3D pfn_to_paddr(user_rmrrs[i].base_pfn);
> -        /* Align the end_address to the end of the page */
> -        rmrr->end_address =3D pfn_to_paddr(user_rmrrs[i].end_pfn) | ~PAG=
E_MASK;
> -        rmrr->scope.devices_cnt =3D user_rmrrs[i].dev_count;
> +    return 1;
> +}
> =20
> -        if ( register_one_rmrr(rmrr) )
> -            printk(XENLOG_ERR VTDPREFIX
> -                   "Could not register RMMR range "ERMRRU_FMT"\n",
> -                   ERMRRU_ARG(user_rmrrs[i]));
> -    }
> +static int __init add_user_rmrr(void)
> +{
> +    unsigned int i;
> +    int ret;
> =20
> +    for ( i =3D 0; i < nr_rmrr; i++ )
> +    {
> +        ret =3D add_one_user_rmrr(user_rmrrs[i].base_pfn,
> +                                user_rmrrs[i].end_pfn,
> +                                user_rmrrs[i].dev_count,
> +                                user_rmrrs[i].sbdf);
> +        if ( ret < 0 )
> +            return ret;
> +    }
>      return 0;
>  }
> =20
> +static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong=
_t nr, u32 id, void *ctxt)
> +{
> +    u32 sbdf_array[] =3D { id };
> +    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
> +}
> +
> +static int __init add_extra_rmrr(void)
> +{
> +    return iommu_get_extra_reserved_device_memory(add_one_extra_rmrr, NU=
LL);
> +}
> +
>  #include <asm/tboot.h>
>  /* ACPI tables may not be DMA protected by tboot, so use DMAR copy */
>  /* SINIT saved in SinitMleData in TXT heap (which is DMA protected) */
> @@ -1010,7 +1033,7 @@ int __init acpi_dmar_init(void)
>      {
>          iommu_init_ops =3D &intel_iommu_init_ops;
> =20
> -        return add_user_rmrr();
> +        return add_user_rmrr() || add_extra_rmrr();
>      }
> =20
>      return ret;
> @@ -1108,6 +1131,15 @@ static int __init cf_check parse_rmrr_param(const =
char *str)
>          else
>              end =3D start;
> =20
> +        if ( (end - start) >=3D MAX_USER_RMRR_PAGES )
> +        {
> +            printk(XENLOG_ERR VTDPREFIX
> +                    "RMRR range "ERMRRU_FMT" exceeds "\
> +                    __stringify(MAX_USER_RMRR_PAGES)" pages\n",
> +                    start, end);
> +            return -E2BIG;
> +        }
> +
>          user_rmrrs[nr_rmrr].base_pfn =3D start;
>          user_rmrrs[nr_rmrr].end_pfn =3D end;
> =20
> --=20
> git-series 0.9.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--K73I/ysDr9ud1QeM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNLOV4ACgkQ24/THMrX
1yxJIgf/UertV8nQx+ovAyl6sMltNkkw8Rbm5wCXIiLCB0eR2gvnZRRr4kCBxaqT
Vd4LR9+AmOvFjc/o+lqNOorSUvyztcgmyxhP1xPqrEx9Ty2R39gfCfSj+r2aGTnl
/NuVd7c+SpUwwpfFveZrfTc5Wn9cxM0QRqEcOwXDdHZDqcap6cYPn/Ctqf9X2d8z
TNPFIOVishHVx39P1FMDo4quhmziVbmR95ws19tUKbgxm2EkRlScYp3P5UMWgCuo
LvMEcpOldhHV3fI46piWvGqvGjNdnHf7GybKzkZof5BqNPcyoTPg3idsMUo2bfzZ
wBKa7qSx3emXYevOLrhQpWpRYeMgcg==
=fvUY
-----END PGP SIGNATURE-----

--K73I/ysDr9ud1QeM--

