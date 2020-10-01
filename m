Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65D27F715
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 03:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981.3318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNn9P-0004hb-Hz; Thu, 01 Oct 2020 01:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981.3318; Thu, 01 Oct 2020 01:12:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNn9P-0004hF-Ea; Thu, 01 Oct 2020 01:12:51 +0000
Received: by outflank-mailman (input) for mailman id 981;
 Thu, 01 Oct 2020 01:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kNn9N-0004h9-Ne
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 01:12:50 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6835e8ae-ca98-47e5-b8bd-b803a0fd0424;
 Thu, 01 Oct 2020 01:12:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B82E15C0193;
 Wed, 30 Sep 2020 21:12:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 30 Sep 2020 21:12:48 -0400
Received: from mail-itl (unknown [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id A32673280059;
 Wed, 30 Sep 2020 21:12:47 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kNn9N-0004h9-Ne
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 01:12:50 +0000
X-Inumbo-ID: 6835e8ae-ca98-47e5-b8bd-b803a0fd0424
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6835e8ae-ca98-47e5-b8bd-b803a0fd0424;
	Thu, 01 Oct 2020 01:12:48 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id B82E15C0193;
	Wed, 30 Sep 2020 21:12:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 30 Sep 2020 21:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=guF5N7HBSXLVEMnupTPI2tYk4lCVe
	rMDQ/jjNCH/my8=; b=Zb1wxXZ9ulR+/fg3dOVzIsgX6blqBiyYxHWtnUirGBFmw
	PUByTS75W+kcPePv7oVMHfO9MDSjhNydQh1tNB1DXvTgbWzIWwNPimrC5RU/THuq
	rgQ0YJUtM2/X/NPNSzkpUsNZPdGoFf6g2NOckPd3UNStrPqUbysZhiMeQZmFj+4T
	izOExNbz64e16QV8DhGCn9jOmPNJMOJfWu0CJg8s9LlGYOiA/zD5s4cmqdy6rVDO
	aIeeTa5qCqTkiNHOI63OEOKr6RXQu6iS6Pp20am/FqqgWuHPu9fjlD/zh2bpxai9
	sBUVoR6UYNH7zxEgMoirUQeWwQLUba/49rlkSgPGw==
X-ME-Sender: <xms:EC11X2Q-UuhWa8V40tDU56TYtMpJzT4qoQ2K4egIaaSC-MyW8HSbww>
    <xme:EC11X7yEOFPwCbtZMsa3NaCIAK_PK0bhkuLqSwlcQQIX07DlJm3rLZJZaD6OGn6KN
    sUvjNhBzZTfbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfetudev
    udeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecukfhppeeluddrie
    egrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hm
X-ME-Proxy: <xmx:EC11Xz3EAZPYB5_IVFmDSNTRybt0MmIjvjzDKgI2CX2X46Q7LS6K0A>
    <xmx:EC11XyDILkGVLRWwWTlj08ya17LbCdfyZqZM4-_WkmkaoxdnKyTwcw>
    <xmx:EC11X_i5e0J4gxGOKPMIr9cXHEKBZiNGmCch63D8SrFAdfX6grfVLQ>
    <xmx:EC11X6uRHrSaf7f9qNzcM6YKDvx1vww4f28jfXiFGK5ILU7Nxf9Mqw>
Received: from mail-itl (unknown [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id A32673280059;
	Wed, 30 Sep 2020 21:12:47 -0400 (EDT)
Date: Thu, 1 Oct 2020 03:12:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Yet another S3 issue in Xen 4.14
Message-ID: <20201001011245.GL3962@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t5C3/nrmPumNj5sH"
Content-Disposition: inline


--t5C3/nrmPumNj5sH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Yet another S3 issue in Xen 4.14

Hi,

After patching the previous issue ("x86/S3: Fix Shadow Stack resume
path") I still encounter issues resume from S3.
Since I had it working on Xen 4.13 on this particular hardware (Thinkpad
P52), I bisected it and got this:

commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Wed Dec 11 20:59:19 2019 +0000

    x86/S3: Drop {save,restore}_rest_processor_state() completely
   =20
    There is no need to save/restore FS/GS/XCR0 state.  It will be handled
    suitably on the context switch away from the idle.
   =20
    The CR4 restoration in restore_rest_processor_state() was actually figh=
ting
    later code in enter_state() which tried to keep CR4.MCE clear until eve=
rything
    was set up.  Delete the intermediate restoration, and defer final resto=
ration
    until after MCE is reconfigured.
   =20
    Restoring PAT can be done earlier, and ideally before paging is enabled=
=2E  By
    moving it into the trampoline during the setup for 64bit, the call can =
be
    dropped from cpu_init().  The EFI path boot path doesn't disable paging=
, so
    make the adjustment when switching onto Xen's pagetables.
   =20
    The only remaing piece of restoration is load_system_tables(), so suspe=
nd.c
    can be deleted in its entirety.
   =20
    Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
    Reviewed-by: Jan Beulich <jbeulich@suse.com>

Parent of this commit suspends and resumes just fine. With this commit
applied, it (I think) it panics, at least I get reboot after 5s. Sadly, I
don't have serial console there.

I tried also master and stable-4.14 with this commit reverted (and also
the other fix applied), but it doesn't work. In this case I get a hang on
resume (power led still flashing, but fan woke up). There are probably
some other dependencies.

Any idea?

PS This is different than "Xen crash after S3 suspend - Xen 4.13"
thread, as this one broke with 4.13 -> 4.14 update.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--t5C3/nrmPumNj5sH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl91LQwACgkQ24/THMrX
1yyPHQf+KtQAHIHZmQw6/Pz7aQCdVQl7Y9JCjWjdoPCRBake7bYAXTtD75zEjCCJ
EUE4uysnItG6thJYXYjiWSSqEdoGkP+v0DfDoMQtd0l+gGIMtStCgq34V9zrWn4I
MS9wUI8wm+fTE803P5JtwiFZg27N2dZDGib5dfgzOWlbByg+VndriVeWo230rxZL
1gMbvZuBDLwJ62YnwLWq1smkY5y0WzT/Nby10TjQgw2Yd4qxbCAMTW6H6QGP+U3i
nWhPYdokM5JLm49TfQtUBvuSr7vBRY8XI398wxaXjeVlNqFQ+2RPkWCrl/ONVp+Y
lS9KqWCJu7Hav3sdSLYMaG9sfOt4BQ==
=IW0k
-----END PGP SIGNATURE-----

--t5C3/nrmPumNj5sH--

