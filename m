Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C98D6CD78B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 12:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516153.799821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSw7-0000E1-DE; Wed, 29 Mar 2023 10:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516153.799821; Wed, 29 Mar 2023 10:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phSw7-0000BE-9t; Wed, 29 Mar 2023 10:21:47 +0000
Received: by outflank-mailman (input) for mailman id 516153;
 Wed, 29 Mar 2023 10:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nen3=7V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1phSw5-0000Ax-A4
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 10:21:45 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7edb853b-ce1b-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 12:21:41 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A2615C0061;
 Wed, 29 Mar 2023 06:21:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Mar 2023 06:21:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 06:21:38 -0400 (EDT)
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
X-Inumbo-ID: 7edb853b-ce1b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680085300; x=1680171700; bh=KfquH4sfpRUM3ASZWY2tWbSYgabYb4sCOmF
	F71dxQ3I=; b=ZGjktOg8M2ePuXKdoZ0zAREAJEb2l3Cv3J42rQcVxl6mOGFRJuy
	X+d4ZTyBIa7lFlOvalL08lVVkNV2NwZPIl4WCJuxemgxnLO9Y56bSSpj7I7yjS1p
	Vb+p2nR9Bmw56IF+S/QSuf2xPtBOHfPHfdZGI74Rr/8l9FwJcPoIbm8dmIo4UbHH
	7sMLJGt5BpGnstdbID8wlPIiCR3sj9XDxaV/fDYu3V8CxjjV4cXHqYbulx38plbm
	gtf1H9F4LqU50OlDb32HP/p3Q5JaCajbIO6UGDcTq9wkKn81fJGI0h5PXZDsfPim
	WCTofDJfLn2e9rTsU55TU0On2D9Ty/iwKpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680085300; x=1680171700; bh=KfquH4sfpRUM3
	ASZWY2tWbSYgabYb4sCOmFF71dxQ3I=; b=jNTCSLPDey86fQQlzO3OSLgVFGey/
	eRg+nGzR8GKkrtgtTUZuXd3Rqbk7fDr1+ZJrsFIQmUkOX+oxUF6s1z3ZL7rcDtom
	tHRMv2xLmkag75WpfvjLxH7pZYvbEmOpTYXt9iX86NXjxVNwHkz67eVSpWuTXs3p
	T3E9xsHt+KuJbwS8aFrx7KvVb6LYEAJ3auO2zTD4Vp+CrZuczgCKfzzZM8qRpa5u
	qxbq4vNPCegSP0i8Setec2zJ3sHm6jpIgg0rlcfzifcA0S98S+NUukrSYhRw3Gr6
	n7s28yILCuulgKIVb8xN3+xiKN+9PndTGsMMTn+4QBmBHN/oK0swqzwSg==
X-ME-Sender: <xms:NBEkZHqiPzLo1ND1gQwXM78UfNWnD7FQsHq6nFde0a2zhdwDS14Ukg>
    <xme:NBEkZBrmf23O40WCKfaNtw8J9jVcOq5AigEArMsDMvGzfIxpjFs7PVCh_rQ1TAIRZ
    Ck8o4NeBOCdYA>
X-ME-Received: <xmr:NBEkZEOtiCsAjyGiij5Uu9l-CWtS1OL6fauVjlWOqMA20e-8khsa4-GhlKwlDeDra5aScr_hUu2ZCP1GZUpD3Mskvz1YSkvFdXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:NBEkZK5jg217hqWI-BxswLrO9Ge66d1xGycAe8sQmzTrf-5KTayVAg>
    <xmx:NBEkZG6JK7FwZ-7Ri3s3IyWKg7vFW5NUg1aaexGjdwXq9ShdukWPxA>
    <xmx:NBEkZCj0UCOwQrnN4hykopRfX0YMc5qKj8OJC-XGMwUS3RicaWFWtw>
    <xmx:NBEkZB0JmsgJVgH0pVPG5zoO7zuhFpoT6mRG3js1y-7vJM7Cf0PB2A>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 29 Mar 2023 12:21:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drivers/char: Use sub-page ro API to make just xhci
 dbc cap RO
Message-ID: <ZCQRMAoch+oq+2/e@mail-itl>
References: <cover.0fffd3f3080b5eeb8d22126eda6088734bb0c926.1679911575.git-series.marmarek@invisiblethingslab.com>
 <befefa60ea42a41543bc6dad70a559816cda8b7c.1679911575.git-series.marmarek@invisiblethingslab.com>
 <5cc58e5b-ba23-e7ae-c575-fe8cd713f515@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oFYokrQPuEpgDQOi"
Content-Disposition: inline
In-Reply-To: <5cc58e5b-ba23-e7ae-c575-fe8cd713f515@suse.com>


--oFYokrQPuEpgDQOi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Mar 2023 12:21:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drivers/char: Use sub-page ro API to make just xhci
 dbc cap RO

On Wed, Mar 29, 2023 at 11:14:52AM +0200, Jan Beulich wrote:
> On 27.03.2023 12:09, Marek Marczykowski-G=C3=B3recki wrote:
> > ... not the whole page, which may contain other registers too. In fact
> > on Tiger Lake and newer (at least), this page do contain other registers
> > that Linux tries to use. And with share=3Dyes, a domU would use them to=
o.
> > Without this patch, PV dom0 would fail to initialize the controller,
> > while HVM would be killed on EPT violation.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  xen/drivers/char/xhci-dbc.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
> > index 60b781f87202..df2524b0ca18 100644
> > --- a/xen/drivers/char/xhci-dbc.c
> > +++ b/xen/drivers/char/xhci-dbc.c
> > @@ -1226,9 +1226,43 @@ static void __init cf_check dbc_uart_init_postir=
q(struct serial_port *port)
> >                           uart->dbc.xhc_dbc_offset),
> >                  PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK)=
 +
