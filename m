Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99F59852A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389564.626570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg8z-0000gG-2x; Thu, 18 Aug 2022 14:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389564.626570; Thu, 18 Aug 2022 14:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg8y-0000eT-UJ; Thu, 18 Aug 2022 14:05:08 +0000
Received: by outflank-mailman (input) for mailman id 389564;
 Thu, 18 Aug 2022 14:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfC2=YW=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oOg8w-0000eF-E8
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:05:06 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfb82581-1efe-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 16:05:03 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1000E5C0113;
 Thu, 18 Aug 2022 10:05:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 18 Aug 2022 10:05:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Aug 2022 10:05:00 -0400 (EDT)
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
X-Inumbo-ID: bfb82581-1efe-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1660831502; x=
	1660917902; bh=UMXYJt87f0N4AhiKwMZrQQI1f+dK74xJXMr5zJBBHpA=; b=a
	wrOSMoXvtFybJSTnLluTtuRYBJUHQQ3JRGOXQHQWn1BhS19FfuDWz3Mg8B5UiXIA
	wJ4hnrNM9UO4mQHo8jCRcMqQnlFDdHurpnfDMRFjmR9hVcpi9ZlJ4dpk8iVj0hXh
	LKBco5lO/MyW601I1XwZOeX+SdME/WA6y7SxStTIGNN3f4a2EI1NIODG5oLOEwSo
	QNhkI67oMRgw5PgGQ+rEJWFmLLC0TAAl0KaUkCSwvZp/iAVJKNpokn2TGJYah+x7
	a9nV5/8tAG/Egu96zOLFoXdDFrEgJA5yld+ct6oMaQEmV3tod8K+W/ljXuygkuZ6
	uZ5A2VCq8QswVeMl+CuDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660831502; x=1660917902; bh=UMXYJt87f0N4AhiKwMZrQQI1f+dK
	74xJXMr5zJBBHpA=; b=pTgbXyZgfX1Ml4fuoT4GVdDhbbECS/F5Zg1/sg8vUmcL
	lm98pX0WrnlEt/JnIo4PvyriHMD8qisOxT5CtL15jsvnhSKO3wRArdjmvwqXQP5D
	wKoJHtKN/RB+AMH0oGYC+dlojgcptVdrJlkfLFZSBoPgL7Gi5OpEtGL5OY0ZjVnx
	7ow6a+kRxrvTx5qaxtpNWJxcFeLaHrnMoVeA5d3uRVTBcJfQg25Ruy76WiJ1Ab+d
	4xryRZHVoYplq3S0lsxtkMJyrU4p3QyYVBnLXXApcUERbwLEBQvLsQIJJaehaEMl
	BRYvCX8JXOfTyxdGQ04qqNwh+69KE7wLkaiaOuW68Q==
X-ME-Sender: <xms:DUf-YnW3y2b8JB-SP5mCzHWrVnFuIVLsyKNXIh_w4J77Xzdan_3PFw>
    <xme:DUf-YvlWYqnRxH9adUPJBYGCF8XYDx9stW-k6E68AdCziO6soK81HjFQZXB4d0J6w
    NTNxAzYqnVifLE>
X-ME-Received: <xmr:DUf-YjYW74vyLBr2fqBVE1_jELIHqv13DaK1Jm0F2fklYARpV84ThdxY6pcP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehledggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:DUf-YiVlbPUvxGOrjl-Sz8Va_EqaCzQNk2SFwRlfGnbquuEhSoEUIQ>
    <xmx:DUf-YhkTZnLnu94d2QWW_Nsu-P7Ca0N-zH0HGbXMe0NJ2_Ztuj69AA>
    <xmx:DUf-YvczkTQjpRdvYQrBRIb9DRGAsNlpIQ4v6vLAb_3NCupPq4cAdQ>
    <xmx:Dkf-YmwKbSv1RCjPZNkFUPfnKqnlZPUYPaqM4W6pQgkFGwnYAZtxNA>
