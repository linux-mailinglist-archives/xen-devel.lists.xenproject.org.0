Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89301903B0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 03:49:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGZZT-0004Pw-Hs; Tue, 24 Mar 2020 02:45:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pGbC=5J=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jGZZR-0004Pq-Vd
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 02:45:38 +0000
X-Inumbo-ID: 8a598fbe-6d79-11ea-bec1-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a598fbe-6d79-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 02:45:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id ECD71813;
 Mon, 23 Mar 2020 22:45:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 23 Mar 2020 22:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=saO0od
 oJYtK+WI3j7Pp0c71lYH8T9W/DhOhYkYoYh54=; b=a/8cyI1msjpODsnAAeLoJ5
 asylqUFEukNglp3uUf7QHItnh77kj3hipOGAk/sSga0HLunYsisE1KMq+m258Zga
 VUiHV5Bjn7+DchgzAXncgXTnk2NMwSpmiP54/7l3gow9TDOW7rgAC9+ueI6Nj5UR
 iK4aytbHy3sJzF+ePFymn64a6yMIMqwyOlp8t6tqN7hZkB15tKHjTk6wkUNYo2zK
 DX9LP/oT7CKGlcu1+UZjPXndYNXjRyIuDPaobGOZShtRkTyLuw1NMWa/MINhY3q1
 v+28t8al0fi8SqnR+GlOUFBFApBAjIfRSmEndbWgDnRa9fClRLf5HFkIRtFjuXEQ
 ==
X-ME-Sender: <xms:T3R5XvCX9ieHQOebX0nys4dtpiOsROCugkFjI5z39h3K7ghRyqG2Dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegledggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:T3R5XpxG5WLXrOMnASXbIZ7d0PG69-RB7NOG6bPsrYufwe3XUwXclg>
 <xmx:T3R5XlklijqFZAIwQWcHiyPZCx4HUYT_uunk35H3CoHNePeJVCqy_w>
 <xmx:T3R5XmHmarWcIaMRDUMzAdeEdLqxkvauh64XKwnHoaUTRGIRYrLehQ>
 <xmx:T3R5XjRJho0cabRXq392p9xumkFRQ3At7Ns4ThG5e5TcU2GRbXb85A>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53A0B30618C1;
 Mon, 23 Mar 2020 22:45:34 -0400 (EDT)
Date: Tue, 24 Mar 2020 03:45:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200324024530.GJ2995@mail-itl>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
 <24083.21734.512820.514082@mariner.uk.xensource.com>
 <20200106160340.GL1314@mail-itl>
 <20200323153512.GE24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1y1tiN5hVw5cPBDe"
Content-Disposition: inline
In-Reply-To: <20200323153512.GE24458@Air-de-Roger.citrite.net>
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
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--1y1tiN5hVw5cPBDe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] libxl: create backend/ xenstore dir for driver domains

On Mon, Mar 23, 2020 at 04:35:12PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jan 06, 2020 at 05:03:40PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Alternatively, toolstack could wait for the actual backend node to be
> > removed (by the driver domain), and then cleanup the parent directory (=
if
> > empty).
>=20
> I'm not sure you need to cleanup the parent directory,=20

You do, that's why this is an issue. Otherwise empty directories will
accumulate there, leading to various issues (inability to list, running
out of watches for monitoring them etc).

Example state:

