Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C7AB3BB6
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981699.1368110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUoz-0006kp-Pz; Mon, 12 May 2025 15:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981699.1368110; Mon, 12 May 2025 15:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEUoz-0006hr-NH; Mon, 12 May 2025 15:12:01 +0000
Received: by outflank-mailman (input) for mailman id 981699;
 Mon, 12 May 2025 15:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVxJ=X4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uEUoy-0006fd-3q
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:12:00 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71d7161a-2f43-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:11:57 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 455191140152;
 Mon, 12 May 2025 11:11:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 12 May 2025 11:11:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 11:11:55 -0400 (EDT)
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
X-Inumbo-ID: 71d7161a-2f43-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747062716;
	 x=1747149116; bh=7jc6TjKAOKtRsxnHmSgPk0zJ1JgwyBLUJAhdDZv3T1A=; b=
	ig9brFlmWR7T7UPQ3XwhfMljdbnNuGszNu4E3sVSV6ndFrFef3z4p9qId8clAVwD
	Lf10rnQxGZcZ3q9p3JV0z6fXaWP8zzsobC3u6jcYi4TfFPPvqzo6EdmFtyu70Fae
	llVaxVoeKWrJ/yFLuDjjUHjcbB+T6LZHKr7swU/BAQWSTFpoepjGbcCpDeK1m7cA
	ks8Jzy7zQCSeyvC5oqLJ8SQzd+Q4EhUA9UPU+X3WJh94cA3clBtXXkUYcjVlO3pg
	sKmDTWmvNrWUJ5Udn5ILVrUfTfRG54c++63glrUT2SAQI5S9iIhWtSEcc8jMYNRL
	ivuQHyLKXmJIU7A2AjejFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747062716; x=1747149116; bh=7jc6TjKAOKtRsxnHmSgPk0zJ1JgwyBLUJAh
	dDZv3T1A=; b=Z8cAyo+WG4r2Zi2pJSBfMQf7FnH2hQj/mWc7fApLdG57mXADU6L
	Q2WVEkD84V1C5KZwloRYpFsV8q4w9rBxTAurUPZ9+8Py+9TLukbMpjfgyw7pozU4
	Q0iE1JcLM+b9S8jLl0BCzEAsa/Qw2uEzcWm68cZYSmAXFt8/ew1jILB4IPEcE9Nt
	QyEJ8d3ruF51MMgSo2NgIj0g3Gt1KQJBPXZuW0fhWKdCuTWDjT7fd9PV39SXpTXj
	KUULQekfAkJYGMT6YvvI/e6oSAD0BCk1jOp/ifXMdEEyHhyr8ihKwBhs4/k4TMLd
	RxQ0HDSs6kSlmoChJxZpqaYEuviM7eymecQ==
X-ME-Sender: <xms:uw8iaKrLlBdAs8kbAlisPZEHagN8uN9Lf40kmFvtLbF6SBcYGuT3WA>
    <xme:uw8iaIqPAy7sX7PDhDalJclmRa-RyzZ_TtMiSuHjo6dZNaNJZ22WNSOD2DeFBCazt
    9uvSZ6St_mslQ>
X-ME-Received: <xmr:uw8iaPNxEsHisRwUeI1eb4v2jkZ46edv6Q3bJh4VFUXWVU7z-28JgKriabJB2U4GtJcVpHVol_YP9YgCZWpRnCw4y_DZL0Bi1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepveeujeetgeelleetudeuvefhtefgffejvedtvdfgieevheethe
    elgeeuledvjeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggt
    thdrohhrgh
X-ME-Proxy: <xmx:uw8iaJ5CItL3I4eCjHyF55VX4ruI28Ne3ngt8Q-zgZTUPfVgmk9Vaw>
    <xmx:uw8iaJ4VXOqFflZ221zdlg0b9gaEP5aFZgjiw99b-l0YZfisrjmuKw>
    <xmx:uw8iaJjEL_esZqR3Plb_KWjEiVo1-pjuT4MEU8cE-nKDBy5MrffPiA>
    <xmx:uw8iaD7WtKhkheQqgn59KdR1P3BX6lPaxlJnVvRvbWXVLZ0QYxF4gg>
    <xmx:vA8iaP057-1_2h49qddpLPePL5U0iAtDgI54HY5YiVS4n-JnqT2GV0uj>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 12 May 2025 17:11:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCIPuXoGm8-CsXBN@mail-itl>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
 <aCIDj_8tDcjR1nUS@macbook.lan>
 <aCIIXkYar0TNP7H_@mail-itl>
 <aCIKrs0B5ZEi1v_z@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jr4GwN9SOrWZoMwX"