Feedback-ID: iac594737:Fastmail
Date: Thu, 18 Aug 2022 10:04:43 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Use direct I/O for loop devices
Message-ID: <Yv5HC/MA2LUHNYKO@itl-email>
References: <20220817204634.1886-1-demi@invisiblethingslab.com>
 <499daffa-b1c6-3868-c164-65335963922c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QDvFRp4ZAwz0ZCDM"
Content-Disposition: inline
In-Reply-To: <499daffa-b1c6-3868-c164-65335963922c@suse.com>


--QDvFRp4ZAwz0ZCDM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Aug 2022 10:04:43 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Use direct I/O for loop devices

On Thu, Aug 18, 2022 at 09:02:11AM +0200, Jan Beulich wrote:
> On 17.08.2022 22:46, Demi Marie Obenour wrote:
> > This is a huge performance improvement for two reasons:
> >=20
> > 1. It uses the filesystem=E2=80=99s asynchronous I/O support, rather th=
an using
> >    synchronous I/O.
> > 2. It bypasses the page cache, removing a redundant layer of caching and
> >    associated overhead.
> > ---
> >  tools/hotplug/Linux/block | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/hotplug/Linux/block b/tools/hotplug/Linux/block
> > index 2691b56951c9b82094471a141b9e0bed04abb929..75785f3a5422c4a5f962a4c=
d4f6acae5080d036d 100644
> > --- a/tools/hotplug/Linux/block
> > +++ b/tools/hotplug/Linux/block
> > @@ -330,7 +330,7 @@ mount it read-write in a guest domain."
> >          else
> >            roflag=3D''
> >          fi
> > -        do_or_die losetup $roflag "$loopdev" "$file"
> > +        do_or_die losetup --direct-io=3Don $roflag "$loopdev" "$file"
>=20
> I guess you want to first check (maybe in tools/configure) that losetup
> actually supports that option. The old-ish one I'm looking at doesn't,
> according to its --help output at least.

What version are you referring to?

In Qubes OS the current plan is to use a block =E2=80=9Cscript=E2=80=9D wri=
tten in C, to
improve performance and (when combined with kernel patches) eliminate
race conditions.  This code could be made a wrapper for the C version.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--QDvFRp4ZAwz0ZCDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmL+RwsACgkQsoi1X/+c
IsGhOg//VlXR8hu9p/35wcZaeqaspVbvHHa/swMCHjtzd28UGimqtKO+QrWFp235
bCMXfhNBjcVjr2zaroOwdBlMRawmbHtJyU57kPwyB/4kS0I4r+0bDCLgeZckKpYp
h+AqxfWZmtISzTGXoQOpwmzKCGwvIkuZiYNw0sRxazFLOIGYEbZwT2AJJZo5Mxk/
wHr353jrtOvCkNAFeQ9PljJFiPebapg68vu66THUhISD3gvudxqO7Hs/qQkshJFR
/JGSw4ChUcpG6bCvfHAgaBx6l5iPI+O7l3R+8qyYnSupH1+uUM8ZwV4FMAZNkQ+y
5xq2q920yy3BM8gsJuTBdgl/a+JZF308z+QPA/Xfx27clcNNP69EZN34y2/Ju8+P
nre2j83DhqQ4nmpwvmhkFrzm09oevT3vhenFVlylBYpbfWkNxnlQYnl8+cfkLb2a
CjM36v7opFrk5wdcLGg3nLX68k61qkevCafRjh7APxfsZfzFFAQT5xuRtFjhCi1C
CjFz6Z8WWEAbytbVJp7edFgmbERsdqvZJrd3trFs4DHCnhn3XzvyUBuTCMwMtnhf
MbhRaipFqrUrtfEuXk3R6wOTLSMbg4tfiaop76+CVyOb3qVdBYvK4v1RU5/qAj3a
KsIaewqSTKX+3o9z9Z+Qq94xohG/0HQfz7S7tiR+rLn6SH1YUzc=
=iPQZ
-----END PGP SIGNATURE-----

--QDvFRp4ZAwz0ZCDM--

