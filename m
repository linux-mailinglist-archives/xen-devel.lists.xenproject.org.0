Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBFA8B6AC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955463.1349233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ztl-0002ub-UV; Wed, 16 Apr 2025 10:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955463.1349233; Wed, 16 Apr 2025 10:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ztl-0002tk-QL; Wed, 16 Apr 2025 10:21:41 +0000
Received: by outflank-mailman (input) for mailman id 955463;
 Wed, 16 Apr 2025 10:21:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0Wq=XC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u4ztk-0002sh-Ir
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:21:40 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9493424c-1aac-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 12:21:38 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 39BAC13801BB;
 Wed, 16 Apr 2025 06:21:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 16 Apr 2025 06:21:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 06:21:35 -0400 (EDT)
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
X-Inumbo-ID: 9493424c-1aac-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744798897;
	 x=1744885297; bh=MAAqGjTF3gbsArBeILm+CnJnsxaujCfpMwOQK1iQ0iU=; b=
	IW7dOiIxDipq3ie0kwtrausPy5REu7cLV1+fQWLBDf95i+xbp3/VpPM+CmHmO0NI
	SnwJuNktCH6BVWdp6xCZoNcrMeoDQNwayhzAsaiQDwFBfT5xQlDXkOSYG2lX9Lhl
	LtG74uom6WnwSov1doL/aa3i8h0+IR1RAyPaezpFe5PAoMtdKJ/6Mf+AlEZ4rFb/
	HoWls5E80O+nPOXBU2pqUeuHDa/58Q+FEBr7qtRAH1XChVbeZs4ZnW6SnAYZiXsM
	WXptv2ng3IT//UJ9eQ/cmQxXDLjEU2vQalQXT/47LKsJ+ZBQM0T40iP8/BLXNhFM
	6Xebz9uTgkkhjhzkmP/G0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744798897; x=1744885297; bh=MAAqGjTF3gbsArBeILm+CnJnsxaujCfpMwO
	QK1iQ0iU=; b=QGwW2GMv34qXcNLFkeEq0th4DpGitD+Gjc30N3rM1EO9GSG7d8e
	dRgmcrpXdr+tjFpN8Rz3bw8LxYDJYsnfGFAeRuR5HqeGiVBFcdu5YzC/dX7HRUlR
	x6qBZUrXhSt+JjvzPpOMvuBmQURwoULcDm/Cud0ZSnhZ9mcZfoUaTut7d5w+SP+9
	hpx1zSLCRYWL0IYI2RcmM6l4YyUJ/x8G8BIBxQU9BZbgbzE1d5y9qde75+rc8Ro7
	bahjGDvLECAsHSJW2Cdm4N2hLrSjN9sV6wsDheubiCPfzu86iRk/Jp8K0PSRmEnh
	NIUmeol0hoAiDOi0b5TGbrwuoT9oqedFhbA==
X-ME-Sender: <xms:sIT_Z8zKK8KbrjWWzjZvX1zBJ5LYfHpXcRgvEg8-621XmgO_CxHDxA>
    <xme:sIT_ZwS93ii3ylMfF0_KgAM0x9_2saAj2QsG4HfBk39dFzPdwqXi3-b3FjBHS5UT3
    Jg3gIxvTb23Lg>
X-ME-Received: <xmr:sIT_Z-VquDMsbF-YYvRrwlnF0IMuA0IqJBaU7pfIjyCnN-1el_k_fuOyGCcmAdK5XNzV1O7Svt4utlcehkR2wmfv5ogKr8qpoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeiudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghn
    ughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrg
    gsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghl
    sehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonh
    ihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdho
    rhiivghlsegrmhgurdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtg
    homhdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegrmhgurdgtohhmpdhrtghp
    thhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:sIT_Z6itjhuS7d4a-Z8zdFgZ0sMO3pf2krAWF676HDIdctL4oNDRRw>
    <xmx:sIT_Z-Ck6O6f4J6Fu6E9smP_Rp2s3eogmcQBxIuvatMwSHTHDGyCeQ>
    <xmx:sIT_Z7IPlnxr70wcc7q0Zy0l0BmXCkO677gmebwigLnxKeuPwAyS7Q>
    <xmx:sIT_Z1AstCR4eiJkJgOL_yte_kBcdPO1JK-Sizvm0iY5ibMQqd2pYQ>
    <xmx:sYT_ZxYnYBHmFkNBvRHzDeg16nrwmzCMvb0P71mjKzLUsYymt968NCfv>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 16 Apr 2025 12:21:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged
Message-ID: <Z_-ErdkJ3Gxs_vFN@mail-itl>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
 <20250414101843.2348330-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504151645260.8008@ubuntu-linux-20-04-desktop>
 <44efebcd-877e-46a3-a072-07c44fc29f27@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B0tjhU7DyFyR+kr5"
Content-Disposition: inline
In-Reply-To: <44efebcd-877e-46a3-a072-07c44fc29f27@citrix.com>


--B0tjhU7DyFyR+kr5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Apr 2025 12:21:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 2/7] Overhaul how Argo is built and packged

On Wed, Apr 16, 2025 at 11:15:21AM +0100, Andrew Cooper wrote:
> On 16/04/2025 12:48 am, Stefano Stabellini wrote:
> > On Mon, 14 Apr 2025, Andrew Cooper wrote:
> >> Right now, the argo artefacts are a pile of files which the test has t=
o turn
> >> back into something which resembles a filesystem.  Furthermore, becaus=
e we do
> >> not build modules for the main kernel, it is extra important to make s=
ure that
> >> xen-argo.ko doesn't get out of sync.
> >>
> >> Build argo conditionally as part of the linux artefact.  It's ~100kb a=
ll
> >> together, compared to ~14M for the kernel.
> >>
> >> Produce a single argo.cpio.gz with xen-argo.ko in the standard locatio=
n.
> >> Prune userspace down to just the executables and libraries.
> >>
> >> This is cribbed from the existing scripts/x86_64-linux-argo.sh, which =
stays in
> >> place in the short term until Xen can be updated to use the new scheme.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Do we need to remove x86_64-argo-linux.sh?
>=20
> Yes, but 4.20 still uses it.
>=20
> One thing I'm not sure about is whether "keep latest artefact" is just
> artefacts from the latest run, or the latest of each named artefact.

I think it's latest run for a branch. If newer job (on a branch) doesn't
include an artifact anymore, it will be gone. Jobs referencing it won't
see it immediately, regardless of expire time.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--B0tjhU7DyFyR+kr5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf/hK0ACgkQ24/THMrX
1yxGlAf+ONwQGjd6R39/J3IRNuj0tsTJCZ9067K9zxbmIHk8TG1cfssoPhOqigwT
FTLzLn1oG8c8itd3zKjMwPSwSuhucfiEMfgf9LRKffJb/5JZCKeZ26C8kXMOde3P
JQKumVOzim1biWKKPuDmNSAqfYa053iHPPhMvjjbY6xLw0suUb8uzIOXX7HhqIVh
sNERMFWAmjp2960rhsmKUQuxlPTKP1mLVY8Vx1U+8MXnUoo9cccgBuCb//ptYqvb
XQrpVoqwXh8yHXPXicF20BZni8Ucmdf2uJ0dv33BkXUy5foMHk1hrEw9Lcv+p2lD
dQvs/x0pfL0pOn90gqLwmryyDUgRQA==
=PXat
-----END PGP SIGNATURE-----

--B0tjhU7DyFyR+kr5--

