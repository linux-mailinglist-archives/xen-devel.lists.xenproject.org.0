Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ED55A4ACE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 13:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394566.634018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSdOC-0005Ol-Rc; Mon, 29 Aug 2022 11:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394566.634018; Mon, 29 Aug 2022 11:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSdOC-0005M2-P0; Mon, 29 Aug 2022 11:57:12 +0000
Received: by outflank-mailman (input) for mailman id 394566;
 Mon, 29 Aug 2022 11:57:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jfEz=ZB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oSdOB-0005Lw-Ea
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 11:57:11 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c477df-2791-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 13:57:10 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 945003200344;
 Mon, 29 Aug 2022 07:57:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 29 Aug 2022 07:57:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 07:57:05 -0400 (EDT)
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
X-Inumbo-ID: b5c477df-2791-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661774227; x=
	1661860627; bh=YSRE9yOM/Z5VHOxCWxUiS2GZJiWPPT/Z4e8ykuOIjww=; b=A
	+mS/CjhfHTeC0Q/IZ1g/zSVOQs0SC6mGfj2mtl1m82WgoV2D0jKErOpzuvK5kyX7
	XZzbsix5FGHjtr/LSTvOK/ZzCKQtqSFxTDescODmNSNK9m4HoRAaap/YwUXyAKD7
	4DUfkgV/5qGU9xqLH7mzWwr8rgtvIQtQH49MzZ4BC6Zx7i1OaY3Z5bAJHGxKSi66
	q+z1RhWrKtyh+8a43UtGkdVAY6tJbtZSxSmOPiR6BkVvV5rvW1Aesnp05WMElY5B
	Y3GsYMw28NySs1MF0/Y+Pkw+J4jxxivEQErcX10OyifkzdUlCiq9vfus5BXESB5a
	gCGbN06R5T0uM1GPjnvTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661774227; x=1661860627; bh=YSRE9yOM/Z5VHOxCWxUiS2GZJiWP
	PT/Z4e8ykuOIjww=; b=v1DsEk9fijJiouN/UHJqgxLWEG/75yeX4h91mD7G9lc0
	5kALQXGWEUHrLFbrMjKPQfLaP6m3LkW72HvzDbVOHFaupZ8FnfS+LPwwrR1F7uXN
	tBALuNMqbZyzzFQSFu9RUGoKpClCnDBt/THTvY+UE6LaBYp+1SWcJ3vfbmxCH7Tk
	AUbUZgn55pR8eI/9zNMaobkag/iR7AGx4wsShS9gwn8tvzuu0moHjd+GCcf0UkFD
	NweUY5Brf9Sf4fNESKECOytUf22Pyet9ElJx98fakkZSzdw+MB9Zdmd1F+OOUqlZ
	QwcdpwWYg+cOCIDdIzbN1PO9A/orWMzlxyTbQlk/VA==
X-ME-Sender: <xms:kqkMY4eWAvNL_nH34etphLz7sOoHkvft6NitRCOdm6R056narjwDow>
    <xme:kqkMY6N9wemZ4tYuWxr9JJhgIGpyQ8wrTd3SEUagZW6o74G4v6zLzOGWFsTvMxKLj
    lamQ6UNsaKk-Q>
X-ME-Received: <xmr:kqkMY5hI54EVuzAZAxZe2zy3vL8j8NKh16TbszRVDiR6vrN7E2TYtmc4qQyz6tMYenWU4K3Wg_pSEH6QX7QpDGH1Uodko07Dl1EY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:kqkMY9_ktRt3gWvUsZ8wpMuhQvTu1xslvdkicSLQOANGBOSEkdxfDA>
    <xmx:kqkMY0uR6tNprLCWwM2WUPBy5wXF3WgolnlRdTaVb9yu6FRNxf4cYQ>
    <xmx:kqkMY0Hbc3WQq1NHeukwck---nDdRf9WULWsCW_k36TUqTIFr7n0Nw>
    <xmx:k6kMY2LUgsGrKmtTjpobSDI2OzOefQY2BbXNueJCHlWtDkAzxaXMLA>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 29 Aug 2022 13:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option
Message-ID: <Ywypjx+2qATqMgnf@mail-itl>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
 <b323ebc3-68fc-f6e1-b9ac-d508855a605b@suse.com>
 <YwiygukKUUqiAke9@mail-itl>
 <2fc50656-24bb-414f-4f39-3b23c4c3aa0f@suse.com>
 <Ywynyj1/cbL40sBv@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IeuyxfGo3XtnkvVS"
