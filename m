Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7983589DA0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380472.614639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbzV-00043E-4m; Thu, 04 Aug 2022 14:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380472.614639; Thu, 04 Aug 2022 14:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbzV-000406-0g; Thu, 04 Aug 2022 14:38:25 +0000
Received: by outflank-mailman (input) for mailman id 380472;
 Thu, 04 Aug 2022 14:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGyI=YI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJbzT-0003zx-Ka
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:38:23 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f0ed50-1403-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 16:38:22 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C045B5C0066;
 Thu,  4 Aug 2022 10:38:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 04 Aug 2022 10:38:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 10:38:20 -0400 (EDT)
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
X-Inumbo-ID: 16f0ed50-1403-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659623901; x=
	1659710301; bh=dA+hyGXTIok9ZxbAmCC9zKgn4+fCIrM/mBZELAbHZ9g=; b=a
	iUNN7+3jlWYnWg47+YAxYNLPqRuIzIwBby36VTJS9qQ9zsUYQYBgeZvUTxPVXwOJ
	FRINwagGkNUGdwcLIDTCK9RMjCkYvelZaCVzC09ANXGI52O2u/obapEpT25ke/dM
	kDlii848uS/N1NiiIN/bX8cI30GBKCiDuvPDlFh1FgS1Uu/cz5/VfoUmeTGDS1Zq
	8ZN83o6QGLO1+g/772U8/fL69bWgJydSBlC6lVgBxhonZLg06vlO8y/PJOF1wFOo
	dGeynR58rFMpUSvxQNyNSBfKbKhh2kZIDS4vPRS85WyCs16/ANvBOZQ6PYILBJSF
	/TaRG+4FtgNQdkyU6QNmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659623901; x=1659710301; bh=dA+hyGXTIok9ZxbAmCC9zKgn4+fC
	IrM/mBZELAbHZ9g=; b=kfhuu/Os43w7cHdFcji8VNiSJYjcwXdMGN4FtBIyxl+B
	Z6yqRcCPJ1dhc10vdIR55u5FL9hMJajwOVtPrCHJDTeqXmiId/FmvK3DKp+um8bL
	5l92rS2rFDdJ+Cuj2aqMdFQwV/++VRNIHHXAhwnPT3Pn3r1lExvo7+HWGN1Cz1Nz
	4ZSiOS/F7ySdKOkUg8yyt7Pgqmj8SV7DyBVbE91PNQsErACbvg9/jZVkIzfN/MK5
	xVw3jo8G8nm23yf8gJy3spdm2g9pj2wAmgMIotVG8SpYJauwSjA26Ebn+1dG1/1I
	psWcTluZoEF5nFhRMM4xQ7R7cu2q5YKGz3VAm4VEeg==
X-ME-Sender: <xms:3dnrYj3Nnk3_V6ZIy3fmt5T4mD7KNu4tgyqQrdheSNuySvgV1CYfEg>
    <xme:3dnrYiFNNBvOkNqyCxQr5IbHzid2QFFZJ2j3lJ6ffmfoOqG79kv0Qr6ytZsBQRcHF
    W9qrudhTUur1g>
X-ME-Received: <xmr:3dnrYj7VXELQPUHPp7ADgSmeIPXr74_cHH5MEYCVKdbYhq8nRHmoyNDvwVB7NrEvnxAWIqKIy1dvxC3GYsuIoEoX-ZczrjsAl9xh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:3dnrYo3rJ0eK5lN5813MXUOkoYhrr9znm62f08Mm_cD2bgfv27K3sg>
    <xmx:3dnrYmG939F4kalYtpV2FI7ASRcKOxxFlIWpkJPJHLCuxjL1az8GvQ>
    <xmx:3dnrYp9ku5TTbdIL0Rg-9PY63hJ_U_0bMtHLIhYufatEXdl9-x_9gQ>
    <xmx:3dnrYoP7KbH8AXhrNZzO6KeeeJZyGRy5TpNd4o3uzyZz7BpAcZrj0A>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Aug 2022 16:38:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 05/10] IOMMU: add common API for device reserved memory
Message-ID: <YuvZ2mhKOkHEdQt8@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <6a99f9b99b419a20e895d54db2e345c80270248c.1658804819.git-series.marmarek@invisiblethingslab.com>
 <fbffdff5-04cc-f314-98da-29f1984149e3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obIwdAUoZzEWHPl2"
Content-Disposition: inline
In-Reply-To: <fbffdff5-04cc-f314-98da-29f1984149e3@suse.com>


--obIwdAUoZzEWHPl2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Aug 2022 16:38:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 05/10] IOMMU: add common API for device reserved memory

On Thu, Aug 04, 2022 at 04:25:38PM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -651,6 +651,51 @@ bool_t iommu_has_feature(struct domain *d, enum io=
mmu_feature feature)
> >      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->feat=
ures);
> >  }
> > =20
> > +#define MAX_EXTRA_RESERVED_RANGES 20
> > +struct extra_reserved_range {
> > +    unsigned long start;
> > +    unsigned long nr;
> > +    uint32_t sbdf;
>=20
> It's not easy to judge why this isn't pci_sbdf_t when no callers
> exist at this point.

I'm following here types used in the rest of IOMMU code. Especially,
this field is later passed to iommu_grdm_t func, which is:

typedef int iommu_grdm_t(xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctx=
t);
                                                          ^^^^

I can probably use pci_sbdf_t here, but it will be cast to u32 later
anyway...

> > +};
> > +static unsigned int __initdata nr_extra_reserved_ranges;
> > +static struct extra_reserved_range __initdata
> > +    extra_reserved_ranges[MAX_EXTRA_RESERVED_RANGES];
>=20
> With __initdata here, ...
>=20
> > +int iommu_add_extra_reserved_device_memory(unsigned long start,
> > +                                           unsigned long nr,
> > +                                           uint32_t sbdf)
>=20
> ... this and the other function want to be __init.

Ok.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--obIwdAUoZzEWHPl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLr2dkACgkQ24/THMrX
1yyyUggAhE8UHt73HotcbffIMIcg+Ew1fmjKpmWMSkGy+hZCMtUatHt8YROEDLwk
bqIKEP6GSa7/YGd7slftBbUmBzGxQ1nzyyWqRdenCWvgwabcJN7VmzD+TAf8kqxV
NWY1LrhzPQ7PUPrB9Dow2MJxHwehC1oPQtnUNghqnRZ5VbeXLqd7im1yLBx00iIB
UPmejU9jJeIKRpbFW+Bft1dk5+6CdI7CxXkJWspSleIdTqT3+g7Ifvy7Hdw+WL2q
XO9St3FyQnQlk1RTsybYoneY8Q5Q9F6faRA/mlA1evAeXSg212YFZQ7g62/H8Zs1
jab1BDQkIvlXZJofYNVnXu8dWsIEKQ==
=Jn/X
-----END PGP SIGNATURE-----

--obIwdAUoZzEWHPl2--

