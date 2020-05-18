Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087201D7BD4
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:50:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jah6C-0000Wu-KS; Mon, 18 May 2020 14:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T93z=7A=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jah6A-0000Wh-Pk
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:50:35 +0000
X-Inumbo-ID: ed1ea68e-9916-11ea-a86f-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed1ea68e-9916-11ea-a86f-12813bfff9fa;
 Mon, 18 May 2020 14:50:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 936CE95A;
 Mon, 18 May 2020 10:50:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 18 May 2020 10:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jPAjWK
 c5sSWWWN18xk/Zk61bphWCWHeGH9TSk3WjyZI=; b=vWW4pQUFfO+y+lmz6hAOpT
 KnxFB2g3AlR/UbWqVdXULUV2ByAul76h+wWlaPhS1fJQ+/T2F3XEMO1E4Ze4LCpu
 lFzbPckX+vdRRbUXIEZqtYzoBavF0uISZET4wFywvYPKAGGD7wtxfCy69D5K0A6X
 bQejPinyWO/AjbQHzA04x9q3bPQFjRrVrkC9RIo7weDF1jAHkTUvh+H+MifzX+3m
 J6MQ2XpquRR3P/KuRXNBSduA406QSsr5tH6+6TDynmhQi/lbAuqKqpl7mQe9VxXW
 9EJVkRkKtjW5m9wII0OtnpzQOuT82n6jOip5qQCoKhJHBzozhO1hsVZ+rf57nUKg
 ==
X-ME-Sender: <xms:uKDCXq7scS0mINLatJuoZw_DXM9_dY1bQRuaqLFqVHp8Wza3335ftA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:uKDCXj42hBAYfH2UeLyJloUpjEV8C6nPEA8HavwEVu45om3qU4Rb5g>
 <xmx:uKDCXpckj43rkgJ7mNqBy8p2Lmvg1cJJDsdmOw70fwJM5yA3qZI41Q>
 <xmx:uKDCXnKq6dJc_R-JrSQTMHFkstXYNPRlzl6sFTo9yyT3o-kbkKKrcw>
 <xmx:uKDCXoydTWIhOsiy47_8FLaTEFiF-EuxpmWF5LgApVgygNXQG7RsNw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E56930663ED;
 Mon, 18 May 2020 10:50:31 -0400 (EDT)
Date: Mon, 18 May 2020 16:50:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain
Message-ID: <20200518145028.GD98582@mail-itl>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
 <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
 <24258.39029.788968.419649@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <24258.39029.788968.419649@mariner.uk.xensource.com>
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


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain

On Mon, May 18, 2020 at 03:15:17PM +0100, Ian Jackson wrote:
> Jason Andryuk writes ("Re: [PATCH v5 09/21] libxl: add save/restore suppo=
rt for qemu-xen in stubdomain"):
> > On Thu, May 14, 2020 at 12:35 PM Ian Jackson <ian.jackson@citrix.com> w=
rote:
> > > It's not stated anywhere here that I can see but I think what is
> > > happening here is that your wrapper script knows the qemu savefile
> > > pathname and reads it directly.  Maybbe a comment would be
> > > worthwhile ?
> >=20
> > The existing comment "Linux stubdomain connects specific FD to
> > STUBDOM_CONSOLE_RESTORE" is trying to state that.
> > STUBDOM_CONSOLE_RESTORE is defined as 2 for console 2 (/dev/hvc2), but
> > it is only a libxl_internal.h define.
>=20
> Err, by "the qemu savefile pathname" I meant the pathname in dom0.
> I assume your wrapper script opens that and feeds it to the console.
> Is that right ?

Not really a wrapper script. On dom0 side it is console backend (qemu)
instructed to connect the console to a file, instead of pty. I have
implemented similar feature in my xenconsoled patch series sent a while
ago (sent along with v2 of this series), but that series needs some more
love.

On the stubdomain side, it is a script that launches qemu - opens a
/dev/hvc2, then pass the FD to qemu via -incoming option (which is
really constructed by libxl).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7CoLMACgkQ24/THMrX
1ywd0gf/YbknnStZlnqO5hAce/czX5KBww8Jk4yDPQzLnxxMfzudLDUz//MPW38x
pXxG53WO2Iho42ebTWk5Rn5Q76ManDgUK47HzRDAW9ZSDgw2NKgB1w7p4Jm/XRVK
KoXRUta27/pVZu3nN6s9GEcfzJqzk9tKbJ2zXeBNuLjZ4PQPPV0t/1lHeiOTT3pa
nX7KlloJOl6GfhPgx9bSnLFnL25UA2lf3XXXc/ql27ob3Bar89kf/iUN3F2VvIp6
TP+oI81PwJG042EVVSmCye/N0KsgAnDzpJUFl0fDKP/KQFuS5qDuhPkcQr//Q9dH
7bJg6JX++PEoMvZEtfYW48BIVF3PKQ==
=oGCI
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

