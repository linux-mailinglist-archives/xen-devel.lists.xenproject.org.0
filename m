Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F75F3313
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 18:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414953.659403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNvz-0006iI-Fl; Mon, 03 Oct 2022 16:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414953.659403; Mon, 03 Oct 2022 16:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofNvz-0006g4-D4; Mon, 03 Oct 2022 16:04:47 +0000
Received: by outflank-mailman (input) for mailman id 414953;
 Mon, 03 Oct 2022 16:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7JV9=2E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ofNvy-0006fy-BN
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 16:04:46 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18223dc1-4335-11ed-964a-05401a9f4f97;
 Mon, 03 Oct 2022 18:04:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id BFEF832008FB;
 Mon,  3 Oct 2022 12:04:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 03 Oct 2022 12:04:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Oct 2022 12:04:38 -0400 (EDT)
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
X-Inumbo-ID: 18223dc1-4335-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664813081; x=
	1664899481; bh=hPHwu5Dbn/ufBf96HVOzRpEY5YT9lHBBtz4R/zB3JH8=; b=t
	lotJ1zD+SzDDJvsFW7ghMNYgZ4CEmu23sc2KgNYLTNlLMsw4Db3OCcEyT33xC2xr
	uZvr2ulFndsbgLg+6Re7cbt2YpXH7rTb7hJ+wSI+m4xscvGtVxHlup+Tonh9jTfF
	K5OIQlErLv0NVqpEDo4/ZWBLjX0MAr55AbAsSF5HooxjMujEMwqkc8oyF/kWCHYX
	jd1VHiexqI6b1lxbyI7ZfUsrve0o0L87zzVhsMAegdrrMPkJlY3QYMKSmG9TNwLz
	tJJ4upkj78k7ts3D7lrmW9hmlbmeaTHE9ZBHHlulTAUoaHywsrnfVeNxLKv2jCLN
	iV3yoQUdrTlngFf9c8x4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664813081; x=1664899481; bh=hPHwu5Dbn/ufBf96HVOzRpEY5YT9
	lHBBtz4R/zB3JH8=; b=l7io6zaJc401brzklTjwNQBd/t4lXo/EqDyQErWN7u7n
	VNAX4sATa4xynnul+l5jBbmCmohQUSF4U8s4Wv4jfUDebu9+MTVj08NMrl+mcZ53
	BBzX40nIAZ0VFaiSp7fjU4KJrxzgKtEESda7EhHzPDXRs+AF/pliPfp7VxzB0wsb
	X8IJAwJDsS6zYRGYcE/PqAZCMh4LA6rFd2geyYF7uS+SHYM/CG+7LWuTGCUHoElz
	Tc4K0t97YzeaoXrLNtMQFitpGcNRiGwFTd1/cMPRl1RUu1QHVRH4+JKDvGiZGlS0
	tOUxk3A5i2Xda2Qh4Y6X5tfkpfQIdbauMnuWi7DXjQ==
X-ME-Sender: <xms:GAg7Y2GQ8aVayfQKEz1FEsFUoJojB9DnfFTi2z1mv-u0zGT9-AS57A>
    <xme:GAg7Y3W78y7E1oJTlPUS_pdp4Zh4rzPD05E0E5yMTmACdsMj-yrgnbOWaJPVPKhCD
    nc0VJkYDNcNnA>
X-ME-Received: <xmr:GAg7YwJHbjXs-Rk43ZsjWPgjyXjlAZHthTWnRqDbStSS85Bc66yDO_Aj8S_DeVY6TiJZxIYcSXtivWTKTZ3XcwHxMnRXXYk3qIBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehledgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GAg7YwF0e0o-voGPeZ6ncBaa4S3smMQ4iY2FQW2Vs3BmRn_cTA3qxg>
    <xmx:GAg7Y8UO-avxl-CjtWN2cJk1CmHJrHkqJQ1QIo1NUJ29hIBpLtBN6Q>
    <xmx:GAg7YzPk0vDSFk6EV-biIXUSD2HW-q6wvqpmn2kvnLKbwLbv-Vv4iw>
    <xmx:GQg7YwSXye17eMkGqPpupMim98leJk_w6zx0zjIniREgO68EAZya1w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 3 Oct 2022 18:04:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup
 based on hypercall
Message-ID: <YzsIETwb0J5LI/6y@mail-itl>
References: <20221003112625.972646-1-ardb@kernel.org>
 <20221003112625.972646-6-ardb@kernel.org>
 <Yzr/1s9CbA0CClmt@itl-email>
 <CAMj1kXEXhDXRSnBp8P=urFj8UzzeRtYS9V8Tdt9GSrZTnGRFhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ODiTydC+G+MHh2u"
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXhDXRSnBp8P=urFj8UzzeRtYS9V8Tdt9GSrZTnGRFhA@mail.gmail.com>


--9ODiTydC+G+MHh2u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 3 Oct 2022 18:04:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	linux-efi@vger.kernel.org,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Kees Cook <keescook@chromium.org>,
	Anton Vorontsov <anton@enomsg.org>,
	Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v2 5/6] efi: xen: Implement memory descriptor lookup
 based on hypercall

On Mon, Oct 03, 2022 at 05:59:52PM +0200, Ard Biesheuvel wrote:
> On Mon, 3 Oct 2022 at 17:29, Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Mon, Oct 03, 2022 at 01:26:24PM +0200, Ard Biesheuvel wrote:
> > > +     out_md->phys_addr       =3D info->mem.addr;
> >
> > This will be equal to phys_addr, not the actual start of the memory
> > region.
> >
> > > +     out_md->num_pages       =3D info->mem.size >> EFI_PAGE_SHIFT;
> >
> > Similarly, this will be the number of bytes in the memory region
> > after phys_addr, not the total number of bytes in the region.  These two
> > differences mean that this function is not strictly equivalent to the
> > original efi_mem_desc_lookup().
> >
> > I am not sure if this matters in practice, but I thought you would want
> > to be aware of it.
>=20
> This is a bit disappointing. Is there no way to obtain this
> information via a Xen hypercall?

I don't think so, unfortunately. That said, with the below adjustment, I
think that's okay for the _current_ users of efi_mem_desc_lookup().

> In any case, it means we'll need to round down phys_addr to page size
> at the very least.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9ODiTydC+G+MHh2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM7CBEACgkQ24/THMrX
1yzd3gf+Mr3VN3b4/zRc61OLrM64hiVHAtOrHmidG80iN1l5JGVhjO/5i4H/8ZFT
GnfuEXC9vtCuwsJa3k2tKAlUPFxvIFQskN7aZvgVRexgB05zNB3MexEh5AwEbi6U
vjt8AZKFjuvnouYe/2hLXLb5taMyRk2h9jnVn/FkcYeGgcC7/76fsdi53bfjtYmP
GeBCzMfR9YxmhJvRK2JAjlftrb9wJSqO4weQaormHre3nxi5Hep2752BOcFCBcXK
3Kct9AKRO/ozPfRzUtkUHt2bzA9HUAqLqKPvmXGmLV4jFyiwFd3onAlnCdeTonz2
xGdDfEFEyhzlTlMTu0TwHV1yvH0+LQ==
=9EcE
-----END PGP SIGNATURE-----

--9ODiTydC+G+MHh2u--

