Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9BAC51DA
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998538.1379261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJw5W-0006bS-KX; Tue, 27 May 2025 15:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998538.1379261; Tue, 27 May 2025 15:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJw5W-0006Zi-H5; Tue, 27 May 2025 15:19:34 +0000
Received: by outflank-mailman (input) for mailman id 998538;
 Tue, 27 May 2025 15:19:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdP1=YL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJw5V-0006Zc-2f
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:19:33 +0000
Received: from fhigh-a2-smtp.messagingengine.com
 (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f888c1c8-3b0d-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:19:24 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 62D221140193;
 Tue, 27 May 2025 11:19:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 27 May 2025 11:19:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 11:19:22 -0400 (EDT)
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
X-Inumbo-ID: f888c1c8-3b0d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748359163;
	 x=1748445563; bh=XuWySyI/piapIHyfe2ibu0ahhtanbL1ez1d4vkonc2E=; b=
	XWSRd9vFiC56rLUyDckiAYWLqNCeksX4yIXRMPLJIrXMzaT00hkdBrn4Y2Aslaf3
	0D+Jh+RDse2V5uPdFdcAfY7GB9CTLh6ETX92PYSjnG8/SIv/f4nadfioR9gD7s9i
	IL0/Rf1H6Nw9x1n0Me08Vph7bBIki/76wawPtFrWXweDOzmFkBq59OJfrW8cuf2C
	Kd0oL710kIOquwhLpIEfrJrmHF3uXuYGZfRG38Bbio4nU9JUbNkmn2uQA4mzBVWh
	svqe9JekaxqfplmcjO8dJQFgT0Hntlk97H88OeX0DDOQP6cH4pzHgD3rQl6GxYE+
	BCfOnsaptHUztcNIm7JNWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748359163; x=1748445563; bh=XuWySyI/piapIHyfe2ibu0ahhtanbL1ez1d
	4vkonc2E=; b=dQ15MJ6Bm/diuFsEiaKRWBWHBNKI0FdbD4N3odohCueuNLjVN5P
	QCRx7CpMVYX8gFHT1Q+PJ/3sGlbhHQ8olh8laz/7wcXKt3WAYoFXqGCFY2S5c8SR
	dtL4d17FyeDTwi/gLAJwaIPZSFoYAZf+Xb2rtUz9Uiu91WuKjgrb/YXXpYOd6hrL
	60+UaZOyDOZY6vt1BseINenSuLMrS+SAB7eAYR9WeIz+wU3pZww+ANQskVXdIZDB
	Cqk+a2j5IRNFHPuDgZb2HVqaT8jc93QzO/kOvRH/36rwmPDjp25FeQgX8CGB+6e5
	TxVxp+9HDVauXpsj6SeHzsVF0MaFd5w4g5g==
X-ME-Sender: <xms:-9c1aEiyPS5Nt5S0pD_DNalO4YwQmgJLoIKasRDN6KdOKsJkLBzIyg>
    <xme:-9c1aNC0xzD7FyFw5FzN_h39XGkjDCf_yAnDVXyZBf2BnaVgma6DMt9WC7g2TUKvS
    etsU2XOaY-3Tw>
X-ME-Received: <xmr:-9c1aME0mzjxBHfy1rzpw8xHiCV6qEhC6pGzk6NNiAnRRcBtFbnS3LNli2CaG0sr2NiV7FPW8dbW-_WprTj_zjWaZOMTc9eQnUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtdejvdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihf
    ejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhthhhonhihseigvghnphhrohhjvggtthdrohhrghdprhgtph
    htthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthht
    ohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtg
    hpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    mhhitghhrghlrdhorhiivghlsegrmhgurdgtohhm
X-ME-Proxy: <xmx:-9c1aFRIStDzo82kSJQGayo3pzjLhE7s8W7Kf6BjL7vt-o4MI1_Xqg>
    <xmx:-9c1aBwIUC71xKob2WJlbMdWyvfdfGkzWofxEu1cUletQzU7mjaDDw>
    <xmx:-9c1aD44E-Kv0xNAmwe2E_XSOFE9a3z9xdb1lDVhZHz_bfrMyUIV-w>
    <xmx:-9c1aOw3fJaCio6IzmJM6-WDIUKgyqFJMatrAKTWZ7XZY_112u_RRg>
    <xmx:-9c1aJVla_geGi_zZg_8ehlXQ2fygMjv72IoV7JleEBG2anqpNIuu3Vv>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 27 May 2025 17:19:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction
Message-ID: <aDXX-PagUgzu54u4@mail-itl>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-3-andrew.cooper3@citrix.com>
 <aDXFviVAxsscfKV2@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mntzzDVDpcy+dZNG"
Content-Disposition: inline
In-Reply-To: <aDXFviVAxsscfKV2@l14>


--mntzzDVDpcy+dZNG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 May 2025 17:19:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/3] CI: Use bash arrays to simplfy dom0 rootfs
 construction

