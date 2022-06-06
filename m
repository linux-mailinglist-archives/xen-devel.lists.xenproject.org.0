Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6B53E5D1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 19:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342662.567734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyG9n-0003TX-9a; Mon, 06 Jun 2022 17:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342662.567734; Mon, 06 Jun 2022 17:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyG9n-0003Qn-5v; Mon, 06 Jun 2022 17:04:47 +0000
Received: by outflank-mailman (input) for mailman id 342662;
 Mon, 06 Jun 2022 17:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyG9l-0003Qh-9A
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 17:04:45 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d040df-e5ba-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 19:04:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id EFED35C00EF;
 Mon,  6 Jun 2022 13:04:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 06 Jun 2022 13:04:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 13:04:37 -0400 (EDT)
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
X-Inumbo-ID: c0d040df-e5ba-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1654535079; x=
	1654621479; bh=hcfGpKGkS/9iwKrvuCJTKt3bI0+5tbPMzlzGdi+DVB8=; b=T
	neXTQCNrnFutC04mYjsiLR6lIUJ0FK6L7VjdrTBFglMF8usXopgDk1A2tqyPlEjM
	70ZVqxrTcNJDNKGJaiZeeGvyxVmMY6ja3VP0wZ3B74bB3m0DDWVe3FTsD+oGNMz7
	inobeS3plHybu7Sr4RLkrGX9I+ZkKhXB/54Y/cq27eVcreaZhYRMW8xMbEbctIrV
	yAbSbZKiqQ3vbzxcQb6gGM39v/SXFFSGWTZFZvByiEH1ag+oKEs45EVx7Bm2P8Rp
	WrtiWA9qLRD/+T90XEMOTmYpPbHPz/KTiibRIwezQKHSENJmlncN0MWRX74FujlS
	xn49o07tiYn7n42hjzSFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1654535079; x=1654621479; bh=hcfGpKGkS/9iwKrvuCJTKt3bI0+5
	tbPMzlzGdi+DVB8=; b=jVAbXvYmp/4umacGNwbrxWxOEnaUjzrL61solks6nNe5
	wjjJskToGG818vSXogIrH+vOmUIKCmf8B+CILhIdWQVrU1vTjNQnbCpv2iLCFDcq
	oNPiJU5B9pkob6G9J5tMv2P0OofXJzIVMEycT/pFApcVJqueVJDFN9AhlLDSQGGq
	VAnDfF74BP3zYK/mht4wiBBAd3wSosqtfJG/2+YSihduX/MNw6SihSj0SqT/Hjxz
	uIpDiH403TmtB+WboTlSvrRNk5HQhB7N8MwV7/5CvEzd2mPWDhgpulg5f5nTnHKb
	JWQ5BGZJx/CtuolnWL49U6ipei8+6ze4YTPlhPY1yw==
X-ME-Sender: <xms:pzOeYgXRsUXUTsnzfaVMgOf8wpA2IUjHKN2s3ZBXnizeCvYK6z5sYg>
    <xme:pzOeYkmZEr0xswikKlxjRa18IEy183TgZE-_8G4X8w3iHpjohuC2rf5zu9DRGDW-f
    HKtA4Gysl80sA>
X-ME-Received: <xmr:pzOeYkYyT8vRKyZ_0PYB5Ale6IklTMTUfXx39452DSz9WQs3nAOfp24dnaOrovdak-mrxBQscE2ZksV_rw3s5-GSK7nYjCIyMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:pzOeYvW3Tgk3ualzId29zcGUoUauxwGBNUdlCKTY6q9prHQlt7evvg>
    <xmx:pzOeYqk16ve4W218pIn8USRa2LtNjy4DGVI2NSxhdQzxvnYoZrfhsw>
    <xmx:pzOeYkdLoYG69Y_JbvPkivIC6cjFeQXSNxa1bqEnXB9xmZaVNdd6og>
    <xmx:pzOeYoaBeVf7m7q_PPVBaPgf0LSViWWGfgEE0ByzcR-MV6PlWNFLzQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 6 Jun 2022 19:04:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger
Message-ID: <Yp4zo1UQV19euwRb@mail-itl>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
 <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com>
 <Yp4JLd8UGS3jjD5Z@mail-itl>
 <CABfawhmz3+EJZ6qrqKOQ==Hmm93i+a4WBk8FcbOaBSxmaM3New@mail.gmail.com>
 <CABfawhkkGr6Lp4SBEw7nsqfUs28QEqoCuVgTRBg9ZUCirLW5_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I253qF8crHtcqfQr"
