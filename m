Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF01A81143
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942706.1341795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BRM-0008Rp-Id; Tue, 08 Apr 2025 16:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942706.1341795; Tue, 08 Apr 2025 16:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BRM-0008Ps-FN; Tue, 08 Apr 2025 16:04:44 +0000
Received: by outflank-mailman (input) for mailman id 942706;
 Tue, 08 Apr 2025 16:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83+A=W2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2BRL-0008Pf-Go
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:04:43 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b403b58-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:04:37 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 099621140157;
 Tue,  8 Apr 2025 12:04:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 08 Apr 2025 12:04:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Apr 2025 12:04:34 -0400 (EDT)
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
X-Inumbo-ID: 2b403b58-1493-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744128275;
	 x=1744214675; bh=R4L8EzoFCm0xNbStA2PIJxzS/K2nJQ66lVrRqUi1F5c=; b=
	RhqlTWGI+qMmOedVugIX/GeuhhSOl8c+vYZ94bmBtMbWedcx0MDB68zDT+V4L6aZ
	Bv2pni6nkDX7H10cM4w2ATDmssjda/BwAmFm+Elr8yWdQjFEbQMo5mpcHnLVspiW
	vdVhppa7jgXl5xZigtCzI80kQY+mtNzl24JvNcCs5RX27xGQqXKL6M1LU5J+cvqq
	aGGNTEfu11J27A2JSYuaMw1mjLk9oDBc3QmxmNsCnugfaMwLdpTAuSwLBYZSKFgH
	cAkpS4si+JYL5QlgJOs9ubqXQkpx7KSL3+k7qs0ew/KorwZoaFCb4LYD3iJCJ80z
	lCg6lHOvrXYq6BHO7F5J2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744128275; x=1744214675; bh=R4L8EzoFCm0xNbStA2PIJxzS/K2nJQ66lVr
	RqUi1F5c=; b=t0HoWI3df8loc0WD5+zgqMbBuAjl4dBKEM1wGfMo40QrBEGIoyg
	W6FHgu2vNiTM+xS7hObwxL37QzJkwy5NEgDabJCUk8QYWNeghOZQwKv62LJioABk
	+yoRu9W3cFIYFhsmQbwb3Iuh2GYETDWtb76enfuaA+/gGhq5s21h9A5nnChgJST6
	LPfcorpDsmCv7dXUFRBdT+YNEUxN3+01adBUXjShkPQYeMW9Cb4jxh6kgwSP3JhG
	MO4SuHgEWbjxcKChIqIA9zBhLxAwCsSttnURvuWgsQQGiGlm6fitan/yU5sl8zM4
	pDumKPilcpm+Da4symipGhBR9Ik3sPOjZWA==
X-ME-Sender: <xms:E0n1Z2temu0sOCqAACKlmJZXyt2OezrEN5biOdaGZJ_Yc6p4q6Q_xw>
    <xme:E0n1Z7dxKPh79Z6cyGboeBv-x-i-o5RHHMTioWeEmnu-DECdoDrCaSDfAnYfg-4Si
    epYKbX_LGmp6g>
X-ME-Received: <xmr:E0n1Zxwtd33xcOdQZdNhBVp5tRx_7K9tvxLjKoTFbDwx8JAN1uICLNp58gvou4Qk0q18ZGpdh1712aIBNVfmK6TAoNd3lAvQdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejhe
    etuddvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpd
    hrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgt
    phhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegrnh
    hthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepjhhgrhho
    shhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrd
    igvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:E0n1ZxPJ-KARzX3kAkhdvnAJ87l0gKN68pGTaO5VZoYXe_PyYFh18g>
    <xmx:E0n1Z29zXCKxWBw9AhKkeB8ZUsABcJgT06t2GcBmAmc6tG-pS9XftA>
    <xmx:E0n1Z5V8Td7p-cbZ5Mr0L7xNLjyySqGaDWH3ZOnsC5qJ8GDpjsLCzQ>
    <xmx:E0n1Z_d65cbUILQKAPlOott_5L0v3qiXI2SkoqFlivDonBF4u4PnRw>
    <xmx:E0n1ZyhuuRcAfNkEIfI3rRf7NW4sAEQ159PIUL6utIDRHb-DuT2_1SDT>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 8 Apr 2025 17:28:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
