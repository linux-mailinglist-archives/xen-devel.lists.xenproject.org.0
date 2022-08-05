Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD88658A922
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:58:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380969.615441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu67-0002MS-BK; Fri, 05 Aug 2022 09:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380969.615441; Fri, 05 Aug 2022 09:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJu67-0002Jo-8N; Fri, 05 Aug 2022 09:58:27 +0000
Received: by outflank-mailman (input) for mailman id 380969;
 Fri, 05 Aug 2022 09:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJu65-0002Ji-Jw
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:58:25 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24766053-14a5-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 11:58:24 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B7120320034E;
 Fri,  5 Aug 2022 05:58:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 05 Aug 2022 05:58:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 05:58:19 -0400 (EDT)
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
X-Inumbo-ID: 24766053-14a5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659693501; x=
	1659779901; bh=/FV0e0EPoTxXhTPGPsSr8DnBLeXpfgvCXkQjtAfdsMg=; b=r
	pkBQTEYZTUrvelZrl2BVJE4LvyJDKPp8AggAkNdfXV7a7aNg/hOG1ZfqW1fOFsvZ
	ynVX6hQnyF1z7GdTQ0n84EPiLXAi+QTz0T7BKhPInqIrfMKSHHmL31FnIaBDWka8
	FkzRfJ62QxsYVe3wc4pBxu9DSsJZko5DL+OAFP9bhUomAfqlsX3FDHb1m02H3Vff
	ypjPMRWTWQBdBb1+hv9cx4X7je1t5tUlNyySNnseefEeLhOchs+dXMt30rblBGBA
	sPfQGmNwisndS3HvqAlRJLlr5MhUqfVfI4QO7Dz6vIYf83q4IZL3Dy8035+FsBx0
	SHtEjbDUz6a9PVP3fEY+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659693501; x=1659779901; bh=/FV0e0EPoTxXhTPGPsSr8DnBLeXp
	fgvCXkQjtAfdsMg=; b=w9YAi0B5pEO5ieEHVT+oy422vLYwS0m0MlcRu/Uu79/V
	5m4LFlzyTfUadiGUHOeF9O8fTcGQfmBAIalUcqTz7tA2w//XoQxhwPHAyyWsS7D3
	M9OZUrER6P1xmxDrrHrUjDs88YS/NwOdp5U7jgyPSMBYsDbXLW65s+ZcDpE47vJU
	c1El6/R3PGFJATD55kLw3S8q+jYdCZKpSAPtSAAxeIuNd3IihCtDfpvuLqPiPy5B
	TqJEiuIno7+TI9nNUREMO4XE+GEyJlEHPMg6tCMEi+3IwsLjztFapMuj8NVqS4SG
	HBjZj4ZNzctnvQrN3apiaTVagOxc3AesHlmEyJI+pg==
X-ME-Sender: <xms:vOnsYgX_pmSW1-EZZoIKneppgoTDYnl9J9yo_cwZ4F6AuVxxU0Zh0w>
    <xme:vOnsYkkvy5oURuq_Avxl4neBbcr4asZhugQS1olD7oW60OFxh7ugucT41TK0Dids4
    DmM13TiTtyFLw>
X-ME-Received: <xmr:vOnsYkYQq1H8iuqDW9ELNeDAgZEyg2a5bURwGIpG7laHvDRrFAJLfJhJdnQiBDYsVZTO1aBd1gY8JU1fJTprQIGfot2-u0ZaKApg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:vOnsYvU94G_daISZL3s8o0iULAVl3klYPTWYLvGi9UlfbS1plgHahA>
    <xmx:vOnsYqlDROrkBpxeKYuEopv7zr4KfDi_QifBVcTM5LIttgBTYmtfrw>
    <xmx:vOnsYkdBjYJncD3fh2JQ9CnLRTIUdly7dKf-1s5x3PPHuFWX7inahA>
    <xmx:vensYrBsSVbDhkSDoRTzQyZ3FdCLDlXWTrXxPWtWWl59LgYZfzFHQw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 11:58:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Message-ID: <YuzpuUz5g+HtJdzy@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
 <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gy7n0B/hlISokl98"
