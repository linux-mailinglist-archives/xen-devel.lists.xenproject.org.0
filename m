Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEC5A4ABC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 13:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394559.634008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSdGy-0003xD-37; Mon, 29 Aug 2022 11:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394559.634008; Mon, 29 Aug 2022 11:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSdGx-0003uw-W1; Mon, 29 Aug 2022 11:49:43 +0000
Received: by outflank-mailman (input) for mailman id 394559;
 Mon, 29 Aug 2022 11:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jfEz=ZB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oSdGv-0003uq-Sw
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 11:49:42 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a234d61e-2790-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 13:49:29 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 38A21320090E;
 Mon, 29 Aug 2022 07:49:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 07:49:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 07:49:33 -0400 (EDT)
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
X-Inumbo-ID: a234d61e-2790-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661773774; x=
	1661860174; bh=U/uob7iU2hOzYXSI0amtU7Bp2yzydRs/gqo5JfyxbI0=; b=L
	gNGGLwOVZ13TaQWHEEfmGHGeLBHczx3DX5pkPcDhtWFP4Qn3ZkNtSn5y4AHA6xZr
	jXziL/2JqFd0Q13I0HMoTW1u2Glk/LkIHomPb/iuBRX7NS6FbUDmlEIgWMktRuOO
	D2ZZB8tzEJUA0x+AY6l5I+88noLBuc2TmrOq4w5u68DL/8yHLVM9ZMnjX597TZme
	iqDsibW2O4xLqnydRdkxodmAlaiRzespahfjBbJ/otvpF63q2NXuWfQKtpOtmBl6
	yJJtju+U5woJOBZpsHO/D25a4lcedKb5jxiF5lcdh0wjQ0tBiZScdsiba5sPoHTD
	p6hgF1cpBshj/5Ily99Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661773774; x=1661860174; bh=U/uob7iU2hOzYXSI0amtU7Bp2yzy
	dRs/gqo5JfyxbI0=; b=05N1vpds6wxryFcN0ZxS62eblRcGFip5BgX/3KUQCE7+
	xzIOf0xA5iOhn6ZY+N7xLbE4BoWviflVEYh/pxxo2BmEyGmXGA1p9/uCfyBseGSQ
	V1YzVRQUH7giBj/6VLGpXpzSGAuV8Cz2WBYgL/JWGZocrMGKtxVPMiIR5j6rozID
	vfrdtv1q08/nu0AddpJ77iPXZJiWJukaVKOdKqhLP6ilChLtKIPXiJL4EgnIJ6Fy
	ZjWhrSZDpfHIoVU1vkGNET6Q4w5ylsaP5Oaw3Z4wKgh9i6MbFmft7JhFD30xbh5r
	tz0oDxpnz/TNLYPSpfEAcg++9uhmLXN6pkVsbGxyVA==
X-ME-Sender: <xms:zqcMY34K77EfbSXe7lvukYXGA5wT3Ka4Ws8qRgfcJwsi7utyZknKdQ>
    <xme:zqcMY87HUr6kdFElLnvcxbnrNix-6caIuTbu08lTn2plS9UcN7Zrhqgqyz3bP7Rm4
    savA-6yKHSXxg>
X-ME-Received: <xmr:zqcMY-d-CjbGchBPx26na95RT1GnVYFUwRDT6knEA3jObwBlA8QKaz55AkqWMWS6tAFqHh-vAq1huEuNLmzdP4_6zaKW5Xmre3ie>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:zqcMY4L-UgQ9vJ3XXsSeOQ63jL7Q1hnse3lLjFr7rqHDkYnt9ayu4A>
    <xmx:zqcMY7LtGgAultWmIIH0x9sKrpo8UlRghfYhOp6b0iTBRnvRfSXo5w>
    <xmx:zqcMYxy9AzoN5bpFMkZ2x-sY-4P1saOiQgDFumf-1Qws711Kbh8muQ>
    <xmx:zqcMY4FpqAHCB6jwjD7iKJRbiMKUxsokkEaO0Va8_1qkAnJg-jpd4w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 29 Aug 2022 13:49:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Message-ID: <Ywynyj1/cbL40sBv@mail-itl>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
 <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com>
 <YwiygukKUUqiAke9@mail-itl>
 <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5ZrJ+/J9I9mWOfuh"
