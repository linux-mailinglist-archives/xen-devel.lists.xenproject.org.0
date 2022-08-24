Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0982B59F026
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 02:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392133.630296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQe8G-0005Op-DA; Wed, 24 Aug 2022 00:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392133.630296; Wed, 24 Aug 2022 00:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQe8G-0005Lq-8q; Wed, 24 Aug 2022 00:20:32 +0000
Received: by outflank-mailman (input) for mailman id 392133;
 Wed, 24 Aug 2022 00:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uXbF=Y4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQe8D-0005Lk-Vl
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 00:20:30 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf46310-2342-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 02:20:27 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BB949320089C;
 Tue, 23 Aug 2022 20:20:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 23 Aug 2022 20:20:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 20:20:21 -0400 (EDT)
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
X-Inumbo-ID: 8bf46310-2342-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661300422; x=
	1661386822; bh=jhqine6tioc9SRTTbs48FPG/6DmMx2nuU81ZJ+wYQm0=; b=L
	YpahCYQNZP7p1afFRcWAXtEnxo+IwgLGypPZBxkp0lbdqyZQPq0oDnYtknWvnbWx
	FhSMN6kXzdPsTtMVCzjDGmPyDqlqA8uX0d2yMbBZRi/GjNKGlmoZGo8F2bB8Jt3T
	RiBHy2rdO/bmIqVX9UmBTnUUOg+w/03R+MWYcJyushizQsQ4ADB+T4etZ36howfg
	g7UtwEbWLZa32nBMLdCMfb0SpLrHhZj26zZvAOYlweVzPnFBIOAG0+bmNExrVp8F
	5+VmRHZeL8rVZnLuVWG03Qb43CgiAx4OzJuvU6I3koPZHZqBntHTsHukmOBs8hFk
	DIDiwb/fLgVY/uWabFZhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661300422; x=1661386822; bh=jhqine6tioc9SRTTbs48FPG/6DmM
	x2nuU81ZJ+wYQm0=; b=5U6bjsOqd/1PYhIIle05EjNnb/6g1zm7LH/j+8x6ynq0
	7yKmjPSixmnGH8uT3dCkY02QMbFLl/1HnsRQSXL3c3VT3cFijW6Sd8uJ4v8ZR3bn
	1MaAx/oqR5H14EqSZFNvU6oJfvqWAeS4rVldz9eezncfI92aagqpkVbgHyhdzluk
	LcIwBDCxRwgVpSuixAOWw897hhw4hA3cNLPjbXGtcNtjANNiPjlWX/u4OUQP6tqK
	H1zzh9rKkPuPpM+xVWLnnajB2uBCOgK6M//Kk9gUWOSWLzenbaJhyJL5axjFKp5b
	Ibxks67sl/usy01Ps9sL0/K3xL/e1vPHGPpyGxKuYg==
X-ME-Sender: <xms:xW4FY45Zn6qLPrI6nYrXevvjmMEisR3wOPlczup16EufaHvQgowAcA>
    <xme:xW4FY57RLMs-lxJTjU0KI-za6MXc9YDxb6hZOUNY2YwihZhPuLMrlezKmGay2BvIO
    KXNpVg0DxSZ7A>
X-ME-Received: <xmr:xW4FY3eMcf9mDEsq356xTG4e3rBhXSndW_NVKE-b7uIvLrggebba0MKNfjtfcmurlZNihThEz7_WHdW2GGjGkK3uv3sCvAQlvNtj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejtddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:xm4FY9IkI7zyDkVO5uohVuANdkWBZPv2YUAEq40sz5QLUfq31ys9gQ>
    <xmx:xm4FY8Id5_c4iXNpSlavSJEEEZkJ1rM0BtCyGHZnu-5cwBPpVdX3gQ>
    <xmx:xm4FY-yT4l03HB0KTP5L49OW3jKNRlr6ERwtNHTSKeXocsHi4FUUxQ>
    <xmx:xm4FYzlakuRRPe0UBlheNaVjzYXZkZZhwAl4ThXkQAL68gy5rZqLjA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Aug 2022 02:20:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors
