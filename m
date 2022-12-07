Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C3645247
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 03:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455783.713351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2kXi-0002Bv-Eu; Wed, 07 Dec 2022 02:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455783.713351; Wed, 07 Dec 2022 02:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2kXi-00029i-Ai; Wed, 07 Dec 2022 02:52:18 +0000
Received: by outflank-mailman (input) for mailman id 455783;
 Wed, 07 Dec 2022 02:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sV5z=4F=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2kXg-00029c-MJ
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 02:52:16 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26e7643d-75da-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 03:52:14 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 991D632002B6;
 Tue,  6 Dec 2022 21:52:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 06 Dec 2022 21:52:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 21:52:10 -0500 (EST)
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
X-Inumbo-ID: 26e7643d-75da-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670381531; x=
	1670467931; bh=JIgRaLMR8BHLP5UMHKuKoI+i17RA3kmh8+27In+GQg4=; b=c
	FJlkWnDCtCfqTjdqKejfm3xF8wvttXvknvkJ3AawekoecQ+B23FJL3j+cT99L51w
	EXfHvsjEdq8Z9YAyF0t9c41K6tqrRyDhe1WSlUkp7FtSQqjdgMdAxXqIUwngc/nG
	JA0iUBS2BvGHuuI7RpX+9STeZ82h7VwnTBtrtvbXEE/JDp5Ec+NmLYQoUUOJnEl6
	VQ3nHvSnfnuaetxMuOFKyXBGbSk2M9ONyfRCTbOPpTWijdgJ7AJpp1d4sHMcMJaV
	xXU/LLCv4qBBywWFpLqdNi+riLZWs6gBC4VjgrHNLFROS1CZxhIBRKE8zSHQqbdY
	B3m5Ui0o3tIYrdcqlAw0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670381531; x=1670467931; bh=JIgRaLMR8BHLP5UMHKuKoI+i17RA
	3kmh8+27In+GQg4=; b=qp2CZXgxGGHUK0HiwJi/XghBkwR6UvHOTdwBzRAcFFQ/
	BzoMFgJ00dsvOeEaTOjP2G7KO/SOD2luGOigGDyhXi4FtVGjdGNrAE/Ra55zPB1N
	RvzombF0OBqpofkhZJd5bQSu5Zb3fW38WhpnGYFEQGNMLJhmNDWTKm3zAtEuXmVP
	2zMqdZJeSojmWx2nILd13Xk7w4ZsodRqN+iuiheyio12rXGM2uL1+oc2NRG3dCZX
	Ykx6eN/AxHm4P1LMlRiGDnrN//C7CMScJKDlGGE45MDdnqaixTGRlM/x1YdfNaNs
	SzQxpELescbGW1HCv2mNnxcylntGnYajIic/Na507g==
X-ME-Sender: <xms:2v-PY_4TA-T71MDhCZsJrv-w9BNUnaBoXyDBjJuY6m1P6x3Ina-aFQ>
    <xme:2v-PY07TY9OziYJYCkXuNGEoH-VQ8tK2xURxDlJn-2Qr-aAS1VXX5y_apA4reO6ig
    rqk2_8-56-sd_I>
X-ME-Received: <xmr:2v-PY2dkoRhncls5zNRD7ELeIRUWV-yrkeNVPLIGbnJO6GoET1vOhD_uAaKT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvuedtgefhffffvdegtedtkedthfdu
    ffdtudeigeeugfejieekueffueekgfevgeenucffohhmrghinhepgigvnhhprhhojhgvtg
    htrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:2v-PYwK2w6L2M2MjNdpXwranm6TS2HHSD13xkx4-XwWA8OYk7EY3Yw>
    <xmx:2v-PYzIP9uSxHqGuz1V-fyuAk2rp_JzFE7PpwgrI2b_s4CZ7QSLLvQ>
    <xmx:2v-PY5wAam39yeGOH5JYpNovA2s2pqm8CkIjIMCSjCH15RLtPSmKXQ>
    <xmx:2_-PY71dP9GNfFISs0Zv5TukamtKrNGvdhjlqtEkknoalUudB7eD2w>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 21:52:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Y4//2IuCg2qeN87B@itl-email>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
 <AS8PR08MB7991DA43144C61A4B5D50DF7921A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVW3wVBPc995n+yT"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB7991DA43144C61A4B5D50DF7921A9@AS8PR08MB7991.eurprd08.prod.outlook.com>


--EVW3wVBPc995n+yT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 21:52:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT

On Wed, Dec 07, 2022 at 02:44:11AM +0000, Henry Wang wrote:
> Hi Demi,
>=20
> (+Julien for his info since I am replying below about the 4.17 stuff)
>=20
> > -----Original Message-----
> > From: Demi Marie Obenour <demi@invisiblethingslab.com>
> > Subject: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
> >=20
> > A previous patch tried to get Linux to use the ESRT under Xen if it is
> > in memory of type EfiRuntimeServicesData.  However, this turns out to be
> > a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> > winds up fragmenting both the EFI page tables and the direct map, and
> > that EfiACPIReclaimMemory is a much better choice for this purpose.
> >=20
> > Link: https://lists.xenproject.org/archives/html/xen-devel/2022-
> > 09/msg01365.html
> > Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> > Should this be included in 4.17?  It is a bug fix for a feature new to
> > 4.17, so I suspect yes, but it is ultimately up to Henry Wang.
>=20
> I am planning to start the process of tagging the 4.17 so we can catch the
> release date next Monday before the holiday season in Europe.

> That said, if the EFI maintainer (Jan) is happy about including this in 4=
=2E17,
> I don't object it if this patch can land in the stable-4.17 branch before=
 the
> end of Thursday (Dec. 8). Note that OSSTest probably needs ~1 day to do t=
he
> sync from the staging-4.17 branch.

That=E2=80=99s fine, thanks!
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EVW3wVBPc995n+yT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOP/9gACgkQsoi1X/+c
IsE5vhAAwtDXHFGGSGPf1AC8RIm5tSWJ4cZELkcSr9JvIvpYA8l0RzZ+Wue+YEVj
GkjR+WKneipzxzpUs+ga+46JvgAQw0+i6P20v0ay048sQxiIpWtEhphj7E1G8uoF
/qWCQa+bVSZjosYicIjIRcIDB9B11H9huVA/rWriT1DRiLPwBPUwTQLixz3Zx2fe
UndEHfMbWH+COaJIuc7VRqYMcMaLaiz9k/+Ob5GRULdCCikUbz4lztpIQw/liH6z
50GTKz1I3w05oKJPwQLlvo9jazNgIRCvLwQcKoPgoOxZQfei2pWJ2KW4inyptmo+
8ZwYQL25PHyp5zi6RUqWC6njzUhXxFMvNSR9TVUfvI4Qoqw3apabcbnB8WhPkPoF
1hUOdSHUg1dBjZa4ziztGVQyfpIpdZZjITozO8AR1pXZlxH8+XOpPQGKhNkhd3XW
jSpZo+APNb4k+zVeF/XY7wxKl3mn5SZz8C/7iy0YfMrWQD4S7jM0Xd+/B6OwHN/k
+DPlyeH/VW1XNa8wGX1ntyP9g36RVWoNEBPZxmUKCvasOqgpu+JbXIskIBmqAdhd
HejaLDntKjs3pKkPyg+feWb4OdNbg24pihkB/Arsc2fORUEMxNjtuLYpDcWY/jno
AhNFLwc0mpmuw5Z/GCNRZvf+R9dkoVH4yspWSrrg8JMZvj03WMk=
=IfK+
-----END PGP SIGNATURE-----

--EVW3wVBPc995n+yT--