On Tue, May 27, 2025 at 04:01:34PM +0200, Anthony PERARD wrote:
> On Thu, May 22, 2025 at 06:36:39PM +0100, Andrew Cooper wrote:
> > For Qubes, this requires switching from sh to bash.
> >=20
> > This reduces the number of times the target filename needs to be writte=
n to 1.
> >=20
> > Expand the comment to explain the concatination constraints.
>=20
> Isn't the correct spelling "concatenation"? Same for the two comments.
>=20
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > I would like to find a slightly nicer way of conditional parts, but not=
hing
> > comes to mind.
>=20
> Well, one way I can think of is having a new variable which can carry
> the rootfs part associated with a particular test, then that variable
> can be updated at the time we configure for that test. Something like:
>=20
> # init
> declare -a append_rootfs_part
> # or append_rootfs_part=3D() is probably fine too.
>=20
> case $test in
>   argo)
>     append_rootfs_part+=3D(argo.cpio.gz)
>     # ... other test configuration
>     ;;
> esac
>=20
> # Dom0 rootfs
> parts=3D(
>     rootfs.cpio.gz
>     xen-tools.cpio.gz
>     "${append_rootfs_part[@]}"
> )
>=20
> And that should works fine, even if there isn't any extra rootfs part.

That would work for compressed parts, but not for uncompressed - which
need to come before all compressed. But maybe there could be two arrays
- one for uncompressed and another for compressed? Then, each could be
extended anywhere, without messing the order.

>=20
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 10af274a0ba7..1dd3f48b3d29 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -187,10 +187,14 @@ Kernel \r on an \m (\l)
> >      rm -rf rootfs
> >  fi
> > =20
> > -# Dom0 rootfs
> > -cp binaries/ucode.cpio binaries/dom0-rootfs.cpio.gz
> > -cat binaries/rootfs.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> > -cat binaries/xen-tools.cpio.gz >> binaries/dom0-rootfs.cpio.gz
> > +# Dom0 rootfs.  The order or concatination is important; ucode wants t=
o come
>=20
>                              ^ of concatenation
>=20
> Same typo in the other comment.
>=20
> Beside the typo, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>=20
> Thanks,
>=20
> --=20
> Anthony PERARD

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mntzzDVDpcy+dZNG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg11/gACgkQ24/THMrX
1ywIYQf+O4V/eZf4NybbLa8AHCV4k3IC5q+26rMH8M1HkFV/gY0ZZ/SS5A8OJszZ
CKzIvbh3QIF7pfBgqjrkpn5HI+smtLULjLZlGWRngR9XkBg60wsFI++2wxlf1swj
HKi8AJIEkI2eEKOMPTl19hlMPoPoJoehEb9D+atyn3ZG5tlXG8wkoBna4lkDdNwt
r+vjdxxPipthxOShBeoa5zsNftEYTxxQd9HVCQnIjcl/6+BdIRfrwpC6PU5lF6Go
+QcBGzAvaLtHWaJx/BztRmGRiLENX1dbkBNQOoki9mYjxPksHwXuqNPZyAhyc5pq
Ztwo59gDy9J6a/MVxEi7McqyabfSIA==
=bpg8
-----END PGP SIGNATURE-----

--mntzzDVDpcy+dZNG--