Content-Disposition: inline
In-Reply-To: <7d263ceb-3727-763b-0b9b-3b9ed82aa780@suse.com>


--Gy7n0B/hlISokl98
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 11:58:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver

On Fri, Aug 05, 2022 at 10:38:13AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -440,6 +442,16 @@ static void xhci_trb_norm_set_ioc(struct xhci_trb =
*trb)
> >      trb->ctrl |=3D 0x20;
> >  }
> > =20
> > +static uint64_t xhci_trb_norm_buf(struct xhci_trb *trb)
>=20
> const please.
>=20
> > +{
> > +    return trb->params;
> > +}
> > +
> > +static uint32_t xhci_trb_norm_len(struct xhci_trb *trb)
>=20
> And again.
>=20
> > +{
> > +    return trb->status & 0x1FFFF;
> > +}
> > +
> >  /**
> >   * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that eve=
nt
> >   * TRBs are read-only from software
> > @@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xhci=
_trb *trb)
> >      return trb->status >> 24;
> >  }
> > =20
> > +/* Amount of data _not_ transferred */
> > +static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
> > +{
> > +    return trb->status & 0x1FFFF;
> > +}
>=20
> Same as xhci_trb_norm_len()?

Yes, I was considering to use that, but technically those are different
packets, only incidentally using the same bits.

>=20
> > @@ -985,6 +1054,33 @@ static void dbc_flush(struct dbc *dbc, struct xhc=
i_trb_ring *trb,
> >  }
> > =20
> >  /**
> > + * Ensure DbC has a pending transfer TRB to receive data into.
> > + *
> > + * @param dbc the dbc to flush
> > + * @param trb the ring for the TRBs to transfer
> > + * @param wrk the work ring to receive data into
> > + */
> > +static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
> > +                           struct dbc_work_ring *wrk)
>=20
> I can't seem to be able to spot any use of this function - it being
> static, how do things build for you?

It's in dbc_uart_poll().

>=20
> > +{
> > +    struct dbc_reg *reg =3D dbc->dbc_reg;
> > +    uint32_t db =3D (readl(&reg->db) & 0xFFFF00FF) | (trb->db << 8);
>=20
> I think I've seen this constant in earlier patches. Can this be
> a #define please, such that one can easily connect all the places
> where the same things is meant?

Ok.

> > +
> > +    /* Check if there is already queued TRB */
> > +    if ( xhci_trb_ring_size(trb) >=3D 1 )
> > +        return;
> > +
> > +    if ( dbc_work_ring_full(wrk) )
> > +        return;
>=20
> What made me spot the lack of caller are these return statements.
> Without letting the caller know of the failure, how would it know
> to make another attempt later?

Next iteration of dbc_uart_poll() will take care of it.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Gy7n0B/hlISokl98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLs6bkACgkQ24/THMrX
1yzDnwf8CLtenG3FsPkzjLFlGz5DTXFoRbY43UT33v4kFpr/hRwWjqz63i9bv02B
gIpz1t+jI4+dawnl7EOuhbaBxJMO5a/vS3JJQIwpvOVgXLuMZ37P1XnDtZerg3dJ
KfcwfG91cU01uRI8kYr8bdoa/1qUErVFpJMR4C3xmexjYAmKsg0sRXdufxEfkDDo
QQft4+ovD3gYuEI0YXUBz5iMNN+qL7WT2OMigHtwnAbSgdZbIg4heuPbZbdR2Yvi
t5Jm6Cr2esd9jg5QAyIc75cdA+pT6mwj6OjrVjdA1uQvMPP2NbcdE1cb/GTVOSS4
CaxeFdk0aBHUhBJDjF1i260YAZTIog==
=pGrZ
-----END PGP SIGNATURE-----

--Gy7n0B/hlISokl98--

