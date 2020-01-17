Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E4A141151
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 19:58:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isWnZ-0003Et-II; Fri, 17 Jan 2020 18:56:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EpqW=3G=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1isWnX-0003Ee-Qa
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 18:56:48 +0000
X-Inumbo-ID: 1bbcccee-395b-11ea-b5e4-12813bfff9fa
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bbcccee-395b-11ea-b5e4-12813bfff9fa;
 Fri, 17 Jan 2020 18:56:46 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C79A2654;
 Fri, 17 Jan 2020 13:56:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 17 Jan 2020 13:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZucMv1
 i2IIRph2tvAQJkWDJwlXUYTjtd7gNnnNPIRKY=; b=KD3s8FNRi9c3cKlFJ6fv6T
 MJX5kKaflzl4y/tLA8IY5zX+CQbnKBvXMVA27SEf5mdGDSEFEsLFm+hEKjxMSsc0
 Qk6H38iicobLa+XxmbyPH8v88zyOiDqQGuP0atJhJUX/LSRHNBxXbZ95OF98rV9E
 xwNl9B2jWG/cmqH/1RiMEiN1BZbJjF/vX8DfiApyg5cu7JjceFe1Dashqfxw6MUz
 TnjnsyVvmkzCz7Trr6syL/JHIeLsU2jiVmomHhtH5O4z1G9pNgIu9FvD7bAaoGjW
 tTvq3hHLh/N1yZnDIVkvHd70A2bVDeFdbpkMoN2hY98zLhuG5tF7jHRP++M4wnOA
 ==
X-ME-Sender: <xms:awMiXiXw49s9tekcp9UbRIuiXzmJwcYJ4ay2w2gYxoNeHwNM1WiaVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdekgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bAMiXi1zD4OeVh7c6TrZ0X6OD2wVPG7exABj22RQye53S8U2uPfxYQ>
 <xmx:bAMiXhZlNaTDzB1ZZG204YEqpWOCKCG25p1q6AK981wph8bhAtw0hg>
 <xmx:bAMiXtrX1DYJHjYQaE4Ax49KxyYKNjyIGYGLGOwmIN9I5fR4qPyqZw>
 <xmx:bAMiXtufr7B8YRcPXL3HTFMz1etvHbN2OcHggYebtIs5oOLkz7nruA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9743C8005C;
 Fri, 17 Jan 2020 13:56:42 -0500 (EST)
Date: Fri, 17 Jan 2020 19:56:39 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20200117185639.GA1314@mail-itl>
References: <ce51dd78fd7aa0856d160b2d94c82f68dd4e7056.1579055705.git-series.marmarek@invisiblethingslab.com>
 <887B9537-ABB7-459E-9E99-50AD4DDDBFE2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <887B9537-ABB7-459E-9E99-50AD4DDDBFE2@gmail.com>
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6828184019617562086=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6828184019617562086==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I0oWFe1KborvVxk0"
Content-Disposition: inline


--I0oWFe1KborvVxk0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 11/16] tools: add simple vchan-socket-proxy

On Fri, Jan 17, 2020 at 01:44:20PM -0500, Rich Persaud wrote:
> On Jan 14, 2020, at 21:42, Marek Marczykowski-G=C3=B3recki <marmarek@invi=
siblethingslab.com> wrote:
> > @@ -66,6 +70,7 @@ install: all
> >    $(INSTALL_PROG) libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
> >    ln -sf libxenvchan.so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxenvc=
han.so.$(MAJOR)
> >    ln -sf libxenvchan.so.$(MAJOR) $(DESTDIR)$(libdir)/libxenvchan.so
> > +    $(INSTALL_PROG) vchan-socket-proxy $(DESTDIR)$(bindir)
>=20
> Does this need directory creation, to avoid vchan binary being named "bin=
"?
> +       $(INSTALL_DIR) $(DESTDIR)$(bindir)

I guess it depends on makefile execution order. I'll add it to be on the
safe side.

> > +int main(int argc, char **argv)
> > +{
> > +    int is_server =3D 0;
> > +    int socket_fd;
>=20
> When compiled for OpenEmbedded / OpenXT, gcc complained about socket_fd b=
eing uninitialized before possible use.

I think gcc is wrong here - in all the paths socket_fd is used, it is
initialized under the same conditions (socket_path !=3D "-" and
!is_server). But I'll add initializer to mute this warning.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--I0oWFe1KborvVxk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4iA2cACgkQ24/THMrX
1ywQbwgAkFWtkx6vVQBGbbtJenF7iqpjXIS2mBrHMG2mrVxdl9ehzXBFixObumn6
n6Gn0R1SyieopFcBhgCHb0GgeVupq3eJSSX6Hm3lM1CYav4f4oOpM5jC5dir+gb4
oIF0R6uC9EGTrYmUJSBWv9/0udiHMBd4CfLfirqlaKVnkP1aX1hWud+xlUrzfTG+
f/ZfxjPuYyQVegTNx3QHouCPd2c9C1LWGxf5nnjY2Ca7NNUL6IchoSOfZQRYsZ4l
25HnSM2QAzG9zjIW57+oPkN81Ob3FcE0aFwK/BD8XQHKjtmLTZo/5fm8IR8H70cQ
X4K3xXJMf209WiMeZqOEjH/eO2P6fg==
=GFoJ
-----END PGP SIGNATURE-----

--I0oWFe1KborvVxk0--


--===============6828184019617562086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6828184019617562086==--

