Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96876FFE3D
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 03:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533666.830500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxHAq-00024d-E0; Fri, 12 May 2023 01:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533666.830500; Fri, 12 May 2023 01:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxHAq-00022J-Ay; Fri, 12 May 2023 01:02:20 +0000
Received: by outflank-mailman (input) for mailman id 533666;
 Fri, 12 May 2023 01:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Sm6=BB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pxHAo-00022C-96
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 01:02:18 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a149df75-f060-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 03:02:15 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D43995C0AC4;
 Thu, 11 May 2023 21:02:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 11 May 2023 21:02:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 21:02:11 -0400 (EDT)
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
X-Inumbo-ID: a149df75-f060-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1683853332; x=1683939732; bh=wnH0Qc70cVHDk1ei+4Ag0/AJcDNLo1aCfp8
	Wl4W7fW0=; b=fpcPDxra+f5FvEg6yHRTxN7qAvvf/cCCwCY7vQXWfyvthOy8iCe
	Gsgf6yZfEitBG7yZwQESQ8kkgMyYSSCtmKy0P3fSjfvcMfFrrqmGen5HAQEKJTwl
	GIA4LNLeAD3uDpzbH33pLCYqJbPYhv1gDoUMKyaMPfAOye2OGJFts68+KwJBajIH
	gCxCLHMjqjmSQGfrqQyM+nAx6SAiA4e6V9QhU+Vhif/x8mMFw63jN0gpK0btG2AJ
	ZzqjTIKDr0mlJIqEIkIrEp7lR8nTH69X/RUhJHhv2BCjrFiGoO2PZTgrZrB2anGD
	gR2kSP2Oc/UHpHhLkcQEJpV031/VtgicKyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683853332; x=1683939732; bh=wnH0Qc70cVHDk
	1ei+4Ag0/AJcDNLo1aCfp8Wl4W7fW0=; b=elEyfU15rmHF25LNOKMjEpvg693U2
	grJlGQUwXQGOzwy3xXFkYsMIIU4ULNEGT8+opNZIhmsrgCDkfUWjqEEDl2Pq34Nw
	lEOaEjrQ0Aik21mE0Z6HjcYGzhu/hNdlQsXpVnD3zBy9T+CkEfcfHC73O5dUZtR1
	6/7FdcNjcqy5cMsLLWDm0+Ku9AXfqZqJnxeEn1CPqWCZpc6WAtcCjHKpdZppi+ke
	xOonHzMnI05DyQ6L9cf6MIqQwhJk97o+awD5VlfY0bJDTkHS0BfhVtcxet0Jtc/x
	bj5eER6a9S0VtJxBOWbbSK3MUQovzF47QjJ9Fsk7I/DS5AiTwNaLyl/IA==
X-ME-Sender: <xms:FJBdZBGuv8ac6YEpi4_iWe6veewN1rg7t4SJyHCQ3wHHjZO-N-N71w>
    <xme:FJBdZGV_olNl5Z-n4bc6oQCBRy4iN_oGcxi0ehvwNUzftHW2NO419FECy7oRLWh7S
    ZfC0G87jnIkHA>
X-ME-Received: <xmr:FJBdZDJUIZl0nl0Mr8Zd1zRdBQcAhO2_kMs3PJwvkC2Yy3T_fBbeqACECEl108V90URI33KRfs1C7sdSeiXl6EkrFU2_v0-gJMM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FJBdZHEx0WN8NWfXZlqZe08Ubv5cXyWSEZqXWmgY_tX9xsKOPevUSQ>
    <xmx:FJBdZHVX7UAafUDT7JYmVM6bTvQvZxtRVA2_UNNaBrh9D6h8smdFvQ>
    <xmx:FJBdZCP3Y3j2URNLNu3r_jrqrOjdzCkPbQuqmkK3AK-3bJWc5nXWiA>
    <xmx:FJBdZJK5KOHs0lbD_riupOyZOK9lyHEGCDbokpBGJEMQwMk2gKQ-ng>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 May 2023 03:02:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver
