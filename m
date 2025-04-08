Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3FA80C75
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942126.1341401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u296W-0007x9-3P; Tue, 08 Apr 2025 13:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942126.1341401; Tue, 08 Apr 2025 13:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u296W-0007v4-0q; Tue, 08 Apr 2025 13:35:04 +0000
Received: by outflank-mailman (input) for mailman id 942126;
 Tue, 08 Apr 2025 13:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83+A=W2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u296U-0007ux-EK
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:35:02 +0000
Received: from fout-b6-smtp.messagingengine.com
 (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 422c24c0-147e-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 15:34:56 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id 2E8501140112;
 Tue,  8 Apr 2025 09:34:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 09:34:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Apr 2025 09:34:53 -0400 (EDT)
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
X-Inumbo-ID: 422c24c0-147e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744119295;
	 x=1744205695; bh=eyfGY7oKJHjRwk2ec3sLoUu2LyhDyICaz7YqnLFlRQU=; b=
	krkKuN9fYT99C8HlqFTfgyFEcqIMB5iYA2rk/5c9Nl8Hbq+WSoufx5OqGWj27MGo
	ShJM9QPM581MAIMYZ1JjaenRwecF0GohmJ878LXB7et1UDeK4YW3Xguic+CNfYBm
	1NdRJiZ+JQ8RTggOAASmArxixul/fbyRO6nKZ6mHUSqOnSh1vgqQHPp+aL/W/kbp
	M5JmKEVI44xi68y12RuD0yLkU3hjFzqyJJhJufzqceSBDVUmiRbZLF7wwOR6i86u
	0IPIXMf6A+c7CGISCx7aCLwuT9lz8lzL86aCkgAVNnLP1oOAtDRK3VEgrRIqWXTT
	PA3n15IcCsP95IAwRFKlnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744119295; x=1744205695; bh=eyfGY7oKJHjRwk2ec3sLoUu2LyhDyICaz7Y
	qnLFlRQU=; b=QcQRmtdzkQ1SIHmSVqc0W63j3hWnrlCyWzyiV43lyFPk2QqtMre
	doZeRD17B/3oJzCO4c6lRCpittm8ECECZsf4ac6DIg8WIznvIFZjNSE5+pRM2jZq
	KwitaZ0/p7kH69stFTPLGE8Lv4/IOF7rSYEPwPlldLsswzY4Tk3Z141tiSg73dds
	1R1wZ3/02YAhbyZ3SFi18sABjjhf22k9vmw17DYf7MST6/H2kWYHsj+zq/HbGRWL
	z/EgW0DizZKlg5/A5jxLXG40bM60EH25YM80arv90mfZsE5YzERgOuuj+5iB68g7
	VBwUj2HYFaRXUI2viWl9L9VKXFjOPO6926Q==
X-ME-Sender: <xms:_iX1Z4iPAl5syMzjVk3uJ4-4lv0EmB--Tf3X_vU3_oubnLG0zCn7kg>
    <xme:_iX1ZxBpYd3Xnm5CRG86wIX96pW3rTQ-rcxDeKn6Z95w3Hk6dmqOqUfNAPSZJt2ZK
    CDDXgoM9wnf9Q>
X-ME-Received: <xmr:_iX1ZwF0_njAxTeN7X6ynl5scVy81tMw-Ez-0b5aQxEw5D5T5-NefdXNsjPGQBeMNxDj3Yq6k7P0bh6iwUyKE3w6eY2W3tuYlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieehieegtdetfedtgfffgefgtdegledugeevgffhjeekvdeihe
    dvjeegfeekgeffnecuffhomhgrihhnpehtrhhivhhirghlrdhtohholhhsnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefse
    gtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdig
    vghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghp
    thhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtth
    hopehjghhrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:_iX1Z5S2XzQ2AXGZRnvoQkm4GHOgw8aWAB8NfHCQegmbDky7xNV8NA>
    <xmx:_iX1Z1x5fS8nxT5tnCKP_qfs6lT2-0HtyW55W64OwE1TcJntoOwF-A>
    <xmx:_iX1Z37wKx11REmVVnjouxCnOLDqT8sx_QN5pGgIzvshTEd7Pk_PEQ>
    <xmx:_iX1ZywrjFD2LLoI4-21FMkXMI016AU3gD8mQK3m-LDPguUtFiInnw>
    <xmx:_yX1Zz3MR5Fau0QrK_tLoYjYIVrHFeh1dA9ad9X5TGEouc13cWFRYhQw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 8 Apr 2025 15:34:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
Message-ID: <Z_Ul-wjePbu2PLg9@mail-itl>
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
 <a16618c7-94ac-48e3-817d-80c88c18c95f@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qlTuTevkzzzKlRNm"
Content-Disposition: inline
In-Reply-To: <a16618c7-94ac-48e3-817d-80c88c18c95f@citrix.com>


--qlTuTevkzzzKlRNm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Apr 2025 15:34:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2

On Tue, Apr 08, 2025 at 02:31:10PM +0100, Andrew Cooper wrote:
> On 08/04/2025 2:23 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > Consider also "Display controller" an IGD, not only "VGA compatible
> > controller" in few more places.
> >
> > Fixes: 4191619e0893 ("libxl: extend IGD check")
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Do you prefer this to be split into two patches (libxl, hvmloader)?
>=20
> Probably not for something this trivial.
>=20
> >
> >  tools/firmware/hvmloader/pci.c | 1 +
> >  tools/libs/light/libxl_pci.c   | 3 ++-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/=
pci.c
> > index c3c61ca060a6..1ee97a5b4b20 100644
> > --- a/tools/firmware/hvmloader/pci.c
> > +++ b/tools/firmware/hvmloader/pci.c
> > @@ -173,6 +173,7 @@ void pci_setup(void)
> >          switch ( class )
> >          {
> >          case 0x0300:
> > +        case 0x0380:
>=20
> Now we've got multiple, we should have /* VGA */ and /* Display */
> comments like libxl has.
>=20
> Can fix on commit.

Fine with me, thanks!

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qlTuTevkzzzKlRNm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf1JfsACgkQ24/THMrX
1yz9Dwf/buUpTFeuFeoFRmTUPjDiwtFPHDzVgUgzIbuPGKljkhuoEz23VYh53bLv
w5Y12R1hN6H37SgsMd3Bb+KVMSWblLDhFITbDpgTtv5Unr+RHl9BFFqy7IDfEq7s
0hWIyZrp4wjU0jnjPjUiQ88GKBtBZB7oXzlfaqwpdw0PgyxSOYC/YZ86V3CH+Dsa
1RKRQVfeaCnHOjxYhTDouLFU73NcuwdW3gLR6BZ/4NJy/80vlyAgO0IEmY3xoXiK
6Tg5mX+Xtu0sJPUc+C19eqoDHMya+j3IuH7c3BelqBTxMpZO5pcvDHjZn8kaJFRy
e5yuLzGaQwfG0ZWGhUkIVqE7dGrS2g==
=YCHt
-----END PGP SIGNATURE-----

--qlTuTevkzzzKlRNm--

