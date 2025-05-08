Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1BAB04DE
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 22:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979597.1366134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD86l-0001Hw-RQ; Thu, 08 May 2025 20:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979597.1366134; Thu, 08 May 2025 20:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD86l-0001F5-Nj; Thu, 08 May 2025 20:44:43 +0000
Received: by outflank-mailman (input) for mailman id 979597;
 Thu, 08 May 2025 20:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uD86j-0001Ez-Hg
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 20:44:41 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42d3b70c-2c4d-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 22:44:40 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id E02D811400E7
 for <xen-devel@lists.xenproject.org>; Thu,  8 May 2025 16:44:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 08 May 2025 16:44:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 8 May 2025 16:44:38 -0400 (EDT)
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
X-Inumbo-ID: 42d3b70c-2c4d-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1746737078; x=1746823478; bh=PwO9USl0xy
	1bpjtdKoVFUG++naPzLOfDRLfYMGngNmc=; b=lS1uU+ckU1zNw1KhWCh+1tblRc
	Qpuk5vZyBvHhzzluUfI1cjCEP2PW30PMvTGp0Sa7lJbQMbOi/ydASrjB3aFpwKGW
	YahjAGYnVaU0vLgnxGuVmiaLLYrgTzUKb+VdAdkiU1qZm3tLADlLiAPRdqztJRhL
	bGhA1sW49bKgHeVve0EVr7uufNI2TtudlieYEV0mrs36Oj6bkzdVM9Sv781SBWk9
	6wyRvsFQxf9ZHKLJmCQBcUvZXdtoIuPaO8Ya0XfYFmIhLnpVr85cMcj25nVOQSRJ
	4WIrzNKrPUJN9XceYU5vV8Ie6wxupDfQRWAAxhWr/NkZXGWpQcBGkNMQaW7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746737078; x=
	1746823478; bh=PwO9USl0xy1bpjtdKoVFUG++naPzLOfDRLfYMGngNmc=; b=B
	v9xCxTDF5pCOwVoG5tXwbwNO9/gbzxGHUmeBpsTghXZFGYgOFEFUOa4l2lldGnVH
	WgwFtyv6797ot96Qi3oAlyPqTp8cn6OHUsn/NkrpiieXd0PA/bdvOe/wc4xlmMEZ
	p2jzAhNTtvxpcxbVENsNgz9S+AK4FBkAgIRoH2PON2IC33j7aGHMpBOmlqz38FeP
	cGuRoYuBQHNKR413Gg3Go/v2lpD+SMt9mzoR7Do3qnFmKES9kzJoA5huLYJFR2jE
	oY5So///srr4B7r03EucoHMz4Y2ScdDDKPU9tuipygJFqhDFbXhKVWHJhsYvzv+c
	pXd7o9jB7G4ptMlTZeSUA==
X-ME-Sender: <xms:thcdaGM_j2hFOzLlAtp-MclEw-ihqZT0_sr9n8C_LZDNYLB2MV4yjA>
    <xme:thcdaE8LK8l75y-tfF7nbg3B_et62b37JC-_k1qUAu7FictdAlg__7I06aTM6eYdU
    K8M7KY_i0Cb3Q>
X-ME-Received: <xmr:thcdaNQisTkbutIxS_Wua2bmMtnFoodXRSeKB-qLn8JFdNYZsLX1vUwcwWTwKg9cg6GFDZSS4ao14LxG7HY5dwfoj7c_pdcbeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledtjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhho
    fihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieffjeeuheeghfeutefftdeu
    fefhieethfehveehteefgfeuudelffefffehledvnecuffhomhgrihhnpehgihhtlhgrsg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:thcdaGu4Ce5FNX55v62rjNgPMCphZFRcVxusmCwgXE-UT167udUI8g>
    <xmx:thcdaOdrux7J4KywZVXFxH1pOsx5VBHVF-8iPmK0Fqq0iKXRC_no4g>
    <xmx:thcdaK0XmcQwU3jA4L8G6N5YEl2V-rK21Zk_TrqoG3G0Iq1rA4fe7A>
    <xmx:thcdaC8Ujoz8EdGe19rNorw016ek78Mr3sOMcj1F8MivGvzEWOdehg>
    <xmx:thcdaIHTJjO65Dq82EnIh0pMWwgXvWeav4f1xXdMuQX98VHFda8EHuP2>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 May 2025 22:44:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Issues on Zen4 (hw12) runner
