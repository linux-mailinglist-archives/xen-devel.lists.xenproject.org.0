Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F375D808
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 02:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567752.887229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0AN-0006GK-66; Sat, 22 Jul 2023 00:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567752.887229; Sat, 22 Jul 2023 00:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qN0AN-0006Dl-3O; Sat, 22 Jul 2023 00:08:11 +0000
Received: by outflank-mailman (input) for mailman id 567752;
 Sat, 22 Jul 2023 00:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qN0AL-0006Df-Dg
 for xen-devel@lists.xenproject.org; Sat, 22 Jul 2023 00:08:09 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44eb633-2823-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 02:08:06 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0786332009FA;
 Fri, 21 Jul 2023 20:08:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 21 Jul 2023 20:08:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Jul 2023 20:08:01 -0400 (EDT)
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
X-Inumbo-ID: d44eb633-2823-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1689984482; x=1690070882; bh=lo81Z5XiiVt0VQgrdwBS5L2EEO+iG6cybrF
	8gYyRMtM=; b=HwBcIIAEQjcolJxjRNeTdGhp56G+dCalpTVVOA5Kq8AFlRvxCn2
	fqvzBNDhMXV10fCC4hOFbE88OxKP+TJB74cBnX8xWbxbCtrwxY2ieLk0YX/CQ0CO
	VvnZTWmSCuddvvq6k2Mp9HNOwWLsn84EBFf5F+7AEs6PL4+onJ8NfyI0fjwy50Yt
	8D6AmylXJi92TgZRK6pwaHaXL8dHnmdtiNu1ZthuMABe2gNyqQce/4xws+zqgDmU
	HRTI0Cg5/8sC1n54d583VlXoxbpKGZ1O+DyvokZXuRieSUth7xrbrkWFLAQ5W9f1
	88GzaERDyukt0gO3AWwel8DXbBB2rKCj7cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689984482; x=1690070882; bh=lo81Z5XiiVt0V
	QgrdwBS5L2EEO+iG6cybrF8gYyRMtM=; b=DhLb7Xsn0UBhXP9X131Yj4lYiIcTf
	Q2y5rOOzlFOoGIbTXtWJoqdfUVRcx74gy1CuET6PEcec67ekkVcuJ0iATyrF740a
	nEtqVh5iSAj54pmBYLKtKoIZQVzhw1U7Oh6ulDhsKu43z7K7A+PU9l1d5rPtz7Vx
	zMopTJPgtqcpbGoXz26cCLWiRNuV/IbMYz7c/baGn2A7W8lgRFg5TLTVx+/9Kk7w
	Y6xKvTUrsyh41H+6wZ/P99OguJfgFmY55G28oOGXzNoWLgrLhTHwnG93oG6adXBK
	EJY9Tkpv9CajQ8xhe8vCnK5PJ9CIEkHf5vLyi2rwcKmC6hcpA0oct8oWw==
X-ME-Sender: <xms:4h27ZFSwHYj9BiSchAEBdb4k_4raxQe6YJ4vtusXmPLM4i1NJVZwDQ>
    <xme:4h27ZOyndU4SbH2x46UK21juooFMf1vWt5eTxL9NsMT0QnQ6Z0rdI8yKDvpSj0i4v
    Mm0uBfNP9RxUA>
X-ME-Received: <xmr:4h27ZK3f5omFkwZkXSc_0aVQrHGKKG7KccCPfH8tIAVnKr0BRDrf5DHmzcMviI5ikpHYvbdUFNkZ5SL_qSmLsEpv1-r2x_uv4xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheefgddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:4h27ZNAWoqKSClAW0jGUefkg6Vmviva1BK18bJbDZeGEsviXNDC9bg>
    <xmx:4h27ZOhahoOPp_rGyajpGiQud2yEmoE82aheXjciFOcrUXdACA450g>
    <xmx:4h27ZBrBpzSU9HawSUjNVjS6CciJxv3Q5Vtd_8FpSV5S7---73CTNA>
    <xmx:4h27ZBvdGl9rLOCbsz1owt2IpFQfCdZyoJB4zc-6bBlilGoxHcsj-w>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 22 Jul 2023 02:07:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
