Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C290B5AD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 18:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742510.1149322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJEoi-0005Tt-15; Mon, 17 Jun 2024 16:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742510.1149322; Mon, 17 Jun 2024 16:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJEoh-0005Qk-Ua; Mon, 17 Jun 2024 16:02:47 +0000
Received: by outflank-mailman (input) for mailman id 742510;
 Mon, 17 Jun 2024 16:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Jjg=NT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sJEog-0005Qe-2Y
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 16:02:46 +0000
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com
 [103.168.172.147]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0771ac38-2cc3-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 18:02:43 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfout.nyi.internal (Postfix) with ESMTP id 2A4EE1380257;
 Mon, 17 Jun 2024 12:02:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jun 2024 12:02:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 12:02:40 -0400 (EDT)
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
X-Inumbo-ID: 0771ac38-2cc3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718640162;
	 x=1718726562; bh=Acb1tUk4yc+J2PZ0FemvMFzaNS+v52Y0cg8sMBNp2wE=; b=
	iSZqrenb4ST6kXzdZzoQwJe0r6xhzP02F9VO1I77btueZcTZ3JKmrq8lwrcbWFKF
	7OUkl6mDQG/l+jq5qUxfmu/FOPh+RCC1kpDPsNzQuA8VssyCfjNjFjX7OVMOUFHM
	JSePBxDwHVw5yGiO8uUJeNSULLjMQQ6Eptpcu6Dx0i0/vx7zpG6l00HpU6ndj8Oc
	osgOQNfKzNFDgNtoos/QUT8aDaXcjhWDTITU3JKW+0JLfxbXlnzZlAS9MW3tpP9d
	w4jB2dgTPshElOWwSnLGik1E26Egdyf/gU8bFUQu6pX2/Nem4hliDd+YL+r1z2gZ
	LukpnaEFkN+trw+TPQHzTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718640162; x=1718726562; bh=Acb1tUk4yc+J2PZ0FemvMFzaNS+v
	52Y0cg8sMBNp2wE=; b=AAeT6JA9hGrQbWQxtQtBC520Wj4m0rTax5dXp99J89ir
	fKP9hbHVe7wGdUcMquF0Kvyh705RsB1T2l5OqOuZGdTgE67f/a6Gtc0ICPQlJvhk
	Styt/FK40++lw+VrjeXdD3MBcIFsmeR7geK8ChW5qrV3jYQoY6d9Ntcfm0zEWIZN
	+zQvUlPHtpkwy6THbgbC0EJFcR0dawvD8lUh8FF54CfrbQGE0Rk1xNzRJY+OiR1m
	R2ItP3kTNN900ZTx0er90csTe/HeiLAUq+RLKTRDTv33jD4DI/H4L9PsQq04zxtq
	oGhriM+S2bAlXyDSz91SUeIrYyWRoKVorm3ZTj+/0g==
X-ME-Sender: <xms:IV5wZuIKpk1g4YQpQq7CulvfwU0LB9rR8Tgqdy6LVrvbbhRDj6mU-A>
    <xme:IV5wZmLKx4l0w2ABbNDRB5-WEsBRF1uJmMUVOL3xQBpsuEjQeuhGpZVt-PWd4G5A_
    3QCzb01ml8Ss6U>
X-ME-Received: <xmr:IV5wZuuPna_0O4-WLf5JJ6edG1bikaguozK6FGKDpgbmrZqf8oSL8JjDobvzXVvFYWsdZdyjc87chfVLmAbhz0GAqUCtm1TrTZxGL4nPGrLEtBLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:IV5wZjbV6hC4p2Cj1xMQPrh2zYljeX5gshb79G9WbU8na1TFMMKLSQ>
    <xmx:IV5wZlYQl82D6IZxyHkbmltMDmT3aSm9hKpaaFIbTqOUnoOW68nuoA>
    <xmx:IV5wZvDULWZRQkRZslo1UE5HLeX9Mz8_0Qr5ccAJeIaA3mCmRw1K5A>
    <xmx:IV5wZrbbsI6fuFa7H8k0eQ-OwhpA6y77tr6GLazlQELTIQuqru4l4Q>
    <xmx:Il5wZqPsE13fmFglEQZXmEK6gtnQZHGULqUbGcgIkxRr9e8Fsl_sIjat>
Feedback-ID: iac594737:Fastmail
Date: Mon, 17 Jun 2024 12:02:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnBeH_SXvFgwCsEZ@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <Zmxze4a0PZbwcLSb@itl-email>
 <10c2ab19-e2b7-4f5f-ae73-213e0194bb8e@suse.com>
 <ZnBTn6FXXOpnBJCb@itl-email>
 <acad1669-ceaf-463b-ad1c-4e290ccccb23@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eSYgnFjd2QIBSMRA"
