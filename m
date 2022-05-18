Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAA652C116
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 19:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332424.556118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrNmS-0006DD-Lm; Wed, 18 May 2022 17:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332424.556118; Wed, 18 May 2022 17:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrNmS-00069p-Ik; Wed, 18 May 2022 17:48:16 +0000
Received: by outflank-mailman (input) for mailman id 332424;
 Wed, 18 May 2022 17:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SrOz=V2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nrNmQ-00069j-Jk
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 17:48:14 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af62aa81-d6d2-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 19:48:12 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E30243200940;
 Wed, 18 May 2022 13:48:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 18 May 2022 13:48:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 May 2022 13:48:07 -0400 (EDT)
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
X-Inumbo-ID: af62aa81-d6d2-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1652896089; x=
	1652982489; bh=Ss8aixtbuvwZLZjYqXXq17seWN/wHL4KYaWqyXIwbtM=; b=m
	Pu/HCNhYkYjtWu4hRYGrZe8o9wh7B/9AGTeALZy4XdDNx6s/Gj1hyJaPwWtJy/HH
	zp0IS2sdezL2Z05qzEnkqGo+wLja5XhPJib/IXCbeL4UA7OohyT5IcYFw6+7py+V
	/MC6HEQaly5gQUmd16zyeEzn6qOPfCNrOCVu2j9Z1405CuRxPd1ONrYh3qjJ+F4P
	LnRL0d//SQIiKyLZmKSdAwhdew+toJo4HCpwritCaSYyWd4C82OXf8sszCFn6cEf
	mow02qf734xQJKXc4+0xpE4j6tgpMsW2f9Bo7UxfQ8Sc/KDTQhqPw97Kz5IgzEIm
	d4ndP2ZpUXh4BOBSnm4hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1652896089; x=1652982489; bh=Ss8aixtbuvwZLZjYqXXq17seWN/w
	HL4KYaWqyXIwbtM=; b=mLJOFJUcXYhexIQbmYKgujRBWGej40YdCvl9lmnKTyQS
	jIKVPlH9yRiVfK4nt58Of4vfGdfYaZKMePlcMZEwnHMcQrzk0rOd4ZH/DrlE+UVR
	g4amRoh/+4rNdp1JyC9rDkerqV5KmdXmv+aTfjkBvSivIGh20cvbYAKQUkODQUDZ
	spqvU6bEZpuDYmLFTe6JtfbEXGksdCVVg9eV/Uvgg7+uts3Ia9MBYfa0SNW0lUXS
	F9yS1YWNZm0pHt5GE9V02HKrlOc2jin8Sai0EAdMsnyuoMe8FIRX4PME8ycf4Np/
	iIz5tYDyaypHFlrK3ilZDY5gpP8VCogBTdwC14OcFw==
X-ME-Sender: <xms:WDGFYqmVGMBQF3nwvgG0l168H73jzgKWy7A6AduI1RnAKHkyr41-Ug>
    <xme:WDGFYh2rr661ni-Eij2u-ZWVjAvtQVtjn39cHIrSdDX4cRQsp78l011F3jbZsb1hh
    AXqTDLe-JVPpQ>
X-ME-Received: <xmr:WDGFYopBpBBN6Jo_GSZwzUJ-wn_bArsuaRNgIL9SEW05o-r8x4iTf_gweZLPW5pisKG3c11OERgUCpRvgtOIqH7lcTpWwLY1Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheelgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:WDGFYulP7QQmX0nMi8Efcf749mRYQdvRlFzeGmdCx32bpjDp3z4NBg>
    <xmx:WDGFYo0g5kMdiQGGJoncFj_lc1XoFVQdNYeHtgg2Ejr8yrFfgJ0RMA>
    <xmx:WDGFYlsmHXPH9m9sSmVWehN7RG-B3BFt9IL8QxJQFZs18oPR_vCmlA>
    <xmx:WTGFYs8M6S45eX5it8FLHke9oWEYTHcNJVD4ElLo8pSme6rY_7sN6g>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 18 May 2022 19:48:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <YoUxUyE7aEphUkaz@mail-itl>
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
 <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
 <YoO1wt6Wq1+XOXsK@Air-de-Roger>
 <9ad924ae-1a40-6ac4-55ec-a468dadf5dcf@suse.com>
 <YoPCkMah/Wv5KBj9@Air-de-Roger>
 <12c5e743-0d7a-4866-ec92-03081b127619@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FCR9h3p3e0ZGkO74"
