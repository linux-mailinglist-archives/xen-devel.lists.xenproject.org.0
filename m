Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839431D3871
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 19:37:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZHmf-0004YF-Gl; Thu, 14 May 2020 17:36:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dixi=64=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jZHme-0004Y9-9p
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 17:36:36 +0000
X-Inumbo-ID: 74ec59c8-9609-11ea-9887-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74ec59c8-9609-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 17:36:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2601A9FD;
 Thu, 14 May 2020 13:36:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 14 May 2020 13:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h/L3cY
 +LR9flu4KOtrM7e80JgWA33EMrYSaK3tVD9cc=; b=TSgIeyVblBjdQYva1DBg34
 xmJOfElJ8xWF/X9syYymuqEOPDEBuZz06K2wRj4ETa31nCYB5eIDnDYdtQ5LNQ9y
 f9DQ6csWS6apjM6D6YkaiZZ9LbcfFtL4Lf4SQkjgLVeI7plYB5nLvYPywYSaW27B
 rK3g3NuO7I1jbgUDEKIqQC2lxYLjxcgh+c2zoxteul/8jS0IyrnpphPjDuVMSZm3
 B8aDB5vx/kCjnLCjZRNFhtT8W4GT8X3jNQ/x7jC1p7q1nwPVGdw7/ZGcCroOazBq
 aOFQZgXXqggEBCskjIuQzrl8C7ZL7KY7v06KfHlqNbZ44fcpOSt9VIPAt7Z5w6og
 ==
X-ME-Sender: <xms:oYG9Xj6BCz2O2BcgnSgWfG4UC0zJztYMDairCrVDYUSsGB1nT0hUJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:oYG9Xo7XIYWsnh5k14JI8XfQUDikXOm23LELBHNZQO8i05ZT5EI9PQ>
 <xmx:oYG9XqezWukGFQCSZ8fIIAY2beceMLmTi5Ybki8OYM1hHJazVxjQ9g>
 <xmx:oYG9XkL03Y3466O7_UTnWvMv37NhTwfS2JzDt5jlnG5rk8BPdOj6uw>
 <xmx:oYG9Xpz-tUI1UiI1Hk4Fgj6_Q7RJar6D77egH9ixvF2hi3kMQAiVvQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7DDD43060EE4;
 Thu, 14 May 2020 13:36:32 -0400 (EDT)
Date: Thu, 14 May 2020 19:36:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 14/21] libxl: require qemu in dom0 even if stubdomain
 is in use
Message-ID: <20200514173628.GO1178@mail-itl>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-15-jandryuk@gmail.com>
 <24253.29948.624988.194564@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hkJ/XfKuQcNFcQvU"
Content-Disposition: inline
In-Reply-To: <24253.29948.624988.194564@mariner.uk.xensource.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--hkJ/XfKuQcNFcQvU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 14/21] libxl: require qemu in dom0 even if stubdomain
 is in use

On Thu, May 14, 2020 at 05:42:36PM +0100, Ian Jackson wrote:
> Jason Andryuk writes ("[PATCH v5 14/21] libxl: require qemu in dom0 even =
if stubdomain is in use"):
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >=20
> > Until xenconsoled learns how to handle multiple consoles, this is needed
> > for save/restore support (qemu state is transferred over secondary
> > consoles).
> > Additionally, Linux-based stubdomain waits for all the backends to
> > initialize during boot. Lack of some console backends results in
> > stubdomain startup timeout.
> >=20
> > This is a temporary patch until xenconsoled will be improved.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  tools/libxl/libxl_dm.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> > index e420c3fc7b..5e5e7a27b3 100644
> > --- a/tools/libxl/libxl_dm.c
> > +++ b/tools/libxl/libxl_dm.c
> > @@ -2484,7 +2484,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
> >          }
> >      }
> > =20
> > -    need_qemu =3D libxl__need_xenpv_qemu(gc, dm_config);
> > +    /*
> > +     * Until xenconsoled learns how to handle multiple consoles, requi=
re qemu
> > +     * in dom0 to serve consoles for a stubdomain - it require at leas=
t 3 of them.
> > +     */
> > +    need_qemu =3D 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);
>=20
> But I don't think this is true for a trad non-linux stubdm ?
> So I think this ought to be conditional.

For qemu-trad is true too. Stubdomain (mini-os + qemu-trad and linux +
qemu-xen) is always started with at least 3 consoles: log, save,
restore. Which currently requires qemu in dom0. So, yes, technically it
is a bug in the current libxl for qemu-trad. In practice, it works in
most cases because there is something else that triggers qemu in dom0
too: vfb/vkb added if vnc/sdl/spice is enabled.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--hkJ/XfKuQcNFcQvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl69gZsACgkQ24/THMrX
1ywCaAf+IYGXp1Q2zR1Y1HNp+uagnpMDI+i1nSEf25JeokogLCacax1GmBYSvYBd
KXX4gCSQjxk4dW47h0LaRvBUffOlWfSFgj5bRhYGedto7Gdl98+q//SamCVarcVQ
bOrDSB95PZGJQOvL2WRjr3HC4YTaNmZZSomSCDU8S/Si9zDDbo6do7SG5nyqQpjE
fMMfQcP5ZTckUIJ0PoTjx6a3lMgM3X60Kwgtt4FUtV5unGnjTFQLYlhdZyDaRXBj
68SE/AX4WbcJMgVA9qwDHToPT4slZYe951PhvWBYLFmhU7T3C9qAfzNysuJqdFP4
G1D2NQ2/NR8L1VR6JEAuj1o+ZQWM2w==
=/BCD
-----END PGP SIGNATURE-----

--hkJ/XfKuQcNFcQvU--