Content-Disposition: inline
In-Reply-To: <acad1669-ceaf-463b-ad1c-4e290ccccb23@suse.com>


--eSYgnFjd2QIBSMRA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 12:02:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Mon, Jun 17, 2024 at 05:39:23PM +0200, Jan Beulich wrote:
> On 17.06.2024 17:17, Demi Marie Obenour wrote:
> > On Mon, Jun 17, 2024 at 11:07:54AM +0200, Jan Beulich wrote:
> >> On 14.06.2024 18:44, Demi Marie Obenour wrote:
> >>> On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> >>>> On 14.06.2024 09:21, Roger Pau Monn=C3=A9 wrote:
> >>>>> I'm not sure it's possible to ensure that when using system RAM such
> >>>>> memory comes from the guest rather than the host, as it would likely
> >>>>> require some very intrusive hooks into the kernel logic, and
> >>>>> negotiation with the guest to allocate the requested amount of
> >>>>> memory and hand it over to dom0.  If the maximum size of the buffer=
 is
> >>>>> known in advance maybe dom0 can negotiate with the guest to allocate
> >>>>> such a region and grant it access to dom0 at driver attachment time.
> >>>>
> >>>> Besides the thought of transiently converting RAM to kind-of-MMIO, t=
his
> >>>> makes me think of another possible option: Could Dom0 transfer owner=
ship
> >>>> of the RAM that wants mapping in the guest (remotely resembling
> >>>> grant-transfer)? Would require the guest to have ballooned down enou=
gh
> >>>> first, of course. (In both cases it would certainly need working out=
 how
> >>>> the conversion / transfer back could be made work safely and reasona=
bly
> >>>> cleanly.)
> >>>
> >>> The kernel driver needs to be able to reclaim the memory at any time.
> >>> My understanding is that this is used to migrate memory between VRAM =
and
> >>> system RAM.  It might also be used for other purposes.
> >>
> >> Except: How would the kernel driver reclaim the memory when it's mapped
> >> by a DomU?
> >=20
> > The Xen driver in dom0 will register for MMU notifier callbacks.  When
> > the kernel driver reclaims the memory, the Xen driver will be notified,
> > and it will issue a hypercall that tells Xen to remove the memory from
> > the DomU's address space.  Subsequent accesses to the pages will trigger
> > a stage 2 translation fault that is handled by an IOREQ server.
>=20
> And such an ioreq server, which I assume isn't going to run in the Dom0
> kernel, will then also need keeping up-to-date on holes in the (virtual)
> BAR. Oh well ...

My initial plan was that it _would_ run in the dom0 kernel, because this
results in a cleaner userspace API.  Ultimately I think it is best to go
with whichever approach keeps the kernel code simpler, but I'm not sure.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--eSYgnFjd2QIBSMRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZwXh8ACgkQsoi1X/+c
IsFHIw/9GlnPySED9eXtWpbMH9pwdE7KxE/VNsD1QMO3KSyTpHlVTahtHhOrWJ+B
s1le+k6OHjzNap8/c8R9GZMncAvvbhfOhbufnw5Je0nvfOr1XUqIbex22fQZSg8y
7OosYrMu9F9t8WOQwkca2Oge7/4MMgKDWf+20xFHjHbpujUptofWUXTWRCK6k7jA
+awLoT1Kg71ZFxGLo2n1sTS56gi0H2K7oXPE9MGdk/VGVhRiA/s+6TVYeJx09Oyv
ueNj00UciYcez3PfWP+5qc2ziAW3XRo1ZKgnIfxgMdzb5t2dorQJGu65ADckDJ+z
hnfYLy3VSBqgwUhHxacf2na/BsMadFRRJR1Urtb5zWcJ9URJ/YNgX1/Yle5BxpfD
xhfEdUAx2VeCQ/h2Tjr3KweGvmkeaNZ5QjPE7npiXXl7Yz1h/TUhZSYlQ0vEeW0q
mM1CRRFRdSkbdTpYXZSjZ2EWiUher+OGkmsT6ylfcnSEMY00jpXsmoKyINmbKv69
oV7lM0AiJY1l2gQHzxJvnLni8bHHhxkUZD591L6yyKU4hRsbZvRt7L1UM6W3zyg7
tUuZDGygDDygRCy4Sk89xFrXuLrp2cgjQlhQQpb1iHHrc+2HglqTHVg8hq8mce9y
YvdcdTNSkwKIUNAnbxa1lLDneJ83xHOnU5IoC2da7bqlypRgneE=
=OO/s
-----END PGP SIGNATURE-----

--eSYgnFjd2QIBSMRA--