Message-ID: <ZLsd3tdSvTLwIyt3@mail-itl>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com>
 <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com>
 <ZLVLaPeyOwDYYUXL@mail-itl>
 <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dxU4tSYp7S118o/5"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>


--dxU4tSYp7S118o/5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Jul 2023 02:07:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch

On Fri, Jul 21, 2023 at 04:42:11PM -0700, Stefano Stabellini wrote:
> On Mon, 17 Jul 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > > On 17/07/2023 2:09 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > "staging" branch is mirrored (automatically or manually) to several
> > > > repositories. Avoid building it several times to not waste runner
> > > > resources.
>=20
> Hi Marek,
>=20
> Let me try to understand the use-case a bit better. You would like the
> following "staging" branch to run a full pipeline:
> https://gitlab.com/xen-project/xen
>=20
> But if someone under xen-project/people is mirroring
> https://gitlab.com/xen-project/xen, this patch is attempting to skip the
> additional pipeline. For instance, if I am mirroring staging in my
> personal repo:
>=20
> https://gitlab.com/xen-project/people/sstabellini/xen
>=20
> We are skipping the additional pipeline there.

Yes.

> Is that correct? If so, it would be easier to ask everyone to make sure
> they have "Trigger pipelines for mirror updates" unselected:
>=20
> https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#trigg=
er-pipelines-for-mirror-updates

If that's set in gitlab as pull mirror (instead of push from somewhere
else), then that indeed may be enough. But is it really in all those
cases?

> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > > > ---
> > > >  .gitlab-ci.yml | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > > > index c8bd7519d5fb..c3b05e32636b 100644
> > > > --- a/.gitlab-ci.yml
> > > > +++ b/.gitlab-ci.yml
> > > > @@ -2,6 +2,12 @@ stages:
> > > >    - build
> > > >    - test
> > > > =20
> > > > +workflow:
> > > > +  rules:
> > > > +    - if: '$CI_COMMIT_REF_NAME =3D=3D "staging" && $CI_PROJECT_NAM=
ESPACE !=3D "xen-project"'
> > > > +      when: never
> > > > +    - when: always
> > >=20
> > > If we're doing this for staging, we should include staging-* and
> > > stable-*.=C2=A0 They're all the same from this point of view.
> > >=20
> > > However, this does need double checking with the committers who use
> > > gitlab regularly (CC'd).=C2=A0 This doesn't happen to interfere with =
my
> > > commit workflow (I use a separate branch called for-staging), but I
> > > can't talk for others.
> >=20
> > I'd like to avoid broad patterns like staging-* or stable-* here, I'm
> > pretty sure people do use branches like staging-X.Y-something. While it
> > would be possible to exclude them by listing exact names, I'm not sure
> > if it's worth it, given the push frequency to them (few times a month)
> > and those being mirrored to less repositories (only FuSa fork?).


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dxU4tSYp7S118o/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS7Hd4ACgkQ24/THMrX
1ywjewf/R1KUufnfLRhWeuPIU/fKaEk935WklMZwFfdeVf7kqXk4HR5zdkUq+acj
qmfjca9R15IiJMArhUZEKwGDMQwTg1Xih2wtnI+2reDz6Dd5qIxZt8rP11SyCK3K
bhZN6Sue2WDSC2u52BGIVsOk3rqgUqH110ur0U/FJFxoLs6jI5wjHMMo8GfeWdcL
y5Ws0On6CCq0UFHxbjp3Ekg7uAIsqJHxZkJ9pAOFCVZpym53yJSQXoGQPSKqQPVH
L24obYuM2oySJjQBGJFig9xGlL8NFNfVbSiS3i5OiBoGI3BknGVTbugWW+4TEoA+
X3pyZQg/52BkleSGuf0434eScpjKgw==
=qfMs
-----END PGP SIGNATURE-----

--dxU4tSYp7S118o/5--

