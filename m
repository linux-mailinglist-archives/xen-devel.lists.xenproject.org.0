Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942B27D10C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 16:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.231.541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGbT-0002MK-JG; Tue, 29 Sep 2020 14:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231.541; Tue, 29 Sep 2020 14:27:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNGbT-0002Lv-Fl; Tue, 29 Sep 2020 14:27:39 +0000
Received: by outflank-mailman (input) for mailman id 231;
 Tue, 29 Sep 2020 14:27:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtTE=DG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kNGbR-0002Lq-R4
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:27:38 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6be425ca-6290-4f59-8985-c53c7252794f;
 Tue, 29 Sep 2020 14:27:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1962F11A8;
 Tue, 29 Sep 2020 10:27:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 29 Sep 2020 10:27:35 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70EA1328005E;
 Tue, 29 Sep 2020 10:27:33 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GtTE=DG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kNGbR-0002Lq-R4
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 14:27:38 +0000
X-Inumbo-ID: 6be425ca-6290-4f59-8985-c53c7252794f
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6be425ca-6290-4f59-8985-c53c7252794f;
	Tue, 29 Sep 2020 14:27:36 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1962F11A8;
	Tue, 29 Sep 2020 10:27:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 29 Sep 2020 10:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zYtKFI
	+eeQ2I0tPXwv97DOTKWW4mfFueIGI7GZti4lo=; b=OCcJDVCy5Ngkw7vvSRESBE
	izW9hQ80DEbE6RUMjG7inZyhrNqA18+Q5MpKRKmfQTeW2O9NHxv7jFaRYUMWgSDa
	ZTVJPQNgANn/7+ukQYbvo940BdoiHLrf+aIcKKJ+KoJsNJaPgfZIhFwvfrpoP2mn
	z4Ll4394BF6loPHxOuLxffM9UZM1P2p+PDLQaye+5jQpppJABlFMTwok0BNNSL29
	/d1hxA7IwWBZj/20iWAa+O7lLSuERGeqOBB++DFNuNvtdGN3Yr5OxJTt9QQVZElc
	UOlFVsccPdWfk3elwZHwkyg91V2ZMD2Su/ekyZteXu42eVCiewM5gKGZxwbwrLAg
	==
X-ME-Sender: <xms:VkRzXyEsI2cNGqfRDEu8VLCt7ku2K_j1RyvoHSVBmb3hcVjl7jJxhg>
    <xme:VkRzXzWMARiXUk8_kukGA3FRReCOD9G7VNsjVDTDhfLUVygt-pTYV-46SyvZ3n7MO
    Q9ZjJK6vgZblA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdekgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:VkRzX8Ko3MquNHmo5dhUsqzdzJK4kNhY1vOIej_ILCqVOQcaMkdpBg>
    <xmx:VkRzX8GSTbPeZChYGI3yu8vLaV8GmyswpfEAGMZi29WmEc656zPzGw>
    <xmx:VkRzX4WmEO4G1kekaTu-wp80lIavkMlC4vz-dK0p2h2CfHiqVmok-g>
    <xmx:VkRzXxdcmT0joVIDsyCkp4iwcRMyU1BN8-P_4us7JhmEJlEb-TzjIw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 70EA1328005E;
	Tue, 29 Sep 2020 10:27:33 -0400 (EDT)
Date: Tue, 29 Sep 2020 16:27:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.de>
Cc: Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
Message-ID: <20200929142730.GA25731@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20200323000946.GH18599@mail-itl>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13

On Mon, Mar 23, 2020 at 01:09:49AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> > [Adding Juergen]
> >=20
> > On Wed, 2020-03-18 at 23:10 +0100, Marek Marczykowski-G=C3=B3recki wrot=
e:
> > > On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> > > > On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > Hi,
> > > > >=20
> > > > > In my test setup (inside KVM with nested virt enabled), I rather
> > > > > frequently get Xen crash on resume from S3. Full message below.
> > > > >=20
> > > > > This is Xen 4.13.0, with some patches, including "sched: fix
> > > > > resuming
> > > > > from S3 with smt=3D0".
> > > > >=20
> > > > > Contrary to the previous issue, this one does not happen always -
> > > > > I
> > > > > would say in about 40% cases on this setup, but very rarely on
> > > > > physical
> > > > > setup.
> > > > >=20
> > > > > This is _without_ core scheduling enabled, and also with smt=3Dof=
f.
> > > > >=20
> > > > > Do you think it would be any different on xen-unstable? I cat
> > > > > try, but
> > > > > it isn't trivial in this setup, so I'd ask first.
> > > > >=20
> > Well, Juergen has fixed quite a few issues.
> >=20
> > Most of them where triggering with core-scheduling enabled, and I don't
> > recall any of them which looked similar or related to this.
> >=20
> > Still, it's possible that the same issue causes different symptoms, and
> > hence that maybe one of the patches would fix this too.
>=20
> I've tested on master (d094e95fb7c), and reproduced exactly the same crash
> (pasted below for the completeness).=20
> But there is more: additionally, in most (all?) cases after resume I've g=
ot
> soft lockup in Linux dom0 in smp_call_function_single() - see below. It
> didn't happened before and the only change was Xen 4.13 -> master.
>=20
> Xen crash:
>=20
> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed a=
t credit2.c:2133

Juergen, any idea about this one? This is also happening on the current
stable-4.14 (28855ebcdbfa).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9zRFEACgkQ24/THMrX
1yxBOQgAlgzSs+N2d1NxWSLwlRGDazOWvzI2uZ4tS7oSQCHjTWxGg1qUU0OYFsPX
rKYO/ycJXN03doFKa/gl2m7ceG1+irXd+PtTPLaxmQg/LgNVBgZh+o0EtQUpIGAn
9fsB5FO201CNWIEubPvytmr8ma6x2dVySfnnZR2VV97pSQSinVCcAHXHtpLhUB43
SbuL4A3jKpSHiInfqMKwRcw3uAxiG9DtIhF4lWPWzhzGTy/SBPYux4+HioIik785
HXxGNZ0DmWxBmCyuDeKqeX11HcKw30yqIL11GSGDUlLdlaBXQjTnnJGXT6wQDjrZ
Cj6d+GF18QNW12+ZRmBvX8Fp1t9W3Q==
=aMI1
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

