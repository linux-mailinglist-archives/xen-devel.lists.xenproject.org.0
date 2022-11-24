Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0C637C64
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 16:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447969.704662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyDix-0005jG-FY; Thu, 24 Nov 2022 15:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447969.704662; Thu, 24 Nov 2022 15:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyDix-0005g7-Bx; Thu, 24 Nov 2022 15:01:11 +0000
Received: by outflank-mailman (input) for mailman id 447969;
 Thu, 24 Nov 2022 15:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNnI=3Y=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oyDiv-0005g1-6g
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 15:01:09 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1900c9-6c08-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 16:01:02 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 89A605C0232;
 Thu, 24 Nov 2022 10:01:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 24 Nov 2022 10:01:00 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 10:00:58 -0500 (EST)
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
X-Inumbo-ID: cf1900c9-6c08-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1669302060; x=
	1669388460; bh=7oFqqbC1mKV4rv+CQpx7kr5MCr1+PtHfYRd8xId+10c=; b=M
	KdBJGO4dKzdj9b6tw3P/phwtQGqwUSUh1SGMiTxrs3xCfnqV+9QbwPcg4cxD4QkG
	pIz28lu4QwWB2IodUN7CoKPf/75JOVp4wOCDl1Fo1rs9sWD+6Lx9qCixWAlZHJZB
	sXh8c+mZjndWsFjLr5e0r8uEY1KMFOEFe9SLgWOsgwX5FtNOawOxWChixUQQKAR/
	P2ezLoy94pIUJPLAbIMZ5d3I8VhvvfC0CZewwOmCQU8+ePFzI5UbYBQ/lAKhDrCJ
	LdNDbi5YAvNOr6GbDJM+tQ4D4tEv30JpoyYLI9PJaOuFqU5C1daZxNswoDfbITIK
	3viFiF0EbqYDJzO9+bemw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669302060; x=1669388460; bh=7oFqqbC1mKV4rv+CQpx7kr5MCr1+
	PtHfYRd8xId+10c=; b=qdIdG/dU5awifJfxaHZQdHZT+3MOcuqLOG5PISZgOYgM
	JGa43fXtJdegHPAcKE0X5KYCg4S9vF758DsMtK6CWurQ5xiaFmqGsRoXllGw0jKD
	p7wusoGb15PZDUvvWY/UdVTrfZje7dbF2uS6cRtXfFOqURIffVpsoMXpl7n6w8Zh
	i+cT9GoEtabSaZ9vkEdZOJBH08tx9lPL6wTO8vbq5gMzCEAf2JSKdu2UQyBunBjV
	VeW9tcgYq3YyxT0U4PPDO1iXz0Ff8J+B4QUN9fKXhGp7Kt8Qu7JsGR69BYwk6wJc
	6n3l42hRyzWtxxHIYTJetemoSr8GNiXwT+zwumE0RA==
X-ME-Sender: <xms:K4d_Y4MZf3VEMgCneI3frZepTvxzvEWiRuknD0izZXl-vAUr8rf2ug>
    <xme:K4d_Y--qw57ZvGjXFv9EvumVy7-TPtat_D-Wb8jw9LP8GTlXfJU_stro4eQYjMx4V
    tGFWGPVm3G-Dg>
X-ME-Received: <xmr:K4d_Y_TZljJ84o5D3THk8R_3ucXZycJtW-va8KW-Ha8IL8Kmj8MU_EdlL06q4lo3YWiyTBbL5InvlQXYZ2rLosRdMhUL1LIkKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieefgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhffff
    iefhgffgvddtledukeelteeiiefggeeftdfgvefgiefgjeeljefgleeigfenucffohhmrg
    hinheptghithhrihigrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:K4d_Ywtx39vpQs9z48-cGnDpKcOkNZgwYY4fUYkvopjwI-AVscDkNA>
    <xmx:K4d_YwfIGlqUEcavh_7XAlZ8B_kijV0xr6EnLpfyf1dZh1y5S-poHw>
    <xmx:K4d_Y00ReGbz7CcEY6X2RA0MHIBBV-d3Hx6GIk48WlR61hsicwcJng>
    <xmx:LId_Y1EEnb20jKwp-jsH78MQzFk8xU7mNXZBU7QgXXbPVRKSPWYEXA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 24 Nov 2022 16:00:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc
Message-ID: <Y3+HJxGdmJg/esy9@mail-itl>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <Y37940yMRg2iX3IN@mail-itl>
 <Y38ybQwCk9drdgxw@Air-de-Roger>
 <Y38/0QEmDkwAHRIB@Air-de-Roger>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XdDvxGq+k/7Zofml"
Content-Disposition: inline
In-Reply-To: <Y38/0QEmDkwAHRIB@Air-de-Roger>


--XdDvxGq+k/7Zofml
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Nov 2022 16:00:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc

On Thu, Nov 24, 2022 at 10:56:33AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 24, 2022 at 09:59:25AM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Nov 24, 2022 at 06:15:15AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > But to get dom0 display image from BGRT, it seems something else is
> > > needed too. Linux complains "Incorrect checksum in table [BGRT]". The
> > > only relevant google result I get is this: https://support.citrix.com=
/article/CTX460227/citrix-hypervisor-acpi-warning-incorrect-checksum-in-tab=
le-bgrt
> > > It blames firmware. But then, it's suspicious that it's also about Xe=
n.
> > > And also, native Linux on the same hw does not complain about the
> > > checksum. So, I think it's rather Xen to blame...
> > > The table lives in area marked as EfiACPIReclaimMemory in memory map,=
 so
> > > I think it shouldn't be clobbered by Xen, at least in theory. I'll lo=
ok
> > > into it later. It's getting off-topic for this thread anyway.
> >=20
> > See commit 89238ef7797023f318f82f4f9dddef59c435b8bd.  I wonder whether
> > the BGRT image region is marked as EFI_MEMORY_RUNTIME, I will have to
> > check on my system.
>=20
> Just checked on my system, and the BGRT image is placed in a
> EfiBootServicesData section with no EFI_MEMORY_RUNTIME attribute.

Right, while the BGRT table itself is in EfiACPIReclaimMemory, the image
it points to lives in EfiBootServicesData. And no EFI_MEMORY_RUNTIME
attribute there either.

> To fix this we would need to change efi_arch_process_memory_map() so
> it takes the BGRT image address into account and marks the region
> where it's placed as reserved.  I'm not aware of anyway to get such
> address from EFI data, so we would likely need to parse the BGRT in
> efi_arch_process_memory_map().

Since Xen has code to do that already, moving it earlier shouldn't be
too much issue. Can `acpi_boot_table_init()` be called that early? And
then, it sounds very similar to the issue we have with the ESRT table.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XdDvxGq+k/7Zofml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN/hygACgkQ24/THMrX
1yw8/wf/UMfVnytzmYbSzL+35d+kawSByy5Icl7RU5ZkNek6HmUUBKOvaFKrRHg3
tHKYP0bDyLTuWuttQ4aSQTBgTCVCLRFH2GFjoGm7JsvdyyL+GsRiT0iGXojpwNxL
+VzqawsMyJCPZ8T53BegLGb8OD0BYeswY0Afz3cyPVtWKI1SM8qWPHG5ykfrTX1G
hf5b16sZWKmL/DNyv+o6ZwZL02eZnv3WGAmZ/jUVDFN3cD3qcOB+1QBXdNz+WQQz
boxs3EKqlFe1j6AzDiQRFfO94XdTEc1GN9jmtq4VlADYm75bqnI74U95x1VnJrs/
HYXaOkYvmYS54WU3V0fPpDDZB+ApWg==
=ls6y
-----END PGP SIGNATURE-----

--XdDvxGq+k/7Zofml--

