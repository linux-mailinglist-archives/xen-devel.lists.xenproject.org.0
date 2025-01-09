Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BAA0754F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 13:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868303.1279830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrL7-0007mN-6T; Thu, 09 Jan 2025 12:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868303.1279830; Thu, 09 Jan 2025 12:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVrL7-0007kQ-3L; Thu, 09 Jan 2025 12:08:41 +0000
Received: by outflank-mailman (input) for mailman id 868303;
 Thu, 09 Jan 2025 12:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tVrL5-0007kK-4R
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 12:08:39 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7321f6f4-ce82-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 13:08:35 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id D6B6613808F2;
 Thu,  9 Jan 2025 07:08:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 09 Jan 2025 07:08:33 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:08:30 -0500 (EST)
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
X-Inumbo-ID: 7321f6f4-ce82-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736424513;
	 x=1736510913; bh=kECteZPoKXf9xMfmh68/LbiCRmgtBv9vdGOcf89P5PY=; b=
	r3f2mMQRy5G0oFHzU8x21odkXjQQkQZEeq6aV5scgYx689oY5WEPgQMxaBkuOXnA
	Rgmuf5GWnGpiohRKK8CLiOWlezsrct42Q04C5wqggMLNVa8JmTifdFTE/rPyCMot
	Fq0rAaADIyxzPoGWZnY+1AY5NiV8pFRaZL+Xk5EervhMNv/dSKh4xApPo6JFeQBz
	qMdNCw3IW6ul1WXaySgjp1CmWB3k0VIUcyC0jq+r3rkLa0wo245tbXA4YWEMvmQ4
	i+vyff5gfbtNR8FBMANlwtLY4puXNISWY5u/uKBDP51tF+kH3DvNihuqHC+45vP/
	VJ0x98ZKMwgG0d0QqPGJbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736424513; x=1736510913; bh=kECteZPoKXf9xMfmh68/LbiCRmgtBv9vdGO
	cf89P5PY=; b=HPDpMDuX3cq+CuvCa9dgCP3bwXaHJD2CzaDZ8WZKvJYaRy65WbM
	BM1nDunT+OnqgEVTNrFyG8Ph+wQJ5YlPkOiGtKmzaf7wkTF1gJtQPREUWrDD0FGk
	a+Kg1bS3ttli0y/7gTipmdAsbeh5oZHZXRqGsw5Qvx9uH7zQJHRHG1K4eM9WNJ7K
	SAOUBOX6hz8+H7nVvuwHe5Ku5SB3jB9n3tM6N3h3tZoyD/Vzm3nal6CmlLQEWDRL
	1noDHCxwjtJ3FmYRBH6b/4CKk5biC34IIkY3l620kUu/WJ6rQzbVvaM6tyP4VAHD
	+GniZUC3ifCdVC07W52x042cvz/1cb6+bqA==
X-ME-Sender: <xms:QLx_Z_xZuzzBKCBNlqOeDIA3_TwSiaa2McoX6BD_bwnuXiEl5S17Tw>
    <xme:QLx_Z3TU4_KCBTYzpAUn8FUtt1EuVSuGVnHXTl2vGYYQ7MJX0uqKzGv7q4dZlD3aS
    --CRFIR8RGlZw>
X-ME-Received: <xmr:QLx_Z5UFMoaILubXZb1VppCzgcd1pAVm7F13sKy1l53RRd-OxhmF1B5PkI2pzOXJdu575FN0rddrUYs-XZhX9dZHvaBl_CtQvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtvggu
    ugihrdgrshhtihgvsehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgt
    phhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehluhhkrghsiies
    hhgrfihrhihlkhhordhplhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhssh
    holhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:QLx_Z5iqj7Twtl7FAd0pB6fwcvD3hkn0AECSVBlTwe3OpMWLVdWPOw>
    <xmx:QLx_ZxD300TsgeRb0KyLuzyRNQvliBaGIihCMcIHTrthc78QlQBaRw>
    <xmx:QLx_ZyIu3-FzS9eXbfUbeU7gKkNkKzHpbnWQx_rIr2oSOJ8lLlNyHg>
    <xmx:QLx_ZwDCbiW8xWjhruwGZ_EWLVMghami-obGAWlFDafBTf7mc4d0mw>
    <xmx:Qbx_Z15tZqUF_I8BN9RSfnIuB7yGj7xjSve6J-vRXGQZGHnRwR_OOo0L>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Jan 2025 13:08:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z3-8O9opmLfgO5t0@mail-itl>
References: <cover.1730718102.git.teddy.astie@vates.tech>
 <Z38-y9xR-6C_sARJ@mail-itl>
 <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1c1xE17VkmyIay1G"
