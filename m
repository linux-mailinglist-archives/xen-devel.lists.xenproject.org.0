Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEFE9AA433
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 15:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824194.1238282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3F9e-0004ar-EL; Tue, 22 Oct 2024 13:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824194.1238282; Tue, 22 Oct 2024 13:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3F9e-0004Xt-BG; Tue, 22 Oct 2024 13:42:34 +0000
Received: by outflank-mailman (input) for mailman id 824194;
 Tue, 22 Oct 2024 13:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30Tg=RS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t3F9d-0004Xn-HA
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 13:42:33 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4b8467-907b-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 15:42:30 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D65B225400C0;
 Tue, 22 Oct 2024 09:42:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Tue, 22 Oct 2024 09:42:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Oct 2024 09:42:26 -0400 (EDT)
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
X-Inumbo-ID: 7b4b8467-907b-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729604548;
	 x=1729690948; bh=QsUIZSvy7iTeKwd7o6Oj4e4fh/MyY6NRmw99aN7J8lQ=; b=
	IOcSf5X/Sl3CkI6CwN204XtZbQE4BIc9SLkVa7zRCx3MA4lOsCfDgQ2u8lysIKyn
	V/TriSQUXnIumUm+WXYGXr5my7y5bRmF1gotDOPoMC8t81bpGpTkjJiXsKqxQ/pV
	qgXaLtHZq9Jcd3Twlch7WROh6uPPsCJGEjiofEFkDEUimIz4N+9YqEpZ7XOUriXE
	cGCy9/qlsvESHAnPF57DSu+zqV4EesxcDkmYSQ86WbxEoQKhf0PJvSxpuhuxv+Zt
	k61GFVTihP1419PqlHdh5QKsjVD0IsMru8HAK3K7rsFYtCPLECmhtuf6AS/LuEfL
	7W4T9nek3jw41eUVdmCB9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1729604548; x=1729690948; bh=QsUIZSvy7iTeKwd7o6Oj4e4fh/My
	Y6NRmw99aN7J8lQ=; b=e6ugWl5zT1tGEbPKW1v/YkcpWZpzcxVFmzcyP59WpBLY
	IYLhorgqDtRiDm1TkJIc27R3RkaaBWrHex1oUaePveIxMUjo6LEFVNDYqCIlrNxY
	XyIkPil6F5ALhmLPIlPUQD7ZoeFkOvNLSNE7eiUg/3pgjYZmVLywzr22a7A1eiwI
	ZEMqZb6QtusexnRG/RIuIvWjI2M8J7MDB3LQMYkZu9HQHEqGk8WBF1HI+m2JpQgd
	Sj4rb7fExpCTNys/C1P4DasWb/EnCzb8U56eyK0gmzBpD3lrqxwsl7zsCng0Klxv
	es3/L+ipOYZpqRXmMVjJEhCxmom0zb1PSbM8MlDndw==
X-ME-Sender: <xms:xKsXZ7Otuxcvo_6UhgFFZ1VMnCNxyihQe2nfsg5WpbbARxc1EyF5hg>
    <xme:xKsXZ1_j8VtEe8_GZsrNchw-SbAy0n8gLr55BEHs01lTof2t1CsfuOYSxcIw-JtKS
    JGLuvSFaJCcRg>
X-ME-Received: <xmr:xKsXZ6SBOW3GA6EOOQ7qAUYye9uIGl8LKGo40wBR2fujLJD5DZzN-FV8sM3rOr2K8nzqD7zygk4Ek67Dh0Q4bvYm3XqRUVg-xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeihedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvg
    hllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhse
    grphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegrnhhthhhonhih
    rdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorh
    iivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtgho
    mh
X-ME-Proxy: <xmx:xKsXZ_v2CCz_kSuiDI-JC1gxNV2XOrD2pmiy8y_Lv9477aVVF58niw>
    <xmx:xKsXZzdvXmOSY-cx7RPvZGY12QWp7cYv9w1fImu87EedrQ2xIz-j1g>
    <xmx:xKsXZ71gu-DMX5CMwoLlVgNcKoWaEHd0sDOPqZSM6xXtYAUwXGyh9A>
    <xmx:xKsXZ_-Pi49ncnaJzClfJtQfuz4bX-qfP1uP03e7UKnwFP4ioJGbDw>
    <xmx:xKsXZ7Tli_6BICzIqNGnYUOLYSZstABQ1pqQDz90L2kUmOlq4IptRf11>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 22 Oct 2024 15:42:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests
