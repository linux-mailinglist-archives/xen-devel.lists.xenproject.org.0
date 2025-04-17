Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F85A91BCC
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957469.1350584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ODo-0006VH-ND; Thu, 17 Apr 2025 12:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957469.1350584; Thu, 17 Apr 2025 12:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5ODo-0006Tk-Jk; Thu, 17 Apr 2025 12:20:00 +0000
Received: by outflank-mailman (input) for mailman id 957469;
 Thu, 17 Apr 2025 12:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAEg=XD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u5ODm-0006Te-Bl
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:19:58 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44eb37fe-1b86-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:19:55 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D4D9125401FB;
 Thu, 17 Apr 2025 08:19:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 17 Apr 2025 08:19:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 08:19:52 -0400 (EDT)
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
X-Inumbo-ID: 44eb37fe-1b86-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744892393;
	 x=1744978793; bh=/YymnZgAfdFnpouMVkP3K4lNpne9K0hMX2+wm/bdN9U=; b=
	cOrZoz9bFe4fNVg54vio+SiZHZJb8lQLkDevj0AcH7M9RZKcPhGFOMS6KkgI2uYG
	3JVb6rcAgcB1ft3L7ovdFJOg5KxIVON2pTslZ2YV8z4h0rydcG/zjdJzusqJV6jD
	ZgQD16ljF59idDRrGh/j/tCVReiNs7eeDFrXFfsraJXISkX4gUGcEOjbZyVjAJOQ
	w0vSJxYfI/WP0OldZ0k+9OASDx1DeL1mRff4OQug+Uni8m1q+3KXQZXylHHVQSPV
	6zy3ty0kKh7xKQ7OSYq61BV0X65ZdjRhj1v621e/7Ga/6hoepUtopcSCqXKG9KGp
	XmgxLnlouCMvoKDUKlombw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744892393; x=1744978793; bh=/YymnZgAfdFnpouMVkP3K4lNpne9K0hMX2+
	wm/bdN9U=; b=IHZVtMRNFlx6Ah+z1Yxf29l/GFMFYznCuB4AF2hWwAuQNIbXnP7
	/694/d4NB3tGjYHf+6C6nBKiBM1VhQSE/om3v8dlOANOvLpXfcSeXTUtGGxJFQeU
	FYNB2zEQCcZKbJlbPhFlHa2sR37lB+9vfGmwlDLkK4vjqswRJn6oVqizAJ+ikzIp
	SlOIZqKB8tIjQ2pZxg0zGX3fAj8kpoxHvb8RwogJI1dVzIXKRaJVZey5YMlIq3Aq
	zH0nmZEMB5+RmTotS84qh76O85rhXcIErh8GL8DNxbqPY3xisnpeC6KbLC2+DS0j
	QFcMnjqMiwROiCwZEdTbTFmbQcQWKPoXTHQ==
X-ME-Sender: <xms:6fEAaPW8Ip4B8pG-OeX9vCb1yO6w-WF-0gSpiLE1zxb_6NUMyKZ-IQ>
    <xme:6fEAaHmuYHoz7wWjtw3xDpCX-cLcOtrck_CJENMXfjH_xsFJ4faWeSiACcKREjlgn
    bJ-Oggxj-qaZQ>
X-ME-Received: <xmr:6fEAaLZX17TPFG2aA8vcMv0UB_MdWomcGCZAUDiM0omDqq1mdsHmkKgXQidpQcRFGNuVQ6jN_ofmVGJmrM7VxEW8yb67X_J_qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:6fEAaKVIKW1jMlRewhQW1lb7JFYkgILTLfEV8OmgsZfnb6-KTdp1mA>
    <xmx:6fEAaJnwN9wumGMijADfI3Vbw54WA_Qtv4KsO_1sDOitLVodIGQVrA>
    <xmx:6fEAaHeD7QH2sOE-DSfG1Sfw-HwUM-lkI9Dq_t7LDUOjLz47HGV_Pg>
    <xmx:6fEAaDF1jwyUuJ-ZYHUFHGV0AlpP8aNmaZo5vKm5qxPSPAQ26OOInQ>
    <xmx:6fEAaF8GYpZjfSiHk7Uj7x8VuZiFx66RGFS-lpPDG3tBoJ8ckHQS7QZA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Apr 2025 14:19:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aADx5mw8QHZmVuKh@mail-itl>
References: <20250415153246.81688-1-roger.pau@citrix.com>
 <20250415153246.81688-3-roger.pau@citrix.com>
 <c890cef7-da7c-4cb1-922d-8b0b155eca43@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/csOlLAnJ9vkQ+oo"
Content-Disposition: inline
In-Reply-To: <c890cef7-da7c-4cb1-922d-8b0b155eca43@suse.com>


--/csOlLAnJ9vkQ+oo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Apr 2025 14:19:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages

On Thu, Apr 17, 2025 at 09:57:29AM +0200, Jan Beulich wrote:
> On 15.04.2025 17:32, Roger Pau Monne wrote:
> > +void register_subpage_ro_handler(struct domain *d)
> > +{
> > +    static const struct hvm_mmio_ops subpage_mmio_ops =3D {
> > +        .check =3D subpage_mmio_accept,
> > +        .read =3D subpage_mmio_read,
> > +        .write =3D subpage_mmio_write,
> > +    };
> > +
> > +    register_mmio_handler(d, &subpage_mmio_ops);
>=20
> Are there any criteria by which we could limit the registration of this
> handler?

Yes, see patch 3.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/csOlLAnJ9vkQ+oo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgA8eUACgkQ24/THMrX
1yyanwf/V2dX9hn+v3TcWnqS4wsCNXJ18KsDVzW+He2WaUfNXYGskkpAgY5CjK8/
G4A2exCwv/cWREx6wnfAoV7m03sbqleOEqqg6yDUQszAWEXlW/H3BPsckYnpLYA/
0mVfuZ0hrpR2CRpMp/K5qfvFElJ6jgMJOFPGN2nrDgRCxi1cyD8aI+1cjiFzXdYf
3luU51L1i93GYg/5aqa7Atw1Cn/I+q+mU9yY2BmKL/rP90Xm2oEQdBIG5eu/mCs8
1vl4oClVcjQJPbtwTEYedOy9jZb+TTIcdU9PBmMSoD3856+hj36s59LwPS1cipSj
8es6WULrf+0zo2x+UV7IFLNxv1s5LQ==
=OeUV
-----END PGP SIGNATURE-----

--/csOlLAnJ9vkQ+oo--

