Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D4DAB3950
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981472.1367870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETFu-0003sN-77; Mon, 12 May 2025 13:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981472.1367870; Mon, 12 May 2025 13:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETFu-0003pQ-4O; Mon, 12 May 2025 13:31:42 +0000
Received: by outflank-mailman (input) for mailman id 981472;
 Mon, 12 May 2025 13:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVxJ=X4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uETFr-0003pK-UF
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:31:40 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce03bfa-2f35-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 15:31:36 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D455B254010B;
 Mon, 12 May 2025 09:31:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 12 May 2025 09:31:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 09:31:33 -0400 (EDT)
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
X-Inumbo-ID: 6ce03bfa-2f35-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747056694;
	 x=1747143094; bh=2613pibrfGOHnaBEKtDJgenzrRFpzBW4dNT0wxAH9Dw=; b=
	EbK4ZMqGvrFQej4FWs1DPvFNIfljX97EPitjHFAERKsRKlKZXmJjiIClmtyMr/FC
	PoBMmIC7cpKJuSpTUHWtQnhEALWSwARRLqxWzMWIg7ifj6/drTe7tzP6wAb89BMs
	HnM6XPbcxR+nXeoBef/s1QNPRo3qGRnDVsMXBOCaxz2lYNJPjK+v4gVQ3nmtHlCR
	1U9c9QQ9GtoTPIO8J/jSCd2GSGTJB9LKx4DjryM8ErcVv2D822phBGPqO/OuRC4c
	y3saePk0N6puR3BJ6/zryeKDMw+c8/NpJFNgg331iPPBMTphHdVvV0lcEv+E8Nck
	77pPazUDOIl/bWuIQCWlbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747056694; x=1747143094; bh=2613pibrfGOHnaBEKtDJgenzrRFpzBW4dNT
	0wxAH9Dw=; b=hYEvoc3Ch/GMt+C13g8ZJ35igRPpo+vaTCnEIPTttQBu7vI0kGs
	kw+V0x+McjkjgxP2VLpxvbrgukytwfJs9ktPbqzPNuFM+iBeNJY1SJD96pbF8bGg
	jXLqufNmtXHPE+T+Cy5D1Ci5735iLsZacJ+8x/LV4q5cHbubPfAJAI6IJEa7QP6X
	yfXN+ZShDGSUX5Q5sYmvO7ELYwePgOqX5929fgY3OCC2lZedKbIkJv2vaoCR78zH
	nKi2mBtdCbndB3pa8J/lvQvQ5uNJ2AknPxaDFMRoUKSeZRc9IQyAlV2WFUfzesR1
	mGiGK1y8iRR1jSAn1tEK3DZoewwYCD19Pow==
X-ME-Sender: <xms:NvghaMhUwO3S1YSiE5KULB_3VY82UfZMI4YGS2l5huKY9QO1eZifcQ>
    <xme:NvghaFDlZed4UOgqHI-VWH6MA-eeUCDtb-QFrc0-3mC9f3KBobkjDUWM1RT2jexCq
    ricgE8kEcO9vA>
X-ME-Received: <xmr:NvghaEHbiM_lH1mKY9_Nq1OTstxQiH5AZ1fEfmYCCqN7lfvHXRJ1X8citifKx2bQDhdEIxX9Ov-TUdPPbw3fFfHfYUiOPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddufeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NvghaNQsERWBD49dw_xB5LiCYF7d154dCPLTXw0MbK6zto0ek1zjww>
    <xmx:NvghaJxSSs46hC2PIjg-3dq03APYRaeb3p6y3iPSROXFQ5UM0Yo22w>
    <xmx:NvghaL7wk4y29klEVfH5wS0wLvHJOp9BxAHPcAPh5D374MWhZfPFew>
    <xmx:NvghaGzGDeuF2S-fpEe_aNtJldDc6pYqtdREJwb_NMZ-lFdzto6R2g>
    <xmx:NvghaOtfHTlJl8yGciJl5asuoo81Zay9BIGfK9Ta2OBFRBx-JCSl3Pby>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 12 May 2025 15:31:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner
