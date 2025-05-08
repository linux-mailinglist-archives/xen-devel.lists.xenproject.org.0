Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3EAAF7C5
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979200.1365886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyV1-0000E2-0l; Thu, 08 May 2025 10:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979200.1365886; Thu, 08 May 2025 10:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyV0-0000Aw-Tt; Thu, 08 May 2025 10:29:06 +0000
Received: by outflank-mailman (input) for mailman id 979200;
 Thu, 08 May 2025 10:29:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uCyUy-0000Aj-IH
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:29:04 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c67117-2bf7-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:29:02 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 2071E11401B9;
 Thu,  8 May 2025 06:29:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 08 May 2025 06:29:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 May 2025 06:28:58 -0400 (EDT)
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
X-Inumbo-ID: 41c67117-2bf7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746700139;
	 x=1746786539; bh=zTnJAKnVmugWDU/7gsiDLpmqBYOpP8RWjjl6jZhpgP0=; b=
	AAUX2p1svV+Owjvnh48cM0Iy7iEsktpPNTE4lr5a++QOarGmjDgiQFsBhE3HgRnU
	mtHHEd4RmSs5gTWmVRVfiDkVzuHy9s2F60qABfeaD7yoc+UvYiEHO+WuWYoUweeT
	9HDYT5wDobB+zmHbRZS2X7oYTXTqjfdcrD8GCdFbs6D/xy+r02C1cIeaz7Mnkezz
	Xu4IHWoLAiRFkCNy4wK2wTid1jyQmNUbm1HAM7SdIAh80IxWwU46VXhjYuKFw0cr
	P696edczgg/xabiLzwOXJ2ooyLqvQYO//9hDZ60wz92a5iUl5QQ4Q1Ghk3gmspxD
	p047az1d3engYMFTLlvpfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746700139; x=1746786539; bh=zTnJAKnVmugWDU/7gsiDLpmqBYOpP8RWjjl
	6jZhpgP0=; b=hWfniIno93YMJ5l8AVValRVJnLCwUqJmoouFf3b3TaYhVMN7GCY
	NHux40bxHLj6a1fh+xUmxp47GK/Qa6tWAvA7k8BRMEACUh7VOOidlvaGsUEO6hmz
	Ozc+nJ4nnwKcAmT6pIJj7yX81vf4Zm/JLRA1rHKs+i5xK65N3PDiqveZaUC2J+AM
	84P0KOLaloend2eYSF2w/DxQlW5lkEDDVIxPVmNcO0GWMb7cTJWbKc5zdaghk394
	iFn3VW44gqdxL9abg9fhdRK9+5VSiL0nI+/g9CRAOWhznNal/ya63n6hbSZsSk19
	bAFab1CrtKjKRHbmSza1DYEQvu1DmTBjGlg==
X-ME-Sender: <xms:a4ccaLvT4qOYYYpmycYYm3te0QFmMAj_ITmO8PXwAn2IMuV8NUi1aw>
    <xme:a4ccaMdEKDQAjsh0sZBnN9nEAgJRxTNeCkI8ixvkiyclRdvEHG5wYZ0rvSmxqTzDQ
    R7NYhyRSF7TjA>
X-ME-Received: <xmr:a4ccaOxqxFNn2mPOnl7vfFNL7paDF9-GEn_9X1IU6Ivgf6SP7VJ-2d_f6yd1sUzCc61_p-_eYhXaI4Jy72uoNGSQJE2UzcZXAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlih
    hniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdr
    tghomhdprhgtphhtthhopeigvghnihgrrdhrrghgihgruggrkhhouhesrghmugdrtghomh
    dprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhr
    tghpthhtohepjhgrshhonhdrrghnughrhihukhesrghmugdrtghomhdprhgtphhtthhope
    grghgrrhgtihgrvhesrghmugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:a4ccaKP6JKEroF25psqMDD6MvVjbYrME1JHikExlzUiMSmYynPQrTA>
    <xmx:a4ccaL_tdHrZVB0iBF_jWMenYHC8T8W2ivwRJ-qrQNDiuwAqgzQ0pg>
    <xmx:a4ccaKVwXYDFbE19t8v_P7P8yur3Cv39oxHQrbOGmHW4jahxi1bjXw>
    <xmx:a4ccaMfFtvvMPanjS0y5djMPflRaWRCW6sJKbC6NsmBdoXYR49KtMA>
    <xmx:a4ccaEXUcJ7aa_lWCbrn0XbARy98OejxACmGLnYeKDONy4ZtXzsjkOsV>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 8 May 2025 12:28:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aByHaI1ST9v58K6e@mail-itl>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl>
 <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
 <aBnOQyXSz-j33Wux@macbook.lan>
 <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop>
 <aBx1gv6BXhZ0pSYt@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ABOHH0mrIZmZQ+dy"
