Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E7CB4570
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 01:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183434.1506142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUEs-0004HJ-05; Thu, 11 Dec 2025 00:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183434.1506142; Thu, 11 Dec 2025 00:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUEr-0004EC-Sd; Thu, 11 Dec 2025 00:08:57 +0000
Received: by outflank-mailman (input) for mailman id 1183434;
 Thu, 11 Dec 2025 00:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJZb=6R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vTUEq-0004AW-8b
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 00:08:56 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93af91ae-d625-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 01:08:53 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 773BBEC0584;
 Wed, 10 Dec 2025 19:08:52 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 10 Dec 2025 19:08:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 19:08:51 -0500 (EST)
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
X-Inumbo-ID: 93af91ae-d625-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765411732;
	 x=1765498132; bh=ZOLmsFmukC8ujLnf2PqHYgsWbcDo6gJuduQpUltalaA=; b=
	M8M7Bt4ZweM9LS3z0AiYIuS6zlv9xq9GdVYMVLpxU6XBeHb29yLqjkdBGqFpfWJY
	146g60+TAHhnj8LONwEpGvLHOEfjwNBY2GueeNhJQpruRP1aRlP6q38svfHb/ykq
	vpyZpVlWvxOoh8HV1WmEJKUfeAhTD6ZCAhCUwvlc5lCL3YH2vhvrUNc8SqDJVSxY
	IqfAcouMVnWErX5eWU1yeYgdU+aQuNP9aB0ZYjjdiF27WssrN1U6e6PQHxurD4nH
	V/5UkC9n6ooVK11YdL4k5wPnuhxFNMriRcVl5udfzFzeYmZ6jKK8aeMvyTGmdiXE
	pEd5iUWBX+eJxosYKg0yww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765411732; x=1765498132; bh=ZOLmsFmukC8ujLnf2PqHYgsWbcDo6gJuduQ
	pUltalaA=; b=SRw4dilhNF5IHnTRG3muHDK/TgMkPloKZRqU+jPrq1cw806Sn0q
	smSoWmLrf6EeqrAT4k1vLg2mfa/LwhGTv9y4vC7GX+Zfn+69UtAzI1eekkDcSDVW
	MRMzAk2kJt81MTmVjY3Jpt3iexxXjYIdq3SbPw5pRW9VS3cA6g8ltoqbHtTRzCk+
	T70xVa6xMQ8RiIpxg+MupjZ8UgwAcXZVGqGJzambtvXs6QxSH1zoBYm72wLpXDpj
	fzLkfdCSVZc6S8iaTb8I6y07twDMUpkfL6eSpPHXWHFN0OJnVroqpx/mh74oa+2X
	m19Oeo1d6XBE/QD3xFeCKvaoW92eTlG1hQA==
X-ME-Sender: <xms:lAs6aa0tdKdA85d5gzBEYk_FhNLBf9c9cp-x_b7FEoR9g35F6jJ7Ow>
    <xme:lAs6aUGhKzIt6m6I3uviV7vyGD5uGYlcxYp_Wpa6p8rNOc7qPClINz6qlJXWLHesO
    3stuANiohpVhdp7fbaO9DlXHc71L-GBkBX6FMGKlEnAb62kRw>
X-ME-Received: <xmr:lAs6aX4cSgPfSRaW1BxV3dceblduhnQ00rhQ7-tD1xfTBfQsQJRqPyMnIamanwIO20lEVCPg_sO42Fry7EEnUaVdosYwcwCU9es>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedvhfek
    udetvdelffeguedtkeethfethfffhfefteeghfeigeelvddttdektdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:lAs6aatjb13cdmWFVsoNnRaGprIlSzpcXDSRlYD6NX2fn4YQDI8zew>
    <xmx:lAs6aY5H3rTZxMTT-Xw115vy5j6NePSvOPwV8fc93Er6WrxOD1Eplw>
    <xmx:lAs6aVVZbCAbYHP6sQ2qaKNxB3MDIROHduDWvvghCqOjKBP4LJf42A>
    <xmx:lAs6aa96q75JbQ2tc7cKQFhL3eNCxJKx7_HbViyncTA_uKdxsvUIww>
    <xmx:lAs6aTaMwG1eK0jP1k3ccdjAhOkyjRmkZayk84-3gr7GfpMJKP6jWEjK>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 Dec 2025 01:08:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests
Message-ID: <aToLkaVRGkvtRIKK@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
 <cf2a2544fe27fedca5129b61912c064f4be08236.1764989098.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091534060.19429@ubuntu-linux-20-04-desktop>
 <aTjOBpuKMSO4LzzN@mail-itl>
 <alpine.DEB.2.22.394.2512101219460.19429@ubuntu-linux-20-04-desktop>
 <aTnezVY1NoE-vZRF@mail-itl>
 <alpine.DEB.2.22.394.2512101344130.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yu4+eA58Gt3/VVXv"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512101344130.19429@ubuntu-linux-20-04-desktop>


--Yu4+eA58Gt3/VVXv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Dec 2025 01:08:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 4/6] CI: Add driver domains tests

On Wed, Dec 10, 2025 at 01:58:44PM -0800, Stefano Stabellini wrote:
> On Wed, 10 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > +    mkfs.ext4 -d . ../domU-rootfs.img 1024M
> > > > >=20
> > > > > Do we really need 1GB? I would rather use a smaller size if possi=
ble.
> > > > > I would rather use as little resources as possible on the build s=
erver
> > > > > as we might run a few of these jobs in parallel one day soon.
> > > >=20
> > > > This will be a sparse file, so it won't use really all the space. B=
ut
> > > > this size is the upper bound of what can be put inside.
> > > > That said, it's worth checking if sparse files do work properly on =
all
> > > > runners in /build. AFAIR some older docker versions had issues with=
 that
> > > > (was it aufs not supporting sparse files?).
> > >=20
> > > I ran the same command on my local baremetal Ubuntu dev environment
> > > (arm64) and it created a new file of the size passed on the command
> > > line (1GB in this case). It looks like they are not sparse on my end.=
 If
> > > the result depends on versions and configurations, I would rather err=
 on
> > > the side of caution and use the smallest possible number that works.
> >=20
> > Hm, interesting. What filesystem is that on?
> >=20
> > On my side it's definitely sparse (ext4):
> >=20
> >     [user@disp8129 Downloads]$ du -sch
> >     12K	.
> >     12K	total
> >     [user@disp8129 Downloads]$ mkfs.ext4 -d . ../domU-rootfs.img 1024M
> >     mke2fs 1.47.2 (1-Jan-2025)
> >     Creating regular file ../domU-rootfs.img
> >     Creating filesystem with 262144 4k blocks and 65536 inodes
> >     Filesystem UUID: f50a5dfe-4dcf-4f3e-82d0-3dc54a788ab0
> >     Superblock backups stored on blocks:=20
> >         32768, 98304, 163840, 229376
> >=20
> >     Allocating group tables: done                           =20
> >     Writing inode tables: done                           =20
> >     Creating journal (8192 blocks): done
> >     Copying files into the device: done
> >     Writing superblocks and filesystem accounting information: done
> >=20
> >     [user@disp8129 Downloads]$ ls -lhs ../domU-rootfs.img=20
> >     33M -rw-r--r--. 1 user user 1.0G Dec 10 21:45 ../domU-rootfs.img
>=20
> I went and check two of the runners, one ARM and one x86, and it looks
> like they support sparse outside and inside containers. They should have
> all the same configuration so I think we can assume they support sparse
> files appropriately.
>=20
> So it looks like it OK. But please could you add an in-code comment to
> highlight that the file created will be sparse?

Sure.