Content-Disposition: inline
In-Reply-To: <c0b9fbdb-87db-4f31-8069-0c2d1c4ad4cd@vates.tech>


--1c1xE17VkmyIay1G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 13:08:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Thu, Jan 09, 2025 at 11:39:04AM +0000, Teddy Astie wrote:
> Thanks for your review.
>=20
> > Hi,
> >=20
> > I finally got time to try this revision (sorry it took so long!). My
> > goal was to test it this time with some HVM domU too. I didn't get very
> > far...
> >=20
> > Issues I hit:
> >=20
> > 1. AMD IOMMU driver is not converted (fails to build), for now disabled
> >     CONFIG_AMD_IOMMU.
>=20
> I haven't really worked on the AMD-Vi code yet. I have plans for it but=
=20
> there is some specific bits to deal with (especially regarding interrupt=
=20
> remapping), that I planned to discuss especially during the Xen Project=
=20
> Winter Summit 2025.

:)

> > 2. PV shim build fails (linker fails to find p2m_add_identity_entry
> >     symbol referenced from iommu.c)
>=20
> I haven't considered PV shim yet, so I am not really surprised that=20
> there are some issues with it. We probably want to expose some PV-IOMMU=
=20
> features for PV guests under PV shim, but it probably needs some=20
> specific code for it.

I'm not sure if passthrough is supported with PV shim (never tried). The
current issue is much earlier ;)

> > 3. Xen complains on boot about missing endbr64 (surprisingly, it didn't
> >     exploded):
> >=20
> >      (XEN) alt table ffff82d0404234d8 -> ffff82d040432d82
> >      (XEN) altcall iommu_get_max_iova+0x11/0x30 dest iommu.c#intel_iomm=
u_get_max_iova has no endbr64
> >      (XEN) altcall context.c#iommu_reattach_phantom+0x30/0x50 dest iomm=
u.c#intel_iommu_add_devfn has no endbr64
> >      (XEN) altcall context.c#iommu_detach_phantom+0x25/0x40 dest iommu.=
c#intel_iommu_remove_devfn has no endbr64
> >      (XEN) altcall iommu_context_init+0x27/0x40 dest iommu.c#intel_iomm=
u_context_init has no endbr64
> >      (XEN) altcall iommu_attach_context+0x3c/0xd0 dest iommu.c#intel_io=
mmu_attach has no endbr64
> >      (XEN) altcall context.c#iommu_attach_context.cold+0x1d/0x53 dest i=
ommu.c#intel_iommu_detach has no endbr64
> >      (XEN) altcall iommu_detach_context+0x37/0xa0 dest iommu.c#intel_io=
mmu_detach has no endbr64
> >      (XEN) altcall iommu_reattach_context+0x95/0x240 dest iommu.c#intel=
_iommu_reattach has no endbr64
> >      (XEN) altcall context.c#iommu_reattach_context.cold+0x29/0x110 des=
t iommu.c#intel_iommu_reattach has no endbr64
> >      (XEN) altcall iommu_context_teardown+0x3f/0xa0 dest iommu.c#intel_=
iommu_context_teardown has no endbr64
> >      (XEN) altcall pci.c#deassign_device+0x99/0x270 dest iommu.c#intel_=
iommu_add_devfn has no endbr64
> >=20
>=20
> I also see that, but I am not sure what I need to do to fix it.

I guess add "cf_check" annotation to functions that are called
indirectly.

> > 4. Starting a HVM domU with PCI device fails with:
> >=20
> >      libxl: libxl_pci.c:1552:pci_add_dm_done: Domain 1:xc_assign_device=
 failed: No space left on device
> >      libxl: libxl_pci.c:1875:device_pci_add_done: Domain 1:libxl__devic=
e_pci_add failed for PCI device 0:aa:0.0 (rc -3)
> >      libxl: libxl_create.c:2061:domcreate_attach_devices: Domain 1:unab=
le to add pci devices
> > > I didn't change anything in the toolstack - maybe default context nee=
ds
> > to be initialized somehow? But the docs suggest the default context
> > should work out of the box. On the other hand, changelog for v4 says
> > some parts are moved to the toolstack, but I don't see any changes in
> > tools/ in this series...
> >=20
>=20
> I only tried stuff inside Dom0, but I haven't really tried passing=20
> through a device. I think I missed some step regarding quarantine domain=
=20
> initialization, which is probably why you have "-ENOSPC" here. You can=20
> try in the meantime to set "quarantine=3D0" to disable this part to see i=
f=20
> it progresses further.

