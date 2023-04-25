Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD196EE5E1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 18:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526152.817664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLg7-0000De-9I; Tue, 25 Apr 2023 16:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526152.817664; Tue, 25 Apr 2023 16:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLg7-0000AS-5v; Tue, 25 Apr 2023 16:38:07 +0000
Received: by outflank-mailman (input) for mailman id 526152;
 Tue, 25 Apr 2023 16:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHzL=AQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1prLg4-0000AM-UF
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 16:38:05 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89e220e4-e387-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 18:38:01 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 75E3C3200919;
 Tue, 25 Apr 2023 12:37:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Apr 2023 12:37:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 12:37:56 -0400 (EDT)
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
X-Inumbo-ID: 89e220e4-e387-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1682440677; x=1682527077; bh=8x38kB+ZlYh223Y2lo2Kh7PwV9NIajIpnFg
	diKdPG6g=; b=nPSmog2lvUAoNpQ1EpvOFWdYmmlsa3R1GF9rtqQohKiTz7E16kn
	ICpXMT24n024y24RzWmAhOf67rFlPVWkRE8mzsCelKHbjvH24QPOSqMfWclKw4I3
	jhRWu3U/Gnz4tC+kzH4KZtkhX8gio8fLLD8Qx6lszJrna1gvHuy1W5LLz6DUh0Ui
	kXVtMI7cjSbandfDpXI2xaTMakeDxPmUrKHHTIQId7ngrTnLw4O8vrSa6oDLWXA0
	NYLzR87cTkzQoK6LVK/XJAt3k/Esho3dD9HRdp2tEURD6zJ+6ZwlSzrBKFbjSouf
	R8ItFJqPyU+MmwjyXXx/HiQEac2eGHbgQ3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682440677; x=1682527077; bh=8x38kB+ZlYh22
	3Y2lo2Kh7PwV9NIajIpnFgdiKdPG6g=; b=DFSJFS4HgYkNlTAqMebl8BejZXFUl
	9hxWkcxzq2aoJ0oBnKs6htToNWqHJp1IMZrJZNnzbmXOdkxjvNOfA1VmYNZOzhax
	93GeHNPMtf0jjnxMQpLbQ52qkRe4ym2Dn0IIBQMmPt9piDS5EqtJQozLP/KSVMqa
	4FQ+lDW89fGKMPE87N1SsqOJM9+Rcxd6nqVdPWv94HWg+Nys65I3HFTPL/WSlupR
	racUjAUdzqbWoz18Dz0oWarx6OLFPrGBOsBLM9lmPWnARgNmoo+Yb2564GSKmDiJ
	7i7DbZKabvcbOTRGhGYV6fHgiMyykchMgCrHxQHfAYZEe2/QsgczAXE+Q==
X-ME-Sender: <xms:5AFIZFYEjt0wxiezo9TRAMznqB5mxrlkNHJAPnN1T3u58aw48Agv1w>
    <xme:5AFIZMY4m8ihc0afzc7XfebbxA3qYkRZw2rGMEU3UeBw-DzW4ViwU2UjRay0N6QZx
    q7Rp75CefPgyQ>
X-ME-Received: <xmr:5AFIZH9oAeGVapR5ysm7jZtQg1YSGrlC1rtYYyxo6qekIDYGgIt_aTHWlNb4l0COTIRCIYW3golvacVEETsVoI9rDAfYOeqFk2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeev
    ueejteegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffoh
    hmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:5AFIZDoEc83D7WqTom5Dvd31P0XzW_gAIzL_-i69X1ML_3P7C7qcDA>
    <xmx:5AFIZAqtgD09XwmohUaWC8GMOhQ131S48-dtniPBXZMyOogsQB77Lw>
    <xmx:5AFIZJRFX33oh92xA9FoBjLJyYROd6XJy7I-JBf7v3U-4T-z9rgSpw>
    <xmx:5QFIZHR2vQR8RUnazMJd-lfExnX_8oKK2qKfAE0wblDHcln4F4l2fQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 25 Apr 2023 18:37:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 5/6] automation: PCI passthrough tests on ADL hw
Message-ID: <ZEgB4e9Rfmt6wh2f@mail-itl>
References: <cover.52ddd01da196853766a5b39a89c631f3e4652dd9.1682369736.git-series.marmarek@invisiblethingslab.com>
 <b01494665d1a8cce5c426be70beca2c519215eca.1682369736.git-series.marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2304241717510.3419@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OS1ldJoc2laumTA5"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2304241717510.3419@ubuntu-linux-20-04-desktop>


--OS1ldJoc2laumTA5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Apr 2023 18:37:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 5/6] automation: PCI passthrough tests on ADL hw