Content-Disposition: inline
In-Reply-To: <Ywynyj1/cbL40sBv@mail-itl>


--IeuyxfGo3XtnkvVS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Aug 2022 13:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci
 option

On Mon, Aug 29, 2022 at 01:49:30PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Aug 26, 2022 at 04:20:52PM +0200, Jan Beulich wrote:
> > On 26.08.2022 13:46, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, Aug 25, 2022 at 05:44:54PM +0200, Jan Beulich wrote:
> > >> On 22.08.2022 17:27, Marek Marczykowski-G=C3=B3recki wrote:
> > >>> This allows configuring EHCI and XHCI consoles separately,
> > >>> simultaneously.
> > >>>
> > >>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> > >>
> > >> But was I maybe confused, and much less of a change would suffice? A=
fter
> > >> all ...
> > >>
> > >>> --- a/xen/drivers/char/xhci-dbc.c
> > >>> +++ b/xen/drivers/char/xhci-dbc.c
> > >>> @@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
> > >>>  static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
> > >>>  static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> > >>> =20
> > >>> -static char __initdata opt_dbgp[30];
> > >>> +static char __initdata opt_dbc[30];
> > >>> =20
> > >>> -string_param("dbgp", opt_dbgp);
> > >>> +string_param("dbc", opt_dbc);
> > >>> =20
> > >>>  void __init xhci_dbc_uart_init(void)
> > >>>  {
> > >>> @@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
> > >>>      struct dbc *dbc =3D &uart->dbc;
> > >>>      const char *e;
> > >>> =20
> > >>> -    if ( strncmp(opt_dbgp, "xhci", 4) )
> > >>> +    if ( strncmp(opt_dbc, "xhci", 4) )
> > >>>          return;
> > >>
> > >> ... this already avoids mixing up who's going to parse what. So right
> > >> now I think that ...
> > >>
> > >>> @@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
> > >>>      dbc->dbc_str =3D str_buf;
> > >>> =20
> > >>>      if ( dbc_open(dbc) )
> > >>> -        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_u=
art);
> > >>> +        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_ua=
rt);
> > >>>  }
> > >>
> > >> ... this and other SERHND_* related changes are enough, and there's =
no
> > >> need for a separate "dbc=3D" option.
> > >=20
> > > But then you wouldn't be able to configure "dbgp=3Dehci dbgp=3Dxhci" =
as
> > > one would override the other, no?
> >=20
> > Not as long as both use string_param(), true. They'd need to both become
> > custom_param(), doing at least some basic parsing right away.
> >=20
> > But using two such options at the same time isn't of interest anyway
> > without your multiple-serial-consoles change, so possibly not of
> > immediate need (unless someone comes forward expressing interest and
> > actually approving that change of yours).
>=20
> Then why change at all? Since you can configure only one (dbgp=3Dehci _or_
> dbgp=3Dxhci), then there is not ambiguity what "console=3Ddbgp" means.
> Separating SERHND_DBC from SERHND_DBGP would IMO make sense only if you
> can actually use them both (even if not both for console, but for
> example one for debugger).

Or do you mean to use custom_param() to actually make "dbgp=3Dxhci
dbgp=3Dehci" working? But then IMO having "console=3Ddbgp console=3Ddbc" wo=
uld
be confusing, as "dbc" has no obvious relation to neither side of
"dbgp=3Dxhci". Maybe use "console=3Dxhci" then?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IeuyxfGo3XtnkvVS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMMqY4ACgkQ24/THMrX
1yyyNQf/YhRCBR0TJh1CitXwsVHR4PtTRLqVwkvkSibjKJ/i2ZQMtN7fNbH8zBlv
VcClYTK5u6N0lW7/BRVQkSNRKLtpWduSfXxLdUrXzH4A8uWujmCtKAd8OpTbDblW
3N/+0nAexWNXtblae25Bijysb9aEJa6W3EqbkFIuLJFMi2UUmus4YHbJuuLPoOut
co5izp5V01X7ix1W1Uu+GbvnBxarBQnIbyAp1ag1j7nNwXndlqi0UCjJnrazfS/M
0KGt7wDLoBS12bZsrghmMICD3Zz/+rfht7+3wnb2lOgPs5R0pqke6btKyzhCHeuG
hnC2AEQZIQWrZ/ftEoaf/YYJuHKy+Q==
=/OMV
-----END PGP SIGNATURE-----

--IeuyxfGo3XtnkvVS--

