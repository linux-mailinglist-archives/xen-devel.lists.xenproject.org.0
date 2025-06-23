Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B16AE4CDB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 20:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022658.1398486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlvw-0001IH-8T; Mon, 23 Jun 2025 18:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022658.1398486; Mon, 23 Jun 2025 18:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTlvw-0001Fv-5h; Mon, 23 Jun 2025 18:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1022658;
 Mon, 23 Jun 2025 18:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVau=ZG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uTlvu-0001Fe-Bj
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 18:30:18 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2ea087-5060-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 20:30:16 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A999011400AE;
 Mon, 23 Jun 2025 14:30:14 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Mon, 23 Jun 2025 14:30:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 14:30:12 -0400 (EDT)
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
X-Inumbo-ID: 1b2ea087-5060-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750703414;
	 x=1750789814; bh=E3bRoNuZGOJy/HI43AZj5Rp3HQXU2s9gtOa4Vv+hssQ=; b=
	AKq6cFI1KwafdGStPjLxqePu9cCWqUeHdmK8YTAnMsQXdMnGsDWgp2xaiXEWUBIT
	AnNBWH42mcgzeexIQ72edFZ4b5j838FXL/DoirJVyJncM1tSAYTYhRK0a3um/551
	YtobB+bNUrMJ+nxVh6v0/z5tPIa5GiDs8pDBgxjg1qbXBiwdj/QUTSFfd+9sohwb
	NWWqJtlFHgrpEDfSGLZqgTI0mhoaHZwfGMNuMzFkeFpg+TLeSx57XLMb0931kArq
	iY0dMCeuYkGCMIeBWfSQqvQpp56RTWB+QUpBYzEVYUyHVe3Khpzn5iBobDnBssGA
	eajlDee2ylRZL+Mj3CNq0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750703414; x=1750789814; bh=E3bRoNuZGOJy/HI43AZj5Rp3HQXU2s9gtOa
	4Vv+hssQ=; b=PHR2Y8IG60NR95txhZSXAawBgVE5v2lDT10G28WMcrJ/szsk6Z5
	7IRXhOeyhcgZWNf2qHqKsrRyAJIhPkmdGNnfQvVgnl3FB1r01K1P4/JemypG7PA/
	ruD6ZWT0JLmzUmHJx7nq7NccHs8aXMZJuPSC9rGQrPE8NZwTlF2hxEUXflIz2x/Y
	+y+urYrCgfOnJ0yl0zMnSMg112fiuolssi1goQo3iS6rnOZAFycSoSkxifWEEmXZ
	wTQNsLPEEB9nAugidwT6L9flqWJoqe0MlNpGnFtGyPUuAWAYudDndSGruuJAba7/
	2GnSDwpIcJiLPWdV3N/SLqk6x5jtv6p8VeQ==
X-ME-Sender: <xms:NZ1ZaI39uEdPwzrf8Vqh_NgOcjHMGKe_XvLSKDt0QFSTgFQHmcdnaQ>
    <xme:NZ1ZaDG_gglYG9-PBXjM_x2VVP-d9Zmn74aK71j2_FuA6cEtsTJgaw0S3adc6_uYG
    xJpi81HepeqMQ>
X-ME-Received: <xmr:NZ1ZaA7G_Tr_ZONuIjWzw4_j7mUiEWyh3hKhzttLBDTKc3pLLcXiVxKUH-8SATr-0zIEwscv0Zv9LQeCiywhPhR2Kv37O8XaWXs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeguvghmihhosggvnhhouhhrsehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:NZ1ZaB1UyRtLRoK_I98iiV0ISHk33mWph4SVqP1cdizILlZkJ-zMlQ>
    <xmx:NZ1ZaLGiSqPOaH6RRgHwMp4ZVO_lobr5DA9_iAyRfhRjvDK9Ogs0qg>
    <xmx:NZ1ZaK_nBI97LQBJ2sl-suAyIlzXqJQX9FZxU7P-4m8jb56fAuacdg>
    <xmx:NZ1ZaAlxLxfc3rskctGqFs9ad2i_coj8znJjfVae01VQ3es8Y4fJOQ>
    <xmx:Np1ZaPi3kLYAOrD3EPc2ZQfUMRfaOTY-qMq-xt0BCm5JOJPemDi1tszh>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 23 Jun 2025 20:30:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 6/6] [DO NOT MERGE] CI: example how to use ssh to
 extract logs
Message-ID: <aFmdMtJQ9pBfMM18@mail-itl>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com>
 <9e10434c1e5ff6edb53b9efc65485247ad450f0c.1750686195.git-series.marmarek@invisiblethingslab.com>
 <c97105b9-9b9d-49a3-8529-4cdd5f85bf4d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MDfU9KBrhBB5OY8I"
Content-Disposition: inline
In-Reply-To: <c97105b9-9b9d-49a3-8529-4cdd5f85bf4d@gmail.com>


--MDfU9KBrhBB5OY8I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Jun 2025 20:30:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 6/6] [DO NOT MERGE] CI: example how to use ssh to
 extract logs

On Mon, Jun 23, 2025 at 02:28:47PM -0400, Demi Marie Obenour wrote:
> On 6/23/25 09:47, Marek Marczykowski-G=C3=B3recki wrote:
> > ---
> >  automation/scripts/qubes-x86-64.sh | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index cf040a29856b..944d0c6d383f 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -292,6 +292,8 @@ export TEST_LOG=3D"smoke.serial"
> >  export TEST_TIMEOUT=3D"$timeout"
> >  ./automation/scripts/console.exp | sed 's/\r\+$//'
> >  TEST_RESULT=3D$?
> > +ssh -o StrictHostKeyChecking=3Dno root@$SUT_ADDR xl dmesg || :
> > +ssh -o StrictHostKeyChecking=3Dno root@$SUT_ADDR dmesg || :
> > =20
> >  if [ -n "$retrieve_xml" ]; then
> >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
>=20
> StrictHostKeyChecking=3Dno is generally a bad idea.
> Is there a better option?

It doesn't matter here. It's simply more convenient than a netcat that
is used few lines below.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MDfU9KBrhBB5OY8I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhZnTIACgkQ24/THMrX
1yzFlQf/dDb641HgVU4oV3nHSDITRM+OfFvC/Up5L3QgaHyQAJkdkvIafcWjRFB/
i1ABKkgvNcJJRntVYNrxVZlm7mMqA2HvvuYmZfzhfVemWlRpskIuIzWQrtR1NiYz
onfTeol10CvCOa/1HaxTT5w/iJcyJKVO9SsupvS0dijF02Vr7IssVXOe/Dtd5dXB
sXghqYVeJkoFUuieKXxIdBYyDZutGl4jngWGXJ/mQTPTbjdgEwgkmB4wFA1xBn4V
PS0WuQrz09UmECDFtCGmaMiARfEeYEX3e4v2wMLwcss2Vv4tb7GWsU2+SLs5Cxv8
YOt07COGcMbYKrkT9tK2zYQh11rrfQ==
=YGTk
-----END PGP SIGNATURE-----

--MDfU9KBrhBB5OY8I--

