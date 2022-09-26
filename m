Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA345EB600
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 01:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412154.655354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocxvZ-0006lf-Ds; Mon, 26 Sep 2022 23:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412154.655354; Mon, 26 Sep 2022 23:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocxvZ-0006jn-BI; Mon, 26 Sep 2022 23:54:21 +0000
Received: by outflank-mailman (input) for mailman id 412154;
 Mon, 26 Sep 2022 23:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAtp=Z5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ocxvY-0006jc-2I
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 23:54:20 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8536f1c3-3df6-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 01:54:14 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 153C05C0186;
 Mon, 26 Sep 2022 19:54:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 26 Sep 2022 19:54:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 19:54:11 -0400 (EDT)
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
X-Inumbo-ID: 8536f1c3-3df6-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664236452; x=
	1664322852; bh=rI4Zzljhb9I8csRzwFT6lBUjwWRvAyKkyg0m0/7yD4I=; b=c
	ZngvjOdxUauV5s7GJOu7bY+PCnGYgShdqUnb4VZjf6A0R+WUjHFTcTnCOcQ01CGr
	9sse9WDX2lbgCWAEdNaBShrY7wRisP1MpWs6YvMp/vOGIJxjHvhT9IcI5KbqsUwR
	zXFNQMQSQpGpQYvqVdqp8GFY9Zh4x6RqPXUezdkPiEgpz2+Eur5THB+54i+/InSS
	cl06pB4wZxL9Hv5F0CZhayfjJ3xVKUMsvsARUUpplGpfFDCLjc1PbYv11wySC1QH
	g6/05tOtGm1DxY9Zen1Qi+lVPhyBZpI5ioA1/Z+Uetsu1TrTNgUSjU7g323ZO2LA
	/VdAlDW1eV18dZKC6Ubxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664236452; x=1664322852; bh=rI4Zzljhb9I8csRzwFT6lBUjwWRv
	AyKkyg0m0/7yD4I=; b=X3UMD8kibhgCoWaKBg/4+KjHSxq5yhSBsk/a9B95e6/y
	YuO0Lq0UKDSB6JaLBtcQNX/UFliB7cx/kZVwpxG5211LfJc3kRBk/GDjOJ6U1PNk
	Bc0CLfbou64HEZdd5TFu+URCEvIPqoSR7khz/729qjrB/KxitqFIpYgphJERTr6q
	qbvxnrtMdlAjaQ8smKdAkZnkSJn1FiiWhsUigY5PV5fxzokTN1lB62GVCiRKqXRb
	XNziCqA715RMUXrxUGBC6LneN1DrDTNlaPhfcFX8Vid+sGVDWymr7NMxQcQf58I1
	//seyaOvy+YXLja9q7wDotDFNkWqYLExMNBYMW0QRg==
X-ME-Sender: <xms:ozsyY_QBqnNCywjUYFxAnNbMQfXmAM7Zc4Tw3xqN3xLofHVPqo_Gtg>
    <xme:ozsyYwwpCqpxG6BJIlXMaW5qpgFjYkXHtPKC6nILSHlXZwiHqXQqJDSWilkF-DBGW
    n6axWu28GJiig>
X-ME-Received: <xmr:ozsyY02apL2hxdpkUJ3nUMvudF1QpHOpqf4R1kXOaYGsLdICFYxjrYgEFabB4fPxXTpiwcgC0STI1alN_zU7-AhC-swNYuuxegoJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepfdforghr
    tgiihihkohifshhkihdpucforghrvghkfdcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdeghfevhfeg
    tdeggefhgeejueelleehtedvteehueejudejkeegudfggeekhfenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ozsyY_BMluu1SXSVvtk5gdco-RHBXCBAEPvxtnCbzQ8HeSnqOntsXg>
    <xmx:ozsyY4gmoqEmW9zAs6o6czbRfvrwc6mb6_OBtutm6MaipMxiBRULrw>
    <xmx:ozsyYzo073aM7FlX8w-YGKnovQP3WPkiHm8CG1HztOEvWCFf_ZdU4Q>
    <xmx:pDsyY2fxTQ2Mo4ll7tTM0OZfIuspXD_YjZor67XJWTIsuteuP58mhA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 27 Sep 2022 01:54:09 +0200
From: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API
Message-ID: <YzI7oUQEJripBRj9@mail-itl>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <902f7007a679c5850bee43b1347b159e1f5eeb16.1663383053.git-series.marmarek@invisiblethingslab.com>
 <BN9PR11MB5276B5BB972B44B0FF1EBB518C519@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rw6gy4PFkqsk85l7"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B5BB972B44B0FF1EBB518C519@BN9PR11MB5276.namprd11.prod.outlook.com>


--rw6gy4PFkqsk85l7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Sep 2022 01:54:09 +0200
From: "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 08/11] IOMMU/VT-d: wire common device reserved memory
 API

