Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229518603B
	for <lists+xen-devel@lfdr.de>; Sun, 15 Mar 2020 23:25:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDbcY-0006WI-1O; Sun, 15 Mar 2020 22:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGW5=5A=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jDbcW-0006WC-Ok
 for xen-devel@lists.xenproject.org; Sun, 15 Mar 2020 22:20:33 +0000
X-Inumbo-ID: 2e246efe-670b-11ea-b729-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e246efe-670b-11ea-b729-12813bfff9fa;
 Sun, 15 Mar 2020 22:20:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A43B164F;
 Sun, 15 Mar 2020 18:20:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 15 Mar 2020 18:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZRoelc
 lF6ms2vYTCuzVXdHdRRUxot/ILWyA8sg1/EOo=; b=dBUQJG+BYW3F8rL2vuwCcn
 ZAzacM9fQTyPmL0YemI0+tnZvPEi5Ki+qfvYzKZGOxcUpTaqM+aYLEcl4lXchYyF
 UkGeX8///ocF1lIacf76a0H4Vkq15YQjpEzO7oQN7ZAedgI6DEcE4arKRSwcHfib
 3fmATHOunMEZELKwRS1cM7a64fjqPvbl+DkVnBPBEgHlt0KHXsYG+SzZchkstJIO
 JGJ5fqwwor0CBpaoPT4JbE0umFWeMNqE7Wf1o9QiPqu+W4m9Ddo4F82491/7Ctkq
 /1iDWOv7/mBZ86e4kqDS584bxAUSy8QQAdFGlE0u3pSJNIGtKBviv9XTkJIimcnw
 ==
X-ME-Sender: <xms:LKpuXnipEenhYK9ySi1PyN4WU4StOe8hvJpPNfGmoSEyZQctKGhZKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LKpuXv-2q67jwm65Z-7HEoX1SXaYUCwN0On8cCjxiYcko54iwz9a-Q>
 <xmx:LKpuXtOgez2HkwylJyqKGqElQzLAICV2S9RizzcEcC4-J6ryBE929Q>
 <xmx:LKpuXqrkSp935yL6hHDOWNfbsFfv1uYdXS0ZlNWbfGTN7itQ5KxmIA>
 <xmx:LapuXuMZfpRlquGN4fMzxYwlC1i3HrQmF7iWAyqhNBq4l0Gsz7qfGw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3157F3061856;
 Sun, 15 Mar 2020 18:20:28 -0400 (EDT)
Date: Sun, 15 Mar 2020 23:20:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200315222023.GI2995@mail-itl>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
 <24083.21734.512820.514082@mariner.uk.xensource.com>
 <20200106160340.GL1314@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200106160340.GL1314@mail-itl>
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7963548821861028259=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7963548821861028259==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F4+N/OgRSdC8YnqX"
Content-Disposition: inline


--F4+N/OgRSdC8YnqX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains

