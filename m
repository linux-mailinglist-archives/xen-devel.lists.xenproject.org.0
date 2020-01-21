Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6A144819
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 00:14:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu2es-0000IX-9o; Tue, 21 Jan 2020 23:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu2eq-00005r-1e
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 23:10:04 +0000
X-Inumbo-ID: 22aeefc8-3ca3-11ea-8e9a-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22aeefc8-3ca3-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 23:09:55 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B6ABD72E;
 Tue, 21 Jan 2020 18:09:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 18:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eN8oe8
 AG4FuNhLqyqRB0+o5jJrAd3Z0sLGCq+rAC1PM=; b=mKrruS1lQoCIk2rYd9dCjA
 b7y5Uvi4V+SRMqXeA1y6gP6LZP8Yf9uIdUTJWH4BFc14z4Hl1adqkCgqT5sfL/F4
 UrZmvp4W+lt0U98//pP+dEenyRBcFiDzcW4zefkjvUBBWKXxU9Ip0SYy59s+sY5h
 Pfcw+2mfpW4g3G7V7PGazjQhLKw15TC7ohfTwj9xfXNEqtq+1VmF9O5gq7wvA61r
 yn8Ptkoujn0osw9uOX+4DwAuVfdj+Qwvor4U7cAadOpZurWYYSlAaAt3ED0sui4p
 X3wYZiX90PBfEUU9wzFqlINaVoAYoRUqOw8XS/N/iDkST1lgafkKapiq85GOzRaw
 ==
X-ME-Sender: <xms:wYQnXvV1nXShvtvH2e209urk1G7bwTs3rNZbkhTeSc--tSpA0XZBCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrh
 hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wYQnXgObL0rH8YPVL1QyXU0-x_z8P88z3Cr3Zz2cDd9jMchcEMq3qQ>
 <xmx:wYQnXi2FMtMztfUuW-xCnawjAzWStwsiV1R7eqA9ZBxvdic6qvnFUg>
 <xmx:wYQnXkQ9cOuBr4PhqdkX_gtJu1X2OokHCcpmgYjA1QGYCa09ACslZw>
 <xmx:wYQnXuYade-pA1yaSCGkveyoz5PeaaDZnm-cJhFDO8PpkC755jAUYg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B97F33060B2C;
 Tue, 21 Jan 2020 18:09:51 -0500 (EST)
Date: Wed, 22 Jan 2020 00:09:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121230949.GU1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuQ1iggu6Lz8bcAWpGL732bXf3qwO9HYSd+8ScsNN2wnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuQ1iggu6Lz8bcAWpGL732bXf3qwO9HYSd+8ScsNN2wnA@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple
 vchan-socket-proxy
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5710221184305141758=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5710221184305141758==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ddlq+5wZogx8hGrT"
Content-Disposition: inline


--ddlq+5wZogx8hGrT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple vchan-socket-proxy

On Tue, Jan 21, 2020 at 02:43:03PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:42 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Add a simple proxy for tunneling socket connection over vchan. This is
> > based on existing vchan-node* applications, but extended with socket
> > support. vchan-socket-proxy serves both as a client and as a server,
> > depending on parameters. It can be used to transparently communicate
> > with an application in another domian that normally expose UNIX socket
> > interface. Specifically, it's written to communicate with qemu running
> > within stubdom.
> >
> > Server mode listens for vchan connections and when one is opened,
> > connects to a pointed UNIX socket.  Client mode listens on UNIX
> > socket and when someone connects, opens a vchan connection.  Only
> > a single connection at a time is supported.
> >
> > Additionally, socket can be provided as a number - in which case it's
> > interpreted as already open FD (in case of UNIX listening socket -
> > listen() needs to be already called). Or "-" meaning stdin/stdout - in
> > which case it is reduced to vchan-node2 functionality.
> >
> > Example usage:
> >
> > 1. (in dom0) vchan-socket-proxy --mode=3Dclient <DOMID>
> >     /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
> >
> > 2. (in DOMID) vchan-socket-proxy --mode=3Dserver 0
> >    /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
> >
> > This will listen on /run/qemu.(DOMID) in dom0 and whenever connection is
> > made, it will connect to DOMID, where server process will connect to
> > /run/qemu.(DOMID) there. When client disconnects, vchan connection is
> > terminated and server vchan-socket-proxy process also disconnects from
> > qemu.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
>=20
> Looks good.  A few typos and string updates below.

Thanks, adjusted.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ddlq+5wZogx8hGrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4nhL0ACgkQ24/THMrX
1ywiugf7B0bQSZ8/EDGezKF/pYUC5Mglx+pyUkVPs5ZKeCkaq3fa7nKLqVh4i9uv
AnCDqqyDQ3HAZXFA2CsXp9OqTCoupO/DgZ5YPeFr3pZbDGcS2T+lJ+iGBxwVwQ9W
IAONBUr7/HvGC42vFAvtfqDDpDlnV6CsTHoJ27MFdu96TQ0UMoKHiys9WDcZ4Wdh
xJ96oxK8WSEqhrfP6sxKhE6w4TeEXLDSa8SHOXW8bWidye652LXpUeoXrZ+fVwXu
RvG9bo6DH/AIHbILP3qoQf5TN3jxVrjy9XPmJROAHF23kb/32981UeEMRjNa8hFE
mcyal4zpKpSJ8SXZXuIX6j2APE/a5Q==
=3jhe
-----END PGP SIGNATURE-----

--ddlq+5wZogx8hGrT--


--===============5710221184305141758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5710221184305141758==--