On Fri, Sep 23, 2022 at 07:21:04AM +0000, Tian, Kevin wrote:
> > From: Marek Marczykowski-G=C3=B3recki
> > Sent: Saturday, September 17, 2022 10:51 AM
> >=20
> > Re-use rmrr=3D parameter handling code to handle common device reserved
> > memory.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com>
> > ---
> > Changes in v3:
> > - make MAX_USER_RMRR_PAGES applicable only to user-configured RMRR
> > ---
> >  xen/drivers/passthrough/vtd/dmar.c | 201 +++++++++++++++++-------------
> >  1 file changed, 119 insertions(+), 82 deletions(-)
> >=20
> > diff --git a/xen/drivers/passthrough/vtd/dmar.c
> > b/xen/drivers/passthrough/vtd/dmar.c
> > index 367304c8739c..3df5f6b69719 100644
> > --- a/xen/drivers/passthrough/vtd/dmar.c
> > +++ b/xen/drivers/passthrough/vtd/dmar.c
> > @@ -861,111 +861,139 @@ static struct user_rmrr __initdata
> > user_rmrrs[MAX_USER_RMRR];
> >=20
> >  /* Macro for RMRR inclusive range formatting. */
> >  #define ERMRRU_FMT "[%lx-%lx]"
> > -#define ERMRRU_ARG(eru) eru.base_pfn, eru.end_pfn
> > +#define ERMRRU_ARG base_pfn, end_pfn
> > +
> > +static int __init add_one_user_rmrr(unsigned long base_pfn,
> > +                                    unsigned long end_pfn,
> > +                                    unsigned int dev_count,
> > +                                    uint32_t *sbdf);
>=20
> Just move the function here then no need of a declaration.

Ok.

> >=20
> >  static int __init add_user_rmrr(void)
> >  {
> > +    unsigned int i;
> > +    int ret;
> > +
> > +    for ( i =3D 0; i < nr_rmrr; i++ )
> > +    {
> > +        ret =3D add_one_user_rmrr(user_rmrrs[i].base_pfn,
> > +                                user_rmrrs[i].end_pfn,
> > +                                user_rmrrs[i].dev_count,
> > +                                user_rmrrs[i].sbdf);
> > +        if ( ret < 0 )
> > +            return ret;
> > +    }
> > +    return 0;
> > +}
> > +
> > +/* Returns 1 on success, 0 when ignoring and < 0 on error. */
>=20
> I'm not sure the point of 'ignoring'. If user specifies a wrong RMRR
> range (overlap, mfn invalid, etc.) just return an error similar to
> -ENOMEM. Ignoring a user-specified range implies that something
> would potentially get broken hence better fail it early.

That's the behaviour that was here before, I simply added a comment
about it explicitly (previously it used 'continue' heavily, now it's a
separate function so it's a return value).
While I agree in principle, I don't think such change should be part of
this patch.

(...)

> > @@ -1108,6 +1136,15 @@ static int __init cf_check parse_rmrr_param(const
> > char *str)
> >          else
> >              end =3D start;
> >=20
> > +        if ( (end - start) >=3D MAX_USER_RMRR_PAGES )
> > +        {
> > +            printk(XENLOG_ERR VTDPREFIX
> > +                    "RMRR range "ERMRRU_FMT" exceeds "\
> > +                    __stringify(MAX_USER_RMRR_PAGES)" pages\n",
> > +                    start, end);
> > +            return -E2BIG;
> > +        }
> > +
>=20
> why moving this error check out of add_one_user_rmrr()? I didn't
> get why it's special from other checks there, e.g. having base>end...

To allow internal callers bypass MAX_USER_RMRR_PAGES, and make it apply
really only to user-provided ranges.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rw6gy4PFkqsk85l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMyO6EACgkQ24/THMrX
1yxiKgf/Z/789eaBVhyZTX683sbeRVuTAAJd0rDl0hGShSZaRHh8HJLDQmVFZpVC
SBVDy6NVDT1dV+41RLVmGdkDhCip5jzR1PnczvRTPYo+tmoeR9ir6iNchEuGXMfj
QVgoKkMYLwNQNQ6j7hezUe0Q+WV3dNl8yh8UAgSxjRSQ2Y5KywcE2ijMm6Uy5GvF
sF9Cf3T5C43LObF3EHbMmciBjPzYVL7bPTf2I7te4DbU2eH6yfAgnFBjIjqFO6TX
tJ2hpT9aUZfIls6isiOKxC14fqpXyr/Iboec0WcjsL5f+OKIr+fG7o9IWJ+37yI3
JUZgmMhGb5mcllih41bYom8NiS6kkg==
=HDAI
-----END PGP SIGNATURE-----

--rw6gy4PFkqsk85l7--