Content-Disposition: inline
In-Reply-To: <aBx1gv6BXhZ0pSYt@macbook.lan>


--ABOHH0mrIZmZQ+dy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 8 May 2025 12:28:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange

On Thu, May 08, 2025 at 11:12:34AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> > On Tue, 6 May 2025, Roger Pau Monn=C3=A9 wrote:
> > > On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> > > > On Mon, 5 May 2025, Roger Pau Monn=C3=A9 wrote:
> > > > > On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wr=
ote:
> > > > > > > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > > > > > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > > > > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > > > > > >=20
> > > > > > > > > Dom0 PVH might need XENMEM_exchange when passing contiguo=
us memory
> > > > > > > > > addresses to firmware or co-processors not behind an IOMM=
U.
> > > > > > > >=20
> > > > > > > > I definitely don't understand the firmware part: It's subje=
ct to the
> > > > > > > > same transparent P2M translations as the rest of the VM; it=
's just
> > > > > > > > another piece of software running there.
> > > > > > > >=20
> > > > > > > > "Co-processors not behind an IOMMU" is also interesting; a =
more
> > > > > > > > concrete scenario might be nice, yet I realize you may be l=
imited in
> > > > > > > > what you're allowed to say.
> > > > > > >=20
> > > > > > > Sure. On AMD x86 platforms there is a co-processor called PSP=
 running
> > > > > > > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occa=
sionally to
> > > > > > > pass addresses to it.  See drivers/tee/amdtee/ and
> > > > > > > include/linux/psp-tee.h in Linux.
> > > > > >=20
> > > > > > We had (have?) similar issue with amdgpu (for integrated graphi=
cs) - it
> > > > > > uses PSP for loading its firmware. With PV dom0 there is a work=
around as
> > > > > > dom0 kinda knows MFN. I haven't tried PVH dom0 on such system y=
et, but I
> > > > > > expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, an=
d it's
> > > > > > the one I used for debugging this issue).
> > > > >=20
> > > > > That's ugly, and problematic when used in conjunction with AMD-SE=
V.
> > > > >=20
> > > > > I wonder if Xen could emulate/mediate some parts of the PSP for d=
om0
> > > > > to use, while allowing Xen to be the sole owner of the device.  H=
aving
> > > > > both Xen and dom0 use it (for different purposes) seems like aski=
ng
> > > > > for trouble.  But I also have no idea how complex the PSP interfa=
ce
> > > > > is, neither whether it would be feasible to emulate the
> > > > > interfaces/registers needed for firmware loading.
> > > >=20
> > > > Let me take a step back from the PSP for a moment. I am not opposed=
 to a
> > > > PSP mediator in Xen, but I want to emphasize that the issue is more
> > > > general and extends well beyond the PSP.
> > > >=20
> > > > In my years working in embedded systems, I have consistently seen c=
ases
> > > > where Dom0 needs to communicate with something that does not go thr=
ough
> > > > the IOMMU. This could be due to special firmware on a co-processor,=
 a