Content-Disposition: inline
In-Reply-To: <CABfawhkkGr6Lp4SBEw7nsqfUs28QEqoCuVgTRBg9ZUCirLW5_g@mail.gmail.com>


--I253qF8crHtcqfQr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Jun 2022 19:04:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger

On Mon, Jun 06, 2022 at 12:57:26PM -0400, Tamas K Lengyel wrote:
> On Mon, Jun 6, 2022 at 10:10 AM Tamas K Lengyel
> <tamas.k.lengyel@gmail.com> wrote:
> >
> > On Mon, Jun 6, 2022 at 10:03 AM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Mon, Jun 06, 2022 at 09:32:52AM -0400, Tamas K Lengyel wrote:
> > > > > +/* Supported xHC PCI configurations */
> > > > > +#define XUE_XHC_CLASSC 0xC0330ULL
> > > > > +#define XUE_XHC_VEN_INTEL 0x8086ULL
> > > > > +#define XUE_XHC_DEV_Z370 0xA2AFULL
> > > > > +#define XUE_XHC_DEV_Z390 0xA36DULL
> > > > > +#define XUE_XHC_DEV_WILDCAT_POINT 0x9CB1ULL
> > > > > +#define XUE_XHC_DEV_SUNRISE_POINT 0x9D2FULL
> > > > > +#define XUE_XHC_DEV_CANNON_POINT 0x9DEDULL
> > > >
> > > > I had to add an extra device ID here to get it working on my NUC,
> > > > would be nice if we could add that to the list of supported configs=
 so
> > > > I don't need to custom patch:
> > > >
> > > > #define XUE_XHC_DEV_COMET_LAKE 0x02EDULL
> > > >
> > > > The patch is here:
> > > > https://github.com/tklengyel/xen/commit/dd0423aba6caa4ef41dff654705=
98a1c0c1105ae
> > >
> > > Interesting, I think known_xhc() is used only in the EFI variant of X=
ue.
> > > Xen one just looks for any XHC based on the device class. And indeed,=
 I
> > > works for me on Tiger Lake that is not included here.
> > >
> > > I did need to select specific controller, since I have 3 of them:
> > > 00:0d.0 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4=
 USB Controller (rev 01)
> > > 00:0d.2 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4=
 NHI #0 (rev 01)
> > > 00:14.0 USB controller: Intel Corporation Tiger Lake-LP USB 3.2 Gen 2=
x1 xHCI Host Controller (rev 20)
> > >
> > > So, I need dbgp=3Dxue2 or dbgp=3Dxue@pci00:14.0.
> >
> > Interesting! OK, I'll give that a shot and see if it works that way
> > for me too, it's certainly been a while since I last tested :)
>=20
> Yeap, with console=3Ddbgp dbgp=3Dxue@pci00:14.0 it works as expected.
> Xen's boot does hang if you don't have a debug cable connected or if
> the other end is not plugged into the right USB3 port. Not sure if
> that behavior is documented anywhere. Once I found the right USB3 port
> on the machine that receives the debug output it started booting and
> everything works expected (ie. one-way communication only).

Indeed, the indefinite wait for the connection is not the most
convenient. For debugging, I added some timeout, but it was based on
the loop iterations not an actual time (not sure if there is any time
source available at this early stage...). I'll see if this can be
improved.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I253qF8crHtcqfQr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKeM6IACgkQ24/THMrX
1yxoiwf/VqgGjT8amugHOiHkDWgx4j1qB/NtSaOIRwYmrsFeaunBDi3VeNZCSPLL
xI9CtNbH4Do3SqSYyyPcFtct7gCP4dCyM0MeS7AeqN6O1sZ55SCRblGzbXXwrQyi
HOposvRgSSzv8Muw/wNW8LvRr9EmPhU4HbaP/O3E/WTnbYpmbmiY0MugZAqgBouH
LUiWqg28zmQjpvrwMrTpLeLzDJV2LJMu5vrAltbH7//tGgyTeGhsBzgtPiWNRWOk
NBH8HtvvNdVihC8ikHDTcnQKSytrIKbQ6jYtWnIiiBQPOPQ4IFgRkU44sAjP3sBD
tFtddmRxdrPqF11mw0B18NkCBqzFoA==
=7044
-----END PGP SIGNATURE-----

--I253qF8crHtcqfQr--