On Mon, Jan 06, 2020 at 05:03:40PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Jan 06, 2020 at 03:40:22PM +0000, Ian Jackson wrote:
> > Adding Roger to the CC.
> >=20
> > Marek Marczykowski-G=C3=B3recki writes ("Re: [PATCH] libxl: create back=
end/ xenstore dir for driver domains"):
> > > On Mon, Jan 06, 2020 at 02:20:46PM +0000, Ian Jackson wrote:
> > > > Marek Marczykowski-G=C3=B3recki writes ("[PATCH] libxl: create back=
end/ xenstore dir for driver domains"):
> > > > > Cleaning up backend xenstore entries is a responsibility of the b=
ackend.
> > > > > When backend lives outside of dom0, the domain needs proper permi=
ssions
> > > > > to do it. Normally it is given permission to remove the device dir
> > > > > itself, but not the dir containing it (named after frontend ID). =
After a
> > > > > whole those empty leftover directories accumulate to the point xe=
nstore
> > > > > returning E2BIG on listing them.
> > > > >=20
> > > > > Fix this by giving backend domain write access also to backend/
> > > > > directory itself when c_info->driver_domain option is set. The co=
de
> > > > > removing relevant dir is already there (just lacked permissions t=
o do so).
> > > > >=20
> > > > > Note this also allows the backend domain to create new entries,
> > > > > pretending to host backend devices it don't have. But since libxl=
 uses
> > > > > /libxl/ xenstore dir for this information (still outside of backe=
nd
> > > > > domain control), this shouldn't be an issue.
> > > >=20
> > > > This seems quite hazardous to me.  The reasoning you use to show th=
at
> > > > this iws OK seems fragile, and in general it doesn't feel right to
> > > > give the particular backend such wide scope.
> > > >=20
> > > > Can we find another way to address this problem ?  I think the
> > > > containing directory should be removed by the toolstack.  Why is th=
is
> > > > difficult ?  (I presume there is a reason or you would have done it
> > > > that way...)
> > >=20
> > > It was done this way previously and caused issues, see this commit:
> > >=20
> > > commit 546678c6a60f64fb186640460dfa69a837c8fba5
> > > Author: Roger Pau Monne <roger.pau@citrix.com>
> > > Date:   Wed Sep 23 12:06:56 2015 +0200
> > >=20
> > >     libxl: fix the cleanup of the backend path when using driver doma=
ins
> >=20
> > Thanks.
> >=20
> > >     With the current libxl implementation the control domain will
> > >     remove both the frontend and the backend xenstore paths of a
> > >     device that's handled by a driver domain. This is incorrect,
> > >     since the driver domain possibly needs to access the backend
> > >     path in order to perform the disconnection and cleanup of the
> > >     device.
> > >    =20
> > >     Fix this by making sure the control domain only cleans the
> > >     frontend path, leaving the backend path to be cleaned by the
> > >     driver domain. Note that if the device is not handled by a
> > >     driver domain the control domain will perform the removal of
> > >     both the frontend and the backend paths.
> >=20
> > Hmm.  I see my Ack on that.  Nevertheless maybe it is wrong.
> >=20
> > Looking at it afresh, I think maybe the right answer is:
> >=20
> >  * If the driver domain is expected to be working properly, the
> >    toolstack should wait for the driver domain to complete the device
> >    shutdown, before removing the backend node.  Indeed, the toolstack
> >    ought to wait for this before actually destroying the guest in Xen,
> >    by the usual logic for clean domain shutdown.
>=20
> I think that's not enough. .../state =3D 6 is set by the kernel, but
> xl devd in the driver domain may want to cleanup things (hotplug scripts
> etc). And indeed libxl__device_destroy() is called from
> device_hotplug_done(), not device_backend_callback().
>=20
> Alternatively, toolstack could wait for the actual backend node to be
> removed (by the driver domain), and then cleanup the parent directory (if
> empty). I don't find it particularly appealing, as every contact with
> libxl async code reduce overall happiness...
>=20
> >  * There needs to be a way to deal with a broken/unresponsive driver
> >    domain.  That will involve not waiting for the backend so must
> >    involve simply deleting the backend from xenstore.
>=20
> It's already there: if driver domain fails to set .../state =3D 6 within
> a timeout, toolstack will forcibly remove the entry.
>=20
> > Is the distinction here between "xl shutdown" and "xl destroy", on the
> > actual guest domain, good enough ?  Hopefully if the driver domain
> > sees the backend directory simply vanish it can destructively tear
> > everything down ?
>=20
> In the past this lead to multiple issues, where hotplug script didn't
> know which device actually was removed. In some cases I needed to
> workaround this by saving xenstore dump into a file in an "online"
> hotplug script, but it is very ugly solution.

Any opinion on the above?
In the above context (plus the fact that the toolstack use /libxl to
enumerate devices), I still think giving driver domain write access to
the backend/ node is the right solution for this problem.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--F4+N/OgRSdC8YnqX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5uqigACgkQ24/THMrX
1yxuAAgAj6ayxhtaL+/ycGdFT+9I9RNtAjwss8oXL27qLJ4ARPXivU3AADtcSx5H
cA78pGEAJNSBfB71fhl9WsaW/oA6u5dO8wzxY1ORn2/kwZZQeatWPd/sm3xoJHg+
lL+Fy9berHiFysZUM+bIAowSLBNymO7y3ORUdKoS3enCmeZt3mZMmDDQoKR+4Wa8
7anIlnZlP5z5wobGP7Rw5pBuk0KG3TIo833F7lUI8Wc3ja9aU7HrDMD5HLiZQ9Fp
U7mCAyhjds/Bsk3kJpvgTKLeaYYXdGZeu3OL9DWXRscuwkxAGohHfcXEt2OL4ywR
oPOf9qYw3XHcPfPpRaM4YNqXPQPsIg==
=nOVW
-----END PGP SIGNATURE-----

--F4+N/OgRSdC8YnqX--


--===============7963548821861028259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7963548821861028259==--