Message-ID: <Z_VJEPQaFuebdH3V@mail-itl>
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
 <7c8cfe6d-6d61-44e5-b1ba-8a7795424977@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3jsD0fORVQM/ufCO"
Content-Disposition: inline
In-Reply-To: <7c8cfe6d-6d61-44e5-b1ba-8a7795424977@suse.com>


--3jsD0fORVQM/ufCO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Apr 2025 17:28:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2

On Tue, Apr 08, 2025 at 04:11:36PM +0200, Jan Beulich wrote:
> On 08.04.2025 15:23, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/tools/firmware/hvmloader/pci.c
> > +++ b/tools/firmware/hvmloader/pci.c
> > @@ -173,6 +173,7 @@ void pci_setup(void)
> >          switch ( class )
> >          {
> >          case 0x0300:
> > +        case 0x0380:
> >              /* If emulated VGA is found, preserve it as primary VGA. */
> >              if ( (vendor_id =3D=3D 0x1234) && (device_id =3D=3D 0x1111=
) )
> >              {
>=20
> Unlike here, where vendor IDs are subsequently checked (and the sole ques=
tion
> that arises is whether any of the combinations can actually come as Displ=
ay
> rather than VGA), ...
>=20
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -2575,7 +2575,8 @@ int libxl__grant_vga_iomem_permission(libxl__gc *=
gc, const uint32_t domid,
> > =20
> >          if (sysfs_dev_get_class(gc, pci, &pci_device_class))
> >              continue;
> > -        if (pci_device_class !=3D 0x030000) /* VGA class */
> > +        if (pci_device_class !=3D 0x030000 && /* VGA class */
> > +                pci_device_class !=3D 0x038000) /* Display class */
> >              continue;
>=20
> ... there's no such checking here, and instead very much VGA-specific thi=
ngs
> are being done then. Is that really in line with permitting Display class
> devices here as well?

Well, it was necessary to get IGD passthrough working. But I think
upstream Xen still doesn't have all the pieces here. Specifically,
Qubes's version includes (a variant of)
https://lore.kernel.org/xen-devel/87d74a21bde95cfc7c53fad56bf8f0e47724953e.=
1592171394.git.gorbak25@gmail.com/T/#m8644141760ee36d691434dfaf550311104929=
29b
and that adds here access not only to the video memory, but also vbios,
which was needed to get it working.

Anyway, this code is reachable only if gfx_passthrou is enabled and
currently this option is specific to IGD.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3jsD0fORVQM/ufCO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf1SRAACgkQ24/THMrX
1yxGkQf/QuecTfYIWj/xJgaJrChpKnUcd07c0yPSjGGqVIqm7mWEC1IsAbzF1ZDC
YjHkaDu32Ti1irhpsgdMl1bn3Z5yL3rJ/yXE+3YD5172zwPnOtAHCjEBuGeiJRpN
Wc6UsFJV2FdUTD3CC2Oy7RKwMhJUVBazZcDPj/ZM/3RqkrztI0SF1eWKkZQ49QdK
LZPEZ+nzfm0uO1vM6vWSkXYtgaCiJNpGM7fQdJdMnGuZtEyj+3doYLzOVKuSbTXq
a8E717PFb+L23fICM1wEvvvulLmjipWB0oHdRBri0tk6TWdJWqu+kjuVbdPdiNGt
Zmltn0/+RnucwXc2cwhdovuaTvtUDA==
=jwPs
-----END PGP SIGNATURE-----

--3jsD0fORVQM/ufCO--

