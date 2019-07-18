Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CB6C3C1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 02:15:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnu2B-00030e-16; Thu, 18 Jul 2019 00:12:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0/+e=VP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hnu2A-00030Z-BX
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 00:12:30 +0000
X-Inumbo-ID: ba0f334c-a8f0-11e9-b169-7fde1ea8eae4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba0f334c-a8f0-11e9-b169-7fde1ea8eae4;
 Thu, 18 Jul 2019 00:12:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0894F49B;
 Wed, 17 Jul 2019 20:12:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 17 Jul 2019 20:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cWN2gQ
 7IL/zPMr5b+7iDnC9hTJVfKivWIK21o3ac7/Q=; b=EWUfzi43xX7Pm6AYJNRgX0
 dtHy7s3jZwY6mIlZOid71RN//OcMOeH9b/JkUs9xyfHMZHpPiNHknkZnBY610dwV
 t5oT3TEcidkZkKU79ojeRrSEALbrtujc8S+Cj7cPBa1EoFt5Q7rUVFkbuqeHXyvf
 fYKb3YHo5z0nIa7NPudO5eENtbYeDdJ9ErdtZLb5o1IsrwkJAW2bTD9+TaJ32JQO
 IUTpGR4zIASSZjihv7xL6alR++A/BDw6d+BKBGiMg39i2kPz8KajQ8COO97jCKTe
 zQZEuV8X8+NsL9wLjbEJ+6pxoTJ6OkRja68wuzzv4P22+HX04zZpwpiKtbjR3ygw
 ==
X-ME-Sender: <xms:arkvXWN88FOHB161wYG_FU9WlDarbzKPGCGp7jJ8qlddsWmb4DxObg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrieeggddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:arkvXbdd9kP9FGEW_Al0FZ57x4zFW73oT9rRgO-UeGdz9gBSBrDqXg>
 <xmx:arkvXQfyyL2FrZ_PDoC-aBb7uYo6ut7BIZq8n91nrSrHQfCxjESdvg>
 <xmx:arkvXQvs1cZcjo54vfejC2h5lrb_YgVmD6FrxkCbScH-Jtgrq1pXvg>
 <xmx:arkvXWii1ko_7Kc1cVExSkcy12413HkbPGz2TS2if0WvMZmMCtcDug>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBCB6380075;
 Wed, 17 Jul 2019 20:12:24 -0400 (EDT)
Date: Thu, 18 Jul 2019 02:12:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190718001220.GY1250@mail-itl>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <5c8fb8141c0f92ccaa78cdc169b8544f7634ce65.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717102158.y3cp34q7blfslntt@Air-de-Roger.citrite.net>
MIME-Version: 1.0
In-Reply-To: <20190717102158.y3cp34q7blfslntt@Air-de-Roger.citrite.net>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_msi_control
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============0669950160335026682=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0669950160335026682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m8yuz6kcWj4yJ5vq"
Content-Disposition: inline


--m8yuz6kcWj4yJ5vq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 12:21:58PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jul 17, 2019 at 03:00:44AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Add libxc wrapper for PHYSDEVOP_msi_control introduced in previous
> > commit.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> LGTM, albeit I find the usage of int instead of unsigned int for the
> SBDF kind of weird, but it's inline with the other functions, so I
> guess there's a reason for it?

Yes, it was based on looking at other places. But I don't know if there
is any specific reason for it.

> I assume this will be used by an upcoming QEMU patch?

Yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--m8yuz6kcWj4yJ5vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl0vuWQACgkQ24/THMrX
1yxSQQf7B3u3/LzTUhLjSgbEZnSEtAqBMjZbT071izaiecoK5XKwT/mHJZFYk5LP
FBILl1DShQoOG7VWdEfhs9h6k9dunxealUtr/KOT4MvJ7YHrpEVLVYuOWG4fTkTZ
jeehs+CT6mWQOLywLxpTBasLka4qBqHZwtyiCHryf9K9/dyrt2i9t6NS4n78CIbP
OriSCdHgfyeOvbqah3idbzk8tH1VU0TSfxDxtt4brCjkxLIbohKr83aOpUnokC3C
cCxqZb4jJfomqsjyzyYvRrAZCjoOtAVY/S8ZwY0KwDRcIcSaUgaCGJHY4Ps7SUAT
TzewgDL2YqOad/mXH5eZusrydmPLmw==
=TZnu
-----END PGP SIGNATURE-----

--m8yuz6kcWj4yJ5vq--


--===============0669950160335026682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0669950160335026682==--