/local/domain/5/backend =3D ""
/local/domain/5/backend/vif =3D ""
/local/domain/5/backend/vif/6 =3D ""
/local/domain/5/backend/vif/7 =3D ""
/local/domain/5/backend/vif/7/0 =3D ""
/local/domain/5/backend/vif/7/0/frontend =3D "/local/domain/7/device/vif/0"
/local/domain/5/backend/vif/7/0/frontend-id =3D "7"
/local/domain/5/backend/vif/7/0/online =3D "1"
/local/domain/5/backend/vif/7/0/state =3D "4"
/local/domain/5/backend/vif/7/0/script =3D "/etc/xen/scripts/vif-route-qube=
s"
/local/domain/5/backend/vif/7/0/mac =3D "00:16:3e:5e:6c:00"
/local/domain/5/backend/vif/7/0/ip =3D "10.137.0.49 fd09:24ef:4179::a89:31"
/local/domain/5/backend/vif/7/0/bridge =3D "xenbr0"
/local/domain/5/backend/vif/7/0/handle =3D "0"
/local/domain/5/backend/vif/7/0/type =3D "vif"
/local/domain/5/backend/vif/7/0/feature-sg =3D "1"
/local/domain/5/backend/vif/7/0/feature-gso-tcpv4 =3D "1"
/local/domain/5/backend/vif/7/0/feature-gso-tcpv6 =3D "1"
/local/domain/5/backend/vif/7/0/feature-ipv6-csum-offload =3D "1"
/local/domain/5/backend/vif/7/0/feature-rx-copy =3D "1"
/local/domain/5/backend/vif/7/0/feature-rx-flip =3D "0"
/local/domain/5/backend/vif/7/0/feature-multicast-control =3D "1"
/local/domain/5/backend/vif/7/0/feature-dynamic-multicast-control =3D "1"
/local/domain/5/backend/vif/7/0/feature-split-event-channels =3D "1"
/local/domain/5/backend/vif/7/0/multi-queue-max-queues =3D "2"
/local/domain/5/backend/vif/7/0/feature-ctrl-ring =3D "1"
/local/domain/5/backend/vif/7/0/hotplug-status =3D "connected"
/local/domain/5/backend/vif/8 =3D ""
/local/domain/5/backend/vif/11 =3D ""
/local/domain/5/backend/vif/12 =3D ""
/local/domain/5/backend/vif/17 =3D ""
/local/domain/5/backend/vif/20 =3D ""
/local/domain/5/backend/vif/23 =3D ""
/local/domain/5/backend/vif/26 =3D ""
/local/domain/5/backend/vif/28 =3D ""
/local/domain/5/backend/vif/29 =3D ""
/local/domain/5/backend/vif/30 =3D ""
/local/domain/5/backend/vif/33 =3D ""
/local/domain/5/backend/vif/34 =3D ""
(...)
/local/domain/5/backend/vif/416 =3D ""

> albeit it
> wouldn't hurt. It needs to be done in a transaction though, so that
> you don't race with new additions to it.

Good point.

> > I don't find it particularly appealing, as every contact with
> > libxl async code reduce overall happiness...
> >=20
> > >  * There needs to be a way to deal with a broken/unresponsive driver
> > >    domain.  That will involve not waiting for the backend so must
> > >    involve simply deleting the backend from xenstore.
> >=20
> > It's already there: if driver domain fails to set .../state =3D 6 within
> > a timeout, toolstack will forcibly remove the entry.
>=20
> Would it work to change this and instead of monitor .../state =3D 6
> monitor that the parent directory still exist?

That could be a good idea, to avoid introducing yet another (set of)
callback. I'll look into it, it may require different handling of
dom0/non-dom0 backend.

> > > Is the distinction here between "xl shutdown" and "xl destroy", on the
> > > actual guest domain, good enough ?  Hopefully if the driver domain
> > > sees the backend directory simply vanish it can destructively tear
> > > everything down ?
> >=20
> > In the past this lead to multiple issues, where hotplug script didn't
> > know which device actually was removed. In some cases I needed to
> > workaround this by saving xenstore dump into a file in an "online"
> > hotplug script, but it is very ugly solution.
>=20
> Removing the whole directory without giving time to the driver domain
> to execute it's hotplug scripts can indeed lead to issues, as there's
> no guarantee that the hotplug script won't use data in xenstore in
> order to perform the cleanup IIRC.

Yes, that's what 546678c6a60f64fb186640460dfa69a837c8fba5 fixed, but not
removing it too early.

> My preferred option would be to wait for the backend directory to be
> removed by the driver domain, as I think it's the cleanest and likely
> safest approach.
>=20
> Thanks, Roger.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--1y1tiN5hVw5cPBDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl55dEgACgkQ24/THMrX
1yxo2Af/YGXNilWASmJ/wVSUUvSDIxFoYZQbCudpolYmhA9LfheAO3bj1JHXAiBB
21ZrkPz0RdK3HJXe7mXTdRJgjvQcUgXG2uzl2xMK/qjMlxURWRSoxlePuSmHT+IO
H/kqZPVZB1jkvp1oQL/8Ai38sXXAsIXp8LFwnbBWdeXJs5gDzRcxtNVNL9U+PcKj
fsQBDydizaX2qCf0+e+KST/+IwYqWJIrxK2KuaPm89jhrSy7UXfNNkjH9E+f7fXL
oPQpy1tVk9ujZYGosfb0XgKSeWCvbj3jPnZ0iF9TGeHZvLPCGztv3WGkqHhDleb3
HIkcQubK8fetpwdepbzWkKNCJmC1qA==
=gEQR
-----END PGP SIGNATURE-----

--1y1tiN5hVw5cPBDe--