Content-Disposition: inline
In-Reply-To: <aCIKrs0B5ZEi1v_z@macbook.lan>


--Jr4GwN9SOrWZoMwX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 May 2025 17:11:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner

On Mon, May 12, 2025 at 04:50:22PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 12, 2025 at 04:40:29PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, May 12, 2025 at 04:19:59PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > I wanted to post another revision of the series adding hw12 run=
ner,
> > > > > > hoping that all known issues are fixed now, but unfortunately t=
here is
> > > > > > still something broken. I've rebased my series on top of staging
> > > > > > (ed9488a0d) and got this pipeline:
> > > > > >=20
> > > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/=
1807819142
> > > > > > (note due to some added debugging, some tests are incorrectly m=
arked as
> > > > > > success even if they failed...)
> > > > > >=20
> > > > > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xe=
n-project/people/marmarek/xen/-/jobs/9978694739
> > > > > > There supposed to be an USB ethernet device connected to the USB
> > > > > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > > > >=20
> > > > > >     [    3.911555] usb 7-1.4: new high-speed USB device number =
3 using xhci_hcd
> > > > > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=3D=
0bda, idProduct=3D8153, bcdDevice=3D30.00
> > > > > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=3D1, =
Product=3D2, SerialNumber=3D6
> > > > > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > > > > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > > > > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > > > >=20
> > > > > > But it's not there on PVH. The USB controller itself is detecte=
d, just
> > > > > > not device(s) connected to it. This applies to other controller=
s too
> > > > > > (there should be about 3 or 4 other USB devices - none of them =
show up).
> > > > > >=20
> > > > > > 2. There is a bunch of "unhandled memory read" errors during PV=
H dom0
> > > > > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/j=
obs/9978694739
> > > > > >=20
> > > > > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhand=
led memory read from 0xfedc0020 size 1
> > > > > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhand=
led memory read from 0xfedc0021 size 1
> > > > > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhand=
led memory read from 0xfedc0020 size 1
> > > > > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhand=
led memory read from 0xfedc0021 size 1
> > > > > >     ...
> > > > > >=20
> > > > > > This repeats several times. Could be related to the USB issue a=
bove?
> > > > >=20
> > > > > Can you try with dom0=3Dpf-fixup?  Those unhandled accesses might=
 be the
> > > > > cause of the USB issues.
> > > >=20
> > > > It did got rid of those messages, but USB still doesn't work:
> > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/100065802=
89
> > >=20
> > > Hm, is it possible that the usage of console=3Dxhci is interfering wi=
th
> > > USB devices?  Could you try to boot without console=3Dxhci and see if
> > > you can still reproduce the issue?  You will need the physical device
> > > by your side, which I'm not sure it's possible.  Don't know if you
> > > host those remotely somewhere.
> >=20
> > I can try, but will need a proper driver there (in dom0?) - AFAIR VGA
> > nor efifb doesn't output to HDMI there (and eDP is not connected).
> > Anyway, it's IMO unlikely, given it works just fine with PV dom0...
>=20
> Oh, I see, that's a good data point that it works with PV dom0.
> Handling of r/o subpage accesses is still different between PV and PVH
> which could maybe explain this, but it's less likely.
>=20
> Maybe I'm not spotting it, but I don't see any specific errors (like
> timeouts) from the XHCI controller on the log?  Neither there seems to
> be any errors or warnings from Xen.

I don't see any either...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Jr4GwN9SOrWZoMwX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgiD7kACgkQ24/THMrX
1ywHmAf/a1KY5fMYQXtARL8pIynDdEoFAeDFszzLP302nxijIBCwGTVe3nQzJI+N
enbqhUdR9JwWc2nVOY2V40gqzYEx5FVXUDZWjJlhTmRsG/RJTE63+FAX2OjwBRV4
ZQv1bmgtPrpdmVwEgdyXVDenj7/P/L27WgW2aQEJxmFczhx19EFvvDS9jbM/RfOA
kH/jhg6kTNzF2WzBZtV9jYIoZ1GcCygJhgquKLUHUiMSBSwsHlfdJY/04oZaOhxi
Rwc6NECWIA87jm/xx0lZTz5hrE8kMyf/LvdLCuO9LitElhur5H2kokhhiOXfQKwI
OLfpJSVXX7GHaoVt7VYODBQ6TN3pMg==
=wbne
-----END PGP SIGNATURE-----

--Jr4GwN9SOrWZoMwX--