Message-ID: <ZxerwL4qqQwfLrzF@mail-itl>
References: <20241021143539.3898995-1-andrew.cooper3@citrix.com>
 <20241021143539.3898995-4-andrew.cooper3@citrix.com>
 <78116f34-2448-4b08-9eb3-50d70a18074e@citrix.com>
 <5d02722a-eccd-43f9-9d6e-2e845d9757d9@citrix.com>
 <alpine.DEB.2.22.394.2410211524170.3833@ubuntu-linux-20-04-desktop>
 <60833e8e-47bd-4b75-a263-f3b88ae40b6d@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZJ/XHJzuyQooZUc6"
Content-Disposition: inline
In-Reply-To: <60833e8e-47bd-4b75-a263-f3b88ae40b6d@citrix.com>


--ZJ/XHJzuyQooZUc6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Oct 2024 15:42:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 3/3] CI: Add {adl,zen3p}-pvshim-* tests

On Tue, Oct 22, 2024 at 02:25:54PM +0100, Andrew Cooper wrote:
> On 21/10/2024 11:28 pm, Stefano Stabellini wrote:
> > On Mon, 21 Oct 2024, Andrew Cooper wrote:
> >> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/q=
ubes-x86-64.sh
> >> index 76fbafac84..95090eb12c 100755
> >> --- a/automation/scripts/qubes-x86-64.sh
> >> +++ b/automation/scripts/qubes-x86-64.sh
> >> @@ -44,6 +45,11 @@ echo \"${passed}\"
> >> =20
> >>          if [ "${test_variant}" =3D "dom0pvh-hvm" ]; then
> >>              domU_type=3D"hvm"
> >> +        elif [ "${test_variant}" =3D "pvshim" ]; then
> >> +            domU_type=3D"pvh"
> > This is not necessary since PVH is already the default. In theory, it is
> > harmless, but it caused me to do a double-take because I initially
> > thought I was missing something, given that PVH is expected to be the
> > default at this point.
>=20
> That was more fallout of refactoring.
>=20
> My first attempt (which worked) involved writing a whole domU_config=3D
> block, and then I decided that was a bad thing.
>=20
> Selecting PVShim without also forcing type to PVH is a little fragile if
> anyone changes the domU_type default.=C2=A0 I think it's cleaner to keep =
both
> together, even if it happens to be re-selecting the default.

IMO it's okay to leave re-setting the default here explicitly.

> >> +            domU_extra_config=3D'
> >> +pvshim =3D 1
> >> +'
> > Is there a reason this cannot be:
> >
> >     domU_extra_config=3D'pvshim =3D 1'
> >
> > ?
> >
> > These are just minor cosmetics.
>=20
> Again, refactoring from before pulling out domU_type.
>=20
> I'm not fussed - I can shrink this to one line.

Either is fine for me. The short one is more readable now, while the
long one is easier to extend in the future.

Anyway, for the series (c80e9241209cc9ed7f66c3f45275f837ddafc21c and
previous two):
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZJ/XHJzuyQooZUc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcXq8AACgkQ24/THMrX
1yzGHgf7BD5dQG/Rvg2fFhlEZXdO9m51p8pblSUcrVtZNkS5On85vPPgtKITG/FU
iofwbdP2L1tN38WQukgcHJjfuaOdoIJFo6X5Akt+YXv7E6q01kEH3677stNjeRxX
7TKQpnk69y7yzxeS13s/pZ1oZfA9So654PtNmWYMkko+3GqqC1TSjMCCqR5Ysb6F
e0Tfwpw2hX8fNHs8uE2XFwL01i7P3DVoC3bK0n88N6X2X6RX8qLNhaCRU8EDf2RA
o4mkSvemnwnBlcWIyJJRZ1hJWQGvL6JIXoqLplZgaGrMoG0jPg9SMLD+wEjvGvMo
WPr6zK0StOtZrp7UnTSznI07cLtQ2A==
=ezcp
-----END PGP SIGNATURE-----

--ZJ/XHJzuyQooZUc6--