Message-ID: <aCH4MnNQ7IzhJfkl@mail-itl>
References: <aB0XtEor2rCxBKWR@mail-itl>
 <aCHMwWd7cq-ZIMOl@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p2yanDuF2DT+GMpm"
Content-Disposition: inline
In-Reply-To: <aCHMwWd7cq-ZIMOl@macbook.lan>


--p2yanDuF2DT+GMpm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 May 2025 15:31:19 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Issues on Zen4 (hw12) runner

On Mon, May 12, 2025 at 12:26:09PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, May 08, 2025 at 10:44:36PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > I wanted to post another revision of the series adding hw12 runner,
> > hoping that all known issues are fixed now, but unfortunately there is
> > still something broken. I've rebased my series on top of staging
> > (ed9488a0d) and got this pipeline:
> >=20
> > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/18078191=
42
> > (note due to some added debugging, some tests are incorrectly marked as
> > success even if they failed...)
> >=20
> > 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-projec=
t/people/marmarek/xen/-/jobs/9978694739
> > There supposed to be an USB ethernet device connected to the USB
> > controller at c3:00.4. In the PV dom0 case it's detected as:
> >=20
> >     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using =
xhci_hcd
> >     [    4.004201] usb 7-1.4: New USB device found, idVendor=3D0bda, id=
Product=3D8153, bcdDevice=3D30.00
> >     [    4.004675] usb 7-1.4: New USB device strings: Mfr=3D1, Product=
=3D2, SerialNumber=3D6
> >     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
> >     [    4.005349] usb 7-1.4: Manufacturer: Realtek
> >     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> >=20
> > But it's not there on PVH. The USB controller itself is detected, just
> > not device(s) connected to it. This applies to other controllers too
> > (there should be about 3 or 4 other USB devices - none of them show up).
> >=20
> > 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> > startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978=
694739
> >=20
> >     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memo=
ry read from 0xfedc0020 size 1
> >     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memo=
ry read from 0xfedc0021 size 1
> >     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memo=
ry read from 0xfedc0020 size 1
> >     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memo=
ry read from 0xfedc0021 size 1
> >     ...
> >=20
> > This repeats several times. Could be related to the USB issue above?
>=20
> Can you try with dom0=3Dpf-fixup?  Those unhandled accesses might be the
> cause of the USB issues.

It did got rid of those messages, but USB still doesn't work:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/10006580289

> > There is also, likely related:
> >=20
> >     (XEN) [    5.002036] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIR=
Q 2484: unsupported address 0
> >     (XEN) [    5.002365] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIR=
Q 2484: unsupported address 0
> >     (XEN) [    5.002693] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIR=
Q 2484: unsupported address 0
>=20
> Is this at shutdown? (doesn't look like by the timestamps).  There are
> cases where Linux zeroes the MSR entries while the capability is still
> enabled, and that results in those messages.  They are usually benign.

That's not shutdown. But also it's a different device than I care the
most, so I guess I can ignore it for now.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--p2yanDuF2DT+GMpm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgh+DcACgkQ24/THMrX
1ywaEggAhFREFFmDu2upT+LEJTp/+Df1BhPloGT7IyMhsSaJiifxSJil1VxQbxOn
3x1kBgTiZlZQU0S+WdGtPIKJkaHifJt7LVcdK8DRGdj8SOexzuDRd8Cs+8Zpgmcy
u2lJIZXY6Dpyt90AxzEdRIl7YXc9UPl6clpn9rNIUI6RvvPGXZfLcog0LkA+lOdu
4USMcatr5UYeP7/uyC/kqZs4gmUskPO4OWt9hNILTSuy5o/N0sawtda7aDEnN53G
PJG6HvEVUokDx2myTU4r4IVVluSd8Tu2ZV9Z/47VCSkOZgsL2j59Vw46SOa1WKj2
jiW5tE+ogyA2YfbgYQ/BdgTfVp6uag==
=sXE6
-----END PGP SIGNATURE-----

--p2yanDuF2DT+GMpm--

