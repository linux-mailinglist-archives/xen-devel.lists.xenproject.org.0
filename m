Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2A5BD695
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 23:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408992.651822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaOW2-0002dZ-7f; Mon, 19 Sep 2022 21:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408992.651822; Mon, 19 Sep 2022 21:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaOW2-0002bV-4B; Mon, 19 Sep 2022 21:41:22 +0000
Received: by outflank-mailman (input) for mailman id 408992;
 Mon, 19 Sep 2022 21:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VIdv=ZW=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oaOW0-0002bP-DZ
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 21:41:20 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca7769d1-3863-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 23:41:18 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6A0453200344;
 Mon, 19 Sep 2022 17:41:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Sep 2022 17:41:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 17:41:14 -0400 (EDT)
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
X-Inumbo-ID: ca7769d1-3863-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663623674; x=
	1663710074; bh=jxWV4dOsyu+3ryQjpZlY6LkzMcupG8P/PjnrR48KzuY=; b=f
	LAeN9703nShbmPg1TjvHQIv53lVcCoR0R7E1NYQAmYMp73uWORkpr0FQTvwuqPiy
	9oiBCZe1xkJj56kVXtWp5UqzBednGKBzDiQdBL8wzz4++//aFiW7T1dR6osuHXla
	Pgk2LRSIZ4/yh8eZ1/MaU4mQV4XsMOPNGMdY29eIBkeyIxBeAcuqGYV/1YH9FWih
	83xu1bW33f2roFzNBUvqfdurXqbJCzsBLh3vENzdCYTYBVPD0uvajbBmv96bnpYQ
	qaXFUupQVJaiLoEhMNxQPdu/+ohpCUHYWo6P0CbXM/306uhlPZP9VIOX9cCBEMTt
	G0OD4rtcea9vb8xyu3gUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663623674; x=1663710074; bh=jxWV4dOsyu+3ryQjpZlY6LkzMcup
	G8P/PjnrR48KzuY=; b=RTlFKHngI/6dbbfCx0myS2/BZgKuPxor/kUBYhNRqw4S
	MxqoSfQQuxZmlJmQ8Xp4Yg7C+m0UQz0w6KJtiQtQrp/hlnZvwyx6XcXToVsYFzP0
	KtxNt7nyDwop9gF85AFApsjWywULOuvnrR86sIc9fHwfy2b6hNk55MQxBjnY9u86
	lCBR+Tz02qXDDNqX1SVliTGGaDnDefO0Zishc+KM2uFPSvH2/gQoXs2CNOO7TEnE
	MaTupORFNSxLX++KJW8mDKzVJiVfdokYucufcVZlfxe9aVxcqMIr+f3UOcgg3SSh
	zmrSneKUaOQ9dm9L2H90JzP/OW6EEbu+Jf37TyOO+g==
X-ME-Sender: <xms:-uEoY6dZKWMg57p3cRmQmj-0Fkyi1LOnu3GUq1InHG6McE2xvhPDzQ>
    <xme:-uEoY0NSER_eD9ur7Y05nkS9IAu6Q0G13wj8rnbFxFVDaonQ60e3lPxn71-x8aYdd
    YyYbxXPWF6bgjw>
X-ME-Received: <xmr:-uEoY7iQbLHoyVrs0ATFVgiRlv8zf4IF4bvBlPt0Hi8Vg23A08mI4vdkJcR6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvkedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudeileefueetvdelheeuteffjeeg
    jeegffekleevueelueekjeejudffteejkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:-uEoY39awlM7ug1V9trUWWo4fa2ZEk03JEQgsCcSGUCMkmNN8uDfyw>
    <xmx:-uEoY2tmZhL45riX2Ar-YSplRGGZ-RJ_f2o0soCoCWHY-Po2fyQPtA>
    <xmx:-uEoY-FZKIta5-IDxKiBQzma0yMWJTUVV3OpqykzRipwK7telMAbEA>
    <xmx:-uEoY80MxqdGspBexWpeyqNA6SueoTiRT5CqFEu2ESNkwGjbLipcNA>
