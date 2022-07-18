Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14572578046
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369596.601041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOO2-0001v3-Ia; Mon, 18 Jul 2022 10:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369596.601041; Mon, 18 Jul 2022 10:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOO2-0001s4-FG; Mon, 18 Jul 2022 10:54:02 +0000
Received: by outflank-mailman (input) for mailman id 369596;
 Mon, 18 Jul 2022 10:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDOO1-0001rt-PU
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:54:01 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edfbcf0e-0687-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:54:00 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BDD355C00B0;
 Mon, 18 Jul 2022 06:53:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 18 Jul 2022 06:53:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 06:53:58 -0400 (EDT)
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
X-Inumbo-ID: edfbcf0e-0687-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658141639; x=
	1658228039; bh=sQWR+ymapTCFmzQplP+QcaxkiCDXShRilBBu23MQdkk=; b=S
	Olmy5OsuyHvi2HHMEKNy9KCBc4damsN8BW0aF+QEHj/G1xmo6g0lpj2TVralJkND
	YOS+t9suUDm0L8n9zCU2aCQ+2I+K1YqUvIBv3iQZmXabqRutNSJWgp+rWUAjkFxc
	Nhi5ovxHBwE01DAJXiKYV/2Kqi2vitG0Vj8dwa9W9MraLCQBxp9/ePa/qLwrAdDf
	vYgt7Atve2d9XzfJ+xgYsnQTmwZjt+rNDHEHOWCyFnMmoJG6UuLHn512knwvtm3D
	ub8spSwIU1dfCukV3saCnCXto7drmCaxAk2MWEdvLcKduO2wZGE0CeoR5gxUtGl/
	Im/XdHBLnUUGMPTLGZPJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658141639; x=1658228039; bh=sQWR+ymapTCFmzQplP+QcaxkiCDX
	ShRilBBu23MQdkk=; b=FGxUW+lp+3HBB8u+Hz6vHndiuglkSW53AzAl1jehqGUx
	5Q7ThY2IC+Lgoj8sG816f2aKaNN8ELOgOZiQMWn/Oq0yMOg/DGI4PRD2w/n7DH/q
	9lC03SoEe9Eiu5U82DCk0K3/4S0loDYZPvAkAfM+1GQSe/0SH9bpYCufafv3Qfcl
	Mj9PYfeuO8QH3sgGWFaL4qlER4EiUhCTTdWfoJKG2vStvPpID1UpYgxBMpQiaCIx
	rsjjMgATB1zKqr8LnOFy7WztuKcfBG0+psxaLT0Bxfm1KRfNUHwl5uhlKhUgEjGU
	qdzEpgJ7wNgJeTL900Q04ezl0QaSemRMHhx0bSvzBQ==
X-ME-Sender: <xms:xzvVYqfDr4bocjU2kYErzC8ggh8Yx82BSds2qTzPaVSZS7izziETWw>
    <xme:xzvVYkN0iLp8DSZPH_ogYJEJO_tFSy9SUgowcAlEVYFlQOkmTUIGjO5-K7G2HineJ
    oVBndFkTRgBig>
X-ME-Received: <xmr:xzvVYrgKskPkgpkefw-2xv1SYkzxJPuDE3_rgGTutEMOqjquOmJ6M-8SawAvQWZ6S9QYMjY3yKe01gIGz-nuxPxnCVkRvN_DkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xzvVYn9M8355VZtG4hN5awdP7OYj4VHN5FF_ZJOjGG92j0v16tdsQA>
    <xmx:xzvVYmtwqYdpEvoq6VrXo_L7Q4BrLc7wqX4GY_t-NJVImCTfVPGDCw>
    <xmx:xzvVYuGbr-sfVKYrJdgYtKcerey6kgbyS3qi8NTneQHoW7Hq1gQ6EA>
    <xmx:xzvVYrXIkYQctu_kwdyH8dRzKKsfEX4QZ2ROH4wets6EbPNZ94ONMA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 12:53:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory
Message-ID: <YtU7xF7+TE0XVTi2@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <2538c56f6881e4e2a3e5cee3cbdeebb88a59ccb5.1657121519.git-series.marmarek@invisiblethingslab.com>
 <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q3so7Phe/MZSuiIN"
Content-Disposition: inline
In-Reply-To: <38020a5e-121a-932e-691b-6eaf435be7d2@suse.com>


--q3so7Phe/MZSuiIN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 12:53:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/9] IOMMU: add common API for device reserved memory

On Thu, Jul 14, 2022 at 12:17:53PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/drivers/passthrough/iommu.c
> > +++ b/xen/drivers/passthrough/iommu.c
> > @@ -651,6 +651,46 @@ bool_t iommu_has_feature(struct domain *d, enum io=
mmu_feature feature)
> >      return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->feat=
ures);
> >  }
> > =20
> > +#define MAX_EXTRA_RESERVED_RANGES 20
> > +struct extra_reserved_range {
> > +    xen_pfn_t start;
>=20
> Why not unsigned long?

Isn't this the correct type for the page number?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--q3so7Phe/MZSuiIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVO8QACgkQ24/THMrX
1ywtYgf/XkJOy87gUCbJv6JUZD8O+3QMYQ83kXPLbSS0Ke7O17F6cwL62vDPHNgh
rsNNUZJ1twrTinp8ri2aswsMTfibvxOKFySBEDqWtmdb5svthP+a1ktqWUW3ni65
Bha+zWDOPiQbfr7xAVISVk1R5bNclh1dm1bTD+4FXrVRGgt3697edWvD0gTqrSFg
8j6t1a3vIkKMJf9G7NwEtCIAWbP363TzabnJFM0q1q8tIU7OCXi+7j+g0xcXo7aw
V3uGdUmbhPszIyCDo7x66WyBSpTBUWUyAieMOgIgB8Id9GBhhq7wTyVkNYXSg7Sp
BYpNIVHUFpZCn1EoFuzFzYeheDgwfg==
=qVrJ
-----END PGP SIGNATURE-----

--q3so7Phe/MZSuiIN--

