Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28342D113E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:00:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46498.82513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmG7k-0002Vt-IM; Mon, 07 Dec 2020 13:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46498.82513; Mon, 07 Dec 2020 13:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmG7k-0002VU-FA; Mon, 07 Dec 2020 13:00:16 +0000
Received: by outflank-mailman (input) for mailman id 46498;
 Mon, 07 Dec 2020 13:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJBf=FL=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kmG7i-0002VP-NV
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:00:15 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 094fb9b1-0635-4a57-ac0c-20852b50e314;
 Mon, 07 Dec 2020 13:00:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0FFF8E91;
 Mon,  7 Dec 2020 08:00:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Dec 2020 08:00:12 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 45DE01080057;
 Mon,  7 Dec 2020 08:00:09 -0500 (EST)
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
X-Inumbo-ID: 094fb9b1-0635-4a57-ac0c-20852b50e314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PR9uLY
	7bMTXb3ccEUWjKah2caVoXSIMVfxwaCLvgNBE=; b=Dp3qhOp8E8VI1eDEaGBn2P
	0bmQe+ei+wquG+5rF25NZ2wLqEeTxBQUC/O5SpPyPycEb86TdfJPGufeqIu/zFzp
	tSi934lnHI/jfZg2jVgVt/LFdwSXEPLwbrVVULh2COQlnB8bIbJ6z8x8bpJ53m/X
	w4wwIDcAIILYqC+sWG0dJDtOv72NHnLnPHO3M8XEkEqw59bGe6g+qsiu5GIbSZnQ
	yxGr1h5QkmXcuelqEjZPVkTwgAwQ/JzwgWWCN1dHzaGN4ul9Y6UayzyPqrAJIOsA
	BtHk2BUWfttB8lq/oFONiBU/IHm0KnUjhggeoYHjy51/pDor+v8gJnvH0WXR9i9g
	==
X-ME-Sender: <xms:WifOXypM9_2YDi1EacapM8qALGbTEEgo-ZXGAX_-pLjU5ZLPyBeHcQ>
    <xme:WifOX9nn_YZKCC3BkHiCH7YEPlG_1yCe7YKl6-LhrVjyPu-LZcIcO86UpyuzMeF6a
    RmocR4N3VnDKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:WifOXy3LXfdYwi_ZVz7D9Gt7DJF2RaCYQHtQdFa7HrBnxbQHra8eng>
    <xmx:WifOX6R-NBPC_jIS9eEfXz0BZASSVT6H03dNWw5wkNxNioat3liiLQ>
    <xmx:WifOX7xBCS_56QHqiAgk3BEp-2gGEuYdltM3tCwzu7J-p5uHDt0YYA>
    <xmx:WyfOX-8NTQfrDfHgAaHM44yN-_X7_bB9PMdIK-jlBwyWqIHrShR9Gw>
Date: Mon, 7 Dec 2020 14:00:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Christoph Hellwig <hch@lst.de>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9
Message-ID: <20201207130004.GG1244@mail-itl>
References: <20201130164010.GA23494@redsun51.ssa.fujisawa.hgst.com>
 <20201202000642.GJ201140@mail-itl>
 <20201204110847.GU201140@mail-itl>
 <20201204120803.GA20727@lst.de>
 <20201204122054.GV201140@mail-itl>
 <20201205082839.ts3ju6yta46cgwjn@Air-de-Roger>
 <CAKf6xpvdD-XJoRO91B+Lwc=0Sb6Luw2X8Y9sH_MQsAWhZmj+hw@mail.gmail.com>
 <293433c5-d23b-63e7-d607-9d24f06c46b4@suse.com>
 <20201207114805.GF1244@mail-itl>
 <9bf64b27-51e8-a734-e15e-8da6d2eda736@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Content-Disposition: inline
In-Reply-To: <9bf64b27-51e8-a734-e15e-8da6d2eda736@suse.com>


--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: GPF on 0xdead000000000100 in nvme_map_data - Linux 5.9.9

