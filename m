Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62521144661
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:24:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0yl-0008AN-Q6; Tue, 21 Jan 2020 21:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0yk-0008A9-1j
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:22:30 +0000
X-Inumbo-ID: 1c0787e8-3c94-11ea-9fd7-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c0787e8-3c94-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 21:22:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 760AB5CA;
 Tue, 21 Jan 2020 16:22:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RowCEc
 bdirqhZesma8xYPevIuNYBL8mPnFdzssDu7xw=; b=PWgQrLVQTg8xE9S6LC2Lt7
 DCGJmoSf3Jzx3L+FhCsJVcJhbbkbvdsGpBsZMvAmRvmNR9KiOFsK0+pUGOEzZxK0
 rAQ4QWONlK4ncM4N5OpI720h+zv7g5W5nvaP47Pu8taOqjWi39NdnzYT4sz2Zxfz
 Qv/pHxZzTEulQzhm3sMksgCX5iNLJNBxid8SMkCp/nSLjZTTgOqexhtZQ2RNYjG6
 uGm/fbtZr4EQjJ25T7rNMC5ihGbsXUEUKvBHjeNpDaK6Ja0nVtm/iqb8CVJIxNDV
 2jBezmHu+4lo+8Dhm0Nfs73fVDPPr7bZbPcl/qwIcRrZ4FNjiKLcipONWGQRijUQ
 ==
X-ME-Sender: <xms:jGsnXtrEuwSdYUSl0j1c3dtR2YpOWV6-AiMQUvt0Mw6ZRNB_cEAY-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepphhougdrihhn
 necukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
 ghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jGsnXpD4LA1QUmjGHpw7Lc2H-OyAEQyDJlBbKvG6ju0X9u0FsjZWfw>
 <xmx:jGsnXitzNthu65pexmpJW34m0fdQeAidVSM4gsPaCLrd7HKwTABTlg>
 <xmx:jGsnXoYphKyuRnP65Eurvaa5_FNlPPj2uTH0g8Gofb6tEWFlNw9nqA>
 <xmx:jGsnXh78fKR-Br74yCTojBhf-dEOb2BTYjktpNe0aec9wLfk9hLPHg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E3C23280062;
 Tue, 21 Jan 2020 16:22:19 -0500 (EST)
Date: Tue, 21 Jan 2020 22:22:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121212215.GS1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <25fe2a1f9840ac0e6ca962b218013da0d1a46982.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpvf3syzz2ck1fWbmK_1xrL8LD3=bqO9SWeb6L44hhueJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvf3syzz2ck1fWbmK_1xrL8LD3=bqO9SWeb6L44hhueJg@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 07/16] xl: add stubdomain related options
 to xl config parser
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
Content-Type: multipart/mixed; boundary="===============4194549528317904726=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4194549528317904726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="08WHHcMLi9slgnFE"
Content-Disposition: inline


--08WHHcMLi9slgnFE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 07/16] xl: add stubdomain related options to xl config
 parser

On Mon, Jan 20, 2020 at 02:41:07PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:40 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  docs/man/xl.cfg.5.pod.in | 23 +++++++++++++++++++----
> >  tools/xl/xl_parse.c      |  7 +++++++
> >  2 files changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 245d3f9..6ae0bd0 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -2720,10 +2720,25 @@ model which they were installed with.
> >
> Also:
>=20
> +=3Ditem B<stubdomain_memory=3DMBYTES>
> +
> +Start the stubdomain with MBYTES megabytes of RAM.

Added, together with default value.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--08WHHcMLi9slgnFE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4na4cACgkQ24/THMrX
1yyL4ggAmJWyFVbwAsVdoRibLitz1K2O6aUM9vVHMrU5joS8hzaFluUVFAF2Mkf8
uRmw9SkARKhztSkPJC0cHhQ4YZhVbdbS3kzrkNU00uxrZ1ndLo69Jr6A0tgzHG33
Gx+LAyLy5coMg4N9xPlfjzswXw36CTbmqXZOqz3sMX0YDad/D/jXq5l0LItbnU1i
i45xkdO42GznMhq2a9mKWOM5wSx690kLD3AKwb4kWFvPlokn6iK2G9EuP3Q2bGAZ
mgLWImxYPHdrmJ2xSdGpFch76isyiyzNNTGJEBbdIEYWMtrl4syKgsiFTxm/ytTc
yJtFl9Bd7tBip80GEgLTeGbEHTeZWQ==
=Ml5v
-----END PGP SIGNATURE-----

--08WHHcMLi9slgnFE--


--===============4194549528317904726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4194549528317904726==--