> >                         uart->dbc.xhc_dbc_offset +
> > -                sizeof(*uart->dbc.dbc_reg)) - 1) )
> > -        printk(XENLOG_INFO
> > +                sizeof(*uart->dbc.dbc_reg)) - 1) ) {
>=20
> Nit: No need for a brace here (and certainly not a misplaced one).
>=20
> > +        printk(XENLOG_WARNING
>=20
> This log level change looks kind of unrelated.
>=20
> >                 "Error while adding MMIO range of device to mmio_ro_ran=
ges\n");
> > +    }
> > +    else
> > +    {
> > +        unsigned long dbc_regs_start =3D (uart->dbc.bar_val &
> > +                PCI_BASE_ADDRESS_MEM_MASK) + uart->dbc.xhc_dbc_offset;
> > +        unsigned long dbc_regs_end =3D dbc_regs_start + sizeof(*uart->=
dbc.dbc_reg);
> > +
> > +        /* This being smaller than a page simplifies conditions below =
*/
> > +        BUILD_BUG_ON(sizeof(*uart->dbc.dbc_reg) >=3D PAGE_SIZE - 1);
>=20
> Why PAGE_SIZE - 1 (or why >=3D instead of > )? If there is a reason, then
> the comment wants to be in sync.

Indeed looks like off-by-one.

> > +        if ( dbc_regs_start & (PAGE_SIZE - 1) ||
>=20
> Nit: Please parenthesize the & against the || (similarly again below).
>=20
> Like asked by Roger for patch 1 (iirc), here and below please use
> PAGE_OFFSET() in favor of (kind of) open-coding it.
>=20
> > +                PFN_DOWN(dbc_regs_start) =3D=3D PFN_DOWN(dbc_regs_end)=
 )
>=20
> Nit: Style (indentation).
>=20
> > +        {
> > +            if ( subpage_mmio_ro_add(
> > +                        _mfn(PFN_DOWN(dbc_regs_start)),
> > +                        dbc_regs_start & (PAGE_SIZE - 1),
> > +                        PFN_DOWN(dbc_regs_start) =3D=3D PFN_DOWN(dbc_r=
egs_end)
> > +                        ? dbc_regs_end & (PAGE_SIZE - 1)
> > +                        : PAGE_SIZE - 1,
> > +                        FIX_XHCI_END) )
>=20
> Nit: I think this is too deep a level of indentation; it should be a
> single level (4 blanks) from the start of the function name (also
> again another time below).
>=20
> > +                printk(XENLOG_WARNING
> > +                        "Error while adding MMIO range of device to su=
bpage_mmio_ro\n");
>=20
> Nit: Style (indentation).
>=20
> > +        }
> > +        if ( dbc_regs_end & (PAGE_SIZE - 1) &&
> > +                PFN_DOWN(dbc_regs_start) !=3D PFN_DOWN(dbc_regs_end) )
> > +        {
> > +            if ( subpage_mmio_ro_add(
> > +                        _mfn(PFN_DOWN(dbc_regs_end)),
> > +                        0,
> > +                        dbc_regs_end & (PAGE_SIZE - 1),
> > +                        FIX_XHCI_END + PFN_DOWN(sizeof(*uart->dbc.dbc_=
reg))) )
> > +                printk(XENLOG_WARNING
> > +                        "Error while adding MMIO range of device to su=
bpage_mmio_ro\n");
> > +        }
> > +    }
>=20
> Seeing the uses it occurs to me that the interface is somewhat odd: It
> adds a r/o range to a page that is already recorded to be r/o. It would
> imo be more logical the other way around: To add an exception (writable)
> range. The only alternative would be to include the call to
> rangeset_add_range(mmio_ro_ranges, ...) as part of the new function, and
> reduce accordingly the range passed earlier in the function. But I think
> this would needlessly complicate the code there.

I'm trying to make the interface safe against multiple calls making
different parts of the page R/O. If it would mark an exception, then
handling a page where multiple regions need to be protected would be
rather cumbersome. It isn't the case for XHCI driver, but for example it
could be in MSI-X (if I'd actually use this API there).

Making subpage_mmio_ro_add() to call mmio_ro_ranges() on its own,
together with Roger's suggestion of using ioremap() internally instead
of using fixmap would make it a bit nicer (if mapping the same page with
ioremap() in addition to fixmap isn't a problem).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oFYokrQPuEpgDQOi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQkETAACgkQ24/THMrX
1yw5Rgf6AwqEcnmXLtIEPNdBPC3YPwhQtXnzRVzU6y9Gvp8enlVcMNYzlpt+3rCF
ccbPL2oR2g8wyENdxZ5p0Z84fe86x3W9hVwI4dNadTT3RTXdhgw/CpV7RbHfl3u3
JCVTwrw97Vq1waptdzIrjwRPJPW/OwgESefJxXb42h8nliO0wqwT/U/8VnsD7H/U
jiEIswH3pBId9NkKFrScE0iai5+BVgW4S7B2vNsNsLVzcW+4foHNtU++3hZD1fBr
svjLHx7UwMfEA+r+I9S0sp5HVuZOXwLyKMx/4S9TsxF00/ND1tOyOfaeQqOMpPQj
fQR/euc/FEsiRKrWnuhmhV9S/7XijA==
=iav7
-----END PGP SIGNATURE-----

--oFYokrQPuEpgDQOi--