On Mon, Dec 07, 2020 at 01:00:14PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 07.12.20 12:48, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Dec 07, 2020 at 11:55:01AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > > Marek,
> > >=20
> > > On 06.12.20 17:47, Jason Andryuk wrote:
> > > > On Sat, Dec 5, 2020 at 3:29 AM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
> > > > >=20
> > > > > On Fri, Dec 04, 2020 at 01:20:54PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > On Fri, Dec 04, 2020 at 01:08:03PM +0100, Christoph Hellwig wro=
te:
> > > > > > > On Fri, Dec 04, 2020 at 12:08:47PM +0100, Marek Marczykowski-=
G=C3=B3recki wrote:
> > > > > > > > culprit:
> > > > > > > >=20
> > > > > > > > commit 9e2369c06c8a181478039258a4598c1ddd2cadfa
> > > > > > > > Author: Roger Pau Monne <roger.pau@citrix.com>
> > > > > > > > Date:   Tue Sep 1 10:33:26 2020 +0200
> > > > > > > >=20
> > > > > > > >       xen: add helpers to allocate unpopulated memory
> > > > > > > >=20
> > > > > > > > I'm adding relevant people and xen-devel to the thread.
> > > > > > > > For completeness, here is the original crash message:
> > > > > > >=20
> > > > > > > That commit definitively adds a new ZONE_DEVICE user, so it d=
oes look
> > > > > > > related.  But you are not running on Xen, are you?
> > > > > >=20
> > > > > > I am. It is Xen dom0.
> > > > >=20
> > > > > I'm afraid I'm on leave and won't be able to look into this until=
 the
> > > > > beginning of January. I would guess it's some kind of bad
> > > > > interaction between blkback and NVMe drivers both using ZONE_DEVI=
CE?
> > > > >=20
> > > > > Maybe the best is to revert this change and I will look into it w=
hen
> > > > > I get back, unless someone is willing to debug this further.
> > > >=20
> > > > Looking at commit 9e2369c06c8a and xen-blkback put_free_pages() , t=
hey
> > > > both use page->lru which is part of the anonymous union shared with
> > > > *pgmap.  That matches Marek's suspicion that the ZONE_DEVICE memory=
 is
> > > > being used as ZONE_NORMAL.
> > > >=20
> > > > memmap_init_zone_device() says:
> > > > * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
> > > > * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
> > > > * ever freed or placed on a driver-private list.
> > >=20
> > > Second try, now even tested to work on a test system (without NVMe).
> >=20
> > It doesn't work for me:
> >=20
> > [  526.023340] xen-blkback: backend/vbd/1/51712: using 2 queues, protoc=
ol 1 (x86_64-abi) persistent grants
> > [  526.030550] xen-blkback: backend/vbd/1/51728: using 2 queues, protoc=
ol 1 (x86_64-abi) persistent grants
> > [  526.034810] BUG: kernel NULL pointer dereference, address: 000000000=
0000010
>=20
> Oh, indeed. Silly bug. My test was with qdisk as backend :-(
>=20
> 3rd try...

Now it works :)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl/OJ1UACgkQ24/THMrX
1ywkjAf+Mf2G0ndFf12si0XOBlJIxCtaJF+I+52yefMe26dEIGqgetpMs6U5rfec
9mX2MR0B+UP1PApuXI72PKcGbefvtvD3k5wrB2xYYsEPp5AbE01pbL6X0ruIkHGH
VqfoT2rv1Qay8fGSyiyG+FGGVl4jRSHKeLe3CHkdmj0zly9Id5WWND/pSLPS7czJ
/ieBAxTIYjBvKYpJi8kgxfUdYQTAeaYNbUMSnkyxmpP+VeTDWg5r+mCGAGt25KAk
J5u9btEgWSsPylQp3+qjVvqahEdulTcNzVi/B4TdPoJcmVBuQ1WpE27VKyrkZboY
Bj/c8yLu5uIhrc7McUnGumZe4iW+bg==
=lL4Q
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--

