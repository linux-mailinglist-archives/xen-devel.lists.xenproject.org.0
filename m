Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9CA6888A5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 21:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488946.757254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNget-0000td-1s; Thu, 02 Feb 2023 20:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488946.757254; Thu, 02 Feb 2023 20:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNges-0000rk-V2; Thu, 02 Feb 2023 20:58:14 +0000
Received: by outflank-mailman (input) for mailman id 488946;
 Thu, 02 Feb 2023 20:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn6t=56=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pNgeq-0000re-Lo
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 20:58:13 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5748d4-a33c-11ed-9254-a70e01b1f5fa;
 Thu, 02 Feb 2023 21:58:08 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DA6AD320092B;
 Thu,  2 Feb 2023 15:58:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 02 Feb 2023 15:58:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 15:58:02 -0500 (EST)
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
X-Inumbo-ID: 4a5748d4-a33c-11ed-9254-a70e01b1f5fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675371483; x=
	1675457883; bh=dzgq76cYFXWqr386VYF7ubjMYy/4D3tzRP84ABBYvhg=; b=s
	yCLlVbTqQbtyOeBRMnG9EpqbCx6GzKG4Hg76/luZQ/eT+Nq9KviKBIiPk+EkLyHN
	wY8o1LK4fkCBtVnIJpyFq/3uMePbmk18mOBTu1FtZlnea8hsTT+V0ADGIDWRhH0Y
	HmaXYjlOubsbx0jyYW+w6UkKGWiAPzRLX01mPJLTxzP3CbDw+xuj6CZsMzdaJHwy
	zz7n0TZRUFqXaB+xy6f9WcjAeq2n1OrDxGcXKRnyc5jxfA50PCEqMf1Dv4h+Ilys
	+0pQMVtNOlgCmknLyqvAUXce5gpbqq8qhAlozlmsIsTboWSZ0IaKavHetQepNQ+N
	Vf4qnei6SmJnjdUl3+Y8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675371483; x=1675457883; bh=dzgq76cYFXWqr386VYF7ubjMYy/4
	D3tzRP84ABBYvhg=; b=d478ZEMjTvlRbXKOPtpHsd8vraJQZ8JvpW/VI0IyDbKa
	ub8yalBozVWUnGc6bPbOpDNSOTg8Lm0AVtkKHHYIBiEZB4EQsN/G6zRvWYh/SO77
	oqaoIBNpljYZmw0CZVXXQPbpSe7AT/+1VmKYR2NkuJyf5+DLFBJG7RDslYanVOWi
	xDu6yLmqiurqTapj3VST8SSDjPqEIvq3uDPEHgeQB1moyddyusGd+OZGX/EaVbmr
	qJd5lvChm0484XwC1n1MJ0Pb6H2CISyZtIB2oCMiRoBfs7hjL3BCjlrH/zHRCN/O
	swy3q63rmHwpD4B13y5JUcNG3YJJTV7ZSCiIo5S80g==
X-ME-Sender: <xms:2yPcY7tcw21RPig7naYjpZ6H6dwpquQnrG9dyYCCsC_SO_OrElL9tw>
    <xme:2yPcY8eZ2C_sdhpFPhKUBAGGjp7cEYKEExpHOBXe12q6JcbAonrRs4vlap4ncRPyE
    rzOyfPCyxHOsp8>
X-ME-Received: <xmr:2yPcY-ybNkb6KIwG6AijR8J_KlnElmfdmJgF3stTvxmSv21P77BvI7VYu1I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedgudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffeg
    fffguddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:2yPcY6PXyZ-XxC3SkpbI8K-CuaRtc4uGfh6p8bDVxakleZoHXx3h5w>
    <xmx:2yPcY78GNcH9dYC5p5jT_OkOQJUe0tG5IGP3yjLdVptSBUrOtLpdMw>
    <xmx:2yPcY6UVnkK9xEhPiWHjp90EY8gUVooRfy67Mbs9Q-MqOueT7KlUnA>
    <xmx:2yPcY8MjyBeI6TP0-uGTzOPpMY64H6ftI7SGGQ-hEU3jV0fGd_QJVA>
Feedback-ID: iac594737:Fastmail
Date: Thu, 2 Feb 2023 15:57:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: Re: [RFC PATCH 0/7] Allow race-free block device handling
Message-ID: <Y9wj2MpEXI/P2/6/@itl-email>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
 <Y9vp3XDEQAl7TLND@redhat.com>
 <Y9wEF3rWfpiCKc2i@itl-email>
 <Y9wVcskXyOk3bbzC@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cgmN2P5oJuiMWNP7"
Content-Disposition: inline
In-Reply-To: <Y9wVcskXyOk3bbzC@redhat.com>


--cgmN2P5oJuiMWNP7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Feb 2023 15:57:55 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: Re: [RFC PATCH 0/7] Allow race-free block device handling