Message-ID: <ZF2QEBZz25Bi5R0l@mail-itl>
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
 <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
 <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
 <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
 <CAKf6xpuZRgQSe7=ST1sa=_vNOvDeC+bnDG4deb9m=A2M5+X2Eg@mail.gmail.com>
 <e9dd85d3-0e97-cb96-561e-75b23386a7a3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m636AhHkrpwoB9Kn"
Content-Disposition: inline
In-Reply-To: <e9dd85d3-0e97-cb96-561e-75b23386a7a3@suse.com>


--m636AhHkrpwoB9Kn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 May 2023 03:02:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver

On Wed, May 10, 2023 at 04:19:57PM +0200, Jan Beulich wrote:
> On 10.05.2023 15:54, Jason Andryuk wrote:
> > On Mon, May 8, 2023 at 2:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 05.05.2023 17:35, Jason Andryuk wrote:
> >>> On Fri, May 5, 2023 at 3:01=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>> The other issue is that if you select "hwp" as the governor, but HWP
> >>> hardware support is not available, then hwp_available() needs to reset
> >>> the governor back to the default.  This feels like a layering
> >>> violation.
> >>
> >> Layering violation - yes. But why would the governor need resetting in
> >> this case? If HWP was asked for but isn't available, I don't think any
> >> other cpufreq handling (and hence governor) should be put in place.
> >> And turning off cpufreq altogether (if necessary in the first place)
> >> wouldn't, to me, feel as much like a layering violation.
> >=20
> > My goal was for Xen to use HWP if available and fallback to the acpi
> > cpufreq driver if not.  That to me seems more user-friendly than
> > disabling cpufreq.
> >=20
> >             if ( hwp_available() )
> >                 ret =3D hwp_register_driver();
> >             else
> >                 ret =3D cpufreq_register_driver(&acpi_cpufreq_driver);
>=20
> That's fine as a (future) default, but for now using hwp requires a
> command line option, and if that option says "hwp" then it ought to
> be hwp imo.

As a downstrem distribution, I'd strongly prefer to have an option that
would enable HWP when present and fallback to other driver otherwise,
even if that isn't the default upstream. I can't possibly require large
group of users (either HWP-having or HWP-not-having) to edit the Xen
cmdline to get power management working well.

If the meaning for cpufreq=3Dhwp absolutely must include "nothing if HWP
is not available", then maybe it should be named cpufreq=3Dtry-hwp
instead, or cpufreq=3Dprefer-hwp or something else like this?

> > If we are setting cpufreq_opt_governor to enter hwp_available(), but
> > then HWP isn't available, it seems to me that we need to reset
> > cpufreq_opt_governor when exiting hwp_available() false.
>=20
> This may be necessary in the future, but shouldn't be necessary right
> now. It's not entirely clear to me how that future is going to look
> like, command line option wise.
>=20
> Jan
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--m636AhHkrpwoB9Kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRdkBAACgkQ24/THMrX
1yx07gf/UVS7bGprG0gm02N4z509P/jwKGMtyqc/NNae+FU3szbLDCnwzLw8Umad
wx4K+UoO3I4kg60Pqczja6+AVMobjxrjGcsNONmXHnSSt9DkgKX4xeSGKS1TJcks
AODBexbk6F73OtwzoKkJpiYvF896B7BwrtVy/Qimen6QlkBzZMDlk9YJT0JdYxaj
uIgf9whC8buo2VloyqSY4bYNlnJCIhaMVvqSlyLT0RYkC1xVHNbTPvqgyPKk1N6Q
2JK1M+4DQ9s5qbWl8z20QnHc+0EstjHIdnXqvPN66OpeR+j0/VwT62O6ss2EcvdQ
KaLGPnL7V2q+VGoWjyy0nkAJRMhTJg==
=UnGx
-----END PGP SIGNATURE-----

--m636AhHkrpwoB9Kn--

