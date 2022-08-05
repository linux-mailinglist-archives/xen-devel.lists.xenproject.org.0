Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E958A906
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 11:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380953.615418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtzZ-000126-A8; Fri, 05 Aug 2022 09:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380953.615418; Fri, 05 Aug 2022 09:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJtzZ-0000zI-7L; Fri, 05 Aug 2022 09:51:41 +0000
Received: by outflank-mailman (input) for mailman id 380953;
 Fri, 05 Aug 2022 09:51:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJtzX-0000zC-Ip
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 09:51:39 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 311a4b6a-14a4-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 11:51:37 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 36386320039A;
 Fri,  5 Aug 2022 05:51:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 05 Aug 2022 05:51:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 05:51:31 -0400 (EDT)
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
X-Inumbo-ID: 311a4b6a-14a4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659693092; x=
	1659779492; bh=LJLJk+cfWSWZBIEjxijUsxllR4/JDRgxszeltZAQQ/A=; b=r
	GMCCFYgboI2WajOsKyUr/lXjWpLQaK9Vr41uXvSld9xGzoYnJQjBZ+JMqgJUTZMl
	A648D4TqTG3Xdkx3oFR2buwLOXWIDpUenoZgKiL5o/8JeVUCVnMHbufzhqsJTnOF
	fA48pLY+eciqqYk5j19/gqKB63O3VuHXMpA291TUO0FlF3a8jSzJRUSofJNt2j8z
	yq4NHcejyfozbFZtyFDp+cB/s2tec562J1sUUO4qXpdXc1ZWEhfZ5S0J8L4kts7m
	9KM3V5OKLztg8fz5dpK3dbvpkHLp0dYZ+EOufQVdzBfuRM6YwPVqUcNYKxOwo+fV
	Wo71KENrfqUeR7TzRK0gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659693092; x=1659779492; bh=LJLJk+cfWSWZBIEjxijUsxllR4/J
	DRgxszeltZAQQ/A=; b=lUe9jyioa+qlHb+pP2jsLkQWdqtjgjIhT+tLMMB6SwD9
	GS/YjlDe4pSG3Vb3zIJYd5ZPUUMWB2Retxyk6f/e5LBa/4fTDYc+M9OGc5V8eIiT
	aBdBFnhBJW19VIxo+FcIXPmNCRLAsByjJzn/5GqF9UGxsJfzw3y3dBHc+MKmxqs4
	6Iwp17R7E35GuP4vGE89YgByyrddkuxFwkklG3YjopvZG60bq2HbQZS+viYzsnE6
	Z9aXpRLqewKwDpxLRxFIS44UKCDpVxcfDv4lIyFTeYhUYuWrdowPkid20S10p8r1
	TFFwkmWbyP0l3KCGz8PoRA/zdrr4Os8POY04+keXdA==
X-ME-Sender: <xms:JOjsYnzIzpr6Ub-b6XCz_x0nvUbJmQjI2DEQwkELJ5AO7WcFMLWF5w>
    <xme:JOjsYvTgcFTfnN3RBGUMKXs7qSY7BpPNWxg94ttXqncOMZXHDN0HrdVbbiaGUGkgf
    Cv15JUEMUYIig>
X-ME-Received: <xmr:JOjsYhVYe0616vY3UYIHM9-9TVhAyo4mXzBXOJVITmi3zEhzVQmu53voPUxQUlFcQBVnNXlINeTHX3RrFDZBJPonN_fRa2IAr1Zd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:JOjsYhjL5um9HQQ7zJAnwc9OqbBFt_sRIu_Z3aRx4ouhJoKYSKaHDA>
    <xmx:JOjsYpDNHzhPI0P7zPOkH6Si_vaUZ78jrWs1NVqsrUNRbLRYPo9Lrw>
    <xmx:JOjsYqKC4FmJFvCnET1b39tCW1yy3oBOw-o1a0VzWLyBGKCcQnZLmQ>
    <xmx:JOjsYs7QB_Ek3VWTfCv9COqZe5lcFB5uZfVwGw4WAwSOfbr0woa2Qg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 11:51:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Message-ID: <YuzoIAh+scGcDY1R@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <04256d0a-79a1-56f4-d092-de78f629c7f6@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ypQ8S4xIULrb65UQ"
