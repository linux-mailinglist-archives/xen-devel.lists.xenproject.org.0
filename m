Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE31AC4268
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 17:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997593.1378418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZvT-0004ZY-7e; Mon, 26 May 2025 15:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997593.1378418; Mon, 26 May 2025 15:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJZvT-0004Y8-4b; Mon, 26 May 2025 15:39:43 +0000
Received: by outflank-mailman (input) for mailman id 997593;
 Mon, 26 May 2025 15:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xclA=YK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJZvR-0004Y2-Kq
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 15:39:41 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d3160d-3a47-11f0-a2fb-13f23c93f187;
 Mon, 26 May 2025 17:39:39 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 9AF20138046A;
 Mon, 26 May 2025 11:39:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 26 May 2025 11:39:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 May 2025 11:39:35 -0400 (EDT)
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
X-Inumbo-ID: a1d3160d-3a47-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748273977;
	 x=1748360377; bh=esvQVRH0bPyN7dluy4hxzi4y7JXLpesQLXxu/LYNZ+w=; b=
	rntbuXRyKUku3V6Kh3/QvfSLltVRTDiott60X+/1nws5875rtkrgfbzYc4GqTmaf
	viOeM/p3598h0L29HySFZMDhsSS2BkhIkue6EQoOy2WFPuH1yZbkRBze2aUSQW1L
	+JpGnJoGIQf7ukoe8KGUF17zIN5fleD7ie7jswjZmvirYmEQU2aXahlEyF9P07oG
	8am5etM85oW7agFIuQPY/Hrmmt3lsxxnKT3lEnApoOjtplYMsdu6J/hUlvf+wpMu
	KlLC4wbntMe42BFClqfLgLVVqYVGHps7uqOrza2LrY/+t8Y0aZMdfr7RpLZm3au+
	SP2jg4laqfIJrxwYTFGl9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748273977; x=1748360377; bh=esvQVRH0bPyN7dluy4hxzi4y7JXLpesQLXx
	u/LYNZ+w=; b=DbtSAphPMyAmUGoRxMX3z1YPotAbyZHbejZhT6ULjDkrMlWn63J
	B+GUMDBpCzcFBZaxp+nISLEgMzCe2V1TohI6hbYH7tmXlXYgK//plRWcW0rtI87d
	ii/JetOouO/wJBZ/y7izUzPy62OA1bPp2emjWw0OGUFpcZ80eQOlmpSR57SewA64
	mw9YKhFn24KcDJLblx47yo1hg1zN60UZh/wK6d6qcoy5Sm62NCA7XT4hJaAFU0F0
	BKK9g6hNt7jmmP0LPyANm2wHWd+ewmQwKgjtKEpU2B91LkYKbeLGSE+Vp6s85DwR
	9XRmTdoVtpTqphVmOYKh2Pi+yRTrrxd4uxA==
X-ME-Sender: <xms:OYs0aD3tJXiebLe3tFwIscYUNcnZssmqpuHQ5LGCb3TBBbeDyu7nNA>
    <xme:OYs0aCHtfB3bxOdSUCRFgMNaMS6wbPbxaigx-jRbJCVHbw-fKMTzuMwS6RHw1JMFL
    Ze5kow3SqAD_g>
X-ME-Received: <xmr:OYs0aD71CPt5fDA8_R2YWuqXyUExDvYtP0rXR8_p32zjSFw-uWD81U2_j33lNPIsXGEwolIJRQNBhIyIHWoEtyFW9lY8xqFufFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeeludculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedvhfekudetvdelffeguedtke
    ethfethfffhfefteeghfeigeelvddttdektdenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhih
    rdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorh
    iivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OYs0aI2LMQ01A-tVcjipua1qlgtpVvLRkzK8YUYjy1V3sRtnsMv1yQ>
    <xmx:OYs0aGHduEn4N6AvDuBy9q8ZUGe3dGTi6lfzx_rBWv5WpB50EvpJKA>
    <xmx:OYs0aJ8E7i7jdFxdpWmw4fFPqeORlnxdbq7s86DMl4A_eXc5sZ1HoA>
    <xmx:OYs0aDljsGqyCBDEpAakOorHDxWHTWJUFTaZFiKDLYtbIv9WP5tbKQ>
    <xmx:OYs0aL7BKW7imiUudQysnTD7lReeryMz_7690eRDACbu_hI3dxV2C6jK>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 26 May 2025 17:39:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/5] console: add relocation hook