That helped a bit. Now domU starts. But device doesn't work - qemu
complains:

[2025-01-09 06:52:45] [00:08.0] xen_pt_realize: Real physical device 00:0d.=
3 registered successfully
=2E..
[2025-01-09 06:52:45] [00:09.0] xen_pt_realize: Real physical device 00:0d.=
2 registered successfully
=2E..
[2025-01-09 06:52:45] [00:0a.0] xen_pt_realize: Real physical device 00:0d.=
0 registered successfully
=2E..
[2025-01-09 06:52:59] [00:0a.0] xen_pt_msgctrl_reg_write: setup MSI (regist=
er: 87).
[2025-01-09 06:52:59] [00:0a.0] msi_msix_setup: Error: Mapping of MSI (err:=
 19, vec: 0x25, entry 0[2025-01-09 06:52:59] x0)
[2025-01-09 06:52:59] [00:0a.0] xen_pt_msgctrl_reg_write: Warning: Can not =
map MSI (register: 86)!
[2025-01-09 06:54:21] [00:08.0] msix_set_enable: disabling MSI-X.
[2025-01-09 06:54:21] [00:08.0] xen_pt_msixctrl_reg_write: disable MSI-X
[2025-01-09 06:54:21] [00:09.0] xen_pt_msixctrl_reg_write: enable MSI-X
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x0)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x1)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x2)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x3)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x4)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x5)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x6)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x7)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x8)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0x9)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0xa)
[2025-01-09 06:54:21] [00:09.0] msi_msix_setup: Error: Mapping of MSI-X (er=
r: 19, vec: 0xef, entry 0xb)

and interestingly, Xen says all devices are still in dom0:

[2025-01-09 06:53:39] (XEN) =3D=3D=3D=3D PCI devices =3D=3D=3D=3D
[2025-01-09 06:53:39] (XEN) =3D=3D=3D=3D segment 0000 =3D=3D=3D=3D
[2025-01-09 06:53:39] (XEN) 0000:aa:00.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:01:00.0 - d0 - node -1  - MSIs < 132 133 1=
34 135 136 >
[2025-01-09 06:53:39] (XEN) 0000:00:1f.5 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:1f.4 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:1f.3 - d0 - node -1  - MSIs < 139 >
[2025-01-09 06:53:39] (XEN) 0000:00:1f.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:1d.0 - d0 - node -1  - MSIs < 131 >
[2025-01-09 06:53:39] (XEN) 0000:00:16.0 - d0 - node -1  - MSIs < 138 >
[2025-01-09 06:53:39] (XEN) 0000:00:15.3 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:15.1 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:15.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:14.2 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:14.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:12.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:0d.3 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:0d.2 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:0d.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:0a.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:08.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:07.3 - d0 - node -1  - MSIs < 130 >
[2025-01-09 06:53:39] (XEN) 0000:00:07.2 - d0 - node -1  - MSIs < 129 >
[2025-01-09 06:53:39] (XEN) 0000:00:07.1 - d0 - node -1  - MSIs < 128 >
[2025-01-09 06:53:39] (XEN) 0000:00:07.0 - d0 - node -1  - MSIs < 127 >
[2025-01-09 06:53:39] (XEN) 0000:00:06.0 - d0 - node -1  - MSIs < 126 >
[2025-01-09 06:53:39] (XEN) 0000:00:04.0 - d0 - node -1
[2025-01-09 06:53:39] (XEN) 0000:00:02.0 - d0 - node -1  - MSIs < 137 >
[2025-01-09 06:53:39] (XEN) 0000:00:00.0 - d0 - node -1

I don't see any errors from toolstack this time.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1c1xE17VkmyIay1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd/vDsACgkQ24/THMrX
1yzEJwf+KhKLg5e6DtcqalYHE8KVuXIu87i9PmAF0IE7IbwvpR1XzhpOOh0KSuX+
YYPUUoHXjLCC/h+fSgfb8cRHeLdNDwdC8W1DRGBpMywANlw4EevmVvIDT6S0UQm/
ntQR7FVJmBin4XgcPpcOUZPujy7KpkByyauZLkE3gvivVmafLoQiANQYJF/+m56c
FdWthK1tNuO2QJu9hwR7lwEmKTKavA9Eqw/rFJ4zVtYIRPSP/FwN1v30M52P4f6G
Y1ucSYcFLsdL7UZL3GBGoMtVI0u0RJurrn/1PU4igpPSn6EnRpJF1fWr9Iy4gjzA
L8Ti1JKUloZD2yZvljKlCvSbJ6uXhA==
=Qclm
-----END PGP SIGNATURE-----

--1c1xE17VkmyIay1G--