Content-Disposition: inline
In-Reply-To: <04256d0a-79a1-56f4-d092-de78f629c7f6@suse.com>


--ypQ8S4xIULrb65UQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 11:51:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger

On Fri, Aug 05, 2022 at 09:23:32AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > +static uint64_t dbc_work_ring_size(const struct dbc_work_ring *ring)
> > +{
> > +    if ( ring->enq >=3D ring->deq )
> > +        return ring->enq - ring->deq;
> > +
> > +    return DBC_WORK_RING_CAP - ring->deq + ring->enq;
> > +}
>=20
> Doesn't unsigned int suffice as a return type here?

Yes, it does.

> > +static int64_t dbc_push_work(struct dbc *dbc, struct dbc_work_ring *ri=
ng,
> > +                             const char *buf, unsigned int len)
> > +{
> > +    unsigned int i =3D 0;
> > +    unsigned int end, start =3D ring->enq;
> > +
> > +    while ( !dbc_work_ring_full(ring) && i < len )
> > +    {
> > +        ring->buf[ring->enq] =3D buf[i++];
> > +        ring->enq =3D (ring->enq + 1) & (DBC_WORK_RING_CAP - 1);
> > +    }
> > +
> > +    end =3D ring->enq;
> > +
> > +    if ( end > start )
> > +        cache_flush(&ring->buf[start], end - start);
> > +    else if ( i > 0 )
> > +    {
> > +        cache_flush(&ring->buf[start], DBC_WORK_RING_CAP - start);
> > +        cache_flush(&ring->buf[0], end);
> > +    }
> > +
> > +    return i;
> > +}
>=20
> The function's return type is int64_t but the sole return statement
> hands back an unsigned int - what's the deal here?

And also, the only use for the return value is comparing to 0. So, yes,
should be unsigned int.

> > +static struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_trb out_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_trb in_trb[DBC_TRB_RING_CAP];
> > +static struct xhci_erst_segment erst __aligned(64);
> > +static struct xhci_dbc_ctx ctx __aligned(64);
> > +static uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
>=20
> I've been trying to identify the reason for the alignment here,
> compared to the other buffers which are no longer page-aligned. I
> haven't even been able to locate the place where the address of
> this buffer is actually written to hardware; all I could find was
> the respective virt_to_maddr(). Could you please point me at that?

It's dbc_flush() -> dbc_push_trb().
And indeed, I think I can drop the alignment when it's moved into
structure dedicated for DMA-accessible buffers.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ypQ8S4xIULrb65UQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLs6B8ACgkQ24/THMrX
1yx8/gf/f1YYwcA5SaLOXS1ImRMCEPWqUBcF7C4t807WyumVoKvjGO1MSSnjRtq/
Wpy2uh+lvu6vDgcepX51VSAPEcf20ljeP6xZkdKN8jOo8diy7OWFBtUhIkowzW45
lXsrfGpkZcsoBGEs333Ajt2lUywji03TdXZXNXAMuT6C6pRc6eK1fyJ5n/xjpSNW
7Xdbz6ez4rnO+ffQWWR8cyrVe8pdxN+1RCJlA4y3ENH7RcF0buq34bQ1x9R0BZaw
GsYcuiw+QhKZfVdn4BM1Wl4Q3jd+LLIBX6o+t+x7MksUnMP3KW+oVMyAFfw12SOQ
ageedWevrTTXEUWjFBb1nOtZexHveg==
=M/Dn
-----END PGP SIGNATURE-----

--ypQ8S4xIULrb65UQ--

