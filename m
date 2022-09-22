Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E95E5E9F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 11:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410048.653026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIWQ-0004Qq-1l; Thu, 22 Sep 2022 09:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410048.653026; Thu, 22 Sep 2022 09:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIWP-0004Nd-Uk; Thu, 22 Sep 2022 09:29:29 +0000
Received: by outflank-mailman (input) for mailman id 410048;
 Thu, 22 Sep 2022 09:29:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jJba=ZZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1obIWO-0004NE-2q
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 09:29:28 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02f14c69-3a59-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 11:29:11 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 25F7232008C3;
 Thu, 22 Sep 2022 05:29:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Sep 2022 05:29:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 05:29:20 -0400 (EDT)
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
X-Inumbo-ID: 02f14c69-3a59-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663838961; x=
	1663925361; bh=kMMryYpmoWdMuTknZDtMqJzGyKhvqSBRnwLGeAnUXCM=; b=l
	hjXKUglNEaqOsVOpgCfzf+TNIwB1VjC0rdLNPzCIKPJdQBwm6itxQCdPj28SDFtj
	0CjtHH6cwhWgbOoZAhaalBojFAZpTZfocx4CFel7CteLMlleVSU81h9ig86wCAxU
	ggTXnxfXIUDjxUu5RO0QIA/dZoYctP2UUA6FRiP6b0IZVHdAhafnDl6PAHEv/9TK
	7tujb4txMaCWQJxbjAOTZoc3WssBVwlPANVlmhfDz3qlqAa+5mR1JfZHZlZp02/E
	6gn7iGDbPT+OUAJDnGcsPkjzozm3oOq+5mpQsMaQYgVwvdCcZm6m7yCqqRXeUqH5
	opSc3CVuwZri/L3MR6dGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663838961; x=1663925361; bh=kMMryYpmoWdMuTknZDtMqJzGyKhv
	qSBRnwLGeAnUXCM=; b=rxOjfUaL9hl7vsdMvYStuCMpaCveMHUcfcaUXkadM5Bv
	OQ7oxXhIPadc3YajxjdaE+RvWwAETx0RpGm+HzB4hkxm9zDOTmhPBUcexdyQ5WcD
	eYuXzPMGpNIOVx+6lroQVminLpw2OMYxbV6GnQGmCtr9Ene6M9E7eRLoQaNp4yHh
	lyX5lxEnESnpqQZ/g5bJMX8tU2Q4ggBOzKF3k/WLBYMC0HIUB6m1gYO4YjYxPxVx
	ofskCRCEQlwM1W62/QRqqRgkdWDv6VpbIlOUk5LFToDZXz1hW3t+JyPXO9HbCFAm
	/YJ2qbLwulg6/j8xzYJu+7u3Bb0vyRNPYLs/va7yjw==
X-ME-Sender: <xms:8SosY_21178yoEMwxFE1CFhhHPfsT0_9hFgB4EZSF1yJ20bQdpSjMg>
    <xme:8SosY-Hmi--3--JhJ1RYMLT7kGyuF-7TFKrrQKBaSUVQv1Sulxr95Vi6SMKXQz9v4
    C8bZlEfSnp5AA>
X-ME-Received: <xmr:8SosY_7Ly5xgjRLm6HzcCZ7SHllD4avdPd6KNlTUl7K4sMTkTLBKh5is1cK4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeffedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:8SosY017F3OPktsBjDeYOKS4e8zfhHMQSxlzhue4QOuGNiYgFOXY4Q>
    <xmx:8SosYyFyBsf7bgQIX_wpU5uS2-35JdqqFowx8so8qLSKvNAbRo54ow>
    <xmx:8SosY1_amt23vcTidLq6GmcET4ianX7g7bmVetBLQxaqjc17yxuatA>
    <xmx:8SosY9y0t1IguFuaenGcpWyLV8cS5TZMzdUTx4APgJrwhNVsVOTmTA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 22 Sep 2022 11:29:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API
Message-ID: <Yywq7cCZ0FR/ngha@mail-itl>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <902f7007a679c5850bee43b1347b159e1f5eeb16.1663383053.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="shlZlOXdfY6WjTED"
Content-Disposition: inline
In-Reply-To: <902f7007a679c5850bee43b1347b159e1f5eeb16.1663383053.git-series.marmarek@invisiblethingslab.com>