Message-ID: <YwVuwXOGoZX3pM7n@mail-itl>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Zc5vf7v04SCbLQ3"
Content-Disposition: inline
In-Reply-To: <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>


--7Zc5vf7v04SCbLQ3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Aug 2022 02:20:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors

On Tue, Aug 23, 2022 at 09:48:57AM +0200, Juergen Gross wrote:
> On 23.08.22 09:40, Demi Marie Obenour wrote:
> > I recently had a VM=E2=80=99s /dev/xvdb stop working with a =E2=80=9Cba=
ckend has not
> > unmapped grant=E2=80=9D error.  Since /dev/xvdb was the VM=E2=80=99s pr=
ivate volume,
> > that rendered the VM effectively useless.  I had to kill it with
> > qvm-kill.
> >=20
> > The backend of /dev/xvdb is dom0, so a malicious backend is clearly not
> > the cause of this.  I believe the actual cause is a race condition, such
> > as the following:
> >=20
> > 1. GUI agent in VM allocates grant X.
> > 2. GUI agent tells GUI daemon in dom0 to map X.
> > 3. GUI agent frees grant X.
> > 4. blkfront allocates grant X and passes it to dom0.
> > 5. dom0=E2=80=99s blkback maps grant X.
> > 6. blkback unmaps grant X.
> > 7. GUI daemon maps grant X.
> > 8. blkfront tries to revoke access to grant X and fails.  Disaster
> >     ensues.
> >=20
> > What could be done to prevent this race?  Right now all of the
> > approaches I can think of are horribly backwards-incompatible.  They
> > require replacing grant IDs with some sort of handle, and requiring
> > userspace to pass these handles to ioctls.  It is also possible that
> > netfront and blkfront could race against each other in a way that causes
> > this, though I suspect that race would be much harder to trigger.
> >=20
> > This has happened more than once so it is not a fluke due to e.g. cosmic
> > rays or other random bit-flips.
> >=20
> > Marek, do you have any suggestions?
>=20
> To me that sounds like the interface of the GUI is the culprit.
>=20
> The GUI agent in the guest should only free a grant, if it got a message
> from the backend that it can do so. Just assuming to be able to free it
> because it isn't in use currently is the broken assumption here.

FWIW, I hit this issue twice already in this week CI run, while it never
happened before. The difference compared to previous run is Linux
5.15.57 vs 5.15.61. The latter reports persistent grants disabled. The
only related commits I see there are three commits indeed related to
persistent grants:

  c98e956ef489 xen-blkfront: Apply 'feature_persistent' parameter when conn=
ect
  ef26b5d530d4 xen-blkback: Apply 'feature_persistent' parameter when conne=
ct
  7304be4c985d xen-blkback: fix persistent grants negotiation

But none of the commit messages suggests intentional disabling it
without explicit request for doing so. I did not requested disabling it
in toolstack (although I have set backend as "trusted" - XSA-403).
I have confirmed it's the frontend version that matters. Running older
frontend kernel with 5.15.61 backend results in persistent grants
enabled (and both frontend and backend xenstore "feature-persistent"
entries are "1" in this case).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7Zc5vf7v04SCbLQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMFbsEACgkQ24/THMrX
1ywEeQf+Lq/bCZLrsZYLglFLm+l+FVIONbEShTaE+wdZ6ZwIJV+rmD01j3AVbfPD
McU42MuW+4t0oSIhhC/NTjcj9CGgCMNeORu2/Kiqg7D8WQ9ChW/yFYFMTRikRJda
SxjkPC5pc2kjgOpIOyiqT+RsElU1oXDAQ4cNiJeNOTs0Dbh+DY2tX5SEFZjOZi9Z
uL7MFtOr8WGz/dpFHtAvD3Brki0sOcxudetjmrFVi87M/JMKBST6C0HiQrNw+YkL
+P9wW5up/c1nvVK1hLKQg2wnUJZGvjQUW6CSgAEfHPUDht+EjdOYDVsun2ixURa1
9HrcA9kNFBCmoHUYkyAW20bhr9dQTQ==
=TTnc
-----END PGP SIGNATURE-----

--7Zc5vf7v04SCbLQ3--

