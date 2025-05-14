Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB83AB77B2
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 23:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984618.1370681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFJOu-0000xP-He; Wed, 14 May 2025 21:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984618.1370681; Wed, 14 May 2025 21:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFJOu-0000vj-F4; Wed, 14 May 2025 21:12:28 +0000
Received: by outflank-mailman (input) for mailman id 984618;
 Wed, 14 May 2025 21:12:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfaI=X6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uFJOt-0000vb-AZ
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 21:12:27 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2141cc3c-3108-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 23:12:24 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2B01F11400B4;
 Wed, 14 May 2025 17:12:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 14 May 2025 17:12:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 17:12:22 -0400 (EDT)
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
X-Inumbo-ID: 2141cc3c-3108-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747257143;
	 x=1747343543; bh=L2ZpPPDQO4CfCu7s+vmi058egKPHsQJqKSoUVSUvTQg=; b=
	jFLD+riX2vThFbCrHWPHoaX8RXngNUc23+OHK/Y/XHQUcLKiSdfJlofHHeC6wLZZ
	O95JMZQGPaMRqs+/z4TWrJD9cx8PTDzaii3U2DbtiV0Lsxm4UPHgTpbtYEUkZyYl
	zreW+uAq3KcFOqkDezKNQ9Gx7GsiCLJ7L6cndbRf4zksx2PsRYvHFn8SotUUyKbn
	1QEHbNbSnR2tVKLVLCGk9wmwAIZGlXlQ3Y+DmWBZwZMg70l1x9cPLaqjBRq9j4aU
	RNISNK+eKhPIndKuTfh0BI6JKaq65v8sO/kA+F0O6NfYl9uyksvVxheW4ivfRfXM
	jQBIe9SLW8kLPea1FLiiNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747257143; x=1747343543; bh=L2ZpPPDQO4CfCu7s+vmi058egKPHsQJqKSo
	UVSUvTQg=; b=bfCnB5ddW6ZTfVGoKI8rU7MQ2JdT5RyWexsDLaaDBJH81N4K/6z
	si0JwQymkU05Eb/COBH2tj2NztdPms+2xL9moy+7AxE3J0vtnJIH1RWJqd/2UDnL
	8y5Qvx0rBGwjGAN2gpHKsY2KlxqyVBh+n/8i4dxAK0a14MkETG7BaQD3Ci7Ot+4o
	DPoTdqjgXItQ1GBxHGwa8BHb049SPngaGB1jDowiUP87v5CayyqCtypupR6AKK6V
	gRqMzyD0LObM9PMk8ld+onRyHTuBjDN/Fz4A+uQh1hY1u6v0V+aWdfuVZYwMDb+S
	Xd7Upwt7RrDLiSGtImMT3ZxbPy8VqTuEHfQ==
X-ME-Sender: <xms:NgclaKRYSqNLB7ciNzvK1yPQeS2ydVS8mqG2VP1tJH7QIPj9VnFGqg>
    <xme:NgclaPwxcYmds9oxOmM3b-SosbpjqzfmI5yR1Z_IA6J-7MWRM5f5BAudY5pMoQtbX
    g99te3Z7Rbk0w>
X-ME-Received: <xmr:NgclaH0Iy8tnAgokvkXAyau_wwqHzhf4PpTWjVYENM56yRZUbSce_KNzXxSGyEWGKjexlkvmCKd7CzB0Nlh3wK_k2oLlQ5G-EtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdektdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NgclaGBXMq1NUrfiBKO9tr8eMpfh9SicFWucbISKi8hq-pbPcjapVA>
    <xmx:NgclaDg4swGs4gCh02sqPMZmSbQPMk65pdq2w5zljbhkUU-U_KIXDg>
    <xmx:NgclaCrcV6KZuGDL9ProXHrt9ndx7JEVhDD4xBPgNgSQZKoLLmPtqQ>
    <xmx:NgclaGgLjOTa64v3Scm56kO31v5fnG78zt8DlPQIyyQgttlnUEJxXw>
    <xmx:NwclaGeki7ZXVypLfm5KtwNK00xdVGm7Iu8u-1YUtyM24qeWFwk5x-yd>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 May 2025 23:12:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCUHNP5o78QQh_V0@mail-itl>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
 <aCH4MnNQ7IzhJfkl@mail-itl>
 <aCIDj_8tDcjR1nUS@macbook.lan>
 <aCIIXkYar0TNP7H_@mail-itl>
 <aCIKrs0B5ZEi1v_z@macbook.lan>
 <aCIPuXoGm8-CsXBN@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a0Lb7Tr47sSMdF5s"
Content-Disposition: inline
In-Reply-To: <aCIPuXoGm8-CsXBN@mail-itl>


--a0Lb7Tr47sSMdF5s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 May 2025 23:12:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner

