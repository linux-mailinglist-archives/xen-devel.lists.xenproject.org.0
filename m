Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92B105C78
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 23:10:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXuba-0006JB-8a; Thu, 21 Nov 2019 22:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J/W5=ZN=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iXubZ-0006J6-18
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 22:07:13 +0000
X-Inumbo-ID: 449e0a6a-0cab-11ea-adbe-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 449e0a6a-0cab-11ea-adbe-bc764e2007e4;
 Thu, 21 Nov 2019 22:07:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id AF0D621C7D;
 Thu, 21 Nov 2019 17:07:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 21 Nov 2019 17:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=um6JSZ
 DQEaT3NxH+BS77Niy1g353ib4JQ9VwKh5cUEg=; b=WlvRpp+LYLAD0hpyiN48Ui
 /fhdmiOcQLLr8ESusEhN5+4oXbHLE7XmXjN2Wlbwjd5ptyUOUPozfB+yWYk90fGo
 J+vCyZJaejpRyzmFDJyi+RGbOXf32PI8Ydms6k5AYaxH05rDv6O+jwf90/vyMszD
 aWl+g5vWAIJOqO6QPVcS06p6ZU6YcB4YwPSAHOmC3rPOwKjdd4n/2jLaSUHsIV+c
 iJF+a98YFQu/WoozAppnJsDX4lJfGwwamIve3spooMvWXaA75rfMnWBd5blf7T42
 29nGlDMuLO3cFZs9zXK2u81HJR/dB0tANv88fQ4cRYuVX+6PbypCpAT8lfl86LaQ
 ==
X-ME-Sender: <xms:jwrXXWS72MssYnTc0PCz0xH_reWS7IZQBidic91W_u_NeykzB60YmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehvddgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpeigvghnrdho
 rhhgnecukfhppeegiedrudekledrvdekrdehjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jwrXXRK1voMQfDSxS3aIzuGtTsj83GyQMNSV_s78Hmz-s-C2a2QQ3w>
 <xmx:jwrXXUArphJCD6bqpTPHEBct76W5yBzd0-OPrLmcgb01_1T42OSUWw>
 <xmx:jwrXXSB9rj18Hn4Xt_J9ErbUce2kYZx4AKRd-ezH84KebRsVIQSGnQ>
 <xmx:jwrXXVxDNn-CG-Ew2yW1nHH0a2eNScUSK6_fbzMq2qoO3K92snSgtg>
Received: from mail-itl (unknown [46.189.28.57])
 by mail.messagingengine.com (Postfix) with ESMTPA id C26C63060057;
 Thu, 21 Nov 2019 17:07:08 -0500 (EST)
Date: Thu, 21 Nov 2019 23:07:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20191121220704.GA2012@mail-itl>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy9ytrZ6dhvPWGj5K8aHYOaTfFFwnS3oLbMwUpRDAGEzjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9ytrZ6dhvPWGj5K8aHYOaTfFFwnS3oLbMwUpRDAGEzjA@mail.gmail.com>
Subject: Re: [Xen-devel] Status of 4.13
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5462364965890632648=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5462364965890632648==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Status of 4.13

On Thu, Nov 21, 2019 at 11:39:14AM -0800, Roman Shaposhnik wrote:
> On Thu, Nov 21, 2019 at 9:38 AM Andrew Cooper <andrew.cooper3@citrix.com>=
 wrote:
> >
> > On 21/11/2019 17:31, Roman Shaposhnik wrote:
> > > On Wed, Nov 20, 2019 at 10:06 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
> > >> Where do we stand with Xen 4.13 regarding blockers and related patch=
es?
> > >>
> > >> 1. OSStest failure regarding nested test:
> > >>     I'm not quite sure whether the currently debated patch of Andrew=
 is
> > >>     fixing the problem. If not, do we know what is missing or how to
> > >>     address the issue? If yes, could we please come to an agreement?
> > >>     As an alternative: any thoughts about ignoring this test failure=
 for
> > >>     4.13-RC3 (IOW: doing a force push)?
> > >>
> > >> 2. Ryzen/Rome failures with Windows guests:
> > >>     What is the currently planned way to address the problem? Who is
> > >>     working on that?
> > >>
> > >> 3. Pending patches for 4.13:
> > >>     Could I please have feedback which patches tagged as "for-4.13" =
are
> > >>     fixing real regressions or issues? I don't want to take any patc=
hes
> > >>     not fixing real problems after RC3, and I hope to be able to get=
 a
> > >>     push rather sooner than later to be able to let Ian cut RC3.
> > >>
> > >> 4. Are there any blockers for 4.13 other than 1. and 2. (apart of any
> > >>     pending XSAs)?
> > > Any chance the efi=3Dno-rs regression can be added to the list? I und=
erstand
> > > that I'm still on the hook to provide more details (I promise to do i=
t on Fri
> > > when I get to my lab to actually have a serial console on all these b=
oxes).
> > > At the same time this is a pretty serious regression for an entire cl=
ass of
> > > devices where Xen was perfectly happy even during RC1.
> >
> > https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D534f9e29=
ce28580892b3856036b5e5cd805667cc
> > has been committed.  It is in staging, but not in master yet (because
> > master is blocked by my regression in 1).
>=20
> I'll make sure to test it on Fri, but here's where I'm lost -- my
> understanding that
> activation of this patch requires a special build flag to be passed.
> Which means,
> we're still very much in a regresses state when it comes to building
> out-of-the-box,
> no?

No, there are two thing:
1. A bug triggered by efi=3Dno-rs flag - fixed in the above commit
2. A second commit making efi=3Dno-rs unnecessary on some machines - this
is what require build flag (CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=3Dy).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3XCogACgkQ24/THMrX
1yx2WAf/YxzJbL9b3XBs4PJtxlek6HKZbXhxU2uytIGbqEwL1gkuLPfFWgekKJYc
mpQH1Fcdv94brszVsGzJaQVxHFH7isl0Pwq+hA3/ikN1XHlBJkzQjZm/cX9Z9KZU
HRyF1Ij5xvNQG8lipwQmTPFkbx8gZPm0P9c5W7p9LdXE6hZXcxnx3/ycWOzwaorP
GT4kqLX+wa+ZKXbqzj8my4LyywBscfemEhR//6OzoycfpCMN+de/KyS8wjdMfVM+
TeJ/PBIbzTcl0ONmR9d+SoxIs7suvFSLaTlGB5LPUuw/e97sjkhChQkeo6hdcLpA
659Z8ZURFW15i0gEi1HPAxS5+gMW9Q==
=yTpT
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--


--===============5462364965890632648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5462364965890632648==--