Message-ID: <aDSLNeFRZWoxMTEt@mail-itl>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MVNS/Wq1QzvNXy9/"
Content-Disposition: inline
In-Reply-To: <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com>


--MVNS/Wq1QzvNXy9/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 May 2025 17:39:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 1/5] console: add relocation hook

On Mon, May 26, 2025 at 04:08:17PM +0100, Andrew Cooper wrote:
> On 25/05/2025 3:15 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> > index 25189541244d..3ef819a252e4 100644
> > --- a/xen/arch/x86/setup.c
> > +++ b/xen/arch/x86/setup.c
> > @@ -1481,6 +1481,8 @@ void asmlinkage __init noreturn __start_xen(void)
> >          highmem_start &=3D ~((1UL << L3_PAGETABLE_SHIFT) - 1);
> >  #endif
> > =20
> > +    console_init_pre_relocate();
> > +
> >      /*
> >       * Iterate backwards over all superpage-aligned RAM regions.
> >       *
> > @@ -1606,6 +1608,12 @@ void asmlinkage __init noreturn __start_xen(void)
> >      if ( !xen_phys_start )
> >          panic("Not enough memory to relocate Xen\n");
> > =20
> > +    /*
> > +     * Notify console drivers about relocation, before reusing old Xen=
's
> > +     * memory.
> > +     */
> > +    console_init_post_relocate();
> > +
>=20
> With reference to the next patch, there are printk()'s in this region
> which want to work (in case something goes very wrong), so I don't think
> setting dbc->suspended is the best approach.

I guess the post_relocate hook might be moved a bit earlier, but still,
once relocation happens, the xhci console is not functional until it
gets relocated too (for example - it would post new TRBs into a ring
that isn't actually monitored by the controller).

> In dbc_uart_init_pre_relocate(), you just wait for all transfers to
> complete.=C2=A0 Can't this be merged with post_relocate(), at which point=
 the
> intermediate printk()'s will work too?

Not really, because the structure that driver watches is not the one
that the controller DMA into anymore... The driver would need to watch
the old physical pages (specifically, the event ring buffer there).

> =C2=A0 It will also remove a hook.
>=20
> Meanwhile, we have things like:
>=20
> =C2=A0=C2=A0=C2=A0 /* Cache {,compat_}gdt_l1e now that physically relocat=
ion is done. */
> =C2=A0=C2=A0=C2=A0 this_cpu(gdt_l1e) =3D
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l1e_from_pfn(virt_to_mfn(boot_=
gdt), __PAGE_HYPERVISOR_RW);
> =C2=A0=C2=A0=C2=A0 if ( IS_ENABLED(CONFIG_PV32) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this_cpu(compat_gdt_l1e) =3D
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l1e_fr=
om_pfn(virt_to_mfn(boot_compat_gdt), __PAGE_HYPERVISOR_RW);
>=20
>=20
> in traps_init() which really doesn't belong here, but does belong in
> some kind of general "relocation done" mechanism.
>=20
> I wonder if we want a new type of initcall for this, allowing individual
> areas of code to opt in with less boilerpate?

Maybe? But for the console specifically, we also need pre-relocation
hook (more context also in the next patch description).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MVNS/Wq1QzvNXy9/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg0izUACgkQ24/THMrX
1ywanQf/QbeKKV4DSDv9LjG0sSBWpNo6Q1gggZo/tST/V4ksZzoT3gCC3Soslh+/
7F9MfqfFJW7Uc1wSCdSfqBA6bBo2RG9dCt21CYv4VfAirV4tUu5OCJwzrgK3UIpo
am/kv9aKP58yWXWLanqRLzsEKnRT0QCi5iMMprizgKx3ich5fz+YnNNWqb6r9CQk
rhO6u2o/avAsFJWUgm6zzgkmw9komRU2n/sG7oemtBwiu/HfX/9b/E9Ur9AtcctY
h4floEdyopD7TsnzwLzZRoAu9h852upuFGWocz7bAeu3YrAnJ6zFO7/EoQEKebST
WlkuQvZE0C3Ch6vUd6pZOdQUSs7JBA==
=j94w
-----END PGP SIGNATURE-----

--MVNS/Wq1QzvNXy9/--

