Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FB34A851
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101820.194997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmky-0008Kq-Lh; Fri, 26 Mar 2021 13:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101820.194997; Fri, 26 Mar 2021 13:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmky-0008KR-Hl; Fri, 26 Mar 2021 13:44:08 +0000
Received: by outflank-mailman (input) for mailman id 101820;
 Fri, 26 Mar 2021 13:44:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3UtC=IY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lPmkx-0008KM-C5
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:44:07 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba1c1410-b1b7-4c51-8698-7a786a3c853e;
 Fri, 26 Mar 2021 13:44:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 630191CD6;
 Fri, 26 Mar 2021 09:44:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Mar 2021 09:44:05 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8675724005A;
 Fri, 26 Mar 2021 09:44:02 -0400 (EDT)
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
X-Inumbo-ID: ba1c1410-b1b7-4c51-8698-7a786a3c853e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9/IjJe
	iYxx3t/DAoDZmmzyOMFZL7HIJttlB53JUX5eE=; b=QF2pp9LTl9jgqSwVNW6/s0
	zUx/JcgCunTaOcGZUQ8cqo3R4eGFfQPlHqkeIAkHYntt6+Wpic6nuN9V08LIyHy6
	UcVIiNajTPwlJl8sAu1cwmT1YHywRoapM897MZWeUQ3qIYIOldzdl5qq3Al/U6Ea
	Hk8RHLNbKu4vCDXIJe31HrOkatsTwDcDnfkJ06lSK/FWZqVb9P8stduFjoTJHag9
	8fUBbLdnepRtoIipSfGebD6ubgGtoC4Yb4U8n2FC/H7GY5mplnicY61Fmy+SoRgv
	I0SbRezFUaWRGkQguvAmu3TVDXGtjWe0el6aW5s/H/4c/bEf9UiIP1qCB95ESbRw
	==
X-ME-Sender: <xms:I-VdYFUyS3Q5lEhbdcTWe3sCoierN91kzBjjFAy1tOLspZm1U9ZS0w>
    <xme:I-VdYFnojneAqNZQL2kaOQ9y9xe0g_8MN1aEoynAdCeLQ4_-Lydpd5W2xAimstQAf
    51HoMOnhGYhyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homh
X-ME-Proxy: <xmx:I-VdYBY8BaSNeAjkKWeaW4exJ_MjugggDz1qnO29kCdfLz68zIsc9A>
    <xmx:I-VdYIXFYUfPiYbLwpN79TM4GwhjRMao-I_jchXifepre0X5yw8VAA>
    <xmx:I-VdYPlb9uQ2Apf_l4i16UUjr57ym3olr2HnKAJfhYOLYTV0Q_Yt0Q>
    <xmx:JOVdYNhU_0Dx2eB3jHwWqa8oPnprnFKOEhJBClj7-z0TH4NwSOV6pw>
Date: Fri, 26 Mar 2021 14:43:58 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	=?utf-8?B?RnLDqWTDqXJpYw==?= Pierret <frederic.pierret@qubes-os.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
Message-ID: <YF3lHjYdrILNA1y9@mail-itl>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <e768ad29-55e3-945a-f398-05050b46e927@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HGjM90Qvvu8CYKe4"
Content-Disposition: inline
In-Reply-To: <e768ad29-55e3-945a-f398-05050b46e927@suse.com>


--HGjM90Qvvu8CYKe4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 02:30:09PM +0100, Jan Beulich wrote:
> On 26.03.2021 13:29, Ian Jackson wrote:
> > I wrote:
> >> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
> >> Jan's patch which I have alread release-acked.
> >>
> >> Can someone qualified please provide a maintainer review for this,
> >> ideally today ?
> >=20
> > I asked Andrew on IRC:
> >=20
> > 12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
> >                more-minimal hpet workaround approach ?
> > 12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
> >                   acceptable behaviour, and it is a fairly big "f you"
> >                   (this was literally feedback I got in private) to
> >                   the downstreams who've spent years trying to get us
> >                   to fix this bug, and have now backported the first
> >                   version.
> > 12:16 <andyhhp__> I'm looking into the feedback on my series
> > 12:17 <andyhhp__> one way or another, the moment we enter the fallback
> >                   path for interrupt routing, something is very broken
> >                   on the system
> > 12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
> >                   laptop which can't be tested now, vs 5 years of Atom
> >                   CPUs, 2 years of latop CPUs, and the forthcoming
> >                   Server line of Intel CPUs
> > 12:19 <andyhhp__> or whatever other compromise we can work on
> >=20
> > I'm sorry that this bug is going to continue to be not properly fixed.
>=20
> Actually I had another thought here in the morning, but then didn't
> write it down: While Andrew's approach indeed would (hopefully)
> improve user experience, it'll reduce the incentive of actually
> fixing the issue. Normally I might not be that concerned, but seeing
> how long it took to even arrive at a workaround, I'm afraid now I am
> concerned.

I assume "the issue" you meant "Xen using legacy stuff that stops being
supported by the hardware", right? Yes it is an issue. But for most
users of Xen, having it broken more likely will results in "lets switch
to something that works" (perhaps not after the first such case, but
this is definitely not the first one) instead of "lets spend some hours
on debugging this very low level issue".
And to be honest, this is more and more appealing option, even though
all the deficiencies of KVM...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HGjM90Qvvu8CYKe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBd5R8ACgkQ24/THMrX
1yxsPQf8Cf0d+0ZK0PNOYF/Lhl4ZSBvJYARVJYAAxWLmah75hSgU1L0ULKAjuxAX
sClqzLBOyzZHwJvDBS73jJqKbRDV60svpkpyTmScHsTstvAsr3C/UotnEijONy8x
RaXvN/EnAfezvdspSXnnupgDKiTBEebFyHoxuqH4brTColq0b+NZXJd3EcGgKcno
NqTD2H9Cx19Px2FO4/PFobCBLUxWMg1wCL+zB/reYDEV04EmE/xWf7y7bkJ6B2Rs
H08scvYdjr7008bSIxZAnZBFsnutxXxUrQNEIWE0fKUK1WGMg4m89QvPioseRvWN
07DnExH45WXVCroaMMhOaz7hC2of7A==
=RXRN
-----END PGP SIGNATURE-----

--HGjM90Qvvu8CYKe4--