Content-Disposition: inline
In-Reply-To: <12c5e743-0d7a-4866-ec92-03081b127619@suse.com>


--FCR9h3p3e0ZGkO74
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 May 2022 19:48:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff

On Tue, May 17, 2022 at 05:46:07PM +0200, Jan Beulich wrote:
> On 17.05.2022 17:43, Roger Pau Monn=C3=A9 wrote:
> > On Tue, May 17, 2022 at 05:13:46PM +0200, Jan Beulich wrote:
> >> On 17.05.2022 16:48, Roger Pau Monn=C3=A9 wrote:
> >>> On Tue, May 17, 2022 at 04:41:31PM +0200, Jan Beulich wrote:
> >>>> On 11.05.2022 16:30, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>> --- a/xen/drivers/char/ns16550.c
> >>>>> +++ b/xen/drivers/char/ns16550.c
> >>>>> @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t=
 skip_amt, unsigned int idx)
> >>>>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >>>>>                                             PCI_INTERRUPT_LINE) : 0;
> >>>>> =20
> >>>>> +                if ( uart->irq =3D=3D 0xff )
> >>>>> +                    uart->irq =3D 0;
> >>>>> +                if ( !uart->irq )
> >>>>> +                    printk(XENLOG_INFO
> >>>>> +                           "ns16550: %pp no legacy IRQ, using poll=
 mode\n",
> >>>>> +                           &PCI_SBDF(0, b, d, f));
> >>>>> +
> >>>>>                  return 0;
> >>>>>              }
> >>>>>          }
> >>>>
> >>>> While this code is inside a CONFIG_HAS_PCI conditional, I still
> >>>> think - as was previously suggested - that the 1st if() should be
> >>>> inside a CONFIG_X86 conditional, to not leave a trap for other
> >>>> architectures to fall into.
> >>>
> >>> The CONFIG_HAS_PCI region is itself inside of a (bigger) CONFIG_X86
> >>> region already.
> >>
> >> But that's likely to change sooner or later, I expect. I'd rather see
> >> the surrounding region be shrunk in scope. Already when that
> >> CONFIG_X86 was introduced I had reservations, as I don't think all of
> >> the enclosed code really is x86-specific.
> >=20
> > My though was that anyone removing the CONFIG_X86 guard will already
> > have to deal with setting ->irq properly, as I expect this will differ
> > between arches, at which point the check are likely to diverge anyway.
>=20
> Hmm, true. What I would really like (and what I should have spelled out)
> is that the build would fail if this code was enabled for no-x86, such
> that it ends up very obvious that something needs doing there. Hence ...
>=20
> > In any case, I don't see an issue with adding an extra guard, albeit a
> > comment would also be acceptable IMO.
>=20
> ... maybe
>=20
> #ifdef CONFIG_X86
>     ...
> #else
> # error
> #endif

The whole section was wrapped in CONFIG_X86, so I haven't added it once
again. But if that's desirable, I can wrap the 0xff IRQ handling in yet
another CONFIG_X86 guard (since the spec says this value is x86
specific). I don't think having #error in non-x86 case makes much sense
here.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FCR9h3p3e0ZGkO74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKFMVMACgkQ24/THMrX
1ywGeAgAhcB4xgdQHa5q2xAibLfDPdx6l4W0LdWe0se5B2jZhqA61kxwjddWmOOj
GBh9Q8XVnalDndPNABlPXpkEhWYmBYClktFZNRzbEtnlKeAD++oQ24mCtj4OkKz0
ApZgnwCeTt5vUnvZztYGn1kEutyXa2nG8D0H049wH1wbyxHu/cZrxYbkQf3IJog1
KIGkZUzRibOsRmkQMj2uedRWkPJzxVXpVK4zmtNAPx1MER1kgr7C9W8Pqr8x4/Ss
/SW54iuW05t2EmA5ayCczkPMgf6VNJJcdE4HxAJjU02WDVqViYsziJuutFF5Uw0K
YDQr0/Mcm75aittanK7DTDR7AiZ5/g==
=nKJL
-----END PGP SIGNATURE-----

--FCR9h3p3e0ZGkO74--

