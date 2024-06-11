Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D133903F74
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738498.1145275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH30Z-0002Am-Rn; Tue, 11 Jun 2024 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738498.1145275; Tue, 11 Jun 2024 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH30Z-000296-OR; Tue, 11 Jun 2024 15:01:59 +0000
Received: by outflank-mailman (input) for mailman id 738498;
 Tue, 11 Jun 2024 15:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H2Xh=NN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sH30Y-00028x-CC
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:01:58 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac7adc1-2803-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:01:56 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 71D001140159;
 Tue, 11 Jun 2024 11:01:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 Jun 2024 11:01:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 11:01:53 -0400 (EDT)
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
X-Inumbo-ID: 8ac7adc1-2803-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718118114;
	 x=1718204514; bh=8pNd4VEepn/40DLjjsKiqn3jk1h0YICBQP1GZtZNZhc=; b=
	m5+E0aBTD7N8KJjxggUoYUb1Zhmwm1uhbLDLxZOFQAKBqQSDycz8w9AX+Txrr9b4
	8N3edq1Dw9I9fsCMuDw156rqwnXYAg0ShJ/sqwj244PPK0MHCyM/aExre04kCv3n
	+PkJBfMqaINAQEY8KKhem3O+8AHUSj3HG2lVAj5OelN28GVCTjeWfZ7q1a0cbvWl
	rSKw1YysxGP1KRfruu7ScCHqzkNWTtvo1drfjXqzEy4g6yc3f0gIqPtYMtwqIi+e
	DSsZ6T4I5femPzXS0WdTtn0UUi9XmuU+2gOJgZjMXvo9/NcbH9phD6+mLuPJMYkw
	INxS7SIcZudMdY79E8RfYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718118114; x=1718204514; bh=8pNd4VEepn/40DLjjsKiqn3jk1h0
	YICBQP1GZtZNZhc=; b=H3QluBTDcNWAYNvmHjpT51t/zt1hfxQz+6lJodkvqUYD
	V5uphf+rxSNUx26Y0C0pge62c/jqIKwF9wEh1wKFYxiDvMjw/UtJ40DqOKP9yhvh
	9PvnYDLDFPjqMpeU9adceBdBTCnE0G5g0RFKe6sq3+WL1DcTpceGNZr6SGE91ehy
	krTTTn4TjRbnvou5cSz9U1KxPCwTIqAWPHSql1XYov/cILEt25n+sIcNPFZ2POlN
	9KKmxXCWtkoG8BUP+EGEStFdZAHw6/Kf+LCZ7nBdM8mlekBBB6JT3ThHWqxH3HrZ
	O2kY5ShR/b7d/BSb1vmflvaYxoFvVhdFN13Hb92s8Q==
X-ME-Sender: <xms:4mZoZngpctcchugFHjNgSVt20IEK12UaXbdt5M4dOrXa2LzOSzwWXw>
    <xme:4mZoZkCUc985poPWo7plypDTvuCFpbq_eCtZkAkhBtc16y0tSRyAG0r1zniuFRu66
    rizRDAhPZMIBg>
X-ME-Received: <xmr:4mZoZnH3xx0dv5d8_qS8zjYTYgp9H7g3ezmB5lLLYzFf_KVyhMG8dd6lcZGz8YmPknB3o_LXAeqspbkALfTqZdRFrfSSakMkmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:4mZoZkRNg7VSjxzL26munKgSdt9RsyKn16s1zpp8WlpaJytxrafnpQ>
    <xmx:4mZoZkzCRq90wd7mqT0l-dXkRtV-lM7FbWswc9uH_4-_GzwvbYLk-g>
    <xmx:4mZoZq6ep7rzh6xuzWoL2Zxaesh1bFYE-BJwbNicMWLr3zwT9twq4Q>
    <xmx:4mZoZpx19LD2cBxbOgrwXYp-TudBv0IcoBHMJF4dwCPzPVvI1zlMxg>
    <xmx:4mZoZg_s9xGnSWBDfwGCkXU9HovacBlDurs8a4PpRV_EOE4f_O7MDaLm>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Jun 2024 17:01:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zmhm3r8U4Nz7vxhQ@mail-itl>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <ZmgpsZJ4afLd1Fc3@macbook>
 <Zmg3O7zvd9KBC1Fv@mail-itl>
 <ZmhJOjggtJiNccPo@macbook>
 <ZmhN_hNHp7WtyPyD@mail-itl>
 <ZmhaB57Tc6BsknVO@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VBToB/jz9xQ1jL61"
Content-Disposition: inline
In-Reply-To: <ZmhaB57Tc6BsknVO@macbook>


--VBToB/jz9xQ1jL61
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2024 17:01:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Tue, Jun 11, 2024 at 04:07:03PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jun 11, 2024 at 03:15:42PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > It's location is discovered at startup
> > (device presents a linked-list of capabilities in one of its BARs).
> > The spec talks only about alignment of individual registers, not the
> > whole group...
>=20
> Never mind then, I had the expectation we could get away with a single
> page, but doesn't look to be the case.
>=20
> I assume the spec doesn't mention anything about the BAR where the
> capabilities reside having a size <=3D 4KiB.

No, and in fact I see it's a BAR of 64KiB on one of devices...

> > > Maybe worth adding a comment that the logic here intends to deal only
> > > with the RW bits of a page that's otherwise RO, and that by not
> > > handling the RO regions the intention is that those are dealt just
> > > like fully RO pages.
> >=20
> > I can extend the comment, but I assumed it's kinda implied already (if
> > nothing else, by the function name).
>=20
> Well, at this point we know the write is not going to make it to host
> memory.  The only reason to not handle the access here is that we want
> to unify the consequences it has for a guest writing to a RO address.

Yup.

> > > I guess there's some message printed when attempting to write to a RO
> > > page that you would also like to print here?
> >=20
> > If a HVM domain writes to an R/O area, it is crashed, so you will get a
> > message. This applies to both full page R/O and partial R/O. PV doesn't
> > go through subpage_mmio_write_accept().
>=20
> Oh, crashing the domain is more strict than I was expecting.

That's how it was before, I'm not really changing it here. It's less
strict for PV though (it either gets a #PF forwarded back to the guest,
or is ignored).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VBToB/jz9xQ1jL61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZoZt0ACgkQ24/THMrX
1yzgNAf+JAlcmZdIC+tvAFE5mJQhSYWRgIUUdiAM7HxzNHGnHDihKmAMVwj39Z1D
4pL5kSXxEcDiQ71jnlCz/Pkhf8q/ZpKkf1IX/xPjXw63DUx1SKI7QuZUlnRSSPvP
zxGAL0su3FzMYnSGWHUrDkcO0Aum5pYLrJhIM0rRzFTwTP+nq27T/4NjmD42uDWp
QdNYPLtPzUr5qEIvyWERQtK9mI36EQ5y9ppySgNR7Ccj93vPa8SbgIQk2cKYddZv
ZJPGb7DB9ROYM60lBYCVu7cEWMhHymKKN/jKjN8NTOb41Ni25Mm+2B1G+tzDnbly
G2YrMzgd85RRFdfp5kjsC5lKas0n8w==
=sF1c
-----END PGP SIGNATURE-----

--VBToB/jz9xQ1jL61--

