Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BA144676
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:31:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu14e-0008Ny-Hm; Tue, 21 Jan 2020 21:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu14d-0008Nt-5T
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:28:35 +0000
X-Inumbo-ID: fa40e5b8-3c94-11ea-bb7e-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa40e5b8-3c94-11ea-bb7e-12813bfff9fa;
 Tue, 21 Jan 2020 21:28:34 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 43A83337;
 Tue, 21 Jan 2020 16:28:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vci8tn
 9D5vu9DnJMCUSFEAbsTABzoBAeZUihAzn8bmU=; b=IV2sejlfOl77ruv8bWINw/
 0vo9/5Ar3fg9y3CJff1NOEgeu5aMFOAkZ9r6pET/hvaoHPP0NrILEb46yU4C1L9+
 qrG2xWQWIYySUgCF+bVAkiLXnIXOSwLX7bT4ZbO/vkAYXat0cFwX0qUFJnTyVAar
 SSRBWyKAs7jBgHexgwRpNk0vbFDlrpTZwVc0TfkzIRwj4g8VYk8W4KlqnebkX6iT
 sRlGszd1fiJ0+UPaGtBaqSYnXks/QdK2cp/fLtH6Qf2t2sPVNFOPwdwtK2qWcsYJ
 7RdGIYqLWSDU3iudzJx59PkDZMijNkFd/oTWB0+iy7fwAyDjQm7uI711X05OMKaw
 ==
X-ME-Sender: <xms:AG0nXho2I_iKd8uiN3tu9v9EMnG1MGvjN-75tj2roqpoU5WI7R606A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:AG0nXkEs_tCQGBnRRyDqlCnNqGAc4iGC2zopFd5XTap5c6AZDpk5aA>
 <xmx:AG0nXjqBpVb5G5LEvhiJvT6MJYkfY3jpiapFpYrtE2j66Nky8O7XnA>
 <xmx:AG0nXq14QhpTnOjzpUfOx8geVOc0MdwAGDpXF2WKZ0juf0_Zv_GdLA>
 <xmx:AG0nXtzxkEQqxJlWPMxYiE14h3Xrc26pNZk7lFBUM_Q0PAtLVLV_sw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 030B43060840;
 Tue, 21 Jan 2020 16:28:31 -0500 (EST)
Date: Tue, 21 Jan 2020 22:28:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121212828.GT1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <047e5ff567ac0c2e0bd92fd8741c03d07b548ab5.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpsu2yvtEaQoweWxkR3G3zUM+1Edkoxh4-6MQyXYMKniqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpsu2yvtEaQoweWxkR3G3zUM+1Edkoxh4-6MQyXYMKniqw@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 08/16] tools/libvchan: notify server when
 client is connected
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============6041013441717105773=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6041013441717105773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bE5y7bXmg3Z2om3p"
Content-Disposition: inline


--bE5y7bXmg3Z2om3p
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 08/16] tools/libvchan: notify server when
 client is connected

On Mon, Jan 20, 2020 at 02:44:58PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:42 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Let the server know when the client is connected. Otherwise server will
> > notice only when client send some data.
> > This change does not break existing clients, as libvchan user should
> > handle spurious notifications anyway (for example acknowledge of remote
> > side reading the data).
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > I had this patch in Qubes for a long time and totally forgot it wasn't
> > upstream thing...
> > ---
> >  tools/libvchan/init.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/tools/libvchan/init.c b/tools/libvchan/init.c
> > index 180833d..50a64c1 100644
> > --- a/tools/libvchan/init.c
> > +++ b/tools/libvchan/init.c
> > @@ -447,6 +447,9 @@ struct libxenvchan *libxenvchan_client_init(struct =
xentoollog_logger *logger,
> >         ctrl->ring->cli_live =3D 1;
> >         ctrl->ring->srv_notify =3D VCHAN_NOTIFY_WRITE;
> >
> > +    /* wake up the server */
> > +    xenevtchn_notify(ctrl->event, ctrl->event_port);
>=20
> Looks like you used 4 spaces, but the upstream file uses hard tabs.

Indeed. CODING_STYLE says spaces, but it also says some tools/* are not
directly covered by this file. Should I use this occasion to convert
tools/libvchan/* to spaces (in a separate patch), or keep tabs (and
adjust my patch)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bE5y7bXmg3Z2om3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4nbPwACgkQ24/THMrX
1ywEowf/V8WmFniFjwlGXO3PHoke10ZCYcIZOycXwsu4G/8tjtDFAYQMdQ+G8Jlg
73yC+nZbrHsAHAD4ITXqfRv2caRzEF7eS3bDvDr5JNYqxArRfT1f+alfO+j5+wnm
ei/NebKrXalLC+9SdwHLg70kH/boGTBHVVySNTl3IF4Hiqc7sIVVh00CJUr+Rmrn
vGVHrW5ueFrWn1QW5rtMipRcSZZzzgm1HNDlCgNqOZ7tuyGwSvzw2hvGRyf7dssy
BESBb5t3yEx3aZdc+N/skAflzOEoY6mWrgQLNQDYvJ4eCCVRsPHQXfvW1i8gzHTq
1VUWP6b5oZAFLX535f+PZTUMcg4g3w==
=oisx
-----END PGP SIGNATURE-----

--bE5y7bXmg3Z2om3p--


--===============6041013441717105773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6041013441717105773==--