Feedback-ID: iac594737:Fastmail
Date: Mon, 19 Sep 2022 17:41:05 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	netdev@vger.kernel.org
Subject: Re: Layer 3 (point-to-point) netfront and netback drivers
Message-ID: <Yyjh+EfCbiAI4vqi@itl-email>
References: <YycSD/wJ9pL0VsFD@itl-email>
 <YyjVQxmIujBMzME3@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0kr/1729fBpPed0"
Content-Disposition: inline
In-Reply-To: <YyjVQxmIujBMzME3@mattapan.m5p.com>


--T0kr/1729fBpPed0
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Sep 2022 17:41:05 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	netdev@vger.kernel.org
Subject: Re: Layer 3 (point-to-point) netfront and netback drivers

On Mon, Sep 19, 2022 at 01:46:59PM -0700, Elliott Mitchell wrote:
> On Sun, Sep 18, 2022 at 08:41:25AM -0400, Demi Marie Obenour wrote:
> > How difficult would it be to provide layer 3 (point-to-point) versions
> > of the existing netfront and netback drivers?  Ideally, these would
> > share almost all of the code with the existing drivers, with the only
> > difference being how they are registered with the kernel.  Advantages
> > compared to the existing drivers include less attack surface (since the
> > peer is no longer network-adjacent), slightly better performance, and no
> > need for ARP or NDP traffic.
>=20
> I've actually been wondering about a similar idea.  How about breaking
> the entire network stack off and placing /that/ in a separate VM?

This is going to be very hard to do without awesome but difficult
changes to applications.  Switching to layer 3 links is a much smaller
change that should be transparent to applications.

> One use for this is a VM could be constrained to *exclusively* have
> network access via Tor.  This would allow a better hidden service as it
> would have no network topology knowledge.

That is great in theory, but in practice programs will expect to use
network protocols to connect to Tor.  Whonix already implements this
with the current Xen netfront/netback.

> The other use is network cards which are increasingly able to handle more
> of the network stack.  The Linux network team have been resistant to
> allowing more offloading, so perhaps it is time to break *everything*
> off.

Do you have any particular examples?  The only one I can think of is
that Linux is not okay with TCP offload engines.

> I'm unsure the benefits would justify the effort, but I keep thinking of
> this as the solution to some interesting issues.  Filtering becomes more
> interesting, but BPF could work across VMs.

Classic BPF perhaps, but eBPF's attack surface is far too large for this
to be viable.  Unprivileged eBPF is already disabled by default.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--T0kr/1729fBpPed0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMo4fgACgkQsoi1X/+c
IsFzmA/9E0X+XvseW+IwtUzRhlUyXUex7IusyCAld76yiXh0XdPlKLUAXv3ue2Ef
zAR7ewfTwbLQ/cJWFUjxOM6fIiCsexW5HAQ8/DACmvHATzGaBBsxBTVs0TKCveM5
Hn5nep8rQKW5vtQ/e5d0+y6Cwqt3Ya5H40YuitSDtjoUieKSYQoKMS4FPdM8MQWI
sc7YPR57G3isR9Hb2+B9lmUFxj0Nq5T0esnfA7Uk3Lw102eJHFiTigqjPI3YTeBL
EdcBEs5q/Rt8q0uDn3Rn4DuMZpxHyo3QxQXb5bgwpqLOerhEdg9UmAOAYK5fPUB1
IS8B+CvPEc/mb2y8QoVA9fvJxrCInfnA9DnvYpfFBAOxkNNB2DZuj202Lsd/R7MA
oV1BrW7Zpr6LQ5hMRSlu2TrMnqnPHYUcbzCiu7Pxkvqw++RlG21slnwBg7CZ6MLl
5GTdbhfXRnLSr7X+1oG4OqU6+LVtffAAE5FpGMopKVxANkrE+9dxzezPQWWOE+C/
xjrA83kHNzJJqGaa862kP8kYo0AHvOBf62QeV5pZZ7zk3g/qRdQ5u1qvVjXz8ULj
sTXYQWPlwCwQjtJrJQGm53fuOeTRmxGYOiTaRoreLq/xc/TvbgFaZuEe/UCHLnVd
xQjhv7kGJTPfz8RtwqaiLZlmPf/PfmLuGPN8d/ZUHGIGQeQaKzY=
=3tWA
-----END PGP SIGNATURE-----

--T0kr/1729fBpPed0--

