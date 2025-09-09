Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE70B4ACBA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 13:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116404.1462735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvwqN-0000ug-RP; Tue, 09 Sep 2025 11:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116404.1462735; Tue, 09 Sep 2025 11:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvwqN-0000t9-OE; Tue, 09 Sep 2025 11:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1116404;
 Tue, 09 Sep 2025 11:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fYTq=3U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uvwqM-0000mB-2G
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 11:49:02 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f916dc09-8d72-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 13:49:00 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5F7CA7A014B;
 Tue,  9 Sep 2025 07:48:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Tue, 09 Sep 2025 07:48:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 07:48:55 -0400 (EDT)
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
X-Inumbo-ID: f916dc09-8d72-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757418538;
	 x=1757504938; bh=InuPwEoWWL1ylRxBhIyOeZE7bOkepMVDOxnsG3KOGIk=; b=
	U2P+WsD8y8pGBlankTzVG8r3k6mAxW4e495cTT8uvSAbOIccJuMbeUarXx2TONg5
	YeHUAeS5kTXwO9u7yXHHF/XVFlriz6x474rpbOU2SjaAnoxgdX12ZqCPp3GpMjT5
	tcRgl3JRmhOT7arKaASlAthStYYKNPc7tHHwxqs+h690ljGf1v1nfLMr8fup9tG/
	Ve3LfKg7P19souRpPJ0zyCd1I4jkLoYz4hL4HP+U5TTm0OQdCKRHe3ZllaqaptgA
	ZjWheAnWIuIa6FuJdfpEnXxypJioejcWaakqvMjwucRBUc/GpQYUJvDZutBbMbRh
	ZvvBxxyhA3Zuh9nn+SbeWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757418538; x=1757504938; bh=InuPwEoWWL1ylRxBhIyOeZE7bOkepMVDOxn
	sG3KOGIk=; b=TkFjVfLKo7CYNJIIxIQGFWTZrrI/C3DMeX0+B8cEc/cu9Wo6CYW
	PYsRuE3LxIi2fbGTZhOEF8vlnuatp4KsieV/3uKvRdshQGj0bc/MaCwyHhLkj4mH
	zznvXVIufHJIp5jA7VDorrbx4y1TuF1XBH5PwuMs8K/xSlzfK6tY6EJvRTWLiR47
	dhEzyFs69uK+qDqrz0RJnyUd8gOR9ESfyJYN18++iP/wxetK4XnKJCV9B78wlX3F
	MpzmuLy2hJur8+oTTGR9gU7eez7FlXnC3JIwahnwou5HBG8tlcERq7qd7uuEwdPm
	2SGJWZAoT/m4vUHcc78ei1SlaGdZ2JMfA9Q==
X-ME-Sender: <xms:KRTAaJHgI_gpn11e0IPnO3ZFlWi55J8l-aWkCmS5mIltMJitrvkNdA>
    <xme:KRTAaFkxLG5sMdc3_abMQYPEm0Doe3GywYb8F07C_5w9UHHk10AM_R8pv2br8j6pd
    ClnwBixp13VYg>
X-ME-Received: <xmr:KRTAaGBAs3lzVZPxQIOphm98-G1n502iWKkB-dyFV44aFM5G94Wc52-i88o4LC2SQmwa9U4imzWSnHpEQz7uHFcIPdJeM47nGQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedugedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghruges
    vhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurd
    gtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    pehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehsrghnrghsthgrshhiohesrhgrphhtohhrvghnghhinhgvvg
    hrihhnghdrtghomh
X-ME-Proxy: <xmx:KRTAaPAwE5UTjI07yFv-a2WcXlQb2IZHmivrRtCVrnwpLSk3YMu8XA>
    <xmx:KRTAaFG1gZIbmZ3gX08s3vWTiFd3GFhhXWAR5TGL7v3BSWfKbd7AlQ>
    <xmx:KRTAaO6MSDGc6DCstLFqUsMd2Lkha93B6XTAsME-qGK7vVTR4XuNHw>
    <xmx:KRTAaERVyrrfQFdCRXpSuBN2fH46FyIhqOstvqwPJI74g1wcBPKTKg>
    <xmx:KhTAaJdxMaecLmRoV3A2wd7c7nTpF9JpB1iOxvSZ3N9buhDI6EtJ0mA6>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 9 Sep 2025 13:48:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.21 0/5] CI: Add Debian Trixie
Message-ID: <aMAUJehaWkYyyM-E@mail-itl>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ByBE5CgLQp0KhHp"
Content-Disposition: inline
In-Reply-To: <20250809221206.1260861-1-andrew.cooper3@citrix.com>


--7ByBE5CgLQp0KhHp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 9 Sep 2025 13:48:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.21 0/5] CI: Add Debian Trixie

On Sat, Aug 09, 2025 at 11:12:01PM +0100, Andrew Cooper wrote:
> I know it's past the last-post deadline, but Trixie was only released tod=
ay.
>=20
> In terms of backports, we should at least go back to the bugfix branches.

What is the state of this series? I'm preparing refresh of my various CI
series and some add more jobs on debian-12 - I wonder if I should make
them debian-13 already - but for this I need this series committed...

> Andrew Cooper (5):
>   CI: Trixie containers
>   CI: Update ppc64 to use Debian Trixie
>   CI: Update riscv64 to use Debian Trixie
>   stubdom: Fix -Wimplicit-int in newlib
>   CI: Update x86 to use Debian Trixie
>=20
>  automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++
>  automation/build/debian/13-riscv64.dockerfile | 37 ++++++++
>  automation/build/debian/13-x86_32.dockerfile  | 51 ++++++++++
>  automation/build/debian/13-x86_64.dockerfile  | 74 +++++++++++++++
>  automation/gitlab-ci/build.yaml               | 94 +++++++++++++++----
>  automation/gitlab-ci/test.yaml                | 14 +--
>  stubdom/Makefile                              |  1 +
>  stubdom/newlib-fix-etext.patch                | 23 +++++
>  8 files changed, 306 insertions(+), 25 deletions(-)
>  create mode 100644 automation/build/debian/13-ppc64le.dockerfile
>  create mode 100644 automation/build/debian/13-riscv64.dockerfile
>  create mode 100644 automation/build/debian/13-x86_32.dockerfile
>  create mode 100644 automation/build/debian/13-x86_64.dockerfile
>  create mode 100644 stubdom/newlib-fix-etext.patch
>=20
> --=20
> 2.39.5
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7ByBE5CgLQp0KhHp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjAFCUACgkQ24/THMrX
1yzTzQf9EWJQA/eQRV7sHma79ZvBdWfndwcfJvPH2ulKf8aVxxKfN8JUesjPSj/n
jJDJzNuE+SweAa1aqKAoK8ON3pnWPTzoPGjRoaaMItG8uSyTGfyshRbmQPT7gTkc
NAniEFGU47f1h4Y0EpkkkYoJ7jTwcqiPfFAo0jpqe4g1mcfmJZxc/byZNaJPkbmj
zamPyXn7hunRWG9RBbGrEMgMkFgBmfOTyAdLcEPCTazmKEVLKOp7786hFfPSD518
N2fn40l8ux+gqI4FcqnssyrM62ha56s+6QKLpOL+hPFy1MVU/jEmGVT/4m7EJMsL
tCxw17UR1oeFP/9f4Zb3CFK6urGoIQ==
=QEex
-----END PGP SIGNATURE-----

--7ByBE5CgLQp0KhHp--