Content-Disposition: inline
In-Reply-To: <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>


--5ZrJ+/J9I9mWOfuh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Aug 2022 13:49:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option

On Fri, Aug 26, 2022 at 04:20:52PM +0200, Jan Beulich wrote:
> On 26.08.2022 13:46, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Aug 25, 2022 at 05:44:54PM +0200, Jan Beulich wrote:
> >> On 22.08.2022 17:27, Marek Marczykowski-G=C3=B3recki wrote:
> >>> This allows configuring EHCI and XHCI consoles separately,
> >>> simultaneously.
> >>>
> >>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> But was I maybe confused, and much less of a change would suffice? Aft=
er
> >> all ...
> >>
> >>> --- a/xen/drivers/char/xhci-dbc.c
> >>> +++ b/xen/drivers/char/xhci-dbc.c
> >>> @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
> >>>  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
> >>>  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> >>> =20
> >>> -static char __initdata opt_dbgp[30];
> >>> +static char __initdata opt_dbc[30];
> >>> =20
> >>> -string_param("dbgp", opt_dbgp);
> >>> +string_param("dbc", opt_dbc);
> >>> =20
> >>>  void __init xhci_dbc_uart_init(void)
> >>>  {
> >>> @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
> >>>      struct dbc *dbc =3D &uart->dbc;
> >>>      const char *e;
> >>> =20
> >>> -    if ( strncmp(opt_dbgp, "xhci", 4) )
> >>> +    if ( strncmp(opt_dbc, "xhci", 4) )
> >>>          return;
> >>
> >> ... this already avoids mixing up who's going to parse what. So right
> >> now I think that ...
> >>
> >>> @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
> >>>      dbc->dbc_str =3D str_buf;
> >>> =20
> >>>      if ( dbc_open(dbc) )
> >>> -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uar=
t);
> >>> +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart=
);
> >>>  }
> >>
> >> ... this and other SERHND_* related changes are enough, and there's no
> >> need for a separate "dbc=3D" option.
> >=20
> > But then you wouldn't be able to configure "dbgp=3Dehci dbgp=3Dxhci" as
> > one would override the other, no?
>=20
> Not as long as both use string_param(), true. They'd need to both become
> custom_param(), doing at least some basic parsing right away.
>=20
> But using two such options at the same time isn't of interest anyway
> without your multiple-serial-consoles change, so possibly not of
> immediate need (unless someone comes forward expressing interest and
> actually approving that change of yours).

Then why change at all? Since you can configure only one (dbgp=3Dehci _or_
dbgp=3Dxhci), then there is not ambiguity what "console=3Ddbgp" means.
Separating SERHND_DBC from SERHND_DBGP would IMO make sense only if you
can actually use them both (even if not both for console, but for
example one for debugger).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5ZrJ+/J9I9mWOfuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMMp8kACgkQ24/THMrX
1yz44gf/a4iectb57XNXhqGMeNQIpZFY5gUrFbz1P9z661OuJHn8JDqoFFot81dU
fuqb6NCu5F+XaQQao6ukZ9/FicmpP6LM33P+/FqmVhva/rmZydCWYCskutKtnslk
jVFbu0drbDqV8ZNtB/nFrNpIHihNsEy9UYVc5eGpUVsSe2NagHS8uT+OXsy/YM34
KJJ7CxG7cnnwUZfvdMIihImUT9o7ztYyBb/5e2K/jd11zjjrOpfbQ9W+OXD2PFdJ
qLSIgFwG1fm2MPdvVt6d2MHSnnAgSnvGPmGbBCC4wgpiUWZDb0CIlVajWUV2oOVl
1VHiay5cWo/hQsS9rBUtQy+6lEZrVg==
=ieDx
-----END PGP SIGNATURE-----

--5ZrJ+/J9I9mWOfuh--