On Mon, May 12, 2025 at 05:11:53PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, May 12, 2025 at 04:50:22PM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Mon, May 12, 2025 at 04:40:29PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Mon, May 12, 2025 at 04:19:59PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > > On Mon, May 12, 2025 at 03:31:19PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monn=C3=A9 wr=
ote:
> > > > > > On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > I wanted to post another revision of the series adding hw12 r=
unner,
> > > > > > > hoping that all known issues are fixed now, but unfortunately=
 there is
> > > > > > > still something broken. I've rebased my series on top of stag=
ing
> > > > > > > (ed9488a0d) and got this pipeline:
> > > > > > >=20
> > > > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/pipeline=
s/1807819142
> > > > > > > (note due to some added debugging, some tests are incorrectly=
 marked as
> > > > > > > success even if they failed...)
> > > > > > >=20
> > > > > > > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/=
xen-project/people/marmarek/xen/-/jobs/9978694739
> > > > > > > There supposed to be an USB ethernet device connected to the =
USB
> > > > > > > controller at c3:00.4. In the PV dom0 case it's detected as:
> > > > > > >=20
> > > > > > >     [    3.911555] usb 7-1.4: new high-speed USB device numbe=
r 3 using xhci_hcd
> > > > > > >     [    4.004201] usb 7-1.4: New USB device found, idVendor=
=3D0bda, idProduct=3D8153, bcdDevice=3D30.00
> > > > > > >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=3D1=
, Product=3D2, SerialNumber=3D6
> > > > > > >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> > > > > > >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> > > > > > >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> > > > > > >=20
> > > > > > > But it's not there on PVH. The USB controller itself is detec=
ted, just
> > > > > > > not device(s) connected to it. This applies to other controll=
ers too
> > > > > > > (there should be about 3 or 4 other USB devices - none of the=
m show up).
> > > > > > >=20
> > > > > > > 2. There is a bunch of "unhandled memory read" errors during =
PVH dom0
> > > > > > > startup: https://gitlab.com/xen-project/people/marmarek/xen/-=
/jobs/9978694739
> > > > > > >=20
> > > > > > >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unha=
ndled memory read from 0xfedc0020 size 1
> > > > > > >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unha=
ndled memory read from 0xfedc0021 size 1
> > > > > > >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unha=
ndled memory read from 0xfedc0020 size 1
> > > > > > >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unha=
ndled memory read from 0xfedc0021 size 1
> > > > > > >     ...
> > > > > > >=20
> > > > > > > This repeats several times. Could be related to the USB issue=
 above?
> > > > > >=20
> > > > > > Can you try with dom0=3Dpf-fixup?  Those unhandled accesses mig=
ht be the
> > > > > > cause of the USB issues.
> > > > >=20
> > > > > It did got rid of those messages, but USB still doesn't work:
> > > > > https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/1000658=
0289
> > > >=20
> > > > Hm, is it possible that the usage of console=3Dxhci is interfering =
with
> > > > USB devices?  Could you try to boot without console=3Dxhci and see =
if
> > > > you can still reproduce the issue?  You will need the physical devi=
ce
> > > > by your side, which I'm not sure it's possible.  Don't know if you
> > > > host those remotely somewhere.
> > >=20
> > > I can try, but will need a proper driver there (in dom0?) - AFAIR VGA
> > > nor efifb doesn't output to HDMI there (and eDP is not connected).
> > > Anyway, it's IMO unlikely, given it works just fine with PV dom0...
> >=20
> > Oh, I see, that's a good data point that it works with PV dom0.
> > Handling of r/o subpage accesses is still different between PV and PVH
> > which could maybe explain this, but it's less likely.
> >=20
> > Maybe I'm not spotting it, but I don't see any specific errors (like
> > timeouts) from the XHCI controller on the log?  Neither there seems to
> > be any errors or warnings from Xen.
>=20
> I don't see any either...

Roger, it looks like your balloon patch fixes the USB case too :)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--a0Lb7Tr47sSMdF5s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmglBzQACgkQ24/THMrX
1ywRLgf+OhDxM87oIt4TdU8ldQchCfEpn6pJqOomhURVC1SHuKOyhfqnrywC9c3h
6MEMzABbiSFkZjVT/tYEWqWv8QYBK5M6nVaKyTdoKcVr/C1hXLAm2ykTIvcRa93B
wbkO4o1AdhdCVXZ1/wF6uQWi2PN92F1wwuyIZKnAD581SBn/pKzbG+PBUBKdurXw
cG0w0Wp2D+LyT6Ge6nsoHPCvArf1lo/oy9Vt0nuzt6VZ0kfYE24un/EIuoEAVLl8
BeWQP0z83+InWhxdsa+UXTpFrqOp2/WLX5ydOkPIMx0G48IEb5mE11j3pNjLozW0
rXxjlfEAHiKm0ecY5XK5OE7b5QwJww==
=v/w7
-----END PGP SIGNATURE-----

--a0Lb7Tr47sSMdF5s--

