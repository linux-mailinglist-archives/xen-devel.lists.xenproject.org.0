Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697FC58A93F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 12:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381011.615491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuIZ-0006UQ-A7; Fri, 05 Aug 2022 10:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381011.615491; Fri, 05 Aug 2022 10:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJuIZ-0006Sh-6Y; Fri, 05 Aug 2022 10:11:19 +0000
Received: by outflank-mailman (input) for mailman id 381011;
 Fri, 05 Aug 2022 10:11:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJuIX-0006SI-RB
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 10:11:17 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f087ac16-14a6-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 12:11:16 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E0CC832004E7;
 Fri,  5 Aug 2022 06:11:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Aug 2022 06:11:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 06:11:11 -0400 (EDT)
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
X-Inumbo-ID: f087ac16-14a6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659694273; x=
	1659780673; bh=2qhs46LUf3+Xtf/2JnW6tSAg63w3kOere6vPwuH6uqg=; b=h
	MqGBRO/QV3qgCgN/6WOKDn3fp2XE2aj7Q17Kxz3Yiq9zg3oyNV/dIpuqpHrKzwRU
	dPQ+hfypZByxn8gwl7p2oeLbmuA8Hx8YSK1A+U5b47ixiHKD6BaheuP8+mWat1no
	3JrIj/VyC+0v9exc5fq2aheRNBPpJQ7wT0zHf2tpY80SebHjQNtpapUljsGB+EuH
	o2U728nn2Pbk7Tp1jOBMqHY0ytZgZEt6ecPW8KBmk+NO0arsPgZe1B85e0VioF/R
	nTWSfqSU0SEa8VxQfaGJYKrlc7zRFIlfykoTozWeokp5HdOCi1JisorV4UhG0GzQ
	T5nyfxQjdoBcaxOmZHGOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659694273; x=1659780673; bh=2qhs46LUf3+Xtf/2JnW6tSAg63w3
	kOere6vPwuH6uqg=; b=QwTKGQS6vLcfT2r66nXMC8rM02ZFi73dwC2hrjgY1FOQ
	XMEfw8Nf8tV9Rbr4covcysCCiGVgC9eCjYCPKH81ZzSBxLc1MzG2p2DoM4sgikol
	Z1hRNS6azwecgWXNc33BIbu4QcwR9HDhHBK1BnUeMvAY1g4IMdO0QiJoQTPxFEza
	dKCRUWL7v7sMRAVY1rP9X8JXE1ljNSCsbar4hs0jnyoZI4H5N8a+139urcUNOJJC
	BSG8FGXkyUvXh/ltm3gHWhy8pi+N6pUqNj8UnTmsF5VFW+fPA4jWfIL9aIZ5tB9W
	shFEt710WKbjNLdcoBLDmL6CSuw9dE9fdrV0xWbaeQ==
X-ME-Sender: <xms:wezsYua0WNMTz9IG83lyxSdAGUPK_3FGSKsSAX2uroisv_vJVjhZpg>
    <xme:wezsYhbGSS_0tip1zEoSmIjPBytw_x0DDpD6G6R8ejjQz52i6ZCq0_KcAf1ZDtiml
    T6eA8NRYtoW7A>
X-ME-Received: <xmr:wezsYo9zCRL9MJH_pj5XMJ1PGDCzMZUpWsL4tThUr9Sab6j5Ohk7qMbetK7OdFiFEtu8hm05Xygf9pYPsFuAc1jJ1Texa_5uMUeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wezsYgoakPqCnkW1uDCh9zAuJI2vfQdsoNPVdgTbOXx-sU0HAsz-Bw>
    <xmx:wezsYprWOxDI-EFndDCjDMIOke2YDBe6_i0ojoY6vWWjOp7Uz9087A>
    <xmx:wezsYuRXJ4-Gw214f83d_SQnZ5nu1ebdToNc9ZQVCXFMTY5cGi000Q>
    <xmx:wezsYqm9_YibKDnjOk_xSFELwnXY5J4ehueVZXCYBPO3gMMiuuL2UQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 12:11:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 08/10] drivers/char: mark DMA buffers as reserved for
 the XHCI
Message-ID: <YuzsvMZdryi3GXhO@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <b35f5a68502352396cf6d95cc726bfdeb72639c9.1658804819.git-series.marmarek@invisiblethingslab.com>
 <6397ea86-7391-5044-8e8b-a3d291521028@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H2BSgvvACpZPQrOC"
Content-Disposition: inline
In-Reply-To: <6397ea86-7391-5044-8e8b-a3d291521028@suse.com>


--H2BSgvvACpZPQrOC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 12:11:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 08/10] drivers/char: mark DMA buffers as reserved for
 the XHCI

On Fri, Aug 05, 2022 at 09:05:27AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -1046,13 +1047,20 @@ static struct uart_driver dbc_uart_driver =3D {
> >      .flush =3D dbc_uart_flush,
> >  };
> > =20
> > -static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> > -static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> > -static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> > -static struct xhci_erst_segment erst __aligned(64);
> > -static struct xhci_dbc_ctx ctx __aligned(64);
>=20
> Why the change from 64 ...
>=20
> > -static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> > -static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
> > +struct dbc_dma_bufs {
> > +    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> > +    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> > +    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> > +    uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
> > +    struct xhci_erst_segment erst __aligned(16);
> > +    struct xhci_dbc_ctx ctx __aligned(16);
>=20
> ... to 16?

That's rebase fail, it should be changed to 16 initial patch too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--H2BSgvvACpZPQrOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLs7LwACgkQ24/THMrX
1yzbWQgAkd0+ocKcxzuiyfjf1xP47sWav+X7FshGKrHvYflyvgjpV13TVhjPpSY6
jpKsdDD5FVORfk4mzj53Ol7Orj5UEbAjpag4/+YD6fK1fxZp/q2vAb3Ki52GK1Rl
J861Pyhpgc00/KjLRe3R1fVI6LBTkXbQdFWH7ce9dspfxntmmMHWfq+8Rh67CRqD
TtrU4kxfkp4KAvzLnOtqaImZmadsQuySE7fHQr+kb0rCS2dnAdbK9k7tO/HD+UDs
nJv1LcqQFunCtBTUC8Q46AIgMIiz70gvBQVOt+eLsZLiWaCZz7mCQQqKg3VU29T5
y0A7NmSKTKn9jClHzvLgiSiAWyIyog==
=muyc
-----END PGP SIGNATURE-----

--H2BSgvvACpZPQrOC--

