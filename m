Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7166ACC761
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004413.1384121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMROv-0008D5-14; Tue, 03 Jun 2025 13:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004413.1384121; Tue, 03 Jun 2025 13:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMROu-0008Aq-Ub; Tue, 03 Jun 2025 13:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1004413;
 Tue, 03 Jun 2025 13:09:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMROt-0008Ae-9U
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:09:55 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 098fc0f8-407c-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:09:53 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 432BA1140181;
 Tue,  3 Jun 2025 09:09:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 03 Jun 2025 09:09:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 09:09:51 -0400 (EDT)
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
X-Inumbo-ID: 098fc0f8-407c-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748956192;
	 x=1749042592; bh=+58UHdLqAT2Wlb0AI7vyz1T675DG2Tu3VLsBD8GaoY8=; b=
	XLaSkVBFvRGLiWVxft9aC944LoRbW45iSxfuaVpBNeTZ/G0xjgnWv6ywRvj2QZTB
	XodZpaSNKjndn/t2Odgx6B28xowh9h3U7PeL6btiZ8LGY85ZoLO1dK0V+bTo7Wgs
	R2pG+3AzeqHKSi/ICmTOk9dLqZxNTrH0R4hArownohxo8dWQpj6D8uJuXZ5xJRuQ
	Xcq6xRd4qX4oxHIWf6KYpmCV2NdTuNe3BCZGKwq5uSvPLVbtpWNsmBB3txpp4IRS
	vMMIhLDLqjdE4fgshwpzRKQpFtz0mGAvtm2FICotWsGFFhF0PchA8Xaz6CoyTIbd
	bT9wZhM7BZarL+fMdrp2EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748956192; x=1749042592; bh=+58UHdLqAT2Wlb0AI7vyz1T675DG2Tu3VLs
	BD8GaoY8=; b=hSN8jUgaPzga/rQql9/9EyQ/gy0NDZlb+6jpNN+OjdQElVPO6+t
	PCmA0lGa6Q22X05ghk5nnWVJByO9rZAbemZgGH0+6O+3qyfhB1tDmmBdDwGun4KE
	Tzady2pYOvdBitoetoJrEKL3QgTSPrJ8KyXY6UcRWtGtglriE+MPuMxjloZzE+dE
	r6/Px2sPdMbthbBZ898PAML81ImqjRwrK/GDsLzeTYhySwmAFCr/FZAHwlOX1Iai
	h0OUsbeaScR0h8DJbiuswhPY9QdEgGK36jwFPAKXBord1zGB2WTW4crKrWYoYhOp
	rkJwulnyZuev/fbddYoy6RKtefIJ1fN3oRA==
X-ME-Sender: <xms:H_Q-aGuMFuvyUm2-XJs6gXXEMFW2mDEoG0dzHryv8-z72CH2pX7o3g>
    <xme:H_Q-aLcHXN8yThsa8vNvggOGJNOQpxyG2SDMEe0-R-ph4Mm0qtLiNqeopTLD29Ib4
    UDxcEj_bIQYmA>
X-ME-Received: <xmr:H_Q-aBwLMo93XvY1obaAHOhf5ZyF2o_XQJg0wTQa8TxMrxYdUN_8D19w2qQD9YLvZ1Toi4GGUUe0UqKM2c_G0_uIAt1goH_2kb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhl
    ihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprhhoshhsrdhlrghgvghrfigr
    lhhlsegtihhtrhhigidrtghomhdprhgtphhtthhopehkvghvihhnrdhlrghmphhishestg
    hlohhuugdrtghomh
X-ME-Proxy: <xmx:H_Q-aBNP_bgpySq_YsKh0_wax_ctY66YK95jeDvTLNaDtw9nwK_3-w>
    <xmx:H_Q-aG-BrfTAr-KG1RVLG0YrP31RCi3XZoiPOiGt6tV-saRB2VxC-A>
    <xmx:H_Q-aJVyZCXwIYo0Brpg1G1-T6tpRnn6mUsnNGmr6BRa_zX3YeULpg>
    <xmx:H_Q-aPc4sHRtjPVJTuxpHLIwleNJm0f99WZYNBrIrNH2GIMjF8Ra6Q>
    <xmx:IPQ-aKX9LDqHEbi2djASnfWmyAs7ozk-iJYg56S0KZAMYruJMbxh8UO->
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 15:09:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled
Message-ID: <aD70HTOiY1FDJjla@mail-itl>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-4-kevin.lampis@cloud.com>
 <aD2ySVoaV2RydE-L@mail-itl>
 <c6ad5c25-d5e3-4278-8e5d-1cd593e50c6a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OYPP6qUbWlcHD4Zh"
Content-Disposition: inline
In-Reply-To: <c6ad5c25-d5e3-4278-8e5d-1cd593e50c6a@suse.com>


--OYPP6qUbWlcHD4Zh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 15:09:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH v2 3/3] Disallow most command-line options when lockdown
 mode is enabled

On Mon, Jun 02, 2025 at 04:22:06PM +0200, Jan Beulich wrote:
> On 02.06.2025 16:16, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jun 02, 2025 at 02:46:56PM +0100, Kevin Lampis wrote:
> >> --- a/xen/common/lockdown.c
> >> +++ b/xen/common/lockdown.c
> >> @@ -35,7 +35,7 @@ static int __init parse_lockdown_opt(const char *s)
> >> =20
> >>      return 0;
> >>  }
> >> -custom_param("lockdown", parse_lockdown_opt);
> >> +custom_secure_param("lockdown", parse_lockdown_opt);
> >=20
> > Is that really a good idea? It means `lockdown=3Dyes lockdown=3Dno` wou=
ld
> > still disable it in the end. This may matter more if for example the
> > `lockdown=3Dyes` part is in the built-in cmdline (possibly with other
> > integrity protection than UEFI SB).
>=20
> But having a way to override an earlier "lockdown" by "lockdown=3Dno" is
> intended? E.g. when your xen.cfg has the former, but you don't really
> want that (for, say, an experiment).

Ok, I guess those are conflicting use cases: using "lockdown" option to
restrict what user can set via bootloader menu (even without
secureboot), vs giving the local user full control (developer case). But
in that latter case, maybe you can simply remove the "lockdown" option
instead of adding "lockdown=3Dno" (granted, more work with xen.cfg or
built-in cmdline...) ?=20

Anyway, what really matters here is the behavior for UEFI SecureBoot,
and this one is okay. The behavior outside of SB is secondary, and if
that's the intention, I'm okay with the current version too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OYPP6qUbWlcHD4Zh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg+9B0ACgkQ24/THMrX
1yympQf9FX/FIlmCa1fgmKxqcikietoQqwWCHv45Wm1G4L+B1bY9BpfWHiaGk9ls
cVxIl5z0DBH7PGmY28Z2gSVL2rLZrFpCNcdPYnwiGfOuxb72+Pr2jkh/jPDb68d0
dJlUO9yt95mH+4lXRi9SxDAhMki+XhdQvbMGslKg4JspeF4X82u4xBJKoXJOMqo8
OaRmybqO8ZiDoXMtuY4nCZNg8mOa1Un6gvzjKv7JkFb8Thw0ry7dmBRnOyVhp85x
K0P5TqkgNG1eX+ig1AzC1O08rFj5Hk4EDAWm3XCvpe+LfSsDwg3t42SMtWgRTwZp
wH3o38Fa9Ogs0h1LudpmdOq/40HE8Q==
=KGYd
-----END PGP SIGNATURE-----

--OYPP6qUbWlcHD4Zh--