--shlZlOXdfY6WjTED
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Sep 2022 11:29:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Tian <kevin.tian@intel.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API

On Sat, Sep 17, 2022 at 04:51:27AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Re-use rmrr=3D parameter handling code to handle common device reserved
> memory.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Kevin, can you please review this patch? It's unchanged since v3, and
pending review for some moths already.


> ---
> Changes in v3:
> - make MAX_USER_RMRR_PAGES applicable only to user-configured RMRR
> ---
>  xen/drivers/passthrough/vtd/dmar.c | 201 +++++++++++++++++-------------
>  1 file changed, 119 insertions(+), 82 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough=
/vtd/dmar.c
> index 367304c8739c..3df5f6b69719 100644
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -861,111 +861,139 @@ static struct user_rmrr __initdata user_rmrrs[MAX=
_USER_RMRR];
> =20
>  /* Macro for RMRR inclusive range formatting. */
>  #define ERMRRU_FMT "[%lx-%lx]"
> -#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
> +#define ERMRRU_ARG base_pfn, end_pfn
> +
> +static int __init add_one_user_rmrr(unsigned long base_pfn,
> +                                    unsigned long end_pfn,
> +                                    unsigned int dev_count,
> +                                    uint32_t *sbdf);
> =20
>  static int __init add_user_rmrr(void)
>  {
> +    unsigned int i;
> +    int ret;
> +
> +    for ( i =3D 0; i < nr_rmrr; i++ )
> +    {
> +        ret =3D add_one_user_rmrr(user_rmrrs[i].base_pfn,
> +                                user_rmrrs[i].end_pfn,
> +                                user_rmrrs[i].dev_count,
> +                                user_rmrrs[i].sbdf);
> +        if ( ret < 0 )
> +            return ret;
> +    }
> +    return 0;
> +}
> +
> +/* Returns 1 on success, 0 when ignoring and < 0 on error. */
> +static int __init add_one_user_rmrr(unsigned long base_pfn,
> +                                    unsigned long end_pfn,
> +                                    unsigned int dev_count,
> +                                    uint32_t *sbdf)
> +{
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
> +static int __init cf_check add_one_extra_rmrr(xen_pfn_t start, xen_ulong=
_t nr, u32 id, void *ctxt)
> +{
> +    u32 sbdf_array[] =3D { id };
> +    return add_one_user_rmrr(start, start+nr, 1, sbdf_array);
> +}
> =20
> -    return 0;
> +static int __init add_extra_rmrr(void)
> +{
> +    return iommu_get_extra_reserved_device_memory(add_one_extra_rmrr, NU=
LL);
>  }
> =20
>  #include <asm/tboot.h>
> @@ -1010,7 +1038,7 @@ int __init acpi_dmar_init(void)
>      {
>          iommu_init_ops =3D &intel_iommu_init_ops;
> =20
> -        return add_user_rmrr();
> +        return add_user_rmrr() || add_extra_rmrr();
>      }
> =20
>      return ret;
> @@ -1108,6 +1136,15 @@ static int __init cf_check parse_rmrr_param(const =
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

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--shlZlOXdfY6WjTED
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMsKu0ACgkQ24/THMrX
1ywnSwgAjymJRdQCI+4xzo4Y6tG8znXJ1zAqfbtcQ+JLRBoNfBhQ/8FHhCa03v0T
ZKb1nKJPd4YFu44LCwkDi60Gpm5Xknu6bIJYHw/SGnohnXvrFmOI8SUZQmuD6sMq
gs6GAWnQZZZKzOLDMIFlLRw+HDMRnHonwUPUGUVbt3jbmGtZe19WfpR4j0JXeFkA
GyL/zdKtpfTFyqS3SHtBo1lfupqHmFDmkFJWWlP0APyTtwu8cs7tVILEVsiOzZrW
tyMszNGwumhFqLNYkGw6j59eC9YRS6ZzsMCE3PTuXMS/sJ33ZuHMO6BNUwKMSQk2
juDaaOeB6YEAZ4zvJUtXLKbcTZL4Pw==
=PUUv
-----END PGP SIGNATURE-----

--shlZlOXdfY6WjTED--