Message-ID: <aB0XtEor2rCxBKWR@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ltRkEotGNvk1artC"
Content-Disposition: inline


--ltRkEotGNvk1artC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 May 2025 22:44:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Issues on Zen4 (hw12) runner

Hi,

I wanted to post another revision of the series adding hw12 runner,
hoping that all known issues are fixed now, but unfortunately there is
still something broken. I've rebased my series on top of staging
(ed9488a0d) and got this pipeline:

https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
(note due to some added debugging, some tests are incorrectly marked as
success even if they failed...)

1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/pe=
ople/marmarek/xen/-/jobs/9978694739
There supposed to be an USB ethernet device connected to the USB
controller at c3:00.4. In the PV dom0 case it's detected as:

    [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci=
_hcd
    [    4.004201] usb 7-1.4: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
    [    4.004675] usb 7-1.4: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
    [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
    [    4.005349] usb 7-1.4: Manufacturer: Realtek
    [    4.005599] usb 7-1.4: SerialNumber: 684D35

But it's not there on PVH. The USB controller itself is detected, just
not device(s) connected to it. This applies to other controllers too
(there should be about 3 or 4 other USB devices - none of them show up).

2. There is a bunch of "unhandled memory read" errors during PVH dom0
startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/99786947=
39

    (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory r=
ead from 0xfedc0020 size 1
    (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory r=
ead from 0xfedc0021 size 1
    (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory r=
ead from 0xfedc0020 size 1
    (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory r=
ead from 0xfedc0021 size 1
    ...

This repeats several times. Could be related to the USB issue above?

There is also, likely related:

    (XEN) [    5.002036] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 24=
84: unsupported address 0
    (XEN) [    5.002365] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 24=
84: unsupported address 0
    (XEN) [    5.002693] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 24=
84: unsupported address 0

3. Sometimes it fails to print anything on the console, like here: https://=
gitlab.com/xen-project/people/marmarek/xen/-/jobs/9977761447
This is likely some boot issue before Xen starts (possibly the power button
is pressed to early). Anyway, I need to fix it before adding the runner.

4. There is a bunch of unknown MSR accesses, but that's likely to be
expected. For example:

    (XEN) [    6.010446] arch/x86/pv/emul-priv-op.c:1017:d0v11 RDMSR 0xc001=
02b0 unimplemented
    (XEN) [    6.010798] arch/x86/pv/emul-priv-op.c:1017:d0v0 RDMSR 0xc0010=
2b1 unimplemented


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ltRkEotGNvk1artC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgdF7QACgkQ24/THMrX
1yy3vwf9G9Sct9lMHrIo/6pOKT3O4XD5Z0SSO+ye+TlUT3RyRa1Lj75xg6D3tjId
1RJA5iUe49GJgOMM23r55YhaXif0NEfFveCwNzj3MYGdpjpT6bPfoKl9hoaI51Ak
h21+D2XKH6nekWALUSLX6pI0Hm+S3eR9OFsbh1w/ASl78zdYv6qkdePElwPecrPl
XCJ86ipNcgk2Pc/hiD4F4h9SXUeevUDUr1Ozd0CWFGWVPx7vTfofFTQiQlZdWvrx
7jXq59GAH1XjeF0ZwsKU0EXfCMmg4BF94klRprC5ZMFgDeZqdhWix/BbpLNR3KG+
9X7lyxy5wvBlEtpeu8PqL4ixAUvIzg==
=xQa+
-----END PGP SIGNATURE-----

--ltRkEotGNvk1artC--

