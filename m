Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8813D051
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 23:47:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irrPw-0004NX-Ua; Wed, 15 Jan 2020 22:45:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TLv=3E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1irrPv-0004NQ-81
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 22:45:39 +0000
X-Inumbo-ID: bf745b0a-37e8-11ea-8649-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf745b0a-37e8-11ea-8649-12813bfff9fa;
 Wed, 15 Jan 2020 22:45:37 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 2084F60D;
 Wed, 15 Jan 2020 17:45:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 15 Jan 2020 17:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s/L53a
 mFbryjLWhPv40zNNeYKXKQDhXkWRfFTNqVm7Q=; b=I/HVcn5Eh4sR5sl2g3iQyX
 6fyK4WOsf8TaRYebSVsvnBNxXMVQM80Y4vq/EDX+6TMU/7Jy0BzZKjYvsa1+sBuX
 R/dE1CQK4G8lE1aZJatIhAE3FbhF7Ju6okE+XS71GkDk5rTHscmLJw4G8cvCysRf
 Xyom0KVg9MlrNJNjwMaiXqE49pJEIZEzmbUDOfhHlPVfLEwAZj/IDTlfuup+djLs
 1U9B0TMFk8WCdB3OR8Nn6mYXFXFAnKaVJrWdaNog6vqk3R+axkPx+A0o7UVS9Q0M
 OyR7QGvEiqF12mYHRWv7LNXzIPWxIsBQXI56qTloQwv8ECGjL5zbcDBGuhZY4GUA
 ==
X-ME-Sender: <xms:D5YfXgmI1Gymsxo95ERNMHygQ_043mVBQqZqEf5LVJKWtk8xFAmwDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdegucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
 tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmpdhmrghrkhhmrghilhdrohhrghenucfkphepledurdeihe
 drfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
 ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:D5YfXv-SvcGW2bSyrV4m-WmtsEpgvOeUpajAcUS_teqGAz3SqqPXPg>
 <xmx:D5YfXmHFEfyZKualnQcR8OtWJeewnTW_Z6qBN4mvxWg_WDsGXYlSlg>
 <xmx:D5YfXjLQGAv9HPokdRF6X6Ug56ltqCvO2evEyFdNaH6m4zq-r_Wzeg>
 <xmx:D5YfXnK5S51R3pLPrQQX2Mc0FGAsyomzBmBtHT8_FCHdiL_hWUYSyg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id CBB6680064;
 Wed, 15 Jan 2020 17:45:33 -0500 (EST)
Date: Wed, 15 Jan 2020 23:45:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200115224530.GU1314@mail-itl>
References: <20200115014643.12749-1-marmarek@invisiblethingslab.com>
 <20200115164815.GO11756@Air-de-Roger>
 <393ff73f-802c-9f1c-b739-4476388b6c98@oracle.com>
MIME-Version: 1.0
In-Reply-To: <393ff73f-802c-9f1c-b739-4476388b6c98@oracle.com>
Subject: Re: [Xen-devel] [PATCH v4] xen-pciback: optionally allow interrupt
 enable flag writes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6256433229762196294=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6256433229762196294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qq74T9cNcLNVv1KL"
Content-Disposition: inline


--Qq74T9cNcLNVv1KL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4] xen-pciback: optionally allow interrupt
 enable flag writes

On Wed, Jan 15, 2020 at 05:32:32PM -0500, Boris Ostrovsky wrote:
>=20
>=20
> On 1/15/20 11:48 AM, Roger Pau Monn=C3=A9 wrote:
> > On Wed, Jan 15, 2020 at 02:46:29AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > QEMU running in a stubdom needs to be able to set INTX_DISABLE, and t=
he
> > > MSI(-X) enable flags in the PCI config space. This adds an attribute
> > > 'allow_interrupt_control' which when set for a PCI device allows writ=
es
> > > to this flag(s). The toolstack will need to set this for stubdoms.
> > > When enabled, guest (stubdomain) will be allowed to set relevant enab=
le
> > > flags, but only one at a time - i.e. it refuses to enable more than o=
ne
> > > of INTx, MSI, MSI-X at a time.
> > >=20
> > > This functionality is needed only for config space access done by dev=
ice
> > > model (stubdomain) serving a HVM with the actual PCI device. It is not
> > > necessary and unsafe to enable direct access to those bits for PV dom=
ain
> > > with the device attached. For PV domains, there are separate protocol
> > > messages (XEN_PCI_OP_{enable,disable}_{msi,msix}) for this purpose.
> > > Those ops in addition to setting enable bits, also configure MSI(-X) =
in
> > > dom0 kernel - which is undesirable for PCI passthrough to HVM guests.
> > >=20
> > > This should not introduce any new security issues since a malicious
> > > guest (or stubdom) can already generate MSIs through other ways, see
> > > [1] page 8. Additionally, when qemu runs in dom0, it already have dir=
ect
> > > access to those bits.
> > >=20
> > > This is the second iteration of this feature. First was proposed as a
> > > direct Xen interface through a new hypercall, but ultimately it was
> > > rejected by the maintainer, because of mixing pciback and hypercalls =
for
> > > PCI config space access isn't a good design. Full discussion at [2].
> > >=20
> > > [1]: https://invisiblethingslab.com/resources/2011/Software%20Attacks=
%20on%20Intel%20VT-d.pdf
> > > [2]: https://xen.markmail.org/thread/smpgpws4umdzizze
> > >=20
> > > [part of the commit message and sysfs handling]
> > > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > > [the rest]
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > Some minor nits below, but LGTM:
> >=20
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > >=20
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-pciback b/Documen=
tation/ABI/testing/sysfs-driver-pciback
> > > index 6a733bfa37e6..566a11f2c12f 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-pciback
> > > +++ b/Documentation/ABI/testing/sysfs-driver-pciback
> > > @@ -11,3 +11,16 @@ Description:
> > >                   #echo 00:19.0-E0:2:FF > /sys/bus/pci/drivers/pcibac=
k/quirks
> > >                   will allow the guest to read and write to the confi=
guration
> > >                   register 0x0E.
> > > +
> > > +What:           /sys/bus/pci/drivers/pciback/allow_interrupt_control
> > > +Date:           Jan 2020
> > > +KernelVersion:  5.5
>=20
> 5.6
>=20
> I can fix this and the things that Roger mentioned while committing if Ma=
rek
> is OK with that.

Yes, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Qq74T9cNcLNVv1KL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4flgsACgkQ24/THMrX
1yz9NAgAidnN3NOI1VHwnXmstOdX25K8D+eHYtrxRGolZmla32SxukBD44JGY0jD
zKHrfnKYkoXdyKMi0KfAaQ/vWfGXuIPdG6UbVDHyWde7Hr8rcv2D/x+LYu0h7Shk
E4niKgGlpoRdK5hKC6dZsb8PR6rxM3998Q5gu1JQ62lH40JPQmACDWLDKhavVyhU
fEDqLwTNT3OY5bB7aIaoglmFfQtnlWuXmIjndkm1hSsFTU1MqLZnMPBd2vWi1hDG
y4NkKDanS3Hvaxvug+JiOwHVP0BzM3KddQRdvm7h6URdnPmAy9kAnsTtO4H2uPB5
N4+sZxKZvl6MB2hkx4NmXh4M6PZA0A==
=b0SO
-----END PGP SIGNATURE-----

--Qq74T9cNcLNVv1KL--


--===============6256433229762196294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6256433229762196294==--