On Mon, Apr 24, 2023 at 08:01:46PM -0700, Stefano Stabellini wrote:
> On Mon, 24 Apr 2023, Marek Marczykowski-G=C3=B3recki wrote:
> > Add simple PCI passthrough test to both PV and HVM domU. It passes
> > through a network adapter (the only one in the system), gets an IP via
> > DHCP (first basic test) and then ping the gateway (second basic test).
> > Finally, if device is supposed to use MSI or MSI-X (as set in the
> > PCIDEV_INTR test variable), check if it's in use via /proc/interrupts.
> >=20
> > On the current runner, the device in question is this:
> > 03:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controll=
er I225-V [8086:15f3] (rev 03)
> > 	Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7d25]
> > 	Flags: bus master, fast devsel, latency 0, IRQ 18
> > 	Memory at 50400000 (32-bit, non-prefetchable) [size=3D1M]
> > 	Memory at 50500000 (32-bit, non-prefetchable) [size=3D16K]
> > 	Capabilities: [40] Power Management version 3
> > 	Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable+ 64bit+
> > 	Capabilities: [70] MSI-X: Enable+ Count=3D5 Masked-
> > 	Capabilities: [a0] Express Endpoint, MSI 00
> > 	Capabilities: [100] Advanced Error Reporting
> > 	Capabilities: [140] Device Serial Number ...
> > 	Capabilities: [1c0] Latency Tolerance Reporting
> > 	Capabilities: [1f0] Precision Time Measurement
> > 	Capabilities: [1e0] L1 PM Substates
> > 	Kernel driver in use: igc
> > 	Kernel modules: igc
> >=20
> > With the current Xen version, it uses MSI-X under PV and MSI under HVM.
> >=20
> > This patch moves domU config to a variable, to make it configurable on
> > per-test basis. Add also a few comments for visual separation of tests.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  automation/gitlab-ci/test.yaml     | 20 ++++++++-
> >  automation/scripts/qubes-x86-64.sh | 80 ++++++++++++++++++++++++++-----
> >  2 files changed, 89 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
=2Eyaml
> > index d68c584269dd..1ce083e6cd88 100644
> > --- a/automation/gitlab-ci/test.yaml
> > +++ b/automation/gitlab-ci/test.yaml
> > @@ -94,6 +94,8 @@
> >      # the test controller runs on RPi4
> >      CONTAINER: alpine:3.12-arm64v8
> >      LOGFILE: smoke-test.log
> > +    PCIDEV: "03:00.0"
> > +    PCIDEV_INTR: "MSI-X"
>=20
> This is minor but I would move PCIDEV_INTR to
> adl-pci-pv-x86-64-gcc-debug given that adl-pci-hvm-x86-64-gcc-debug
> already redefines it.

The device is MSI-X capable and I'd expect Linux should use MSI-X. My
guess is it's using MSI in HVM because MSI-X doesn't work (and I hope my
other series will fix that), but I have _not_ verified this theory.
If I'm right, I hope the PCIDEV_INTR=3D"MSI" will go away from the HVM
test, and it will be testing if MSI-X didn't regressed.

> I would also move PCIDEV to adl-pci-pv-x86-64-gcc-debug and
> adl-pci-hvm-x86-64-gcc-debug, but I am fine either way.

My idea is those both are more of a test target properties, not an
individual test properties.


> However the two new tests failed for me:
>=20
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/8471579=
48
>=20
>=20
> + grep '^Welcome to Alpine Linux' smoke.serial
> + '[' 0 -le 0 ]
> + '[' 0 -le 0 ]
> + echo 'ERROR: test timeout, aborting'
> ERROR: test timeout, aborting
>=20
> The Welcome to Alpine Linux message is missing

Ah, I forgot to remove debug shell...

I'll post v2 once it passes test run (waiting in the queue...).
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--OS1ldJoc2laumTA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRIAeEACgkQ24/THMrX
1yyZoAf/ecXi0HTG95PO/xvHUpnfDFNZYr07QJXHtWxB05Vf6RWkXUoOujoAec4U
CUt0aQbfdbeWB26CcTpJ/ZdTlyqFt1lWKvPtBzlAPryuKY6X2FLAznsm+VxT4919
I/9reZO8TdVfM6rXmBoe3to+uvn9wbHephterwgp5PCf6nZTnYc/xszJUhn6CVGt
GjLPpdQ8jnmMDOo5CCosKYwAHOWcZBaBhcUhxCEKcFO/a/WdM37Kdo8m+g2ZCBjq
t1gK2de6YigHbEXGcBXrU0/Vc2t4Gq0zajOuquZxw4oAjEq95KPNN22TJ7equa2F
EtCNiqqGaQ4Cy7fpEWJaNrXUrfq/vA==
=dOyz
-----END PGP SIGNATURE-----

--OS1ldJoc2laumTA5--

