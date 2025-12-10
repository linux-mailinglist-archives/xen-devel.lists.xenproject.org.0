Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411CCB1A73
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 02:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182491.1505361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9Js-0006Li-Rr; Wed, 10 Dec 2025 01:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182491.1505361; Wed, 10 Dec 2025 01:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT9Js-0006It-Oe; Wed, 10 Dec 2025 01:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1182491;
 Wed, 10 Dec 2025 01:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTTf=6Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vT9Jr-0006In-9r
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 01:48:43 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d39572-d56a-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 02:48:40 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 63E787A021B;
 Tue,  9 Dec 2025 20:48:39 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 09 Dec 2025 20:48:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 20:48:38 -0500 (EST)
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
X-Inumbo-ID: 59d39572-d56a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1765331319;
	 x=1765417719; bh=LzI1+sQ8xf2Ln6wZtfX0c6hRW5BXLELnAgDBiIDXSfc=; b=
	yHroWnzuIO+Ql9QzigZMTeKmPcD2TEtMU85e90NTqMsIeWTGXHqvWxEs82jjj4sg
	Bh8PnvFaFzRD5TLZQBOo3rQCsE8t3RQTki2k1i+bTvW9ngp5zCF5zoX/JLuDkV8k
	9VkKAEtndu4XMLB6pt2CYkxWcO9jIyxA8ekyBqiU4gAF7yZ0ihPlhRV8qkN6QjYc
	aqvRsSg7kB8ktZr/tcngTmvMZ4tubG6/8htho/z6x7PktYoU+kLRiPeBTr5qDxPX
	P+j6eFJ3xokGPyUYDnGal87s0OAMgqrt5A8nfNpHS7+ekfXIrbTyB+kNU+ExxF/J
	+0T7pdXepM9WpXeCbasThQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765331319; x=1765417719; bh=LzI1+sQ8xf2Ln6wZtfX0c6hRW5BXLELnAgD
	BiIDXSfc=; b=r/gG61jPR66Ii44GJ53vO774RGbL2yNQGiZFo4w8eBi5j++4iOD
	aOHi8CcXf2GzZ6sFoIEjOZroozGubvJb0TAJtpz10lQN1ZihExnG5bmVCqH4s1FO
	9OtLjRMiBgoDlfhoqCs1PwiEc+xYxWLiHpC39Useq5GmhUcXsyE0hQymt3bTbqvp
	aX0yRwCO8UcNV3za5AOWwtXNjTT1kPYOljUSUOZTrrvrPUre+nCHhqV6lswmObxQ
	tnkVqUp0Adj2jzVjG7mRVaPJFq4A2GBNqwomabN+MUFYstgeTk/ssFAuyp+dgEEF
	R5pn99dxC/FtwqNP5eW2QTsWV7EeIRWh+Xg==
X-ME-Sender: <xms:d9E4aaBNDJBDwmgptYAwT8nzsNvVJvFMHVEd2jWd6-WS8ZC7r1A26A>
    <xme:d9E4abiNqRUYCutLdhkvhFZDR1pZbRfAZiDqA9tMxZfgvlMHPPbl8iR2Osxc2ICoI
    Py7dNaS3UZJcbRsn9Z6Sohodo-DUJb12Q5jNp29FSnz5lHlxw>
X-ME-Received: <xmr:d9E4aSm1DjJn2hgY-xfOcrUFMu3KRi0n3ZYLhIQMDhpras-D026IMRoqJS1AYlVqiSoCSMFC64pUqqK0gCnClvuZAFr3al0jjDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhroh
    hjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:d9E4aXoG8u_TtFGgn3I6By_mqsk6LlSagonx-_SJmxNj3Ign7UAAHg>
    <xmx:d9E4abGTlw1J-0eY3kXS4bFVTAkr0FvjgMPxmwIDrtEz-Xg_7HnmPQ>
    <xmx:d9E4aTw2_esq-4NkAFqKTTk87o3RLkMYp82dz31vwMMcrOSXlFxorg>
    <xmx:d9E4aQoTxYi0YqV0LJ1AKLWI_qn6h3YKTrwm6VDiY2_QGJ1Z8oJcig>
    <xmx:d9E4aaGIb417JSnD_jV9_rMcfc1YzzqsPFFuL8o2YALOq5UtTaEFejoT>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 10 Dec 2025 02:48:36 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 1/6] automation: switch to alpine:3.22
Message-ID: <aTjRdE_tUJIfp8Wi@mail-itl>
References: <cover.b56a66dfe4d98db2f1cc8b1fe0c2091d02cebe38.1764989098.git-series.marmarek@invisiblethingslab.com>
 <94b63011f3a0969471425bb0f0677b20e16b8985.1764989098.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2512091506260.19429@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W4IE+oy/zWb6cnyn"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2512091506260.19429@ubuntu-linux-20-04-desktop>


--W4IE+oy/zWb6cnyn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Dec 2025 02:48:36 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v4 1/6] automation: switch to alpine:3.22

On Tue, Dec 09, 2025 at 03:07:46PM -0800, Stefano Stabellini wrote:
> On Sat, 6 Dec 2025, Marek Marczykowski-G=C3=B3recki wrote:
> > Alpine 3.18 is EOL. This patch updates Alpine to the latest stable
> > Alpine release - 3.22.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v4:
> > - fix containerize script
> > Changes in v2:
> > Originally this patch was updating to 3.19 for upcoming stubdomain tests
> > to get dracut-core package. But 3.19 is getting EOL very soon too.
>=20
> This one escaped:
>=20
> alpine-3.18-gcc-debug-arm64-mpu:
>   extends: .gcc-arm64-build-debug
>   variables:
>     CONTAINER: alpine:3.18-arm64v8
>     HYPERVISOR_ONLY: y
>     EXTRA_XEN_CONFIG: |
>       CONFIG_XEN_START_ADDRESS=3D0x0
>       CONFIG_MPU=3Dy
>       CONFIG_UNSUPPORTED=3Dy
>=20
> was it on purpose?

Right, I guess it was added after I made previous version of this
patch...

> You also might want to rename 3.18 to3.22 in docs/misc/ci.rst

Yes.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--W4IE+oy/zWb6cnyn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmk40XQACgkQ24/THMrX
1yzAwAf+Mv0iiLU2D+3BMWMZYpq2Rqosb2RfFUDIsg/DYZS+YcirHRaiqg5x02Jp
43goIRjzaP7BXXWGMfa2pVi2EutgK5j7U/ei4ExDNptcpqLxIuDP9dMN1cDOB2Lt
/trfJpXKJAvouM6j2agDeR1SiCt3et1HoC56sYFjpNnp8+8ysfChhp0JdUPT2Ikb
xI268k5KmfT91ZBW5eb9ooUmyadDDimDlbW242WIxtFGxFiuieKAKD8pb3lYtscE
F0986uXij+bpJm8MlyE8UIWoijOaC5cP7pD/ZQvyJfOVU+IzViWT1U4hNbxIiNPt
dqDhQu/TeelnU7BWB05zGOt7xFk2Ww==
=1HDx
-----END PGP SIGNATURE-----

--W4IE+oy/zWb6cnyn--