On Thu, Feb 02, 2023 at 02:56:34PM -0500, Mike Snitzer wrote:
> On Thu, Feb 02 2023 at  1:41P -0500,
> Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
>=20
> > On Thu, Feb 02, 2023 at 11:50:37AM -0500, Mike Snitzer wrote:
> > > On Wed, Jan 25 2023 at 10:33P -0500,
> > > Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
> > >=20
> > > > This work aims to allow userspace to create and destroy block devic=
es
> > > > in a race-free and leak-free way,
> > >=20
> > > "race-free and leak-free way" implies there both races and leaks in
> > > existing code. You're making claims that are likely very specific to
> > > your Xen use-case.  Please explain more carefully.
> >=20
> > Will do in v2.
> >=20
> > > > and to allow them to be exposed to
> > > > other Xen VMs via blkback without leaks or races.  It=E2=80=99s mar=
ked as RFC
> > > > for a few reasons:
> > > >=20
> > > > - The code has been only lightly tested.  It might be unstable or
> > > >   insecure.
> > > >=20
> > > > - The DM_DEV_CREATE ioctl gains a new flag.  Unknown flags were
> > > >   previously ignored, so this could theoretically break buggy users=
pace
> > > >   tools.
> > >=20
> > > Not seeing a reason that type of DM change is needed. If you feel
> > > strongly about it send a separate patch and we can discuss it.
> >=20
> > Patch 2/7 is the diskseq change.  v2 will contain a revised and tested
> > version with a greatly expanded commit message.
>=20
> I'm aware that 2/7 is where you make the DM change to disallow unknown
> flags, what I'm saying is I don't see a reason for that change.

Thanks for the clarification.

> Certainly doesn't look to be a requirement for everything else in that
> patch.

Indeed it is not.  I will make it a separate patch.

> So send a separate patch, but I'm inclined to _not_ accept it because
> it does potentially break some userspace.

Is it okay to add DM_FILE_DESCRIPTOR_FLAG (with the same meaning as in
2/7) _without_ rejecting unknown flags?  The same patch would bump the
minor version number, so userspace would still be able to tell if the
kernel supported DM_FILE_DESCRIPTOR_FLAG.  If you wanted, I could ignore
DM_FILE_DESCRIPTOR_FLAG unless the minor number passed by userspace is
sufficiently recent.

Another option would be to make userspace opt-in to strict parameter
checking by passing 5 as the major version instead of 4.  Userspace
programs that passed 4 would get the old behavior, while userspace
programs that passed 5 would get strict parameter checking and be able
to use new features such as DM_FILE_DESCRIPTOR_FLAG.

> > > > - I have no idea if I got the block device reference counting and
> > > >   locking correct.
> > >=20
> > > Your headers and justifcation for this line of work are really way too
> > > terse. Please take the time to clearly make the case for your changes
> > > in both the patch headers and code.
> >=20
> > I will expand the commit message in v2, but I am not sure what you want
> > me to add to the code comments.  Would you mind explaining?
>=20
> Nothing specific about code, was just a general reminder (based on how
> terse the 2/7 header was).
>=20
> Mike

Thanks for the feedback!
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--cgmN2P5oJuiMWNP7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPcI9YACgkQsoi1X/+c
IsF28hAAhImjjtlWhG/0QL5ADEU4goFI++sArqOlA2RYmyVjye52flwl4Fzd+px3
qEsA6mLllD0x2SxfycOirT3D5d0Gsa8BVPs+WiaWed5Rc+LececX+YGQ6HgEUZBM
Ig69iNxrCcA5CARoNWd/RsHZSuxSE9ltgzo00ghW+LNRKVyYAn0nuAWddWLqYrvr
wVdonaDhI5IC15GPQ4CK4T21JTO16NsUjld1A03pgr0ubzV+UpwWGNycwjSpz2KB
WzHAq5NTLvda6dLUmt1o/z7dJR04gPA8ICyF/zKXzkjuOgeTvQOTY25iv5O3xQYv
1WHAJJqxb8twWMw+bU92sjoUJy4jdqr5DQ7n+ga5eEG0YAPBkRwcPuKdJdotbUFF
8VP90nUdWDGlmc+w20GlNzziVOyxLFbVgxFO1evJ0Kq023gzvcgs69RqV1mLfP44
hD18hdcC2ytp8TwhNrERzmBxWjEtD1MphgGXAiJQ0qQEyYlKAYNUyolM8lTnTQR9
Xccwj6ow7pMDIV+DkNuD4Ebiu7dx4WhjyTc4jx9NHSUUDeuff0v4PzFCiXr/x/dN
0Sml2ojt43HPUfLXaepFNwLCqL54zGNNa2gsH0gyl0iwAFMAgNbMcUAx10lCOmDj
d7i37cInvPYgsSr2WUgz7mbiLlQN3Eh8tf5ut+q+OOOq+cRPKCs=
=P5Xt
-----END PGP SIGNATURE-----

--cgmN2P5oJuiMWNP7--