> > > > hardware erratum that prevents proper IOMMU usage, or a high-bandwi=
dth
> > > > device that technically supports the IOMMU but performs poorly unle=
ss
> > > > the IOMMU is disabled. All of these are real-world examples that I =
have
> > > > seen personally.
> > >=20
> > > I wouldn't be surprised, classic PV dom0 avoided those issues because
> > > it was dealing directly with host addresses (mfns), but that's not the
> > > case with PVH dom0.
> >=20
> > Yeah
> >=20
> >=20
> > > > In my opinion, we definitely need a solution like this patch for Do=
m0
> > > > PVH to function correctly in all scenarios.
> > >=20
> > > I'm not opposed to having such interface available for PVH hardware
> > > domains.  I find it ugly, but I don't see much other way to deal with
> > > those kind of "devices".  Xen mediating accesses for each one of them
> > > is unlikely to be doable.
> > >=20
> > > How do you hook this exchange interface into Linux to differentiate
> > > which drivers need to use mfns when interacting with the hardware?
> >=20
> > In the specific case we have at hands the driver is in Linux userspace
> > and is specially-written for our use case. It is not generic, so we
> > don't have this problem. But your question is valid.
>=20
> Oh, so you then have some kind of ioctl interface that does the memory
> exchange and bouncing inside of the kernel on behalf of the user-space
> side I would think?
>=20
> > In Linux, the issue is hidden behind drivers/xen/swiotlb-xen.c and
> > xen_arch_need_swiotlb. There are a few options:
> > - force swiotlb bounce for everything on the problematic SoC
> > - edit xen_arch_need_swiotlb to return true for the problematic device
> > - introduce a kernel command line option to specify which device
> >   xen_arch_need_swiotlb should return true for
>=20
> Isn't it a bit misleading to use the swiotlb for this purpose?  Won't
> this usage of the swiotlb (to bounce from gfns to mfns) create issues
> if there's any devices that have a DMA physical address limitation and
> also needs to use the swiotlb while being behind the IOMMU?
>=20
> > - introduce an ACPI table with the relevant info
>=20
> Hm, best option might be an ACPI table so that Xen can signal to the
> hardware domain whether communication with the device must be done
> using mfns, or if accesses are mediated and hence can be done using
> gfns?

How does it work on native when some devices are not behind IOMMU? Is it
signaled via an ACPI table? It feels like it's a similar (although not
the same) situation here.

> It's a bit cumbersome however to have to resort to an ACPI table just
> for this.  Not sure whether we could expand one of the existing tables
> already under Xen control (STAO?) to contain this information.  It all
> looks a bit ad-hoc.
>=20
> I think we need some kind of list of devices that are not behind the
> IOMMU, but I have no idea what URI to use to identify those.  I assume
> the PSP doesn't have a PCI SBDF (as it's not on the PCI bus?).  Maybe
> by ACPI path?

It is actually on the PCI bus:
05:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Fa=
mily 17h (Models 10h-1fh) Platform Security Processor [1022:15df]

> Or maybe it's fine to always communicate with those non-translated
> devices using MFNs, and even if we later add some kind of PSP
> mediation (so that both Xen and dom0 can use it), accesses by dom0
> will still be assumed to be using MFNs, and thus need no translation.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ABOHH0mrIZmZQ+dy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgch2gACgkQ24/THMrX
1yzXWgf/SD849DhBcI1QvGVgMphcSPKam4vimDZ4fHjgiVfvTaBsy+ogFOj7b3Py
vwPcPdudPkTCGMHs59Qyg392Zm3Cp0Ux69yoG9JAeieciG6d4sFfZNl/tYVDxggF
ER/cB1wxt7FXkEgOCRCe1KgahnomjwnKz2AHobhZ4DGIqDCGDuUb0TBBZG/s7ogI
zied4+5vT2KwiXLOv68U7PTc5V6p6FZLIe1kCZqN6LHT6UfUhZrYNTRrXmB1D/oP
EyOQeF4WjzaolW6hdWQZdFrIDzL+7OYhSuE8W5Pwmt6cFMPuDtpycnijeg5+VTMe
RjPF3KRokxricIkD66MUFUJZ2BjUHg==
=1I/k
-----END PGP SIGNATURE-----

--ABOHH0mrIZmZQ+dy--