> > > > > Moreover this script will be run inside a container which means t=
his
> > > > > data is probably in RAM.
> > > >=20
> > > > Are runners configured to use tmpfs for /build? I don't think it's =
the
> > > > default.
> > >=20
> > > I don't know for sure, they are just using the default. My goal was to
> > > make our solution more reliable as defaults and configurations might
> > > change.
> > >=20
> > >=20
> > > > > The underlying rootfs is 25M on both ARM and x86. This should be =
at most
> > > > > 50M.
> > > >=20
> > > > Rootfs itself is small, but for driver domains it needs to include
> > > > toolstack too, and xen-tools.cpio is over 600MB (for debug build).
> > > > I might be able to pick just the parts needed for the driver domain=
 (xl
> > > > with its deps, maybe some startup scripts, probably few more files)=
, but
> > > > it's rather fragile.
> > >=20
> > > My first thought is to avoid creating a 1GB file in all cases when it
> > > might only be needed for certain individual tests. Now, I realize that
> > > this script might end up only used in driver domains tests but if not=
,=20
> >=20
> > Indeed this script is specifically about driverdomains test.
> >=20
> > > I
> > > would say to use the smallest number depending on the tests, especial=
ly
> > > as there seems to be use a huge difference, e.g. 25MB versus 600MB.
> > >=20
> > > My second thought is that 600MB for just the Xen tools is way too lar=
ge.
> > > I have alpine linux rootfs'es with just the Xen tools installed that =
are
> > > below 50MB total. I am confused on how we get to 600MB. It might be d=
ue
> > > to QEMU and its dependencies but still going from 25MB to 600MB is
> > > incredible!
> >=20
> > Indeed it's mostly about QEMU (its main binary itself takes 55MB),
> > including all bundled firmwares etc (various flavors of edk2 alone take
> > 270MB). There is also usr/lib/debug which takes 85MB.
> > But then, usr/lib/libxen* combined takes almost 50MB.
> >=20
> > OTOH, non-debug xen-tools.cpio takes "just" 130MB.
>=20
> Can we use the non-debug xen-tools.cpio=20

I can use non-debug one. While debug build of hypervisor changes quite a
lot in terms of test output details, the purpose of this test is mostly
to test toolstack and frontend drivers - and here debug build doesn't
change much.

> and also can we remove all the
> bundled firmware? Do we really need EDK2 for instance?
>=20
> I don't think it is worth doing an in-details analysis of what binaries
> to keep and what to remove, but at least removing the unnecessary
> in-guest firmware and ideally chosing a non-debug build sounds
> reasonable?

Excluding QEMU _for now_ makes sense. But there might be a day when we'd
like to test QEMU backends in a driver domain and/or a domU booted via
UEFI (IIUC such configuration has PV frontend in EDK2 - at least for the
disk - and it makes sense testing if it works with driver domains).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Yu4+eA58Gt3/VVXv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk6C5EACgkQ24/THMrX
1yyH0ggAk/eUGH6KYLDUq2ff42HWX/kI/i9YO7erfB1su/oPrVhV/Et9LV2kcOUC
dWJzFNNeQ+5oKHXeool3fjYq1Ljog9qk7bkVAiVkir2SP7lFJeuCzFHhy6ceLPUu
3g8teCYYp+KYjSLUNim/BiD9CKsP1SgXi4r2lH0bp7Jx9fAQykx8FaNvlhSX4O7f
d0jFsx16ayYf9tG85H7g7TctyT5Kj2yPixNCjRv0FuuZJgZPMuGHbkZ4z5+E0J16
84i6h+q/vtgDULC4eBQozwdHwey3IyLfK3+Z7vnD31cs/x3bzUFN5a8nkQDRFOw7
IJpAfeLo6o61SCgOrk7XxoizEjWpdA==
=qFZ4
-----END PGP SIGNATURE-----

--Yu4+eA58Gt3/VVXv--

